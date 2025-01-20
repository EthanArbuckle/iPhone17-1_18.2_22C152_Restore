@interface NEKReminderStore
- (BOOL)_checkAndSetDefaultList:(id)a3 calendarWrapper:(id)a4 store:(id)a5;
- (BOOL)_saveEventStore:(id)a3;
- (BOOL)_updateAccount:(id)a3 withSourceWrapper:(id)a4 store:(id)a5;
- (BOOL)_updateList:(id)a3 withCalendarWrapper:(id)a4;
- (BOOL)saveRequestsNeedPurgeDeletedObjectsAfterSave;
- (BOOL)shouldSendReminder:(id)a3;
- (NEKReminderStore)initWithEnvironment:(id)a3;
- (NSMapTable)saveRequests;
- (id)_createListForWrapper:(id)a3 store:(id)a4;
- (id)_deletableAccountsForStore:(id)a3;
- (id)_deletableListsForStore:(id)a3;
- (id)deduplicateICSWrappers:(id)a3;
- (id)freshEventStoreFor:(id)a3;
- (id)getDefaultListForStore:(id)a3;
- (id)listCacheForStore:(id)a3 wrappers:(id)a4;
- (id)reminderCacheForStore:(id)a3 wrappers:(id)a4;
- (id)saveRequestForStore:(id)a3;
- (id)saveRequestForStore:(id)a3 needsPurgeDeletedObjectsAfterSave:(BOOL)a4;
- (id)wrapperForList:(id)a3;
- (id)wrapperForList:(id)a3 useAttributes:(BOOL)a4;
- (id)wrapperForReminder:(id)a3 oldListIdentifier:(id)a4;
- (void)ICSWrappersForChangeSet:(id)a3 movedReminderAndListMapping:(id)a4 pipe:(id)a5;
- (void)_createAccountForWrapper:(id)a3 store:(id)a4;
- (void)_deleteAccountWithIdentifier:(id)a3 store:(id)a4;
- (void)_deleteListWithIdentifier:(id)a3 store:(id)a4;
- (void)_deleteReminderWithIdentifier:(id)a3 store:(id)a4;
- (void)_ensureReminderInList:(id)a3 saveRequest:(id)a4 inICSWrapper:(id)a5;
- (void)applySidePropertiesToReminderChangeItem:(id)a3 withWrapper:(id)a4 session:(id)a5;
- (void)batchedEnumerateAccountsForStore:(id)a3 changeSet:(id)a4 changeType:(int)a5 withBlock:(id)a6;
- (void)batchedEnumerateForChangeSet:(id)a3 changeType:(int)a4 forEntitiesOfClass:(Class)a5 withFetchBlock:(id)a6 withBlock:(id)a7;
- (void)batchedEnumerateListsForStore:(id)a3 changeSet:(id)a4 changeType:(int)a5 withBlock:(id)a6;
- (void)batchedEnumerateRemindersForStore:(id)a3 changeSet:(id)a4 changeType:(int)a5 withBlock:(id)a6;
- (void)deleteAccount:(id)a3;
- (void)deleteItem:(id)a3 store:(id)a4;
- (void)deleteItemWithIdentifier:(id)a3 store:(id)a4;
- (void)deleteList:(id)a3;
- (void)deleteReminder:(id)a3;
- (void)deletionWrappersForChangeSet:(id)a3 deletedReminderAndListMapping:(id)a4 skipAccountDeletions:(BOOL)a5 pipe:(id)a6;
- (void)handleNewReminderChangeItem:(id)a3 withWrapper:(id)a4 session:(id)a5;
- (void)handleReminderWithUniqueIdentifierFromGizmo:(id)a3 saveRequest:(id)a4 list:(id)a5 wrapper:(id)a6;
- (void)handleUpdatedReminderFromGizmo:(id)a3 withSaveRequest:(id)a4 withWrapper:(id)a5;
- (void)listWrappersForChangeSet:(id)a3 pipe:(id)a4;
- (void)performUpdateWithICSWrappers:(id)a3 store:(id)a4 session:(id)a5;
- (void)remindersWrappersForChangeSet:(id)a3 skipAccountDeletions:(BOOL)a4 pipe:(id)a5;
- (void)removeAllItems;
- (void)removeAllRemindersInList:(id)a3;
- (void)removeDeletableAccounts:(id)a3;
- (void)removeDeletableLists:(id)a3;
- (void)saveEventStore:(id)a3;
- (void)setSaveRequests:(id)a3;
- (void)setSaveRequestsNeedPurgeDeletedObjectsAfterSave:(BOOL)a3;
- (void)storeWrapperForCloudKitAccount:(id)a3 pipe:(id)a4;
- (void)updateCalendar:(id)a3 store:(id)a4;
- (void)updateICS:(id)a3 store:(id)a4 session:(id)a5;
- (void)updateSource:(id)a3 store:(id)a4;
@end

@implementation NEKReminderStore

- (NEKReminderStore)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NEKReminderStore;
  v5 = [(NEKStore *)&v14 initWithEnvironment:v4];
  if (v5)
  {
    uint64_t v6 = sub_100006A20("com.apple.eventkitsync.nekreminderstore");
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = sub_100006A20("com.apple.eventkitsync.reminders.pipe");
    pipeQueue = v5->_pipeQueue;
    v5->_pipeQueue = (OS_dispatch_queue *)v8;

    v10 = +[NEKChangeObserver changeObserverForReminderWithQueue:v5->_queue databaseController:v5 environment:v4];
    [(NEKStore *)v5 setChangeObserver:v10];

    uint64_t v11 = +[NSMapTable mapTableWithKeyOptions:5 valueOptions:0];
    saveRequests = v5->_saveRequests;
    v5->_saveRequests = (NSMapTable *)v11;
  }
  return v5;
}

