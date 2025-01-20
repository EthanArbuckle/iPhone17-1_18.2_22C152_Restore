@interface MolybdenumDomain
+ (BOOL)supportsSecureCoding;
- (MolybdenumDomain)init;
- (MolybdenumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation MolybdenumDomain

- (void)updateParameters
{
  v3 = +[NSSet setWithObject:@"US-UT"];
  [(EligibilityDomain *)self setInitialSetupLocationsOfInterest:v3 isInverted:0];

  [(EligibilityDomain *)self setAgeLimitOfInterest:&off_10003C768 isInverted:1];
}

- (MolybdenumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MolybdenumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(MolybdenumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (MolybdenumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)MolybdenumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MolybdenumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(MolybdenumDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPad", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.molybdenum";
}

- (unint64_t)domain
{
  return 43;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end