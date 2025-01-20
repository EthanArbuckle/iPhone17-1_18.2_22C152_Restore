@interface ICAuthentication
+ (ICAuthentication)shared;
- (BOOL)isAuthenticating;
- (id)currentAuthenticationController;
- (void)authenticateBiometricsWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5;
- (void)authenticateCloudPasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5;
- (void)authenticateCustomPasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5;
- (void)authenticateDevicePasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5;
- (void)authenticateWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5;
- (void)didAuthenticateBiometricsWithPrompt:(id)a3 error:(id)a4 displayWindow:(id)a5 completionHandler:(id)a6;
- (void)didAuthenticateCloudPasswordWithPrompt:(id)a3 result:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6;
- (void)didAuthenticateCustomPasswordWithPrompt:(id)a3 result:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6;
- (void)didAuthenticateDevicePasswordWithPrompt:(id)a3 error:(id)a4 displayWindow:(id)a5 completionHandler:(id)a6;
- (void)didAuthenticateWithPrompt:(id)a3 result:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6;
- (void)setBiometricsEnabled:(BOOL)a3 account:(id)a4;
- (void)setCurrentAuthenticationController:(id)a3;
- (void)setCustomPasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5;
- (void)updateUserRecordForAccount:(id)a3 completionHandler:(id)a4;
@end

@implementation ICAuthentication

+ (ICAuthentication)shared
{
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, &__block_literal_global_75);
  }
  v2 = (void *)shared_shared_0;
  return (ICAuthentication *)v2;
}

uint64_t __26__ICAuthentication_shared__block_invoke()
{
  v0 = objc_alloc_init(ICAuthentication);
  shared_shared_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

- (BOOL)isAuthenticating
{
  v2 = [(ICAuthentication *)self currentAuthenticationController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)authenticateWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v28 = v8;
    __int16 v29 = 2080;
    v30 = "-[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:]";
    __int16 v31 = 1024;
    int v32 = 120;
    _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEFAULT, "Authenticating… {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if (![(ICAuthentication *)self isAuthenticating])
  {
    v13 = [v8 account];
    v14 = [v13 accountDataCreateIfNecessary];

    [v14 updateSupportsV1Neo:0];
    if ([v8 needsUserRecordUpdate]
      && [v8 updatesUserRecordIfNeeded])
    {
      v15 = [v8 account];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __75__ICAuthentication_authenticateWithPrompt_displayWindow_completionHandler___block_invoke;
      v22[3] = &unk_1E5FDC8A8;
      id v23 = v8;
      v24 = self;
      id v25 = v9;
      id v26 = v10;
      [(ICAuthentication *)self updateUserRecordForAccount:v15 completionHandler:v22];
    }
    else
    {
      uint64_t v16 = [v8 authenticationAction];
      if (v16 == 3)
      {
        [(ICAuthentication *)self setCustomPasswordWithPrompt:v8 displayWindow:v9 completionHandler:v10];
      }
      else
      {
        if (v16 == 1)
        {
          v21 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:].cold.4();
          }
LABEL_21:

          v18 = self;
          id v19 = v8;
          uint64_t v20 = 1;
        }
        else
        {
          if (v16)
          {
            switch([v8 authenticationMechanism])
            {
              case 0:
                v21 = os_log_create("com.apple.notes", "Crypto");
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                  -[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:]();
                }
                goto LABEL_21;
              case 1:
              case 2:
              case 3:
                [(ICAuthentication *)self authenticateBiometricsWithPrompt:v8 displayWindow:v9 completionHandler:v10];
                break;
              case 4:
                [(ICAuthentication *)self authenticateCustomPasswordWithPrompt:v8 displayWindow:v9 completionHandler:v10];
                break;
              case 5:
                [(ICAuthentication *)self authenticateDevicePasswordWithPrompt:v8 displayWindow:v9 completionHandler:v10];
                break;
              case 6:
                [(ICAuthentication *)self authenticateCloudPasswordWithPrompt:v8 displayWindow:v9 completionHandler:v10];
                break;
              default:
                goto LABEL_23;
            }
            goto LABEL_23;
          }
          v17 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:]();
          }

          v18 = self;
          id v19 = v8;
          uint64_t v20 = 2;
        }
        [(ICAuthentication *)v18 didAuthenticateWithPrompt:v19 result:v20 displayWindow:v9 completionHandler:v10];
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  v12 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:]();
  }

  [(ICAuthentication *)self didAuthenticateWithPrompt:v8 result:0 displayWindow:v9 completionHandler:v10];