- (id)freshEventStoreFor:(id)a3
{
  id v4 = +[REMStore eks_storeForSyncing];
  v5 = [(NEKReminderStore *)self saveRequests];
  uint64_t v6 = +[NSMutableArray array];
  [v5 setObject:v6 forKey:v4];

  return v4;
}

- (void)saveEventStore:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000536D8;
  v7[3] = &unk_1000A8BB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (BOOL)_saveEventStore:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v31 = (void *)os_transaction_create();
  v29 = objc_alloc_init(NDTPerf);
  kdebug_trace();
  v5 = [(NEKReminderStore *)self saveRequests];
  id v6 = [v5 objectForKey:v4];
  id v7 = [v6 copy];

  [v7 count];
  v30 = self;
  id v8 = [(NEKReminderStore *)self saveRequests];
  v9 = +[NSMutableArray array];
  [v8 setObject:v9 forKey:v4];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    char v14 = 1;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v32 = 0;
        [v16 saveSynchronouslyWithError:&v32];
        id v17 = v32;
        if (v17)
        {
          v18 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            double v38 = *(double *)&v16;
            __int16 v39 = 2114;
            id v40 = v17;
            _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Error saving save request %@: %{public}@", buf, 0x16u);
          }
          char v14 = 0;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v12);
  }
  else
  {
    char v14 = 1;
  }

  if ([(NEKReminderStore *)v30 saveRequestsNeedPurgeDeletedObjectsAfterSave]&& os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_FAULT))
  {
    sub_10006F7D8();
  }
  [(NEKReminderStore *)v30 setSaveRequestsNeedPurgeDeletedObjectsAfterSave:0];
  kdebug_trace();
  v19 = +[NDTPerf nowMinusPrevious:v29];

  v20 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    id v22 = [v19 dirtyMemory];
    *(_DWORD *)buf = 134217984;
    double v38 = *(double *)&v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Memory delta from save: %lld #perf", buf, 0xCu);
  }
  v23 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    id v25 = [v19 wallTime];
    *(_DWORD *)buf = 134217984;
    double v38 = (double)(uint64_t)v25 / 1000000000.0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Reminders database save time: %fs #perf", buf, 0xCu);
  }
  if (v14)
  {
    v26 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Database changes saved successfully", buf, 2u);
    }
  }

  return v14 & 1;
}

- (id)saveRequestForStore:(id)a3
{
  return [(NEKReminderStore *)self saveRequestForStore:a3 needsPurgeDeletedObjectsAfterSave:0];
}

- (id)saveRequestForStore:(id)a3 needsPurgeDeletedObjectsAfterSave:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_FAULT)) {
      sub_10006F818();
    }
    id v6 = [(NEKReminderStore *)self freshEventStoreFor:@"saveRequestForStore(Reminders)"];
  }
  id v7 = [objc_alloc((Class)REMSaveRequest) initWithStore:v6];
  id v8 = [(NEKStore *)self environment];
  v9 = [v8 clientName];
  [v7 setAuthor:v9];

  id v10 = [(NEKReminderStore *)self saveRequests];
  id v11 = [v10 objectForKey:v6];
  [v11 addObject:v7];

  if (v4)
  {
    id v12 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Save request created with needsPurgeDeletedObjectsAfterSave=YES. The next save will be slow.", v14, 2u);
    }
  }
  [(NEKReminderStore *)self setSaveRequestsNeedPurgeDeletedObjectsAfterSave:[(NEKReminderStore *)self saveRequestsNeedPurgeDeletedObjectsAfterSave] | v4];

  return v7;
}

- (void)removeAllItems
{
  v3 = (void *)os_transaction_create();
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100053D70;
  v6[3] = &unk_1000A8BB8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(queue, v6);
}

- (void)removeDeletableAccounts:(id)a3
{
  BOOL v4 = [(NEKReminderStore *)self _deletableAccountsForStore:a3];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NEKReminderStore *)self deleteAccount:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_deletableAccountsForStore:(id)a3
{
  id v8 = 0;
  v3 = [a3 fetchAccountsWithError:&v8];
  id v4 = v8;
  if (!v3 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
    sub_10006F858();
  }
  id v5 = +[NSPredicate predicateWithBlock:&stru_1000A9CF0];
  id v6 = [v3 filteredArrayUsingPredicate:v5];

  return v6;
}

- (void)removeDeletableLists:(id)a3
{
  id v4 = a3;
  id v5 = [(NEKReminderStore *)self _deletableListsForStore:v4];
  id v6 = [v4 eks_defaultLocalList];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        if (*(void **)(*((void *)&v12 + 1) + 8 * (void)v11) != v6) {
          [(NEKReminderStore *)self deleteList:(void)v12];
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (v6) {
    [(NEKReminderStore *)self removeAllRemindersInList:v6];
  }
}

- (void)removeAllRemindersInList:(id)a3
{
  id v4 = a3;
  id v5 = [v4 store];
  id v6 = [(NEKReminderStore *)self saveRequestForStore:v5];

  id v19 = 0;
  id v7 = [v4 fetchRemindersWithError:&v19];
  id v8 = v19;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [v6 updateReminder:v15];
        [v14 removeFromList];

        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v11);
  }
}

