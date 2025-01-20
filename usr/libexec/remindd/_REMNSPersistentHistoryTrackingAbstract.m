@interface _REMNSPersistentHistoryTrackingAbstract
- (NSCache)cachedAccountIDsByStoreIDsMap;
- (id)_accountIDForPersistenceStoreID:(id)a3;
- (id)_accountIdentifierForPersistenceStoreID:(id)a3;
- (id)_changeTokenFromCDTrackingState:(id)a3 error:(id *)a4;
- (id)_currentREMChangeTokenFromNSPersistentStores:(id)a3 persistentStoreCoordinator:(id)a4;
- (id)_errorChangeSetWithError:(id)a3;
- (id)_executeDeleteHistoryRequest:(id)a3;
- (id)_fetchCDAuxiliaryChangeInfosWithObjectID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5;
- (id)_fetchCDTrackingStateWithClientID:(id)a3 andPerformBlock:(id)a4;
- (id)_fetchRequestWithPredicateUsingEntityNames:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (id)_persistenceStoreForAccountID:(id)a3;
- (id)_persistenceStoreIDForAccountID:(id)a3;
- (id)_persistenceStoreIDsForAccountTypes:(int64_t)a3;
- (id)_persistenceStoresForAccountTypes:(id)a3;
- (id)_resultChangeSetByExecutingRequest:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (id)currentChangeToken;
- (id)currentChangeTokenForAccountID:(id)a3;
- (id)currentChangeTokenForAccountTypes:(int64_t)a3;
- (id)earliestChangeTokenForAccountID:(id)a3;
- (void)_resolveObjectIDsInChanges:(id)a3 deletedObjectsIDMap:(id)a4 inManagedObjectContext:(id)a5;
- (void)deleteHistoryBeforeDate:(id)a3 completionHandler:(id)a4;
- (void)deleteHistoryBeforeToken:(id)a3 completionHandler:(id)a4;
- (void)fetchAuxiliaryChangeInfos:(id)a3 completionHandler:(id)a4;
- (void)fetchHistoryAfterDate:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetchHistoryAfterToken:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6;
- (void)getTrackingStateWithClientID:(id)a3 completionHandler:(id)a4;
- (void)saveTrackingState:(id)a3 withClientID:(id)a4 completionHandler:(id)a5;
- (void)setCachedAccountIDsByStoreIDsMap:(id)a3;
- (void)withManagedObjectContext:(id)a3;
@end

@implementation _REMNSPersistentHistoryTrackingAbstract

- (void)withManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)currentChangeToken
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100057110;
  v9 = sub_100057120;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100057128;
  v4[3] = &unk_1008AFD30;
  v4[4] = self;
  v4[5] = &v5;
  [(_REMNSPersistentHistoryTrackingAbstract *)self withManagedObjectContext:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)currentChangeTokenForAccountTypes:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100057110;
  id v10 = sub_100057120;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000572BC;
  v5[3] = &unk_1008AFD58;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(_REMNSPersistentHistoryTrackingAbstract *)self withManagedObjectContext:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)currentChangeTokenForAccountID:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100057110;
  v14 = sub_100057120;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000575A0;
  v6[3] = &unk_1008AFD80;
  uint64_t v7 = self;
  id v3 = a3;
  id v8 = v3;
  v9 = &v10;
  [(_REMNSPersistentHistoryTrackingAbstract *)v7 withManagedObjectContext:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

- (id)earliestChangeTokenForAccountID:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100057110;
  v14 = sub_100057120;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000577E8;
  v6[3] = &unk_1008AFD80;
  uint64_t v7 = self;
  id v3 = a3;
  id v8 = v3;
  v9 = &v10;
  [(_REMNSPersistentHistoryTrackingAbstract *)v7 withManagedObjectContext:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

- (void)getTrackingStateWithClientID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  objc_opt_class();
  id v8 = REMCheckedDynamicCast();
  v9 = +[REMLog changeTracking];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100752474();
  }

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100057110;
  v16 = sub_100057120;
  id v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100057C08;
  v11[3] = &unk_1008AFDA8;
  v11[4] = self;
  v11[5] = &v12;
  uint64_t v10 = [(_REMNSPersistentHistoryTrackingAbstract *)self _fetchCDTrackingStateWithClientID:v8 andPerformBlock:v11];
  v7[2](v7, v13[5], v10);

  _Block_object_dispose(&v12, 8);
}

