@interface NSLayoutConstraint
- (void)_baselineLoweringInfoForFirstItem:(void *)result;
@end

@implementation NSLayoutConstraint

- (void)_baselineLoweringInfoForFirstItem:(void *)result
{
  if (!result) {
    return result;
  }
  v2 = result;
  if (a2)
  {
    if ([result firstAttribute] - 11 < 2)
    {
      id AssociatedObject = objc_getAssociatedObject(v2, &unk_1EB25A5B4);
      result = (void *)[AssociatedObject count];
      if (result)
      {
        v4 = (void *)[AssociatedObject objectAtIndexedSubscript:0];
        if (objc_msgSend(v4, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"))) {
          return 0;
        }
        else {
          return v4;
        }
      }
      return result;
    }
    return 0;
  }
  if ([result secondAttribute] - 11 >= 2) {
    return 0;
  }
  id v5 = objc_getAssociatedObject(v2, &unk_1EB25A5B4);
  if ([v5 count] != 2) {
    return 0;
  }
  return (void *)[v5 objectAtIndexedSubscript:1];
}

@end