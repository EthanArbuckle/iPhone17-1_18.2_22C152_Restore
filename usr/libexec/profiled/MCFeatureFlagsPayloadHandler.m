@interface MCFeatureFlagsPayloadHandler
+ (BOOL)_reapplyConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5;
+ (BOOL)_reapplyPayloads:(id)a3 error:(id *)a4;
+ (id)_fullyInstalledPayloads;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCFeatureFlagsPayloadHandler

+ (id)_fullyInstalledPayloads
{
  v2 = +[MCManifest sharedManifest];
  v3 = [v2 allInstalledPayloadsOfClass:objc_opt_class()];

  return v3;
}

+ (BOOL)_reapplyPayloads:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Begin applying changes to feature flag settings.", buf, 2u);
  }
  v7 = +[FFConfiguration configurationForProfileManagement];
  v8 = v7;
  if (v7)
  {
    v32 = a4;
    [v7 prepareToAddProfilePayloads];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v33 = v5;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v10)
    {
      id v11 = v10;
      id v12 = 0;
      uint64_t v13 = *(void *)v37;
      while (2)
      {
        v14 = 0;
        v15 = v12;
        do
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v14);
          v17 = [v16 featureFlagsConfiguration];
          os_log_t v18 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
          {
            v19 = v18;
            v20 = [v16 UUID];
            *(_DWORD *)buf = 138543618;
            v41 = v20;
            __int16 v42 = 2112;
            id v43 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Adding feature flag settings from payload %{public}@: %@.", buf, 0x16u);
          }
          id v35 = v15;
          unsigned __int8 v21 = [v8 addProfilePayload:v17 error:&v35];
          id v12 = v35;

          if ((v21 & 1) == 0)
          {
            os_log_t v22 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              v23 = v22;
              v24 = [v16 UUID];
              *(_DWORD *)buf = 138543618;
              v41 = v24;
              __int16 v42 = 2114;
              id v43 = v12;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to apply feature flag configuration payload %{public}@ with error: %{public}@", buf, 0x16u);
            }
            unsigned __int8 v25 = 0;
            goto LABEL_25;
          }

          v14 = (char *)v14 + 1;
          v15 = v12;
        }
        while (v11 != v14);
        id v11 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v12 = 0;
    }

    v27 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Committing changes to feature flag settings.", buf, 2u);
    }
    id v34 = v12;
    unsigned __int8 v25 = [v8 commitProfilePayloadsAndReturnError:&v34];
    id v28 = v34;

    id v12 = v28;
LABEL_25:
    a4 = v32;
    id v5 = v33;
  }
  else
  {
    v26 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Unable to communicate with feature flag manager", buf, 2u);
    }
    id v12 = +[NSError MCErrorWithDomain:MCFeatureFlagsErrorDomain code:58002 descriptionArray:0 underlyingError:0 errorType:MCErrorTypeFatal];
    unsigned __int8 v25 = 0;
  }
  v29 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "End applying changes to feature flag settings.", buf, 2u);
  }
  if (a4) {
    char v30 = v25;
  }
  else {
    char v30 = 1;
  }
  if ((v30 & 1) == 0) {
    *a4 = v12;
  }

  return v25;
}

