@interface SBDefaultAuthenticationPolicy
- (BOOL)allowAuthenticationRevocation;
- (BOOL)shouldClearBlockStateOnSync;
- (BOOL)usesSecureMode;
- (SBSoftwareUpdatePasscodePolicyManager)softwareUpdatePasscodePolicyManager;
- (SBiCloudPasscodeRequirementLockoutController)iCloudPasscodeRequirementLockoutController;
- (SecureBackup)_secureBackupHelper;
- (void)_setSecureBackupHelper:(id)a3;
- (void)cachePasscode:(id)a3;
- (void)clearPasscodeCache;
- (void)passcodeAuthenticationFailedWithError:(id)a3;
- (void)setICloudPasscodeRequirementLockoutController:(id)a3;
- (void)setSoftwareUpdatePasscodePolicyManager:(id)a3;
- (void)wipeDeviceWithReason:(id)a3;
@end

@implementation SBDefaultAuthenticationPolicy

- (BOOL)allowAuthenticationRevocation
{
  v2 = [(id)SBApp restartManager];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldClearBlockStateOnSync
{
  return 1;
}

- (BOOL)usesSecureMode
{
  return 1;
}

- (void)wipeDeviceWithReason:(id)a3
{
  id v6 = a3;
  BOOL v3 = [(id)SBApp userSessionController];
  uint64_t v4 = [v3 sessionType];

  if (v4 == 2)
  {
    v5 = [(id)SBApp userSessionController];
    [v5 disableCurrentUser];
  }
  else
  {
    [(id)SBApp performSelector:sel_wipeDeviceNowWithReason_ withObject:v6 afterDelay:0.0];
  }
}

- (void)cachePasscode:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[SBSetupManager sharedInstance];
  if ([v5 isInSetupMode])
  {
    [v5 noteAuthenticationSucceededWithPasscode:v4];
    if (!self->_secureBackupHelper)
    {
      id v6 = (SecureBackup *)objc_alloc_init(MEMORY[0x1E4F59AF0]);
      secureBackupHelper = self->_secureBackupHelper;
      self->_secureBackupHelper = v6;

      v8 = self->_secureBackupHelper;
      uint64_t v11 = *MEMORY[0x1E4F59B70];
      v12[0] = v4;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      id v10 = (id)[(SecureBackup *)v8 cachePassphraseWithInfo:v9];
    }
  }
  if ([(SBSoftwareUpdatePasscodePolicyManager *)self->_softwareUpdatePasscodePolicyManager softwareUpdatePasscodePolicy])
  {
    [(SBSoftwareUpdatePasscodePolicyManager *)self->_softwareUpdatePasscodePolicyManager noteAuthenticationSucceededWithPasscode:v4];
  }
  if ([(SBiCloudPasscodeRequirementLockoutController *)self->_iCloudPasscodeRequirementLockoutController desiresPasscode])
  {
    [(SBiCloudPasscodeRequirementLockoutController *)self->_iCloudPasscodeRequirementLockoutController noteAuthenticationSucceededWithPasscode:v4];
  }
}

- (void)clearPasscodeCache
{
  secureBackupHelper = self->_secureBackupHelper;
  if (secureBackupHelper)
  {
    id v4 = (id)[(SecureBackup *)secureBackupHelper uncachePassphraseWithInfo:0];
    v5 = self->_secureBackupHelper;
    self->_secureBackupHelper = 0;
  }
}

- (void)passcodeAuthenticationFailedWithError:(id)a3
{
  id v6 = a3;
  BOOL v3 = [v6 domain];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4FA6108]];

  if (v4 && [v6 code] == -14)
  {
    v5 = objc_alloc_init(SBDataRecoveryController);
    if ([(SBDataRecoveryController *)v5 dataRecoveryRequired]) {
      [(SBDataRecoveryController *)v5 performDataRecovery];
    }
  }
}

- (SBiCloudPasscodeRequirementLockoutController)iCloudPasscodeRequirementLockoutController
{
  return self->_iCloudPasscodeRequirementLockoutController;
}

- (void)setICloudPasscodeRequirementLockoutController:(id)a3
{
}

- (SBSoftwareUpdatePasscodePolicyManager)softwareUpdatePasscodePolicyManager
{
  return self->_softwareUpdatePasscodePolicyManager;
}

- (void)setSoftwareUpdatePasscodePolicyManager:(id)a3
{
}

- (SecureBackup)_secureBackupHelper
{
  return self->_secureBackupHelper;
}

- (void)_setSecureBackupHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureBackupHelper, 0);
  objc_storeStrong((id *)&self->_softwareUpdatePasscodePolicyManager, 0);
  objc_storeStrong((id *)&self->_iCloudPasscodeRequirementLockoutController, 0);
}

@end