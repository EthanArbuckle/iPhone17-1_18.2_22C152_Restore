@interface CopperDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (CopperDomain)init;
- (CopperDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
@end

@implementation CopperDomain

- (BOOL)computeWithError:(id *)a3
{
  v4 = +[MobileAssetManager sharedInstance];
  v5 = [v4 copperAsset];
  if ([v5 isEnabled]) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 2;
  }
  [(EligibilityDomain *)self setAnswer:v6];

  return 1;
}

- (CopperDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CopperDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CopperDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (CopperDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)CopperDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CopperDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.copper";
}

- (unint64_t)domain
{
  return 30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end