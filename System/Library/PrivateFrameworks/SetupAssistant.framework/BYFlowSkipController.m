@interface BYFlowSkipController
+ (BOOL)_shouldObserveChangeFromNetworkSSID:(id *)a3;
+ (id)_actionForFlowSkipIdentifiers:(id)a3;
+ (id)_actionIdentifierForFlowSkipIdentifier:(id)a3;
+ (id)_flowSkipIdentifierFromActionIdentifier:(id)a3;
+ (id)_localizedStringListingFlowSkipIdentifiers:(id)a3;
+ (id)_supportedIdentifiers;
+ (id)flowSkipIdentifiersFromFollowUpAction:(id)a3;
+ (id)sharedInstance;
+ (void)_clearShouldObserveChangeFromNetworkSSID;
+ (void)_setShouldObserveChangeFromNetworkSSID:(id)a3;
- (BOOL)_isBasicFunctionalityEnabled;
- (BOOL)_isPasscodeSet;
- (BYCapabilities)capabilities;
- (BYFlowSkipController)init;
- (id)_followUpController;
- (id)_pendingFollowUpItem;
- (id)getFlowSkipIdentifiers;
- (int64_t)_timeIntervalForFrequentNotifications;
- (int64_t)_timeIntervalForNotifications;
- (int64_t)_timeIntervalForWifiObserver;
- (int64_t)_timeoutForWifiObserver;
- (void)_pendingFollowUpItem;
- (void)_persistInitialNetworkSSID;
- (void)_postFollowUpItemForFlowSkipIdentifiers:(id)a3 previousFollowUpItem:(id)a4 forceNotification:(BOOL)a5;
- (void)_registerWiFiObserverActivityWithNeedsActivity:(BOOL)a3 handlerQueue:(id)a4;
- (void)_repostExistingFollowUpItemForcingNotification:(id)a3;
- (void)cancelPendingFlows;
- (void)didCompleteFlow:(id)a3;
- (void)didSkipFlow:(id)a3;
- (void)observeFinishSetupTriggers;
- (void)passcodeDidChange;
- (void)registerActivities;
- (void)revisePendingFollowUpsForcingRepost:(BOOL)a3;
- (void)setBasicFunctionalityEnabled:(BOOL)a3;
- (void)setCapabilities:(id)a3;
- (void)unregisterActivities;
@end

@implementation BYFlowSkipController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance__instance;
  return v2;
}

uint64_t __38__BYFlowSkipController_sharedInstance__block_invoke()
{
  sharedInstance__instance = objc_alloc_init(BYFlowSkipController);
  return MEMORY[0x1F41817F8]();
}

- (id)_followUpController
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_followUpController_doNotAccessDirectly)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F5B768]) initWithClientIdentifier:@"com.apple.purplebuddy"];
    followUpController_doNotAccessDirectly = v2->_followUpController_doNotAccessDirectly;
    v2->_followUpController_doNotAccessDirectly = (FLFollowUpController *)v3;
  }
  objc_sync_exit(v2);

  v5 = v2->_followUpController_doNotAccessDirectly;
  return v5;
}

- (BYFlowSkipController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BYFlowSkipController;
  v2 = [(BYFlowSkipController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(BYCapabilities);
    capabilities = v2->_capabilities;
    v2->_capabilities = v3;
  }
  return v2;
}

- (void)setBasicFunctionalityEnabled:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  _basicFunctionalityEnabled_doNotAccessDirectly = a3;
  v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = _basicFunctionalityEnabled_doNotAccessDirectly;
    _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Flow skip basic functionality enabled: %d", (uint8_t *)v6, 8u);
  }

  objc_sync_exit(v4);
}

- (BOOL)_isBasicFunctionalityEnabled
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  char v3 = _basicFunctionalityEnabled_doNotAccessDirectly;
  objc_sync_exit(v2);

  return v3;
}

+ (id)_supportedIdentifiers
{
  if (_supportedIdentifiers_onceToken != -1) {
    dispatch_once(&_supportedIdentifiers_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)_supportedIdentifiers__identifiers;
  return v2;
}

void __45__BYFlowSkipController__supportedIdentifiers__block_invoke()
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"siri";
  v4[1] = @"applePay";
  v4[2] = @"appleID";
  v4[3] = @"passcode";
  v4[4] = @"touchID";
  v4[5] = @"faceID";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  char v3 = (void *)_supportedIdentifiers__identifiers;
  _supportedIdentifiers__identifiers = v2;
}

