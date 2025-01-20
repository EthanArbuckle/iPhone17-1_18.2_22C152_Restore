@interface NCNotificationSummaryOrderProvider
+ (id)atxDigestGeneratorClient;
+ (id)atxQueue;
+ (id)notificationSummaryOrderProviderOfType:(unint64_t)a3;
- (BOOL)_shouldAllowTapOnLeadingSummaryPlatterView;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isDeviceAuthenticated;
- (BOOL)isOnboardingSummary;
- (DNDMode)dndMode;
- (NCNotificationSummaryOrderProvider)init;
- (NCNotificationSummaryOrderProviderDelegate)delegate;
- (NSArray)cachedOrderedNotificationGroupLists;
- (NSDate)summaryDate;
- (NSString)summaryHeading;
- (NSUUID)atxUUID;
- (UITapGestureRecognizer)summaryPlatterViewTapGestureRecognizer;
- (id)atxUserNotificationsArrayForNotificationGroupLists:(id)a3;
- (id)atxUserNotificationsForNotificationRequests:(id)a3;
- (id)clearControlViewForLeadingSummaryPlatterView;
- (id)filterPresentNotificationGroupsInDigestNotificationGroups:(id)a3;
- (id)leadingSummaryPlatterViewConfigureIfNecessary;
- (id)listComponentDelegate;
- (id)materialGroupNameBase;
- (id)notificationRequestsInNotificationGroupLists:(id)a3;
- (id)orderedNotificationGroupLists:(id)a3 forATXUserNotificationDigestNotificationGroup:(id)a4 orderGroupNotifications:(BOOL)a5;
- (id)representativeNotificationGroupListInGroupLists:(id)a3 forATXUserNotificationDigestNotificationGroup:(id)a4;
- (id)representativeNotificationRequestsForNotificationGroupLists:(id)a3;
- (id)titlesForSectionListsInSummary;
- (int64_t)atxDigestDeliveryTime;
- (unint64_t)currentNotificationCount;
- (unint64_t)notificationCountForNotificationGroupLists:(id)a3;
- (void)_tapOnSummaryPlatterView;
- (void)_updateNotificationOrderingForGroupList:(id)a3 byATXDigestNotificationGroup:(id)a4;
- (void)configureSummaryContentDisplaying:(id)a3 withSummaryContentProviding:(id)a4;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAtxDigestDeliveryTime:(int64_t)a3;
- (void)setCachedOrderedNotificationGroupLists:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setDndMode:(id)a3;
- (void)setOnboardingSummary:(BOOL)a3;
- (void)setSummaryDate:(id)a3;
- (void)setSummaryHeading:(id)a3;
- (void)setSummaryPlatterViewTapGestureRecognizer:(id)a3;
- (void)updateSummaryOrderWithNotificationGroupLists:(id)a3 reloadDigest:(BOOL)a4;
- (void)updatedOrderedGroupLists;
@end

@implementation NCNotificationSummaryOrderProvider

+ (id)notificationSummaryOrderProviderOfType:(unint64_t)a3
{
  if (a3 > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_alloc_init(*off_1E6A931D8[a3]);
  }
  return v4;
}

- (NCNotificationSummaryOrderProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummaryOrderProvider;
  v2 = [(NCNotificationSummaryOrderProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v2 action:sel__tapOnSummaryPlatterView];
    summaryPlatterViewTapGestureRecognizer = v2->_summaryPlatterViewTapGestureRecognizer;
    v2->_summaryPlatterViewTapGestureRecognizer = (UITapGestureRecognizer *)v3;
  }
  return v2;
}

+ (id)atxQueue
{
  if (atxQueue_onceToken != -1) {
    dispatch_once(&atxQueue_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)atxQueue___queue;

  return v2;
}

void __46__NCNotificationSummaryOrderProvider_atxQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.UserNotificationsUI.NCNotificationSummaryOrderProvider", v2);
  v1 = (void *)atxQueue___queue;
  atxQueue___queue = (uint64_t)v0;
}

+ (id)atxDigestGeneratorClient
{
  if (atxDigestGeneratorClient_digestGeneratorClientOnceToken != -1) {
    dispatch_once(&atxDigestGeneratorClient_digestGeneratorClientOnceToken, &__block_literal_global_18);
  }
  v2 = (void *)atxDigestGeneratorClient___digestGeneratorClient;

  return v2;
}

void __62__NCNotificationSummaryOrderProvider_atxDigestGeneratorClient__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F4B1B8]);
  v1 = (void *)atxDigestGeneratorClient___digestGeneratorClient;
  atxDigestGeneratorClient___digestGeneratorClient = (uint64_t)v0;
}

