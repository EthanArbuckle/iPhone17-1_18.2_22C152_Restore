@interface RMStatusSubscriptionsSubscriber
- (BOOL)_updateStatusSubscriptionUIsForManagementSource:(id)a3;
- (BOOL)_updateStatusSubscriptionsForManagementSource:(id)a3;
- (NSManagedObjectContext)context;
- (NSSet)configurationTypes;
- (NSString)identifier;
- (RMStatusSubscriptionsSubscriber)init;
- (id)_getActiveStatusSubscriptionConfigurationsFromManagementSource:(id)a3;
- (id)_getActiveStatusSubscriptionConfigurationsFromManagementSource:(id)a3 onlyMissingUI:(BOOL)a4;
- (id)_getStatusSubscriptionsFromManagementSource:(id)a3;
- (id)_makeStatusSubscriptionWithManagementSource:(id)a3 declaration:(id)a4 context:(id)a5;
- (id)reportDetails;
- (void)applyChangedConfigurationsTypes:(id)a3;
- (void)fetchMissingConfigurationUIs;
- (void)setContext:(id)a3;
@end

@implementation RMStatusSubscriptionsSubscriber

- (RMStatusSubscriptionsSubscriber)init
{
  v9.receiver = self;
  v9.super_class = (Class)RMStatusSubscriptionsSubscriber;
  v2 = [(RMStatusSubscriptionsSubscriber *)&v9 init];
  if (v2)
  {
    v3 = +[RMPersistentController sharedController];
    v4 = [v3 persistentContainer];

    v5 = (NSManagedObjectContext *)[v4 newBackgroundContext];
    [(NSManagedObjectContext *)v5 setAutomaticallyMergesChangesFromParent:1];
    [(NSManagedObjectContext *)v5 setMergePolicy:NSMergeByPropertyStoreTrumpMergePolicy];
    v6 = +[NSString stringWithFormat:@"RMStatusSubscriptionsSubscriber"];
    [(NSManagedObjectContext *)v5 setTransactionAuthor:v6];

    context = v2->_context;
    v2->_context = v5;
  }
  return v2;
}

- (NSString)identifier
{
  return (NSString *)@"RMStatusSubscriptionsSubscriber";
}

- (NSSet)configurationTypes
{
  return +[NSSet setWithObject:RMConfigurationTypeManagementStatusSubscription];
}

- (void)applyChangedConfigurationsTypes:(id)a3
{
  v4 = +[RMLog statusSubscriptionsSubscriber];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating status subscriptions", buf, 2u);
  }

  [(RMStatusSubscriptionsSubscriber *)self context];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000688C4;
  v6[3] = &unk_1000C5100;
  v6[4] = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v7;
  [v5 performBlockAndWait:v6];
}

- (void)fetchMissingConfigurationUIs
{
  v3 = +[RMLog statusSubscriptionsSubscriber];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Updating status subscription UIs", buf, 2u);
  }

  [(RMStatusSubscriptionsSubscriber *)self context];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100068CB0;
  v5[3] = &unk_1000C5100;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  [v4 performBlockAndWait:v5];
}

