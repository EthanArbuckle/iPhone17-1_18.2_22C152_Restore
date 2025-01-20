@interface MFCategorySubsystem_iOS
- (BOOL)_shouldStartNewTaskCancelingExistingTaskIfNeeded:(id)a3;
- (MFCategorySubsystem_iOS)initWithPersistence:(id)a3 userProfileProvider:(id)a4 vipManager:(id)a5 sourceApplicationBundleIdentifier:(id)a6 categorizationAnalyticsLogger:(id)a7;
- (OS_dispatch_queue)migrationTaskQueue;
- (OS_dispatch_queue)progressReportingQueue;
- (_EDMigrationBackgroundTask)migrationTask;
- (void)_registerAuthStateMigrationTask;
- (void)_setMigrationTaskWithSystemTask:(id)a3 migrator:(id)a4 cancelable:(id)a5;
- (void)_startCategoryMigrationWithBGTask:(id)a3 andReason:(int64_t)a4;
- (void)_startNonInboxMessageAuthenticationnWithBGTask:(id)a3;
- (void)dealloc;
- (void)registerBusinessesGroupingTask;
- (void)registerInboxMigrationTasks;
- (void)setMigrationTask:(id)a3;
- (void)startBusinessConnectGroupingWithBGTask:(id)a3;
@end

@implementation MFCategorySubsystem_iOS

- (MFCategorySubsystem_iOS)initWithPersistence:(id)a3 userProfileProvider:(id)a4 vipManager:(id)a5 sourceApplicationBundleIdentifier:(id)a6 categorizationAnalyticsLogger:(id)a7
{
  v17.receiver = self;
  v17.super_class = (Class)MFCategorySubsystem_iOS;
  v7 = [(EDCategorySubsystem *)&v17 initWithPersistence:a3 userProfileProvider:a4 vipManager:a5 sourceApplicationBundleIdentifier:a6 categorizationAnalyticsLogger:a7];
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.email.EDCategorySubsystem.migrationTaskQueue", v9);
    migrationTaskQueue = v7->_migrationTaskQueue;
    v7->_migrationTaskQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.email.EDCategorySubsystem.progressReportingQueue", v13);
    progressReportingQueue = v7->_progressReportingQueue;
    v7->_progressReportingQueue = (OS_dispatch_queue *)v14;
  }
  return v7;
}

- (void)dealloc
{
  v3 = self->_migrationTask;
  if (v3)
  {
    v4 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];

    if (v4)
    {
      v5 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __34__MFCategorySubsystem_iOS_dealloc__block_invoke;
      block[3] = &unk_1E5D3B5C0;
      v8 = v3;
      dispatch_async(v5, block);
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)MFCategorySubsystem_iOS;
  [(MFCategorySubsystem_iOS *)&v6 dealloc];
}

- (void)setMigrationTask:(id)a3
{
  v7 = (_EDMigrationBackgroundTask *)a3;
  v5 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
  dispatch_assert_queue_V2(v5);

  p_migrationTask = &self->_migrationTask;
  if (*p_migrationTask != v7)
  {
    [(_EDMigrationBackgroundTask *)*p_migrationTask cancel];
    objc_storeStrong((id *)p_migrationTask, a3);
  }
}

- (void)registerInboxMigrationTasks
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x1E4F60AB0] log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Registering Mail Categorization FastPass task.", buf, 2u);
  }

  v4 = [MEMORY[0x1E4F4F440] sharedScheduler];
  v5 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__MFCategorySubsystem_iOS_registerInboxMigrationTasks__block_invoke;
  v11[3] = &unk_1E5D3E130;
  objc_copyWeak(&v12, &location);
  [v4 registerForTaskWithIdentifier:@"com.apple.email.categorization.FastPass" usingQueue:v5 launchHandler:v11];

  objc_super v6 = [MEMORY[0x1E4F60AB0] log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Registering Mail Categorization task.", buf, 2u);
  }

  v7 = [MEMORY[0x1E4F4F440] sharedScheduler];
  v8 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__MFCategorySubsystem_iOS_registerInboxMigrationTasks__block_invoke_26;
  v9[3] = &unk_1E5D3E158;
  objc_copyWeak(&v10, &location);
  [v7 registerForTaskWithIdentifier:@"com.apple.mail.blackpearl.categorizer" usingQueue:v8 launchHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_startCategoryMigrationWithBGTask:(id)a3 andReason:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
  dispatch_assert_queue_V2(v7);

  if (_os_feature_enabled_impl())
  {
    if ([(MFCategorySubsystem_iOS *)self _shouldStartNewTaskCancelingExistingTaskIfNeeded:v6])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F60B18]);
      v9 = [(EDCategorySubsystem *)self categoryPersistence];
      id v10 = [(EDCategorySubsystem *)self messageCategorizer];
      v11 = [(EDCategorySubsystem *)self messageAuthenticator];
      id v12 = [(EDCategorySubsystem *)self messagePersistence];
      v13 = [(EDCategorySubsystem *)self activityPersistence];
      dispatch_queue_t v14 = (void *)[v8 initWithCategoryPersistence:v9 categorizer:v10 authenticator:v11 messagePersistence:v12 activityPersistence:v13 reason:a4];

      *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)location, self);
      id from = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&from, v6);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke;
      v21[3] = &unk_1E5D3E1A8;
      v21[4] = self;
      objc_copyWeak(&v22, (id *)location);
      objc_copyWeak(&v23, &from);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_35;
      v18[3] = &unk_1E5D3E1F8;
      objc_copyWeak(&v19, &from);
      v18[4] = self;
      objc_copyWeak(&v20, (id *)location);
      v15 = [v14 startMigrationWithProgressHandler:v21 completion:v18];
      [(MFCategorySubsystem_iOS *)self _setMigrationTaskWithSystemTask:v6 migrator:v14 cancelable:v15];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      objc_super v17 = [MEMORY[0x1E4F60AB0] log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id location = 138543362;
        *(void *)&location[4] = v6;
        _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_INFO, "Existing task has priority, expiring task: %{public}@", location, 0xCu);
      }

      [v6 setTaskExpiredWithRetryAfter:0 error:300.0];
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F60AB0] log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 138412290;
      *(void *)&location[4] = v6;
      _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "BlackPearl disabled - Mail Categorization Task %@ being marked as complete", location, 0xCu);
    }

    [v6 setTaskCompleted];
  }
}

