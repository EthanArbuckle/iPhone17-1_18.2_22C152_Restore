@interface ChromiumDomain
+ (BOOL)supportsSecureCoding;
- (ChromiumDomain)init;
- (ChromiumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation ChromiumDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 chromiumAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (ChromiumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ChromiumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ChromiumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (ChromiumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)ChromiumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ChromiumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(ChromiumDomain *)self updateParameters];
  id v3 = +[NSSet setWithObject:@"iPhone"];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.chromium";
}

- (unint64_t)domain
{
  return 25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end