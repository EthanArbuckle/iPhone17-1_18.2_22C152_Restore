@interface _UIContentUnavailableViewTV
- (CGSize)_buttonSize;
- (double)_buttonAlpha;
- (double)_buttonVerticalSpacing;
- (double)_labelAlpha;
- (double)_labelVerticalSpacing;
- (id)_buttonBackgroundImageForStyle:(unint64_t)a3 controlState:(unint64_t)a4;
- (id)_buttonFont;
- (id)_titleFont;
@end

@implementation _UIContentUnavailableViewTV

- (id)_buttonBackgroundImageForStyle:(unint64_t)a3 controlState:(unint64_t)a4
{
  return 0;
}

- (id)_titleFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
}

- (double)_labelAlpha
{
  return 0.6;
}

- (double)_buttonAlpha
{
  return 1.0;
}

- (id)_buttonFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
}

- (CGSize)_buttonSize
{
  double v2 = 390.0;
  double v3 = 72.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_labelVerticalSpacing
{
  return 68.0;
}

- (double)_buttonVerticalSpacing
{
  return 89.0;
}

@end