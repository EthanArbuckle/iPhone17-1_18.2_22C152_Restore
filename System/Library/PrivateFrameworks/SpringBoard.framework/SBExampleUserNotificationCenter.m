@interface SBExampleUserNotificationCenter
+ (id)sharedInstance;
- (NSString)latestNotificationRequestIdentifier;
- (NSString)sectionIdentifier;
- (id)_existingNotificationRequestForIdentifier:(id)a3;
- (id)_newNotificationRequest:(id)a3 threadIdentifier:(id)a4;
- (id)_userNotificationCenter;
- (void)_postNotificationWithID:(id)a3 threadIdentifier:(id)a4;
- (void)publish;
- (void)publish:(unint64_t)a3 completion:(id)a4;
- (void)publish:(unint64_t)a3 numberOfUniqueThreads:(unint64_t)a4 completion:(id)a5;
- (void)publishWithNumberOfUniqueThreads:(unint64_t)a3;
- (void)removeAllNotifications;
- (void)update;
@end

@implementation SBExampleUserNotificationCenter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_52);
  }
  v2 = (void *)sharedInstance___sharedInstance_1;
  return v2;
}

void __49__SBExampleUserNotificationCenter_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBExampleUserNotificationCenter);
  v1 = (void *)sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;
}

- (NSString)latestNotificationRequestIdentifier
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%ld", __notificationRequestCount);
}

- (NSString)sectionIdentifier
{
  return (NSString *)@"com.apple.usernotifications.example";
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
  [(SBExampleUserNotificationCenter *)self _postNotificationWithID:v5 threadIdentifier:v6];
}

- (void)publish:(unint64_t)a3 completion:(id)a4
{
}

- (void)publish:(unint64_t)a3 numberOfUniqueThreads:(unint64_t)a4 completion:(id)a5
{
  v8 = (void (**)(void))a5;
  if (a3)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    v9 = [(SBExampleUserNotificationCenter *)self _userNotificationCenter];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76__SBExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke;
    v23[3] = &unk_1E6AFAD20;
    v23[4] = v24;
    [v9 getDeliveredNotificationsWithCompletionHandler:v23];

    unint64_t v10 = a3;
    do
    {
      [(SBExampleUserNotificationCenter *)self publishWithNumberOfUniqueThreads:a4];
      --v10;
    }
    while (v10);
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    do
    {
      v11 = dispatch_group_create();
      dispatch_group_enter(v11);
      v12 = [(SBExampleUserNotificationCenter *)self _userNotificationCenter];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __76__SBExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke_2;
      v14[3] = &unk_1E6AFAD48;
      v17 = v24;
      unint64_t v18 = a3;
      v16 = &v19;
      v13 = v11;
      v15 = v13;
      [v12 getDeliveredNotificationsWithCompletionHandler:v14];

      dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    }
    while (!*((unsigned char *)v20 + 24));
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(v24, 8);
  }
  if (v8) {
    v8[2](v8);
  }
}

uint64_t __76__SBExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __76__SBExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke_2(void *a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [a2 count] == *(void *)(*(void *)(a1[6] + 8) + 24)
                                                                           + a1[7];
  v3 = a1[4];
  dispatch_group_leave(v3);
}

- (void)update
{
  objc_msgSend(NSString, "stringWithFormat:", @"%ld", __notificationRequestCount);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(SBExampleUserNotificationCenter *)self _postNotificationWithID:v3 threadIdentifier:0];
}

- (void)removeAllNotifications
{
  id v3 = [(SBExampleUserNotificationCenter *)self _userNotificationCenter];
  [v3 removeAllPendingNotificationRequests];

  id v4 = [(SBExampleUserNotificationCenter *)self _userNotificationCenter];
  [v4 removeAllDeliveredNotifications];
}

- (void)_postNotificationWithID:(id)a3 threadIdentifier:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  v7 = [(SBExampleUserNotificationCenter *)self _existingNotificationRequestForIdentifier:v18];
  v8 = v7;
  if (v7)
  {
    id v9 = [v7 content];
    unint64_t v10 = (void *)[v9 mutableCopy];
    v11 = [MEMORY[0x1E4F1C9C8] date];
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
    v16 = (void *)v14;

    [v10 setBody:v16];
    v17 = [(SBExampleUserNotificationCenter *)self _userNotificationCenter];
    [v17 replaceContentForRequestWithIdentifier:v18 replacementContent:v10 completionHandler:0];
  }
  else
  {
    id v9 = [(SBExampleUserNotificationCenter *)self _newNotificationRequest:v18 threadIdentifier:v6];
    unint64_t v10 = [(SBExampleUserNotificationCenter *)self _userNotificationCenter];
    [v10 addNotificationRequest:v9 withCompletionHandler:0];
  }
}

- (id)_existingNotificationRequestForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__18;
  uint64_t v19 = __Block_byref_object_dispose__18;
  id v20 = 0;
  userNotificationCenter = self->_userNotificationCenter;
  if (userNotificationCenter)
  {
    id v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v7 = self->_userNotificationCenter;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__SBExampleUserNotificationCenter__existingNotificationRequestForIdentifier___block_invoke;
    v11[3] = &unk_1E6AFAD70;
    id v12 = v4;
    uint64_t v14 = &v15;
    v8 = v6;
    uint64_t v13 = v8;
    [(UNUserNotificationCenter *)v7 getDeliveredNotificationsWithCompletionHandler:v11];
    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

    userNotificationCenter = (UNUserNotificationCenter *)v16[5];
  }
  id v9 = userNotificationCenter;
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __77__SBExampleUserNotificationCenter__existingNotificationRequestForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
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
        v8 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "request", (void)v13);
        id v9 = [v8 identifier];
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
    id v4 = objc_alloc(MEMORY[0x1E4F44680]);
    uint64_t v5 = [(SBExampleUserNotificationCenter *)self sectionIdentifier];
    uint64_t v6 = (UNUserNotificationCenter *)[v4 initWithBundleIdentifier:v5];
    v7 = self->_userNotificationCenter;
    self->_userNotificationCenter = v6;

    [(UNUserNotificationCenter *)self->_userNotificationCenter requestAuthorizationWithOptions:7 completionHandler:&__block_literal_global_11];
    userNotificationCenter = self->_userNotificationCenter;
  }
  return userNotificationCenter;
}

- (id)_newNotificationRequest:(id)a3 threadIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  v8 = [NSString stringWithFormat:@"Notification %@", v5];
  [v7 setTitle:v8];

  [v7 setBody:@"Message"];
  id v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://www.apple.com"];
  [v7 setDefaultActionURL:v9];

  if (v6) {
    [v7 setThreadIdentifier:v6];
  }
  int v10 = [MEMORY[0x1E4F44628] requestWithIdentifier:v5 content:v7 trigger:0];

  return v10;
}

- (void).cxx_destruct
{
}

@end