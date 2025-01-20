@interface NSDictionary(Integer)
- (uint64_t)wl_integerForKey:()Integer;
@end

@implementation NSDictionary(Integer)

- (uint64_t)wl_integerForKey:()Integer
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    uint64_t v2 = [v1 integerValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

@end