+ (BOOL)_reapplyConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSMutableArray array];
  id v11 = [a1 _fullyInstalledPayloads];
  [v10 addObjectsFromArray:v11];

  [v10 addObjectsFromArray:v9];
  if (v8)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100093B94;
    v18[3] = &unk_1000EC4F8;
    id v19 = v8;
    id v12 = +[NSPredicate predicateWithBlock:v18];
    [v10 filterUsingPredicate:v12];
  }
  os_log_t v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    id v15 = [v10 count];
    *(_DWORD *)buf = 134217984;
    id v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Applying %lu feature flag payloads", buf, 0xCu);
  }
  unsigned __int8 v16 = [a1 _reapplyPayloads:v10 error:a5];

  return v16;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = [(MCNewPayloadHandler *)self payload];
  id v9 = +[MCProfileHandler payloadsOfClass:objc_opt_class() installedBeforePayload:v8];
  id v10 = [v9 mutableCopy];

  [v10 addObject:v8];
  id v19 = 0;
  unsigned __int8 v11 = [(id)objc_opt_class() _reapplyConfigurationIncludingPayloads:v10 excludingPayloads:0 error:&v19];
  id v12 = v19;
  if ((v11 & 1) == 0)
  {
    uint64_t v13 = MCInstallationErrorDomain;
    v14 = [(MCNewPayloadHandler *)self payload];
    id v15 = [v14 friendlyName];
    unsigned __int8 v16 = MCErrorArray();
    v17 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v13, 4001, v16, v12, MCErrorTypeFatal, v15, 0);

    if (a6) {
      *a6 = v17;
    }
  }
  return v11;
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self payload];
  v4 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v5 = [v4 isSetAside];

  if ((v5 & 1) == 0)
  {
    v6 = +[MCProfileHandler payloadsOfClass:objc_opt_class() removedBeforePayload:v3];
    id v7 = [v6 mutableCopy];

    [v7 addObject:v3];
    id v17 = 0;
    unsigned int v8 = [(id)objc_opt_class() _reapplyConfigurationIncludingPayloads:0 excludingPayloads:v7 error:&v17];
    id v9 = v17;
    os_log_t v10 = _MCLogObjects[0];
    if (v8)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v11 = v10;
        id v12 = [v3 UUID];
        *(_DWORD *)buf = 138543362;
        id v19 = v12;
        uint64_t v13 = "Removed Feature Flags with payload ID %{public}@";
        v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
      }
    }
    else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v11 = v10;
      id v12 = [v3 UUID];
      *(_DWORD *)buf = 138543618;
      id v19 = v12;
      __int16 v20 = 2114;
      id v21 = v9;
      uint64_t v13 = "Failed to remove Feature Flags payload with payload ID %{public}@. Ignoring. Error: %{public}@";
      v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 22;
      goto LABEL_7;
    }
  }
}

- (void)setAside
{
  v2 = [(MCNewPayloadHandler *)self payload];
  uint64_t v3 = +[MCProfileHandler payloadsOfClass:objc_opt_class() setAsideBeforePayload:v2];
  id v4 = [(id)v3 mutableCopy];

  [v4 addObject:v2];
  id v9 = 0;
  LOBYTE(v3) = [(id)objc_opt_class() _reapplyConfigurationIncludingPayloads:0 excludingPayloads:v4 error:&v9];
  id v5 = v9;
  if ((v3 & 1) == 0)
  {
    os_log_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      unsigned int v8 = [v2 UUID];
      *(_DWORD *)buf = 138543618;
      unsigned __int8 v11 = v8;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to set aside Feature Flags payload with payload ID %{public}@. Ignoring. Error: %{public}@", buf, 0x16u);
    }
  }
}

- (void)unsetAside
{
  uint64_t v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = +[MCProfileHandler payloadsOfClass:objc_opt_class() unsetAsideBeforePayload:v3];
  id v5 = [v4 mutableCopy];

  [v5 addObject:v3];
  uint64_t v6 = [(MCNewPayloadHandler *)self payload];
  id v7 = [(id)v6 profile];
  unsigned int v8 = [v7 payloadsOfKindOfClass:objc_opt_class()];
  id v9 = [v8 mutableCopy];

  [v9 removeObjectsInArray:v5];
  id v14 = 0;
  LOBYTE(v6) = [(id)objc_opt_class() _reapplyConfigurationIncludingPayloads:0 excludingPayloads:v9 error:&v14];
  id v10 = v14;
  if ((v6 & 1) == 0)
  {
    os_log_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = v11;
      id v13 = [v3 UUID];
      *(_DWORD *)buf = 138543618;
      uint32_t v16 = v13;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to restore Feature Flags payload with payload ID %{public}@. Ignoring. Error: %{public}@", buf, 0x16u);
    }
  }
}

@end