- (id)reportDetails
{
  v10[0] = @"Internal";
  v9[0] = @"Location";
  v9[1] = @"Identifier";
  v3 = [(RMStatusSubscriptionsSubscriber *)self identifier];
  v10[1] = v3;
  v9[2] = @"ConfigurationTypes";
  id v4 = [(RMStatusSubscriptionsSubscriber *)self configurationTypes];
  id v5 = [v4 allObjects];
  id v6 = [v5 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
  v10[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (BOOL)_updateStatusSubscriptionsForManagementSource:(id)a3
{
  id v4 = a3;
  id v5 = [(RMStatusSubscriptionsSubscriber *)self _getStatusSubscriptionsFromManagementSource:v4];
  if (v5)
  {
    v94 = self;
    id v6 = [(RMStatusSubscriptionsSubscriber *)self _getActiveStatusSubscriptionConfigurationsFromManagementSource:v4];
    id v7 = [v5 allKeys];
    uint64_t v8 = +[NSSet setWithArray:v7];

    v95 = v6;
    objc_super v9 = [v6 allKeys];
    uint64_t v10 = +[NSSet setWithArray:v9];

    id v134 = 0;
    id v133 = 0;
    id v132 = 0;
    v86 = (void *)v10;
    v87 = (void *)v8;
    +[RMStoreDeclarationKey synchronizeOldKeys:v8 newKeys:v10 returningUnchangedKeys:&v134 returningApplyKeys:&v133 returningRemoveKeys:&v132];
    id v85 = v134;
    id v11 = v133;
    id v12 = v132;
    +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v11 count]);
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472;
    v130[2] = sub_100069D50;
    v130[3] = &unk_1000C69E0;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v131 = v13;
    v88 = v11;
    [v11 enumerateObjectsUsingBlock:v130];
    v83 = v13;
    v84 = v12;
    v14 = [v13 setByAddingObjectsFromSet:v12];
    BOOL v89 = [v14 count] != 0;
    v99 = [v4 managedObjectContext];
    v15 = +[RMLog statusSubscriptionsSubscriber];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10006AD24(v14);
    }

    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id obj = v14;
    v104 = v4;
    v96 = v5;
    id v97 = [obj countByEnumeratingWithState:&v126 objects:v145 count:16];
    if (v97)
    {
      uint64_t v92 = *(void *)v127;
      do
      {
        for (i = 0; i != v97; i = (char *)i + 1)
        {
          if (*(void *)v127 != v92) {
            objc_enumerationMutation(obj);
          }
          v100 = *(void **)(*((void *)&v126 + 1) + 8 * i);
          v17 = objc_msgSend(v5, "objectForKeyedSubscript:");
          long long v122 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          v102 = v17;
          v18 = [v17 items];
          id v19 = [v18 countByEnumeratingWithState:&v122 objects:v144 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v123;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v123 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v122 + 1) + 8 * (void)j);
                long long v118 = 0u;
                long long v119 = 0u;
                long long v120 = 0u;
                long long v121 = 0u;
                v24 = [v23 subscribedStatusKeyPaths];
                id v25 = [v24 copy];

                id v26 = [v25 countByEnumeratingWithState:&v118 objects:v143 count:16];
                if (v26)
                {
                  id v27 = v26;
                  uint64_t v28 = *(void *)v119;
                  do
                  {
                    for (k = 0; k != v27; k = (char *)k + 1)
                    {
                      if (*(void *)v119 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      [*(id *)(*((void *)&v118 + 1) + 8 * (void)k) removeStatusSubscriptionItemsObject:v23];
                    }
                    id v27 = [v25 countByEnumeratingWithState:&v118 objects:v143 count:16];
                  }
                  while (v27);
                }
              }
              id v20 = [v18 countByEnumeratingWithState:&v122 objects:v144 count:16];
            }
            while (v20);
          }

          [v99 deleteObject:v102];
          id v4 = v104;
          v30 = [v104 identifier];
          v31 = [v100 declarationIdentifier];
          v32 = [v100 declarationServerToken];
          id v117 = 0;
          unsigned __int8 v33 = +[RMConfigurationStatusArchiver removeStatusForStoreIdentifier:v30 declarationIdentifier:v31 declarationServerToken:v32 error:&v117];
          id v34 = v117;

          if ((v33 & 1) == 0)
          {
            v35 = +[RMLog statusSubscriptionsSubscriber];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v139 = (uint64_t)v34;
              _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Status subscription status removal failed: %{public}@", buf, 0xCu);
            }
          }
          id v5 = v96;
        }
        id v97 = [obj countByEnumeratingWithState:&v126 objects:v145 count:16];
      }
      while (v97);
    }

    v36 = +[RMLog statusSubscriptionsSubscriber];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      sub_10006ACAC(v88);
    }

    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id v90 = v88;
    id v37 = [v90 countByEnumeratingWithState:&v113 objects:v142 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v98 = *(void *)v114;
      do
      {
        v39 = 0;
        id v101 = v38;
        do
        {
          if (*(void *)v114 != v98) {
            objc_enumerationMutation(v90);
          }
          v40 = [*(id *)(*((void *)&v113 + 1) + 8 * (void)v39) applyKey];
          v41 = [v95 objectForKeyedSubscript:v40];
          v42 = [v41 payload];

          if (v42)
          {
            v43 = [v41 payload];
            id v112 = 0;
            uint64_t v44 = +[RMModelManagementStatusSubscriptionsDeclaration loadData:v43 serializationType:0 error:&v112];
            id v45 = v112;

            if (v44)
            {
              v93 = v41;
              v103 = (void *)v44;
              if (objc_msgSend((id)objc_opt_class(), "isSupportedForPlatform:scope:enrollmentType:", +[RMModelSharedDefinitions currentPlatform](RMModelSharedDefinitions, "currentPlatform"), +[RMBundle managementScope](RMBundle, "managementScope"), (int)objc_msgSend(v4, "enrollmentType")))
              {
                v46 = [(RMStatusSubscriptionsSubscriber *)v94 _makeStatusSubscriptionWithManagementSource:v4 declaration:v44 context:v99];
                uint64_t v47 = +[RMExternalStatusPublisher sharedPublisher];
                v48 = [v4 identifier];
                [(id)v47 publishStatusKeys:v46 storeIdentifier:v48];

                v49 = [v4 identifier];
                v50 = [v40 declarationIdentifier];
                v51 = [v40 declarationServerToken];
                v52 = [(RMStatusSubscriptionsSubscriber *)v94 identifier];
                id v109 = v45;
                BOOL v89 = 1;
                LOBYTE(v47) = +[RMConfigurationStatusArchiver persistStatusForStoreIdentifier:v49 declarationIdentifier:v50 declarationServerToken:v51 sourceIdentifier:v52 validity:1 reasons:0 error:&v109];
                id v53 = v109;

                if ((v47 & 1) == 0)
                {
                  v54 = +[RMLog statusSubscriptionsSubscriber];
                  id v55 = v101;
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    uint64_t v139 = (uint64_t)v53;
                    _os_log_debug_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "Status subscription status persist for success failed: %{public}@", buf, 0xCu);
                  }

                  BOOL v89 = 1;
                  id v4 = v104;
                  goto LABEL_55;
                }
              }
              else
              {
                v64 = +[RMLog statusSubscriptionsSubscriber];
                if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v139 = v44;
                  _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Declaration not supported: %{public}@", buf, 0xCu);
                }

                uint64_t v65 = +[RMModelStatusReason reasonWithCode:@"Error.ConfigurationNotSupported" description:@"Configuration not supported" underlyingError:v45];
                uint64_t v136 = v65;
                v46 = +[NSArray arrayWithObjects:&v136 count:1];

                v66 = [v4 identifier];
                v67 = [v40 declarationIdentifier];
                v68 = [v40 declarationServerToken];
                v69 = [(RMStatusSubscriptionsSubscriber *)v94 identifier];
                id v110 = v45;
                LOBYTE(v65) = +[RMConfigurationStatusArchiver persistStatusForStoreIdentifier:v66 declarationIdentifier:v67 declarationServerToken:v68 sourceIdentifier:v69 validity:0 reasons:v46 error:&v110];
                id v53 = v110;

                if ((v65 & 1) == 0)
                {
                  v70 = +[RMLog statusSubscriptionsSubscriber];
                  id v55 = v101;
                  v57 = v93;
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    uint64_t v139 = (uint64_t)v53;
                    _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "Status subscription status persist for error failed: %{public}@", buf, 0xCu);
                  }

                  id v4 = v104;
                  goto LABEL_59;
                }
              }
              id v4 = v104;
              id v55 = v101;
