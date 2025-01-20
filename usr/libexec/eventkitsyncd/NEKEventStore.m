@interface NEKEventStore
- (BOOL)_checkAndSetDefaultCalendar:(id)a3 calendarWrapper:(id)a4 store:(id)a5;
- (BOOL)_shouldSendEvent:(id)a3;
- (BOOL)_shouldSendReminder:(id)a3;
- (BOOL)_updateCalendar:(id)a3 withCalendarWrapper:(id)a4;
- (BOOL)_updateSource:(id)a3 withSourceWrapper:(id)a4 store:(id)a5;
- (BOOL)hasRowMappingForEntity:(id)a3;
- (BOOL)shouldSendEntity:(id)a3;
- (BOOL)updateEvent:(id)a3 identifier:(id)a4 eventStore:(id)a5 occurrenceDate:(id)a6 participationStatus:(int64_t)a7 masterIdentifier:(id)a8 isMaster:(BOOL)a9;
- (BOOL)updateMasterEvent:(id)a3 masterIdentifier:(id)a4 calendarIdentifier:(id)a5 masterParticipationStatus:(int64_t)a6 detachedEvents:(id)a7;
- (NEKEventStore)initWithEnvironment:(id)a3;
- (NEKRecordMap)recordMap;
- (NEKSeenMap)seenMap;
- (id)_ICSLogTestForWrapper:(id)a3;
- (id)_createCalendarForWrapper:(id)a3 store:(id)a4;
- (id)_createSourceForWrapper:(id)a3 store:(id)a4;
- (id)_filterOutInvalidICSWrappers:(id)a3 store:(id)a4 calendars:(id *)a5;
- (id)_identifierInRowMapping:(id)a3;
- (id)calendarIdentifierInRowMappingForEventOrTask:(id)a3;
- (id)calendarIdentifierInRowMappingForRecordIDRef:(id)a3;
- (id)detacheesForIdentifierCreatingIfNeeded:(id)a3 detachedEventMap:(id)a4;
- (id)freshEventStoreFor:(id)a3;
- (id)identifierInRowMappingForEventOrTask:(id)a3;
- (id)identifierInRowMappingForRecordIDRef:(id)a3;
- (id)wrapperForCalEntity:(id)a3;
- (id)wrapperForCalendar:(id)a3;
- (id)wrapperForCalendar:(id)a3 useAttributes:(BOOL)a4;
- (id)wrapperForCalendarItem:(id)a3;
- (id)wrapperForSource:(id)a3;
- (void)ICSWrappersForChangeSet:(id)a3 pipe:(id)a4;
- (void)_commitPendingRecordMapChanges;
- (void)_deleteAndLogEvent:(id)a3 identifier:(id)a4 store:(id)a5;
- (void)_deleteCalendarItemsInICSWrapperFromOldCalendar:(id)a3 store:(id)a4;
- (void)_deleteCalendarItemsMovedToCalendar:(id)a3 inICSWrapper:(id)a4;
- (void)_deleteCalendarWithIdentifier:(id)a3 store:(id)a4;
- (void)_deleteDetachedCalendarItemsFromOldCalendar:(id)a3 deletedEvents:(id)a4;
- (void)_deleteEventWithIdentifier:(id)a3 calendarIdentifier:(id)a4 store:(id)a5;
- (void)_deleteReminderWithIdentifier:(id)a3 calendarIdentifier:(id)a4 store:(id)a5;
- (void)_deleteSourceWithIdentifier:(id)a3 store:(id)a4;
- (void)_didCreateEntity:(id)a3;
- (void)_flushQueue;
- (void)_processArrayOfArrayOfICSWrappers:(id)a3 batchWrappers:(id)a4 session:(id)a5;
- (void)_processUpdateFromWatch:(id)a3 calendar:(id)a4 store:(id)a5;
- (void)_processUpdateWithICS:(id)a3 store:(id)a4 calendar:(id)a5 resultWrappers:(id)a6 resultCalendars:(id)a7;
- (void)_removeIdentifierForDeletedEntity:(id)a3;
- (void)_sendChangesIfAvailable;
- (void)addAttendeeEvents:(id)a3;
- (void)applySidePropertiesToEntity:(id)a3 withWrapper:(id)a4 session:(id)a5;
- (void)calendarWrappersForChangeSet:(id)a3 pipe:(id)a4;
- (void)deleteItem:(id)a3 store:(id)a4;
- (void)deleteItemWithIdentifier:(id)a3 store:(id)a4;
- (void)deletionWrappersForChangeSet:(id)a3 skipSourceDeletions:(BOOL)a4 pipe:(id)a5;
- (void)deletionWrappersForSourceAggregator:(id)a3 pipe:(id)a4;
- (void)endMappingEntities;
- (void)getDefaultTaskCalendar:(id *)a3 defaultEventCalendar:(id *)a4 store:(id)a5;
- (void)handleCalendarEventWithUniqueIdentifierFromGizmo:(id)a3 calendar:(id)a4 wrapper:(id)a5 detachedEventMap:(id)a6;
- (void)handleCalendarTaskWithUniqueIdentifierFromGizmo:(id)a3 calendar:(id)a4 wrapper:(id)a5;
- (void)handleNewEntity:(id)a3 withWrapper:(id)a4 session:(id)a5;
- (void)handleUpdatedItemFromGizmo:(id)a3 type:(int64_t)a4 withWrapper:(id)a5 identifier:(id)a6;
- (void)performUpdateWithICSWrappers:(id)a3 store:(id)a4 session:(id)a5;
- (void)purgeRecordMap;
- (void)removeIdentifiersForDeletedRecordIDs:(id)a3;
- (void)saveEventStore:(id)a3;
- (void)startMappingEntities;
- (void)storeWrappersForSourceAggregator:(id)a3 pipe:(id)a4;
- (void)sweepSeenMap;
- (void)updateCalendar:(id)a3 store:(id)a4;
- (void)updateICS:(id)a3 store:(id)a4 session:(id)a5;
- (void)updateInvitationStatusForCalendarItem:(id)a3 identifier:(id)a4 withWrapper:(id)a5 session:(id)a6;
- (void)updateRowMappingForEntity:(id)a3;
- (void)updateSelfAttendeeForCalendarItem:(id)a3 identifier:(id)a4 withWrapper:(id)a5;
- (void)updateSource:(id)a3 store:(id)a4;
@end

@implementation NEKEventStore

- (NEKEventStore)initWithEnvironment:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)NEKEventStore;
  v3 = [(NEKStore *)&v18 initWithEnvironment:a3];
  if (v3)
  {
    uint64_t v4 = sub_100006A20("com.apple.eventkitsync.nekeventstore");
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = sub_100006A20("com.apple.eventkitsync.dbidleblocks");
    idleBlockQueue = v3->_idleBlockQueue;
    v3->_idleBlockQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = sub_100006A20("com.apple.eventkitsync.pipe");
    pipeQueue = v3->_pipeQueue;
    v3->_pipeQueue = (OS_dispatch_queue *)v8;

    v10 = v3->_queue;
    v11 = [(NEKStore *)v3 environment];
    v12 = +[NEKChangeObserver changeObserverForEventWithQueue:v10 databaseController:v3 environment:v11];
    [(NEKStore *)v3 setChangeObserver:v12];

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    createdEntities = v3->_createdEntities;
    v3->_createdEntities = v13;

    v3->_createdEntitiesLock._os_unfair_lock_opaque = 0;
    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    alertSupressionCache = v3->_alertSupressionCache;
    v3->_alertSupressionCache = v15;
  }
  return v3;
}

- (NEKRecordMap)recordMap
{
  v2 = [(NEKStore *)self environment];
  v3 = [v2 recordMap];

  return (NEKRecordMap *)v3;
}

- (NEKSeenMap)seenMap
{
  v2 = [(NEKStore *)self environment];
  v3 = [v2 seenMap];

  return (NEKSeenMap *)v3;
}

- (id)freshEventStoreFor:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)EKChangeTrackingClientId);
  uint64_t v6 = [(NEKStore *)self environment];
  v7 = [v6 clientName];
  id v8 = [v5 initWithCustomClientId:v7];

  v9 = +[EKEventStore eks_eventOnlyStoreIgnoringExternalChangesFor:v4 withClientId:v8];

  return v9;
}

- (void)saveEventStore:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  uint64_t v6 = objc_alloc_init(NDTPerf);
  kdebug_trace();
  id v17 = 0;
  [v4 commit:&v17];
  id v8 = v17;
  kdebug_trace();
  v9 = +[NDTPerf nowMinusPrevious:v6];

  v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    id v12 = [v9 dirtyMemory];
    *(_DWORD *)buf = 134217984;
    double v19 = *(double *)&v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Memory delta from save: %lld #perf", buf, 0xCu);
  }
  v13 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    id v15 = [v9 wallTime];
    *(_DWORD *)buf = 134217984;
    double v19 = (double)(uint64_t)v15 / 1000000000.0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Event database save time: %fs #perf", buf, 0xCu);
  }
  v16 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (v8)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10006C92C();
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Database changes saved successfully", buf, 2u);
    }
    [(NEKEventStore *)self _commitPendingRecordMapChanges];
  }
}

- (void)purgeRecordMap
{
  id v2 = [(NEKEventStore *)self recordMap];
  [v2 removeAllRecords];
}

- (void)getDefaultTaskCalendar:(id *)a3 defaultEventCalendar:(id *)a4 store:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    v9 = [v8 defaultCalendarForNewReminders];
    v10 = [(NEKStore *)self environment];
    unsigned int v11 = [v10 isReminderKitEnabled];

    if (v11)
    {
      id v12 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136446210;
        objc_super v18 = "-[NEKEventStore getDefaultTaskCalendar:defaultEventCalendar:store:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for getting default task calendar", (uint8_t *)&v17, 0xCu);
      }

      v9 = 0;
    }
    v13 = [v8 defaultCalendarForNewEvents];
    v14 = [v8 defaultLocalCalendar];

    if (v14)
    {
      if ([v9 isEqual:v14])
      {

        v9 = 0;
      }
      if ([v13 isEqual:v14])
      {

        v13 = 0;
      }
    }
    id v15 = v9;
    *a3 = v15;
    id v16 = v13;
    *a4 = v16;
  }
}

