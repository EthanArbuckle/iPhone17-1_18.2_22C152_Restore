@interface SAAssetManagerFactory
+ (id)safariAssistantAssetManagerWithLocale:(id)a3;
+ (id)safariAssistantAssetManagerWithLocale:(id)a3 error:(id *)a4;
- (SAAssetManagerFactory)init;
@end

@implementation SAAssetManagerFactory

+ (id)safariAssistantAssetManagerWithLocale:(id)a3
{
  uint64_t v3 = sub_25BCA15A0();
  v5 = sub_25BC8DA20(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)safariAssistantAssetManagerWithLocale:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_25BCA15A0();
  v6 = sub_25BC8DB48(v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

- (SAAssetManagerFactory)init
{
  return (SAAssetManagerFactory *)SAAssetManagerFactory.init()();
}

@end