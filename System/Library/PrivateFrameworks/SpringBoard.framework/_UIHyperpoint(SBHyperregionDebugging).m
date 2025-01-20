@interface _UIHyperpoint(SBHyperregionDebugging)
- (double)sb_debugFrame;
- (double)sb_debugSize;
@end

@implementation _UIHyperpoint(SBHyperregionDebugging)

- (double)sb_debugFrame
{
  double v2 = *(double *)[a1 _value];
  objc_msgSend(a1, "sb_debugSize");
  return v2 - v3 * 0.5;
}

- (double)sb_debugSize
{
  return 20.0;
}

@end