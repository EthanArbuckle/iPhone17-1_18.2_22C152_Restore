@interface UNSExampleUserNotificationCenter
- (UNSExampleUserNotificationCenter)init;
- (id)_basicPostUpdateRecipe;
- (id)_existingNotificationRequestForIdentifier:(id)a3;
- (id)_newNotificationRequest:(id)a3 threadIdentifier:(id)a4;
- (id)_userNotificationCenter;
- (id)latestNotificationRequestIdentifier;
- (id)sectionIdentifier;
- (void)_postNotificationWithID:(id)a3 threadIdentifier:(id)a4;
- (void)publish;
- (void)publish:(unint64_t)a3 completion:(id)a4;
- (void)publish:(unint64_t)a3 numberOfUniqueThreads:(unint64_t)a4 completion:(id)a5;
- (void)publishWithNumberOfUniqueThreads:(unint64_t)a3;
- (void)removeAllNotifications;
- (void)update;
@end

@implementation UNSExampleUserNotificationCenter

- (UNSExampleUserNotificationCenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)UNSExampleUserNotificationCenter;
  v2 = [(UNSExampleUserNotificationCenter *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(UNSExampleUserNotificationCenter *)v2 _basicPostUpdateRecipe];
    basicTestRecipe = v3->_basicTestRecipe;
    v3->_basicTestRecipe = (PTTestRecipe *)v4;

    +[PTDomain registerTestRecipe:v3->_basicTestRecipe];
  }
  return v3;
}

- (id)latestNotificationRequestIdentifier
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", __notificationRequestCount);
}

- (id)sectionIdentifier
{
  return @"com.apple.usernotifications.example";
}

- (void)publish
{
}

- (void)publishWithNumberOfUniqueThreads:(unint64_t)a3
{
  ++__notificationRequestCount;
  if (a3)
  {
    unint64_t v4 = __notificationThreadCount++;
    objc_msgSend(NSString, "stringWithFormat:", @"thread-%ld", v4 % a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", __notificationRequestCount);
  [(UNSExampleUserNotificationCenter *)self _postNotificationWithID:v5 threadIdentifier:v6];
}

- (void)publish:(unint64_t)a3 completion:(id)a4
{
}

- (void)publish:(unint64_t)a3 numberOfUniqueThreads:(unint64_t)a4 completion:(id)a5
{
  v8 = (void (**)(void))a5;
  if (a3)
  {
    unint64_t v9 = a3;
    do
    {
      [(UNSExampleUserNotificationCenter *)self publishWithNumberOfUniqueThreads:a4];
      --v9;
    }
    while (v9);
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    do
    {
      v10 = dispatch_group_create();
      dispatch_group_enter(v10);
      v11 = [(UNSExampleUserNotificationCenter *)self _userNotificationCenter];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __77__UNSExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke;
      v13[3] = &unk_26462F890;
      v15 = &v17;
      unint64_t v16 = a3;
      v12 = v10;
      v14 = v12;
      [v11 getDeliveredNotificationsWithCompletionHandler:v13];

      dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    }
    while (!*((unsigned char *)v18 + 24));
    _Block_object_dispose(&v17, 8);
  }
  if (v8) {
    v8[2](v8);
  }
}

void __77__UNSExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke(void *a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [a2 count] == a1[6];
  v3 = a1[4];
  dispatch_group_leave(v3);
}

- (void)update
{
  objc_msgSend(NSString, "stringWithFormat:", @"%ld", __notificationRequestCount);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UNSExampleUserNotificationCenter *)self _postNotificationWithID:v3 threadIdentifier:0];
}

- (void)removeAllNotifications
{
  id v3 = [(UNSExampleUserNotificationCenter *)self _userNotificationCenter];
  [v3 removeAllPendingNotificationRequests];

  id v4 = [(UNSExampleUserNotificationCenter *)self _userNotificationCenter];
  [v4 removeAllDeliveredNotifications];
}

