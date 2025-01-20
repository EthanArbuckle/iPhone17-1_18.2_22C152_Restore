@interface UIFont(StocksUICoreText)
- (double)su_languageAwareOutsetsAtScale:()StocksUICoreText;
@end

@implementation UIFont(StocksUICoreText)

- (double)su_languageAwareOutsetsAtScale:()StocksUICoreText
{
  CTFontGetLanguageAwareOutsets();
  UICeilToScale();
  double v2 = -v0;
  UICeilToScale();
  UICeilToScale();
  UICeilToScale();
  return v2;
}

@end