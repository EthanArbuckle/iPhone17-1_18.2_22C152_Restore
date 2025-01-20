@interface RMActivationEngine
+ (BOOL)_isKeychainAsset:(id)a3;
- (BOOL)_assetsRemoved:(id)a3 managementSourceIdentifier:(id)a4 personaID:(id)a5;
- (BOOL)_attachAssetReferences:(id)a3;
- (BOOL)_attachConfigurationReferences:(id)a3;
- (BOOL)_deleteDeclarationsThatAreNoLongerNeeded:(id)a3;
- (BOOL)_processAllDeclarations:(id)a3;
- (BOOL)_processManagementProperties:(id)a3;
- (BOOL)_reconcile:(id)a3;
- (BOOL)_remove:(id)a3;
- (BOOL)_removeKeychainAssets:(id)a3;
- (BOOL)_updateUnknownDeclarations:(id)a3;
- (BOOL)removeReturningError:(id *)a3;
- (NSManagedObjectContext)context;
- (NSManagedObjectID)managementSourceObjectID;
- (RMActivationEngine)initWithManagementSourceObjectID:(id)a3 context:(id)a4;
- (RMDebounceTimer)debouncer;
- (id)_checkPredicateStatusKeysForActivations:(id)a3 managementSource:(id)a4;
- (id)getDeclarationsMarkedForRemovalFromFetchRequest:(id)a3 managementSource:(id)a4;
- (void)_keychainAssetRemoved:(id)a3 managementSourceIdentifier:(id)a4 personaID:(id)a5;
- (void)_predicateStatusItemDidChange:(id)a3;
- (void)deleteObjects:(id)a3 managementSourceIdentifier:(id)a4 removeStatus:(BOOL)a5;
- (void)setDebouncer:(id)a3;
- (void)syncWithCompletionHandler:(id)a3;
- (void)triggerAggregatingTimerAction;
@end

@implementation RMActivationEngine

- (RMActivationEngine)initWithManagementSourceObjectID:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RMActivationEngine;
  v9 = [(RMActivationEngine *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managementSourceObjectID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    uint64_t v11 = +[RMDebounceTimer debounceTimerWithMinimumInterval:v10 maximumInterval:@"RMActivationEngine" delegate:5.0 identifier:60.0];
    debouncer = v10->_debouncer;
    v10->_debouncer = (RMDebounceTimer *)v11;

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v10 selector:"_predicateStatusItemDidChange:" name:@"RMPredicateStatusUpdaterDidChangeNotification" object:0];
  }
  return v10;
}

- (void)triggerAggregatingTimerAction
{
  v3 = +[RMLog activationEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000A9F0();
  }

  [(RMActivationEngine *)self syncWithCompletionHandler:&stru_1000C4DE0];
}

- (void)_predicateStatusItemDidChange:(id)a3
{
  id v8 = [a3 userInfo];
  v4 = [v8 objectForKeyedSubscript:@"RMUserInfoKeyPredicateUpdatedManagementSourceObjectIDs"];
  if (!v4
    || ([(RMActivationEngine *)self managementSourceObjectID],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v4 containsObject:v5],
        v5,
        v6))
  {
    id v7 = [(RMActivationEngine *)self debouncer];
    [v7 trigger];
  }
}

- (void)syncWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "ActivationEngine: syncing", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  unsigned int v6 = +[RMLog activationEngine];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000AAC0();
  }

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = sub_1000063B4;
  v16 = sub_1000063C4;
  id v17 = 0;
  [(RMActivationEngine *)self context];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000063CC;
  v8[3] = &unk_1000C4E08;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v7;
  v10 = self;
  uint64_t v11 = &v12;
  [v7 performBlockAndWait:v8];
  v4[2](v4, v13[5]);

  _Block_object_dispose(&v12, 8);
  os_activity_scope_leave(&state);
}

- (BOOL)removeReturningError:(id *)a3
{
  v5 = _os_activity_create((void *)&_mh_execute_header, "ActivationEngine: removing", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  unsigned int v6 = +[RMLog activationEngine];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000ABF8();
  }

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1000063B4;
  v19 = sub_1000063C4;
  id v20 = 0;
  [(RMActivationEngine *)self context];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006750;
  v11[3] = &unk_1000C4E08;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v7;
  v13 = self;
  uint64_t v14 = &v15;
  [v7 performBlockAndWait:v11];
  if (a3)
  {
    id v8 = (void *)v16[5];
    if (v8) {
      *a3 = v8;
    }
  }
  BOOL v9 = v16[5] == 0;

  _Block_object_dispose(&v15, 8);
  os_activity_scope_leave(&state);

  return v9;
}