- (void)didSkipFlow:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[BYFlowSkipController _supportedIdentifiers];
  int v6 = [v5 containsObject:v4];

  if (!v6)
  {
    uint64_t v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BYFlowSkipController didSkipFlow:]((uint64_t)v4, v7);
    }
    goto LABEL_12;
  }
  if ([(BYFlowSkipController *)self _isBasicFunctionalityEnabled])
  {
    uint64_t v7 = [(BYFlowSkipController *)self _pendingFollowUpItem];
    v8 = [v7 actions];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = [v7 actions];
      v11 = [v10 firstObject];
      v12 = [v11 userInfo];
      v13 = [v12 objectForKeyedSubscript:@"flowSkipIdentifiers"];

      if (v13)
      {
        if (([v13 containsObject:v4] & 1) == 0)
        {
          uint64_t v14 = [v13 arrayByAddingObject:v4];

          v13 = (void *)v14;
        }
        goto LABEL_11;
      }
    }
    else
    {
      v10 = 0;
    }
    v15[0] = v4;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
LABEL_11:
    [(BYFlowSkipController *)self _postFollowUpItemForFlowSkipIdentifiers:v13 previousFollowUpItem:v7 forceNotification:0];

LABEL_12:
  }
}

- (void)didCompleteFlow:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[BYFlowSkipController _supportedIdentifiers];
  int v6 = [v5 containsObject:v4];

  if (!v6)
  {
    uint64_t v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BYFlowSkipController didSkipFlow:]((uint64_t)v4, v7);
    }
    goto LABEL_16;
  }
  if ([(BYFlowSkipController *)self _isBasicFunctionalityEnabled])
  {
    uint64_t v7 = [(BYFlowSkipController *)self _pendingFollowUpItem];
    v8 = [v7 actions];
    uint64_t v9 = [v8 firstObject];
    v10 = [v9 userInfo];
    v11 = [v10 objectForKeyedSubscript:@"flowSkipIdentifiers"];

    if ([v11 containsObject:v4])
    {
      if (v11)
      {
        v12 = (void *)[v11 mutableCopy];
        [v12 removeObject:v4];
        uint64_t v13 = [v12 copy];

        v11 = (void *)v13;
      }
      if ([v11 count])
      {
        [(BYFlowSkipController *)self _postFollowUpItemForFlowSkipIdentifiers:v11 previousFollowUpItem:v7 forceNotification:0];
      }
      else
      {
        uint64_t v14 = [(BYFlowSkipController *)self _followUpController];
        v26[0] = @"com.apple.purplebuddy.revisitSkippedSteps";
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
        id v23 = 0;
        int v16 = [v14 clearPendingFollowUpItemsWithUniqueIdentifiers:v15 error:&v23];
        id v17 = v23;

        v18 = _BYLoggingFacility();
        v19 = v18;
        if (v16)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7DED000, v19, OS_LOG_TYPE_DEFAULT, "Cleared obsoleted follow up items", buf, 2u);
          }
        }
        else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          if (_BYIsInternalInstall())
          {
            int v20 = 0;
            v21 = v17;
          }
          else if (v17)
          {
            v22 = NSString;
            v15 = [v17 domain];
            v21 = [v22 stringWithFormat:@"<Error domain: %@, code %ld>", v15, objc_msgSend(v17, "code")];
            int v20 = 1;
          }
          else
          {
            int v20 = 0;
            v21 = 0;
          }
          *(_DWORD *)buf = 138543362;
          v25 = v21;
          _os_log_error_impl(&dword_1A7DED000, v19, OS_LOG_TYPE_ERROR, "Failed to clear obsoleted follow up items: %{public}@", buf, 0xCu);
          if (v20)
          {
          }
        }
      }
    }

LABEL_16:
  }
}

- (void)cancelPendingFlows
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if ([(BYFlowSkipController *)self _isBasicFunctionalityEnabled])
  {
    char v3 = [(BYFlowSkipController *)self _followUpController];
    v15[0] = @"com.apple.purplebuddy.revisitSkippedSteps";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v12 = 0;
    int v5 = [v3 clearPendingFollowUpItemsWithUniqueIdentifiers:v4 error:&v12];
    id v6 = v12;

    uint64_t v7 = _BYLoggingFacility();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "Cleared pending follow up items", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (_BYIsInternalInstall())
      {
        int v9 = 0;
        v10 = v6;
      }
      else if (v6)
      {
        v11 = NSString;
        id v4 = [v6 domain];
        v10 = [v11 stringWithFormat:@"<Error domain: %@, code %ld>", v4, objc_msgSend(v6, "code")];
        int v9 = 1;
      }
      else
      {
        int v9 = 0;
        v10 = 0;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v10;
      _os_log_error_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_ERROR, "Failed to clear pending follow up items: %{public}@", buf, 0xCu);
      if (v9)
      {
      }
    }
  }
}