LABEL_55:
              v57 = v93;
              goto LABEL_59;
            }
          }
          else
          {
            id v45 = +[RMErrorUtilities createInternalError];
          }
          v56 = +[RMLog statusSubscriptionsSubscriber];
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v139 = (uint64_t)v41;
            __int16 v140 = 2114;
            id v141 = v45;
            _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Unable to de-serialize declaration %{public}@: %{public}@", buf, 0x16u);
          }
          v57 = v41;

          v58 = +[RMModelStatusReason reasonWithCode:@"Error.ConfigurationIsInvalid" description:@"Configuration is invalid" underlyingError:v45];
          v137 = v58;
          uint64_t v59 = +[NSArray arrayWithObjects:&v137 count:1];

          v60 = [v4 identifier];
          v61 = [v40 declarationIdentifier];
          v62 = [v40 declarationServerToken];
          v63 = [(RMStatusSubscriptionsSubscriber *)v94 identifier];
          id v111 = v45;
          v103 = (void *)v59;
          LOBYTE(v59) = +[RMConfigurationStatusArchiver persistStatusForStoreIdentifier:v60 declarationIdentifier:v61 declarationServerToken:v62 sourceIdentifier:v63 validity:0 reasons:v59 error:&v111];
          id v53 = v111;

          if (v59)
          {
            id v4 = v104;
            id v55 = v101;
            goto LABEL_60;
          }
          v46 = +[RMLog statusSubscriptionsSubscriber];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v139 = (uint64_t)v53;
            _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Status subscription status persist for error failed: %{public}@", buf, 0xCu);
          }
          id v4 = v104;
          id v55 = v101;
