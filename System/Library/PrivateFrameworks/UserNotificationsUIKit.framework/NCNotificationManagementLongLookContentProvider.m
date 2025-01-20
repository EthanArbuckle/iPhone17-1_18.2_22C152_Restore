@interface NCNotificationManagementLongLookContentProvider
- (id)auxiliaryOptionActions;
@end

@implementation NCNotificationManagementLongLookContentProvider

- (id)auxiliaryOptionActions
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  v3 = NCUserNotificationsUIKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_SUGGESTION_MANAGE" value:&stru_1F2F516F8 table:0];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __73__NCNotificationManagementLongLookContentProvider_auxiliaryOptionActions__block_invoke;
  v11 = &unk_1E6A91930;
  objc_copyWeak(&v12, &location);
  v5 = [v2 actionWithTitle:v4 image:0 identifier:@"notification-management-quieting-suggestion-manage" handler:&v8];

  v14[0] = v5;
  v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __73__NCNotificationManagementLongLookContentProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained handleManageAction:v4];
}

@end