- (id)_deletableListsForStore:(id)a3
{
  id v3 = a3;
  uint64_t v27 = +[NSMutableArray array];
  id v37 = 0;
  id v4 = [v3 fetchAccountsWithError:&v37];
  id v5 = v37;
  if (!v4 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
    sub_10006F858();
  }
  v28 = [v3 eks_localAccount];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    v26 = v30;
    id v10 = (void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", v26) == (id)2)
        {
          long long v13 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            long long v14 = v13;
            long long v15 = [v12 objectID];
            *(_DWORD *)buf = 138543362;
            id v39 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skip deleting list in CloudKit account with ID %{public}@", buf, 0xCu);
          }
        }
        else
        {
          id v32 = v5;
          long long v16 = [v12 fetchListsWithError:&v32];
          id v17 = v32;

          if (!v16)
          {
            long long v18 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v39 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error fetching lists: %{public}@", buf, 0xCu);
            }
          }
          if (v12 == v28)
          {
            id v19 = [v3 eks_defaultLocalList];
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v30[0] = sub_100054764;
            v30[1] = &unk_1000A9D18;
            id v31 = v19;
            id v20 = v19;
            v21 = +[NSPredicate predicateWithBlock:v29];
            [v16 filteredArrayUsingPredicate:v21];
            v23 = id v22 = v3;

            long long v16 = (void *)v23;
            id v3 = v22;
            id v10 = (void *)v27;
          }
          [v10 addObjectsFromArray:v16];

          id v5 = v17;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v8);
  }
  else
  {
    id v10 = (void *)v27;
  }

  id v24 = [v10 copy];

  return v24;
}

- (id)getDefaultListForStore:(id)a3
{
  id v3 = a3;
  id v4 = [v3 fetchDefaultListWithError:0];
  id v5 = [v3 eks_defaultLocalList];

  if (v5)
  {
    id v6 = [v4 remObjectID];
    id v7 = [v5 remObjectID];
    unsigned int v8 = [v6 isEqual:v7];

    if (v8)
    {

      id v4 = 0;
    }
  }

  return v4;
}

- (BOOL)shouldSendReminder:(id)a3
{
  id v4 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = a3;
    id v7 = [v6 objectID];
    unsigned int v8 = [v6 daCalendarItemUniqueIdentifier];

    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2114;
    long long v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Selecting reminder (id=%{public}@, calendarUniqueId=%{public}@)", (uint8_t *)&v10, 0x16u);
  }
  return 1;
}

- (void)updateSource:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)os_transaction_create();
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100054A24;
  v13[3] = &unk_1000A90A0;
  id v14 = v6;
  id v15 = v7;
  long long v16 = self;
  id v17 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_sync(queue, v13);
}

- (void)updateCalendar:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)os_transaction_create();
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100054F34;
  v13[3] = &unk_1000A90A0;
  id v14 = v6;
  id v15 = v7;
  long long v16 = self;
  id v17 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_sync(queue, v13);
}

- (void)updateICS:(id)a3 store:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)os_transaction_create();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055400;
  block[3] = &unk_1000A9078;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_sync(queue, block);
}

- (void)deleteItemWithIdentifier:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)os_transaction_create();
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100055500;
  v13[3] = &unk_1000A90A0;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, v13);
}

- (void)deleteItem:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectIdentifier];
  switch([v6 type])
  {
    case 1u:
      [(NEKReminderStore *)self _deleteAccountWithIdentifier:v8 store:v7];
      break;
    case 2u:
      [(NEKReminderStore *)self _deleteListWithIdentifier:v8 store:v7];
      break;
    case 3u:
      [(NEKReminderStore *)self _deleteReminderWithIdentifier:v8 store:v7];
      break;
    case 4u:
      break;
    default:
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006FC4C();
      }
      break;
  }
}

- (void)handleNewReminderChangeItem:(id)a3 withWrapper:(id)a4 session:(id)a5
{
}

- (void)handleUpdatedReminderFromGizmo:(id)a3 withSaveRequest:(id)a4 withWrapper:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = [v7 title];
    id v13 = sub_10002D3E0(v12);
    id v14 = [v7 daCalendarItemUniqueIdentifier];
    int v20 = 138543618;
    id v21 = v13;
    __int16 v22 = 2114;
    uint64_t v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Handling updated reminder from gizmo with summary \"%{public}@\" and identifier %{public}@", (uint8_t *)&v20, 0x16u);
  }
  if ([v9 isTaskCompleted])
  {
    [v9 taskCompletionDate];
    id v15 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v16 = [v8 updateReminder:v7];
    [v16 setCompletionDate:v15];
    id v17 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      id v19 = [v7 daCalendarItemUniqueIdentifier];
      int v20 = 138543618;
      id v21 = v19;
      __int16 v22 = 2114;
      uint64_t v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Reminder with identifier %{public}@ is completed, completion date is %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)handleReminderWithUniqueIdentifierFromGizmo:(id)a3 saveRequest:(id)a4 list:(id)a5 wrapper:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [v11 store];
  id v18 = 0;
  id v15 = [v14 fetchReminderWithDACalendarItemUniqueIdentifier:v10 inList:v13 error:&v18];

  id v16 = v18;
  if (v15)
  {
    [(NEKReminderStore *)self handleUpdatedReminderFromGizmo:v15 withSaveRequest:v11 withWrapper:v12];
  }
  else
  {
    id v17 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10006FCB4((uint64_t)v10, v17, v12);
    }
  }
}

