@interface MRCAMLBezierData
- (MRCAMLBezierData)initWithControlPoints:(const double *)a3;
- (MRCAMLBezierData)initWithTimingFunction:(id)a3;
- (double)evaluatAtTime:(double)a3;
- (double)evaluate_inverseAtTime:(double)a3;
- (double)sample_x:(double)a3;
- (double)sample_x_derivative:(double)a3;
- (double)sample_y:(double)a3;
- (double)sample_y_derivative:(double)a3;
- (double)solve_x:(double)a3 epsilon:(double)a4;
- (double)solve_y:(double)a3 epsilon:(double)a4;
@end

@implementation MRCAMLBezierData

- (MRCAMLBezierData)initWithControlPoints:(const double *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MRCAMLBezierData;
  result = [(MRCAMLBezierData *)&v9 init];
  if (result)
  {
    double v5 = *a3 * 3.0;
    result->cx = v5;
    double v6 = -(v5 - (a3[2] - *a3) * 3.0);
    result->ax = 1.0 - v5 - v6;
    result->bx = v6;
    double v7 = a3[1] * 3.0;
    result->cy = v7;
    double v8 = -(v7 - (a3[3] - a3[1]) * 3.0);
    result->ay = 1.0 - v7 - v8;
    result->by = v8;
  }
  return result;
}

- (MRCAMLBezierData)initWithTimingFunction:(id)a3
{
  if ([a3 isEqualToString:@"easeInEaseOut"])
  {
    long long v10 = xmmword_1653F0;
LABEL_3:
    uint64_t v5 = 0x3FE28F5C28F5C28FLL;
    goto LABEL_9;
  }
  if ([a3 isEqualToString:@"linear"])
  {
    long long v10 = 0uLL;
LABEL_8:
    uint64_t v5 = 0x3FF0000000000000;
    goto LABEL_9;
  }
  if ([a3 isEqualToString:@"easeIn"])
  {
    long long v10 = xmmword_1653F0;
    goto LABEL_8;
  }
  if ([a3 isEqualToString:@"easeOut"])
  {
    long long v10 = 0uLL;
    goto LABEL_3;
  }
  if (![a3 isEqualToString:@"default"])
  {
    *(void *)&long long v10 = CGRectFromCAMLString(a3);
    *((void *)&v10 + 1) = v8;
    uint64_t v11 = v9;
    goto LABEL_10;
  }
  long long v10 = xmmword_1653E0;
  uint64_t v5 = 0x3FD0000000000000;
LABEL_9:
  uint64_t v11 = v5;
  double v6 = 1.0;
LABEL_10:
  double v12 = v6;
  return [(MRCAMLBezierData *)self initWithControlPoints:&v10];
}

- (double)sample_x:(double)a3
{
  return (self->cx + (self->bx + self->ax * a3) * a3) * a3;
}

- (double)sample_y:(double)a3
{
  return (self->cy + (self->by + self->ay * a3) * a3) * a3;
}

- (double)sample_x_derivative:(double)a3
{
  return self->cx + (self->bx + self->bx + self->ax * 3.0 * a3) * a3;
}

- (double)sample_y_derivative:(double)a3
{
  return self->cy + (self->by + self->by + self->ay * 3.0 * a3) * a3;
}

- (double)solve_x:(double)a3 epsilon:(double)a4
{
  int v7 = 8;
  double v8 = a3;
  while (1)
  {
    [(MRCAMLBezierData *)self sample_x:v8];
    double v10 = v9;
    if (vabdd_f64(v9, a3) < a4) {
      break;
    }
    [(MRCAMLBezierData *)self sample_x_derivative:v8];
    if (fabs(v11) >= 0.000001)
    {
      double v8 = v8 - (v10 - a3) / v11;
      if (--v7) {
        continue;
      }
    }
    double v8 = 0.0;
    if (a3 >= 0.0)
    {
      double v8 = 1.0;
      if (a3 <= 1.0)
      {
        double v12 = 0.0;
        double v13 = 1.0;
        int v14 = -1025;
        double v8 = a3;
        do
        {
          if (__CFADD__(v14++, 1)) {
            break;
          }
          [(MRCAMLBezierData *)self sample_x:v8];
          if (vabdd_f64(v16, a3) < a4) {
            break;
          }
          if (v16 >= a3) {
            double v13 = v8;
          }
          else {
            double v12 = v8;
          }
          double v8 = v12 + (v13 - v12) * 0.5;
        }
        while (v12 < v13);
      }
    }
    return v8;
  }
  return v8;
}

- (double)solve_y:(double)a3 epsilon:(double)a4
{
  int v7 = 8;
  double v8 = a3;
  while (1)
  {
    [(MRCAMLBezierData *)self sample_y:v8];
    double v10 = v9;
    if (vabdd_f64(v9, a3) < a4) {
      break;
    }
    [(MRCAMLBezierData *)self sample_y_derivative:v8];
    if (fabs(v11) >= 0.000001)
    {
      double v8 = v8 - (v10 - a3) / v11;
      if (--v7) {
        continue;
      }
    }
    double v8 = 0.0;
    if (a3 >= 0.0)
    {
      double v8 = 1.0;
      if (a3 <= 1.0)
      {
        double v12 = 0.0;
        double v13 = 1.0;
        int v14 = -1025;
        double v8 = a3;
        do
        {
          if (__CFADD__(v14++, 1)) {
            break;
          }
          [(MRCAMLBezierData *)self sample_y:v8];
          if (vabdd_f64(v16, a3) < a4) {
            break;
          }
          if (v16 >= a3) {
            double v13 = v8;
          }
          else {
            double v12 = v8;
          }
          double v8 = v12 + (v13 - v12) * 0.5;
        }
        while (v12 < v13);
      }
    }
    return v8;
  }
  return v8;
}

- (double)evaluatAtTime:(double)a3
{
  [(MRCAMLBezierData *)self solve_x:a3 epsilon:0.00001];
  -[MRCAMLBezierData sample_y:](self, "sample_y:");
  return result;
}

- (double)evaluate_inverseAtTime:(double)a3
{
  [(MRCAMLBezierData *)self solve_y:a3 epsilon:0.00001];
  -[MRCAMLBezierData sample_x:](self, "sample_x:");
  return result;
}

@end