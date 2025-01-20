@interface STPersistUsageOperation
- (BOOL)_persistFetchedUsageReportWithUser:(id)a3 device:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6;
- (BOOL)_persistUsageReports:(id)a3 usage:(id)a4 aggregateUsage:(BOOL)a5 reportStartDate:(id)a6 durationInMinutes:(unint64_t)a7 calendar:(id)a8 shareWebUsage:(BOOL)a9 inManagedObjectContext:(id)a10 error:(id *)a11;
- (BOOL)isAsynchronous;
- (NSDate)referenceDate;
- (NSManagedObjectContext)moc;
- (NSManagedObjectID)userDeviceStateID;
- (NSNumber)userDSID;
- (NSString)deviceIdentifier;
- (STFetchUsageOperation)fetchUsageOperation;
- (STFetchedUsageResults)fetchedUsageResults;
- (STPersistUsageOperation)initWithManagedObjectContext:(id)a3 fetchUsageOperation:(id)a4 userDeviceState:(id)a5 referenceDate:(id)a6 duration:(int64_t)a7;
- (STPersistUsageOperation)initWithPersistenceController:(id)a3 fetchedUsageResults:(id)a4 userDSID:(id)a5 deviceIdentifier:(id)a6 duration:(int64_t)a7;
- (STPersistenceControllerProtocol)persistenceController;
- (id)_countedItemByBundleTrustIdentifiersForCountedItems:(id)a3;
- (id)_ensureUsageExistForUser:(id)a3 forCoreDuetIdentifiers:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6;
- (id)_fetchOrCreateUsageForUser:(id)a3 device:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6;
- (id)_truncateDate:(id)a3 usingCalendar:(id)a4;
- (id)_usageBlockByTrimmedStartDate:(id)a3 reportStartDate:(id)a4 durationInMinutes:(unint64_t)a5 calendar:(id)a6;
- (id)_usageCategoryByIdentifierForCategories:(id)a3;
- (id)_usagesForUser:(id)a3 devices:(id)a4 error:(id *)a5;
- (int64_t)duration;
- (void)_purgeExpiredAggregateUsageForUser:(id)a3 managedObjectContext:(id)a4;
- (void)_runWithManagedObjectContext:(id)a3;
- (void)_updateUsageBlock:(id)a3 usageCategory:(id)a4 countedItemsByBundleIdentifier:(id)a5 webUsageReports:(id)a6 applicationUsageReports:(id)a7 shareWebUsage:(BOOL)a8 inManagedObjectContext:(id)a9;
- (void)main;
- (void)setDeviceIdentifier:(id)a3;
- (void)setFetchUsageOperation:(id)a3;
- (void)setFetchedUsageResults:(id)a3;
- (void)setMoc:(id)a3;
- (void)setPersistenceController:(id)a3;
- (void)setReferenceDate:(id)a3;
- (void)setUserDSID:(id)a3;
- (void)setUserDeviceStateID:(id)a3;
@end

@implementation STPersistUsageOperation

- (STPersistUsageOperation)initWithPersistenceController:(id)a3 fetchedUsageResults:(id)a4 userDSID:(id)a5 deviceIdentifier:(id)a6 duration:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)STPersistUsageOperation;
  v17 = [(STOperation *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_persistenceController, a3);
    objc_storeStrong((id *)&v18->_fetchedUsageResults, a4);
    v19 = (NSNumber *)[v15 copy];
    userDSID = v18->_userDSID;
    v18->_userDSID = v19;

    v21 = (NSString *)[v16 copy];
    deviceIdentifier = v18->_deviceIdentifier;
    v18->_deviceIdentifier = v21;

    v18->_duration = a7;
  }

  return v18;
}

- (STPersistUsageOperation)initWithManagedObjectContext:(id)a3 fetchUsageOperation:(id)a4 userDeviceState:(id)a5 referenceDate:(id)a6 duration:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = [v15 managedObjectContext];

  if (v17 != v13)
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"STPersistUsageOperation.m" lineNumber:51 description:@"The specified moc doesn't match the moc of the user device state"];
  }
  v25.receiver = self;
  v25.super_class = (Class)STPersistUsageOperation;
  v18 = [(STOperation *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_moc, a3);
    objc_storeStrong((id *)&v19->_fetchUsageOperation, a4);
    uint64_t v20 = [v15 objectID];
    userDeviceStateID = v19->_userDeviceStateID;
    v19->_userDeviceStateID = (NSManagedObjectID *)v20;

    objc_storeStrong((id *)&v19->_referenceDate, a6);
    v19->_duration = a7;
  }

  return v19;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  os_activity_t v3 = _os_activity_create((void *)&_mh_execute_header, "STPersistUsageOperation start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  [(STOperation *)self setActivity:v3];

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v4 = [(STOperation *)self activity];
  os_activity_scope_enter(v4, &state);

  v5 = [(STPersistUsageOperation *)self moc];

  if (v5)
  {
    id v6 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
    v7 = [(STPersistUsageOperation *)self moc];
    [v6 setParentContext:v7];
  }
  else
  {
    v7 = [(STPersistUsageOperation *)self persistenceController];
    id v6 = [v7 newBackgroundContext];
  }

  if (v6)
  {
    v8 = [(STPersistUsageOperation *)self referenceDate];

    if (!v8)
    {
      v9 = +[NSDate date];
      [(STPersistUsageOperation *)self setReferenceDate:v9];
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100055820;
    v12[3] = &unk_1002FB828;
    v12[4] = self;
    id v13 = v6;
    [v13 performBlockAndWait:v12];
  }
  else
  {
    v10 = +[STLog usage];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100262E10(v10);
    }

    v11 = +[NSError errorWithDomain:STErrorDomain code:1 userInfo:0];
    [(STPersistUsageOperation *)self endOperationWithError:v11];
  }
  os_activity_scope_leave(&state);
}

