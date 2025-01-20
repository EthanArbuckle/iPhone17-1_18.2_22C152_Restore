@interface NCSuggestionManager
- (BOOL)_addSuggestionForNotificationRequest:(id)a3 managementContentProvider:(id)a4;
- (BOOL)_createContactMatchingSuggestionIfNeededForRequest:(id)a3 sectionSettings:(id)a4;
- (BOOL)_createDirectMessagesSuggestionIfNeededForNotificationRequest:(id)a3 sectionSettings:(id)a4;
- (BOOL)_createProvisionalAuthorizationSuggestionIfNeededForRequest:(id)a3 sectionSettings:(id)a4;
- (BOOL)_createRemoteSuggestionIfNeededForRequest:(id)a3 remoteSuggestion:(id)a4;
- (BOOL)_createSummaryFeedbackSuggestionIfNeededForRequest:(id)a3 sectionSettings:(id)a4;
- (BOOL)_createTimeSensitiveSuggestionIfNeededForNotificationRequest:(id)a3 sectionSettings:(id)a4;
- (BOOL)isDeviceAuthenticated;
- (NCNotificationRequest)requestWithProvisionalNotificationManagementSuggestion;
- (NCSuggestionManager)init;
- (NCSuggestionManagerDelegate)delegate;
- (NSMutableDictionary)remoteSuggestions;
- (NSMutableDictionary)suggestionContentProviders;
- (NSMutableSet)requestsWithContactSuggestions;
- (NSMutableSet)requestsWithDirectMessagesManagementSuggestion;
- (NSMutableSet)requestsWithRemoteSuggestions;
- (NSMutableSet)requestsWithSummaryFeedbackSuggestions;
- (NSMutableSet)requestsWithTimeSensitiveManagementSuggestion;
- (NSMutableSet)sectionIdentifiersWithNotificationManagementSuggestions;
- (id)_contentProviderForRequest:(id)a3 withDigestSuggestion:(id)a4;
- (id)_contentProviderForRequest:(id)a3 withModeConfigurationTuningSuggestion:(id)a4;
- (id)_contentProviderForRequest:(id)a3 withMutingSuggestion:(id)a4;
- (id)_contentProviderForRequest:(id)a3 withRemoteSuggestion:(id)a4;
- (id)_contentProviderForRequest:(id)a3 withSendMessagesToDigestSuggestion:(id)a4;
- (id)_contentProviderForRequest:(id)a3 withTurnOffNotificationsForAppSuggestion:(id)a4;
- (id)_contentProviderForRequest:(id)a3 withUrgencyTuningSuggestion:(id)a4;
- (id)_sectionSettingsForSectionIdentifier:(id)a3;
- (id)auxiliaryOptionsContentProviderForNotificationRequest:(id)a3 isLongLook:(BOOL)a4;
- (void)_createNewCuratedContactMatchSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4 contactName:(id)a5;
- (void)_createNewDirectMessagesInDigestSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4;
- (void)_createNewPromotingSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4;
- (void)_createNewSummaryFeedbackSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4;
- (void)_createNewTimeSensitiveInDigestSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4;
- (void)_createNewTimeSensitiveSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4;
- (void)_reloadSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4;
- (void)_removeSuggestionIfNecessaryForNotificationRequest:(id)a3;
- (void)_updateContentForNotificationRequest:(id)a3;
- (void)checkSuggestionNeededForNotificationRequest:(id)a3;
- (void)clearSuggestionForNotificationRequest:(id)a3;
- (void)logResponseForNotificationRequest:(id)a3 allowsNotifications:(BOOL)a4;
- (void)logResponseForNotificationRequest:(id)a3 allowsTimeSensitive:(BOOL)a4;
- (void)logResponseForNotificationRequest:(id)a3 muted:(BOOL)a4;
- (void)logResponseForNotificationRequest:(id)a3 scheduledDelivery:(BOOL)a4;
- (void)notificationManagementContentProvider:(id)a3 hasUpdatedContentForRequest:(id)a4;
- (void)notificationManagementContentProvider:(id)a3 keepNotificationsForSectionIdentifierForNotificationRequest:(id)a4;
- (void)notificationManagementContentProvider:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6;
- (void)notificationManagementContentProvider:(id)a3 requestsRemoveSuggestionForRequest:(id)a4;
- (void)notificationManagementContentProvider:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)notificationManagementContentProvider:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)notificationManagementContentProvider:(id)a3 setCuratedContactSuggestionConfirmed:(BOOL)a4 request:(id)a5;
- (void)notificationManagementContentProvider:(id)a3 setModeConfiguration:(id)a4;
- (void)notificationManagementContentProvider:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7;
- (void)notificationManagementContentProvider:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)reloadContactSuggestions;
- (void)reloadRemoteSuggestions;
- (void)setDelegate:(id)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setRemoteSuggestions:(id)a3;
- (void)setRequestWithProvisionalNotificationManagementSuggestion:(id)a3;
- (void)setRequestsWithContactSuggestions:(id)a3;
- (void)setRequestsWithDirectMessagesManagementSuggestion:(id)a3;
- (void)setRequestsWithRemoteSuggestions:(id)a3;
- (void)setRequestsWithSummaryFeedbackSuggestions:(id)a3;
- (void)setRequestsWithTimeSensitiveManagementSuggestion:(id)a3;
- (void)setSectionIdentifiersWithNotificationManagementSuggestions:(id)a3;
- (void)setSuggestionContentProviders:(id)a3;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
@end

@implementation NCSuggestionManager

- (NCSuggestionManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)NCSuggestionManager;
  v2 = [(NCSuggestionManager *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    suggestionContentProviders = v2->_suggestionContentProviders;
    v2->_suggestionContentProviders = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    sectionIdentifiersWithNotificationManagementSuggestions = v2->_sectionIdentifiersWithNotificationManagementSuggestions;
    v2->_sectionIdentifiersWithNotificationManagementSuggestions = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    requestsWithRemoteSuggestions = v2->_requestsWithRemoteSuggestions;
    v2->_requestsWithRemoteSuggestions = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    requestsWithContactSuggestions = v2->_requestsWithContactSuggestions;
    v2->_requestsWithContactSuggestions = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    remoteSuggestions = v2->_remoteSuggestions;
    v2->_remoteSuggestions = v11;
  }
  return v2;
}

