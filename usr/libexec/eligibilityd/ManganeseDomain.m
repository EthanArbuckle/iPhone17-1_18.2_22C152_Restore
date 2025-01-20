@interface ManganeseDomain
+ (BOOL)supportsSecureCoding;
- (ManganeseDomain)init;
- (ManganeseDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation ManganeseDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 manganeseAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (ManganeseDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ManganeseDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ManganeseDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (ManganeseDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)ManganeseDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ManganeseDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(ManganeseDomain *)self updateParameters];
  id v3 = +[NSSet setWithObject:@"iPhone"];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.manganese";
}

- (unint64_t)domain
{
  return 26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end