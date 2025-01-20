@interface REMRemindersDataView
+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6;
+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6 requestedReminderIDs:(id)a7;
+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6 requestedStringIdentifiers:(id)a7 identifierSelector:(SEL)a8;
+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6 showMarkedForDeleteObjects:(BOOL)a7;
- (REMRemindersDataView)initWithStore:(id)a3;
- (REMStore)store;
- (id)fetchAllRemindersWithExternalIdentifier:(id)a3 error:(id *)a4;
- (id)fetchObjectIDsOfRemindersWithParentReminderID:(id)a3 includeIncomplete:(BOOL)a4 includeCompleted:(BOOL)a5 isUnsupported:(BOOL)a6 error:(id *)a7;
- (id)fetchReminderWithDACalendarItemUniqueIdentifier:(id)a3 inList:(id)a4 error:(id *)a5;
- (id)fetchReminderWithExternalIdentifier:(id)a3 inList:(id)a4 error:(id *)a5;
- (id)fetchReminderWithObjectID:(id)a3 fetchOptions:(id)a4 error:(id *)a5;
- (id)fetchRemindersCountWithListID:(id)a3 error:(id *)a4;
- (id)fetchRemindersCountWithParentReminderID:(id)a3 error:(id *)a4;
- (id)fetchRemindersIncludingUnsupportedWithObjectIDs:(id)a3 error:(id *)a4;
- (id)fetchRemindersMatchingPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(id)a5 error:(id *)a6;
- (id)fetchRemindersWithDACalendarItemUniqueIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5;
- (id)fetchRemindersWithExternalIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5;
- (id)fetchRemindersWithListID:(id)a3 includingSubtasks:(BOOL)a4 error:(id *)a5;
- (id)fetchRemindersWithObjectIDs:(id)a3 fetchOptions:(id)a4 error:(id *)a5;
- (id)fetchRemindersWithParentReminderID:(id)a3 accountID:(id)a4 subtaskFetchOption:(int64_t)a5 reminderFetchOptions:(id)a6 error:(id *)a7;
- (id)fetchRemindersWithParentReminderIDs:(id)a3 error:(id *)a4;
- (id)fetchSubtasksOfParentReminder:(id)a3 subtaskFetchOption:(int64_t)a4 reminderFetchOptions:(id)a5 error:(id *)a6;
- (id)fetchSubtasksOfParentReminderChangeItem:(id)a3 subtaskFetchOption:(int64_t)a4 reminderFetchOptions:(id)a5 error:(id *)a6;
- (int64_t)fetchSubtasksMasksWithParentReminderID:(id)a3 includingConcealed:(BOOL)a4 error:(id *)a5;
@end

@implementation REMRemindersDataView

- (REMRemindersDataView)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMRemindersDataView;
  v6 = [(REMRemindersDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)fetchRemindersWithListID:(id)a3 includingSubtasks:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  objc_super v9 = [[REMRemindersDataViewInvocation_fetchByListID alloc] initWithListID:v8 includingSubtasks:v6];

  v10 = [(REMRemindersDataView *)self store];
  v11 = [v10 resultFromPerformingInvocation:v9 error:a5];

  uint64_t v12 = objc_opt_class();
  v13 = REMDynamicCast(v12, (uint64_t)v11);
  v14 = [v13 accountStorages];
  v15 = [v13 listStorages];
  v16 = [v13 reminderStorages];
  v17 = [(REMRemindersDataView *)self store];
  v18 = [v13 objectIDs];
  v19 = +[REMRemindersDataView remindersFromAccountStorages:v14 listStorages:v15 reminderStorages:v16 store:v17 requestedReminderIDs:v18];

  return v19;
}

- (id)fetchRemindersWithParentReminderID:(id)a3 accountID:(id)a4 subtaskFetchOption:(int64_t)a5 reminderFetchOptions:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [[REMRemindersDataViewInvocation_fetchByParentReminderID alloc] initWithParentReminderID:v14 accountID:v13 subtaskFetchOption:a5 reminderFetchOptions:v12];

  v16 = [(REMRemindersDataView *)self store];
  v17 = [v16 resultFromPerformingInvocation:v15 error:a7];

  uint64_t v18 = objc_opt_class();
  v19 = REMDynamicCast(v18, (uint64_t)v17);
  v20 = [v19 accountStorages];
  v21 = [v19 listStorages];
  v22 = [v19 reminderStorages];
  v23 = [(REMRemindersDataView *)self store];
  v24 = [v19 objectIDs];
  v25 = +[REMRemindersDataView remindersFromAccountStorages:v20 listStorages:v21 reminderStorages:v22 store:v23 requestedReminderIDs:v24];

  return v25;
}

