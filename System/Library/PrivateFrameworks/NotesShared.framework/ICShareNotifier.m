@interface ICShareNotifier
+ (BOOL)shareNotifierEnabled;
+ (BOOL)shouldPreventNotificationsForRecordID:(id)a3;
+ (BOOL)shouldShowNotificationForNote:(id)a3;
+ (id)defaultsKeyForPreventingNotificationsForIdentifier:(id)a3;
+ (id)notificationTitleForEditors:(id)a3;
+ (id)participantsWithReplicaIDs:(id)a3 inNote:(id)a4;
+ (id)replicaIDsThatEditedTimestamp:(id)a3 sinceTimestamp:(id)a4;
+ (void)clearNotificationForRecordID:(id)a3;
+ (void)setShareNotifierEnabled:(BOOL)a3;
+ (void)setShouldPreventNotifications:(BOOL)a3 forRecordID:(id)a4;
+ (void)showNotificationForNote:(id)a3 editors:(id)a4;
+ (void)showNotificationIfNecessaryForCloudObject:(id)a3 accountID:(id)a4;
+ (void)showNotificationWithTitle:(id)a3 message:(id)a4 userInfo:(id)a5;
@end

@implementation ICShareNotifier

+ (BOOL)shareNotifierEnabled
{
  return sShareNotifierEnabled;
}

+ (void)setShareNotifierEnabled:(BOOL)a3
{
  sShareNotifierEnabled = a3;
}

+ (void)clearNotificationForRecordID:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = [a3 recordName];
    v4 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[ICShareNotifier clearNotificationForRecordID:]();
    }

    v5 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    v7[0] = v3;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v5 removeDeliveredNotificationsWithIdentifiers:v6];
  }
}

+ (void)showNotificationIfNecessaryForCloudObject:(id)a3 accountID:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend(v6, "ic_loggingDescription");
      v37[0] = @"lastNotifiedTimestamp";
      uint64_t v18 = [v6 lastNotifiedTimestamp];
      v36 = (void *)v18;
      if (v18) {
        v19 = (__CFString *)v18;
      }
      else {
        v19 = @"nil";
      }
      v38[0] = v19;
      v37[1] = @"lastNotifiedDate";
      uint64_t v20 = [v6 lastNotifiedDate];
      if (v20) {
        v21 = (__CFString *)v20;
      }
      else {
        v21 = @"nil";
      }
      v38[1] = v21;
      v37[2] = @"lastViewedTimestamp";
      uint64_t v22 = objc_msgSend(v6, "lastViewedTimestamp", v20);
      v23 = (void *)v22;
      if (v22) {
        v24 = (__CFString *)v22;
      }
      else {
        v24 = @"nil";
      }
      v38[2] = v24;
      v37[3] = @"lastViewedModificationDate";
      uint64_t v25 = [v6 lastViewedModificationDate];
      v26 = (void *)v25;
      if (v25) {
        v27 = (__CFString *)v25;
      }
      else {
        v27 = @"nil";
      }
      v38[3] = v27;
      v37[4] = @"modificationDate";
      uint64_t v28 = [v6 modificationDate];
      v29 = (void *)v28;
      if (v28) {
        v30 = (__CFString *)v28;
      }
      else {
        v30 = @"nil";
      }
      v38[4] = v30;
      v37[5] = @"timestamp";
      uint64_t v31 = [v6 timestamp];
      v32 = (void *)v31;
      if (v31) {
        v33 = (__CFString *)v31;
      }
      else {
        v33 = @"nil";
      }
      v38[5] = v33;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:6];
      *(_DWORD *)buf = 138412546;
      v40 = v17;
      __int16 v41 = 2112;
      v42 = v34;
      _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "Showing notification if necesary for (%@): %@", buf, 0x16u);
    }
    if ([a1 shouldShowNotificationForNote:v6])
    {
      v8 = [v6 timestamp];
      v9 = [v6 lastNotifiedTimestamp];
      v10 = [a1 replicaIDsThatEditedTimestamp:v8 sinceTimestamp:v9];

      v11 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        +[ICShareNotifier showNotificationIfNecessaryForCloudObject:accountID:](v10);
      }

      os_log_t v12 = [a1 participantsWithReplicaIDs:v10 inNote:v6];
      v13 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        +[ICShareNotifier showNotificationIfNecessaryForCloudObject:accountID:](v12);
      }

      [a1 showNotificationForNote:v6 editors:v12];
      v14 = [v6 timestamp];
      [v6 setLastNotifiedTimestamp:v14];

      v15 = [MEMORY[0x1E4F1C9C8] date];
      [v6 setLastNotifiedDate:v15];

      v16 = [v6 managedObjectContext];
      objc_msgSend(v16, "ic_saveWithLogDescription:", @"setting notification metadata");
    }
    else
    {
      os_log_t v12 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        +[ICShareNotifier showNotificationIfNecessaryForCloudObject:accountID:](v6);
      }
      v10 = v12;
    }
  }
}