- (void)saveTrackingState:(id)a3 withClientID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  objc_opt_class();
  id v11 = REMCheckedDynamicCast();
  uint64_t v12 = +[REMLog changeTracking];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1007525EC();
  }

  v13 = [v8 lastConsumedChangeToken];
  id v25 = 0;
  uint64_t v14 = +[NSKeyedArchiver archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v25];
  id v15 = v25;

  if (v14)
  {
    v16 = [v11 accountIdentifier];
    id v17 = [(_REMNSPersistentHistoryTrackingAbstract *)self _persistenceStoreForAccountID:v16];

    if (v17)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100057F68;
      v21[3] = &unk_1008AFDD0;
      id v22 = v17;
      id v23 = v11;
      id v24 = v14;
      v18 = [(_REMNSPersistentHistoryTrackingAbstract *)self _fetchCDTrackingStateWithClientID:v23 andPerformBlock:v21];
    }
    else
    {
      v20 = +[REMLog changeTracking];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100752584();
      }

      v18 = +[NSError errorWithREMChangeErrorCode:7];
    }
  }
  else
  {
    v19 = +[REMLog changeTracking];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1007524E8((uint64_t)v11, v15);
    }

    v18 = +[NSError errorWithREMChangeErrorCode:9 underlyingError:v15];
  }

  v10[2](v10, v18);
}

- (void)fetchHistoryAfterDate:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, uint64_t, uint64_t))a6;
  if (a5 && [v11 count])
  {
    id v17 = +[REMLog changeTracking];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100752704(v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  v13 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterDate:v10];
  uint64_t v14 = v13;
  if (a5) {
    [v13 setFetchLimit:a5];
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_100057110;
  v40 = sub_100057120;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_100057110;
  v34 = sub_100057120;
  id v35 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005834C;
  v25[3] = &unk_1008AFDF8;
  v25[4] = self;
  id v15 = v11;
  id v26 = v15;
  v28 = &v30;
  id v16 = v14;
  id v27 = v16;
  v29 = &v36;
  [(_REMNSPersistentHistoryTrackingAbstract *)self withManagedObjectContext:v25];
  v12[2](v12, v37[5], v31[5]);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
}

- (void)fetchHistoryAfterToken:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, uint64_t, uint64_t))a6;
  if (a5 && [v11 count])
  {
    uint64_t v21 = +[REMLog changeTracking];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_100752704(v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }
  id v13 = v10;
  objc_opt_class();
  uint64_t v14 = REMSpecificCast();

  id v15 = v13;
  if (v14)
  {

    id v15 = 0;
  }
  objc_opt_class();
  id v16 = REMDynamicCast();
  id v17 = v16;
  if (!v15 || v16)
  {
    if (v15)
    {
      uint64_t v20 = [v16 token];
    }
    else
    {
      uint64_t v20 = 0;
    }
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = sub_100057110;
    v46 = sub_100057120;
    id v47 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = sub_100057110;
    v40 = sub_100057120;
    id v41 = 0;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10005873C;
    v29[3] = &unk_1008AFE20;
    id v18 = v20;
    id v30 = v18;
    v31 = self;
    id v32 = v11;
    v33 = &v36;
    v34 = &v42;
    unint64_t v35 = a5;
    [(_REMNSPersistentHistoryTrackingAbstract *)self withManagedObjectContext:v29];
    v12[2](v12, v43[5], v37[5]);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);
  }
  else
  {
    id v18 = +[NSError errorWithREMChangeErrorCode:0];
    uint64_t v19 = [(_REMNSPersistentHistoryTrackingAbstract *)self _errorChangeSetWithError:v18];
    v12[2](v12, (uint64_t)v19, (uint64_t)v18);
  }
}

