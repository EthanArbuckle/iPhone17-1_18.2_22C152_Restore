@interface GalliumDomain
+ (BOOL)supportsSecureCoding;
- (GalliumDomain)init;
- (GalliumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation GalliumDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 galliumAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (GalliumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GalliumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(GalliumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (GalliumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)GalliumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GalliumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(GalliumDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPad", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.gallium";
}

- (unint64_t)domain
{
  return 32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end