- (BOOL)_shouldSendEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueId];
  id v6 = [v5 copy];

  if (!v6)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006C994();
    }
    goto LABEL_8;
  }
  if (![v4 isPhantom])
  {
    if ([v4 isDetached])
    {
      unsigned int v11 = [v4 originalItem];
      id v12 = v11;
      if (v11)
      {
        v13 = [v11 uniqueId];
        id v14 = [v13 copy];

        id v15 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = v15;
          int v17 = [v4 eks_debugDesc];
          int v35 = 138543874;
          v36 = v17;
          __int16 v37 = 2114;
          id v38 = v6;
          __int16 v39 = 2114;
          id v40 = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_shouldSendEvent: Entity with summary %{public}@ identifier %{public}@ is detached, master identifier is %{public}@", (uint8_t *)&v35, 0x20u);
        }
      }
      else
      {
        objc_super v18 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          double v19 = v18;
          v20 = [v4 eks_debugDesc];
          int v35 = 138543618;
          v36 = v20;
          __int16 v37 = 2114;
          id v38 = v6;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "_shouldSendEvent: Entity with summary %{public}@ identifier %{public}@ is detached, but can't get master, so using the actual detached event", (uint8_t *)&v35, 0x16u);
        }
        id v14 = v6;
      }

      id v6 = v14;
    }
    v21 = [v4 calendar];
    v22 = v21;
    if (v21)
    {
      v23 = [v21 calendarIdentifier];
      id v24 = [v23 copy];

      if (v24)
      {
        id v25 = [(NSMutableDictionary *)self->_syncedEntityUniqueIdentifiers objectForKey:v24];
        if (!v25)
        {
          id v25 = [objc_alloc((Class)NSMutableSet) initWithCapacity:8];
          [(NSMutableDictionary *)self->_syncedEntityUniqueIdentifiers setObject:v25 forKey:v24];
        }
        if (v6)
        {
          unsigned int v26 = [v25 containsObject:v6];
          v27 = *(NSObject **)(qword_1000C6CA8 + 8);
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
          if (v26)
          {
            if (v28)
            {
              v29 = v27;
              v30 = [v4 eks_debugDesc];
              int v35 = 138543874;
              v36 = v30;
              __int16 v37 = 2114;
              id v38 = v6;
              __int16 v39 = 2114;
              id v40 = v24;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Entity with summary %{public}@ and identifier %{public}@ already in set for calendar with identifier %{public}@, not sending again", (uint8_t *)&v35, 0x20u);
            }
            BOOL v10 = 0;
            goto LABEL_38;
          }
          if (v28)
          {
            v32 = v27;
            v33 = [v4 eks_debugDesc];
            int v35 = 138543874;
            v36 = v33;
            __int16 v37 = 2114;
            id v38 = v6;
            __int16 v39 = 2114;
            id v40 = v24;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Entity with summary %{public}@ and identifier %{public}@ not in set for calendar with identifier %{public}@, adding", (uint8_t *)&v35, 0x20u);
          }
          [v25 addObject:v6];
        }
        else
        {
          v31 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_10006CB2C(v31);
          }
        }
        BOOL v10 = 1;
LABEL_38:

        goto LABEL_39;
      }
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006CA94();
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
    {
      sub_10006C9FC();
    }
    BOOL v10 = 1;
LABEL_39:

    goto LABEL_40;
  }
  v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    v9 = [v4 eks_debugDesc];
    int v35 = 138543618;
    v36 = v9;
    __int16 v37 = 2114;
    id v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Entity with summary %{public}@ identifier %{public}@ is a phantom master.  Ignoring.", (uint8_t *)&v35, 0x16u);
  }
LABEL_8:
  BOOL v10 = 0;
LABEL_40:

  return v10;
}

- (BOOL)_shouldSendReminder:(id)a3
{
  id v4 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [a3 eks_debugDesc];
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Selecting reminder %{public}@", (uint8_t *)&v8, 0xCu);
  }
  return 1;
}

- (BOOL)shouldSendEntity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  id v6 = [v5 entityType];

  if (v6 == (id)2) {
    unsigned __int8 v7 = [(NEKEventStore *)self _shouldSendEvent:v4];
  }
  else {
    unsigned __int8 v7 = [(NEKEventStore *)self _shouldSendReminder:v4];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)startMappingEntities
{
  self->_syncedEntityUniqueIdentifiers = +[NSMutableDictionary dictionary];

  _objc_release_x1();
}

- (void)endMappingEntities
{
  self->_syncedEntityUniqueIdentifiers = 0;
  _objc_release_x1();
}

- (void)updateSource:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019140;
  block[3] = &unk_1000A8D60;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (void)updateCalendar:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 calendarIdentifier];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_100019984;
  v19[4] = sub_100019994;
  id v20 = [v7 calendarWithIdentifier:v8];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001999C;
  block[3] = &unk_1000A9050;
  id v17 = v8;
  objc_super v18 = v19;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_sync(queue, block);

  _Block_object_dispose(v19, 8);
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
  block[2] = sub_100019D0C;
  block[3] = &unk_1000A9078;
  void block[4] = self;
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
  v13[2] = sub_100019E0C;
  v13[3] = &unk_1000A90A0;
  v13[4] = self;
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
      [(NEKEventStore *)self _deleteSourceWithIdentifier:v8 store:v7];
      break;
    case 2u:
      [(NEKEventStore *)self _deleteCalendarWithIdentifier:v8 store:v7];
      break;
    case 3u:
      id v9 = [(NEKStore *)self environment];
      unsigned __int8 v10 = [v9 isReminderKitEnabled];

      if ((v10 & 1) == 0)
      {
        id v14 = [v6 calendarIdentifier];
        [(NEKEventStore *)self _deleteReminderWithIdentifier:v8 calendarIdentifier:v14 store:v7];
        goto LABEL_9;
      }
      id v11 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        id v13 = [v6 identifier];
        int v15 = 136446466;
        id v16 = "-[NEKEventStore deleteItem:store:]";
        __int16 v17 = 2114;
        id v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for reminder with identifier: [%{public}@]", (uint8_t *)&v15, 0x16u);
      }
      break;
    case 4u:
      id v14 = [v6 calendarIdentifier];
      [(NEKEventStore *)self _deleteEventWithIdentifier:v8 calendarIdentifier:v14 store:v7];
LABEL_9:

      break;
    default:
      break;
  }
}

- (void)handleNewEntity:(id)a3 withWrapper:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectID];
  if ([v11 entityType] != (id)2)
  {

    goto LABEL_6;
  }
  unsigned int v12 = [v8 isPhantom];

  if (!v12)
  {
LABEL_6:
    [(NEKEventStore *)self applySidePropertiesToEntity:v8 withWrapper:v9 session:v10];
    goto LABEL_7;
  }
  id v13 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    int v15 = [v8 uniqueId];
    int v18 = 136446466;
    id v19 = "-[NEKEventStore handleNewEntity:withWrapper:session:]";
    __int16 v20 = 2114;
    id v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring sidecar data for phantom master with identifier: [%{public}@]", (uint8_t *)&v18, 0x16u);
  }
LABEL_7:
  id v16 = [v8 objectID];
  __int16 v17 = v16;
  if (v16)
  {
    if ([v16 isTemporary]) {
      [(NEKEventStore *)self _didCreateEntity:v8];
    }
    else {
      [(NEKEventStore *)self updateRowMappingForEntity:v8];
    }
  }
}

- (void)handleUpdatedItemFromGizmo:(id)a3 type:(int64_t)a4 withWrapper:(id)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 eventStore];
  if (a4 == 3)
  {
    v23 = [(NEKStore *)self environment];
    unsigned __int8 v24 = [v23 isReminderKitEnabled];

    if ((v24 & 1) == 0)
    {
      id v14 = v10;
      unsigned int v26 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v26;
        BOOL v28 = sub_10002D3E0([v14 title]);
        *(_DWORD *)buf = 138543618;
        *(void *)v36 = v28;
        *(_WORD *)&v36[8] = 2114;
        *(void *)&v36[10] = v12;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Handling updated task from gizmo with summary \"%{public}@\" and identifier %{public}@", buf, 0x16u);
      }
      if (![v11 isTaskCompleted]) {
        goto LABEL_30;
      }
      [v11 taskCompletionDate];
      int v18 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v14 setCompletionDate:v18];
      v29 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)v36 = v12;
        *(_WORD *)&v36[8] = 2114;
        *(void *)&v36[10] = v18;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Task with identifier %{public}@ is completed, completion date is %{public}@", buf, 0x16u);
      }
      goto LABEL_29;
    }
    id v25 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)v36 = "-[NEKEventStore handleUpdatedItemFromGizmo:type:withWrapper:identifier:]";
      *(_WORD *)&v36[8] = 2114;
      *(void *)&v36[10] = v12;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for reminder with identifier: [%{public}@]", buf, 0x16u);
    }
  }
  else if (a4 == 2)
  {
    id v14 = v10;
    int v15 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      __int16 v17 = [v14 eks_debugDesc];
      *(_DWORD *)buf = 138543618;
      *(void *)v36 = v17;
      *(_WORD *)&v36[8] = 2114;
      *(void *)&v36[10] = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Handling updated event from gizmo with summary %{public}@ and identifier %{public}@", buf, 0x16u);
    }
    int v18 = [v14 selfAttendee];
    if (!v18) {
      goto LABEL_29;
    }
    id v19 = [v11 attendeeStatusForIdentifier:v12];
    if (v19 != [v18 participantStatus])
    {
      [v14 setParticipationStatus:v19];
      v30 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v36 = v19;
        *(_WORD *)&v36[4] = 2114;
        *(void *)&v36[6] = v12;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Set self attendee status to 0x%08x for event with identifier %{public}@", buf, 0x12u);
      }
      if (v19 == (id)1) {
        goto LABEL_29;
      }
      v31 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Set invitation status to none for event with identifier %{public}@", buf, 0xCu);
      }
      [v14 setInvitationStatus:0];
      if ([v14 isMasterOrDetachedOccurrence]) {
        uint64_t v33 = 2;
      }
      else {
        uint64_t v33 = 0;
      }
      id v34 = 0;
      [v13 saveEvent:v14 span:v33 commit:1 error:&v34];
      id v21 = v34;
      if (v21 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006CE68();
      }
      goto LABEL_28;
    }
    __int16 v20 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v20;
      unsigned int v22 = [v11 attendeeStatusForIdentifier:v12];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v36 = v22;
      *(_WORD *)&v36[4] = 2114;
      *(void *)&v36[6] = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No need to set attendee status, synced value is the same as existing value: 0x%08x for event with identifier %{public}@", buf, 0x12u);
LABEL_28:
    }
LABEL_29:

LABEL_30:
  }
}

- (BOOL)updateEvent:(id)a3 identifier:(id)a4 eventStore:(id)a5 occurrenceDate:(id)a6 participationStatus:(int64_t)a7 masterIdentifier:(id)a8 isMaster:(BOOL)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if ([v14 participationStatus] == (id)a7)
  {
    id v19 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = v19;
      id v21 = [v14 externalID];
      *(_DWORD *)buf = 138543618;
      id v33 = v15;
      __int16 v34 = 2114;
      int v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Participant status did not change. No need to save event with identifier %{public}@, externalID is %{public}@", buf, 0x16u);
    }
    LOBYTE(v22) = 1;
  }
  else
  {
    [v14 setParticipationStatus:a7];
    if (a7 >= 2)
    {
      [v14 setInvitationStatus:0];
      v23 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v33 = v15;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Set invitation status to none for event with identifier %{public}@", buf, 0xCu);
      }
    }
    if (a9) {
      uint64_t v25 = 2;
    }
    else {
      uint64_t v25 = 0;
    }
    id v31 = 0;
    unsigned int v22 = [v16 saveEvent:v14 span:v25 commit:0 error:&v31];
    id v26 = v31;
    v27 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (v22)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v28 = v27;
        v29 = [v14 externalID];
        *(_DWORD *)buf = 138543618;
        id v33 = v15;
        __int16 v34 = 2114;
        int v35 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Saved event with identifier %{public}@, externalID is %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      sub_10006CED0();
    }
  }
  return v22;
}

