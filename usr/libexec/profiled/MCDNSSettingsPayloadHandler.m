@interface MCDNSSettingsPayloadHandler
+ (id)internalError;
+ (id)internalErrorWithUnderlyingError:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCDNSSettingsPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCDNSSettingsPayloadHandler

- (MCDNSSettingsPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDNSSettingsPayloadHandler;
  v7 = [(MCNewPayloadHandler *)&v11 initWithPayload:a3 profileHandler:v6];
  if (v7)
  {
    uint64_t v8 = [v6 profile];
    profile = v7->_profile;
    v7->_profile = (MCProfile *)v8;
  }
  return v7;
}

+ (id)internalError
{
  return [a1 internalErrorWithUnderlyingError:0];
}

+ (id)internalErrorWithUnderlyingError:(id)a3
{
  uint64_t v3 = MCDNSSettingsErrorDomain;
  id v4 = a3;
  v5 = MCErrorArray();
  id v6 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 57000, v5, v4, MCErrorTypeFatal, 0);

  return v6;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a4;
  v70 = [(MCNewPayloadHandler *)self payload];
  v10 = [v70 type];
  id v66 = objc_alloc_init((Class)NSMutableArray);
  objc_super v11 = MCNEProfileIngestionHandlerClassForPayload();
  if (!v11)
  {
    v57 = +[NSAssertionHandler currentHandler];
    [v57 handleFailureInMethod:a2, self, @"MCDNSSettingsPayloadHandler.m", 65, @"Invalid parameter not satisfying: %@", @"neProfileIngestionHandler" object file lineNumber description];
  }
  if ([v11 lockConfigurations])
  {
    [v11 loadConfigurationsForceReloadFromDisk];
    v12 = [v70 configurationDictionary];
    v13 = +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:v12];

    if (!v13)
    {
      v58 = +[NSAssertionHandler currentHandler];
      [v58 handleFailureInMethod:a2, self, @"MCDNSSettingsPayloadHandler.m", 74, @"Invalid parameter not satisfying: %@", @"payloadBase" object file lineNumber description];
    }
    [v11 createConfigurationFromPayload:v13 payloadType:v10];
    v14 = [v11 ingestedConfiguration];
    v15 = v14;
    if (!v14)
    {
      if (a6)
      {
        *a6 = [(id)objc_opt_class() internalError];
      }
      [v11 unlockConfigurations];
      unsigned __int8 v39 = 0;
      goto LABEL_61;
    }
    v60 = a6;
    v16 = [v14 getPendingCertificateInfo:v13];
    v69 = v16;
    if (v16)
    {
      v17 = v16;
      v64 = v11;
      v65 = v15;
      v61 = v10;
      v63 = v13;
      id v59 = v9;
      id v68 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v16 count]];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id obj = [v17 allKeys];
      id v18 = [obj countByEnumeratingWithState:&v80 objects:v86 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v81;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v81 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(*((void *)&v80 + 1) + 8 * i);
            v23 = [v17 objectForKeyedSubscript:v22];
            v24 = [v23 objectForKeyedSubscript:@"PayloadUUID"];
            v25 = [v23 objectForKeyedSubscript:@"AccessGroup"];
            if (v25)
            {
              id v26 = [(MCDNSSettingsPayloadHandler *)self _copyCertificateWithPayloadUUID:v24 intoKeychainAccessGroup:v25];
              if (!v26) {
                goto LABEL_19;
              }
              v27 = v26;
              v28 = [v70 UUID];
              [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v27 andUUID:v28];

              v17 = v69;
              [v66 addObject:v27];
LABEL_18:
              [v68 setObject:v27 forKey:v22];

              goto LABEL_19;
            }
            if (v24)
            {
              v29 = [(MCNewPayloadHandler *)self profileHandler];
              v27 = [v29 persistentIDForCertificateUUID:v24];

              v17 = v69;
              if (v27) {
                goto LABEL_18;
              }
            }
LABEL_19:
          }
          id v19 = [obj countByEnumeratingWithState:&v80 objects:v86 count:16];
        }
        while (v19);
      }

      id v30 = [v17 count];
      v15 = v65;
      if (v30 != [v68 count] || (objc_msgSend(v65, "setCertificates:", v68) & 1) == 0)
      {
        v10 = v61;
        v13 = v63;
        objc_super v11 = v64;
        if (v60)
        {
          uint64_t v41 = MCDNSSettingsErrorDomain;
          v42 = MCErrorArray();
          +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v41, 57001, v42, MCErrorTypeFatal, 0);
          id *v60 = (id)objc_claimAutoreleasedReturnValue();

          v15 = v65;
        }
        [v64 unlockConfigurations];
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v40 = v66;
        id v43 = [v40 countByEnumeratingWithState:&v76 objects:v85 count:16];
        id v9 = v59;
        if (!v43)
        {
          unsigned __int8 v39 = 0;
          goto LABEL_60;
        }
        id v44 = v43;
        uint64_t v45 = *(void *)v77;
        do
        {
          for (j = 0; j != v44; j = (char *)j + 1)
          {
            if (*(void *)v77 != v45) {
              objc_enumerationMutation(v40);
            }
            uint64_t v47 = *(void *)(*((void *)&v76 + 1) + 8 * (void)j);
            v48 = [v70 UUID];
            [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v47 andUUID:v48];
          }
          id v44 = [v40 countByEnumeratingWithState:&v76 objects:v85 count:16];
        }
        while (v44);
        unsigned __int8 v39 = 0;
        goto LABEL_58;
      }

      id v9 = v59;
      v10 = v61;
      v13 = v63;
      objc_super v11 = v64;
    }
    v31 = [v70 UUID];
    v32 = [v70 organization];
    [v15 setPayloadInfoCommon:v31 payloadOrganization:v32];

    id v33 = objc_alloc_init((Class)NSMutableDictionary);
    v34 = [(MCProfile *)self->_profile UUID];

    if (v34)
    {
      v35 = [(MCProfile *)self->_profile UUID];
      [v33 setObject:v35 forKeyedSubscript:kMCPayloadUUIDKey];
    }
    v36 = [(MCProfile *)self->_profile identifier];

    if (v36)
    {
      v37 = [(MCProfile *)self->_profile identifier];
      [v33 setObject:v37 forKeyedSubscript:kMCPayloadIdentifierKey];
    }
    if (v9) {
      [v33 addEntriesFromDictionary:v9];
    }
    id v68 = v33;
    [v15 setProfileInfo:v33];
    [v11 updateDefaultAfterAddingConfiguration];
    v38 = [v15 getConfigurationIdentifier];
    [v70 setPersistentResourceID:v38];

    id v75 = 0;
    unsigned __int8 v39 = [v11 saveIngestedConfiguration:&v75];
    id v40 = v75;
    if (v39)
    {
      [v11 unlockConfigurations];
LABEL_60:

LABEL_61:
      goto LABEL_62;
    }
    v65 = v15;
    v62 = v10;
    v63 = v13;
    if (v60)
    {
      id *v60 = [(id)objc_opt_class() internalErrorWithUnderlyingError:v40];
    }
    v64 = v11;
    [v11 unlockConfigurations];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v49 = v66;
    id v50 = [v49 countByEnumeratingWithState:&v71 objects:v84 count:16];
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
          uint64_t v54 = *(void *)(*((void *)&v71 + 1) + 8 * (void)k);
          v55 = [v70 UUID];
          [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v54 andUUID:v55];
        }
        id v51 = [v49 countByEnumeratingWithState:&v71 objects:v84 count:16];
      }
      while (v51);
    }

    v10 = v62;
