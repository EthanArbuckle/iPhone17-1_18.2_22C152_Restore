@interface MCVPNPayloadHandlerBase
+ (id)managedServiceIDs;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (MCVPNPayloadHandlerBase)initWithPayload:(id)a3 profileHandler:(id)a4;
- (NEProfileIngestionDelegate)neProfileIngestionHandler;
- (NSString)originalName;
- (__SCPreferences)scPreferences;
- (id)PPTPDeprecatedError;
- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4 personaID:(id)a5;
- (id)cannotInstallError;
- (id)cannotInstallErrorWithUnderlyingError:(id)a3;
- (id)installService:(id)a3;
- (id)userInputFields;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)remove;
- (void)setAside;
- (void)setNeProfileIngestionHandler:(id)a3;
- (void)setOriginalName:(id)a3;
- (void)setScPreferences:(__SCPreferences *)a3;
- (void)unsetAside;
@end

@implementation MCVPNPayloadHandlerBase

- (MCVPNPayloadHandlerBase)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCVPNPayloadHandlerBase;
  v7 = [(MCNewPayloadHandler *)&v17 initWithPayload:v6 profileHandler:a4];
  if (!v7) {
    goto LABEL_6;
  }
  v8 = [v6 vpnType];
  unsigned int v9 = [v8 isEqualToString:kMCVPNPayloadBaseVPNTypeAlwaysOn];

  if (v9)
  {
    uint64_t v10 = MCNEProfileIngestionHandlerClassForPayload();
    neProfileIngestionHandler = v7->_neProfileIngestionHandler;
    v7->_neProfileIngestionHandler = (NEProfileIngestionDelegate *)v10;
  }
  else
  {
    neProfileIngestionHandler = [(MCNewPayloadHandler *)v7 payload];
    v12 = [neProfileIngestionHandler type];
    uint64_t v13 = MCNEProfileIngestionHandlerClassForPayload();
    v14 = v7->_neProfileIngestionHandler;
    v7->_neProfileIngestionHandler = (NEProfileIngestionDelegate *)v13;
  }
  if (!v7->_neProfileIngestionHandler) {
    v15 = 0;
  }
  else {
LABEL_6:
  }
    v15 = v7;

  return v15;
}

- (id)userInputFields
{
  v3 = +[NSMutableArray array];
  v4 = [(MCNewPayloadHandler *)self payload];
  v5 = [v4 nePayloadBase];
  id v6 = [v5 getPreprocessedPayloadContents];
  v7 = [v6 objectForKeyedSubscript:@"AuthName"];
  if (!v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"AuthNameRequired"];

    if (!v8) {
      goto LABEL_5;
    }
    v7 = MCLocalizedString();
    unsigned int v9 = [v4 displayName];
    uint64_t v10 = MCLocalizedFormat();
    v11 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kVPNUserInputUserName", v7, v10, 0, 0, 0, 0, 0, &_mh_execute_header);
    [v3 addObject:v11];
  }
LABEL_5:
  v12 = [v6 objectForKeyedSubscript:@"AuthPassword"];
  if (!v12)
  {
    uint64_t v13 = [v6 objectForKeyedSubscript:@"AuthPasswordRequired"];

    if (!v13) {
      goto LABEL_12;
    }
    v14 = [v6 objectForKeyedSubscript:@"AuthName"];

    if (v14) {
      [v6 objectForKeyedSubscript:@"AuthName"];
    }
    else {
    v15 = [v4 displayName];
    }
    v12 = MCLocalizedFormat();

    v16 = MCLocalizedString();
    objc_super v17 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kVPNUserInputPassword", v16, v12, 0, 0, 0, 0, 0, 0x100000003);
    [v3 addObject:v17];
  }
LABEL_12:
  v18 = [v6 objectForKeyedSubscript:@"HTTPProxyUsername"];
  if (!v18)
  {
    v19 = [v6 objectForKeyedSubscript:@"HTTPProxyUsernameRequired"];

    if (!v19) {
      goto LABEL_16;
    }
    v18 = MCLocalizedString();
    v20 = [v4 displayName];
    v21 = MCLocalizedFormat();
    v22 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kVPNUserInputProxyUserName", v18, v21, 0, 0, 0, 0, 0, &_mh_execute_header);
    [v3 addObject:v22];
  }
