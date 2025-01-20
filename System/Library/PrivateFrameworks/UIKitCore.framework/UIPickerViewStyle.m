@interface UIPickerViewStyle
@end

@implementation UIPickerViewStyle

UIColor *__52___UIPickerViewStyle_tvOS_createCenterHighlightView__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInterfaceStyle];
  BOOL v3 = v2 == 1000 || v2 == 2;
  double v4 = 1.0;
  if (v3) {
    double v4 = 0.2;
  }
  return +[UIColor colorWithWhite:1.0 alpha:v4];
}

@end