- (id)_fetchRequestWithPredicateUsingEntityNames:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v7;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
    uint64_t v27 = v9;
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v16 = +[NSEntityDescription entityForName:v15 inManagedObjectContext:v8];
          if (v16)
          {
            [v9 addObject:v16];
          }
          else
          {
            id v17 = +[REMLog changeTracking];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v33 = v15;
              _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Failed to find entity name in -fetchHistoryAfterToken:entityName: {name: %{public}@}", buf, 0xCu);
            }

            id v18 = +[REMError invalidParameterErrorWithDescription:@"Failed to find entity name in -fetchHistoryAfterToken:entityName."];
            if (a5)
            {
              *a5 = +[NSError errorWithREMChangeErrorCode:1 underlyingError:v18];
            }

            id v9 = v27;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      uint64_t v19 = +[NSPersistentHistoryChange entityDescriptionWithContext:v8];
      uint64_t v20 = [v19 propertiesByName];
      uint64_t v21 = [v20 valueForKey:@"changedEntity"];

      id v22 = objc_alloc_init((Class)NSFetchRequest);
      [v22 setEntity:v19];
      uint64_t v23 = [v21 name];
      uint64_t v24 = +[NSPredicate predicateWithFormat:@"%K IN %@", v23, v27];
      [v22 setPredicate:v24];

      id v9 = v27;
    }
    else
    {
      id v22 = 0;
    }

    id v7 = v26;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (void)deleteHistoryBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v8 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:a3];
  id v7 = [(_REMNSPersistentHistoryTrackingAbstract *)self _executeDeleteHistoryRequest:v8];
  v6[2](v6, v7);
}

- (void)deleteHistoryBeforeToken:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v15 = v6;
  objc_opt_class();
  id v8 = REMSpecificCast();

  id v9 = v15;
  if (v8)
  {

    id v9 = 0;
  }
  objc_opt_class();
  id v10 = REMDynamicCast();
  id v11 = v10;
  if (!v9 || v10)
  {
    if (v9)
    {
      id v12 = [v10 token];
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v13 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeToken:v12];
    uint64_t v14 = [(_REMNSPersistentHistoryTrackingAbstract *)self _executeDeleteHistoryRequest:v13];
    v7[2](v7, v14);
  }
  else
  {
    id v12 = +[NSError errorWithREMChangeErrorCode:0];
    v7[2](v7, v12);
  }
}

- (void)fetchAuxiliaryChangeInfos:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  id v8 = +[NSMutableDictionary dictionary];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100057110;
  uint64_t v20 = sub_100057120;
  id v21 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100058F2C;
  v11[3] = &unk_1008AFE48;
  id v9 = v6;
  id v12 = v9;
  uint64_t v13 = self;
  id v15 = &v16;
  id v10 = v8;
  id v14 = v10;
  [(_REMNSPersistentHistoryTrackingAbstract *)self withManagedObjectContext:v11];
  v7[2](v7, v10, v17[5]);

  _Block_object_dispose(&v16, 8);
}

- (id)_persistenceStoreForAccountID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)_persistenceStoresForAccountTypes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)_accountIdentifierForPersistenceStoreID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)_persistenceStoreIDForAccountID:(id)a3
{
  id v3 = [(_REMNSPersistentHistoryTrackingAbstract *)self _persistenceStoreForAccountID:a3];
  id v4 = [v3 identifier];

  return v4;
}

- (id)_persistenceStoreIDsForAccountTypes:(int64_t)a3
{
  id v4 = +[REMAccount _accountTypeMaskWithBitMask:a3];
  uint64_t v5 = +[NSMutableArray array];
  id v6 = [(_REMNSPersistentHistoryTrackingAbstract *)self _persistenceStoresForAccountTypes:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) identifier];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_accountIDForPersistenceStoreID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_REMNSPersistentHistoryTrackingAbstract *)self cachedAccountIDsByStoreIDsMap];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = [(_REMNSPersistentHistoryTrackingAbstract *)self _accountIdentifierForPersistenceStoreID:v4];
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
    uint64_t v9 = v8;
    if (v7 && v8)
    {
      id v6 = +[REMAccount objectIDWithUUID:v8];
      id v10 = [(_REMNSPersistentHistoryTrackingAbstract *)self cachedAccountIDsByStoreIDsMap];
      [v10 setObject:v6 forKey:v4];
    }
  }

  return v6;
}