LABEL_16:
  v23 = [v6 objectForKeyedSubscript:@"HTTPProxyPassword"];
  if (!v23)
  {
    v24 = [v6 objectForKeyedSubscript:@"HTTPProxyPassword"];

    if (!v24) {
      goto LABEL_23;
    }
    v25 = [v6 objectForKeyedSubscript:@"HTTPProxyPassword"];

    if (v25) {
      [v6 objectForKeyedSubscript:@"AuthName"];
    }
    else {
    v26 = [v4 displayName];
    }
    v23 = MCLocalizedFormat();

    v27 = MCLocalizedString();
    v28 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kVPNUserInputProxyPassword", v27, v23, 0, 0, 0, 0, 0, 0x100000003);
    [v3 addObject:v28];
  }
LABEL_23:
  v29 = [v6 objectForKeyedSubscript:@"SharedSecret"];
  if (!v29)
  {
    v30 = [v6 objectForKeyedSubscript:@"SharedSecretRequired"];

    if (!v30) {
      goto LABEL_27;
    }
    v29 = MCLocalizedString();
    v31 = [v4 displayName];
    v32 = MCLocalizedFormat();
    v33 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kVPNUserInputSharedSecret", v29, v32, 0, 0, 0, 0, 0, 0x100000003);
    [v3 addObject:v33];
  }
LABEL_27:
  v34 = [v6 objectForKeyedSubscript:@"PromptForVPNPIN"];
  if (!v34)
  {
    v35 = [v6 objectForKeyedSubscript:@"PromptForVPNPINRequired"];

    if (!v35) {
      goto LABEL_31;
    }
    v34 = MCLocalizedString();
    v36 = [v4 displayName];
    v37 = MCLocalizedFormat();
    v38 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kVPNUserInputPIN", v34, v37, 0, 0, 0, 0, 0, 0x100000003);
    [v3 addObject:v38];
  }
LABEL_31:

  return v3;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  id v6 = [(MCNewPayloadHandler *)self payload];
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  v25 = v6;
  v24 = [v6 nePayloadBase];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    uint64_t v12 = kMCIDUUIDKey;
    uint64_t v13 = kMCIDResponseKey;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v14);
        v16 = [v15 objectForKey:v12, v24];
        objc_super v17 = [v15 objectForKey:v13];
        if ([v16 isEqualToString:@"kVPNUserInputUserName"])
        {
          v18 = v7;
          v19 = v17;
          CFStringRef v20 = @"AuthName";
LABEL_18:
          [v18 setValue:v19 forKey:v20];
          goto LABEL_19;
        }
        if ([v16 isEqualToString:@"kVPNUserInputPassword"])
        {
          v18 = v7;
          v19 = v17;
          CFStringRef v20 = @"AuthPassword";
          goto LABEL_18;
        }
        if ([v16 isEqualToString:@"kVPNUserInputProxyUserName"])
        {
          v18 = v7;
          v19 = v17;
          CFStringRef v20 = @"HTTPProxyUsername";
          goto LABEL_18;
        }
        if ([v16 isEqualToString:@"kVPNUserInputProxyPassword"])
        {
          v18 = v7;
          v19 = v17;
          CFStringRef v20 = @"HTTPProxyPassword";
          goto LABEL_18;
        }
        if ([v16 isEqualToString:@"kVPNUserInputSharedSecret"])
        {
          v18 = v7;
          v19 = v17;
          CFStringRef v20 = @"SharedSecret";
          goto LABEL_18;
        }
        if ([v16 isEqualToString:@"kVPNUserInputPIN"])
        {
          v18 = v7;
          v19 = v17;
          CFStringRef v20 = @"PromptForVPNPIN";
          goto LABEL_18;
        }
        os_log_t log = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          loga = log;
          v21 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v34 = v21;
          __int16 v35 = 2114;
          v36 = v16;
          id v26 = v21;
          _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);
        }
LABEL_19:

        v14 = (char *)v14 + 1;
      }
      while (v10 != v14);
      id v22 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
      id v10 = v22;
    }
    while (v22);
  }

  [v24 setPostprocessedPayloadContents:v7];
  return 1;
}

