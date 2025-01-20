@interface SBTouchHistory
- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3;
- (SBTouchHistory)init;
- (SBTouchHistory)initWithDepth:(unint64_t)a3;
- (double)averageTouchPathAngleOverTimeDuration:(double)a3;
- (double)historyAtIndex:(void *)a1;
- (double)peakSpeed;
- (int)touchHistoryDepthForTimeDuration:(double)a3 forComputingDerivative:(BOOL)a4;
- (void)dealloc;
- (void)reset;
- (void)updateWithLocation:(CGPoint)a3 timestamp:(double)a4;
- (void)updateWithLocation:(CGPoint)a3 timestamp:(double)a4 touchLatency:(double)a5;
@end

@implementation SBTouchHistory

- (void)updateWithLocation:(CGPoint)a3 timestamp:(double)a4 touchLatency:(double)a5
{
  unint64_t count = self->_count;
  if (count)
  {
    unint64_t depth = self->_depth;
    if ((a4 - self->_history[(count + self->_start - 1) % depth].var1) * 1000.0 < 1.0) {
      return;
    }
  }
  else
  {
    unint64_t depth = self->_depth;
  }
  self->_lastTouchLatency = a5;
  unint64_t start = self->_start;
  if (count == depth - 1)
  {
    unint64_t start = (start + 1) % depth;
    self->_unint64_t start = start;
    --count;
  }
  history = self->_history;
  self->_unint64_t count = count + 1;
  p_var0 = &history[(count + start) % depth].var0;
  CGPoint *p_var0 = a3;
  p_var0[1].x = a4;
  [(SBTouchHistory *)self averageTouchVelocityOverTimeDuration:0.04];
  long double v13 = hypot(v11, v12);
  if (v13 > self->_peakSpeed) {
    self->_peakSpeed = v13;
  }
}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  int v4 = [(SBTouchHistory *)self touchHistoryDepthForTimeDuration:1 forComputingDerivative:self->_lastTouchLatency + a3];
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v4)
  {
    int v7 = v4;
    if (v4 >= 1)
    {
      int v8 = 0;
      uint64_t v9 = -2;
      do
      {
        history = self->_history;
        unint64_t depth = self->_depth;
        unint64_t v12 = v9 + self->_start + self->_count;
        p_x = &history[(v12 + 1) % depth].var0.x;
        double v14 = *p_x;
        double v15 = p_x[1];
        v16 = &history[v12 % depth].var0.x;
        double v17 = *v16;
        double v18 = v16[1];
        double v19 = p_x[2] - v16[2];
        if ((BSFloatIsZero() & 1) == 0)
        {
          double v6 = v6 + (v14 - v17) / v19;
          double v5 = v5 + (v15 - v18) / v19;
        }
        ++v8;
        --v9;
      }
      while (v8 < v7);
    }
    double v6 = v6 / (double)v7;
    double v5 = v5 / (double)v7;
  }
  double v20 = v6;
  double v21 = v5;
  result.y = v21;
  result.x = v20;
  return result;
}

- (int)touchHistoryDepthForTimeDuration:(double)a3 forComputingDerivative:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = CACurrentMediaTime();
  unint64_t count = self->_count;
  if (!count) {
    return 0;
  }
  uint64_t v9 = 0;
  unint64_t v10 = count - 1;
  do
  {
    if (!(v10 + v9)) {
      return count - 1;
    }
    double v11 = v7 - self->_history[(v10 + v9-- + self->_start) % self->_depth].var1;
  }
  while (v11 < a3);
  if (v4) {
    return -(int)v9;
  }
  else {
    return ~v9;
  }
}

- (void)updateWithLocation:(CGPoint)a3 timestamp:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = CACurrentMediaTime() - a4;
  -[SBTouchHistory updateWithLocation:timestamp:touchLatency:](self, "updateWithLocation:timestamp:touchLatency:", x, y, a4, v8);
}

- (void)reset
{
  self->_peakSpeed = 0.0;
  self->_unint64_t count = 0;
  self->_unint64_t start = 0;
}

- (SBTouchHistory)initWithDepth:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBTouchHistory;
  BOOL v4 = [(SBTouchHistory *)&v7 init];
  double v5 = v4;
  if (v4)
  {
    v4->_unint64_t depth = a3;
    v4->_histordouble y = (TouchHistory *)malloc_type_malloc(24 * a3, 0x1000040504FFAC1uLL);
    v5->_peakSpeed = 0.0;
  }
  return v5;
}

- (SBTouchHistory)init
{
  return [(SBTouchHistory *)self initWithDepth:32];
}

- (void)dealloc
{
  free(self->_history);
  v3.receiver = self;
  v3.super_class = (Class)SBTouchHistory;
  [(SBTouchHistory *)&v3 dealloc];
}

- (double)historyAtIndex:(void *)a1
{
  if (a1) {
    return *(double *)(a1[4] + 24 * ((unint64_t)(a1[3] + ~a2 + a1[2]) % a1[1]));
  }
  else {
    return 0.0;
  }
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  int v4 = [(SBTouchHistory *)self touchHistoryDepthForTimeDuration:1 forComputingDerivative:a3];
  if (!v4) {
    return 0.0;
  }
  int v5 = v4;
  if (v4 < 1)
  {
    double v7 = 0.0;
  }
  else
  {
    uint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      if (self)
      {
        unint64_t start = self->_start;
        histordouble y = self->_history;
        unint64_t depth = self->_depth;
        unint64_t count = self->_count;
        p_double x = &history[(start + ~v6++ + count) % depth].var0.x;
        long double v13 = &history[(start + ~v6 + count) % depth].var0.x;
        double v14 = p_x[1] - v13[1];
        double v15 = *p_x - *v13;
      }
      else
      {
        ++v6;
        double v14 = 0.0;
        double v15 = 0.0;
      }
      double v16 = atan2(-v14, v15) * 57.2957795;
      if (v16 < 0.0) {
        double v16 = v16 + 360.0;
      }
      double v7 = v7 + v16;
    }
    while ((int)v6 < v5);
  }
  return v7 / (double)v5;
}

- (double)peakSpeed
{
  return self->_peakSpeed;
}

@end