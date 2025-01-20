@interface WFUserNotificationManager
- (NSMutableDictionary)observers;
- (NSMutableSet)categories;
- (UNUserNotificationCenter)notificationCenter;
- (WFUserNotificationManager)init;
- (id)categoryIdentifiers;
- (void)addObserver:(id)a3 forCategory:(id)a4;
- (void)registerCategoriesIfNecessary:(id)a3;
- (void)removeNotificationsWithIdentifiers:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeStaleNotificationsWithCompletion:(id)a3;
- (void)setCategories:(id)a3;
- (void)setObservers:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation WFUserNotificationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

- (void)setObservers:(id)a3
{
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setCategories:(id)a3
{
}

- (NSMutableSet)categories
{
  return self->_categories;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)removeNotificationsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(WFUserNotificationManager *)self notificationCenter];
  [v5 removeDeliveredNotificationsWithIdentifiers:v4];
}

- (void)removeStaleNotificationsWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFUserNotificationManagerLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(WFUserNotificationManager *)self categories];
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFUserNotificationManager removeStaleNotificationsWithCompletion:]";
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Attempting to remove stale notifications for categories: %{public}@", buf, 0x16u);
  }
  v7 = [(WFUserNotificationManager *)self notificationCenter];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__WFUserNotificationManager_removeStaleNotificationsWithCompletion___block_invoke;
  v9[3] = &unk_1E65401F8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 getDeliveredNotificationsWithCompletionHandler:v9];
}

void __68__WFUserNotificationManager_removeStaleNotificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    v44 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v43 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v39 = a1;
    id v5 = [*(id *)(a1 + 32) categoryIdentifiers];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v40 = v3;
    id v6 = v3;
    v7 = v4;
    id obj = v6;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v47;
      id v41 = v4;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v47 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          __int16 v13 = [v12 request];
          v14 = [v13 content];
          uint64_t v15 = [v14 categoryIdentifier];
          int v16 = [v5 containsObject:v15];

          if (v16)
          {
            v17 = [v12 date];
            v18 = [v44 components:16 fromDate:v17 toDate:v43 options:0];

            uint64_t v19 = [v18 day];
            v20 = getWFUserNotificationManagerLogObject();
            BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
            if (v19 < 7)
            {
              v22 = v42;
              if (v21)
              {
                v26 = [v12 request];
                v27 = [v26 identifier];
                v28 = [v12 date];
                *(_DWORD *)buf = 136315650;
                v51 = "-[WFUserNotificationManager removeStaleNotificationsWithCompletion:]_block_invoke";
                __int16 v52 = 2112;
                v53 = v27;
                __int16 v54 = 2112;
                v55 = v28;
                _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_DEFAULT, "%s Keeping notification (%@) (posted on %@)", buf, 0x20u);

                v7 = v41;
                v22 = v42;
              }
            }
            else
            {
              v22 = v7;
              if (v21)
              {
                v23 = [v12 request];
                v24 = [v23 identifier];
                v25 = [v12 date];
                *(_DWORD *)buf = 136315650;
                v51 = "-[WFUserNotificationManager removeStaleNotificationsWithCompletion:]_block_invoke";
                __int16 v52 = 2112;
                v53 = v24;
                __int16 v54 = 2112;
                v55 = v25;
                _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_DEFAULT, "%s Marking notification (%@) as stale (posted on %@)", buf, 0x20u);

                v7 = v41;
                v22 = v41;
              }
            }

            [v22 addObject:v12];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v9);
    }

    v29 = objc_msgSend(v7, "if_map:", &__block_literal_global_173);
    v30 = [v29 allObjects];

    v31 = v7;
    v32 = [*(id *)(v39 + 32) notificationCenter];
    [v32 removeDeliveredNotificationsWithIdentifiers:v30];

    uint64_t v33 = *(void *)(v39 + 40);
    if (v33)
    {
      v34 = [v7 allObjects];
      v35 = [v42 allObjects];
      (*(void (**)(uint64_t, void *, void *))(v33 + 16))(v33, v34, v35);
    }
    id v3 = v40;
  }
  else
  {
    v36 = getWFUserNotificationManagerLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = [*(id *)(a1 + 32) categories];
      *(_DWORD *)buf = 136315394;
      v51 = "-[WFUserNotificationManager removeStaleNotificationsWithCompletion:]_block_invoke";
      __int16 v52 = 2114;
      v53 = v37;
      _os_log_impl(&dword_1C7D7E000, v36, OS_LOG_TYPE_DEFAULT, "%s Not removing any notifications because no delivered notifications were found for categories: %{public}@", buf, 0x16u);
    }
    uint64_t v38 = *(void *)(a1 + 40);
    if (v38) {
      (*(void (**)(uint64_t, void, void))(v38 + 16))(v38, 0, 0);
    }
  }
}