- (id)_truncateDate:(id)a3 usingCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(STPersistUsageOperation *)self duration];
  if (v8 == 1440)
  {
    v10 = [v7 startOfDayForDate:v6];
  }
  else if (v8 == 60)
  {
    v9 = [v7 components:62 fromDate:v6];
    v10 = [v7 dateFromComponents:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_runWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = [(STPersistUsageOperation *)self userDSID];
  id v6 = v5;
  if (!v5)
  {
    id v7 = [(STPersistUsageOperation *)self userDeviceStateID];
    int64_t v8 = [v4 objectWithID:v7];

    id v9 = 0;
LABEL_16:
    if ([v8 screenTimeEnabled])
    {
      id v20 = [v8 user];
      v21 = [v8 device];
      id v34 = v9;
      unsigned __int8 v22 = [(STPersistUsageOperation *)self _persistFetchedUsageReportWithUser:v20 device:v21 inManagedObjectContext:v4 error:&v34];
      id v23 = v34;

      if (v22)
      {
        [(STPersistUsageOperation *)self _purgeExpiredAggregateUsageForUser:v20 managedObjectContext:v4];
        if ([v4 hasChanges])
        {
          id v33 = v23;
          unsigned __int8 v24 = [v4 save:&v33];
          id v25 = v33;

          if ((v24 & 1) == 0)
          {
            v26 = +[STLog usage];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
              sub_100262E54();
            }

            [(STPersistUsageOperation *)self endOperationWithError:v25];
          }
        }
        else
        {
          id v25 = v23;
        }
        v30 = +[STLog usage];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Successfully persisted usage", buf, 2u);
        }

        [(STPersistUsageOperation *)self endOperationWithResultObject:0];
        id v23 = v25;
      }
      else
      {
        v29 = +[STLog usage];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100262EBC((uint64_t)v23, v8, v29);
        }

        [(STPersistUsageOperation *)self endOperationWithError:v23];
      }

      id v9 = v23;
    }
    else
    {
      id v27 = objc_alloc((Class)NSError);
      id v20 = [v27 initWithDomain:STErrorDomain code:7 userInfo:0];
      v28 = +[STLog usage];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100262F70();
      }

      [(STPersistUsageOperation *)self endOperationWithError:v20];
    }

    goto LABEL_35;
  }
  if ([v5 longLongValue]) {
    +[NSPredicate predicateWithFormat:@"%K == %@", @"user.dsid", v6];
  }
  else {
  v10 = +[NSPredicate predicateWithFormat:@"%K != NULL", @"user.localUserDeviceState", v31];
  }
  v11 = [(STPersistUsageOperation *)self deviceIdentifier];
  v12 = +[NSPredicate predicateWithFormat:@"%K == %@", @"device.identifier", v11];

  id v13 = +[STUserDeviceState fetchRequest];
  v37[0] = v10;
  v37[1] = v12;
  id v14 = +[NSArray arrayWithObjects:v37 count:2];
  id v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];
  [v13 setPredicate:v15];

  CFStringRef v36 = @"screenTimeEnabled";
  id v16 = +[NSArray arrayWithObjects:&v36 count:1];
  [v13 setPropertiesToFetch:v16];

  id v35 = 0;
  id v17 = [v13 execute:&v35];
  id v9 = v35;
  if (v17)
  {
    if ((unint64_t)[v17 count] >= 2)
    {
      v18 = +[STLog usage];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        sub_100263058();
      }
    }
    int64_t v8 = [v17 firstObject];
  }
  else
  {
    v19 = +[STLog usage];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100262FE4();
    }

    [(STPersistUsageOperation *)self endOperationWithError:v9];
    int64_t v8 = 0;
  }

  if (v17) {
    goto LABEL_16;
  }
LABEL_35:
}

