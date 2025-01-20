@interface PXAngleNumberFilter
- (double)updatedOutput;
@end

@implementation PXAngleNumberFilter

- (double)updatedOutput
{
  [(PXNumberFilter *)self input];
  double v4 = v3;
  [(PXNumberFilter *)self output];
  for (double i = v4 - v5; v4 - v5 > 3.14159265; double i = v4 - v5)
    double v4 = v4 + -6.28318531;
  if (i < -3.14159265)
  {
    do
      double v4 = v4 + 6.28318531;
    while (v4 - v5 < -3.14159265);
  }
  return v4;
}

@end