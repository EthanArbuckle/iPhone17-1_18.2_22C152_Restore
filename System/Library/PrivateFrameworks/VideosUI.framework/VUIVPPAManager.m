@interface VUIVPPAManager
+ (BOOL)_isReminderDue:(id)a3 reminderInterval:(double)a4;
+ (BOOL)channelAlreadyExists:(id)a3 channelID:(id)a4;
+ (id)_getChannelDetailsForID:(id)a3;
+ (id)_getConsentedBrandsFromSettingsStore;
+ (id)_getConsentedChannels;
+ (id)_getDeniedBrandsFromSettingsStore;
+ (id)_getDeniedChannels;
+ (id)addUniqueChannels:(id)a3 channels:(id)a4;
+ (id)sharedInstance;
- (BOOL)_isChannelVPPAPromptEligible:(id)a3;
- (BOOL)_isVPPAPromptDueForConfig:(id)a3;
- (BOOL)alreadyInProgress;
- (BOOL)lightweightCheckToSeeIfChannelRequiresConsent:(id)a3;
- (VUIAccessViewController)accessViewController;
- (VUIVPPAManager)init;
- (id)_appSettingsForChannelID:(id)a3 externalID:(id)a4;
- (id)_filterOutNotEligibleVPPAChannels:(id)a3;
- (id)_getEligibleBulkChannels;
- (id)_getVPPABulkChannels:(int64_t)a3;
- (id)_rootViewController;
- (id)_subscribedAppBundleIdentifiers;
- (id)_subscriptionIdentifierForBundleID:(id)a3;
- (id)_watchlistOrderedChannels;
- (unint64_t)consentCancelButtonType;
- (void)_fetchConfigurationAndPresentVPPAIfRequired:(id)a3 shouldForceConsentPrompt:(BOOL)a4 completion:(id)a5;
- (void)_presentVPPAConsentScreen:(id)a3 vppaState:(int64_t)a4 completion:(id)a5;
- (void)_removeNotEligibleChannelFromSettingsStore:(id)a3;
- (void)clearVPPAState;
- (void)reloadConfigurationAfterVPPAChange;
- (void)setAccessViewController:(id)a3;
- (void)setAlreadyInProgress:(BOOL)a3;
- (void)setConsentCancelButtonType:(unint64_t)a3;
- (void)startVPPAConsentFlow:(id)a3 consentCancelButtonType:(unint64_t)a4 shouldForceVPPAPrompt:(BOOL)a5 completion:(id)a6;
- (void)startVPPAConsentFlowForDeeplink:(id)a3 completion:(id)a4;
@end

@implementation VUIVPPAManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_7 != -1) {
    dispatch_once(&sharedInstance___onceToken_7, &__block_literal_global_150);
  }
  v2 = (void *)sharedInstance___instance_6;
  return v2;
}

void __32__VUIVPPAManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIVPPAManager);
  v1 = (void *)sharedInstance___instance_6;
  sharedInstance___instance_6 = (uint64_t)v0;
}

- (VUIVPPAManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIVPPAManager;
  result = [(VUIVPPAManager *)&v3 init];
  if (result) {
    result->_alreadyInProgress = 0;
  }
  return result;
}

- (void)startVPPAConsentFlow:(id)a3 consentCancelButtonType:(unint64_t)a4 shouldForceVPPAPrompt:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v13 = objc_msgSend(v12, "ams_activeiTunesAccount");
  v14 = objc_msgSend(v13, "ams_DSID");

  if (!v14)
  {
    v17 = VUIDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      v18 = "VUIVPPAManager - User not logged in. Cannot continue.";
LABEL_8:
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)location, 2u);
    }
