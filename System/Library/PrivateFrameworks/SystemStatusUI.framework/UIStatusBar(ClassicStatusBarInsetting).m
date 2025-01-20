@interface UIStatusBar(ClassicStatusBarInsetting)
+ (uint64_t)_regularPadBaselineOffset;
+ (uint64_t)_regularPadEdgeInsets;
+ (uint64_t)_roundedPadBaselineOffset;
+ (uint64_t)_roundedPadEdgeInsets;
@end

@implementation UIStatusBar(ClassicStatusBarInsetting)

+ (uint64_t)_roundedPadEdgeInsets
{
  return +[STUIStatusBarVisualProvider_RoundedPad edgeInsets];
}

+ (uint64_t)_regularPadEdgeInsets
{
  return +[STUIStatusBarVisualProvider_Pad edgeInsets];
}

+ (uint64_t)_roundedPadBaselineOffset
{
  return +[STUIStatusBarVisualProvider_RoundedPad baselineOffset];
}

+ (uint64_t)_regularPadBaselineOffset
{
  return +[STUIStatusBarVisualProvider_Pad baselineOffset];
}

@end