@interface LotXDomain
+ (BOOL)supportsSecureCoding;
- (LotXDomain)init;
- (LotXDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)updateParameters;
@end

@implementation LotXDomain

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 lotXAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4];
}

- (LotXDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LotXDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(LotXDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (LotXDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)LotXDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(LotXDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.lotx";
}

- (unint64_t)domain
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end