- (void)_registerAuthStateMigrationTask
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x1E4F60AB0] log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Registering Non-Inbox Message Authentication task.", buf, 2u);
  }

  v4 = [MEMORY[0x1E4F4F440] sharedScheduler];
  v5 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__MFCategorySubsystem_iOS__registerAuthStateMigrationTask__block_invoke;
  v6[3] = &unk_1E5D3E158;
  objc_copyWeak(&v7, &location);
  [v4 registerForTaskWithIdentifier:@"com.apple.mail.messageauthentication" usingQueue:v5 launchHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_startNonInboxMessageAuthenticationnWithBGTask:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
  dispatch_assert_queue_V2(v5);

  if (_os_feature_enabled_impl())
  {
    if ([(MFCategorySubsystem_iOS *)self _shouldStartNewTaskCancelingExistingTaskIfNeeded:v4])
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60D40]) initWithLabel:@"nonInboxMessageAuthenticator"];
      id v7 = objc_alloc(MEMORY[0x1E4F60B20]);
      id v8 = [(EDCategorySubsystem *)self categoryPersistence];
      v9 = [(EDCategorySubsystem *)self messageAuthenticator];
      id v10 = [(EDCategorySubsystem *)self messagePersistence];
      v11 = (void *)[v7 initWithCategoryPersistence:v8 authenticator:v9 messagePersistence:v10];

      id v12 = [MEMORY[0x1E4F60B20] queryForNonInboxMessagesToAuthenticate];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __74__MFCategorySubsystem_iOS__startNonInboxMessageAuthenticationnWithBGTask___block_invoke;
      id v19 = &unk_1E5D3E220;
      id v20 = self;
      id v13 = v4;
      id v21 = v13;
      [v11 migrateMessageAuthenticationStateForQuery:v12 cancelationToken:v6 completion:&v16];
      -[MFCategorySubsystem_iOS _setMigrationTaskWithSystemTask:migrator:cancelable:](self, "_setMigrationTaskWithSystemTask:migrator:cancelable:", v13, v11, v6, v16, v17, v18, v19, v20);
    }
    else
    {
      v15 = [MEMORY[0x1E4F60AB0] log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v4;
        _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_INFO, "Existing task has priority, expiring task: %{public}@", buf, 0xCu);
      }

      [v4 setTaskExpiredWithRetryAfter:0 error:300.0];
    }
  }
  else
  {
    dispatch_queue_t v14 = [MEMORY[0x1E4F60AB0] log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v4;
      _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "BlackPearl disabled - Task %{public}@ being marked as complete", buf, 0xCu);
    }

    [v4 setTaskCompleted];
  }
}

