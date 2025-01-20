@interface IMThemePageWhite
- (IMThemePageWhite)init;
- (id)stableIdentifier;
- (int64_t)epubTheme;
@end

@implementation IMThemePageWhite

- (IMThemePageWhite)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMThemePageWhite;
  v2 = [(IMThemePage *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(IMTheme *)v2 setAnnotationPageTheme:0];
    [(IMTheme *)v3 setKeyboardAppearance:2];
    [(IMTheme *)v3 setOverlayContentBackgroundColor:1];
  }
  return v3;
}

- (id)stableIdentifier
{
  return @"epub-white";
}

- (int64_t)epubTheme
{
  return 2;
}

@end