@interface CRLPointSequenceCubicBezierApproximator
- (CGPoint)controlPoint1;
- (CGPoint)controlPoint2;
- (CRLMatrix2x2)lhs;
- (CRLPointSequenceCubicBezierApproximator)initWithDataPoints:(const void *)a3;
- (CRLPointVector2)rhs;
- (double)approximationError;
- (id).cxx_construct;
- (unint64_t)n;
- (void)computeApproximationError;
- (void)computeCoefficientMatrix;
- (void)computeConstantVector;
- (void)computeControlPoints;
- (void)computeErrorDistances;
- (void)computeKnots;
- (void)dataPoints;
- (void)errorDistances;
- (void)knots;
- (void)run;
- (void)setApproximationError:(double)a3;
- (void)setControlPoint1:(CGPoint)a3;
- (void)setControlPoint2:(CGPoint)a3;
- (void)setN:(unint64_t)a3;
@end

@implementation CRLPointSequenceCubicBezierApproximator

- (CRLPointSequenceCubicBezierApproximator)initWithDataPoints:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLPointSequenceCubicBezierApproximator;
  v4 = [(CRLPointSequenceCubicBezierApproximator *)&v8 init];
  v5 = v4;
  if (v4)
  {
    p_dataPoints = (char *)&v4->_dataPoints;
    if (&v5->_dataPoints != a3) {
      sub_10001EAE8(p_dataPoints, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
    }
    v5->_n = ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4) - 1;
  }
  return v5;
}

- (void)computeKnots
{
  sub_100122CB8((uint64_t)[(CRLPointSequenceCubicBezierApproximator *)self knots], [(CRLPointSequenceCubicBezierApproximator *)self n] + 1);
  **(void **)[(CRLPointSequenceCubicBezierApproximator *)self knots] = 0;
  if ([(CRLPointSequenceCubicBezierApproximator *)self n])
  {
    uint64_t v3 = 0;
    double v4 = 0.0;
    unint64_t v5 = 1;
    do
    {
      v6 = (double *)(*(void *)[(CRLPointSequenceCubicBezierApproximator *)self dataPoints] + v3);
      double v7 = *v6;
      double v8 = v6[1];
      v9 = [(CRLPointSequenceCubicBezierApproximator *)self dataPoints];
      double v4 = v4 + sqrt(sub_1000653B4(v7, v8, *(double *)(*v9 + v3 + 16), *(double *)(*v9 + v3 + 24)));
      *(double *)(*(void *)[(CRLPointSequenceCubicBezierApproximator *)self knots] + 8 * v5++) = v4;
      v3 += 16;
    }
    while (v5 <= [(CRLPointSequenceCubicBezierApproximator *)self n]);
  }
  else
  {
    double v4 = 0.0;
  }
  if ([(CRLPointSequenceCubicBezierApproximator *)self n])
  {
    unint64_t v10 = 1;
    do
    {
      v11 = [(CRLPointSequenceCubicBezierApproximator *)self knots];
      *(double *)(*v11 + 8 * v10) = *(double *)(*v11 + 8 * v10) / v4;
      ++v10;
    }
    while (v10 <= [(CRLPointSequenceCubicBezierApproximator *)self n]);
  }
}

- (void)computeErrorDistances
{
  sub_10001DF00((uint64_t)[(CRLPointSequenceCubicBezierApproximator *)self errorDistances], [(CRLPointSequenceCubicBezierApproximator *)self n] + 1);
  if ((id)[(CRLPointSequenceCubicBezierApproximator *)self n] != (id)1)
  {
    unint64_t v3 = 1;
    do
    {
      uint64_t v4 = *(void *)[(CRLPointSequenceCubicBezierApproximator *)self dataPoints];
      unint64_t v5 = *(float64x2_t **)[(CRLPointSequenceCubicBezierApproximator *)self dataPoints];
      double v6 = 1.0 - *(double *)(*(void *)[(CRLPointSequenceCubicBezierApproximator *)self knots] + 8 * v3);
      float64x2_t v11 = vmulq_n_f64(*v5, v6 * (v6 * v6));
      double v7 = [(CRLPointSequenceCubicBezierApproximator *)self dataPoints];
      unint64_t v8 = [(CRLPointSequenceCubicBezierApproximator *)self n];
      uint64_t v9 = *v7;
      unint64_t v10 = [(CRLPointSequenceCubicBezierApproximator *)self knots];
      float64x2_t v12 = vsubq_f64(*(float64x2_t *)(v4 + 16 * v3), vaddq_f64(v11, vmulq_n_f64(*(float64x2_t *)(v9 + 16 * v8), *(double *)(*v10 + 8 * v3) * (*(double *)(*v10 + 8 * v3) * *(double *)(*v10 + 8 * v3)))));
      *(float64x2_t *)(*(void *)[(CRLPointSequenceCubicBezierApproximator *)self errorDistances]
                     + 16 * v3++) = v12;
    }
    while ((char *)v3 <= (char *)[(CRLPointSequenceCubicBezierApproximator *)self n] - 1);
  }
}

