@interface NEKSyncSession
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (NDTPerf)perfomanceTracker;
- (NEKEnvironment)environment;
- (NEKProgressLiar)progressLiar;
- (NEKResultsFetcher)fetcher;
- (NEKResultsPipe)changeSupplier;
- (NEKStatTracker)statsTracker;
- (NEKSyncSession)init;
- (NEKValidationWrapper)validationObject;
- (NSString)syncKind;
- (double)start;
- (int64_t)objectDelayUs;
- (unint64_t)calendarUpdateTimeNs;
- (unint64_t)eventUpdateTimeNs;
- (unint64_t)reminderUpdateTimeNs;
- (unint64_t)storeUpdateTimeNs;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)setCalendarUpdateTimeNs:(unint64_t)a3;
- (void)setChangeSupplier:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setEventUpdateTimeNs:(unint64_t)a3;
- (void)setFetcher:(id)a3;
- (void)setObjectDelayUs:(int64_t)a3;
- (void)setPerfomanceTracker:(id)a3;
- (void)setProgressLiar:(id)a3;
- (void)setReminderUpdateTimeNs:(unint64_t)a3;
- (void)setStart:(double)a3;
- (void)setStatsTracker:(id)a3;
- (void)setStoreUpdateTimeNs:(unint64_t)a3;
- (void)setSyncKind:(id)a3;
- (void)setValidationObject:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation NEKSyncSession

- (NEKSyncSession)init
{
  v3 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v9 = "NEKSyncSession.m";
    __int16 v10 = 1024;
    int v11 = 42;
    __int16 v12 = 2080;
    v13 = "-[NEKSyncSession init]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", buf, 0x1Cu);
  }
  v7.receiver = self;
  v7.super_class = (Class)NEKSyncSession;
  v4 = [(NEKSyncSession *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_isFirst = 1;
    v4->_ct_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  }
  return v5;
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)NEKSyncSession;
  [(NEKSyncSession *)&v3 dealloc];
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (self->_isFirst)
  {
    self->_isFirst = 0;
    if (+[NEKValidationWrapper validationEnabled])
    {
      v9 = +[NEKValidationWrapper validationWrapperForRightNow];
      preSyncCensus = self->_preSyncCensus;
      self->_preSyncCensus = v9;
    }
  }
  uint64_t v34 = 0;
  v35 = (int *)&v34;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  do
  {
    int v11 = [(NEKSyncSession *)self changeSupplier];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10004F66C;
    v26[3] = &unk_1000A9C70;
    v28 = &v30;
    id v12 = v8;
    v26[4] = self;
    id v27 = v12;
    v29 = &v34;
    [v11 conditionalPop:v26];
  }
  while (!*((unsigned char *)v31 + 24));
  if (v35[6] <= 0)
  {
    v14 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(NEKSyncSession *)self changeSupplier];
      v16 = [v15 error];
      *(_DWORD *)buf = 138543362;
      v39 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Enqueued last change, pipe error: %{public}@", buf, 0xCu);
    }
    v17 = [(NEKSyncSession *)self changeSupplier];
    v18 = [v17 error];
    if (v18)
    {
    }
    else
    {
      BOOL v22 = self->_preSyncCensus == 0;

      if (v22) {
        goto LABEL_13;
      }
      v17 = +[NEKValidationWrapper validationWrapperForSameSpan:self->_preSyncCensus];
      unsigned int v23 = [v17 isEqual:self->_preSyncCensus];
      v24 = *(NSObject **)(qword_1000C6CA8 + 8);
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      if (v23)
      {
        if (v25)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Enqueing validation message.", buf, 2u);
        }
        (*((void (**)(id, void *))v12 + 2))(v12, v17);
      }
      else if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Not enqueuing validation message as the population shifted during sync.", buf, 2u);
      }
    }

LABEL_13:
    unsigned int v13 = 2;
    goto LABEL_14;
  }
  unsigned int v13 = 1;
