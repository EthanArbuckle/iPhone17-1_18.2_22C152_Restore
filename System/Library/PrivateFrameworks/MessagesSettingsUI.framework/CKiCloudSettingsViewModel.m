@interface CKiCloudSettingsViewModel
- (BOOL)_isBetweenInitialAndBackfillSync;
- (BOOL)isSyncAvailable;
- (BOOL)isSyncButtonEnabled;
- (BOOL)isSyncing;
- (BOOL)isSyncingEnabled;
- (BOOL)micAccountsMatch;
- (BOOL)syncSupportsCancellation;
- (CKKeepMessagesPreferenceManager)keepMessagesPreferenceManager;
- (CKiCloudSettingsSyncController)syncController;
- (CKiCloudSettingsViewModel)init;
- (CKiCloudSettingsViewModelDelegate)delegate;
- (CKiCloudSyncStateModel)syncStateModel;
- (ICQInAppAction)upgradeICloudAction;
- (ICQInAppMessage)lastInAppMessage;
- (IMCloudKitSyncState)lastEngineSyncState;
- (NSNumber)keepMessagePreferenceValue;
- (NSString)footerHyperlinkUrl;
- (NSString)messagesInCloudCount;
- (NSString)messagesLearnMoreUrlString;
- (NSString)syncButtonText;
- (NSString)syncStatus;
- (NSString)syncStatusFooterSubstringForHyperlink;
- (NSString)syncStatusFooterText;
- (NSString)syncStatusMacToolTipText;
- (id)_currentKeepMessagesPreference;
- (id)_lastSyncedDateFromDefaults;
- (id)_lastSyncedDateString;
- (id)_stateModelForSyncState:(int64_t)a3;
- (id)captionTextForCaptionTextType:(int64_t)a3;
- (id)iCloudMessagingObserverToken;
- (id)valueTextForValueTextType:(int64_t)a3;
- (int64_t)resolvedSyncState;
- (int64_t)syncState;
- (int64_t)syncStatusMacButtonType;
- (void)_internalInit;
- (void)_resolveSyncState;
- (void)_syncedSettingsDidChange:(id)a3;
- (void)_updateActionForICQInAppMessage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setICloudMessagingObserverToken:(id)a3;
- (void)setKeepMessagesPreferenceManager:(id)a3;
- (void)setLastEngineSyncState:(id)a3;
- (void)setLastInAppMessage:(id)a3;
- (void)setResolvedSyncState:(int64_t)a3;
- (void)setSyncController:(id)a3;
- (void)setSyncStateModel:(id)a3;
- (void)setUpgradeICloudAction:(id)a3;
- (void)showICloudUpsellIfAvailable;
- (void)stopObservers;
- (void)syncButtonPressed;
- (void)updateKeepMessagesPreference:(id)a3;
@end

@implementation CKiCloudSettingsViewModel

- (CKiCloudSettingsViewModel)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKiCloudSettingsViewModel;
  v2 = [(CKiCloudSettingsViewModel *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CKiCloudSettingsViewModel *)v2 _internalInit];
  }
  return v3;
}

