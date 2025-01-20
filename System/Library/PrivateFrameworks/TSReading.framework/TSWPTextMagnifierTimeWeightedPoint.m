@interface TSWPTextMagnifierTimeWeightedPoint
- (BOOL)historyCovers:(double)a3;
- (CGPoint)weightedPoint;
- (CGSize)displacementInInterval:(double)a3;
- (CGSize)displacementInInterval:(double)a3 priorTo:(double)a4;
- (double)distanceCoveredInInterval:(double)a3;
- (double)distanceCoveredInInterval:(double)a3 priorTo:(double)a4;
- (void)addPoint:(CGPoint)a3;
- (void)clearHistory;
@end

@implementation TSWPTextMagnifierTimeWeightedPoint

- (void)clearHistory
{
  uint64_t v2 = 0;
  v3 = (_OWORD *)MEMORY[0x263F00148];
  do
  {
    v4 = (char *)self + v2;
    *((_OWORD *)v4 + 1) = *v3;
    *((void *)v4 + 4) = 0xBFF0000000000000;
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
  v3 = (double *)MEMORY[0x263F00148];
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  double Current = CFAbsoluteTimeGetCurrent();
  m_indedouble x = self->m_index;
  uint64_t v8 = 16;
  while (1)
  {
    uint64_t v9 = m_index + v8 - 1;
    if (m_index + v8 - 17 >= 0) {
      uint64_t v9 = m_index + v8 - 17;
    }
    v10 = &self->m_points[v9];
    double time = v10->time;
    if (time == -1.0) {
      break;
    }
    double x = v10->point.x;
    double y = v10->point.y;
    if (v4 == *v3 && v5 == v3[1])
    {
      double v4 = v10->point.x;
      double v5 = v10->point.y;
    }
    else if (Current - time > 0.15)
    {
      goto LABEL_15;
    }
    double x = v4;
    double y = v5;
    if (!--v8) {
      goto LABEL_15;
    }
  }
  double x = v4;
  double y = v5;
LABEL_15:
  double v15 = x;
  result.double y = y;
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
    if (v9->point.x == *MEMORY[0x263F00148] && v9->point.y == *(double *)(MEMORY[0x263F00148] + 8)) {
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

  [(TSWPTextMagnifierTimeWeightedPoint *)self distanceCoveredInInterval:a3 priorTo:Current];
  return result;
}

- (CGSize)displacementInInterval:(double)a3
{
  double Current = CFAbsoluteTimeGetCurrent();

  [(TSWPTextMagnifierTimeWeightedPoint *)self displacementInInterval:a3 priorTo:Current];
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)displacementInInterval:(double)a3 priorTo:(double)a4
{
  double v6 = *MEMORY[0x263F001B0];
  double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  m_indedouble x = self->m_index;
  uint64_t v9 = 16;
  double v10 = *MEMORY[0x263F00148];
  double v11 = *(double *)(MEMORY[0x263F00148] + 8);
  do
  {
    uint64_t v12 = m_index + v9 - 1;
    if (m_index + v9 - 17 >= 0) {
      uint64_t v12 = m_index + v9 - 17;
    }
    v13 = &self->m_points[v12];
    double time = v13->time;
    if (time == -1.0) {
      break;
    }
    double x = v13->point.x;
    double y = v13->point.y;
    BOOL v17 = y == *(double *)(MEMORY[0x263F00148] + 8) && x == *MEMORY[0x263F00148];
    double v18 = a4 - time;
    if (v17 || v18 > a3) {
      break;
    }
    double v20 = v10 - x;
    double v21 = v11 - y;
    if (v9 == 16) {
      double v20 = -0.0;
    }
    double v6 = v6 + v20;
    double v22 = v9 == 16 ? -0.0 : v21;
    double v7 = v7 + v22;
    double v10 = v13->point.x;
    double v11 = v13->point.y;
    --v9;
  }
  while (v9);
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)distanceCoveredInInterval:(double)a3 priorTo:(double)a4
{
  double v6 = *MEMORY[0x263F00148];
  double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  m_indedouble x = self->m_index;
  m_points = self->m_points;
  double v10 = 0.0;
  uint64_t v11 = 16;
  double v12 = *MEMORY[0x263F00148];
  double v13 = v7;
  do
  {
    uint64_t v14 = m_index + v11 - 1;
    if (m_index + v11 - 17 >= 0) {
      uint64_t v14 = m_index + v11 - 17;
    }
    p_double x = &m_points[v14].point.x;
    double v16 = p_x[2];
    if (v16 == -1.0) {
      break;
    }
    double v17 = *p_x;
    double v18 = p_x[1];
    BOOL v19 = v18 == v7 && v17 == v6;
    double v20 = a4 - v16;
    if (v19 || v20 > a3) {
      break;
    }
    if (v11 != 16) {
      double v10 = v10 + TSDDistance(v12, v13, *p_x, p_x[1]);
    }
    double v12 = v17;
    double v13 = v18;
    --v11;
  }
  while (v11);
  return v10;
}

@end