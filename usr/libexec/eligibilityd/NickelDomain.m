@interface NickelDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (NickelDomain)init;
- (NickelDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation NickelDomain

- (BOOL)computeWithError:(id *)a3
{
  v5 = [(EligibilityDomain *)self status];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_CLASS"];
    unsigned int v8 = [v7 unsignedIntValue];

    if (v8 != 3) {
      goto LABEL_6;
    }
    v9 = [v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_LOCALE"];
    unsigned int v10 = [v9 unsignedIntValue];

    if (v10 != 3) {
      goto LABEL_6;
    }
    v11 = [v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"];
    unsigned int v12 = [v11 unsignedIntValue];

    v13 = [v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"];
    unsigned int v14 = [v13 unsignedIntValue];

    if (v12 != 2 || v14 != 2)
    {
      if (v14 != 3 && v12 == 2) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = 4;
      }
    }
    else
    {
LABEL_6:
      uint64_t v15 = 2;
    }
    [(EligibilityDomain *)self setAnswer:v15];
    id v16 = 0;
  }
  else
  {
    v17 = sub_10000D0EC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v20 = 136315138;
      v21 = "-[NickelDomain computeWithError:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%s: Failed to get status for Nickel domain", (uint8_t *)&v20, 0xCu);
    }

    id v16 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:93 userInfo:0];
    [(EligibilityDomain *)self setAnswer:0];
    if (a3)
    {
      id v16 = v16;
      *a3 = v16;
    }
  }

  return v6 != 0;
}

- (void)updateParameters
{
  v6 = +[MobileAssetManager sharedInstance];
  v3 = [v6 nickelAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4 isInverted:1];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4 isInverted:1];
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", @"AZ", @"BH", @"EG", @"IR", @"IQ", @"JO", @"KW", @"MA", @"NG", @"OM", @"PK", @"QA", @"RU", @"SA", @"ZA", @"TR", @"AE",
    @"YE",
  v5 = 0);
  [(EligibilityDomain *)self setDeviceLocalesOfInterest:v5 isInverted:1];
}

- (NickelDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NickelDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(NickelDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (NickelDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)NickelDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NickelDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(NickelDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.nickel";
}

- (unint64_t)domain
{
  return 29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end