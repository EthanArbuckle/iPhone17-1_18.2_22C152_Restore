@interface MPMediaChapter
- (NSString)bk_UTF8Title;
@end

@implementation MPMediaChapter

- (NSString)bk_UTF8Title
{
  v3 = [(MPMediaChapter *)self title];
  id v4 = [(MPMediaChapter *)self title];
  id v5 = [v4 cStringUsingEncoding:30];

  if (v5)
  {
    id v6 = [objc_alloc((Class)NSString) initWithCString:v5 encoding:4];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;

      v3 = v8;
    }
  }

  return (NSString *)v3;
}

@end