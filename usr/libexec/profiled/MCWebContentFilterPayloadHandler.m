@interface MCWebContentFilterPayloadHandler
+ (id)internalError;
+ (id)internalErrorWithUnderlyingError:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4 personaID:(id)a5;
- (void)_installDependency;
- (void)_removeDependency;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCWebContentFilterPayloadHandler

- (void)_installDependency
{
  id v8 = +[MCDependencyManager sharedManager];
  v3 = [(MCNewPayloadHandler *)self payload];
  v4 = [v3 UUID];
  v5 = [(MCNewPayloadHandler *)self profileHandler];
  v6 = [v5 profile];
  v7 = [v6 identifier];
  [v8 addDependent:v4 ofParent:v7 inDomain:kMCDMProfileWithWebContentFilterToPayloadUUIDDependencyKey];
}

- (void)_removeDependency
{
  id v8 = +[MCDependencyManager sharedManager];
  v3 = [(MCNewPayloadHandler *)self payload];
  v4 = [v3 UUID];
  v5 = [(MCNewPayloadHandler *)self profileHandler];
  v6 = [v5 profile];
  v7 = [v6 identifier];
  [v8 removeDependent:v4 fromParent:v7 inDomain:kMCDMProfileWithWebContentFilterToPayloadUUIDDependencyKey];
}

+ (id)internalError
{
  return [a1 internalErrorWithUnderlyingError:0];
}

