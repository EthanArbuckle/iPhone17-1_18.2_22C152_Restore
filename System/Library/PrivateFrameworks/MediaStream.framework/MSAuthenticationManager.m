@interface MSAuthenticationManager
+ (id)sharedManager;
- (BOOL)isListeningToKeybagChanges;
- (BOOL)isWaitingForAuth;
- (MSAuthenticationManager)initWithAlertManager:(id)a3;
- (int)keybagChangeNotifyToken;
- (void)_didReceiveAccountConfigChangedNotification;
- (void)_renewCredentialsForAccount:(id)a3;
- (void)dealloc;
- (void)didEncounterAuthenticationFailureForPersonID:(id)a3;
- (void)didEncounterAuthenticationSuccessForPersonID:(id)a3;
- (void)rearmAuthenticationAlert;
- (void)setIsListeningToKeybagChanges:(BOOL)a3;
- (void)setKeybagChangeNotifyToken:(int)a3;
- (void)waitForDeviceUnlock;
@end

@implementation MSAuthenticationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acAccountStore, 0);

  objc_storeStrong((id *)&self->_alertManager, 0);
}

- (void)setKeybagChangeNotifyToken:(int)a3
{
  self->_keybagChangeNotifyToken = a3;
}

- (int)keybagChangeNotifyToken
{
  return self->_keybagChangeNotifyToken;
}

- (void)setIsListeningToKeybagChanges:(BOOL)a3
{
  self->_isListeningToKeybagChanges = a3;
}

- (BOOL)isListeningToKeybagChanges
{
  return self->_isListeningToKeybagChanges;
}

- (BOOL)isWaitingForAuth
{
  return (self->_state - 1) < 2;
}

- (void)rearmAuthenticationAlert
{
  int state = self->_state;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (state == 2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Resetting authentication state. No longer waiting for user to reauth.", buf, 2u);
    }
    self->_int state = 0;
  }
  else if (v4)
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Not resetting authentication state as we're waiting for a server response.", v5, 2u);
  }
}

- (void)didEncounterAuthenticationSuccessForPersonID:(id)a3
{
  self->_bagRefetchCount = 0;
}

- (void)_didReceiveAccountConfigChangedNotification
{
  v3 = [MEMORY[0x1E4F29060] currentThread];
  BOOL v4 = [MEMORY[0x1E4F29060] mainThread];

  if (v3 == v4)
  {
    if ((self->_state - 1) > 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Received account change notification, but we weren't waiting for it. Ignoring.", v6, 2u);
      }
    }
    else
    {
      self->_int state = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Received account change notification. Retrying activities.", buf, 2u);
      }
      v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"MSAuthenticationManagerDidReceiveAuthenticationChangeNotification" object:self];
    }
  }
  else
  {
    [(MSAuthenticationManager *)self performSelectorOnMainThread:sel__didReceiveAccountConfigChangedNotification withObject:0 waitUntilDone:0];
  }
}

- (void)didEncounterAuthenticationFailureForPersonID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Encountered authentication error for personID %@.", buf, 0xCu);
  }
  if (!self->_state)
  {
    v5 = [(ACAccountStore *)self->_acAccountStore aa_primaryAppleAccount];
    v6 = objc_msgSend(v5, "aa_personID");
    v7 = v6;
    if (!v5 || ![v6 isEqualToString:v4])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v4;
        _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot find primary account for personID %@. Ignoring authentication error.", buf, 0xCu);
      }
      goto LABEL_20;
    }
    if (objc_msgSend(v5, "aa_isPrimaryEmailVerified"))
    {
      if (MKBDeviceUnlockedSinceBoot() == 1)
      {
        int bagRefetchCount = self->_bagRefetchCount;
        self->_int bagRefetchCount = bagRefetchCount + 1;
        if (bagRefetchCount > 1)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "We've refetched the bag too many times. Prompting user to change password.", buf, 2u);
          }
          [(MSAuthenticationManager *)self _renewCredentialsForAccount:v5];
        }
        else
        {
          self->_int state = 1;
          acAccountStore = self->_acAccountStore;
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke;
          v10[3] = &unk_1E6CFC7B8;
          id v11 = v4;
          v12 = self;
          id v13 = v5;
          [(ACAccountStore *)acAccountStore aa_updatePropertiesForAppleAccount:v13 completion:v10];
        }
        goto LABEL_20;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "The device has not been unlocked yet. Waiting for unlock.", buf, 2u);
      }
      [(MSAuthenticationManager *)self waitForDeviceUnlock];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "The account for personID %@ is not yet vetted. Waiting for account change.", buf, 0xCu);
    }
    self->_int bagRefetchCount = 0;
    self->_int state = 2;