- (BOOL)_reconcile:(id)a3
{
  id v4 = a3;
  if ([(RMActivationEngine *)self _deleteDeclarationsThatAreNoLongerNeeded:v4]&& [(RMActivationEngine *)self _updateUnknownDeclarations:v4]&& [(RMActivationEngine *)self _attachConfigurationReferences:v4]&& [(RMActivationEngine *)self _attachAssetReferences:v4]&& [(RMActivationEngine *)self _processManagementProperties:v4])
  {
    BOOL v5 = [(RMActivationEngine *)self _processAllDeclarations:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_remove:(id)a3
{
  return [(RMActivationEngine *)self _removeKeychainAssets:a3];
}

- (BOOL)_deleteDeclarationsThatAreNoLongerNeeded:(id)a3
{
  id v4 = a3;
  BOOL v5 = &CC_SHA256_Final_ptr;
  unsigned int v6 = +[RMLog activationEngine];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000AD30();
  }

  id v7 = +[RMConfigurationPayload fetchRequest];
  id v8 = [(RMActivationEngine *)self getDeclarationsMarkedForRemovalFromFetchRequest:v7 managementSource:v4];

  if (v8)
  {
    BOOL v9 = +[RMActivationPayload fetchRequest];
    v10 = [(RMActivationEngine *)self getDeclarationsMarkedForRemovalFromFetchRequest:v9 managementSource:v4];

    if (v10)
    {
      uint64_t v11 = +[RMAssetPayload fetchRequest];
      id v12 = [(RMActivationEngine *)self getDeclarationsMarkedForRemovalFromFetchRequest:v11 managementSource:v4];

      BOOL v13 = v12 != 0;
      if (v12)
      {
        uint64_t v14 = [v4 identifier];
        uint64_t v15 = +[RMLog activationEngine];
        v16 = &off_10009D000;
        v55 = v8;
        v54 = v14;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          log = v15;
          os_log_t v48 = (os_log_t)[v10 count];
          if (v48)
          {
            uint64_t v17 = v10;
            v18 = +[NSMutableArray arrayWithCapacity:[v17 count]];
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            v19 = v17;
            id v20 = [v19 countByEnumeratingWithState:&v56 objects:buf count:16];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = *(void *)v57;
              do
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v57 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = [*(id *)(*((void *)&v56 + 1) + 8 * i) description];
                  [v18 addObject:v24];
                }
                id v21 = [v19 countByEnumeratingWithState:&v56 objects:buf count:16];
              }
              while (v21);
            }

            v25 = [v18 sortedArrayUsingSelector:"caseInsensitiveCompare:"];

            id v8 = v55;
            BOOL v13 = v12 != 0;
            uint64_t v14 = v54;
            v16 = &off_10009D000;
            BOOL v5 = &CC_SHA256_Final_ptr;
          }
          else
          {
            v25 = @"none";
          }
          *(_DWORD *)buf = *((void *)v16 + 431);
          v61 = v25;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Deleting activations (no status): %{public}@", buf, 0xCu);
          if (v48) {

          }
          uint64_t v15 = log;
        }

        [(RMActivationEngine *)self deleteObjects:v10 managementSourceIdentifier:v14 removeStatus:0];
        v26 = [v5[248] activationEngine];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          loga = v26;
          os_log_t v49 = (os_log_t)[v8 count];
          if (v49)
          {
            id v27 = v8;
            v28 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v27 count]);
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v29 = v27;
            id v30 = [v29 countByEnumeratingWithState:&v56 objects:buf count:16];
            if (v30)
            {
              id v31 = v30;
              uint64_t v32 = *(void *)v57;
              do
              {
                for (j = 0; j != v31; j = (char *)j + 1)
                {
                  if (*(void *)v57 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  v34 = [*(id *)(*((void *)&v56 + 1) + 8 * (void)j) description];
                  [v28 addObject:v34];
                }
                id v31 = [v29 countByEnumeratingWithState:&v56 objects:buf count:16];
              }
              while (v31);
            }

            v35 = [v28 sortedArrayUsingSelector:"caseInsensitiveCompare:"];

            id v8 = v55;
            BOOL v13 = v12 != 0;
            uint64_t v14 = v54;
            v16 = &off_10009D000;
            BOOL v5 = &CC_SHA256_Final_ptr;
          }
          else
          {
            v35 = @"none";
          }
          *(_DWORD *)buf = *((void *)v16 + 431);
          v61 = v35;
          _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_INFO, "Deleting configurations (and status): %{public}@", buf, 0xCu);
          if (v49) {

          }
          v26 = loga;
        }

        [(RMActivationEngine *)self deleteObjects:v8 managementSourceIdentifier:v14 removeStatus:1];
        v36 = [v5[248] activationEngine];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          os_log_t logb = (os_log_t)[v12 count];
          if (logb)
          {
            os_log_t v50 = v36;
            v37 = v12;
            v38 = +[NSMutableArray arrayWithCapacity:[v37 count]];
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            v39 = v37;
            id v40 = [v39 countByEnumeratingWithState:&v56 objects:buf count:16];
            if (v40)
            {
              id v41 = v40;
              uint64_t v42 = *(void *)v57;
              do
              {
                for (k = 0; k != v41; k = (char *)k + 1)
                {
                  if (*(void *)v57 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  v44 = [*(id *)(*((void *)&v56 + 1) + 8 * (void)k) description];
                  [v38 addObject:v44];
                }
                id v41 = [v39 countByEnumeratingWithState:&v56 objects:buf count:16];
              }
              while (v41);
            }

            v45 = [v38 sortedArrayUsingSelector:"caseInsensitiveCompare:"];

            id v8 = v55;
            BOOL v13 = v12 != 0;
            uint64_t v14 = v54;
            v16 = &off_10009D000;
            v36 = v50;
          }
          else
          {
            v45 = @"none";
          }
          *(_DWORD *)buf = *((void *)v16 + 431);
          v61 = v45;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Deleting assets (and status): %{public}@", buf, 0xCu);
          if (logb) {
        }
          }
        v46 = [v4 personaIdentifier];
        [(RMActivationEngine *)self _assetsRemoved:v12 managementSourceIdentifier:v14 personaID:v46];

        [(RMActivationEngine *)self deleteObjects:v12 managementSourceIdentifier:v14 removeStatus:1];
      }
      else
      {
        uint64_t v14 = +[RMLog activationEngine];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Failed to delete assets.", buf, 2u);
        }
      }
    }
    else
    {
      id v12 = +[RMLog activationEngine];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Failed to delete activations.", buf, 2u);
      }
      BOOL v13 = 0;
    }
  }
  else
  {
    v10 = +[RMLog activationEngine];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Failed to delete configurations.", buf, 2u);
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (id)getDeclarationsMarkedForRemovalFromFetchRequest:(id)a3 managementSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 setIncludesPendingChanges:1];
  id v7 = +[NSPredicate predicateWithFormat:@"(%K == %@) && (%K == %d)", @"managementSource", v6, @"loadState", 3];

  [v5 setPredicate:v7];
  v14[0] = @"declarationType";
  v14[1] = @"identifier";
  v14[2] = @"serverToken";
  id v8 = +[NSArray arrayWithObjects:v14 count:3];
  [v5 setPropertiesToFetch:v8];

  id v13 = 0;
  BOOL v9 = [v5 execute:&v13];
  id v10 = v13;
  if (!v9)
  {
    uint64_t v11 = +[RMLog activationEngine];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10000AD64();
    }
  }

  return v9;
}

