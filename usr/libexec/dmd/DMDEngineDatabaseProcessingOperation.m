@interface DMDEngineDatabaseProcessingOperation
- (BOOL)preprocessDatabaseInContext:(id)a3 forOrganization:(id)a4 error:(id *)a5;
- (BOOL)updateActiveRestrictionsInContext:(id)a3 error:(id *)a4;
- (DMDActivationPredicateObserverManager)activationPredicateObserverManager;
- (DMDDeviceStateProvider)deviceStateProvider;
- (DMDEngineDatabaseProcessingOperationDelegate)delegate;
- (DMDTaskOperationProvider)taskOperationProvider;
- (id)processCommandPayloadsInContext:(id)a3 forOrganization:(id)a4 enqueuedOperations:(id)a5 assetResolver:(id)a6 error:(id *)a7;
- (id)processDeclarationPayloadsInContext:(id)a3 forOrganization:(id)a4 enqueuedOperations:(id)a5 assetResolver:(id)a6 error:(id *)a7;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setActivationPredicateObserverManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceStateProvider:(id)a3;
- (void)setTaskOperationProvider:(id)a3;
@end

@implementation DMDEngineDatabaseProcessingOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = +[DMDConfigurationOrganization fetchRequest];
  id v52 = 0;
  v7 = [v6 execute:&v52];
  id v8 = v52;
  if (!v7)
  {
    v35 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1000842EC();
    }
    goto LABEL_36;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v7;
  id v41 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v49;
    *(void *)&long long v9 = 138412290;
    long long v37 = v9;
    id v43 = v4;
    v38 = v7;
    v39 = v6;
    while (2)
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        v11 = v5;
        if (*(void *)v49 != v42) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if ((objc_msgSend(v12, "active", v37) & 1) != 0
          || ([v12 payloadMetadatas],
              v13 = objc_claimAutoreleasedReturnValue(),
              id v14 = [v13 count],
              v13,
              v14))
        {
          id v47 = v8;
          unsigned __int8 v15 = [(DMDEngineDatabaseProcessingOperation *)self preprocessDatabaseInContext:v4 forOrganization:v12 error:&v47];
          id v16 = v47;

          if ((v15 & 1) == 0)
          {
            v36 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              sub_1000843FC();
            }

            [(DMDEngineDatabaseProcessingOperation *)self setError:v16];
            goto LABEL_33;
          }
          v17 = [(DMDEngineDatabaseProcessingOperation *)self delegate];
          char v18 = objc_opt_respondsToSelector();

          if (v18)
          {
            v19 = [(DMDEngineDatabaseProcessingOperation *)self delegate];
            v20 = [v12 identifier];
            v21 = [v19 engineProcessingOperation:self enqueuedOperationsForOrganizationWithIdentifier:v20];
            v22 = +[NSMutableArray arrayWithArray:v21];

            id v4 = v43;
          }
          else
          {
            v22 = 0;
          }
          v23 = [(DMDEngineDatabaseProcessingOperation *)self delegate];
          char v24 = objc_opt_respondsToSelector();

          if (v24)
          {
            v25 = [(DMDEngineDatabaseProcessingOperation *)self delegate];
            v26 = [v12 identifier];
            v27 = [v25 engineProcessingOperation:self assetResolverForOrganizationWithIdentifier:v26];
          }
          else
          {
            v27 = 0;
          }
          id v46 = v16;
          v28 = [(DMDEngineDatabaseProcessingOperation *)self processCommandPayloadsInContext:v4 forOrganization:v12 enqueuedOperations:v22 assetResolver:v27 error:&v46];
          id v29 = v4;
          id v30 = v46;

          if (!v28) {
            goto LABEL_32;
          }
          v5 = v11;
          [v11 addObjectsFromArray:v28];
          id v45 = v30;
          v31 = [(DMDEngineDatabaseProcessingOperation *)self processDeclarationPayloadsInContext:v29 forOrganization:v12 enqueuedOperations:v22 assetResolver:v27 error:&v45];
          id v8 = v45;

          if (!v31)
          {
            id v30 = v8;
LABEL_32:
            [(DMDEngineDatabaseProcessingOperation *)self setError:v30];

            id v16 = v30;
            id v4 = v43;
LABEL_33:
            v7 = v38;
            v6 = v39;

            id v8 = v16;
            v5 = v11;
            goto LABEL_37;
          }
          [v11 addObjectsFromArray:v31];

          id v4 = v43;
        }
        else
        {
          v32 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v37;
            v54 = v12;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Deleting deactivated organization %@", buf, 0xCu);
          }

          [v4 deleteObject:v12];
          v5 = v11;
        }
      }
      v7 = v38;
      v6 = v39;
      id v41 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
      if (v41) {
        continue;
      }
      break;
    }
  }
  v33 = v8;

  id v44 = v8;
  unsigned int v34 = [v4 save:&v44];
  id v8 = v44;

  if (!v34)
  {
    v35 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_100084378(v8);
    }
LABEL_36:

    [(DMDEngineDatabaseProcessingOperation *)self setError:v8];
    goto LABEL_37;
  }
  [(DMDEngineDatabaseProcessingOperation *)self setResultObject:v5];
LABEL_37:
}

