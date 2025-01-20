@interface RTStateModelEarliestLatestEl
+ (BOOL)supportsSecureCoding;
- (RTStateModelEarliestLatestEl)init;
- (RTStateModelEarliestLatestEl)initWithCoder:(id)a3;
- (RTStateModelEarliestLatestEl)initWithEarliest:(double)a3 andLatest:(double)a4;
- (double)earliestEl_s;
- (double)latestEl_s;
- (void)encodeWithCoder:(id)a3;
- (void)setEarliestEl_s:(double)a3;
- (void)setLatestEl_s:(double)a3;
@end

@implementation RTStateModelEarliestLatestEl

- (double)latestEl_s
{
  return self->_latestEl_s;
}

- (double)earliestEl_s
{
  return self->_earliestEl_s;
}

- (RTStateModelEarliestLatestEl)initWithEarliest:(double)a3 andLatest:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RTStateModelEarliestLatestEl;
  result = [(RTStateModelEarliestLatestEl *)&v7 init];
  if (result)
  {
    result->_earliestEl_s = a3;
    result->_latestEl_s = a4;
  }
  return result;
}

- (RTStateModelEarliestLatestEl)init
{
  return [(RTStateModelEarliestLatestEl *)self initWithEarliest:1.0e12 andLatest:-1.0e12];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double earliestEl_s = self->_earliestEl_s;
  id v5 = a3;
  [v5 encodeDouble:@"earliestStateModelEl" forKey:earliestEl_s];
  [v5 encodeDouble:@"latestStateModelEl" forKey:self->_latestEl_s];
}

- (RTStateModelEarliestLatestEl)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTStateModelEarliestLatestEl;
  id v5 = [(RTStateModelEarliestLatestEl *)&v9 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"earliestStateModelEl"];
    v5->_double earliestEl_s = v6;
    [v4 decodeDoubleForKey:@"latestStateModelEl"];
    v5->_latestEl_s = v7;
  }

  return v5;
}

- (void)setEarliestEl_s:(double)a3
{
  self->_double earliestEl_s = a3;
}

- (void)setLatestEl_s:(double)a3
{
  self->_latestEl_s = a3;
}

@end