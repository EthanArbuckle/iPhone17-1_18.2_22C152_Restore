@interface NCNotificationDigestDetailedSummaryOrderProvider
- (BOOL)_presentFeaturedNotificationsInline;
- (BOOL)_shouldAllowTapOnLeadingSummaryPlatterView;
- (BOOL)adjustForContentSizeCategoryChange;
- (NCDigestSummaryPlatterView)digestSummaryPlatterView;
- (NCNotificationSummaryContentProvider)appsSummaryContentProvider;
- (NCNotificationSummaryContentProvider)communicationsSummaryContentProvider;
- (NSArray)featuredNotificationContentProviders;
- (id)_atxHighlightedGroups;
- (id)leadingSummaryPlatterViewConfigureIfNecessary;
- (unint64_t)_totalNotificationCountForSectionIdentifier:(id)a3;
- (void)_updateAppsSummaryContentProvidersWithRankedGroups:(id)a3;
- (void)_updateCommunicationsSummaryContentProvider;
- (void)_updateDigestSummaryPlatterView;
- (void)_updateFeaturedNotificationContentProvidersWithHighlightedGroups:(id)a3;
- (void)setAppsSummaryContentProvider:(id)a3;
- (void)setCommunicationsSummaryContentProvider:(id)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setDigestSummaryPlatterView:(id)a3;
- (void)setFeaturedNotificationContentProviders:(id)a3;
@end

@implementation NCNotificationDigestDetailedSummaryOrderProvider

- (void)setDeviceAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationDigestDetailedSummaryOrderProvider;
  -[NCNotificationSummaryOrderProvider setDeviceAuthenticated:](&v15, sel_setDeviceAuthenticated_);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_featuredNotificationContentProviders;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "setDeviceAuthenticated:", v3, (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }

  [(NCNotificationSummaryContentProvider *)self->_communicationsSummaryContentProvider setDeviceAuthenticated:v3];
  [(NCNotificationSummaryContentProvider *)self->_appsSummaryContentProvider setDeviceAuthenticated:v3];
  [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView updateContent];
  v10 = [(NCNotificationSummaryOrderProvider *)self delegate];
  [v10 notificationSummaryOrderProviderRequestsReloadingLeadingSummaryPlatterView:self];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

