@interface NCNotificationManagementQuietingSuggestionContentProvider
- (NCNotificationManagementQuietingSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6;
- (id)auxiliaryOptionActions;
- (void)handleKeepAction:(id)a3;
@end

@implementation NCNotificationManagementQuietingSuggestionContentProvider

- (NCNotificationManagementQuietingSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NCNotificationManagementQuietingSuggestionContentProvider;
  v11 = [(NCNotificationManagementSuggestionContentProvider *)&v17 initWithNotificationRequest:a3 bundleDisplayName:v10 managementDelegate:a5 suggestionDelegate:a6];
  if (v11)
  {
    v12 = NSString;
    v13 = NCUserNotificationsUIKitFrameworkBundle();
    v14 = [v13 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_SUGGESTION_EXPLANATION" value:&stru_1F2F516F8 table:0];
    v15 = objc_msgSend(v12, "stringWithFormat:", v14, v10);
    [(NCNotificationManagementSuggestionContentProvider *)v11 setAuxiliaryOptionsSummaryText:v15];
  }
  return v11;
}

- (id)auxiliaryOptionActions
{
  v20[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  v3 = NCUserNotificationsUIKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_SUGGESTION_KEEP" value:&stru_1F2F516F8 table:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__NCNotificationManagementQuietingSuggestionContentProvider_auxiliaryOptionActions__block_invoke;
  v17[3] = &unk_1E6A91930;
  objc_copyWeak(&v18, &location);
  v5 = [v2 actionWithTitle:v4 image:0 identifier:@"notification-management-quieting-suggestion-keep" handler:v17];

  v6 = (void *)MEMORY[0x1E4FB13F0];
  v7 = NCUserNotificationsUIKitFrameworkBundle();
  v8 = [v7 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_SUGGESTION_MANAGE" value:&stru_1F2F516F8 table:0];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __83__NCNotificationManagementQuietingSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2;
  v15 = &unk_1E6A91930;
  objc_copyWeak(&v16, &location);
  v9 = [v6 actionWithTitle:v8 image:0 identifier:@"notification-management-quieting-suggestion-manage" handler:&v12];

  v20[0] = v5;
  v20[1] = v9;
  id v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 2, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

void __83__NCNotificationManagementQuietingSuggestionContentProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained handleKeepAction:v4];
}

void __83__NCNotificationManagementQuietingSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained handleManageAction:v4];
}

- (void)handleKeepAction:(id)a3
{
  id v5 = [(NCNotificationManagementSuggestionContentProvider *)self suggestionDelegate];
  v4 = [(NCNotificationManagementContentProvider *)self notificationRequest];
  [v5 notificationManagementContentProvider:self keepNotificationsForSectionIdentifierForNotificationRequest:v4];
}

@end