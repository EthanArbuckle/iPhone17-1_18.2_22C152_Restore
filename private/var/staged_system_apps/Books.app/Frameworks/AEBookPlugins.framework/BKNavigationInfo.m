@interface BKNavigationInfo
+ (BOOL)isExcludedFromSampleHash:(id)a3;
+ (id)newEmptyNavigationInfo:(id)a3;
- (BOOL)isExcludedFromSample;
@end

@implementation BKNavigationInfo

+ (id)newEmptyNavigationInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 newByClass:objc_opt_class()];

  return v4;
}

+ (BOOL)isExcludedFromSampleHash:(id)a3
{
  return ![a3 rangeOfString:@"com_apple_itunes_epub_end"]
      && v3 == [@"com_apple_itunes_epub_end" length];
}

- (BOOL)isExcludedFromSample
{
  v2 = [(BKNavigationInfo *)self href];
  id v3 = [v2 URLFragmentString];

  if (v3) {
    BOOL v4 = +[BKNavigationInfo isExcludedFromSampleHash:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end