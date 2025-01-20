@interface MCCellularPrivateNetworkPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (id)_ctPrivateNetworkProfile:(id)a3;
- (id)_installPrivateNetworkProfile;
- (void)_uninstallPrivateNetworkProfile;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCCellularPrivateNetworkPayloadHandler

- (id)_ctPrivateNetworkProfile:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 dataSetName];
  [v4 setDataSetName:v5];

  v6 = [v3 versionNumber];
  [v4 setVersionNumber:v6];

  v7 = [v3 csgNetworkIdentifier];
  [v4 setCsgNetworkIdentifier:v7];

  v8 = [v3 networkIdentifier];

  [v4 setNetworkIdentifier:v8];

  return v4;
}

- (id)_installPrivateNetworkProfile
{
  id v37 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  id v3 = [(MCNewPayloadHandler *)self payload];
  v4 = [(MCCellularPrivateNetworkPayloadHandler *)self _ctPrivateNetworkProfile:v3];
  [v4 setCellularDataPreferred:[v3 cellularDataPreferred]];
  v5 = [v3 enableNRStandalone];

  if (v5)
  {
    v6 = [v3 enableNRStandalone];
    unsigned __int8 v7 = [v6 BOOLValue];

    if (v7)
    {
      uint64_t v8 = 1;
    }
    else
    {
      v9 = [v3 enableNRStandalone];
      unsigned __int8 v10 = [v9 BOOLValue];

      if (v10) {
        goto LABEL_8;
      }
      uint64_t v8 = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  [v4 setNRStandaloneMode:v8];
LABEL_8:
  v11 = +[NSMutableArray array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v12 = [v3 geofenceList];
  id v13 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v39;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v18 = objc_opt_new();
        v19 = [v17 longitude];
        [v18 setLongitude:v19];

        v20 = [v17 latitude];
        [v18 setLatitude:v20];

        v21 = [v17 radius];
        [v18 setRadius:v21];

        v22 = [v17 geofenceId];
        [v18 setGeofenceId:v22];

        [v11 addObject:v18];
      }
      id v14 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v14);
  }

  v23 = +[NSArray arrayWithArray:v11];
  [v4 setGeofenceList:v23];

  os_log_t v24 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    v26 = [v3 dataSetName];
    v27 = [v3 versionNumber];
    *(_DWORD *)buf = 138412546;
    v43 = v26;
    __int16 v44 = 2112;
    v45 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Attempting to install new private network payload %@ - %@", buf, 0x16u);
  }
  uint64_t v28 = [v37 installPrivateNetworkProfile:v4];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Installing private network payload failed with error %@", buf, 0xCu);
    }
    id v31 = [v29 code];
    uint64_t v32 = MCPrivateNetworkErrorDomain;
    v33 = +[NSNumber numberWithUnsignedInteger:v31];
    v34 = MCErrorArray();
    v35 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v32, 64000, v34, MCErrorTypeFatal, v33, 0);
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void)_uninstallPrivateNetworkProfile
{
  id v3 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  v4 = [(MCNewPayloadHandler *)self payload];
  v5 = [(MCCellularPrivateNetworkPayloadHandler *)self _ctPrivateNetworkProfile:v4];
  os_log_t v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = v6;
    uint64_t v8 = [v4 dataSetName];
    v9 = [v4 versionNumber];
    int v15 = 138412546;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempting to uninstall private network payload %@ - %@", (uint8_t *)&v15, 0x16u);
  }
  unsigned __int8 v10 = [v3 removePrivateNetworkProfile:v5];
  if (v10)
  {
    os_log_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      id v13 = [v4 dataSetName];
      id v14 = [v4 versionNumber];
      int v15 = 138412802;
      v16 = v13;
      __int16 v17 = 2112;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Uninstall private network payload %@ - %@ failed with error %@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  unsigned __int8 v7 = [(MCCellularPrivateNetworkPayloadHandler *)self _installPrivateNetworkProfile];
  uint64_t v8 = v7;
  if (a6 && v7) {
    *a6 = v7;
  }

  return v8 == 0;
}

- (void)remove
{
}

- (void)setAside
{
  id v3 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  v4 = [(MCNewPayloadHandler *)self payload];
  v5 = [(MCCellularPrivateNetworkPayloadHandler *)self _ctPrivateNetworkProfile:v4];
  os_log_t v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = v6;
    uint64_t v8 = [v4 dataSetName];
    v9 = [v4 versionNumber];
    int v15 = 138412546;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting aside private network payload %@ - %@ aside", (uint8_t *)&v15, 0x16u);
  }
  unsigned __int8 v10 = [v3 updatePrivateNetworkProfile:v5 setProfileAside:1];
  if (v10)
  {
    os_log_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      id v13 = [v4 dataSetName];
      id v14 = [v4 versionNumber];
      int v15 = 138412802;
      v16 = v13;
      __int16 v17 = 2112;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Setting aside private network payload %@ - %@ failed with error %@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)unsetAside
{
  id v3 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  v4 = [(MCNewPayloadHandler *)self payload];
  v5 = [(MCCellularPrivateNetworkPayloadHandler *)self _ctPrivateNetworkProfile:v4];
  os_log_t v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = v6;
    uint64_t v8 = [v4 dataSetName];
    v9 = [v4 versionNumber];
    int v15 = 138412546;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unsetting aside private network payload %@ - %@ aside", (uint8_t *)&v15, 0x16u);
  }
  unsigned __int8 v10 = [v3 updatePrivateNetworkProfile:v5 setProfileAside:0];
  if (v10)
  {
    os_log_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      id v13 = [v4 dataSetName];
      id v14 = [v4 versionNumber];
      int v15 = 138412802;
      v16 = v13;
      __int16 v17 = 2112;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unsetting aside private network payload %@ - %@ failed with error %@", (uint8_t *)&v15, 0x20u);
    }
  }
}

@end