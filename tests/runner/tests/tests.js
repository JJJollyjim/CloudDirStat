(function() {
  describe("Math", function() {
    it("should exist", function() {
      return expect(Math).to.be.ok();
    });
    describe("#Random", function() {
      it("should return a number", function() {
        var res;
        res = Math.random();
        return expect(res).to.be.a("number");
      });
      return it("should return a value between 0 and 1", function() {
        var res;
        res = Math.random();
        return expect(res).to.be.within(0, 1);
      });
    });
    describe("#Min", function() {
      it("should find the min of 2 positive numbers", function() {
        var res;
        res = Math.min(3, 5);
        return expect(res).to.be(3);
      });
      return it("should find the min of 2 nevative numbers", function() {
        var res;
        res = Math.min(-3, -5);
        return expect(res).to.be(-5);
      });
    });
    return describe("#Max", function() {
      it("should find the max of 2 positive numbers", function() {
        var res;
        res = Math.max(3, 5);
        return expect(res).to.be(5);
      });
      return it("should find the max of 2 nevative numbers", function() {
        var res;
        res = Math.max(-3, -5);
        return expect(res).to.be(-3);
      });
    });
  });

  describe("setTimeout", function() {
    this.timeout(0);
    it("should call the passed callback (1000ms)", function(done) {
      return setTimeout(done, 1000);
    });
    return it("should call the passed callback (2000ms)", function(done) {
      return setTimeout(done, 2000);
    });
  });

}).call(this);
