@interface StrontiumDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeWithError:(id *)a3;
- (StrontiumDomain)init;
- (StrontiumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3;
- (unint64_t)domain;
- (void)_internal_doInit;
- (void)updateParameters;
@end

@implementation StrontiumDomain

- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3
{
  if ([a3 isChinaSKU]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (BOOL)computeWithError:(id *)a3
{
  v5 = [(EligibilityDomain *)self status];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE"];
    unsigned int v8 = [v7 unsignedIntValue];

    if (v8 != 3) {
      goto LABEL_6;
    }
    v9 = [v6 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_CLASS"];
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
      v21 = "-[StrontiumDomain computeWithError:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%s: Failed to get status for Strontium domain", (uint8_t *)&v20, 0xCu);
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
  id v5 = +[MobileAssetManager sharedInstance];
  v3 = [v5 strontiumAsset];
  v4 = [v3 countryCodes];
  [(EligibilityDomain *)self setLocatedCountriesOfInterest:v4 isInverted:1];
  [(EligibilityDomain *)self setBillingCountriesOfInterest:v4 isInverted:1];
}

- (StrontiumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)StrontiumDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(StrontiumDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (StrontiumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)StrontiumDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(StrontiumDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(StrontiumDomain *)self updateParameters];
  [(EligibilityDomain *)self setDeviceRegionInterest];
  id v3 = +[NSSet setWithObjects:@"iPhone", @"iPad", @"Mac", 0];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.strontium";
}

- (unint64_t)domain
{
  return 39;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end