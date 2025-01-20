@interface NSMutableDictionary(SwipeSelectionConvenience)
- (uint64_t)pu_containsIndexPath:()SwipeSelectionConvenience;
@end

@implementation NSMutableDictionary(SwipeSelectionConvenience)

- (uint64_t)pu_containsIndexPath:()SwipeSelectionConvenience
{
  id v4 = a3;
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "section"));
  v6 = [a1 objectForKey:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = objc_msgSend(v7, "containsIndex:", objc_msgSend(v4, "item"));
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end