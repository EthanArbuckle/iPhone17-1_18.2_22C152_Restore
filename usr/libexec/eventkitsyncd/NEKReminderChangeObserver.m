@interface NEKReminderChangeObserver
- (BOOL)_fetchChangesInto:(id)a3 from:(id)a4 inside:(id)a5 outDeletedReminderAndListMapping:(id *)a6 outMovedReminderAndListMapping:(id *)a7;
- (BOOL)allCloudKitAccountsInto:(id)a3;
- (BOOL)allListsInto:(id)a3;
- (BOOL)allRemindersInto:(id)a3 filter:(id)a4 window:(id)a5;
- (NEKReminderChangeObserver)initWithEnvironment:(id)a3;
- (NEKReminderChangeObserver)initWithQueue:(id)a3 environment:(id)a4;
- (NEKReminderStore)weakReminderDatabaseController;
- (id)_reminderListKey;
- (id)_sequenceKey;
- (id)changeStateMap;
- (id)fetchReminderChangeSet;
- (id)loadChangeTrackingStateMapWithStore:(id)a3;
- (id)previousDefaultReminderListID;
- (id)reminderDatabaseController;
- (void)_sendChangesIfAvailable;
- (void)beginObservingChanges;
- (void)dealloc;
- (void)notifyForDatabaseUpdates;
- (void)notifyForDatabaseUpdatesIfNeeded;
- (void)saveChangeTrackingStateMap:(id)a3;
- (void)setPreviousDefaultReminderListID:(id)a3;
- (void)setWeakReminderDatabaseController:(id)a3;
- (void)stopObservingChanges;
- (void)storeDidChange;
@end

@implementation NEKReminderChangeObserver

- (NEKReminderChangeObserver)initWithEnvironment:(id)a3
{
  return 0;
}

- (NEKReminderChangeObserver)initWithQueue:(id)a3 environment:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEKReminderChangeObserver;
  v8 = [(NEKChangeObserver *)&v11 initWithEnvironment:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    [(NEKReminderChangeObserver *)v9 beginObservingChanges];
  }

  return v9;
}

- (id)_reminderListKey
{
  return @"reminderListId";
}

- (void)dealloc
{
  [(NEKReminderChangeObserver *)self stopObservingChanges];
  v3.receiver = self;
  v3.super_class = (Class)NEKReminderChangeObserver;
  [(NEKReminderChangeObserver *)&v3 dealloc];
}

- (id)reminderDatabaseController
{
  return [(NEKReminderChangeObserver *)self weakReminderDatabaseController];
}

- (void)beginObservingChanges
{
  id v4 = +[NSNotificationCenter defaultCenter];
  objc_super v3 = +[REMStore storeDidChangeNotificationName];
  [v4 addObserver:self selector:"storeDidChange" name:v3 object:0];
}

- (void)stopObservingChanges
{
  id v4 = +[NSNotificationCenter defaultCenter];
  objc_super v3 = +[REMStore storeDidChangeNotificationName];
  [v4 removeObserver:self name:v3 object:0];
}

- (void)storeDidChange
{
  objc_initWeak(&location, self);
  objc_super v3 = (void *)os_transaction_create();
  id v4 = [(NEKChangeObserver *)self environment];
  v5 = [v4 syncCoordinator];
  unsigned int v6 = [v5 okToPerformDeltaSync];

  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100061EE0;
    block[3] = &unk_1000A9140;
    objc_copyWeak(&v12, &location);
    id v11 = v3;
    dispatch_async(queue, block);

    objc_destroyWeak(&v12);
  }
  else
  {
    v8 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring delta sync request as sync coordinator says it is not time.", v9, 2u);
    }
  }

  objc_destroyWeak(&location);
}

- (void)notifyForDatabaseUpdatesIfNeeded
{
}

- (void)notifyForDatabaseUpdates
{
  objc_super v3 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    unsigned int v6 = "-[NEKReminderChangeObserver notifyForDatabaseUpdates]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(NEKChangeObserver *)self delegate];
  [v4 changeObserverDidObserveChanges:self];
}