LABEL_9:

    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    goto LABEL_10;
  }
  if (!v10)
  {
    v17 = VUIDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      v18 = "VUIVPPAManager - No channel.";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  self->_consentCancelButtonType = a4;
  v15 = [MEMORY[0x1E4FB5080] sharedInstanceFiltered];
  objc_initWeak(location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __96__VUIVPPAManager_startVPPAConsentFlow_consentCancelButtonType_shouldForceVPPAPrompt_completion___block_invoke;
  v19[3] = &unk_1E6DFCDD0;
  objc_copyWeak(&v24, location);
  id v20 = v10;
  id v16 = v15;
  id v21 = v16;
  v22 = self;
  id v23 = v11;
  BOOL v25 = a5;
  [v16 loadIfNeededWithCompletion:v19];

  objc_destroyWeak(&v24);
  objc_destroyWeak(location);

LABEL_10:
}

void __96__VUIVPPAManager_startVPPAConsentFlow_consentCancelButtonType_shouldForceVPPAPrompt_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!a2
    || ([*(id *)(a1 + 32) channelID],
        v5 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 40) channelForID:v5],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    id v6 = *(id *)(a1 + 32);
  }
  if ([WeakRetained _isChannelVPPAPromptEligible:v6])
  {
    [*(id *)(a1 + 48) _fetchConfigurationAndPresentVPPAIfRequired:v6 shouldForceConsentPrompt:*(unsigned __int8 *)(a1 + 72) completion:*(void *)(a1 + 56)];
  }
  else
  {
    v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v6 name];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - %@ does not required vppa prompt.", (uint8_t *)&v9, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)clearVPPAState
{
  [(VUIVPPAManager *)self setAccessViewController:0];
  [(VUIVPPAManager *)self setAlreadyInProgress:0];
}

- (void)startVPPAConsentFlowForDeeplink:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  int v9 = objc_msgSend(v8, "ams_activeiTunesAccount");
  id v10 = objc_msgSend(v9, "ams_DSID");

  if (!v10)
  {
    v13 = VUIDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "VUIVPPAManager - User not logged in. Cannot continue.";
LABEL_8:
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
LABEL_9:

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_10;
  }
  if (!v6)
  {
    v13 = VUIDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "VUIVPPAManager - No channel ID.";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  *(void *)buf = 0;
  id v24 = buf;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__32;
  v27 = __Block_byref_object_dispose__32;
  id v28 = 0;
  uint64_t v11 = [MEMORY[0x1E4FB5080] sharedInstanceFiltered];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__VUIVPPAManager_startVPPAConsentFlowForDeeplink_completion___block_invoke;
  v15[3] = &unk_1E6DFCDF8;
  objc_copyWeak(&v21, &location);
  id v20 = buf;
  id v12 = v11;
  id v16 = v12;
  id v17 = v6;
  v18 = self;
  id v19 = v7;
  [v12 loadIfNeededWithCompletion:v15];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
LABEL_10:
}

void __61__VUIVPPAManager_startVPPAConsentFlowForDeeplink_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (a2)
  {
    uint64_t v5 = [*(id *)(a1 + 32) channelForID:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - No channel.", (uint8_t *)&v10, 2u);
    }
    goto LABEL_11;
  }
  if ((objc_msgSend(WeakRetained, "_isChannelVPPAPromptEligible:") & 1) == 0)
  {
    v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) name];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - %@ does not required vppa prompt.", (uint8_t *)&v10, 0xCu);
    }
LABEL_11:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_12;
  }
  [*(id *)(a1 + 48) _fetchConfigurationAndPresentVPPAIfRequired:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) shouldForceConsentPrompt:0 completion:*(void *)(a1 + 56)];
LABEL_12:
}

- (void)reloadConfigurationAfterVPPAChange
{
  id v2 = [MEMORY[0x1E4FB5088] sharedInstance];
  [v2 fetchConfigurationWithOptions:0 cachePolicy:3 queryParameters:0 completion:&__block_literal_global_17_0];
}

void __52__VUIVPPAManager_reloadConfigurationAfterVPPAChange__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Failed to fetch init config: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"VUIVPPADidChangeNotification" object:0 userInfo:0];
  }
}

