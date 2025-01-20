@interface NCNotificationOptionsMenu
- (BOOL)_canAddToContacts;
- (BOOL)_didApplicationBreakthroughMode:(id)a3;
- (BOOL)_didBreakthroughMode:(id)a3;
- (BOOL)_didContactBreakthroughMode:(id)a3;
- (BOOL)_isApplicationAllowedForMode:(id)a3;
- (BOOL)_isCommunicationThread;
- (BOOL)_isContactAllowedForMode:(id)a3;
- (BOOL)areOptionsForSection;
- (NCNotificationOptionsMenu)initWithNotificationRequest:(id)a3 presentingView:(id)a4 settingsDelegate:(id)a5 optionsForSection:(BOOL)a6;
- (NCNotificationOptionsMenuSettingsDelegate)settingsDelegate;
- (NCNotificationRequest)request;
- (UIContextMenuInteraction)menu;
- (UIView)presentingView;
- (id)_addToContactsAction;
- (id)_clearSectionAction;
- (id)_criticalOffAction;
- (id)_criticalOnAction;
- (id)_customSettingsActionForSectionSettings:(id)a3;
- (id)_deliverImmediatelyAcion;
- (id)_muteForOneHourAction;
- (id)_muteForTodayAction;
- (id)_offActionForApplicationForMode:(id)a3;
- (id)_offActionForContactForMode:(id)a3;
- (id)_offActionWithSectionDisplayName:(id)a3;
- (id)_onActionWithSectionDisplayName:(id)a3;
- (id)_sectionIdentifier;
- (id)_sendToDigestAction;
- (id)_sender;
- (id)_settingsActionForSectionSettings:(id)a3;
- (id)_summaryFeedbackNegativeWithFeedbackManager:(id)a3;
- (id)_summaryFeedbackPositiveWithFeedbackManager:(id)a3;
- (id)_summaryFeedbackReportConcernWithFeedbackManager:(id)a3;
- (id)_threadIdentifierOrNil;
- (id)_threadName;
- (id)_timeSensitiveOffAction;
- (id)_timeSensitiveOnAction;
- (id)_unmuteActionForMuteAssertionLevel:(unint64_t)a3;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)dismissMenu;
- (void)presentMenu;
- (void)setMenu:(id)a3;
- (void)setOptionsForSection:(BOOL)a3;
- (void)setPresentingView:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSettingsDelegate:(id)a3;
@end

@implementation NCNotificationOptionsMenu

- (NCNotificationOptionsMenu)initWithNotificationRequest:(id)a3 presentingView:(id)a4 settingsDelegate:(id)a5 optionsForSection:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NCNotificationOptionsMenu;
  v14 = [(NCNotificationOptionsMenu *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_request, a3);
    objc_storeStrong((id *)&v15->_presentingView, a4);
    objc_storeStrong((id *)&v15->_settingsDelegate, a5);
    v15->_optionsForSection = a6;
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:v15];
    menu = v15->_menu;
    v15->_menu = (UIContextMenuInteraction *)v16;

    [(UIView *)v15->_presentingView addInteraction:v15->_menu];
  }

  return v15;
}

- (void)presentMenu
{
  menu = self->_menu;
  [(UIView *)self->_presentingView center];

  -[UIContextMenuInteraction _presentMenuAtLocation:](menu, "_presentMenuAtLocation:");
}

- (void)dismissMenu
{
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__NCNotificationOptionsMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v6[3] = &unk_1E6A93D00;
  v6[4] = self;
  v4 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:&__block_literal_global_20 actionProvider:v6];

  return v4;
}

uint64_t __83__NCNotificationOptionsMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke()
{
  return 0;
}

