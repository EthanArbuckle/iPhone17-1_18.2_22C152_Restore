@interface RMFeatureOverrides
+ (BOOL)overrideCloudConfig;
+ (id)maidLongLivedToken;
+ (id)testOrganizationID;
@end

@implementation RMFeatureOverrides

+ (id)maidLongLivedToken
{
  return [a1 stringForDefaultsKey:@"RMMAIDLongLivedTokenOverride"];
}

+ (BOOL)overrideCloudConfig
{
  return [a1 BOOLForDefaultsKey:@"RMOverrideCloudConfig"];
}

+ (id)testOrganizationID
{
  return [a1 stringForDefaultsKey:@"RMTestOrganizationID"];
}

@end