- (void)_postNotificationWithID:(id)a3 threadIdentifier:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  objc_super v7 = [(UNSExampleUserNotificationCenter *)self _existingNotificationRequestForIdentifier:v18];
  if (v7)
  {
    id v8 = v7;
    unint64_t v9 = [v7 content];
    v10 = (void *)[v9 mutableCopy];
    v11 = [MEMORY[0x263EFF910] date];
    [v10 setDate:v11];

    id v12 = [v9 body];
    uint64_t v13 = [v12 rangeOfString:@" [UPDATE]\n\n\n[UPDATE]"];
    if ([v12 hasSuffix:@" [UPDATE]\n\n\n[UPDATE]"])
    {
      uint64_t v14 = [v12 substringToIndex:v13];
    }
    else
    {
      if ([v12 hasSuffix:@" [UPDATE]"]) {
        v15 = @" [UPDATE]\n\n\n[UPDATE]";
      }
      else {
        v15 = @" [UPDATE]";
      }
      uint64_t v14 = [v12 stringByAppendingString:v15];
    }
    unint64_t v16 = (void *)v14;

    [v10 setBody:v16];
    uint64_t v17 = [(UNSExampleUserNotificationCenter *)self _userNotificationCenter];
    [v17 replaceContentForRequestWithIdentifier:v18 replacementContent:v10 completionHandler:0];
  }
  else
  {
    id v8 = [(UNSExampleUserNotificationCenter *)self _newNotificationRequest:v18 threadIdentifier:v6];
    unint64_t v9 = [(UNSExampleUserNotificationCenter *)self _userNotificationCenter];
    [v9 addNotificationRequest:v8 withCompletionHandler:0];
  }
}

- (id)_existingNotificationRequestForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  userNotificationCenter = self->_userNotificationCenter;
  if (userNotificationCenter)
  {
    id v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    objc_super v7 = self->_userNotificationCenter;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __78__UNSExampleUserNotificationCenter__existingNotificationRequestForIdentifier___block_invoke;
    v11[3] = &unk_26462F8B8;
    id v12 = v4;
    uint64_t v14 = &v15;
    id v8 = v6;
    uint64_t v13 = v8;
    [(UNUserNotificationCenter *)v7 getDeliveredNotificationsWithCompletionHandler:v11];
    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

    userNotificationCenter = (UNUserNotificationCenter *)v16[5];
  }
  unint64_t v9 = userNotificationCenter;
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __78__UNSExampleUserNotificationCenter__existingNotificationRequestForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "request", (void)v13);
        unint64_t v9 = [v8 identifier];
        int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

        if (v10)
        {
          uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
          id v12 = *(void **)(v11 + 40);
          *(void *)(v11 + 40) = v8;

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)_userNotificationCenter
{
  userNotificationCenter = self->_userNotificationCenter;
  if (!userNotificationCenter)
  {
    id v4 = objc_alloc(MEMORY[0x263F1DFB0]);
    uint64_t v5 = [(UNSExampleUserNotificationCenter *)self sectionIdentifier];
    uint64_t v6 = (UNUserNotificationCenter *)[v4 initWithBundleIdentifier:v5];
    objc_super v7 = self->_userNotificationCenter;
    self->_userNotificationCenter = v6;

    [(UNUserNotificationCenter *)self->_userNotificationCenter requestAuthorizationWithOptions:7 completionHandler:&__block_literal_global_12];
    userNotificationCenter = self->_userNotificationCenter;
  }
  return userNotificationCenter;
}

- (id)_newNotificationRequest:(id)a3 threadIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  id v8 = [NSString stringWithFormat:@"Notification %@", v5];
  [v7 setTitle:v8];

  [v7 setBody:@"Message"];
  unint64_t v9 = [NSURL URLWithString:@"http://www.apple.com"];
  [v7 setDefaultActionURL:v9];

  [v7 setCategoryIdentifier:@"default"];
  if (v6) {
    [v7 setThreadIdentifier:v6];
  }
  int v10 = [MEMORY[0x263F1DF48] requestWithIdentifier:v5 content:v7 trigger:0];

  return v10;
}

- (id)_basicPostUpdateRecipe
{
  v4[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__UNSExampleUserNotificationCenter__basicPostUpdateRecipe__block_invoke;
  v5[3] = &unk_26462F900;
  v5[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__UNSExampleUserNotificationCenter__basicPostUpdateRecipe__block_invoke_2;
  v4[3] = &unk_26462F900;
  v2 = [MEMORY[0x263F622B0] recipeWithTitle:@"Post [UP] / Update [DN] Notification" increaseAction:v5 decreaseAction:v4];
  return v2;
}

uint64_t __58__UNSExampleUserNotificationCenter__basicPostUpdateRecipe__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

uint64_t __58__UNSExampleUserNotificationCenter__basicPostUpdateRecipe__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) update];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basicTestRecipe, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end