- (id)leadingSummaryPlatterViewConfigureIfNecessary
{
  digestSummaryPlatterView = self->_digestSummaryPlatterView;
  if (!digestSummaryPlatterView)
  {
    v4 = objc_alloc_init(NCDigestSummaryPlatterView);
    v5 = self->_digestSummaryPlatterView;
    self->_digestSummaryPlatterView = v4;

    -[NCDigestSummaryPlatterView setFrame:](self->_digestSummaryPlatterView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_digestSummaryPlatterView;
    uint64_t v7 = [(NCNotificationSummaryOrderProvider *)self materialGroupNameBase];
    [(NCDigestSummaryPlatterView *)v6 setMaterialGroupNameBase:v7];

    uint64_t v8 = self->_digestSummaryPlatterView;
    uint64_t v9 = [(NCNotificationSummaryOrderProvider *)self summaryPlatterViewTapGestureRecognizer];
    [(NCDigestSummaryPlatterView *)v8 addGestureRecognizer:v9];

    [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView setAlpha:1.0];
    [(NCNotificationDigestDetailedSummaryOrderProvider *)self _updateDigestSummaryPlatterView];
    digestSummaryPlatterView = self->_digestSummaryPlatterView;
  }

  return digestSummaryPlatterView;
}

- (void)_updateDigestSummaryPlatterView
{
  id v3 = [(NCNotificationDigestDetailedSummaryOrderProvider *)self leadingSummaryPlatterViewConfigureIfNecessary];
  BOOL v4 = [(NCNotificationSummaryOrderProvider *)self isOnboardingSummary];
  digestSummaryPlatterView = self->_digestSummaryPlatterView;
  if (v4)
  {
    [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView setDate:0];
    uint64_t v6 = self->_digestSummaryPlatterView;
    uint64_t v7 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_SUMMARY_ONBOARDING_SUGGESTION_TITLE" value:&stru_1F2F516F8 table:0];
    [(NCDigestSummaryPlatterView *)v6 setHeading:v8];

    uint64_t v9 = self->_digestSummaryPlatterView;
    v10 = NCUserNotificationsUIKitFrameworkBundle();
    long long v11 = [v10 localizedStringForKey:@"NOTIFICATION_SUMMARY_ONBOARDING_SUGGESTION_MESSAGE" value:&stru_1F2F516F8 table:0];
    [(NCDigestSummaryPlatterView *)v9 setSubheading:v11];
  }
  else
  {
    long long v12 = [(NCNotificationSummaryOrderProvider *)self summaryDate];
    if (v12)
    {
      [(NCDigestSummaryPlatterView *)digestSummaryPlatterView setDate:v12];
    }
    else
    {
      long long v13 = [MEMORY[0x1E4F1C9C8] date];
      [(NCDigestSummaryPlatterView *)digestSummaryPlatterView setDate:v13];
    }
    long long v14 = self->_digestSummaryPlatterView;
    v10 = [(NCNotificationSummaryOrderProvider *)self summaryHeading];
    [(NCDigestSummaryPlatterView *)v14 setHeading:v10];
  }

  id v25 = [(NCNotificationDigestDetailedSummaryOrderProvider *)self _atxHighlightedGroups];
  [(NCNotificationDigestDetailedSummaryOrderProvider *)self _updateFeaturedNotificationContentProvidersWithHighlightedGroups:v25];
  [(NCNotificationDigestDetailedSummaryOrderProvider *)self _updateCommunicationsSummaryContentProvider];
  objc_super v15 = (void *)MEMORY[0x1E4F1CA48];
  v16 = [(NCNotificationDigestSummaryOrderProvider *)self userNotificationDigest];
  uint64_t v17 = [v16 rankedGroups];
  v18 = [v15 arrayWithArray:v17];

  [v18 removeObjectsInArray:v25];
  [(NCNotificationDigestDetailedSummaryOrderProvider *)self _updateAppsSummaryContentProvidersWithRankedGroups:v18];
  if ([(NCNotificationSummaryOrderProvider *)self isOnboardingSummary])
  {
    [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView setCount:0];
  }
  else if ([(NCNotificationDigestDetailedSummaryOrderProvider *)self _shouldAllowTapOnLeadingSummaryPlatterView])
  {
    v19 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
    unint64_t v20 = [(NCNotificationSummaryOrderProvider *)self notificationCountForNotificationGroupLists:v19];

    if (v20 >= 0x63) {
      uint64_t v21 = 99;
    }
    else {
      uint64_t v21 = v20;
    }
    [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView setCount:v21];
    [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView setClearControlView:0];
  }
  else
  {
    [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView setCount:0];
    v22 = self->_digestSummaryPlatterView;
    v23 = [(NCNotificationSummaryOrderProvider *)self clearControlViewForLeadingSummaryPlatterView];
    [(NCDigestSummaryPlatterView *)v22 setClearControlView:v23];
  }
  v24 = [(NCNotificationSummaryOrderProvider *)self delegate];
  [v24 notificationSummaryOrderProviderRequestsReloadingLeadingSummaryPlatterView:self];

  [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView updateContent];
}

- (id)_atxHighlightedGroups
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  id v3 = [(NCNotificationDigestSummaryOrderProvider *)self userNotificationDigest];
  BOOL v4 = [v3 highlightedGroups];
  id v40 = [(NCNotificationSummaryOrderProvider *)self filterPresentNotificationGroupsInDigestNotificationGroups:v4];

  if ((unint64_t)[(id)v36[5] count] <= 2)
  {
    v5 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
    unint64_t v6 = [v5 count];
    LODWORD(v6) = v6 > [(id)v36[5] count];

    if (v6)
    {
      uint64_t v7 = (id)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v22 = [(NCNotificationSummaryOrderProvider *)self summaryHeading];
        uint64_t v23 = [(id)v36[5] count];
        v24 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
        uint64_t v25 = [v24 count];
        *(_DWORD *)buf = 138543874;
        id v42 = v22;
        __int16 v43 = 2048;
        uint64_t v44 = v23;
        __int16 v45 = 2048;
        uint64_t v46 = v25;
        _os_log_error_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_ERROR, "Notification digest for \"%{public}@\" returned %lu highlighted groups while total count is %lu", buf, 0x20u);
      }
      id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = (void *)[v8 initWithArray:v36[5]];
      v10 = [(NCNotificationDigestSummaryOrderProvider *)self userNotificationDigest];
      long long v11 = [v10 rankedGroups];
      long long v12 = [(NCNotificationSummaryOrderProvider *)self filterPresentNotificationGroupsInDigestNotificationGroups:v11];

      long long v13 = [(NCNotificationDigestSummaryOrderProvider *)self userNotificationDigest];
      long long v14 = [v13 messageGroups];
      objc_super v15 = [(NCNotificationSummaryOrderProvider *)self filterPresentNotificationGroupsInDigestNotificationGroups:v14];

      v16 = [v12 indexesOfObjectsPassingTest:&__block_literal_global_242];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __73__NCNotificationDigestDetailedSummaryOrderProvider__atxHighlightedGroups__block_invoke_2;
      v30[3] = &unk_1E6A93118;
      id v17 = v12;
      id v31 = v17;
      id v18 = v9;
      id v32 = v18;
      id v19 = v15;
      id v33 = v19;
      v34 = &v35;
      [v16 enumerateIndexesUsingBlock:v30];
      if ((unint64_t)[(id)v36[5] count] <= 2)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __73__NCNotificationDigestDetailedSummaryOrderProvider__atxHighlightedGroups__block_invoke_3;
        v26[3] = &unk_1E6A93140;
        id v27 = v18;
        id v28 = v19;
        v29 = &v35;
        [v17 enumerateObjectsUsingBlock:v26];
      }
    }
  }
  id v20 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v20;
}

