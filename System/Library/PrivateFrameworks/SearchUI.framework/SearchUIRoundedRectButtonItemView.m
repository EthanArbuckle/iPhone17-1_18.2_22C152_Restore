@interface SearchUIRoundedRectButtonItemView
- (double)cornerRadius;
- (double)horizontalPadding;
- (double)verticalPaddingFontMultipler;
- (id)accessibilityIdentifier;
@end

@implementation SearchUIRoundedRectButtonItemView

- (double)horizontalPadding
{
  int v2 = [MEMORY[0x1E4FAE198] isMacOS];
  double result = 12.0;
  if (v2) {
    return 15.0;
  }
  return result;
}

- (double)verticalPaddingFontMultipler
{
  int v2 = [MEMORY[0x1E4FAE198] isMacOS];
  double result = 2.45;
  if (v2) {
    return 1.75;
  }
  return result;
}

- (double)cornerRadius
{
  v3 = (void *)MEMORY[0x1E4FAE100];
  if ([MEMORY[0x1E4FAE198] isMacOS]) {
    double v4 = 5.0;
  }
  else {
    double v4 = 10.0;
  }
  v5 = [(SearchUIButtonItemView *)self buttonFont];
  if (v5)
  {
    [v3 scaledValueForValue:v5 withFont:self view:v4];
    double v7 = v6;
  }
  else
  {
    v8 = [(SearchUIButtonItemView *)self defaultButtonFont];
    [v3 scaledValueForValue:v8 withFont:self view:v4];
    double v7 = v9;
  }
  return v7;
}

- (id)accessibilityIdentifier
{
  return @"roundedRect-button";
}

@end