- (id)_pendingFollowUpItem
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(BYFlowSkipController *)self _followUpController];
  id v20 = 0;
  char v3 = [v2 pendingFollowUpItems:&v20];
  id v4 = v20;

  if (v4)
  {
    int v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(BYFlowSkipController *)v4 _pendingFollowUpItem];
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "uniqueIdentifier", (void)v16);
        int v13 = [v12 isEqualToString:@"com.apple.purplebuddy.revisitSkippedSteps"];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_15:

  return v14;
}

- (void)_postFollowUpItemForFlowSkipIdentifiers:(id)a3 previousFollowUpItem:(id)a4 forceNotification:(BOOL)a5
{
  BOOL v55 = a5;
  v62[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F5B770];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  [v10 setUniqueIdentifier:@"com.apple.purplebuddy.revisitSkippedSteps"];
  [v10 setGroupIdentifier:*MEMORY[0x1E4F5B728]];
  [v10 setTargetBundleIdentifier:*MEMORY[0x1E4F5B710]];
  v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"FOLLOWUP_TITLE" value:&stru_1EFE45E30 table:@"FollowUp"];
  [v10 setTitle:v12];

  int v13 = [(BYFlowSkipController *)self capabilities];
  LODWORD(v12) = [v13 supportsPearl];

  v56 = self;
  if (v12)
  {
    id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = v14;
    long long v16 = @"FOLLOWUP_DETAIL_FACEID";
  }
  else
  {
    long long v17 = [(BYFlowSkipController *)self capabilities];
    int v18 = [v17 mgHasMesa];

    id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = v14;
    if (v18) {
      long long v16 = @"FOLLOWUP_DETAIL_TOUCHID";
    }
    else {
      long long v16 = @"FOLLOWUP_DETAIL";
    }
  }
  long long v19 = [v14 localizedStringForKey:v16 value:&stru_1EFE45E30 table:@"FollowUp"];

  [v10 setInformativeText:v19];
  [v10 setDisplayStyle:0];
  id v20 = [v9 userInfo];

  v21 = [v20 objectForKeyedSubscript:@"initialPostDate"];

  if (v21)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v23 = v22;
    [v21 doubleValue];
    double v25 = v23 - v24;
  }
  else
  {
    v26 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v21 = objc_msgSend(v26, "numberWithDouble:");
    double v25 = 0.0;
  }
  v61 = @"initialPostDate";
  v62[0] = v21;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
  [v10 setUserInfo:v27];

  v28 = +[BYFlowSkipController _actionForFlowSkipIdentifiers:v7];
  v60 = v28;
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  [v10 setActions:v29];

  if (v25 < (double)[(BYFlowSkipController *)self _timeIntervalForNotifications])
  {
    v52 = v28;
    v53 = v19;
    id v29 = objc_alloc_init(MEMORY[0x1E4F5B778]);
    v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"NOTIFICATION_TITLE" value:&stru_1EFE45E30 table:@"FollowUp"];
    [v29 setTitle:v31];

    v32 = +[BYFlowSkipController _localizedStringListingFlowSkipIdentifiers:v7];
    id v54 = v7;
    uint64_t v33 = [v7 count];
    v34 = NSString;
    v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v36 = v35;
    if (v33 == 1) {
      v37 = @"NOTIFICATION_DETAIL_FLOW";
    }
    else {
      v37 = @"NOTIFICATION_DETAIL_FLOWS";
    }
    v38 = [v35 localizedStringForKey:v37 value:&stru_1EFE45E30 table:@"FollowUp"];
    v39 = objc_msgSend(v34, "localizedStringWithFormat:", v38, v32);
    [v29 setInformativeText:v39];

    objc_msgSend(v29, "setFrequency:", dbl_1A7E32A20[v25 < (double)-[BYFlowSkipController _timeIntervalForFrequentNotifications](v56, "_timeIntervalForFrequentNotifications")]);
    [v29 setFirstNotificationDelay:3600.0];
    v40 = [MEMORY[0x1E4F5B778] defaultOptions];
    v41 = [v40 setByAddingObject:*MEMORY[0x1E4F5B758]];

    if (v55)
    {
      uint64_t v42 = [v41 setByAddingObject:*MEMORY[0x1E4F5B748]];

      v41 = (void *)v42;
    }
    [v29 setOptions:v41];
    [v10 setNotification:v29];

    long long v19 = v53;
    id v7 = v54;
    v28 = v52;
    self = v56;
  }
  v43 = [(BYFlowSkipController *)self _followUpController];
  id v57 = 0;
  int v44 = [v43 postFollowUpItem:v10 error:&v57];
  id v45 = v57;

  v46 = _BYLoggingFacility();
  v47 = v46;
  if (v44)
  {
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v59 = v10;
      _os_log_impl(&dword_1A7DED000, v47, OS_LOG_TYPE_DEFAULT, "Posted new follow up item: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    v48 = v19;
    if (_BYIsInternalInstall())
    {
      int v49 = 0;
      v50 = v45;
    }
    else if (v45)
    {
      v51 = NSString;
      id v29 = [v45 domain];
      v50 = [v51 stringWithFormat:@"<Error domain: %@, code %ld>", v29, objc_msgSend(v45, "code")];
      int v49 = 1;
    }
    else
    {
      int v49 = 0;
      v50 = 0;
    }
    *(_DWORD *)buf = 138543362;
    id v59 = v50;
    _os_log_error_impl(&dword_1A7DED000, v47, OS_LOG_TYPE_ERROR, "Failed to post new follow up item: %{public}@", buf, 0xCu);
    if (v49)
    {
    }
    long long v19 = v48;
  }
}