- (id)_currentREMChangeTokenFromNSPersistentStores:(id)a3 persistentStoreCoordinator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [v6 currentPersistentHistoryTokenFromStores:v5];
    id v8 = [objc_alloc((Class)REMNSPersistentHistoryToken) initWithPersistentHistoryToken:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_errorChangeSetWithError:(id)a3
{
  if (a3)
  {
    id v3 = +[REMChangeSet errorChangeSetWithError:](REMChangeSet, "errorChangeSetWithError:");
  }
  else
  {
    id v5 = +[REMLog changeTracking];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10075273C(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    long long v13 = +[REMError internalErrorWithDebugDescription:@"Attempting to get errorChangeSet with nil error."];
    id v3 = +[REMChangeSet errorChangeSetWithError:v13];
  }

  return v3;
}

- (id)_resultChangeSetByExecutingRequest:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[REMLog changeTracking];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 transactionAuthor];
    *(_DWORD *)buf = 138543362;
    v80 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "REMNSPersistentHistoryTracking resultChangeSet: Will fetch transactions {author: %{public}@}", buf, 0xCu);
  }
  uint64_t v12 = +[NSDate now];
  [v8 setResultType:5];
  id v75 = 0;
  long long v13 = [v9 executeRequest:v8 error:&v75];
  id v14 = v75;
  if (v14)
  {
    long long v15 = v14;
    long long v16 = +[REMLog changeTracking];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v56 = [v9 transactionAuthor];
      v57 = +[NSDate now];
      [v57 timeIntervalSinceDate:v12];
      *(_DWORD *)buf = 138543874;
      v80 = v56;
      __int16 v81 = 2048;
      double v82 = v58 * 1000.0;
      __int16 v83 = 2112;
      id v84 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "REMNSPersistentHistoryTracking resultChangeSet: Failed to fetch transactions {author: %{public}@, elapsedTime: %.4lf ms, error: %@}", buf, 0x20u);
    }
    if ([v15 code] == (id)134301) {
      uint64_t v17 = 4;
    }
    else {
      uint64_t v17 = 1;
    }
    v54 = +[NSError errorWithREMChangeErrorCode:v17 underlyingError:v15];
    id v46 = 0;
    uint64_t v18 = v65;
  }
  else
  {
    uint64_t v18 = v65;
    if (!v13)
    {
      v59 = +[REMLog changeTracking];
      if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
        sub_10075282C();
      }
    }
    objc_opt_class();
    uint64_t v19 = [v13 result];
    long long v15 = REMDynamicCast();

    uint64_t v20 = +[REMLog changeTracking];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v9 transactionAuthor];
      id v22 = +[NSDate now];
      [v22 timeIntervalSinceDate:v12];
      double v24 = v23 * 1000.0;
      id v25 = [v15 count];
      *(_DWORD *)buf = 138543874;
      v80 = v21;
      __int16 v81 = 2048;
      double v82 = v24;
      __int16 v83 = 2048;
      id v84 = v25;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "REMNSPersistentHistoryTracking resultChangeSet: Did fetch transactions {author: %{public}@, elapsedTime: %.4lf ms, transactions.count: %llu}", buf, 0x20u);

      uint64_t v18 = v65;
    }

    if (v15)
    {
      v61 = v13;
      v62 = v12;
      v67 = v9;
      v63 = a5;
      id v64 = v8;
      v68 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v15 count]);
      v66 = +[NSMutableDictionary dictionary];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      v60 = v15;
      id obj = [v15 reverseObjectEnumerator];
      id v26 = [obj countByEnumeratingWithState:&v71 objects:v78 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v72;
        long long v29 = INDateRelevanceProvider_ptr;
        do
        {
          long long v30 = 0;
          id v69 = v27;
          do
          {
            if (*(void *)v72 != v28) {
              objc_enumerationMutation(obj);
            }
            long long v31 = *(void **)(*((void *)&v71 + 1) + 8 * (void)v30);
            id v33 = v31;
            id v34 = [objc_alloc((Class)v29[209]) initWithPersistentHistoryTransaction:v33];
            unint64_t v35 = v34;
            if (v34)
            {
              uint64_t v36 = [v34 storeID];
              if (v36)
              {
                uint64_t v37 = v28;
                uint64_t v38 = v29;
                v39 = [(_REMNSPersistentHistoryTrackingAbstract *)self _accountIDForPersistenceStoreID:v36];
                v40 = self;
                if (v39)
                {
                  [v35 _resolveAccountID:v39];
                  id v41 = [v35 changes];
                  [(_REMNSPersistentHistoryTrackingAbstract *)v40 _resolveObjectIDsInChanges:v41 deletedObjectsIDMap:v66 inManagedObjectContext:v67];

                  [v68 addObject:v35];
                }
                else
                {
                  uint64_t v42 = +[REMLog changeTracking];
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                    sub_1007527D0((uint64_t)v76, (uint64_t)v35);
                  }
                }
                self = v40;
                long long v29 = v38;
                uint64_t v28 = v37;
                id v27 = v69;
              }
              else
              {
                v39 = +[REMLog changeTracking];
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                  sub_100752774((uint64_t)v77, (uint64_t)v35);
                }
              }
            }
            long long v30 = (char *)v30 + 1;
          }
          while (v27 != v30);
          id v27 = [obj countByEnumeratingWithState:&v71 objects:v78 count:16];
        }
        while (v27);
      }

      id v43 = objc_alloc((Class)REMChangeSet);
      uint64_t v44 = [v68 reverseObjectEnumerator];
      v45 = [v44 allObjects];
      id v46 = [v43 initWithChangeTransactions:v45];

      id v47 = +[REMLog changeTracking];
      id v9 = v67;
      uint64_t v12 = v62;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = [v67 transactionAuthor];
        v49 = +[NSDate now];
        [v49 timeIntervalSinceDate:v62];
        double v51 = v50 * 1000.0;
        v52 = [v46 transactions];
        id v53 = [v52 count];
        *(_DWORD *)buf = 138543874;
        v80 = v48;
        __int16 v81 = 2048;
        double v82 = v51;
        __int16 v83 = 2048;
        id v84 = v53;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "REMNSPersistentHistoryTracking resultChangeSet: Did generate changeSet for transactions {author: %{public}@, cumulativeElapsedTime: %.4lf ms, transactions.count: %llu}", buf, 0x20u);
      }
      v54 = 0;
      a5 = v63;
      id v8 = v64;
      uint64_t v18 = v65;
      long long v15 = v60;
      long long v13 = v61;
    }
    else
    {
      v54 = +[NSError errorWithREMChangeErrorCode:2];
      id v46 = 0;
    }
  }

  if (!v46)
  {
    id v46 = [(_REMNSPersistentHistoryTrackingAbstract *)self _errorChangeSetWithError:v54];
  }
  if (a5) {
    *a5 = v54;
  }

  return v46;
}

