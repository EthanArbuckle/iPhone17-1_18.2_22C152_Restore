@interface ICInAppMessageUserNotificationCoordinator
+ (BOOL)scheduleNotificationWithPayload:(id)a3 forBundleIdentifier:(id)a4;
+ (id)_amsPushHandler;
+ (id)_centerForBundleIdentifier:(id)a3;
+ (id)_musicCenter;
+ (void)addBadgeIconForBundleIdentifier:(id)a3 completion:(id)a4;
+ (void)removeBadgeIconForBundleIdentifier:(id)a3 completion:(id)a4;
+ (void)removeNotificationWithIdentifier:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation ICInAppMessageUserNotificationCoordinator

+ (id)_centerForBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 isEqualToString:@"com.apple.Music"])
    {
      uint64_t v6 = [a1 _musicCenter];
    }
    else
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v5];
    }
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)removeNotificationWithIdentifier:(id)a3 forBundleIdentifier:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 _centerForBundleIdentifier:a4];
  v11[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v7 removePendingNotificationRequestsWithIdentifiers:v8];

  id v10 = v6;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];

  [v7 removeDeliveredNotificationsWithIdentifiers:v9];
}

+ (BOOL)scheduleNotificationWithPayload:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = [a1 _amsPushHandler];
  int v7 = [v6 shouldHandleNotification:v5];
  if (v7) {
    [v6 handleNotification:v5];
  }

  return v7;
}

+ (void)removeBadgeIconForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  int v7 = [a1 _centerForBundleIdentifier:a3];
  v8 = [v7 badgeNumber];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (v9)
  {
    id v10 = [NSNumber numberWithUnsignedInteger:v9 - 1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __91__ICInAppMessageUserNotificationCoordinator_removeBadgeIconForBundleIdentifier_completion___block_invoke;
    v11[3] = &unk_1E5ACAC90;
    id v12 = v6;
    [v7 setBadgeNumber:v10 withCompletionHandler:v11];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __91__ICInAppMessageUserNotificationCoordinator_removeBadgeIconForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)addBadgeIconForBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a4;
  int v7 = [a1 _centerForBundleIdentifier:a3];
  v8 = [a1 _musicCenter];
  int v9 = [v7 isEqual:v8];

  id v10 = [v7 badgeNumber];
  uint64_t v11 = [v10 unsignedIntegerValue];

  if (v9 && v11 == 1)
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = a1;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Recieved a message to increment the badge count of the Music app when it already is badged with the number 1. The count will not be incremented.", buf, 0xCu);
    }

    v6[2](v6, 0);
  }
  else
  {
    if (v9)
    {
      v13 = &unk_1EF640918;
    }
    else
    {
      v13 = [NSNumber numberWithUnsignedInteger:v11 + 1];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__ICInAppMessageUserNotificationCoordinator_addBadgeIconForBundleIdentifier_completion___block_invoke;
    v14[3] = &unk_1E5ACAC90;
    v15 = v6;
    [v7 setBadgeNumber:v13 withCompletionHandler:v14];
  }
}

uint64_t __88__ICInAppMessageUserNotificationCoordinator_addBadgeIconForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_amsPushHandler
{
  if (_amsPushHandler_sOnceToken != -1) {
    dispatch_once(&_amsPushHandler_sOnceToken, &__block_literal_global_3);
  }
  v2 = (void *)_amsPushHandler_sharedPushHandler;

  return v2;
}

void __60__ICInAppMessageUserNotificationCoordinator__amsPushHandler__block_invoke()
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4DDF8]);
  [v3 setUserNotificationExtensionId:@"music-notification-default"];
  v0 = [MEMORY[0x1E4F4DBD8] bagForProfile:@"Music" profileVersion:@"1"];
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F4DE00]) initWithConfiguration:v3 bag:v0];
  v2 = (void *)_amsPushHandler_sharedPushHandler;
  _amsPushHandler_sharedPushHandler = v1;
}

+ (id)_musicCenter
{
  if (_musicCenter_sOnceToken != -1) {
    dispatch_once(&_musicCenter_sOnceToken, &__block_literal_global_13272);
  }
  v2 = (void *)_musicCenter_sharedMusicCenter;

  return v2;
}

uint64_t __57__ICInAppMessageUserNotificationCoordinator__musicCenter__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.Music"];
  uint64_t v1 = _musicCenter_sharedMusicCenter;
  _musicCenter_sharedMusicCenter = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end