@interface STProcessBlueprintChanges
+ (BOOL)_cleanupDeletedUserBlueprintsWithContext:(id)a3 error:(id *)a4;
+ (BOOL)_cleanupDuplicateBlueprintConfigurationsWithContext:(id)a3 error:(id *)a4;
+ (BOOL)_cleanupDuplicateRestrictionsBlueprintsWithContext:(id)a3 user:(id)a4 error:(id *)a5;
+ (BOOL)_migrateBlueprintsToVersion2CategoriesWithContext:(id)a3 user:(id)a4 error:(id *)a5;
+ (BOOL)_shouldInstallBlueprint:(id)a3;
+ (id)_requestFromBlueprints:(id)a3 forUser:(id)a4 error:(id *)a5;
+ (void)_postShareMyLocationNotificationForOldAllowFindMyFriendsModification:(id)a3 newAllowFindMyFriendsModification:(id)a4;
+ (void)processBlueprintsChangesWithPersistenceController:(id)a3 completionHandler:(id)a4;
@end

@implementation STProcessBlueprintChanges

+ (void)processBlueprintsChangesWithPersistenceController:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create((void *)&_mh_execute_header, "STProcessBlueprintChangesOperation start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = +[STLog blueprint];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "STProcessBlueprintChanges : Started", buf, 2u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000599D4;
  v12[3] = &unk_1002FCFF8;
  id v10 = v7;
  id v14 = v10;
  id v15 = a1;
  id v11 = v6;
  id v13 = v11;
  [v11 performBackgroundTask:v12];

  os_activity_scope_leave(&state);
}

+ (BOOL)_cleanupDuplicateBlueprintConfigurationsWithContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[STBlueprint fetchRequest];
  id v7 = +[NSPredicate predicateWithFormat:@"(%K == %@) OR (%K == %@) OR (%K == %@)", @"type", STBlueprintTypeRestrictions, @"type", STBlueprintTypeAlwaysAllowedApps, @"type", STBlueprintTypeDowntime];
  [v6 setPredicate:v7];

  CFStringRef v46 = @"configurations";
  v8 = +[NSArray arrayWithObjects:&v46 count:1];
  [v6 setRelationshipKeyPathsForPrefetching:v8];

  v9 = [v6 execute:a4];
  if (v9)
  {
    v27 = v6;
    id v10 = +[NSSortDescriptor sortDescriptorWithKey:@"objectID.URIRepresentation.absoluteString" ascending:1];
    v45 = v10;
    v29 = +[NSArray arrayWithObjects:&v45 count:1];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v26 = v9;
    id obj = v9;
    id v30 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (!v30) {
      goto LABEL_26;
    }
    uint64_t v28 = *(void *)v38;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v11;
        v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
        id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(obj, "count"));
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v14 = [v12 configurations];
        id v15 = [v14 sortedArrayUsingDescriptors:v29];

        id v16 = [v15 countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v34;
          do
          {
            v19 = 0;
            do
            {
              if (*(void *)v34 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v19);
              v21 = [v20 type];
              if (!v21
                || ([v20 payloadPlist],
                    v22 = objc_claimAutoreleasedReturnValue(),
                    v22,
                    !v22))
              {
                [v5 deleteObject:v20];
LABEL_19:
                [v12 setIsDirty:1];
                goto LABEL_20;
              }
              if ([v13 containsObject:v21])
              {
                [v5 deleteObject:v20];
                v23 = +[STLog blueprint];
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v42 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Deleting duplicate blueprint configuration %@", buf, 0xCu);
                }

                goto LABEL_19;
              }
              [v13 addObject:v21];
LABEL_20:

              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            id v24 = [v15 countByEnumeratingWithState:&v33 objects:v43 count:16];
            id v17 = v24;
          }
          while (v24);
        }

        uint64_t v11 = v32 + 1;
      }
      while ((id)(v32 + 1) != v30);
      id v30 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (!v30)
      {
LABEL_26:

        v9 = v26;
        id v6 = v27;
        goto LABEL_29;
      }
    }
  }
  v29 = +[STLog blueprint];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_100263528();
  }
LABEL_29:

  return v9 != 0;
}

+ (BOOL)_cleanupDeletedUserBlueprintsWithContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v16 = +[STBlueprint fetchRequestMatchingOrphanedBlueprints];
  id v6 = [v16 execute:a4];
  id v7 = v6;
  if (v6)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v13 = +[STLog blueprint];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v22 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleting blueprint with no user %@", buf, 0xCu);
          }

          [v5 deleteObject:v12];
        }
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v14 = +[STLog blueprint];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100263590();
    }
  }
  return v7 != 0;
}