+ (BOOL)shouldShowNotificationForNote:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (shouldShowNotificationForNote__onceToken[0] != -1) {
    dispatch_once(shouldShowNotificationForNote__onceToken, &__block_literal_global_14);
  }
  if (([a1 shareNotifierEnabled] & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[ICShareNotifier shouldShowNotificationForNote:]2(v4);
    }
    goto LABEL_12;
  }
  if (([v4 isSharedViaICloud] & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[ICShareNotifier shouldShowNotificationForNote:]1(v4);
    }
    goto LABEL_12;
  }
  id v5 = [v4 recordID];
  int v6 = [a1 shouldPreventNotificationsForRecordID:v5];

  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[ICShareNotifier shouldShowNotificationForNote:](v4);
    }
LABEL_12:
    char v8 = 0;
    v9 = v7;
    goto LABEL_13;
  }
  v11 = [v4 lastNotifiedTimestamp];
  if (v11)
  {
  }
  else
  {
    os_log_t v12 = [v4 lastViewedTimestamp];

    if (!v12)
    {
      v7 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        +[ICShareNotifier shouldShowNotificationForNote:](v4);
      }
      goto LABEL_12;
    }
  }
  v13 = [v4 modificationDate];
  v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-259200.0];
  uint64_t v15 = [v13 compare:v14];

  if (v15 == -1)
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[ICShareNotifier shouldShowNotificationForNote:](v4);
    }
    goto LABEL_12;
  }
  uint64_t v16 = [v4 lastNotifiedDate];
  if (v16)
  {
    v17 = (void *)v16;
    uint64_t v18 = [v4 lastNotifiedDate];
    [v18 timeIntervalSinceNow];
    double v20 = v19;

    double v21 = v20 >= 0.0 ? v20 : -v20;
    uint64_t v22 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v22 doubleForKey:@"MinSecondsBetweenSharedNoteNotifications"];
    double v24 = v23;

    if (v21 < v24)
    {
      v7 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        +[ICShareNotifier shouldShowNotificationForNote:]0(v4);
      }
      goto LABEL_12;
    }
  }
  uint64_t v25 = [v4 lastNotifiedTimestamp];
  if (v25)
  {
    v26 = [v4 lastNotifiedTimestamp];
    v27 = [v4 timestamp];
    int v28 = [v26 compareTo:v27] & 1;
  }
  else
  {
    int v28 = 1;
  }

  v29 = [v4 lastViewedTimestamp];
  if (v29)
  {
    v30 = [v4 lastViewedTimestamp];
    uint64_t v31 = [v4 timestamp];
    int v32 = [v30 compareTo:v31] & 1;
  }
  else
  {
    int v32 = 1;
  }

  v33 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v48 = [v4 shortLoggingDescription];
    v49 = (void *)v48;
    v50 = @"N";
    if (v28) {
      v51 = @"Y";
    }
    else {
      v51 = @"N";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v56 = v48;
    v58 = v51;
    __int16 v57 = 2112;
    if (v32) {
      v50 = @"Y";
    }
    __int16 v59 = 2112;
    v60 = v50;
    _os_log_debug_impl(&dword_1C3A61000, v33, OS_LOG_TYPE_DEBUG, "%@ - hasEditsSinceLastNotification:%@, hasEditsSinceLastView:%@", buf, 0x20u);
  }
  if ((v32 & v28) != 1)
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[ICShareNotifier shouldShowNotificationForNote:].cold.9(v4);
    }
    goto LABEL_12;
  }
  v34 = [v4 account];
  v9 = [v34 userRecordName];

  v35 = os_log_create("com.apple.notes", "Notifications");
  v36 = v35;
  if (v9)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      +[ICShareNotifier shouldShowNotificationForNote:].cold.8();
    }

    v37 = [v4 timestamp];
    v38 = [v4 lastNotifiedTimestamp];
    v7 = [a1 replicaIDsThatEditedTimestamp:v37 sinceTimestamp:v38];

    v39 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      +[ICShareNotifier shouldShowNotificationForNote:].cold.7(v7);
    }

    v40 = [v4 timestamp];
    __int16 v41 = [v4 lastViewedTimestamp];
    v42 = [a1 replicaIDsThatEditedTimestamp:v40 sinceTimestamp:v41];

    uint64_t v43 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      +[ICShareNotifier shouldShowNotificationForNote:].cold.6(v42);
    }

    v44 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    v45 = [v44 setByAddingObjectsFromArray:v42];

    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __49__ICShareNotifier_shouldShowNotificationForNote___block_invoke_46;
    v52[3] = &unk_1E64A5728;
    id v46 = v4;
    id v53 = v46;
    id v54 = v9;
    char v8 = objc_msgSend(v45, "ic_containsObjectPassingTest:", v52);
    if ((v8 & 1) == 0)
    {
      v47 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        +[ICShareNotifier shouldShowNotificationForNote:].cold.5(v46);
      }
    }
  }
  else
  {
    v42 = v35;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      +[ICShareNotifier shouldShowNotificationForNote:].cold.4(v4);
    }
    char v8 = 0;
    v7 = v42;
  }