- (BOOL)updateMasterEvent:(id)a3 masterIdentifier:(id)a4 calendarIdentifier:(id)a5 masterParticipationStatus:(int64_t)a6 detachedEvents:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v76 = a5;
  id v13 = a7;
  id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    id v16 = sub_10002D3E0([v11 title]);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v101 = a6;
    *(_WORD *)&v101[4] = 2114;
    *(void *)&v101[6] = v16;
    *(_WORD *)&v101[14] = 2114;
    *(void *)&v101[16] = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handling updated master event from gizmo with participationStatus %d, summary \"%{public}@\", and identifier %{public}@", buf, 0x1Cu);
  }
  id v17 = [v11 objectID];
  id v18 = [v17 rowID];

  if (v18 == -1)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006CF38();
    }
    unsigned __int8 v67 = 0;
  }
  else
  {
    v73 = v11;
    id v19 = +[EKEventStore eks_eventOnlyStoreFor:@"updateMasterEvent:blah..."];
    v78 = +[NSNumber numberWithInt:v18];
    id v74 = v13;
    v83 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v13 count]);
    v81 = v19;
    id v77 = v12;
    [v19 calendarItemsWithExternalIdentifier:v12];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v20 = [obj countByEnumeratingWithState:&v93 objects:v99 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v94;
LABEL_6:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v94 != v22) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v24 = *(void **)(*((void *)&v93 + 1) + 8 * v23);
        uint64_t v25 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = v25;
          v27 = [v24 eks_debugDesc];
          BOOL v28 = [v24 calendarItemExternalIdentifier];
          *(_DWORD *)buf = 138543618;
          *(void *)v101 = v27;
          *(_WORD *)&v101[8] = 2114;
          *(void *)&v101[10] = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Checking for calendar match for event %{public}@ with identifier %{public}@", buf, 0x16u);
        }
        v29 = [v24 calendar];
        v30 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = v30;
          v32 = [v29 calendarIdentifier];
          *(_DWORD *)buf = 138543618;
          *(void *)v101 = v76;
          *(_WORD *)&v101[8] = 2114;
          *(void *)&v101[10] = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Checking for match on calendar, we want %{public}@, calendarIdentifier is %{public}@", buf, 0x16u);
        }
        id v33 = [v29 calendarIdentifier];
        unsigned __int8 v34 = [v33 isEqualToString:v76];

        if (v34) {
          break;
        }

        if (v21 == (id)++v23)
        {
          id v21 = [obj countByEnumeratingWithState:&v93 objects:v99 count:16];
          if (v21) {
            goto LABEL_6;
          }
          goto LABEL_16;
        }
      }
      id v35 = v24;

      if (!v35) {
        goto LABEL_28;
      }
      v36 = *(NSObject **)(qword_1000C6CA8 + 8);
      id v12 = v77;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v37 = v36;
        id v38 = [v35 eks_debugDesc];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v101 = a6;
        *(_WORD *)&v101[4] = 2114;
        *(void *)&v101[6] = v38;
        *(_WORD *)&v101[14] = 2114;
        *(void *)&v101[16] = v77;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Handling master event from gizmo with participation status %d, summary %{public}@, and identifier %{public}@", buf, 0x1Cu);
      }
      __int16 v39 = [v73 startDate];
      LOBYTE(v70) = 1;
      [(NEKEventStore *)self updateEvent:v35 identifier:v77 eventStore:v81 occurrenceDate:v39 participationStatus:a6 masterIdentifier:v77 isMaster:v70];

      v72 = v35;
      id v40 = [v35 detachedItems];
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v41 = [v40 countByEnumeratingWithState:&v89 objects:v98 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v90;
        do
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v90 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = *(void **)(*((void *)&v89 + 1) + 8 * i);
            v46 = [v45 originalStartDate];
            [v83 setObject:v45 forKey:v46];
          }
          id v42 = [v40 countByEnumeratingWithState:&v89 objects:v98 count:16];
        }
        while (v42);
      }

      v47 = v74;
    }
    else
    {
LABEL_16:

LABEL_28:
      id v12 = v77;
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006D008();
      }
      v72 = 0;
      v47 = v74;
    }
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v48 = v47;
    id v82 = [v48 countByEnumeratingWithState:&v85 objects:v97 count:16];
    if (v82)
    {
      uint64_t v80 = *(void *)v86;
      do
      {
        for (j = 0; j != v82; j = (char *)j + 1)
        {
          if (*(void *)v86 != v80) {
            objc_enumerationMutation(v48);
          }
          v50 = *(void **)(*((void *)&v85 + 1) + 8 * (void)j);
          v51 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)[v50 longLongValue]);
          [v51 timeIntervalSinceReferenceDate];
          v53 = +[NSString stringWithFormat:@"%@%@%llu", v12, @"/RID=", (uint64_t)v52];
          v54 = [v48 objectForKeyedSubscript:v50];
          v55 = [v83 objectForKey:v51];
          v56 = [v55 persistentObject];

          v57 = *(NSObject **)(qword_1000C6CA8 + 8);
          BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
          if (v56)
          {
            if (v58)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Using existing detached event", buf, 2u);
            }
            id v59 = [objc_alloc((Class)EKEvent) initWithPersistentObject:v56 occurrenceDate:0];
          }
          else
          {
            if (v58)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Grabbing recurrence to use for detached event", buf, 2u);
            }
            id v59 = [v81 eventForUID:v78 occurrenceDate:v51];
          }
          v60 = v59;
          v61 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (v59)
          {
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              v62 = v61;
              unsigned int v63 = [v54 intValue];
              v64 = [v60 eks_debugDesc];
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v101 = v63;
              *(_WORD *)&v101[4] = 2114;
              *(void *)&v101[6] = v64;
              *(_WORD *)&v101[14] = 2114;
              *(void *)&v101[16] = v53;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Handling updated detached event from gizmo with participation status %d, summary %{public}@, and identifier %{public}@.", buf, 0x1Cu);

              id v12 = v77;
            }
            LOBYTE(v71) = 0;
            -[NEKEventStore updateEvent:identifier:eventStore:occurrenceDate:participationStatus:masterIdentifier:isMaster:](self, "updateEvent:identifier:eventStore:occurrenceDate:participationStatus:masterIdentifier:isMaster:", v60, v53, v81, v51, (int)[v54 intValue], v12, v71);
          }
          else if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            v65 = v61;
            unsigned int v66 = [v54 intValue];
            *(_DWORD *)buf = 138543618;
            *(void *)v101 = v53;
            *(_WORD *)&v101[8] = 1024;
            *(_DWORD *)&v101[10] = v66;
            _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to get/create event with identifier %{public}@ to set attendee status %d, skipping event", buf, 0x12u);
          }
        }
        id v82 = [v48 countByEnumeratingWithState:&v85 objects:v97 count:16];
      }
      while (v82);
    }

    id v84 = 0;
    unsigned __int8 v67 = [v81 commit:&v84];
    id v68 = v84;
    if (v68 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006CFA0();
    }

    id v11 = v73;
    id v13 = v74;
  }

  return v67;
}

- (id)detacheesForIdentifierCreatingIfNeeded:(id)a3 detachedEventMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:v5];
  if (!v7)
  {
    id v7 = +[NSMutableDictionary dictionary];
    [v6 setObject:v7 forKey:v5];
  }

  return v7;
}

- (void)handleCalendarEventWithUniqueIdentifierFromGizmo:(id)a3 calendar:(id)a4 wrapper:(id)a5 detachedEventMap:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v11 eventStore];
  id v15 = [v14 eventWithUniqueId:v10];
  id v16 = v15;
  if (v15)
  {
    id v17 = [v15 calendar];
    unsigned __int8 v18 = [v17 isEqual:v11];

    if ((v18 & 1) == 0)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006D11C();
      }
      goto LABEL_20;
    }
    if (![v16 isDetached])
    {
      if ([v16 hasRecurrenceRules])
      {
        if (([v16 isPhantom] & 1) == 0) {
          id v27 = [(NEKEventStore *)self detacheesForIdentifierCreatingIfNeeded:v10 detachedEventMap:v13];
        }
      }
      else
      {
        [(NEKEventStore *)self handleUpdatedItemFromGizmo:v16 type:2 withWrapper:v12 identifier:v10];
      }
      goto LABEL_20;
    }
  }
  id v19 = [v10 componentsSeparatedByString:@"/RID="];
  if ([v19 count] == (id)2)
  {
    v32 = self;
    id v34 = v13;
    id v20 = [v19 objectAtIndexedSubscript:0];
    id v21 = [v19 objectAtIndexedSubscript:1];
    id v35 = v11;
    uint64_t v22 = +[NSArray arrayWithObjects:&v35 count:1];
    uint64_t v23 = [v14 eventsWithExternalIdentifier:v20 inCalendars:v22];

    if ([v23 count])
    {
      id v31 = v21;
      unsigned __int8 v24 = [v23 objectAtIndexedSubscript:0];
      if ([v24 isPhantom])
      {
        [(NEKEventStore *)v32 handleUpdatedItemFromGizmo:v16 type:2 withWrapper:v12 identifier:v10];
        uint64_t v25 = v20;
        id v26 = v31;
      }
      else
      {
        v30 = v20;
        id v33 = [(NEKEventStore *)v32 detacheesForIdentifierCreatingIfNeeded:v20 detachedEventMap:v34];
        v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 attendeeStatusForIdentifier:v10]);
        id v26 = v31;
        [v33 setObject:v29 forKey:v31];

        uint64_t v25 = v30;
      }

      id v13 = v34;
      goto LABEL_20;
    }

    id v13 = v34;
  }
  else
  {
  }
  BOOL v28 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_10006D070((uint64_t)v10, v28, v12);
  }
LABEL_20:
}

- (void)handleCalendarTaskWithUniqueIdentifierFromGizmo:(id)a3 calendar:(id)a4 wrapper:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NEKStore *)self environment];
  unsigned __int8 v12 = [v11 isReminderKitEnabled];

  if (v12)
  {
    id v13 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136446466;
      id v20 = "-[NEKEventStore handleCalendarTaskWithUniqueIdentifierFromGizmo:calendar:wrapper:]";
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path for reminder with identifier: [%{public}@]", (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    id v14 = [v9 eventStore];
    id v23 = v9;
    id v15 = +[NSArray arrayWithObjects:&v23 count:1];
    id v16 = [v14 remindersWithExternalIdentifier:v8 inCalendars:v15];
    id v17 = [v16 objectAtIndexedSubscript:0];

    if (v17)
    {
      [(NEKEventStore *)self handleUpdatedItemFromGizmo:v17 type:3 withWrapper:v10 identifier:v8];
    }
    else
    {
      unsigned __int8 v18 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10006D184((uint64_t)v8, v18, v10);
      }
    }
  }
}