- (BOOL)preprocessDatabaseInContext:(id)a3 forOrganization:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v52 = a4;
  id v8 = [v52 identifier];
  uint64_t v9 = +[DMDDeclarationPayloadMetadata fetchRequestForDeclarationsFromOrganizationWithIdentifier:v8];

  id v64 = 0;
  v53 = v7;
  uint64_t v42 = (void *)v9;
  v10 = [v7 executeFetchRequest:v9 error:&v64];
  id v11 = v64;
  id v41 = v10;
  if (v10)
  {
    long long v63 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v60 = 0u;
    id obj = v10;
    id v12 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v61;
      uint64_t v43 = *(void *)v61;
      do
      {
        unsigned __int8 v15 = 0;
        id v44 = v13;
        do
        {
          if (*(void *)v61 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v49 = v17;
            long long v48 = [v16 payload];
            char v18 = [v48 payloadDictionary];
            id v59 = v11;
            v19 = +[CEMConfigurationBase declarationForPayload:v18 error:&v59];
            id v20 = v59;

            id v47 = v19;
            if (v19)
            {
              os_log_t log = [v16 mutableSetValueForKey:@"outgoingPayloadMetadataReferences"];
              [log removeAllObjects];
              v21 = [v19 assetReferences];
              long long v55 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              id v50 = v21;
              id v22 = [v50 countByEnumeratingWithState:&v55 objects:v66 count:16];
              if (v22)
              {
                id v23 = v22;
                uint64_t v24 = *(void *)v56;
                id v46 = v15;
                while (2)
                {
                  v25 = 0;
                  v26 = v20;
                  do
                  {
                    if (*(void *)v56 != v24) {
                      objc_enumerationMutation(v50);
                    }
                    v27 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v25);
                    v28 = [v52 identifier:v41];
                    id v29 = [v27 identifier];
                    v65 = v29;
                    id v30 = +[NSArray arrayWithObjects:&v65 count:1];
                    v31 = +[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:v28 withIdentifiers:v30];

                    id v54 = v26;
                    v32 = [v53 executeFetchRequest:v31 error:&v54];
                    id v20 = v54;

                    if (!v32)
                    {
                      unsigned int v34 = DMFConfigurationEngineLog();
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                      {
                        v35 = [v27 identifier];
                        v36 = [v20 verboseDescription];
                        *(_DWORD *)buf = 138543618;
                        v68 = v35;
                        __int16 v69 = 2114;
                        v70 = v36;
                        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to fetch asset with identifier (%{public}@): %{public}@", buf, 0x16u);
                      }
                      unsigned __int8 v15 = v46;
                      goto LABEL_23;
                    }
                    v33 = [v32 firstObject];
                    if (v33) {
                      [log addObject:v33];
                    }

                    v25 = (char *)v25 + 1;
                    v26 = v20;
                  }
                  while (v23 != v25);
                  id v23 = [v50 countByEnumeratingWithState:&v55 objects:v66 count:16];
                  unsigned __int8 v15 = v46;
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }
LABEL_23:

              uint64_t v14 = v43;
              id v13 = v44;
            }
            else
            {
              DMFConfigurationEngineLog();
              os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                long long v37 = [v16 identifier];
                v38 = [v20 verboseDescription];
                *(_DWORD *)buf = 138543618;
                v68 = v37;
                __int16 v69 = 2114;
                v70 = v38;
                _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to deserialize configuration engine model: %{public}@", buf, 0x16u);
              }
            }
            v17 = v49;

            id v11 = v20;
          }
          unsigned __int8 v15 = (char *)v15 + 1;
        }
        while (v15 != v13);
        id v13 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
      }
      while (v13);
    }
  }
  else
  {
    v39 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100084488(v11);
    }

    if (a5)
    {
      id v11 = v11;
      *a5 = v11;
    }
  }

  return v41 != 0;
}

- (BOOL)updateActiveRestrictionsInContext:(id)a3 error:(id *)a4
{
  id v4 = +[DMDConfigurationPayloadMetadata fetchRequest];
  v5 = +[NSPredicate predicateWithFormat:@"%K = %@", @"installed", &__kCFBooleanTrue];
  v55[0] = v5;
  v6 = +[NSPredicate predicateWithFormat:@"%K = %@", @"failed", &__kCFBooleanFalse];
  v55[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v55 count:2];
  id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];

  uint64_t v9 = +[NSPredicate predicateWithFormat:@"%K = %@", @"installed", &__kCFBooleanFalse];
  v54[0] = v9;
  v10 = +[NSPredicate predicateWithFormat:@"%K = %@", @"failed", &__kCFBooleanFalse];
  v54[1] = v10;
  id v11 = +[NSPredicate predicateWithFormat:@"SUBQUERY(incomingPayloadMetadataReferences, $ref, ($ref.available == YES) && ($ref.predicatePayloadMetadata.%K.BOOLValue == YES)).@count > 0", DMFDeclarationStatePredicateLastEvaluationValueKey];
  v54[2] = v11;
  id v12 = +[NSArray arrayWithObjects:v54 count:3];
  id v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

  v53[0] = v8;
  v53[1] = v13;
  uint64_t v14 = +[NSArray arrayWithObjects:v53 count:2];
  unsigned __int8 v15 = +[NSCompoundPredicate orPredicateWithSubpredicates:v14];
  [v4 setPredicate:v15];

  id v49 = 0;
  uint64_t v42 = v4;
  id v16 = [v4 execute:&v49];
  id v17 = v49;
  id v18 = v17;
  if (v16)
  {
    long long v37 = v17;
    v39 = v13;
    v40 = v8;
    uint64_t v43 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v16 count]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v38 = v16;
    id v19 = v16;
    id v20 = [v19 countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v46;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v46 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v25 = [v24 type];
          v26 = [v25 substringFromIndex:24];
          v27 = [v24 identifier];
          v28 = +[NSString stringWithFormat:@"%@.%@-restrictions", v26, v27];

          [v43 addObject:v28];
        }
        id v21 = [v19 countByEnumeratingWithState:&v45 objects:v52 count:16];
      }
      while (v21);
    }

    id v29 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v51 = v43;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Active restrictions: %@", buf, 0xCu);
    }

    id v30 = +[DMFConfigurationSourceClient activeRestrictionsURL];
    id v13 = v39;
    id v8 = v40;
    if (v30)
    {
      v31 = +[NSPropertyListSerialization dataWithPropertyList:v43 format:200 options:0 error:0];
      id v44 = v37;
      unsigned __int8 v32 = [v31 writeToURL:v30 options:1 error:&v44];
      id v18 = v44;

      if (v32)
      {
        id v16 = v38;
        if (([v30 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:0] & 1) == 0)
        {
          v33 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_10008461C();
          }
        }
      }
      else
      {
        v35 = DMFConfigurationEngineLog();
        id v16 = v38;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_10008461C();
        }

        if (a4)
        {
          id v18 = v18;
          *a4 = v18;
        }
      }
    }
    else
    {
      v31 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1000845A8();
      }
      unsigned __int8 v32 = 0;
      id v18 = v37;
      id v16 = v38;
    }
  }
  else
  {
    unsigned int v34 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      sub_10008450C();
    }

    if (a4)
    {
      id v18 = v18;
      unsigned __int8 v32 = 0;
      *a4 = v18;
    }
    else
    {
      unsigned __int8 v32 = 0;
    }
  }

  return v32;
}