- (void)_internalInit
{
  v3 = objc_alloc_init(CKKeepMessagesPreferenceManager);
  keepMessagesPreferenceManager = self->_keepMessagesPreferenceManager;
  self->_keepMessagesPreferenceManager = v3;

  [(CKKeepMessagesPreferenceManager *)self->_keepMessagesPreferenceManager addSyncedSettingObserver:self selector:sel__syncedSettingsDidChange_ key:0];
  id location = 0;
  objc_initWeak(&location, self);
  objc_super v5 = [CKiCloudSettingsSyncController alloc];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __42__CKiCloudSettingsViewModel__internalInit__block_invoke;
  v25[3] = &unk_2653F5460;
  objc_copyWeak(&v26, &location);
  v6 = [(CKiCloudSettingsSyncController *)v5 initWithSyncStatusHandler:v25];
  syncController = self->_syncController;
  self->_syncController = v6;

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  v9 = (id *)getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr;
  uint64_t v36 = getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr;
  if (!getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr)
  {
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    v30 = __getICQCurrentInAppMessageChangedNotificationSymbolLoc_block_invoke;
    v31 = &unk_2653F54B0;
    v32 = &v33;
    v10 = (void *)iCloudQuotaUILibrary();
    v11 = dlsym(v10, "ICQCurrentInAppMessageChangedNotification");
    *(void *)(v32[1] + 24) = v11;
    getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr = *(void *)(v32[1] + 24);
    v9 = (id *)v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (v9)
  {
    id v12 = *v9;
    v13 = [MEMORY[0x263F08A48] mainQueue];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2;
    v23[3] = &unk_2653F5488;
    objc_copyWeak(&v24, &location);
    v14 = [v8 addObserverForName:v12 object:0 queue:v13 usingBlock:v23];
    id iCloudMessagingObserverToken = self->_iCloudMessagingObserverToken;
    self->_id iCloudMessagingObserverToken = v14;

    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v16 = (void *)getICQInAppMessagingClass_softClass;
    uint64_t v36 = getICQInAppMessagingClass_softClass;
    if (!getICQInAppMessagingClass_softClass)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __getICQInAppMessagingClass_block_invoke;
      v31 = &unk_2653F54B0;
      v32 = &v33;
      __getICQInAppMessagingClass_block_invoke((uint64_t)&v28);
      v16 = (void *)v34[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v33, 8);
    v18 = [v17 shared];
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    v19 = (id *)getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_ptr;
    uint64_t v36 = getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_ptr;
    if (!getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_ptr)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_block_invoke;
      v31 = &unk_2653F54B0;
      v32 = &v33;
      v20 = (void *)iCloudQuotaUILibrary();
      v21 = dlsym(v20, "ICQUIMessagePlacementInSettingsAppDetail");
      *(void *)(v32[1] + 24) = v21;
      getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_ptr = *(void *)(v32[1] + 24);
      v19 = (id *)v34[3];
    }
    _Block_object_dispose(&v33, 8);
    if (v19)
    {
      id v22 = *v19;
      [v18 observeUpdatesForBundleID:@"com.apple.MobileSMS" placement:v22];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
      return;
    }
    dlerror();
    abort_report_np();
  }
  else
  {
    dlerror();
    abort_report_np();
  }
  __break(1u);
}

void __42__CKiCloudSettingsViewModel__internalInit__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setLastEngineSyncState:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v5 _resolveSyncState];
}

void __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 userInfo];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  id v5 = (void *)getICQInAppMessageKeySymbolLoc_ptr;
  uint64_t v16 = getICQInAppMessageKeySymbolLoc_ptr;
  if (!getICQInAppMessageKeySymbolLoc_ptr)
  {
    v6 = (void *)iCloudQuotaUILibrary();
    v14[3] = (uint64_t)dlsym(v6, "ICQInAppMessageKey");
    getICQInAppMessageKeySymbolLoc_ptr = v14[3];
    id v5 = (void *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v5)
  {
    id v12 = (_Unwind_Exception *)__42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v12);
  }
  v7 = [v4 objectForKeyedSubscript:*v5];

  v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained _updateActionForICQInAppMessage:v7];

  id v10 = objc_loadWeakRetained(v8);
  [v10 setLastInAppMessage:v7];

  id v11 = objc_loadWeakRetained(v8);
  [v11 _resolveSyncState];
}

- (void)stopObservers
{
  [(CKKeepMessagesPreferenceManager *)self->_keepMessagesPreferenceManager removeSyncedSettingObserver:self key:0];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_iCloudMessagingObserverToken];

  id iCloudMessagingObserverToken = self->_iCloudMessagingObserverToken;
  self->_id iCloudMessagingObserverToken = 0;
}

- (void)_syncedSettingsDidChange:(id)a3
{
  id v4 = [(CKiCloudSettingsViewModel *)self delegate];
  [v4 iCloudSettingsViewModelDidUpdateState:self];
}

- (id)_stateModelForSyncState:(int64_t)a3
{
  id v5 = MEMORY[0x25A2A3250](@"com.apple.madrid", @"Server.TotalRecords.messageManateeZone");
  uint64_t v6 = [v5 unsignedIntegerValue];
  v7 = [(CKiCloudSettingsViewModel *)self _lastSyncedDateFromDefaults];
  v8 = [(CKiCloudSettingsViewModel *)self syncController];
  uint64_t v9 = [v8 messagesToUploadCount];

  LOBYTE(v8) = [(CKiCloudSettingsViewModel *)self _isBetweenInitialAndBackfillSync];
  id v10 = CKiCloudSyncStateBuilder;
  v14[0] = a3;
  v14[1] = v6;
  v14[2] = v9;
  id v11 = v7;
  id v12 = v11;
  v14[3] = v11;
  char v15 = (char)v8;
  if (CKiCloudSyncStateBuilder)
  {
    id v10 = +[CKiCloudSyncStateBuilder syncModelForDescriptor:v14];
  }
  else
  {
  }
  return v10;
}