- (BOOL)_persistFetchedUsageReportWithUser:(id)a3 device:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned __int8 v55 = [v10 shareWebUsage];
  id v13 = [(STPersistUsageOperation *)self fetchedUsageResults];
  if (v13
    || ([(STPersistUsageOperation *)self fetchUsageOperation],
        id v14 = objc_claimAutoreleasedReturnValue(),
        [v14 resultObject],
        id v13 = (id)objc_claimAutoreleasedReturnValue(),
        v14,
        v13))
  {
    id v54 = [v13 partitionDurationInMinutes];
    uint64_t v15 = +[NSCalendar currentCalendar];
    id v16 = [v13 dateInterval];
    id v17 = [v16 startDate];
    v58 = (void *)v15;
    v57 = [(STPersistUsageOperation *)self _truncateDate:v17 usingCalendar:v15];

    v56 = [v13 usageReportsByCoreDuetIdentifier];
    v18 = [v56 allKeys];
    v19 = +[NSSet setWithArray:v18];

    uint64_t v20 = [(STPersistUsageOperation *)self _ensureUsageExistForUser:v10 forCoreDuetIdentifiers:v19 inManagedObjectContext:v12 error:a6];
    v21 = (void *)v20;
    if (!v20)
    {
      LOBYTE(v34) = 0;
LABEL_45:

      goto LABEL_46;
    }
    v53 = (void *)v20;
    unsigned __int8 v22 = [v10 localUserDeviceState];

    id v23 = a6;
    if (v22)
    {
      id v50 = v13;
      id v24 = v12;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v25 = v53;
      id v26 = [v25 countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v60;
        id v48 = v11;
        id v49 = v10;
        v52 = v19;
        while (2)
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v60 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v59 + 1) + 8 * i);
            if ([(STPersistUsageOperation *)self isCanceled])
            {
              id v11 = v48;
              id v10 = v49;
              v19 = v52;
              if (v23)
              {
                +[NSError errorWithDomain:CATErrorDomain code:404 userInfo:0];
                LOBYTE(v34) = 0;
                id *v23 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                LOBYTE(v34) = 0;
              }
              id v12 = v24;
              id v13 = v50;
              goto LABEL_44;
            }
            uint64_t v31 = [v25 objectForKeyedSubscript:v30];
            v32 = [v56 objectForKeyedSubscript:v30];
            LOBYTE(v47) = v55;
            unsigned int v33 = [(STPersistUsageOperation *)self _persistUsageReports:v32 usage:v31 aggregateUsage:0 reportStartDate:v57 durationInMinutes:v54 calendar:v58 shareWebUsage:v47 inManagedObjectContext:v24 error:v23];

            if (!v33)
            {
              LOBYTE(v34) = 0;
              id v11 = v48;
              id v10 = v49;
              id v12 = v24;
              id v13 = v50;
              v19 = v52;
              goto LABEL_44;
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v59 objects:v63 count:16];
          id v11 = v48;
          id v10 = v49;
          v19 = v52;
          if (v27) {
            continue;
          }
          break;
        }
      }

      id v12 = v24;
      id v13 = v50;
    }
    id v25 = [v13 localUsageReports];
    if (v25)
    {
      id v34 = [(STPersistUsageOperation *)self _fetchOrCreateUsageForUser:v10 device:v11 inManagedObjectContext:v12 error:v23];
      if (v34)
      {
        LOBYTE(v47) = v55;
        unsigned int v35 = [(STPersistUsageOperation *)self _persistUsageReports:v25 usage:v34 aggregateUsage:0 reportStartDate:v57 durationInMinutes:v54 calendar:v58 shareWebUsage:v47 inManagedObjectContext:v12 error:v23];

        if (v35) {
          goto LABEL_18;
        }
        LOBYTE(v34) = 0;
      }
LABEL_44:
      v21 = v53;

      goto LABEL_45;
    }
LABEL_18:
    id v51 = v12;
    CFStringRef v36 = [v13 aggregateUsageReports];
    v37 = [v10 localUserDeviceState];

    if (v37)
    {
      v38 = v36;
      if (([v10 syncingEnabled] & 1) == 0) {
        goto LABEL_30;
      }
    }
    else
    {
      v38 = v36;
      if (![v36 count]) {
        goto LABEL_30;
      }
    }
    id v12 = v51;
    id v34 = [(STPersistUsageOperation *)self _fetchOrCreateUsageForUser:v10 device:0 inManagedObjectContext:v51 error:v23];
    if (!v34) {
      goto LABEL_43;
    }
    LOBYTE(v47) = v55;
    unsigned int v44 = [(STPersistUsageOperation *)self _persistUsageReports:v38 usage:v34 aggregateUsage:1 reportStartDate:v57 durationInMinutes:v54 calendar:v58 shareWebUsage:v47 inManagedObjectContext:v51 error:v23];

    if (!v44)
    {
      LOBYTE(v34) = 0;
      goto LABEL_42;
    }
LABEL_30:
    LOBYTE(v34) = 1;
LABEL_42:
    id v12 = v51;
LABEL_43:

    goto LABEL_44;
  }
  id v39 = v12;
  v40 = [(STPersistUsageOperation *)self fetchUsageOperation];
  v41 = [v40 error];
  v42 = v41;
  if (v41)
  {
    id v43 = v41;
  }
  else
  {
    id v43 = +[NSError errorWithDomain:STErrorDomain code:1 userInfo:0];
  }
  id v13 = v43;

  v45 = +[STLog usage];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
    sub_1002630C0();
  }

  id v12 = v39;
  if (a6)
  {
    id v13 = v13;
    LOBYTE(v34) = 0;
    *a6 = v13;
  }
  else
  {
    LOBYTE(v34) = 0;
  }
LABEL_46:

  return (char)v34;
}

