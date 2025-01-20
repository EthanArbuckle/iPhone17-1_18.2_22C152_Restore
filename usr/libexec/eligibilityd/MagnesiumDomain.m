@interface MagnesiumDomain
+ (BOOL)supportsSecureCoding;
- (MagnesiumDomain)init;
- (MagnesiumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation MagnesiumDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 magnesiumAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
}

- (MagnesiumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MagnesiumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(MagnesiumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (MagnesiumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)MagnesiumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MagnesiumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(MagnesiumDomain *)self updateParameters];
  id v3 = +[NSSet setWithObject:@"iPhone"];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.magnesium";
}

- (unint64_t)domain
{
  return 13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end