- (void)_repostExistingFollowUpItemForcingNotification:(id)a3
{
  id v8 = a3;
  id v4 = [v8 actions];
  int v5 = [v4 firstObject];
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"flowSkipIdentifiers"];

  if ([v7 count]) {
    [(BYFlowSkipController *)self _postFollowUpItemForFlowSkipIdentifiers:v7 previousFollowUpItem:v8 forceNotification:1];
  }
}

+ (id)flowSkipIdentifiersFromFollowUpAction:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 identifier];
  int v5 = +[BYFlowSkipController _flowSkipIdentifierFromActionIdentifier:v4];

  if ([v5 isEqualToString:@"everything"])
  {
    id v6 = [v3 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"flowSkipIdentifiers"];
  }
  else
  {
    v9[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }

  return v7;
}

+ (id)_actionForFlowSkipIdentifiers:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F5B760]);
  if ((unint64_t)[v3 count] < 2)
  {
    id v7 = [v3 firstObject];
    id v8 = +[BYFlowSkipController _actionIdentifierForFlowSkipIdentifier:v7];
    [v4 setIdentifier:v8];

    id v9 = NSString;
    int v5 = [v3 firstObject];
    id v6 = [v9 localizedStringWithFormat:@"FOLLOWUP_ACTION_LABEL.%@", v5];
  }
  else
  {
    int v5 = +[BYFlowSkipController _actionIdentifierForFlowSkipIdentifier:@"everything"];
    [v4 setIdentifier:v5];
    id v6 = @"FOLLOWUP_ACTION_LABEL_ALL";
  }

  id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:v6 value:&stru_1EFE45E30 table:@"FollowUp"];
  [v4 setLabel:v11];

  int v18 = @"flowSkipIdentifiers";
  v19[0] = v3;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  [v4 setUserInfo:v12];

  int v13 = [v3 componentsJoinedByString:@","];
  id v14 = (void *)MEMORY[0x1E4F1CB10];
  v15 = [NSString stringWithFormat:@"prefs:root=SETUP_FINISH&flow=%@", v13];
  long long v16 = [v14 URLWithString:v15];
  [v4 setUrl:v16];

  return v4;
}

+ (id)_actionIdentifierForFlowSkipIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.purplebuddy.revisitSkippedSteps", a3];
}

+ (id)_flowSkipIdentifierFromActionIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  id v4 = [v3 lastObject];

  return v4;
}

- (void)passcodeDidChange
{
  if ([(BYFlowSkipController *)self _isPasscodeSet])
  {
    id v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "A passcode is now set; removing finish setup passcode follow up item",
        v4,
        2u);
    }

    [(BYFlowSkipController *)self didCompleteFlow:@"passcode"];
  }
}

