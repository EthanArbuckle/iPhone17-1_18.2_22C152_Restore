@interface IronDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (IronDomain)init;
- (IronDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation IronDomain

- (BOOL)computeWithError:(id *)a3
{
  v5 = [(EligibilityDomain *)self status];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_CLASS"];
    unsigned int v8 = [v7 unsignedIntValue];

    if (v8 != 3) {
      goto LABEL_5;
    }
    v9 = [v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"];
    unsigned int v10 = [v9 unsignedIntValue];

    v11 = [v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"];
    unsigned int v12 = [v11 unsignedIntValue];

    if (v10 != 2) {
      goto LABEL_10;
    }
    if (v12 == 2)
    {
LABEL_5:
      uint64_t v13 = 2;
    }
    else
    {
LABEL_10:
      if (v12 != 3 && v10 == 2) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 4;
      }
    }
    [(EligibilityDomain *)self setAnswer:v13];
    id v15 = 0;
  }
  else
  {
    v14 = sub_10000D0EC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v18 = 136315138;
      v19 = "-[IronDomain computeWithError:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s: Failed to get status for Iron domain", (uint8_t *)&v18, 0xCu);
    }

    id v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:93 userInfo:0];
    [(EligibilityDomain *)self setAnswer:0];
    if (a3)
    {
      id v15 = v15;
      *a3 = v15;
    }
  }

  return v6 != 0;
}

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 ironAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4 isInverted:1];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4 isInverted:1];
}

- (IronDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IronDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(IronDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (IronDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)IronDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IronDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(IronDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"Mac", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.iron";
}

- (unint64_t)domain
{
  return 27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end