- (void)computeConstantVector
{
  for (uint64_t i = 1; i != 3; ++i)
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    if ((id)[(CRLPointSequenceCubicBezierApproximator *)self n] != (id)1)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 1;
      do
      {
        uint64_t v8 = *(void *)[(CRLPointSequenceCubicBezierApproximator *)self errorDistances] + v6;
        double v9 = sub_100122E18(i, *(double *)(*(void *)[(CRLPointSequenceCubicBezierApproximator *)self knots] + 8 * v7));
        double x = x + v9 * *(double *)(v8 + 16);
        double y = y + v9 * *(double *)(v8 + 24);
        ++v7;
        v6 += 16;
      }
      while ((char *)v7 <= (char *)[(CRLPointSequenceCubicBezierApproximator *)self n] - 1);
    }
    unint64_t v10 = (double *)((char *)[(CRLPointSequenceCubicBezierApproximator *)self rhs] + 16 * i);
    *(v10 - 2) = x;
    *(v10 - 1) = y;
  }
}

- (void)computeCoefficientMatrix
{
  for (uint64_t i = 1; i != 3; ++i)
  {
    for (uint64_t j = 1; j != 3; ++j)
    {
      [(CRLPointSequenceCubicBezierApproximator *)self n];
      unint64_t v5 = 0;
      double v6 = 0.0;
      do
      {
        double v7 = sub_100122E18(i, *(double *)(*(void *)[(CRLPointSequenceCubicBezierApproximator *)self knots] + 8 * v5));
        double v6 = v6
           + v7
           * sub_100122E18(j, *(double *)(*(void *)[(CRLPointSequenceCubicBezierApproximator *)self knots] + 8 * v5++));
      }
      while (v5 <= [(CRLPointSequenceCubicBezierApproximator *)self n]);
      *((double *)[(CRLPointSequenceCubicBezierApproximator *)self lhs] + 2 * i + j - 3) = v6;
    }
  }
}

- (void)computeControlPoints
{
  double v3 = *(double *)[(CRLPointSequenceCubicBezierApproximator *)self lhs];
  double v4 = *((double *)[(CRLPointSequenceCubicBezierApproximator *)self lhs] + 1);
  double v5 = *((double *)[(CRLPointSequenceCubicBezierApproximator *)self lhs] + 2);
  double v6 = *((double *)[(CRLPointSequenceCubicBezierApproximator *)self lhs] + 3);
  double v7 = v3 * v6 - v4 * v5;
  if (v7 >= 0.000001)
  {
    double v8 = -v4;
    double v9 = v6 / v7;
    double v10 = v8 / v7;
    double v11 = -v5 / v7;
    double v12 = v3 / v7;
    v13 = [(CRLPointSequenceCubicBezierApproximator *)self rhs];
    double v14 = v9 * v13->v[0].x;
    double v15 = v9 * v13->v[0].y;
    v16 = [(CRLPointSequenceCubicBezierApproximator *)self rhs];
    -[CRLPointSequenceCubicBezierApproximator setControlPoint1:](self, "setControlPoint1:", v14 + v10 * v16->v[1].x, v15 + v10 * v16->v[1].y);
    v17 = [(CRLPointSequenceCubicBezierApproximator *)self rhs];
    double v18 = v11 * v17->v[0].x;
    double v19 = v11 * v17->v[0].y;
    v20 = [(CRLPointSequenceCubicBezierApproximator *)self rhs];
    double v21 = v18 + v12 * v20->v[1].x;
    double v22 = v19 + v12 * v20->v[1].y;
    -[CRLPointSequenceCubicBezierApproximator setControlPoint2:](self, "setControlPoint2:", v21, v22);
  }
  else
  {
    [(CRLPointSequenceCubicBezierApproximator *)self setApproximationError:INFINITY];
  }
}