- (BOOL)_isPasscodeSet
{
  uint64_t v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (void)revisePendingFollowUpsForcingRepost:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int v5 = [(BYFlowSkipController *)self _pendingFollowUpItem];
  id v6 = [v5 actions];
  id v7 = [v6 firstObject];
  id v8 = [v7 userInfo];
  id v9 = [v8 objectForKeyedSubscript:@"flowSkipIdentifiers"];

  if (![v9 count]) {
    goto LABEL_44;
  }
  v37 = (void *)[v9 mutableCopy];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v46 count:16];
  BOOL v12 = v11 != 0;
  if (!v11) {
    goto LABEL_29;
  }
  uint64_t v13 = v11;
  BOOL v34 = v11 != 0;
  BOOL v35 = v3;
  v36 = v9;
  char v14 = 0;
  uint64_t v15 = *(void *)v40;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v40 != v15) {
        objc_enumerationMutation(v10);
      }
      long long v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      if ([v17 isEqualToString:@"touchID"])
      {
        int v18 = [(BYFlowSkipController *)self capabilities];
        char v19 = [v18 canShowTouchIDScreen];
      }
      else if ([v17 isEqualToString:@"faceID"])
      {
        int v18 = [(BYFlowSkipController *)self capabilities];
        char v19 = [v18 canShowFaceIDScreen];
      }
      else if ([v17 isEqualToString:@"passcode"])
      {
        int v18 = [(BYFlowSkipController *)self capabilities];
        char v19 = [v18 canShowPasscodeScreen];
      }
      else if ([v17 isEqualToString:@"appleID"])
      {
        int v18 = [(BYFlowSkipController *)self capabilities];
        char v19 = [v18 canShowAppleIDScreen];
      }
      else if ([v17 isEqualToString:@"applePay"])
      {
        int v18 = [(BYFlowSkipController *)self capabilities];
        char v19 = [v18 canShowPaymentScreen];
      }
      else
      {
        if (![v17 isEqualToString:@"siri"]) {
          continue;
        }
        int v18 = [(BYFlowSkipController *)self capabilities];
        char v19 = [v18 canShowSiriScreen];
      }
      char v20 = v19;

      if ((v20 & 1) == 0)
      {
        [v37 removeObject:v17];
        char v14 = 1;
      }
    }
    uint64_t v13 = [v10 countByEnumeratingWithState:&v39 objects:v46 count:16];
  }
  while (v13);

  if ((v14 & 1) == 0)
  {
    BOOL v12 = 0;
    id v9 = v36;
    BOOL v3 = v35;
    if (!v35) {
      goto LABEL_35;
    }
    goto LABEL_32;
  }
  v21 = _BYLoggingFacility();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    double v22 = [v10 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138543362;
    id v45 = v22;
    _os_log_impl(&dword_1A7DED000, v21, OS_LOG_TYPE_DEFAULT, "Revising current flow skip identifiers: %{public}@", buf, 0xCu);
  }
  id v10 = _BYLoggingFacility();
  id v9 = v36;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v23 = [v37 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138543362;
    id v45 = v23;
    _os_log_impl(&dword_1A7DED000, v10, OS_LOG_TYPE_DEFAULT, "New flow skip identifiers: %{public}@", buf, 0xCu);
  }
  BOOL v12 = v34;
  BOOL v3 = v35;
LABEL_29:

  if (v3)
  {
LABEL_32:
    double v24 = _BYLoggingFacility();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v24, OS_LOG_TYPE_DEFAULT, "Forcing a repost of finish setup flows...", buf, 2u);
    }
  }
LABEL_35:
  if ([v37 count])
  {
    if (v12 || v3) {
      [(BYFlowSkipController *)self _postFollowUpItemForFlowSkipIdentifiers:v37 previousFollowUpItem:v5 forceNotification:0];
    }
  }
  else
  {
    double v25 = [(BYFlowSkipController *)self _followUpController];
    v43 = @"com.apple.purplebuddy.revisitSkippedSteps";
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    id v38 = 0;
    int v27 = [v25 clearPendingFollowUpItemsWithUniqueIdentifiers:v26 error:&v38];
    id v28 = v38;

    id v29 = _BYLoggingFacility();
    v30 = v29;
    if (v27)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7DED000, v30, OS_LOG_TYPE_DEFAULT, "Cleared obsoleted follow up items", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      if (_BYIsInternalInstall())
      {
        int v31 = 0;
        v32 = v28;
      }
      else if (v28)
      {
        uint64_t v33 = NSString;
        v26 = [v28 domain];
        v32 = [v33 stringWithFormat:@"<Error domain: %@, code %ld>", v26, objc_msgSend(v28, "code")];
        int v31 = 1;
      }
      else
      {
        int v31 = 0;
        v32 = 0;
      }
      *(_DWORD *)buf = 138543362;
      id v45 = v32;
      _os_log_error_impl(&dword_1A7DED000, v30, OS_LOG_TYPE_ERROR, "Failed to clear obsoleted follow up items: %{public}@", buf, 0xCu);
      if (v31)
      {
      }
    }
  }
LABEL_44:
}

+ (id)_localizedStringListingFlowSkipIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v11 = [v10 localizedStringForKey:v9 value:&stru_1EFE45E30 table:@"FollowUp"];
        [v4 addObject:v11];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  BOOL v12 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v4];

  return v12;
}

- (void)observeFinishSetupTriggers
{
  [(BYFlowSkipController *)self _persistInitialNetworkSSID];
  [(BYFlowSkipController *)self registerActivities];
}

+ (void)_setShouldObserveChangeFromNetworkSSID:(id)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = &unk_1EFE4E400;
  }
  CFPreferencesSetAppValue(@"PBInitialNetworkSSID", v3, @"com.apple.purplebuddy.notbackedup");
  CFPreferencesAppSynchronize(@"com.apple.purplebuddy.notbackedup");
}

+ (BOOL)_shouldObserveChangeFromNetworkSSID:(id *)a3
{
  CFPreferencesAppSynchronize(@"com.apple.purplebuddy.notbackedup");
  id v4 = (id)CFPreferencesCopyAppValue(@"PBInitialNetworkSSID", @"com.apple.purplebuddy.notbackedup");
  *a3 = v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      *a3 = 0;
    }
  }
  return v4 != 0;
}