LABEL_24:
}

uint64_t __75__ICAuthentication_authenticateWithPrompt_displayWindow_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUpdatesUserRecordIfNeeded:0];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 authenticateWithPrompt:v3 displayWindow:v4 completionHandler:v5];
}

- (void)didAuthenticateWithPrompt:(id)a3 result:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = @"Cancel";
    if (a4 == 1) {
      v14 = @"Failure";
    }
    *(_DWORD *)buf = 138413058;
    id v32 = v10;
    if (a4 == 2) {
      v14 = @"Success";
    }
    __int16 v33 = 2112;
    v34 = v14;
    __int16 v35 = 2080;
    v36 = "-[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:]";
    __int16 v37 = 1024;
    int v38 = 196;
    v15 = v14;
    _os_log_impl(&dword_1B08EB000, v13, OS_LOG_TYPE_DEFAULT, "Authenticated with prompt {prompt: %@, result: %@}%s:%d", buf, 0x26u);
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if (a4 == 1)
  {
    if (![v10 allowsAlternativeAuthentication]
      || ([v10 usesAlternativeAuthenticationIfAvailable] & 1) != 0)
    {
      v22 = [v10 failureAlerts];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __85__ICAuthentication_didAuthenticateWithPrompt_result_displayWindow_completionHandler___block_invoke_2;
      v25[3] = &unk_1E5FDDA20;
      id v26 = v12;
      uint64_t v27 = 1;
      +[ICAuthenticationAlert presentAlertsIfNeeded:v22 window:v11 completionHandler:v25];

      goto LABEL_28;
    }
    v24 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:]();
    }

    [v10 setUsesAlternativeAuthenticationIfAvailable:1];
    goto LABEL_27;
  }
  if (a4 == 2)
  {
    if (![v10 needsSecondaryAuthentication]
      || ([v10 usesSecondaryAuthenticationIfAvailable] & 1) != 0)
    {
      objc_opt_class();
      uint64_t v16 = [v10 object];
      v17 = ICDynamicCast();

      if (v17)
      {
        v18 = +[ICPasswordUtilities sharedInstance];
        objc_msgSend(v18, "accessibilityAnnounceAuthSuccessForIntent:withNote:", objc_msgSend(v10, "intent"), v17);

        id v19 = [MEMORY[0x1E4F832F8] sharedState];
        [v19 addMainKeyToKeychainForObject:v17];
      }
      uint64_t v20 = +[ICAttachmentPreviewGenerator sharedGenerator];
      [v20 generatePreviewsIfNeeded];

      v21 = [v10 successAlerts];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __85__ICAuthentication_didAuthenticateWithPrompt_result_displayWindow_completionHandler___block_invoke;
      v28[3] = &unk_1E5FDDA20;
      id v29 = v12;
      uint64_t v30 = 2;
      +[ICAuthenticationAlert presentAlertsIfNeeded:v21 window:v11 completionHandler:v28];

      goto LABEL_28;
    }
    id v23 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:]();
    }

    [v10 setUsesSecondaryAuthenticationIfAvailable:1];
LABEL_27:
    [(ICAuthentication *)self authenticateWithPrompt:v10 displayWindow:v11 completionHandler:v12];
    goto LABEL_28;
  }
  if (v12) {
    (*((void (**)(id, unint64_t))v12 + 2))(v12, a4);
  }
LABEL_28:
}

uint64_t __85__ICAuthentication_didAuthenticateWithPrompt_result_displayWindow_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