- (id)deduplicateICSWrappers:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet set];
  id v5 = +[NSMutableOrderedSet orderedSet];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [v3 reverseObjectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v11 objectIdentifier];
        if ([v4 containsObject:v12])
        {
          id v13 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            __int16 v22 = v12;
            _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Received ICS wrappers with the same identifier %{public}@ in the same batch. Deduplicating. ", buf, 0xCu);
          }
        }
        else
        {
          [v4 addObject:v12];
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  id v14 = [v5 reverseObjectEnumerator];
  id v15 = [v14 allObjects];

  return v15;
}

- (id)listCacheForStore:(id)a3 wrappers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableSet set];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v33 + 1) + 8 * i) calendarIdentifier];
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v10);
  }
  v28 = v8;

  id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v39 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Going to build list cache for IDs %{public}@", buf, 0xCu);
  }
  id v15 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v16 = [v7 copy];
  id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
        __int16 v22 = +[NEKCalendarID listInStore:v5 withNEKCalendarID:v21];
        if (v22) {
          [v15 setObject:v22 forKeyedSubscript:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v18);
  }

  uint64_t v23 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = v23;
    id v25 = [v15 allKeys];
    *(_DWORD *)buf = 138543362;
    id v39 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Built list cache for wrappers %{public}@", buf, 0xCu);
  }
  id v26 = [v15 copy];

  return v26;
}

- (id)reminderCacheForStore:(id)a3 wrappers:(id)a4
{
  id v22 = a3;
  id v5 = a4;
  id v6 = +[NSMutableSet set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v24 + 1) + 8 * i) objectIdentifier];
        if ([v6 containsObject:v12])
        {
          id v13 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            long long v29 = v12;
            _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Received ICS wrappers with the same identifier %{public}@ in the same batch", buf, 0xCu);
          }
        }
        [v6 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }

  id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Going to build reminder cache for IDs %{public}@", buf, 0xCu);
  }
  id v15 = [v6 allObjects];
  id v23 = 0;
  id v16 = [v22 fetchRemindersWithDACalendarItemUniqueIdentifiers:v15 inList:0 error:&v23];
  id v17 = v23;

  if (!v16)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006FD84();
    }
    id v16 = +[NSDictionary dictionary];
  }
  id v18 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v18;
    long long v20 = [v16 allKeys];
    *(_DWORD *)buf = 138543362;
    long long v29 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Built reminder cache for wrappers %{public}@", buf, 0xCu);
  }

  return v16;
}

