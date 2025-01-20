@interface CalciumDomain
+ (BOOL)supportsSecureCoding;
- (CalciumDomain)init;
- (CalciumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
@end

@implementation CalciumDomain

- (CalciumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CalciumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CalciumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (CalciumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)CalciumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CalciumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  id v3 = +[NSSet setWithObject:@"CH"];
  [(EligibilityDomain *)self setDeviceRegionCodesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.calcium";
}

- (unint64_t)domain
{
  return 21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end