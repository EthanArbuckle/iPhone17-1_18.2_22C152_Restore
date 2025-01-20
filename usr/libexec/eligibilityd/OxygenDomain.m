@interface OxygenDomain
+ (BOOL)supportsSecureCoding;
- (OxygenDomain)init;
- (OxygenDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation OxygenDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 oxygenAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (OxygenDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OxygenDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(OxygenDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (OxygenDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)OxygenDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(OxygenDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(OxygenDomain *)self updateParameters];
  id v3 = +[NSSet setWithObject:@"iPhone"];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.oxygen";
}

- (unint64_t)domain
{
  return 9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end