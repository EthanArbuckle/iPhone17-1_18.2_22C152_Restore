@interface MFReadableContentMarginCalculator
+ (UIEdgeInsets)readableContentMarginsForWidth:(double)a3 minMargins:(UIEdgeInsets)a4 safeAreaInsets:(UIEdgeInsets)a5;
@end

@implementation MFReadableContentMarginCalculator

+ (UIEdgeInsets)readableContentMarginsForWidth:(double)a3 minMargins:(UIEdgeInsets)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  [MEMORY[0x1E4FB08E0] _readableWidth];
  UIRoundToViewScale();
  if (v9 >= left) {
    double v10 = v9;
  }
  else {
    double v10 = left;
  }
  if (v9 >= right) {
    double v11 = v9;
  }
  else {
    double v11 = right;
  }
  double v12 = fmax(top, 0.0);
  double v13 = fmax(bottom, 0.0);
  result.double right = v11;
  result.double bottom = v13;
  result.double left = v10;
  result.double top = v12;
  return result;
}

@end