- (id)fetchSubtasksOfParentReminder:(id)a3 subtaskFetchOption:(int64_t)a4 reminderFetchOptions:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [v11 objectID];
  id v13 = [v11 accountID];

  id v14 = [(REMRemindersDataView *)self fetchRemindersWithParentReminderID:v12 accountID:v13 subtaskFetchOption:a4 reminderFetchOptions:v10 error:a6];

  return v14;
}

- (id)fetchSubtasksOfParentReminderChangeItem:(id)a3 subtaskFetchOption:(int64_t)a4 reminderFetchOptions:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [v11 objectID];
  id v13 = [v11 accountID];

  id v14 = [(REMRemindersDataView *)self fetchRemindersWithParentReminderID:v12 accountID:v13 subtaskFetchOption:a4 reminderFetchOptions:v10 error:a6];

  return v14;
}

- (id)fetchReminderWithObjectID:(id)a3 fetchOptions:(id)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v18[0] = v8;
  objc_super v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  id v11 = [v9 arrayWithObjects:v18 count:1];
  id v12 = [(REMRemindersDataView *)self fetchRemindersWithObjectIDs:v11 fetchOptions:v10 error:a5];

  if (!v12) {
    goto LABEL_7;
  }
  id v13 = [v12 objectForKeyedSubscript:v8];
  if (v13) {
    goto LABEL_8;
  }
  id v14 = +[REMLogStore read];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v8;
    _os_log_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_DEFAULT, "REMRemindersDataView: Requested to fetch non-existent reminder {objectID: %{public}@}", (uint8_t *)&v16, 0xCu);
  }

  if (a5)
  {
    +[REMError noSuchObjectErrorWithObjectID:v8];
    id v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    id v13 = 0;
  }
LABEL_8:

  return v13;
}

- (id)fetchRemindersWithObjectIDs:(id)a3 fetchOptions:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    uint64_t v10 = [v9 includeConcealed];
    id v11 = [[REMRemindersDataViewInvocation_fetchByObjectID alloc] initWithObjectIDs:v8 fetchOptions:v9];
    id v12 = [(REMRemindersDataView *)self store];
    v33 = v11;
    id v13 = [v12 resultFromPerformingInvocation:v11 error:a5];

    uint64_t v14 = objc_opt_class();
    v15 = REMDynamicCast(v14, (uint64_t)v13);
    int v16 = [v15 accountStorages];
    id v17 = [v15 listStorages];
    uint64_t v18 = [v15 reminderStorages];
    v19 = [(REMRemindersDataView *)self store];
    v20 = +[REMRemindersDataView remindersFromAccountStorages:v16 listStorages:v17 reminderStorages:v18 store:v19 showMarkedForDeleteObjects:v10];

    if (v20)
    {
      v31 = v13;
      id v32 = v9;
      v21 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v22 = v8;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v35 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = [v20 objectForKeyedSubscript:*(void *)(*((void *)&v34 + 1) + 8 * i)];
            v28 = v27;
            if (v27)
            {
              v29 = [v27 objectID];
              [v21 setObject:v28 forKeyedSubscript:v29];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v24);
      }

      id v13 = v31;
      id v9 = v32;
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v21;
}

- (id)fetchRemindersIncludingUnsupportedWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[REMReminderFetchOptions fetchOptionsIncludingConcealed];
  id v8 = [(REMRemindersDataView *)self fetchRemindersWithObjectIDs:v6 fetchOptions:v7 error:a4];

  return v8;
}

- (id)fetchRemindersMatchingPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[REMRemindersDataViewInvocation_fetchByPredicateDescriptor alloc] initWithPredicateDescriptor:v12 sortDescriptors:v11 options:v10];

  uint64_t v14 = [(REMRemindersDataView *)self store];
  v15 = [v14 resultFromPerformingInvocation:v13 error:a6];

  uint64_t v16 = objc_opt_class();
  id v17 = REMDynamicCast(v16, (uint64_t)v15);
  uint64_t v18 = [v17 accountStorages];
  v19 = [v17 listStorages];
  v20 = [v17 reminderStorages];
  v21 = [(REMRemindersDataView *)self store];
  id v22 = [v17 objectIDs];
  uint64_t v23 = +[REMRemindersDataView remindersFromAccountStorages:v18 listStorages:v19 reminderStorages:v20 store:v21 requestedReminderIDs:v22];

  return v23;
}

- (id)fetchRemindersWithParentReminderIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[REMRemindersDataViewInvocation_fetchByParentReminderIDs alloc] initWithParentReminderIDs:v6];

  id v8 = [(REMRemindersDataView *)self store];
  id v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

  uint64_t v10 = objc_opt_class();
  id v11 = REMDynamicCast(v10, (uint64_t)v9);
  id v12 = [v11 accountStorages];
  id v13 = [v11 listStorages];
  uint64_t v14 = [v11 reminderStorages];
  v15 = [(REMRemindersDataView *)self store];
  uint64_t v16 = [v11 objectIDs];
  id v17 = +[REMRemindersDataView remindersFromAccountStorages:v12 listStorages:v13 reminderStorages:v14 store:v15 requestedReminderIDs:v16];

  return v17;
}

- (id)fetchObjectIDsOfRemindersWithParentReminderID:(id)a3 includeIncomplete:(BOOL)a4 includeCompleted:(BOOL)a5 isUnsupported:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = [[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID alloc] initWithParentReminderID:v12 includeIncomplete:v10 includeCompleted:v9 isUnsupported:v8];

  uint64_t v14 = [(REMRemindersDataView *)self store];
  v15 = [v14 resultFromPerformingInvocation:v13 error:a7];

  uint64_t v16 = objc_opt_class();
  id v17 = REMDynamicCast(v16, (uint64_t)v15);
  uint64_t v18 = [v17 objectIDs];

  return v18;
}

- (id)fetchRemindersCountWithListID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[REMRemindersDataViewInvocation_fetchRemindersCountByListID alloc] initWithListID:v6];
  BOOL v8 = [(REMRemindersDataView *)self store];
  BOOL v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

  uint64_t v10 = objc_opt_class();
  id v11 = [v9 storedPropertyForKey:@"RemindersCount"];
  id v12 = REMDynamicCast(v10, (uint64_t)v11);

  if (!v12)
  {
    uint64_t v14 = +[REMLogStore read];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[REMRemindersDataView fetchRemindersCountWithListID:error:]((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
    }

    if (a4 && !*a4)
    {
      *a4 = +[REMError unexpectedError];
    }
  }

  return v12;
}

- (id)fetchRemindersCountWithParentReminderID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID alloc] initWithParentReminderID:v6];
  BOOL v8 = [(REMRemindersDataView *)self store];
  BOOL v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

  uint64_t v10 = objc_opt_class();
  id v11 = [v9 storedPropertyForKey:@"RemindersCount"];
  id v12 = REMDynamicCast(v10, (uint64_t)v11);

  if (!v12)
  {
    uint64_t v14 = +[REMLogStore read];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[REMRemindersDataView fetchRemindersCountWithParentReminderID:error:]((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
    }

    if (a4 && !*a4)
    {
      *a4 = +[REMError unexpectedError];
    }
  }

  return v12;
}

- (int64_t)fetchSubtasksMasksWithParentReminderID:(id)a3 includingConcealed:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = [[REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID alloc] initWithParentReminderID:v8 includingConcealed:v6];
  uint64_t v10 = [(REMRemindersDataView *)self store];
  id v11 = [v10 resultFromPerformingInvocation:v9 error:a5];

  uint64_t v12 = objc_opt_class();
  id v13 = [v11 storedPropertyForKey:@"ReminderSubtasksMasks"];
  uint64_t v14 = REMDynamicCast(v12, (uint64_t)v13);

  if (!v14)
  {
    uint64_t v17 = +[REMLogStore read];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[REMRemindersDataView fetchSubtasksMasksWithParentReminderID:includingConcealed:error:]((uint64_t)v8, v17, v18, v19, v20, v21, v22, v23);
    }

    if (a5 && !*a5)
    {
      *a5 = +[REMError unexpectedError];
    }
  }
  int64_t v15 = [v14 unsignedIntegerValue];

  return v15;
}

- (id)fetchReminderWithExternalIdentifier:(id)a3 inList:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = v8;
  if (!v8)
  {
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  v19[0] = v8;
  uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a4;
  uint64_t v12 = [v10 arrayWithObjects:v19 count:1];
  id v13 = [(REMRemindersDataView *)self fetchRemindersWithExternalIdentifiers:v12 inList:v11 error:a5];

  if (!v13) {
    goto LABEL_9;
  }
  uint64_t v14 = [v13 objectForKeyedSubscript:v9];
  if (!v14)
  {
    int64_t v15 = +[REMLogStore read];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1B9AA2000, v15, OS_LOG_TYPE_DEFAULT, "Requested non-existent reminder {externalIdentifier: %@}", (uint8_t *)&v17, 0xCu);
    }

    if (a5)
    {
      +[REMError noSuchObjectErrorWithExternalIdentifier:v9];
      uint64_t v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v14 = 0;
  }