- (void)reloadRemoteSuggestions
{
  v3 = *MEMORY[0x1E4FB3780];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_DEFAULT, "Notification Suggestion Manager reloading remote suggestions", (uint8_t *)buf, 2u);
  }
  v4 = [MEMORY[0x1E4F4AD40] sharedInstance];
  objc_initWeak(buf, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__NCSuggestionManager_reloadRemoteSuggestions__block_invoke;
  v6[3] = &unk_1E6A94160;
  objc_copyWeak(&v9, buf);
  id v5 = v4;
  id v7 = v5;
  v8 = self;
  [v5 activeSuggestionsWithReply:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

void __46__NCSuggestionManager_reloadRemoteSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    id v45 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v10 = [WeakRetained remoteSuggestions];
    v11 = [v10 allKeys];

    obuint64_t j = v11;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v57 objects:v63 count:16];
    id v46 = v5;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v58 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v57 + 1) + 8 * i);
          v17 = [WeakRetained remoteSuggestions];
          v18 = [v17 objectForKey:v16];

          if (([v5 containsObject:v18] & 1) == 0)
          {
            v19 = *(void **)(a1 + 32);
            uint64_t v20 = [v18 subtype];
            v21 = [v18 uuid];
            v22 = [MEMORY[0x1E4F1C9C8] now];
            uint64_t v23 = v20;
            id v5 = v46;
            [v19 logSuggestionEvent:6 suggestionType:v23 suggestionIdentifier:v21 timestamp:v22];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
      }
      while (v13);
    }

    v24 = [WeakRetained requestsWithRemoteSuggestions];
    v25 = (void *)[v24 copy];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v26 = v25;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v54 != v29) {
            objc_enumerationMutation(v26);
          }
          [WeakRetained _removeSuggestionIfNecessaryForNotificationRequest:*(void *)(*((void *)&v53 + 1) + 8 * j)];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v28);
    }
    v44 = v26;

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obja = v5;
    uint64_t v31 = [obja countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v50;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v50 != v33) {
            objc_enumerationMutation(obja);
          }
          v35 = *(void **)(*((void *)&v49 + 1) + 8 * k);
          v36 = objc_msgSend(v35, "triggerNotificationUUID", v44);
          if (!v36
            || ([WeakRetained delegate],
                v37 = objc_claimAutoreleasedReturnValue(),
                [v37 suggestionManager:WeakRetained notificationRequestForUUID:v36],
                v38 = objc_claimAutoreleasedReturnValue(),
                v37,
                !v38)
            || (char v39 = [*(id *)(a1 + 40) _createRemoteSuggestionIfNeededForRequest:v38 remoteSuggestion:v35], v38, (v39 & 1) == 0))
          {
            v40 = *(void **)(a1 + 32);
            uint64_t v41 = [v35 subtype];
            v42 = [v35 uuid];
            v43 = [MEMORY[0x1E4F1C9C8] now];
            [v40 logSuggestionEvent:8 suggestionType:v41 suggestionIdentifier:v42 timestamp:v43];
          }
        }
        uint64_t v32 = [obja countByEnumeratingWithState:&v49 objects:v61 count:16];
      }
      while (v32);
    }

    id v7 = v45;
    id v5 = v46;
  }
  else
  {
    v8 = *MEMORY[0x1E4FB3780];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_ERROR)) {
      __46__NCSuggestionManager_reloadRemoteSuggestions__block_invoke_cold_1((uint64_t)v7, v8);
    }
  }
}

- (void)reloadContactSuggestions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(NCSuggestionManager *)self requestsWithContactSuggestions];
  v3 = (void *)[v2 copy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = [v9 content];
        v11 = [v10 communicationContext];

        uint64_t v12 = [v11 sender];
        if (v12)
        {
          uint64_t v13 = [MEMORY[0x1E4FB3820] sharedInstance];
          uint64_t v14 = [v9 topLevelSectionIdentifier];
          v15 = [v13 curatedContactMatchDetailsForContact:v12 bundleIdentifier:v14];

          if (([v15 isSuggestedMatch] & 1) == 0) {
            [(NCSuggestionManager *)self _removeSuggestionIfNecessaryForNotificationRequest:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)checkSuggestionNeededForNotificationRequest:(id)a3
{
  id v6 = a3;
  id v4 = [v6 sectionIdentifier];
  uint64_t v5 = [(NCSuggestionManager *)self _sectionSettingsForSectionIdentifier:v4];

  if ([v5 isUserConfigurable]
    && ![(NCSuggestionManager *)self _createTimeSensitiveSuggestionIfNeededForNotificationRequest:v6 sectionSettings:v5]&& ![(NCSuggestionManager *)self _createDirectMessagesSuggestionIfNeededForNotificationRequest:v6 sectionSettings:v5]&& ![(NCSuggestionManager *)self _createProvisionalAuthorizationSuggestionIfNeededForRequest:v6 sectionSettings:v5]&& ![(NCSuggestionManager *)self _createContactMatchingSuggestionIfNeededForRequest:v6 sectionSettings:v5])
  {
    [(NCSuggestionManager *)self _createSummaryFeedbackSuggestionIfNeededForRequest:v6 sectionSettings:v5];
  }
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 sectionIdentifier];
  if ([(NSMutableSet *)self->_sectionIdentifiersWithNotificationManagementSuggestions containsObject:v6])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [(NSMutableDictionary *)self->_suggestionContentProviders allKeys];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v13 = [v12 sectionIdentifier];
          int v14 = [v13 isEqualToString:v6];

          if (v14) {
            [(NCSuggestionManager *)self _reloadSuggestionForNotificationRequest:v12 sectionSettings:v5];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)_reloadSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [(NCSuggestionManager *)self _removeSuggestionIfNecessaryForNotificationRequest:v14];
  if ([(NCNotificationRequest *)self->_requestWithProvisionalNotificationManagementSuggestion matchesRequest:v14])
  {
    [(NCSuggestionManager *)self _createProvisionalAuthorizationSuggestionIfNeededForRequest:v14 sectionSettings:v6];
  }
  else if ([(NSMutableSet *)self->_requestsWithTimeSensitiveManagementSuggestion containsObject:v14])
  {
    [(NCSuggestionManager *)self _createTimeSensitiveSuggestionIfNeededForNotificationRequest:v14 sectionSettings:v6];
  }
  else if ([(NSMutableSet *)self->_requestsWithDirectMessagesManagementSuggestion containsObject:v14])
  {
    [(NCSuggestionManager *)self _createDirectMessagesSuggestionIfNeededForNotificationRequest:v14 sectionSettings:v6];
  }
  else if ([(NSMutableSet *)self->_requestsWithRemoteSuggestions containsObject:v14])
  {
    remoteSuggestions = self->_remoteSuggestions;
    uint64_t v8 = [v14 uuid];
    uint64_t v9 = [(NSMutableDictionary *)remoteSuggestions objectForKey:v8];

    if (v9
      && ![(NCSuggestionManager *)self _createRemoteSuggestionIfNeededForRequest:v14 remoteSuggestion:v9])
    {
      uint64_t v10 = [MEMORY[0x1E4F4AD40] sharedInstance];
      uint64_t v11 = [v9 subtype];
      uint64_t v12 = [v9 uuid];
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
      [v10 logSuggestionEvent:5 suggestionType:v11 suggestionIdentifier:v12 timestamp:v13];
    }
  }
}

- (void)clearSuggestionForNotificationRequest:(id)a3
{
  id v4 = a3;
  remoteSuggestions = self->_remoteSuggestions;
  id v12 = v4;
  id v6 = [v4 uuid];
  uint64_t v7 = [(NSMutableDictionary *)remoteSuggestions objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F4AD40] sharedInstance];
    uint64_t v9 = [v7 subtype];
    uint64_t v10 = [v7 uuid];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
    [v8 logSuggestionEvent:4 suggestionType:v9 suggestionIdentifier:v10 timestamp:v11];
  }
  [(NCSuggestionManager *)self _removeSuggestionIfNecessaryForNotificationRequest:v12];
}