- (id)PPTPDeprecatedError
{
  uint64_t v2 = MCVPNErrorDomain;
  v3 = MCErrorArray();
  v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 15000, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (id)cannotInstallError
{
  return [(MCVPNPayloadHandlerBase *)self cannotInstallErrorWithUnderlyingError:0];
}

- (id)cannotInstallErrorWithUnderlyingError:(id)a3
{
  uint64_t v4 = MCVPNErrorDomain;
  id v5 = a3;
  id v6 = [(MCNewPayloadHandler *)self payload];
  id v7 = [v6 displayName];
  id v8 = MCErrorArray();
  id v9 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 15000, v8, v5, MCErrorTypeFatal, v7, 0);

  return v9;
}

- (id)installService:(id)a3
{
  return 0;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v78 = a3;
  id v82 = a4;
  id v79 = a5;
  id v9 = [(MCNewPayloadHandler *)self payload];
  v80 = [v9 nePayloadBase];
  id v83 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [v82 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledInteractively];
  LOBYTE(a4) = [v10 BOOLValue];

  if ((a4 & 1) == 0)
  {
    uint64_t v11 = [v9 vpnType];
    unsigned int v12 = [v11 isEqualToString:kMCVPNPayloadBaseVPNTypePPTP];

    if (v12)
    {
      uint64_t v13 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "PPTP is deprecated starting from iOS 10 and valid configurations can not be created.", (uint8_t *)&buf, 2u);
      }
      id v14 = [(MCVPNPayloadHandlerBase *)self PPTPDeprecatedError];
      v81 = 0;
      goto LABEL_49;
    }
  }
  if (([(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler lockConfigurations] & 1) == 0)
  {
    v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_16;
  }
  [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler loadConfigurationsForceReloadFromDisk];
  v15 = [v9 vpnType];
  unsigned int v16 = [v15 isEqualToString:kMCVPNPayloadBaseVPNTypeAlwaysOn];

  neProfileIngestionHandler = self->_neProfileIngestionHandler;
  if (v16)
  {
    if ([(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler createConfigurationFromPayload:v80 payloadType:@"com.apple.vpn.managed.alwayson"])goto LABEL_9; {
    goto LABEL_18;
    }
  }
  v24 = [(MCNewPayloadHandler *)self payload];
  v25 = [v24 type];
  unsigned __int8 v26 = [(NEProfileIngestionDelegate *)neProfileIngestionHandler createConfigurationFromPayload:v80 payloadType:v25];

  if ((v26 & 1) == 0)
  {
LABEL_18:
    os_log_t v27 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v28 = v27;
      long long v29 = [(MCNewPayloadHandler *)self payload];
      long long v30 = [v29 UUID];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "NetworkExtension did not create configuration from payload UUID %{public}@", (uint8_t *)&buf, 0xCu);
    }
LABEL_16:
    id v14 = [(MCVPNPayloadHandlerBase *)self cannotInstallError];
    v81 = 0;
    goto LABEL_49;
  }
