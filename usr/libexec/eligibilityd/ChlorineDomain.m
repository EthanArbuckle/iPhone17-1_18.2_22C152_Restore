@interface ChlorineDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (ChlorineDomain)init;
- (ChlorineDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation ChlorineDomain

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
    v9 = [v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"];
    unsigned int v10 = [v9 unsignedIntValue];

    if (v10 == 3)
    {
      v11 = 0;
      uint64_t v12 = 4;
      goto LABEL_13;
    }
    if (v10 != 2)
    {
      v14 = [v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_LOCALE"];
      unsigned int v15 = [v14 unsignedIntValue];

      v11 = 0;
      if (v15 == 3) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = 2;
      }
    }
    else
    {
LABEL_5:
      v11 = 0;
      uint64_t v12 = 2;
    }
  }
  else
  {
    v13 = sub_10000D0EC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      v18 = "-[ChlorineDomain computeWithError:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s: Failed to get status for Chlorine domain", (uint8_t *)&v17, 0xCu);
    }

    v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:93 userInfo:0];
    uint64_t v12 = 0;
  }
LABEL_13:
  [(EligibilityDomain *)self setAnswer:v12];
  if (a3 && !v12) {
    *a3 = v11;
  }

  return v12 != 0;
}

- (void)updateParameters
{
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 chlorineAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4];
  [(EligibilityDomain *)self setDeviceLocalesOfInterest:v4];
}

- (ChlorineDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ChlorineDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ChlorineDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (ChlorineDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)ChlorineDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ChlorineDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(ChlorineDomain *)self updateParameters];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPad", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.chlorine";
}

- (unint64_t)domain
{
  return 18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end