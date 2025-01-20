@interface NSTextCheckingResult(PhotosUIFoundation)
- (id)px_matchAtIndex:()PhotosUIFoundation forString:;
@end

@implementation NSTextCheckingResult(PhotosUIFoundation)

- (id)px_matchAtIndex:()PhotosUIFoundation forString:
{
  id v6 = a4;
  uint64_t v7 = [a1 rangeAtIndex:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v9 = objc_msgSend(v6, "substringWithRange:", v7, v8);
  }

  return v9;
}

@end