LABEL_9:
  v81 = [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler ingestedConfiguration];
  if (!v81)
  {
    os_log_t v31 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      long long v32 = v31;
      v33 = [(MCNewPayloadHandler *)self payload];
      v34 = [v33 UUID];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "NetworkExtension decided to skip installation of payload UUID %{public}@", (uint8_t *)&buf, 0xCu);
    }
    [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler unlockConfigurations];
    id v14 = 0;
    v81 = 0;
    goto LABEL_60;
  }
  v18 = [v9 nePayloadBase];
  v87 = [v81 getPendingCertificateInfo:v18];

  if (v87)
  {
    v19 = [v82 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
    unsigned int v20 = [v19 BOOLValue];

    if (v20)
    {
      uint64_t v21 = kMDMPersonaKey;
      id v22 = [v82 objectForKeyedSubscript:kMDMPersonaKey];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v88 = [v82 objectForKeyedSubscript:v21];
      }
      else
      {
        v88 = 0;
      }
    }
    else
    {
      v88 = 0;
    }
    id v85 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v87 count]];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id obj = [v87 allKeys];
    id v35 = [obj countByEnumeratingWithState:&v99 objects:v109 count:16];
    if (v35)
    {
      uint64_t v86 = *(void *)v100;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v100 != v86) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void *)(*((void *)&v99 + 1) + 8 * i);
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v105 = 0x3032000000;
          v106 = sub_100095B0C;
          v107 = sub_100095B1C;
          id v108 = 0;
          v38 = [v87 objectForKeyedSubscript:v37];
          v39 = [v38 objectForKeyedSubscript:@"PayloadUUID"];
          v40 = [v38 objectForKeyedSubscript:@"AccessGroup"];
          if (v40)
          {
            if ([v88 length])
            {
              v94[0] = _NSConcreteStackBlock;
              v94[1] = 3221225472;
              v94[2] = sub_100095B24;
              v94[3] = &unk_1000EC520;
              p_long long buf = &buf;
              v94[4] = self;
              id v95 = v39;
              id v96 = v40;
              id v97 = v88;
              id v41 = +[DMCPersonaHelper performBlockUnderPersona:v97 block:v94];
            }
            else
            {
              id v45 = [(MCVPNPayloadHandlerBase *)self _copyCertificateWithPayloadUUID:v39 intoKeychainAccessGroup:v40 personaID:0];
              v46 = *(void **)(*((void *)&buf + 1) + 40);
              *(void *)(*((void *)&buf + 1) + 40) = v45;
            }
            uint64_t v47 = *(void *)(*((void *)&buf + 1) + 40);
            if (v47)
            {
              v48 = [v9 UUID];
              [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v47 andUUID:v48 forSystem:1 user:0 personaID:v88];

              [v83 addObject:*(void *)(*((void *)&buf + 1) + 40)];
            }
          }
          else
          {
            v42 = [(MCNewPayloadHandler *)self profileHandler];
            uint64_t v43 = [v42 persistentIDForCertificateUUID:v39];
            v44 = *(void **)(*((void *)&buf + 1) + 40);
            *(void *)(*((void *)&buf + 1) + 40) = v43;
          }
          uint64_t v49 = *(void *)(*((void *)&buf + 1) + 40);
          if (v49) {
            [v85 setObject:v49 forKey:v37];
          }

          _Block_object_dispose(&buf, 8);
        }
        id v35 = [obj countByEnumeratingWithState:&v99 objects:v109 count:16];
      }
      while (v35);
    }

    id v50 = [v87 count];
    if (v50 != [v85 count] || !objc_msgSend(v81, "setCertificates:", v85))
    {
      v51 = [(MCNewPayloadHandler *)self payload];
      v52 = [v51 displayName];
      v53 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCVPNErrorDomain, 15003, v53, MCErrorTypeFatal, v52, 0);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_49;
    }
  }
  id v14 = [(MCVPNPayloadHandlerBase *)self installService:v81];
  if (!v14)
  {
    [v81 setPayloadInfoIdentity:v80];
    v62 = [v9 UUID];
    v63 = [v9 organization];
    [v81 setPayloadInfoCommon:v62 payloadOrganization:v63];

    v64 = [(MCNewPayloadHandler *)self profileHandler];
    v65 = [v64 profile];

    if (v65)
    {
      id v66 = objc_alloc_init((Class)NSMutableDictionary);
      v67 = [v65 UUID];
      BOOL v68 = v67 == 0;

      if (!v68)
      {
        v69 = [v65 UUID];
        [v66 setObject:v69 forKeyedSubscript:kMCPayloadUUIDKey];
      }
      v70 = [v65 identifier];
      BOOL v71 = v70 == 0;

      if (!v71)
      {
        v72 = [v65 identifier];
        [v66 setObject:v72 forKeyedSubscript:kMCPayloadIdentifierKey];
      }
      if (v82) {
        [v66 addEntriesFromDictionary:v82];
      }
      [v81 setProfileInfo:v66];
    }
    [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler updateDefaultAfterAddingConfiguration];
    v73 = [v81 getConfigurationIdentifier];
    [v9 setPersistentResourceID:v73];

    v74 = self->_neProfileIngestionHandler;
    id v93 = 0;
    unsigned __int8 v75 = [(NEProfileIngestionDelegate *)v74 saveIngestedConfiguration:&v93];
    id v14 = v93;
    if ((v75 & 1) == 0)
    {
      uint64_t v76 = [(MCVPNPayloadHandlerBase *)self cannotInstallErrorWithUnderlyingError:v14];

      id v14 = (id)v76;
    }
LABEL_49:
    [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler unlockConfigurations];
    if (v14) {
      goto LABEL_50;
    }
LABEL_60:
    BOOL v60 = 1;
    goto LABEL_61;
  }
  [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler unlockConfigurations];
