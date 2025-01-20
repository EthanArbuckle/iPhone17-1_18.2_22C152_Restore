@interface NEKEventPurger
- (EKEventStore)store;
- (NEKEventPurger)initWithStore:(id)a3 recordMap:(id)a4;
- (NEKRecordMap)recordMap;
- (void)_deleteCalendarById:(id)a3;
- (void)_deleteEventById:(id)a3;
- (void)_deleteStoreById:(id)a3;
- (void)finalizeDatabasesAfterResetSync;
- (void)setRecordMap:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation NEKEventPurger

- (NEKEventPurger)initWithStore:(id)a3 recordMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NEKEventPurger;
  v8 = [(NEKEventPurger *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(NEKEventPurger *)v8 setStore:v6];
    [(NEKEventPurger *)v9 setRecordMap:v7];
  }

  return v9;
}

- (void)finalizeDatabasesAfterResetSync
{
  v3 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v49 = "-[NEKEventPurger finalizeDatabasesAfterResetSync]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v4 = [(NEKEventPurger *)self recordMap];
  v5 = [(NEKEventPurger *)self store];
  id v6 = [v5 _deletableSources];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  id obj = v6;
  id v30 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v43;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v10 = [v8 objectID];
        if (v10
          && ([v4 identifierForRecordID:v10],
              objc_super v11 = objc_claimAutoreleasedReturnValue(),
              v11,
              !v11))
        {
          [(NEKEventPurger *)self _deleteStoreById:v10];
        }
        else
        {
          v31 = v10;
          v32 = v9;
          v33 = i;
          v12 = [v8 calendarsForEntityType:0];
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v13 = v12;
          id v14 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v39;
            do
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v39 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
                v20 = [v18 objectID];
                if (v20
                  && ([v4 identifierForRecordID:v20],
                      v21 = objc_claimAutoreleasedReturnValue(),
                      v21,
                      !v21))
                {
                  [(NEKEventPurger *)self _deleteCalendarById:v20];
                }
                else
                {
                  v22 = [(NEKEventPurger *)self store];
                  v23 = [v22 predicateForMasterEventsInCalendar:v18];

                  v24 = [(NEKEventPurger *)self store];
                  v35[0] = _NSConcreteStackBlock;
                  v35[1] = 3221225472;
                  v35[2] = sub_1000681A8;
                  v35[3] = &unk_1000A9380;
                  id v36 = v4;
                  v37 = self;
                  [v24 enumerateEventsMatchingPredicate:v23 usingBlock:v35];
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v15);
          }

          v9 = v32;
          i = v33;
          v10 = v31;
        }
      }
      id v30 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v30);
  }

  v25 = [(NEKEventPurger *)self store];
  id v34 = 0;
  [v25 commit:&v34];
  id v26 = v34;

  if (v26)
  {
    v27 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100070B7C(v27);
    }
  }
}

- (void)_deleteStoreById:(id)a3
{
  id v4 = a3;
  v5 = [(NEKEventPurger *)self store];
  id v6 = [v5 publicObjectWithObjectID:v4];

  if (v6 && [v4 entityType] == (id)6)
  {
    id v7 = v6;
    v8 = [(NEKEventPurger *)self store];
    id v15 = 0;
    [v8 removeSource:v7 commit:0 error:&v15];
    id v9 = v15;

    v10 = sub_10002D3E0([v7 title]);
    objc_super v11 = [v7 sourceIdentifier];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ \"%@\"; sourceIdentifier=%@; type=%ld",
      v4,
      v10,
      v11,
    v12 = [v7 sourceType]);

    id v13 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100070C4C();
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PURGE: Successfully deleted stale source %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100070BC0(v14, v4);
    }
  }
}

- (void)_deleteCalendarById:(id)a3
{
  id v4 = a3;
  v5 = [(NEKEventPurger *)self store];
  id v6 = [v5 publicObjectWithObjectID:v4];

  if (v6 && [v4 entityType] == (id)1)
  {
    id v7 = v6;
    v8 = [(NEKEventPurger *)self store];
    id v15 = 0;
    [v8 removeCalendar:v7 commit:0 error:&v15];
    id v9 = v15;

    v10 = sub_10002D3E0([v7 title]);
    objc_super v11 = [v7 calendarIdentifier];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ \"%@\"; calendarIdentifier=%@",
      v4,
      v10,
    v12 = v11);

    id v13 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100070D40();
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PURGE: Successfully deleted stale calendar %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100070CB4(v14, v4);
    }
  }
}

- (void)_deleteEventById:(id)a3
{
  id v4 = a3;
  v5 = [(NEKEventPurger *)self store];
  id v6 = [v5 publicObjectWithObjectID:v4];

  if (v6 && [v4 entityType] == (id)2)
  {
    id v7 = v6;
    v8 = [(NEKEventPurger *)self store];
    id v15 = 0;
    [v8 removeEvent:v7 span:1 error:&v15];
    id v9 = v15;

    v10 = sub_10002D3E0([v7 title]);
    objc_super v11 = [v7 recurrenceIdentifier];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ \"%@\"; eventIdentifier=%@",
      v4,
      v10,
    v12 = v11);

    id v13 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100070E34();
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PURGE: Successfully deleted stale event %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v14 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100070DA8(v14, v4);
    }
  }
}

- (NEKRecordMap)recordMap
{
  return self->_recordMap;
}

- (void)setRecordMap:(id)a3
{
}

- (EKEventStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_recordMap, 0);
}

@end