- (void)deleteObjects:(id)a3 managementSourceIdentifier:(id)a4 removeStatus:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v12);
        if (v5)
        {
          uint64_t v14 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) identifier];
          uint64_t v15 = [v13 serverToken];
          +[RMConfigurationStatusArchiver removeStatusForStoreIdentifier:v8 declarationIdentifier:v14 declarationServerToken:v15 error:0];
        }
        v16 = [v13 managedObjectContext];
        [v16 deleteObject:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (BOOL)_updateUnknownDeclarations:(id)a3
{
  id v3 = a3;
  v68 = [v3 managedObjectContext];
  id v4 = +[RMActivationPayload fetchRequest];
  v66 = v3;
  BOOL v5 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND (%K == %d)", @"managementSource", v3, @"loadState", 4];
  [v4 setPredicate:v5];

  [v4 setIncludesPendingChanges:1];
  id v85 = 0;
  id v6 = [v4 execute:&v85];
  id v7 = v85;
  if (!v6)
  {
    id v8 = +[RMLog activationEngine];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10000ADF0();
    }
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v81 objects:v96 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v82;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v82 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        uint64_t v14 = [v13 declarationType];
        uint64_t v15 = [v13 state];
        if (+[RMModelDeclarationBase isDeclarationTypeKnown:v14])
        {
          if ([v13 reloadReturningError:0]) {
            BOOL v16 = v15 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (!v16) {
            [(RMActivationPayloadState *)v15 setInactiveReasons:&__NSArray0__struct];
          }
        }
        else if (!v15)
        {
          uint64_t v15 = [[RMActivationPayloadState alloc] initWithContext:v68];
          [(RMActivationPayloadState *)v15 setActivation:v13];
          long long v17 = +[RMModelStatusReason failedWithUnknownDeclarationType:v14];
          v95 = v17;
          long long v18 = +[NSArray arrayWithObjects:&v95 count:1];
          [(RMActivationPayloadState *)v15 setInactiveReasons:v18];

          [v13 setState:v15];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v81 objects:v96 count:16];
    }
    while (v10);
  }

  id v19 = +[RMConfigurationPayload fetchRequest];
  long long v20 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND (%K == %d)", @"managementSource", v66, @"loadState", 4];
  [v19 setPredicate:v20];

  [v19 setIncludesPendingChanges:1];
  id v85 = 0;
  id v21 = [v19 execute:&v85];
  id v22 = v85;
  if (!v21)
  {
    v23 = +[RMLog activationEngine];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      sub_10000ADF0();
    }
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v24 = v21;
  id v25 = [v24 countByEnumeratingWithState:&v77 objects:v94 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v78;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v78 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
        id v30 = [v29 declarationType];
        id v31 = [v29 state];
        if (+[RMModelDeclarationBase isDeclarationTypeKnown:v30])
        {
          if ([v29 reloadReturningError:0]) {
            BOOL v32 = v31 == 0;
          }
          else {
            BOOL v32 = 1;
          }
          if (!v32) {
            [(RMConfigurationPayloadState *)v31 setError:0];
          }
        }
        else if (!v31)
        {
          id v31 = [[RMConfigurationPayloadState alloc] initWithContext:v68];
          [(RMConfigurationPayloadState *)v31 setConfiguration:v29];
          [(RMConfigurationPayloadState *)v31 setActive:0];
          CFStringRef v92 = @"Error.UnknownDeclarationType";
          v93 = v30;
          v33 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
          [(RMConfigurationPayloadState *)v31 setError:v33];

          [v29 setState:v31];
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v77 objects:v94 count:16];
    }
    while (v26);
  }

  id v34 = +[RMAssetPayload fetchRequest];
  v35 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND (%K == %d)", @"managementSource", v66, @"loadState", 4];
  [v34 setPredicate:v35];

  [v34 setIncludesPendingChanges:1];
  id v85 = 0;
  v36 = [v34 execute:&v85];
  id v37 = v85;
  if (!v36)
  {
    v38 = +[RMLog activationEngine];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      sub_10000ADF0();
    }
  }
  v65 = v24;

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v39 = v36;
  id v40 = [v39 countByEnumeratingWithState:&v73 objects:v91 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v74;
    do
    {
      for (k = 0; k != v41; k = (char *)k + 1)
      {
        if (*(void *)v74 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v73 + 1) + 8 * (void)k);
        v45 = [v44 declarationType];
        v46 = [v44 state];
        if (+[RMModelDeclarationBase isDeclarationTypeKnown:v45])
        {
          if ([v44 reloadReturningError:0]) {
            BOOL v47 = v46 == 0;
          }
          else {
            BOOL v47 = 1;
          }
          if (!v47) {
            [(RMAssetPayloadState *)v46 setError:0];
          }
        }
        else if (!v46)
        {
          v46 = [[RMAssetPayloadState alloc] initWithContext:v68];
          [(RMAssetPayloadState *)v46 setAsset:v44];
          CFStringRef v89 = @"Error.UnknownDeclarationType";
          v90 = v45;
          os_log_t v48 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
          [(RMAssetPayloadState *)v46 setError:v48];

          [v44 setState:v46];
        }
      }
      id v41 = [v39 countByEnumeratingWithState:&v73 objects:v91 count:16];
    }
    while (v41);
  }

  id v49 = +[RMManagementPayload fetchRequest];
  os_log_t v50 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND (%K == %d)", @"managementSource", v66, @"loadState", 4];
  [v49 setPredicate:v50];

  [v49 setIncludesPendingChanges:1];
  id v85 = 0;
  v51 = [v49 execute:&v85];
  id v52 = v85;
  if (!v51)
  {
    v53 = +[RMLog activationEngine];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
      sub_10000ADF0();
    }
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v54 = v51;
  id v55 = [v54 countByEnumeratingWithState:&v69 objects:v88 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v70;
    do
    {
      for (m = 0; m != v56; m = (char *)m + 1)
      {
        if (*(void *)v70 != v57) {
          objc_enumerationMutation(v54);
        }
        long long v59 = *(void **)(*((void *)&v69 + 1) + 8 * (void)m);
        v60 = [v59 declarationType];
        v61 = [v59 state];
        if (+[RMModelDeclarationBase isDeclarationTypeKnown:v60])
        {
          [v59 setLoadState:1];
          if ([v59 reloadReturningError:0]) {
            BOOL v62 = v61 == 0;
          }
          else {
            BOOL v62 = 1;
          }
          if (!v62) {
            [(RMManagementPayloadState *)v61 setError:0];
          }
        }
        else if (!v61)
        {
          v61 = [[RMManagementPayloadState alloc] initWithContext:v68];
          [(RMManagementPayloadState *)v61 setManagement:v59];
          CFStringRef v86 = @"Error.UnknownDeclarationType";
          v87 = v60;
          v63 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
          [(RMManagementPayloadState *)v61 setError:v63];

          [v59 setState:v61];
        }
      }
      id v56 = [v54 countByEnumeratingWithState:&v69 objects:v88 count:16];
    }
    while (v56);
  }

  return 1;
}

