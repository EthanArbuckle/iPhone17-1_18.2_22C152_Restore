@interface NEKEventChangeObserver
- (BOOL)_currentChangeSetAffectsNext24hrs:(id)a3;
- (BOOL)allCalendarsInto:(id)a3;
- (BOOL)allEventsInto:(id)a3 filter:(id)a4 window:(id)a5;
- (BOOL)allRemindersInto:(id)a3 filter:(id)a4 window:(id)a5;
- (BOOL)allSourcesInto:(id)a3;
- (NEKEventChangeObserver)initWithEnvironment:(id)a3;
- (NEKEventChangeObserver)initWithQueue:(id)a3 environment:(id)a4;
- (NEKEventStore)weakEventDatabaseController;
- (id)_eventCalendarKey;
- (id)_masterEventsToSync;
- (id)_sequenceKey;
- (id)_sequenceTokenKey;
- (id)_taskCalendarKey;
- (id)eventDatabaseController;
- (id)fetchEventChangeSet;
- (id)lastSequenceToken;
- (id)previousDefaultEventCalendar;
- (id)previousDefaultTaskCalendar;
- (int)lastSequenceNumber;
- (void)_defaultCalendarChanged:(id)a3;
- (void)_fetchChangesInto:(id)a3 from:(int)a4 inside:(id)a5;
- (void)_sendChangesIfAvailable;
- (void)beginObservingChanges;
- (void)databaseDidChange;
- (void)dealloc;
- (void)notifyForDatabaseUpdates;
- (void)notifyForDatabaseUpdatesIfNeeded;
- (void)restartTrackingChanges;
- (void)setLastSequenceNumber:(int)a3;
- (void)setLastSequenceToken:(id)a3;
- (void)setPreviousDefaultEventCalendar:(id)a3;
- (void)setPreviousDefaultTaskCalendar:(id)a3;
- (void)setWeakEventDatabaseController:(id)a3;
- (void)stopObservingChanges;
@end

@implementation NEKEventChangeObserver

- (NEKEventChangeObserver)initWithEnvironment:(id)a3
{
  return 0;
}

- (NEKEventChangeObserver)initWithQueue:(id)a3 environment:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEKEventChangeObserver;
  v7 = [(NEKChangeObserver *)&v10 initWithEnvironment:a4];
  if (v7)
  {
    if (!v6)
    {
      id v6 = &_dispatch_main_q;
      id v8 = &_dispatch_main_q;
    }
    objc_storeStrong((id *)&v7->_queue, v6);
    [(NEKEventChangeObserver *)v7 beginObservingChanges];
  }

  return v7;
}

- (void)dealloc
{
  [(NEKEventChangeObserver *)self stopObservingChanges];
  v3.receiver = self;
  v3.super_class = (Class)NEKEventChangeObserver;
  [(NEKEventChangeObserver *)&v3 dealloc];
}

- (id)eventDatabaseController
{
  return [(NEKEventChangeObserver *)self weakEventDatabaseController];
}

- (id)_taskCalendarKey
{
  return @"taskCalendarId";
}

- (id)_eventCalendarKey
{
  return @"eventCalendarId";
}

- (void)_defaultCalendarChanged:(id)a3
{
  v4 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Default Calendar Changed", v5, 2u);
  }
  [(NEKEventChangeObserver *)self databaseDidChange];
}

- (void)beginObservingChanges
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"databaseDidChange" name:@"NEKDatabaseChangedExternallyNotification" object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_defaultCalendarChanged:" name:@"NEKDefaultCalendarChanged" object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"blindChangeNumberAdvance:" name:@"NEKBlindChangeNumberAdvance" object:0];
}

- (void)stopObservingChanges
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"NEKDatabaseChangedExternallyNotification" object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"NEKDefaultCalendarChanged" object:0];
}

- (void)databaseDidChange
{
  objc_initWeak(&location, self);
  objc_super v3 = (void *)os_transaction_create();
  id v4 = [(NEKChangeObserver *)self environment];
  id v5 = [v4 syncCoordinator];
  unsigned int v6 = [v5 okToPerformDeltaSync];

  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005A830;
    block[3] = &unk_1000A9140;
    objc_copyWeak(&v12, &location);
    id v11 = v3;
    dispatch_async(queue, block);

    objc_destroyWeak(&v12);
  }
  else
  {
    id v8 = *(NSObject **)(qword_1000C6CA8 + 8);
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
    unsigned int v6 = "-[NEKEventChangeObserver notifyForDatabaseUpdates]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(NEKChangeObserver *)self delegate];
  [v4 changeObserverDidObserveChanges:self];
}