+ (BOOL)_cleanupDuplicateRestrictionsBlueprintsWithContext:(id)a3 user:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 dsid];
  uint64_t v10 = STBlueprintTypeRestrictions;
  uint64_t v11 = [v8 managingOrganization];
  uint64_t v12 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v9 ofType:v10 fromOrganization:v11];

  id v13 = [v12 execute:a5];
  id v14 = v13;
  if (!v13)
  {
    id v15 = +[STLog blueprint];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100263590();
    }
    goto LABEL_15;
  }
  if ((unint64_t)[v13 count] >= 2)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v16)
    {
      id v17 = v16;
      id v24 = v12;
      id v25 = v8;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v21 = +[STLog blueprint];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = [v20 type];
            *(_DWORD *)buf = 138412546;
            v31 = v20;
            __int16 v32 = 2114;
            long long v33 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Deleting duplicated blueprint %@ of type %{public}@", buf, 0x16u);
          }
          [v7 deleteObject:v20];
        }
        id v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v17);
      uint64_t v12 = v24;
      id v8 = v25;
    }
LABEL_15:
  }
  return v14 != 0;
}

+ (BOOL)_migrateBlueprintsToVersion2CategoriesWithContext:(id)a3 user:(id)a4 error:(id *)a5
{
  id v6 = +[STBlueprint fetchRequest];
  id v7 = +[NSPredicate predicateWithFormat:@"(%K == %@) OR (%K == %@)", @"type", STBlueprintTypeUsageLimit, @"type", STBlueprintTypeDowntime];
  [v6 setPredicate:v7];

  v30[0] = @"configurations";
  v30[1] = @"usageLimit";
  id v8 = +[NSArray arrayWithObjects:v30 count:2];
  [v6 setRelationshipKeyPathsForPrefetching:v8];

  id v9 = [v6 execute:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v16 = +[STLog blueprint];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v15 identifier];
            uint64_t v18 = [v15 type];
            *(_DWORD *)buf = 138543618;
            long long v26 = v17;
            __int16 v27 = 2114;
            long long v28 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Performing category migration while processing blueprint: %{public}@ with type: %{public}@", buf, 0x16u);
          }
          [v15 migrateToVersion2CategoriesIfNeeded];
        }
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v12);
    }
  }
  else
  {
    long long v19 = +[STLog blueprint];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_1002635F8();
    }
  }
  return v10 != 0;
}

+ (id)_requestFromBlueprints:(id)a3 forUser:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_new();
  uint64_t v10 = [v8 unmodeledManagingOrganizationSettings];
  id v11 = +[NSUserDefaults standardUserDefaults];
  uint64_t v48 = [v11 objectForKey:@"allowFindMyFriendsModification"];

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v12 = v7;
  id v62 = [v12 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v62)
  {
    v53 = 0;
    uint64_t v61 = *(void *)v64;
    uint64_t v60 = STBlueprintTypeUsageLimit;
    uint64_t v57 = STBlueprintTypeDowntime;
    uint64_t v56 = STBlueprintTypeManagedUser;
    uint64_t v55 = STBlueprintTypeRestrictions;
    uint64_t v13 = STBlueprintConfigurationTypeSystemICloud;
    id v59 = v12;
    v50 = v9;
    id v51 = v8;
    v49 = a5;
    v52 = v10;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v64 != v61) {
        objc_enumerationMutation(v12);
      }
      id v15 = *(void **)(*((void *)&v63 + 1) + 8 * v14);
      id v16 = [v15 type];
      if (![v16 isEqualToString:v60]) {
        break;
      }
      if ([v15 limitEnabled])
      {
        unsigned int v17 = [v10 allLimitsEnabled];
LABEL_10:
        unsigned int v18 = v17;
        goto LABEL_12;
      }
      unsigned int v18 = 0;
