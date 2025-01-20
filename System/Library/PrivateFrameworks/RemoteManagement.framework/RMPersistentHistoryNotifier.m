@interface RMPersistentHistoryNotifier
+ (id)sharedQueryQueue;
- (BOOL)hasStarted;
- (BOOL)queryNeeded;
- (BOOL)shouldUsePersistentHistoryToken;
- (NSManagedObjectContext)context;
- (NSPersistentHistoryToken)persistentHistoryToken;
- (NSSet)ignoredTransactionAuthors;
- (NSSet)interestingEntities;
- (RMPersistentHistoryNotifier)initWithContext:(id)a3;
- (RMPersistentHistoryNotifier)initWithPersistentHistoryToken:(id)a3 context:(id)a4;
- (RMPersistentHistoryNotifierDelegate)delegate;
- (void)_delayedQuery;
- (void)_managedObjectContextDidSave:(id)a3;
- (void)_queryForTransactionsWithCompletion:(id)a3;
- (void)_scheduleQueryForTransactions;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setIgnoredTransactionAuthors:(id)a3;
- (void)setInterestingEntities:(id)a3;
- (void)setPersistentHistoryToken:(id)a3;
- (void)setQueryNeeded:(BOOL)a3;
- (void)start;
@end

@implementation RMPersistentHistoryNotifier

- (RMPersistentHistoryNotifier)initWithPersistentHistoryToken:(id)a3 context:(id)a4
{
  id v6 = a3;
  v7 = [(RMPersistentHistoryNotifier *)self initWithContext:a4];
  if (v7)
  {
    v8 = (NSPersistentHistoryToken *)[v6 copy];
    persistentHistoryToken = v7->_persistentHistoryToken;
    v7->_persistentHistoryToken = v8;

    v7->_shouldUsePersistentHistoryToken = 1;
    v10 = (NSConditionLock *)[objc_alloc((Class)NSConditionLock) initWithCondition:0];
    queryCondition = v7->_queryCondition;
    v7->_queryCondition = v10;

    v7->_queryNeeded = 0;
  }

  return v7;
}

- (RMPersistentHistoryNotifier)initWithContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMPersistentHistoryNotifier;
  id v6 = [(RMPersistentHistoryNotifier *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_shouldUsePersistentHistoryToken = 0;
    v8 = (NSConditionLock *)[objc_alloc((Class)NSConditionLock) initWithCondition:0];
    queryCondition = v7->_queryCondition;
    v7->_queryCondition = v8;

    v7->_queryNeeded = 0;
  }

  return v7;
}

- (void)dealloc
{
  if ([(RMPersistentHistoryNotifier *)self hasStarted]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stopped persistent history notifier (%p).", buf, 0xCu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RMPersistentHistoryNotifier;
  [(RMPersistentHistoryNotifier *)&v3 dealloc];
}

+ (id)sharedQueryQueue
{
  if (qword_1000DB2F8 != -1) {
    dispatch_once(&qword_1000DB2F8, &stru_1000C6538);
  }
  v2 = (void *)qword_1000DB2F0;

  return v2;
}

- (void)start
{
  if ([(RMPersistentHistoryNotifier *)self hasStarted])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100058C6C();
    }
  }
  else
  {
    objc_super v3 = _os_activity_create((void *)&_mh_execute_header, "Starting persistent history notifier", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v11.opaque[0] = 0;
    v11.opaque[1] = 0;
    os_activity_scope_enter(v3, &v11);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100058CDC();
    }
    [(RMPersistentHistoryNotifier *)self setHasStarted:1];
    if (![(RMPersistentHistoryNotifier *)self shouldUsePersistentHistoryToken])
    {
      v4 = [(RMPersistentHistoryNotifier *)self persistentHistoryToken];
      BOOL v5 = v4 == 0;

      if (v5)
      {
        id v6 = [(RMPersistentHistoryNotifier *)self context];
        v7 = [v6 persistentStoreCoordinator];

        v8 = [v7 persistentStores];
        v9 = [v7 currentPersistentHistoryTokenFromStores:v8];
        [(RMPersistentHistoryNotifier *)self setPersistentHistoryToken:v9];
      }
    }
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"_managedObjectContextDidSave:" name:NSManagedObjectContextDidSaveNotification object:0];

    [(RMPersistentHistoryNotifier *)self _scheduleQueryForTransactions];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Started persistent history notifier (%p).", buf, 0xCu);
    }
    os_activity_scope_leave(&v11);
  }
}

