@interface PDCardCloudManagerChangeRegistry
- (PDCardCloudManagerChangeRegistry)initWithDatabaseManager:(id)a3;
- (id)addChangeEventsOfType:(int64_t)a3 withRecordType:(int64_t)a4 andRecordUniqueIDs:(id)a5 timestampByUniqueID:(id)a6 coalescePreviousEvents:(BOOL)a7;
- (id)createAndCoalsesceEvent:(int64_t)a3 forRecordWithType:(int64_t)a4 andRecordIUniqueID:(id)a5 timestamp:(id)a6 eventsToDelete:(id)a7;
- (id)fetchChangeEvents;
- (id)recordAdditionOfPasses:(id)a3;
- (id)recordRemovalOfPassesWithUniqueIDs:(id)a3;
- (id)recordUpdateOfCatalog:(id)a3;
- (id)recordUpdateOfPasses:(id)a3;
- (id)retryDateForEvent:(id)a3;
- (unint64_t)numberOfChangeEvents;
- (void)eraseChangeEvents:(id)a3;
- (void)increaseRetryCountForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)unregisterAllChanges;
- (void)unregisterChangesForPassesWithUniqueIDs:(id)a3;
@end

@implementation PDCardCloudManagerChangeRegistry

- (PDCardCloudManagerChangeRegistry)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDCardCloudManagerChangeRegistry;
  v6 = [(PDCardCloudManagerChangeRegistry *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseManager, a3);
    if (PKCloudKitPassSyncEnabled())
    {
      v8 = PDDefaultQueue();
      PDScheduledActivityClientRegister();

      v9 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:0];
      [v9 setRequireNetworkConnectivity:0];
      [v9 setRequireMainsPower:1];
      [v9 setRepeating:1];
      [v9 setRepeatInterval:2592000.0];
      PDScheduledActivityRegister();
    }
  }

  return v7;
}

- (id)recordAdditionOfPasses:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "uniqueID", (void)v19);
        v14 = [v12 modificationDate];
        [v5 addObject:v13];
        [v6 setObject:v14 forKeyedSubscript:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  id v15 = [v5 copy];
  id v16 = [v6 copy];
  v17 = [(PDCardCloudManagerChangeRegistry *)self addChangeEventsOfType:0 withRecordType:0 andRecordUniqueIDs:v15 timestampByUniqueID:v16 coalescePreviousEvents:1];

  return v17;
}

- (id)recordUpdateOfPasses:(id)a3
{
  id v4 = objc_msgSend(a3, "pk_arrayBySafelyApplyingBlock:", &stru_10074E920);
  id v5 = [(PDCardCloudManagerChangeRegistry *)self addChangeEventsOfType:1 withRecordType:0 andRecordUniqueIDs:v4 timestampByUniqueID:0 coalescePreviousEvents:1];

  return v5;
}

- (id)recordRemovalOfPassesWithUniqueIDs:(id)a3
{
  return [(PDCardCloudManagerChangeRegistry *)self addChangeEventsOfType:2 withRecordType:0 andRecordUniqueIDs:a3 timestampByUniqueID:0 coalescePreviousEvents:1];
}

- (id)recordUpdateOfCatalog:(id)a3
{
  uint64_t v7 = PKChangeHistoryNoRecordID;
  id v4 = +[NSArray arrayWithObjects:&v7 count:1];
  id v5 = [(PDCardCloudManagerChangeRegistry *)self addChangeEventsOfType:1 withRecordType:1 andRecordUniqueIDs:v4 timestampByUniqueID:0 coalescePreviousEvents:1];

  return v5;
}

- (id)addChangeEventsOfType:(int64_t)a3 withRecordType:(int64_t)a4 andRecordUniqueIDs:(id)a5 timestampByUniqueID:(id)a6 coalescePreviousEvents:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a5;
  id v12 = a6;
  id v30 = objc_alloc_init((Class)NSMutableArray);
  id v27 = objc_alloc_init((Class)NSMutableArray);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v11;
  id v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v18 = objc_msgSend(v12, "objectForKeyedSubscript:", v17, v27);
        long long v19 = v18;
        if (v18)
        {
          id v20 = v18;
        }
        else
        {
          id v20 = +[NSDate date];
        }
        long long v21 = v20;

        if (v7)
        {
          id v22 = [(PDCardCloudManagerChangeRegistry *)self createAndCoalsesceEvent:a3 forRecordWithType:a4 andRecordIUniqueID:v17 timestamp:v21 eventsToDelete:v27];
        }
        else
        {
          id v22 = [objc_alloc((Class)PKChangeHistoryEvent) initWithType:a3 recordType:a4 recordUniqueID:v17 timestamp:v21];
        }
        v23 = v22;
        if (v22) {
          [v30 addObject:v22];
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }

  v24 = v27;
  if ([v27 count]) {
    [(PDDatabaseManager *)self->_databaseManager removeChangeEvents:v27];
  }
  if (objc_msgSend(v30, "count", v27)) {
    [(PDDatabaseManager *)self->_databaseManager addChangeEvents:v30];
  }
  id v25 = [v30 copy];

  return v25;
}