- (BOOL)allSourcesInto:(id)a3
{
  id v38 = a3;
  int v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    *(void *)v50 = "-[NEKEventChangeObserver allSourcesInto:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v7 = [(NEKEventChangeObserver *)self eventDatabaseController];
  id v8 = NSStringFromSelector(a2);
  v9 = +[EKEventStore eks_eventStoreFor:v8];

  objc_super v10 = [v9 eks_sourcesAlwaysIncludingLocal];
  id v11 = [v9 localSource];
  v37 = v7;
  v42 = [v7 environment];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v10;
  id v12 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (!v12)
  {
    BOOL v33 = 1;
    goto LABEL_33;
  }
  id v13 = v12;
  v35 = v9;
  v36 = v6;
  uint64_t v14 = *(void *)v44;
  v39 = v11;
  uint64_t v40 = *(void *)v44;
  while (2)
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v44 != v14) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      if ([v42 isReminderKitEnabled]
        && v16 == v11
        && [v11 allowsTasks]
        && ([v11 allowsEvents] & 1) == 0)
      {
        v31 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          p_super = v31;
          v32 = [v11 sourceIdentifier];
          *(_DWORD *)buf = 136446466;
          *(void *)v50 = "-[NEKEventChangeObserver allSourcesInto:]";
          *(_WORD *)&v50[8] = 2114;
          *(void *)&v50[10] = v32;
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for sync'ing local reminders-only source %{public}@", buf, 0x16u);

LABEL_22:
        }
      }
      else
      {
        if ([v16 allowsTasks])
        {
          if ([v16 allowsEvents])
          {
            v18 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = v18;
              v20 = [v16 sourceIdentifier];
              *(_DWORD *)buf = 138543362;
              *(void *)v50 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending mixed entity source %{public}@ from EventKit", buf, 0xCu);
            }
          }
        }
        int v21 = sub_10000BA00(v16);
        v22 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          v24 = [v16 sourceIdentifier];
          [v16 title];
          v26 = id v25 = v13;
          v27 = sub_10002D3E0(v26);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v50 = v21;
          *(_WORD *)&v50[4] = 2114;
          *(void *)&v50[6] = v24;
          *(_WORD *)&v50[14] = 2114;
          *(void *)&v50[16] = v27;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "shouldSyncSource: %d for %{public}@ \"%{public}@\"", buf, 0x1Cu);

          id v13 = v25;
          uint64_t v14 = v40;

          id v11 = v39;
        }
        if (v21)
        {
          v28 = [[NEKSourceWrapper alloc] initWithSource:v16];
          if (v28)
          {
            p_super = &v28->super;
            if (([v38 push:v28] & 1) == 0)
            {

              BOOL v33 = 0;
              goto LABEL_31;
            }
            [v37 updateRowMappingForEntity:v16];
            goto LABEL_22;
          }
          v30 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_1000705F0(v47, v30, v16, &v48);
          }
        }
      }
    }
    id v13 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v13) {
      continue;
    }
    break;
  }
  BOOL v33 = 1;
LABEL_31:
  v9 = v35;
  unsigned int v6 = v36;
LABEL_33:

  return v33;
}

