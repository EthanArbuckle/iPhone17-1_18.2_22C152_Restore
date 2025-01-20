@interface ZincDomain
+ (BOOL)supportsSecureCoding;
- (ZincDomain)init;
- (ZincDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)updateParameters;
@end

@implementation ZincDomain

- (void)updateParameters
{
  id v4 = +[NSSet setWithObject:@"ko"];
  [(EligibilityDomain *)self setDeviceLanguagesOfInterest:v4];
  v3 = +[NSSet setWithObject:@"KR"];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v3];
}

- (ZincDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ZincDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(ZincDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (ZincDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)ZincDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ZincDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.zinc";
}

- (unint64_t)domain
{
  return 31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end