- (BOOL)_createTimeSensitiveSuggestionIfNeededForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 alertOptions];
  uint64_t v9 = [v8 suppression];

  if (!v9
    && [v6 interruptionLevel] == 2
    && [v7 isTimeSensitiveEnabled]
    && ([v7 hasUserConfiguredTimeSensitiveSetting] & 1) == 0)
  {
    requestsWithTimeSensitiveManagementSuggestion = self->_requestsWithTimeSensitiveManagementSuggestion;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __100__NCSuggestionManager__createTimeSensitiveSuggestionIfNeededForNotificationRequest_sectionSettings___block_invoke;
    v36[3] = &unk_1E6A92E80;
    id v13 = v6;
    id v37 = v13;
    id v14 = [(NSMutableSet *)requestsWithTimeSensitiveManagementSuggestion objectsPassingTest:v36];
    long long v15 = [v14 anyObject];

    if (v15)
    {
      long long v16 = [v13 timestamp];
      long long v17 = [v15 timestamp];
      uint64_t v18 = [v16 compare:v17];

      if (v18 != 1) {
        goto LABEL_22;
      }
      [(NCSuggestionManager *)self _removeSuggestionIfNecessaryForNotificationRequest:v15];
    }
    long long v19 = [v13 alertOptions];
    uint64_t v20 = [v19 reason];

    if (v20 == 4)
    {
      v21 = (void *)*MEMORY[0x1E4FB3780];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = v21;
        uint64_t v23 = [v13 notificationIdentifier];
        v24 = objc_msgSend(v23, "un_logDigest");
        v25 = [v13 sectionIdentifier];
        *(_DWORD *)buf = 138543618;
        char v39 = v24;
        __int16 v40 = 2114;
        uint64_t v41 = v25;
        _os_log_impl(&dword_1D7C04000, v22, OS_LOG_TYPE_DEFAULT, "Creating time sensitive suggestion for request %{public}@ from section %{public}@", buf, 0x16u);
      }
      [(NCSuggestionManager *)self _createNewTimeSensitiveSuggestionForNotificationRequest:v13 sectionSettings:v7];
LABEL_19:
      uint64_t v33 = self->_requestsWithTimeSensitiveManagementSuggestion;
      if (!v33)
      {
        v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v35 = self->_requestsWithTimeSensitiveManagementSuggestion;
        self->_requestsWithTimeSensitiveManagementSuggestion = v34;

        uint64_t v33 = self->_requestsWithTimeSensitiveManagementSuggestion;
      }
      [(NSMutableSet *)v33 addObject:v13];
      BOOL v10 = 1;
      goto LABEL_23;
    }
    if ([v7 isScheduledDeliveryEnabled])
    {
      id v26 = [v13 alertOptions];
      uint64_t v27 = [v26 reason];

      if (v27 == 1)
      {
        uint64_t v28 = (void *)*MEMORY[0x1E4FB3780];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = v28;
          v30 = [v13 notificationIdentifier];
          uint64_t v31 = objc_msgSend(v30, "un_logDigest");
          uint64_t v32 = [v13 sectionIdentifier];
          *(_DWORD *)buf = 138543618;
          char v39 = v31;
          __int16 v40 = 2114;
          uint64_t v41 = v32;
          _os_log_impl(&dword_1D7C04000, v29, OS_LOG_TYPE_DEFAULT, "Creating time sensitive digest suggestion for request %{public}@ from section %{public}@", buf, 0x16u);
        }
        [(NCSuggestionManager *)self _createNewTimeSensitiveInDigestSuggestionForNotificationRequest:v13 sectionSettings:v7];
        goto LABEL_19;
      }
    }
LABEL_22:
    BOOL v10 = 0;
LABEL_23:

    goto LABEL_6;
  }
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

uint64_t __100__NCSuggestionManager__createTimeSensitiveSuggestionIfNeededForNotificationRequest_sectionSettings___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 sectionIdentifier];
  id v4 = [*(id *)(a1 + 32) sectionIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)_createDirectMessagesSuggestionIfNeededForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 content];
  uint64_t v9 = [v8 contentType];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F44730]];

  if (v10
    && [v7 isDirectMessagesEnabled]
    && ([v7 hasUserConfiguredDirectMessagesSetting] & 1) == 0
    && [v7 isScheduledDeliveryEnabled])
  {
    requestsWithDirectMessagesManagementSuggestion = self->_requestsWithDirectMessagesManagementSuggestion;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __101__NCSuggestionManager__createDirectMessagesSuggestionIfNeededForNotificationRequest_sectionSettings___block_invoke;
    v28[3] = &unk_1E6A92E80;
    id v12 = v6;
    id v29 = v12;
    id v13 = [(NSMutableSet *)requestsWithDirectMessagesManagementSuggestion objectsPassingTest:v28];
    id v14 = [v13 anyObject];

    if (v14)
    {
      long long v15 = [v12 timestamp];
      long long v16 = [v14 timestamp];
      uint64_t v17 = [v15 compare:v16];

      if (v17 != 1)
      {
        BOOL v26 = 0;
LABEL_16:

        goto LABEL_14;
      }
      [(NCSuggestionManager *)self _removeSuggestionIfNecessaryForNotificationRequest:v14];
    }
    uint64_t v18 = (void *)*MEMORY[0x1E4FB3780];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = v18;
      uint64_t v20 = [v12 notificationIdentifier];
      v21 = objc_msgSend(v20, "un_logDigest");
      uint64_t v22 = [v12 sectionIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v21;
      __int16 v32 = 2114;
      uint64_t v33 = v22;
      _os_log_impl(&dword_1D7C04000, v19, OS_LOG_TYPE_DEFAULT, "Creating direct messages digest suggestion for request %{public}@ from section %{public}@", buf, 0x16u);
    }
    [(NCSuggestionManager *)self _createNewDirectMessagesInDigestSuggestionForNotificationRequest:v12 sectionSettings:v7];
    uint64_t v23 = self->_requestsWithDirectMessagesManagementSuggestion;
    if (!v23)
    {
      v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v25 = self->_requestsWithDirectMessagesManagementSuggestion;
      self->_requestsWithDirectMessagesManagementSuggestion = v24;

      uint64_t v23 = self->_requestsWithDirectMessagesManagementSuggestion;
    }
    [(NSMutableSet *)v23 addObject:v12];
    BOOL v26 = 1;
    goto LABEL_16;
  }
  BOOL v26 = 0;
LABEL_14:

  return v26;
}

uint64_t __101__NCSuggestionManager__createDirectMessagesSuggestionIfNeededForNotificationRequest_sectionSettings___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 sectionIdentifier];
  id v4 = [*(id *)(a1 + 32) sectionIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)_createProvisionalAuthorizationSuggestionIfNeededForRequest:(id)a3 sectionSettings:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v8 hasProvisionalAuthorization]) {
    goto LABEL_11;
  }
  p_requestWithProvisionalNotificationManagementSuggestion = &self->_requestWithProvisionalNotificationManagementSuggestion;
  if (self->_requestWithProvisionalNotificationManagementSuggestion)
  {
    int v10 = [v7 sectionIdentifier];
    uint64_t v11 = [(NCNotificationRequest *)*p_requestWithProvisionalNotificationManagementSuggestion sectionIdentifier];
    if ([v10 isEqualToString:v11])
    {
      id v12 = [v7 timestamp];
      id v13 = [(NCNotificationRequest *)*p_requestWithProvisionalNotificationManagementSuggestion timestamp];
      uint64_t v14 = [v12 compare:v13];

      if (v14 == 1)
      {
        if (*p_requestWithProvisionalNotificationManagementSuggestion) {
          -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:");
        }
        goto LABEL_7;
      }
    }
    else
    {
    }
LABEL_11:
    BOOL v20 = 0;
    goto LABEL_12;
  }
