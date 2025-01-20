@interface REMTipKitDataView
- (REMStore)store;
- (REMTipKitDataView)initWithStore:(id)a3;
- (id)fetchCompletedRemindersCountInList:(id)a3 error:(id *)a4;
- (id)fetchCompletedRemindersCountWithError:(id *)a3;
- (id)fetchCustomSmartListsCountWithError:(id *)a3;
- (id)fetchHashtagsCountWithError:(id *)a3;
- (id)fetchListsCountWithError:(id *)a3;
- (id)fetchListsWithCustomBadgeCountWithError:(id *)a3;
- (id)fetchUncompletedRemindersCountWithError:(id *)a3;
@end

@implementation REMTipKitDataView

- (REMTipKitDataView)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTipKitDataView;
  v6 = [(REMTipKitDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)fetchListsCountWithError:(id *)a3
{
  id v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchListsCount);
  v6 = [(REMTipKitDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = [v7 storedPropertyForKey:@"ListsCount"];
  v10 = REMDynamicCast(v8, (uint64_t)v9);

  if (!v10)
  {
    v12 = +[REMLogStore read];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[REMTipKitDataView fetchListsCountWithError:]();
    }

    if (a3 && !*a3)
    {
      *a3 = +[REMError unexpectedError];
    }
  }

  return v10;
}

- (id)fetchListsWithCustomBadgeCountWithError:(id *)a3
{
  id v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchListsWithCustomBadgeCount);
  v6 = [(REMTipKitDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = [v7 storedPropertyForKey:@"ListsWithCustomBadgeCount"];
  v10 = REMDynamicCast(v8, (uint64_t)v9);

  if (!v10)
  {
    v12 = +[REMLogStore read];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[REMTipKitDataView fetchListsWithCustomBadgeCountWithError:]();
    }

    if (a3 && !*a3)
    {
      *a3 = +[REMError unexpectedError];
    }
  }

  return v10;
}

- (id)fetchUncompletedRemindersCountWithError:(id *)a3
{
  id v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchUncompletedRemindersCount);
  v6 = [(REMTipKitDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = [v7 storedPropertyForKey:@"UncompletedRemindersCount"];
  v10 = REMDynamicCast(v8, (uint64_t)v9);

  if (!v10)
  {
    v12 = +[REMLogStore read];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[REMTipKitDataView fetchUncompletedRemindersCountWithError:]();
    }

    if (a3 && !*a3)
    {
      *a3 = +[REMError unexpectedError];
    }
  }

  return v10;
}

- (id)fetchCompletedRemindersCountWithError:(id *)a3
{
  id v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchCompletedRemindersCount);
  v6 = [(REMTipKitDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = [v7 storedPropertyForKey:@"CompletedRemindersCountInList"];
  v10 = REMDynamicCast(v8, (uint64_t)v9);

  if (!v10)
  {
    v12 = +[REMLogStore read];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[REMTipKitDataView fetchCompletedRemindersCountWithError:]();
    }

    if (a3 && !*a3)
    {
      *a3 = +[REMError unexpectedError];
    }
  }

  return v10;
}

- (id)fetchCompletedRemindersCountInList:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList alloc] initWithListID:v6];

  uint64_t v8 = [(REMTipKitDataView *)self store];
  objc_super v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

  uint64_t v10 = objc_opt_class();
  v11 = [v9 storedPropertyForKey:@"CompletedRemindersCount"];
  v12 = REMDynamicCast(v10, (uint64_t)v11);

  if (!v12)
  {
    v14 = +[REMLogStore read];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[REMTipKitDataView fetchCompletedRemindersCountInList:error:]();
    }

    if (a4 && !*a4)
    {
      *a4 = +[REMError unexpectedError];
    }
  }

  return v12;
}

- (id)fetchCustomSmartListsCountWithError:(id *)a3
{
  id v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchCustomSmartListsCount);
  id v6 = [(REMTipKitDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = [v7 storedPropertyForKey:@"CustomSmartListsCount"];
  uint64_t v10 = REMDynamicCast(v8, (uint64_t)v9);

  if (!v10)
  {
    v12 = +[REMLogStore read];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[REMTipKitDataView fetchCustomSmartListsCountWithError:]();
    }

    if (a3 && !*a3)
    {
      *a3 = +[REMError unexpectedError];
    }
  }

  return v10;
}

- (id)fetchHashtagsCountWithError:(id *)a3
{
  id v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchHashtagsCount);
  id v6 = [(REMTipKitDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = [v7 storedPropertyForKey:@"HashtagsCount"];
  uint64_t v10 = REMDynamicCast(v8, (uint64_t)v9);

  if (!v10)
  {
    v12 = +[REMLogStore read];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[REMTipKitDataView fetchHashtagsCountWithError:]();
    }

    if (a3 && !*a3)
    {
      *a3 = +[REMError unexpectedError];
    }
  }

  return v10;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

- (void)fetchListsCountWithError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "REMTipKit: Failed to fetch lists count", v2, v3, v4, v5, v6);
}

- (void)fetchListsWithCustomBadgeCountWithError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "REMTipKit: Failed to fetch lists with custom badge count", v2, v3, v4, v5, v6);
}

- (void)fetchUncompletedRemindersCountWithError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "REMTipKit: Failed to fetch uncompleted reminders count", v2, v3, v4, v5, v6);
}

- (void)fetchCompletedRemindersCountWithError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "REMTipKit: Failed to fetch completed reminders count", v2, v3, v4, v5, v6);
}

- (void)fetchCompletedRemindersCountInList:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "REMTipKit: Failed to fetch completed reminders in list count", v2, v3, v4, v5, v6);
}

- (void)fetchCustomSmartListsCountWithError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "REMTipKit: Failed to fetch custom smart lists count", v2, v3, v4, v5, v6);
}

- (void)fetchHashtagsCountWithError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "REMTipKit: Failed to fetch hashtags count", v2, v3, v4, v5, v6);
}

@end