- (BOOL)_attachConfigurationReferences:(id)a3
{
  id v3 = a3;
  id v4 = +[RMLog activationEngine];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000AF80();
  }

  id v5 = v3;
  id v6 = +[RMConfigurationPayloadReference fetchRequest];
  [v6 setIncludesPendingChanges:1];
  id v7 = +[NSPredicate predicateWithFormat:@"(%K == %@) && ((%K == NULL) || (%K == %d))", @"activation.managementSource", v5, @"configuration", @"configuration.loadState", 3];
  [v6 setPredicate:v7];

  *(void *)buf = @"configurationIdentifier";
  id v8 = +[NSArray arrayWithObjects:buf count:1];
  [v6 setPropertiesToFetch:v8];

  *(void *)&long long v63 = 0;
  id v9 = [v6 execute:&v63];
  id v10 = (id)v63;
  if (!v9)
  {
    uint64_t v11 = +[RMLog activationEngine];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10000AF18();
    }
  }
  if (!v9)
  {
    os_log_t v48 = +[RMLog activationEngine];
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    id v49 = "Failed to attach configuration references.";
LABEL_43:
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, v49, buf, 2u);
    goto LABEL_44;
  }
  if (![v9 count])
  {
    os_log_t v48 = +[RMLog activationEngine];
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    id v49 = "No configuration references to attach.";
    goto LABEL_43;
  }
  v53 = v9;
  id v12 = [v9 valueForKey:@"configurationIdentifier"];
  id v13 = +[RMConfigurationPayload fetchRequest];
  id v51 = v5;
  id v14 = v5;
  uint64_t v15 = v12;
  [v13 setIncludesPendingChanges:1];
  id v52 = v15;
  BOOL v16 = +[NSPredicate predicateWithFormat:@"(%K == %@) && (%K == %d) && (%K IN %@)", @"managementSource", v14, @"loadState", 1, @"identifier", v15];
  [v13 setPredicate:v16];

  CFStringRef v74 = @"identifier";
  long long v17 = +[NSArray arrayWithObjects:&v74 count:1];
  [v13 setPropertiesToFetch:v17];

  id v67 = 0;
  long long v18 = [v13 execute:&v67];
  id v19 = v67;
  if (!v18)
  {
    long long v20 = +[RMLog activationEngine];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_10000AE8C();
    }
  }
  id v21 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v18 count]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v22 = v18;
  id v23 = [v22 countByEnumeratingWithState:&v63 objects:buf count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v64;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v64 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        v28 = [v27 identifier];
        [v21 setObject:v27 forKeyedSubscript:v28];
      }
      id v24 = [v22 countByEnumeratingWithState:&v63 objects:buf count:16];
    }
    while (v24);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v29 = v53;
  id v30 = [v29 countByEnumeratingWithState:&v59 objects:v68 count:16];
  id v31 = &CC_SHA256_Final_ptr;
  if (v30)
  {
    id v32 = v30;
    uint64_t v33 = *(void *)v60;
    do
    {
      id v34 = 0;
      do
      {
        if (*(void *)v60 != v33) {
          objc_enumerationMutation(v29);
        }
        v35 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v34);
        v36 = [v35 configuration];
        id v37 = [v35 configurationIdentifier];
        v38 = [v21 objectForKeyedSubscript:v37];

        if (v36 != v38)
        {
          id v39 = [v31[248] activationEngine];
          BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);
          if (v36)
          {
            if (v40)
            {
              id v55 = [v35 activation];
              uint64_t v57 = [v55 description];
              id v54 = [v36 description];
              uint64_t v41 = [v38 description];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v57;
              __int16 v70 = 2112;
              uint64_t v71 = (uint64_t)v54;
              __int16 v72 = 2112;
              uint64_t v73 = v41;
              uint64_t v42 = (void *)v41;
              _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Reattaching configuration reference for %@ to from %@ to %@...", buf, 0x20u);

              id v31 = &CC_SHA256_Final_ptr;
              v43 = v55;
              goto LABEL_34;
            }
          }
          else if (v40)
          {
            long long v58 = [v35 activation];
            id v56 = [v58 description];
            uint64_t v44 = [v38 description];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v56;
            __int16 v70 = 2112;
            uint64_t v71 = v44;
            v45 = (void *)v44;
            _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Attaching configuration reference for %@ to %@...", buf, 0x16u);

            id v31 = &CC_SHA256_Final_ptr;
            v43 = v58;
LABEL_34:
          }
          [v35 setConfiguration:v38];
        }

        id v34 = (char *)v34 + 1;
      }
      while (v32 != v34);
      id v46 = [v29 countByEnumeratingWithState:&v59 objects:v68 count:16];
      id v32 = v46;
    }
    while (v46);
  }

  BOOL v47 = [v31[248] activationEngine];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Attached configuration references.", buf, 2u);
  }

  id v5 = v51;
  os_log_t v48 = v52;
  id v9 = v53;
LABEL_44:

  return v9 != 0;
}