- (id)_filterOutInvalidICSWrappers:(id)a3 store:(id)a4 calendars:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v29 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v6 count]];
  id v28 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v6 count]];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v39 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received ICS wrapper: %{public}@", buf, 0xCu);
        }
        id v15 = [v12 ICSData];

        if (v15)
        {
          id v16 = *(NSObject **)(qword_1000C6CB0 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            sub_10006D2A4(v36, v16, v12, &v37);
          }
        }
        else if (os_variant_has_internal_diagnostics())
        {
          id v17 = *(NSObject **)(qword_1000C6CB0 + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            unsigned __int8 v18 = v17;
            int v19 = [v12 lzfseICSData];
            id v20 = [v19 base64EncodedStringWithOptions:0];
            *(_DWORD *)buf = 138412290;
            __int16 v39 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "recv LZFSE: <<!%@!>>", buf, 0xCu);
          }
        }
        __int16 v21 = [v12 calendarIdentifier];
        id v22 = +[NEKCalendarID calendarInStore:v7 withNEKCalendarID:v21];

        if (v22)
        {
          [v29 addObject:v22];
          [v28 addObject:v12];
        }
        else
        {
          id v23 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_10006D230(&v34, v23, v12, &v35);
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v9);
  }

  if (a5) {
    *a5 = [v29 copy];
  }
  id v24 = [v28 copy];

  return v24;
}

- (void)_processUpdateFromWatch:(id)a3 calendar:(id)a4 store:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v31 = a5;
  id v9 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    id v11 = [v7 objectIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v43 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Processing update from the watch, main identifier is %{public}@", buf, 0xCu);
  }
  unsigned __int8 v12 = +[NSMutableDictionary dictionary];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001C1C0;
  v37[3] = &unk_1000A90C8;
  id v38 = v7;
  __int16 v39 = self;
  id v30 = v8;
  id v40 = v30;
  id v13 = v12;
  id v41 = v13;
  id v28 = v38;
  [v38 enumerateCalendarItemIdentifiersUsingBlock:v37];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v29 = *(void *)v34;
    do
    {
      id v17 = 0;
      id v26 = v16;
      do
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v14);
        }
        unsigned __int8 v18 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v17);
        int v19 = [v14 objectForKeyedSubscript:v18];
        id v46 = v30;
        id v20 = +[NSArray arrayWithObjects:&v46 count:1];
        __int16 v21 = [v31 calendarItemsWithExternalIdentifier:v18 inCalendars:v20];
        id v22 = [v21 firstObject];

        if (v22)
        {
          if ([v19 count])
          {
            id v23 = [v28 calendarIdentifier];
            id v24 = [v23 identifier];
            id v16 = v26;
            -[NEKEventStore updateMasterEvent:masterIdentifier:calendarIdentifier:masterParticipationStatus:detachedEvents:](self, "updateMasterEvent:masterIdentifier:calendarIdentifier:masterParticipationStatus:detachedEvents:", v22, v18, v24, [v28 attendeeStatusForIdentifier:v18], v19);
LABEL_11:

            goto LABEL_15;
          }
          [(NEKEventStore *)self handleUpdatedItemFromGizmo:v22 type:2 withWrapper:v28 identifier:v18];
        }
        else
        {
          uint64_t v25 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v23 = v25;
            id v24 = [v28 calendarIdentifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v43 = v18;
            __int16 v44 = 2114;
            v45 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No calendar item found for main event in recurring series with identifier %{public}@ in calendar with identifier %{public}@", buf, 0x16u);
            goto LABEL_11;
          }
        }
LABEL_15:

        id v17 = (char *)v17 + 1;
      }
      while (v16 != v17);
      id v16 = [v14 countByEnumeratingWithState:&v33 objects:v47 count:16];
    }
    while (v16);
  }
}

- (void)_processUpdateWithICS:(id)a3 store:(id)a4 calendar:(id)a5 resultWrappers:(id)a6 resultCalendars:(id)a7
{
  id v12 = a3;
  id v71 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    unsigned __int8 v18 = [v12 nuevoIdentifier];
    *(_DWORD *)buf = 138543362;
    v78 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Processing add/update from companion, or a new record from the watch, id = %{public}@", buf, 0xCu);
  }
  uint64_t v19 = [v12 oldIdentifier];
  if (v19)
  {
    id v20 = (id)v19;
    uint64_t v21 = [v12 nuevoIdentifier];
    if (!v21)
    {
LABEL_23:

      goto LABEL_24;
    }
    id v22 = (void *)v21;
    [v12 oldIdentifier];
    id v23 = v69 = self;
    [v12 nuevoIdentifier];
    id v24 = v70 = v15;
    unsigned __int8 v25 = [v23 isEqualToString:v24];

    id v15 = v70;
    self = v69;

    if ((v25 & 1) == 0)
    {
      id v67 = v14;
      id v68 = v13;
      [v71 sources];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = [v20 countByEnumeratingWithState:&v73 objects:v81 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v74;
        while (2)
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v74 != v28) {
              objc_enumerationMutation(v20);
            }
            id v30 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            long long v32 = [v12 oldIdentifier];
            long long v33 = [v30 allCalendars];
            long long v34 = [v33 allObjects];
            long long v35 = [v71 eventsWithExternalIdentifier:v32 inCalendars:v34];

            if (v35 && [v35 count])
            {
              long long v36 = [v35 objectAtIndexedSubscript:0];
              id v72 = 0;
              [v71 removeEvent:v36 span:objc_msgSend(v36, "isMasterOrDetachedOccurrence") error:&v72];
              id v37 = v72;
              if (v37 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
                sub_10006D3E4();
              }
              id v38 = *(NSObject **)(qword_1000C6CA8 + 8);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                id v39 = v37;
                id v40 = v38;
                id v41 = [v12 oldIdentifier];
                id v42 = [v12 nuevoIdentifier];
                *(_DWORD *)buf = 138543618;
                v78 = v41;
                __int16 v79 = 2114;
                uint64_t v80 = v42;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Item ID remapping complete: %{public}@ => %{public}@", buf, 0x16u);

                id v37 = v39;
              }

              goto LABEL_22;
            }
          }
          id v27 = [v20 countByEnumeratingWithState:&v73 objects:v81 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }
LABEL_22:

      id v14 = v67;
      id v13 = v68;
      self = v69;
      id v15 = v70;
      goto LABEL_23;
    }
  }
LABEL_24:
  uint64_t v43 = [v12 oldCalendarIdentifier];
  if (!v43) {
    goto LABEL_29;
  }
  __int16 v44 = (void *)v43;
  v45 = [v12 calendarIdentifier];
  id v46 = [v45 identifier];

  if (v46)
  {
    v47 = [v12 oldCalendarIdentifier];
    id v48 = [v12 calendarIdentifier];
    v49 = [v48 identifier];
    unsigned __int8 v50 = [v47 isEqualToString:v49];

    v51 = *(NSObject **)(qword_1000C6CA8 + 8);
    BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
    if (v50)
    {
      if (v52)
      {
        v53 = v51;
        v54 = [v12 calendarIdentifier];
        v55 = [v54 identifier];
        *(_DWORD *)buf = 138543362;
        v78 = v55;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Calendars match, so event didn't move: calendar id = %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (v52)
      {
        unsigned int v63 = v51;
        v64 = [v12 oldCalendarIdentifier];
        v65 = [v12 calendarIdentifier];
        unsigned int v66 = [v65 identifier];
        *(_DWORD *)buf = 138543618;
        v78 = v64;
        __int16 v79 = 2114;
        uint64_t v80 = v66;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Calendars don't match, so deleting from old calendar: old calendar id = %{public}@, current calendar id = %{public}@", buf, 0x16u);
      }
      [(NEKEventStore *)self _deleteCalendarItemsInICSWrapperFromOldCalendar:v12 store:v71];
    }
  }
  else
  {
LABEL_29:
    v56 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = v56;
      BOOL v58 = [v12 title];
      id v59 = sub_10002D3E0(v58);
      v60 = [v12 calendarIdentifier];
      [v60 identifier];
      v62 = v61 = self;
      *(_DWORD *)buf = 138543618;
      v78 = v59;
      __int16 v79 = 2114;
      uint64_t v80 = v62;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Got an update/add for event \"%{public}@\", no old calendar id was sent, so this is from an old record map and falling back to old code to check and delete from any old calendar. The current calendar id = %{public}@", buf, 0x16u);

      self = v61;
    }
    [(NEKEventStore *)self _deleteCalendarItemsMovedToCalendar:v13 inICSWrapper:v12];
  }
  [v14 addObject:v12];
  [v15 addObject:v13];
}

- (void)_processArrayOfArrayOfICSWrappers:(id)a3 batchWrappers:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v42 = a4;
  id v9 = a5;
  uint64_t v10 = v8;
  id v11 = v9;
  if ([v8 count])
  {
    uint64_t v12 = 0;
    id v13 = &qword_1000C6CA8;
    id v14 = &OBJC_IVAR___NDTLogFacility_os_log_facility;
    id v41 = v10;
    do
    {
      id v15 = [v42 objectAtIndex:v12];
      uint64_t v44 = v12;
      id v16 = [v10 objectAtIndex:v12];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id obj = v16;
      id v17 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v59;
        uint64_t v45 = *(void *)v59;
        v51 = v15;
        do
        {
          id v20 = 0;
          id v46 = v18;
          do
          {
            if (*(void *)v59 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v20);
            [(NEKEventStore *)self handleNewEntity:v21 withWrapper:v15 session:v11];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v49 = v21;
              if (([v49 hasRecurrenceRules] & 1) != 0
                || [v49 isPhantom])
              {
                id v48 = v20;
                id v22 = *(NSObject **)(*v13 + *v14);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  id v23 = v22;
                  id v24 = [v49 eks_debugDesc];
                  unsigned __int8 v25 = [v49 uniqueId];
                  *(_DWORD *)buf = 138543618;
                  v64 = v24;
                  __int16 v65 = 2114;
                  unsigned int v66 = v25;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "We have a recurring event %{public}@ and identifier %{public}@, checking to see if any detached events need attention", buf, 0x16u);
                }
                id v26 = [v49 detachedItems];
                long long v54 = 0u;
                long long v55 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                id v53 = v26;
                id v27 = [v26 countByEnumeratingWithState:&v54 objects:v62 count:16];
                if (v27)
                {
                  id v28 = v27;
                  uint64_t v29 = *(void *)v55;
                  uint64_t v52 = *(void *)v55;
                  do
                  {
                    for (i = 0; i != v28; i = (char *)i + 1)
                    {
                      if (*(void *)v55 != v29) {
                        objc_enumerationMutation(v53);
                      }
                      id v31 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                      long long v32 = *(NSObject **)(*v13 + *v14);
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                      {
                        long long v33 = v32;
                        [v31 eks_debugDesc];
                        long long v34 = v14;
                        id v35 = v11;
                        id v37 = v36 = self;
                        [v31 uniqueId];
                        id v38 = v28;
                        v40 = id v39 = v13;
                        *(_DWORD *)buf = 138543618;
                        v64 = v37;
                        __int16 v65 = 2114;
                        unsigned int v66 = v40;
                        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "performUpdateWithICSWrappers: handling detached event %{public}@ identifier %{public}@", buf, 0x16u);

                        id v13 = v39;
                        id v28 = v38;

                        self = v36;
                        id v11 = v35;
                        id v14 = v34;
                        id v15 = v51;
                        uint64_t v29 = v52;
                      }
                      [(NEKEventStore *)self handleNewEntity:v31 withWrapper:v15 session:v11];
                    }
                    id v28 = [v53 countByEnumeratingWithState:&v54 objects:v62 count:16];
                  }
                  while (v28);
                }

                uint64_t v19 = v45;
                id v18 = v46;
                id v20 = v48;
              }
            }
            id v20 = (char *)v20 + 1;
          }
          while (v20 != v18);
          id v18 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
        }
        while (v18);
      }

      uint64_t v12 = v44 + 1;
      uint64_t v10 = v41;
    }
    while (v44 + 1 < (unint64_t)[v41 count]);
  }
}

