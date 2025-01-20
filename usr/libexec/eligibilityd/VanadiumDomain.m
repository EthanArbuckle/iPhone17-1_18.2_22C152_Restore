@interface VanadiumDomain
+ (BOOL)supportsSecureCoding;
- (VanadiumDomain)init;
- (VanadiumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation VanadiumDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 vanadiumAsset];
  v4 = [v3 countryCodes];
  -[EligibilityDomain setLocatedCountriesOfInterest:withGracePeriod:](self, "setLocatedCountriesOfInterest:withGracePeriod:", v4, [v3 gracePeriodInSeconds]);
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (VanadiumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VanadiumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(VanadiumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (VanadiumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)VanadiumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(VanadiumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(VanadiumDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPod", @"iPad", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.vanadium";
}

- (unint64_t)domain
{
  return 24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end