LABEL_7:
  long long v15 = (void *)*MEMORY[0x1E4FB3780];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = v15;
    uint64_t v17 = [v7 notificationIdentifier];
    uint64_t v18 = objc_msgSend(v17, "un_logDigest");
    long long v19 = [v7 sectionIdentifier];
    int v22 = 138543618;
    uint64_t v23 = v18;
    __int16 v24 = 2114;
    v25 = v19;
    _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "Creating promoting suggestion for provisional request %{public}@ from section %{public}@", (uint8_t *)&v22, 0x16u);
  }
  [(NCSuggestionManager *)self _createNewPromotingSuggestionForNotificationRequest:v7 sectionSettings:v8];
  objc_storeStrong((id *)&self->_requestWithProvisionalNotificationManagementSuggestion, a3);
  BOOL v20 = 1;
LABEL_12:

  return v20;
}

- (BOOL)_createContactMatchingSuggestionIfNeededForRequest:(id)a3 sectionSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 content];
  uint64_t v9 = [v8 communicationContext];

  int v10 = [v9 sender];
  BOOL v11 = 0;
  if ([v9 isDirect] && v10)
  {
    id v12 = [MEMORY[0x1E4FB3820] sharedInstance];
    id v13 = [v6 topLevelSectionIdentifier];
    uint64_t v14 = [v12 curatedContactMatchDetailsForContact:v10 bundleIdentifier:v13];

    if (v14 && [v14 isSuggestedMatch])
    {
      long long v15 = [v14 cnContactFullname];
      [(NCSuggestionManager *)self _createNewCuratedContactMatchSuggestionForNotificationRequest:v6 sectionSettings:v7 contactName:v15];

      [(NSMutableSet *)self->_requestsWithContactSuggestions addObject:v6];
      BOOL v11 = 1;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (BOOL)_createSummaryFeedbackSuggestionIfNeededForRequest:(id)a3 sectionSettings:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        int v9 = [WeakRetained suggestionManager:self isSummaryVisibleForNotificationRequest:v6],
        WeakRetained,
        v9)
    && arc4random_uniform(0x64u) <= 0x1D)
  {
    int v10 = (void *)*MEMORY[0x1E4FB3780];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = v10;
      id v12 = [v6 notificationIdentifier];
      id v13 = objc_msgSend(v12, "un_logDigest");
      uint64_t v14 = [v6 sectionIdentifier];
      int v17 = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      BOOL v20 = v14;
      _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "Creating summary feedback suggestion for request %{public}@ from section %{public}@", (uint8_t *)&v17, 0x16u);
    }
    [(NCSuggestionManager *)self _createNewSummaryFeedbackSuggestionForNotificationRequest:v6 sectionSettings:v7];
    [(NSMutableSet *)self->_requestsWithSummaryFeedbackSuggestions addObject:v6];
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_createRemoteSuggestionIfNeededForRequest:(id)a3 remoteSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NCSuggestionManager *)self remoteSuggestions];
  int v9 = [v6 uuid];
  [v8 setObject:v7 forKey:v9];

  int v10 = [(NCSuggestionManager *)self _contentProviderForRequest:v6 withRemoteSuggestion:v7];

  if (v10
    && ([(NCSuggestionManager *)self suggestionContentProviders],
        BOOL v11 = objc_claimAutoreleasedReturnValue(),
        [v11 objectForKey:v6],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12)
    && [(NCSuggestionManager *)self _addSuggestionForNotificationRequest:v6 managementContentProvider:v10])
  {
    id v13 = [(NCSuggestionManager *)self requestsWithRemoteSuggestions];
    [v13 addObject:v6];

    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)auxiliaryOptionsContentProviderForNotificationRequest:(id)a3 isLongLook:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (v4)
    {
      id v8 = [v6 sectionIdentifier];
      int v9 = [(NCSuggestionManager *)self _sectionSettingsForSectionIdentifier:v8];
      if ([v9 isUserConfigurable]) {
        int v10 = [(NCNotificationManagementContentProvider *)[NCNotificationManagementLongLookContentProvider alloc] initWithNotificationRequest:v7 managementDelegate:self];
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = [(NSMutableDictionary *)self->_suggestionContentProviders objectForKey:v6];
    }
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  if (self->_deviceAuthenticated != a3)
  {
    self->_deviceAuthenticated = a3;
    BOOL v4 = [(NCSuggestionManager *)self suggestionContentProviders];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__NCSuggestionManager_setDeviceAuthenticated___block_invoke;
    v5[3] = &unk_1E6A94188;
    v5[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void __46__NCSuggestionManager_setDeviceAuthenticated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [a2 sectionIdentifier];
  id v7 = [v5 _sectionSettingsForSectionIdentifier:v6];

  if ([v7 contentPreviewSetting]) {
    uint64_t v8 = [*(id *)(a1 + 32) isDeviceAuthenticated];
  }
  else {
    uint64_t v8 = 1;
  }
  [v9 setAuxiliaryOptionsVisible:v8];
}

- (void)logResponseForNotificationRequest:(id)a3 allowsNotifications:(BOOL)a4
{
  id v6 = a3;
  id v9 = v6;
  if (!a4)
  {
    id v7 = [(NCSuggestionManager *)self suggestionContentProviders];
    uint64_t v8 = [v7 objectForKey:v9];

    if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v8 logSuggestionEvent:2];
    }

    id v6 = v9;
  }
  [(NCSuggestionManager *)self _removeSuggestionIfNecessaryForNotificationRequest:v6];
}

- (void)logResponseForNotificationRequest:(id)a3 allowsTimeSensitive:(BOOL)a4
{
  id v6 = a3;
  id v9 = v6;
  if (!a4)
  {
    id v7 = [(NCSuggestionManager *)self suggestionContentProviders];
    uint64_t v8 = [v7 objectForKey:v9];

    if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v8 logSuggestionEvent:2];
    }

    id v6 = v9;
  }
  [(NCSuggestionManager *)self _removeSuggestionIfNecessaryForNotificationRequest:v6];
}

- (void)logResponseForNotificationRequest:(id)a3 muted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v9 = v6;
  if (v4)
  {
    id v7 = [(NCSuggestionManager *)self suggestionContentProviders];
    uint64_t v8 = [v7 objectForKey:v9];

    if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v8 logSuggestionEvent:2];
    }

    id v6 = v9;
  }
  [(NCSuggestionManager *)self _removeSuggestionIfNecessaryForNotificationRequest:v6];
}

- (void)logResponseForNotificationRequest:(id)a3 scheduledDelivery:(BOOL)a4
{
  id v7 = a3;
  uint64_t v5 = [(NCSuggestionManager *)self suggestionContentProviders];
  id v6 = [v5 objectForKey:v7];

  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 logSuggestionEvent:2];
  }
  [(NCSuggestionManager *)self _removeSuggestionIfNecessaryForNotificationRequest:v7];
}