+ (void)_clearShouldObserveChangeFromNetworkSSID
{
  CFPreferencesSetAppValue(@"PBInitialNetworkSSID", 0, @"com.apple.purplebuddy.notbackedup");
  CFPreferencesAppSynchronize(@"com.apple.purplebuddy.notbackedup");
}

- (void)_persistInitialNetworkSSID
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(BYFlowSkipController *)self _pendingFollowUpItem];
  if (v2)
  {
    id v3 = [getWFClientClass() sharedInstance];
    id v4 = [v3 interface];
    uint64_t v5 = [v4 currentNetwork];
    uint64_t v6 = [v5 ssid];

    uint64_t v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Finish setup observing changes from network SSID: %@", (uint8_t *)&v8, 0xCu);
    }

    +[BYFlowSkipController _setShouldObserveChangeFromNetworkSSID:v6];
  }
}

- (int64_t)_timeoutForWifiObserver
{
  return 3000;
}

- (int64_t)_timeIntervalForWifiObserver
{
  return 300;
}

- (void)_registerWiFiObserverActivityWithNeedsActivity:(BOOL)a3 handlerQueue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[BYXPCActivityRegistrar sharedInstance];
  uint64_t v8 = *MEMORY[0x1E4F14158];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke;
  v10[3] = &unk_1E5D2C650;
  BOOL v13 = a3;
  id v11 = v6;
  BOOL v12 = self;
  id v9 = v6;
  [v7 registerActivityWithIdentifier:"com.apple.purplebuddy.finishsetup.wifiobserver" criteria:v8 handler:v10];
}

void __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke_2;
  v7[3] = &unk_1E5D2C628;
  char v10 = *(unsigned char *)(a1 + 48);
  id v8 = v3;
  uint64_t v9 = v4;
  uint64_t v5 = *(NSObject **)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  if (!*(unsigned char *)(a1 + 56))
  {
    id v3 = 0;
LABEL_9:
    uint64_t v9 = +[BYXPCActivityRegistrar sharedInstance];
    [v9 unregisterActivityWithIdentifier:"com.apple.purplebuddy.finishsetup.wifiobserver"];

    goto LABEL_18;
  }
  id v28 = 0;
  BOOL v2 = +[BYFlowSkipController _shouldObserveChangeFromNetworkSSID:&v28];
  id v3 = v28;
  *((unsigned char *)v30 + 24) = v2;
  if (!v2)
  {
    uint64_t v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "Will not monitor for Wi-Fi SSID changes for finish setup", buf, 2u);
    }

    if (!*((unsigned char *)v30 + 24)) {
      goto LABEL_9;
    }
  }
  if (*(void *)(a1 + 48) == 2)
  {
    *(void *)buf = 0;
    double v23 = buf;
    uint64_t v24 = 0x3032000000;
    double v25 = __Block_byref_object_copy__5;
    v26 = __Block_byref_object_dispose__5;
    id v27 = (id)os_transaction_create();
    uint64_t v5 = [getWFClientClass() sharedInstance];
    id v6 = [v5 interface];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke_105;
    v16[3] = &unk_1E5D2C600;
    id v3 = v3;
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    id v17 = v3;
    uint64_t v18 = v7;
    uint64_t v20 = &v29;
    id v19 = v8;
    v21 = buf;
    [v6 asyncCurrentNetwork:v16];

    _Block_object_dispose(buf, 8);
    goto LABEL_18;
  }
  char v10 = [*(id *)(a1 + 40) criteria];
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v11, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  int64_t v12 = [*(id *)(a1 + 32) _timeIntervalForWifiObserver];
  xpc_dictionary_set_int64(v11, (const char *)*MEMORY[0x1E4F141C8], v12);
  if (v10 && xpc_equal(v10, v11))
  {
    BOOL v13 = _BYLoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      char v14 = "finish setup wifi observer check-in already had correct criteria";
LABEL_16:
      _os_log_impl(&dword_1A7DED000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) setCriteria:v11];
    BOOL v13 = _BYLoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      char v14 = "finish setup wifi observer check-in did set criteria";
      goto LABEL_16;
    }
  }

LABEL_18:
  long long v15 = _BYLoggingFacility();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v15, OS_LOG_TYPE_DEFAULT, "WiFi Handler Finished", buf, 2u);
  }

  _Block_object_dispose(&v29, 8);
}

