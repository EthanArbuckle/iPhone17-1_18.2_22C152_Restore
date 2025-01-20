@interface NCNotificationMissedSummaryOrderProvider
- (ATXMissedNotificationRanking)missedNotificationRanking;
- (BOOL)adjustForContentSizeCategoryChange;
- (NCNotificationSummaryContentProvider)summaryContentProvider;
- (NCNotificationSummaryPlatterView)summaryPlatterView;
- (id)atxUUID;
- (id)leadingSummaryPlatterViewConfigureIfNecessary;
- (void)_updateSummaryContentProvider;
- (void)_updateSummaryPlatterView;
- (void)atxLogRemoval;
- (void)atxLogSummaryPlatterExpandedIsUpcoming:(BOOL)a3;
- (void)atxLogSummaryPlatterShownIsUpcoming:(BOOL)a3;
- (void)generateDigestForATXUserNotificationArrays:(id)a3 withCompletionBlock:(id)a4;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setMissedNotificationRanking:(id)a3;
- (void)setSummaryContentProvider:(id)a3;
- (void)setSummaryPlatterView:(id)a3;
@end

@implementation NCNotificationMissedSummaryOrderProvider

- (void)setDeviceAuthenticated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationMissedSummaryOrderProvider;
  [(NCNotificationSummaryOrderProvider *)&v4 setDeviceAuthenticated:a3];
  [(NCNotificationMissedSummaryOrderProvider *)self _updateSummaryPlatterView];
}

- (id)atxUUID
{
  v2 = [(NCNotificationMissedSummaryOrderProvider *)self missedNotificationRanking];
  v3 = [v2 uuid];

  return v3;
}

- (void)atxLogSummaryPlatterShownIsUpcoming:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationMissedSummaryOrderProvider *)self missedNotificationRanking];
  [v4 logCollapsedViewWithIsUpcoming:v3];
}

- (void)atxLogSummaryPlatterExpandedIsUpcoming:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationMissedSummaryOrderProvider *)self missedNotificationRanking];
  [v4 logExpandedViewWithIsUpcoming:v3];
}

- (void)atxLogRemoval
{
  id v2 = [(NCNotificationMissedSummaryOrderProvider *)self missedNotificationRanking];
  [v2 logRemoval];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

- (id)leadingSummaryPlatterViewConfigureIfNecessary
{
  summaryPlatterView = self->_summaryPlatterView;
  if (!summaryPlatterView)
  {
    id v4 = objc_alloc_init(NCNotificationSummaryPlatterView);
    v5 = self->_summaryPlatterView;
    self->_summaryPlatterView = v4;

    -[NCNotificationSummaryPlatterView setFrame:](self->_summaryPlatterView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_summaryPlatterView;
    v7 = [(NCNotificationSummaryOrderProvider *)self materialGroupNameBase];
    [(PLPlatterView *)v6 setMaterialGroupNameBase:v7];

    v8 = self->_summaryPlatterView;
    v9 = [(NCNotificationSummaryOrderProvider *)self summaryPlatterViewTapGestureRecognizer];
    [(NCNotificationSummaryPlatterView *)v8 addGestureRecognizer:v9];

    [(NCNotificationMissedSummaryOrderProvider *)self _updateSummaryPlatterView];
    summaryPlatterView = self->_summaryPlatterView;
  }

  return summaryPlatterView;
}

- (void)generateDigestForATXUserNotificationArrays:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = [(NCNotificationSummaryOrderProvider *)self summaryHeading];
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "Generating new missed notification ranking for \"%{public}@\"", buf, 0xCu);
  }
  v11 = [(id)objc_opt_class() atxDigestGeneratorClient];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke;
  v13[3] = &unk_1E6A931B8;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v11 generateMissedNotificationRankingForNotificationArrays:v6 modeUUID:0 reply:v13];
}

void __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_cold_1(a1, v8);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_2;
    block[3] = &unk_1E6A930A8;
    block[4] = *(void *)(a1 + 32);
    id v10 = v5;
    id v11 = *(id *)(a1 + 40);
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

void __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setMissedNotificationRanking:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 40) rankedGroups];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    id v2 = v4;
  }
}

- (void)_updateSummaryPlatterView
{
  [(NCNotificationMissedSummaryOrderProvider *)self _updateSummaryContentProvider];
  [(NCNotificationSummaryOrderProvider *)self configureSummaryContentDisplaying:self->_summaryPlatterView withSummaryContentProviding:self->_summaryContentProvider];
  id v3 = [(NCNotificationSummaryOrderProvider *)self delegate];
  [v3 notificationSummaryOrderProviderRequestsReloadingLeadingSummaryPlatterView:self];
}

- (void)_updateSummaryContentProvider
{
  id v16 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
  id v3 = [(NCNotificationMissedSummaryOrderProvider *)self missedNotificationRanking];
  id v4 = [v3 rankedGroups];

  id v5 = [(NCNotificationSummaryOrderProvider *)self orderedNotificationGroupLists:v16 forATXUserNotificationDigestNotificationGroup:v4 orderGroupNotifications:0];
  if (![v5 count])
  {
    uint64_t v6 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];

    id v5 = (void *)v6;
  }
  id v7 = [(NCNotificationSummaryOrderProvider *)self titlesForSectionListsInSummary];
  if ([v5 count] || objc_msgSend(v7, "count"))
  {
    v8 = [(NCNotificationSummaryOrderProvider *)self representativeNotificationRequestsForNotificationGroupLists:v5];
    v9 = +[NCNotificationSummaryContentProvider summaryContentProviderOfType:2 notificationRequests:v8];
    summaryContentProvider = self->_summaryContentProvider;
    self->_summaryContentProvider = v9;

    [(NCNotificationSummaryContentProvider *)self->_summaryContentProvider setDeviceAuthenticated:[(NCNotificationSummaryOrderProvider *)self isDeviceAuthenticated]];
    id v11 = self->_summaryContentProvider;
    id v12 = [(NCNotificationSummaryOrderProvider *)self summaryHeading];
    [(NCNotificationSummaryContentProvider *)v11 setSummaryTitle:v12];

    v13 = self->_summaryContentProvider;
    id v14 = [(NCNotificationSummaryOrderProvider *)self dndMode];
    v15 = [v14 symbolImageName];
    [(NCNotificationSummaryContentProvider *)v13 setSummaryIconSymbolName:v15];

    [(NCNotificationSummaryContentProvider *)self->_summaryContentProvider setTitlesForSectionListsInSummary:v7];
  }
  else
  {
    v8 = self->_summaryContentProvider;
    self->_summaryContentProvider = 0;
  }
}

- (NCNotificationSummaryPlatterView)summaryPlatterView
{
  return self->_summaryPlatterView;
}

- (void)setSummaryPlatterView:(id)a3
{
}

- (NCNotificationSummaryContentProvider)summaryContentProvider
{
  return self->_summaryContentProvider;
}

- (void)setSummaryContentProvider:(id)a3
{
}

- (ATXMissedNotificationRanking)missedNotificationRanking
{
  return self->_missedNotificationRanking;
}

- (void)setMissedNotificationRanking:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missedNotificationRanking, 0);
  objc_storeStrong((id *)&self->_summaryContentProvider, 0);

  objc_storeStrong((id *)&self->_summaryPlatterView, 0);
}

void __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 summaryHeading];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1D7C04000, v5, v6, "Error creating missed notification ranking for \"%{public}@\"! [error=%@]", v7, v8, v9, v10, v11);
}

@end