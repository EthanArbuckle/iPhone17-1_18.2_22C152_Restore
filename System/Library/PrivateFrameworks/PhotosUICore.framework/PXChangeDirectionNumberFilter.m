@interface PXChangeDirectionNumberFilter
- (PXChangeDirectionNumberFilter)initWithInput:(double)a3;
- (double)initialOutputForInput:(double)a3;
- (double)minimumChange;
- (double)updatedOutput;
- (void)setMinimumChange:(double)a3;
@end

@implementation PXChangeDirectionNumberFilter

- (void)setMinimumChange:(double)a3
{
  self->_minimumChange = a3;
}

- (PXChangeDirectionNumberFilter)initWithInput:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXChangeDirectionNumberFilter;
  result = -[PXNumberFilter initWithInput:](&v5, sel_initWithInput_);
  if (result) {
    result->_threshold = a3;
  }
  return result;
}

- (double)initialOutputForInput:(double)a3
{
  return 0.0;
}

- (double)minimumChange
{
  return self->_minimumChange;
}

- (double)updatedOutput
{
  [(PXNumberFilter *)self input];
  double v4 = v3;
  [(PXNumberFilter *)self output];
  double v6 = v5;
  [(PXChangeDirectionNumberFilter *)self minimumChange];
  if (v6 == 0.0 && (double threshold = self->_threshold, vabdd_f64(v4, threshold) > v7))
  {
    double v6 = 1.0;
  }
  else if (v6 >= 0.0)
  {
    if (v6 <= 0.0) {
      return v6;
    }
    double threshold = self->_threshold;
  }
  else
  {
    double threshold = self->_threshold;
    if (v4 > threshold)
    {
      double v6 = 1.0;
LABEL_11:
      double v10 = v4 - v7;
      if (threshold >= v10) {
        double v10 = threshold;
      }
      self->_double threshold = v10;
      return v6;
    }
    if (v6 <= 0.0)
    {
      double v9 = v6;
      goto LABEL_15;
    }
  }
  double v9 = -1.0;
  if (v4 >= threshold) {
    goto LABEL_11;
  }
LABEL_15:
  double v11 = v4 + v7;
  if (threshold < v11) {
    double v11 = threshold;
  }
  self->_double threshold = v11;
  return v9;
}

@end