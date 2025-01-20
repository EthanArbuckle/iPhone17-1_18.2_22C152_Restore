@interface IMThemePageDynamic
- (BOOL)isNight:(id)a3;
- (id)stableIdentifier;
- (int64_t)epubTheme;
@end

@implementation IMThemePageDynamic

- (id)stableIdentifier
{
  return @"epub-dynamic";
}

- (int64_t)epubTheme
{
  return 1;
}

- (BOOL)isNight:(id)a3
{
  v3 = [a3 traitCollection];
  BOOL v4 = [v3 userInterfaceStyle] == (char *)&def_7D91C + 2;

  return v4;
}

@end