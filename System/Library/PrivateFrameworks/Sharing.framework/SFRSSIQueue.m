@interface SFRSSIQueue
- (double)velocity;
- (double)velocityFromA:(unint64_t)a3 toB:(unint64_t)a4;
- (double)velocitySmoothed;
- (void)addSample:(double)a3 atTicks:(unint64_t)a4;
@end

@implementation SFRSSIQueue

- (void)addSample:(double)a3 atTicks:(unint64_t)a4
{
  if (a3 < 0.0)
  {
    if (!self->_rssiValues)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      rssiValues = self->_rssiValues;
      self->_rssiValues = v7;
    }
    if (!self->_tickValues)
    {
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      tickValues = self->_tickValues;
      self->_tickValues = v9;
    }
    v11 = self->_rssiValues;
    v12 = [NSNumber numberWithDouble:a3];
    [(NSMutableArray *)v11 insertObject:v12 atIndex:0];

    v13 = self->_tickValues;
    v14 = [NSNumber numberWithUnsignedLongLong:a4];
    [(NSMutableArray *)v13 insertObject:v14 atIndex:0];

    if ((unint64_t)[(NSMutableArray *)self->_rssiValues count] >= 5) {
      [(NSMutableArray *)self->_rssiValues removeLastObject];
    }
    if ((unint64_t)[(NSMutableArray *)self->_tickValues count] >= 5)
    {
      v15 = self->_tickValues;
      [(NSMutableArray *)v15 removeLastObject];
    }
  }
}

- (double)velocity
{
  [(SFRSSIQueue *)self velocityFromA:0 toB:1];
  return result;
}

- (double)velocitySmoothed
{
  [(SFRSSIQueue *)self velocityFromA:0 toB:3];
  return result;
}

- (double)velocityFromA:(unint64_t)a3 toB:(unint64_t)a4
{
  double v7 = 0.0;
  if ([(NSMutableArray *)self->_rssiValues count] > a4)
  {
    unint64_t v8 = [(NSMutableArray *)self->_tickValues count];
    if (a3 < a4 && v8 > a4)
    {
      v9 = [(NSMutableArray *)self->_tickValues objectAtIndexedSubscript:a3];
      [v9 unsignedLongLongValue];

      v10 = [(NSMutableArray *)self->_tickValues objectAtIndexedSubscript:a4];
      [v10 unsignedLongLongValue];

      UpTicksToSecondsF();
      double v12 = v11;
      v13 = [(NSMutableArray *)self->_rssiValues objectAtIndexedSubscript:a3];
      [v13 doubleValue];
      double v15 = v14;

      v16 = [(NSMutableArray *)self->_rssiValues objectAtIndexedSubscript:a4];
      [v16 doubleValue];
      double v18 = v17;

      return (v15 - v18) / v12;
    }
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickValues, 0);

  objc_storeStrong((id *)&self->_rssiValues, 0);
}

@end