LABEL_10:

LABEL_11:

  return v14;
}

- (id)fetchRemindersWithExternalIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [REMRemindersDataViewInvocation_fetchByExternalIdentifier alloc];
  v33 = v9;
  id v11 = [v9 objectID];
  uint64_t v12 = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)v10 initWithExternalIdentifiers:v8 listObjectID:v11];

  id v13 = [(REMRemindersDataView *)self store];
  uint64_t v14 = [v13 resultFromPerformingInvocation:v12 error:a5];

  uint64_t v15 = objc_opt_class();
  uint64_t v16 = REMDynamicCast(v15, (uint64_t)v14);
  int v17 = [v16 accountStorages];
  uint64_t v18 = [v16 listStorages];
  uint64_t v19 = [v16 reminderStorages];
  uint64_t v20 = [(REMRemindersDataView *)self store];
  uint64_t v21 = +[REMRemindersDataView remindersFromAccountStorages:v17 listStorages:v18 reminderStorages:v19 store:v20 requestedStringIdentifiers:v8 identifierSelector:sel_externalIdentifier];

  if (v21)
  {
    v31 = v14;
    id v32 = v12;
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v21, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v29 = [v28 externalIdentifier];
          [v22 setObject:v28 forKeyedSubscript:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v25);
    }

    uint64_t v14 = v31;
    uint64_t v12 = v32;
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)fetchAllRemindersWithExternalIdentifier:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [REMRemindersDataViewInvocation_fetchByExternalIdentifier alloc];
  v27[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  id v9 = [(REMRemindersDataViewInvocation_fetchByExternalIdentifier *)v7 initWithExternalIdentifiers:v8 listObjectID:0];

  uint64_t v10 = [(REMRemindersDataView *)self store];
  uint64_t v24 = a4;
  id v11 = [v10 resultFromPerformingInvocation:v9 error:a4];

  uint64_t v12 = objc_opt_class();
  id v13 = REMDynamicCast(v12, (uint64_t)v11);
  uint64_t v14 = [v13 accountStorages];
  uint64_t v15 = [v13 listStorages];
  uint64_t v16 = [v13 reminderStorages];
  int v17 = [(REMRemindersDataView *)self store];
  uint64_t v18 = +[REMRemindersDataView remindersFromAccountStorages:v14 listStorages:v15 reminderStorages:v16 store:v17];

  uint64_t v19 = [v18 allValues];
  uint64_t v20 = v19;
  if (v19 && [v19 count])
  {
    id v21 = v20;
  }
  else
  {
    uint64_t v22 = +[REMLogStore read];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v6;
      _os_log_impl(&dword_1B9AA2000, v22, OS_LOG_TYPE_DEFAULT, "REMRemindersDataView: Requested to fetch non-existent reminders {externalIdentifier: %{public}@}", buf, 0xCu);
    }

    if (v24)
    {
      +[REMError noSuchObjectErrorWithExternalIdentifier:v6];
      id v21 = 0;
      id *v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v21 = 0;
    }
  }

  return v21;
}

- (id)fetchReminderWithDACalendarItemUniqueIdentifier:(id)a3 inList:(id)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v18[0] = v8;
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  id v11 = [v9 arrayWithObjects:v18 count:1];
  uint64_t v12 = [(REMRemindersDataView *)self fetchRemindersWithDACalendarItemUniqueIdentifiers:v11 inList:v10 error:a5];

  if (!v12) {
    goto LABEL_7;
  }
  id v13 = [v12 objectForKeyedSubscript:v8];
  if (v13) {
    goto LABEL_8;
  }
  uint64_t v14 = +[REMLogStore read];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v8;
    _os_log_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_DEFAULT, "REMRemindersDataView: Requested to fetch non-existent reminder {daCalendarItemUniqueIdentifier: %{public}@}", (uint8_t *)&v16, 0xCu);
  }

  if (a5)
  {
    +[REMError noSuchObjectErrorWithDACalendarItemUniqueIdentifier:v8];
    id v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    id v13 = 0;
  }
LABEL_8:

  return v13;
}