- (void)performUpdateWithICSWrappers:(id)a3 store:(id)a4 session:(id)a5
{
  id v7 = a3;
  id v46 = a4;
  id v42 = a5;
  id v8 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    *(_DWORD *)buf = 67109120;
    LODWORD(v57) = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "performUpdateWithICSWrappers received %d items", buf, 8u);
  }
  id v55 = 0;
  uint64_t v10 = [(NEKEventStore *)self _filterOutInvalidICSWrappers:v7 store:v46 calendars:&v55];
  id v11 = v55;

  id v12 = [v10 count];
  id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];
  id v44 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v10;
  id v14 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v52;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v18);
        uint64_t v21 = [v11 objectAtIndexedSubscript:(char *)v18 + v16];
        id v22 = [v19 ICSData];
        if (v22)
        {

LABEL_11:
          [(NEKEventStore *)self _processUpdateWithICS:v19 store:v46 calendar:v21 resultWrappers:v13 resultCalendars:v44];
          goto LABEL_12;
        }
        id v23 = [v19 lzfseICSData];

        if (v23) {
          goto LABEL_11;
        }
        [(NEKEventStore *)self _processUpdateFromWatch:v19 calendar:v21 store:v46];
LABEL_12:

        id v18 = (char *)v18 + 1;
      }
      while (v15 != v18);
      id v24 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
      id v15 = v24;
      v16 += (uint64_t)v18;
    }
    while (v24);
  }

  id v25 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v13 count]];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v26 = v13;
  id v27 = [v26 countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = *(void *)v48;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v26);
        }
        long long v33 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        long long v34 = [v33 lzfseICSData];

        if (v34)
        {
          ++v29;
          [v33 lzfseICSData];
        }
        else
        {
          ++v30;
          [v33 ICSData];
        id v35 = };
        [v25 addObject:v35];
      }
      id v28 = [v26 countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v28);
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
  }

  if ([v26 count])
  {
    kdebug_trace();
    double Current = CFAbsoluteTimeGetCurrent();
    if (v29)
    {
      if (v30)
      {
        id v37 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
          sub_10006D44C(v37);
        }
        goto LABEL_38;
      }
      uint64_t v38 = 2147483776;
    }
    else
    {
      uint64_t v38 = 0x80000000;
    }
    id v39 = [v46 importICSData:v25 intoCalendars:v44 options:v38];
    kdebug_trace();
    double v40 = CFAbsoluteTimeGetCurrent();
    id v41 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v57 = v40 - Current;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "ICS Import: %fs #perf", buf, 0xCu);
    }
    [(NEKEventStore *)self _processArrayOfArrayOfICSWrappers:v39 batchWrappers:v26 session:v42];
  }
LABEL_38:
}

- (void)_deleteDetachedCalendarItemsFromOldCalendar:(id)a3 deletedEvents:(id)a4
{
  id v5 = a3;
  if ([v5 hasRecurrenceRules])
  {
    id v6 = &qword_1000C6CA8;
    id v7 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      id v9 = sub_10002D3E0([v5 title]);
      uint64_t v10 = [v5 uniqueId];
      *(_DWORD *)buf = 138543618;
      long long v33 = v9;
      __int16 v34 = 2114;
      id v35 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "We have a recurring event with summary \"%{public}@\" and identifier %{public}@, deleting all detached events too, since they have also moved calendars", buf, 0x16u);
    }
    [v5 detachedItems];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      id v13 = v11;
      uint64_t v14 = *(void *)v28;
      *(void *)&long long v12 = 138543618;
      long long v24 = v12;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v17 = *(NSObject **)(*v6 + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = v17;
            uint64_t v19 = sub_10002D3E0([v16 title]);
            [v16 uniqueId];
            v21 = id v20 = v6;
            *(_DWORD *)buf = v24;
            long long v33 = v19;
            __int16 v34 = 2114;
            id v35 = v21;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Deleting detached event from old calendar since it has moved. Event summary \"%{public}@\", identifier %{public}@", buf, 0x16u);

            id v6 = v20;
          }
          id v22 = [v5 eventStore:v24];
          id v26 = 0;
          [v22 removeEvent:v16 span:0 error:&v26];
          id v23 = v26;

          [(NEKEventStore *)self _removeIdentifierForDeletedEntity:v16];
        }
        id v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }
  }
}

- (void)_deleteCalendarItemsInICSWrapperFromOldCalendar:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 oldCalendarIdentifier];
  if (v8)
  {
    id v9 = [v7 calendarWithIdentifier:v8];
    if (v9)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10001D77C;
      v11[3] = &unk_1000A90F0;
      id v12 = objc_alloc_init((Class)NSMutableSet);
      id v13 = v8;
      id v14 = v6;
      id v15 = v7;
      id v16 = v9;
      uint64_t v17 = self;
      id v10 = v12;
      [v14 enumerateCalendarItemIdentifiersUsingBlock:v11];
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
    {
      sub_10006D490();
    }
  }
}

- (void)_deleteCalendarItemsMovedToCalendar:(id)a3 inICSWrapper:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001DB68;
  v8[3] = &unk_1000A9118;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v6 = v10;
  id v7 = v9;
  [v6 enumerateCalendarItemIdentifiersUsingBlock:v8];
}

- (void)applySidePropertiesToEntity:(id)a3 withWrapper:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    id v12 = [v11 uniqueId];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v11;
      id v14 = [v13 uniqueId];
      unsigned __int8 v15 = [v9 hasPropertiesForIdentifier:v14];

      if ((v15 & 1) == 0)
      {
        long long v50 = self;
        id v51 = v10;
        id v16 = [v9 startDateMap];
        uint64_t v17 = [v13 startDate];
        id v18 = [v16 objectForKeyedSubscript:v17];
        if (v18)
        {
          uint64_t v19 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = v19;
            long long v49 = [v13 uniqueId];
            *(_DWORD *)buf = 138543618;
            *(void *)long long v54 = v49;
            *(_WORD *)&v54[8] = 2114;
            *(void *)&v54[10] = v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Changing event id from %{public}@ to %{public}@", buf, 0x16u);
          }
          [v13 setUniqueId:v18, v49];
          id v21 = v18;

          id v12 = v21;
        }

        self = v50;
        id v10 = v51;
      }
    }
    [(NEKEventStore *)self updateSelfAttendeeForCalendarItem:v11 identifier:v12 withWrapper:v9];
    id v22 = [v9 externalIDForIdentifier:v12];
    id v23 = *(NSObject **)(qword_1000C6CA8 + 8);
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        *(_DWORD *)buf = 138543618;
        *(void *)long long v54 = v22;
        *(_WORD *)&v54[8] = 2114;
        *(void *)&v54[10] = v12;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "setting externalID %{public}@ for event with identifier %{public}@", buf, 0x16u);
      }
      [v11 setExternalID:v22];
    }
    else if (v24)
    {
      *(_DWORD *)buf = 138543362;
      *(void *)long long v54 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No externalID in metadata for event with identifier %{public}@", buf, 0xCu);
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v26 = v11;
    long long v27 = v26;
    if (isKindOfClass)
    {
      long long v28 = self;
      id v29 = [v9 dateChangedForIdentifier:v12];
      if (v29 != [v27 dateChanged])
      {
        [v27 setDateChanged:v29];
        long long v30 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v54 = v29;
          *(_WORD *)&v54[4] = 2114;
          *(void *)&v54[6] = v12;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Changed date changed flag to %d for event %{public}@", buf, 0x12u);
        }
      }
      id v31 = [v9 timeChangedForIdentifier:v12];
      if (v31 != [v27 timeChanged])
      {
        [v27 setTimeChanged:v31];
        long long v32 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v54 = v31;
          *(_WORD *)&v54[4] = 2114;
          *(void *)&v54[6] = v12;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Changed time changed flag to %d for event %{public}@", buf, 0x12u);
        }
      }
      id v33 = [v9 titleChangedForIdentifier:v12];
      if (v33 != [v27 titleChanged])
      {
        [v27 setTitleChanged:v33];
        __int16 v34 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v54 = v33;
          *(_WORD *)&v54[4] = 2114;
          *(void *)&v54[6] = v12;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Changed title changed flag to %d for event %{public}@", buf, 0x12u);
        }
      }
      id v35 = [v9 locationChangedForIdentifier:v12];
      if (v35 != [v27 locationChanged])
      {
        [v27 setLocationChanged:v35];
        long long v36 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v54 = v35;
          *(_WORD *)&v54[4] = 2114;
          *(void *)&v54[6] = v12;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Changed location changed flag to %d for event %{public}@", buf, 0x12u);
        }
      }
      id v37 = [v9 attendeeCommentForIdentifier:v12];
      if (v37 != [v27 attendeeComment])
      {
        [v27 setAttendeeComment:v37];
        uint64_t v38 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v54 = v37;
          *(_WORD *)&v54[4] = 2114;
          *(void *)&v54[6] = v12;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Changed attendee comment changed flag to %d for event %{public}@", buf, 0x12u);
        }
      }
      id v39 = [v9 attendeeStatusFlagForIdentifier:v12];
      if (v39 != [v27 attendeeStatus])
      {
        [v27 setAttendeeStatus:v39];
        double v40 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v54 = v39;
          *(_WORD *)&v54[4] = 2114;
          *(void *)&v54[6] = v12;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Changed attendee status changed flag to %d for event %{public}@", buf, 0x12u);
        }
      }
      id v41 = [v9 locationPredictionStateForIdentifier:v12];
      id v42 = [v41 unsignedIntegerValue];

      if (v42 != [v27 locationPredictionState])
      {
        [v27 setLocationPredictionState:v42];
        uint64_t v43 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v54 = v42;
          *(_WORD *)&v54[4] = 2114;
          *(void *)&v54[6] = v12;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Setting location prediction state to %d for event %{public}@", buf, 0x12u);
        }
      }
      [(NEKEventStore *)v28 updateInvitationStatusForCalendarItem:v27 identifier:v12 withWrapper:v9 session:v10];
      uint64_t v45 = [v27 eventStore];
      if ([v27 isMasterOrDetachedOccurrence]) {
        uint64_t v46 = 2;
      }
      else {
        uint64_t v46 = 0;
      }
      id v52 = 0;
      [v45 saveEvent:v27 span:v46 error:&v52];
      id v47 = v52;

      if (v47 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006D6D4();
      }
      long long v48 = v27;
    }
    else
    {
      long long v48 = [v26 eventStore];
      [v48 saveReminder:v27 error:0];
      id v47 = v27;
    }
  }
}