- (id)_currentKeepMessagesPreference
{
  v2 = +[CKKeepMessagesPreferenceManager keepMessagesPreference];
  if ([v2 isEqualToNumber:&unk_2704C9228])
  {
    id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = v3;
    id v5 = @"KEEP_MESSAGES_FOREVER";
LABEL_7:
    uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

    goto LABEL_8;
  }
  if ([v2 isEqualToNumber:&unk_2704C9240])
  {
    id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = v3;
    id v5 = @"KEEP_MESSAGES_1MONTH";
    goto LABEL_7;
  }
  if ([v2 isEqualToNumber:&unk_2704C9258])
  {
    id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = v3;
    id v5 = @"KEEP_MESSAGES_1YEAR";
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_2561DD000, v8, OS_LOG_TYPE_INFO, "Programming error. Keep Messages preference is unknown.", v9, 2u);
    }
  }
  uint64_t v6 = &stru_2704C4418;
LABEL_8:

  return v6;
}

- (NSNumber)keepMessagePreferenceValue
{
  return (NSNumber *)+[CKKeepMessagesPreferenceManager keepMessagesPreference];
}

- (BOOL)isSyncingEnabled
{
  return MEMORY[0x270F3CD28](*MEMORY[0x263F4AA40], *MEMORY[0x263F4AB30]);
}

- (BOOL)isSyncing
{
  v2 = [(CKiCloudSettingsViewModel *)self syncController];
  char v3 = [v2 isSyncing];

  return v3;
}

- (BOOL)syncSupportsCancellation
{
  BOOL v3 = [(CKiCloudSettingsViewModel *)self isSyncing];
  if (v3) {
    LOBYTE(v3) = [(IMCloudKitSyncState *)self->_lastEngineSyncState syncType] == 6;
  }
  return v3;
}

- (BOOL)isSyncButtonEnabled
{
  if (![(CKiCloudSettingsViewModel *)self isSyncing]) {
    return 1;
  }
  return [(CKiCloudSettingsViewModel *)self syncSupportsCancellation];
}

- (BOOL)micAccountsMatch
{
  v2 = [(CKiCloudSettingsViewModel *)self syncController];
  char v3 = [v2 micAccountsMatch];

  return v3;
}

- (void)syncButtonPressed
{
  char v3 = [(CKiCloudSettingsViewModel *)self syncController];
  int v4 = [v3 isSyncing];

  id v5 = [(CKiCloudSettingsViewModel *)self syncController];
  id v6 = v5;
  if (v4) {
    [v5 cancelCurrentSync];
  }
  else {
    [v5 startSync];
  }
}

- (void)showICloudUpsellIfAvailable
{
  id v2 = [(CKiCloudSettingsViewModel *)self upgradeICloudAction];
  [v2 performAction];
}

- (void)_updateActionForICQInAppMessage:(id)a3
{
  id v9 = a3;
  if (v9
    && ([v9 actions], int v4 = objc_claimAutoreleasedReturnValue(), v4, v4)
    && ([v9 actions],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6 == 1))
  {
    v7 = [v9 actions];
    v8 = [v7 objectAtIndexedSubscript:0];
    [(CKiCloudSettingsViewModel *)self setUpgradeICloudAction:v8];
  }
  else
  {
    [(CKiCloudSettingsViewModel *)self setUpgradeICloudAction:0];
  }
}

- (void)updateKeepMessagesPreference:(id)a3
{
}

- (int64_t)syncState
{
  return [(CKiCloudSyncStateModel *)self->_syncStateModel syncState];
}

- (NSString)messagesInCloudCount
{
  return [(CKiCloudSyncStateModel *)self->_syncStateModel messagesInCloudCount];
}

- (NSString)syncStatus
{
  return [(CKiCloudSyncStateModel *)self->_syncStateModel syncStatus];
}

