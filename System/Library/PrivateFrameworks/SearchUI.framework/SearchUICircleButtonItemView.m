@interface SearchUICircleButtonItemView
- (BOOL)drawsBackgroundPlatter;
- (BOOL)drawsIconBackgroundPlatter;
- (BOOL)drawsTitle;
- (BOOL)useContinuousCorners;
- (id)accessibilityIdentifier;
- (id)defaultButtonFont;
- (int64_t)symbolScale;
@end

@implementation SearchUICircleButtonItemView

- (id)defaultButtonFont
{
  if ([MEMORY[0x1E4FAE198] isMacOS])
  {
    if ([(SearchUIButtonItemView *)self isCompact]) {
      [MEMORY[0x1E4FB08E0] systemFontOfSize:8.0];
    }
    else {
    v3 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SearchUICircleButtonItemView;
    v3 = [(SearchUIButtonItemView *)&v5 defaultButtonFont];
  }
  return v3;
}

- (int64_t)symbolScale
{
  if ([MEMORY[0x1E4FAE198] isMacOS])
  {
    v4.receiver = self;
    v4.super_class = (Class)SearchUICircleButtonItemView;
    return [(SearchUIButtonItemView *)&v4 symbolScale];
  }
  else if ([(SearchUIButtonItemView *)self isCompact])
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

- (BOOL)useContinuousCorners
{
  return 0;
}

- (BOOL)drawsTitle
{
  return 0;
}

- (BOOL)drawsBackgroundPlatter
{
  return 0;
}

- (BOOL)drawsIconBackgroundPlatter
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return @"circle-button";
}

@end