void __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 ssid];
  uint64_t v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v23 = 138412546;
    uint64_t v24 = v5;
    __int16 v25 = 2112;
    v26 = v3;
    _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer initial network ssid %@ current network ssid %@", (uint8_t *)&v23, 0x16u);
  }

  id v6 = [*(id *)(a1 + 40) _pendingFollowUpItem];
  if ([v3 length] && (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v3) & 1) == 0)
  {
    uint64_t v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer will force notification", (uint8_t *)&v23, 2u);
    }

    [*(id *)(a1 + 40) _repostExistingFollowUpItemForcingNotification:v6];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    goto LABEL_16;
  }
  id v8 = [v6 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"initialPostDate"];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v11 = v10;
  [v9 doubleValue];
  double v13 = v11 - v12;
  char v14 = _BYLoggingFacility();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = [NSNumber numberWithDouble:v13];
    int v23 = 138412290;
    uint64_t v24 = (uint64_t)v15;
    _os_log_impl(&dword_1A7DED000, v14, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer time interval since initial post %@", (uint8_t *)&v23, 0xCu);
  }
  if (v13 >= (double)[*(id *)(a1 + 40) _timeoutForWifiObserver])
  {
    long long v16 = _BYLoggingFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A7DED000, v16, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer beyond timeout", (uint8_t *)&v23, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
LABEL_16:
    id v17 = _BYLoggingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A7DED000, v17, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer clearing initial network ssid", (uint8_t *)&v23, 2u);
    }

    +[BYFlowSkipController _clearShouldObserveChangeFromNetworkSSID];
  }
  uint64_t v18 = _BYLoggingFacility();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [*(id *)(a1 + 48) state];
    int v23 = 134217984;
    uint64_t v24 = v19;
    _os_log_impl(&dword_1A7DED000, v18, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer did run. activity state %ld", (uint8_t *)&v23, 0xCu);
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v20 = +[BYXPCActivityRegistrar sharedInstance];
    [v20 unregisterActivityWithIdentifier:"com.apple.purplebuddy.finishsetup.wifiobserver"];
  }
  uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
  double v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = 0;
}

- (void)registerActivities
{
  id v3 = [(BYFlowSkipController *)self _pendingFollowUpItem];
  uint64_t v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"initialPostDate"];

  id v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "Registering XPC activities for finish setup...", buf, 2u);
  }

  if (registerActivities__onceToken != -1) {
    dispatch_once(&registerActivities__onceToken, &__block_literal_global_109);
  }
  BOOL v7 = v5 != 0;
  [(BYFlowSkipController *)self _registerWiFiObserverActivityWithNeedsActivity:v7 handlerQueue:registerActivities__activity_queue];
  id v8 = +[BYXPCActivityRegistrar sharedInstance];
  uint64_t v9 = *MEMORY[0x1E4F14158];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__BYFlowSkipController_registerActivities__block_invoke_2;
  v13[3] = &unk_1E5D2C678;
  v13[4] = self;
  BOOL v14 = v7;
  [v8 registerActivityWithIdentifier:"com.apple.purplebuddy.finishsetup.firstreschedule" criteria:v9 handler:v13];

  double v10 = +[BYXPCActivityRegistrar sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__BYFlowSkipController_registerActivities__block_invoke_113;
  v11[3] = &unk_1E5D2C678;
  v11[4] = self;
  BOOL v12 = v7;
  [v10 registerActivityWithIdentifier:"com.apple.purplebuddy.finishsetup.secondreschedule" criteria:v9 handler:v11];
}

uint64_t __42__BYFlowSkipController_registerActivities__block_invoke()
{
  registerActivities__activity_queue = (uint64_t)dispatch_queue_create("com.apple.purplebuddy.finishsetup.xpcactivity", 0);
  return MEMORY[0x1F41817F8]();
}

void __42__BYFlowSkipController_registerActivities__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  uint64_t v5 = registerActivities__activity_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__BYFlowSkipController_registerActivities__block_invoke_3;
  v7[3] = &unk_1E5D2C628;
  id v8 = v3;
  uint64_t v9 = v4;
  v7[4] = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __42__BYFlowSkipController_registerActivities__block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48) == 2)
  {
    [*(id *)(a1 + 32) revisePendingFollowUpsForcingRepost:1];
    BOOL v2 = _BYLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 40) state];
      int v10 = 134217984;
      uint64_t v11 = v3;
      uint64_t v4 = "First finish setup reschedule ran; state is now %ld";
      uint64_t v5 = v2;
      uint32_t v6 = 12;
LABEL_14:
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v10, v6);
    }
  }
  else if (*(unsigned char *)(a1 + 56))
  {
    BOOL v2 = [*(id *)(a1 + 40) criteria];
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x1E4F14170], [*(id *)(a1 + 32) _timeIntervalForFrequentNotifications]);
    if (v2 && xpc_equal(v2, v7))
    {
      id v8 = _BYLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __42__BYFlowSkipController_registerActivities__block_invoke_3_cold_1(v8);
      }
    }
    else
    {
      [*(id *)(a1 + 40) setCriteria:v7];
      id v8 = _BYLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "Updated first finish setup check-in", (uint8_t *)&v10, 2u);
      }
    }
  }
  else
  {
    uint64_t v9 = +[BYXPCActivityRegistrar sharedInstance];
    [v9 unregisterActivityWithIdentifier:"com.apple.purplebuddy.finishsetup.firstreschedule"];

    BOOL v2 = _BYLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      uint64_t v4 = "Unregistered first finish setup reschedule";
      uint64_t v5 = v2;
      uint32_t v6 = 2;
      goto LABEL_14;
    }
  }
}