LABEL_13:
  return v8;
}

void __49__ICShareNotifier_shouldShowNotificationForNote___block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v2 = @"MinSecondsBetweenSharedNoteNotifications";
  v3[0] = &unk_1F1F62DA8;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  [v0 registerDefaults:v1];
}

uint64_t __49__ICShareNotifier_shouldShowNotificationForNote___block_invoke_46(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) userIDForReplicaID:a2];
  uint64_t v4 = [*(id *)(a1 + 40) isEqualToString:v3] ^ 1;

  return v4;
}

+ (id)replicaIDsThatEditedTimestamp:(id)a3 sinceTimestamp:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA80] set];
  char v8 = [v5 timestamps];
  unint64_t v9 = [v8 count];

  v10 = [v6 timestamps];
  unint64_t v11 = [v10 count];

  if (v9 >= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v9;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v5 sortedUUIDs];
  uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        if (v12)
        {
          uint64_t v17 = 0;
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          do
          {
            unint64_t v19 = [v5 clockForUUID:v18 atIndex:v17];
            if (v19 > [v6 clockForUUID:v18 atIndex:v17]) {
              [v7 addObject:v18];
            }
            ++v17;
          }
          while (v12 != v17);
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  double v20 = [v7 allObjects];

  return v20;
}

+ (id)participantsWithReplicaIDs:(id)a3 inNote:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[ICShareNotifier participantsWithReplicaIDs:inNote:](v5, v6);
  }
  id obj = v5;

  v33 = [MEMORY[0x1E4F1CA80] set];
  char v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  unint64_t v9 = [v6 serverShare];
  v10 = [v9 participants];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v16 = [v15 userIdentity];
        uint64_t v17 = [v16 userRecordID];
        uint64_t v18 = [v17 recordName];

        if (v18) {
          [v8 setObject:v15 forKeyedSubscript:v18];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v12);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obja = obj;
  uint64_t v19 = [obja countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v37;
    *(void *)&long long v20 = 138412546;
    long long v32 = v20;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(obja);
        }
        long long v24 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        long long v25 = objc_msgSend(v6, "userIDForReplicaID:", v24, v32);
        long long v26 = os_log_create("com.apple.notes", "Notifications");
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
        if (v25)
        {
          if (v27)
          {
            *(_DWORD *)buf = v32;
            v45 = v25;
            __int16 v46 = 2112;
            v47 = v24;
            _os_log_debug_impl(&dword_1C3A61000, v26, OS_LOG_TYPE_DEBUG, "Found user ID %@ for replica ID %@", buf, 0x16u);
          }

          long long v26 = [v8 objectForKeyedSubscript:v25];
          uint64_t v28 = os_log_create("com.apple.notes", "Notifications");
          BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
          if (v26)
          {
            if (v29)
            {
              *(_DWORD *)buf = 138412290;
              v45 = v25;
              _os_log_debug_impl(&dword_1C3A61000, v28, OS_LOG_TYPE_DEBUG, "Found participant for user ID %@", buf, 0xCu);
            }

            [v33 addObject:v26];
          }
          else
          {
            if (v29)
            {
              *(_DWORD *)buf = 138412290;
              v45 = v25;
              _os_log_debug_impl(&dword_1C3A61000, v28, OS_LOG_TYPE_DEBUG, "No participant for user ID %@", buf, 0xCu);
            }
          }
        }
        else if (v27)
        {
          *(_DWORD *)buf = 138412290;
          v45 = v24;
          _os_log_debug_impl(&dword_1C3A61000, v26, OS_LOG_TYPE_DEBUG, "No user ID for replica ID %@", buf, 0xCu);
        }
      }
      uint64_t v21 = [obja countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v21);
  }

  v30 = [v33 allObjects];

  return v30;
}

