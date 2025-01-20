@interface XcodeLLMDomain
+ (BOOL)supportsSecureCoding;
- (XcodeLLMDomain)init;
- (XcodeLLMDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3;
- (unint64_t)domain;
- (void)_internal_doInit;
@end

@implementation XcodeLLMDomain

- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3
{
  id v3 = a3;
  v4 = +[MobileAssetManager sharedInstance];
  v5 = [v4 xcodeLLMAsset];
  v6 = [v5 countryCodes];
  uint64_t v7 = [v3 deviceRegionCode];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [v3 deviceRegionCode];
    unsigned int v10 = [v6 containsObject:v9];

    if (v10) {
      unint64_t v11 = 2;
    }
    else {
      unint64_t v11 = 3;
    }
  }
  else
  {
    unint64_t v11 = 3;
  }

  return v11;
}

- (XcodeLLMDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)XcodeLLMDomain;
  id v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(XcodeLLMDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (XcodeLLMDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)XcodeLLMDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(XcodeLLMDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (void)_internal_doInit
{
  [(EligibilityDomain *)self setDeviceRegionInterest];
  id v3 = +[NSSet setWithObject:@"Mac"];
  [(EligibilityDomain *)self setDeviceClassesOfInterest:v3];

  [(EligibilityDomain *)self setExternalBootInterest];
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.xcode-llm";
}

- (unint64_t)domain
{
  return 123;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end