id __83__NCNotificationOptionsMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) settingsDelegate];
  v4 = [v3 notificationOptionsMenuRequestsSystemSettings:*(void *)(a1 + 32)];

  v5 = [*(id *)(a1 + 32) request];
  uint64_t v6 = [v5 topLevelSectionIdentifier];

  v7 = [*(id *)(a1 + 32) settingsDelegate];
  v74 = (void *)v6;
  v8 = [v7 notificationOptionsMenu:*(void *)(a1 + 32) sectionSettingsForSectionIdentifier:v6];

  uint64_t v9 = [*(id *)(a1 + 32) _threadName];
  v10 = NSString;
  id v11 = NCUserNotificationsUIKitFrameworkBundle();
  id v12 = v11;
  if (v9)
  {
    id v13 = [v11 localizedStringForKey:@"NOTIFICATION_OPTIONS_TITLE_CONVERSATION_FORMAT" value:&stru_1F2F516F8 table:0];
    v14 = [v8 displayName];
    objc_msgSend(v10, "stringWithFormat:", v13, v14, v9);
  }
  else
  {
    id v13 = [v11 localizedStringForKey:@"NOTIFICATION_OPTIONS_TITLE_FORMAT" value:&stru_1F2F516F8 table:0];
    v14 = [v8 displayName];
    objc_msgSend(v10, "stringWithFormat:", v13, v14, v69);
  v72 = };

  v15 = objc_opt_new();
  uint64_t v16 = [*(id *)(a1 + 32) request];
  int v17 = [v16 isCriticalAlert];

  if (v17)
  {
    int v18 = [v8 criticalAlertsEnabled];
    objc_super v19 = *(void **)(a1 + 32);
    if (v18) {
      [v19 _criticalOffAction];
    }
    else {
      [v19 _criticalOnAction];
    }
    uint64_t v32 = LABEL_19:;
    v33 = (void *)v32;
    [v15 addObject:v32];

    goto LABEL_21;
  }
  v20 = [*(id *)(a1 + 32) request];
  uint64_t v21 = [v20 interruptionLevel];

  if (v21 == 2)
  {
    int v22 = [v8 isTimeSensitiveEnabled];
    v23 = *(void **)(a1 + 32);
    if (v22) {
      [v23 _timeSensitiveOffAction];
    }
    else {
      [v23 _timeSensitiveOnAction];
    }
    goto LABEL_19;
  }
  v24 = [v8 muteAssertion];
  v25 = [*(id *)(a1 + 32) _threadIdentifierOrNil];
  uint64_t v26 = [v24 activeMuteAssertionLevelForThreadIdentifier:v25];

  v27 = *(void **)(a1 + 32);
  if (v26)
  {
    [v27 _unmuteActionForMuteAssertionLevel:v26];
  }
  else
  {
    v28 = [v27 _muteForOneHourAction];
    [v15 addObject:v28];

    [*(id *)(a1 + 32) _muteForTodayAction];
  v29 = };
  [v15 addObject:v29];

  if ([v4 isScheduledDeliveryEnabled]
    && ([*(id *)(a1 + 32) _isCommunicationThread] & 1) == 0)
  {
    int v30 = [v8 isScheduledDeliveryEnabled];
    v31 = *(void **)(a1 + 32);
    if (v30) {
      [v31 _deliverImmediatelyAcion];
    }
    else {
      [v31 _sendToDigestAction];
    }
    goto LABEL_19;
  }
