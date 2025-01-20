@interface NSDictionary(_BOOL)
- (uint64_t)wl_BOOLForKey:()_BOOL;
@end

@implementation NSDictionary(_BOOL)

- (uint64_t)wl_BOOLForKey:()_BOOL
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

@end