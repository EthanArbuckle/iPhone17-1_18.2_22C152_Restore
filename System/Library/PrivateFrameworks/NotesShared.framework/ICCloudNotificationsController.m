@interface ICCloudNotificationsController
+ (id)sharedController;
+ (void)registerForUserNotificationsWithCompletionHandler:(id)a3;
- (BOOL)isSubscribedToMentionNotificationsForAccount:(id)a3;
- (PDSRegistrar)pdsClient;
- (void)batchUpdateTopicSubscriptionsAllAccountsInContext:(id)a3;
- (void)batchUpdateTopicSubscriptionsForDSIDs:(id)a3;
- (void)removeAllPDSRegistrationsForUser:(id)a3;
- (void)removeAllTopicSubscriptionsForAccount:(id)a3;
- (void)sendMentionNotificationToParticipant:(id)a3 inlineAttachmentRecordName:(id)a4 shareRecordName:(id)a5 shareOwnerUserId:(id)a6 accountId:(id)a7 noteRecordName:(id)a8 senderName:(id)a9 noteTitle:(id)a10 mentionSnippet:(id)a11 callback:(id)a12;
- (void)updateSubscriptionPreferenceForMentionNotifications:(BOOL)a3 forAccount:(id)a4;
@end

@implementation ICCloudNotificationsController

+ (id)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ICCloudNotificationsController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v2 = (void *)sharedController_controller;
  return v2;
}

void __50__ICCloudNotificationsController_sharedController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v1;
}

+ (void)registerForUserNotificationsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[ICCloudNotificationsController registerForUserNotificationsWithCompletionHandler:](v4);
  }

  v5 = [MEMORY[0x1E4F44680] currentNotificationCenter];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E64A54D0;
  id v13 = v3;
  id v6 = v3;
  [v5 requestAuthorizationWithOptions:7 completionHandler:v12];

  v7 = +[ICNoteContext sharedContext];
  v8 = [v7 workerManagedObjectContext];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_34;
  v10[3] = &unk_1E64A4240;
  id v11 = v8;
  id v9 = v8;
  [v9 performBlock:v10];
}

void __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = os_log_create("com.apple.notes", "Notifications");
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_cold_2();
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_cold_1(v7);
    }
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, "User did not grant authorization for user notifications", v10, 2u);
    }
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"ICUserNotificationRegistrationCompleted" object:0];
}

void __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_34(uint64_t a1)
{
  id v2 = +[ICCloudNotificationsController sharedController];
  [v2 batchUpdateTopicSubscriptionsAllAccountsInContext:*(void *)(a1 + 32)];
}

- (PDSRegistrar)pdsClient
{
  if (pdsClient_onceToken != -1) {
    dispatch_once(&pdsClient_onceToken, &__block_literal_global_11);
  }
  id v2 = (void *)pdsClient_client;
  return (PDSRegistrar *)v2;
}

void __43__ICCloudNotificationsController_pdsClient__block_invoke()
{
  id v5 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F83B60]) initWithClientID:@"Notes" error:&v5];
  id v1 = v5;
  id v2 = (void *)pdsClient_client;
  pdsClient_client = v0;

  if (pdsClient_client) {
    BOOL v3 = v1 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    v4 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43__ICCloudNotificationsController_pdsClient__block_invoke_cold_1();
    }
  }
}

- (BOOL)isSubscribedToMentionNotificationsForAccount:(id)a3
{
  objc_opt_class();
  BOOL v3 = [MEMORY[0x1E4F837D0] objectForKey:@"ICMentionsShouldNotifyMeDefaultsKey"];
  v4 = ICCheckedDynamicCast();

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)updateSubscriptionPreferenceForMentionNotifications:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void *)MEMORY[0x1E4F837D0];
  v7 = (void *)MEMORY[0x1E4F28ED0];
  id v8 = a4;
  id v9 = [v7 numberWithBool:v4];
  [v6 setObject:v9 forKey:@"ICMentionsShouldNotifyMeDefaultsKey"];

  id v10 = [v8 managedObjectContext];

  [(ICCloudNotificationsController *)self batchUpdateTopicSubscriptionsAllAccountsInContext:v10];
}

- (void)removeAllTopicSubscriptionsForAccount:(id)a3
{
  id v4 = a3;
  char v5 = [v4 dsid];
  if ([v5 length])
  {
    id v6 = [MEMORY[0x1E4F83B70] userWithDSID:v5];
    [(ICCloudNotificationsController *)self removeAllPDSRegistrationsForUser:v6];
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICCloudNotificationsController removeAllTopicSubscriptionsForAccount:](v4, v7);
    }
  }
}

- (void)batchUpdateTopicSubscriptionsAllAccountsInContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = +[ICAccount allCloudKitAccountsInContext:a3];
  char v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (-[ICCloudNotificationsController isSubscribedToMentionNotificationsForAccount:](self, "isSubscribedToMentionNotificationsForAccount:", v11, (void)v13))
        {
          v12 = [v11 dsid];
          objc_msgSend(v5, "ic_addNonNilObject:", v12);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(ICCloudNotificationsController *)self batchUpdateTopicSubscriptionsForDSIDs:v5];
}

