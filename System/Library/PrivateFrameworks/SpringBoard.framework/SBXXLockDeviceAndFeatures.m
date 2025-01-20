@interface SBXXLockDeviceAndFeatures
@end

@implementation SBXXLockDeviceAndFeatures

void ___SBXXLockDeviceAndFeatures_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = [(id)SBApp authenticationController];
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"SBS External Client (pid: %d) - LockDeviceAndFeatures", objc_msgSend(*(id *)(a1 + 32), "pid"));
    [v2 revokeAuthenticationImmediatelyForPublicReason:v3];
  }
  id v4 = +[SBLockScreenManager sharedInstance];
  [v4 remoteLock:*(unsigned char *)(a1 + 41) != 0];
}

@end