- (BOOL)allCalendarsInto:(id)a3
{
  id v5 = a3;
  unsigned int v6 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v61 = "-[NEKEventChangeObserver allCalendarsInto:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v7 = [(NEKEventChangeObserver *)self eventDatabaseController];
  id v8 = [v7 environment];
  v9 = NSStringFromSelector(a2);
  objc_super v10 = [v7 freshEventStoreFor:v9];

  id v11 = [v10 sources];
  id v58 = 0;
  id v59 = 0;
  long long v43 = v10;
  [v7 getDefaultTaskCalendar:&v59 defaultEventCalendar:&v58 store:v10];
  id v48 = v59;
  id v47 = v58;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v12 = v11;
  id v40 = [v12 countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v40)
  {
    uint64_t v13 = *(void *)v55;
    long long v45 = v7;
    id v46 = v5;
    v42 = v12;
    uint64_t v39 = *(void *)v55;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(v12);
        }
        uint64_t v41 = v14;
        v15 = [*(id *)(*((void *)&v54 + 1) + 8 * v14) allCalendars:v39];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id obj = v15;
        id v16 = [obj countByEnumeratingWithState:&v50 objects:v64 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v51;
          while (2)
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v51 != v18) {
                objc_enumerationMutation(obj);
              }
              v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              if ([v8 isReminderKitEnabled]
                && [v20 allowedEntityTypes] == (id)2)
              {
                v22 = *(NSObject **)(qword_1000C6CA8 + 8);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  v23 = v22;
                  v24 = [v20 calendarIdentifier];
                  *(_DWORD *)buf = 136446466;
                  v61 = "-[NEKEventChangeObserver allCalendarsInto:]";
                  __int16 v62 = 2114;
                  v63 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for sync'ing calendar %{public}@", buf, 0x16u);
                }
              }
              else
              {
                if ([v20 allowedEntityTypes] == (id)3)
                {
                  id v25 = *(NSObject **)(qword_1000C6CA8 + 8);
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    v26 = v25;
                    v27 = [v20 calendarIdentifier];
                    *(_DWORD *)buf = 138412290;
                    v61 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Sending mixed entity calendar %@ from EventKit", buf, 0xCu);
                  }
                }
                if (sub_10000BACC(v20))
                {
                  v28 = [[NEKCalendarWrapper alloc] initWithCalendarRef:v20];
                  if ([v20 isEqual:v48])
                  {
                    v29 = *(NSObject **)(qword_1000C6CA8 + 8);
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      v30 = v29;
                      sub_10002D3E0([v20 title]);
                      v31 = (char *)objc_claimAutoreleasedReturnValue();
                      v32 = [v20 calendarIdentifier];
                      *(_DWORD *)buf = 138543618;
                      v61 = v31;
                      __int16 v62 = 2114;
                      v63 = v32;
                      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Marking default task calendar in wrapper to calendar with name %{public}@, identifier %{public}@", buf, 0x16u);

                      v7 = v45;
                      id v5 = v46;
                    }
                    [(NEKCalendarWrapper *)v28 setIsDefaultTaskCalendar:1];
                  }
                  if ([v20 isEqual:v47])
                  {
                    BOOL v33 = *(NSObject **)(qword_1000C6CA8 + 8);
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                    {
                      v34 = v33;
                      sub_10002D3E0([v20 title]);
                      v35 = (char *)objc_claimAutoreleasedReturnValue();
                      v36 = [v20 calendarIdentifier];
                      *(_DWORD *)buf = 138543618;
                      v61 = v35;
                      __int16 v62 = 2114;
                      v63 = v36;
                      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Marking default event calendar in wrapper to calendar with name %{public}@, identifier %{public}@", buf, 0x16u);

                      id v5 = v46;
                      v7 = v45;
                    }
                    [(NEKCalendarWrapper *)v28 setIsDefaultEventCalendar:1];
                  }
                  if (![v5 push:v28])
                  {

                    BOOL v37 = 0;
                    id v12 = v42;
                    goto LABEL_38;
                  }
                  [v7 updateRowMappingForEntity:v20];
                }
              }
            }
            id v17 = [obj countByEnumeratingWithState:&v50 objects:v64 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        uint64_t v14 = v41 + 1;
        id v12 = v42;
        uint64_t v13 = v39;
      }
      while ((id)(v41 + 1) != v40);
      BOOL v37 = 1;
      id v40 = [v42 countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v40);
  }
  else
  {
    BOOL v37 = 1;
  }
LABEL_38:

  return v37;
}

- (id)_masterEventsToSync
{
  id v5 = [(NEKEventChangeObserver *)self eventDatabaseController];
  unsigned int v6 = NSStringFromSelector(a2);
  v7 = [v5 freshEventStoreFor:v6];

  id v8 = [v7 predicateForMasterEventsInCalendars:0];
  v9 = [v7 eventObjectIDsMatchingPredicate:v8];

  return v9;
}

