@interface NSDictionary(Goodies)
- (uint64_t)mf_BOOLForKey:()Goodies;
- (uint64_t)mf_integerForKey:()Goodies;
@end

@implementation NSDictionary(Goodies)

- (uint64_t)mf_BOOLForKey:()Goodies
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [v1 uppercaseString];
    uint64_t v3 = [v2 isEqualToString:@"YES"];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v4 = [v1 intValue] == 0;
    }
    else {
      BOOL v4 = v1 == 0;
    }
    uint64_t v3 = !v4;
  }

  return v3;
}

- (uint64_t)mf_integerForKey:()Goodies
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    uint64_t v2 = [v1 intValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

@end