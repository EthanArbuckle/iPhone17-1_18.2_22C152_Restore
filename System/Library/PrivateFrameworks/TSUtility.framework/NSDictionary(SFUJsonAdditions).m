@interface NSDictionary(SFUJsonAdditions)
- (uint64_t)appendJsonStringToString:()SFUJsonAdditions;
@end

@implementation NSDictionary(SFUJsonAdditions)

- (uint64_t)appendJsonStringToString:()SFUJsonAdditions
{
  [a3 appendString:@"{"];
  v5 = (void *)[a1 keyEnumerator];
  unint64_t v6 = [a1 count];
  uint64_t v7 = [v5 nextObject];
  if (v7)
  {
    v8 = (void *)v7;
    unint64_t v9 = 1;
    do
    {
      [v8 appendJsonStringToString:a3];
      [a3 appendString:@":"];
      objc_msgSend((id)objc_msgSend(a1, "objectForKey:", v8), "appendJsonStringToString:", a3);
      if (v9 < v6) {
        [a3 appendString:@","];
      }
      v8 = (void *)[v5 nextObject];
      ++v9;
    }
    while (v8);
  }
  return [a3 appendString:@"}"];
}

@end