id __68__WFUserNotificationManager_removeStaleNotificationsWithCompletion___block_invoke_170(uint64_t a1, void *a2)
{
  v2 = [a2 request];
  id v3 = [v2 identifier];

  return v3;
}

- (id)categoryIdentifiers
{
  v2 = [(WFUserNotificationManager *)self categories];
  id v3 = (void *)[v2 copy];

  id v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_167);

  return v4;
}

uint64_t __48__WFUserNotificationManager_categoryIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = getWFUserNotificationManagerLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v9 notification];
    __int16 v13 = [v12 request];
    v14 = [v13 content];
    uint64_t v15 = [v14 categoryIdentifier];
    int v16 = [(WFUserNotificationManager *)self observers];
    *(_DWORD *)buf = 136315906;
    v34 = "-[WFUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    __int16 v35 = 2112;
    id v36 = v9;
    __int16 v37 = 2112;
    uint64_t v38 = v15;
    __int16 v39 = 2112;
    id v40 = v16;
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Notification Manager received a notification response (%@) for category: %@, distributing to observers: %@", buf, 0x2Au);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v17 = [(WFUserNotificationManager *)self observers];
  v18 = [v9 notification];
  uint64_t v19 = [v18 request];
  v20 = [v19 content];
  BOOL v21 = [v20 categoryIdentifier];
  v22 = [v17 objectForKey:v21];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v29;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v28 + 1) + 8 * v26);
        if (objc_opt_respondsToSelector()) {
          [v27 userNotificationCenter:v8 didReceiveNotificationResponse:v9 withCompletionHandler:v10];
        }
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v24);
  }
}

- (void)removeObserver:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(WFUserNotificationManager *)self categories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        v11 = [(WFUserNotificationManager *)self observers];
        v12 = [v10 identifier];
        __int16 v13 = [v11 objectForKey:v12];

        [v13 removeObject:v4];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)addObserver:(id)a3 forCategory:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v7 = [(WFUserNotificationManager *)self categories];
  char v8 = [v7 containsObject:v6];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [(WFUserNotificationManager *)self categories];
    [v9 addObject:v6];
  }
  id v10 = [(WFUserNotificationManager *)self observers];
  v11 = [v6 identifier];
  v12 = [v10 objectForKey:v11];

  if (!v12)
  {
    v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    __int16 v13 = [(WFUserNotificationManager *)self observers];
    long long v14 = [v6 identifier];
    [v13 setObject:v12 forKey:v14];
  }
  [v12 addObject:v15];
}

- (void)registerCategoriesIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(WFUserNotificationManager *)self notificationCenter];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__WFUserNotificationManager_registerCategoriesIfNecessary___block_invoke;
  v7[3] = &unk_1E6540190;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 getNotificationCategoriesWithCompletionHandler:v7];
}

void __59__WFUserNotificationManager_registerCategoriesIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v3, "containsObject:", v10, (void)v13) & 1) == 0)
        {
          if (!v7) {
            id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          [v7 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  if ([v7 count])
  {
    uint64_t v11 = [v7 setByAddingObjectsFromSet:v3];

    v12 = [*(id *)(a1 + 40) notificationCenter];
    [v12 setNotificationCategories:v11];

    id v3 = (id)v11;
  }
}

- (WFUserNotificationManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)WFUserNotificationManager;
  v2 = [(WFUserNotificationManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    categories = v2->_categories;
    v2->_categories = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F44680]);
    uint64_t v8 = [v7 initWithBundleIdentifier:*MEMORY[0x1E4FB4BE8]];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v8;

    [(UNUserNotificationCenter *)v2->_notificationCenter setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_notificationCenter setWantsNotificationResponsesDelivered];
    uint64_t v10 = v2;
  }

  return v2;
}

@end