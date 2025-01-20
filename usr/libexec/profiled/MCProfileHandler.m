@interface MCProfileHandler
+ (id)payloadsOfClass:(Class)a3 installedBeforePayload:(id)a4;
+ (id)payloadsOfClass:(Class)a3 removedBeforePayload:(id)a4;
+ (id)payloadsOfClass:(Class)a3 setAsideBeforePayload:(id)a4;
+ (id)payloadsOfClass:(Class)a3 unsetAsideBeforePayload:(id)a4;
+ (id)userCancelledError;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)interactionClient:(id)a3 didRequestPreflightUserInputResponses:(id)a4 forPayloadIndex:(unint64_t)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)isSetAside;
- (BOOL)preflightUserInputResponses:(id)a3 forPayloadIndex:(unint64_t)a4 outError:(id *)a5;
- (BOOL)stageForInstallationWithInstaller:(id)a3 interactionClient:(id)a4 outError:(id *)a5;
- (MCProfile)profile;
- (MCProfileHandler)initWithProfile:(id)a3;
- (NSArray)payloadHandlers;
- (id)_profileInstallationErrorWithUnderlyingError:(id)a3;
- (id)payloadHandlerWithUUID:(id)a3;
- (id)persistentIDForCertificateUUID:(id)a3;
- (id)userCancelledError;
- (id)userInputArray;
- (void)convertPayloadWithUUIDToUnknownPayload:(id)a3;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)removeWithInstaller:(id)a3 options:(id)a4;
- (void)setAsideWithInstaller:(id)a3;
- (void)unsetAside;
- (void)unstageFromInstallationWithInstaller:(id)a3;
@end

@implementation MCProfileHandler

- (id)payloadHandlerWithUUID:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_payloadHandlers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 payload:v14];
        v11 = [v10 UUID];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (MCProfileHandler)initWithProfile:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MCProfileHandler;
  id v6 = [(MCProfileHandler *)&v31 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    id v8 = objc_alloc((Class)NSMutableArray);
    v9 = [v5 payloads];
    id v10 = [v8 initWithCapacity:[v9 count]];
    id v11 = p_isa[2];
    p_isa[2] = v10;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    unsigned __int8 v12 = [v5 payloads];
    id v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v18 = [v17 handlerWithProfileHandler:p_isa];
          if (!v18)
          {
            os_log_t v21 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              v22 = v21;
              v23 = objc_opt_class();
              id v24 = v23;
              v25 = [v17 friendlyName];
              *(_DWORD *)buf = 138543618;
              v33 = v23;
              __int16 v34 = 2114;
              v35 = v25;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@ Cannot instantiate a payload handler for payload “%{public}@”.", buf, 0x16u);
            }
            v20 = 0;
            goto LABEL_15;
          }
          v19 = (void *)v18;
          [p_isa[2] addObject:v18];
        }
        id v14 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
  v20 = p_isa;
LABEL_15:

  return v20;
}

+ (id)userCancelledError
{
  uint64_t v2 = MCInstallationErrorDomain;
  v3 = MCErrorArray();
  id v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4004, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)userCancelledError
{
  uint64_t v2 = MCInstallationErrorDomain;
  v3 = [(MCProfileHandler *)self profile];
  id v4 = [v3 friendlyName];
  id v5 = MCErrorArray();
  id v6 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4004, v5, MCErrorTypeFatal, v4, 0);

  return v6;
}

- (id)_profileInstallationErrorWithUnderlyingError:(id)a3
{
  uint64_t v4 = MCProfileErrorDomain;
  id v5 = a3;
  id v6 = [(MCProfileHandler *)self profile];
  uint64_t v7 = [v6 friendlyName];
  id v8 = MCErrorArray();
  v9 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 1009, v8, v5, MCErrorTypeFatal, v7, 0);

  return v9;
}

