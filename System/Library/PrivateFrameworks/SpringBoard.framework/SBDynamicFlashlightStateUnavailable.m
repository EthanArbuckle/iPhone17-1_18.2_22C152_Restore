@interface SBDynamicFlashlightStateUnavailable
- (BOOL)isEqual:(id)a3;
- (BOOL)isOn;
- (BOOL)isUnavailable;
- (NSString)description;
@end

@implementation SBDynamicFlashlightStateUnavailable

- (BOOL)isOn
{
  return 0;
}

- (BOOL)isUnavailable
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();

  return v4 == v5;
}

- (NSString)description
{
  return (NSString *)@"<unavailable>";
}

@end