LABEL_21:
  if ([*(id *)(a1 + 32) _canAddToContacts])
  {
    v34 = [*(id *)(a1 + 32) _addToContactsAction];
    [v15 addObject:v34];
  }
  v73 = (void *)v9;
  if ([*(id *)(a1 + 32) areOptionsForSection])
  {
    v35 = [*(id *)(a1 + 32) _clearSectionAction];
    [v15 addObject:v35];
  }
  v71 = v15;
  v36 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F2F516F8 image:0 identifier:0 options:1 children:v15];
  [v2 addObject:v36];

  v37 = objc_opt_new();
  uint64_t v38 = [*(id *)(a1 + 32) _customSettingsActionForSectionSettings:v8];
  if (v38) {
    [v37 addObject:v38];
  }
  v70 = (void *)v38;
  v39 = [*(id *)(a1 + 32) _settingsActionForSectionSettings:v8];
  [v37 addObject:v39];

  int v40 = [v8 notificationsEnabled];
  v41 = *(void **)(a1 + 32);
  v42 = [v8 displayName];
  if (v40) {
    [v41 _offActionWithSectionDisplayName:v42];
  }
  else {
  v43 = [v41 _onActionWithSectionDisplayName:v42];
  }
  [v37 addObject:v43];

  v44 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F2F516F8 image:0 identifier:0 options:1 children:v37];
  [v2 addObject:v44];

  v45 = objc_opt_new();
  v46 = [*(id *)(a1 + 32) settingsDelegate];
  v47 = [v46 notificationOptionsMenuRequestsCurrentModeConfiguration:*(void *)(a1 + 32)];

  if ([*(id *)(a1 + 32) _didApplicationBreakthroughMode:v47]
    && [*(id *)(a1 + 32) _isApplicationAllowedForMode:v47])
  {
    v48 = [*(id *)(a1 + 32) _offActionForApplicationForMode:v47];
    [v45 addObject:v48];
  }
  v75 = v4;
  if ([*(id *)(a1 + 32) _didContactBreakthroughMode:v47]
    && [*(id *)(a1 + 32) _isContactAllowedForMode:v47])
  {
    v49 = [*(id *)(a1 + 32) _offActionForContactForMode:v47];
    [v45 addObject:v49];
  }
  v50 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F2F516F8 image:0 identifier:0 options:1 children:v45];
  v51 = v2;
  [v2 addObject:v50];

  v52 = [*(id *)(a1 + 32) settingsDelegate];
  v53 = *(void **)(a1 + 32);
  v54 = [v53 request];
  uint64_t v55 = [v52 notificationOptionsMenu:v53 isDisplayingStackSummaryForNotificationRequest:v54];

  v56 = [NCSummarizationFeedbackManager alloc];
  v57 = [*(id *)(a1 + 32) request];
  v58 = [(NCSummarizationFeedbackManager *)v56 initWithRequest:v57 isShowingStackSummary:v55];

  if (v58)
  {
    v59 = objc_opt_new();
    BOOL v60 = [(NCSummarizationFeedbackManager *)v58 showInternalFeedbackMenu];
    v61 = *(void **)(a1 + 32);
    if (v60)
    {
      v62 = [v61 _summaryFeedbackPositiveWithFeedbackManager:v58];
      [v59 addObject:v62];

      [*(id *)(a1 + 32) _summaryFeedbackNegativeWithFeedbackManager:v58];
    }
    else
    {
      [v61 _summaryFeedbackReportConcernWithFeedbackManager:v58];
    v63 = };
    [v59 addObject:v63];

    v64 = (void *)MEMORY[0x1E4FB1970];
    v65 = [(NCSummarizationFeedbackManager *)v58 sectionTitle];
    v66 = [v64 menuWithTitle:v65 image:0 identifier:0 options:1 children:v59];
    v51 = v2;
    [v2 addObject:v66];
  }
  v67 = [MEMORY[0x1E4FB1970] menuWithTitle:v72 children:v51];

  return v67;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  id v7 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  [v6 setShadowPath:v7];

  if (objc_opt_respondsToSelector())
  {
    v8 = [(UIView *)self->_presentingView visiblePathForPreview];
    [v6 setVisiblePath:v8];
  }
  else
  {
    v8 = [MEMORY[0x1E4FB1618] clearColor];
    [v6 setBackgroundColor:v8];
  }

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self->_presentingView parameters:v6];

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = [(NCNotificationOptionsMenu *)self settingsDelegate];
  [v6 notificationOptionsMenuWillDismiss:self];
}

- (id)_customSettingsActionForSectionSettings:(id)a3
{
  id v4 = a3;
  if ([v4 showsCustomSettingsLink])
  {
    v5 = NSString;
    id v6 = NCUserNotificationsUIKitFrameworkBundle();
    id v7 = [v6 localizedStringForKey:@"NOTIFICATION_OPTIONS_CONFIGURE_IN_APP_FORMAT" value:&stru_1F2F516F8 table:0];
    v8 = [v4 displayName];
    uint64_t v9 = objc_msgSend(v5, "stringWithFormat:", v7, v8);

    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E4FB13F0];
    id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"app.badge"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke;
    v14[3] = &unk_1E6A93D50;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    id v12 = [v10 actionWithTitle:v9 image:v11 identifier:0 handler:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke(uint64_t a1)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained request];
    v5 = [v4 userNotification];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1A18]) initWithNotification:v5];
    id v7 = (void *)MEMORY[0x1E4F629C8];
    uint64_t v8 = *MEMORY[0x1E4F62688];
    v17[0] = *MEMORY[0x1E4F626A0];
    v17[1] = v8;
    v18[0] = MEMORY[0x1E4F1CC38];
    v18[1] = MEMORY[0x1E4F1CC38];
    v17[2] = *MEMORY[0x1E4F625E0];
    id v16 = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    v18[2] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    id v11 = [v7 optionsWithDictionary:v10];

    id v12 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
    id v13 = [*(id *)(a1 + 32) sectionIdentifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke_2;
    v14[3] = &unk_1E6A93D28;
    id v15 = *(id *)(a1 + 32);
    [v12 openApplication:v13 withOptions:v11 completion:v14];
  }
}

void __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke_2_cold_1(a1, v7, (uint64_t)v6);
    }
  }
}

- (id)_settingsActionForSectionSettings:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = [v3 sectionIdentifier];
  id v6 = objc_msgSend(v4, "nc_notificationSettingsURLForSectionIdentifier:isAppClip:", v5, objc_msgSend(v3, "isAppClip"));

  id v7 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v8 = NCUserNotificationsUIKitFrameworkBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"NOTIFICATION_OPTIONS_SETTINGS" value:&stru_1F2F516F8 table:0];
  v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gear"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__NCNotificationOptionsMenu__settingsActionForSectionSettings___block_invoke;
  v15[3] = &unk_1E6A93D78;
  id v16 = v6;
  id v17 = v3;
  id v11 = v3;
  id v12 = v6;
  id v13 = [v7 actionWithTitle:v9 image:v10 identifier:0 handler:v15];

  return v13;
}