- (BOOL)lightweightCheckToSeeIfChannelRequiresConsent:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4FB5080] sharedInstanceFiltered];
  int v5 = [v3 channelID];
  id v6 = [v4 channelForID:v5];
  uint64_t v7 = [MEMORY[0x1E4FB5158] sharedSettings];
  v8 = [v3 channelID];
  int v9 = [v7 settingsForChannelID:v8 externalID:0];

  if (!v6) {
    id v6 = v3;
  }
  if ([v6 isConsented])
  {
    BOOL v10 = 0;
  }
  else if (v9)
  {
    BOOL v10 = [v9 accessStatus] == 0;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_fetchConfigurationAndPresentVPPAIfRequired:(id)a3 shouldForceConsentPrompt:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  BOOL v10 = [MEMORY[0x1E4FB5088] sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__VUIVPPAManager__fetchConfigurationAndPresentVPPAIfRequired_shouldForceConsentPrompt_completion___block_invoke;
  v13[3] = &unk_1E6DFCE48;
  objc_copyWeak(&v17, &location);
  id v11 = v8;
  id v14 = v11;
  BOOL v18 = a4;
  id v12 = v9;
  v15 = self;
  id v16 = v12;
  [v10 fetchConfigurationWithOptions:0 cachePolicy:0 queryParameters:0 completion:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __98__VUIVPPAManager__fetchConfigurationAndPresentVPPAIfRequired_shouldForceConsentPrompt_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v5)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __98__VUIVPPAManager__fetchConfigurationAndPresentVPPAIfRequired_shouldForceConsentPrompt_completion___block_invoke_2;
    v12[3] = &unk_1E6DFCE20;
    v13 = v5;
    id v9 = *(id *)(a1 + 32);
    char v18 = *(unsigned char *)(a1 + 64);
    id v14 = v9;
    id v15 = WeakRetained;
    id v10 = *(id *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = v10;
    dispatch_async(v8, v12);

    id v11 = v13;
  }
  else
  {
    id v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Failed to fetch init config: %@", buf, 0xCu);
    }
  }
}

void __98__VUIVPPAManager__fetchConfigurationAndPresentVPPAIfRequired_shouldForceConsentPrompt_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) vppaStatus];
  id v3 = [*(id *)(a1 + 32) vppaStatusString];
  v4 = [MEMORY[0x1E4FB5158] sharedSettings];
  id v5 = [*(id *)(a1 + 40) channelID];
  id v6 = [v4 settingsForChannelID:v5 externalID:0];

  if (v6)
  {
    BOOL v7 = [v6 accessStatus] == 1;
    BOOL v8 = [v6 accessStatus] == 2;
    BOOL v9 = [v6 accessStatus] == 0;
  }
  else
  {
    BOOL v8 = 0;
    BOOL v7 = 0;
    BOOL v9 = 1;
  }
  id v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      id v11 = v3;
    }
    else {
      id v11 = @"not found";
    }
    id v12 = [*(id *)(a1 + 40) name];
    int v13 = [*(id *)(a1 + 40) isConsented];
    id v14 = @"not consented";
    if (v13) {
      id v14 = @"consented";
    }
    id v15 = @"unknown";
    if (v8) {
      id v15 = @"denied";
    }
    *(_DWORD *)id v23 = 138413058;
    *(void *)&v23[4] = v11;
    *(_WORD *)&v23[12] = 2112;
    *(void *)&v23[14] = v12;
    *(_WORD *)&v23[22] = 2112;
    id v24 = v14;
    if (v7) {
      uint64_t v16 = @"granted";
    }
    else {
      uint64_t v16 = v15;
    }
    __int16 v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - VPPA state is %@. '%@' cached state: %@, access in settings: %@", v23, 0x2Au);
  }
  if (!v3)
  {
    if (v9)
    {
      if (!v8) {
        goto LABEL_32;
      }
    }
    else if (!v8 || !*(unsigned char *)(a1 + 72))
    {
      char v18 = VUIDefaultLogObject();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_36:

        goto LABEL_37;
      }
      id v19 = [*(id *)(a1 + 40) name];
      *(_DWORD *)id v23 = 138412290;
      *(void *)&v23[4] = v19;
      id v20 = "VUIVPPAManager - No vppaStatus found. %@ is consented or has explicitly denied";
LABEL_35:
      _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, v20, v23, 0xCu);

      goto LABEL_36;
    }
    id v17 = VUIDefaultLogObject();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