- (void)notificationManagementContentProvider:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = [(NCSuggestionManager *)self delegate];
  [v11 suggestionManager:self requestsPresentingNotificationManagementViewType:a4 forNotificationRequest:v10 withPresentingView:v9];
}

- (void)notificationManagementContentProvider:(id)a3 hasUpdatedContentForRequest:(id)a4
{
}

- (void)notificationManagementContentProvider:(id)a3 keepNotificationsForSectionIdentifierForNotificationRequest:(id)a4
{
}

- (void)notificationManagementContentProvider:(id)a3 setCuratedContactSuggestionConfirmed:(BOOL)a4 request:(id)a5
{
  BOOL v5 = a4;
  id v12 = a5;
  id v7 = [v12 content];
  uint64_t v8 = [v7 communicationContext];
  id v9 = [v8 sender];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4FB3820] sharedInstance];
    id v11 = [v12 topLevelSectionIdentifier];
    [v10 confirmCuratedContactSuggestion:v5 forContact:v9 bundleIdentifier:v11];
  }
  [(NCSuggestionManager *)self reloadContactSuggestions];
}

- (void)notificationManagementContentProvider:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(NCSuggestionManager *)self delegate];
  [v14 suggestionManager:self setMuted:v9 untilDate:v13 forSectionIdentifier:v12 threadIdentifier:v11];
}

- (void)notificationManagementContentProvider:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(NCSuggestionManager *)self delegate];
  [v8 suggestionManager:self setScheduledDelivery:v5 forSectionIdentifier:v7];
}

- (void)notificationManagementContentProvider:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(NCSuggestionManager *)self delegate];
  [v8 suggestionManager:self setAllowsTimeSensitive:v5 forSectionIdentifier:v7];
}

- (void)notificationManagementContentProvider:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(NCSuggestionManager *)self delegate];
  [v8 suggestionManager:self setAllowsDirectMessages:v5 forSectionIdentifier:v7];
}

- (void)notificationManagementContentProvider:(id)a3 setModeConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = [(NCSuggestionManager *)self delegate];
  [v6 suggestionManager:self setModeConfiguration:v5];
}

- (void)notificationManagementContentProvider:(id)a3 requestsRemoveSuggestionForRequest:(id)a4
{
}

- (void)_updateContentForNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCSuggestionManager *)self delegate];
  [v5 suggestionManager:self requestsUpdatingContentForNotificationRequest:v4];
}

- (id)_sectionSettingsForSectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NCSuggestionManager *)self delegate];
  id v6 = [v5 suggestionManager:self requestsSectionSettingsForSectionIdentifier:v4];

  return v6;
}

- (BOOL)_addSuggestionForNotificationRequest:(id)a3 managementContentProvider:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  sectionIdentifiersWithNotificationManagementSuggestions = self->_sectionIdentifiersWithNotificationManagementSuggestions;
  BOOL v9 = [v6 sectionIdentifier];
  LOBYTE(sectionIdentifiersWithNotificationManagementSuggestions) = [(NSMutableSet *)sectionIdentifiersWithNotificationManagementSuggestions containsObject:v9];

  if (sectionIdentifiersWithNotificationManagementSuggestions)
  {
    id v10 = (void *)*MEMORY[0x1E4FB3780];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_ERROR)) {
      -[NCSuggestionManager _addSuggestionForNotificationRequest:managementContentProvider:](v10, v6);
    }
    LOBYTE(v11) = 0;
  }
  else
  {
    id v12 = [v6 sectionIdentifier];
    id v13 = [(NCSuggestionManager *)self _sectionSettingsForSectionIdentifier:v12];

    int v11 = [v13 isUserConfigurable];
    id v14 = (void *)*MEMORY[0x1E4FB3780];
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v15 = v14;
        long long v16 = [v6 notificationIdentifier];
        int v17 = objc_msgSend(v16, "un_logDigest");
        uint64_t v18 = [v6 sectionIdentifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v17;
        __int16 v27 = 2114;
        uint64_t v28 = v18;
        _os_log_impl(&dword_1D7C04000, v15, OS_LOG_TYPE_DEFAULT, "Adding suggestion for request %{public}@ from section %{public}@", buf, 0x16u);
      }
      [(NSMutableDictionary *)self->_suggestionContentProviders setObject:v7 forKey:v6];
      __int16 v19 = self->_sectionIdentifiersWithNotificationManagementSuggestions;
      BOOL v20 = [v6 sectionIdentifier];
      [(NSMutableSet *)v19 addObject:v20];

      if ([v13 contentPreviewSetting]) {
        BOOL v21 = [(NCSuggestionManager *)self isDeviceAuthenticated];
      }
      else {
        BOOL v21 = 1;
      }
      [v7 setAuxiliaryOptionsVisible:v21];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __86__NCSuggestionManager__addSuggestionForNotificationRequest_managementContentProvider___block_invoke;
      v23[3] = &unk_1E6A91A68;
      v23[4] = self;
      id v24 = v6;
      dispatch_async(MEMORY[0x1E4F14428], v23);
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_ERROR))
    {
      -[NCSuggestionManager _addSuggestionForNotificationRequest:managementContentProvider:](v14, v6);
    }
  }
  return v11;
}

uint64_t __86__NCSuggestionManager__addSuggestionForNotificationRequest_managementContentProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContentForNotificationRequest:*(void *)(a1 + 40)];
}

- (void)_createNewPromotingSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [NCNotificationManagementPromotingSuggestionContentProvider alloc];
  BOOL v9 = [v6 displayName];

  id v10 = [(NCNotificationManagementPromotingSuggestionContentProvider *)v8 initWithNotificationRequest:v7 bundleDisplayName:v9 managementDelegate:self suggestionDelegate:self];
  [(NCSuggestionManager *)self _addSuggestionForNotificationRequest:v7 managementContentProvider:v10];
}

- (void)_createNewTimeSensitiveSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [NCNotificationManagementTimeSensitiveSuggestionContentProvider alloc];
  BOOL v9 = [v6 displayName];

  id v10 = [(NCNotificationManagementTimeSensitiveSuggestionContentProvider *)v8 initWithNotificationRequest:v7 bundleDisplayName:v9 managementDelegate:self suggestionDelegate:self];
  [(NCSuggestionManager *)self _addSuggestionForNotificationRequest:v7 managementContentProvider:v10];
}

- (void)_createNewTimeSensitiveInDigestSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [NCNotificationManagementTimeSensitiveInDigestSuggestionContentProvider alloc];
  BOOL v9 = [v6 displayName];

  id v10 = [(NCNotificationManagementTimeSensitiveInDigestSuggestionContentProvider *)v8 initWithNotificationRequest:v7 bundleDisplayName:v9 managementDelegate:self suggestionDelegate:self];
  [(NCSuggestionManager *)self _addSuggestionForNotificationRequest:v7 managementContentProvider:v10];
}

- (void)_createNewDirectMessagesInDigestSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [NCNotificationManagementDirectMessagesInDigestSuggestionContentProvider alloc];
  BOOL v9 = [v6 displayName];

  id v10 = [(NCNotificationManagementDirectMessagesInDigestSuggestionContentProvider *)v8 initWithNotificationRequest:v7 bundleDisplayName:v9 managementDelegate:self suggestionDelegate:self];
  [(NCSuggestionManager *)self _addSuggestionForNotificationRequest:v7 managementContentProvider:v10];
}

- (void)_createNewCuratedContactMatchSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4 contactName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [NCNotificationManagementCuratedContactMatchSuggestionContentProvider alloc];
  id v12 = [v9 displayName];

  id v13 = [(NCNotificationManagementCuratedContactMatchSuggestionContentProvider *)v11 initWithNotificationRequest:v10 bundleDisplayName:v12 managementDelegate:self suggestionDelegate:self contactName:v8];
  [(NCSuggestionManager *)self _addSuggestionForNotificationRequest:v10 managementContentProvider:v13];
}

- (void)_createNewSummaryFeedbackSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v10 = [WeakRetained suggestionManager:self isThreadSummaryVisibleForNotificationRequest:v8];

  int v11 = [NCNotificationManagementSummaryFeedbackSuggestionContentProvider alloc];
  id v12 = [v7 displayName];

  id v13 = [(NCNotificationManagementSummaryFeedbackSuggestionContentProvider *)v11 initWithNotificationRequest:v8 bundleDisplayName:v12 isStackedSummary:v10 managementDelegate:self suggestionDelegate:self];
  [(NCSuggestionManager *)self _addSuggestionForNotificationRequest:v8 managementContentProvider:v13];
}

- (void)_removeSuggestionIfNecessaryForNotificationRequest:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x1E4FB3780];
  id v6 = (void *)*MEMORY[0x1E4FB3780];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3780], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v4 notificationIdentifier];
    id v9 = objc_msgSend(v8, "un_logDigest");
    uint64_t v10 = [v4 sectionIdentifier];
    *(_DWORD *)buf = 138543618;
    long long v52 = v9;
    __int16 v53 = 2114;
    long long v54 = v10;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "Attempt to remove suggestion for request %{public}@ from section %{public}@", buf, 0x16u);
  }
  if (v4)
  {
    if ([(NCNotificationRequest *)self->_requestWithProvisionalNotificationManagementSuggestion matchesRequest:v4])
    {
      os_log_t v11 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        requestWithProvisionalNotificationManagementSuggestion = self->_requestWithProvisionalNotificationManagementSuggestion;
        id v13 = v11;
        id v14 = [(NCNotificationRequest *)requestWithProvisionalNotificationManagementSuggestion notificationIdentifier];
        BOOL v15 = objc_msgSend(v14, "un_logDigest");
        long long v16 = [(NCNotificationRequest *)self->_requestWithProvisionalNotificationManagementSuggestion sectionIdentifier];
        *(_DWORD *)buf = 138543618;
        long long v52 = v15;
        __int16 v53 = 2114;
        long long v54 = v16;
        _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "Removing suggestion for provisional request %{public}@ from section %{public}@", buf, 0x16u);
      }
      requestsWithTimeSensitiveManagementSuggestion = self->_requestWithProvisionalNotificationManagementSuggestion;
      self->_requestWithProvisionalNotificationManagementSuggestion = 0;
    }
    else if ([(NSMutableSet *)self->_requestsWithTimeSensitiveManagementSuggestion containsObject:v4])
    {
      os_log_t v20 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v21 = v20;
        int v22 = [v4 notificationIdentifier];
        uint64_t v23 = objc_msgSend(v22, "un_logDigest");
        id v24 = [v4 sectionIdentifier];
        *(_DWORD *)buf = 138543618;
        long long v52 = v23;
        __int16 v53 = 2114;
        long long v54 = v24;
        _os_log_impl(&dword_1D7C04000, v21, OS_LOG_TYPE_DEFAULT, "Removing suggestion for time sensitive request %{public}@ from section %{public}@", buf, 0x16u);
      }
      [(NSMutableSet *)self->_requestsWithTimeSensitiveManagementSuggestion removeObject:v4];
      if ([(NSMutableSet *)self->_requestsWithTimeSensitiveManagementSuggestion count]) {
        goto LABEL_9;
      }
      requestsWithTimeSensitiveManagementSuggestion = self->_requestsWithTimeSensitiveManagementSuggestion;
      self->_requestsWithTimeSensitiveManagementSuggestion = 0;
    }
    else
    {
      if (![(NSMutableSet *)self->_requestsWithDirectMessagesManagementSuggestion containsObject:v4])
      {
        if ([(NSMutableSet *)self->_requestsWithContactSuggestions containsObject:v4])
        {
          os_log_t v30 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = v30;
            __int16 v32 = [v4 notificationIdentifier];
            uint64_t v33 = objc_msgSend(v32, "un_logDigest");
            uint64_t v34 = [v4 sectionIdentifier];
            *(_DWORD *)buf = 138543618;
            long long v52 = v33;
            __int16 v53 = 2114;
            long long v54 = v34;
            _os_log_impl(&dword_1D7C04000, v31, OS_LOG_TYPE_DEFAULT, "Removing contact suggestion for request %{public}@ from section %{public}@", buf, 0x16u);
          }
          requestsWithContactSuggestions = self->_requestsWithContactSuggestions;
        }
        else
        {
          int v36 = [(NSMutableSet *)self->_requestsWithSummaryFeedbackSuggestions containsObject:v4];
          os_log_t v37 = *v5;
          BOOL v38 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
          if (!v36)
          {
            if (v38)
            {
              v43 = v37;
              v44 = [v4 notificationIdentifier];
              id v45 = objc_msgSend(v44, "un_logDigest");
              id v46 = [v4 sectionIdentifier];
              *(_DWORD *)buf = 138543618;
              long long v52 = v45;
              __int16 v53 = 2114;
              long long v54 = v46;
              _os_log_impl(&dword_1D7C04000, v43, OS_LOG_TYPE_DEFAULT, "Removing remote suggestion for request %{public}@ from section %{public}@", buf, 0x16u);
            }
            [(NSMutableSet *)self->_requestsWithRemoteSuggestions removeObject:v4];
            remoteSuggestions = self->_remoteSuggestions;
            v48 = [v4 uuid];
            [(NSMutableDictionary *)remoteSuggestions removeObjectForKey:v48];

            goto LABEL_9;
          }
          if (v38)
          {
            char v39 = v37;
            __int16 v40 = [v4 notificationIdentifier];
            uint64_t v41 = objc_msgSend(v40, "un_logDigest");
            uint64_t v42 = [v4 sectionIdentifier];
            *(_DWORD *)buf = 138543618;
            long long v52 = v41;
            __int16 v53 = 2114;
            long long v54 = v42;
            _os_log_impl(&dword_1D7C04000, v39, OS_LOG_TYPE_DEFAULT, "Removing summary feedback suggestion for request %{public}@ from section %{public}@", buf, 0x16u);
          }
          requestsWithContactSuggestions = self->_requestsWithSummaryFeedbackSuggestions;
        }
        [(NSMutableSet *)requestsWithContactSuggestions removeObject:v4];
LABEL_9:
        [(NSMutableDictionary *)self->_suggestionContentProviders removeObjectForKey:v4];
        sectionIdentifiersWithNotificationManagementSuggestions = self->_sectionIdentifiersWithNotificationManagementSuggestions;
        __int16 v19 = [v4 sectionIdentifier];
        [(NSMutableSet *)sectionIdentifiersWithNotificationManagementSuggestions removeObject:v19];

        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __74__NCSuggestionManager__removeSuggestionIfNecessaryForNotificationRequest___block_invoke;
        v49[3] = &unk_1E6A91A68;
        v49[4] = self;
        id v50 = v4;
        dispatch_async(MEMORY[0x1E4F14428], v49);

        goto LABEL_10;
      }
      os_log_t v25 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = v25;
        __int16 v27 = [v4 notificationIdentifier];
        uint64_t v28 = objc_msgSend(v27, "un_logDigest");
        uint64_t v29 = [v4 sectionIdentifier];
        *(_DWORD *)buf = 138543618;
        long long v52 = v28;
        __int16 v53 = 2114;
        long long v54 = v29;
        _os_log_impl(&dword_1D7C04000, v26, OS_LOG_TYPE_DEFAULT, "Removing suggestion for direct messages request %{public}@ from section %{public}@", buf, 0x16u);
      }
      [(NSMutableSet *)self->_requestsWithDirectMessagesManagementSuggestion removeObject:v4];
      if ([(NSMutableSet *)self->_requestsWithDirectMessagesManagementSuggestion count]) {
        goto LABEL_9;
      }
      requestsWithTimeSensitiveManagementSuggestion = self->_requestsWithDirectMessagesManagementSuggestion;
      self->_requestsWithDirectMessagesManagementSuggestion = 0;
    }

    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __74__NCSuggestionManager__removeSuggestionIfNecessaryForNotificationRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContentForNotificationRequest:*(void *)(a1 + 40)];
}

