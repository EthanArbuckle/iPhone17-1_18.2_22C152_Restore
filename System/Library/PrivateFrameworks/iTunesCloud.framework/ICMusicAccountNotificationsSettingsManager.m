@interface ICMusicAccountNotificationsSettingsManager
+ (ICMusicAccountNotificationsSettingsManager)sharedManager;
- (id)_getSwitchesDependingOnSubscriptionStatus:(id)a3 withResponse:(id)a4 togglingSwitchesToValue:(BOOL)a5;
- (id)cachedAccountNotificationsNewMusicSwitch;
- (id)cachedAccountNotificationsShowInLibrarySwitch;
- (id)storeRequestContext;
- (void)getAccountNotificationsWithCompletionHandler:(id)a3;
- (void)setAccountNotificationsArtistContentFeature:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)setCachedAccountNotificationsNewMusicEnabled:(BOOL)a3;
- (void)setCachedAccountNotificationsShowInLibraryEnabled:(BOOL)a3;
@end

@implementation ICMusicAccountNotificationsSettingsManager

- (id)storeRequestContext
{
  v2 = [[ICStoreRequestContext alloc] initWithBlock:&__block_literal_global_13];

  return v2;
}

void __65__ICMusicAccountNotificationsSettingsManager_storeRequestContext__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = +[ICUserIdentity activeAccount];
  [v2 setIdentity:v5];
  v3 = [[ICURLResponseAuthenticationProvider alloc] initWithUserInteractionLevel:1];
  [v2 setAuthenticationProvider:v3];

  [v2 setAllowsExpiredBags:1];
  v4 = [[ICClientInfo alloc] initWithBundleIdentifier:@"com.apple.Music"];
  [v2 setClientInfo:v4];
}

- (id)_getSwitchesDependingOnSubscriptionStatus:(id)a3 withResponse:(id)a4 togglingSwitchesToValue:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [a4 settingsSwitches];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      uint64_t v25 = v12;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        if (([v7 hasCapability:128] & 1) == 0)
        {
          v16 = [v15 identifier];
          if ([v16 isEqualToString:ICMusicAccountNotificationsSettingsSwitchArtistsAndShows])
          {
          }
          else
          {
            [v15 identifier];
            uint64_t v17 = v13;
            BOOL v18 = v5;
            id v19 = v7;
            id v20 = v9;
            v22 = id v21 = v10;
            int v23 = [v22 isEqualToString:ICMusicAccountNotificationsSettingsSwitchShowInLibrary];

            id v10 = v21;
            id v9 = v20;
            id v7 = v19;
            BOOL v5 = v18;
            uint64_t v13 = v17;
            uint64_t v12 = v25;

            if (!v23) {
              goto LABEL_11;
            }
          }
        }
        [v9 addObject:v15];
LABEL_11:
        [v15 setIsToggled:v5];
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)cachedAccountNotificationsNewMusicSwitch
{
  id v2 = +[ICDefaults standardDefaults];
  v3 = [v2 accountNotificationsShowInLibraryDictionary];

  v4 = [[ICMusicAccountNotificationsSettingsSwitch alloc] initWithItemResponseDictionary:v3];

  return v4;
}

- (void)setCachedAccountNotificationsNewMusicEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v5 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Caching new music switch as %{BOOL}u.", (uint8_t *)&v10, 0x12u);
  }

  v6 = [ICMusicAccountNotificationsSettingsSwitch alloc];
  id v7 = [(ICMusicAccountNotificationsSettingsSwitch *)v6 initWithToggleState:v3 hasBeenToggled:1 identifier:ICMusicAccountNotificationsSettingsSwitchArtistsAndShows];
  v8 = +[ICDefaults standardDefaults];
  id v9 = [(ICMusicAccountNotificationsSettingsSwitch *)v7 itemResponseDictionary];
  [v8 setAccountNotificationsShowInLibraryDictionary:v9];
}

- (id)cachedAccountNotificationsShowInLibrarySwitch
{
  id v2 = +[ICDefaults standardDefaults];
  BOOL v3 = [v2 accountNotificationsShowInLibraryDictionary];

  v4 = [[ICMusicAccountNotificationsSettingsSwitch alloc] initWithItemResponseDictionary:v3];

  return v4;
}

- (void)setCachedAccountNotificationsShowInLibraryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v5 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Caching show in library switch as %{BOOL}u.", (uint8_t *)&v10, 0x12u);
  }

  v6 = [ICMusicAccountNotificationsSettingsSwitch alloc];
  id v7 = [(ICMusicAccountNotificationsSettingsSwitch *)v6 initWithToggleState:v3 hasBeenToggled:1 identifier:ICMusicAccountNotificationsSettingsSwitchShowInLibrary];
  v8 = +[ICDefaults standardDefaults];
  id v9 = [(ICMusicAccountNotificationsSettingsSwitch *)v7 itemResponseDictionary];
  [v8 setAccountNotificationsShowInLibraryDictionary:v9];
}

