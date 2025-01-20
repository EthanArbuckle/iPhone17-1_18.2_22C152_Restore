@interface NSArray(SFUJsonAdditions)
- (uint64_t)sfu_appendJsonStringToString:()SFUJsonAdditions;
@end

@implementation NSArray(SFUJsonAdditions)

- (uint64_t)sfu_appendJsonStringToString:()SFUJsonAdditions
{
  [a3 appendString:@"["];
  uint64_t v5 = [a1 count];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = 0;
    do
    {
      objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", v7++), "sfu_appendJsonStringToString:", a3);
      if (v7 < v6) {
        [a3 appendString:@","];
      }
    }
    while (v6 != v7);
  }
  return [a3 appendString:@"]"];
}

@end