void __63__NCNotificationOptionsMenu__settingsActionForSectionSettings___block_invoke(uint64_t a1)
{
  v2 = dispatch_get_global_queue(25, 0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__NCNotificationOptionsMenu__settingsActionForSectionSettings___block_invoke_2;
  v3[3] = &unk_1E6A91A68;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __63__NCNotificationOptionsMenu__settingsActionForSectionSettings___block_invoke_2(uint64_t a1)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F62688];
  v19[0] = *MEMORY[0x1E4F626A0];
  v19[1] = v4;
  v20[0] = MEMORY[0x1E4F1CC38];
  v20[1] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  id v12 = 0;
  [v2 openSensitiveURL:v3 withOptions:v5 error:&v12];
  id v6 = v12;

  if (v6)
  {
    id v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = v7;
      v10 = [v8 sectionIdentifier];
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_error_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_ERROR, "Error opening Settings for %{public}@, %{public}@, %{public}@", buf, 0x20u);
    }
  }
}

- (id)_offActionWithSectionDisplayName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if ([(NCNotificationOptionsMenu *)self _isCommunicationThread])
  {
    id v5 = NSString;
    id v6 = NCUserNotificationsUIKitFrameworkBundle();
    id v7 = [v6 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_ALL_FORMAT" value:&stru_1F2F516F8 table:0];
    uint64_t v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4);
  }
  else
  {
    id v6 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v8 = [v6 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF" value:&stru_1F2F516F8 table:0];
  }

  uint64_t v9 = (void *)MEMORY[0x1E4FB13F0];
  v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__NCNotificationOptionsMenu__offActionWithSectionDisplayName___block_invoke;
  v13[3] = &unk_1E6A91930;
  objc_copyWeak(&v14, &location);
  uint64_t v11 = [v9 actionWithTitle:v8 image:v10 identifier:0 handler:v13];

  [v11 setAttributes:2];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);

  return v11;
}

void __62__NCNotificationOptionsMenu__offActionWithSectionDisplayName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = [WeakRetained request];
  uint64_t v3 = [WeakRetained _sectionIdentifier];
  [v1 notificationOptionsMenu:WeakRetained setAllowsNotifications:0 forNotificationRequest:v2 withSectionIdentifier:v3];

  id v4 = [WeakRetained request];
  LODWORD(v2) = [v4 isCriticalAlert];

  if (v2)
  {
    id v5 = [WeakRetained settingsDelegate];
    id v6 = [WeakRetained request];
    id v7 = [WeakRetained _sectionIdentifier];
    [v5 notificationOptionsMenu:WeakRetained setAllowsCriticalAlerts:0 forNotificationRequest:v6 withSectionIdentifier:v7];
  }
}

- (id)_onActionWithSectionDisplayName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if ([(NCNotificationOptionsMenu *)self _isCommunicationThread])
  {
    id v5 = NSString;
    id v6 = NCUserNotificationsUIKitFrameworkBundle();
    id v7 = [v6 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_ON_ALL_FORMAT" value:&stru_1F2F516F8 table:0];
    uint64_t v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4);
  }
  else
  {
    id v6 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v8 = [v6 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_ON" value:&stru_1F2F516F8 table:0];
  }

  uint64_t v9 = (void *)MEMORY[0x1E4FB13F0];
  v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"app.badge.fill"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__NCNotificationOptionsMenu__onActionWithSectionDisplayName___block_invoke;
  v13[3] = &unk_1E6A91930;
  objc_copyWeak(&v14, &location);
  uint64_t v11 = [v9 actionWithTitle:v8 image:v10 identifier:0 handler:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v11;
}

void __61__NCNotificationOptionsMenu__onActionWithSectionDisplayName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = [WeakRetained request];
  uint64_t v3 = [WeakRetained request];
  id v4 = [v3 topLevelSectionIdentifier];
  [v1 notificationOptionsMenu:WeakRetained setAllowsNotifications:1 forNotificationRequest:v2 withSectionIdentifier:v4];

  id v5 = [WeakRetained request];
  LODWORD(v2) = [v5 isCriticalAlert];

  if (v2)
  {
    id v6 = [WeakRetained settingsDelegate];
    id v7 = [WeakRetained request];
    uint64_t v8 = [WeakRetained _sectionIdentifier];
    [v6 notificationOptionsMenu:WeakRetained setAllowsCriticalAlerts:1 forNotificationRequest:v7 withSectionIdentifier:v8];
  }
}

