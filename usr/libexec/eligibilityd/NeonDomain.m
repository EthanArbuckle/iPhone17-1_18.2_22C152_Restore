@interface NeonDomain
+ (BOOL)supportsSecureCoding;
- (NeonDomain)init;
- (NeonDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation NeonDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 neonAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (NeonDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NeonDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(NeonDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (NeonDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)NeonDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NeonDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(NeonDomain *)self updateParameters];
  id v3 = +[NSSet setWithObject:@"iPhone"];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.neon";
}

- (unint64_t)domain
{
  return 11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end