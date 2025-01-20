@interface SSContactInfoSectionBuilder
+ (id)supportedBundleId;
- (id)buildBridgedResult;
@end

@implementation SSContactInfoSectionBuilder

+ (id)supportedBundleId
{
  return @"com.apple.spotlight.contactInfo";
}

- (id)buildBridgedResult
{
  v2 = [(SSContactEntitySectionBuilder *)self contactResultBuilder];
  v3 = [v2 buildFooterResultForEntity];

  return v3;
}

@end