+ (id)internalErrorWithUnderlyingError:(id)a3
{
  uint64_t v3 = MCWebContentFilterErrorDomain;
  id v4 = a3;
  v5 = MCErrorArray();
  v6 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 40000, v5, v4, MCErrorTypeFatal, 0);

  return v6;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v79 = a3;
  id v81 = a4;
  id v80 = a5;
  v89 = self;
  v88 = [(MCNewPayloadHandler *)self payload];
  id v82 = objc_alloc_init((Class)NSMutableArray);
  v11 = [v88 contentFilterUUID];
  if (v11)
  {
  }
  else
  {
    v12 = +[MDMCloudConfiguration sharedConfiguration];
    unsigned __int8 v13 = [v12 isSupervised];

    if ((v13 & 1) == 0)
    {
      if (a6)
      {
        v29 = MCErrorArray();
        +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCWebContentFilterErrorDomain, 40003, v29, MCErrorTypeFatal, 0);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_72;
    }
  }
  v14 = [v88 filterType];
  unsigned int v15 = [v14 isEqualToString:kMCWebContentFilterTypePlugin];

  if (!v15)
  {
    [(MCWebContentFilterPayloadHandler *)self _installDependency];
LABEL_12:
    BOOL v27 = 1;
    goto LABEL_73;
  }
  v16 = +[MCWebContentFilterPayload typeStrings];
  v17 = [v16 firstObject];
  v77 = MCNEProfileIngestionHandlerClassForPayload();

  v18 = v77;
  if (([v77 lockConfigurations] & 1) == 0)
  {
    v28 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", buf, 2u);
    }
    if (a6)
    {
      +[MCWebContentFilterPayloadHandler internalError];
      v18 = v77;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_72;
  }
  [v77 loadConfigurationsForceReloadFromDisk];
  v19 = [v88 pluginConfiguration];
  v75 = +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:v19];

  v20 = +[MCWebContentFilterPayload typeStrings];
  v21 = [v20 firstObject];
  [v77 createConfigurationFromPayload:v75 payloadType:v21];

  v22 = [v77 ingestedConfiguration];
  v76 = v22;
  if (!v22)
  {
    id v30 = +[MCWebContentFilterPayloadHandler internalError];
    goto LABEL_61;
  }
  v86 = [v22 getPendingCertificateInfo:v75];
  if (v86)
  {
    v23 = [v81 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
    unsigned int v24 = [v23 BOOLValue];

    if (v24)
    {
      uint64_t v25 = kMDMPersonaKey;
      v26 = [v81 objectForKeyedSubscript:kMDMPersonaKey];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v87 = [v81 objectForKeyedSubscript:v25];
      }
      else
      {
        v87 = 0;
      }
    }
    else
    {
      v87 = 0;
    }
    id v84 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(v86, "count")];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id obj = [v86 allKeys];
    id v31 = [obj countByEnumeratingWithState:&v106 objects:v111 count:16];
    if (v31)
    {
      uint64_t v85 = *(void *)v107;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v107 != v85) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = *(void *)(*((void *)&v106 + 1) + 8 * i);
          *(void *)buf = 0;
          v101 = buf;
          uint64_t v102 = 0x3032000000;
          v103 = sub_10009DAE8;
          v104 = sub_10009DAF8;
          id v105 = 0;
          v34 = [v86 objectForKeyedSubscript:v33];
          v35 = [v34 objectForKeyedSubscript:@"PayloadUUID"];
          v36 = [v34 objectForKeyedSubscript:@"AccessGroup"];
          if (v36)
          {
            if ([v87 length])
            {
              v95[0] = _NSConcreteStackBlock;
              v95[1] = 3221225472;
              v95[2] = sub_10009DB00;
              v95[3] = &unk_1000EC520;
              v99 = buf;
              v95[4] = v89;
              id v96 = v35;
              id v97 = v36;
              id v98 = v87;
              id v37 = +[DMCPersonaHelper performBlockUnderPersona:v98 block:v95];
            }
            else
            {
              id v39 = [(MCWebContentFilterPayloadHandler *)v89 _copyCertificateWithPayloadUUID:v35 intoKeychainAccessGroup:v36 personaID:0];
              v40 = (void *)*((void *)v101 + 5);
              *((void *)v101 + 5) = v39;
            }
            uint64_t v41 = *((void *)v101 + 5);
            if (v41)
            {
              v42 = [v88 UUID];
              [(MCNewPayloadHandler *)v89 _retainDependencyBetweenPersistentID:v41 andUUID:v42 forSystem:1 user:0 personaID:v87];

              [v82 addObject:*((void *)v101 + 5)];
            }
          }
          else
          {
            if (v35)
            {
              v7 = [(MCNewPayloadHandler *)v89 profileHandler];
              v6 = [v7 persistentIDForCertificateUUID:v35];
              v38 = v6;
            }
            else
            {
              v38 = 0;
            }
            objc_storeStrong((id *)v101 + 5, v38);
            if (v35)
            {
            }
          }
          uint64_t v43 = *((void *)v101 + 5);
          if (v43) {
            [v84 setObject:v43 forKey:v33];
          }

          _Block_object_dispose(buf, 8);
        }
        id v31 = [obj countByEnumeratingWithState:&v106 objects:v111 count:16];
      }
      while (v31);
    }

    id v44 = [v86 count];
    if (v44 != [v84 count] || !objc_msgSend(v76, "setCertificates:", v84))
    {
      v62 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCWebContentFilterErrorDomain, 40001, v62, MCErrorTypeFatal, 0);
      id v30 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_61;
    }
  }
  [v76 setPayloadInfoIdentity:v75];
  v45 = [v88 UUID];
  v46 = [v88 organization];
  [v76 setPayloadInfoCommon:v45 payloadOrganization:v46];

  v47 = [v88 contentFilterUUID];
  if (!v47
    || ([v88 contentFilterUUID],
        v48 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v49 = [v76 setPerAppUUID:v48 andSafariDomains:0],
        v48,
        v47,
        (v49 & 1) != 0))
  {
    v50 = [(MCNewPayloadHandler *)v89 profileHandler];
    v51 = [v50 profile];

    if (v51)
    {
      id v52 = objc_alloc_init((Class)NSMutableDictionary);
      v53 = [v51 UUID];
      BOOL v54 = v53 == 0;

      if (!v54)
      {
        v55 = [v51 UUID];
        [v52 setObject:v55 forKeyedSubscript:kMCPayloadUUIDKey];
      }
      v56 = [v51 identifier];
      BOOL v57 = v56 == 0;

      if (!v57)
      {
        v58 = [v51 identifier];
        [v52 setObject:v58 forKeyedSubscript:kMCPayloadIdentifierKey];
      }
      if (v81) {
        [v52 addEntriesFromDictionary:v81];
      }
      [v76 setProfileInfo:v52];
    }
    [v77 updateDefaultAfterAddingConfiguration];
    v59 = [v76 getConfigurationIdentifier];
    [v88 setPersistentResourceID:v59];

    id v94 = 0;
    unsigned __int8 v60 = [v77 saveIngestedConfiguration:&v94];
    id v30 = v94;
    if ((v60 & 1) == 0)
    {
      uint64_t v61 = +[MCWebContentFilterPayloadHandler internalErrorWithUnderlyingError:v30];

      id v30 = (id)v61;
    }

LABEL_61:
    [v77 unlockConfigurations];

    if (v30)
    {
      if (a6) {
        *a6 = v30;
      }
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v63 = v82;
      id v64 = [v63 countByEnumeratingWithState:&v90 objects:v110 count:16];
      if (v64)
      {
        uint64_t v65 = *(void *)v91;
        do
        {
          for (j = 0; j != v64; j = (char *)j + 1)
          {
            if (*(void *)v91 != v65) {
              objc_enumerationMutation(v63);
            }
            uint64_t v67 = *(void *)(*((void *)&v90 + 1) + 8 * (void)j);
            v68 = [v88 UUID];
            [(MCNewPayloadHandler *)v89 _releaseDependencyBetweenPersistentID:v67 andUUID:v68];
          }
          id v64 = [v63 countByEnumeratingWithState:&v90 objects:v110 count:16];
        }
        while (v64);
      }

LABEL_72:
      BOOL v27 = 0;
      goto LABEL_73;
    }
    goto LABEL_12;
  }
  v70 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Could not configure content filter UUID", buf, 2u);
  }
  v71 = [(MCNewPayloadHandler *)v89 payload];
  v72 = [v71 displayName];
  v73 = MCErrorArray();
  v74 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCWebContentFilterErrorDomain, 40002, v73, MCErrorTypeFatal, v72, 0);
  BOOL v27 = v74 != 0;