- (BOOL)allEventsInto:(id)a3 filter:(id)a4 window:(id)a5
{
  id v9 = a3;
  uint64_t v39 = (uint64_t (**)(id, void *))a4;
  id v40 = a5;
  objc_super v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v47 = "-[NEKEventChangeObserver allEventsInto:filter:window:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v11 = [(NEKEventChangeObserver *)self eventDatabaseController];
  id v12 = [NEKStoreRoller alloc];
  uint64_t v13 = NSStringFromSelector(a2);
  BOOL v37 = (void *)v11;
  uint64_t v14 = [(NEKStoreRoller *)v12 initWithEventStore:v11 cause:v13];

  ct_green_tea_logger_create();
  [(NEKEventChangeObserver *)self _masterEventsToSync];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
  v36 = v15;
  if (v16)
  {
    id v17 = v16;
    int v38 = 0;
    uint64_t v18 = *(void *)v42;
LABEL_5:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v42 != v18) {
        objc_enumerationMutation(v15);
      }
      v20 = *(const char **)(*((void *)&v41 + 1) + 8 * v19);
      if ([v9 finished]) {
        break;
      }
      v22 = [(NEKStoreRoller *)v14 fetch:v20];
      if (v22)
      {
        v23 = getCTGreenTeaOsLogHandle();
        v24 = v23;
        if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Reading events", buf, 2u);
        }

        id v25 = [v22 eventStore];
        if ([v40 eventInWindow:v22 inStore:v25])
        {
          int v26 = v39[2](v39, v22);

          if (v26)
          {
            v27 = v37;
            v28 = +[NEKICSWrapper wrapperForCalendarItem:v22 needsInvite:0 eventStore:v37];
            unsigned int v29 = [v9 push:v28];

            if (!v29)
            {
              ct_green_tea_logger_destroy();

LABEL_26:
              v32 = v36;

              BOOL v33 = 0;
              goto LABEL_31;
            }
            ++v38;
            [v37 updateRowMappingForEntity:v22];
            id v15 = v36;
          }
        }
        else
        {
        }
      }
      else
      {
        v30 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v47 = v20;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "publicObjectWithObjectID returned nil. ObjectID: %{public}@", buf, 0xCu);
        }
      }

      if (v17 == (id)++v19)
      {
        id v17 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v17) {
          goto LABEL_5;
        }
        goto LABEL_28;
      }
    }
    v31 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Pipe finished, exiting allEventsInto loop.", buf, 2u);
    }
    ct_green_tea_logger_destroy();
    v27 = v37;
    goto LABEL_26;
  }
  int v38 = 0;
LABEL_28:

  v34 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v47) = v38;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "allEventsInto:filter:window: pushed %d items.", buf, 8u);
  }
  ct_green_tea_logger_destroy();
  BOOL v33 = 1;
  v32 = v36;
  v27 = v37;
LABEL_31:

  return v33;
}

- (BOOL)allRemindersInto:(id)a3 filter:(id)a4 window:(id)a5
{
  id v34 = a3;
  id v33 = a4;
  id v35 = a5;
  id v8 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    long long v42 = "-[NEKEventChangeObserver allRemindersInto:filter:window:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v9 = [(NEKEventChangeObserver *)self eventDatabaseController];
  objc_super v10 = [v9 environment];
  uint64_t v11 = [[NEKStoreRoller alloc] initWithEventStore:v9 cause:@"allRemindersInto:filter:window:"];
  if ([v10 isReminderKitEnabled])
  {
    id v12 = *(NSObject **)(qword_1000C6CA8 + 8);
    uint64_t v13 = (unsigned int (**)(void, void))v33;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      long long v42 = "-[NEKEventChangeObserver allRemindersInto:filter:window:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for sync'ing reminders", buf, 0xCu);
    }
    BOOL v14 = 1;
  }
  else
  {
    v30 = v10;
    id v15 = [(NEKStoreRoller *)v11 someStore];
    id v16 = [v15 predicateForRemindersInCalendars:0];
    id v17 = [v15 reminderObjectIDsMatchingPredicate:v16];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v17;
    id v18 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    uint64_t v13 = (unsigned int (**)(void, void))v33;
    if (v18)
    {
      id v19 = v18;
      v31 = v9;
      uint64_t v20 = *(void *)v37;
      int v21 = obj;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          v23 = v15;
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v21);
          }
          uint64_t v24 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          int v26 = [(NEKStoreRoller *)v11 fetch:v24];
          id v15 = [v26 eventStore];

          if ([v35 eventInWindow:v26 inStore:v15]
            && ((unsigned int (**)(void, void *))v13)[2](v13, v26))
          {
            id v9 = v31;
            v27 = +[NEKICSWrapper wrapperForCalendarItem:v26 needsInvite:0 eventStore:v31];
            unsigned int v28 = [v34 push:v27];

            if (!v28)
            {

              BOOL v14 = 0;
              uint64_t v13 = (unsigned int (**)(void, void))v33;
              goto LABEL_21;
            }
            [v31 updateRowMappingForEntity:v26];
            int v21 = obj;
            uint64_t v13 = (unsigned int (**)(void, void))v33;
          }
        }
        id v19 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v19) {
          continue;
        }
        break;
      }
      BOOL v14 = 1;
      id v9 = v31;
    }
    else
    {
      BOOL v14 = 1;
    }