- (void)performUpdateWithICSWrappers:(id)a3 store:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    *(_DWORD *)buf = 67109120;
    LODWORD(v121) = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "performUpdateWithICSWrappers received %d items", buf, 8u);
  }
  id v13 = [(NEKReminderStore *)self saveRequestForStore:v9];
  id v14 = [(NEKReminderStore *)self deduplicateICSWrappers:v8];

  uint64_t v15 = [(NEKReminderStore *)self listCacheForStore:v9 wrappers:v14];
  v81 = v9;
  id v16 = v9;
  id v17 = (void *)v15;
  v82 = [(NEKReminderStore *)self reminderCacheForStore:v16 wrappers:v14];
  id v86 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v14 count]];
  id v88 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v14 count]];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id obj = v14;
  v83 = v13;
  v85 = v17;
  id v93 = [obj countByEnumeratingWithState:&v114 objects:v128 count:16];
  if (v93)
  {
    v91 = *(void **)v115;
    do
    {
      for (i = 0; i != v93; i = (char *)i + 1)
      {
        if (*(void **)v115 != v91) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v114 + 1) + 8 * i);
        long long v20 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          double v121 = *(double *)&v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received ICS wrapper: %{public}@", buf, 0xCu);
        }
        uint64_t v21 = *(NSObject **)(qword_1000C6CB0 + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          sub_10006D2A4(v126, v21, v19, &v127);
        }
        id v22 = [v19 calendarIdentifier];
        id v23 = [v17 objectForKeyedSubscript:v22];

        if (v23)
        {
          long long v24 = [v19 ICSData];

          long long v25 = *(NSObject **)(qword_1000C6CA8 + 8);
          BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
          if (v24)
          {
            if (v26)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Processing add/update from companion, or a new record from the watch", buf, 2u);
            }
            uint64_t v27 = [v19 oldCalendarIdentifier];
            if (!v27) {
              goto LABEL_25;
            }
            v28 = (void *)v27;
            long long v29 = [v19 calendarIdentifier];
            long long v30 = [v29 identifier];

            if (v30)
            {
              long long v31 = *(NSObject **)(qword_1000C6CA8 + 8);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                long long v32 = v31;
                long long v33 = [v19 oldCalendarIdentifier];
                long long v34 = [v19 calendarIdentifier];
                long long v35 = [v34 identifier];
                *(_DWORD *)buf = 138543618;
                double v121 = *(double *)&v33;
                __int16 v122 = 2114;
                v123 = v35;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Got an update/add for reminder, old list id = %{public}@, current list id = %{public}@", buf, 0x16u);
              }
              long long v36 = [v19 oldCalendarIdentifier];
              id v37 = [v19 calendarIdentifier];
              double v38 = [v37 identifier];
              unsigned __int8 v39 = [v36 isEqualToString:v38];

              id v40 = *(NSObject **)(qword_1000C6CA8 + 8);
              BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
              if (v39)
              {
                id v17 = v85;
                if (v41)
                {
                  v42 = v40;
                  v43 = [v19 oldCalendarIdentifier];
                  v44 = [v19 calendarIdentifier];
                  v45 = [v44 identifier];
                  *(_DWORD *)buf = 138543618;
                  double v121 = *(double *)&v43;
                  __int16 v122 = 2114;
                  v123 = v45;
                  _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Lists match, so reminder didn't move: old list id = %{public}@, current list id = %{public}@", buf, 0x16u);

                  id v17 = v85;
                }
              }
              else
              {
                if (v41)
                {
                  v55 = v40;
                  v56 = [v19 oldCalendarIdentifier];
                  v57 = [v19 calendarIdentifier];
                  v58 = [v57 identifier];
                  *(_DWORD *)buf = 138543618;
                  double v121 = *(double *)&v56;
                  __int16 v122 = 2114;
                  v123 = v58;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Lists don't match, so deleting from old list: old list id = %{public}@, current list id = %{public}@", buf, 0x16u);
                }
                [(NEKReminderStore *)self _ensureReminderInList:v23 saveRequest:v13 inICSWrapper:v19];
                id v17 = v85;
              }
            }
            else
            {
LABEL_25:
              v47 = *(NSObject **)(qword_1000C6CA8 + 8);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                v48 = v47;
                v49 = [v19 title];
                v50 = sub_10002D3E0(v49);
                v51 = [v19 calendarIdentifier];
                v52 = [v51 identifier];
                *(_DWORD *)buf = 138543618;
                double v121 = *(double *)&v50;
                __int16 v122 = 2114;
                v123 = v52;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Got an update/add for reminder \"%{public}@\", no old list id was sent, so this is from an old record map and falling back to old code to check and delete from any old list. The current list id = %{public}@", buf, 0x16u);

                id v13 = v83;
                id v17 = v85;
              }
              [(NEKReminderStore *)self _ensureReminderInList:v23 saveRequest:v13 inICSWrapper:v19];
            }
            [v86 addObject:v19];
            [v88 addObject:v23];
          }
          else
          {
            if (v26)
            {
              v53 = v25;
              v54 = [v19 objectIdentifier];
              *(_DWORD *)buf = 138543362;
              double v121 = *(double *)&v54;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Processing update from the watch, main identifier is %{public}@", buf, 0xCu);
            }
            v111[0] = _NSConcreteStackBlock;
            v111[1] = 3221225472;
            v111[2] = sub_100056E78;
            v111[3] = &unk_1000A90C8;
            v111[4] = v19;
            v111[5] = self;
            id v112 = v13;
            id v113 = v23;
            [v19 enumerateCalendarItemIdentifiersUsingBlock:v111];
          }
        }
        else
        {
          v46 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
            sub_10006FDEC(v124, v46, v19, &v125);
          }
        }
      }
      id v93 = [obj countByEnumeratingWithState:&v114 objects:v128 count:16];
    }
    while (v93);
  }

  id v59 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v86 count]];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v60 = v86;
  id v61 = [v60 countByEnumeratingWithState:&v107 objects:v119 count:16];
  contexta = v60;
  if (v61)
  {
    id v62 = v61;
    uint64_t v63 = *(void *)v108;
    do
    {
      for (j = 0; j != v62; j = (char *)j + 1)
      {
        if (*(void *)v108 != v63) {
          objc_enumerationMutation(contexta);
        }
        v65 = [*(id *)(*((void *)&v107 + 1) + 8 * (void)j) ICSData];
        [v59 addObject:v65];
      }
      id v60 = contexta;
      id v62 = [contexta countByEnumeratingWithState:&v107 objects:v119 count:16];
    }
    while (v62);
  }

  if ([v60 count])
  {
    v84 = (void *)os_transaction_create();
    kdebug_trace();
    double Current = CFAbsoluteTimeGetCurrent();
    v67 = +[NSMutableArray array];
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_100056F24;
    v101[3] = &unk_1000A9D40;
    id v102 = v82;
    id v90 = v60;
    id v103 = v90;
    id v104 = v13;
    id v105 = v88;
    id v68 = v67;
    id v106 = v68;
    [v59 enumerateObjectsUsingBlock:v101];
    kdebug_trace();
    double v69 = CFAbsoluteTimeGetCurrent();
    v70 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v121 = v69 - Current;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "ICS Import: %fs #perf", buf, 0xCu);
    }
    if ([v68 count])
    {
      uint64_t v71 = 0;
      v87 = v68;
      do
      {
        v72 = [v90 objectAtIndex:v71];
        uint64_t v94 = v71;
        v73 = [v68 objectAtIndex:v71];
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v74 = v73;
        id v75 = [v74 countByEnumeratingWithState:&v97 objects:v118 count:16];
        if (v75)
        {
          id v76 = v75;
          uint64_t v77 = *(void *)v98;
          do
          {
            for (k = 0; k != v76; k = (char *)k + 1)
            {
              if (*(void *)v98 != v77) {
                objc_enumerationMutation(v74);
              }
              uint64_t v79 = *(void *)(*((void *)&v97 + 1) + 8 * (void)k);
              [(NEKReminderStore *)self handleNewReminderChangeItem:v79 withWrapper:v72 session:v10];
            }
            id v76 = [v74 countByEnumeratingWithState:&v97 objects:v118 count:16];
          }
          while (v76);
        }

        uint64_t v71 = v94 + 1;
        id v68 = v87;
      }
      while (v94 + 1 < (unint64_t)[v87 count]);
    }

    id v13 = v83;
    id v60 = contexta;
  }
}

- (void)_ensureReminderInList:(id)a3 saveRequest:(id)a4 inICSWrapper:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7 && v8 && v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100057328;
    v12[3] = &unk_1000A9118;
    id v13 = v7;
    id v14 = v10;
    id v15 = v8;
    [v14 enumerateCalendarItemIdentifiersUsingBlock:v12];
  }
  else
  {
    uint64_t v11 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Input to _ensureReminderInList is nil (%@, %@, %@). Skipping.", buf, 0x20u);
    }
  }
}