LABEL_14:
  v19 = getCTGreenTeaOsLogHandle();
  v20 = v19;
  if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Sending events", buf, 2u);
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v13;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  id v62 = a3;
  id v8 = a4;
  v9 = (void (**)(id, uint64_t, void))a5;
  if (self->_isFirst) {
    self->_isFirst = 0;
  }
  __int16 v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Applying changes", buf, 2u);
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"internal_disableSync", @"com.apple.EventKitSync", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && AppBooleanValue)
  {
    id v12 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sync disabled. Dropping changes on floor.", buf, 2u);
    }
    goto LABEL_42;
  }
  v59 = v9;
  unsigned int v13 = [NEKStoreRoller alloc];
  v14 = [(NEKSyncSession *)self environment];
  v15 = [v14 syncController];
  v16 = [v15 eventStore];
  v17 = [(NEKStoreRoller *)v13 initWithEventStore:v16 cause:@"syncSession:applyChanges:(events)"];

  v18 = [(NEKSyncSession *)self environment];
  v19 = [v18 syncController];
  v20 = [v19 reminderStore];
  v64 = [v20 freshEventStoreFor:@"syncSession:applyChanges:(reminders)"];

  id v60 = v8;
  id v61 = [objc_alloc((Class)NSMutableArray) initWithCapacity:10];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v8;
  id v21 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (!v21) {
    goto LABEL_37;
  }
  id v22 = v21;
  uint64_t v23 = *(void *)v66;
  do
  {
    v24 = 0;
    do
    {
      if (*(void *)v66 != v23) {
        objc_enumerationMutation(obj);
      }
      BOOL v25 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v24);
      id v27 = [(NEKStoreRoller *)v17 someStore];
      if (+[SYDegenerateChange isDegenerate:v25])
      {
        v28 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Deserialization failed.", buf, 2u);
        }
        goto LABEL_27;
      }
      if ([v25 changeType] == (id)3)
      {
        v29 = [(NEKSyncSession *)self environment];
        uint64_t v30 = [v29 syncController];
        [v30 deleteSYObject:v25 eventStore:v27 reminderStore:v64];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v29 = [(NEKSyncSession *)self environment];
          uint64_t v30 = [v29 syncController];
          v73 = v25;
          v31 = &v73;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v61 addObject:v25];
              if ([v61 count] == (id)10)
              {
                v38 = *(NSObject **)(qword_1000C6CA8 + 8);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Hit ICS batch import capacity.", buf, 2u);
                }
                v39 = [(NEKSyncSession *)self environment];
                v40 = [v39 syncController];
                [v40 createOrUpdateSYObject:v61 eventStore:v27 reminderStore:v64 session:v62];

                v41 = [(NEKSyncSession *)self environment];
                v42 = [v41 syncController];
                v43 = [v42 eventStore];
                [v43 saveEventStore:v27];

                [v61 removeAllObjects];
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [(NEKSyncSession *)self setValidationObject:v25];
              }
            }
            goto LABEL_25;
          }
          v29 = [(NEKSyncSession *)self environment];
          uint64_t v30 = [v29 syncController];
          v72 = v25;
          v31 = &v72;
        }
        uint64_t v32 = +[NSArray arrayWithObjects:v31 count:1];
        [v30 createOrUpdateSYObject:v32 eventStore:v27 reminderStore:v64 session:v62];
      }
LABEL_25:
      char v33 = [(NEKSyncSession *)self environment];
      unsigned int v34 = [v33 isReminderKitEnabled];

      if (v34)
      {
        v35 = [(NEKSyncSession *)self environment];
        uint64_t v36 = [v35 syncController];
        int v37 = [v36 reminderStore];
        [v37 saveEventStore:v64];
      }
LABEL_27:

      v24 = (char *)v24 + 1;
    }
    while (v22 != v24);
    id v44 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
    id v22 = v44;
  }
  while (v44);