- (void)_resolveObjectIDsInChanges:(id)a3 deletedObjectsIDMap:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v35 = a5;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v30 = v7;
  id obj = [v7 reverseObjectEnumerator];
  uint64_t v36 = (char *)[obj countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v39;
    id v31 = v8;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        uint64_t v11 = REMCheckedDynamicCast();
        uint64_t v12 = [v11 changedManagedObjectID];
        long long v13 = [v12 entity];
        id v14 = [v13 name];

        if (v14)
        {
          id v37 = 0;
          long long v15 = [v35 existingObjectWithID:v12 error:&v37];
          long long v16 = v37;
          if (v15)
          {
            objc_opt_class();
            if ((objc_opt_respondsToSelector() & 1) != 0
              && (uint64_t v17 = (uint64_t (*)(uint64_t, const char *))[(id)objc_opt_class() methodForSelector:"conformsToREMChangeTrackingIdentifiable"], v18 = objc_opt_class(), (v17(v18, "conformsToREMChangeTrackingIdentifiable") & 1) != 0))
            {
              id v32 = v10;
              uint64_t v19 = v15;
              uint64_t v20 = [v19 remChangedObjectID];
              if (v20)
              {
                id v21 = v20;
                id v22 = [v20 uuid];
                double v23 = [v21 entityName];
                [v11 resolveObjectIDWithUUID:v22 entityName:v23];

                id v8 = v31;
              }
              else
              {
                id v21 = 0;
                id v22 = +[REMLog changeTracking];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  id v43 = v12;
                  __int16 v44 = 2112;
                  v45 = v11;
                  __int16 v46 = 2112;
                  id v47 = v19;
                  _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Changed object has nil remChangedObjectID {mID: %{public}@, change: %@, managedObject: %@}", buf, 0x20u);
                }
              }

              uint64_t v10 = v32;
            }
            else
            {
              uint64_t v19 = +[REMLog changeTracking];
              if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543618;
                id v43 = v12;
                __int16 v44 = 2112;
                v45 = v11;
                _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Changed object does not conform to REMChangeTrackingIdentifiable, skip resolving objectID {mID: %{public}@, change: %@}", buf, 0x16u);
              }
            }

            [v35 refreshObject:v15 mergeChanges:0];
            goto LABEL_32;
          }
          double v24 = [v11 tombstone];
          id v25 = [v24 objectIdentifier];

          if (v25)
          {
            id v26 = [v25 UUIDString];
            [v8 setObject:v26 forKey:v12];

            goto LABEL_18;
          }
          uint64_t v27 = [v8 objectForKeyedSubscript:v12];
          if (v27)
          {
            uint64_t v28 = (void *)v27;
            id v25 = [objc_alloc((Class)NSUUID) initWithUUIDString:v27];

            if (!v25) {
              goto LABEL_29;
            }
LABEL_18:
            [v11 resolveObjectIDWithUUID:v25 entityName:v14];
          }
          else
          {
            long long v29 = +[REMLog changeTracking];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v43 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "We may have found a race condition where object got deleted in context before we could fetch a deletion change history! {mID: %@}", buf, 0xCu);
            }

