@interface SearchUICircleWithLabelButtonItemView
- (BOOL)drawsTitle;
- (id)accessibilityIdentifier;
- (id)buttonFont;
- (id)iconFont;
@end

@implementation SearchUICircleWithLabelButtonItemView

- (id)buttonFont
{
  v2 = (void *)MEMORY[0x1E4FAE090];
  uint64_t v3 = *MEMORY[0x1E4FB28E0];
  int v4 = [MEMORY[0x1E4FAE198] isMacOS];
  v5 = (double *)MEMORY[0x1E4FB09D0];
  if (!v4) {
    v5 = (double *)MEMORY[0x1E4FB09E0];
  }
  double v6 = *v5;
  return (id)[v2 cachedFontForTextStyle:v3 isShort:0 fontWeight:v6];
}

- (id)iconFont
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUICircleWithLabelButtonItemView;
  v2 = [(SearchUIButtonItemView *)&v4 buttonFont];
  return v2;
}

- (BOOL)drawsTitle
{
  return ![(SearchUIButtonItemView *)self isCompact];
}

- (id)accessibilityIdentifier
{
  return @"circle-label-button";
}

@end