- (id)_criticalOffAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_CRITICAL" value:&stru_1F2F516F8 table:0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__NCNotificationOptionsMenu__criticalOffAction__block_invoke;
  v8[3] = &unk_1E6A91930;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __47__NCNotificationOptionsMenu__criticalOffAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = [WeakRetained request];
  uint64_t v3 = [WeakRetained _sectionIdentifier];
  [v1 notificationOptionsMenu:WeakRetained setAllowsCriticalAlerts:0 forNotificationRequest:v2 withSectionIdentifier:v3];
}

- (id)_criticalOnAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_ON_CRITICAL" value:&stru_1F2F516F8 table:0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__NCNotificationOptionsMenu__criticalOnAction__block_invoke;
  v8[3] = &unk_1E6A91930;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __46__NCNotificationOptionsMenu__criticalOnAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = [WeakRetained request];
  uint64_t v3 = [WeakRetained request];
  id v4 = [v3 topLevelSectionIdentifier];
  [v1 notificationOptionsMenu:WeakRetained setAllowsCriticalAlerts:1 forNotificationRequest:v2 withSectionIdentifier:v4];
}

- (id)_timeSensitiveOffAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_TIME_SENSITIVE" value:&stru_1F2F516F8 table:0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"clock"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__NCNotificationOptionsMenu__timeSensitiveOffAction__block_invoke;
  v8[3] = &unk_1E6A91930;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __52__NCNotificationOptionsMenu__timeSensitiveOffAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = [WeakRetained request];
  uint64_t v3 = [WeakRetained _sectionIdentifier];
  [v1 notificationOptionsMenu:WeakRetained setAllowsTimeSensitive:0 forNotificationRequest:v2 withSectionIdentifier:v3];
}

- (id)_timeSensitiveOnAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_ON_TIME_SENSITIVE" value:&stru_1F2F516F8 table:0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"clock"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__NCNotificationOptionsMenu__timeSensitiveOnAction__block_invoke;
  v8[3] = &unk_1E6A91930;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __51__NCNotificationOptionsMenu__timeSensitiveOnAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = [WeakRetained request];
  uint64_t v3 = [WeakRetained _sectionIdentifier];
  [v1 notificationOptionsMenu:WeakRetained setAllowsTimeSensitive:1 forNotificationRequest:v2 withSectionIdentifier:v3];
}

- (id)_summaryFeedbackPositiveWithFeedbackManager:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB13F0];
  id v5 = NCUserNotificationsUIKitFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"NOTIFICATION_OPTIONS_SUMMARY_FEEDBACK_POSITIVE" value:&stru_1F2F516F8 table:0];
  id v7 = [v3 thumbsUpImage];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__NCNotificationOptionsMenu__summaryFeedbackPositiveWithFeedbackManager___block_invoke;
  v11[3] = &unk_1E6A93DA0;
  id v12 = v3;
  id v8 = v3;
  id v9 = [v4 actionWithTitle:v6 image:v7 identifier:0 handler:v11];

  return v9;
}

uint64_t __73__NCNotificationOptionsMenu__summaryFeedbackPositiveWithFeedbackManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) thumbsUp];
}

- (id)_summaryFeedbackNegativeWithFeedbackManager:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB13F0];
  id v5 = NCUserNotificationsUIKitFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"NOTIFICATION_OPTIONS_SUMMARY_FEEDBACK_NEGATIVE" value:&stru_1F2F516F8 table:0];
  id v7 = [v3 thumbsDownImage];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__NCNotificationOptionsMenu__summaryFeedbackNegativeWithFeedbackManager___block_invoke;
  v11[3] = &unk_1E6A93DA0;
  id v12 = v3;
  id v8 = v3;
  id v9 = [v4 actionWithTitle:v6 image:v7 identifier:0 handler:v11];

  return v9;
}

uint64_t __73__NCNotificationOptionsMenu__summaryFeedbackNegativeWithFeedbackManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) thumbsDown];
}

- (id)_summaryFeedbackReportConcernWithFeedbackManager:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB13F0];
  id v5 = NCUserNotificationsUIKitFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"NOTIFICATION_OPTIONS_SUMMARY_FEEDBACK_REPORT_CONCERN" value:&stru_1F2F516F8 table:0];
  id v7 = [v3 reportConcernImage];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__NCNotificationOptionsMenu__summaryFeedbackReportConcernWithFeedbackManager___block_invoke;
  v11[3] = &unk_1E6A93DA0;
  id v12 = v3;
  id v8 = v3;
  id v9 = [v4 actionWithTitle:v6 image:v7 identifier:0 handler:v11];

  return v9;
}

