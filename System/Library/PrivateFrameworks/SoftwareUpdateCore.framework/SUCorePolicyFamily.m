@interface SUCorePolicyFamily
+ (id)_copyGestaltValueForKey:(__CFString *)a3;
+ (id)_getGenericDefaultAssetTypeForKind:(int)a3;
+ (id)_getIOSAssetTypeForKind:(int)a3;
+ (id)_getMacOSAssetTypeForKind:(int)a3;
+ (id)_getNERDBRAINAssetTypeForKind:(int)a3;
+ (id)_getNERDCAssetTypeForKind:(int)a3;
+ (id)_getNERDSUAssetTypeForKind:(int)a3;
+ (id)_getPlatformDefaultAssetTypeForKind:(int)a3;
+ (id)_getTVOSAssetTypeForKind:(int)a3;
+ (id)_getWatchOSAssetTypeForKind:(int)a3;
+ (id)getAssetTypeForKind:(int)a3 usingFamily:(int)a4;
+ (id)getNameForSUCorePolicyAssetFamily:(int)a3;
+ (id)getNameForSUCorePolicyAssetKind:(int)a3;
+ (int)getFamilyForBuildTarget;
+ (int)getFamilyUsingDeviceClass:(id)a3;
@end

@implementation SUCorePolicyFamily

+ (id)getAssetTypeForKind:(int)a3 usingFamily:(int)a4
{
  switch(a4)
  {
    case 1:
      v4 = +[SUCorePolicyFamily _getIOSAssetTypeForKind:*(void *)&a3];
      break;
    case 2:
      v4 = +[SUCorePolicyFamily _getTVOSAssetTypeForKind:*(void *)&a3];
      break;
    case 3:
      v4 = +[SUCorePolicyFamily _getWatchOSAssetTypeForKind:*(void *)&a3];
      break;
    case 4:
      v4 = +[SUCorePolicyFamily _getNERDCAssetTypeForKind:*(void *)&a3];
      break;
    case 5:
      v4 = +[SUCorePolicyFamily _getNERDSUAssetTypeForKind:*(void *)&a3];
      break;
    case 6:
      v4 = +[SUCorePolicyFamily _getNERDBRAINAssetTypeForKind:*(void *)&a3];
      break;
    case 7:
      v4 = +[SUCorePolicyFamily _getMacOSAssetTypeForKind:*(void *)&a3];
      break;
    default:
      v4 = +[SUCorePolicyFamily _getPlatformDefaultAssetTypeForKind:*(void *)&a3];
      break;
  }

  return v4;
}

+ (int)getFamilyUsingDeviceClass:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (([v3 isEqualToString:@"iPhone"] & 1) != 0
    || ([v3 isEqualToString:@"iPod"] & 1) != 0
    || ([v3 isEqualToString:@"iPad"] & 1) != 0
    || [v3 isEqualToString:@"AudioAccessory"])
  {
    v4 = [MEMORY[0x263F77DE8] sharedLogger];
    v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to iOS family", buf, 2u);
    }
    int v6 = 1;
  }
  else if ([v3 isEqualToString:@"AppleTV"])
  {
    v8 = [MEMORY[0x263F77DE8] sharedLogger];
    v5 = [v8 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = 2;
      _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to tvOS family", buf, 2u);
    }
    else
    {
      int v6 = 2;
    }
  }
  else if ([v3 isEqualToString:@"Watch"])
  {
    v9 = [MEMORY[0x263F77DE8] sharedLogger];
    v5 = [v9 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to watchOS family", buf, 2u);
    }
    int v6 = 3;
  }
  else
  {
    int v10 = [v3 isEqualToString:@"Mac"];
    v11 = [MEMORY[0x263F77DE8] sharedLogger];
    v5 = [v11 oslog];

    BOOL v12 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to macOS family", buf, 2u);
      }
      int v6 = 7;
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v3;
        _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "SUCorePolicyFamily:getFamilyUsingDeviceClass unknown device class %{public}@, returning default instead", buf, 0xCu);
      }

      v5 = [MEMORY[0x263F77DA8] sharedDiag];
      v13 = (void *)[[NSString alloc] initWithFormat:@"unknown device class (%@), returning default instead", v3];
      [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v13 withResult:8116 withError:0];

      int v6 = 0;
    }
  }

  return v6;
}