LABEL_59:

LABEL_60:
          v39 = (char *)v39 + 1;
        }
        while (v55 != v39);
        id v38 = [v90 countByEnumeratingWithState:&v113 objects:v142 count:16];
      }
      while (v38);
    }

    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v71 = [v4 subscribedStatusKeyPaths];
    id v72 = [v71 countByEnumeratingWithState:&v105 objects:v135 count:16];
    if (v72)
    {
      id v73 = v72;
      uint64_t v74 = 0;
      uint64_t v75 = *(void *)v106;
      do
      {
        for (m = 0; m != v73; m = (char *)m + 1)
        {
          if (*(void *)v106 != v75) {
            objc_enumerationMutation(v71);
          }
          v77 = *(void **)(*((void *)&v105 + 1) + 8 * (void)m);
          v78 = [v77 statusSubscriptionItems];
          id v79 = [v78 count];

          if (!v79)
          {
            [v99 deleteObject:v77];
            ++v74;
          }
        }
        id v73 = [v71 countByEnumeratingWithState:&v105 objects:v135 count:16];
      }
      while (v73);
    }

    v81 = +[RMLog statusSubscriptionsSubscriber];
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
      sub_10006AC38();
    }

    id v5 = v96;
    BOOL v80 = v89;
  }
  else
  {
    BOOL v80 = 0;
  }

  return v80;
}