uint64_t __78__NCNotificationOptionsMenu__summaryFeedbackReportConcernWithFeedbackManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportConcern];
}

- (id)_muteForOneHourAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_OPTIONS_MUTE_FOR_ONE_HOUR" value:&stru_1F2F516F8 table:0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"bell.slash"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__NCNotificationOptionsMenu__muteForOneHourAction__block_invoke;
  v8[3] = &unk_1E6A91930;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __50__NCNotificationOptionsMenu__muteForOneHourAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = _dateOneHourFromNow();
  id v3 = [WeakRetained request];
  id v4 = [WeakRetained _sectionIdentifier];
  id v5 = [WeakRetained _threadIdentifierOrNil];
  [v1 notificationOptionsMenu:WeakRetained setMuted:1 untilDate:v2 forNotificationRequest:v3 withSectionIdentifier:v4 threadIdentifier:v5];
}

- (id)_muteForTodayAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_OPTIONS_MUTE_FOR_TODAY" value:&stru_1F2F516F8 table:0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"bell.slash"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__NCNotificationOptionsMenu__muteForTodayAction__block_invoke;
  v8[3] = &unk_1E6A91930;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __48__NCNotificationOptionsMenu__muteForTodayAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = _dateUntilEndOfToday();
  id v3 = [WeakRetained request];
  id v4 = [WeakRetained _sectionIdentifier];
  id v5 = [WeakRetained _threadIdentifierOrNil];
  [v1 notificationOptionsMenu:WeakRetained setMuted:1 untilDate:v2 forNotificationRequest:v3 withSectionIdentifier:v4 threadIdentifier:v5];
}

- (id)_unmuteActionForMuteAssertionLevel:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v4 = [(NCNotificationOptionsMenu *)self _threadIdentifierOrNil];
  }
  else
  {
    id v4 = 0;
  }
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  id v6 = NCUserNotificationsUIKitFrameworkBundle();
  id v7 = [v6 localizedStringForKey:@"NOTIFICATION_OPTIONS_UNMUTE" value:&stru_1F2F516F8 table:0];
  id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"bell"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__NCNotificationOptionsMenu__unmuteActionForMuteAssertionLevel___block_invoke;
  v12[3] = &unk_1E6A93D50;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  v10 = [v5 actionWithTitle:v7 image:v8 identifier:0 handler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

void __64__NCNotificationOptionsMenu__unmuteActionForMuteAssertionLevel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained settingsDelegate];
  id v3 = [WeakRetained request];
  id v4 = [WeakRetained _sectionIdentifier];
  [v2 notificationOptionsMenu:WeakRetained setMuted:0 untilDate:0 forNotificationRequest:v3 withSectionIdentifier:v4 threadIdentifier:*(void *)(a1 + 32)];
}

- (id)_sendToDigestAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_OPTIONS_ADD_TO_SUMMARY" value:&stru_1F2F516F8 table:0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"newspaper"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__NCNotificationOptionsMenu__sendToDigestAction__block_invoke;
  v8[3] = &unk_1E6A91930;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __48__NCNotificationOptionsMenu__sendToDigestAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = [WeakRetained request];
  id v3 = [WeakRetained _sectionIdentifier];
  [v1 notificationOptionsMenu:WeakRetained setScheduledDelivery:1 forNotificationRequest:v2 withSectionIdentifier:v3];
}

- (id)_deliverImmediatelyAcion
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_OPTIONS_DELIVER_IMMEDIATELY" value:&stru_1F2F516F8 table:0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"bell"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__NCNotificationOptionsMenu__deliverImmediatelyAcion__block_invoke;
  v8[3] = &unk_1E6A91930;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __53__NCNotificationOptionsMenu__deliverImmediatelyAcion__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = [WeakRetained request];
  id v3 = [WeakRetained _sectionIdentifier];
  [v1 notificationOptionsMenu:WeakRetained setScheduledDelivery:0 forNotificationRequest:v2 withSectionIdentifier:v3];
}

- (id)_addToContactsAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_OPTIONS_ADD_TO_CONTACTS" value:&stru_1F2F516F8 table:0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.plus"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__NCNotificationOptionsMenu__addToContactsAction__block_invoke;
  v8[3] = &unk_1E6A91930;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __49__NCNotificationOptionsMenu__addToContactsAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = [WeakRetained request];
  id v3 = [WeakRetained _sectionIdentifier];
  [v1 notificationOptionsMenu:WeakRetained addSenderToContactsForNotificationRequest:v2 withSectionIdentifier:v3];
}