- (void)updateSelfAttendeeForCalendarItem:(id)a3 identifier:(id)a4 withWrapper:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 selfAttendeeEmailForIdentifier:v8];
  uint64_t v11 = [v9 selfAttendeeUUIDForIdentifier:v8];
  long long v61 = [v7 eventStore];
  id v12 = *(NSObject **)(qword_1000C6CA8 + 8);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10 | v11)
  {
    if (v13)
    {
      id v14 = v12;
      unsigned __int8 v15 = sub_10002D3E0((void *)v10);
      sub_10002D3E0((void *)v11);
      uint64_t v17 = v16 = v9;
      *(_DWORD *)buf = 138543874;
      *(void *)id v70 = v15;
      *(_WORD *)&v70[8] = 2114;
      id v71 = v17;
      __int16 v72 = 2114;
      id v73 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Self attendee email is %{public}@, and uuid is %{public}@ for event with identifier %{public}@", buf, 0x20u);

      id v9 = v16;
    }
    id v18 = [v7 attendees];
    uint64_t v19 = v18;
    if (v18)
    {
      unsigned int v55 = [v18 count];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id obj = v19;
      id v20 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v65;
        id v53 = v8;
        long long v54 = v7;
        id v56 = v9;
        id v51 = v19;
        while (2)
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v65 != v22) {
              objc_enumerationMutation(obj);
            }
            BOOL v24 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            id v25 = [v24 emailAddress];
            id v26 = [v24 URL];
            if (([(id)v10 isEqualToString:v25] & 1) != 0
              || ([v26 absoluteString],
                  long long v27 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v28 = [(id)v11 isEqualToString:v27],
                  v27,
                  v28))
            {
              [v54 setSelfAttendee:v24];
              id v31 = *(NSObject **)(qword_1000C6CA8 + 8);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                long long v32 = v31;
                id v33 = sub_10002D3E0((void *)v10);
                __int16 v34 = sub_10002D3E0((void *)v11);
                *(_DWORD *)buf = 138543874;
                *(void *)id v70 = v53;
                *(_WORD *)&v70[8] = 2114;
                id v71 = v33;
                __int16 v72 = 2114;
                id v73 = v34;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Found self attendee for event with identifier %{public}@, email = %{public}@, address = %{public}@", buf, 0x20u);
              }
              int v29 = 1;
              id v8 = v53;
              id v7 = v54;
              id v9 = v56;
              uint64_t v19 = v51;
              goto LABEL_23;
            }
          }
          id v21 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
          int v29 = 0;
          id v8 = v53;
          id v7 = v54;
          id v9 = v56;
          uint64_t v19 = v51;
          if (v21) {
            continue;
          }
          break;
        }
      }
      else
      {
        int v29 = 0;
      }
LABEL_23:
    }
    else
    {
      unsigned int v55 = 0;
      int v29 = 0;
    }

    BOOL v30 = v29 != 0;
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      *(void *)id v70 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No self attendee email in wrapper for event with identifier %{public}@", buf, 0xCu);
    }
    unsigned int v55 = 0;
    BOOL v30 = 0;
  }
  id v35 = [v7 organizer];
  if (!v35)
  {
LABEL_31:
    long long v36 = (void *)v10;
    id v37 = (void *)v11;
    if (!v30) {
      goto LABEL_44;
    }
    goto LABEL_32;
  }
  long long v36 = [v9 selfOrganizerEmailForIdentifier:v8];

  id v37 = [v9 selfOrganizerUUIDForIdentifier:v8];

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v11 = (uint64_t)v37;
    uint64_t v10 = (uint64_t)v36;
    goto LABEL_31;
  }
  id v57 = v9;
  uint64_t v38 = v7;
  id v39 = [v35 emailAddress];
  double v40 = [v35 URL];
  id v41 = v40;
  if (v40)
  {
    id v42 = [v40 absoluteString];
  }
  else
  {
    id v42 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v39 && ([v36 isEqualToString:v39] & 1) != 0
     || v42 && [v37 isEqualToString:v42]))
  {
    [v35 setCurrentUser:1];
    [v38 setOrganizer:v35];
    long long v49 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      obja = v49;
      id v52 = sub_10002D3E0(v36);
      long long v50 = sub_10002D3E0(v37);
      *(_DWORD *)buf = 138543874;
      *(void *)id v70 = v8;
      *(_WORD *)&v70[8] = 2114;
      id v71 = v52;
      __int16 v72 = 2114;
      id v73 = v50;
      _os_log_impl((void *)&_mh_execute_header, obja, OS_LOG_TYPE_DEFAULT, "Determined user is organizer for event with identifier %{public}@, email = %{public}@, address = %{public}@", buf, 0x20u);
    }
    id v7 = v38;
    id v9 = v57;
  }
  else
  {

    id v7 = v38;
    id v9 = v57;
    if (!v30) {
      goto LABEL_44;
    }
  }
LABEL_32:
  id v58 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = v7;
    if ([v44 isMasterOrDetachedOccurrence]) {
      uint64_t v45 = 3;
    }
    else {
      uint64_t v45 = 0;
    }
    uint64_t v46 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)id v70 = v55;
      *(_WORD *)&v70[4] = 1024;
      *(_DWORD *)&v70[6] = v45;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "updateSelfAttendeeForCalendarItem saving, attendees: %d, span: %d", buf, 0xEu);
    }
    uint64_t v63 = 0;
    id v47 = (id *)&v63;
    [v61 saveEvent:v44 span:v45 error:&v63];
  }
  else
  {
    uint64_t v62 = 0;
    id v47 = (id *)&v62;
    [v61 saveReminder:v7 error:&v62];
  }
  id v48 = *v47;
  if (v48 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
    sub_10006D73C();
  }

  id v9 = v58;
LABEL_44:
}

- (void)updateInvitationStatusForCalendarItem:(id)a3 identifier:(id)a4 withWrapper:(id)a5 session:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (_UNKNOWN **)a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [v12 invitationStatusForIdentifier:v11];
    unsigned __int8 v15 = [v12 properInvitationStatusForIdentifier:v11];
    if (v15)
    {
      id v16 = v15;
      if ([v15 unsignedIntegerValue] == (id)2)
      {

        id v16 = &off_1000AF1B8;
      }
      uint64_t v17 = v16;

      id v14 = v17;
    }
    else
    {
      if (!v14)
      {
        long long v27 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v35 = v11;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No invitation status in wrapper for event with identifier %{public}@", buf, 0xCu);
        }
        uint64_t v17 = 0;
        id v14 = 0;
        goto LABEL_23;
      }
      uint64_t v17 = 0;
    }
    signed int v18 = [v14 intValue];
    if (([v13 isResetSync] & 1) == 0)
    {
      if (v18 == 3)
      {
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        uint64_t v19 = [v10 eks_cacheKey];
        int v29 = [(NSMutableDictionary *)self->_alertSupressionCache objectForKeyedSubscript:v19];

        +[NSDate timeIntervalSinceReferenceDate];
        id v21 = +[NSNumber numberWithDouble:v20 + 28800.0 + -1.0];
        [(NSMutableDictionary *)self->_alertSupressionCache setObject:v21 forKeyedSubscript:v19];

        objc_initWeak(&location, self);
        dispatch_time_t v22 = dispatch_time(0, 28800000000000);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001F274;
        block[3] = &unk_1000A9140;
        objc_copyWeak(&v32, &location);
        id v24 = v19;
        id v31 = v24;
        dispatch_after(v22, queue, block);
        if (v29)
        {

          id v25 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v35 = (_UNKNOWN **)v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Suppressing alert due to cache hit on %@", buf, 0xCu);
          }
          id v14 = &off_1000AF1D0;
          uint64_t v26 = 2;
        }
        else
        {
          uint64_t v26 = 3;
        }

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
      }
      else
      {
        uint64_t v26 = v18;
      }
      unsigned int v28 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v35 = v14;
        __int16 v36 = 2114;
        id v37 = v11;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Setting invitation status %{public}@ for event with identifier %{public}@", buf, 0x16u);
      }
      [v10 setInvitationStatus:v26];
    }
LABEL_23:
  }
}

- (void)addAttendeeEvents:(id)a3
{
  id v5 = a3;
  id v6 = [NEKStoreRoller alloc];
  id v7 = NSStringFromSelector(a2);
  id v8 = [(NEKStoreRoller *)v6 initWithEventStore:self cause:v7];

  uint64_t v9 = objc_opt_class();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001F4A8;
  v12[3] = &unk_1000A9168;
  id v13 = v8;
  id v14 = v5;
  id v10 = v5;
  uint64_t v11 = v8;
  [v10 enumerateForChangeType:3 forEntitiesOfClass:v9 withBlock:v12];
}

- (void)storeWrappersForSourceAggregator:(id)a3 pipe:(id)a4
{
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [a3 insertedOrUpdatedSources];
  id v30 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v30)
  {
    id v8 = &OBJC_IVAR___NDTLogFacility_os_log_facility;
    uint64_t v9 = *(void *)v32;
    *(void *)&long long v7 = 138412290;
    long long v24 = v7;
    id v25 = self;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v12 = -[NEKEventStore wrapperForSource:](self, "wrapperForSource:", v11, v24);
        if (v12)
        {
          if (([v11 allowsEvents] & 1) != 0
            || ([v11 allowsTasks] & 1) == 0)
          {
            [(NEKEventStore *)self updateRowMappingForEntity:v11];
          }
          id v13 = *(NSObject **)(qword_1000C6CA8 + *v8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            log = v13;
            int v29 = [v12 attributes];
            id v14 = [v29 accountPersistentID];
            long long v27 = [v12 attributes];
            unsigned __int8 v15 = v8;
            unsigned int v16 = [v27 isLocalStore];
            uint64_t v17 = [v12 attributes];
            uint64_t v18 = v9;
            id v19 = v6;
            unsigned int v20 = [v17 allowsEvents];
            id v21 = [v12 attributes];
            unsigned int v22 = [v21 allowsTasks];
            *(_DWORD *)buf = 138544130;
            __int16 v36 = v14;
            __int16 v37 = 1024;
            unsigned int v38 = v16;
            id v8 = v15;
            __int16 v39 = 1024;
            unsigned int v40 = v20;
            id v6 = v19;
            uint64_t v9 = v18;
            __int16 v41 = 1024;
            unsigned int v42 = v22;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Sending source wrapper accountPersistentID=%{public}@ isLocalStore=%d events=%d tasks=%d", buf, 0x1Eu);

            self = v25;
          }
          if (![v6 push:v12])
          {

            goto LABEL_18;
          }
        }
        else
        {
          id v23 = *(NSObject **)(qword_1000C6CA8 + *v8);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            __int16 v36 = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Can't create wrapper for source %@", buf, 0xCu);
          }
        }
      }
      id v30 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v30);
  }