- (void)computeApproximationError
{
  long long v20 = *(_OWORD *)*(void *)[(CRLPointSequenceCubicBezierApproximator *)self dataPoints];
  [(CRLPointSequenceCubicBezierApproximator *)self controlPoint1];
  uint64_t v21 = v3;
  uint64_t v22 = v4;
  [(CRLPointSequenceCubicBezierApproximator *)self controlPoint2];
  uint64_t v23 = v5;
  uint64_t v24 = v6;
  double v7 = [(CRLPointSequenceCubicBezierApproximator *)self dataPoints];
  long long v25 = *(_OWORD *)(*v7 + 16 * [(CRLPointSequenceCubicBezierApproximator *)self n]);
  [(CRLPointSequenceCubicBezierApproximator *)self approximationError];
  if ((v8 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
  {
    [(CRLPointSequenceCubicBezierApproximator *)self n];
    unint64_t v9 = 0;
    double v10 = 0.0;
    do
    {
      double v11 = (double *)(*(void *)[(CRLPointSequenceCubicBezierApproximator *)self dataPoints] + 16 * v9);
      double v12 = *v11;
      double v13 = v11[1];
      uint64_t v14 = 0;
      double v15 = *(double *)(*(void *)[(CRLPointSequenceCubicBezierApproximator *)self knots] + 8 * v9);
      CGPoint v16 = CGPointZero;
      do
      {
        float64x2_t v17 = vaddq_f64((float64x2_t)v16, vmulq_n_f64(*((float64x2_t *)&v20 + v14), sub_100122E18(v14, v15)));
        float64x2_t v19 = v17;
        CGPoint v16 = (CGPoint)v17;
        ++v14;
      }
      while (v14 != 4);
      double v10 = v10 + sub_1000643CC(v17.f64[0], v17.f64[1], v12, v13);
      ++v9;
    }
    while (v9 <= [(CRLPointSequenceCubicBezierApproximator *)self n]);
    [(CRLPointSequenceCubicBezierApproximator *)self setApproximationError:sqrt(v10)];
  }
  unint64_t v18 = -1;
  do
    ++v18;
  while (v18 <= [(CRLPointSequenceCubicBezierApproximator *)self n]);
}

- (void)run
{
  if ([(CRLPointSequenceCubicBezierApproximator *)self n] < 3)
  {
    if ((id)[(CRLPointSequenceCubicBezierApproximator *)self n] == (id)2)
    {
      uint64_t v3 = [(CRLPointSequenceCubicBezierApproximator *)self dataPoints];
      float64x2_t v4 = vaddq_f64(vaddq_f64(**v3, **v3), *(float64x2_t *)(*(void *)[(CRLPointSequenceCubicBezierApproximator *)self dataPoints] + 16));
      __asm { FMOV            V1.2D, #3.0 }
      float64x2_t v11 = _Q1;
      [(CRLPointSequenceCubicBezierApproximator *)self setControlPoint1:vdivq_f64(v4, _Q1)];
      double v10 = [(CRLPointSequenceCubicBezierApproximator *)self dataPoints];
      [(CRLPointSequenceCubicBezierApproximator *)self setControlPoint2:vdivq_f64(vaddq_f64(vaddq_f64((*v10)[2], (*v10)[2]), *(float64x2_t *)(*(void *)[(CRLPointSequenceCubicBezierApproximator *)self dataPoints] + 16)), v11)];
      [(CRLPointSequenceCubicBezierApproximator *)self setApproximationError:0.0];
    }
  }
  else
  {
    [(CRLPointSequenceCubicBezierApproximator *)self computeKnots];
    [(CRLPointSequenceCubicBezierApproximator *)self computeErrorDistances];
    [(CRLPointSequenceCubicBezierApproximator *)self computeConstantVector];
    [(CRLPointSequenceCubicBezierApproximator *)self computeCoefficientMatrix];
    [(CRLPointSequenceCubicBezierApproximator *)self computeControlPoints];
    [(CRLPointSequenceCubicBezierApproximator *)self computeApproximationError];
  }
}

- (CGPoint)controlPoint1
{
  double x = self->_controlPoint1.x;
  double y = self->_controlPoint1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setControlPoint1:(CGPoint)a3
{
  self->_controlPoint1 = a3;
}

- (CGPoint)controlPoint2
{
  double x = self->_controlPoint2.x;
  double y = self->_controlPoint2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setControlPoint2:(CGPoint)a3
{
  self->_controlPoint2 = a3;
}

- (double)approximationError
{
  return self->_approximationError;
}

- (void)setApproximationError:(double)a3
{
  self->_approximationError = a3;
}

- (void)dataPoints
{
  return &self->_dataPoints;
}

- (unint64_t)n
{
  return self->_n;
}

- (void)setN:(unint64_t)a3
{
  self->_n = a3;
}

- (void)knots
{
  return &self->_knots;
}

- (void)errorDistances
{
  return &self->_errorDistances;
}

- (CRLMatrix2x2)lhs
{
  return &self->_lhs;
}

- (CRLPointVector2)rhs
{
  return &self->_rhs;
}

- (void).cxx_destruct
{
  begin = self->_errorDistances.__begin_;
  if (begin)
  {
    self->_errorDistances.__end_ = begin;
    operator delete(begin);
  }
  float64x2_t v4 = self->_knots.__begin_;
  if (v4)
  {
    self->_knots.__end_ = v4;
    operator delete(v4);
  }
  uint64_t v5 = self->_dataPoints.__begin_;
  if (v5)
  {
    self->_dataPoints.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 19) = 0;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  CGPoint v2 = CGPointZero;
  *((CGPoint *)self + 10) = CGPointZero;
  *((CGPoint *)self + 11) = v2;
  return self;
}

@end