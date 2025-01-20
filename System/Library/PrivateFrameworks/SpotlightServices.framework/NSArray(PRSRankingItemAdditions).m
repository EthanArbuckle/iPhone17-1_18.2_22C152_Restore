@interface NSArray(PRSRankingItemAdditions)
- (id)stringRepresentation;
@end

@implementation NSArray(PRSRankingItemAdditions)

- (id)stringRepresentation
{
  uint64_t v2 = [a1 count];
  v3 = objc_opt_new();
  if (v2)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      v5 = [a1 objectAtIndex:i];
      [v3 appendString:v5];

      [v3 appendString:@" "];
    }
  }
  return v3;
}

@end