- (id)_contentProviderForRequest:(id)a3 withRemoteSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([v7 subtype])
  {
    case 4:
      uint64_t v8 = [(NCSuggestionManager *)self _contentProviderForRequest:v6 withMutingSuggestion:v7];
      goto LABEL_9;
    case 5:
      uint64_t v8 = [(NCSuggestionManager *)self _contentProviderForRequest:v6 withModeConfigurationTuningSuggestion:v7];
      goto LABEL_9;
    case 6:
      uint64_t v8 = [(NCSuggestionManager *)self _contentProviderForRequest:v6 withDigestSuggestion:v7];
      goto LABEL_9;
    case 7:
      uint64_t v8 = [(NCSuggestionManager *)self _contentProviderForRequest:v6 withUrgencyTuningSuggestion:v7];
      goto LABEL_9;
    case 8:
      uint64_t v8 = [(NCSuggestionManager *)self _contentProviderForRequest:v6 withSendMessagesToDigestSuggestion:v7];
      goto LABEL_9;
    case 9:
      uint64_t v8 = [(NCSuggestionManager *)self _contentProviderForRequest:v6 withTurnOffNotificationsForAppSuggestion:v7];
LABEL_9:
      id v9 = (void *)v8;
      break;
    default:
      id v9 = 0;
      break;
  }

  return v9;
}

- (id)_contentProviderForRequest:(id)a3 withModeConfigurationTuningSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 sectionIdentifier];
  id v9 = [(NCSuggestionManager *)self _sectionSettingsForSectionIdentifier:v8];

  uint64_t v10 = [v7 subObject];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v12 = [WeakRetained suggestionManagerRequestsCurrentModeConfiguration:self];

  id v13 = [v12 configuration];
  if (!v12) {
    goto LABEL_9;
  }
  uint64_t v14 = [v7 scope];
  if (v14 == 3)
  {
    uint64_t v20 = DNDContactHandleFromNotificationRequest(v6);
    uint64_t v21 = [v13 senderConfigurationType];
    v35 = (void *)v20;
    uint64_t v22 = [v13 exceptionForContactHandle:v20];
    uint64_t v23 = [v10 tuningSuggestionType];
    if (v23 == 3)
    {
      __int16 v19 = 0;
      if (v22 == 1 || v21 != 1) {
        goto LABEL_23;
      }
    }
    else
    {
      if (v23 != 1)
      {
        __int16 v19 = 0;
LABEL_23:
        uint64_t v28 = v35;
        goto LABEL_24;
      }
      __int16 v19 = 0;
      if (!v22 || v21) {
        goto LABEL_23;
      }
    }
    uint64_t v29 = [NCModeConfigurationRemoteSuggestionContentProvider alloc];
    uint64_t v26 = [v9 displayName];
    uint64_t v30 = [v7 uuid];
    uint64_t v31 = self;
    __int16 v32 = self;
    uint64_t v33 = (void *)v30;
    __int16 v19 = [(NCModeConfigurationRemoteSuggestionContentProvider *)v29 initWithNotificationRequest:v6 bundleDisplayName:v26 managementDelegate:v31 suggestionDelegate:v32 uuid:v30 suggestionType:0 scope:2 modeConfiguration:v12];

    uint64_t v28 = v35;
    goto LABEL_21;
  }
  if (v14 != 1) {
    goto LABEL_9;
  }
  uint64_t v15 = [v13 applicationConfigurationType];
  long long v16 = [v6 sectionIdentifier];
  uint64_t v17 = [v13 exceptionForApplication:v16];

  uint64_t v18 = [v10 tuningSuggestionType];
  if (v18 != 3)
  {
    if (v18 == 1)
    {
      __int16 v19 = 0;
      if (!v17 || v15) {
        goto LABEL_25;
      }
      goto LABEL_17;
    }
LABEL_9:
    __int16 v19 = 0;
    goto LABEL_25;
  }
  __int16 v19 = 0;
  if (v17 != 1 && v15 == 1)
  {
LABEL_17:
    id v24 = [NCModeConfigurationRemoteSuggestionContentProvider alloc];
    uint64_t v25 = [v9 displayName];
    uint64_t v26 = [v7 uuid];
    __int16 v27 = v24;
    uint64_t v28 = (void *)v25;
    __int16 v19 = [(NCModeConfigurationRemoteSuggestionContentProvider *)v27 initWithNotificationRequest:v6 bundleDisplayName:v25 managementDelegate:self suggestionDelegate:self uuid:v26 suggestionType:0 scope:0 modeConfiguration:v12];
LABEL_21:

LABEL_24:
  }
LABEL_25:

  return v19;
}

- (id)_contentProviderForRequest:(id)a3 withMutingSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 sectionIdentifier];
  id v9 = [(NCSuggestionManager *)self _sectionSettingsForSectionIdentifier:v8];

  uint64_t v10 = [v9 muteAssertion];
  os_log_t v11 = [v6 uniqueThreadIdentifier];
  uint64_t v12 = [v10 activeMuteAssertionLevelForThreadIdentifier:v11];

  uint64_t v13 = [v7 scope];
  if (v13 != 2)
  {
    if (v13 != 1 || v12 == 2)
    {
      uint64_t v14 = 0;
      goto LABEL_10;
    }
    uint64_t v28 = [NCMutingRemoteSuggestionContentProvider alloc];
    __int16 v19 = [v9 displayName];
    uint64_t v20 = [v7 uuid];
    uint64_t v21 = v28;
    id v22 = v6;
    uint64_t v23 = v19;
    id v24 = self;
    uint64_t v25 = self;
    uint64_t v26 = v20;
    uint64_t v27 = 0;
    goto LABEL_9;
  }
  uint64_t v15 = [v6 content];
  long long v16 = [v15 communicationContext];
  uint64_t v17 = [v16 identifier];

  uint64_t v14 = 0;
  if (v17 && v12 != 1)
  {
    uint64_t v18 = [NCMutingRemoteSuggestionContentProvider alloc];
    __int16 v19 = [v9 displayName];
    uint64_t v20 = [v7 uuid];
    uint64_t v21 = v18;
    id v22 = v6;
    uint64_t v23 = v19;
    id v24 = self;
    uint64_t v25 = self;
    uint64_t v26 = v20;
    uint64_t v27 = 1;
LABEL_9:
    uint64_t v14 = [(NCMutingRemoteSuggestionContentProvider *)v21 initWithNotificationRequest:v22 bundleDisplayName:v23 managementDelegate:v24 suggestionDelegate:v25 uuid:v26 scope:v27];
  }