- (BOOL)allCloudKitAccountsInto:(id)a3
{
  id v3 = a3;
  id v4 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v31 = "-[NEKReminderChangeObserver allCloudKitAccountsInto:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (sub_10000BC90())
  {
    int v5 = +[REMStore eks_storeForSyncing];
    id v26 = 0;
    unsigned int v6 = [v5 fetchAccountsWithError:&v26];
    id v7 = v26;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      id v20 = v7;
      v21 = v5;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v13 type] == (id)2)
          {
            v14 = [[NEKSourceWrapper alloc] initWithAccount:v13];
            v15 = *(void **)(qword_1000C6CA8 + 8);
            if (v14)
            {
              if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_DEFAULT))
              {
                v16 = v15;
                v17 = [v13 remObjectID];
                *(_DWORD *)v27 = 138543362;
                v28 = v17;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sending source wrapper for CloudKit account %{public}@", v27, 0xCu);
              }
              if (![v3 push:v14])
              {

                BOOL v18 = 0;
                goto LABEL_22;
              }
            }
            else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
            {
              sub_10007084C(buf, v15, v13, &v31);
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v10);
      BOOL v18 = 1;
LABEL_22:
      id v7 = v20;
      int v5 = v21;
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)allListsInto:(id)a3
{
  id v49 = a3;
  id v4 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v61 = "-[NEKReminderChangeObserver allListsInto:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  int v5 = +[REMStore eks_storeForSyncing];
  id v59 = 0;
  unsigned int v6 = [v5 fetchAccountsWithError:&v59];
  id v7 = v59;
  id v8 = [(NEKReminderChangeObserver *)self reminderDatabaseController];
  id v9 = [v8 getDefaultListForStore:v5];

  if (v7)
  {
    id v10 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000708D0((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v18 = v6;
    id v43 = [v18 countByEnumeratingWithState:&v55 objects:v65 count:16];
    id v7 = 0;
    if (v43)
    {
      uint64_t v19 = *(void *)v56;
      uint64_t v41 = *(void *)v56;
      v42 = v5;
      v45 = v18;
      v46 = v6;
      do
      {
        uint64_t v20 = 0;
        v21 = v7;
        do
        {
          if (*(void *)v56 != v19) {
            objc_enumerationMutation(v18);
          }
          uint64_t v44 = v20;
          long long v22 = *(void **)(*((void *)&v55 + 1) + 8 * v20);
          id v54 = v21;
          long long v23 = [v22 fetchListsWithError:&v54];
          id v48 = v54;

          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v24 = v23;
          id v25 = [v24 countByEnumeratingWithState:&v50 objects:v64 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v51;
            while (2)
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v51 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                if (sub_10000BD50(v29))
                {
                  v30 = [[NEKCalendarWrapper alloc] initWithList:v29];
                  v31 = [v29 remObjectID];
                  v32 = [v9 remObjectID];
                  unsigned int v33 = [v31 isEqual:v32];

                  if (v33)
                  {
                    v34 = *(NSObject **)(qword_1000C6CA8 + 8);
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                    {
                      v35 = v34;
                      v36 = [v29 name];
                      sub_10002D3E0(v36);
                      v37 = (char *)objc_claimAutoreleasedReturnValue();
                      v38 = [v29 objectID];
                      *(_DWORD *)buf = 138543618;
                      v61 = v37;
                      __int16 v62 = 2114;
                      v63 = v38;
                      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Marking default list in wrapper to list with name %{public}@, identifier %{public}@", buf, 0x16u);
                    }
                    -[NEKCalendarWrapper setIsDefaultTaskCalendar:](v30, "setIsDefaultTaskCalendar:", 1, v41);
                  }
                  unsigned int v39 = [v49 push:v30, v41];

                  if (!v39)
                  {

                    BOOL v17 = 0;
                    int v5 = v42;
                    unsigned int v6 = v46;
                    id v7 = v48;
                    goto LABEL_29;
                  }
                }
              }
              id v26 = [v24 countByEnumeratingWithState:&v50 objects:v64 count:16];
              if (v26) {
                continue;
              }
              break;
            }
          }

          uint64_t v20 = v44 + 1;
          id v7 = v48;
          v21 = v48;
          id v18 = v45;
          unsigned int v6 = v46;
          uint64_t v19 = v41;
        }
        while ((id)(v44 + 1) != v43);
        int v5 = v42;
        id v43 = [v45 countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v43);
    }
  }
  BOOL v17 = 1;
LABEL_29:

  return v17;
}

- (BOOL)allRemindersInto:(id)a3 filter:(id)a4 window:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[NEKReminderChangeObserver allRemindersInto:filter:window:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v12 = +[REMStore eks_storeForSyncing];
  uint64_t v13 = [(NEKReminderChangeObserver *)self reminderDatabaseController];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100062980;
  v19[3] = &unk_1000A9F58;
  id v14 = v10;
  id v20 = v14;
  id v15 = v9;
  id v23 = v15;
  id v16 = v8;
  id v21 = v16;
  id v17 = v13;
  id v22 = v17;
  p_long long buf = &buf;
  [v12 enumerateAllRemindersWithBlock:v19];
  LOBYTE(v13) = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return (char)v13;
}

- (id)fetchReminderChangeSet
{
  id v3 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446722;
    v37 = "NEKReminderChangeObserver.m";
    __int16 v38 = 1024;
    int v39 = 305;
    __int16 v40 = 2080;
    uint64_t v41 = "-[NEKReminderChangeObserver fetchReminderChangeSet]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", buf, 0x1Cu);
  }
  id v4 = +[NEKChangeSet changeSetForReminder];
  int v5 = [(NEKReminderChangeObserver *)self reminderDatabaseController];
  [v4 setTruncated:0];
  id v7 = +[REMStore eks_storeForSyncing];
  id v8 = [(NEKReminderChangeObserver *)self loadChangeTrackingStateMapWithStore:v7];

  id v9 = [v8 deletedAccountIDsFromLoadedMap];
  if ([v8 hasChangeTrackingTokens])
  {
    id v33 = 0;
    id v34 = 0;
    unsigned __int8 v10 = [(NEKReminderChangeObserver *)self _fetchChangesInto:v4 from:v8 inside:v5 outDeletedReminderAndListMapping:&v34 outMovedReminderAndListMapping:&v33];
    id v11 = v34;
    id v12 = v33;
    if (v10)
    {
      [v4 setDeletionMap:v11];
      [v4 setMoveMap:v12];
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
    {
      sub_10007093C();
    }
  }
  else
  {
    uint64_t v13 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Pulled nil from changeTrackingStateMap.", buf, 2u);
    }
    if (self->_sawSeqnoFailure)
    {
      id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136446210;
        v37 = "-[NEKReminderChangeObserver fetchReminderChangeSet]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Saw sequence number failure already. Still waiting for corrective sync to complete.", buf, 0xCu);
      }
      id v15 = v4;
      uint64_t v16 = 0;
    }
    else
    {
      self->_sawSeqnoFailure = 1;
      id v15 = v4;
      uint64_t v16 = 1;
    }
    [v15 setTruncated:v16];
    id v12 = 0;
    id v11 = 0;
  }
  if ([v9 count])
  {
    id v17 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      v37 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Synthesizing delete for REMAccount %{public}@", buf, 0xCu);
    }
    id v18 = [v4 deletes:v6, v5];
    id v19 = [v18 mutableCopy];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v20 = v9;
    id v21 = [v20 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          [v19 addObject:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        }
        id v22 = [v20 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v22);
    }

    id v25 = [v19 copy];
    [v4 setDeletes:v25];

    unsigned int v6 = v27;
    int v5 = v28;
  }

  return v4;
}

