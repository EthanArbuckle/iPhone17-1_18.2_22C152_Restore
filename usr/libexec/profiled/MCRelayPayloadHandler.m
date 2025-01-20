@interface MCRelayPayloadHandler
+ (id)internalError;
+ (id)internalErrorWithUnderlyingError:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCRelayPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCRelayPayloadHandler

- (MCRelayPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCRelayPayloadHandler;
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
  uint64_t v3 = MCRelayErrorDomain;
  id v4 = a3;
  v5 = MCErrorArray();
  id v6 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 61000, v5, v4, MCErrorTypeFatal, 0);

  return v6;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a4;
  v10 = [(MCNewPayloadHandler *)self payload];
  objc_super v11 = [v10 type];
  id v85 = objc_alloc_init((Class)NSMutableArray);
  v12 = [v10 relayUUID];
  if (v12)
  {

    goto LABEL_6;
  }
  v13 = +[MDMConfiguration sharedConfiguration];
  unsigned int v14 = [v13 isUserEnrollment];

  if (!v14)
  {
LABEL_6:
    v17 = MCNEProfileIngestionHandlerClassForPayload();
    if (!v17)
    {
      v76 = +[NSAssertionHandler currentHandler];
      [v76 handleFailureInMethod:a2, self, @"MCRelayPayloadHandler.m", 79, @"Invalid parameter not satisfying: %@", @"neProfileIngestionHandler" object file lineNumber description];
    }
    if (([v17 lockConfigurations] & 1) == 0)
    {
      if (a6)
      {
        id v51 = [(id)objc_opt_class() internalError];
        v52 = a6;
        LOBYTE(a6) = 0;
        id *v52 = v51;
      }
      goto LABEL_78;
    }
    [v17 loadConfigurationsForceReloadFromDisk];
    v18 = [v10 configurationDictionary];
    v19 = +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:v18];

    if (!v19)
    {
      v77 = +[NSAssertionHandler currentHandler];
      [v77 handleFailureInMethod:a2, self, @"MCRelayPayloadHandler.m", 88, @"Invalid parameter not satisfying: %@", @"payloadBase" object file lineNumber description];

      v19 = 0;
    }
    [v17 createConfigurationFromPayload:v19 payloadType:v11];
    v20 = [v17 ingestedConfiguration];
    v21 = v20;
    if (!v20)
    {
      if (a6)
      {
        *a6 = [(id)objc_opt_class() internalError];
      }
      [v17 unlockConfigurations];
      LOBYTE(a6) = 0;
      goto LABEL_77;
    }
    v82 = v19;
    v22 = [v20 getPendingCertificateInfo:v19];
    v83 = v21;
    v88 = v22;
    v89 = self;
    if (v22)
    {
      v23 = v22;
      v78 = a6;
      id v79 = v9;
      v80 = v17;
      v81 = v11;
      v84 = v10;
      id v87 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v22 count]];
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id obj = [v23 allKeys];
      id v24 = [obj countByEnumeratingWithState:&v100 objects:v106 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v101;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v101 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = *(void *)(*((void *)&v100 + 1) + 8 * i);
            v29 = [v23 objectForKeyedSubscript:v28];
            v30 = [v29 objectForKeyedSubscript:@"PayloadUUID"];
            v31 = [v29 objectForKeyedSubscript:@"AccessGroup"];
            if (v31)
            {
              id v32 = [(MCRelayPayloadHandler *)self _copyCertificateWithPayloadUUID:v30 intoKeychainAccessGroup:v31];
              if (!v32) {
                goto LABEL_24;
              }
              v33 = v32;
              v34 = [v84 UUID];
              [(MCNewPayloadHandler *)v89 _retainDependencyBetweenPersistentID:v33 andUUID:v34];

              self = v89;
              [v85 addObject:v33];
LABEL_23:
              [v87 setObject:v33 forKey:v28];

              goto LABEL_24;
            }
            if (v30)
            {
              v35 = [(MCNewPayloadHandler *)self profileHandler];
              v33 = [v35 persistentIDForCertificateUUID:v30];

              self = v89;
              if (v33) {
                goto LABEL_23;
              }
            }
LABEL_24:

            v23 = v88;
          }
          id v25 = [obj countByEnumeratingWithState:&v100 objects:v106 count:16];
        }
        while (v25);
      }

      id v36 = [v23 count];
      v21 = v83;
      if (v36 != [v87 count] || (objc_msgSend(v83, "setCertificates:", v87) & 1) == 0)
      {
        id v9 = v79;
        v17 = v80;
        v10 = v84;
        objc_super v11 = v81;
        if (v78)
        {
          uint64_t v53 = MCRelayErrorDomain;
          v54 = MCErrorArray();
          +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v53, 61001, v54, MCErrorTypeFatal, 0);
          id *v78 = (id)objc_claimAutoreleasedReturnValue();
        }
        [v80 unlockConfigurations];
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v50 = v85;
        id v55 = [v50 countByEnumeratingWithState:&v96 objects:v105 count:16];
        if (v55)
        {
          id v56 = v55;
          uint64_t v57 = *(void *)v97;
          do
          {
            for (j = 0; j != v56; j = (char *)j + 1)
            {
              if (*(void *)v97 != v57) {
                objc_enumerationMutation(v50);
              }
              uint64_t v59 = *(void *)(*((void *)&v96 + 1) + 8 * (void)j);
              v60 = [v84 UUID];
              [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v59 andUUID:v60];
            }
            id v56 = [v50 countByEnumeratingWithState:&v96 objects:v105 count:16];
          }
          while (v56);
          LOBYTE(a6) = 0;
LABEL_73:
          v17 = v80;
          objc_super v11 = v81;
          goto LABEL_74;
        }
