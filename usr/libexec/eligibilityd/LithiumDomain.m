@interface LithiumDomain
+ (BOOL)supportsSecureCoding;
- (LithiumDomain)init;
- (LithiumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation LithiumDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 lithiumAsset];
  v4 = [v3 countryCodes];
  -[EligibilityDomain setLocatedCountriesOfInterest:withGracePeriod:](self, "setLocatedCountriesOfInterest:withGracePeriod:", v4, [v3 gracePeriodInSeconds]);
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (LithiumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LithiumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(LithiumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (LithiumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)LithiumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(LithiumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(LithiumDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPad", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.lithium";
}

- (unint64_t)domain
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end