- (void)_managedObjectContextDidSave:(id)a3
{
  v4 = [a3 object];
  BOOL v5 = [(RMPersistentHistoryNotifier *)self context];
  id v6 = [v4 persistentStoreCoordinator];
  v7 = [v5 persistentStoreCoordinator];

  if (v6 == v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100058D4C();
    }
    [(RMPersistentHistoryNotifier *)self _scheduleQueryForTransactions];
  }
}

- (void)_scheduleQueryForTransactions
{
  objc_super v3 = self->_queryCondition;
  [(NSConditionLock *)v3 lock];
  NSInteger v4 = [(NSConditionLock *)self->_queryCondition condition];
  switch(v4)
  {
    case 2:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100058EB4();
      }
      [(RMPersistentHistoryNotifier *)self setQueryNeeded:1];
      BOOL v5 = v3;
      uint64_t v6 = 2;
      goto LABEL_13;
    case 1:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100058E44();
      }
      BOOL v5 = v3;
      uint64_t v6 = 1;
LABEL_13:
      [(NSConditionLock *)v5 unlockWithCondition:v6];
      break;
    case 0:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100058DD4();
      }
      [(NSConditionLock *)v3 unlockWithCondition:1];
      [(RMPersistentHistoryNotifier *)self _delayedQuery];
      break;
  }
}