LABEL_31:

LABEL_32:
      objc_msgSend(*(id *)(a1 + 48), "_presentVPPAConsentScreen:vppaState:completion:", *(void *)(a1 + 40), v2, *(void *)(a1 + 64), *(_OWORD *)v23, *(void *)&v23[16], v24);
      goto LABEL_39;
    }
LABEL_30:
    uint64_t v21 = [*(id *)(a1 + 40) name];
    *(_DWORD *)id v23 = 138412290;
    *(void *)&v23[4] = v21;
    _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Forcing consent prompt for explicitly denied channel %@", v23, 0xCu);

    goto LABEL_31;
  }
  if ([*(id *)(a1 + 56) _isVPPAPromptDueForConfig:*(void *)(a1 + 32)])
  {
    id v17 = VUIDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v23 = 0;
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - bulk consent is due", v23, 2u);
    }
    goto LABEL_31;
  }
  if (([*(id *)(a1 + 40) isConsented] ^ 1 | v8) == 1)
  {
    if (!v7)
    {
      if (!v8) {
        goto LABEL_32;
      }
      if (*(unsigned char *)(a1 + 72))
      {
        id v17 = VUIDefaultLogObject();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }
    char v18 = VUIDefaultLogObject();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    id v19 = [*(id *)(a1 + 40) name];
    *(_DWORD *)id v23 = 138412290;
    *(void *)&v23[4] = v19;
    id v20 = "VUIVPPAManager - User has explicitly specified consent for %@";
    goto LABEL_35;
  }
LABEL_37:
  uint64_t v22 = *(void *)(a1 + 64);
  if (v22) {
    (*(void (**)(uint64_t, uint64_t, void))(v22 + 16))(v22, 1, 0);
  }
LABEL_39:
}

- (BOOL)_isChannelVPPAPromptEligible:(id)a3
{
  id v3 = a3;
  if ([v3 isWatchListEnabled]) {
    int v4 = [v3 isFirstParty] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)_isVPPAPromptDueForConfig:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 vppaStatus];
  id v5 = [v3 vppaSessionDurationInMillis];

  [v5 doubleValue];
  double v7 = v6 / 1000.0;
  if (v7 <= 0.0) {
    double v8 = 86400.0;
  }
  else {
    double v8 = v7;
  }
  BOOL v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v10 = [v9 objectForKey:@"vppaConsentLastPrompted"];

  BOOL v11 = (v4 & 0xFFFFFFFFFFFFFFFELL) == 2
     || v4 == 1
     && +[VUIVPPAManager _isReminderDue:v10 reminderInterval:v8];

  return v11;
}

- (void)_presentVPPAConsentScreen:(id)a3 vppaState:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Present consent screen", (uint8_t *)buf, 2u);
  }

  BOOL v11 = [MEMORY[0x1E4F1CA48] array];
  [v11 addObject:v8];
  id v12 = [(VUIVPPAManager *)self _getVPPABulkChannels:a4];
  int v13 = [(VUIVPPAManager *)self _getEligibleBulkChannels];
  if ([v12 count])
  {
    id v14 = VUIDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Adding VPPA channels", (uint8_t *)buf, 2u);
    }
    id v15 = v12;
LABEL_11:

    uint64_t v16 = [(id)objc_opt_class() addUniqueChannels:v15 channels:v11];

    BOOL v11 = (void *)v16;
    goto LABEL_12;
  }
  if ([v13 count])
  {
    id v14 = VUIDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Adding Eligible channels", (uint8_t *)buf, 2u);
    }
    id v15 = v13;
    goto LABEL_11;
  }