uint64_t __85__ICAuthentication_didAuthenticateWithPrompt_result_displayWindow_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)authenticateBiometricsWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v34 = v8;
    __int16 v35 = 2080;
    v36 = "-[ICAuthentication authenticateBiometricsWithPrompt:displayWindow:completionHandler:]";
    __int16 v37 = 1024;
    int v38 = 256;
    _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEFAULT, "Authenticating biometrics… {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication authenticateBiometricsWithPrompt:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  v31[0] = &unk_1F09A44A8;
  id v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes" value:@"Notes" table:0 allowSiri:1];
  v32[0] = v12;
  v31[1] = &unk_1F09A44C0;
  uint64_t v13 = [v8 reason];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = &stru_1F0973378;
  }
  v32[1] = v15;
  v31[2] = &unk_1F09A44D8;
  uint64_t v16 = [v8 fallbackButtonTitle];
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = &stru_1F0973378;
  }
  v32[2] = v18;
  v32[3] = &unk_1F09A4508;
  v31[3] = &unk_1F09A44F0;
  v31[4] = &unk_1F09A4520;
  id v19 = [v9 tintColor];
  uint64_t v20 = v19;
  if (!v19)
  {
    uint64_t v20 = [MEMORY[0x1E4FB1618] tintColor];
  }
  v31[5] = &unk_1F09A4538;
  v32[4] = v20;
  v32[5] = MEMORY[0x1E4F1CC38];
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:6];
  if (!v19) {

  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  [(ICAuthentication *)self setCurrentAuthenticationController:v22];
  uint64_t v23 = [MEMORY[0x1E4F833F0] biometricsPolicy];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__ICAuthentication_authenticateBiometricsWithPrompt_displayWindow_completionHandler___block_invoke;
  v27[3] = &unk_1E5FDDA48;
  v27[4] = self;
  id v28 = v8;
  id v29 = v9;
  id v30 = v10;
  id v24 = v10;
  id v25 = v9;
  id v26 = v8;
  [v22 evaluatePolicy:v23 options:v21 reply:v27];
}

void __85__ICAuthentication_authenticateBiometricsWithPrompt_displayWindow_completionHandler___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  id v5 = v4;
  performBlockOnMainThread();
}

uint64_t __85__ICAuthentication_authenticateBiometricsWithPrompt_displayWindow_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didAuthenticateBiometricsWithPrompt:*(void *)(a1 + 40) error:*(void *)(a1 + 48) displayWindow:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)didAuthenticateBiometricsWithPrompt:(id)a3 error:(id)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 138413058;
    id v32 = v10;
    __int16 v33 = 2112;
    id v34 = v11;
    __int16 v35 = 2080;
    v36 = "-[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:]";
    __int16 v37 = 1024;
    int v38 = 304;
    _os_log_impl(&dword_1B08EB000, v14, OS_LOG_TYPE_DEFAULT, "Authenticated biometrics with prompt {prompt: %@, error: %@}%s:%d", (uint8_t *)&v31, 0x26u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if (![(ICAuthentication *)self isAuthenticating]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.isAuthenticating" functionName:"-[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Authenticated biometrics while not currently authenticating"];
  }
  [(ICAuthentication *)self setCurrentAuthenticationController:0];
  if ([v11 code] != -2 && objc_msgSend(v11, "code") != -4)
  {
    if (v11 && [v11 code] != -5)
    {
      v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v18 postNotificationName:@"ICAuthenticationAuthenticateBiometricsAttemptDidFail" object:self];
    }
    if ([v11 code] == -3 || objc_msgSend(v11, "code") == -8)
    {
      id v19 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:]();
      }

      [v10 setUsesBiometricAuthenticationIfAvailable:0];
      if ([v10 authenticationAction] == 2)
      {
LABEL_20:
        [(ICAuthentication *)self authenticateWithPrompt:v10 displayWindow:v12 completionHandler:v13];
        goto LABEL_11;
      }
LABEL_39:
      v15 = self;
      id v16 = v10;
      uint64_t v17 = 1;
      goto LABEL_10;
    }
    if (v11 && [v11 code] != -5) {
      goto LABEL_39;
    }
    if ([v10 unlocksNotes])
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F83348];
      v21 = [v10 authenticationObject];
      LODWORD(v20) = [v20 shouldAuthenticateWithCustomPasswordForObject:v21];

      if (!v20)
      {
        id v26 = (void *)MEMORY[0x1E4F83348];
        uint64_t v27 = [v10 authenticationObject];
        LODWORD(v26) = [v26 shouldAuthenticateWithDevicePasswordForObject:v27];

        if (!v26)
        {
          id v30 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:]();
          }

          goto LABEL_39;
        }
        id v25 = (void *)MEMORY[0x1E4F832F8];
        goto LABEL_31;
      }
      id v22 = [MEMORY[0x1E4F832F8] sharedState];
      uint64_t v23 = [v10 authenticationObject];
      char v24 = [v22 authenticateObjectWithKeychain:v23];

      if ((v24 & 1) == 0)
      {
        id v29 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:]();
        }

        [v10 setUsesBiometricAuthenticationIfAvailable:0];
        goto LABEL_20;
      }
      if ([v10 needsSecondaryAuthentication]
        && [v10 secondaryAuthenticationMode] == 2)
      {
        [v10 setUsesSecondaryAuthenticationIfAvailable:1];
        id v25 = (void *)MEMORY[0x1E4F832F8];
LABEL_31:
        id v28 = [v25 sharedState];
        [v28 authenticateWithDevicePassword];
      }
    }
    v15 = self;
    id v16 = v10;
    uint64_t v17 = 2;
    goto LABEL_10;
  }
  v15 = self;
  id v16 = v10;
  uint64_t v17 = 0;
