@interface CRLWPTextMagnifierTimeWeightedPoint
- (BOOL)historyCovers:(double)a3;
- (CGPoint)weightedPoint;
- (CGSize)displacementInInterval:(double)a3;
- (CGSize)displacementInInterval:(double)a3 priorTo:(double)a4;
- (double)distanceCoveredInInterval:(double)a3;
- (double)distanceCoveredInInterval:(double)a3 priorTo:(double)a4;
- (void)addPoint:(CGPoint)a3;
- (void)clearHistory;
@end

@implementation CRLWPTextMagnifierTimeWeightedPoint

- (void)clearHistory
{
  uint64_t v2 = 0;
  CGPoint v3 = CGPointZero;
  do
  {
    v4 = (CGPoint *)((char *)self + v2);
    v4[1] = v3;
    v4[2].x = -1.0;
    v2 += 24;
  }
  while (v2 != 384);
}

- (void)addPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  m_indeCGFloat x = self->m_index;
  v8 = (CGFloat *)((char *)self + 24 * m_index);
  v8[2] = x;
  v8[3] = y;
  v8[4] = Current;
  if (m_index <= 14) {
    int64_t v9 = m_index + 1;
  }
  else {
    int64_t v9 = 0;
  }
  self->m_indeCGFloat x = v9;
}

- (CGPoint)weightedPoint
{
  double y = CGPointZero.y;
  double Current = CFAbsoluteTimeGetCurrent();
  m_indedouble x = self->m_index;
  uint64_t v6 = 16;
  double v7 = y;
  double x = CGPointZero.x;
  while (1)
  {
    uint64_t v9 = m_index + v6 - 1;
    if (m_index + v6 - 17 >= 0) {
      uint64_t v9 = m_index + v6 - 17;
    }
    v10 = &self->m_points[v9];
    double time = v10->time;
    if (time == -1.0) {
      break;
    }
    double v13 = v10->point.x;
    double v12 = v10->point.y;
    if (x == CGPointZero.x && v7 == y)
    {
      double x = v10->point.x;
      double v7 = v10->point.y;
    }
    else if (Current - time > 0.15)
    {
      goto LABEL_15;
    }
    double v13 = x;
    double v12 = v7;
    if (!--v6) {
      goto LABEL_15;
    }
  }
  double v13 = x;
  double v12 = v7;
LABEL_15:
  double v15 = v13;
  result.double y = v12;
  result.double x = v15;
  return result;
}

- (BOOL)historyCovers:(double)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  m_indedouble x = self->m_index;
  uint64_t v7 = 16;
  while (1)
  {
    uint64_t v8 = m_index + v7 - 1;
    if (m_index + v7 - 17 >= 0) {
      uint64_t v8 = m_index + v7 - 17;
    }
    uint64_t v9 = &self->m_points[v8];
    double time = v9->time;
    if (time == -1.0) {
      return 0;
    }
    if (v9->point.x == CGPointZero.x && v9->point.y == CGPointZero.y) {
      return 0;
    }
    if (Current - time > a3) {
      break;
    }
    if (!--v7) {
      return 0;
    }
  }
  return 1;
}

- (double)distanceCoveredInInterval:(double)a3
{
  double Current = CFAbsoluteTimeGetCurrent();

  [(CRLWPTextMagnifierTimeWeightedPoint *)self distanceCoveredInInterval:a3 priorTo:Current];
  return result;
}

- (CGSize)displacementInInterval:(double)a3
{
  double Current = CFAbsoluteTimeGetCurrent();

  [(CRLWPTextMagnifierTimeWeightedPoint *)self displacementInInterval:a3 priorTo:Current];
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)displacementInInterval:(double)a3 priorTo:(double)a4
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  m_indedouble x = self->m_index;
  uint64_t v9 = 16;
  double y = CGPointZero.y;
  double x = CGPointZero.x;
  do
  {
    uint64_t v12 = m_index + v9 - 1;
    if (m_index + v9 - 17 >= 0) {
      uint64_t v12 = m_index + v9 - 17;
    }
    double v13 = &self->m_points[v12];
    double time = v13->time;
    if (time == -1.0) {
      break;
    }
    double v15 = v13->point.x;
    double v16 = v13->point.y;
    BOOL v17 = v16 == CGPointZero.y && v15 == CGPointZero.x;
    double v18 = a4 - time;
    if (v17 || v18 > a3) {
      break;
    }
    double v20 = x - v15;
    double v21 = y - v16;
    if (v9 == 16) {
      double v21 = -0.0;
    }
    double height = height + v21;
    double v22 = v9 == 16 ? -0.0 : v20;
    double width = width + v22;
    double y = v13->point.y;
    double x = v13->point.x;
    --v9;
  }
  while (v9);
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)distanceCoveredInInterval:(double)a3 priorTo:(double)a4
{
  double y = CGPointZero.y;
  m_indedouble x = self->m_index;
  m_points = self->m_points;
  double v9 = 0.0;
  uint64_t v10 = 16;
  double v11 = y;
  double x = CGPointZero.x;
  do
  {
    uint64_t v13 = m_index + v10 - 1;
    if (m_index + v10 - 17 >= 0) {
      uint64_t v13 = m_index + v10 - 17;
    }
    p_double x = &m_points[v13].point.x;
    double v15 = p_x[2];
    if (v15 == -1.0) {
      break;
    }
    double v16 = *p_x;
    double v17 = p_x[1];
    BOOL v18 = v17 == y && v16 == CGPointZero.x;
    double v19 = a4 - v15;
    if (v18 || v19 > a3) {
      break;
    }
    if (v10 != 16) {
      double v9 = v9 + sub_1000653B4(x, v11, *p_x, p_x[1]);
    }
    double v11 = v17;
    double x = v16;
    --v10;
  }
  while (v10);
  return v9;
}

@end