LABEL_10:

  return v14;
}

- (id)_contentProviderForRequest:(id)a3 withDigestSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 sectionIdentifier];
  id v9 = [(NCSuggestionManager *)self _sectionSettingsForSectionIdentifier:v8];

  if ([v9 isScheduledDeliveryEnabled])
  {
    uint64_t v10 = 0;
  }
  else
  {
    os_log_t v11 = [NCDigestRemoteSuggestionContentProvider alloc];
    uint64_t v12 = [v9 displayName];
    uint64_t v13 = [v7 uuid];
    uint64_t v10 = [(NCDigestRemoteSuggestionContentProvider *)v11 initWithNotificationRequest:v6 bundleDisplayName:v12 managementDelegate:self suggestionDelegate:self uuid:v13];
  }

  return v10;
}

- (id)_contentProviderForRequest:(id)a3 withUrgencyTuningSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 sectionIdentifier];
  id v9 = [(NCSuggestionManager *)self _sectionSettingsForSectionIdentifier:v8];

  if ([v9 isTimeSensitiveEnabled])
  {
    uint64_t v10 = [NCTimeSensitiveRemoteSuggestionContentProvider alloc];
    os_log_t v11 = [v9 displayName];
    uint64_t v12 = [v7 uuid];
    uint64_t v13 = [(NCTimeSensitiveRemoteSuggestionContentProvider *)v10 initWithNotificationRequest:v6 bundleDisplayName:v11 managementDelegate:self suggestionDelegate:self uuid:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_contentProviderForRequest:(id)a3 withSendMessagesToDigestSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 sectionIdentifier];
  id v9 = [(NCSuggestionManager *)self _sectionSettingsForSectionIdentifier:v8];

  if ([v9 isScheduledDeliveryEnabled]
    && [v9 isDirectMessagesEnabled])
  {
    uint64_t v10 = [NCMessagesInDigestRemoteSuggestionContentProvider alloc];
    os_log_t v11 = [v9 displayName];
    uint64_t v12 = [v7 uuid];
    uint64_t v13 = [(NCMessagesInDigestRemoteSuggestionContentProvider *)v10 initWithNotificationRequest:v6 bundleDisplayName:v11 managementDelegate:self suggestionDelegate:self uuid:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_contentProviderForRequest:(id)a3 withTurnOffNotificationsForAppSuggestion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 sectionIdentifier];
  id v9 = [(NCSuggestionManager *)self _sectionSettingsForSectionIdentifier:v8];

  uint64_t v10 = [NCTurnOffNotificationsForAppRemoteSuggestionContentProvider alloc];
  os_log_t v11 = [v9 displayName];
  uint64_t v12 = [v6 uuid];

  uint64_t v13 = [(NCTurnOffNotificationsForAppRemoteSuggestionContentProvider *)v10 initWithNotificationRequest:v7 bundleDisplayName:v11 managementDelegate:self suggestionDelegate:self uuid:v12];

  return v13;
}

- (NCSuggestionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCSuggestionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDeviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (NSMutableDictionary)suggestionContentProviders
{
  return self->_suggestionContentProviders;
}

- (void)setSuggestionContentProviders:(id)a3
{
}

- (NCNotificationRequest)requestWithProvisionalNotificationManagementSuggestion
{
  return self->_requestWithProvisionalNotificationManagementSuggestion;
}

- (void)setRequestWithProvisionalNotificationManagementSuggestion:(id)a3
{
}

- (NSMutableSet)requestsWithTimeSensitiveManagementSuggestion
{
  return self->_requestsWithTimeSensitiveManagementSuggestion;
}

- (void)setRequestsWithTimeSensitiveManagementSuggestion:(id)a3
{
}

- (NSMutableSet)requestsWithDirectMessagesManagementSuggestion
{
  return self->_requestsWithDirectMessagesManagementSuggestion;
}

- (void)setRequestsWithDirectMessagesManagementSuggestion:(id)a3
{
}

- (NSMutableSet)sectionIdentifiersWithNotificationManagementSuggestions
{
  return self->_sectionIdentifiersWithNotificationManagementSuggestions;
}

- (void)setSectionIdentifiersWithNotificationManagementSuggestions:(id)a3
{
}

- (NSMutableDictionary)remoteSuggestions
{
  return self->_remoteSuggestions;
}

- (void)setRemoteSuggestions:(id)a3
{
}

- (NSMutableSet)requestsWithRemoteSuggestions
{
  return self->_requestsWithRemoteSuggestions;
}

- (void)setRequestsWithRemoteSuggestions:(id)a3
{
}

- (NSMutableSet)requestsWithContactSuggestions
{
  return self->_requestsWithContactSuggestions;
}

- (void)setRequestsWithContactSuggestions:(id)a3
{
}

- (NSMutableSet)requestsWithSummaryFeedbackSuggestions
{
  return self->_requestsWithSummaryFeedbackSuggestions;
}

- (void)setRequestsWithSummaryFeedbackSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsWithSummaryFeedbackSuggestions, 0);
  objc_storeStrong((id *)&self->_requestsWithContactSuggestions, 0);
  objc_storeStrong((id *)&self->_requestsWithRemoteSuggestions, 0);
  objc_storeStrong((id *)&self->_remoteSuggestions, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiersWithNotificationManagementSuggestions, 0);
  objc_storeStrong((id *)&self->_requestsWithDirectMessagesManagementSuggestion, 0);
  objc_storeStrong((id *)&self->_requestsWithTimeSensitiveManagementSuggestion, 0);
  objc_storeStrong((id *)&self->_requestWithProvisionalNotificationManagementSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestionContentProviders, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __46__NCSuggestionManager_reloadRemoteSuggestions__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_ERROR, "Error retrieving active notification suggestions with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_addSuggestionForNotificationRequest:(void *)a1 managementContentProvider:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 notificationIdentifier];
  id v5 = objc_msgSend(v4, "un_logDigest");
  id v6 = [a2 sectionIdentifier];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1D7C04000, v7, v8, "Not adding suggestion for request %{public}@ from section %{public}@ since there is an existing suggestion for this section", v9, v10, v11, v12, v13);
}

- (void)_addSuggestionForNotificationRequest:(void *)a1 managementContentProvider:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 notificationIdentifier];
  id v5 = objc_msgSend(v4, "un_logDigest");
  id v6 = [a2 sectionIdentifier];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1D7C04000, v7, v8, "Not adding suggestion for request %{public}@ from section %{public}@ since the section doesnt have user configurable settings", v9, v10, v11, v12, v13);
}

@end