- (void)updateSummaryOrderWithNotificationGroupLists:(id)a3 reloadDigest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[v6 copy];
  [(NCNotificationSummaryOrderProvider *)self setCachedOrderedNotificationGroupLists:v7];

  [(NCNotificationSummaryOrderProvider *)self updateLeadingSummaryPlatterView];
  if (v4)
  {
    v8 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
    v9 = [(NCNotificationSummaryOrderProvider *)self atxUserNotificationsArrayForNotificationGroupLists:v8];

    objc_initWeak(&location, self);
    v10 = [(id)objc_opt_class() atxQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__NCNotificationSummaryOrderProvider_updateSummaryOrderWithNotificationGroupLists_reloadDigest___block_invoke;
    block[3] = &unk_1E6A92FE0;
    objc_copyWeak(&v14, &location);
    id v13 = v9;
    id v11 = v9;
    dispatch_async(v10, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __96__NCNotificationSummaryOrderProvider_updateSummaryOrderWithNotificationGroupLists_reloadDigest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __96__NCNotificationSummaryOrderProvider_updateSummaryOrderWithNotificationGroupLists_reloadDigest___block_invoke_2;
  v4[3] = &unk_1E6A92FB8;
  v4[4] = WeakRetained;
  [WeakRetained generateDigestForATXUserNotificationArrays:v3 withCompletionBlock:v4];
}

void __96__NCNotificationSummaryOrderProvider_updateSummaryOrderWithNotificationGroupLists_reloadDigest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  BOOL v4 = [*(id *)(a1 + 32) cachedOrderedNotificationGroupLists];
  v5 = (void *)[v4 copy];

  id v6 = [*(id *)(a1 + 32) orderedNotificationGroupLists:v5 forATXUserNotificationDigestNotificationGroup:v3 orderGroupNotifications:1];

  if ([v6 count] && (uint64_t v7 = objc_msgSend(v6, "count"), v7 == objc_msgSend(v5, "count")))
  {
    v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      id v11 = [v9 summaryHeading];
      int v16 = 138543362;
      v17 = v11;
      _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "Notification digest for \"%{public}@\" updating group ordering and summary platter view", (uint8_t *)&v16, 0xCu);
    }
    [*(id *)(a1 + 32) setCachedOrderedNotificationGroupLists:v6];
    [*(id *)(a1 + 32) updateLeadingSummaryPlatterView];
    [*(id *)(a1 + 32) updatedOrderedGroupLists];
  }
  else
  {
    v12 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR))
    {
      id v13 = *(void **)(a1 + 32);
      id v14 = v12;
      v15 = [v13 summaryHeading];
      int v16 = 138543874;
      v17 = v15;
      __int16 v18 = 2048;
      uint64_t v19 = [v6 count];
      __int16 v20 = 2048;
      uint64_t v21 = [v5 count];
      _os_log_error_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_ERROR, "Notification digest for \"%{public}@\" not updating summary and order [count=%ld; expectedCount=%ld]",
        (uint8_t *)&v16,
        0x20u);
    }
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

- (id)leadingSummaryPlatterViewConfigureIfNecessary
{
  return 0;
}

- (id)materialGroupNameBase
{
  id v3 = [(NCNotificationSummaryOrderProvider *)self delegate];
  BOOL v4 = [v3 materialGroupNameBaseForNotificationSummaryOrderProvider:self];

  return v4;
}

- (void)updatedOrderedGroupLists
{
  id v4 = [(NCNotificationSummaryOrderProvider *)self delegate];
  id v3 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
  [v4 notificationSummaryOrderProvider:self didUpdateOrderedNotificationGroupLists:v3];
}

- (id)titlesForSectionListsInSummary
{
  id v3 = [(NCNotificationSummaryOrderProvider *)self delegate];
  id v4 = [v3 titlesForSectionListsInSummaryForSummaryOrderProvider:self];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)listComponentDelegate
{
  id v3 = [(NCNotificationSummaryOrderProvider *)self delegate];
  id v4 = [v3 listComponentDelegateForSummaryPlatterViewForNotificationSummaryOrderProvider:self];

  return v4;
}

- (unint64_t)currentNotificationCount
{
  id v3 = [(NCNotificationSummaryOrderProvider *)self delegate];
  unint64_t v4 = [v3 notificationCountForSummaryOrderProvider:self];

  return v4;
}

- (id)clearControlViewForLeadingSummaryPlatterView
{
  id v3 = [(NCNotificationSummaryOrderProvider *)self delegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unint64_t v4 = [v3 clearControlViewForLeadingSummaryPlatterViewForSummaryOrderProvider:self];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)notificationRequestsInNotificationGroupLists:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "allNotificationRequests", (void)v12);
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (unint64_t)notificationCountForNotificationGroupLists:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) notificationCount];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)representativeNotificationRequestsForNotificationGroupLists:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "count", (void)v14))
        {
          long long v11 = [v10 leadingNotificationRequest];

          if (v11)
          {
            long long v12 = [v10 leadingNotificationRequest];
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)atxUserNotificationsForNotificationRequests:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_26);

  [v5 addObjectsFromArray:v6];

  return v5;
}

