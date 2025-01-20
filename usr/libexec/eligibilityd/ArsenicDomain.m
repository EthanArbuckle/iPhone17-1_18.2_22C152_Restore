@interface ArsenicDomain
+ (BOOL)supportsSecureCoding;
- (ArsenicDomain)init;
- (ArsenicDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation ArsenicDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 arsenicAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (ArsenicDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ArsenicDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ArsenicDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (ArsenicDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)ArsenicDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ArsenicDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(ArsenicDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPad", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.arsenic";
}

- (unint64_t)domain
{
  return 34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end