- (void)setAccountNotificationsArtistContentFeature:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [ICMusicAccountNotificationsSettingsSwitch alloc];
  v8 = [(ICMusicAccountNotificationsSettingsSwitch *)v7 initWithToggleState:v4 hasBeenToggled:1 identifier:ICMusicAccountNotificationsSettingsSwitchShowInLibrary];
  id v9 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting account notifications switches to: %{BOOL}u.", buf, 0x12u);
  }

  int v10 = +[ICDefaults standardDefaults];
  uint64_t v11 = [(ICMusicAccountNotificationsSettingsSwitch *)v8 itemResponseDictionary];
  [v10 setAccountNotificationsShowInLibraryDictionary:v11];

  __int16 v12 = [(ICMusicAccountNotificationsSettingsManager *)self storeRequestContext];
  BOOL v13 = [[ICMusicAccountNotificationsSettingsRequestOperation alloc] initWithRequestContext:v12 withRequestMethod:0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5AC9640;
  BOOL v19 = v4;
  v16[4] = self;
  id v17 = v12;
  id v18 = v6;
  id v14 = v6;
  id v15 = v12;
  [(ICMusicAccountNotificationsSettingsRequestOperation *)v13 performRequestWithResponseHandler:v16];
}

void __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[ICMusicSubscriptionStatusController sharedStatusController];
  BOOL v5 = +[ICUserIdentity activeAccount];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5AC9618;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  char v12 = *(unsigned char *)(a1 + 56);
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v7 = v3;
  [v4 getSubscriptionStatusForUserIdentity:v5 bypassingCache:1 withCompletionHandler:v8];
}

void __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _getSwitchesDependingOnSubscriptionStatus:a2 withResponse:*(void *)(a1 + 40) togglingSwitchesToValue:*(unsigned __int8 *)(a1 + 64)];
  if ([v3 count])
  {
    BOOL v4 = +[ICMusicAccountNotificationsSettingsResponse createResponseBodyWithSwitches:v3];
    BOOL v5 = [[ICMusicAccountNotificationsSettingsRequestOperation alloc] initWithRequestContext:*(void *)(a1 + 48) withRequestMethod:1 andBodyDictionary:v4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E5AC95F0;
    id v6 = *(id *)(a1 + 56);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v6;
    [(ICMusicAccountNotificationsSettingsRequestOperation *)v5 performRequestWithResponseHandler:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
}

void __112__ICMusicAccountNotificationsSettingsManager_setAccountNotificationsArtistContentFeature_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, [v5 wasSuccessful]);
  }
  v8 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully retrieved account notifications switches response.", (uint8_t *)&v10, 0xCu);
  }
}

- (void)getAccountNotificationsWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v13 = self;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Retrieving account notifications switches.", buf, 0xCu);
  }

  id v6 = [ICMusicAccountNotificationsSettingsRequestOperation alloc];
  uint64_t v7 = [(ICMusicAccountNotificationsSettingsManager *)self storeRequestContext];
  v8 = [(ICMusicAccountNotificationsSettingsRequestOperation *)v6 initWithRequestContext:v7 withRequestMethod:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__ICMusicAccountNotificationsSettingsManager_getAccountNotificationsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5AC95F0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(ICMusicAccountNotificationsSettingsRequestOperation *)v8 performRequestWithResponseHandler:v10];
}

void __91__ICMusicAccountNotificationsSettingsManager_getAccountNotificationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v20 = a3;
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "AccountNotifications");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v7;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully retrieved account notifications switches.", buf, 0xCu);
  }

  id v21 = v5;
  v8 = [v5 settingsSwitches];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [v13 identifier];
        int v15 = [v14 isEqualToString:ICMusicAccountNotificationsSettingsSwitchShowInLibrary];

        if (v15)
        {
          v16 = +[ICDefaults standardDefaults];
          id v17 = [v13 itemResponseDictionary];
          [v16 setAccountNotificationsShowInLibraryDictionary:v17];
        }
        else
        {
          id v18 = [v13 identifier];
          int v19 = [v18 isEqualToString:ICMusicAccountNotificationsSettingsSwitchArtistsAndShows];

          if (!v19) {
            continue;
          }
          v16 = +[ICDefaults standardDefaults];
          id v17 = [v13 itemResponseDictionary];
          [v16 setAccountNotificationsNewMusicDictionary:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (ICMusicAccountNotificationsSettingsManager)sharedManager
{
  if (sharedManager_sOnceToken_19108 != -1) {
    dispatch_once(&sharedManager_sOnceToken_19108, &__block_literal_global_19109);
  }
  id v2 = (void *)sharedManager_sSharedManager_19110;

  return (ICMusicAccountNotificationsSettingsManager *)v2;
}

uint64_t __59__ICMusicAccountNotificationsSettingsManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(ICMusicAccountNotificationsSettingsManager);
  uint64_t v1 = sharedManager_sSharedManager_19110;
  sharedManager_sSharedManager_19110 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end