uint64_t __73__NCNotificationDigestDetailedSummaryOrderProvider__atxHighlightedGroups__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPreviewableAttachment];
}

void __73__NCNotificationDigestDetailedSummaryOrderProvider__atxHighlightedGroups__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(a1 + 32) objectAtIndex:a2];
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:") & 1) == 0
    && ([*(id *)(a1 + 48) containsObject:v5] & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v5];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] == 3) {
      *a3 = 1;
    }
  }
}

void __73__NCNotificationDigestDetailedSummaryOrderProvider__atxHighlightedGroups__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0
    && ([*(id *)(a1 + 40) containsObject:v6] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v6];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] == 3) {
    *a4 = 1;
  }
}

- (void)_updateFeaturedNotificationContentProvidersWithHighlightedGroups:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  BOOL v4 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
  id v5 = [(NCNotificationSummaryOrderProvider *)self orderedNotificationGroupLists:v4 forATXUserNotificationDigestNotificationGroup:v23 orderGroupNotifications:0];

  if (![v5 count])
  {
    id v6 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
    uint64_t v7 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
    unint64_t v8 = [v7 count];

    if (v8 >= 3) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = objc_msgSend(v6, "subarrayWithRange:", 0, v9);

    id v5 = (void *)v10;
  }
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_super v15 = [v14 leadingNotificationRequest];
        v16 = v15;
        if (v15)
        {
          featuredNotificationContentProviders = self->_featuredNotificationContentProviders;
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __117__NCNotificationDigestDetailedSummaryOrderProvider__updateFeaturedNotificationContentProvidersWithHighlightedGroups___block_invoke;
          v29[3] = &unk_1E6A93168;
          id v18 = v15;
          id v30 = v18;
          uint64_t v19 = [(NSArray *)featuredNotificationContentProviders indexOfObjectPassingTest:v29];
          if (v19 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v20 = -[NCDigestFeaturedNotificationContentProvider initWithNotificationRequest:groupCount:]([NCDigestFeaturedNotificationContentProvider alloc], "initWithNotificationRequest:groupCount:", v18, [v14 notificationCount]);
            uint64_t v21 = [(NCNotificationSummaryOrderProvider *)self listComponentDelegate];
            [(NCDigestFeaturedNotificationContentProvider *)v20 setListComponentDelegate:v21];

            [(NCNotificationRequestCoalescingContentProvider *)v20 setDeviceAuthenticated:[(NCNotificationSummaryOrderProvider *)self isDeviceAuthenticated]];
            objc_initWeak(&location, self);
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __117__NCNotificationDigestDetailedSummaryOrderProvider__updateFeaturedNotificationContentProvidersWithHighlightedGroups___block_invoke_2;
            v26[3] = &unk_1E6A93190;
            objc_copyWeak(&v27, &location);
            void v26[4] = self;
            v26[5] = v14;
            [(NCDigestFeaturedNotificationContentProvider *)v20 setDefaultActionBlock:v26];
            objc_destroyWeak(&v27);
            objc_destroyWeak(&location);
          }
          else
          {
            id v20 = [(NSArray *)self->_featuredNotificationContentProviders objectAtIndex:v19];
          }
          id v22 = [v18 sectionIdentifier];
          [(NCDigestFeaturedNotificationContentProvider *)v20 setAppNotificationCount:[(NCNotificationDigestDetailedSummaryOrderProvider *)self _totalNotificationCountForSectionIdentifier:v22]];

          if (v20) {
            [v24 addObject:v20];
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

  if (![(NSArray *)self->_featuredNotificationContentProviders isEqualToArray:v24])
  {
    objc_storeStrong((id *)&self->_featuredNotificationContentProviders, v24);
    [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView setFeaturedNotificationContentProviders:self->_featuredNotificationContentProviders];
  }
  [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView setPresentFeaturedNotificationsInline:[(NCNotificationDigestDetailedSummaryOrderProvider *)self _presentFeaturedNotificationsInline]];
}

uint64_t __117__NCNotificationDigestDetailedSummaryOrderProvider__updateFeaturedNotificationContentProvidersWithHighlightedGroups___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 notificationRequest];
  uint64_t v4 = [v3 matchesRequest:*(void *)(a1 + 32)];

  return v4;
}