LABEL_50:
  if (a6) {
    *a6 = v14;
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v54 = v83;
  id v55 = [v54 countByEnumeratingWithState:&v89 objects:v103 count:16];
  if (v55)
  {
    uint64_t v56 = *(void *)v90;
    do
    {
      for (j = 0; j != v55; j = (char *)j + 1)
      {
        if (*(void *)v90 != v56) {
          objc_enumerationMutation(v54);
        }
        uint64_t v58 = *(void *)(*((void *)&v89 + 1) + 8 * (void)j);
        v59 = [v9 UUID];
        [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v58 andUUID:v59];
      }
      id v55 = [v54 countByEnumeratingWithState:&v89 objects:v103 count:16];
    }
    while (v55);
  }

  BOOL v60 = 0;
LABEL_61:

  return v60;
}

- (BOOL)isInstalled
{
  [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler loadConfigurationsForceReloadFromDisk];
  v3 = [(MCNewPayloadHandler *)self payload];
  neProfileIngestionHandler = self->_neProfileIngestionHandler;
  id v5 = [v3 UUID];
  LOBYTE(neProfileIngestionHandler) = [(NEProfileIngestionDelegate *)neProfileIngestionHandler isInstalled:v5];

  return (char)neProfileIngestionHandler;
}

- (void)remove
{
  os_log_t v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    id v5 = [(MCNewPayloadHandler *)self payload];
    id v6 = [v5 UUID];
    id v7 = [(MCNewPayloadHandler *)self payload];
    id v8 = [v7 persistentResourceID];
    id v9 = [(MCNewPayloadHandler *)self payload];
    *(_DWORD *)long long buf = 138543874;
    os_log_t v31 = v6;
    __int16 v32 = 2114;
    v33 = v8;
    __int16 v34 = 2114;
    id v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Attempting to remove VPN payload (%{public}@, %{public}@): %{public}@", buf, 0x20u);
  }
  id v10 = [(MCNewPayloadHandler *)self payload];
  if ([(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler lockConfigurations])
  {
    [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler loadConfigurationsForceReloadFromDisk];
    uint64_t v11 = [v10 persistentResourceID];

    if (v11)
    {
      neProfileIngestionHandler = self->_neProfileIngestionHandler;
      uint64_t v13 = [v10 persistentResourceID];
      id v14 = [(NEProfileIngestionDelegate *)neProfileIngestionHandler getCertificatesForConfigurationWithIdentifier:v13];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = v14;
      id v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          v19 = 0;
          do
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v19);
            uint64_t v21 = [v10 UUID:v25];
            [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v20 andUUID:v21];

            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v17);
      }

      id v22 = self->_neProfileIngestionHandler;
      v23 = [v10 persistentResourceID];
      [(NEProfileIngestionDelegate *)v22 removeConfigurationWithIdentifier:v23];
    }
    [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler updateDefaultAfterDeletingConfiguration];
    [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler unlockConfigurations];
  }
  else
  {
    v24 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock. Skipping removal.", buf, 2u);
    }
  }
}

- (void)setAside
{
  os_log_t v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    id v5 = [(MCNewPayloadHandler *)self payload];
    id v6 = [v5 UUID];
    id v7 = [(MCNewPayloadHandler *)self payload];
    id v8 = [v7 persistentResourceID];
    id v9 = [(MCNewPayloadHandler *)self payload];
    int v15 = 138543874;
    id v16 = v6;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Setting aside VPN payload (%{public}@, %{public}@): %{public}@", (uint8_t *)&v15, 0x20u);
  }
  id v10 = [(MCNewPayloadHandler *)self payload];
  if ([(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler lockConfigurations])
  {
    [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler loadConfigurationsForceReloadFromDisk];
    neProfileIngestionHandler = self->_neProfileIngestionHandler;
    unsigned int v12 = [v10 persistentResourceID];
    id v13 = [(NEProfileIngestionDelegate *)neProfileIngestionHandler setAsideConfigurationName:v12 unsetAside:0];

    [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler unlockConfigurations];
  }
  else
  {
    id v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", (uint8_t *)&v15, 2u);
    }
  }
}