- (BOOL)stageForInstallationWithInstaller:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v63 = v9;
  id v64 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_payloadHandlers, "count")];
  v70 = self;
  v62 = a5;
  if (v9)
  {
    v65 = +[NSMutableArray arrayWithCapacity:[(NSMutableArray *)self->_payloadHandlers count]];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v10 = self->_payloadHandlers;
    id v67 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v85 objects:v96 count:16];
    if (v67)
    {
      id v61 = v8;
      char v11 = 0;
      uint64_t v66 = *(void *)v86;
      uint64_t v12 = kMCIDFinePrintKey;
      uint64_t v13 = kMCIDFlagsKey;
      id v14 = v65;
      do
      {
        for (i = 0; i != v67; i = (char *)i + 1)
        {
          if (*(void *)v86 != v66) {
            objc_enumerationMutation(v10);
          }
          long long v16 = [*(id *)(*((void *)&v85 + 1) + 8 * i) userInputFields];
          if ([v16 count])
          {
            v68 = v16;
            v69 = i;
            long long v83 = 0u;
            long long v84 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            id v17 = v16;
            id v18 = [v17 countByEnumeratingWithState:&v81 objects:v95 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v82;
              do
              {
                for (j = 0; j != v19; j = (char *)j + 1)
                {
                  if (*(void *)v82 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  v22 = *(void **)(*((void *)&v81 + 1) + 8 * (void)j);
                  v23 = [v22 objectForKey:v12];

                  if (!v23)
                  {
                    id v24 = [v22 objectForKey:v13];
                    [v24 intValue];

                    v60 = [(MCProfile *)v70->_profile friendlyName];
                    v25 = MCLocalizedFormat();

                    [v22 setObject:v25 forKey:v12];
                  }
                }
                id v19 = [v17 countByEnumeratingWithState:&v81 objects:v95 count:16];
              }
              while (v19);
            }

            char v11 = 1;
            id v14 = v65;
            long long v16 = v68;
            i = v69;
          }
          [v14 addObject:v16];
        }
        id v67 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v85 objects:v96 count:16];
      }
      while (v67);

      id v8 = v61;
      v26 = v62;
      id v9 = v63;
      self = v70;
      if ((v11 & 1) == 0) {
        goto LABEL_27;
      }
      id v80 = 0;
      unsigned int v27 = [v63 requestUserInput:v65 delegate:v70 outResult:&v80];
      long long v28 = (NSMutableArray *)v80;
      id v10 = v28;
      if (!v27 || (id v29 = -[NSMutableArray count](v28, "count"), v29 != [v65 count]))
      {
        v44 = [(MCProfileHandler *)v70 userCancelledError];

        id v38 = v65;
LABEL_42:

        if (v44)
        {
          os_log_t v45 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v46 = v45;
            v47 = [(MCProfileHandler *)v70 profile];
            v48 = [v47 identifier];
            *(_DWORD *)buf = 138543362;
            v90 = v48;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Rolling back staging of profile “%{public}@”...", buf, 0xCu);
          }
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v49 = v64;
          id v50 = [v49 countByEnumeratingWithState:&v71 objects:v93 count:16];
          if (v50)
          {
            id v51 = v50;
            uint64_t v52 = *(void *)v72;
            do
            {
              for (k = 0; k != v51; k = (char *)k + 1)
              {
                if (*(void *)v72 != v52) {
                  objc_enumerationMutation(v49);
                }
                [*(id *)(*((void *)&v71 + 1) + 8 * (void)k) unstageFromInstallationWithInstaller:v8];
              }
              id v51 = [v49 countByEnumeratingWithState:&v71 objects:v93 count:16];
            }
            while (v51);
          }

          os_log_t v54 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v55 = v54;
            v56 = [(MCProfileHandler *)v70 profile];
            v57 = [v56 identifier];
            v58 = [v44 MCVerboseDescription];
            *(_DWORD *)buf = 138543618;
            v90 = v57;
            __int16 v91 = 2114;
            v92 = v58;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Installation of profile “%{public}@” failed with error: %{public}@", buf, 0x16u);
          }
          if (v26) {
            id *v26 = v44;
          }
        }
        goto LABEL_56;
      }
      if ([(NSMutableArray *)v70->_payloadHandlers count])
      {
        uint64_t v30 = 0;
        unsigned int v31 = 1;
        do
        {
          v32 = [(NSMutableArray *)v70->_payloadHandlers objectAtIndex:v30];
          v33 = [(NSMutableArray *)v10 objectAtIndex:v30];
          [v32 setUserInputResponses:v33];

          uint64_t v30 = v31;
        }
        while ((unint64_t)[(NSMutableArray *)v70->_payloadHandlers count] > v31++);
      }
    }

LABEL_27:
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v35 = self->_payloadHandlers;
  id v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v76 objects:v94 count:16];
  if (!v36)
  {
    id v38 = 0;
LABEL_40:

    v44 = 0;
LABEL_41:
    v26 = v62;
    goto LABEL_42;
  }
  id v37 = v36;
  id v38 = 0;
  uint64_t v39 = *(void *)v77;
