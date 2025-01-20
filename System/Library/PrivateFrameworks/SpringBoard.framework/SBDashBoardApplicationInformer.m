@interface SBDashBoardApplicationInformer
- (BOOL)_isBundleIdentifierBlockedForCommunicationPolicy:(id)a3;
- (BOOL)applicationExistsForBundleIdentifier:(id)a3;
- (BOOL)isBundleIdentifierBlockedForScreenTimeExpiration:(id)a3;
- (BOOL)isBundleIdentifierClock:(id)a3;
- (BOOL)isBundleIdentifierUserVisible:(id)a3;
- (BOOL)isBundleIdentifierWallet:(id)a3;
- (BOOL)isInstallingApplicationWithBundleIdentifier:(id)a3;
- (BOOL)isSystemRestoringFromBackup;
- (BOOL)shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3;
- (SBDashBoardApplicationInformer)init;
- (void)_installedApplicationsDidChange:(id)a3;
- (void)_screenTimeNotificationPolicyDidChange:(id)a3;
- (void)addApplicationInformationObserver:(id)a3;
- (void)dealloc;
- (void)removeApplicationInformationObserver:(id)a3;
@end

@implementation SBDashBoardApplicationInformer

- (SBDashBoardApplicationInformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardApplicationInformer;
  v2 = [(SBDashBoardApplicationInformer *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__installedApplicationsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__screenTimeNotificationPolicyDidChange_ name:@"SBCommunicationPolicyDidChangeNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardApplicationInformer;
  [(SBDashBoardApplicationInformer *)&v4 dealloc];
}

- (BOOL)isBundleIdentifierClock:(id)a3
{
  return [a3 isEqualToString:@"com.apple.mobiletimer"];
}

- (BOOL)isBundleIdentifierWallet:(id)a3
{
  return [a3 isEqualToString:@"com.apple.Passbook"];
}

- (BOOL)shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBDashBoardApplicationInformer *)self isBundleIdentifierBlockedForScreenTimeExpiration:v4]|| [(SBDashBoardApplicationInformer *)self _isBundleIdentifierBlockedForCommunicationPolicy:v4];

  return v5;
}

- (BOOL)isBundleIdentifierBlockedForScreenTimeExpiration:(id)a3
{
  id v3 = a3;
  id v4 = +[SBApplicationController sharedInstance];
  BOOL v5 = [v4 applicationWithBundleIdentifier:v3];

  objc_super v6 = [v5 info];
  LOBYTE(v3) = [v6 isBlockedForScreenTimeExpiration];

  return (char)v3;
}

- (BOOL)_isBundleIdentifierBlockedForCommunicationPolicy:(id)a3
{
  id v3 = a3;
  id v4 = +[SBCommunicationPolicyManager sharedInstance];
  char v5 = [v4 shouldScreenTimeSuppressNotificationsForBundleIdentifier:v3];

  return v5;
}

- (BOOL)isBundleIdentifierUserVisible:(id)a3
{
  id v3 = a3;
  id v4 = +[SBIconController sharedInstance];
  char v5 = [v4 visibleIconStateDisplayIdentifiers];
  char v6 = [v5 containsObject:v3];

  return v6;
}

- (void)addApplicationInformationObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    char v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeApplicationInformationObserver:(id)a3
{
}

- (BOOL)isSystemRestoringFromBackup
{
  v2 = +[SBSyncController sharedInstance];
  char v3 = [v2 isRestoring];

  return v3;
}

- (BOOL)isInstallingApplicationWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SBApplicationPlaceholderController sharedInstance];
  char v5 = [v4 placeholderForDisplayID:v3];

  return v5 != 0;
}

- (BOOL)applicationExistsForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SBApplicationController sharedInstance];
  char v5 = [v4 applicationWithBundleIdentifier:v3];

  return v5 != 0;
}

- (void)_installedApplicationsDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  char v5 = [v4 objectForKey:@"SBInstalledApplicationsUpdatedBundleIDs"];
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) applicationInformer:self updatedApplications:v5];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_screenTimeNotificationPolicyDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  char v5 = [v4 objectForKey:@"SBCommunicationPolicyChangedBundleIdentifiersKey"];
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) applicationInformer:self updatedApplications:v5];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
}

@end