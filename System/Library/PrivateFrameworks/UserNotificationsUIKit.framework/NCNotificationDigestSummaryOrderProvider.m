@interface NCNotificationDigestSummaryOrderProvider
- (ATXUserNotificationDigest)userNotificationDigest;
- (id)atxUUID;
- (void)atxLogSummaryPlatterExpandedIsUpcoming:(BOOL)a3;
- (void)atxLogSummaryPlatterShownIsUpcoming:(BOOL)a3;
- (void)generateDigestForATXUserNotificationArrays:(id)a3 withCompletionBlock:(id)a4;
- (void)setUserNotificationDigest:(id)a3;
@end

@implementation NCNotificationDigestSummaryOrderProvider

- (id)atxUUID
{
  v2 = [(NCNotificationDigestSummaryOrderProvider *)self userNotificationDigest];
  v3 = [v2 uuid];

  return v3;
}

- (void)atxLogSummaryPlatterShownIsUpcoming:(BOOL)a3
{
  id v3 = [(NCNotificationDigestSummaryOrderProvider *)self userNotificationDigest];
  [v3 logCollapsedPreview];
}

- (void)atxLogSummaryPlatterExpandedIsUpcoming:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(NCNotificationDigestSummaryOrderProvider *)self userNotificationDigest];
  id v5 = v4;
  if (v3) {
    [v4 logUpcomingView];
  }
  else {
    [v4 logScheduledView];
  }
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
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "Generating new notification digest for \"%{public}@\"", buf, 0xCu);
  }
  v11 = [(id)objc_opt_class() atxDigestGeneratorClient];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke;
  v13[3] = &unk_1E6A930D0;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v11 generateDigestForNotificationArrays:v6 reply:v13];
}

void __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_cold_1(a1, v8);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_2;
    block[3] = &unk_1E6A930A8;
    block[4] = *(void *)(a1 + 32);
    id v10 = v5;
    id v11 = *(id *)(a1 + 40);
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

void __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserNotificationDigest:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 40) viewFlattenedGroups];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }
}

- (ATXUserNotificationDigest)userNotificationDigest
{
  return self->_userNotificationDigest;
}

- (void)setUserNotificationDigest:(id)a3
{
}

- (void).cxx_destruct
{
}

void __107__NCNotificationDigestSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_cold_1(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 summaryHeading];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1D7C04000, v5, v6, "Error creating new notification digest for \"%{public}@\"! [error=%@]", v7, v8, v9, v10, v11);
}

@end