uint64_t __82__NCNotificationSummaryOrderProvider_atxUserNotificationsForNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  return [a2 atxUserNotification];
}

- (id)atxUserNotificationsArrayForNotificationGroupLists:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__NCNotificationSummaryOrderProvider_atxUserNotificationsArrayForNotificationGroupLists___block_invoke;
  v11[3] = &unk_1E6A92C18;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateObjectsUsingBlock:v11];

  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

void __89__NCNotificationSummaryOrderProvider_atxUserNotificationsArrayForNotificationGroupLists___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 allNotificationRequests];
  id v3 = [*(id *)(a1 + 32) atxUserNotificationsForNotificationRequests:v4];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)orderedNotificationGroupLists:(id)a3 forATXUserNotificationDigestNotificationGroup:(id)a4 orderGroupNotifications:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v17 = -[NCNotificationSummaryOrderProvider representativeNotificationGroupListInGroupLists:forATXUserNotificationDigestNotificationGroup:](self, "representativeNotificationGroupListInGroupLists:forATXUserNotificationDigestNotificationGroup:", v8, v16, (void)v19);
        if (v17)
        {
          if (([v10 containsObject:v17] & 1) == 0)
          {
            [v10 addObject:v17];
            if (v5) {
              [(NCNotificationSummaryOrderProvider *)self _updateNotificationOrderingForGroupList:v17 byATXDigestNotificationGroup:v16];
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  return v10;
}

- (void)_updateNotificationOrderingForGroupList:(id)a3 byATXDigestNotificationGroup:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  id v9 = [v7 rankedNotifications];

  id v10 = [v5 allNotificationRequests];
  id v11 = (void *)[v10 copy];

  uint64_t v12 = [v9 count];
  if (v12 == [v11 count])
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __107__NCNotificationSummaryOrderProvider__updateNotificationOrderingForGroupList_byATXDigestNotificationGroup___block_invoke;
    v27 = &unk_1E6A93008;
    id v13 = v11;
    id v28 = v13;
    id v14 = v8;
    id v29 = v14;
    [v9 enumerateObjectsUsingBlock:&v24];
    long long v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v13, v24, v25, v26, v27);
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
    if ([v15 isEqualToSet:v16])
    {
      char v17 = [v13 isEqualToArray:v14];

      if ((v17 & 1) == 0)
      {
        __int16 v18 = (void *)*MEMORY[0x1E4FB3778];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
        {
          long long v19 = v18;
          long long v20 = [v5 logDescription];
          *(_DWORD *)buf = 138543362;
          v31 = v20;
          _os_log_impl(&dword_1D7C04000, v19, OS_LOG_TYPE_DEFAULT, "Ranked digest updating notification ordering for group %{public}@", buf, 0xCu);
        }
        [v5 updateOrderedNotificationRequests:v14];
      }
    }
    else
    {
    }
  }
  else
  {
    long long v21 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR))
    {
      long long v22 = v21;
      v23 = [v5 logDescription];
      *(_DWORD *)buf = 138543874;
      v31 = v23;
      __int16 v32 = 2048;
      uint64_t v33 = [v9 count];
      __int16 v34 = 2048;
      uint64_t v35 = [v11 count];
      _os_log_error_impl(&dword_1D7C04000, v22, OS_LOG_TYPE_ERROR, "Ranked notification ordering for group %{public}@ is incorrect with count %ld and actual count %ld", buf, 0x20u);
    }
  }
}

void __107__NCNotificationSummaryOrderProvider__updateNotificationOrderingForGroupList_byATXDigestNotificationGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__NCNotificationSummaryOrderProvider__updateNotificationOrderingForGroupList_byATXDigestNotificationGroup___block_invoke_2;
  v12[3] = &unk_1E6A92790;
  id v8 = v6;
  id v13 = v8;
  uint64_t v9 = [v7 indexOfObjectPassingTest:v12];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *a4 = 1;
  }
  else
  {
    id v10 = *(void **)(a1 + 40);
    id v11 = [*(id *)(a1 + 32) objectAtIndex:v9];
    [v10 addObject:v11];
  }
}