- (int64_t)syncStatusMacButtonType
{
  return [(CKiCloudSyncStateModel *)self->_syncStateModel syncStatusMacButtonType];
}

- (NSString)syncStatusFooterText
{
  char v3 = MEMORY[0x25A2A3250](@"com.apple.madrid", @"ShowDebugSummary");
  if ([v3 BOOLValue]) {
    [(CKiCloudSettingsSyncController *)self->_syncController syncSummary];
  }
  else {
  int v4 = [(CKiCloudSyncStateModel *)self->_syncStateModel syncStatusFooterText];
  }

  return (NSString *)v4;
}

- (NSString)syncStatusMacToolTipText
{
  return [(CKiCloudSyncStateModel *)self->_syncStateModel syncStatusMacToolTipText];
}

- (id)_lastSyncedDateString
{
  id v2 = [(CKiCloudSyncStateModel *)self->_syncStateModel lastSyncedDateString];
  char v3 = v2;
  if (!v2) {
    id v2 = &stru_2704C4418;
  }
  int v4 = v2;

  return v4;
}

- (NSString)syncStatusFooterSubstringForHyperlink
{
  return [(CKiCloudSyncStateModel *)self->_syncStateModel syncStatusFooterSubstringForHyperlink];
}

- (BOOL)isSyncAvailable
{
  return [(CKiCloudSyncStateModel *)self->_syncStateModel isSyncAvailable];
}

- (NSString)messagesLearnMoreUrlString
{
  return (NSString *)@"https://support.apple.com/HT208532";
}