LABEL_37:

  v45 = [(NEKStoreRoller *)v17 someStore];
  if ([v61 count])
  {
    v46 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = v46;
      unsigned int v48 = [v61 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v71 = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Picking up final ICS batch import, %d items.", buf, 8u);
    }
    v49 = [(NEKSyncSession *)self environment];
    v50 = [v49 syncController];
    [v50 createOrUpdateSYObject:v61 eventStore:v45 reminderStore:v64 session:v62];

    [v61 removeAllObjects];
  }
  v51 = [(NEKSyncSession *)self environment];
  v52 = [v51 syncController];
  v53 = [v52 eventStore];
  [v53 saveEventStore:v45];

  v54 = [(NEKSyncSession *)self environment];
  v55 = [v54 syncController];
  v56 = [v55 reminderStore];
  [v56 saveEventStore:v64];

  v9 = v59;
  id v8 = v60;
LABEL_42:
  v57 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Calling sync session completion.", buf, 2u);
  }
  v9[2](v9, 1, 0);
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"internal_disableSync", @"com.apple.EventKitSync", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppBooleanValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = [(NEKSyncSession *)self environment];
    id v8 = [v7 syncController];
    [v8 prepDatabasesForResetSync];
  }
  else
  {
    v9 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sync disabled. Ignoring reset request.", v12, 2u);
    }
  }
  return 1;
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v9 = a4;
  v5 = [v9 domain];
  unsigned int v6 = [v5 isEqualToString:SYErrorDomain];

  if (v6) {
    BOOL v7 = [v9 code] != (id)2023;
  }
  else {
    BOOL v7 = 1;
  }
  id v8 = [(NEKSyncSession *)self progressLiar];
  [v8 doneForRealNotifyingPairedSync:v7];

  [(NEKSyncSession *)self setProgressLiar:0];
}

- (NEKResultsPipe)changeSupplier
{
  return self->_changeSupplier;
}

- (void)setChangeSupplier:(id)a3
{
}

- (NEKResultsFetcher)fetcher
{
  return self->_fetcher;
}

- (void)setFetcher:(id)a3
{
}

- (NEKProgressLiar)progressLiar
{
  return self->_progressLiar;
}

- (void)setProgressLiar:(id)a3
{
}

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (NSString)syncKind
{
  return self->_syncKind;
}

- (void)setSyncKind:(id)a3
{
}

- (NEKEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NEKStatTracker)statsTracker
{
  return self->_statsTracker;
}

- (void)setStatsTracker:(id)a3
{
}

- (NDTPerf)perfomanceTracker
{
  return self->_perfomanceTracker;
}

- (void)setPerfomanceTracker:(id)a3
{
}

- (NEKValidationWrapper)validationObject
{
  return self->_validationObject;
}

- (void)setValidationObject:(id)a3
{
}

- (int64_t)objectDelayUs
{
  return self->_objectDelayUs;
}

- (void)setObjectDelayUs:(int64_t)a3
{
  self->_objectDelayUs = a3;
}

- (unint64_t)storeUpdateTimeNs
{
  return self->_storeUpdateTimeNs;
}

- (void)setStoreUpdateTimeNs:(unint64_t)a3
{
  self->_storeUpdateTimeNs = a3;
}

- (unint64_t)calendarUpdateTimeNs
{
  return self->_calendarUpdateTimeNs;
}

- (void)setCalendarUpdateTimeNs:(unint64_t)a3
{
  self->_calendarUpdateTimeNs = a3;
}

- (unint64_t)eventUpdateTimeNs
{
  return self->_eventUpdateTimeNs;
}

- (void)setEventUpdateTimeNs:(unint64_t)a3
{
  self->_eventUpdateTimeNs = a3;
}

- (unint64_t)reminderUpdateTimeNs
{
  return self->_reminderUpdateTimeNs;
}

- (void)setReminderUpdateTimeNs:(unint64_t)a3
{
  self->_reminderUpdateTimeNs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationObject, 0);
  objc_storeStrong((id *)&self->_perfomanceTracker, 0);
  objc_storeStrong((id *)&self->_statsTracker, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_syncKind, 0);
  objc_storeStrong((id *)&self->_progressLiar, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_changeSupplier, 0);
  objc_storeStrong((id *)&self->_preSyncCensus, 0);

  objc_storeStrong((id *)&self->_changeQueue, 0);
}

@end