+ (void)showNotificationForNote:(id)a3 editors:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[ICShareNotifier showNotificationForNote:editors:](v7, v6, v8);
  }

  unint64_t v9 = [a1 notificationTitleForEditors:v7];
  uint64_t v10 = [v6 title];
  uint64_t v11 = (void *)v10;
  if (v9 && v10)
  {
    uint64_t v12 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[ICShareNotifier showNotificationForNote:editors:](v6);
    }

    uint64_t v15 = @"Note";
    uint64_t v13 = [v6 identifier];
    v16[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

    [a1 showNotificationWithTitle:v9 message:v11 userInfo:v14];
  }
}

+ (void)showNotificationWithTitle:(id)a3 message:(id)a4 userInfo:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 objectForKeyedSubscript:@"Note"];
  uint64_t v11 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[ICShareNotifier showNotificationWithTitle:message:userInfo:]();
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  [v12 setTitle:v9];

  [v12 setBody:v8];
  [v12 setUserInfo:v7];

  uint64_t v13 = [MEMORY[0x1E4F44640] defaultSound];
  [v12 setSound:v13];

  uint64_t v14 = [MEMORY[0x1E4F44628] requestWithIdentifier:v10 content:v12 trigger:0];
  uint64_t v15 = [MEMORY[0x1E4F44680] currentNotificationCenter];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke;
  v17[3] = &unk_1E64A5750;
  id v18 = v10;
  id v16 = v10;
  [v15 addNotificationRequest:v14 withCompletionHandler:v17];
}

void __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.notes", "Notifications");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke_cold_2(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke_cold_1(a1, v5, v6);
  }
}

+ (id)notificationTitleForEditors:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1A3B0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "ic_displayableNames:maximumNamesCount:", v4, 2);
  uint64_t v6 = [v5 count];
  unint64_t v7 = [v4 count];

  if (v7 == 1 && v6 == 1)
  {
    id v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%@ Edited" value:@"%@ Edited" table:0 allowSiri:1];
    id v9 = [v5 firstObject];
    objc_msgSend(NSString, "localizedStringWithFormat:", v8, v9, v13);
    uint64_t v11 = LABEL_10:;
    goto LABEL_11;
  }
  if (v7 == 2 && v6 == 2)
  {
    id v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%@ & %@ Edited" value:@"%@ & %@ Edited" table:0 allowSiri:1];
    id v9 = [v5 objectAtIndexedSubscript:0];
    uint64_t v10 = [v5 objectAtIndexedSubscript:1];
    uint64_t v11 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, v9, v10);

LABEL_11:
    goto LABEL_12;
  }
  if (v7 >= 2 && v6)
  {
    id v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%2$@ & %1$d More Edited" value:@"%2$@ & %1$d More Edited" table:0 allowSiri:1];
    id v9 = [v5 objectAtIndexedSubscript:0];
    objc_msgSend(NSString, "localizedStringWithFormat:", v8, (v7 - 1), v9);
    goto LABEL_10;
  }
  uint64_t v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"New Edits" value:@"New Edits" table:0 allowSiri:1];
LABEL_12:

  return v11;
}

