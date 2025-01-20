@interface NSDictionary(UICollectionAdditions)
- (uint64_t)_BOOLForKey:()UICollectionAdditions;
@end

@implementation NSDictionary(UICollectionAdditions)

- (uint64_t)_BOOLForKey:()UICollectionAdditions
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (!v1) {
    return 0;
  }
  v2 = (void *)v1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v2 isEqual:@"YES"]) {
      return 1;
    }
    uint64_t v5 = [v2 length];
    uint64_t v3 = 1;
    if (objc_msgSend(v2, "compare:options:range:", @"YES", 1, 0, v5))
    {
      uint64_t v3 = 1;
      if (objc_msgSend(v2, "compare:options:range:", @"Y", 1, 0, v5)) {
        return [v2 intValue] != 0;
      }
    }
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

@end