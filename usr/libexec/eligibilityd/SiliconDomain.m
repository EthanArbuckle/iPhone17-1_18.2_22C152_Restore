@interface SiliconDomain
+ (BOOL)supportsSecureCoding;
- (SiliconDomain)init;
- (SiliconDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation SiliconDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 siliconAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (SiliconDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiliconDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(SiliconDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (SiliconDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)SiliconDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SiliconDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(SiliconDomain *)self updateParameters];
  id v3 = +[NSSet setWithObject:@"iPhone"];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.silicon";
}

- (unint64_t)domain
{
  return 15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end