LABEL_62:
        LOBYTE(a6) = 0;
LABEL_74:
        v19 = v82;
        goto LABEL_75;
      }

      id v9 = v79;
      v17 = v80;
      v10 = v84;
      objc_super v11 = v81;
      a6 = v78;
    }
    v37 = [v10 UUID];
    v38 = [v10 organization];
    [v21 setPayloadInfoCommon:v37 payloadOrganization:v38];

    uint64_t v39 = [v10 relayUUID];
    if (!v39
      || (v40 = (void *)v39,
          [v10 relayUUID],
          v41 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v42 = [v21 setPerAppUUID:v41 andSafariDomains:0],
          v41,
          v40,
          (v42 & 1) != 0))
    {
      if ((objc_msgSend(v21, "setRestrictDomains:", objc_msgSend(v10, "restrictDomains")) & 1) == 0)
      {
        v61 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "Could not set relay domain restrictions", buf, 2u);
        }
        uint64_t v62 = MCRelayErrorDomain;
        id v87 = [(MCNewPayloadHandler *)self payload];
        id v50 = [v87 displayName];
        v63 = MCErrorArray();
        v64 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v62, 61002, v63, MCErrorTypeFatal, v50, 0);
        LOBYTE(a6) = v64 != 0;

        goto LABEL_74;
      }
      id v43 = objc_alloc_init((Class)NSMutableDictionary);
      v44 = [(MCProfile *)self->_profile UUID];

      if (v44)
      {
        v45 = [(MCProfile *)self->_profile UUID];
        [v43 setObject:v45 forKeyedSubscript:kMCPayloadUUIDKey];
      }
      id v87 = v43;
      v46 = [(MCProfile *)self->_profile identifier];

      if (v46)
      {
        v47 = [(MCProfile *)self->_profile identifier];
        [v43 setObject:v47 forKeyedSubscript:kMCPayloadIdentifierKey];
      }
      v48 = a6;
      if (v9) {
        [v87 addEntriesFromDictionary:v9];
      }
      [v21 setProfileInfo:v87];
      [v17 updateDefaultAfterAddingConfiguration];
      v49 = [v21 getConfigurationIdentifier];
      [v10 setPersistentResourceID:v49];

      id v94 = 0;
      LOBYTE(a6) = [v17 saveIngestedConfiguration:&v94];
      id v50 = v94;
      v19 = v82;
      if (a6)
      {
        [v17 unlockConfigurations];
LABEL_75:

        v21 = v83;
LABEL_76:

LABEL_77:
LABEL_78:

        goto LABEL_79;
      }
      v81 = v11;
      if (v48)
      {
        id *v48 = [(id)objc_opt_class() internalErrorWithUnderlyingError:v50];
      }
      v80 = v17;
      [v17 unlockConfigurations];
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v68 = v85;
      id v69 = [v68 countByEnumeratingWithState:&v90 objects:v104 count:16];
      if (v69)
      {
        id v70 = v69;
        uint64_t v71 = *(void *)v91;
        do
        {
          for (k = 0; k != v70; k = (char *)k + 1)
          {
            if (*(void *)v91 != v71) {
              objc_enumerationMutation(v68);
            }
            uint64_t v73 = *(void *)(*((void *)&v90 + 1) + 8 * (void)k);
            v74 = [v10 UUID];
            [(MCNewPayloadHandler *)v89 _releaseDependencyBetweenPersistentID:v73 andUUID:v74];
          }
          id v70 = [v68 countByEnumeratingWithState:&v90 objects:v104 count:16];
        }
        while (v70);
      }

      goto LABEL_73;
    }
    v65 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Could not configure relay UUID", buf, 2u);
    }
    if (!a6)
    {
      v19 = v82;
      goto LABEL_76;
    }
    uint64_t v66 = MCRelayErrorDomain;
    id v87 = [(MCNewPayloadHandler *)self payload];
    id v50 = [v87 displayName];
    v67 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v66, 61002, v67, MCErrorTypeFatal, v50, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_62;
  }
  if (a6)
  {
    uint64_t v15 = MCRelayErrorDomain;
    v16 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, 61003, v16, MCErrorTypeFatal, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a6) = 0;
  }
LABEL_79:

  return (char)a6;
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
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Relay remove failed: empty configuration id", buf, 2u);
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
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Relay: Failed to get the identity for UUID %{public}@: %{public}@", buf, 0x16u);
    }
    if (v10)
    {
LABEL_7:
      id v13 = [v9 accessibility:v7];
      unsigned int v14 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Relay identity, storing with accessibility %@", buf, 0xCu);
      }
      uint64_t v15 = [@"NE:" stringByAppendingString:v6];
      v16 = [(MCNewPayloadHandler *)self profileHandler];
      v17 = [v16 profile];
      id v7 = v22;
      v18 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v10, v15, v22, [v17 isInstalledForSystem], v13);

      if (v18)
      {
        v19 = [(MCNewPayloadHandler *)self payload];
        v20 = [v19 UUID];
        [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v18 andUUID:v20];

        id v7 = v22;
      }
      CFRelease(v10);
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
}

@end