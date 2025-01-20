@interface BEImageFilteringJS
- (id)anyFrameJavascript:(int64_t)a3;
- (id)anyFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameOnlyJavascript:(int64_t)a3;
@end

@implementation BEImageFilteringJS

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  return 0;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  return 0;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  if (a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = +[image_filtering source];
  }
  return v5;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  if (a3)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = +[image_filtering sourceName];
    uint64_t v3 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
  }

  return v3;
}

@end