LABEL_21:

    objc_super v10 = v30;
  }

  return v14;
}

- (id)fetchEventChangeSet
{
  objc_super v3 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446722;
    uint64_t v13 = "NEKEventChangeObserver.m";
    __int16 v14 = 1024;
    int v15 = 348;
    __int16 v16 = 2080;
    id v17 = "-[NEKEventChangeObserver fetchEventChangeSet]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", (uint8_t *)&v12, 0x1Cu);
  }
  id v4 = +[NEKChangeSet changeSetForEvent];
  id v5 = [(NEKEventChangeObserver *)self eventDatabaseController];
  [v4 setTruncated:0];
  uint64_t v6 = [(NEKEventChangeObserver *)self lastSequenceNumber];
  if (v6 == -1)
  {
    v7 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Pulled -1 from lastSequenceNumber.", (uint8_t *)&v12, 2u);
    }
    if (self->_sawSeqnoFailure)
    {
      id v8 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136446210;
        uint64_t v13 = "-[NEKEventChangeObserver fetchEventChangeSet]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: Saw sequence number failure already. Still waiting for corrective sync to complete.", (uint8_t *)&v12, 0xCu);
      }
      id v9 = v4;
      uint64_t v10 = 0;
    }
    else
    {
      self->_sawSeqnoFailure = 1;
      id v9 = v4;
      uint64_t v10 = 1;
    }
    [v9 setTruncated:v10];
  }
  else
  {
    [(NEKEventChangeObserver *)self _fetchChangesInto:v4 from:v6 inside:v5];
  }

  return v4;
}

- (BOOL)_currentChangeSetAffectsNext24hrs:(id)a3
{
  id v4 = a3;
  [(NEKEventChangeObserver *)self lastSequenceToken];
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005C108;
  v7[3] = &unk_1000A9E90;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = self;
  uint64_t v10 = &v11;
  id v8 = v5;
  [v4 changesSinceSequenceToken:v5 completion:v7];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (void)_fetchChangesInto:(id)a3 from:(int)a4 inside:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  self->_sawSeqnoFailure = 0;
  uint64_t v11 = NSStringFromSelector(a2);
  int v12 = [v10 freshEventStoreFor:v11];

  objc_initWeak(&location, self);
  uint64_t v13 = +[NDTPerf wallTime];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 1;
  dispatch_time_t v14 = dispatch_time(0, 30000000000);
  int v15 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C600;
  block[3] = &unk_1000A9EB8;
  void block[4] = v32;
  dispatch_after(v14, v15, block);

  kdebug_trace();
  unsigned int v16 = [(NEKEventChangeObserver *)self _currentChangeSetAffectsNext24hrs:v12];
  id v17 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v36 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Current change set affects next 24hrs? %{BOOL}d", buf, 8u);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10005C62C;
  v22[3] = &unk_1000A9F08;
  v27 = v32;
  v28[1] = v13;
  id v18 = v9;
  int v29 = a4;
  id v23 = v18;
  uint64_t v24 = self;
  id v19 = v12;
  id v25 = v19;
  char v30 = v16;
  objc_copyWeak(v28, &location);
  uint64_t v20 = a4;
  id v21 = v10;
  id v26 = v21;
  [v19 changedObjectIDsSinceToken:v20 resultHandler:v22];

  objc_destroyWeak(v28);
  _Block_object_dispose(v32, 8);
  objc_destroyWeak(&location);
}

- (void)restartTrackingChanges
{
  id v4 = [(NEKEventChangeObserver *)self eventDatabaseController];
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 freshEventStoreFor:v5];

  id v12 = 0;
  [v6 unregisterForDetailedChangeTracking:&v12];
  id v7 = v12;
  id v11 = v7;
  id v8 = [v6 registerForDetailedChangeTracking:&v11];
  id v9 = v11;

  id v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Registering for persistent change tracking: %ld", buf, 0xCu);
  }
  [(NEKEventChangeObserver *)self setLastSequenceNumber:0];
}

