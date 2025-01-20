@interface MCCellularPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (NSDictionary)setAsideDictionary;
- (void)remove;
- (void)setAside;
- (void)setSetAsideDictionary:(id)a3;
- (void)unsetAside;
@end

@implementation MCCellularPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  if (MCCTHasCellular())
  {
    uint64_t v36 = 0;
    MCCTGetManagedCellularProfile();
    id v8 = 0;
    if (v8)
    {
      uint64_t v9 = MCCellularErrorDomain;
      v10 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v9, 36000, v10, MCErrorTypeFatal, 0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = [(MCNewPayloadHandler *)self payload];
      v14 = +[NSMutableDictionary dictionary];
      v15 = [v10 attachAPN];
      v16 = v15;
      if (v15)
      {
        v17 = [v15 telephonyRepresentation];
        [v14 setObject:v17 forKeyedSubscript:@"AttachAPN"];
      }
      v18 = [v10 APNs];
      id v19 = [v18 count];

      if (v19)
      {
        v29 = v16;
        v20 = [v10 APNs];
        v21 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v20 count]);

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v22 = [v10 APNs];
        id v23 = [v22 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v33;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v33 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = [*(id *)(*((void *)&v32 + 1) + 8 * i) telephonyRepresentation];
              [v21 addObject:v27];
            }
            id v24 = [v22 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v24);
        }

        [v14 setObject:v21 forKeyedSubscript:@"APNs"];
        v16 = v29;
      }
      uint64_t v31 = 0;
      MCCTSetManagedCellularProfile();
      id v11 = 0;
    }
    BOOL v13 = v11 != 0;
    if (a6 && v11)
    {
      id v11 = v11;
      *a6 = v11;
      BOOL v13 = 1;
    }
  }
  else
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "APN payload was skipped because this device is not compatible with it.", buf, 2u);
    }
    BOOL v13 = 0;
    id v11 = 0;
  }

  return !v13;
}

- (void)setAside
{
  int v3 = MCCTGetManagedCellularProfile();
  id v4 = 0;
  id v5 = 0;
  if (v3)
  {
    [(MCCellularPayloadHandler *)self setSetAsideDictionary:v4];
  }
  else
  {
    os_log_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      id v8 = [v5 MCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not set aside managed cellular settings. Error: %{public}@", buf, 0xCu);
    }
  }
  MCCTClearManagedCellularProfile();
}

- (void)unsetAside
{
  int v3 = [(MCCellularPayloadHandler *)self setAsideDictionary];

  if (v3)
  {
    id v4 = [(MCCellularPayloadHandler *)self setAsideDictionary];
    MCCTSetManagedCellularProfile();
  }
}

- (void)remove
{
  v2 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v3 = [v2 isSetAside];

  if ((v3 & 1) == 0)
  {
    char v4 = MCCTClearManagedCellularProfile();
    id v5 = 0;
    if ((v4 & 1) == 0)
    {
      os_log_t v6 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v7 = v6;
        id v8 = [v5 MCVerboseDescription];
        *(_DWORD *)buf = 138543362;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not clear managed cellular settings. Ignoring. Error: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (NSDictionary)setAsideDictionary
{
  return self->_setAsideDictionary;
}

- (void)setSetAsideDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end