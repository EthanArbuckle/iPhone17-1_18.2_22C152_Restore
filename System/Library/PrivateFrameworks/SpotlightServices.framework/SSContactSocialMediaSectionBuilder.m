@interface SSContactSocialMediaSectionBuilder
+ (id)supportedBundleId;
- (id)buildBridgedResult;
@end

@implementation SSContactSocialMediaSectionBuilder

+ (id)supportedBundleId
{
  return @"com.apple.MobileAddressBook.SocialMedia";
}

- (id)buildBridgedResult
{
  v2 = [(SSContactEntitySectionBuilder *)self contactResultBuilder];
  v3 = [v2 buildSocialMediaResultForEntity];

  return v3;
}

@end