- (BOOL)_fetchChangesInto:(id)a3 from:(id)a4 inside:(id)a5 outDeletedReminderAndListMapping:(id *)a6 outMovedReminderAndListMapping:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  self->_sawSeqnoFailure = 0;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  objc_initWeak(location, self);
  uint64_t v38 = 0;
  int v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = sub_100063188;
  v42 = sub_100063198;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100063188;
  v36 = sub_100063198;
  id v37 = 0;
  kdebug_trace();
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000631A0;
  v23[3] = &unk_1000A9F80;
  long long v29 = &v38;
  long long v30 = &v32;
  id v16 = v12;
  id v24 = v16;
  id v17 = v13;
  id v25 = v17;
  uint64_t v26 = self;
  id v18 = v14;
  id v27 = v18;
  objc_copyWeak(&v31, location);
  id v19 = v15;
  v28 = v19;
  [v17 fetchChangedObjectIDs:v23];
  if (a6) {
    *a6 = (id) v39[5];
  }
  if (a7) {
    *a7 = (id) v33[5];
  }
  dispatch_time_t v20 = dispatch_time(0, 1200000000000);
  intptr_t v21 = dispatch_semaphore_wait(v19, v20);
  if (v21 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
    sub_100070970();
  }

  objc_destroyWeak(&v31);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  objc_destroyWeak(location);

  return v21 == 0;
}