- (id)_ensureUsageExistForUser:(id)a3 forCoreDuetIdentifiers:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v54 = a5;
  id v12 = +[STUserDeviceState fetchRequest];
  unsigned __int8 v55 = v10;
  id v13 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND (%K IN %@)", @"user", v10, @"coreDuetIdentifier", v11];
  [v12 setPredicate:v13];

  CFStringRef v72 = @"device";
  id v14 = +[NSArray arrayWithObjects:&v72 count:1];
  [v12 setRelationshipKeyPathsForPrefetching:v14];

  uint64_t v15 = [v12 execute:a6];
  if (v15)
  {
    id v16 = self;
    id v50 = v11;
    obj = a6;
    id v49 = v12;
    id v17 = +[NSMapTable strongToStrongObjectsMapTable];
    v18 = objc_opt_new();
    v56 = objc_opt_new();
    v19 = objc_opt_new();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v48 = v15;
    id v20 = v15;
    id v21 = [v20 countByEnumeratingWithState:&v65 objects:v71 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v66;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v66 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          id v26 = [v25 device];
          id v27 = [v25 coreDuetIdentifier];
          [v17 setObject:v27 forKey:v26];
          [v18 setObject:v26 forKeyedSubscript:v27];
          [v56 addObject:v26];
          [v19 addObject:v27];
        }
        id v22 = [v20 countByEnumeratingWithState:&v65 objects:v71 count:16];
      }
      while (v22);
    }

    uint64_t v28 = [(STPersistUsageOperation *)v16 _usagesForUser:v55 devices:v56 error:obj];
    if (v28)
    {
      v29 = objc_opt_new();
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v47 = v28;
      id obja = v28;
      id v30 = [obja countByEnumeratingWithState:&v61 objects:v70 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v62;
        do
        {
          for (j = 0; j != v31; j = (char *)j + 1)
          {
            if (*(void *)v62 != v32) {
              objc_enumerationMutation(obja);
            }
            id v34 = *(void **)(*((void *)&v61 + 1) + 8 * (void)j);
            unsigned int v35 = [v34 device];
            CFStringRef v36 = [v17 objectForKey:v35];

            [v29 setObject:v34 forKeyedSubscript:v36];
            [v19 removeObject:v36];
          }
          id v31 = [obja countByEnumeratingWithState:&v61 objects:v70 count:16];
        }
        while (v31);
      }

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id objb = v19;
      id v37 = [objb countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v37)
      {
        id v38 = v37;
        uint64_t v39 = *(void *)v58;
        do
        {
          for (k = 0; k != v38; k = (char *)k + 1)
          {
            if (*(void *)v58 != v39) {
              objc_enumerationMutation(objb);
            }
            uint64_t v41 = *(void *)(*((void *)&v57 + 1) + 8 * (void)k);
            id v42 = [objc_alloc((Class)STUsage) initWithContext:v54];
            [v42 setUser:v55];
            id v43 = [v18 objectForKeyedSubscript:v41];
            [v42 setDevice:v43];

            [v29 setObject:v42 forKeyedSubscript:v41];
            unsigned int v44 = +[NSDate date];
            [v42 setLastUpdatedDate:v44];
          }
          id v38 = [objb countByEnumeratingWithState:&v57 objects:v69 count:16];
        }
        while (v38);
      }

      id v45 = [v29 copy];
      uint64_t v28 = v47;
    }
    else
    {
      id v45 = 0;
    }

    id v12 = v49;
    id v11 = v50;
    uint64_t v15 = v48;
  }
  else
  {
    id v45 = 0;
  }

  return v45;
}

- (id)_fetchOrCreateUsageForUser:(id)a3 device:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    id v14 = [(STPersistUsageOperation *)self _usagesForUser:v10 devices:0 error:a6];
    if (v14) {
      goto LABEL_3;
    }
LABEL_10:
    id v16 = 0;
    goto LABEL_11;
  }
  id v13 = +[NSSet setWithObject:v11];
  id v14 = [(STPersistUsageOperation *)self _usagesForUser:v10 devices:v13 error:a6];

  if (!v14) {
    goto LABEL_10;
  }
LABEL_3:
  if ((unint64_t)[v14 count] >= 2)
  {
    uint64_t v15 = +[STLog usage];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_100263128();
    }
  }
  id v16 = [v14 firstObject];
  if (!v16)
  {
    id v16 = [objc_alloc((Class)STUsage) initWithContext:v12];
    [v16 setUser:v10];
    [v16 setDevice:v11];
    id v17 = +[NSDate date];
    [v16 setLastUpdatedDate:v17];
  }
LABEL_11:

  return v16;
}

- (id)_usagesForUser:(id)a3 devices:(id)a4 error:(id *)a5
{
  id v7 = a4;
  int64_t v8 = +[NSPredicate predicateWithFormat:@"%K = %@", @"user", a3];
  if (v7) {
    +[NSPredicate predicateWithFormat:@"%K IN %@", @"device", v7];
  }
  else {
  id v9 = +[NSPredicate predicateWithFormat:@"%K == NULL", @"device", v16];
  }
  id v10 = +[STUsage fetchRequest];
  v18[0] = v8;
  v18[1] = v9;
  id v11 = +[NSArray arrayWithObjects:v18 count:2];
  id v12 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];
  [v10 setPredicate:v12];

  v17[0] = @"device";
  v17[1] = @"blocks";
  id v13 = +[NSArray arrayWithObjects:v17 count:2];
  [v10 setRelationshipKeyPathsForPrefetching:v13];

  id v14 = [v10 execute:a5];

  return v14;
}

