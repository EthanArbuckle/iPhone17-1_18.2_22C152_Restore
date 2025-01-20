@interface LSPropertyList(Entitlements)
- (uint64_t)ses_isEntitled:()Entitlements;
@end

@implementation LSPropertyList(Entitlements)

- (uint64_t)ses_isEntitled:()Entitlements
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4 ofClass:objc_opt_class()];

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

@end