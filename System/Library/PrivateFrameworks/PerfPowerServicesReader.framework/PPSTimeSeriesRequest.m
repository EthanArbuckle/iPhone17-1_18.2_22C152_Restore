@interface PPSTimeSeriesRequest
+ (BOOL)supportsSecureCoding;
- (PPSTimeSeriesRequest)initWithCoder:(id)a3;
- (PPSTimeSeriesRequest)initWithMetrics:(id)a3 predicate:(id)a4 timeFilter:(id)a5;
- (PPSTimeSeriesRequest)initWithMetrics:(id)a3 predicate:(id)a4 timeFilter:(id)a5 limitCount:(unint64_t)a6 offsetCount:(unint64_t)a7;
- (PPSTimeSeriesRequest)initWithMetrics:(id)a3 predicate:(id)a4 timeFilter:(id)a5 limitCount:(unint64_t)a6 offsetCount:(unint64_t)a7 readDirection:(unint64_t)a8;
- (id)description;
- (unint64_t)limitCount;
- (unint64_t)offsetCount;
- (unint64_t)readDirection;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSTimeSeriesRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSTimeSeriesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PPSTimeSeriesRequest;
  v5 = [(PPSDataRequest *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_limitCount = [v4 decodeIntegerForKey:@"limitCount"];
    v5->_offsetCount = [v4 decodeIntegerForKey:@"offsetCount"];
    v5->_readDirection = [v4 decodeIntegerForKey:@"readDirection"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PPSTimeSeriesRequest;
  id v4 = a3;
  [(PPSDataRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limitCount, @"limitCount", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_offsetCount forKey:@"offsetCount"];
  [v4 encodeInteger:self->_readDirection forKey:@"readDirection"];
}

- (PPSTimeSeriesRequest)initWithMetrics:(id)a3 predicate:(id)a4 timeFilter:(id)a5
{
  return [(PPSTimeSeriesRequest *)self initWithMetrics:a3 predicate:a4 timeFilter:a5 limitCount:0 offsetCount:0 readDirection:0];
}

- (PPSTimeSeriesRequest)initWithMetrics:(id)a3 predicate:(id)a4 timeFilter:(id)a5 limitCount:(unint64_t)a6 offsetCount:(unint64_t)a7
{
  return [(PPSTimeSeriesRequest *)self initWithMetrics:a3 predicate:a4 timeFilter:a5 limitCount:a6 offsetCount:a7 readDirection:0];
}

- (PPSTimeSeriesRequest)initWithMetrics:(id)a3 predicate:(id)a4 timeFilter:(id)a5 limitCount:(unint64_t)a6 offsetCount:(unint64_t)a7 readDirection:(unint64_t)a8
{
  v12.receiver = self;
  v12.super_class = (Class)PPSTimeSeriesRequest;
  result = [(PPSDataRequest *)&v12 initWithRequestType:0 metrics:a3 predicate:a4 timeFilter:a5];
  if (result)
  {
    result->_limitCount = a6;
    result->_offsetCount = a7;
    result->_readDirection = a8;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(PPSDataRequest *)self requestType];
  v6 = [(PPSDataRequest *)self metrics];
  objc_super v7 = [(PPSDataRequest *)self predicate];
  v8 = [(PPSDataRequest *)self timeFilter];
  v9 = [v3 stringWithFormat:@"<%@: %p { type: %ld, metrics: %@, predicate: %@, timeFilter: %@ limitCount:%ld offsetCount:%ld readDirection: %ld }>", v4, self, v5, v6, v7, v8, -[PPSTimeSeriesRequest limitCount](self, "limitCount"), -[PPSTimeSeriesRequest offsetCount](self, "offsetCount"), -[PPSTimeSeriesRequest readDirection](self, "readDirection")];

  return v9;
}

- (unint64_t)limitCount
{
  return self->_limitCount;
}

- (unint64_t)offsetCount
{
  return self->_offsetCount;
}

- (unint64_t)readDirection
{
  return self->_readDirection;
}

@end