LABEL_10:
  [(ICAuthentication *)v15 didAuthenticateWithPrompt:v16 result:v17 displayWindow:v12 completionHandler:v13];
LABEL_11:
}

- (void)setBiometricsEnabled:(BOOL)a3 account:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v5 = [MEMORY[0x1E4F832F8] sharedState];
  [v5 setBiometricsEnabled:v4 forAccount:v8];

  id v6 = [MEMORY[0x1E4F832F8] sharedState];
  id v7 = v6;
  if (v4) {
    [v6 addMainKeyToKeychainForObject:v8];
  }
  else {
    [v6 removeMainKeysFromKeychainForAccount:v8];
  }
}

- (void)authenticateCustomPasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 2080;
    uint64_t v23 = "-[ICAuthentication authenticateCustomPasswordWithPrompt:displayWindow:completionHandler:]";
    __int16 v24 = 1024;
    int v25 = 400;
    _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEFAULT, "Authenticating custom password with prompt {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication authenticateCustomPasswordWithPrompt:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  id v12 = [[ICPasswordEntryAlertController alloc] initWithDisplayWindow:v9];
  [(ICAuthentication *)self setCurrentAuthenticationController:v12];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__ICAuthentication_authenticateCustomPasswordWithPrompt_displayWindow_completionHandler___block_invoke;
  v16[3] = &unk_1E5FDDA70;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(ICPasswordEntryAlertController *)v12 authenticateWithPrompt:v15 completionHandler:v16];
}

uint64_t __89__ICAuthentication_authenticateCustomPasswordWithPrompt_displayWindow_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didAuthenticateCustomPasswordWithPrompt:*(void *)(a1 + 40) result:a2 displayWindow:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)didAuthenticateCustomPasswordWithPrompt:(id)a3 result:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = @"Cancel";
    if (a4 == 1) {
      id v14 = @"Failure";
    }
    *(_DWORD *)id v16 = 138413058;
    *(void *)&v16[4] = v10;
    if (a4 == 2) {
      id v14 = @"Success";
    }
    *(_WORD *)&v16[12] = 2112;
    *(void *)&v16[14] = v14;
    *(_WORD *)&v16[22] = 2080;
    id v17 = "-[ICAuthentication didAuthenticateCustomPasswordWithPrompt:result:displayWindow:completionHandler:]";
    LOWORD(v18) = 1024;
    *(_DWORD *)((char *)&v18 + 2) = 429;
    id v15 = v14;
    _os_log_impl(&dword_1B08EB000, v13, OS_LOG_TYPE_DEFAULT, "Authenticated custom password with prompt {prompt: %@, result: %@}%s:%d", v16, 0x26u);
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication didAuthenticateCustomPasswordWithPrompt:result:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if (!-[ICAuthentication isAuthenticating](self, "isAuthenticating", *(_OWORD *)v16, *(void *)&v16[16], v17, v18, v19))[MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.isAuthenticating" functionName:"-[ICAuthentication didAuthenticateCustomPasswordWithPrompt:result:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Authenticated custom password while not currently authenticating"]; {
  [(ICAuthentication *)self setCurrentAuthenticationController:0];
  }
  [(ICAuthentication *)self didAuthenticateWithPrompt:v10 result:a4 displayWindow:v11 completionHandler:v12];
}

