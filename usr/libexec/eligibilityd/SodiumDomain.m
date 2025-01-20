@interface SodiumDomain
+ (BOOL)supportsSecureCoding;
- (SodiumDomain)init;
- (SodiumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation SodiumDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 sodiumAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (SodiumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SodiumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(SodiumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (SodiumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)SodiumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SodiumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(SodiumDomain *)self updateParameters];
  id v3 = +[NSSet setWithObject:@"iPhone"];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.sodium";
}

- (unint64_t)domain
{
  return 12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end