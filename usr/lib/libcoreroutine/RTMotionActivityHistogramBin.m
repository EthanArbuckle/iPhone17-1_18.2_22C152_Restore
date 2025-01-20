@interface RTMotionActivityHistogramBin
- (RTMotionActivityHistogramBin)initWithType:(unint64_t)a3 confidence:(unint64_t)a4 interval:(double)a5;
- (double)interval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)confidence;
- (unint64_t)type;
- (void)addInterval:(double)a3;
- (void)setConfidence:(unint64_t)a3;
- (void)setInterval:(double)a3;
- (void)setType:(unint64_t)a3;
- (void)updateConfidence:(unint64_t)a3;
@end

@implementation RTMotionActivityHistogramBin

- (RTMotionActivityHistogramBin)initWithType:(unint64_t)a3 confidence:(unint64_t)a4 interval:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)RTMotionActivityHistogramBin;
  result = [(RTMotionActivityHistogramBin *)&v9 init];
  if (result)
  {
    result->_type = a3;
    result->_confidence = a4;
    result->_interval = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [RTMotionActivityHistogramBin alloc];
  unint64_t v5 = [(RTMotionActivityHistogramBin *)self type];
  unint64_t v6 = [(RTMotionActivityHistogramBin *)self confidence];
  [(RTMotionActivityHistogramBin *)self interval];

  return -[RTMotionActivityHistogramBin initWithType:confidence:interval:](v4, "initWithType:confidence:interval:", v5, v6);
}

- (void)updateConfidence:(unint64_t)a3
{
  if ([(RTMotionActivityHistogramBin *)self confidence] < a3)
  {
    [(RTMotionActivityHistogramBin *)self setConfidence:a3];
  }
}

- (void)addInterval:(double)a3
{
  [(RTMotionActivityHistogramBin *)self interval];
  double v6 = v5 + a3;

  [(RTMotionActivityHistogramBin *)self setInterval:v6];
}

- (id)description
{
  v3 = NSString;
  v4 = [MEMORY[0x1E4F5CE50] motionActivityTypeToString:self->_type];
  double v5 = [MEMORY[0x1E4F5CE50] motionActivityConfidenceToString:self->_confidence];
  double v6 = [v3 stringWithFormat:@"type, %@, confidence, %@, interval, %.2f", v4, v5, *(void *)&self->_interval];

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_confidence = a3;
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