- (void)authenticateDevicePasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v28 = v8;
    __int16 v29 = 2080;
    id v30 = "-[ICAuthentication authenticateDevicePasswordWithPrompt:displayWindow:completionHandler:]";
    __int16 v31 = 1024;
    int v32 = 451;
    _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEFAULT, "Authenticating device password… {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication authenticateDevicePasswordWithPrompt:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  v25[0] = &unk_1F09A44A8;
  id v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes" value:@"Notes" table:0 allowSiri:1];
  v25[1] = &unk_1F09A44C0;
  v26[0] = v12;
  uint64_t v13 = [v8 reason];
  id v14 = (void *)v13;
  id v15 = &stru_1F0973378;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  v26[1] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  id v17 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  [(ICAuthentication *)self setCurrentAuthenticationController:v17];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__ICAuthentication_authenticateDevicePasswordWithPrompt_displayWindow_completionHandler___block_invoke;
  v21[3] = &unk_1E5FDDA48;
  v21[4] = self;
  id v22 = v8;
  id v23 = v9;
  id v24 = v10;
  id v18 = v10;
  id v19 = v9;
  id v20 = v8;
  [v17 evaluatePolicy:1007 options:v16 reply:v21];
}

void __89__ICAuthentication_authenticateDevicePasswordWithPrompt_displayWindow_completionHandler___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  id v5 = v4;
  performBlockOnMainThread();
}