+ (id)defaultsKeyForPreventingNotificationsForIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"PreventNotifications-%@", a3];
}

+ (BOOL)shouldPreventNotificationsForRecordID:(id)a3
{
  id v4 = [a3 recordName];
  id v5 = [a1 defaultsKeyForPreventingNotificationsForIdentifier:v4];

  uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v7 = [v6 BOOLForKey:v5];

  return v7;
}

+ (void)setShouldPreventNotifications:(BOOL)a3 forRecordID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = [a4 recordName];
  id v9 = [a1 defaultsKeyForPreventingNotificationsForIdentifier:v6];

  char v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v8 = v7;
  if (v4) {
    [v7 setBool:1 forKey:v9];
  }
  else {
    [v7 removeObjectForKey:v9];
  }
}

+ (void)clearNotificationForRecordID:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Attempting to clear notification for %@", v2);
}

+ (void)showNotificationIfNecessaryForCloudObject:(void *)a1 accountID:.cold.1(void *a1)
{
  [a1 count];
  v2 = [a1 componentsJoinedByString:@","];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "%lu editors: %@", v5, v6, v7, v8, v9);
}

+ (void)showNotificationIfNecessaryForCloudObject:(void *)a1 accountID:.cold.2(void *a1)
{
  uint64_t v1 = [a1 componentsJoinedByString:@","];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "replicaIDsWithEdits: %@", v4, v5, v6, v7, v8);
}

+ (void)showNotificationIfNecessaryForCloudObject:(void *)a1 accountID:.cold.3(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not showing notification for %@", v4, v5, v6, v7, v8);
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not showing notification for %@: do not disturb is on", v4, v5, v6, v7, v8);
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not showing notification for %@: never notified and never viewed", v4, v5, v6, v7, v8);
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not showing notification for %@: last modification date was too long ago", v4, v5, v6, v7, v8);
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "No user record name when checking if we should send a notification about %@", v4, v5, v6, v7, v8);
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not showing notification for %@: no non-current-user editors", v4, v5, v6, v7, v8);
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.6(void *a1)
{
  uint64_t v1 = [a1 componentsJoinedByString:@","];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Editors since last view: %@", v4, v5, v6, v7, v8);
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.7(void *a1)
{
  uint64_t v1 = [a1 componentsJoinedByString:@","];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Editors since last notification: %@", v4, v5, v6, v7, v8);
}

+ (void)shouldShowNotificationForNote:.cold.8()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Found current user record name (%@)", v2);
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.9(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not showing notification for %@: no new edits since last view or notification", v4, v5, v6, v7, v8);
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.10(void *a1)
{
  uint64_t v2 = [a1 shortLoggingDescription];
  uint64_t v3 = [a1 lastNotifiedDate];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v4, v5, "Not showing notification for %@: notified at %@", v6, v7, v8, v9, v10);
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.11(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not showing notification for %@: not shared", v4, v5, v6, v7, v8);
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.12(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not showing notifications for %@: app is active", v4, v5, v6, v7, v8);
}

+ (void)participantsWithReplicaIDs:(void *)a1 inNote:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 componentsJoinedByString:@","];
  uint64_t v4 = [a2 shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v5, v6, "Matching participants to replica IDs [%@] in %@", v7, v8, v9, v10, v11);
}

+ (void)showNotificationForNote:(void *)a1 editors:.cold.1(void *a1)
{
  uint64_t v2 = [a1 identifier];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [a1 modificationDate];
  [v3 timeIntervalSinceDate:v4];
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v5, v6, "Requesting notification for %@ %f seconds after it was last modified.", v7, v8, v9, v10, 2u);
}

+ (void)showNotificationForNote:(NSObject *)a3 editors:.cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 count];
  uint64_t v6 = [a2 shortLoggingDescription];
  v7[0] = 67109378;
  v7[1] = v5;
  __int16 v8 = 2112;
  uint64_t v9 = v6;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Showing notification for %d editors for %@", (uint8_t *)v7, 0x12u);
}

+ (void)showNotificationWithTitle:message:userInfo:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Delivering user notification for %@", v2);
}

void __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, a2, a3, "Added notification request for %@", (uint8_t *)&v4);
}

void __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Error adding notification request for %@: %@", (uint8_t *)&v4, 0x16u);
}

@end