LABEL_20:

    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Ignoring authentication failure as we are already handling a previous authentication error.", buf, 2u);
  }
LABEL_21:
}

void __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_2;
  block[3] = &unk_1E6CFC790;
  char v15 = a2;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  id v14 = v5;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v2;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "The account for personID %@ has been successfully reauthenticated.", buf, 0xCu);
    }
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    id v5 = *(void **)(v3 + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_14;
    v8[3] = &unk_1E6CFC768;
    v8[4] = v3;
    id v9 = v4;
    [v5 saveVerifiedAccount:v9 withCompletionHandler:v8];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not reauthenticate personID %@. Error: %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) _renewCredentialsForAccount:*(void *)(a1 + 48)];
  }
}

void __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_14(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_2_15;
  block[3] = &unk_1E6CFCAF0;
  char v5 = a2;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_2_15(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 _didReceiveAccountConfigChangedNotification];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to save account %@ after authentication.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)waitForDeviceUnlock
{
  if (![(MSAuthenticationManager *)self isListeningToKeybagChanges])
  {
    uint64_t v3 = (const char *)*MEMORY[0x1E4F78160];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __46__MSAuthenticationManager_waitForDeviceUnlock__block_invoke;
    handler[3] = &unk_1E6CFC9D8;
    handler[4] = self;
    if (!notify_register_dispatch(v3, &self->_keybagChangeNotifyToken, MEMORY[0x1E4F14428], handler)) {
      [(MSAuthenticationManager *)self setIsListeningToKeybagChanges:1];
    }
  }
}

uint64_t __46__MSAuthenticationManager_waitForDeviceUnlock__block_invoke(uint64_t a1, int a2)
{
  uint64_t result = MKBGetDeviceLockState();
  if (result == 3 || !result)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Device unlocked.", v5, 2u);
    }
    [*(id *)(a1 + 32) _didReceiveAccountConfigChangedNotification];
    notify_cancel(a2);
    return [*(id *)(a1 + 32) setIsListeningToKeybagChanges:0];
  }
  return result;
}

- (void)_renewCredentialsForAccount:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Renewing credential for %@", buf, 0xCu);
  }
  self->_int state = 2;
  acAccountStore = self->_acAccountStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__MSAuthenticationManager__renewCredentialsForAccount___block_invoke;
  v7[3] = &unk_1E6CFC740;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(ACAccountStore *)acAccountStore renewCredentialsForAccount:v6 force:0 reason:@"Photo Stream" completion:v7];
}

void __55__MSAuthenticationManager__renewCredentialsForAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to renew credentials for account %@: %@.", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Successfully renewed credentials for account %@", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) _didReceiveAccountConfigChangedNotification];
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F17728] object:self->_acAccountStore];

  if ([(MSAuthenticationManager *)self isListeningToKeybagChanges]) {
    notify_cancel([(MSAuthenticationManager *)self keybagChangeNotifyToken]);
  }
  v4.receiver = self;
  v4.super_class = (Class)MSAuthenticationManager;
  [(MSAuthenticationManager *)&v4 dealloc];
}

- (MSAuthenticationManager)initWithAlertManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSAuthenticationManager;
  uint64_t v6 = [(MSAuthenticationManager *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alertManager, a3);
    int v8 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    acAccountStore = v7->_acAccountStore;
    v7->_acAccountStore = v8;

    __int16 v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__didReceiveAccountConfigChangedNotification name:*MEMORY[0x1E4F17728] object:v7->_acAccountStore];
  }
  return v7;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_78 != -1) {
    dispatch_once(&sharedManager_onceToken_78, &__block_literal_global_79);
  }
  uint64_t v2 = (void *)sharedManager_mgr_80;

  return v2;
}

void __40__MSAuthenticationManager_sharedManager__block_invoke()
{
  v0 = [MSAuthenticationManager alloc];
  id v3 = +[MSAlertManager sharedAlertManager];
  uint64_t v1 = [(MSAuthenticationManager *)v0 initWithAlertManager:v3];
  uint64_t v2 = (void *)sharedManager_mgr_80;
  sharedManager_mgr_80 = v1;
}

@end