- (void)applySidePropertiesToReminderChangeItem:(id)a3 withWrapper:(id)a4 session:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 daCalendarItemUniqueIdentifier];
  id v9 = [v7 externalIDForIdentifier:v8];

  id v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setting externalID %{public}@ for event with identifier %{public}@", (uint8_t *)&v12, 0x16u);
    }
    [v6 setExternalIdentifier:v9];
  }
  else if (v11)
  {
    int v12 = 138543362;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No externalID in metadata for event with identifier %{public}@", (uint8_t *)&v12, 0xCu);
  }
}

- (void)batchedEnumerateForChangeSet:(id)a3 changeType:(int)a4 forEntitiesOfClass:(Class)a5 withFetchBlock:(id)a6 withBlock:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  __int16 v14 = +[NSMutableArray arrayWithCapacity:10];
  id v15 = +[NSMutableArray arrayWithCapacity:10];
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x3032000000;
  long long v34 = sub_1000578D0;
  long long v35 = sub_1000578FC;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100057904;
  v26[3] = &unk_1000A9D68;
  id v16 = v12;
  id v29 = v16;
  id v17 = v14;
  id v27 = v17;
  id v18 = v13;
  id v30 = v18;
  id v19 = v15;
  id v28 = v19;
  long long v36 = objc_retainBlock(v26);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100057A38;
  v22[3] = &unk_1000A9D90;
  id v20 = v17;
  id v23 = v20;
  id v21 = v19;
  id v24 = v21;
  long long v25 = &v31;
  [v11 enumerateForChangeType:v10 forEntitiesOfClass:a5 withBlock:v22];
  (*(void (**)(void))(v32[5] + 16))();

  _Block_object_dispose(&v31, 8);
}

- (void)batchedEnumerateAccountsForStore:(id)a3 changeSet:(id)a4 changeType:(int)a5 withBlock:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  uint64_t v13 = objc_opt_class();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100057BD8;
  v15[3] = &unk_1000A9DB8;
  id v16 = v10;
  id v14 = v10;
  [(NEKReminderStore *)self batchedEnumerateForChangeSet:v12 changeType:v7 forEntitiesOfClass:v13 withFetchBlock:v15 withBlock:v11];
}

- (void)batchedEnumerateListsForStore:(id)a3 changeSet:(id)a4 changeType:(int)a5 withBlock:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  uint64_t v13 = objc_opt_class();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100057E60;
  v15[3] = &unk_1000A9DB8;
  id v16 = v10;
  id v14 = v10;
  [(NEKReminderStore *)self batchedEnumerateForChangeSet:v12 changeType:v7 forEntitiesOfClass:v13 withFetchBlock:v15 withBlock:v11];
}

- (void)batchedEnumerateRemindersForStore:(id)a3 changeSet:(id)a4 changeType:(int)a5 withBlock:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  uint64_t v13 = objc_opt_class();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000580E8;
  v15[3] = &unk_1000A9DB8;
  id v16 = v10;
  id v14 = v10;
  [(NEKReminderStore *)self batchedEnumerateForChangeSet:v12 changeType:v7 forEntitiesOfClass:v13 withFetchBlock:v15 withBlock:v11];
}

- (void)storeWrapperForCloudKitAccount:(id)a3 pipe:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEmpty])
  {
    id v8 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping storeWrapperForCloudKitAccount as changeSet is empty", buf, 2u);
    }
  }
  else if (sub_10000BC90())
  {
    id v9 = [(NEKReminderStore *)self freshEventStoreFor:@"storeWrapperForCloudKitAccount"];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000583C0;
    v10[3] = &unk_1000A9DE0;
    id v11 = v7;
    [(NEKReminderStore *)self batchedEnumerateAccountsForStore:v9 changeSet:v6 changeType:3 withBlock:v10];
  }
}

- (void)listWrappersForChangeSet:(id)a3 pipe:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEmpty])
  {
    id v8 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping listWrappersForChangeSet as changeSet is empty", buf, 2u);
    }
  }
  else
  {
    id v9 = [(NEKReminderStore *)self freshEventStoreFor:@"listWrappersForChangeSet"];
    [(NEKReminderStore *)self getDefaultListForStore:v9];
    *(void *)buf = 0;
    id v27 = buf;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_10005881C;
    id v21 = &unk_1000A9E08;
    id v22 = self;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = v10;
    long long v25 = buf;
    id v11 = v7;
    id v24 = v11;
    [(NEKReminderStore *)self batchedEnumerateListsForStore:v9 changeSet:v6 changeType:3 withBlock:&v18];
    id v12 = 0;
    if (!v27[24])
    {
      if (v10)
      {
        uint64_t v13 = -[NEKReminderStore wrapperForList:useAttributes:](self, "wrapperForList:useAttributes:", v10, 0, v18, v19, v20, v21, v22, v23);
        id v12 = v13;
        if (v13)
        {
          [v13 setIsDefaultTaskCalendar:1];
          if ([v11 push:v12])
          {
            id v14 = *(id *)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = [v10 name];
              sub_10002D3E0(v15);
              id v16 = (id)objc_claimAutoreleasedReturnValue();
              id v17 = [v10 objectID];
              *(_DWORD *)id v30 = 138543618;
              id v31 = v16;
              __int16 v32 = 2114;
              uint64_t v33 = v17;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Marking default list in wrapper to list with name %{public}@, identifier %{public}@", v30, 0x16u);
            }
          }
        }
      }
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)remindersWrappersForChangeSet:(id)a3 skipAccountDeletions:(BOOL)a4 pipe:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v8 isEmpty])
  {
    id v10 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Skipping remindersWrappersForChangeSet as changeSet is empty", v13, 2u);
    }
  }
  else
  {
    id v11 = [v8 deletionMap];
    [(NEKReminderStore *)self deletionWrappersForChangeSet:v8 deletedReminderAndListMapping:v11 skipAccountDeletions:v6 pipe:v9];

    id v12 = [v8 moveMap];
    [(NEKReminderStore *)self ICSWrappersForChangeSet:v8 movedReminderAndListMapping:v12 pipe:v9];
  }
}