LABEL_30:
  v40 = 0;
  v41 = v38;
  while (1)
  {
    if (*(void *)v77 != v39) {
      objc_enumerationMutation(v35);
    }
    v42 = *(void **)(*((void *)&v76 + 1) + 8 * (void)v40);
    id v75 = v41;
    unsigned int v43 = [v42 stageForInstallationWithInstaller:v8 interactionClient:v9 outError:&v75];
    id v38 = v75;

    if (!v43) {
      break;
    }
    [v64 insertObject:v42 atIndex:0];
    v40 = (char *)v40 + 1;
    v41 = v38;
    if (v37 == v40)
    {
      id v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v76 objects:v94 count:16];
      if (v37) {
        goto LABEL_30;
      }
      goto LABEL_40;
    }
  }

  if (v38)
  {
    v44 = [(MCProfileHandler *)v70 _profileInstallationErrorWithUnderlyingError:v38];
    goto LABEL_41;
  }
  v44 = 0;
LABEL_56:

  return v44 == 0;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v59 = a5;
  id v61 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_payloadHandlers, "count")];
  id v60 = [(NSMutableArray *)self->_payloadHandlers mutableCopy];
  uint64_t v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  UUIDToPersistentIDMap = self->_UUIDToPersistentIDMap;
  self->_UUIDToPersistentIDMap = v12;

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v14 = self->_payloadHandlers;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v72 objects:v82 count:16];
  id v58 = v11;
  if (v15)
  {
    id v16 = v15;
    v57 = self;
    v56 = a6;
    id v17 = 0;
    uint64_t v18 = *(void *)v73;
LABEL_3:
    id v19 = 0;
    uint64_t v20 = v17;
    while (1)
    {
      if (*(void *)v73 != v18) {
        objc_enumerationMutation(v14);
      }
      os_log_t v21 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v19);
      v22 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v77 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Installing payload handler: %{public}@", buf, 0xCu);
      }
      id v71 = v20;
      unsigned int v23 = [v21 installWithInstaller:v10 options:v11 interactionClient:v59 outError:&v71];
      id v17 = v71;

      if (!v23) {
        break;
      }
      [v61 insertObject:v21 atIndex:0];
      [v60 removeObject:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = [v21 payload];
        v25 = v57->_UUIDToPersistentIDMap;
        v26 = [v24 certificatePersistentID];
        unsigned int v27 = [v24 UUID];
        [(NSMutableDictionary *)v25 setObject:v26 forKey:v27];

        id v11 = v58;
      }
      id v19 = (char *)v19 + 1;
      uint64_t v20 = v17;
      if (v16 == v19)
      {
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v72 objects:v82 count:16];
        if (v16) {
          goto LABEL_3;
        }
        break;
      }
    }

    a6 = v56;
    self = v57;
    if (v17)
    {
      id v28 = [(MCProfileHandler *)v57 _profileInstallationErrorWithUnderlyingError:v17];
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v17 = [(MCProfileHandler *)self profile];
  if ([v17 isLocked]
    && ([v17 removalPasscode], id v29 = objc_claimAutoreleasedReturnValue(), v29, v29))
  {
    uint64_t v30 = [v17 removalPasscode];
    uint64_t v31 = kMCProfileRemovalPasscodeService;
    v32 = [v17 UUID];
    id v33 = [v17 isInstalledForSystem];
    id v70 = 0;
    uint64_t v34 = v31;
    id v11 = v58;
    +[MCKeychain setString:v30 forService:v34 account:v32 label:0 description:0 useSystemKeychain:v33 outError:&v70];
    id v28 = v70;
  }
  else
  {
    id v28 = 0;
  }
LABEL_20:

  v35 = self->_UUIDToPersistentIDMap;
  self->_UUIDToPersistentIDMap = 0;

  if (v28)
  {
    os_log_t v36 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v37 = v36;
      id v38 = [(MCProfileHandler *)self profile];
      uint64_t v39 = [v38 identifier];
      *(_DWORD *)buf = 138543362;
      long long v77 = v39;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Rolling back installation of profile “%{public}@”...", buf, 0xCu);
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v40 = v61;
    id v41 = [v40 countByEnumeratingWithState:&v66 objects:v81 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v67;
      do
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(void *)v67 != v43) {
            objc_enumerationMutation(v40);
          }
          [*(id *)(*((void *)&v66 + 1) + 8 * i) remove];
        }
        id v42 = [v40 countByEnumeratingWithState:&v66 objects:v81 count:16];
      }
      while (v42);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v45 = v60;
    id v46 = [v45 countByEnumeratingWithState:&v62 objects:v80 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v63;
      do
      {
        for (j = 0; j != v47; j = (char *)j + 1)
        {
          if (*(void *)v63 != v48) {
            objc_enumerationMutation(v45);
          }
          [*(id *)(*((void *)&v62 + 1) + 8 * (void)j) unstageFromInstallationWithInstaller:v10];
        }
        id v47 = [v45 countByEnumeratingWithState:&v62 objects:v80 count:16];
      }
      while (v47);
    }

    os_log_t v50 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v51 = v50;
      uint64_t v52 = [(MCProfileHandler *)self profile];
      v53 = [v52 identifier];
      os_log_t v54 = [v28 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      long long v77 = v53;
      __int16 v78 = 2114;
      long long v79 = v54;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Installation of profile “%{public}@” failed with error: %{public}@", buf, 0x16u);
    }
    id v11 = v58;
    if (a6) {
      *a6 = v28;
    }
  }

  return v28 == 0;
}

