module.exports = (grunt) ->
	# Configure Project
	grunt.initConfig
		pkg: grunt.file.readJSON "package.json"
		coffee:
			build:
				expand: true
				cwd: "src/coffee"
				src: ["*.coffee"]
				dest: "tmp/js"
				ext: ".js"
			tests:
				expand: true
				cwd: "tests"
				src: ["*.coffee"]
				dest: "tests/runner/tests"
				ext: ".js"

		uglify:
			options:
				banner: "/*! <%= pkg.name %> <%= grunt.template.today('yyyy-mm-dd') %> */\n"
			js:
				expand: true
				cwd: "tmp/js"
				src: ["*.js"]
				dest: "build/js"
				ext: ".js"

		copy:
			html:
				expand: true
				cwd: "src/html"
				src: ["*.html"]
				dest: "build"
				ext: ".html"

		clean:
			tmp: ["tmp"]
			build: ["build"]
			tests: ["tests/runner/tests"]

		coffeelint:
			options:
				indentation:
					level: "ignore"
				no_tabs:
					level: "ignore"
			source:
				expand: true
				cwd: "src/coffee"
				src: ["*.coffee"]
				
		watch:
			build:
				files: ["src/*", "src/*/*"]
				tasks: "build"
			lint:
				files: ["src/coffee/*.coffee"]
				tasks: "coffeelint"
			test:
				files: ["src/coffee/*.coffee", "tests/*.coffee"]
				tasks: "test"
		
		mocha:
			all:
				src: ["tests/runner/index.html"]
				options:
					reporter: "Spec"
			
	# Import tasks from node_modules
	grunt.loadNpmTasks "grunt-contrib-coffee"
	grunt.loadNpmTasks "grunt-contrib-uglify"
	grunt.loadNpmTasks "grunt-contrib-clean"
	grunt.loadNpmTasks "grunt-contrib-copy"
	grunt.loadNpmTasks "grunt-contrib-watch"
	grunt.loadNpmTasks "grunt-coffeelint"
	grunt.loadNpmTasks "grunt-mocha"

	# Set up task aliases
	grunt.registerTask "build", ["clean:tmp", "clean:build", "coffee:build", "uglify", "copy", "clean:tmp"]
	grunt.registerTask "lint", ["coffeelint"]
	grunt.registerTask "test", ["build", "clean:tests", "coffee:tests", "mocha:all", "clean:tests"]

	# Set default task to build
	grunt.registerTask "default", ["build"]