LABEL_18:
}

- (void)calendarWrappersForChangeSet:(id)a3 pipe:(id)a4
{
  id v28 = a3;
  id v7 = a4;
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [(NEKEventStore *)self freshEventStoreFor:v8];

  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  id v40 = 0;
  id v41 = 0;
  [(NEKEventStore *)self getDefaultTaskCalendar:&v41 defaultEventCalendar:&v40 store:v9];
  id v10 = v41;
  id v11 = v40;
  uint64_t v12 = objc_opt_class();
  int v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  long long v31 = sub_10001FE5C;
  long long v32 = &unk_1000A9190;
  id v13 = v9;
  id v33 = v13;
  long long v34 = self;
  id v14 = v10;
  id v35 = v14;
  unsigned int v38 = &v46;
  id v15 = v11;
  id v36 = v15;
  __int16 v39 = &v42;
  id v16 = v7;
  id v37 = v16;
  [v28 enumerateForChangeType:3 forEntitiesOfClass:v12 withBlock:&v29];
  uint64_t v17 = 0;
  BOOL v18 = 0;
  if (!*((unsigned char *)v47 + 24) && v14)
  {
    id v19 = [(NEKEventStore *)self wrapperForCalendar:v14 useAttributes:0];
    uint64_t v17 = v19;
    if (!v19) {
      goto LABEL_11;
    }
    [v19 setIsDefaultTaskCalendar:1];
    BOOL v18 = v14 == v15;
    if (v14 == v15)
    {
      [v17 setIsDefaultEventCalendar:1];
      unsigned int v20 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Default reminder and event calendar are the same.", buf, 2u);
      }
    }
    [v16 push:v17, v28, v29, v30, v31, v32, v33, v34, v35, v36];
    id v21 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      sub_10002D3E0([v14 title]);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      id v23 = [v14 calendarIdentifier];
      *(_DWORD *)buf = 138543618;
      id v51 = v22;
      __int16 v52 = 2114;
      id v53 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Marking default task calendar in wrapper to calendar with name %{public}@, identifier %{public}@", buf, 0x16u);
    }
  }
  if (v18)
  {
LABEL_18:
    long long v24 = v17;
    goto LABEL_19;
  }
LABEL_11:
  if (*((unsigned char *)v43 + 24) || !v15) {
    goto LABEL_18;
  }
  long long v24 = [(NEKEventStore *)self wrapperForCalendar:v15 useAttributes:0];

  if (v24)
  {
    [v24 setIsDefaultEventCalendar:1];
    [v16 push:v24];
    id v25 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      sub_10002D3E0([v15 title]);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      long long v27 = [v15 calendarIdentifier];
      *(_DWORD *)buf = 138543618;
      id v51 = v26;
      __int16 v52 = 2114;
      id v53 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Marking default event calendar in wrapper to calendar with name %{public}@, identifier %{public}@", buf, 0x16u);
    }
  }
LABEL_19:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

- (void)ICSWrappersForChangeSet:(id)a3 pipe:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NEKEventStore *)self startMappingEntities];
  id v8 = [NEKSyncWindow alloc];
  uint64_t v9 = [(NEKStore *)self environment];
  id v10 = [v9 tinyStore];
  id v11 = [(NEKSyncWindow *)v8 initForFullSync:0 tinyStore:v10];

  uint64_t v12 = [[NEKStoreRoller alloc] initWithEventStore:self cause:@"ICSWrappers:Inserts"];
  uint64_t v13 = objc_opt_class();
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100020490;
  v31[3] = &unk_1000A91B8;
  long long v32 = v12;
  id v14 = v11;
  id v33 = v14;
  long long v34 = self;
  id v15 = v6;
  id v35 = v15;
  id v16 = v12;
  [v7 enumerateForChangeType:1 forEntitiesOfClass:v13 withBlock:v31];
  uint64_t v17 = [NEKStoreRoller alloc];

  BOOL v18 = [(NEKStoreRoller *)v17 initWithEventStore:self cause:@"ICSWrappers:Updates"];
  uint64_t v19 = objc_opt_class();
  id v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_1000206B4;
  id v26 = &unk_1000A91B8;
  long long v27 = v18;
  id v28 = self;
  id v29 = v14;
  id v30 = v15;
  id v20 = v15;
  id v21 = v14;
  id v22 = v18;
  [v7 enumerateForChangeType:2 forEntitiesOfClass:v19 withBlock:&v23];

  [(NEKEventStore *)self endMappingEntities];
}

- (void)deletionWrappersForChangeSet:(id)a3 skipSourceDeletions:(BOOL)a4 pipe:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [a3 deletes];
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v21;
    *(void *)&long long v11 = 138543362;
    long long v19 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (!v5 || [*(id *)(*((void *)&v20 + 1) + 8 * i) entityType] != (id)6)
        {
          id v16 = +[NEKDeletionWrapper deletionWrapperForRecordID:eventStore:](NEKDeletionWrapper, "deletionWrapperForRecordID:eventStore:", v15, self, v19);
          if (v16)
          {
            uint64_t v17 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v25 = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Deletion wrapper: %@", buf, 0xCu);
            }
            if (([v8 push:v16] & 1) == 0)
            {

              goto LABEL_20;
            }
          }
          else if ([v15 entityType] == (id)2 || objc_msgSend(v15, "entityType") == (id)3)
          {
            BOOL v18 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              id v25 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Could not create deletion wrapper for recordID: %{public}@", buf, 0xCu);
            }
          }
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v12);
  }
LABEL_20:
}

- (void)deletionWrappersForSourceAggregator:(id)a3 pipe:(id)a4
{
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [a3 deletedSourcesIDs];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v16;
    *(void *)&long long v8 = 138412290;
    long long v14 = v8;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = +[NEKDeletionWrapper deletionWrapperForSourceID:](NEKDeletionWrapper, "deletionWrapperForSourceID:", *(void *)(*((void *)&v15 + 1) + 8 * i), v14);
        if (v12)
        {
          uint64_t v13 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            long long v20 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deletion wrapper for source: %@", buf, 0xCu);
          }
          if (![v5 push:v12])
          {

            goto LABEL_14;
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (id)wrapperForCalEntity:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(NEKEventStore *)self wrapperForSource:v4];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(NEKEventStore *)self wrapperForCalendar:v4];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(NEKEventStore *)self wrapperForCalendarItem:v4];
LABEL_7:
    id v6 = (void *)v5;
    if (v5) {
      [(NEKEventStore *)self updateRowMappingForEntity:v4];
    }
    goto LABEL_9;
  }
  long long v8 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10006D90C(v8);
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

- (id)wrapperForSource:(id)a3
{
  id v3 = a3;
  if (sub_10000BA00(v3)) {
    id v4 = [[NEKSourceWrapper alloc] initWithSource:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)wrapperForCalendar:(id)a3 useAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (sub_10000BACC(v5)) {
    id v6 = [[NEKCalendarWrapper alloc] initWithCalendarRef:v5 useAttributes:v4];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)wrapperForCalendar:(id)a3
{
  return [(NEKEventStore *)self wrapperForCalendar:a3 useAttributes:1];
}

- (id)wrapperForCalendarItem:(id)a3
{
  id v4 = a3;
  if (sub_10000BC3C(v4))
  {
    id v5 = +[NEKICSWrapper wrapperForCalendarItem:v4 needsInvite:0 eventStore:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_identifierInRowMapping:(id)a3
{
  id v4 = [a3 objectID];
  if (v4)
  {
    id v5 = [(NEKEventStore *)self recordMap];
    id v6 = [v5 identifierForRecordID:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)identifierInRowMappingForEventOrTask:(id)a3
{
  id v4 = a3;
  id v5 = [(NEKEventStore *)self _identifierInRowMapping:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v6 = [v5 componentsSeparatedByString:@"::"];
    if ([v6 count])
    {
      uint64_t v7 = [v6 objectAtIndexedSubscript:0];

      id v5 = (void *)v7;
    }
  }

  return v5;
}

- (id)calendarIdentifierInRowMappingForEventOrTask:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = [(NEKEventStore *)self _identifierInRowMapping:v4];
    id v6 = [v5 componentsSeparatedByString:@"::"];
    if ((unint64_t)[v6 count] < 2)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = [v6 objectAtIndexedSubscript:1];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)identifierInRowMappingForRecordIDRef:(id)a3
{
  id v4 = a3;
  id v5 = [(NEKEventStore *)self recordMap];
  id v6 = [v5 identifierForRecordID:v4];

  if ([v4 entityType] == (id)2 || objc_msgSend(v4, "entityType") == (id)3)
  {
    uint64_t v7 = [v6 componentsSeparatedByString:@"::"];
    if ([v7 count])
    {
      uint64_t v8 = [v7 objectAtIndexedSubscript:0];

      id v6 = (void *)v8;
    }
  }

  return v6;
}

- (id)calendarIdentifierInRowMappingForRecordIDRef:(id)a3
{
  id v4 = a3;
  if ([v4 entityType] == (id)2 || objc_msgSend(v4, "entityType") == (id)3)
  {
    id v5 = [(NEKEventStore *)self recordMap];
    id v6 = [v5 identifierForRecordID:v4];

    uint64_t v7 = [v6 componentsSeparatedByString:@"::"];
    if ((unint64_t)[v7 count] < 2)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = [v7 objectAtIndexedSubscript:1];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)updateRowMappingForEntity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v14;
      id v6 = [v5 location];
      uint64_t v7 = [v5 title];
      uint64_t v8 = [v5 startDate];

      [v8 timeIntervalSinceReferenceDate];
      double v10 = v9;
    }
    else
    {
      uint64_t v7 = 0;
      id v6 = 0;
      double v10 = 0.0;
    }
    long long v11 = [v14 objectID];
    if (v11)
    {
      id v12 = [v14 eks_compoundIdentifier];
      uint64_t v13 = [(NEKEventStore *)self recordMap];
      [v13 setIdentifier:v12 masterRowID:-1 summary:v7 location:v6 startTime:v11 forRecordID:v10];
    }
    id v4 = v14;
  }
}

- (BOOL)hasRowMappingForEntity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  if (v5)
  {
    id v6 = [v4 eks_compoundIdentifier];
    uint64_t v7 = [(NEKEventStore *)self recordMap];
    unsigned __int8 v8 = [v7 isIdentifierPresent:v6 forRecordID:v5];

    if (v8)
    {
      unsigned __int8 v9 = 1;
    }
    else
    {
      double v10 = [(NEKEventStore *)self recordMap];
      long long v11 = sub_1000614D4(v4);
      unsigned __int8 v9 = [v10 isIdentifierPresent:v11 forRecordID:v5];
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)_removeIdentifierForDeletedEntity:(id)a3
{
  id v5 = [a3 objectID];
  if (v5)
  {
    id v4 = [(NEKEventStore *)self recordMap];
    [v4 deleteIdentifierForRecordID:v5];
  }
}

- (void)removeIdentifiersForDeletedRecordIDs:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      unsigned __int8 v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        double v10 = [(NEKEventStore *)self recordMap];
        [v10 deleteIdentifierForRecordID:v9];

        unsigned __int8 v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_commitPendingRecordMapChanges
{
  p_createdEntitiesLock = &self->_createdEntitiesLock;
  os_unfair_lock_lock(&self->_createdEntitiesLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_createdEntities;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      unsigned __int8 v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NEKEventStore updateRowMappingForEntity:](self, "updateRowMappingForEntity:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        unsigned __int8 v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_createdEntities removeAllObjects];
  os_unfair_lock_unlock(p_createdEntitiesLock);
}

- (void)sweepSeenMap
{
  id v2 = [(NEKEventStore *)self seenMap];
  [v2 sweep];
}

- (void)_didCreateEntity:(id)a3
{
  p_createdEntitiesLock = &self->_createdEntitiesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_createdEntitiesLock);
  [(NSMutableArray *)self->_createdEntities addObject:v5];

  os_unfair_lock_unlock(p_createdEntitiesLock);
}

- (void)_deleteSourceWithIdentifier:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v7 sourceWithIdentifier:v6];
  if (v8)
  {
    id v11 = 0;
    [v7 removeSource:v8 commit:0 error:&v11];
    id v9 = v11;
    long long v10 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (v9)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006DA0C();
      }
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deleted source with identifier %{public}@", buf, 0xCu);
      }
      [(NEKEventStore *)self saveEventStore:v7];
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_10006D9A4();
  }
}

- (void)_deleteCalendarWithIdentifier:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v7 calendarWithIdentifier:v6];
  if (v8)
  {
    id v11 = 0;
    [v7 removeCalendar:v8 commit:0 error:&v11];
    id v9 = v11;
    long long v10 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (v9)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006DADC();
      }
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deleted calendar with identifier %{public}@", buf, 0xCu);
      }
      [(NEKEventStore *)self saveEventStore:v7];
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
  {
    sub_10006DA74();
  }
}

