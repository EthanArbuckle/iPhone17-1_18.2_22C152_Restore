@interface NitrogenDomain
+ (BOOL)supportsSecureCoding;
- (NitrogenDomain)init;
- (NitrogenDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation NitrogenDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 nitrogenAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (NitrogenDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NitrogenDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(NitrogenDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (NitrogenDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)NitrogenDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NitrogenDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(NitrogenDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPad", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.nitrogen";
}

- (unint64_t)domain
{
  return 8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end