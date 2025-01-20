@interface SSWalletResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (id)bundleId;
@end

@implementation SSWalletResultBuilder

+ (id)bundleId
{
  return @"com.apple.Passbook";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

@end