- (id)_clearSectionAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR_NOTIFICATIONS" value:&stru_1F2F516F8 table:0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__NCNotificationOptionsMenu__clearSectionAction__block_invoke;
  v8[3] = &unk_1E6A91930;
  objc_copyWeak(&v9, &location);
  id v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __48__NCNotificationOptionsMenu__clearSectionAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained settingsDelegate];
  v2 = [WeakRetained _sectionIdentifier];
  [v1 notificationOptionsMenu:WeakRetained requestsClearingSectionWithIdentifier:v2];
}

- (id)_offActionForApplicationForMode:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [v4 mode];
  uint64_t v6 = [v5 semanticType];

  switch(v6)
  {
    case 0:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_DO_NOT_DISTURB" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 1:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_SLEEP" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 2:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_DRIVING" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 3:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_FITNESS" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 4:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_WORK" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 5:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_PERSONAL" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 6:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_READING" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 7:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_GAMING" value:&stru_1F2F516F8 table:0];
LABEL_11:
      id v13 = (void *)v8;
      break;
    default:
      id v9 = NSString;
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      v10 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_FOCUS" value:&stru_1F2F516F8 table:0];
      uint64_t v11 = [v4 mode];
      id v12 = [v11 name];
      id v13 = objc_msgSend(v9, "stringWithFormat:", v10, v12);

      break;
  }

  id v14 = [v4 mode];
  __int16 v15 = [v14 symbolImageName];

  uint64_t v16 = (void *)MEMORY[0x1E4FB13F0];
  __int16 v17 = [MEMORY[0x1E4FB1818] systemImageNamed:v15];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__NCNotificationOptionsMenu__offActionForApplicationForMode___block_invoke;
  v21[3] = &unk_1E6A93D50;
  objc_copyWeak(&v23, &location);
  id v18 = v4;
  id v22 = v18;
  objc_super v19 = [v16 actionWithTitle:v13 image:v17 identifier:0 handler:v21];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v19;
}

void __61__NCNotificationOptionsMenu__offActionForApplicationForMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  id v3 = [*(id *)(a1 + 32) configuration];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [WeakRetained _sectionIdentifier];
  [v4 removeExceptionForApplication:v5];

  [v2 setConfiguration:v4];
  uint64_t v6 = [WeakRetained settingsDelegate];
  [v6 notificationOptionsMenu:WeakRetained setModeConfiguration:v2];
}

- (id)_offActionForContactForMode:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [v4 mode];
  uint64_t v6 = [v5 semanticType];

  switch(v6)
  {
    case 0:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_DO_NOT_DISTURB" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 1:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_SLEEP" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 2:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_DRIVING" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 3:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_FITNESS" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 4:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_WORK" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 5:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_PERSONAL" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 6:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_READING" value:&stru_1F2F516F8 table:0];
      goto LABEL_11;
    case 7:
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_GAMING" value:&stru_1F2F516F8 table:0];
LABEL_11:
      id v13 = (void *)v8;
      break;
    default:
      id v9 = NSString;
      id v7 = NCUserNotificationsUIKitFrameworkBundle();
      v10 = [v7 localizedStringForKey:@"NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_FOCUS" value:&stru_1F2F516F8 table:0];
      uint64_t v11 = [v4 mode];
      id v12 = [v11 name];
      id v13 = objc_msgSend(v9, "stringWithFormat:", v10, v12);

      break;
  }

  id v14 = [v4 mode];
  __int16 v15 = [v14 symbolImageName];

  uint64_t v16 = (void *)MEMORY[0x1E4FB13F0];
  __int16 v17 = [MEMORY[0x1E4FB1818] systemImageNamed:v15];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__NCNotificationOptionsMenu__offActionForContactForMode___block_invoke;
  v21[3] = &unk_1E6A93DC8;
  objc_copyWeak(&v24, &location);
  id v18 = v4;
  id v22 = v18;
  id v23 = self;
  objc_super v19 = [v16 actionWithTitle:v13 image:v17 identifier:0 handler:v21];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v19;
}

void __57__NCNotificationOptionsMenu__offActionForContactForMode___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = (void *)[a1[4] mutableCopy];
  id v3 = [a1[4] configuration];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [a1[5] request];
  uint64_t v6 = [v5 content];
  id v7 = [v6 communicationContext];
  uint64_t v8 = [v7 sender];
  id v9 = [v8 cnContactIdentifier];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F5F5C0]) initWithContactIdentifier:v9];
  [v4 removeExceptionForContact:v10];
  [v2 setConfiguration:v4];
  uint64_t v11 = [WeakRetained settingsDelegate];
  [v11 notificationOptionsMenu:WeakRetained setModeConfiguration:v2];
}