- (id)processCommandPayloadsInContext:(id)a3 forOrganization:(id)a4 enqueuedOperations:(id)a5 assetResolver:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v120 = a7;
  if (!a7)
  {
    v114 = +[NSAssertionHandler currentHandler];
    [v114 handleFailureInMethod:a2, self, @"DMDEngineDatabaseProcessingOperation.m", 222, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  v125 = objc_opt_new();
  v126 = objc_opt_new();
  v127 = objc_opt_new();
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id obj = v15;
  id v17 = [obj countByEnumeratingWithState:&v156 objects:v171 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v157;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v157 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v156 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v22 = [v21 payloadMetadataObjectID];
          [v126 setObject:v21 forKeyedSubscript:v22];

          id v23 = [v21 payloadIdentifier];
          [v127 setObject:v21 forKeyedSubscript:v23];
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v156 objects:v171 count:16];
    }
    while (v18);
  }

  uint64_t v24 = [v14 identifier];
  v25 = +[DMDCommandPayloadMetadata fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier:v24];

  v26 = [v25 execute:v120];
  id v123 = v26;
  if (!v26)
  {
    long long v47 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_1000846A8((uint64_t)v120);
    }
    id v111 = 0;
    goto LABEL_108;
  }
  v116 = v25;
  id v117 = v16;
  v118 = v13;
  v119 = v14;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  id v27 = [v26 countByEnumeratingWithState:&v152 objects:v170 count:16];
  if (!v27) {
    goto LABEL_26;
  }
  id v28 = v27;
  uint64_t v29 = *(void *)v153;
  do
  {
    for (j = 0; j != v28; j = (char *)j + 1)
    {
      if (*(void *)v153 != v29) {
        objc_enumerationMutation(v123);
      }
      v31 = *(void **)(*((void *)&v152 + 1) + 8 * (void)j);
      unsigned __int8 v32 = [v31 identifier];
      v33 = [v127 objectForKeyedSubscript:v32];

      if (v33)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_24;
        }
        unsigned int v34 = DMFConfigurationEngineLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = [v31 identifier];
          v36 = (objc_class *)objc_opt_class();
          long long v37 = NSStringFromClass(v36);
          *(_DWORD *)buf = 138543618;
          v167 = v35;
          __int16 v168 = 2114;
          v169 = v37;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%{public}@: Cancelling enqueued %{public}@ so we can enqueue an execute command operation", buf, 0x16u);
        }
        [(DMDCommandExecuteOperation *)v33 cancel];
      }
      v38 = [DMDCommandExecuteOperation alloc];
      v39 = [(DMDEngineDatabaseOperation *)self database];
      v40 = [v31 objectID];
      id v41 = [v31 identifier];
      v33 = [(DMDPayloadActionOperation *)v38 initWithDatabase:v39 payloadMetadataObjectID:v40 payloadIdentifier:v41];

      -[DMDPayloadActionOperation setRequiresNetworkTether:](v33, "setRequiresNetworkTether:", [v31 requiresNetworkTether]);
      -[DMDPayloadActionOperation setRequiresUnlockedKeychain:](v33, "setRequiresUnlockedKeychain:", [v31 requiresUnlockedKeychain]);
      uint64_t v42 = [(DMDEngineDatabaseProcessingOperation *)self deviceStateProvider];
      [(DMDPayloadActionOperation *)v33 setDeviceStateProvider:v42];

      uint64_t v43 = [(DMDEngineDatabaseProcessingOperation *)self taskOperationProvider];
      [(DMDPayloadActionOperation *)v33 setTaskOperationProvider:v43];

      [v125 addObject:v33];
      id v44 = [v31 objectID];
      [v126 setObject:v33 forKeyedSubscript:v44];

      long long v45 = [v31 identifier];
      [v127 setObject:v33 forKeyedSubscript:v45];

LABEL_24:
    }
    id v28 = [v123 countByEnumeratingWithState:&v152 objects:v170 count:16];
  }
  while (v28);
LABEL_26:
  id v14 = v119;
  long long v46 = [v119 identifier];
  long long v47 = +[DMDCommandPayloadMetadata fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier:v46];

  long long v48 = [v47 execute:v120];
  v122 = v48;
  if (v48)
  {
    v115 = v47;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    id v49 = [v48 countByEnumeratingWithState:&v148 objects:v165 count:16];
    if (!v49) {
      goto LABEL_40;
    }
    id v50 = v49;
    uint64_t v51 = *(void *)v149;
    while (1)
    {
      for (k = 0; k != v50; k = (char *)k + 1)
      {
        if (*(void *)v149 != v51) {
          objc_enumerationMutation(v122);
        }
        v53 = *(void **)(*((void *)&v148 + 1) + 8 * (void)k);
        id v54 = [v53 identifier];
        long long v55 = [v127 objectForKeyedSubscript:v54];

        if (v55)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_38;
          }
          long long v56 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            long long v57 = [v53 identifier];
            long long v58 = (objc_class *)objc_opt_class();
            id v59 = NSStringFromClass(v58);
            *(_DWORD *)buf = 138543618;
            v167 = v57;
            __int16 v168 = 2114;
            v169 = v59;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%{public}@: Cancelling enqueued %{public}@ so we can enqueue an remove command operation", buf, 0x16u);
          }
          [(DMDCommandRemoveOperation *)v55 cancel];
        }
        long long v60 = [DMDCommandRemoveOperation alloc];
        long long v61 = [(DMDEngineDatabaseOperation *)self database];
        long long v62 = [v53 objectID];
        long long v63 = [v53 identifier];
        long long v55 = [(DMDPayloadActionOperation *)v60 initWithDatabase:v61 payloadMetadataObjectID:v62 payloadIdentifier:v63];

        -[DMDPayloadActionOperation setRequiresNetworkTether:](v55, "setRequiresNetworkTether:", [v53 requiresNetworkTether]);
        -[DMDPayloadActionOperation setRequiresUnlockedKeychain:](v55, "setRequiresUnlockedKeychain:", [v53 requiresUnlockedKeychain]);
        id v64 = [(DMDEngineDatabaseProcessingOperation *)self deviceStateProvider];
        [(DMDPayloadActionOperation *)v55 setDeviceStateProvider:v64];

        v65 = [(DMDEngineDatabaseProcessingOperation *)self taskOperationProvider];
        [(DMDPayloadActionOperation *)v55 setTaskOperationProvider:v65];

        [v125 addObject:v55];
        v66 = [v53 objectID];
        [v126 setObject:v55 forKeyedSubscript:v66];

        v67 = [v53 identifier];
        [v127 setObject:v55 forKeyedSubscript:v67];

