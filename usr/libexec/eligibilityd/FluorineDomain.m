@interface FluorineDomain
+ (BOOL)supportsSecureCoding;
- (FluorineDomain)init;
- (FluorineDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation FluorineDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 fluorineAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (FluorineDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FluorineDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(FluorineDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (FluorineDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)FluorineDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FluorineDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(FluorineDomain *)self updateParameters];
  id v3 = +[NSSet setWithObject:@"iPhone"];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.fluorine";
}

- (unint64_t)domain
{
  return 10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end