- (void)ICSWrappersForChangeSet:(id)a3 movedReminderAndListMapping:(id)a4 pipe:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [NEKSyncWindow alloc];
  id v12 = [(NEKStore *)self environment];
  uint64_t v13 = [v12 tinyStore];
  id v14 = [(NEKSyncWindow *)v11 initForFullSync:0 tinyStore:v13];

  id v15 = [(NEKReminderStore *)self freshEventStoreFor:@"ICSWrappersForChangeSet(Reminders)"];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100058D70;
  v26[3] = &unk_1000A9E30;
  id v16 = v14;
  id v27 = v16;
  uint64_t v28 = self;
  id v17 = v9;
  id v29 = v17;
  [(NEKReminderStore *)self batchedEnumerateRemindersForStore:v15 changeSet:v10 changeType:1 withBlock:v26];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100058E7C;
  v21[3] = &unk_1000A9E58;
  id v22 = v16;
  id v23 = self;
  id v24 = v8;
  id v25 = v17;
  id v18 = v17;
  id v19 = v8;
  id v20 = v16;
  [(NEKReminderStore *)self batchedEnumerateRemindersForStore:v15 changeSet:v10 changeType:2 withBlock:v21];
}

- (void)deletionWrappersForChangeSet:(id)a3 deletedReminderAndListMapping:(id)a4 skipAccountDeletions:(BOOL)a5 pipe:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v32 = a6;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v31 = v9;
  id v11 = [v9 deletes];
  id v34 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v34)
  {
    uint64_t v13 = *(void *)v36;
    *(void *)&long long v12 = 138543362;
    long long v30 = v12;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (v7)
        {
          id v16 = [*(id *)(*((void *)&v35 + 1) + 8 * i) entityName];
          id v17 = +[REMAccount cdEntityName];
          unsigned __int8 v18 = [v16 isEqualToString:v17];

          if (v18) {
            continue;
          }
        }
        id v20 = +[NEKDeletionWrapper deletionWrapperForObjectID:v15 deletedReminderAndListMapping:v10];
        if (v20)
        {
          id v21 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v40 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Deletion wrapper: %@", buf, 0xCu);
          }
          if ((objc_msgSend(v32, "push:", v20, v30) & 1) == 0)
          {

            goto LABEL_19;
          }
        }
        else
        {
          id v22 = [v15 entityName];
          +[REMReminder cdEntityName];
          uint64_t v33 = v19;
          uint64_t v23 = v13;
          id v24 = v11;
          BOOL v25 = v7;
          id v27 = v26 = v10;
          unsigned int v28 = [v22 isEqualToString:v27];

          id v10 = v26;
          BOOL v7 = v25;
          id v11 = v24;
          uint64_t v13 = v23;
          id v19 = v33;

          if (v28)
          {
            id v29 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v30;
              id v40 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Could not create deletion wrapper for recordID: %{public}@", buf, 0xCu);
            }
          }
        }
      }
      id v34 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v34);
  }
LABEL_19:
}

- (id)wrapperForList:(id)a3 useAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (sub_10000BD50(v5)) {
    BOOL v6 = [[NEKCalendarWrapper alloc] initWithList:v5 useAttributes:v4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)wrapperForList:(id)a3
{
  return [(NEKReminderStore *)self wrapperForList:a3 useAttributes:1];
}

- (id)wrapperForReminder:(id)a3 oldListIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_10000BDFC(v6))
  {
    id v8 = +[NEKICSWrapper wrapperForReminder:v6 oldListIdentifier:v7 store:self];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_deleteAccountWithIdentifier:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleting account with identifier %{public}@", buf, 0xCu);
  }
  id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  if (!v9 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_FAULT)) {
    sub_100070390();
  }
  id v10 = +[REMAccount objectIDWithUUID:v9];
  id v16 = 0;
  id v11 = [v7 fetchAccountWithObjectID:v10 error:&v16];
  id v12 = v16;
  if (v11)
  {
    if ([v11 type] == (id)1)
    {
      uint64_t v13 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cannot delete; account with identifier %{public}@ is a local account",
          buf,
          0xCu);
      }
    }
    else if ([v11 type] == (id)5)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_100070328();
      }
    }
    else
    {
      id v14 = [(NEKReminderStore *)self saveRequestForStore:v7];
      id v15 = [v14 updateAccount:v11];
      [v15 removeFromStore];
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_1000702C0();
  }
}

- (void)_deleteListWithIdentifier:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  if (!v8 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_FAULT)) {
    sub_10007046C();
  }
  id v9 = +[REMList objectIDWithUUID:v8];
  id v10 = [(NEKReminderStore *)self saveRequestForStore:v7 needsPurgeDeletedObjectsAfterSave:1];
  id v14 = 0;
  id v11 = [v7 fetchListWithObjectID:v9 error:&v14];

  id v12 = v14;
  if (v11)
  {
    uint64_t v13 = [v10 updateList:v11];
    [v13 removeFromParent];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_100070404();
  }
}

