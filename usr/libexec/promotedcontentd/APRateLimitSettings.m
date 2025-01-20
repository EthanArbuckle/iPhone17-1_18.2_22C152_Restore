@interface APRateLimitSettings
+ (id)storageWithDefaultValues:(id)a3;
- (APRateLimits)rateLimitsObject;
- (void)setRateLimitsObject:(id)a3;
@end

@implementation APRateLimitSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)APSettingsStorageKeychain) initWithDefaultValues:v3];

  return v4;
}

- (APRateLimits)rateLimitsObject
{
  v2 = [(APRateLimitSettings *)self rateLimits];
  if (v2) {
    id v3 = sub_1000986E8((id *)[APRateLimits alloc], v2);
  }
  else {
    id v3 = 0;
  }

  return (APRateLimits *)v3;
}

- (void)setRateLimitsObject:(id)a3
{
  sub_100098760(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(APRateLimitSettings *)self setRateLimits:v4];
}

@end