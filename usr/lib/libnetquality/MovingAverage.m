@interface MovingAverage
- (MovingAverage)initWithSize:(unint64_t)a3 withScalingFactor:(float)a4;
- (float)add:(float)a3 overflow:(BOOL)a4;
- (float)getAvg;
- (float)getStdDev;
- (id)description;
@end

@implementation MovingAverage

- (MovingAverage)initWithSize:(unint64_t)a3 withScalingFactor:(float)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MovingAverage;
  v6 = [(MovingAverage *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_arraySize = a3;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    values = v7->_values;
    v7->_values = v8;

    v7->_currentAverage = 0.0;
    v7->_scalingFactor = a4;
  }
  return v7;
}

- (float)add:(float)a3 overflow:(BOOL)a4
{
  float currentAverage = self->_currentAverage;
  float v8 = currentAverage * (float)(unint64_t)[(NSMutableArray *)self->_values count];
  if ([(NSMutableArray *)self->_values count] == self->_arraySize && !a4)
  {
    v10 = [(NSMutableArray *)self->_values lastObject];
    [v10 floatValue];
    float v8 = v8 - v11;

    [(NSMutableArray *)self->_values removeLastObject];
  }
  values = self->_values;
  *(float *)&double v9 = a3;
  v13 = [NSNumber numberWithFloat:v9];
  [(NSMutableArray *)values insertObject:v13 atIndex:0];

  float result = (float)(v8 + a3) / (float)(unint64_t)[(NSMutableArray *)self->_values count];
  self->_float currentAverage = result;
  return result;
}

- (float)getAvg
{
  return self->_currentAverage;
}

- (float)getStdDev
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NSMutableArray *)self->_values count];
  float result = -1.0;
  if (v3 >= self->_arraySize)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = self->_values;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) doubleValue:v12];
          double v9 = v9 + (v11 - self->_currentAverage) * (v11 - self->_currentAverage);
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }

    return sqrt(v9 / (double)(unint64_t)[(NSMutableArray *)self->_values count]);
  }
  return result;
}

- (id)description
{
  unint64_t v3 = [(NSMutableArray *)self->_values count];
  v4 = NSString;
  if (v3 > 9)
  {
    [(MovingAverage *)self getAvg];
    double v10 = (float)(v9 / self->_scalingFactor);
    [(MovingAverage *)self getStdDev];
    [v4 stringWithFormat:@"Avg: %.3f, Stddev: %.3f", *(void *)&v10, (float)(v11 / self->_scalingFactor), v14];
  }
  else
  {
    values = self->_values;
    [(MovingAverage *)self getAvg];
    double v7 = (float)(v6 / self->_scalingFactor);
    [(MovingAverage *)self getStdDev];
    [v4 stringWithFormat:@"Values: %@, Avg: %.3f, Stddev: %.3f", values, *(void *)&v7, (float)(v8 / self->_scalingFactor)];
  long long v12 = };

  return v12;
}

- (void).cxx_destruct
{
}

@end