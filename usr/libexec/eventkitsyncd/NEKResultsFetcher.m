@interface NEKResultsFetcher
- (NEKEventChangeObserver)eventChangeObserver;
- (NEKEventStore)nekEventStore;
- (NEKReminderChangeObserver)reminderChangeObserver;
- (NEKReminderStore)nekReminderStore;
- (NEKResultsFetcher)init;
- (NSThread)backgroundThread;
- (OS_dispatch_semaphore)terminateSemaphore;
- (void)fetchChangesIntoPipe:(id)a3 deferrable:(BOOL)a4;
- (void)fetchEverythingIntoPipe:(id)a3;
- (void)fetchNightlyIntoPipe:(id)a3;
- (void)join;
- (void)setBackgroundThread:(id)a3;
- (void)setEventChangeObserver:(id)a3;
- (void)setNekEventStore:(id)a3;
- (void)setNekReminderStore:(id)a3;
- (void)setReminderChangeObserver:(id)a3;
- (void)setTerminateSemaphore:(id)a3;
@end

@implementation NEKResultsFetcher

- (NEKResultsFetcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)NEKResultsFetcher;
  v2 = [(NEKResultsFetcher *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    terminateSemaphore = v2->_terminateSemaphore;
    v2->_terminateSemaphore = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

- (void)fetchEverythingIntoPipe:(id)a3
{
  id v4 = a3;
  v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v43 = "NEKResultsFetcher.m";
    __int16 v44 = 1024;
    int v45 = 37;
    __int16 v46 = 2080;
    v47 = "-[NEKResultsFetcher fetchEverythingIntoPipe:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", buf, 0x1Cu);
  }
  objc_super v6 = [(NEKResultsFetcher *)self nekEventStore];
  v7 = [v6 environment];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100048144;
  v41[3] = &unk_1000A9B58;
  v41[4] = self;
  v8 = objc_retainBlock(v41);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000481B0;
  v40[3] = &unk_1000A9B80;
  v40[4] = self;
  v9 = objc_retainBlock(v40);
  v10 = [NEKSyncWindow alloc];
  v11 = [v7 tinyStore];
  id v12 = [(NEKSyncWindow *)v10 initForFullSync:1 tinyStore:v11];

  v13 = [(NEKResultsFetcher *)self eventChangeObserver];
  v14 = [v13 eventDatabaseController];

  v15 = [(NEKResultsFetcher *)self eventChangeObserver];
  [v15 restartTrackingChanges];

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10004821C;
  v38[3] = &unk_1000A8B90;
  id v16 = v14;
  id v39 = v16;
  [v4 addCompletion:v38];
  v17 = [(NEKResultsFetcher *)self reminderChangeObserver];
  v18 = [v17 changeStateMap];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100048224;
  v36[3] = &unk_1000A8BB8;
  v36[4] = self;
  id v19 = v18;
  id v37 = v19;
  [v4 addCompletion:v36];
  v20 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = (char *)v4;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "fetchEverythingIntoPipe:PipeBefore: %{public}@", buf, 0xCu);
  }
  id v21 = objc_alloc((Class)NSThread);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100048278;
  v29[3] = &unk_1000A9BA8;
  id v30 = v16;
  v31 = self;
  id v32 = v4;
  id v33 = v12;
  id v34 = v8;
  id v35 = v9;
  v22 = v9;
  id v23 = v12;
  v24 = v8;
  id v25 = v4;
  id v26 = v16;
  id v27 = [v21 initWithBlock:v29];
  [(NEKResultsFetcher *)self setBackgroundThread:v27];

  v28 = [(NEKResultsFetcher *)self backgroundThread];
  [v28 start];
}

- (void)fetchNightlyIntoPipe:(id)a3
{
  id v4 = a3;
  v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v38 = "NEKResultsFetcher.m";
    __int16 v39 = 1024;
    int v40 = 83;
    __int16 v41 = 2080;
    v42 = "-[NEKResultsFetcher fetchNightlyIntoPipe:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", buf, 0x1Cu);
  }
  objc_super v6 = [(NEKResultsFetcher *)self nekEventStore];
  v7 = [v6 environment];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000488B4;
  v36[3] = &unk_1000A9B58;
  v36[4] = self;
  v8 = objc_retainBlock(v36);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10004899C;
  v35[3] = &unk_1000A9B80;
  v35[4] = self;
  v9 = objc_retainBlock(v35);
  v10 = [NEKSyncWindow alloc];
  v11 = [v7 tinyStore];
  id v12 = [(NEKSyncWindow *)v10 initForFullSync:0 tinyStore:v11];

  v13 = [(NEKResultsFetcher *)self eventChangeObserver];
  v14 = [v13 eventDatabaseController];

  [v14 startMappingEntities];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100048A08;
  v33[3] = &unk_1000A8B90;
  id v15 = v14;
  id v34 = v15;
  [v4 addCompletion:v33];
  id v16 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = (char *)v4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "fetchNightlyIntoPipe:PipeBefore: %{public}@", buf, 0xCu);
  }
  id v17 = objc_alloc((Class)NSThread);
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  id v26 = sub_100048A44;
  id v27 = &unk_1000A9BD0;
  v28 = self;
  id v29 = v4;
  id v30 = v12;
  id v31 = v8;
  id v32 = v9;
  v18 = v9;
  id v19 = v12;
  v20 = v8;
  id v21 = v4;
  id v22 = [v17 initWithBlock:&v24];
  -[NEKResultsFetcher setBackgroundThread:](self, "setBackgroundThread:", v22, v24, v25, v26, v27, v28);

  id v23 = [(NEKResultsFetcher *)self backgroundThread];
  [v23 start];
}