LABEL_38:
      }
      id v50 = [v122 countByEnumeratingWithState:&v148 objects:v165 count:16];
      if (!v50)
      {
LABEL_40:
        id v14 = v119;
        v68 = [v119 identifier];
        __int16 v69 = +[DMDCommandPayloadMetadata fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier:v68];

        v70 = [v69 execute:v120];
        v71 = v70;
        if (v70)
        {
          long long v146 = 0u;
          long long v147 = 0u;
          long long v144 = 0u;
          long long v145 = 0u;
          id v72 = [v70 countByEnumeratingWithState:&v144 objects:v164 count:16];
          id v16 = v117;
          id v13 = v118;
          long long v47 = v115;
          v25 = v116;
          if (v72)
          {
            id v73 = v72;
            uint64_t v74 = *(void *)v145;
            do
            {
              for (m = 0; m != v73; m = (char *)m + 1)
              {
                if (*(void *)v145 != v74) {
                  objc_enumerationMutation(v71);
                }
                [v118 deleteObject:*(void *)(*((void *)&v144 + 1) + 8 * (void)m)];
              }
              id v73 = [v71 countByEnumeratingWithState:&v144 objects:v164 count:16];
            }
            while (v73);
          }
          v76 = DMFConfigurationEngineLog();
          BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG);

          if (v77)
          {
            v121 = v69;
            v78 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
              sub_100084904();
            }

            long long v142 = 0u;
            long long v143 = 0u;
            long long v140 = 0u;
            long long v141 = 0u;
            id v79 = v123;
            id v80 = [v79 countByEnumeratingWithState:&v140 objects:v163 count:16];
            if (v80)
            {
              id v81 = v80;
              uint64_t v82 = *(void *)v141;
              do
              {
                for (n = 0; n != v81; n = (char *)n + 1)
                {
                  if (*(void *)v141 != v82) {
                    objc_enumerationMutation(v79);
                  }
                  v84 = *(void **)(*((void *)&v140 + 1) + 8 * (void)n);
                  v85 = DMFConfigurationEngineLog();
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v167 = v84;
                    _os_log_debug_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }
                }
                id v81 = [v79 countByEnumeratingWithState:&v140 objects:v163 count:16];
              }
              while (v81);
            }

            v86 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG)) {
              sub_1000848D0();
            }

            long long v138 = 0u;
            long long v139 = 0u;
            long long v136 = 0u;
            long long v137 = 0u;
            id v87 = v122;
            id v88 = [v87 countByEnumeratingWithState:&v136 objects:v162 count:16];
            if (v88)
            {
              id v89 = v88;
              uint64_t v90 = *(void *)v137;
              do
              {
                for (ii = 0; ii != v89; ii = (char *)ii + 1)
                {
                  if (*(void *)v137 != v90) {
                    objc_enumerationMutation(v87);
                  }
                  v92 = *(void **)(*((void *)&v136 + 1) + 8 * (void)ii);
                  v93 = DMFConfigurationEngineLog();
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v167 = v92;
                    _os_log_debug_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }
                }
                id v89 = [v87 countByEnumeratingWithState:&v136 objects:v162 count:16];
              }
              while (v89);
            }

            v94 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG)) {
              sub_10008489C();
            }

            long long v134 = 0u;
            long long v135 = 0u;
            long long v132 = 0u;
            long long v133 = 0u;
            id v95 = v71;
            id v96 = [v95 countByEnumeratingWithState:&v132 objects:v161 count:16];
            if (v96)
            {
              id v97 = v96;
              uint64_t v98 = *(void *)v133;
              do
              {
                for (jj = 0; jj != v97; jj = (char *)jj + 1)
                {
                  if (*(void *)v133 != v98) {
                    objc_enumerationMutation(v95);
                  }
                  v100 = *(void **)(*((void *)&v132 + 1) + 8 * (void)jj);
                  v101 = DMFConfigurationEngineLog();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v167 = v100;
                    _os_log_debug_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }
                }
                id v97 = [v95 countByEnumeratingWithState:&v132 objects:v161 count:16];
              }
              while (v97);
            }

            v102 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG)) {
              sub_100084868();
            }

            long long v130 = 0u;
            long long v131 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            id v103 = v125;
            id v104 = [v103 countByEnumeratingWithState:&v128 objects:v160 count:16];
            id v13 = v118;
            if (v104)
            {
              id v105 = v104;
              uint64_t v106 = *(void *)v129;
              do
              {
                for (kk = 0; kk != v105; kk = (char *)kk + 1)
                {
                  if (*(void *)v129 != v106) {
                    objc_enumerationMutation(v103);
                  }
                  v108 = *(void **)(*((void *)&v128 + 1) + 8 * (void)kk);
                  v109 = DMFConfigurationEngineLog();
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v167 = v108;
                    _os_log_debug_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }
                }
                id v105 = [v103 countByEnumeratingWithState:&v128 objects:v160 count:16];
              }
              while (v105);
            }

            v110 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG)) {
              sub_100084834();
            }

            id v14 = v119;
            __int16 v69 = v121;
            v25 = v116;
            id v16 = v117;
            long long v47 = v115;
          }
          id v111 = v125;
        }
        else
        {
          v112 = DMFConfigurationEngineLog();
          id v16 = v117;
          id v13 = v118;
          long long v47 = v115;
          v25 = v116;
          if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
            sub_1000847B0((uint64_t)v120);
          }

          id v111 = 0;
        }

        goto LABEL_107;
      }
    }
  }
  __int16 v69 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
    sub_10008472C((uint64_t)v120);
  }
  id v111 = 0;
  id v16 = v117;
  id v13 = v118;
  v25 = v116;
LABEL_107:

LABEL_108:

  return v111;
}

- (id)processDeclarationPayloadsInContext:(id)a3 forOrganization:(id)a4 enqueuedOperations:(id)a5 assetResolver:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v235 = a5;
  id v249 = a6;
  if (!a7)
  {
    v227 = +[NSAssertionHandler currentHandler];
    [v227 handleFailureInMethod:a2, self, @"DMDEngineDatabaseProcessingOperation.m", 326, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  v241 = v13;
  id v14 = [v13 identifier];
  id v15 = +[DMDActivationPayloadMetadata fetchRequestForActivationsFromOrganizationWithIdentifier:v14];

  v234 = v15;
  id v16 = [v15 execute:a7];
  v233 = v16;
  if (!v16)
  {
    v251 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v251, OS_LOG_TYPE_ERROR)) {
      sub_100084938((uint64_t)a7);
    }
    v223 = 0;
    v224 = v13;
    goto LABEL_206;
  }
  v232 = v12;
  long long v305 = 0u;
  long long v306 = 0u;
  long long v303 = 0u;
  long long v304 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v303 objects:v337 count:16];
  v242 = a7;
  if (!v18) {
    goto LABEL_54;
  }
  id v19 = v18;
  id v20 = CATOperationQueue_ptr;
  uint64_t v260 = *(void *)v304;
  uint64_t v256 = DMFDeclarationStatePredicateLastEvaluationValueKey;
  id v250 = v17;
  do
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v304 != v260) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void **)(*((void *)&v303 + 1) + 8 * i);
      id v23 = v20[11];
      uint64_t v24 = [v22 payload];
      v25 = [v24 payloadDictionary];
      v26 = [v23 declarationForPayload:v25 error:a7];

      if (!v26)
      {
        unsigned __int8 v32 = DMFConfigurationEngineLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          long long v58 = [v22 identifier];
          id v59 = [*a7 verboseDescription];
          *(_DWORD *)buf = 138543618;
          v324 = v58;
          __int16 v325 = 2114;
          id v326 = v59;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to parse activation payload (%{public}@): %{public}@", buf, 0x16u);

          id v20 = CATOperationQueue_ptr;
        }

        v33 = [(DMDEngineDatabaseProcessingOperation *)self activationPredicateObserverManager];
        unsigned int v34 = [v22 uniqueIdentifier];
        [v33 removeActivationPredicateObserverWithUniqueIdentifier:v34];

        [v22 setFailed:1];
        uint64_t v335 = v256;
        v336 = &__kCFBooleanFalse;
        v35 = &v336;
        v36 = &v335;
        goto LABEL_28;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v22 available])
        {
          id v27 = [v241 identifier];
          id v28 = +[DMDConfigurationPayloadMetadata fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:v27];

          uint64_t v29 = [v28 execute:a7];
          if (v29)
          {
            uint64_t v333 = v256;
            v334 = &__kCFBooleanTrue;
            id v30 = +[NSDictionary dictionaryWithObjects:&v334 forKeys:&v333 count:1];
            [v22 setPredicatePayloadMetadata:v30];

            [v22 setInstalled:1];
            v31 = +[NSSet setWithArray:v29];
            [v22 setOutgoingPayloadMetadataReferences:v31];

            [v22 updateStateDictionaryIfNeeded];
          }
          else
          {
            long long v55 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              id v72 = [v241 identifier];
              id v73 = [*v242 verboseDescription];
              *(_DWORD *)buf = 138543618;
              v324 = v72;
              __int16 v325 = 2114;
              id v326 = v73;
              _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Failed to fetch available configurations for organization (%{public}@): %{public}@", buf, 0x16u);

              id v17 = v250;
              a7 = v242;
            }

            [v22 setFailed:1];
          }

