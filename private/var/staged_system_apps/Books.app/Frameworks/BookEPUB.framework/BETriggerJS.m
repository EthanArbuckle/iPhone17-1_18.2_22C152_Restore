@interface BETriggerJS
- (id)anyFrameJavascript:(int64_t)a3;
- (id)anyFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameOnlyJavascript:(int64_t)a3;
@end

@implementation BETriggerJS

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  if (a3 == 1)
  {
    v5 = +[epub_trigger source];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = +[epub_trigger sourceName];
    uint64_t v4 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  return 0;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  return 0;
}

@end