- (void)_deleteReminderWithIdentifier:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NEKReminderStore *)self saveRequestForStore:v7];
  id v12 = 0;
  id v9 = [v7 fetchReminderWithDACalendarItemUniqueIdentifier:v6 inList:0 error:&v12];

  id v10 = v12;
  if (v9)
  {
    id v11 = [v8 updateReminder:v9];
    [v11 removeFromList];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_1000704E0();
  }
}

- (BOOL)_updateAccount:(id)a3 withSourceWrapper:(id)a4 store:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 store];
  id v10 = [(NEKReminderStore *)self saveRequestForStore:v9];

  id v11 = [v7 attributes];

  LOBYTE(v7) = +[NEKSourceAttributes configureAccount:v8 withSaveRequest:v10 withAttributes:v11];
  return (char)v7;
}

- (void)_createAccountForWrapper:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v8 = [(NEKReminderStore *)self saveRequestForStore:a4];
  id v7 = [v6 attributes];

  +[NEKSourceAttributes createAccountWithSaveRequest:v8 withAttributes:v7];
}

- (BOOL)_checkAndSetDefaultList:(id)a3 calendarWrapper:(id)a4 store:(id)a5
{
  return 0;
}

- (BOOL)_updateList:(id)a3 withCalendarWrapper:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 attributes];
  id v9 = v8;
  if (v8 && [v8 supportedEntityTypes] == 2)
  {
    id v10 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      id v12 = [v7 attributes];
      uint64_t v13 = [v12 title];
      id v14 = sub_10002D3E0(v13);
      id v15 = [v7 calendarIdentifier];
      int v22 = 138543618;
      uint64_t v23 = v14;
      __int16 v24 = 2114;
      BOOL v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating list with title %{public}@, identifier %{public}@", (uint8_t *)&v22, 0x16u);
    }
    id v16 = [v6 store];
    id v17 = [(NEKReminderStore *)self saveRequestForStore:v16];

    unsigned __int8 v18 = +[NEKCalendarAttributes configureList:v6 withSaveRequest:v17 withAttributes:v9];
  }
  else
  {
    unsigned __int8 v18 = 0;
  }
  id v19 = [v6 store];
  unsigned __int8 v20 = [(NEKReminderStore *)self _checkAndSetDefaultList:v6 calendarWrapper:v7 store:v19];

  return v18 | v20;
}

- (id)_createListForWrapper:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 attributes];
  id v9 = v8;
  if (!v8 || [v8 supportedEntityTypes] != 2)
  {
    unsigned __int8 v20 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v20;
      int v22 = [v6 calendarIdentifier];
      uint64_t v23 = [v6 storeIdentifier];
      int v25 = 138543618;
      id v26 = v22;
      __int16 v27 = 2114;
      unsigned int v28 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Asked to set a nonexistent list as the default. Ignoring. List identifier = %{public}@, account identifier = %{public}@", (uint8_t *)&v25, 0x16u);
    }
    goto LABEL_11;
  }
  id v10 = [v6 storeIdentifier];

  if (!v10
    || ([v6 storeIdentifier],
        id v11 = objc_claimAutoreleasedReturnValue(),
        +[NEKSourceID accountForStore:v7 identifier:v11],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    id v12 = [v7 eks_localAccount];
    if (!v12)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_100070548();
      }
LABEL_11:
      id v14 = 0;
      goto LABEL_12;
    }
  }
  uint64_t v13 = [(NEKReminderStore *)self saveRequestForStore:v7];
  id v14 = +[NEKCalendarAttributes createListInAccount:v12 withSaveRequest:v13 withAttributes:v9];
  id v15 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    id v17 = [v12 name];
    unsigned __int8 v18 = sub_10002D3E0(v17);
    id v19 = [v14 objectID];
    int v25 = 138543618;
    id v26 = v18;
    __int16 v27 = 2114;
    unsigned int v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Created list with title %{public}@, identifier %{public}@", (uint8_t *)&v25, 0x16u);
  }
LABEL_12:

  return v14;
}

- (void)deleteAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = [v4 objectID];
      int v11 = 138543362;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleting account with identifier %{public}@", (uint8_t *)&v11, 0xCu);
    }
    id v8 = [v4 store];
    id v9 = [(NEKReminderStore *)self saveRequestForStore:v8];

    id v10 = [v9 updateAccount:v4];
    [v10 removeFromStore];
  }
}

- (void)deleteList:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 store];
    id v7 = [(NEKReminderStore *)self saveRequestForStore:v5 needsPurgeDeletedObjectsAfterSave:1];

    id v6 = [v7 updateList:v4];

    [v6 removeFromParent];
  }
}

- (void)deleteReminder:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 store];
    id v6 = [(NEKReminderStore *)self saveRequestForStore:v5];

    id v7 = [v6 updateReminder:v4];

    [v7 removeFromList];
    id v9 = 0;
    [v6 saveSynchronouslyWithError:&v9];
    id v8 = v9;
    if (v8)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_100070588();
      }
    }
  }
}

- (NSMapTable)saveRequests
{
  return self->_saveRequests;
}

- (void)setSaveRequests:(id)a3
{
}

- (BOOL)saveRequestsNeedPurgeDeletedObjectsAfterSave
{
  return self->_saveRequestsNeedPurgeDeletedObjectsAfterSave;
}

- (void)setSaveRequestsNeedPurgeDeletedObjectsAfterSave:(BOOL)a3
{
  self->_saveRequestsNeedPurgeDeletedObjectsAfterSave = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveRequests, 0);
  objc_storeStrong((id *)&self->_pipeQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end