void __117__NCNotificationDigestDetailedSummaryOrderProvider__updateFeaturedNotificationContentProvidersWithHighlightedGroups___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) leadingNotificationRequest];
  [v2 notificationSummaryOrderProvider:v3 requestsPerformingDefaultActionForNotificationRequest:v4 inGroupList:*(void *)(a1 + 40)];
}

- (unint64_t)_totalNotificationCountForSectionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__NCNotificationDigestDetailedSummaryOrderProvider__totalNotificationCountForSectionIdentifier___block_invoke;
  v9[3] = &unk_1E6A91D78;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __96__NCNotificationDigestDetailedSummaryOrderProvider__totalNotificationCountForSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 sectionIdentifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v5 notificationCount];
  }
}

- (void)_updateAppsSummaryContentProvidersWithRankedGroups:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
  id v9 = [(NCNotificationSummaryOrderProvider *)self orderedNotificationGroupLists:v5 forATXUserNotificationDigestNotificationGroup:v4 orderGroupNotifications:0];

  if ([v9 count])
  {
    id v6 = [(NCNotificationSummaryOrderProvider *)self representativeNotificationRequestsForNotificationGroupLists:v9];
    unint64_t v7 = +[NCNotificationSummaryContentProvider summaryContentProviderOfType:0 notificationRequests:v6];
    appsSummaryContentProvider = self->_appsSummaryContentProvider;
    self->_appsSummaryContentProvider = v7;
  }
  else
  {
    id v6 = self->_appsSummaryContentProvider;
    self->_appsSummaryContentProvider = 0;
  }

  [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView setAppsSummaryContentProvider:self->_appsSummaryContentProvider];
}

