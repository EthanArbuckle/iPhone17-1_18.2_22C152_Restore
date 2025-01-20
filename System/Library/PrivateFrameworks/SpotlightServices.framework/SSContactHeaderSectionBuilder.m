@interface SSContactHeaderSectionBuilder
+ (id)supportedBundleId;
- (id)buildBridgedResult;
@end

@implementation SSContactHeaderSectionBuilder

+ (id)supportedBundleId
{
  return @"com.apple.spotlight.contactHeader";
}

- (id)buildBridgedResult
{
  v2 = [(SSContactEntitySectionBuilder *)self contactResultBuilder];
  v3 = [v2 buildHeaderResultForEntity];

  return v3;
}

@end