- (BOOL)_persistUsageReports:(id)a3 usage:(id)a4 aggregateUsage:(BOOL)a5 reportStartDate:(id)a6 durationInMinutes:(unint64_t)a7 calendar:(id)a8 shareWebUsage:(BOOL)a9 inManagedObjectContext:(id)a10 error:(id *)a11
{
  BOOL v100 = a5;
  id v94 = a3;
  id v103 = a4;
  id v14 = a6;
  id v102 = a8;
  id v114 = a10;
  uint64_t v15 = +[STLog usage];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v94 count];
    [v103 user];
    v18 = id v17 = v14;
    v19 = [v18 dsid];
    id v20 = [v103 device];
    uint64_t v21 = [v20 name];
    id v22 = (void *)v21;
    *(_DWORD *)buf = 134219010;
    CFStringRef v23 = @"NO";
    id v139 = v16;
    __int16 v140 = 2112;
    if (v100) {
      CFStringRef v23 = @"YES";
    }
    v141 = v19;
    __int16 v142 = 2112;
    uint64_t v143 = v21;
    __int16 v144 = 2112;
    CFStringRef v145 = v23;
    __int16 v146 = 2112;
    id v147 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Persisting %lu reports from user: %@ - device: %@ - is aggregate: %@ - startDate: %@", buf, 0x34u);

    id v14 = v17;
  }

  id v24 = [(STPersistUsageOperation *)self _usageBlockByTrimmedStartDate:v103 reportStartDate:v14 durationInMinutes:a7 calendar:v102];
  if (!v24)
  {
    char v28 = 0;
    goto LABEL_83;
  }
  id v25 = [(STPersistUsageOperation *)self referenceDate];

  if (!v25)
  {
    id v26 = +[NSDate date];
    [(STPersistUsageOperation *)self setReferenceDate:v26];
  }
  id v92 = v14;
  if (self)
  {
    id v27 = [(STPersistUsageOperation *)self referenceDate];
    if (v27) {
      [(STPersistUsageOperation *)self referenceDate];
    }
    else {
    v29 = +[NSDate date];
    }
    [v103 setLastUpdatedDate:v29];
  }
  else
  {
    id v27 = +[NSDate date];
    [v103 setLastUpdatedDate:v27];
  }

  id v30 = [v24 allKeys];
  v101 = +[NSMutableSet setWithArray:v30];

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id obj = v94;
  id v98 = [obj countByEnumeratingWithState:&v130 objects:v137 count:16];
  if (!v98)
  {
    id v75 = 0;
    char v93 = 1;
    goto LABEL_65;
  }
  id v31 = 0;
  uint64_t v97 = *(void *)v131;
  char v93 = 1;
  v96 = v24;
  while (2)
  {
    for (i = 0; i != v98; i = (char *)i + 1)
    {
      if (*(void *)v131 != v97) {
        objc_enumerationMutation(obj);
      }
      unsigned int v33 = *(void **)(*((void *)&v130 + 1) + 8 * i);
      if ([(STPersistUsageOperation *)self isCanceled])
      {
        id v75 = +[NSError errorWithDomain:CATErrorDomain code:404 userInfo:0];

        v80 = +[STLog usage];
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
          sub_100263190(v80);
        }

        char v93 = 0;
        goto LABEL_65;
      }
      unsigned int v35 = [v33 interval];
      CFStringRef v36 = [v35 startDate];
      id v37 = [(STPersistUsageOperation *)self _truncateDate:v36 usingCalendar:v102];

      [v33 screenTime];
      double v39 = v38;
      id v40 = [v24 objectForKeyedSubscript:v37];
      if (v100)
      {
        uint64_t v41 = [v103 user];
        id v42 = [v41 localUserDeviceState];
        if (v42)
        {
        }
        else
        {
          double v43 = (double)(uint64_t)[v40 screenTimeInSeconds];

          if (v39 < v43)
          {
            [v101 removeObject:v37];

            continue;
          }
        }
      }
      v106 = v35;
      v107 = v31;
      v108 = i;
      v109 = v34;
      if (!v40)
      {
        id v40 = [objc_alloc((Class)STUsageBlock) initWithContext:v114];
        [v40 setUsage:v103];
      }
      v105 = v37;
      [v40 setStartDate:v37];
      [v40 setDurationInMinutes:a7];
      [v40 setScreenTimeInSeconds:(uint64_t)v39];
      unsigned int v44 = [v33 lastEventDate];
      [v40 setLastEventDate:v44];

      id v45 = [v33 firstPickup];
      [v40 setFirstPickupDate:v45];

      v46 = [v33 longestSession];
      uint64_t v47 = [v46 startDate];
      [v40 setLongestSessionStartDate:v47];

      v104 = v46;
      id v48 = [v46 endDate];
      [v40 setLongestSessionEndDate:v48];

      objc_msgSend(v40, "setNumberOfPickupsWithoutApplicationUsage:", objc_msgSend(v33, "pickupsWithoutApplicationUsage"));
      int64_t v49 = [(STPersistUsageOperation *)self duration];
      id v50 = [v40 categories];
      id v51 = [(STPersistUsageOperation *)self _usageCategoryByIdentifierForCategories:v50];

      id v113 = v40;
      v52 = [v40 countedItems];
      v110 = [(STPersistUsageOperation *)self _countedItemByBundleTrustIdentifiersForCountedItems:v52];

      v53 = [v51 allKeys];
      id v54 = +[NSMutableSet setWithArray:v53];

      unsigned __int8 v55 = [v33 categoryUsage];
      long long v126 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v112 = v55;
      id v56 = [v55 countByEnumeratingWithState:&v126 objects:v136 count:16];
      if (v56)
      {
        id v57 = v56;
        uint64_t v58 = *(void *)v127;
        do
        {
          for (j = 0; j != v57; j = (char *)j + 1)
          {
            if (*(void *)v127 != v58) {
              objc_enumerationMutation(v112);
            }
            long long v60 = *(void **)(*((void *)&v126 + 1) + 8 * (void)j);
            long long v61 = [v60 categoryIdentifier];
            id v62 = [v51 objectForKeyedSubscript:v61];
            [v60 totalUsageTime];
            if (v63 <= 0.0)
            {
              if (v62)
              {
                [v114 deleteObject:v62];

                id v62 = 0;
              }
            }
            else
            {
              double v64 = v63;
              if (!v62)
              {
                id v62 = [objc_alloc((Class)STUsageCategory) initWithContext:v114];
                [v62 setIdentifier:v61];
                [v62 setBlock:v113];
              }
              [v62 setTotalTimeInSeconds:(uint64_t)v64];
            }
            if (v49 != 1440)
            {
              long long v65 = [v60 webUsage];
              long long v66 = [v60 applicationUsage];
              [(STPersistUsageOperation *)self _updateUsageBlock:v113 usageCategory:v62 countedItemsByBundleIdentifier:v110 webUsageReports:v65 applicationUsageReports:v66 shareWebUsage:a9 inManagedObjectContext:v114];
            }
            [v54 removeObject:v61];
          }
          id v57 = [v112 countByEnumeratingWithState:&v126 objects:v136 count:16];
        }
        while (v57);
      }
      v124[0] = _NSConcreteStackBlock;
      v124[1] = 3221225472;
      v124[2] = sub_10005776C;
      v124[3] = &unk_1002FD168;
      id v67 = v114;
      id v125 = v67;
      [v110 enumerateKeysAndObjectsUsingBlock:v124];
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v68 = v54;
      id v69 = [v68 countByEnumeratingWithState:&v120 objects:v135 count:16];
      if (v69)
      {
        id v70 = v69;
        uint64_t v71 = *(void *)v121;
        do
        {
          for (k = 0; k != v70; k = (char *)k + 1)
          {
            if (*(void *)v121 != v71) {
              objc_enumerationMutation(v68);
            }
            v73 = [v51 objectForKeyedSubscript:*(void *)(*((void *)&v120 + 1) + 8 * (void)k)];
            [v67 deleteObject:v73];
          }
          id v70 = [v68 countByEnumeratingWithState:&v120 objects:v135 count:16];
        }
        while (v70);
      }

      [v101 removeObject:v105];
      if (![v67 hasChanges])
      {
        id v75 = v107;
        i = v108;
LABEL_56:
        v78 = v109;
        v79 = v113;
        [v67 refreshObject:v113 mergeChanges:0];
        int v77 = 1;
        id v24 = v96;
        goto LABEL_57;
      }
      id v119 = v107;
      unsigned __int8 v74 = [v67 save:&v119];
      id v75 = v119;

      i = v108;
      if (v74) {
        goto LABEL_56;
      }
      v76 = +[STLog usage];
      if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v139 = v75;
        _os_log_fault_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_FAULT, "_persistUsageReports Failed to persist usage: %{public}@", buf, 0xCu);
      }

      char v93 = 0;
      int v77 = 0;
      id v24 = v96;
      v78 = v109;
      v79 = v113;
