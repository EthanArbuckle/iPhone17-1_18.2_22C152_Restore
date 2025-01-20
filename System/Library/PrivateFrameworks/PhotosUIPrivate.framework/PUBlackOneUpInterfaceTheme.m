@interface PUBlackOneUpInterfaceTheme
- (id)photoBrowserChromeVisibleBackgroundColor;
- (id)photoBrowserSpotlightThemeColor;
- (id)photoBrowserTitleViewTappableTextColor;
- (id)photoBrowserTitleViewTextColor;
- (id)playheadBackgroundColor;
- (id)playheadColor;
- (id)playheadOutlineColor;
- (id)scrubberPlaceholderColor;
- (int64_t)photoBrowserBarStyle;
@end

@implementation PUBlackOneUpInterfaceTheme

- (id)scrubberPlaceholderColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.140000001 alpha:1.0];
}

- (id)photoBrowserChromeVisibleBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] blackColor];
}

- (id)photoBrowserTitleViewTappableTextColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (id)photoBrowserSpotlightThemeColor
{
  return 0;
}

- (id)photoBrowserTitleViewTextColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (int64_t)photoBrowserBarStyle
{
  return 1;
}

- (id)playheadBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] clearColor];
}

- (id)playheadOutlineColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
}

- (id)playheadColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

@end