uint64_t __89__ICAuthentication_authenticateDevicePasswordWithPrompt_displayWindow_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didAuthenticateDevicePasswordWithPrompt:*(void *)(a1 + 40) error:*(void *)(a1 + 48) displayWindow:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)didAuthenticateDevicePasswordWithPrompt:(id)a3 error:(id)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138413058;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2080;
    id v23 = "-[ICAuthentication didAuthenticateDevicePasswordWithPrompt:error:displayWindow:completionHandler:]";
    __int16 v24 = 1024;
    int v25 = 499;
    _os_log_impl(&dword_1B08EB000, v14, OS_LOG_TYPE_DEFAULT, "Authenticated device password with prompt {prompt: %@, error: %@}%s:%d", (uint8_t *)&v18, 0x26u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication didAuthenticateDevicePasswordWithPrompt:error:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if (![(ICAuthentication *)self isAuthenticating]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.isAuthenticating" functionName:"-[ICAuthentication didAuthenticateDevicePasswordWithPrompt:error:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Authenticated device password while not currently authenticating"];
  }
  [(ICAuthentication *)self setCurrentAuthenticationController:0];
  uint64_t v15 = [v11 code];
  uint64_t v16 = 0;
  if (v15 != -2)
  {
    if ([v11 code] == -4)
    {
      uint64_t v16 = 0;
    }
    else if (v11 && [v11 code] != -5)
    {
      uint64_t v16 = 1;
    }
    else
    {
      if ([v10 unlocksNotes])
      {
        id v17 = [MEMORY[0x1E4F832F8] sharedState];
        [v17 authenticateWithDevicePassword];
      }
      uint64_t v16 = 2;
    }
  }
  [(ICAuthentication *)self didAuthenticateWithPrompt:v10 result:v16 displayWindow:v12 completionHandler:v13];
}

- (void)authenticateCloudPasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v40 = v7;
    __int16 v41 = 2080;
    v42 = "-[ICAuthentication authenticateCloudPasswordWithPrompt:displayWindow:completionHandler:]";
    __int16 v43 = 1024;
    int v44 = 532;
    _os_log_impl(&dword_1B08EB000, v10, OS_LOG_TYPE_DEFAULT, "Authenticating cloud password… {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication authenticateCloudPasswordWithPrompt:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F4F100]);
  id v12 = [v8 rootViewController];
  [v11 setPresentingViewController:v12];

  id v13 = [MEMORY[0x1E4F836D8] sharedInstance];
  id v14 = [v13 accountStore];
  uint64_t v15 = [v7 account];
  uint64_t v16 = [v15 identifier];
  id v17 = [v14 accountWithIdentifier:v16];
  int v18 = [v17 username];
  [v11 setUsername:v18];

  [v11 setIsUsernameEditable:0];
  [v11 setServiceType:1];
  uint64_t v19 = [v7 reason];
  __int16 v20 = (void *)v19;
  if (v19) {
    id v21 = (__CFString *)v19;
  }
  else {
    id v21 = &stru_1F0973378;
  }
  [v11 setReason:v21];

  __int16 v22 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  [v11 setDefaultButtonString:v22];

  uint64_t v23 = *MEMORY[0x1E4F4D918];
  v38[0] = *MEMORY[0x1E4F4D910];
  v38[1] = v23;
  __int16 v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  [v11 setServiceIdentifiers:v24];

  [v11 setIsEphemeral:1];
  uint64_t v25 = [v7 title];
  uint64_t v26 = (void *)v25;
  if (v25) {
    uint64_t v27 = (__CFString *)v25;
  }
  else {
    uint64_t v27 = &stru_1F0973378;
  }
  [v11 setTitle:v27];

  id v28 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Cancel" value:@"Cancel" table:0 allowSiri:1];
  [v11 setCancelButtonString:v28];

  [v11 setAuthenticationType:2];
  [v11 setShouldPromptForPasswordOnly:1];
  [v11 setShouldUpdatePersistentServiceTokens:1];
  id v29 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  [(ICAuthentication *)self setCurrentAuthenticationController:v29];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __88__ICAuthentication_authenticateCloudPasswordWithPrompt_displayWindow_completionHandler___block_invoke;
  v34[3] = &unk_1E5FDDA48;
  v34[4] = self;
  id v35 = v7;
  id v36 = v8;
  id v37 = v9;
  id v30 = v9;
  id v31 = v8;
  id v32 = v7;
  [v29 authenticateWithContext:v11 completion:v34];
}

void __88__ICAuthentication_authenticateCloudPasswordWithPrompt_displayWindow_completionHandler___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  id v5 = v4;
  performBlockOnMainThread();
}

uint64_t __88__ICAuthentication_authenticateCloudPasswordWithPrompt_displayWindow_completionHandler___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  if (v2)
  {
    uint64_t v3 = [v2 code];
    id v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = a1[8];
    uint64_t v8 = v3 != -7003;
  }
  else
  {
    id v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = a1[8];
    uint64_t v8 = 2;
  }
  return [v4 didAuthenticateCloudPasswordWithPrompt:v5 result:v8 displayWindow:v6 completionHandler:v7];
}

- (void)didAuthenticateCloudPasswordWithPrompt:(id)a3 result:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = @"Cancel";
    if (a4 == 1) {
      id v14 = @"Failure";
    }
    if (a4 == 2) {
      id v14 = @"Success";
    }
    uint64_t v15 = v14;
    int v16 = 138413058;
    id v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    __int16 v20 = 2080;
    id v21 = "-[ICAuthentication didAuthenticateCloudPasswordWithPrompt:result:displayWindow:completionHandler:]";
    __int16 v22 = 1024;
    int v23 = 581;
    _os_log_impl(&dword_1B08EB000, v13, OS_LOG_TYPE_DEFAULT, "Authenticated cloud password with prompt {prompt: %@, result: %@}%s:%d", (uint8_t *)&v16, 0x26u);
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication didAuthenticateCloudPasswordWithPrompt:result:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if (![(ICAuthentication *)self isAuthenticating]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.isAuthenticating" functionName:"-[ICAuthentication didAuthenticateCloudPasswordWithPrompt:result:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Authenticated cloud password while not currently authenticating"];
  }
  [(ICAuthentication *)self setCurrentAuthenticationController:0];
  [(ICAuthentication *)self didAuthenticateWithPrompt:v10 result:a4 displayWindow:v12 completionHandler:v11];
}

