@interface UISegmentedControlCarPlayStyleProvider
- (BOOL)limitInternalLayoutAndInteractionToDefaultHeight;
- (UIEdgeInsets)alignmentInsetsForControlSize:(int)a3 bounds:(CGRect)a4 traitCollection:(id)a5;
- (double)cornerRadiusForControlSize:(int)a3;
- (double)defaultHeightForControlSize:(int)a3 traitCollection:(id)a4;
@end

@implementation UISegmentedControlCarPlayStyleProvider

- (double)cornerRadiusForControlSize:(int)a3
{
  return 16.0;
}

- (double)defaultHeightForControlSize:(int)a3 traitCollection:(id)a4
{
  return 32.0;
}

- (BOOL)limitInternalLayoutAndInteractionToDefaultHeight
{
  return 1;
}

- (UIEdgeInsets)alignmentInsetsForControlSize:(int)a3 bounds:(CGRect)a4 traitCollection:(id)a5
{
  double v5 = -4.0;
  double v6 = 0.0;
  double v7 = -4.0;
  double v8 = 0.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

@end