LABEL_51:
          id v20 = CATOperationQueue_ptr;
          goto LABEL_52;
        }
        uint64_t v331 = v256;
        v332 = &__kCFBooleanFalse;
        v35 = &v332;
        v36 = &v331;
LABEL_28:
        id v54 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v36 count:1];
        [v22 setPredicatePayloadMetadata:v54];

        [v22 setInstalled:0];
        [v22 updateStateDictionaryIfNeeded];
        goto LABEL_52;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (![v22 available])
        {
          id v52 = [(DMDEngineDatabaseProcessingOperation *)self activationPredicateObserverManager];
          v53 = [v22 uniqueIdentifier];
          [v52 removeActivationPredicateObserverWithUniqueIdentifier:v53];

          uint64_t v319 = v256;
          v320 = &__kCFBooleanFalse;
          v35 = &v320;
          v36 = &v319;
          goto LABEL_28;
        }
        id v37 = v26;
        v38 = [v22 predicatePayloadMetadata];
        v39 = [v38 objectForKeyedSubscript:v256];
        unsigned int v40 = [v39 BOOLValue];

        id v41 = [v37 payloadPredicate];

        if (v41)
        {
          unsigned int obj = v40;
          uint64_t v42 = [(DMDEngineDatabaseProcessingOperation *)self activationPredicateObserverManager];
          uint64_t v43 = v37;
          id v44 = [v37 payloadPredicate];
          long long v45 = [v22 uniqueIdentifier];
          long long v46 = [v42 addActivationPredicateObserverForPredicate:v44 withUniqueIdentifier:v45];

          if (v46)
          {
            long long v47 = [v46 evaluatePredicateWithError:a7];
            long long v48 = v47;
            if (v47)
            {
              unsigned int obj = [v47 BOOLValue];
              id v49 = [v46 metadata];
              goto LABEL_42;
            }
            long long v62 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              v244 = [v22 uniqueIdentifier];
              uint64_t v74 = [v241 identifier];
              uint64_t v75 = [*v242 verboseDescription];
              *(_DWORD *)buf = 138544130;
              v324 = v244;
              __int16 v325 = 2114;
              id v326 = v74;
              __int16 v327 = 2114;
              uint64_t v328 = v75;
              v76 = (void *)v75;
              __int16 v329 = 1024;
              unsigned int v330 = obj;
              _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Failed to evaluate activation predicate with unique identifier %{public}@ for organization (%{public}@): %{public}@ using last predicate evaluation %d", buf, 0x26u);
            }
          }
          else
          {
            long long v48 = DMFConfigurationEngineLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              long long v60 = [v22 uniqueIdentifier];
              long long v61 = [v241 identifier];
              *(_DWORD *)buf = 138543874;
              v324 = v60;
              __int16 v325 = 2114;
              id v326 = v61;
              __int16 v327 = 1024;
              LODWORD(v328) = obj;
              _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to create activation predicate observer with unique identifier %{public}@ for organization (%{public}@) using last predicate evaluation %d", buf, 0x1Cu);
            }
          }
          id v49 = 0;
LABEL_42:
        }
        else
        {
          uint64_t v43 = v37;
          long long v46 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            long long v56 = [v22 uniqueIdentifier];
            long long v57 = [v241 identifier];
            *(_DWORD *)buf = 138543618;
            v324 = v56;
            __int16 v325 = 2114;
            id v326 = v57;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Activation predicate with unique identifier %{public}@ for organization (%{public}@) is nil", buf, 0x16u);
          }
          id v49 = 0;
          unsigned int obj = 1;
        }

        id v63 = objc_alloc((Class)NSMutableArray);
        id v64 = [v43 payloadStandardConfigurations];
        id v65 = [v63 initWithArray:v64];

        v66 = [v241 identifier];
        v67 = +[DMDConfigurationPayloadMetadata fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:v66 payloadIdentifiers:v65];

        v68 = [v67 execute:v242];
        if (v68)
        {
          if (!v49)
          {
            uint64_t v321 = v256;
            __int16 v69 = +[NSNumber numberWithBool:obj];
            v322 = v69;
            id v49 = +[NSDictionary dictionaryWithObjects:&v322 forKeys:&v321 count:1];
          }
          [v22 setPredicatePayloadMetadata:v49];
          [v22 setInstalled:1];
          v70 = +[NSSet setWithArray:v68];
          [v22 setOutgoingPayloadMetadataReferences:v70];

          [v22 updateStateDictionaryIfNeeded];
        }
        else
        {
          v71 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            objc = [v241 identifier];
            v243 = [*v242 verboseDescription];
            *(_DWORD *)buf = 138543618;
            v324 = objc;
            __int16 v325 = 2114;
            id v326 = v243;
            _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Failed to fetch available configurations for organization (%{public}@): %{public}@", buf, 0x16u);
          }
          [v22 setFailed:1];
        }

        a7 = v242;
        id v17 = v250;
        goto LABEL_51;
      }
      id v50 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v51 = [v22 type];
        *(_DWORD *)buf = 138543362;
        v324 = v51;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Unknown activation type: %{public}@", buf, 0xCu);
      }
LABEL_52:
    }
    id v19 = [v17 countByEnumeratingWithState:&v303 objects:v337 count:16];
  }
  while (v19);