- (BOOL)_attachAssetReferences:(id)a3
{
  id v3 = a3;
  id v4 = +[RMLog activationEngine];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000B01C();
  }

  id v5 = v3;
  id v6 = +[RMAssetPayloadReference fetchRequest];
  [v6 setIncludesPendingChanges:1];
  id v7 = +[NSPredicate predicateWithFormat:@"(%K == %@) && ((%K == NULL) || (%K == %d))", @"configuration.managementSource", v5, @"asset", @"asset.loadState", 3];
  [v6 setPredicate:v7];

  *(void *)buf = @"assetIdentifier";
  id v8 = +[NSArray arrayWithObjects:buf count:1];
  [v6 setPropertiesToFetch:v8];

  *(void *)&long long v61 = 0;
  id v9 = [v6 execute:&v61];
  id v10 = (id)v61;
  if (!v9)
  {
    uint64_t v11 = +[RMLog activationEngine];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10000AFB4();
    }
  }
  if (!v9)
  {
    os_log_t v48 = +[RMLog activationEngine];
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    id v49 = "Failed to attach asset references.";
LABEL_43:
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, v49, buf, 2u);
    goto LABEL_44;
  }
  if (![v9 count])
  {
    os_log_t v48 = +[RMLog activationEngine];
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    id v49 = "No asset references to attach.";
    goto LABEL_43;
  }
  v53 = v9;
  id v12 = [v9 valueForKey:@"assetIdentifier"];
  id v13 = +[RMAssetPayload fetchRequest];
  id v51 = v5;
  id v14 = v5;
  uint64_t v15 = v12;
  [v13 setIncludesPendingChanges:1];
  id v52 = v15;
  BOOL v16 = +[NSPredicate predicateWithFormat:@"(%K == %@) && (%K == %d) && (%K IN %@)", @"managementSource", v14, @"loadState", 1, @"identifier", v15];
  [v13 setPredicate:v16];

  CFStringRef v72 = @"identifier";
  long long v17 = +[NSArray arrayWithObjects:&v72 count:1];
  [v13 setPropertiesToFetch:v17];

  id v65 = 0;
  long long v18 = [v13 execute:&v65];
  id v19 = v65;
  if (!v18)
  {
    long long v20 = +[RMLog activationEngine];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_10000AE8C();
    }
  }
  id v21 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v18 count]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v22 = v18;
  id v23 = [v22 countByEnumeratingWithState:&v61 objects:buf count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v62;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v62 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v28 = [v27 identifier];
        [v21 setObject:v27 forKeyedSubscript:v28];
      }
      id v24 = [v22 countByEnumeratingWithState:&v61 objects:buf count:16];
    }
    while (v24);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v53;
  id v29 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v58;
    do
    {
      id v32 = 0;
      do
      {
        if (*(void *)v58 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v32);
        id v34 = [v33 asset];
        v35 = [v33 assetIdentifier];
        v36 = [v21 objectForKeyedSubscript:v35];

        if (v34 != v36)
        {
          id v37 = +[RMLog activationEngine];
          BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG);
          if (v34)
          {
            if (v38)
            {
              id v55 = [v33 configuration];
              id v54 = [v55 description];
              id v39 = [v34 description];
              uint64_t v40 = [v36 description];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v54;
              __int16 v68 = 2112;
              long long v69 = v39;
              __int16 v70 = 2112;
              uint64_t v71 = v40;
              uint64_t v41 = (void *)v40;
              _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Reattaching asset reference for %@ to from %@ to %@...", buf, 0x20u);

              goto LABEL_34;
            }
          }
          else if (v38)
          {
            id v55 = [v33 configuration];
            uint64_t v44 = [v55 description];
            v45 = [v36 description];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v44;
            __int16 v68 = 2112;
            long long v69 = v45;
            _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Attaching asset reference for %@ to %@...", buf, 0x16u);

LABEL_34:
          }

          uint64_t v42 = [v33 assetIdentifier];
          v43 = [v21 objectForKeyedSubscript:v42];
          [v33 setAsset:v43];
        }
        id v32 = (char *)v32 + 1;
      }
      while (v30 != v32);
      id v46 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
      id v30 = v46;
    }
    while (v46);
  }

  BOOL v47 = +[RMLog activationEngine];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Attached asset references.", buf, 2u);
  }

  id v5 = v51;
  os_log_t v48 = v52;
  id v9 = v53;
LABEL_44:

  return v9 != 0;
}

- (BOOL)_processManagementProperties:(id)a3
{
  id v3 = a3;
  id v4 = +[RMManagementPayload fetchRequest];
  id v5 = +[RMModelManagementPropertiesDeclaration registeredIdentifier];
  id v6 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND (%K == %d) AND (%K == %@)", @"managementSource", v3, @"loadState", 1, @"declarationType", v5];
  [v4 setPredicate:v6];

  [v4 setIncludesPendingChanges:1];
  CFStringRef v39 = @"payload";
  id v7 = +[NSArray arrayWithObjects:&v39 count:1];
  [v4 setPropertiesToFetch:v7];

  id v37 = 0;
  id v8 = [v4 execute:&v37];
  id v9 = v37;
  id v10 = v9;
  if (v8)
  {
    id v30 = v3;

    uint64_t v11 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v29 = v8;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v13)
    {
      id v14 = v13;
      id v15 = 0;
      uint64_t v16 = *(void *)v34;
      while (2)
      {
        long long v17 = 0;
        long long v18 = v15;
        do
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v12);
          }
          id v19 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)v17) payload];
          id v32 = v18;
          long long v20 = +[RMModelManagementPropertiesDeclaration loadData:v19 serializationType:0 error:&v32];
          id v15 = v32;

          if (!v20)
          {
            id v22 = +[RMLog activationEngine];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_10000B120();
            }

            id v3 = v30;
            goto LABEL_22;
          }
          id v21 = [v20 payloadANY];
          [v11 addEntriesFromDictionary:v21];

          long long v17 = (char *)v17 + 1;
          long long v18 = v15;
        }
        while (v14 != v17);
        id v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v15 = 0;
    }
    uint64_t v25 = v15;

    id v3 = v30;
    id v26 = [v30 identifier];
    id v31 = v15;
    unsigned __int8 v27 = +[RMManagementPropertiesArchiver persistPropertiesWithStoreIdentifier:v26 properties:v11 error:&v31];
    id v15 = v31;

    if (v27)
    {
      BOOL v24 = 1;
      id v8 = v29;
    }
    else
    {
      id v12 = +[RMLog activationEngine];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000B0B8();
      }