- (void)unsetAside
{
  os_log_t v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    id v5 = [(MCNewPayloadHandler *)self payload];
    id v6 = [v5 UUID];
    id v7 = [(MCNewPayloadHandler *)self payload];
    id v8 = [v7 persistentResourceID];
    id v9 = [(MCNewPayloadHandler *)self payload];
    int v15 = 138543874;
    id v16 = v6;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Unsetting aside VPN payload (%{public}@, %{public}@): %{public}@", (uint8_t *)&v15, 0x20u);
  }
  id v10 = [(MCNewPayloadHandler *)self payload];
  if ([(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler lockConfigurations])
  {
    [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler loadConfigurationsForceReloadFromDisk];
    neProfileIngestionHandler = self->_neProfileIngestionHandler;
    unsigned int v12 = [v10 persistentResourceID];
    id v13 = [(NEProfileIngestionDelegate *)neProfileIngestionHandler setAsideConfigurationName:v12 unsetAside:1];

    [(NEProfileIngestionDelegate *)self->_neProfileIngestionHandler unlockConfigurations];
  }
  else
  {
    id v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not get NetworkExtension store lock.", (uint8_t *)&v15, 2u);
    }
  }
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v5 = [(MCNewPayloadHandler *)self payload];
  id v6 = [v5 vpnType];
  unsigned int v7 = [v6 isEqualToString:kMCVPNPayloadBaseVPNTypeAlwaysOn];

  if (v7)
  {
    id v8 = [(MCVPNPayloadHandlerBase *)self neProfileIngestionHandler];
    [v8 enableAlwaysOnVpn];
  }
}

+ (id)managedServiceIDs
{
  uint64_t v2 = MCNEProfileIngestionHandlerClassForPayload();
  os_log_t v3 = v2;
  if (v2)
  {
    [v2 loadConfigurationsForceReloadFromDisk];
    id v4 = [v3 copyManagedConfigurationIDs];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4 personaID:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v12 = [v11 payloadHandlerWithUUID:v8];

  if (v12)
  {
    id v27 = 0;
    id v13 = [v12 copyIdentityImmediatelyWithInteractionClient:0 outError:&v27];
    id v14 = v27;
    if (!v14 && v13) {
      goto LABEL_7;
    }
    int v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      CFStringRef v29 = v8;
      __int16 v30 = 2114;
      id v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "VPN: Failed to get the identity for UUID %{public}@: %{public}@", buf, 0x16u);
    }
    if (v13)
    {
LABEL_7:
      id v25 = v14;
      id v26 = v10;
      id v16 = v9;
      __int16 v17 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v29 = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Storing VPN identity, storing with accessibility %@", buf, 0xCu);
      }
      uint64_t v18 = [@"NE:" stringByAppendingString:v8];
      __int16 v19 = [(MCNewPayloadHandler *)self profileHandler];
      uint64_t v20 = [v19 profile];
      id v9 = v16;
      uint64_t v21 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:", v13, v18, v16, [v20 isInstalledForSystem], 0, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly);

      id v10 = v26;
      if (v21)
      {
        id v22 = [(MCNewPayloadHandler *)self payload];
        v23 = [v22 UUID];
        [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v21 andUUID:v23 personaID:v26];
      }
      CFRelease(v13);
      id v14 = v25;
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (__SCPreferences)scPreferences
{
  return self->_scPreferences;
}

- (void)setScPreferences:(__SCPreferences *)a3
{
  self->_scPreferences = a3;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (void)setOriginalName:(id)a3
{
}

- (NEProfileIngestionDelegate)neProfileIngestionHandler
{
  return self->_neProfileIngestionHandler;
}

- (void)setNeProfileIngestionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neProfileIngestionHandler, 0);

  objc_storeStrong((id *)&self->_originalName, 0);
}

@end