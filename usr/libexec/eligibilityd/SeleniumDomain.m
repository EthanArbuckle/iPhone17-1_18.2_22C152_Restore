@interface SeleniumDomain
+ (BOOL)supportsSecureCoding;
- (SeleniumDomain)init;
- (SeleniumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation SeleniumDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 seleniumAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (SeleniumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SeleniumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(SeleniumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (SeleniumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)SeleniumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SeleniumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(SeleniumDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPad", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.selenium";
}

- (unint64_t)domain
{
  return 35;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end