LABEL_12:
  objc_initWeak(buf, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke;
  v20[3] = &unk_1E6DFCEE8;
  objc_copyWeak(v25, buf);
  v25[1] = (id)a4;
  id v21 = v11;
  uint64_t v22 = self;
  id v23 = v8;
  id v24 = v9;
  id v17 = v8;
  id v18 = v11;
  id v19 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v20);

  objc_destroyWeak(v25);
  objc_destroyWeak(buf);
}

void __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke(uint64_t a1)
{
  v39[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([WeakRetained alreadyInProgress])
  {
    id v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Already presenting Consent screen. Skipping", buf, 2u);
    }

    uint64_t v4 = *(void *)(a1 + 56);
    if (v4)
    {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, 0);
      goto LABEL_20;
    }
  }
  else
  {
    [WeakRetained setAlreadyInProgress:1];
  }
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  double v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setObject:v6 forKey:@"vppaConsentLastPrompted"];

  double v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v8 = objc_msgSend(v7, "ams_activeiTunesAccount");
  id v9 = [v8 username];

  id v10 = &stru_1F3E921E0;
  if (v9) {
    id v10 = v9;
  }
  v38[0] = @"account";
  v38[1] = @"NewVPPAConsentPrompt";
  uint64_t v11 = MEMORY[0x1E4F1CC38];
  uint64_t v12 = *(void *)(a1 + 72);
  BOOL v13 = v12 == 0;
  if (v12) {
    uint64_t v14 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v14 = MEMORY[0x1E4F1CC38];
  }
  v39[0] = v10;
  v39[1] = v14;
  if (v13) {
    uint64_t v11 = MEMORY[0x1E4F1CC28];
  }
  v38[2] = @"requireVPPAStateUpdate";
  v38[3] = @"shouldDenyOnCancel";
  v39[2] = v11;
  v39[3] = MEMORY[0x1E4F1CC28];
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];
  uint64_t v16 = [VUIAccessViewController alloc];
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = [*(id *)(a1 + 40) consentCancelButtonType];
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_46;
  v32 = &unk_1E6DFCEC0;
  id v33 = WeakRetained;
  id v34 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 72);
  id v35 = v19;
  uint64_t v36 = v20;
  id v21 = [(VUIAccessViewController *)v16 initWithChannels:v17 options:v15 consentCancelButtonType:v18 completionHandler:&v29];
  objc_msgSend(*(id *)(a1 + 40), "setAccessViewController:", v21, v29, v30, v31, v32, v33);
  uint64_t v22 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v23 = [v22 userInterfaceIdiom];

  if (v23 == 2)
  {
    uint64_t v24 = 8;
  }
  else
  {
    __int16 v25 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v26 = [v25 userInterfaceIdiom];

    if (v26 == 1) {
      uint64_t v24 = 2;
    }
    else {
      uint64_t v24 = -2;
    }
  }
  [(VUIAccessViewController *)v21 setModalPresentationStyle:v24];
  uint64_t v27 = [*(id *)(a1 + 40) _rootViewController];
  [v27 presentViewController:v21 animated:1 completion:0];
  id v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v28 postNotificationName:@"VUIVPPAPresentedNotification" object:0 userInfo:0];

LABEL_20:
}

void __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_46(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = a2;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Received access result: %lu", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_47;
  block[3] = &unk_1E6DFCE98;
  id v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  uint64_t v11 = a2;
  id v9 = v5;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v10 = v6;
  uint64_t v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_47(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accessViewController];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_2;
  id v8 = &unk_1E6DFCE70;
  uint64_t v11 = *(void *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  id v10 = v3;
  uint64_t v12 = v4;
  [v2 dismissViewControllerAnimated:1 completion:&v5];

  objc_msgSend(*(id *)(a1 + 32), "setAccessViewController:", 0, v5, v6, v7, v8);
  [*(id *)(a1 + 32) setAlreadyInProgress:0];
}

void __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 1)
  {
    id v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) appName];
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Updating VPPA consent for channel details: %@ and invalidating cache", buf, 0xCu);
    }
    uint64_t v5 = [MEMORY[0x1E4FB5080] sharedInstanceFiltered];
    uint64_t v6 = [*(id *)(a1 + 32) channelID];
    [v5 updateConsentStatusForCachedEntry:v6 consented:1];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    BOOL v8 = (unint64_t)(*(void *)(a1 + 48) - 1) < 2 || *(void *)(a1 + 56) == 1;
    (*(void (**)(uint64_t, BOOL, BOOL))(v7 + 16))(v7, v8, v2 == 1);
  }
  id v9 = objc_msgSend(*(id *)(a1 + 32), "channelID", @"channelID");
  v13[1] = @"userAcceptedVPPA";
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v2 == 1];
  v14[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"VUIVPPADismissedNotification" object:0 userInfo:v11];
}

