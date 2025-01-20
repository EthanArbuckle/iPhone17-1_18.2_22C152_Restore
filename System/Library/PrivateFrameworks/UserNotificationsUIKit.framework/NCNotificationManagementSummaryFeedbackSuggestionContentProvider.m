@interface NCNotificationManagementSummaryFeedbackSuggestionContentProvider
- (BOOL)isStackedSummary;
- (NCNotificationManagementSummaryFeedbackSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 isStackedSummary:(BOOL)a5 managementDelegate:(id)a6 suggestionDelegate:(id)a7;
- (id)auxiliaryOptionActions;
- (void)handleBadAction:(id)a3;
- (void)handleGoodAction:(id)a3;
@end

@implementation NCNotificationManagementSummaryFeedbackSuggestionContentProvider

- (NCNotificationManagementSummaryFeedbackSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 isStackedSummary:(BOOL)a5 managementDelegate:(id)a6 suggestionDelegate:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationManagementSummaryFeedbackSuggestionContentProvider;
  v8 = [(NCNotificationManagementSuggestionContentProvider *)&v15 initWithNotificationRequest:a3 bundleDisplayName:a4 managementDelegate:a6 suggestionDelegate:a7];
  v9 = v8;
  if (v8)
  {
    v8->_isStackedSummary = a5;
    v10 = NSString;
    v11 = NCUserNotificationsUIKitFrameworkBundle();
    v12 = [v11 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_SUMMARY_FEEDBACK_SUGGESTION" value:&stru_1F2F516F8 table:0];
    v13 = [v10 stringWithFormat:v12];
    [(NCNotificationManagementSuggestionContentProvider *)v9 setAuxiliaryOptionsSummaryText:v13];
  }
  return v9;
}

- (id)auxiliaryOptionActions
{
  v20[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  v3 = NCUserNotificationsUIKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_SUGGESTION_GOOD" value:&stru_1F2F516F8 table:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__NCNotificationManagementSummaryFeedbackSuggestionContentProvider_auxiliaryOptionActions__block_invoke;
  v17[3] = &unk_1E6A91930;
  objc_copyWeak(&v18, &location);
  v5 = [v2 actionWithTitle:v4 image:0 identifier:@"notification-management-summary-feedback-good" handler:v17];

  v6 = (void *)MEMORY[0x1E4FB13F0];
  v7 = NCUserNotificationsUIKitFrameworkBundle();
  v8 = [v7 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_SUGGESTION_BAD" value:&stru_1F2F516F8 table:0];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __90__NCNotificationManagementSummaryFeedbackSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2;
  objc_super v15 = &unk_1E6A91930;
  objc_copyWeak(&v16, &location);
  v9 = [v6 actionWithTitle:v8 image:0 identifier:@"notification-management-summary-feedback-bad" handler:&v12];

  v20[0] = v5;
  v20[1] = v9;
  v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 2, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

void __90__NCNotificationManagementSummaryFeedbackSuggestionContentProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained handleGoodAction:v4];
}

void __90__NCNotificationManagementSummaryFeedbackSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained handleBadAction:v4];
}

- (void)handleGoodAction:(id)a3
{
  id v8 = [(NCNotificationManagementSuggestionContentProvider *)self suggestionDelegate];
  v4 = [NCSummarizationFeedbackManager alloc];
  v5 = [(NCNotificationManagementContentProvider *)self notificationRequest];
  v6 = [(NCSummarizationFeedbackManager *)v4 initWithRequest:v5 isShowingStackSummary:[(NCNotificationManagementSummaryFeedbackSuggestionContentProvider *)self isStackedSummary]];
  [(NCSummarizationFeedbackManager *)v6 thumbsUp];

  v7 = [(NCNotificationManagementContentProvider *)self notificationRequest];
  [v8 notificationManagementContentProvider:self requestsRemoveSuggestionForRequest:v7];
}

- (void)handleBadAction:(id)a3
{
  id v8 = [(NCNotificationManagementSuggestionContentProvider *)self suggestionDelegate];
  v4 = [NCSummarizationFeedbackManager alloc];
  v5 = [(NCNotificationManagementContentProvider *)self notificationRequest];
  v6 = [(NCSummarizationFeedbackManager *)v4 initWithRequest:v5 isShowingStackSummary:[(NCNotificationManagementSummaryFeedbackSuggestionContentProvider *)self isStackedSummary]];
  [(NCSummarizationFeedbackManager *)v6 thumbsDown];

  v7 = [(NCNotificationManagementContentProvider *)self notificationRequest];
  [v8 notificationManagementContentProvider:self requestsRemoveSuggestionForRequest:v7];
}

- (BOOL)isStackedSummary
{
  return self->_isStackedSummary;
}

@end