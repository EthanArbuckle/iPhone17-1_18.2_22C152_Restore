@interface CLFenceAnalyticsMotionActivityHistogramBin
- (CLFenceAnalyticsMotionActivityHistogramBin)initWithInterval:(double)a3 motionActivityType:(unint64_t)a4 motionActivityConfidence:(int64_t)a5;
- (double)interval;
- (int64_t)motionActivityConfidence;
- (unint64_t)motionActivityType;
- (void)addInterval:(double)a3;
- (void)setInterval:(double)a3;
- (void)setMotionActivityConfidence:(int64_t)a3;
- (void)updateConfidence:(int64_t)a3;
@end

@implementation CLFenceAnalyticsMotionActivityHistogramBin

- (CLFenceAnalyticsMotionActivityHistogramBin)initWithInterval:(double)a3 motionActivityType:(unint64_t)a4 motionActivityConfidence:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLFenceAnalyticsMotionActivityHistogramBin;
  result = [(CLFenceAnalyticsMotionActivityHistogramBin *)&v9 init];
  if (result)
  {
    result->_motionActivityType = a4;
    result->_motionActivityConfidence = a5;
    result->_interval = a3;
  }
  return result;
}

- (void)updateConfidence:(int64_t)a3
{
  if ([(CLFenceAnalyticsMotionActivityHistogramBin *)self motionActivityConfidence] < a3)
  {
    [(CLFenceAnalyticsMotionActivityHistogramBin *)self setMotionActivityConfidence:a3];
  }
}

- (void)addInterval:(double)a3
{
  [(CLFenceAnalyticsMotionActivityHistogramBin *)self interval];
  double v6 = v5 + a3;

  [(CLFenceAnalyticsMotionActivityHistogramBin *)self setInterval:v6];
}

- (unint64_t)motionActivityType
{
  return self->_motionActivityType;
}

- (int64_t)motionActivityConfidence
{
  return self->_motionActivityConfidence;
}

- (void)setMotionActivityConfidence:(int64_t)a3
{
  self->_motionActivityConfidence = a3;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

@end