- (id)_getStatusSubscriptionsFromManagementSource:(id)a3
{
  id v3 = a3;
  id v4 = +[RMStatusSubscription fetchRequest];
  id v25 = v3;
  id v5 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND (%K == %d)", @"managementSource", v3, @"sourceType", 1];
  [v4 setPredicate:v5];

  id v30 = 0;
  id v6 = [v4 execute:&v30];
  id v7 = v30;
  if (v6)
  {
    uint64_t v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v6;
    id v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      id v20 = v7;
      uint64_t v21 = v6;
      v22 = v4;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v14 = [(RMStatusSubscriptionsSubscriber *)self identifier];
          v15 = [v25 identifier];
          v16 = [v13 sourceIdentifier];
          v17 = [v13 sourceServerToken];
          id v18 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:v14 storeIdentifier:v15 declarationIdentifier:v16 declarationServerToken:v17];

          [v8 setObject:v13 forKeyedSubscript:v18];
        }
        id v10 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
      id v6 = v21;
      id v4 = v22;
      id v7 = v20;
    }
  }
  else
  {
    id obj = +[RMLog statusSubscriptionsSubscriber];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      sub_10006AD9C();
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_updateStatusSubscriptionUIsForManagementSource:(id)a3
{
  id v4 = a3;
  id v5 = [(RMStatusSubscriptionsSubscriber *)self _getActiveStatusSubscriptionConfigurationsFromManagementSource:v4 onlyMissingUI:1];
  id v6 = [v5 count];
  if (v6)
  {
    id v17 = v6;
    id v7 = [v4 managedObjectContext];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [v5 allValues];
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v14 = [[RMConfigurationPayloadUI alloc] initWithContext:v7];
          [(RMConfigurationPayloadUI *)v14 setVisible:0];
          [v13 setUi:v14];
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v6 = v17;
  }
  BOOL v15 = v6 != 0;

  return v15;
}

- (id)_getActiveStatusSubscriptionConfigurationsFromManagementSource:(id)a3
{
  return [(RMStatusSubscriptionsSubscriber *)self _getActiveStatusSubscriptionConfigurationsFromManagementSource:a3 onlyMissingUI:0];
}

- (id)_getActiveStatusSubscriptionConfigurationsFromManagementSource:(id)a3 onlyMissingUI:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[RMConfigurationPayload fetchRequest];
  if (v4) {
    +[NSPredicate predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K == YES) AND (%K == NULL)", @"managementSource", v5, @"declarationType", RMConfigurationTypeManagementStatusSubscription, @"state.active", @"ui"];
  }
  else {
  id v7 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K == YES)", @"managementSource", v5, @"declarationType", RMConfigurationTypeManagementStatusSubscription, @"state.active", v22];
  }
  [v6 setPredicate:v7];

  id v33 = 0;
  uint64_t v8 = [v6 execute:&v33];
  id v9 = v33;
  if (v8)
  {
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v8;
    id v10 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      id v11 = v10;
      id v23 = v9;
      v24 = v8;
      id v25 = v6;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          BOOL v15 = [(RMStatusSubscriptionsSubscriber *)self identifier];
          [v5 identifier];
          id v17 = v16 = v5;
          long long v18 = [v14 identifier];
          long long v19 = [v14 serverToken];
          id v20 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:v15 storeIdentifier:v17 declarationIdentifier:v18 declarationServerToken:v19];

          id v5 = v16;
          [v28 setObject:v14 forKeyedSubscript:v20];
        }
        id v11 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
      uint64_t v8 = v24;
      id v6 = v25;
      id v9 = v23;
    }
  }
  else
  {
    id obj = +[RMLog statusSubscriptionsSubscriber];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      sub_10006AE04();
    }
    id v28 = 0;
  }

  return v28;
}