LABEL_57:

      id v31 = v75;
      if (!v77) {
        goto LABEL_65;
      }
    }
    id v75 = v31;
    id v98 = [obj countByEnumeratingWithState:&v130 objects:v137 count:16];
    if (v98) {
      continue;
    }
    break;
  }
LABEL_65:

  char v28 = v93;
  if ([v101 count])
  {
    v81 = +[STLog usage];
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      id v82 = [v101 count];
      *(_DWORD *)buf = 134217984;
      id v139 = v82;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Deleting %lu orphaned start dates", buf, 0xCu);
    }
  }
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v83 = v101;
  id v84 = [v83 countByEnumeratingWithState:&v115 objects:v134 count:16];
  if (v84)
  {
    id v85 = v84;
    uint64_t v86 = *(void *)v116;
    do
    {
      for (m = 0; m != v85; m = (char *)m + 1)
      {
        if (*(void *)v116 != v86) {
          objc_enumerationMutation(v83);
        }
        v88 = [v24 objectForKeyedSubscript:*(void *)(*((void *)&v115 + 1) + 8 * (void)m)];
        [v114 deleteObject:v88];
      }
      id v85 = [v83 countByEnumeratingWithState:&v115 objects:v134 count:16];
    }
    while (v85);
  }

  if (v93)
  {
    v89 = +[STLog usage];
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      v90 = [v103 lastUpdatedDate];
      *(_DWORD *)buf = 138412290;
      id v139 = v90;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "Successfully persisted reports at: %@", buf, 0xCu);
    }
  }
  else if (a11)
  {
    *a11 = v75;
  }

  id v14 = v92;
LABEL_83:

  return v28 & 1;
}

