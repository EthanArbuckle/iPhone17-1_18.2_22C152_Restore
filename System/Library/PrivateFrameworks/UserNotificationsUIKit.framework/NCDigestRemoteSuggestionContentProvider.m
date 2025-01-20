@interface NCDigestRemoteSuggestionContentProvider
- (NCDigestRemoteSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6 uuid:(id)a7;
- (id)auxiliaryOptionActions;
- (void)handleAcceptAction:(id)a3;
- (void)handleRejectAction:(id)a3;
@end

@implementation NCDigestRemoteSuggestionContentProvider

- (NCDigestRemoteSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6 uuid:(id)a7
{
  id v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NCDigestRemoteSuggestionContentProvider;
  v13 = [(NCRemoteSuggestionContentProvider *)&v19 initWithNotificationRequest:a3 bundleDisplayName:v12 managementDelegate:a5 suggestionDelegate:a6 uuid:a7];
  if (v13)
  {
    v14 = NSString;
    v15 = NCUserNotificationsUIKitFrameworkBundle();
    v16 = [v15 localizedStringForKey:@"NOTIFICATION_REMOTE_MANAGEMENT_SUMMARY_SUGGESTION" value:&stru_1F2F516F8 table:0];
    v17 = objc_msgSend(v14, "stringWithFormat:", v16, v12);
    [(NCNotificationManagementSuggestionContentProvider *)v13 setAuxiliaryOptionsSummaryText:v17];
  }
  return v13;
}

- (id)auxiliaryOptionActions
{
  v20[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  v3 = NCUserNotificationsUIKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"NOTIFICATION_REMOTE_MANAGEMENT_SUGGESTION_NOT_NOW" value:&stru_1F2F516F8 table:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__NCDigestRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke;
  v17[3] = &unk_1E6A91930;
  objc_copyWeak(&v18, &location);
  v5 = [v2 actionWithTitle:v4 image:0 identifier:@"notification-management-remote-suggestion-reject" handler:v17];

  v6 = (void *)MEMORY[0x1E4FB13F0];
  v7 = NCUserNotificationsUIKitFrameworkBundle();
  v8 = [v7 localizedStringForKey:@"NOTIFICATION_REMOTE_MANAGEMENT_SUMMARY_SUGGESTION_ADD_TO_SUMMARY" value:&stru_1F2F516F8 table:0];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __65__NCDigestRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2;
  v15 = &unk_1E6A91930;
  objc_copyWeak(&v16, &location);
  v9 = [v6 actionWithTitle:v8 image:0 identifier:@"notification-management-remote-suggestion-accept" handler:&v12];

  v20[0] = v5;
  v20[1] = v9;
  v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 2, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

void __65__NCDigestRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained handleRejectAction:v4];
}

void __65__NCDigestRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained handleAcceptAction:v4];
}

- (void)handleRejectAction:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F4AD40], "sharedInstance", a3);
  v5 = [(NCRemoteSuggestionContentProvider *)self uuid];
  v6 = [MEMORY[0x1E4F1C9C8] now];
  [v4 logSuggestionEvent:1 suggestionType:6 suggestionIdentifier:v5 timestamp:v6];

  id v8 = [(NCNotificationManagementSuggestionContentProvider *)self suggestionDelegate];
  v7 = [(NCNotificationManagementContentProvider *)self notificationRequest];
  [v8 notificationManagementContentProvider:self requestsRemoveSuggestionForRequest:v7];
}

- (void)handleAcceptAction:(id)a3
{
  id v10 = [(NCNotificationManagementSuggestionContentProvider *)self suggestionDelegate];
  v4 = [(NCNotificationManagementContentProvider *)self notificationRequest];
  v5 = [v4 sectionIdentifier];
  [v10 notificationManagementContentProvider:self setScheduledDelivery:1 forSectionIdentifier:v5];

  v6 = [MEMORY[0x1E4F4AD40] sharedInstance];
  v7 = [(NCRemoteSuggestionContentProvider *)self uuid];
  id v8 = [MEMORY[0x1E4F1C9C8] now];
  [v6 logSuggestionEvent:2 suggestionType:6 suggestionIdentifier:v7 timestamp:v8];

  v9 = [(NCNotificationManagementContentProvider *)self notificationRequest];
  [v10 notificationManagementContentProvider:self requestsRemoveSuggestionForRequest:v9];
}

@end