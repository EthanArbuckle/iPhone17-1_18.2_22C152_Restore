@interface WebKitStatistics
+ (int)HTMLRepresentationCount;
+ (int)bridgeCount;
+ (int)dataSourceCount;
+ (int)frameCount;
+ (int)viewCount;
+ (int)webViewCount;
@end

@implementation WebKitStatistics

+ (int)webViewCount
{
  return WebViewCount;
}

+ (int)frameCount
{
  return WebFrameCount;
}

+ (int)dataSourceCount
{
  return WebDataSourceCount;
}

+ (int)viewCount
{
  return WebFrameViewCount;
}

+ (int)bridgeCount
{
  return 0;
}

+ (int)HTMLRepresentationCount
{
  return WebHTMLRepresentationCount;
}

@end