- (id)_makeStatusSubscriptionWithManagementSource:(id)a3 declaration:(id)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [RMStatusSubscription alloc];
  id v9 = [v6 managedObjectContext];
  id v10 = [(RMStatusSubscription *)v8 initWithContext:v9];

  [(RMStatusSubscription *)v10 setSourceType:1];
  id v11 = [v7 declarationIdentifier];
  [(RMStatusSubscription *)v10 setSourceIdentifier:v11];

  uint64_t v12 = [v7 declarationServerToken];
  [(RMStatusSubscription *)v10 setSourceServerToken:v12];

  v57 = v10;
  id v53 = v6;
  [(RMStatusSubscription *)v10 setManagementSource:v6];
  v52 = v7;
  id v13 = [v7 payloadStatusItems];
  +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v13 count]);
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v13;
  id v58 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (v58)
  {
    uint64_t v55 = *(void *)v67;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v67 != v55) {
          objc_enumerationMutation(obj);
        }
        BOOL v15 = *(void **)(*((void *)&v66 + 1) + 8 * v14);
        id v16 = v57;
        id v17 = v15;
        long long v18 = [RMStatusSubscriptionItem alloc];
        long long v19 = [(RMStatusSubscription *)v16 managedObjectContext];
        id v20 = [(RMStatusSubscriptionItem *)v18 initWithContext:v19];

        [(RMStatusSubscriptionItem *)v20 setSubscription:v16];
        long long v21 = [v17 payloadName];
        [(RMStatusSubscriptionItem *)v20 setKeyPath:v21];

        [(RMStatusSubscriptionItem *)v20 setProperties:0];
        [(RMStatusSubscriptionItem *)v20 setPredicate:0];
        id v22 = v17;
        id v23 = [v22 payloadName];
        v63 = v16;
        uint64_t v64 = v14;
        uint64_t v65 = v22;
        if ([&__NSArray0__struct count])
        {
          v24 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [&__NSArray0__struct count]);
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          id v25 = [&__NSArray0__struct countByEnumeratingWithState:&v79 objects:v83 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v80;
            do
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v80 != v27) {
                  objc_enumerationMutation(&__NSArray0__struct);
                }
                long long v29 = [v23 stringByAppendingFormat:@".%@", *(void *)(*((void *)&v79 + 1) + 8 * i)];
                [v24 addObject:v29];
              }
              id v26 = [&__NSArray0__struct countByEnumeratingWithState:&v79 objects:v83 count:16];
            }
            while (v26);
            id v22 = v65;
          }
        }
        else
        {
          v24 = +[NSSet setWithObject:v23];
        }

        long long v30 = v20;
        id v31 = v24;
        long long v32 = [(RMStatusSubscriptionItem *)v30 subscription];
        id v33 = [v32 managementSource];

        id v34 = [v33 subscribedStatusKeyPaths];
        v60 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"keyPath", v31];
        v35 = objc_msgSend(v34, "filteredSetUsingPredicate:");
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v36 = [v35 countByEnumeratingWithState:&v74 objects:v83 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v75;
          do
          {
            for (j = 0; j != v37; j = (char *)j + 1)
            {
              if (*(void *)v75 != v38) {
                objc_enumerationMutation(v35);
              }
              [*(id *)(*((void *)&v74 + 1) + 8 * (void)j) addStatusSubscriptionItemsObject:v30];
            }
            id v37 = [v35 countByEnumeratingWithState:&v74 objects:v83 count:16];
          }
          while (v37);
        }
        v61 = v34;
        uint64_t v40 = [v34 valueForKey:@"keyPath"];
        v62 = v31;
        id v41 = [v31 mutableCopy];
        uint64_t v59 = (void *)v40;
        [v41 minusSet:v40];
        v42 = [(RMStatusSubscriptionItem *)v30 managedObjectContext];
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v43 = v41;
        id v44 = [v43 countByEnumeratingWithState:&v70 objects:&v79 count:16];
        if (v44)
        {
          id v45 = v44;
          uint64_t v46 = *(void *)v71;
          do
          {
            for (k = 0; k != v45; k = (char *)k + 1)
            {
              if (*(void *)v71 != v46) {
                objc_enumerationMutation(v43);
              }
              uint64_t v48 = *(void *)(*((void *)&v70 + 1) + 8 * (void)k);
              v49 = [[RMSubscribedStatusKeyPath alloc] initWithContext:v42];
              [(RMSubscribedStatusKeyPath *)v49 setKeyPath:v48];
              [(RMSubscribedStatusKeyPath *)v49 setManagementSource:v33];
              [(RMSubscribedStatusKeyPath *)v49 addStatusSubscriptionItemsObject:v30];
            }
            id v45 = [v43 countByEnumeratingWithState:&v70 objects:&v79 count:16];
          }
          while (v45);
        }

        v50 = [v65 payloadName];
        [v56 addObject:v50];

        uint64_t v14 = v64 + 1;
      }
      while ((id)(v64 + 1) != v58);
      id v58 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
    }
    while (v58);
  }

  return v56;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end