LABEL_54:

  id v12 = v232;
  if ([(DMDEngineDatabaseProcessingOperation *)self updateActiveRestrictionsInContext:v232 error:a7])
  {
    v251 = objc_opt_new();
    v257 = objc_opt_new();
    v245 = objc_opt_new();
    long long v299 = 0u;
    long long v300 = 0u;
    long long v301 = 0u;
    long long v302 = 0u;
    id obja = v235;
    id v77 = [obja countByEnumeratingWithState:&v299 objects:v318 count:16];
    if (v77)
    {
      id v78 = v77;
      uint64_t v79 = *(void *)v300;
      do
      {
        for (j = 0; j != v78; j = (char *)j + 1)
        {
          if (*(void *)v300 != v79) {
            objc_enumerationMutation(obja);
          }
          id v81 = *(void **)(*((void *)&v299 + 1) + 8 * (void)j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v82 = [v81 payloadMetadataObjectID];
            [v257 setObject:v81 forKeyedSubscript:v82];

            v83 = [v81 payloadIdentifier];
            [v245 setObject:v81 forKeyedSubscript:v83];
          }
        }
        id v78 = [obja countByEnumeratingWithState:&v299 objects:v318 count:16];
      }
      while (v78);
    }

    v84 = [v241 identifier];
    v85 = +[DMDConfigurationPayloadMetadata fetchRequestForConfigurationsPendingRemoveFromOrganizationWithIdentifier:v84];

    v86 = [v85 execute:a7];
    id v87 = [v86 mutableCopy];

    if (v87)
    {
      v228 = v85;
      v229 = v87;
      long long v297 = 0u;
      long long v298 = 0u;
      long long v295 = 0u;
      long long v296 = 0u;
      id v261 = [v87 copy];
      id v88 = [v261 countByEnumeratingWithState:&v295 objects:v317 count:16];
      if (v88)
      {
        id v89 = v88;
        uint64_t v90 = *(void *)v296;
        p_superclass = &OBJC_METACLASS___DMDiphoneOSAppLifeCycle.superclass;
        uint64_t v246 = *(void *)v296;
        do
        {
          v92 = 0;
          id v247 = v89;
          do
          {
            if (*(void *)v296 != v90) {
              objc_enumerationMutation(v261);
            }
            v93 = *(void **)(*((void *)&v295 + 1) + 8 * (void)v92);
            v94 = [v93 identifier];
            id v95 = [v245 objectForKeyedSubscript:v94];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v96 = DMFConfigurationEngineLog();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
              {
                id v97 = [v93 identifier];
                *(_DWORD *)buf = 138543362;
                v324 = v97;
                _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "Remove %{public}@: Declaration remove operation already enqueued, skipping", buf, 0xCu);
              }
            }
            else
            {
              if (v95)
              {
                uint64_t v98 = DMFConfigurationEngineLog();
                if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
                {
                  v99 = [v93 identifier];
                  v100 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v100);
                  id v101 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v324 = v99;
                  __int16 v325 = 2114;
                  id v326 = v101;
                  _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "Remove %{public}@: Cancelling enqueued %{public}@ so we can enqueue a remove operation", buf, 0x16u);
                }
                [v95 cancel];
              }
              v102 = p_superclass;
              id v103 = objc_alloc((Class)(p_superclass + 249));
              id v104 = [(DMDEngineDatabaseOperation *)self database];
              id v105 = [v93 objectID];
              uint64_t v106 = [v93 identifier];
              id v96 = [v103 initWithDatabase:v104 payloadMetadataObjectID:v105 payloadIdentifier:v106];

              v107 = [v93 identifier];
              [v96 setName:v107];

              -[NSObject setRequiresNetworkTether:](v96, "setRequiresNetworkTether:", [v93 requiresNetworkTether]);
              -[NSObject setRequiresUnlockedKeychain:](v96, "setRequiresUnlockedKeychain:", [v93 requiresUnlockedKeychain]);
              v108 = [(DMDEngineDatabaseProcessingOperation *)self deviceStateProvider];
              [v96 setDeviceStateProvider:v108];

              v109 = [(DMDEngineDatabaseProcessingOperation *)self taskOperationProvider];
              [v96 setTaskOperationProvider:v109];

              [v251 addObject:v96];
              v110 = [v93 objectID];
              [v257 setObject:v96 forKeyedSubscript:v110];

              id v111 = DMFConfigurationEngineLog();
              if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v324 = v96;
                _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "Enqueued remove operation: %{public}@", buf, 0xCu);
              }

              p_superclass = v102;
              uint64_t v90 = v246;
              id v89 = v247;
            }

            v92 = (char *)v92 + 1;
          }
          while (v89 != v92);
          id v89 = [v261 countByEnumeratingWithState:&v295 objects:v317 count:16];
        }
        while (v89);
      }

      v112 = [v241 identifier];
      v113 = +[DMDConfigurationPayloadMetadata fetchRequestForConfigurationsPendingInstallFromOrganizationWithIdentifier:v112];

      v231 = v113;
      uint64_t v114 = (uint64_t)v242;
      v115 = [v113 execute:v242];
      id v116 = [v115 mutableCopy];

      v230 = v116;
      if (v116)
      {
        long long v293 = 0u;
        long long v294 = 0u;
        long long v291 = 0u;
        long long v292 = 0u;
        id v238 = [v116 copy];
        id v117 = [v238 countByEnumeratingWithState:&v291 objects:v316 count:16];
        v118 = v257;
        if (v117)
        {
          id v119 = v117;
          uint64_t v120 = *(void *)v292;
          v121 = &OBJC_METACLASS___DMDiphoneOSAppLifeCycle.superclass;
          uint64_t v236 = *(void *)v292;
          do
          {
            v122 = 0;
            id v237 = v119;
            do
            {
              if (*(void *)v292 != v120) {
                objc_enumerationMutation(v238);
              }
              id v123 = *(void **)(*((void *)&v291 + 1) + 8 * (void)v122);
              v124 = [v123 identifier];
              v125 = [v245 objectForKeyedSubscript:v124];

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v125)
                {
                  long long v128 = DMFConfigurationEngineLog();
                  if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
                  {
                    long long v129 = [v123 identifier];
                    long long v130 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v130);
                    id v131 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v324 = v129;
                    __int16 v325 = 2114;
                    id v326 = v131;
                    _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_INFO, "Install %{public}@: Cancelling enqueued %{public}@ so we can enqueue an install operation", buf, 0x16u);
                  }
                  [v125 cancel];
                }
                v239 = v125;
                v240 = v122;
                id v132 = objc_alloc((Class)(v121 + 209));
                long long v133 = [(DMDEngineDatabaseOperation *)self database];
                long long v134 = [v123 objectID];
                long long v135 = [v123 identifier];
                long long v136 = [v132 initWithDatabase:v133 payloadMetadataObjectID:v134 payloadIdentifier:v135];

                long long v137 = [v123 identifier];
                [v136 setName:v137];

                -[NSObject setRequiresNetworkTether:](v136, "setRequiresNetworkTether:", [v123 requiresNetworkTether]);
                -[NSObject setRequiresUnlockedKeychain:](v136, "setRequiresUnlockedKeychain:", [v123 requiresUnlockedKeychain]);
                long long v138 = [(DMDEngineDatabaseProcessingOperation *)self deviceStateProvider];
                [v136 setDeviceStateProvider:v138];

                long long v139 = [(DMDEngineDatabaseProcessingOperation *)self taskOperationProvider];
                [v136 setTaskOperationProvider:v139];

                [v251 addObject:v136];
                long long v140 = [v123 objectID];
                [v118 setObject:v136 forKeyedSubscript:v140];

                [obja addObject:v136];
                long long v141 = DMFConfigurationEngineLog();
                if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  v324 = v136;
                  _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_INFO, "Enqueued configuration install operation: %{public}@", buf, 0xCu);
                }

                long long v289 = 0u;
                long long v290 = 0u;
                long long v287 = 0u;
                long long v288 = 0u;
                long long v142 = [v123 outgoingPayloadMetadataReferences];
                id v143 = [v142 countByEnumeratingWithState:&v287 objects:v315 count:16];
                v262 = v136;
                if (!v143)
                {
LABEL_118:

                  uint64_t v120 = v236;
                  id v119 = v237;
                  v121 = (__objc2_class **)(&OBJC_METACLASS___DMDiphoneOSAppLifeCycle + 8);
                  v122 = v240;
                  v125 = v239;
                  goto LABEL_119;
                }
                id v144 = v143;
                uint64_t v145 = *(void *)v288;
                while (2)
                {
                  uint64_t v146 = 0;
LABEL_100:
                  if (*(void *)v288 != v145) {
                    objc_enumerationMutation(v142);
                  }
                  long long v147 = *(void **)(*((void *)&v287 + 1) + 8 * v146);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v147 installed] & 1) == 0)
                  {
                    long long v148 = [v147 objectID];
                    long long v149 = [v118 objectForKeyedSubscript:v148];

                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      if (!v149) {
                        goto LABEL_110;
                      }
                    }
                    else
                    {
                      long long v150 = DMFConfigurationEngineLog();
                      if (os_log_type_enabled(v150, OS_LOG_TYPE_INFO))
                      {
                        long long v151 = [v147 identifier];
                        long long v152 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v152);
                        id v153 = (id)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543618;
                        v324 = v151;
                        __int16 v325 = 2114;
                        id v326 = v153;
                        _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_INFO, "Install %{public}@: Cancelling enqueued %{public}@ so we can enqueue an asset install operation", buf, 0x16u);
                      }
                      [(DMDAssetInstallOperation *)v149 cancel];

