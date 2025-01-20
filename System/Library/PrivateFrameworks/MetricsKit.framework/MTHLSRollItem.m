@interface MTHLSRollItem
- (BOOL)containsOverallPosition:(unint64_t)a3;
- (MTHLSRollItem)initWithStartOverallPosition:(unint64_t)a3 duration:(unint64_t)a4 metricsData:(id)a5;
- (unint64_t)duration;
- (unint64_t)endOverallPosition;
- (void)setDuration:(unint64_t)a3;
@end

@implementation MTHLSRollItem

- (MTHLSRollItem)initWithStartOverallPosition:(unint64_t)a3 duration:(unint64_t)a4 metricsData:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MTHLSRollItem;
  v6 = [(MTHLSItem *)&v9 initWithStartOverallPosition:a3 metricsData:a5];
  v7 = v6;
  if (v6) {
    [(MTHLSRollItem *)v6 setDuration:a4];
  }
  return v7;
}

- (unint64_t)endOverallPosition
{
  unint64_t v3 = [(MTHLSItem *)self startOverallPosition];
  return [(MTHLSRollItem *)self duration] + v3;
}

- (BOOL)containsOverallPosition:(unint64_t)a3
{
  return [(MTHLSItem *)self startOverallPosition] <= a3
      && [(MTHLSRollItem *)self endOverallPosition] > a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

@end