@interface CobaltDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (CobaltDomain)init;
- (CobaltDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)defaultAnswer;
- (unint64_t)domain;
- (void)updateParameters;
@end

@implementation CobaltDomain

- (BOOL)computeWithError:(id *)a3
{
  v5 = [(EligibilityDomain *)self status];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"];
    unsigned int v8 = [v7 unsignedIntValue];

    v9 = [v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"];
    unsigned int v10 = [v9 unsignedIntValue];

    if (v10 != 3 && v8 == 2) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 4;
    }
    [(EligibilityDomain *)self setAnswer:v12];
    id v13 = 0;
  }
  else
  {
    v14 = sub_10000D0EC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136315138;
      v17 = "-[CobaltDomain computeWithError:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s: Failed to get status for Cobalt domain", (uint8_t *)&v16, 0xCu);
    }

    id v13 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:93 userInfo:0];
    [(EligibilityDomain *)self setAnswer:0];
    if (a3)
    {
      id v13 = v13;
      *a3 = v13;
    }
  }

  return v6 != 0;
}

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 cobaltAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4 isInverted:1];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4 isInverted:1];
}

- (CobaltDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CobaltDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CobaltDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (CobaltDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)CobaltDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CobaltDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (unint64_t)defaultAnswer
{
  return 4;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.cobalt";
}

- (unint64_t)domain
{
  return 28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end