LABEL_58:
    v13 = v63;
    objc_super v11 = v64;
    v15 = v65;
    goto LABEL_60;
  }
  if (a6)
  {
    [(id)objc_opt_class() internalError];
    unsigned __int8 v39 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v39 = 0;
  }
LABEL_62:

  return v39;
}

- (void)setAside
{
  uint64_t v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [v3 type];
  v5 = MCNEProfileIngestionHandlerClassForPayload();

  if ([v5 lockConfigurations])
  {
    [v5 loadConfigurationsForceReloadFromDisk];
    id v6 = [(MCNewPayloadHandler *)self payload];
    v7 = [v6 persistentResourceID];
    id v8 = [v5 setAsideConfigurationName:v7 unsetAside:0];

    [v5 unlockConfigurations];
  }
  else
  {
    id v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", v10, 2u);
    }
  }
}

- (void)unsetAside
{
  uint64_t v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [v3 type];
  v5 = MCNEProfileIngestionHandlerClassForPayload();

  if ([v5 lockConfigurations])
  {
    [v5 loadConfigurationsForceReloadFromDisk];
    id v6 = [(MCNewPayloadHandler *)self payload];
    v7 = [v6 persistentResourceID];
    id v8 = [v5 setAsideConfigurationName:v7 unsetAside:0];

    [v5 unlockConfigurations];
  }
  else
  {
    id v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", v10, 2u);
    }
  }
}

- (void)remove
{
  uint64_t v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [v3 persistentResourceID];

  v5 = [(MCNewPayloadHandler *)self payload];
  id v6 = [v5 type];
  v7 = MCNEProfileIngestionHandlerClassForPayload();

  if ([v7 lockConfigurations])
  {
    [v7 loadConfigurationsForceReloadFromDisk];
    if (v4)
    {
      [v7 removeConfigurationWithIdentifier:v4];
    }
    else
    {
      id v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "NetworkUsageRules remove failed: empty configuration id", buf, 2u);
      }
    }
    [v7 updateDefaultAfterDeletingConfiguration];
    [v7 unlockConfigurations];
  }
  else
  {
    id v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock. Skipping removal.", v10, 2u);
    }
  }
}

- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MCNewPayloadHandler *)self profileHandler];
  id v9 = [v8 payloadHandlerWithUUID:v6];

  if (v9)
  {
    id v23 = 0;
    id v10 = [v9 copyIdentityImmediatelyWithInteractionClient:0 outError:&v23];
    id v11 = v23;
    if (!v11 && v10) {
      goto LABEL_7;
    }
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = v6;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "DNSSettings: Failed to get the identity for UUID %{public}@: %{public}@", buf, 0x16u);
    }
    if (v10)
    {
LABEL_7:
      id v13 = [v9 accessibility:v7];
      v14 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "DNS Settings identity, storing with accessibility %@", buf, 0xCu);
      }
      v15 = [@"NE:" stringByAppendingString:v6];
      v16 = [(MCNewPayloadHandler *)self profileHandler];
      v17 = [v16 profile];
      id v7 = v22;
      id v18 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v10, v15, v22, [v17 isInstalledForSystem], v13);

      if (v18)
      {
        id v19 = [(MCNewPayloadHandler *)self payload];
        uint64_t v20 = [v19 UUID];
        [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v18 andUUID:v20];

        id v7 = v22;
      }
      CFRelease(v10);
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
}

@end