- (id)_usageBlockByTrimmedStartDate:(id)a3 reportStartDate:(id)a4 durationInMinutes:(unint64_t)a5 calendar:(id)a6
{
  id v24 = self;
  id v9 = a4;
  id v25 = a6;
  id v10 = [a3 blocks];
  id v11 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v17, "durationInMinutes", v24) == (id)a5)
        {
          v18 = [v17 startDate];
          id v19 = [v18 compare:v9];

          if (v19 != (id)-1)
          {
            id v20 = [v17 startDate];
            uint64_t v21 = [(STPersistUsageOperation *)v24 _truncateDate:v20 usingCalendar:v25];

            [v11 setObject:v17 forKeyedSubscript:v21];
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  id v22 = [v11 copy];
  return v22;
}

- (id)_countedItemByBundleTrustIdentifiersForCountedItems:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_alloc((Class)STUsageTrustIdentifier);
        id v12 = objc_msgSend(v10, "bundleIdentifier", (void)v15);
        id v13 = objc_msgSend(v11, "initWithIdentifier:usageTrusted:", v12, objc_msgSend(v10, "usageTrusted"));

        [v4 setObject:v10 forKeyedSubscript:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_usageCategoryByIdentifierForCategories:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "identifier", (void)v14);
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];
  return v12;
}

- (void)_updateUsageBlock:(id)a3 usageCategory:(id)a4 countedItemsByBundleIdentifier:(id)a5 webUsageReports:(id)a6 applicationUsageReports:(id)a7 shareWebUsage:(BOOL)a8 inManagedObjectContext:(id)a9
{
  BOOL v9 = a8;
  id v69 = a3;
  id v14 = a4;
  id v76 = a5;
  id v68 = a6;
  id obj = a7;
  id v15 = a9;
  int v77 = objc_opt_new();
  v78 = objc_opt_new();
  v73 = objc_opt_new();
  unsigned __int8 v74 = objc_opt_new();
  id v70 = objc_opt_new();
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v75 = v14;
  long long v16 = [v14 timedItems];
  id v17 = [v16 countByEnumeratingWithState:&v99 objects:v108 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v100;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v100 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        id v22 = objc_msgSend(v21, "domain", v68);
        if (v22)
        {
          id v23 = objc_msgSend(objc_alloc((Class)STUsageTrustIdentifier), "initWithIdentifier:usageTrusted:", v22, objc_msgSend(v21, "usageTrusted"));
          [v77 setObject:v21 forKeyedSubscript:v23];
          [v73 addObject:v23];
        }
        id v24 = [v21 bundleIdentifier];
        if (v24)
        {
          id v25 = objc_msgSend(objc_alloc((Class)STUsageTrustIdentifier), "initWithIdentifier:usageTrusted:", v24, objc_msgSend(v21, "usageTrusted"));
          [v78 setObject:v21 forKeyedSubscript:v25];
          [v74 addObject:v25];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v99 objects:v108 count:16];
    }
    while (v18);
  }

  if (v75 && v9)
  {
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v26 = v68;
    id v27 = [v26 countByEnumeratingWithState:&v95 objects:v107 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v96;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v96 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v95 + 1) + 8 * (void)j);
          uint64_t v32 = objc_msgSend(v31, "domainIdentifier", v68);
          id v33 = objc_msgSend(objc_alloc((Class)STUsageTrustIdentifier), "initWithIdentifier:usageTrusted:", v32, objc_msgSend(v31, "webUsageTrusted"));
          id v34 = [v77 objectForKeyedSubscript:v33];
          if (!v34)
          {
            id v34 = [objc_alloc((Class)STUsageTimedItem) initWithContext:v15];
            [v34 setDomain:v32];
            objc_msgSend(v34, "setUsageTrusted:", objc_msgSend(v31, "webUsageTrusted"));
            [v34 setCategory:v75];
          }
          [v31 totalUsageTime];
          [v34 setTotalTimeInSeconds:(uint64_t)v35];
          [v73 removeObject:v33];
        }
        id v28 = [v26 countByEnumeratingWithState:&v95 objects:v107 count:16];
      }
      while (v28);
    }
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obja = obj;
  id v36 = [obja countByEnumeratingWithState:&v91 objects:v106 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v92;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v92 != v38) {
          objc_enumerationMutation(obja);
        }
        id v40 = *(void **)(*((void *)&v91 + 1) + 8 * (void)k);
        uint64_t v41 = objc_msgSend(v40, "canonicalBundleIdentifier", v68);
        id v42 = objc_msgSend(objc_alloc((Class)STUsageTrustIdentifier), "initWithIdentifier:usageTrusted:", v41, objc_msgSend(v40, "applicationUsageTrusted"));
        id v43 = [v78 objectForKeyedSubscript:v42];
        [v40 totalUsageTime];
        if (v75 && (uint64_t v45 = (uint64_t)v44, (uint64_t)v44 >= 1))
        {
          if (!v43)
          {
            id v43 = [objc_alloc((Class)STUsageTimedItem) initWithContext:v15];
            [v43 setBundleIdentifier:v41];
            objc_msgSend(v43, "setUsageTrusted:", objc_msgSend(v40, "applicationUsageTrusted"));
            [v43 setCategory:v75];
          }
          [v43 setTotalTimeInSeconds:v45];
          [v74 removeObject:v42];
        }
        else
        {
          if (!v43) {
            goto LABEL_37;
          }
          [v15 deleteObject:v43];
        }

