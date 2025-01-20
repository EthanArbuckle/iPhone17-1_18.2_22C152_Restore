@interface _SBUISystemApertureCAPackageView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)intrinsicPackageSize;
- (uint64_t)setIntrinsicPackageSize:(double)a3;
@end

@implementation _SBUISystemApertureCAPackageView

- (double)intrinsicPackageSize
{
  if (a1) {
    return *(double *)(a1 + 480);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setIntrinsicPackageSize:(double)a3
{
  if (result)
  {
    *(double *)(result + 480) = a2;
    *(double *)(result + 488) = a3;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self)
  {
    double width = self->_intrinsicPackageSize.width;
    double height = self->_intrinsicPackageSize.height;
  }
  else
  {
    double height = 0.0;
    double width = 0.0;
  }
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v10.receiver = self;
    v10.super_class = (Class)_SBUISystemApertureCAPackageView;
    -[BSUICAPackageView sizeThatFits:](&v10, sel_sizeThatFits_, a3.width, a3.height, height);
    double width = v6;
    double height = v7;
  }
  double v8 = width;
  double v9 = height;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  if (self)
  {
    double width = self->_intrinsicPackageSize.width;
    double height = self->_intrinsicPackageSize.height;
  }
  else
  {
    double height = 0.0;
    double width = 0.0;
  }
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v5.receiver = self;
    v5.super_class = (Class)_SBUISystemApertureCAPackageView;
    [(_SBUISystemApertureCAPackageView *)&v5 intrinsicContentSize];
  }
  result.double height = height;
  result.double width = width;
  return result;
}

@end