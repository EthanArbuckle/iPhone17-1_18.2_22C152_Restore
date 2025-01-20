@interface NSDictionary(String)
- (id)wl_stringForKey:()String;
@end

@implementation NSDictionary(String)

- (id)wl_stringForKey:()String
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
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