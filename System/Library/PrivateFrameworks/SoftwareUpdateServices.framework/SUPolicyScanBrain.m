@interface SUPolicyScanBrain
- (BOOL)discretionary;
- (id)assetType;
@end

@implementation SUPolicyScanBrain

- (id)assetType
{
  return @"com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain";
}

- (BOOL)discretionary
{
  return 0;
}

@end