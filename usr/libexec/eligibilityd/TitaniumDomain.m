@interface TitaniumDomain
+ (BOOL)supportsSecureCoding;
- (TitaniumDomain)init;
- (TitaniumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation TitaniumDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 titaniumAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (TitaniumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TitaniumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(TitaniumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (TitaniumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)TitaniumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TitaniumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(TitaniumDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPad", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.titanium";
}

- (unint64_t)domain
{
  return 23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end