- (id)_getVPPABulkChannels:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 1)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = [(id)objc_opt_class() _getConsentedChannels];
LABEL_5:
    uint64_t v7 = (void *)v5;
    [v4 addObjectsFromArray:v5];

    goto LABEL_7;
  }
  if (a3 == 3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = [(id)objc_opt_class() _getConsentedChannels];
    [v4 addObjectsFromArray:v6];

    uint64_t v5 = [(id)objc_opt_class() _getDeniedChannels];
    goto LABEL_5;
  }
  uint64_t v4 = 0;
LABEL_7:
  BOOL v8 = [(VUIVPPAManager *)self _filterOutNotEligibleVPPAChannels:v4];

  return v8;
}

- (id)_filterOutNotEligibleVPPAChannels:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v14 = v4;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isiTunes", v14) & 1) != 0
            || ([v10 isFirstParty] & 1) != 0
            || ![v10 isWatchListEnabled])
          {
            uint64_t v11 = VUIDefaultLogObject();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v12 = [v10 name];
              *(_DWORD *)buf = 138412290;
              id v21 = v12;
              _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - %@ not eligible for VPPA.", buf, 0xCu);
            }
            [(VUIVPPAManager *)self _removeNotEligibleChannelFromSettingsStore:v10];
          }
          else
          {
            [v15 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v7);
    }

    id v4 = v14;
  }
  else
  {
    id v15 = v4;
  }

  return v15;
}

- (void)_removeNotEligibleChannelFromSettingsStore:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FB5158] sharedSettings];
  id v5 = [v3 channelID];
  uint64_t v6 = [v4 settingsForChannelID:v5 externalID:0];

  uint64_t v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v3 appName];
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Removing not eligible channel %@ from settings store.", (uint8_t *)&v9, 0xCu);
  }
  [v4 _removeWatchListApp:v6];
}

- (id)_getEligibleBulkChannels
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = [(VUIVPPAManager *)self _subscribedAppBundleIdentifiers];
  id v24 = [MEMORY[0x1E4F1CA48] array];
  __int16 v25 = self;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v3 = [(VUIVPPAManager *)self _watchlistOrderedChannels];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v33;
    *(void *)&long long v5 = 138412290;
    long long v23 = v5;
    uint64_t v26 = v3;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "appBundleIDs", v23);
        if (([v9 isFirstParty] & 1) == 0 && objc_msgSend(v9, "isWatchListEnabled"))
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v11 = v27;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v29;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v29 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * j);
                if ([v10 containsObject:v16])
                {
                  long long v17 = [(VUIVPPAManager *)v25 _subscriptionIdentifierForBundleID:v16];
                  long long v18 = [v9 channelID];
                  long long v19 = [(VUIVPPAManager *)v25 _appSettingsForChannelID:v18 externalID:v17];

                  if ((!v19 || ![v19 accessStatus])
                    && ([v24 containsObject:v9] & 1) == 0)
                  {
                    uint64_t v20 = VUIDefaultLogObject();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      id v21 = [v9 channelID];
                      *(_DWORD *)buf = v23;
                      v37 = v21;
                      _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Found eligible channel: %@", buf, 0xCu);
                    }
                    [v24 addObject:v9];
                  }

                  goto LABEL_24;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
LABEL_24:

          id v3 = v26;
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v6);
  }

  return v24;
}

