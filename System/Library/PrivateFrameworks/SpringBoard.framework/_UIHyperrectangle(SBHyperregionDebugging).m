@interface _UIHyperrectangle(SBHyperregionDebugging)
- (double)sb_debugFrame;
- (double)sb_debugSize;
@end

@implementation _UIHyperrectangle(SBHyperregionDebugging)

- (double)sb_debugFrame
{
  double v2 = *(double *)[a1 _minimumPoint];
  objc_msgSend(a1, "sb_debugSize");
  return v2;
}

- (double)sb_debugSize
{
  double v2 = (double *)[a1 _minimumPoint];
  double v3 = *(double *)[a1 _maximumPoint] - *v2;
  if (BSFloatIsZero()) {
    double v3 = 20.0;
  }
  BSFloatIsZero();
  return v3;
}

@end