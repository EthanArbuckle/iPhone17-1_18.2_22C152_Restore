@interface CALayer(UIPageCurlAdditions)
- (uint64_t)uiHasFilterWithName:()UIPageCurlAdditions;
@end

@implementation CALayer(UIPageCurlAdditions)

- (uint64_t)uiHasFilterWithName:()UIPageCurlAdditions
{
  id v4 = a3;
  v5 = [a1 filters];
  v6 = [v5 valueForKey:@"name"];
  uint64_t v7 = [v6 containsObject:v4];

  return v7;
}

@end