LABEL_22:
      id v8 = v29;

      BOOL v24 = 0;
    }
  }
  else
  {
    id v23 = +[RMLog activationEngine];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      sub_10000B050();
    }

    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)_processAllDeclarations:(id)a3
{
  id v3 = a3;
  id v4 = +[RMActivationPayload fetchRequest];
  v119 = v3;
  id v5 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND ((%K == %d) OR ((%K != NULL) AND (%K.%K == YES)))", @"managementSource", v3, @"loadState", 1, @"state", @"state", @"active"];
  [v4 setPredicate:v5];

  [v4 setIncludesPendingChanges:1];
  id v6 = [v4 entity];
  id v7 = +[RMActivationPayload entity];
  unsigned int v8 = [v6 isKindOfEntity:v7];

  if (v8)
  {
    v159[0] = @"identifier";
    id v9 = +[NSArray arrayWithObjects:v159 count:1];
    [v4 setPropertiesToFetch:v9];

    *(void *)v164 = @"state";
    *(void *)&v164[8] = @"configurationReferences";
    id v10 = (long long *)v164;
    uint64_t v11 = 2;
  }
  else
  {
    id v12 = +[RMConfigurationPayload entity];
    unsigned int v13 = [v6 isKindOfEntity:v12];

    if (!v13) {
      goto LABEL_6;
    }
    *(void *)&long long v165 = @"identifier";
    id v14 = +[NSArray arrayWithObjects:&v165 count:1];
    [v4 setPropertiesToFetch:v14];

    *(void *)&long long v160 = @"state";
    id v10 = &v160;
    uint64_t v11 = 1;
  }
  id v15 = +[NSArray arrayWithObjects:v10 count:v11];
  [v4 setRelationshipKeyPathsForPrefetching:v15];

LABEL_6:
  *(void *)buf = 0;
  uint64_t v16 = [v4 execute:buf];
  id v17 = *(id *)buf;
  long long v18 = v17;
  v120 = (void *)v16;
  if (!v16)
  {
    unsigned __int8 v27 = v4;
    v28 = +[RMLog activationEngine];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_10000B188();
    }

    LOBYTE(v6) = 0;
    long long v20 = v119;
    goto LABEL_100;
  }

  id v19 = +[RMConfigurationPayload fetchRequest];
  long long v20 = v119;
  id v21 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND ((%K == %d) OR ((%K != NULL) AND (%K.%K == YES)))", @"managementSource", v119, @"loadState", 1, @"state", @"state", @"active"];
  [v19 setPredicate:v21];

  [v19 setIncludesPendingChanges:1];
  id v6 = [v19 entity];
  id v22 = +[RMActivationPayload entity];
  unsigned int v23 = [v6 isKindOfEntity:v22];

  if (v23)
  {
    v159[0] = @"identifier";
    BOOL v24 = +[NSArray arrayWithObjects:v159 count:1];
    [v19 setPropertiesToFetch:v24];

    *(void *)v164 = @"state";
    *(void *)&v164[8] = @"configurationReferences";
    uint64_t v25 = (long long *)v164;
    uint64_t v26 = 2;
LABEL_14:
    id v32 = +[NSArray arrayWithObjects:v25 count:v26];
    [v19 setRelationshipKeyPathsForPrefetching:v32];

    goto LABEL_15;
  }
  id v29 = +[RMConfigurationPayload entity];
  unsigned int v30 = [v6 isKindOfEntity:v29];

  if (v30)
  {
    *(void *)&long long v165 = @"identifier";
    id v31 = +[NSArray arrayWithObjects:&v165 count:1];
    [v19 setPropertiesToFetch:v31];

    *(void *)&long long v160 = @"state";
    uint64_t v25 = &v160;
    uint64_t v26 = 1;
    goto LABEL_14;
  }