LABEL_37:
        id v46 = [v76 objectForKeyedSubscript:v42];
        id v47 = [v40 totalUserNotifications];
        uint64_t v48 = (uint64_t)[v40 totalPickups];
        if ((uint64_t)v47 <= 0 && v48 < 1)
        {
          if (!v46) {
            goto LABEL_47;
          }
          [v15 deleteObject:v46];
        }
        else
        {
          uint64_t v50 = v48;
          if (!v46)
          {
            id v46 = [objc_alloc((Class)STUsageCountedItem) initWithContext:v15];
            [v46 setBundleIdentifier:v41];
            objc_msgSend(v46, "setUsageTrusted:", objc_msgSend(v40, "applicationUsageTrusted"));
            [v46 setBlock:v69];
          }
          [v46 setNumberOfNotifications:v47];
          [v46 setNumberOfPickups:v50];
          [v70 addObject:v42];
        }

LABEL_47:
      }
      id v37 = [obja countByEnumeratingWithState:&v91 objects:v106 count:16];
    }
    while (v37);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v51 = v73;
  id v52 = [v51 countByEnumeratingWithState:&v87 objects:v105 count:16];
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = *(void *)v88;
    do
    {
      for (m = 0; m != v53; m = (char *)m + 1)
      {
        if (*(void *)v88 != v54) {
          objc_enumerationMutation(v51);
        }
        id v56 = objc_msgSend(v77, "objectForKeyedSubscript:", *(void *)(*((void *)&v87 + 1) + 8 * (void)m), v68);
        [v15 deleteObject:v56];
      }
      id v53 = [v51 countByEnumeratingWithState:&v87 objects:v105 count:16];
    }
    while (v53);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v57 = v74;
  id v58 = [v57 countByEnumeratingWithState:&v83 objects:v104 count:16];
  if (v58)
  {
    id v59 = v58;
    uint64_t v60 = *(void *)v84;
    do
    {
      for (n = 0; n != v59; n = (char *)n + 1)
      {
        if (*(void *)v84 != v60) {
          objc_enumerationMutation(v57);
        }
        id v62 = objc_msgSend(v78, "objectForKeyedSubscript:", *(void *)(*((void *)&v83 + 1) + 8 * (void)n), v68);
        [v15 deleteObject:v62];
      }
      id v59 = [v57 countByEnumeratingWithState:&v83 objects:v104 count:16];
    }
    while (v59);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v63 = v70;
  id v64 = [v63 countByEnumeratingWithState:&v79 objects:v103 count:16];
  if (v64)
  {
    id v65 = v64;
    uint64_t v66 = *(void *)v80;
    do
    {
      for (ii = 0; ii != v65; ii = (char *)ii + 1)
      {
        if (*(void *)v80 != v66) {
          objc_enumerationMutation(v63);
        }
        objc_msgSend(v76, "setObject:forKeyedSubscript:", 0, *(void *)(*((void *)&v79 + 1) + 8 * (void)ii), v68);
      }
      id v65 = [v63 countByEnumeratingWithState:&v79 objects:v103 count:16];
    }
    while (v65);
  }
}

- (void)_purgeExpiredAggregateUsageForUser:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 localUserDeviceState];

  if (v7)
  {
    if (([v5 syncingEnabled] & 1) == 0)
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v8 = [v5 usages];
      id v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v36;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v36 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            id v14 = [v13 device];

            if (!v14)
            {
              [v6 deleteObject:v13];
              goto LABEL_34;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = [v5 usages];
  id v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (!v16)
  {

    uint64_t v19 = 0;
    id v18 = 0;
    uint64_t v8 = 0;
    goto LABEL_33;
  }
  id v17 = v16;
  uint64_t v29 = v6;
  id v30 = v5;
  uint64_t v8 = 0;
  id v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = *(void *)v32;
  do
  {
    for (j = 0; j != v17; j = (char *)j + 1)
    {
      if (*(void *)v32 != v20) {
        objc_enumerationMutation(v15);
      }
      id v22 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
      id v23 = objc_msgSend(v22, "lastUpdatedDate", v29, v30);
      id v24 = [v22 device];

      if (v24)
      {
        if (v19)
        {
          id v25 = v19;
          id v26 = v23;
          if ([v23 compare:v19] != (id)-1) {
            goto LABEL_24;
          }
        }
        else
        {
          id v25 = 0;
          id v26 = v23;
        }
      }
      else
      {
        id v27 = v22;

        id v25 = v18;
        uint64_t v8 = v27;
        id v18 = v23;
        id v26 = v19;
      }
      id v28 = v23;

      uint64_t v19 = v26;
LABEL_24:
    }
    id v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
  }
  while (v17);

  if (v8)
  {
    id v6 = v29;
    id v5 = v30;
    if (v19 && [v18 compare:v19] == (id)-1) {
      [v29 deleteObject:v8];
    }
  }
  else
  {
    id v6 = v29;
    id v5 = v30;
  }
LABEL_33:

LABEL_34:
LABEL_35:
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (void)setPersistenceController:(id)a3
{
}

- (STFetchedUsageResults)fetchedUsageResults
{
  return self->_fetchedUsageResults;
}

- (void)setFetchedUsageResults:(id)a3
{
}

- (STFetchUsageOperation)fetchUsageOperation
{
  return self->_fetchUsageOperation;
}

- (void)setFetchUsageOperation:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
}

- (NSManagedObjectID)userDeviceStateID
{
  return self->_userDeviceStateID;
}

- (void)setUserDeviceStateID:(id)a3
{
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
}

- (int64_t)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_userDeviceStateID, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchUsageOperation, 0);
  objc_storeStrong((id *)&self->_fetchedUsageResults, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_moc, 0);
}

@end