LABEL_73:
  return v27;
}

- (void)setAside
{
  uint64_t v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [v3 filterType];
  unsigned int v5 = [v4 isEqualToString:kMCWebContentFilterTypePlugin];

  if (v5)
  {
    v6 = +[MCWebContentFilterPayload typeStrings];
    v7 = [v6 firstObject];
    id v8 = MCNEProfileIngestionHandlerClassForPayload();

    if ([v8 lockConfigurations])
    {
      [v8 loadConfigurationsForceReloadFromDisk];
      v9 = [v3 persistentResourceID];
      id v10 = [v8 setAsideConfigurationName:v9 unsetAside:0];

      [v8 unlockConfigurations];
    }
    else
    {
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", v12, 2u);
      }
    }
  }
  else
  {
    [(MCWebContentFilterPayloadHandler *)self _removeDependency];
  }
}

- (void)unsetAside
{
  uint64_t v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [v3 filterType];
  unsigned int v5 = [v4 isEqualToString:kMCWebContentFilterTypePlugin];

  if (v5)
  {
    v6 = +[MCWebContentFilterPayload typeStrings];
    v7 = [v6 firstObject];
    id v8 = MCNEProfileIngestionHandlerClassForPayload();

    if ([v8 lockConfigurations])
    {
      [v8 loadConfigurationsForceReloadFromDisk];
      v9 = [v3 persistentResourceID];
      id v10 = [v8 setAsideConfigurationName:v9 unsetAside:1];

      [v8 unlockConfigurations];
    }
    else
    {
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", v12, 2u);
      }
    }
  }
  else
  {
    [(MCWebContentFilterPayloadHandler *)self _installDependency];
  }
}

- (void)remove
{
  uint64_t v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [v3 filterType];
  unsigned int v5 = [v4 isEqualToString:kMCWebContentFilterTypePlugin];

  if (v5)
  {
    v6 = +[MCWebContentFilterPayload typeStrings];
    v7 = [v6 firstObject];
    id v8 = MCNEProfileIngestionHandlerClassForPayload();

    if ([v8 lockConfigurations])
    {
      [v8 loadConfigurationsForceReloadFromDisk];
      v9 = [v3 persistentResourceID];

      if (v9)
      {
        id v10 = [v3 persistentResourceID];
        v11 = [v8 getCertificatesForConfigurationWithIdentifier:v10];

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v28;
          do
          {
            v16 = 0;
            do
            {
              if (*(void *)v28 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v16);
              v18 = [v3 UUID:v27];
              [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v17 andUUID:v18];

              v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            id v14 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
          }
          while (v14);
        }

        os_log_t v19 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
        {
          v20 = v19;
          v21 = [v3 persistentResourceID];
          *(_DWORD *)buf = 138543362;
          v32 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Calling removeConfigurationWithIdentifier for id: %{public}@", buf, 0xCu);
        }
        v22 = [v3 persistentResourceID:v27];
        [v8 removeConfigurationWithIdentifier:v22];
      }
      else
      {
        v26 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "MCWebContentFilterPayloadHandler remove failed: empty configuration id", buf, 2u);
        }
      }
      [v8 updateDefaultAfterDeletingConfiguration];
      [v8 unlockConfigurations];
    }
    else
    {
      uint64_t v25 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock. Skipping removal.", buf, 2u);
      }
    }
  }
  else
  {
    v23 = [(MCNewPayloadHandler *)self profileHandler];
    int v24 = [v23 isSetAside];

    if ((v24 & 1) == 0) {
      [(MCWebContentFilterPayloadHandler *)self _removeDependency];
    }
  }
}

- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4 personaID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MCNewPayloadHandler *)self profileHandler];
  id v12 = [v11 payloadHandlerWithUUID:v8];

  if (v12)
  {
    id v28 = 0;
    id v13 = [v12 copyIdentityImmediatelyWithInteractionClient:0 outError:&v28];
    id v14 = v28;
    if (!v14 && v13) {
      goto LABEL_7;
    }
    uint64_t v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v30 = v8;
      __int16 v31 = 2114;
      id v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "ContentFilter: Failed to get the identity for UUID %{public}@: %{public}@", buf, 0x16u);
    }
    if (v13)
    {
LABEL_7:
      id v26 = v14;
      id v27 = v10;
      id v16 = v9;
      id v17 = [v12 accessibility];
      v18 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Web content filter identity, storing with accessibility %@", buf, 0xCu);
      }
      os_log_t v19 = [@"NE:" stringByAppendingString:v8];
      v20 = [(MCNewPayloadHandler *)self profileHandler];
      v21 = [v20 profile];
      id v9 = v16;
      v22 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v13, v19, v16, [v21 isInstalledForSystem], v17);

      id v10 = v27;
      if (v22)
      {
        v23 = [(MCNewPayloadHandler *)self payload];
        int v24 = [v23 UUID];
        [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v22 andUUID:v24 personaID:v27];
      }
      CFRelease(v13);
      id v14 = v26;
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end