@interface BEBooksObjectJS
- (id)anyFrameJavascript:(int64_t)a3;
- (id)anyFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameOnlyJavascript:(int64_t)a3;
@end

@implementation BEBooksObjectJS

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
    v3 = 0;
  }
  else
  {
    v4 = +[ibooks_object source];
    v3 = +[BESimpleTemplate javascriptStringFromJavascriptSource:v4 replacements:0];
  }

  return v3;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = +[ibooks_object sourceName];
    v3 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
  }

  return v3;
}

@end