- (id)_sequenceKey
{
  return @"com.apple.eventkitsync.changeobserver.sequencenumber";
}

- (id)_sequenceTokenKey
{
  return @"com.apple.eventkitsync.changeobserver.sequencetoken";
}

- (int)lastSequenceNumber
{
  objc_super v3 = [(NEKChangeObserver *)self environment];
  id v4 = [v3 tinyStore];
  id v5 = [(NEKEventChangeObserver *)self _sequenceKey];
  int v6 = [v4 getIntegerValueForKey:v5 default:-1];

  return v6;
}

- (void)setLastSequenceNumber:(int)a3
{
  id v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting anchor sequence number: %d", (uint8_t *)v9, 8u);
  }
  int v6 = [(NEKChangeObserver *)self environment];
  id v7 = [v6 tinyStore];
  id v8 = [(NEKEventChangeObserver *)self _sequenceKey];
  [v7 setIntegerValue:a3 forKey:v8];
}

- (id)lastSequenceToken
{
  objc_super v3 = [(NEKChangeObserver *)self environment];
  id v4 = [v3 tinyStore];
  id v5 = [(NEKEventChangeObserver *)self _sequenceTokenKey];
  int v6 = [v4 getDataValueForKey:v5];

  if (v6)
  {
    id v12 = 0;
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v12];
    id v8 = v12;
    if (v8)
    {
      id v9 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000706E4(v9, v8);
      }
      id v10 = 0;
    }
    else
    {
      id v10 = v7;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)setLastSequenceToken:(id)a3
{
  id v18 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v18];
  id v5 = v18;
  if (v5)
  {
    int v6 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000707B4(v6, v5);
    }
  }
  else if (v4)
  {
    id v7 = [(NEKChangeObserver *)self environment];
    id v8 = [v7 tinyStore];
    id v9 = [(NEKEventChangeObserver *)self _sequenceTokenKey];
    [v8 setDataValue:v4 forKey:v9];
  }
  else
  {
    id v10 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10007077C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (id)previousDefaultTaskCalendar
{
  objc_super v3 = [(NEKChangeObserver *)self environment];
  unsigned int v4 = [v3 isReminderKitEnabled];

  if (v4)
  {
    id v5 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446210;
      uint64_t v12 = "-[NEKEventChangeObserver previousDefaultTaskCalendar]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for getting previous default task calendar", (uint8_t *)&v11, 0xCu);
    }
    int v6 = 0;
  }
  else
  {
    id v7 = [(NEKChangeObserver *)self environment];
    id v8 = [v7 tinyStore];
    id v9 = [(NEKEventChangeObserver *)self _taskCalendarKey];
    int v6 = [v8 getStringValueForKey:v9 default:0];
  }

  return v6;
}

- (id)previousDefaultEventCalendar
{
  objc_super v3 = [(NEKChangeObserver *)self environment];
  unsigned int v4 = [v3 tinyStore];
  id v5 = [(NEKEventChangeObserver *)self _eventCalendarKey];
  int v6 = [v4 getStringValueForKey:v5 default:0];

  return v6;
}

- (void)setPreviousDefaultTaskCalendar:(id)a3
{
  id v4 = a3;
  id v5 = [(NEKChangeObserver *)self environment];
  unsigned int v6 = [v5 isReminderKitEnabled];

  if (v6)
  {
    id v7 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446210;
      uint64_t v12 = "-[NEKEventChangeObserver setPreviousDefaultTaskCalendar:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for setting previous default task calendar", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id v8 = [(NEKChangeObserver *)self environment];
    id v9 = [v8 tinyStore];
    id v10 = [(NEKEventChangeObserver *)self _taskCalendarKey];
    [v9 setStringValue:v4 forKey:v10];
  }
}

- (void)setPreviousDefaultEventCalendar:(id)a3
{
  id v4 = a3;
  id v7 = [(NEKChangeObserver *)self environment];
  id v5 = [v7 tinyStore];
  unsigned int v6 = [(NEKEventChangeObserver *)self _eventCalendarKey];
  [v5 setStringValue:v4 forKey:v6];
}

- (void)_sendChangesIfAvailable
{
}

- (NEKEventStore)weakEventDatabaseController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakEventDatabaseController);

  return (NEKEventStore *)WeakRetained;
}

- (void)setWeakEventDatabaseController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakEventDatabaseController);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end