- (void)batchUpdateTopicSubscriptionsForDSIDs:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudNotificationsController batchUpdateTopicSubscriptionsForDSIDs:](v3, v4);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v44;
    *(void *)&long long v7 = 138412802;
    long long v35 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = objc_msgSend(MEMORY[0x1E4F83B70], "userWithDSID:", *(void *)(*((void *)&v43 + 1) + 8 * i), v35);
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F83B68]) initWithTopic:@"com.apple.notes.mentions" qualifier:&stru_1F1F2FFF8 pushEnvironment:0];
        long long v13 = [(ICCloudNotificationsController *)self pdsClient];
        long long v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
        id v42 = 0;
        int v15 = [v13 batchUpdateRegistrations:v14 forUser:v11 error:&v42];
        id v16 = v42;

        if (v15) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          v20 = os_log_create("com.apple.notes", "Notifications");
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 138412546;
          v49 = v12;
          __int16 v50 = 2112;
          v51 = v11;
          v21 = v20;
          v22 = "Successfully updated PDS registration (%@) for user (%@)";
          goto LABEL_17;
        }
        uint64_t v18 = [v16 code];
        v19 = os_log_create("com.apple.notes", "Notifications");
        v20 = v19;
        if (v18 == -202)
        {
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 138412546;
          v49 = v12;
          __int16 v50 = 2112;
          v51 = v11;
          v21 = v20;
          v22 = "Successfully updated PDS registration (ignoring PDSRegistrarErrorCodeFailedPersisting -- see rdar://7240"
                "0974) (%@) for user (%@)";
LABEL_17:
          _os_log_debug_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_DEBUG, v22, buf, 0x16u);
          goto LABEL_20;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v35;
          v49 = v12;
          __int16 v50 = 2112;
          v51 = v11;
          __int16 v52 = 2112;
          id v53 = v16;
          _os_log_error_impl(&dword_1C3A61000, v20, OS_LOG_TYPE_ERROR, "Error updating PDS registration (%@) for user (%@): %@", buf, 0x20u);
        }
LABEL_20:
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v8);
  }

  v23 = [(ICCloudNotificationsController *)self pdsClient];
  id v41 = 0;
  v24 = [v23 activeUsersWithError:&v41];
  id v25 = v41;

  if (!v24 || v25)
  {
    v26 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[ICCloudNotificationsController batchUpdateTopicSubscriptionsForDSIDs:]();
    }
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v27 = v24;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        v33 = [v32 userID];
        char v34 = [v5 containsObject:v33];

        if ((v34 & 1) == 0) {
          [(ICCloudNotificationsController *)self removeAllPDSRegistrationsForUser:v32];
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v29);
  }
}

- (void)removeAllPDSRegistrationsForUser:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudNotificationsController removeAllPDSRegistrationsForUser:]();
  }

  uint64_t v6 = [(ICCloudNotificationsController *)self pdsClient];
  id v11 = 0;
  int v7 = [v6 removeAllRegistrationsFromUser:v4 error:&v11];
  id v8 = v11;

  uint64_t v9 = os_log_create("com.apple.notes", "Notifications");
  id v10 = v9;
  if (!v7 || v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICCloudNotificationsController removeAllPDSRegistrationsForUser:]();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    -[ICCloudNotificationsController removeAllPDSRegistrationsForUser:]();
  }
}

- (void)sendMentionNotificationToParticipant:(id)a3 inlineAttachmentRecordName:(id)a4 shareRecordName:(id)a5 shareOwnerUserId:(id)a6 accountId:(id)a7 noteRecordName:(id)a8 senderName:(id)a9 noteTitle:(id)a10 mentionSnippet:(id)a11 callback:(id)a12
{
  id v27 = a12;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = +[ICCloudContext sharedContext];
  id v29 = [v26 invernessClientForAccountID:v21];

  [v29 sendMentionNotificationWithRecipientUserId:v25 senderName:v19 noteTitle:v18 mentionSnippet:v17 shareRecordName:v23 shareOwnerUserId:v22 noteRecordName:v20 inlineAttachmentRecordName:v24 callback:v27];
}

+ (void)registerForUserNotificationsWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Requesting authorization to show notifications", v1, 2u);
}

void __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "User granted authorization for user notifications", v1, 2u);
}

void __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error requesting authorization for user notifications: %@", v2, v3, v4, v5, v6);
}

void __43__ICCloudNotificationsController_pdsClient__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Failed creating PDS registrar: %@", v2, v3, v4, v5, v6);
}

- (void)removeAllTopicSubscriptionsForAccount:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Unable to find DSID for account (%@). Cannot remove PDS registrations.", v4, 0xCu);
}

- (void)batchUpdateTopicSubscriptionsForDSIDs:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error fetching active users from PDS: %@", v2, v3, v4, v5, v6);
}

- (void)batchUpdateTopicSubscriptionsForDSIDs:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 allObjects];
  uint64_t v4 = [v3 componentsJoinedByString:@","];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Batch updating topic subscriptions for DSIDs: %@", v5, 0xCu);
}

- (void)removeAllPDSRegistrationsForUser:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Successfully removed all PDS registrations for user: %@", v1, 0xCu);
}

- (void)removeAllPDSRegistrationsForUser:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1C3A61000, v1, OS_LOG_TYPE_ERROR, "Error removing all PDS registrations for user (%@): %@", v2, 0x16u);
}

- (void)removeAllPDSRegistrationsForUser:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Attempting removal of all PDS regisrations for user: %@", v1, 0xCu);
}

@end