- (id)_sequenceKey
{
  return @"com.apple.eventkitsync.changeobserver.reminderkit.sequencenumber";
}

- (id)loadChangeTrackingStateMapWithStore:(id)a3
{
  id v4 = a3;
  int v5 = [(NEKChangeObserver *)self environment];
  unsigned int v6 = [v5 tinyStore];
  id v7 = [(NEKReminderChangeObserver *)self _sequenceKey];
  id v8 = [v6 getStringValueForKey:v7 default:0];

  if (v8
    && (id v9 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v8 options:0]) != 0)
  {
    unsigned __int8 v10 = v9;
    id v11 = [NEKReminderChangeTrackingStateMap alloc];
    id v12 = [(NEKChangeObserver *)self environment];
    id v13 = [v12 clientName];
    id v14 = [(NEKReminderChangeTrackingStateMap *)v11 initWithData:v10 store:v4 clientName:v13];

    dispatch_semaphore_t v15 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded change tracking state map %@", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    id v14 = objc_alloc_init(NEKReminderChangeTrackingStateMap);
  }

  return v14;
}

- (void)saveChangeTrackingStateMap:(id)a3
{
  id v4 = [a3 persistToData:0];
  int v5 = [v4 base64EncodedStringWithOptions:0];
  unsigned int v6 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Saved change tracking state map %@", (uint8_t *)&v11, 0xCu);
  }
  id v7 = [(NEKChangeObserver *)self environment];
  id v8 = [v7 tinyStore];
  if (v5) {
    CFStringRef v9 = v5;
  }
  else {
    CFStringRef v9 = &stru_1000AB888;
  }
  unsigned __int8 v10 = [(NEKReminderChangeObserver *)self _sequenceKey];
  [v8 setStringValue:v9 forKey:v10];
}

- (id)previousDefaultReminderListID
{
  id v3 = [(NEKChangeObserver *)self environment];
  id v4 = [v3 tinyStore];
  int v5 = [(NEKReminderChangeObserver *)self _reminderListKey];
  unsigned int v6 = [v4 getStringValueForKey:v5 default:0];

  if (v6)
  {
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
    if (!v7)
    {
      id v8 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_1000709D8((uint64_t)v6, v8);
      }
    }
    CFStringRef v9 = +[REMList objectIDWithUUID:v7];
  }
  else
  {
    CFStringRef v9 = 0;
  }

  return v9;
}

- (void)setPreviousDefaultReminderListID:(id)a3
{
  id v4 = a3;
  id v9 = [(NEKChangeObserver *)self environment];
  int v5 = [v9 tinyStore];
  unsigned int v6 = [v4 uuid];

  id v7 = [v6 UUIDString];
  id v8 = [(NEKReminderChangeObserver *)self _reminderListKey];
  [v5 setStringValue:v7 forKey:v8];
}

- (void)_sendChangesIfAvailable
{
}

- (id)changeStateMap
{
  id v3 = objc_alloc_init(NEKReminderChangeTrackingStateMap);
  id v4 = +[REMStore eks_storeForSyncing];
  int v5 = [(NEKChangeObserver *)self environment];
  unsigned int v6 = [v5 clientName];
  [(NEKReminderChangeTrackingStateMap *)v3 beginTrackingFromNowForStore:v4 clientName:v6];

  return v3;
}

- (NEKReminderStore)weakReminderDatabaseController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakReminderDatabaseController);

  return (NEKReminderStore *)WeakRetained;
}

- (void)setWeakReminderDatabaseController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakReminderDatabaseController);
  objc_storeStrong((id *)&self->_changeTrackingStateMap, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end