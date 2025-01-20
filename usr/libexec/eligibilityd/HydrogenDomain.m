@interface HydrogenDomain
+ (BOOL)supportsSecureCoding;
- (HydrogenDomain)init;
- (HydrogenDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation HydrogenDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 hydrogenAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (HydrogenDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HydrogenDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(HydrogenDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (HydrogenDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)HydrogenDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HydrogenDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(HydrogenDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPad", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.hydrogen";
}

- (unint64_t)domain
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end