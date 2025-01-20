@interface RubidiumDomain
+ (BOOL)supportsSecureCoding;
- (RubidiumDomain)init;
- (RubidiumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)defaultAnswer;
- (unint64_t)domain;
- (void)updateParameters;
@end

@implementation RubidiumDomain

- (void)updateParameters
{
  id v6 = +[MobileAssetManager sharedInstance];
  v3 = [v6 rubidiumAsset];
  v4 = [v3 regionSKUs];
  [(EligibilityDomain *)self setDeviceRegionCodesOfInterest:v4 isInverted:1];

  v5 = [v3 countryCodes];
  [(EligibilityDomain *)self setDeviceLocalesOfInterest:v5];
}

- (RubidiumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RubidiumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RubidiumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (RubidiumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)RubidiumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(RubidiumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (unint64_t)defaultAnswer
{
  return 4;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.rubidium";
}

- (unint64_t)domain
{
  return 38;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end