uint64_t __107__NCNotificationSummaryOrderProvider__updateNotificationOrderingForGroupList_byATXDigestNotificationGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (id)representativeNotificationGroupListInGroupLists:(id)a3 forATXUserNotificationDigestNotificationGroup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 representativeNotificationUUID];
  id v8 = [v6 rankedNotifications];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke;
  v18[3] = &unk_1E6A93030;
  id v9 = v7;
  id v19 = v9;
  id v10 = objc_msgSend(v8, "bs_firstObjectPassingTest:", v18);

  id v11 = [v10 sectionID];
  if ([v11 length])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke_2;
    v15[3] = &unk_1E6A93058;
    id v16 = v11;
    id v17 = v10;
    uint64_t v12 = [v5 indexOfObjectPassingTest:v15];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v13 = 0;
    }
    else
    {
      id v13 = [v5 objectAtIndex:v12];
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

BOOL __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 sectionIdentifier];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke_3;
    v8[3] = &unk_1E6A925C8;
    id v9 = *(id *)(a1 + 40);
    BOOL v6 = [v3 indexOfNotificationRequestPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __132__NCNotificationSummaryOrderProvider_representativeNotificationGroupListInGroupLists_forATXUserNotificationDigestNotificationGroup___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (id)filterPresentNotificationGroupsInDigestNotificationGroups:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__NCNotificationSummaryOrderProvider_filterPresentNotificationGroupsInDigestNotificationGroups___block_invoke;
  v11[3] = &unk_1E6A93080;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateObjectsUsingBlock:v11];

  id v8 = v12;
  id v9 = v7;

  return v9;
}

void __96__NCNotificationSummaryOrderProvider_filterPresentNotificationGroupsInDigestNotificationGroups___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 cachedOrderedNotificationGroupLists];
  id v5 = [v3 representativeNotificationGroupListInGroupLists:v4 forATXUserNotificationDigestNotificationGroup:v6];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (void)configureSummaryContentDisplaying:(id)a3 withSummaryContentProviding:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  id v6 = [v5 summaryTitle];
  [v12 setSummaryTitle:v6];

  id v7 = [v5 summary];
  [v12 setSummary:v7];

  id v8 = [v5 summaryIconSymbolName];
  if (v8)
  {
    [v12 setSummaryIconSymbolName:v8];
  }
  else
  {
    id v9 = [v5 summaryIconViews];
    [v12 setSummaryIconViews:v9];
  }
  objc_msgSend(v12, "setIconViewLeading:", objc_msgSend(v5, "isIconViewLeading"));
  id v10 = [v5 summaryTitleFontName];
  [v12 setSummaryTitleFontName:v10];

  id v11 = [v5 summaryDate];
  [v12 setSummaryDate:v11];
}

- (void)_tapOnSummaryPlatterView
{
  if ([(NCNotificationSummaryOrderProvider *)self _shouldAllowTapOnLeadingSummaryPlatterView])
  {
    id v3 = [(NCNotificationSummaryOrderProvider *)self delegate];
    [v3 notificationSummaryOrderProviderDidTapOnLeadingSummaryPlatterView:self];
  }
}

- (BOOL)_shouldAllowTapOnLeadingSummaryPlatterView
{
  return 1;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NCNotificationSummaryOrderProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationSummaryOrderProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDeviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  self->_deviceAuthenticated = a3;
}

- (int64_t)atxDigestDeliveryTime
{
  return self->_atxDigestDeliveryTime;
}

- (void)setAtxDigestDeliveryTime:(int64_t)a3
{
  self->_atxDigestDeliveryTime = a3;
}

- (NSDate)summaryDate
{
  return self->_summaryDate;
}

- (void)setSummaryDate:(id)a3
{
}

- (NSString)summaryHeading
{
  return self->_summaryHeading;
}

- (void)setSummaryHeading:(id)a3
{
}

- (DNDMode)dndMode
{
  return self->_dndMode;
}

- (void)setDndMode:(id)a3
{
}

- (BOOL)isOnboardingSummary
{
  return self->_onboardingSummary;
}

- (void)setOnboardingSummary:(BOOL)a3
{
  self->_onboardingSummary = a3;
}

- (NSUUID)atxUUID
{
  return self->_atxUUID;
}

- (NSArray)cachedOrderedNotificationGroupLists
{
  return self->_cachedOrderedNotificationGroupLists;
}

- (void)setCachedOrderedNotificationGroupLists:(id)a3
{
}

- (UITapGestureRecognizer)summaryPlatterViewTapGestureRecognizer
{
  return self->_summaryPlatterViewTapGestureRecognizer;
}

- (void)setSummaryPlatterViewTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryPlatterViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_cachedOrderedNotificationGroupLists, 0);
  objc_storeStrong((id *)&self->_atxUUID, 0);
  objc_storeStrong((id *)&self->_dndMode, 0);
  objc_storeStrong((id *)&self->_summaryHeading, 0);
  objc_storeStrong((id *)&self->_summaryDate, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end