+ (BOOL)_isReminderDue:(id)a3 reminderInterval:(double)a4
{
  if (!a3) {
    return 1;
  }
  uint64_t v4 = [a3 dateByAddingTimeInterval:a4];
  long long v5 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v6 = [v4 compare:v5] == -1;

  return v6;
}

+ (BOOL)channelAlreadyExists:(id)a3 channelID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6
    && (long long v19 = 0u,
        long long v20 = 0u,
        long long v17 = 0u,
        long long v18 = 0u,
        (uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16]) != 0))
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v12 channelID];
          if (v13)
          {
            uint64_t v14 = [v12 channelID];
            char v15 = [v14 isEqualToString:v6];
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          char v15 = 0;
        }
        v9 |= v15;
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

+ (id)addUniqueChannels:(id)a3 channels:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v11 channelID];

          if (v12)
          {
            uint64_t v13 = objc_opt_class();
            uint64_t v14 = [v11 channelID];
            LOBYTE(v13) = [(id)v13 channelAlreadyExists:v6 channelID:v14];

            if ((v13 & 1) == 0) {
              [v6 addObject:v11];
            }
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v6;
}

+ (id)_getConsentedChannels
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() _getConsentedBrandsFromSettingsStore];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend((id)objc_opt_class(), "_getChannelDetailsForID:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        uint64_t v10 = v9;
        if (v9 && ([v9 isiTunes] & 1) == 0 && (objc_msgSend(v10, "isFirstParty") & 1) == 0) {
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)_getDeniedChannels
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() _getDeniedBrandsFromSettingsStore];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend((id)objc_opt_class(), "_getChannelDetailsForID:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        uint64_t v10 = v9;
        if (v9 && ([v9 isiTunes] & 1) == 0 && (objc_msgSend(v10, "isFirstParty") & 1) == 0) {
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_rootViewController
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
  id v3 = [v2 rootViewController];

  return v3;
}

- (id)_subscribedAppBundleIdentifiers
{
  uint64_t v2 = [MEMORY[0x1E4FB5050] defaultAppLibrary];
  id v3 = [v2 subscribedAppBundleIdentifiers];

  return v3;
}

- (id)_watchlistOrderedChannels
{
  uint64_t v2 = [MEMORY[0x1E4FB5080] sharedInstance];
  id v3 = [v2 orderedChannels];

  return v3;
}

- (id)_subscriptionIdentifierForBundleID:(id)a3
{
  return (id)WLKSubscriptionIdentifierForBundleID();
}

- (id)_appSettingsForChannelID:(id)a3 externalID:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4FB5158];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 sharedSettings];
  uint64_t v9 = [v8 settingsForChannelID:v7 externalID:v6];

  return v9;
}

+ (id)_getConsentedBrandsFromSettingsStore
{
  uint64_t v2 = [MEMORY[0x1E4FB5158] sharedSettings];
  id v3 = [v2 consentedBrands];

  return v3;
}

+ (id)_getDeniedBrandsFromSettingsStore
{
  uint64_t v2 = [MEMORY[0x1E4FB5158] sharedSettings];
  id v3 = [v2 deniedBrands];

  return v3;
}

+ (id)_getChannelDetailsForID:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB5080];
  id v4 = a3;
  uint64_t v5 = [v3 sharedInstance];
  id v6 = [v5 channelForID:v4];

  return v6;
}

- (VUIAccessViewController)accessViewController
{
  return self->_accessViewController;
}

- (void)setAccessViewController:(id)a3
{
}

- (BOOL)alreadyInProgress
{
  return self->_alreadyInProgress;
}

- (void)setAlreadyInProgress:(BOOL)a3
{
  self->_alreadyInProgress = a3;
}

- (unint64_t)consentCancelButtonType
{
  return self->_consentCancelButtonType;
}

- (void)setConsentCancelButtonType:(unint64_t)a3
{
  self->_consentCancelButtonType = a3;
}

- (void).cxx_destruct
{
}

@end