- (id)_lastSyncedDateFromDefaults
{
  id v2 = MEMORY[0x25A2A3250](@"com.apple.madrid", *MEMORY[0x263F4AA20]);
  char v3 = v2;
  if (v2)
  {
    int v4 = [v2 objectForKey:*MEMORY[0x263F4AAE0]];
    if (v4)
    {
      id v5 = [v3 objectForKey:*MEMORY[0x263F4AB28]];
      uint64_t v6 = v5;
      if (v5)
      {
        v7 = (void *)MEMORY[0x263EFF910];
        [v5 doubleValue];
        v8 = objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isBetweenInitialAndBackfillSync
{
  id v2 = MEMORY[0x25A2A3250](@"com.apple.madrid", *MEMORY[0x263F4AA20]);
  char v3 = v2;
  if (v2)
  {
    int v4 = [v2 objectForKey:*MEMORY[0x263F4AAF8]];
    id v5 = [v3 objectForKey:*MEMORY[0x263F4AAE0]];
    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    BOOL v7 = v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)footerHyperlinkUrl
{
  unint64_t v2 = [(CKiCloudSyncStateModel *)self->_syncStateModel syncState] - 3;
  if (v2 < 4) {
    return &off_2653F5508[v2]->isa;
  }
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2561DD000, v4, OS_LOG_TYPE_INFO, "Tried to get a footer hyperlink URL for an unsupported Sync State. Programmer error.", v5, 2u);
    }
  }
  return 0;
}

- (void)_resolveSyncState
{
  char v3 = self->_lastEngineSyncState;
  int v4 = self->_lastInAppMessage;
  id v5 = [(CKiCloudSettingsViewModel *)self syncController];
  int v6 = [v5 isMiCEnabled];

  BOOL v7 = [(CKiCloudSettingsViewModel *)self syncController];
  int v8 = [v7 micAccountsMatch];

  uint64_t v9 = 6;
  if (v8) {
    uint64_t v9 = 0;
  }
  int v10 = v6 ^ 1 | v8;
  if (v6) {
    int64_t v11 = v9;
  }
  else {
    int64_t v11 = 0;
  }
  if (v10 == 1 && v3)
  {
    unint64_t v12 = [(IMCloudKitSyncState *)v3 syncJobState] - 1;
    if (v12 < 5)
    {
      int64_t v11 = qword_2562110F0[v12];
      goto LABEL_40;
    }
    int64_t v11 = 0;
  }
  if (!v11 && v4)
  {
    uint64_t v13 = [(ICQInAppMessage *)v4 reason];
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    v14 = (void *)getICQUIInAppMessageReasonServerUnreachableSymbolLoc_ptr;
    uint64_t v31 = getICQUIInAppMessageReasonServerUnreachableSymbolLoc_ptr;
    if (!getICQUIInAppMessageReasonServerUnreachableSymbolLoc_ptr)
    {
      char v15 = (void *)iCloudQuotaUILibrary();
      v29[3] = (uint64_t)dlsym(v15, "ICQUIInAppMessageReasonServerUnreachable");
      getICQUIInAppMessageReasonServerUnreachableSymbolLoc_ptr = v29[3];
      v14 = (void *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (v14)
    {
      if ([v13 isEqualToString:*v14])
      {
        int64_t v11 = 3;
LABEL_39:

        goto LABEL_40;
      }
      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x2020000000;
      uint64_t v16 = (void *)getICQUIInAppMessageReasonAirplaneModeOnSymbolLoc_ptr;
      uint64_t v31 = getICQUIInAppMessageReasonAirplaneModeOnSymbolLoc_ptr;
      if (!getICQUIInAppMessageReasonAirplaneModeOnSymbolLoc_ptr)
      {
        id v17 = (void *)iCloudQuotaUILibrary();
        v29[3] = (uint64_t)dlsym(v17, "ICQUIInAppMessageReasonAirplaneModeOn");
        getICQUIInAppMessageReasonAirplaneModeOnSymbolLoc_ptr = v29[3];
        uint64_t v16 = (void *)v29[3];
      }
      _Block_object_dispose(&v28, 8);
      if (v16)
      {
        if ([v13 isEqualToString:*v16])
        {
          int64_t v11 = 4;
          goto LABEL_39;
        }
        uint64_t v28 = 0;
        uint64_t v29 = &v28;
        uint64_t v30 = 0x2020000000;
        v18 = (void *)getICQUIInAppMessageReasonCellularDataOffSymbolLoc_ptr;
        uint64_t v31 = getICQUIInAppMessageReasonCellularDataOffSymbolLoc_ptr;
        if (!getICQUIInAppMessageReasonCellularDataOffSymbolLoc_ptr)
        {
          v19 = (void *)iCloudQuotaUILibrary();
          v29[3] = (uint64_t)dlsym(v19, "ICQUIInAppMessageReasonCellularDataOff");
          getICQUIInAppMessageReasonCellularDataOffSymbolLoc_ptr = v29[3];
          v18 = (void *)v29[3];
        }
        _Block_object_dispose(&v28, 8);
        if (v18)
        {
          if ([v13 isEqualToString:*v18])
          {
            int64_t v11 = 5;
            goto LABEL_39;
          }
          uint64_t v28 = 0;
          uint64_t v29 = &v28;
          uint64_t v30 = 0x2020000000;
          v20 = (void *)getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr;
          uint64_t v31 = getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr;
          if (!getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr)
          {
            v21 = (void *)iCloudQuotaUILibrary();
            v29[3] = (uint64_t)dlsym(v21, "ICQUIInAppMessageReasoniCloudAlmostFull");
            getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr = v29[3];
            v20 = (void *)v29[3];
          }
          _Block_object_dispose(&v28, 8);
          if (v20)
          {
            if ([v13 isEqualToString:*v20])
            {
              int64_t v11 = 7;
              goto LABEL_39;
            }
            uint64_t v28 = 0;
            uint64_t v29 = &v28;
            uint64_t v30 = 0x2020000000;
            id v22 = (void *)getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr;
            uint64_t v31 = getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr;
            if (!getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr)
            {
              v23 = (void *)iCloudQuotaUILibrary();
              v29[3] = (uint64_t)dlsym(v23, "ICQUIInAppMessageReasoniCloudFull");
              getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr = v29[3];
              id v22 = (void *)v29[3];
            }
            _Block_object_dispose(&v28, 8);
            if (v22)
            {
              if ([v13 isEqualToString:*v22]) {
                int64_t v11 = 8;
              }
              else {
                int64_t v11 = 0;
              }
              goto LABEL_39;
            }
LABEL_45:
            v27 = (_Unwind_Exception *)__42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
            _Block_object_dispose(&v28, 8);
            _Unwind_Resume(v27);
          }
LABEL_44:
          __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
          goto LABEL_45;
        }
LABEL_43:
        __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
        goto LABEL_44;
      }
    }
    else
    {
      __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
    }
    __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1();
    goto LABEL_43;
  }
LABEL_40:
  self->_resolvedSyncState = v11;
  id v24 = [(CKiCloudSettingsViewModel *)self _stateModelForSyncState:v11];
  syncStateModel = self->_syncStateModel;
  self->_syncStateModel = v24;

  id v26 = [(CKiCloudSettingsViewModel *)self delegate];
  [v26 iCloudSettingsViewModelDidUpdateState:self];
}

- (id)captionTextForCaptionTextType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      int v6 = @"HEADING_TITLE";
      goto LABEL_9;
    case 1:
      int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      int v6 = @"SECURELY_STORE_YOUR_MESSAGES_IN_ICLOUD";
      goto LABEL_9;
    case 2:
      int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      int v6 = @"USE_ON_THIS_DEVICE";
      goto LABEL_9;
    case 3:
      int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      int v6 = @"MANAGE_STORAGE_TITLE";
      goto LABEL_9;
    case 4:
      int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      int v6 = @"IN_ICLOUD_TITLE";
      goto LABEL_9;
    case 5:
      int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      int v6 = @"KEEP_MESSAGES_TITLE";
      goto LABEL_9;
    case 6:
      int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      int v6 = @"STATUS_TITLE";
LABEL_9:
      char v3 = [v4 localizedStringForKey:v6 value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

      break;
    default:
      break;
  }
  return v3;
}

- (id)valueTextForValueTextType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      self = [(CKiCloudSettingsViewModel *)self messagesInCloudCount];
      goto LABEL_9;
    case 1:
      self = [(CKiCloudSettingsViewModel *)self keepMessagesPreference];
      goto LABEL_9;
    case 2:
      self = [(CKiCloudSettingsViewModel *)self syncStatus];
      goto LABEL_9;
    case 3:
      self = [(CKiCloudSettingsViewModel *)self _lastSyncedDateString];
LABEL_9:
      break;
    default:
      break;
  }
  return self;
}

- (NSString)syncButtonText
{
  if ([(CKiCloudSettingsViewModel *)self syncSupportsCancellation])
  {
    BOOL v3 = [(CKiCloudSettingsViewModel *)self isSyncing];
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = v4;
    if (v3) {
      int v6 = @"CANCEL_SYNCING";
    }
    else {
      int v6 = @"SYNC_NOW";
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = v4;
    int v6 = @"SYNC_NOW";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  return (NSString *)v7;
}

- (ICQInAppAction)upgradeICloudAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_upgradeICloudAction);
  return (ICQInAppAction *)WeakRetained;
}

- (void)setUpgradeICloudAction:(id)a3
{
}

- (CKiCloudSettingsViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CKiCloudSettingsViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKiCloudSettingsSyncController)syncController
{
  return self->_syncController;
}

- (void)setSyncController:(id)a3
{
}

- (CKiCloudSyncStateModel)syncStateModel
{
  return self->_syncStateModel;
}

- (void)setSyncStateModel:(id)a3
{
}

- (id)iCloudMessagingObserverToken
{
  return self->_iCloudMessagingObserverToken;
}

- (void)setICloudMessagingObserverToken:(id)a3
{
}

- (CKKeepMessagesPreferenceManager)keepMessagesPreferenceManager
{
  return self->_keepMessagesPreferenceManager;
}

- (void)setKeepMessagesPreferenceManager:(id)a3
{
}

- (ICQInAppMessage)lastInAppMessage
{
  return self->_lastInAppMessage;
}

- (void)setLastInAppMessage:(id)a3
{
}

- (IMCloudKitSyncState)lastEngineSyncState
{
  return self->_lastEngineSyncState;
}

- (void)setLastEngineSyncState:(id)a3
{
}

- (int64_t)resolvedSyncState
{
  return self->_resolvedSyncState;
}

- (void)setResolvedSyncState:(int64_t)a3
{
  self->_resolvedSyncState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEngineSyncState, 0);
  objc_storeStrong((id *)&self->_lastInAppMessage, 0);
  objc_storeStrong((id *)&self->_keepMessagesPreferenceManager, 0);
  objc_storeStrong(&self->_iCloudMessagingObserverToken, 0);
  objc_storeStrong((id *)&self->_syncStateModel, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_upgradeICloudAction);
}

uint64_t __42__CKiCloudSettingsViewModel__internalInit__block_invoke_2_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getICQInAppMessagingClass_block_invoke_cold_1(v0);
}

@end