- (BOOL)_didBreakthroughMode:(id)a3
{
  id v4 = [a3 mode];
  id v5 = [v4 identifier];

  uint64_t v6 = [(NCNotificationOptionsMenu *)self request];
  id v7 = [v6 alertOptions];

  if ([v7 shouldSuppress])
  {
    char v8 = 0;
  }
  else
  {
    id v9 = [v7 activeModeUUID];
    char v8 = [v5 isEqual:v9];
  }
  return v8;
}

- (BOOL)_didApplicationBreakthroughMode:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationOptionsMenu *)self request];
  uint64_t v6 = [v5 alertOptions];
  uint64_t v7 = [v6 reason];

  BOOL v8 = [(NCNotificationOptionsMenu *)self _didBreakthroughMode:v4];
  return v7 == 2 && v8;
}

- (BOOL)_didContactBreakthroughMode:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationOptionsMenu *)self request];
  uint64_t v6 = [v5 alertOptions];
  uint64_t v7 = [v6 reason];

  BOOL v8 = [(NCNotificationOptionsMenu *)self _didBreakthroughMode:v4];
  return v7 == 3 && v8;
}

- (BOOL)_isApplicationAllowedForMode:(id)a3
{
  id v4 = [a3 configuration];
  id v5 = [(NCNotificationOptionsMenu *)self request];
  uint64_t v6 = [v5 sectionIdentifier];

  LOBYTE(v5) = [v4 exceptionForApplication:v6] == 0;
  return (char)v5;
}

- (BOOL)_isContactAllowedForMode:(id)a3
{
  id v4 = [a3 configuration];
  id v5 = [(NCNotificationOptionsMenu *)self request];
  uint64_t v6 = [v5 content];
  uint64_t v7 = [v6 communicationContext];
  BOOL v8 = [v7 sender];
  id v9 = [v8 cnContactIdentifier];

  id v10 = objc_alloc_init(MEMORY[0x1E4F5F6F8]);
  [v10 setContactIdentifier:v9];
  LOBYTE(v6) = [v4 exceptionForContactHandle:v10] == 0;

  return (char)v6;
}

- (id)_sectionIdentifier
{
  v2 = [(NCNotificationOptionsMenu *)self request];
  id v3 = [v2 topLevelSectionIdentifier];

  return v3;
}

- (BOOL)_isCommunicationThread
{
  if ([(NCNotificationOptionsMenu *)self areOptionsForSection]) {
    return 0;
  }
  id v4 = [(NCNotificationOptionsMenu *)self request];
  id v5 = [v4 content];
  char v6 = [v5 isMessagingType];

  return v6;
}

- (id)_threadName
{
  if ([(NCNotificationOptionsMenu *)self _isCommunicationThread])
  {
    id v3 = [(NCNotificationOptionsMenu *)self request];
    id v4 = [v3 content];
    id v5 = [v4 communicationContext];
    char v6 = [v5 preferredDescription];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_threadIdentifierOrNil
{
  if ([(NCNotificationOptionsMenu *)self _isCommunicationThread])
  {
    id v3 = [(NCNotificationOptionsMenu *)self request];
    id v4 = [v3 uniqueThreadIdentifier];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_sender
{
  v2 = [(NCNotificationOptionsMenu *)self request];
  id v3 = [v2 content];
  id v4 = [v3 communicationContext];
  id v5 = [v4 sender];

  return v5;
}

- (BOOL)_canAddToContacts
{
  id v3 = [(NCNotificationOptionsMenu *)self _sender];

  if (!v3) {
    return 0;
  }
  id v4 = [MEMORY[0x1E4FB3820] sharedInstance];
  id v5 = [(NCNotificationOptionsMenu *)self _sender];
  char v6 = [(NCNotificationOptionsMenu *)self request];
  uint64_t v7 = [v6 topLevelSectionIdentifier];
  char v8 = [v4 canAddToCuratedContacts:v5 bundleIdentifier:v7];

  return v8;
}

- (NCNotificationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (UIView)presentingView
{
  return self->_presentingView;
}

- (void)setPresentingView:(id)a3
{
}

- (NCNotificationOptionsMenuSettingsDelegate)settingsDelegate
{
  return self->_settingsDelegate;
}

- (void)setSettingsDelegate:(id)a3
{
}

- (UIContextMenuInteraction)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (BOOL)areOptionsForSection
{
  return self->_optionsForSection;
}

- (void)setOptionsForSection:(BOOL)a3
{
  self->_optionsForSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_settingsDelegate, 0);
  objc_storeStrong((id *)&self->_presentingView, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

void __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  char v6 = [v4 sectionIdentifier];
  int v7 = 138543618;
  char v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "Error opening Application settings for %{public}@, %{public}@", (uint8_t *)&v7, 0x16u);
}

@end