+ (int)getFamilyForBuildTarget
{
  return 1;
}

+ (id)getNameForSUCorePolicyAssetFamily:(int)a3
{
  if (a3 >= 8) {
    id v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"SUCORE_POLICY_FAMILY_UNKNOWN(%d)", *(void *)&a3);
  }
  else {
    id v3 = off_2640DD150[a3];
  }

  return v3;
}

+ (id)getNameForSUCorePolicyAssetKind:(int)a3
{
  if ((a3 - 1) >= 7) {
    id v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"SUCORE_POLICY_KIND_UNKNOWN(%d)", *(void *)&a3);
  }
  else {
    id v3 = off_2640DD190[a3 - 1];
  }

  return v3;
}

+ (id)_getIOSAssetTypeForKind:(int)a3
{
  if ((a3 - 1) < 7) {
    return off_2640DD1C8[a3 - 1];
  }
  uint64_t v4 = *(void *)&a3;
  v5 = [MEMORY[0x263F77DA8] sharedDiag];
  int v6 = (void *)[[NSString alloc] initWithFormat:@"failed to determine iOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU", v4];
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return @"com.apple.MobileAsset.SoftwareUpdate";
}

+ (id)_getTVOSAssetTypeForKind:(int)a3
{
  if ((a3 - 1) < 7) {
    return off_2640DD200[a3 - 1];
  }
  uint64_t v4 = *(void *)&a3;
  v5 = [MEMORY[0x263F77DA8] sharedDiag];
  int v6 = (void *)[[NSString alloc] initWithFormat:@"failed to determine tvOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU", v4];
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return @"com.apple.MobileAsset.SoftwareUpdate";
}

+ (id)_getWatchOSAssetTypeForKind:(int)a3
{
  if ((a3 - 1) < 7) {
    return off_2640DD238[a3 - 1];
  }
  uint64_t v4 = *(void *)&a3;
  v5 = [MEMORY[0x263F77DA8] sharedDiag];
  int v6 = (void *)[[NSString alloc] initWithFormat:@"failed to determine watchOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU", v4];
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return @"com.apple.MobileAsset.SoftwareUpdate";
}

+ (id)_getNERDCAssetTypeForKind:(int)a3
{
  if ((a3 - 1) < 7) {
    return off_2640DD270[a3 - 1];
  }
  uint64_t v4 = *(void *)&a3;
  v5 = [MEMORY[0x263F77DA8] sharedDiag];
  int v6 = (void *)[[NSString alloc] initWithFormat:@"failed to determine NERDC asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU", v4];
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return @"com.apple.MobileAsset.RecoveryOSUpdate";
}

