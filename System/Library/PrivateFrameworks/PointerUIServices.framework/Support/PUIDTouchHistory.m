@interface PUIDTouchHistory
- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3;
- (PUIDTouchHistory)init;
- (PUIDTouchHistory)initWithDepth:(unint64_t)a3;
- (int)touchHistoryDepthForTimeDuration:(double)a3 forComputingDerivative:(BOOL)a4;
- (void)reset;
- (void)updateWithLocation:(CGPoint)a3 timestamp:(double)a4;
@end

@implementation PUIDTouchHistory

- (PUIDTouchHistory)initWithDepth:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PUIDTouchHistory;
  v4 = [(PUIDTouchHistory *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_depth = a3;
    uint64_t v6 = +[NSMutableArray arrayWithCapacity:a3];
    locations = v5->_locations;
    v5->_locations = (NSMutableArray *)v6;

    uint64_t v8 = +[NSMutableArray arrayWithCapacity:a3];
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSMutableArray *)v8;
  }
  return v5;
}

- (PUIDTouchHistory)init
{
  return [(PUIDTouchHistory *)self initWithDepth:32];
}

- (void)updateWithLocation:(CGPoint)a3 timestamp:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  if ([(NSMutableArray *)self->_locations count] == (id)(self->_depth - 1))
  {
    [(NSMutableArray *)self->_locations removeLastObject];
    [(NSMutableArray *)self->_timestamps removeLastObject];
  }
  locations = self->_locations;
  v9 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", x, y);
  [(NSMutableArray *)locations insertObject:v9 atIndex:0];

  timestamps = self->_timestamps;
  id v11 = +[NSNumber numberWithDouble:a4];
  [(NSMutableArray *)timestamps insertObject:v11 atIndex:0];
}

- (void)reset
{
  [(NSMutableArray *)self->_locations removeAllObjects];
  timestamps = self->_timestamps;
  [(NSMutableArray *)timestamps removeAllObjects];
}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  int v4 = [(PUIDTouchHistory *)self touchHistoryDepthForTimeDuration:1 forComputingDerivative:a3];
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  if (v4)
  {
    int v7 = v4;
    if (v4 >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        v9 = [(NSMutableArray *)self->_locations objectAtIndexedSubscript:v8];
        [v9 pointValue];
        double v11 = v10;
        double v13 = v12;

        uint64_t v14 = v8 + 1;
        v15 = [(NSMutableArray *)self->_locations objectAtIndexedSubscript:v8 + 1];
        [v15 pointValue];
        double v17 = v16;
        double v19 = v18;

        v20 = [(NSMutableArray *)self->_timestamps objectAtIndexedSubscript:v8];
        [v20 doubleValue];
        double v22 = v21;
        v23 = [(NSMutableArray *)self->_timestamps objectAtIndexedSubscript:v14];
        [v23 doubleValue];
        double v25 = v22 - v24;

        if ((BSFloatIsZero() & 1) == 0)
        {
          double x = x + (v11 - v17) / v25;
          double y = y + (v13 - v19) / v25;
        }
        uint64_t v8 = v14;
      }
      while (v14 != v7);
    }
    double x = x / (double)v7;
    double y = y / (double)v7;
  }
  double v26 = x;
  double v27 = y;
  result.double y = v27;
  result.double x = v26;
  return result;
}

- (int)touchHistoryDepthForTimeDuration:(double)a3 forComputingDerivative:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = CACurrentMediaTime();
  if ([(NSMutableArray *)self->_locations count])
  {
    uint64_t v8 = [(NSMutableArray *)self->_timestamps objectAtIndexedSubscript:0];
    [v8 doubleValue];
    double v10 = v9;

    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = v11 + 1;
      if ((unint64_t)[(NSMutableArray *)self->_locations count] <= v11 + 1) {
        break;
      }
      double v13 = v7 - v10;
      uint64_t v14 = [(NSMutableArray *)self->_timestamps objectAtIndexedSubscript:v11 + 1];
      [v14 doubleValue];
      double v10 = v15;

      uint64_t v11 = v12;
      if (v13 >= a3)
      {
        if (v4) {
          LODWORD(v11) = v12;
        }
        else {
          LODWORD(v11) = v12 - 1;
        }
        return v11;
      }
    }
  }
  else
  {
    LODWORD(v11) = 0;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

@end