void __42__BYFlowSkipController_registerActivities__block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  uint64_t v5 = registerActivities__activity_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__BYFlowSkipController_registerActivities__block_invoke_2_114;
  v7[3] = &unk_1E5D2C628;
  id v8 = v3;
  uint64_t v9 = v4;
  v7[4] = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __42__BYFlowSkipController_registerActivities__block_invoke_2_114(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48) == 2)
  {
    [*(id *)(a1 + 32) revisePendingFollowUpsForcingRepost:1];
    BOOL v2 = _BYLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 40) state];
      int v10 = 134217984;
      uint64_t v11 = v3;
      uint64_t v4 = "Second finish setup reschedule ran; state is now %ld";
      uint64_t v5 = v2;
      uint32_t v6 = 12;
LABEL_14:
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v10, v6);
    }
  }
  else if (*(unsigned char *)(a1 + 56))
  {
    BOOL v2 = [*(id *)(a1 + 40) criteria];
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x1E4F14170], [*(id *)(a1 + 32) _timeIntervalForNotifications]);
    if (v2 && xpc_equal(v2, v7))
    {
      id v8 = _BYLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __42__BYFlowSkipController_registerActivities__block_invoke_2_114_cold_1(v8);
      }
    }
    else
    {
      [*(id *)(a1 + 40) setCriteria:v7];
      id v8 = _BYLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "Updated second finish setup check-in", (uint8_t *)&v10, 2u);
      }
    }
  }
  else
  {
    uint64_t v9 = +[BYXPCActivityRegistrar sharedInstance];
    [v9 unregisterActivityWithIdentifier:"com.apple.purplebuddy.finishsetup.secondreschedule"];

    BOOL v2 = _BYLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      uint64_t v4 = "Unregistered second finish setup reschedule";
      uint64_t v5 = v2;
      uint32_t v6 = 2;
      goto LABEL_14;
    }
  }
}

- (void)unregisterActivities
{
  BOOL v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v6 = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Unregistering XPC activities for finish setup...", v6, 2u);
  }

  uint64_t v3 = +[BYXPCActivityRegistrar sharedInstance];
  [v3 unregisterActivityWithIdentifier:"com.apple.purplebuddy.finishsetup.firstreschedule"];

  uint64_t v4 = +[BYXPCActivityRegistrar sharedInstance];
  [v4 unregisterActivityWithIdentifier:"com.apple.purplebuddy.finishsetup.secondreschedule"];

  uint64_t v5 = +[BYXPCActivityRegistrar sharedInstance];
  [v5 unregisterActivityWithIdentifier:"com.apple.purplebuddy.finishsetup.wifiobserver"];
}

- (int64_t)_timeIntervalForFrequentNotifications
{
  return 230400;
}

- (int64_t)_timeIntervalForNotifications
{
  return 662400;
}

- (id)getFlowSkipIdentifiers
{
  BOOL v2 = [(BYFlowSkipController *)self _pendingFollowUpItem];
  uint64_t v3 = [v2 actions];
  uint64_t v4 = [v3 firstObject];
  uint64_t v5 = [v4 userInfo];
  uint32_t v6 = [v5 objectForKeyedSubscript:@"flowSkipIdentifiers"];

  return v6;
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_wfNetworkChangeObserver, 0);
  objc_storeStrong((id *)&self->_followUpController_doNotAccessDirectly, 0);
}

- (void)didSkipFlow:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Unknown flow skip identifier %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_pendingFollowUpItem
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = _BYIsInternalInstall();
  if ((v5 & 1) == 0)
  {
    uint32_t v6 = NSString;
    int v2 = [a1 domain];
    a1 = [v6 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(a1, "code")];
  }
  *(_DWORD *)buf = 138543362;
  id v8 = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Failed to get pending follow up items: %{public}@", buf, 0xCu);
  if (!v5)
  {
  }
}

void __42__BYFlowSkipController_registerActivities__block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A7DED000, log, OS_LOG_TYPE_DEBUG, "First finish setup reschedule had correct criteria", v1, 2u);
}

void __42__BYFlowSkipController_registerActivities__block_invoke_2_114_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A7DED000, log, OS_LOG_TYPE_DEBUG, "Second finish setup reschedule had correct criteria", v1, 2u);
}

@end