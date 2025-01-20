@interface NSDictionary(NPKSafeObjects)
- (id)npk_objectForKey:()NPKSafeObjects class:;
@end

@implementation NSDictionary(NPKSafeObjects)

- (id)npk_objectForKey:()NPKSafeObjects class:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

@end