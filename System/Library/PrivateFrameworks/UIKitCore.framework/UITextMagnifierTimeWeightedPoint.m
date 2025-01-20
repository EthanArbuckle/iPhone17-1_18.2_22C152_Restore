@interface UITextMagnifierTimeWeightedPoint
- (BOOL)historyCovers:(double)a3;
- (BOOL)isPlacedCarefully;
- (CGPoint)diffFromLastPoint;
- (CGPoint)weightedPoint;
- (CGSize)displacementInInterval:(double)a3;
- (CGSize)displacementInInterval:(double)a3 priorTo:(double)a4;
- (float)distanceCoveredInInterval:(double)a3;
- (float)distanceCoveredInInterval:(double)a3 priorTo:(double)a4;
- (void)addPoint:(CGPoint)a3;
- (void)clearHistory;
@end

@implementation UITextMagnifierTimeWeightedPoint

- (void)clearHistory
{
  uint64_t v2 = 0;
  long long v3 = *MEMORY[0x1E4F1DAD8];
  do
  {
    v4 = (char *)self + v2;
    *((_OWORD *)v4 + 1) = v3;
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
    int v9 = m_index + 1;
  }
  else {
    int v9 = 0;
  }
  self->m_indeCGFloat x = v9;
}

- (CGPoint)weightedPoint
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double Current = CFAbsoluteTimeGetCurrent();
  m_indedouble x = self->m_index;
  int v7 = 15;
  double v8 = v4;
  double v9 = v3;
  while (1)
  {
    int v10 = m_index + v7;
    if (m_index + v7 - 16 >= 0) {
      int v10 = m_index + v7 - 16;
    }
    v11 = &self->m_points[v10];
    double time = v11->time;
    if (time == -1.0) {
      break;
    }
    double x = v11->point.x;
    double y = v11->point.y;
    if (v9 == v3 && v8 == v4)
    {
      double v9 = v11->point.x;
      double v8 = v11->point.y;
    }
    else if (Current - time > 0.15)
    {
      goto LABEL_15;
    }
    --v7;
    double x = v9;
    double y = v8;
    if (v7 == -1) {
      goto LABEL_15;
    }
  }
  double x = v9;
  double y = v8;
LABEL_15:
  double v16 = x;
  result.double y = y;
  result.double x = v16;
  return result;
}

- (BOOL)historyCovers:(double)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  m_indedouble x = self->m_index;
  int v7 = 16;
  while (1)
  {
    int v8 = m_index + v7 - 1;
    if (m_index + v7 - 17 >= 0) {
      int v8 = m_index + v7 - 17;
    }
    double v9 = &self->m_points[v8];
    double time = v9->time;
    if (time == -1.0) {
      return 0;
    }
    if (v9->point.x == *MEMORY[0x1E4F1DAD8] && v9->point.y == *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
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

- (float)distanceCoveredInInterval:(double)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(UITextMagnifierTimeWeightedPoint *)self distanceCoveredInInterval:a3 priorTo:Current];
  return result;
}

- (CGSize)displacementInInterval:(double)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(UITextMagnifierTimeWeightedPoint *)self displacementInInterval:a3 priorTo:Current];
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)displacementInInterval:(double)a3 priorTo:(double)a4
{
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  m_indedouble x = self->m_index;
  int v9 = 15;
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v11 = *MEMORY[0x1E4F1DAD8];
  do
  {
    int v12 = m_index + v9;
    if (m_index + v9 - 16 >= 0) {
      int v12 = m_index + v9 - 16;
    }
    v13 = &self->m_points[v12];
    double time = v13->time;
    if (time == -1.0) {
      break;
    }
    double x = v13->point.x;
    double y = v13->point.y;
    BOOL v17 = y == *(double *)(MEMORY[0x1E4F1DAD8] + 8) && x == *MEMORY[0x1E4F1DAD8];
    double v18 = a4 - time;
    if (v17 || v18 > a3) {
      break;
    }
    double v20 = v11 - x;
    double v21 = v10 - y;
    if (v9 == 15) {
      double v21 = -0.0;
    }
    double v7 = v7 + v21;
    double v22 = v9 == 15 ? -0.0 : v20;
    double v6 = v6 + v22;
    --v9;
    double v10 = v13->point.y;
    double v11 = v13->point.x;
  }
  while (v9 != -1);
  result.height = v7;
  result.width = v6;
  return result;
}

- (float)distanceCoveredInInterval:(double)a3 priorTo:(double)a4
{
  m_indedouble x = self->m_index;
  float v5 = 0.0;
  int v6 = 15;
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v8 = *MEMORY[0x1E4F1DAD8];
  do
  {
    int v9 = m_index + v6;
    if (m_index + v6 - 16 >= 0) {
      int v9 = m_index + v6 - 16;
    }
    double v10 = &self->m_points[v9];
    double time = v10->time;
    if (time == -1.0) {
      break;
    }
    double x = v10->point.x;
    double y = v10->point.y;
    BOOL v14 = y == *(double *)(MEMORY[0x1E4F1DAD8] + 8) && x == *MEMORY[0x1E4F1DAD8];
    double v15 = a4 - time;
    if (v14 || v15 > a3) {
      break;
    }
    if (v6 != 15) {
      float v5 = sqrt((x - v8) * (x - v8) + (y - v7) * (y - v7)) + v5;
    }
    --v6;
    double v7 = v10->point.y;
    double v8 = v10->point.x;
  }
  while (v6 != -1);
  return v5;
}

- (BOOL)isPlacedCarefully
{
  BOOL v3 = [(UITextMagnifierTimeWeightedPoint *)self historyCovers:0.2];
  [(UITextMagnifierTimeWeightedPoint *)self distanceCoveredInInterval:0.2];
  return v4 < 15.0 && v3;
}

- (CGPoint)diffFromLastPoint
{
  m_indedouble x = self->m_index;
  if (m_index >= 1) {
    int v3 = -1;
  }
  else {
    int v3 = 15;
  }
  float v4 = (double *)((char *)self + 24 * v3 + 24 * m_index);
  double v5 = v4[2];
  double v6 = v4[3];
  [(UITextMagnifierTimeWeightedPoint *)self weightedPoint];
  double v8 = v7 - v5;
  double v10 = v9 - v6;
  result.double y = v10;
  result.double x = v8;
  return result;
}

@end