- (void)_updateCommunicationsSummaryContentProvider
{
  uint64_t v3 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
  id v4 = [(NCNotificationDigestSummaryOrderProvider *)self userNotificationDigest];
  id v5 = [v4 messageGroups];
  id v9 = [(NCNotificationSummaryOrderProvider *)self orderedNotificationGroupLists:v3 forATXUserNotificationDigestNotificationGroup:v5 orderGroupNotifications:0];

  if ([v9 count])
  {
    id v6 = [(NCNotificationSummaryOrderProvider *)self representativeNotificationRequestsForNotificationGroupLists:v9];
    unint64_t v7 = +[NCNotificationSummaryContentProvider summaryContentProviderOfType:1 notificationRequests:v6];
    communicationsSummaryContentProvider = self->_communicationsSummaryContentProvider;
    self->_communicationsSummaryContentProvider = v7;
  }
  else
  {
    id v6 = self->_communicationsSummaryContentProvider;
    self->_communicationsSummaryContentProvider = 0;
  }

  [(NCDigestSummaryPlatterView *)self->_digestSummaryPlatterView setCommunicationsSummaryContentProvider:self->_communicationsSummaryContentProvider];
}

- (BOOL)_shouldAllowTapOnLeadingSummaryPlatterView
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_communicationsSummaryContentProvider)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    unint64_t v4 = [(NSArray *)self->_featuredNotificationContentProviders count];
    BOOL v2 = v4 > 2 || [(NCNotificationSummaryOrderProvider *)self currentNotificationCount] > v4;
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      if (v2) {
        id v6 = @"Allowing";
      }
      else {
        id v6 = @"Not allowing";
      }
      unint64_t v7 = v5;
      unint64_t v8 = [(NCNotificationSummaryOrderProvider *)self summaryHeading];
      int v10 = 138544130;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      long long v13 = v8;
      __int16 v14 = 2048;
      unint64_t v15 = v4;
      __int16 v16 = 2048;
      unint64_t v17 = [(NCNotificationSummaryOrderProvider *)self currentNotificationCount];
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ tap on leading summary platter for \"%{public}@\" with featured notification count = %lu and total notification count = %lu", (uint8_t *)&v10, 0x2Au);
    }
  }
  return v2;
}

- (BOOL)_presentFeaturedNotificationsInline
{
  unint64_t v3 = [(NSArray *)self->_featuredNotificationContentProviders count];
  if (v3 == 2) {
    unint64_t v3 = [(NCNotificationSummaryOrderProvider *)self currentNotificationCount];
  }
  return v3 < 3;
}

- (NCDigestSummaryPlatterView)digestSummaryPlatterView
{
  return self->_digestSummaryPlatterView;
}

- (void)setDigestSummaryPlatterView:(id)a3
{
}

- (NCNotificationSummaryContentProvider)communicationsSummaryContentProvider
{
  return self->_communicationsSummaryContentProvider;
}

- (void)setCommunicationsSummaryContentProvider:(id)a3
{
}

- (NCNotificationSummaryContentProvider)appsSummaryContentProvider
{
  return self->_appsSummaryContentProvider;
}

- (void)setAppsSummaryContentProvider:(id)a3
{
}

- (NSArray)featuredNotificationContentProviders
{
  return self->_featuredNotificationContentProviders;
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredNotificationContentProviders, 0);
  objc_storeStrong((id *)&self->_appsSummaryContentProvider, 0);
  objc_storeStrong((id *)&self->_communicationsSummaryContentProvider, 0);

  objc_storeStrong((id *)&self->_digestSummaryPlatterView, 0);
}

@end