- (void)registerBusinessesGroupingTask
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x1E4F60AB0] log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Registering Business Connect Grouping task.", buf, 2u);
  }

  id v4 = [MEMORY[0x1E4F4F440] sharedScheduler];
  v5 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__MFCategorySubsystem_iOS_registerBusinessesGroupingTask__block_invoke;
  v6[3] = &unk_1E5D3E158;
  objc_copyWeak(&v7, &location);
  [v4 registerForTaskWithIdentifier:@"com.apple.mail.businessconnectgrouping" usingQueue:v5 launchHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)startBusinessConnectGroupingWithBGTask:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
  dispatch_assert_queue_V2(v5);

  if (_os_feature_enabled_impl())
  {
    if ([(MFCategorySubsystem_iOS *)self _shouldStartNewTaskCancelingExistingTaskIfNeeded:v4])
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60D40]) initWithLabel:@"businessConnectGrouping"];
      id v7 = objc_alloc(MEMORY[0x1E4F60A88]);
      id v8 = [(EDCategorySubsystem *)self businessPersistence];
      v9 = (void *)[v7 initWithBusinessPersistence:v8];

      *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)location, self);
      id from = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&from, v4);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __66__MFCategorySubsystem_iOS_startBusinessConnectGroupingWithBGTask___block_invoke;
      v23[3] = &unk_1E5D3E248;
      id v24 = v4;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __66__MFCategorySubsystem_iOS_startBusinessConnectGroupingWithBGTask___block_invoke_51;
      v20[3] = &unk_1E5D3E298;
      v20[4] = self;
      objc_copyWeak(&v21, (id *)location);
      objc_copyWeak(&v22, &from);
      [v9 startBusinessConnectGroupingWithCancelationToken:v6 progressHandler:v23 completion:v20];
      id v10 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__MFCategorySubsystem_iOS_startBusinessConnectGroupingWithBGTask___block_invoke_2;
      block[3] = &unk_1E5D3E2C0;
      objc_copyWeak(&v18, (id *)location);
      objc_copyWeak(&v19, &from);
      id v16 = v9;
      id v17 = v6;
      id v11 = v6;
      id v12 = v9;
      dispatch_async(v10, block);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&v21);

      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      dispatch_queue_t v14 = [MEMORY[0x1E4F60AB0] log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id location = 138543362;
        *(void *)&location[4] = v4;
        _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_INFO, "Existing task has priority, expiring task: %{public}@", location, 0xCu);
      }

      [v4 setTaskExpiredWithRetryAfter:0 error:300.0];
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F60AB0] log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 138543362;
      *(void *)&location[4] = v4;
      _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "BlackPearl disabled - Task %{public}@ being marked as complete", location, 0xCu);
    }

    [v4 setTaskCompleted];
  }
}

- (BOOL)_shouldStartNewTaskCancelingExistingTaskIfNeeded:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MFCategorySubsystem_iOS *)self migrationTask];
  id v7 = [v6 systemTask];

  if (v7)
  {
    id v8 = [v4 identifier];
    if ([v8 isEqualToString:@"com.apple.email.categorization.FastPass"]) {
      unint64_t v9 = 2;
    }
    else {
      unint64_t v9 = [v8 isEqualToString:@"com.apple.mail.blackpearl.categorizer"];
    }

    id v11 = [v7 identifier];
    if ([v11 isEqualToString:@"com.apple.email.categorization.FastPass"]) {
      unint64_t v12 = 2;
    }
    else {
      unint64_t v12 = [v11 isEqualToString:@"com.apple.mail.blackpearl.categorizer"];
    }

    id v13 = [MEMORY[0x1E4F60AB0] log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 134218754;
      unint64_t v17 = v9;
      __int16 v18 = 2114;
      id v19 = v4;
      __int16 v20 = 2048;
      unint64_t v21 = v12;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_INFO, "New task (priority %lu): %{public}@, Existing task (priority %lu): %{public}@", (uint8_t *)&v16, 0x2Au);
    }

    if (v9 <= v12)
    {
      BOOL v14 = 0;
      goto LABEL_17;
    }
    [(MFCategorySubsystem_iOS *)self setMigrationTask:0];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F60AB0] log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v16 = 138543362;
      unint64_t v17 = (unint64_t)v4;
      _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_INFO, "No existing task, starting new task: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (void)_setMigrationTaskWithSystemTask:(id)a3 migrator:(id)a4 cancelable:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MFCategorySubsystem_iOS *)self migrationTaskQueue];
  dispatch_assert_queue_V2(v11);

  unint64_t v12 = [[_EDMigrationBackgroundTask alloc] initWithSystemTask:v8 migrator:v9 cancelable:v10];
  id v13 = [MEMORY[0x1E4F60AB0] log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v12;
    _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Setting new migration task: %{public}@", buf, 0xCu);
  }

  [(MFCategorySubsystem_iOS *)self setMigrationTask:v12];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v12);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__MFCategorySubsystem_iOS__setMigrationTaskWithSystemTask_migrator_cancelable___block_invoke;
  v14[3] = &unk_1E5D3E270;
  objc_copyWeak(&v15, (id *)buf);
  objc_copyWeak(&v16, &location);
  [v8 setExpirationHandler:v14];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (_EDMigrationBackgroundTask)migrationTask
{
  return self->_migrationTask;
}

- (OS_dispatch_queue)migrationTaskQueue
{
  return self->_migrationTaskQueue;
}

- (OS_dispatch_queue)progressReportingQueue
{
  return self->_progressReportingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressReportingQueue, 0);
  objc_storeStrong((id *)&self->_migrationTaskQueue, 0);
  objc_storeStrong((id *)&self->_migrationTask, 0);
}

@end