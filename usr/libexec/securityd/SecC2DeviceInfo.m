@interface SecC2DeviceInfo
+ (BOOL)isAppleInternal;
+ (id)buildVersion;
+ (id)processName;
+ (id)processUUID;
+ (id)processVersion;
+ (id)productName;
+ (id)productType;
+ (id)productVersion;
@end

@implementation SecC2DeviceInfo

+ (id)processUUID
{
  if (qword_10035D210 != -1) {
    dispatch_once(&qword_10035D210, &stru_100305610);
  }
  v2 = (void *)qword_10035D208;

  return v2;
}

+ (id)processVersion
{
  v2 = sub_1001729B8();
  v3 = [v2 objectForKeyedSubscript:_kCFBundleShortVersionStringKey];

  return v3;
}

+ (id)processName
{
  v2 = sub_1001729B8();
  v3 = [v2 objectForKeyedSubscript:kCFBundleIdentifierKey];

  return v3;
}

+ (id)productVersion
{
  return sub_100172ACC(@"ProductVersion");
}

+ (id)productType
{
  return sub_100172ACC(@"ProductType");
}

+ (id)productName
{
  return sub_100172ACC(@"ProductName");
}

+ (id)buildVersion
{
  return sub_100172ACC(@"BuildVersion");
}

+ (BOOL)isAppleInternal
{
  return _os_variant_has_internal_content("com.apple.security.analytics", a2);
}

@end