LABEL_110:
                      long long v154 = [DMDAssetInstallOperation alloc];
                      long long v155 = [(DMDEngineDatabaseOperation *)self database];
                      long long v156 = [v147 objectID];
                      long long v157 = [v147 identifier];
                      long long v158 = [(DMDPayloadActionOperation *)v154 initWithDatabase:v155 payloadMetadataObjectID:v156 payloadIdentifier:v157];

                      long long v159 = [v147 identifier];
                      [(DMDAssetInstallOperation *)v158 setName:v159];

                      -[DMDPayloadActionOperation setRequiresNetworkTether:](v158, "setRequiresNetworkTether:", [v147 requiresNetworkTether]);
                      -[DMDPayloadActionOperation setRequiresUnlockedKeychain:](v158, "setRequiresUnlockedKeychain:", [v147 requiresUnlockedKeychain]);
                      v160 = [(DMDEngineDatabaseProcessingOperation *)self deviceStateProvider];
                      [(DMDPayloadActionOperation *)v158 setDeviceStateProvider:v160];

                      v118 = v257;
                      v161 = [(DMDEngineDatabaseProcessingOperation *)self taskOperationProvider];
                      [(DMDPayloadActionOperation *)v158 setTaskOperationProvider:v161];

                      [(DMDAssetInstallOperation *)v158 setAssetResolver:v249];
                      [v251 addObject:v158];
                      v162 = [v147 objectID];
                      [v257 setObject:v158 forKeyedSubscript:v162];

                      [obja addObject:v158];
                      long long v149 = v158;
                      v163 = DMFConfigurationEngineLog();
                      if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543362;
                        v324 = v149;
                        _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_INFO, "Enqueued asset install operation: %{public}@", buf, 0xCu);
                      }
                    }
                    v164 = [v262 dependencies];
                    unsigned __int8 v165 = [v164 containsObject:v149];

                    if ((v165 & 1) == 0) {
                      [v262 addDependency:v149];
                    }
                  }
                  if (v144 == (id)++v146)
                  {
                    id v144 = [v142 countByEnumeratingWithState:&v287 objects:v315 count:16];
                    if (!v144) {
                      goto LABEL_118;
                    }
                    continue;
                  }
                  goto LABEL_100;
                }
              }
              v126 = DMFConfigurationEngineLog();
              v262 = v126;
              if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
              {
                v127 = [v123 identifier];
                *(_DWORD *)buf = 138543362;
                v324 = v127;
                _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_INFO, "Install %{public}@: Declaration install operation already enqueued, skipping", buf, 0xCu);
              }