- (void)unstageFromInstallationWithInstaller:(id)a3
{
  id v4 = a3;
  os_log_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    uint64_t v7 = [(MCProfileHandler *)self profile];
    id v8 = [v7 identifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unstaging profile “%{public}@”...", buf, 0xCu);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = self->_payloadHandlers;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) unstageFromInstallationWithInstaller:v4];
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MCProfileHandler *)self profile];
  id v9 = +[NSDate date];
  [v8 setInstallDate:v9];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_payloadHandlers;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) didInstallOldGlobalRestrictions:v6 newGlobalRestrictions:v7];
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_payloadHandlers;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) didRemoveOldGlobalRestrictions:v6 newGlobalRestrictions:v7];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)isInstalled
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = self->_payloadHandlers;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    int v6 = 1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v6 &= [v8 isInstalled:v11];
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4 = a3;
  os_log_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    int v6 = v5;
    id v7 = [(MCProfileHandler *)self profile];
    id v8 = [v7 identifier];
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Profile “%{public}@” being set aside.", buf, 0xCu);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = self->_payloadHandlers;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v13);
        [v14 setAsideWithInstaller:v4, v16];
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  self->_isSetAside = 1;
}

- (void)unsetAside
{
  os_log_t v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    id v4 = v3;
    os_log_t v5 = [(MCProfileHandler *)self profile];
    int v6 = [v5 identifier];
    int v11 = 138543362;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Profile “%{public}@” being unset aside.", (uint8_t *)&v11, 0xCu);
  }
  int v7 = [(NSMutableArray *)self->_payloadHandlers count];
  if (v7 >= 1)
  {
    unint64_t v8 = v7 + 1;
    do
    {
      id v10 = [(NSMutableArray *)self->_payloadHandlers objectAtIndex:(v8 - 2)];
      [v10 unsetAside];

      --v8;
    }
    while (v8 > 1);
  }
}

- (void)removeWithInstaller:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    id v9 = v8;
    id v10 = [(MCProfileHandler *)self profile];
    int v11 = [v10 identifier];
    int v20 = 138543362;
    os_log_t v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Profile “%{public}@” being removed.", (uint8_t *)&v20, 0xCu);
  }
  int v12 = [(NSMutableArray *)self->_payloadHandlers count];
  if (v12 >= 1)
  {
    unint64_t v13 = v12 + 1;
    do
    {
      long long v15 = [(NSMutableArray *)self->_payloadHandlers objectAtIndex:(v13 - 2)];
      [v15 removeWithInstaller:v6 options:v7];

      --v13;
    }
    while (v13 > 1);
  }
  long long v16 = [(MCProfileHandler *)self profile];
  if ([v16 isLocked])
  {
    long long v17 = [v16 removalPasscode];

    if (v17)
    {
      uint64_t v18 = kMCProfileRemovalPasscodeService;
      long long v19 = [v16 UUID];
      +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", v18, v19, 0, 0, [v16 isInstalledForSystem], 0);
    }
  }
}