+ (id)_getNERDSUAssetTypeForKind:(int)a3
{
  id v3 = @"com.apple.MobileAsset.RecoveryOSUpdate";
  switch(a3)
  {
    case 1:
      return v3;
    case 2:
      v7 = [MEMORY[0x263F77DA8] sharedDiag];
      uint64_t v8 = [[NSString alloc] initWithFormat:@"no documentation asset type for NERDSU family, defaulting to NeRD SU asset type(%@)", @"com.apple.MobileAsset.RecoveryOSUpdate"];
      goto LABEL_6;
    case 3:
      v7 = [MEMORY[0x263F77DA8] sharedDiag];
      uint64_t v8 = [[NSString alloc] initWithFormat:@"no update brain asset type for NERDSU family, defaulting to NeRD SU asset type(%@)", @"com.apple.MobileAsset.RecoveryOSUpdate"];
LABEL_6:
      v9 = (void *)v8;
      [v7 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v8 withResult:8102 withError:0];

      break;
    case 4:
      id v3 = @"com.apple.MobileAsset.SFRSoftwareUpdate";
      break;
    case 5:
      id v3 = @"com.apple.MobileAsset.SoftwareUpdateConfiguration";
      break;
    case 6:
    case 7:
      id v3 = 0;
      break;
    default:
      uint64_t v4 = *(void *)&a3;
      v5 = [MEMORY[0x263F77DA8] sharedDiag];
      int v6 = (void *)[[NSString alloc] initWithFormat:@"failed to determine NERDSU asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU type(%@)", v4, @"com.apple.MobileAsset.RecoveryOSUpdate"];
      [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

      break;
  }
  return v3;
}

+ (id)_getNERDBRAINAssetTypeForKind:(int)a3
{
  id v3 = @"com.apple.MobileAsset.RecoveryOSUpdateBrain";
  switch(a3)
  {
    case 1:
      return v3;
    case 2:
      v7 = [MEMORY[0x263F77DA8] sharedDiag];
      uint64_t v8 = [[NSString alloc] initWithFormat:@"no documentation asset type for NERDBRAIN family, defaulting to NeRD update brain asset type(%@)", @"com.apple.MobileAsset.RecoveryOSUpdateBrain"];
      goto LABEL_6;
    case 3:
      v7 = [MEMORY[0x263F77DA8] sharedDiag];
      uint64_t v8 = [[NSString alloc] initWithFormat:@"no update brain asset type for NERDBRAIN family (since brain handled as SU asset), defaulting to NeRD update brain asset type(%@)", @"com.apple.MobileAsset.RecoveryOSUpdateBrain"];
LABEL_6:
      v9 = (void *)v8;
      [v7 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v8 withResult:8102 withError:0];

      break;
    case 4:
      id v3 = @"com.apple.MobileAsset.SFRSoftwareUpdate";
      break;
    case 5:
      id v3 = @"com.apple.MobileAsset.SoftwareUpdateConfiguration";
      break;
    case 6:
    case 7:
      id v3 = 0;
      break;
    default:
      uint64_t v4 = *(void *)&a3;
      v5 = [MEMORY[0x263F77DA8] sharedDiag];
      int v6 = (void *)[[NSString alloc] initWithFormat:@"failed to determine NERDBRAIN asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU type(%@)", v4, @"com.apple.MobileAsset.RecoveryOSUpdateBrain"];
      [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

      break;
  }
  return v3;
}

+ (id)_getMacOSAssetTypeForKind:(int)a3
{
  if ((a3 - 1) < 7) {
    return off_2640DD2A8[a3 - 1];
  }
  uint64_t v4 = *(void *)&a3;
  v5 = [MEMORY[0x263F77DA8] sharedDiag];
  id v3 = @"com.apple.MobileAsset.MacSoftwareUpdate";
  int v6 = (void *)[[NSString alloc] initWithFormat:@"failed to determine macOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU type(%@)", v4, @"com.apple.MobileAsset.MacSoftwareUpdate"];
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return v3;
}

+ (id)_getPlatformDefaultAssetTypeForKind:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [MEMORY[0x263F77DA0] sharedDevice];
  v5 = [v4 deviceClass];
  uint64_t v6 = +[SUCorePolicyFamily getFamilyUsingDeviceClass:v5];

  switch((int)v6)
  {
    case 1:
      v7 = +[SUCorePolicyFamily _getIOSAssetTypeForKind:v3];
      break;
    case 2:
      v7 = +[SUCorePolicyFamily _getTVOSAssetTypeForKind:v3];
      break;
    case 3:
      v7 = +[SUCorePolicyFamily _getWatchOSAssetTypeForKind:v3];
      break;
    case 7:
      v7 = +[SUCorePolicyFamily _getMacOSAssetTypeForKind:v3];
      break;
    default:
      uint64_t v8 = [MEMORY[0x263F77DA8] sharedDiag];
      v9 = (void *)[[NSString alloc] initWithFormat:@"unknown family value (%d), defaulting to generic default family", v6];
      [v8 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v9 withResult:8116 withError:0];

      v7 = +[SUCorePolicyFamily _getGenericDefaultAssetTypeForKind:v3];
      break;
  }

  return v7;
}

+ (id)_getGenericDefaultAssetTypeForKind:(int)a3
{
  if ((a3 - 1) < 7) {
    return off_2640DD2E0[a3 - 1];
  }
  uint64_t v4 = *(void *)&a3;
  v5 = [MEMORY[0x263F77DA8] sharedDiag];
  uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"failed to determine generic default asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU", v4];
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return @"com.apple.MobileAsset.SoftwareUpdate";
}

+ (id)_copyGestaltValueForKey:(__CFString *)a3
{
  return (id)MGCopyAnswer();
}

@end