- (void)_deleteAndLogEvent:(id)a3 identifier:(id)a4 store:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [v7 objectID];
  if (([v7 hasRecurrenceRules] & 1) != 0 || objc_msgSend(v7, "isPhantom"))
  {
    id v11 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = v8;
      __int16 v23 = 2114;
      uint64_t v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deleting event (span future) with identifier %{public}@, recordID %{public}@", buf, 0x16u);
    }
    uint64_t v20 = 0;
    long long v12 = (id *)&v20;
    id v13 = &v20;
    long long v14 = v9;
    id v15 = v7;
    uint64_t v16 = 1;
  }
  else
  {
    long long v17 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = v8;
      __int16 v23 = 2114;
      uint64_t v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Deleting event (span single) with identifier %{public}@, recordID %{public}@", buf, 0x16u);
    }
    uint64_t v19 = 0;
    long long v12 = (id *)&v19;
    id v13 = &v19;
    long long v14 = v9;
    id v15 = v7;
    uint64_t v16 = 0;
  }
  [v14 removeEvent:v15 span:v16 error:v13, v19, v20];
  id v18 = *v12;
  if (v18 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
    sub_10006DB44();
  }
}

- (void)_deleteEventWithIdentifier:(id)a3 calendarIdentifier:(id)a4 store:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9 && ([v10 calendarWithIdentifier:v9], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v13 = (void *)v12;
    long long v14 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543618;
      id v20 = v8;
      __int16 v21 = 2114;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Deleting event with identifier %{public}@, from calendar with identifier %{public}@", (uint8_t *)&v19, 0x16u);
    }
    id v15 = [v11 calendarItemsWithUniqueIdentifier:v8 inCalendar:v13];
  }
  else
  {
    uint64_t v16 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Deleting event with identifier %{public}@, from any calendar, old mapping didn't send calendar to delete from so falling back to old code", (uint8_t *)&v19, 0xCu);
    }
    id v15 = [v11 calendarItemsWithUniqueIdentifier:v8 inCalendar:0];
  }
  if ([v15 count] == (id)1)
  {
    long long v17 = [v15 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NEKEventStore *)self _deleteAndLogEvent:v17 identifier:v8 store:v11];
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
    {
      sub_10006DBAC();
    }
  }
  else
  {
    id v18 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No event exists for %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)_deleteReminderWithIdentifier:(id)a3 calendarIdentifier:(id)a4 store:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v10 calendarWithIdentifier:v9];
    id v13 = (void *)v12;
    if (v12)
    {
      uint64_t v22 = v12;
      long long v14 = +[NSArray arrayWithObjects:&v22 count:1];
      id v15 = [v11 remindersWithExternalIdentifier:v8 inCalendars:v14];

      if (v15 && [v15 count])
      {
        uint64_t v16 = [v15 objectAtIndexedSubscript:0];

        if (v16)
        {
          id v19 = 0;
          [v11 removeReminder:v16 commit:0 error:&v19];
          id v17 = v19;
          if (v17 && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
            sub_10006DC14();
          }
          [(NEKEventStore *)self saveEventStore:v11];

          goto LABEL_14;
        }
      }
      else
      {
      }
    }
  }
  else
  {
    id v13 = 0;
  }
  id v18 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No reminder exists for %{public}@", buf, 0xCu);
  }
LABEL_14:
}

- (BOOL)_updateSource:(id)a3 withSourceWrapper:(id)a4 store:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [a4 attributes];
  BOOL v10 = +[NEKSourceAttributes configureSource:v8 inStore:v7 withAttributes:v9];

  return v10;
}

- (id)_createSourceForWrapper:(id)a3 store:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[EKSource sourceWithEventStore:v5];
  id v8 = [v6 attributes];

  +[NEKSourceAttributes configureSource:v7 inStore:v5 withAttributes:v8];

  return v7;
}

- (BOOL)_checkAndSetDefaultCalendar:(id)a3 calendarWrapper:(id)a4 store:(id)a5
{
  return 0;
}

- (BOOL)_updateCalendar:(id)a3 withCalendarWrapper:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 attributes];
  id v9 = v8;
  if (v8 && [v8 didCalendarChange:v6])
  {
    BOOL v10 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      uint64_t v12 = [v7 attributes];
      id v13 = [v12 title];
      long long v14 = sub_10002D3E0(v13);
      id v15 = [v7 calendarIdentifier];
      int v24 = 138543618;
      id v25 = v14;
      __int16 v26 = 2114;
      long long v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating calendar with title %{public}@, identifier %{public}@", (uint8_t *)&v24, 0x16u);
    }
    uint64_t v16 = [v6 eventStore];
    +[NEKCalendarAttributes configureCalendar:v6 inDatabase:v16 withAttributes:v9];

    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  id v18 = [NEKSourceID alloc];
  id v19 = [v6 source];
  id v20 = [(NEKSourceID *)v18 initWithSource:v19];

  uint64_t v21 = [v7 storeIdentifier];
  [(NEKSourceID *)v20 isEqualToNEKSourceID:v21];

  uint64_t v22 = [v6 eventStore];
  LOBYTE(v21) = [(NEKEventStore *)self _checkAndSetDefaultCalendar:v6 calendarWrapper:v7 store:v22];

  [(NEKEventStore *)self _didCreateEntity:v6];
  return v17 | v21;
}

- (id)_createCalendarForWrapper:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 attributes];
  id v9 = v8;
  if (!v8)
  {
    long long v14 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      uint64_t v16 = [v6 calendarIdentifier];
      char v17 = [v6 storeIdentifier];
      int v32 = 138543618;
      id v33 = v16;
      __int16 v34 = 2114;
      id v35 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Asked to set a nonexistent calendar as the default. Ignoring. Calendar identifier = %{public}@, store identifier = %{public}@", (uint8_t *)&v32, 0x16u);
    }
    goto LABEL_25;
  }
  if ([v8 supportedEntityTypes] == 3)
  {
    BOOL v10 = [(NEKStore *)self environment];
    unsigned __int8 v11 = [v10 isReminderKitEnabled];

    if (v11)
    {
      uint64_t v12 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 136446210;
        id v33 = "-[NEKEventStore _createCalendarForWrapper:store:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path: mixed entity calendar is not supported", (uint8_t *)&v32, 0xCu);
      }
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 3;
    }
    uint64_t v19 = +[EKCalendar calendarForEntityTypes:v13 eventStore:v7];
    goto LABEL_14;
  }
  if ([v9 supportedEntityTypes] != 1)
  {
    if ([v9 supportedEntityTypes] == 2)
    {
      id v28 = [(NEKStore *)self environment];
      unsigned __int8 v29 = [v28 isReminderKitEnabled];

      if ((v29 & 1) == 0)
      {
        uint64_t v18 = 1;
        goto LABEL_11;
      }
      id v30 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 136446210;
        id v33 = "-[NEKEventStore _createCalendarForWrapper:store:]";
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring EventKit code path: creating reminders calendar is not supported", (uint8_t *)&v32, 0xCu);
      }
    }
LABEL_25:
    id v20 = 0;
    goto LABEL_26;
  }
  uint64_t v18 = 0;
LABEL_11:
  uint64_t v19 = +[EKCalendar calendarForEntityType:v18 eventStore:v7];
LABEL_14:
  id v20 = (void *)v19;
  +[NEKCalendarAttributes configureCalendar:v19 inDatabase:v7 withAttributes:v9];
  uint64_t v21 = [v6 storeIdentifier];
  uint64_t v22 = +[NEKSourceID eventSourceForDatabase:v7 identifier:v21];

  if (!v22)
  {
    __int16 v23 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10006DC7C(v23);
    }
    uint64_t v22 = [v7 localSource];
  }
  [v20 setSource:v22];
  [(NEKEventStore *)self _didCreateEntity:v20];
  int v24 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = v24;
    sub_10002D3E0([v20 title]);
    __int16 v26 = (char *)objc_claimAutoreleasedReturnValue();
    long long v27 = [v20 calendarIdentifier];
    int v32 = 138543618;
    id v33 = v26;
    __int16 v34 = 2114;
    id v35 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Created calendar with title %{public}@, identifier %{public}@", (uint8_t *)&v32, 0x16u);
  }
LABEL_26:

  return v20;
}

- (id)_ICSLogTestForWrapper:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSString);
  id v5 = [v3 ICSData];

  id v6 = [v4 initWithData:v5 encoding:4];

  return v6;
}

- (void)_sendChangesIfAvailable
{
  id v2 = [(NEKStore *)self changeObserver];
  [v2 _sendChangesIfAvailable];
}

- (void)_flushQueue
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertSupressionCache, 0);
  objc_storeStrong((id *)&self->_syncedEntityUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_pipeQueue, 0);
  objc_storeStrong((id *)&self->_idleBlockQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_createdEntities, 0);
}

@end