LABEL_12:

      long long v19 = [v15 users];
      if (![v19 containsObject:v8]) {
        goto LABEL_48;
      }
      if (v18)
      {

LABEL_17:
        if ([a1 _shouldInstallBlueprint:v15])
        {
          long long v22 = [v15 type];
          id v12 = v59;
          if ([v22 isEqualToString:v56])
          {
            long long v23 = [v10 passcode];

            if (!v23) {
              goto LABEL_49;
            }
          }
          else
          {
          }
          long long v24 = [v15 type];
          unsigned int v25 = [v24 isEqualToString:v55];

          if (v25)
          {
            id v26 = v15;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            __int16 v27 = [v26 configurations];
            id v28 = [v27 countByEnumeratingWithState:&v67 objects:v74 count:16];
            if (v28)
            {
              id v29 = v28;
              id v54 = v26;
              uint64_t v30 = *(void *)v68;
LABEL_27:
              uint64_t v31 = 0;
              while (1)
              {
                if (*(void *)v68 != v30) {
                  objc_enumerationMutation(v27);
                }
                __int16 v32 = *(void **)(*((void *)&v67 + 1) + 8 * v31);
                long long v33 = [v32 type];
                unsigned __int8 v34 = [v33 isEqualToString:v13];

                if (v34) {
                  break;
                }
                if (v29 == (id)++v31)
                {
                  id v29 = [v27 countByEnumeratingWithState:&v67 objects:v74 count:16];
                  if (v29) {
                    goto LABEL_27;
                  }
                  v53 = 0;
                  id v35 = v27;
                  id v9 = v50;
                  id v8 = v51;
                  a5 = v49;
                  id v12 = v59;
                  id v26 = v54;
                  goto LABEL_44;
                }
              }
              id v35 = v32;

              if (!v35)
              {
                v53 = 0;
                id v9 = v50;
                id v8 = v51;
                a5 = v49;
                uint64_t v10 = v52;
                id v12 = v59;
                id v26 = v54;
                goto LABEL_45;
              }
              long long v36 = [v35 cemConfiguration];
              objc_opt_class();
              id v9 = v50;
              id v8 = v51;
              a5 = v49;
              id v26 = v54;
              if (objc_opt_isKindOfClass())
              {
                long long v37 = [v36 payloadAllowFindMyFriendsModification];
                long long v38 = v37;
                if (!v37 || (unsigned int v39 = [v37 BOOLValue], v40 = &__kCFBooleanFalse, v39)) {
                  long long v40 = 0;
                }
                v53 = v40;
              }
              else
              {
                v53 = 0;
              }
              id v12 = v59;
            }
            else
            {
              v53 = 0;
              id v35 = v27;
            }
LABEL_44:

            uint64_t v10 = v52;
LABEL_45:
          }
          uint64_t v41 = [v15 declarationsWithError:a5];
          if (!v41)
          {
            v42 = 0;
            v43 = v12;
            v44 = (void *)v48;
            goto LABEL_57;
          }
          long long v19 = (void *)v41;
          [v9 addObjectsFromArray:v41];
          goto LABEL_48;
        }
        goto LABEL_21;
      }
      long long v20 = [v15 type];
      if (([v20 isEqualToString:v57] & 1) == 0)
      {

LABEL_48:
        goto LABEL_49;
      }
      long long v21 = [v15 activeOverride];

      if (v21) {
        goto LABEL_17;
      }
LABEL_21:
      id v12 = v59;
LABEL_49:
      if ((id)++v14 == v62)
      {
        id v62 = [v12 countByEnumeratingWithState:&v63 objects:v73 count:16];
        if (v62) {
          goto LABEL_3;
        }
        goto LABEL_54;
      }
    }
    unsigned int v17 = [v15 enabled];
    goto LABEL_10;
  }
  v53 = 0;
LABEL_54:

  v45 = [v8 effectivePasscode];
  id v46 = [v45 length];

  v44 = (void *)v48;
  if (v46) {
    [a1 _postShareMyLocationNotificationForOldAllowFindMyFriendsModification:v48 newAllowFindMyFriendsModification:v53];
  }
  v71[0] = @"Declarations";
  v71[1] = @"RequestType";
  v72[0] = v9;
  v72[1] = @"Set";
  v71[2] = @"RequestUUID";
  v71[3] = @"SyncToken";
  v72[2] = @"-";
  v72[3] = @"-";
  v43 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:4];
  v42 = +[STRemoteManagementRequest requestForPayload:v43 error:a5];
LABEL_57:

  return v42;
}

+ (BOOL)_shouldInstallBlueprint:(id)a3
{
  return 1;
}

+ (void)_postShareMyLocationNotificationForOldAllowFindMyFriendsModification:(id)a3 newAllowFindMyFriendsModification:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    unsigned __int8 v8 = [v5 BOOLValue];
    if (!v7 && (v8 & 1) == 0)
    {
      id v9 = +[STLog blueprint];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Posting Location Sharing notification: unlocked", v19, 2u);
      }

      id v10 = objc_alloc((Class)NSNotification);
      id v11 = objc_opt_new();
      id v12 = [v10 initWithName:@"STUserNotificationManagerShouldPostNotification" object:v11 userInfo:0];

      uint64_t v13 = +[NSNotificationCenter defaultCenter];
      [v13 postNotification:v12];

      uint64_t v14 = +[NSUserDefaults standardUserDefaults];
      [v14 removeObjectForKey:@"allowFindMyFriendsModification"];
LABEL_12:
    }
  }
  else if (v6 && ([v6 BOOLValue] & 1) == 0)
  {
    id v15 = +[STLog blueprint];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Posting Location Sharing notification: locked", buf, 2u);
    }

    id v16 = objc_alloc((Class)NSNotification);
    unsigned int v17 = objc_opt_new();
    id v12 = [v16 initWithName:@"STUserNotificationManagerShouldPostNotification" object:v17 userInfo:0];

    unsigned int v18 = +[NSNotificationCenter defaultCenter];
    [v18 postNotification:v12];

    uint64_t v14 = +[NSUserDefaults standardUserDefaults];
    [v14 setValue:&__kCFBooleanFalse forKey:@"allowFindMyFriendsModification"];
    goto LABEL_12;
  }
}

@end