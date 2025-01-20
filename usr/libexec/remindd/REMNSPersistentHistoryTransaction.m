@interface REMNSPersistentHistoryTransaction
- (id)initWithPersistentHistoryTransaction:(id)a3;
@end

@implementation REMNSPersistentHistoryTransaction

- (id)initWithPersistentHistoryTransaction:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v43 = 0;
    goto LABEL_34;
  }
  id v5 = objc_alloc_init((Class)_REMNSPersistentHistoryTransactionStorage);
  id v6 = objc_alloc((Class)REMNSPersistentHistoryToken);
  v7 = [v4 token];
  id v8 = [v6 initWithPersistentHistoryToken:v7];
  [v5 setToken:v8];

  [v5 setChanges:0];
  v9 = [v4 timestamp];
  [v5 setTimestamp:v9];

  [v5 setTransactionNumber:[v4 transactionNumber]];
  v10 = [v4 storeID];
  [v5 setStoreID:v10];

  v11 = [v4 bundleID];
  [v5 setBundleID:v11];

  v12 = [v4 processID];
  [v5 setProcessID:v12];

  v13 = [v4 contextName];
  [v5 setContextName:v13];

  v14 = [v4 author];
  [v5 setAuthor:v14];

  v15 = [(REMNSPersistentHistoryTransaction *)self initWithStorage:v5];
  if (!v15) {
    goto LABEL_30;
  }
  v16 = +[REMChangeTracking entityNamesToIncludeFromTrackingWithOptionProvider:objc_opt_class()];
  v49 = +[NSSet setWithArray:v16];

  v17 = [v4 changes];
  v18 = v17;
  if (!v17) {
    goto LABEL_29;
  }
  id v46 = v5;
  id v47 = v4;
  v48 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v17 count]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v45 = v18;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (!v20) {
    goto LABEL_25;
  }
  id v21 = v20;
  uint64_t v22 = *(void *)v51;
  do
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v51 != v22) {
        objc_enumerationMutation(v19);
      }
      v24 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      v25 = [v24 changedObjectID];
      v26 = [v25 entity];

      uint64_t v27 = [v26 name];
      if (v27
        && (v28 = (void *)v27,
            [v26 name],
            v29 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v30 = [v49 containsObject:v29],
            v29,
            v28,
            (v30 & 1) != 0))
      {
        v31 = [v26 managedObjectClassName];
        v32 = v31;
        if (v31) {
          Class v33 = NSClassFromString(v31);
        }
        else {
          Class v33 = 0;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (((uint64_t (*)(Class, const char *))[(objc_class *)v33 methodForSelector:"conformsToREMChangeTrackingIdentifiable"])(v33, "conformsToREMChangeTrackingIdentifiable") & 1) != 0)
        {
          v35 = [objc_alloc((Class)REMNSPersistentHistoryChange) initWithPersistentHistoryChange:v24];
          v34 = v35;
          if (v35)
          {
            [v35 setInternal_ChangeTransaction:v15];
            [v48 addObject:v34];
          }
        }
        else
        {
          v34 = os_log_create("com.apple.reminderkit", "default");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v36 = [v26 name];
            *(_DWORD *)buf = 138543362;
            v55 = v36;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Changed object does not conform to REMChangeTrackingIdentifiable is excluded from change tracking (%{public}@)", buf, 0xCu);
          }
        }
      }
      else
      {
        v32 = os_log_create("com.apple.reminderkit", "default");
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        v34 = [v26 name];
        *(_DWORD *)buf = 138543362;
        v55 = v34;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Not an REM change tracking allowlisted entity, excluding this entity from change tracking? (%{public}@)", buf, 0xCu);
      }

LABEL_23:
    }
    id v21 = [v19 countByEnumeratingWithState:&v50 objects:v56 count:16];
  }
  while (v21);
LABEL_25:

  id v37 = [v48 count];
  v38 = [(REMNSPersistentHistoryTransaction *)v15 storage];
  v39 = v38;
  if (v37) {
    v40 = v48;
  }
  else {
    v40 = 0;
  }
  [v38 setChanges:v40];

  id v5 = v46;
  id v4 = v47;
  v18 = v45;
LABEL_29:

LABEL_30:
  v41 = [(REMNSPersistentHistoryTransaction *)v15 storage];
  v42 = [v41 changes];

  if (!v42)
  {

    v15 = 0;
  }
  self = v15;

  v43 = self;
LABEL_34:

  return v43;
}

@end