- (void)fetchChangesIntoPipe:(id)a3 deferrable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v39 = "NEKResultsFetcher.m";
    __int16 v40 = 1024;
    int v41 = 131;
    __int16 v42 = 2080;
    v43 = "-[NEKResultsFetcher fetchChangesIntoPipe:deferrable:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", buf, 0x1Cu);
  }
  v8 = [(NEKResultsFetcher *)self eventChangeObserver];
  v9 = [v8 fetchEventChangeSet];

  v10 = [(NEKResultsFetcher *)self reminderChangeObserver];
  v11 = [v10 fetchReminderChangeSet];

  id v12 = [NEKSourceChangeAggregator alloc];
  v13 = [(NEKResultsFetcher *)self nekEventStore];
  v14 = [(NEKSourceChangeAggregator *)v12 initWithNEKEventStore:v13 eventChanges:v9 reminderChanges:v11];

  if ([v9 truncated]) {
    [v11 setTruncated:1];
  }
  if ([v11 truncated]) {
    [v9 setTruncated:1];
  }
  if ([v9 hasChangesInNext24hrs]) {
    [v6 markAsAffectingNext24hrs];
  }
  id v15 = [v9 completion];
  if (v15) {
    [v6 addCompletion:v15];
  }
  id v16 = [v11 completion];
  if (v16) {
    [v6 addCompletion:v16];
  }
  if (![v9 isEmpty] || (objc_msgSend(v11, "isEmpty") & 1) == 0) {
    [v6 markAsNotEffectivelyEmpty];
  }
  if ([v9 truncated])
  {
    [v6 markAsTruncated];
  }
  else if ([v11 isEmpty] && v4 && objc_msgSend(v9, "isDeferrable"))
  {
    [v6 markAsDeferrable];
  }
  if (([v9 truncated] & 1) != 0
    || [v9 isEmpty] && objc_msgSend(v11, "isEmpty"))
  {
    id v17 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v39 = (char *)v6;
      v18 = "Finishing pipe (empty changesets): %p";
      id v19 = v17;
      uint32_t v20 = 12;
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  if ([v6 isDeferrable])
  {
    id v21 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "Finishing pipe. Changeset is deferrable.";
      id v19 = v21;
      uint32_t v20 = 2;
      goto LABEL_30;
    }
LABEL_31:
    [v6 finish];
    goto LABEL_32;
  }
  id v22 = [(NEKResultsFetcher *)self nekEventStore];
  id v23 = [(NEKResultsFetcher *)self nekReminderStore];
  v24 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v39 = (char *)v6;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "fetchChangesIntoPipe:PipeBefore: %{public}@", buf, 0xCu);
  }
  id v25 = objc_alloc((Class)NSThread);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100049138;
  v30[3] = &unk_1000A9BF8;
  id v31 = v22;
  id v32 = v9;
  id v33 = v14;
  id v34 = v6;
  id v35 = v23;
  id v36 = v11;
  id v37 = self;
  id v26 = v23;
  id v27 = v22;
  id v28 = [v25 initWithBlock:v30];
  [(NEKResultsFetcher *)self setBackgroundThread:v28];

  id v29 = [(NEKResultsFetcher *)self backgroundThread];
  [v29 start];

LABEL_32:
}

- (void)join
{
  dispatch_semaphore_t v3 = [(NEKResultsFetcher *)self backgroundThread];

  if (v3)
  {
    BOOL v4 = [(NEKResultsFetcher *)self terminateSemaphore];
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

    [(NEKResultsFetcher *)self setBackgroundThread:0];
  }
}

- (NEKEventChangeObserver)eventChangeObserver
{
  return self->_eventChangeObserver;
}

- (void)setEventChangeObserver:(id)a3
{
}

- (NEKReminderChangeObserver)reminderChangeObserver
{
  return self->_reminderChangeObserver;
}

- (void)setReminderChangeObserver:(id)a3
{
}

- (NEKEventStore)nekEventStore
{
  return self->_nekEventStore;
}

- (void)setNekEventStore:(id)a3
{
}

- (NEKReminderStore)nekReminderStore
{
  return self->_nekReminderStore;
}

- (void)setNekReminderStore:(id)a3
{
}

- (NSThread)backgroundThread
{
  return self->_backgroundThread;
}

- (void)setBackgroundThread:(id)a3
{
}

- (OS_dispatch_semaphore)terminateSemaphore
{
  return self->_terminateSemaphore;
}

- (void)setTerminateSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminateSemaphore, 0);
  objc_storeStrong((id *)&self->_backgroundThread, 0);
  objc_storeStrong((id *)&self->_nekReminderStore, 0);
  objc_storeStrong((id *)&self->_nekEventStore, 0);
  objc_storeStrong((id *)&self->_reminderChangeObserver, 0);

  objc_storeStrong((id *)&self->_eventChangeObserver, 0);
}

@end