- (id)createAndCoalsesceEvent:(int64_t)a3 forRecordWithType:(int64_t)a4 andRecordIUniqueID:(id)a5 timestamp:(id)a6 eventsToDelete:(id)a7
{
  id v12 = a5;
  id v34 = a6;
  id v33 = a7;
  v35 = v12;
  id v13 = [(PDDatabaseManager *)self->_databaseManager changeEventsWithRecordType:a4 recordUniqueID:v12];
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v15 = objc_alloc_init((Class)NSMutableArray);
  id v16 = objc_alloc_init((Class)NSMutableArray);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v17 = v13;
  id v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v23 = [v22 type];
        v24 = v14;
        if (!v23) {
          goto LABEL_11;
        }
        if (v23 == (id)2)
        {
          v24 = v16;
LABEL_11:
          [v24 addObject:v22];
          continue;
        }
        v24 = v15;
        if (v23 == (id)1) {
          goto LABEL_11;
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v19);
  }

  id v25 = [v14 count];
  id v26 = [v15 count];
  id v27 = [v16 count];
  id v28 = [objc_alloc((Class)PKChangeHistoryEvent) initWithType:a3 recordType:a4 recordUniqueID:v35 timestamp:v34];
  if (a3 == 2)
  {
    if (!v25)
    {
      v29 = v33;
      if (!v26)
      {
LABEL_24:
        if (v27) {
          [v29 addObjectsFromArray:v16];
        }
        goto LABEL_32;
      }
LABEL_23:
      [v29 addObjectsFromArray:v15];
      goto LABEL_24;
    }
    v29 = v33;
    [v33 addObjectsFromArray:v14];

    id v28 = 0;
LABEL_22:
    if (!v26) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      v29 = v33;
      goto LABEL_32;
    }
    v29 = v33;
    if (v25)
    {
      [v33 addObjectsFromArray:v14];
      if (!v26) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v25)
  {
    v29 = v33;
    [v33 addObjectsFromArray:v14];
    id v30 = [objc_alloc((Class)PKChangeHistoryEvent) initWithType:0 recordType:a4 recordUniqueID:v35 timestamp:v34];

    id v28 = v30;
    if (!v26) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  v29 = v33;
  if (v26) {
LABEL_28:
  }
    [v29 addObjectsFromArray:v15];
LABEL_29:
  if (v27)
  {
    [v29 addObjectsFromArray:v16];
    id v31 = [objc_alloc((Class)PKChangeHistoryEvent) initWithType:0 recordType:a4 recordUniqueID:v35 timestamp:v34];

    id v28 = v31;
  }
LABEL_32:

  return v28;
}

- (unint64_t)numberOfChangeEvents
{
  return [(PDDatabaseManager *)self->_databaseManager numberOfChangeEvents];
}

- (id)fetchChangeEvents
{
  v3 = [(PDDatabaseManager *)self->_databaseManager changeEventsWithRecordType:0];
  id v4 = [(PDDatabaseManager *)self->_databaseManager changeEventsWithRecordType:1];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (void)increaseRetryCountForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4
{
}

- (id)retryDateForEvent:(id)a3
{
  return [(PDDatabaseManager *)self->_databaseManager retryDateForEvent:a3];
}

- (void)eraseChangeEvents:(id)a3
{
}

- (void)unregisterChangesForPassesWithUniqueIDs:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(PDDatabaseManager *)self->_databaseManager changeEventsWithRecordType:0 recordUniqueID:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        [(PDDatabaseManager *)self->_databaseManager removeChangeEvents:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)unregisterAllChanges
{
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (__CFString *)v6;
  id v9 = v8;
  if (v8 == @"PDChangeRegistryScheduledActivityIdentifier"
    || v8
    && (unsigned int v10 = [(__CFString *)v8 isEqualToString:@"PDChangeRegistryScheduledActivityIdentifier"], v9, v10))
  {
    long long v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "removing expired change events", v12, 2u);
    }

    [(PDDatabaseManager *)self->_databaseManager removeExpiredChangeEvents];
  }
}

- (void).cxx_destruct
{
}

@end