- (void)_delayedQuery
{
  objc_super v3 = self->_queryCondition;
  objc_initWeak(&location, self);
  [(NSConditionLock *)v3 lockWhenCondition:1];
  [(NSConditionLock *)v3 unlockWithCondition:2];
  NSInteger v4 = +[RMPersistentHistoryNotifier sharedQueryQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100057D48;
  v6[3] = &unk_1000C5058;
  objc_copyWeak(&v8, &location);
  BOOL v5 = v3;
  v7 = v5;
  [v4 addOperationWithBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_queryForTransactionsWithCompletion:(id)a3
{
  v34 = (void (**)(void))a3;
  v36 = self;
  v35 = [(RMPersistentHistoryNotifier *)self delegate];
  char v4 = objc_opt_respondsToSelector();
  char v5 = objc_opt_respondsToSelector();
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = sub_10005873C;
  v95 = sub_10005874C;
  id v96 = 0;
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x3032000000;
  v88 = sub_10005873C;
  v89 = sub_10005874C;
  id v90 = 0;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = sub_10005873C;
  v83 = sub_10005874C;
  id v84 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = sub_10005873C;
  v77 = sub_10005874C;
  id v78 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  char v72 = 0;
  [(RMPersistentHistoryNotifier *)v36 context];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100058754;
  v59[3] = &unk_1000C6560;
  char v67 = v4 & 1;
  char v68 = v5 & 1;
  id v60 = (id)objc_claimAutoreleasedReturnValue();
  v61 = v36;
  v62 = &v85;
  v63 = &v69;
  v64 = &v79;
  v65 = &v91;
  v66 = &v73;
  id v33 = v60;
  [v60 performBlockAndWait:v59];
  if (*((unsigned char *)v70 + 24))
  {
    v34[2]();
    goto LABEL_38;
  }
  v38 = [(RMPersistentHistoryNotifier *)v36 ignoredTransactionAuthors];
  uint64_t v6 = [(RMPersistentHistoryNotifier *)v36 interestingEntities];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  CFStringRef v31 = v6;
  if (v4)
  {
    v7 = v51;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000589FC;
    v51[3] = &unk_1000C6588;
    v51[4] = v6;
    id v52 = v35;
    v53 = v36;
    v54 = &v55;
    id v8 = objc_retainBlock(v51);
  }
  else
  {
    if (!v6)
    {
      id v8 = &stru_1000C65F0;
      goto LABEL_8;
    }
    v7 = v50;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100058AA0;
    v50[3] = &unk_1000C65B0;
    v50[4] = v6;
    id v8 = objc_retainBlock(v50);
  }

LABEL_8:
  if (v74[5])
  {
    id v9 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v26 = [(id)v74[5] count];
      CFStringRef v27 = @"(none)";
      CFStringRef v28 = v38;
      if (!v38) {
        CFStringRef v28 = @"(none)";
      }
      uint64_t v29 = v92[5];
      if (v31) {
        CFStringRef v27 = v31;
      }
      uint64_t v30 = v86[5];
      *(_DWORD *)buf = 134219266;
      v100 = v36;
      __int16 v101 = 2048;
      id v102 = v26;
      __int16 v103 = 2112;
      CFStringRef v104 = v28;
      __int16 v105 = 2112;
      CFStringRef v106 = v27;
      __int16 v107 = 2112;
      uint64_t v108 = v29;
      __int16 v109 = 2112;
      uint64_t v110 = v30;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Persistent history notifier (%p) processing transactions: %lu { authors = %@, entities = %@, old token = %@, new token = %@ }.", buf, 0x3Eu);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = (id)v74[5];
    id v10 = [obj countByEnumeratingWithState:&v46 objects:v98 count:16];
    if (v10)
    {
      uint64_t v41 = *(void *)v47;
      char v39 = v5;
      do
      {
        os_activity_scope_state_s v11 = 0;
        id v40 = v10;
        do
        {
          if (*(void *)v47 != v41) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v11);
          v14 = [v12 author];
          if (v14
            && ([v12 author],
                v15 = objc_claimAutoreleasedReturnValue(),
                unsigned int v16 = [(__CFString *)v38 containsObject:v15],
                v15,
                v16))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218242;
              v100 = v36;
              __int16 v101 = 2112;
              id v102 = v14;
              _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Persistent history notifier (%p) ignoring transaction from author %@", buf, 0x16u);
            }
          }
          else
          {
            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            v17 = objc_msgSend(v12, "changes", v31);
            id v18 = [v17 countByEnumeratingWithState:&v42 objects:v97 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v43;
LABEL_21:
              uint64_t v20 = 0;
              while (1)
              {
                if (*(void *)v43 != v19) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v21 = *(void *)(*((void *)&v42 + 1) + 8 * v20);
                if (((unsigned int (*)(Block_layout *, uint64_t))v8->invoke)(v8, v21)) {
                  [(id)v80[5] updateWithChange:v21];
                }
                if (*((unsigned char *)v56 + 24)) {
                  break;
                }
                if (v18 == (id)++v20)
                {
                  id v18 = [v17 countByEnumeratingWithState:&v42 objects:v97 count:16];
                  if (v18) {
                    goto LABEL_21;
                  }
                  break;
                }
              }
            }

            char v5 = v39;
            id v10 = v40;
          }

          os_activity_scope_state_s v11 = (char *)v11 + 1;
        }
        while (v11 != v10);
        id v10 = [obj countByEnumeratingWithState:&v46 objects:v98 count:16];
      }
      while (v10);
    }
  }
  v22 = [(RMPersistentHistoryNotifier *)v36 persistentHistoryToken];
  v23 = [(id)v80[5] persistentHistoryToken];
  BOOL v24 = [v22 compareToken:v23 error:0] == (id)3;

  if (!v24)
  {
    if (v5) {
      [v35 persistentHistoryNotifier:v36 hasChanges:v80[5]];
    }
    v25 = [(id)v80[5] persistentHistoryToken];
    [(RMPersistentHistoryNotifier *)v36 setPersistentHistoryToken:v25];
  }
  v34[2]();

  _Block_object_dispose(&v55, 8);
LABEL_38:

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v85, 8);

  _Block_object_dispose(&v91, 8);
}

- (RMPersistentHistoryNotifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMPersistentHistoryNotifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSSet)ignoredTransactionAuthors
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIgnoredTransactionAuthors:(id)a3
{
}

- (NSSet)interestingEntities
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInterestingEntities:(id)a3
{
}

- (NSPersistentHistoryToken)persistentHistoryToken
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPersistentHistoryToken:(id)a3
{
}

- (BOOL)shouldUsePersistentHistoryToken
{
  return self->_shouldUsePersistentHistoryToken;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)queryNeeded
{
  return self->_queryNeeded;
}

- (void)setQueryNeeded:(BOOL)a3
{
  self->_queryNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentHistoryToken, 0);
  objc_storeStrong((id *)&self->_interestingEntities, 0);
  objc_storeStrong((id *)&self->_ignoredTransactionAuthors, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queryCondition, 0);
}

@end