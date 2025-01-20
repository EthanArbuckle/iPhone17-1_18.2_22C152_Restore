@interface AluminumDomain
+ (BOOL)supportsSecureCoding;
- (AluminumDomain)init;
- (AluminumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation AluminumDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 aluminumAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (AluminumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AluminumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AluminumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (AluminumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)AluminumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AluminumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(AluminumDomain *)self updateParameters];
  id v3 = +[NSSet setWithObject:@"iPhone"];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.aluminum";
}

- (unint64_t)domain
{
  return 14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end