LABEL_15:
  *(void *)buf = 0;
  unsigned __int8 v27 = [v19 execute:buf];
  id v33 = *(id *)buf;
  long long v34 = v33;
  if (v27)
  {

    long long v35 = [v119 identifier];
    id v150 = 0;
    id v6 = +[RMManagementPropertiesArchiver propertiesWithStoreIdentifier:v35 error:&v150];
    id v36 = v150;

    v125 = v6;
    if (v6)
    {
      id v37 = [(RMActivationEngine *)self _checkPredicateStatusKeysForActivations:v120 managementSource:v119];
      LOBYTE(v6) = v37 != 0;
      if (v37)
      {
        id v118 = v36;
        id v117 = v37;
        id v38 = v37;
        id v39 = v119;
        if ([v38 count])
        {
          id v40 = [objc_alloc((Class)RMManagementChannel) initWithManagementSource:v39];
          uint64_t v41 = objc_opt_new();
          uint64_t v42 = [v41 queryForStatusWithKeyPaths:v38 onBehalfOfManagementChannel:v40];
          v123 = [v42 statusByKeyPath];
        }
        else
        {
          v123 = &__NSDictionary0__struct;
        }

        v127 = objc_opt_new();
        long long v146 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        id obj = v120;
        v124 = v27;
        id v126 = [obj countByEnumeratingWithState:&v146 objects:v153 count:16];
        if (v126)
        {
          uint64_t v122 = *(void *)v147;
          do
          {
            uint64_t v45 = 0;
            do
            {
              if (*(void *)v147 != v122) {
                objc_enumerationMutation(obj);
              }
              id v46 = *(id *)(*((void *)&v146 + 1) + 8 * v45);
              id v47 = v123;
              id v48 = v125;
              id v49 = objc_opt_new();
              [v46 predicateDescription];
              uint64_t v134 = v45;
              v137 = v49;
              v131 = v48;
              v130 = v132 = v47;
              if (v130)
              {
                os_log_t v50 = [v46 predicateDescription];
                id v151 = 0;
                id v51 = [v50 evaluateWithStatus:v47 properties:v48 error:&v151];
                id v52 = v151;

                v129 = v52;
                if (v51 == (id)-1)
                {
                  uint64_t v53 = +[RMModelStatusReason predicateEvaluationFailedWithError:v52 forActivation:v46];
                }
                else
                {
                  if (v51) {
                    goto LABEL_36;
                  }
                  uint64_t v53 = +[RMModelStatusReason predicateEvaluatedToFalseForActivation:v46];
                }
                id v54 = (void *)v53;
                [v49 addObject:v53];
              }
              else
              {
                v129 = 0;
              }
LABEL_36:
              v136 = objc_opt_new();
              v133 = v46;
              id v55 = [v46 configurationReferences];
              id v56 = [v55 allObjects];

              v128 = +[NSSortDescriptor sortDescriptorWithKey:@"configurationIdentifier" ascending:1];
              v169 = v128;
              long long v57 = +[NSArray arrayWithObjects:&v169 count:1];
              long long v58 = [v56 sortedArrayUsingDescriptors:v57];

              long long v167 = 0u;
              long long v168 = 0u;
              long long v165 = 0u;
              long long v166 = 0u;
              id v138 = v58;
              id v141 = [v138 countByEnumeratingWithState:&v165 objects:v164 count:16];
              if (v141)
              {
                uint64_t v139 = *(void *)v166;
                do
                {
                  for (i = 0; i != v141; i = (char *)i + 1)
                  {
                    if (*(void *)v166 != v139) {
                      objc_enumerationMutation(v138);
                    }
                    long long v60 = *(void **)(*((void *)&v165 + 1) + 8 * i);
                    long long v61 = [v60 configuration];
                    if (v61)
                    {
                      long long v63 = objc_opt_new();
                      long long v64 = [v61 assetReferences];
                      long long v160 = 0u;
                      long long v161 = 0u;
                      long long v162 = 0u;
                      long long v163 = 0u;
                      id v65 = [v64 countByEnumeratingWithState:&v160 objects:v159 count:16];
                      if (v65)
                      {
                        id v66 = v65;
                        uint64_t v67 = *(void *)v161;
                        do
                        {
                          for (j = 0; j != v66; j = (char *)j + 1)
                          {
                            if (*(void *)v161 != v67) {
                              objc_enumerationMutation(v64);
                            }
                            long long v69 = *(void **)(*((void *)&v160 + 1) + 8 * (void)j);
                            __int16 v70 = [v69 asset];

                            if (!v70)
                            {
                              uint64_t v71 = [v69 assetIdentifier];
                              [v63 addObject:v71];
                            }
                          }
                          id v66 = [v64 countByEnumeratingWithState:&v160 objects:v159 count:16];
                        }
                        while (v66);
                      }
                      if ([v63 count])
                      {
                        CFStringRef v72 = +[RMLog activationEngine];
                        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                        {
                          long long v75 = [v61 identifier];
                          long long v76 = [v61 serverToken];
                          v135 = [v63 allObjects];
                          long long v77 = [v135 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
                          long long v78 = [v77 componentsJoinedByString:@", "];

                          *(_DWORD *)buf = 138412802;
                          *(void *)&uint8_t buf[4] = v75;
                          __int16 v155 = 2112;
                          v156 = v76;
                          __int16 v157 = 2112;
                          v158 = v78;
                          _os_log_debug_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "Configuration (%@:%@) is missing assets: %@", buf, 0x20u);
                        }
                        uint64_t v73 = +[RMModelStatusReason missingAssetIdentifiers:v63 forConfiguration:v61];
                        [v137 addObject:v73];
                      }
                    }
                    else
                    {
                      CFStringRef v74 = [v60 configurationIdentifier];
                      [v136 addObject:v74];
                    }
                  }
                  id v141 = [v138 countByEnumeratingWithState:&v165 objects:v164 count:16];
                }
                while (v141);
              }

              unsigned __int8 v27 = v124;
              if ([v136 count])
              {
                long long v79 = +[RMLog activationEngine];
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
                {
                  v93 = [v133 identifier];
                  v94 = [v133 serverToken];
                  v95 = [v136 allObjects];
                  v96 = [v95 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
                  v97 = [v96 componentsJoinedByString:@", "];

                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v93;
                  __int16 v155 = 2112;
                  v156 = v94;
                  __int16 v157 = 2112;
                  v158 = v97;
                  _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "Activation (%@:%@) is missing configurations: %@", buf, 0x20u);
                }
                long long v80 = +[RMModelStatusReason missingConfigurationIdentifiers:v136 forActivation:v133];
                [v137 addObject:v80];
              }
              if (![v137 count])
              {
                long long v81 = [v133 configurationReferences];
                long long v82 = [v81 valueForKey:@"configuration"];

                [v127 unionSet:v82];
              }
              id v83 = v133;
              id v84 = v137;
              id v85 = [v83 state];
              if (!v85)
              {
                CFStringRef v86 = [RMActivationPayloadState alloc];
                v87 = [v83 managedObjectContext];
                id v85 = [(RMActivationPayloadState *)v86 initWithContext:v87];

                [(RMActivationPayloadState *)v85 setActivation:v83];
              }
              [(RMActivationPayloadState *)v85 setInactiveReasons:v84];
              if (([(RMActivationPayloadState *)v85 isInserted] & 1) != 0
                || [(RMActivationPayloadState *)v85 hasChanges])
              {
                v88 = +[RMLog activationEngine];
                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
                {
                  CFStringRef v89 = [v83 description];
                  unsigned int v90 = [(RMActivationPayloadState *)v85 active];
                  *(_DWORD *)v164 = 138412546;
                  v91 = @"active";
                  if (!v90) {
                    v91 = @"inactive";
                  }
                  *(void *)&v164[4] = v89;
                  *(_WORD *)&v164[12] = 2112;
                  *(void *)&v164[14] = v91;
                  CFStringRef v92 = v91;
                  _os_log_debug_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEBUG, "%@ state changed to %@", v164, 0x16u);
                }
              }

              uint64_t v45 = v134 + 1;
            }
            while ((id)(v134 + 1) != v126);
            id v98 = [obj countByEnumeratingWithState:&v146 objects:v153 count:16];
            id v126 = v98;
          }
          while (v98);
        }

        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        id v99 = v27;
        id v100 = [v99 countByEnumeratingWithState:&v142 objects:v152 count:16];
        if (v100)
        {
          id v101 = v100;
          uint64_t v102 = *(void *)v143;
          do
          {
            v103 = 0;
            do
            {
              if (*(void *)v143 != v102) {
                objc_enumerationMutation(v99);
              }
              v104 = *(void **)(*((void *)&v142 + 1) + 8 * (void)v103);
              id v105 = [v127 containsObject:v104];
              id v106 = v104;
              v107 = [v106 state];
              if (!v107)
              {
                v108 = [RMConfigurationPayloadState alloc];
                v109 = [v106 managedObjectContext];
                v107 = [(RMConfigurationPayloadState *)v108 initWithContext:v109];

                [(RMConfigurationPayloadState *)v107 setConfiguration:v106];
              }
              if (v105 != [(RMConfigurationPayloadState *)v107 active]) {
                [(RMConfigurationPayloadState *)v107 setActive:v105];
              }
              if (([(RMConfigurationPayloadState *)v107 isInserted] & 1) != 0
                || [(RMConfigurationPayloadState *)v107 hasChanges])
              {
                v110 = +[RMLog activationEngine];
                if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v111 = [v106 description];
                  v112 = (void *)v111;
                  *(_DWORD *)v164 = 138412546;
                  v113 = @"active";
                  if (!v105) {
                    v113 = @"inactive";
                  }
                  *(void *)&v164[4] = v111;
                  *(_WORD *)&v164[12] = 2112;
                  *(void *)&v164[14] = v113;
                  v114 = v113;
                  _os_log_debug_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEBUG, "%@ state changed to %@", v164, 0x16u);
                }
              }

              v103 = (char *)v103 + 1;
            }
            while (v101 != v103);
            id v115 = [v99 countByEnumeratingWithState:&v142 objects:v152 count:16];
            id v101 = v115;
          }
          while (v115);
        }

        id v36 = v118;
        long long v20 = v119;
        unsigned __int8 v27 = v124;
        LOBYTE(v6) = 1;
        id v37 = v117;
      }
    }
  }
  else
  {
    v43 = v19;
    uint64_t v44 = +[RMLog activationEngine];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
      sub_10000B188();
    }

    LOBYTE(v6) = 0;
    id v36 = v43;
  }