LABEL_29:
            id v25 = +[REMLog changeTracking];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v43 = v12;
              __int16 v44 = 2112;
              v45 = v11;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not find the REMChangedObjectIdentifying ID of the managed object previously deleted in the same change set {mID: %@, change: %@}", buf, 0x16u);
            }
          }

LABEL_32:
          goto LABEL_33;
        }
        long long v16 = +[REMLog changeTracking];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v43 = v11;
          _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Failed to get entity name from persistent history change {change: %@}", buf, 0xCu);
        }
LABEL_33:

        ++v9;
      }
      while (v36 != v9);
      uint64_t v36 = (char *)[obj countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v36);
  }
}

- (id)_executeDeleteHistoryRequest:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = sub_100057110;
  id v14 = sub_100057120;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005A738;
  v7[3] = &unk_1008AFE70;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  [(_REMNSPersistentHistoryTrackingAbstract *)self withManagedObjectContext:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (id)_fetchCDTrackingStateWithClientID:(id)a3 andPerformBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100057110;
  uint64_t v20 = sub_100057120;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005AA1C;
  v12[3] = &unk_1008AFE98;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  id v9 = v7;
  id v14 = v9;
  [(_REMNSPersistentHistoryTrackingAbstract *)self withManagedObjectContext:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)_changeTokenFromCDTrackingState:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 lastConsumedChangeTokenData];
  if (v6)
  {
    id v12 = 0;
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v12];
    id v8 = v12;
    if (!v7)
    {
      id v9 = +[REMLog changeTracking];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100752ABC(v5, v8, v9);
      }

      if (a4)
      {
        *a4 = +[NSError errorWithREMChangeErrorCode:9 underlyingError:v8];
      }
    }
  }
  else
  {
    id v10 = +[REMLog changeTracking];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100752A10(v5);
    }

    if (a4)
    {
      +[NSError errorWithREMChangeErrorCode:9];
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)_fetchCDAuxiliaryChangeInfosWithObjectID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = [a3 uuid];
  id v8 = +[REMCDAuxiliaryChangeInfo fetchRequest];
  id v9 = +[NSPredicate predicateWithFormat:@"identifier == %@", v7];
  [v8 setPredicate:v9];

  id v16 = 0;
  id v10 = [v6 executeFetchRequest:v8 error:&v16];

  id v11 = v16;
  if (v11)
  {
    id v12 = +[REMLog changeTracking];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100752C08((uint64_t)v7, v11);
    }
LABEL_8:

    goto LABEL_9;
  }
  if (!v10 || ![v10 count])
  {
    id v12 = +[REMLog changeTracking];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100752BA0();
    }
    goto LABEL_8;
  }
LABEL_9:
  id v13 = [v10 firstObject];
  if (!v13)
  {
    id v14 = +[REMLog changeTracking];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100752BA0();
    }
  }

  return v13;
}

- (NSCache)cachedAccountIDsByStoreIDsMap
{
  return self->_cachedAccountIDsByStoreIDsMap;
}

- (void)setCachedAccountIDsByStoreIDsMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end