LABEL_119:

              v122 = (char *)v122 + 1;
              uint64_t v114 = (uint64_t)v242;
            }
            while (v122 != v119);
            id v119 = [v238 countByEnumeratingWithState:&v291 objects:v316 count:16];
          }
          while (v119);
        }

        v166 = [v241 identifier];
        v167 = +[DMDConfigurationPayloadMetadata fetchRequestForConfigurationsPendingInactiveFromOrganizationWithIdentifier:v166];

        __int16 v168 = [v167 execute:v114];
        v169 = v168;
        if (v168)
        {
          long long v285 = 0u;
          long long v286 = 0u;
          long long v283 = 0u;
          long long v284 = 0u;
          v259 = v168;
          id v170 = v168;
          id v171 = [v170 countByEnumeratingWithState:&v283 objects:v314 count:16];
          if (v171)
          {
            id v172 = v171;
            uint64_t v173 = *(void *)v284;
            uint64_t v174 = DMFDeclarationStateStatusKey;
            uint64_t v175 = DMFDeclarationStatusInactive;
            do
            {
              for (k = 0; k != v172; k = (char *)k + 1)
              {
                if (*(void *)v284 != v173) {
                  objc_enumerationMutation(v170);
                }
                v177 = *(void **)(*((void *)&v283 + 1) + 8 * (void)k);
                uint64_t v312 = v174;
                uint64_t v313 = v175;
                v178 = +[NSDictionary dictionaryWithObjects:&v313 forKeys:&v312 count:1];
                [v177 setStateDictionary:v178];
              }
              id v172 = [v170 countByEnumeratingWithState:&v283 objects:v314 count:16];
            }
            while (v172);
          }

          v179 = [v241 identifier];
          v180 = +[DMDDeclarationPayloadMetadata fetchRequestForDeclarationsPendingDeleteFromOrganizationWithIdentifier:v179];

          v181 = [v180 execute:v242];
          v182 = v181;
          if (v181)
          {
            long long v281 = 0u;
            long long v282 = 0u;
            long long v279 = 0u;
            long long v280 = 0u;
            id v183 = v181;
            id v184 = [v183 countByEnumeratingWithState:&v279 objects:v311 count:16];
            id v12 = v232;
            v118 = v257;
            if (v184)
            {
              id v185 = v184;
              uint64_t v186 = *(void *)v280;
              do
              {
                for (m = 0; m != v185; m = (char *)m + 1)
                {
                  if (*(void *)v280 != v186) {
                    objc_enumerationMutation(v183);
                  }
                  [v232 deleteObject:*(void *)(*((void *)&v279 + 1) + 8 * (void)m)];
                }
                id v185 = [v183 countByEnumeratingWithState:&v279 objects:v311 count:16];
              }
              while (v185);
            }

            v188 = DMFConfigurationEngineLog();
            BOOL v189 = os_log_type_enabled(v188, OS_LOG_TYPE_DEBUG);

            if (v189)
            {
              v248 = v182;
              objb = v180;
              v190 = DMFConfigurationEngineLog();
              if (os_log_type_enabled(v190, OS_LOG_TYPE_DEBUG)) {
                sub_100084BE4();
              }

              long long v277 = 0u;
              long long v278 = 0u;
              long long v275 = 0u;
              long long v276 = 0u;
              id v191 = v230;
              id v192 = [v191 countByEnumeratingWithState:&v275 objects:v310 count:16];
              if (v192)
              {
                id v193 = v192;
                uint64_t v194 = *(void *)v276;
                do
                {
                  for (n = 0; n != v193; n = (char *)n + 1)
                  {
                    if (*(void *)v276 != v194) {
                      objc_enumerationMutation(v191);
                    }
                    v196 = *(NSObject **)(*((void *)&v275 + 1) + 8 * (void)n);
                    v197 = DMFConfigurationEngineLog();
                    if (os_log_type_enabled(v197, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v324 = v196;
                      _os_log_debug_impl((void *)&_mh_execute_header, v197, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }
                  }
                  id v193 = [v191 countByEnumeratingWithState:&v275 objects:v310 count:16];
                }
                while (v193);
              }

              v198 = DMFConfigurationEngineLog();
              if (os_log_type_enabled(v198, OS_LOG_TYPE_DEBUG)) {
                sub_100084BB0();
              }

              long long v273 = 0u;
              long long v274 = 0u;
              long long v271 = 0u;
              long long v272 = 0u;
              id v199 = v229;
              id v200 = [v199 countByEnumeratingWithState:&v271 objects:v309 count:16];
              if (v200)
              {
                id v201 = v200;
                uint64_t v202 = *(void *)v272;
                do
                {
                  for (ii = 0; ii != v201; ii = (char *)ii + 1)
                  {
                    if (*(void *)v272 != v202) {
                      objc_enumerationMutation(v199);
                    }
                    v204 = *(NSObject **)(*((void *)&v271 + 1) + 8 * (void)ii);
                    v205 = DMFConfigurationEngineLog();
                    if (os_log_type_enabled(v205, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v324 = v204;
                      _os_log_debug_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }
                  }
                  id v201 = [v199 countByEnumeratingWithState:&v271 objects:v309 count:16];
                }
                while (v201);
              }

              v206 = DMFConfigurationEngineLog();
              if (os_log_type_enabled(v206, OS_LOG_TYPE_DEBUG)) {
                sub_100084B7C();
              }

              long long v269 = 0u;
              long long v270 = 0u;
              long long v267 = 0u;
              long long v268 = 0u;
              id v207 = v183;
              id v208 = [v207 countByEnumeratingWithState:&v267 objects:v308 count:16];
              v182 = v248;
              if (v208)
              {
                id v209 = v208;
                uint64_t v210 = *(void *)v268;
                do
                {
                  for (jj = 0; jj != v209; jj = (char *)jj + 1)
                  {
                    if (*(void *)v268 != v210) {
                      objc_enumerationMutation(v207);
                    }
                    v212 = *(NSObject **)(*((void *)&v267 + 1) + 8 * (void)jj);
                    v213 = DMFConfigurationEngineLog();
                    if (os_log_type_enabled(v213, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v324 = v212;
                      _os_log_debug_impl((void *)&_mh_execute_header, v213, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }
                  }
                  id v209 = [v207 countByEnumeratingWithState:&v267 objects:v308 count:16];
                }
                while (v209);
              }

              v214 = DMFConfigurationEngineLog();
              if (os_log_type_enabled(v214, OS_LOG_TYPE_DEBUG)) {
                sub_100084B48();
              }

              long long v265 = 0u;
              long long v266 = 0u;
              long long v263 = 0u;
              long long v264 = 0u;
              v215 = v251;
              id v216 = [v215 countByEnumeratingWithState:&v263 objects:v307 count:16];
              if (v216)
              {
                id v217 = v216;
                uint64_t v218 = *(void *)v264;
                do
                {
                  for (kk = 0; kk != v217; kk = (char *)kk + 1)
                  {
                    if (*(void *)v264 != v218) {
                      objc_enumerationMutation(v215);
                    }
                    v220 = *(NSObject **)(*((void *)&v263 + 1) + 8 * (void)kk);
                    v221 = DMFConfigurationEngineLog();
                    if (os_log_type_enabled(v221, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v324 = v220;
                      _os_log_debug_impl((void *)&_mh_execute_header, v221, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }
                  }
                  id v217 = [v215 countByEnumeratingWithState:&v263 objects:v307 count:16];
                }
                while (v217);
              }

              v222 = DMFConfigurationEngineLog();
              if (os_log_type_enabled(v222, OS_LOG_TYPE_DEBUG)) {
                sub_100084834();
              }

              id v12 = v232;
              v180 = objb;
              v118 = v257;
            }
            v223 = v251;
            v85 = v228;
            id v87 = v229;
          }
          else
          {
            v225 = DMFConfigurationEngineLog();
            id v12 = v232;
            v118 = v257;
            id v87 = v229;
            if (os_log_type_enabled(v225, OS_LOG_TYPE_ERROR)) {
              sub_100084AC4((uint64_t)v242);
            }

            v223 = 0;
            v85 = v228;
          }
          v169 = v259;
        }
        else
        {
          v180 = DMFConfigurationEngineLog();
          v85 = v228;
          id v87 = v229;
          if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR)) {
            sub_100084A40(v114);
          }
          v223 = 0;
          id v12 = v232;
        }
      }
      else
      {
        v167 = DMFConfigurationEngineLog();
        v118 = v257;
        if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR)) {
          sub_100084A40((uint64_t)v242);
        }
        v223 = 0;
        id v12 = v232;
        v85 = v228;
        id v87 = v229;
      }

      v224 = v241;
    }
    else
    {
      v231 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v231, OS_LOG_TYPE_ERROR)) {
        sub_1000849BC((uint64_t)a7);
      }
      v223 = 0;
      v224 = v241;
      v118 = v257;
    }

LABEL_206:
  }
  else
  {
    v223 = 0;
    v224 = v241;
  }

  return v223;
}

- (DMDEngineDatabaseProcessingOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DMDEngineDatabaseProcessingOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (void)setDeviceStateProvider:(id)a3
{
}

- (DMDTaskOperationProvider)taskOperationProvider
{
  return self->_taskOperationProvider;
}

- (void)setTaskOperationProvider:(id)a3
{
}

- (DMDActivationPredicateObserverManager)activationPredicateObserverManager
{
  return self->_activationPredicateObserverManager;
}

- (void)setActivationPredicateObserverManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationPredicateObserverManager, 0);
  objc_storeStrong((id *)&self->_taskOperationProvider, 0);
  objc_storeStrong((id *)&self->_deviceStateProvider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end