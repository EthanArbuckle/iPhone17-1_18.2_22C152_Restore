@interface WebView(WebPrivate)
- (void)_commonInitializationWithFrameName:()WebPrivate groupName:;
- (void)initSimpleHTMLDocumentWithStyle:()WebPrivate frame:preferences:groupName:;
@end

@implementation WebView(WebPrivate)

- (void)_commonInitializationWithFrameName:()WebPrivate groupName:
{
  result = (void *)WTF::fastMalloc((WTF *)0x20);
  void *result = &unk_1F3C7A3E0;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  *a1 = result;
  return result;
}

- (void)initSimpleHTMLDocumentWithStyle:()WebPrivate frame:preferences:groupName:
{
  result = (void *)WTF::fastMalloc((WTF *)0x20);
  void *result = &unk_1F3C7A3E0;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  *a1 = result;
  return result;
}

@end