- (void)convertPayloadWithUUIDToUnknownPayload:(id)a3
{
  id v16 = a3;
  if ([(NSMutableArray *)self->_payloadHandlers count])
  {
    uint64_t v4 = 0;
    unsigned int v5 = 1;
    do
    {
      id v6 = [(NSMutableArray *)self->_payloadHandlers objectAtIndex:v4];
      id v7 = [v6 payload];
      os_log_t v8 = [v7 UUID];
      unsigned int v9 = [v8 isEqualToString:v16];

      if (v9)
      {
        id v11 = objc_alloc((Class)MCUnknownPayload);
        int v12 = [v6 payload];
        id v13 = [v11 initWithContentsOfPayload:v12 profile:self->_profile];

        [(MCProfile *)self->_profile replacePayloadWithUUID:v16 withPayload:v13];
        long long v14 = [v13 handlerWithProfileHandler:self];
        [(NSMutableArray *)self->_payloadHandlers setObject:v14 atIndexedSubscript:v4];

        [v6 remove];
      }

      uint64_t v4 = v5;
    }
    while ((unint64_t)[(NSMutableArray *)self->_payloadHandlers count] > v5++);
  }
}

+ (id)payloadsOfClass:(Class)a3 installedBeforePayload:(id)a4
{
  id v4 = a4;
  unsigned int v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v4 profile];
  id v7 = [v6 payloads];

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(id *)(*((void *)&v14 + 1) + 8 * v11);
      if (v12 == v4) {
        break;
      }
      if (objc_opt_isKindOfClass()) {
        [v5 addObject:v12];
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v5;
}

+ (id)payloadsOfClass:(Class)a3 removedBeforePayload:(id)a4
{
  id v4 = a4;
  unsigned int v5 = +[NSMutableArray array];
  id v6 = [v4 profile];
  id v7 = [v6 payloads];
  int v8 = [v7 count];

  if (v8 >= 1)
  {
    uint64_t v9 = v8 + 1;
    while (1)
    {
      uint64_t v10 = [v4 profile];
      uint64_t v11 = [v10 payloads];
      id v12 = [v11 objectAtIndexedSubscript:(v9 - 2)];

      if (v12 == v4) {
        break;
      }
      if (objc_opt_isKindOfClass()) {
        [v5 addObject:v12];
      }

      if ((unint64_t)--v9 <= 1) {
        goto LABEL_9;
      }
    }
  }
LABEL_9:

  return v5;
}

+ (id)payloadsOfClass:(Class)a3 setAsideBeforePayload:(id)a4
{
  id v4 = a4;
  unsigned int v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v4 profile];
  id v7 = [v6 payloads];

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(id *)(*((void *)&v14 + 1) + 8 * v11);
      if (v12 == v4) {
        break;
      }
      if (objc_opt_isKindOfClass()) {
        [v5 addObject:v12];
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v5;
}

+ (id)payloadsOfClass:(Class)a3 unsetAsideBeforePayload:(id)a4
{
  id v4 = a4;
  unsigned int v5 = +[NSMutableArray array];
  id v6 = [v4 profile];
  id v7 = [v6 payloads];
  int v8 = [v7 count];

  if (v8 >= 1)
  {
    uint64_t v9 = v8 + 1;
    while (1)
    {
      uint64_t v10 = [v4 profile];
      uint64_t v11 = [v10 payloads];
      id v12 = [v11 objectAtIndexedSubscript:(v9 - 2)];

      if (v12 == v4) {
        break;
      }
      if (objc_opt_isKindOfClass()) {
        [v5 addObject:v12];
      }

      if ((unint64_t)--v9 <= 1) {
        goto LABEL_9;
      }
    }
  }
LABEL_9:

  return v5;
}

- (id)userInputArray
{
  return 0;
}

- (BOOL)preflightUserInputResponses:(id)a3 forPayloadIndex:(unint64_t)a4 outError:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_payloadHandlers count] <= a4)
  {
    uint64_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Received preflight request with out-of-bounds payload index.", v13, 2u);
    }
    unsigned __int8 v10 = 0;
  }
  else
  {
    uint64_t v9 = [(NSMutableArray *)self->_payloadHandlers objectAtIndex:a4];
    unsigned __int8 v10 = [v9 preflightUserInputResponses:v8 outError:a5];
  }
  return v10;
}

- (id)persistentIDForCertificateUUID:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKey:](self->_UUIDToPersistentIDMap, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)interactionClient:(id)a3 didRequestPreflightUserInputResponses:(id)a4 forPayloadIndex:(unint64_t)a5 outError:(id *)a6
{
  return [(MCProfileHandler *)self preflightUserInputResponses:a4 forPayloadIndex:a5 outError:a6];
}

- (MCProfile)profile
{
  return self->_profile;
}

- (BOOL)isSetAside
{
  return self->_isSetAside;
}

- (NSArray)payloadHandlers
{
  return &self->_payloadHandlers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDToPersistentIDMap, 0);
  objc_storeStrong((id *)&self->_payloadHandlers, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end