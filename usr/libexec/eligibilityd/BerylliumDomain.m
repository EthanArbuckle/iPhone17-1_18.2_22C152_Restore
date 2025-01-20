@interface BerylliumDomain
+ (BOOL)supportsSecureCoding;
- (BerylliumDomain)init;
- (BerylliumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation BerylliumDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 berylliumAsset];
  v4 = [v3 countryCodes];
  -[EligibilityDomain setLocatedCountriesOfInterest:withGracePeriod:](self, "setLocatedCountriesOfInterest:withGracePeriod:", v4, [v3 gracePeriodInSeconds]);
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (BerylliumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BerylliumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(BerylliumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (BerylliumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)BerylliumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BerylliumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(BerylliumDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPad", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.beryllium";
}

- (unint64_t)domain
{
  return 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end