@interface SearchUICapsuleButtonItemView
- (double)horizontalPadding;
- (double)spacingBetweenImageAndText;
- (double)verticalPaddingFontMultipler;
- (id)accessibilityIdentifier;
- (id)defaultButtonFont;
- (int64_t)symbolScale;
@end

@implementation SearchUICapsuleButtonItemView

- (id)defaultButtonFont
{
  if ([(SearchUIButtonItemView *)self isCompact]) {
    [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  }
  else {
  v2 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB2950] isShort:0 fontWeight:*MEMORY[0x1E4FB09D0]];
  }
  return v2;
}

- (double)verticalPaddingFontMultipler
{
  BOOL v2 = [(SearchUIButtonItemView *)self isCompact];
  double result = 1.54;
  if (v2) {
    return 1.96;
  }
  return result;
}

- (double)horizontalPadding
{
  BOOL v2 = [(SearchUIButtonItemView *)self isCompact];
  double result = 18.0;
  if (v2) {
    return 14.0;
  }
  return result;
}

- (int64_t)symbolScale
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUICapsuleButtonItemView;
  return [(SearchUIButtonItemView *)&v3 symbolScale];
}

- (double)spacingBetweenImageAndText
{
  return 4.0;
}

- (id)accessibilityIdentifier
{
  return @"capsule-button";
}

@end