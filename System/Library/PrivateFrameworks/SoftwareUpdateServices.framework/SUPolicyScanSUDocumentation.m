@interface SUPolicyScanSUDocumentation
- (BOOL)discretionary;
- (id)assetType;
@end

@implementation SUPolicyScanSUDocumentation

- (id)assetType
{
  return @"com.apple.MobileAsset.SoftwareUpdateDocumentation";
}

- (BOOL)discretionary
{
  return 0;
}

@end