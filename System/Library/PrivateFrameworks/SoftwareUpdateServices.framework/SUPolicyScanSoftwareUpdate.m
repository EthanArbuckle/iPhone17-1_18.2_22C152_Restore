@interface SUPolicyScanSoftwareUpdate
- (BOOL)allowSameVersion;
- (BOOL)discretionary;
- (BOOL)isSplatOnlyScan;
- (BOOL)restrictToFull;
- (BOOL)restrictToIncremental;
- (id)assetType;
@end

@implementation SUPolicyScanSoftwareUpdate

- (id)assetType
{
  return @"com.apple.MobileAsset.SoftwareUpdate";
}

- (BOOL)discretionary
{
  return 0;
}

- (BOOL)restrictToIncremental
{
  v3 = [(SUPolicyScan *)self scanOptions];
  if ([v3 containsType:1])
  {
    v4 = [(SUPolicyScan *)self scanOptions];
    v5 = [v4 types];
    BOOL v6 = [v5 count] == 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)restrictToFull
{
  v3 = +[SUPreferences sharedInstance];
  if ([v3 forceFullReplacement])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(SUPolicyScan *)self scanOptions];
    if ([v5 containsType:2])
    {
      BOOL v6 = [(SUPolicyScan *)self scanOptions];
      v7 = [v6 types];
      BOOL v4 = [v7 count] == 1;
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (BOOL)isSplatOnlyScan
{
  v3 = [(SUPolicyScan *)self scanOptions];
  if ([v3 containsType:4])
  {
    BOOL v4 = [(SUPolicyScan *)self scanOptions];
    v5 = [v4 types];
    BOOL v6 = [v5 count] == 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)allowSameVersion
{
  v2 = +[SUPreferences sharedInstance];
  char v3 = [v2 allowSameBuildUpdates];

  return v3;
}

@end