LABEL_100:
  return (char)v6;
}

- (id)_checkPredicateStatusKeysForActivations:(id)a3 managementSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v38 objects:buf count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v38 + 1) + 8 * i) predicateDescription];
        uint64_t v16 = [v15 statusKeyPaths];
        [v9 addObjectsFromArray:v16];
      }
      id v12 = [v10 countByEnumeratingWithState:&v38 objects:buf count:16];
    }
    while (v12);
  }

  id v17 = [v9 allObjects];
  uint64_t v18 = [v17 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
  id v19 = [(id)v18 componentsJoinedByString:@","];

  long long v20 = [v7 predicateStatusKeys];
  LOBYTE(v18) = [v20 isEqualToString:v19];

  if (v18) {
    goto LABEL_19;
  }
  id v21 = +[RMLog activationEngine];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Activation predicate status key values have changed", buf, 2u);
  }

  id v22 = [v7 predicateStatusKeys];
  unsigned int v23 = [v22 componentsSeparatedByString:@","];
  BOOL v24 = +[NSSet setWithArray:v23];

  id v25 = [v9 mutableCopy];
  [v25 minusSet:v24];
  [v7 setPredicateStatusKeys:v19];
  uint64_t v26 = [(RMActivationEngine *)self context];
  id v37 = 0;
  unsigned int v27 = [v26 save:&v37];
  id v28 = v37;

  id v29 = +[RMLog activationEngine];
  unsigned int v30 = v29;
  if (v27)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10000B288();
    }

    id v31 = +[RMExternalStatusPublisher sharedPublisher];
    [v31 listenToNotificationsForAllKeyPaths];

    if ([v25 count])
    {
      id v32 = +[RMLog activationEngine];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        sub_10000B214();
      }

      id v33 = +[RMExternalStatusPublisher sharedPublisher];
      long long v34 = [v7 identifier];
      [v33 publishStatusKeys:v25 storeIdentifier:v34];
    }
LABEL_19:
    id v35 = v9;
    goto LABEL_23;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
    sub_10000B2BC();
  }

  id v35 = 0;
LABEL_23:

  return v35;
}

- (BOOL)_removeKeychainAssets:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assets];
  id v6 = [v5 allObjects];
  id v7 = [v4 identifier];
  id v8 = [v4 personaIdentifier];

  [(RMActivationEngine *)self _assetsRemoved:v6 managementSourceIdentifier:v7 personaID:v8];
  return 1;
}

+ (BOOL)_isKeychainAsset:(id)a3
{
  uint64_t v3 = qword_1000DAFA8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1000DAFA8, &stru_1000C4E28);
  }
  id v5 = (void *)qword_1000DAFA0;
  id v6 = [v4 declarationType];

  unsigned __int8 v7 = [v5 containsObject:v6];
  return v7;
}

- (BOOL)_assetsRemoved:(id)a3 managementSourceIdentifier:(id)a4 personaID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (+[RMActivationEngine _isKeychainAsset:v16])
        {
          [(RMActivationEngine *)self _keychainAssetRemoved:v16 managementSourceIdentifier:v9 personaID:v10];
          char v13 = 1;
        }
      }
      id v12 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

- (void)_keychainAssetRemoved:(id)a3 managementSourceIdentifier:(id)a4 personaID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[RMLog activationEngine];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v7 identifier];
    id v12 = [v7 serverToken];
    int v16 = 138543618;
    id v17 = v11;
    __int16 v18 = 2114;
    long long v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Removing asset keychain item: %{public}@:%{public}@", (uint8_t *)&v16, 0x16u);
  }
  char v13 = [v7 identifier];
  uint64_t v14 = [v7 serverToken];
  id v15 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:&stru_1000C74D0 storeIdentifier:v9 declarationIdentifier:v13 declarationServerToken:v14];

  +[RMStoreAssetResolver removedAsset:v15 personaID:v8 error:0];
}

- (NSManagedObjectID)managementSourceObjectID
{
  return self->_managementSourceObjectID;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (RMDebounceTimer)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_managementSourceObjectID, 0);
}

@end