- (void)setCustomPasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v8;
    __int16 v23 = 2080;
    uint64_t v24 = "-[ICAuthentication setCustomPasswordWithPrompt:displayWindow:completionHandler:]";
    __int16 v25 = 1024;
    int v26 = 597;
    _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEFAULT, "Setting custom password with prompt {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication setCustomPasswordWithPrompt:displayWindow:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  id v12 = +[ICPasswordUtilities sharedInstance];
  id v13 = [v8 account];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__ICAuthentication_setCustomPasswordWithPrompt_displayWindow_completionHandler___block_invoke;
  v17[3] = &unk_1E5FDDA70;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [v12 showPasswordSetUpSheetForAccount:v13 displayWindow:v15 completionHandler:v17];
}

uint64_t __80__ICAuthentication_setCustomPasswordWithPrompt_displayWindow_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didAuthenticateWithPrompt:*(void *)(a1 + 40) result:a2 displayWindow:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)updateUserRecordForAccount:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 objectID];
    *(_DWORD *)buf = 138412802;
    id v17 = v8;
    __int16 v18 = 2080;
    id v19 = "-[ICAuthentication updateUserRecordForAccount:completionHandler:]";
    __int16 v20 = 1024;
    int v21 = 609;
    _os_log_impl(&dword_1B08EB000, v7, OS_LOG_TYPE_DEFAULT, "Authenticating for iCloud account without passphrase — manually fetching user record… {accountID: %@}%s:%d", buf, 0x1Cu);
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthentication updateUserRecordForAccount:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  id v9 = [MEMORY[0x1E4F83318] sharedContext];
  id v10 = [v5 identifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__ICAuthentication_updateUserRecordForAccount_completionHandler___block_invoke;
  v13[3] = &unk_1E5FDDA98;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v9 fetchUserRecordWithAccountID:v10 completionHandler:v13];
}

void __65__ICAuthentication_updateUserRecordForAccount_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v4 = v3;
  performBlockOnMainThread();
}

uint64_t __65__ICAuthentication_updateUserRecordForAccount_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [*(id *)(a1 + 40) objectID];
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1B08EB000, v2, OS_LOG_TYPE_INFO, "Updated user record while authenticating {accountID: %@}", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    id v6 = [v4 identifier];
    [v4 objectWasFetchedFromCloudWithRecord:v5 accountID:v6];

    uint64_t v7 = [*(id *)(a1 + 40) managedObjectContext];
    objc_msgSend(v7, "ic_save");
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)currentAuthenticationController
{
  return self->_currentAuthenticationController;
}

- (void)setCurrentAuthenticationController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)authenticateWithPrompt:displayWindow:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Cannot authenticate while other authentication is in progress — canceling", v2, v3, v4, v5, v6);
}

- (void)authenticateWithPrompt:displayWindow:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "Unresolved authentication mechanism — failing", v2, v3, v4, v5, v6);
}

- (void)authenticateWithPrompt:displayWindow:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Authentication not needed — succeeding", v2, v3, v4, v5, v6);
}

- (void)authenticateWithPrompt:displayWindow:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Authentication prevented — failing", v2, v3, v4, v5, v6);
}

- (void)didAuthenticateWithPrompt:result:displayWindow:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Prompting for secondary authentication…", v2, v3, v4, v5, v6);
}

- (void)didAuthenticateWithPrompt:result:displayWindow:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Falling back to alternative authentication…", v2, v3, v4, v5, v6);
}

- (void)didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "User canceled biometrics or was locked out — falling back to password if possible…", v2, v3, v4, v5, v6);
}

- (void)didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "Cannot find valid keychain item while authenticating biometrics — falling back to password…", v2, v3, v4, v5, v6);
}

- (void)didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "Unknown crypto strategy — failing", v2, v3, v4, v5, v6);
}

@end