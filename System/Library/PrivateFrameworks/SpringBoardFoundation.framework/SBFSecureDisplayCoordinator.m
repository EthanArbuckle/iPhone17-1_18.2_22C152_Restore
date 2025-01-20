@interface SBFSecureDisplayCoordinator
- (BOOL)inSecureMode;
- (void)setSecureMode:(BOOL)a3;
- (void)setSecureMode:(BOOL)a3 postNotification:(BOOL)a4;
@end

@implementation SBFSecureDisplayCoordinator

- (BOOL)inSecureMode
{
  return self->_inSecureMode;
}

- (void)setSecureMode:(BOOL)a3
{
}

- (void)setSecureMode:(BOOL)a3 postNotification:(BOOL)a4
{
  if (self->_inSecureMode == a3) {
    return;
  }
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_inSecureMode = a3;
  v7 = SBLogAuthenticationController();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B52E000, v7, OS_LOG_TYPE_DEFAULT, "Enabling secure display mode.", buf, 2u);
    }

    if (v4)
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"SBDeviceWillEnableDisplaySecureModeNotification" object:self];
    }
    v10 = (__CFString **)MEMORY[0x1E4F44218];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B52E000, v7, OS_LOG_TYPE_DEFAULT, "Disabling secure display mode.", buf, 2u);
    }

    if (!v4) {
      goto LABEL_13;
    }
    v10 = SBDeviceWillDisableDisplaySecureModeNotification;
  }
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:*v10 object:self];

LABEL_13:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__SBFSecureDisplayCoordinator_setSecureMode_postNotification___block_invoke;
  v17[3] = &unk_1E548CAB0;
  v17[4] = self;
  BOOL v18 = v5;
  BOOL v19 = v4;
  v12 = (void (**)(void))MEMORY[0x18C133210](v17);
  v13 = v12;
  if (v5)
  {
    v14 = (void *)MEMORY[0x1E4F39CF8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__SBFSecureDisplayCoordinator_setSecureMode_postNotification___block_invoke_2;
    v15[3] = &unk_1E548D5A0;
    v16 = v12;
    objc_msgSend(v14, "bs_performAfterSynchronizedCommit:", v15);
  }
  else
  {
    v12[2](v12);
  }
}

void __62__SBFSecureDisplayCoordinator_setSecureMode_postNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)(*(void *)(a1 + 32) + 8) != *(unsigned __int8 *)(a1 + 40))
  {
    v6 = SBLogAuthenticationController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(unsigned __int8 *)(a1 + 40);
      int v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
      v11[0] = 67109376;
      v11[1] = v8;
      __int16 v12 = 1024;
      int v13 = v9;
      _os_log_impl(&dword_18B52E000, v6, OS_LOG_TYPE_DEFAULT, "Not changing secure mode to %{BOOL}u because the expected state is now %{BOOL}u", (uint8_t *)v11, 0xEu);
    }
    goto LABEL_15;
  }
  BKSDisplaySetSecureMode();
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = SBLogAuthenticationController();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v4)
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_DEFAULT, "Disabled secure display mode.", (uint8_t *)v11, 2u);
    }

    if (*(unsigned char *)(a1 + 41))
    {
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 postNotificationName:@"SBDeviceDidDisableDisplaySecureModeNotification" object:*(void *)(a1 + 32)];
    }
    BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = v5;
    v7 = (__CFString **)MEMORY[0x1E4F44210];
    goto LABEL_14;
  }
  if (v4)
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_DEFAULT, "Enabled secure display mode.", (uint8_t *)v11, 2u);
  }

  if (*(unsigned char *)(a1 + 41))
  {
    BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = v5;
    v7 = SBDeviceDidEnableDisplaySecureModeNotification;
LABEL_14:
    [v5 postNotificationName:*v7 object:*(void *)(a1 + 32)];
LABEL_15:
  }
}

uint64_t __62__SBFSecureDisplayCoordinator_setSecureMode_postNotification___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end