- (id)fetchRemindersWithDACalendarItemUniqueIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [REMRemindersDataViewInvocation_fetchByDACalendarItemUniqueIdentifier alloc];
  v33 = v9;
  id v11 = [v9 objectID];
  uint64_t v12 = [(REMRemindersDataViewInvocation_fetchByDACalendarItemUniqueIdentifier *)v10 initWithDACalendarItemUniqueIdentifiers:v8 listObjectID:v11];

  id v13 = [(REMRemindersDataView *)self store];
  uint64_t v14 = [v13 resultFromPerformingInvocation:v12 error:a5];

  uint64_t v15 = objc_opt_class();
  int v16 = REMDynamicCast(v15, (uint64_t)v14);
  id v17 = [v16 accountStorages];
  uint64_t v18 = [v16 listStorages];
  uint64_t v19 = [v16 reminderStorages];
  uint64_t v20 = [(REMRemindersDataView *)self store];
  id v21 = +[REMRemindersDataView remindersFromAccountStorages:v17 listStorages:v18 reminderStorages:v19 store:v20 requestedStringIdentifiers:v8 identifierSelector:sel_daCalendarItemUniqueIdentifier];

  if (v21)
  {
    v31 = v14;
    id v32 = v12;
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v21, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v29 = [v28 daCalendarItemUniqueIdentifier];
          [v22 setObject:v28 forKeyedSubscript:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v25);
    }

    uint64_t v14 = v31;
    uint64_t v12 = v32;
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6 requestedReminderIDs:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  id v13 = [a1 remindersFromAccountStorages:a3 listStorages:a4 reminderStorages:a5 store:a6];
  if (v13)
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v12;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = objc_msgSend(v13, "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
          if (v20) {
            [v14 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6 requestedStringIdentifiers:(id)a7 identifierSelector:(SEL)a8
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  id v15 = [a1 remindersFromAccountStorages:a3 listStorages:a4 reminderStorages:a5 store:a6];
  uint64_t v16 = v15;
  if (v15)
  {
    long long v35 = v14;
    uint64_t v17 = [v15 allValues];
    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          long long v25 = NSStringFromSelector(a8);
          uint64_t v26 = [v24 valueForKey:v25];

          if (v26) {
            [v18 setObject:v24 forKeyedSubscript:v26];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v21);
    }

    id v14 = v35;
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v35, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v28 = v35;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v37 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [v18 objectForKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * j)];
          if (v33) {
            [v27 addObject:v33];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v30);
    }
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6
{
  return (id)[a1 remindersFromAccountStorages:a3 listStorages:a4 reminderStorages:a5 store:a6 showMarkedForDeleteObjects:0];
}

+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6 showMarkedForDeleteObjects:(BOOL)a7
{
  BOOL v43 = a7;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    id v13 = 0;
    goto LABEL_29;
  }
  long long v42 = +[REMAccountsDataView accountsFromAccountStorages:a3 store:v12];
  id v39 = v10;
  v44 = +[REMListsDataView listsFromAccounts:listStorages:store:](REMListsDataView, "listsFromAccounts:listStorages:store:");
  id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v38 = v11;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (!v15) {
    goto LABEL_18;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v50;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v50 != v17) {
        objc_enumerationMutation(v14);
      }
      id v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      uint64_t v20 = objc_msgSend(v19, "listID", v38);

      if (v20)
      {
        uint64_t v21 = [v19 listID];
        uint64_t v22 = [v44 objectForKeyedSubscript:v21];

        long long v23 = [[REMReminder alloc] initWithStore:v12 list:v22 storage:v19];
      }
      else
      {
        if (!v43) {
          continue;
        }
        long long v24 = [v19 accountID];
        uint64_t v22 = [v42 objectForKeyedSubscript:v24];

        if (!v22)
        {
          long long v25 = +[REMLogStore read];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            long long v41 = [v19 objectID];
            long long v40 = [v19 accountID];
            *(_DWORD *)buf = 138543618;
            v55 = v41;
            __int16 v56 = 2114;
            v57 = v40;
            _os_log_fault_impl(&dword_1B9AA2000, v25, OS_LOG_TYPE_FAULT, "REMRemindersDataView: Could not map an account for the fetched reminder {reminderID: %{public}@, accountID: %{public}@}", buf, 0x16u);
          }
        }
        long long v23 = [[REMReminder alloc] initWithStore:v12 account:v22 storage:v19];
      }
      uint64_t v26 = v23;
      uint64_t v27 = [(REMReminder *)v23 objectID];
      [v13 setObject:v26 forKeyedSubscript:v27];
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
  }
  while (v16);
LABEL_18:

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v28 = [v13 allValues];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v46 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        long long v34 = objc_msgSend(v33, "storage", v38);
        long long v35 = [v34 parentReminderID];
        if (v35)
        {
          long long v36 = [v13 objectForKeyedSubscript:v35];
          [v33 setParentReminder:v36];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v30);
  }

  id v11 = v38;
  id v10 = v39;
LABEL_29:

  return v13;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

- (void)fetchRemindersCountWithListID:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchRemindersCountWithParentReminderID:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchSubtasksMasksWithParentReminderID:(uint64_t)a3 includingConcealed:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end