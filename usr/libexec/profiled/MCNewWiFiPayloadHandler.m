@interface MCNewWiFiPayloadHandler
+ (id)_originatorIdentifierFromInstallationOptions:(id)a3;
+ (id)_originatorNameFromInstallationOptions:(id)a3;
+ (id)managedWiFiNetworkNames;
- (BOOL)_applyProxyCredential:(id)a3;
- (BOOL)_configureEncryptionTypeForWiFiNetwork:(__WiFiNetwork *)a3 payload:(id)a4 outError:(id *)a5;
- (BOOL)_configureNetworkServiceForWiFiNetwork:(__WiFiNetwork *)a3 outError:(id *)a4;
- (BOOL)_installEAPConfiguration:(id)a3 isHotspot:(BOOL)a4 securityType:(id)a5 authProperties:(id)a6 username:(id)a7 password:(id)a8 identity:(__SecIdentity *)a9;
- (BOOL)_isMetadataValid:(__EAPOLClientProfile *)a3;
- (BOOL)_isWiFiDaemonAvailable;
- (BOOL)_networkServiceRequired;
- (BOOL)_setEAPConfig:(id)a3 onNetwork:(__WiFiNetwork *)a4;
- (BOOL)_setEAPConfigUsingEAPConfigAPI:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (MCNewWiFiPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (id)profileMetadata;
- (id)userInputFields;
- (void)_removeEAPConfiguration;
- (void)_removeNetworkWithUUID:(id)a3;
- (void)_removeProxyCredential;
- (void)_updateWiFiCustomSetWithSetID:(id)a3 forSSID:(id)a4;
- (void)dealloc;
- (void)remove;
- (void)setAside;
- (void)setAsideEAPConfig;
- (void)unsetAside;
- (void)unsetAsideEAPConfig;
@end

@implementation MCNewWiFiPayloadHandler

- (MCNewWiFiPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MCNewWiFiPayloadHandler;
  v4 = [(MCNewPayloadHandler *)&v12 initWithPayload:a3 profileHandler:a4];
  if (v4)
  {
    uint64_t v5 = WiFiManagerClientCreate();
    v4->_manager = (__WiFiManagerClient *)v5;
    os_log_t v6 = _MCLogObjects[0];
    if (v5)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        v7 = "MCNewWiFiPayloadHandler successfully created a WiFiManagerClient.";
        v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, v11, 2u);
      }
    }
    else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      v7 = "MCNewWiFiPayloadHandler could not create a WiFiManagerClient. This payload handler will not function correctly.";
      v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
  }
  return v4;
}

- (void)dealloc
{
  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MCNewWiFiPayloadHandler;
  [(MCNewWiFiPayloadHandler *)&v4 dealloc];
}

- (id)userInputFields
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 userInputFields];

  return v3;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  os_log_t v6 = [(MCNewPayloadHandler *)self payload];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v22;
    uint64_t v11 = kMCIDUUIDKey;
    uint64_t v12 = kMCIDResponseKey;
    *(void *)&long long v8 = 138543362;
    long long v19 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v15 = [v14 objectForKey:v11, v19];
        v16 = [v14 objectForKey:v12];
        if ([v15 isEqualToString:@"UsernameUserInputKey"])
        {
          [v6 setUsername:v16];
        }
        else if ([v15 isEqualToString:@"PasswordUserInputKey"])
        {
          [v6 setPassword:v16];
        }
        else
        {
          v17 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            v26 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler didn't ask for user input for key: %{public}@", buf, 0xCu);
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v9);
  }

  return 1;
}

- (id)profileMetadata
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 UUID];
  objc_super v4 = +[NSDictionary dictionaryWithObject:v3 forKey:kMCPayloadUUIDKey];

  return v4;
}

- (BOOL)_isMetadataValid:(__EAPOLClientProfile *)a3
{
  v3 = [(MCNewPayloadHandler *)self payload];
  objc_super v4 = EAPOLClientProfileGetInformation();
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v6 = kMCPayloadUUIDKey;
  id v7 = [v4 objectForKey:kMCPayloadUUIDKey];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_5;
  }
  id v9 = [v5 objectForKey:v6];
  uint64_t v10 = [v3 UUID];
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  if (v11) {
    BOOL v12 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v12 = 0;

  return v12;
}

- (BOOL)_installEAPConfiguration:(id)a3 isHotspot:(BOOL)a4 securityType:(id)a5 authProperties:(id)a6 username:(id)a7 password:(id)a8 identity:(__SecIdentity *)a9
{
  BOOL v13 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = [(MCNewPayloadHandler *)self payload];
  uint64_t v21 = EAPOLClientConfigurationCreateWithAuthorization();
  if (v21)
  {
    long long v22 = (const void *)v21;
    id v61 = v16;
    id v62 = v17;
    if (v13)
    {
      ProfileWithWLANDomain = (const void *)EAPOLClientConfigurationGetProfileWithWLANDomain();
      if (ProfileWithWLANDomain)
      {
        long long v24 = ProfileWithWLANDomain;
        CFRetain(ProfileWithWLANDomain);
LABEL_10:
        if (!-[MCNewWiFiPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", v24, v61))
        {
          os_log_t v31 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            v32 = v31;
            *(_DWORD *)buf = 138543362;
            id v64 = (id)objc_opt_class();
            id v33 = v64;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%{public}@ configuration for the Wi-Fi already exists", buf, 0xCu);
          }
        }
        goto LABEL_15;
      }
    }
    else
    {
      v29 = [v15 dataUsingEncoding:4];
      ProfileWithWLANSSID = (const void *)EAPOLClientConfigurationGetProfileWithWLANSSID();
      if (ProfileWithWLANSSID)
      {
        long long v24 = ProfileWithWLANSSID;
        CFRetain(ProfileWithWLANSSID);

        goto LABEL_10;
      }
    }
    long long v24 = (const void *)EAPOLClientProfileCreate();
    if (!v24)
    {
      os_log_t v44 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v45 = v44;
        *(_DWORD *)buf = 138543362;
        id v64 = (id)objc_opt_class();
        id v46 = v64;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientProfileCreate() returned NULL", buf, 0xCu);
      }
      BOOL v28 = 0;
      id v16 = v61;
      goto LABEL_49;
    }
LABEL_15:
    uint64_t v34 = EAPOLClientItemIDCreateWithProfile();
    if (!v34)
    {
      os_log_t v39 = _MCLogObjects[0];
      id v17 = v62;
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v40 = v39;
        v41 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v64 = v41;
        id v42 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL", buf, 0xCu);
      }
      BOOL v28 = 0;
      goto LABEL_48;
    }
    v35 = (const void *)v34;
    v36 = [v20 displayName];

    if (v36)
    {
      v37 = [v20 displayName];
      EAPOLClientProfileSetUserDefinedName();
    }
    EAPOLClientProfileSetAuthenticationProperties();
    v38 = [(MCNewWiFiPayloadHandler *)self profileMetadata];
    if (v38 && !EAPOLClientProfileSetInformation())
    {
      os_log_t v47 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v48 = v47;
        v49 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v64 = v49;
        id v50 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientProfileSetInformation() failed", buf, 0xCu);
      }
      goto LABEL_46;
    }

    if (v13)
    {
      EAPOLClientProfileSetWLANDomain();
      if (!v18) {
        goto LABEL_29;
      }
    }
    else
    {
      v43 = [v15 dataUsingEncoding:4];
      EAPOLClientProfileSetWLANSSIDAndSecurityType();

      if (!v18) {
        goto LABEL_29;
      }
    }
    if (v19 && !EAPOLClientItemIDSetPasswordItem())
    {
      os_log_t v58 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v52 = v58;
        v59 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v64 = v59;
        id v54 = v59;
        v55 = "%{public}@ EAPOLClientItemIDSetPasswordItem() failed";
        goto LABEL_45;
      }
      goto LABEL_46;
    }
LABEL_29:
    if (a9 && !EAPOLClientItemIDSetIdentity())
    {
      os_log_t v56 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v52 = v56;
        v57 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v64 = v57;
        id v54 = v57;
        v55 = "%{public}@ EAPOLClientItemIDSetIdentity() failed";
        goto LABEL_45;
      }
    }
    else
    {
      if (EAPOLClientConfigurationSave())
      {
        BOOL v28 = 1;
LABEL_47:
        CFRelease(v35);
        id v17 = v62;
LABEL_48:
        CFRelease(v24);
        id v16 = v61;
LABEL_49:
        CFRelease(v22);
        goto LABEL_50;
      }
      os_log_t v51 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v52 = v51;
        v53 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v64 = v53;
        id v54 = v53;
        v55 = "%{public}@ EAPOLClientConfigurationSave() failed";
LABEL_45:
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, v55, buf, 0xCu);
      }
    }
LABEL_46:
    BOOL v28 = 0;
    goto LABEL_47;
  }
  os_log_t v25 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v26 = v25;
    *(_DWORD *)buf = 138543362;
    id v64 = (id)objc_opt_class();
    id v27 = v64;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", buf, 0xCu);
  }
  BOOL v28 = 0;
LABEL_50:

  return v28;
}

- (void)_removeEAPConfiguration
{
  v3 = [(MCNewPayloadHandler *)self payload];
  uint64_t v4 = EAPOLClientConfigurationCreateWithAuthorization();
  if (v4)
  {
    id v5 = (const void *)v4;
    uint64_t v6 = [(MCNewPayloadHandler *)self profileHandler];
    unsigned int v7 = [v6 isSetAside];
    uint64_t v8 = qword_100105868;

    if (v7)
    {
      if (!v8)
      {
        os_log_t v9 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = v9;
          *(_DWORD *)os_log_t v47 = 138543362;
          *(void *)&v47[4] = objc_opt_class();
          id v11 = *(id *)&v47[4];
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to find set aside EAP profile", v47, 0xCu);
        }
      }
    }
    if (qword_100105868)
    {
      uint64_t ProfileWithID = EAPOLClientConfigurationGetProfileWithID();
    }
    else
    {
      if (![v3 isHotspot])
      {
        v37 = [v3 ssid];
        v38 = [v37 dataUsingEncoding:4];

        uint64_t ProfileWithWLANSSID = EAPOLClientConfigurationGetProfileWithWLANSSID();
        if (ProfileWithWLANSSID) {
          goto LABEL_13;
        }
        goto LABEL_28;
      }
      [v3 domainName];
      uint64_t ProfileWithID = EAPOLClientConfigurationGetProfileWithWLANDomain();
    }
    uint64_t ProfileWithWLANSSID = ProfileWithID;
    if (ProfileWithID)
    {
LABEL_13:
      if (-[MCNewWiFiPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", ProfileWithWLANSSID, *(_OWORD *)v47))
      {
        uint64_t v17 = EAPOLClientItemIDCreateWithProfile();
        if (v17)
        {
          id v18 = (const void *)v17;
          if (!EAPOLClientItemIDRemovePasswordItem())
          {
            os_log_t v19 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v20 = v19;
              uint64_t v21 = objc_opt_class();
              *(_DWORD *)os_log_t v47 = 138543362;
              *(void *)&v47[4] = v21;
              id v22 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPOLClientItemIDRemovePasswordItem() failed", v47, 0xCu);
            }
          }
          if (!EAPOLClientItemIDSetIdentity())
          {
            os_log_t v23 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              long long v24 = v23;
              os_log_t v25 = objc_opt_class();
              *(_DWORD *)os_log_t v47 = 138543362;
              *(void *)&v47[4] = v25;
              id v26 = v25;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPOLClientItemIDSetIdentity() failed", v47, 0xCu);
            }
          }
          if (EAPOLClientConfigurationRemoveProfile())
          {
            if (EAPOLClientConfigurationSave()) {
              goto LABEL_39;
            }
            os_log_t v27 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_39;
            }
            BOOL v28 = v27;
            v29 = objc_opt_class();
            *(_DWORD *)os_log_t v47 = 138543362;
            *(void *)&v47[4] = v29;
            id v30 = v29;
            os_log_t v31 = "%{public}@ EAPOLClientConfigurationSave() failed";
          }
          else
          {
            os_log_t v44 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
LABEL_39:
              id v46 = (void *)qword_100105868;
              qword_100105868 = 0;

              CFRelease(v18);
              goto LABEL_34;
            }
            BOOL v28 = v44;
            v45 = objc_opt_class();
            *(_DWORD *)os_log_t v47 = 138543362;
            *(void *)&v47[4] = v45;
            id v30 = v45;
            os_log_t v31 = "%{public}@ EAPOLClientConfigurationRemoveProfile() failed";
          }
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v31, v47, 0xCu);

          goto LABEL_39;
        }
        os_log_t v41 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          id v33 = v41;
          id v42 = objc_opt_class();
          *(_DWORD *)os_log_t v47 = 138543362;
          *(void *)&v47[4] = v42;
          id v35 = v42;
          v36 = "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL";
          goto LABEL_32;
        }
LABEL_33:
        v43 = (void *)qword_100105868;
        qword_100105868 = 0;

LABEL_34:
        CFRelease(v5);
        goto LABEL_35;
      }
      os_log_t v32 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      id v33 = v32;
      uint64_t v34 = objc_opt_class();
      *(_DWORD *)os_log_t v47 = 138543362;
      *(void *)&v47[4] = v34;
      id v35 = v34;
      v36 = "%{public}@ metadata validation failed";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v36, v47, 0xCu);

      goto LABEL_33;
    }
LABEL_28:
    os_log_t v39 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    id v33 = v39;
    v40 = objc_opt_class();
    *(_DWORD *)os_log_t v47 = 138543362;
    *(void *)&v47[4] = v40;
    id v35 = v40;
    v36 = "%{public}@ failed to find EAP profile";
    goto LABEL_32;
  }
  os_log_t v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    *(_DWORD *)os_log_t v47 = 138543362;
    *(void *)&v47[4] = objc_opt_class();
    id v15 = *(id *)&v47[4];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", v47, 0xCu);
  }
LABEL_35:
}

- (BOOL)_setEAPConfigUsingEAPConfigAPI:(id)a3
{
  id v4 = a3;
  CFTypeRef cf = 0;
  id v5 = [(MCNewPayloadHandler *)self payload];
  id v6 = [v4 mutableCopy];
  if ([v5 usernameRequired]
    && ([v5 username], unsigned int v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    os_log_t v47 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v48 = v47;
      *(_DWORD *)buf = 138543362;
      id v66 = (id)objc_opt_class();
      id v49 = v66;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}@ username is not available", buf, 0xCu);
    }
    LODWORD(v8) = 0;
  }
  else
  {
    LODWORD(v8) = 1;
  }
  os_log_t v9 = [v6 objectForKey:@"TLSTrustedCertificates"];

  if (v9)
  {
    if (!v8) {
      goto LABEL_38;
    }
LABEL_26:
    os_log_t v31 = [v5 certificateUUID];

    if (v31)
    {
      id v32 = v6;
      id v33 = [(MCNewPayloadHandler *)self profileHandler];
      uint64_t v34 = [v5 certificateUUID];
      id v35 = [v33 persistentIDForCertificateUUID:v34];

      os_log_t v36 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v37 = v36;
        v38 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v66 = v38;
        __int16 v67 = 1026;
        LODWORD(v68) = v35 != 0;
        id v39 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ handling identity certs? %{public}d", buf, 0x12u);
      }
      if (v35 && (EAPSecIdentityHandleCreateSecIdentity() || !cf))
      {
        os_log_t v50 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v51 = v50;
          v52 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v66 = v52;
          id v53 = v52;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPSecIdentityHandleCreateSecIdentity() failed", buf, 0xCu);
        }
        LOBYTE(v8) = 0;
        goto LABEL_37;
      }
    }
    v40 = [v5 username];
    id v35 = [v40 dataUsingEncoding:4];

    os_log_t v41 = [v5 password];
    id v42 = [v41 dataUsingEncoding:4];

    id v32 = v6;
    [v6 removeObjectForKey:@"UserPassword"];
    id v8 = [v5 isHotspot];
    if (v8) {
      [v5 domainName];
    }
    else {
    v43 = [v5 ssid];
    }
    [v5 encryptionType];
    v45 = os_log_t v44 = v5;
    LOBYTE(v8) = [(MCNewWiFiPayloadHandler *)self _installEAPConfiguration:v43 isHotspot:v8 securityType:v45 authProperties:v32 username:v35 password:v42 identity:cf];

    id v5 = v44;
LABEL_37:

    id v6 = v32;
    goto LABEL_38;
  }
  int v54 = (int)v8;
  v55 = v6;
  id v57 = v4;
  os_log_t v58 = +[NSMutableArray array];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  os_log_t v56 = v5;
  id obj = [v5 payloadCertificateAnchorUUID];
  id v10 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v61;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v61 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v60 + 1) + 8 * i);
        id v15 = [(MCNewPayloadHandler *)self profileHandler];
        id v16 = [v15 persistentIDForCertificateUUID:v14];

        if (v16)
        {
          uint64_t v17 = [(MCNewPayloadHandler *)self profileHandler];
          id v18 = [v17 profile];
          id v19 = [v18 isInstalledForSystem];

          v20 = (__SecCertificate *)+[MCKeychain copyCertificateWithPersistentID:v16 useSystemKeychain:v19];
          if (v20)
          {
            uint64_t v21 = v20;
            CFDataRef v22 = SecCertificateCopyData(v20);
            if (v22)
            {
              os_log_t v23 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                long long v24 = v23;
                os_log_t v25 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                id v66 = v25;
                __int16 v67 = 2114;
                uint64_t v68 = v14;
                __int16 v69 = 1026;
                int v70 = (int)v19;
                id v26 = v25;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ adding trusted certificate UUID %{public}@ with system keychain? %{public}d", buf, 0x1Cu);
              }
              [v58 addObject:v22];
            }

            CFRelease(v21);
          }
        }
        else
        {
          os_log_t v27 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            BOOL v28 = v27;
            v29 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            id v66 = v29;
            __int16 v67 = 2114;
            uint64_t v68 = v14;
            id v30 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ certificate UUID %{public}@ referenced by this payload does not exist, skipping.", buf, 0x16u);
          }
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
    }
    while (v11);
  }

  id v6 = v55;
  if ([v58 count]) {
    [v55 setObject:v58 forKey:@"TLSTrustedCertificates"];
  }

  id v5 = v56;
  id v4 = v57;
  LOBYTE(v8) = v54;
  if (v54) {
    goto LABEL_26;
  }
LABEL_38:
  if (cf) {
    CFRelease(cf);
  }

  return (char)v8;
}

- (void)setAsideEAPConfig
{
  v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = (void *)qword_100105868;
  qword_100105868 = 0;

  uint64_t v5 = EAPOLClientConfigurationCreateWithAuthorization();
  if (v5)
  {
    id v6 = (const void *)v5;
    if ([v3 isHotspot])
    {
      [v3 domainName];
      uint64_t ProfileWithWLANDomain = EAPOLClientConfigurationGetProfileWithWLANDomain();
      id v8 = 0;
      if (ProfileWithWLANDomain)
      {
LABEL_4:
        if ([(MCNewWiFiPayloadHandler *)self _isMetadataValid:ProfileWithWLANDomain])
        {
          uint64_t v9 = EAPOLClientProfileGetID();
          id v10 = (void *)qword_100105868;
          qword_100105868 = v9;

          if (qword_100105868)
          {
            if (v8) {
              EAPOLClientProfileSetWLANSSIDAndSecurityType();
            }
            else {
              EAPOLClientProfileSetWLANDomain();
            }
            if (EAPOLClientConfigurationSave()) {
              goto LABEL_22;
            }
            os_log_t v21 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_22;
            }
            id v16 = v21;
            int v22 = 138543362;
            id v23 = (id)objc_opt_class();
            id v17 = v23;
            id v18 = "%{public}@ EAPOLClientConfigurationSave() failed";
            goto LABEL_21;
          }
          os_log_t v20 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            id v16 = v20;
            int v22 = 138543362;
            id v23 = (id)objc_opt_class();
            id v17 = v23;
            id v18 = "%{public}@ EAPOLClientProfileGetID() returned NULL";
            goto LABEL_21;
          }
LABEL_22:
          CFRelease(v6);
          goto LABEL_23;
        }
        os_log_t v19 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        id v16 = v19;
        int v22 = 138543362;
        id v23 = (id)objc_opt_class();
        id v17 = v23;
        id v18 = "%{public}@ metadata validation failed";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v22, 0xCu);

        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v14 = [v3 ssid];
      id v8 = [v14 dataUsingEncoding:4];

      uint64_t ProfileWithWLANDomain = EAPOLClientConfigurationGetProfileWithWLANSSID();
      if (ProfileWithWLANDomain) {
        goto LABEL_4;
      }
    }
    os_log_t v15 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    id v16 = v15;
    int v22 = 138543362;
    id v23 = (id)objc_opt_class();
    id v17 = v23;
    id v18 = "%{public}@ failed to find EAP Profile";
    goto LABEL_21;
  }
  os_log_t v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = v11;
    int v22 = 138543362;
    id v23 = (id)objc_opt_class();
    id v13 = v23;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", (uint8_t *)&v22, 0xCu);
  }
LABEL_23:
}

- (void)unsetAsideEAPConfig
{
  v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v5 = [v4 isSetAside];
  uint64_t v6 = qword_100105868;

  if (v5 && v6)
  {
    uint64_t v7 = EAPOLClientConfigurationCreateWithAuthorization();
    if (v7)
    {
      id v8 = (const void *)v7;
      uint64_t ProfileWithID = EAPOLClientConfigurationGetProfileWithID();
      id v10 = (void *)qword_100105868;
      qword_100105868 = 0;

      if (ProfileWithID)
      {
        if ([v3 isHotspot])
        {
          [v3 domainName];
          EAPOLClientProfileSetWLANDomain();
        }
        else
        {
          id v18 = [v3 ssid];
          os_log_t v19 = [v18 dataUsingEncoding:4];
          [v3 encryptionType];
          EAPOLClientProfileSetWLANSSIDAndSecurityType();
        }
        if (EAPOLClientConfigurationSave()) {
          goto LABEL_16;
        }
        os_log_t v20 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        os_log_t v15 = v20;
        int v21 = 138543362;
        id v22 = (id)objc_opt_class();
        id v16 = v22;
        id v17 = "%{public}@ EAPOLClientConfigurationSave() failed";
      }
      else
      {
        os_log_t v14 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
LABEL_16:
          CFRelease(v8);
          goto LABEL_17;
        }
        os_log_t v15 = v14;
        int v21 = 138543362;
        id v22 = (id)objc_opt_class();
        id v16 = v22;
        id v17 = "%{public}@ EAPOLClientConfigurationGetProfileWithID() returned NULL";
      }
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v21, 0xCu);

      goto LABEL_16;
    }
    os_log_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = v11;
      int v21 = 138543362;
      id v22 = (id)objc_opt_class();
      id v13 = v22;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", (uint8_t *)&v21, 0xCu);
    }
  }
LABEL_17:
}

- (BOOL)_setEAPConfig:(id)a3 onNetwork:(__WiFiNetwork *)a4
{
  id v5 = a3;
  uint64_t v6 = [(MCNewPayloadHandler *)self payload];
  sub_10005E704();
  id v7 = [v5 mutableCopy];
  if (![v6 usernameRequired]) {
    goto LABEL_4;
  }
  id v8 = [v6 username];

  if (v8)
  {
    uint64_t v9 = [v6 username];
    [v7 setObject:v9 forKey:@"UserName"];

LABEL_4:
    BOOL v10 = 1;
    goto LABEL_5;
  }
  id v39 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler requires a username but a username is not available.", buf, 2u);
  }
  BOOL v10 = 0;
LABEL_5:
  os_log_t v11 = [v7 objectForKey:@"TLSTrustedCertificates"];

  if (v11)
  {
    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v43 = v10;
    os_log_t v44 = v7;
    id v46 = v5;
    os_log_t v20 = +[NSMutableArray array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v45 = v6;
    int v21 = [v6 payloadCertificateAnchorUUID];
    id v48 = [v21 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v48)
    {
      uint64_t v22 = *(void *)v51;
      uint64_t v47 = *(void *)v51;
      do
      {
        for (i = 0; i != v48; i = (char *)i + 1)
        {
          if (*(void *)v51 != v22) {
            objc_enumerationMutation(v21);
          }
          uint64_t v24 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          os_log_t v25 = [(MCNewPayloadHandler *)self profileHandler];
          id v26 = [v25 persistentIDForCertificateUUID:v24];

          if (v26)
          {
            os_log_t v27 = [(MCNewPayloadHandler *)self profileHandler];
            BOOL v28 = [v27 profile];
            id v29 = [v28 isInstalledForSystem];

            id v30 = (__SecCertificate *)+[MCKeychain copyCertificateWithPersistentID:v26 useSystemKeychain:v29];
            if (v30)
            {
              os_log_t v31 = v30;
              CFDataRef v32 = SecCertificateCopyData(v30);
              if (v32)
              {
                id v33 = v21;
                uint64_t v34 = self;
                id v35 = v20;
                os_log_t v36 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v24;
                  __int16 v55 = 1026;
                  int v56 = (int)v29;
                  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler adding trusted certificate UUID %{public}@ with system keychain? %{public}d", buf, 0x12u);
                }
                os_log_t v20 = v35;
                [v35 addObject:v32];
                self = v34;
                int v21 = v33;
                uint64_t v22 = v47;
              }

              CFRelease(v31);
            }
          }
          else
          {
            v37 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v24;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler certificate UUID %{public}@ referenced by this payload does not exist, skipping.", buf, 0xCu);
            }
          }
        }
        id v48 = [v21 countByEnumeratingWithState:&v50 objects:v57 count:16];
      }
      while (v48);
    }

    id v7 = v44;
    if ([v20 count]) {
      [v44 setObject:v20 forKey:@"TLSTrustedCertificates"];
    }

    uint64_t v6 = v45;
    id v5 = v46;
    LOBYTE(v10) = v43;
    if (v43)
    {
LABEL_7:
      uint64_t v12 = [v6 certificateUUID];

      if (!v12)
      {
LABEL_43:
        v40 = +[NSDictionary dictionaryWithObject:v7 forKey:@"EAPClientConfiguration"];
        WiFiNetworkSetProperty();
        os_log_t v41 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v40;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setEAPConfig succeeded with EAP profile: %{public}@", buf, 0xCu);
        }

        goto LABEL_46;
      }
      id v13 = [(MCNewPayloadHandler *)self profileHandler];
      os_log_t v14 = [v6 certificateUUID];
      os_log_t v15 = [v13 persistentIDForCertificateUUID:v14];

      id v16 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v15 != 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler handling identity certs? %{public}d", buf, 8u);
      }
      if (v15)
      {
        *(void *)buf = 0;
        EAPSecIdentityHandleCreateSecIdentity();
        if (*(void *)buf && (id v17 = (const void *)EAPSecIdentityHandleCreate(), CFRelease(*(CFTypeRef *)buf), v17))
        {
          [v7 setObject:v17 forKey:@"TLSIdentityHandle"];
          CFRelease(v17);
          id v18 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v49 = 0;
            os_log_t v19 = "MCNewWiFiPayloadHandler set identity handle.";
LABEL_41:
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, v49, 2u);
          }
        }
        else
        {
          [v7 setObject:v15 forKey:@"TLSIdentityHandle"];
          id v18 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v49 = 0;
            os_log_t v19 = "MCNewWiFiPayloadHandler set persistent ID as identity handle.";
            goto LABEL_41;
          }
        }
      }

      goto LABEL_43;
    }
  }
  v38 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler setEAPConfig failed.", buf, 2u);
  }
LABEL_46:

  return v10;
}

- (void)_updateWiFiCustomSetWithSetID:(id)a3 forSSID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)WiFiManagerClientCopyProperty();
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 mutableCopy];
    [v9 setObject:v5 forKey:v6];
    WiFiManagerClientSetProperty();
    BOOL v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v9;
      os_log_t v11 = "MCNewWiFiPayloadHandler updated custom settings: %{public}@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id v9 = +[NSDictionary dictionaryWithObject:v5 forKey:v6];
    WiFiManagerClientSetProperty();
    BOOL v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v5;
      os_log_t v11 = "MCNewWiFiPayloadHandler set custom settings: %{public}@";
      goto LABEL_6;
    }
  }
}

- (BOOL)_applyProxyCredential:(id)a3
{
  id v4 = a3;
  id v5 = [(MCNewPayloadHandler *)self payload];
  id v6 = [v5 proxyServer];
  id v7 = [v6 length];
  if (v7)
  {
    id v8 = +[NSURLCredentialStorage sharedCredentialStorage];
    id v9 = [(MCNewPayloadHandler *)self profileHandler];
    BOOL v10 = [v9 profile];
    [v8 set_useSystemKeychain:[v10 isInstalledForSystem]];

    os_log_t v11 = [v5 proxyServerPort];
    if (v11)
    {
      int v12 = [v5 proxyServerPort];
      uint64_t v13 = (int)[v12 intValue];
    }
    else
    {
      uint64_t v13 = 80;
    }

    id v15 = objc_alloc((Class)NSURLProtectionSpace);
    id v16 = [v5 proxyServer];
    id v17 = [v15 initWithProxyHost:v16 port:v13 type:NSURLProtectionSpaceHTTP realm:0 authenticationMethod:NSURLAuthenticationMethodDefault];

    id v18 = objc_alloc((Class)NSURLProtectionSpace);
    os_log_t v19 = [v5 proxyServer];
    id v20 = [v18 initWithProxyHost:v19 port:v13 type:NSURLProtectionSpaceHTTPS realm:0 authenticationMethod:NSURLAuthenticationMethodDefault];

    [v8 setDefaultCredential:v4 forProtectionSpace:v17];
    [v8 setDefaultCredential:v4 forProtectionSpace:v20];
  }
  else
  {
    os_log_t v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler requires a proxy server to be provided.", v22, 2u);
    }
  }

  return v7 != 0;
}

- (BOOL)_configureEncryptionTypeForWiFiNetwork:(__WiFiNetwork *)a3 payload:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  id v9 = [v8 eapClientConfig];

  if (v9)
  {
    [v8 isWPA];
    WiFiNetworkSetWPA();
    [v8 isWEP];
    WiFiNetworkSetWEP();
    BOOL v10 = [v8 eapClientConfig];
    unsigned __int8 v11 = [(MCNewWiFiPayloadHandler *)self _setEAPConfig:v10 onNetwork:a3];

    if (v11)
    {
      CFStringRef v37 = @"IE_KEY_WPA_AUTHSELS";
      v38 = &off_1000F5330;
      LOBYTE(a5) = 1;
      +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      WiFiNetworkSetProperty();
    }
    else if (a5)
    {
      uint64_t v15 = MCWiFiErrorDomain;
      id v16 = [@"ERROR_WIFI_COULD_NOT_SETUP_EAP" MCAppendGreenteaSuffix];
      id v17 = [v8 ssid];
      id v18 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, 13004, v18, MCErrorTypeFatal, v17, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
    goto LABEL_27;
  }
  int v12 = [v8 encryptionType];
  unsigned int v13 = [v12 isEqualToString:kMCWiFiEncryptionTypeWEP];

  if (v13)
  {
    os_log_t v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting WEP network", buf, 2u);
    }
    LOBYTE(a5) = 1;
    WiFiNetworkSetWEP();
    goto LABEL_27;
  }
  os_log_t v19 = [v8 encryptionType];
  unsigned int v20 = [v19 isEqualToString:kMCWiFiEncryptionTypeWPA];

  if (v20)
  {
    int v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting WPA network", buf, 2u);
    }
    LOBYTE(a5) = 1;
    WiFiNetworkSetWPA();
    goto LABEL_27;
  }
  uint64_t v22 = [v8 encryptionType];
  unsigned int v23 = [v22 isEqualToString:kMCWiFiEncryptionTypeWPA2];

  if (v23)
  {
    uint64_t v24 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting WPA2 network", buf, 2u);
    }
    LOBYTE(a5) = 1;
LABEL_26:
    WiFiNetworkSetSAE();
    goto LABEL_27;
  }
  os_log_t v25 = [v8 encryptionType];
  unsigned int v26 = [v25 isEqualToString:kMCWiFiEncryptionTypeWPA3];

  if (v26)
  {
    os_log_t v27 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting WPA3 network", buf, 2u);
    }
    LOBYTE(a5) = 1;
    goto LABEL_26;
  }
  BOOL v28 = [v8 encryptionType];
  unsigned int v29 = [v28 isEqualToString:kMCWiFiEncryptionTypeAny];

  id v30 = _MCLogObjects[0];
  BOOL v31 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
  if (v29)
  {
    if (v31)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting Any-secured network", buf, 2u);
    }
    LOBYTE(a5) = 1;
    WiFiNetworkSetWEP();
    WiFiNetworkSetWPA();
    goto LABEL_26;
  }
  if (v31)
  {
    id v33 = v30;
    uint64_t v34 = [v8 encryptionType];
    *(_DWORD *)buf = 138543362;
    os_log_t v36 = v34;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler encryption type not recognized: %{public}@", buf, 0xCu);
  }
  LOBYTE(a5) = 1;
LABEL_27:

  return (char)a5;
}

- (BOOL)_networkServiceRequired
{
  v2 = [(MCNewPayloadHandler *)self payload];
  unsigned int v3 = [v2 proxyType];
  id v4 = [v2 qosMarkingConfig];
  LOBYTE(v5) = 1;
  if (![v4 count] && v3 - 1 >= 2)
  {
    id v6 = [v2 proxyUsername];
    if (v6)
    {
    }
    else
    {
      id v5 = [v2 proxyPassword];

      if (v5)
      {
        LOBYTE(v5) = 1;
      }
      else
      {
        os_log_t v7 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          id v5 = v7;
          id v8 = [v2 ssid];
          int v10 = 138543362;
          unsigned __int8 v11 = v8;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler custom service not required for SSID: %{public}@", (uint8_t *)&v10, 0xCu);

          LOBYTE(v5) = 0;
        }
      }
    }
  }

  return (char)v5;
}

- (BOOL)_configureNetworkServiceForWiFiNetwork:(__WiFiNetwork *)a3 outError:(id *)a4
{
  os_log_t v7 = [(MCNewPayloadHandler *)self payload];
  SCPreferencesRef v8 = SCPreferencesCreateWithAuthorization(0, @"com.apple.settings.wi-fi", 0, 0);
  if (!v8)
  {
    os_log_t v19 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot create system configuration preferences.", buf, 2u);
    }
    goto LABEL_144;
  }
  SCPreferencesRef v9 = v8;
  int v10 = (void *)WiFiManagerClientCopyProperty();
  if (!SCPreferencesLock(v9, 1u))
  {
    unsigned int v20 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot lock system configuration preferences.", buf, 2u);
    }

    CFRelease(v9);
    goto LABEL_144;
  }
  SCPreferencesSynchronize(v9);
  CFArrayRef v11 = SCNetworkSetCopyAll(v9);
  if (!v11)
  {
    int v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot retrieve network sets from system configuration.", buf, 2u);
    }

    uint64_t v22 = 0;
    BOOL v23 = 1;
    goto LABEL_139;
  }
  SEL v144 = a2;
  name = [v7 ssid];
  [v10 objectForKey:];
  SCNetworkServiceRef service = (SCNetworkServiceRef)objc_claimAutoreleasedReturnValue();
  v150 = v10;
  if (!service)
  {
LABEL_13:
    id v16 = _MCLogObjects[0];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler attempting to create a new set for the network...", buf, 2u);
    }

    if (CFArrayGetCount(v11) < 1) {
      goto LABEL_29;
    }
    CFIndex v17 = 0;
    while (1)
    {
      ValueAtIndex = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v11, v17);
      if ([(__CFString *)(id)SCNetworkSetGetName(ValueAtIndex) isEqualToString:@"Automatic"])break; {
      if (++v17 >= CFArrayGetCount(v11))
      }
        goto LABEL_29;
    }
    uint64_t v24 = (const __SCNetworkSet *)CFRetain(ValueAtIndex);
    if (!v24)
    {
LABEL_29:
      os_log_t v25 = _MCLogObjects[0];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "MCNewWiFiPayloadHandler cannot get default set; using current set instead.",
          buf,
          2u);
      }

      uint64_t v24 = SCNetworkSetCopyCurrent(v9);
      if (!v24)
      {
        os_log_t v41 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot copy default set from system configuration.", buf, 2u);
        }
        uint64_t v22 = 0;
        CFTypeRef cf = 0;
        CFArrayRef v29 = 0;
        v157 = 0;
        set = 0;
        goto LABEL_92;
      }
    }
    unsigned int v26 = SCNetworkSetCreate(v9);
    set = v24;
    if (!v26)
    {
      id v42 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot create new set.", buf, 2u);
      }
      uint64_t v22 = 0;
      CFTypeRef cf = 0;
      CFArrayRef v29 = 0;
      v157 = 0;
      goto LABEL_92;
    }
    v157 = v26;
    SCNetworkSetSetName(v26, name);
    CFArrayRef v27 = SCNetworkSetCopyServices(v24);
    if (!v27)
    {
      int v54 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot get default services.", buf, 2u);
      }
      uint64_t v22 = 0;
      CFTypeRef cf = 0;
      CFArrayRef v29 = 0;
      goto LABEL_92;
    }
    CFArrayRef v28 = v27;
    v147 = v7;
    v148 = a4;
    if (CFArrayGetCount(v27) < 1)
    {
      CFArrayRef v29 = v28;
LABEL_108:
      BOOL v31 = v157;
LABEL_109:
      CFRelease(v29);
LABEL_110:
      CFStringRef SetID = SCNetworkSetGetSetID(v31);
      WiFiNetworkSetProperty();
      v73 = _MCLogObjects[0];
      long long v53 = set;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v160 = (id)SetID;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler set system configuration set ID: %{public}@", buf, 0xCu);
      }

      long long v60 = 0;
      unsigned int v13 = v157;
      goto LABEL_113;
    }
    CFArrayRef v29 = 0;
    CFIndex v30 = 0;
    servicea = 0;
    BOOL v31 = v157;
    do
    {
      CFDataRef v32 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v28, v30);
      SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(v32);
      if (Interface)
      {
        uint64_t v34 = Interface;
        while (1)
        {
          CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(v34);
          if (CFEqual(InterfaceType, kSCNetworkInterfaceTypeIEEE80211)) {
            break;
          }
          uint64_t v34 = SCNetworkInterfaceGetInterface(v34);
          if (!v34) {
            goto LABEL_50;
          }
        }
        os_log_t v36 = _MCLogObjects[0];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler found WiFi interface.", buf, 2u);
        }

        if (!v29)
        {
          CFStringRef v37 = _MCLogObjects[0];
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler creating new service...", buf, 2u);
          }

          v38 = SCNetworkServiceCreate(v9, v34);
          if (!v38)
          {
            v102 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot create new service.", buf, 2u);
            }
            CFArrayRef v29 = 0;
LABEL_91:
            os_log_t v7 = v147;
            a4 = v148;
            CFRelease(v28);
            uint64_t v22 = 0;
            CFTypeRef cf = 0;
LABEL_92:
            unsigned int v57 = 1;
            int v58 = 1;
            goto LABEL_131;
          }
          CFArrayRef v29 = v38;
          if (!SCNetworkServiceEstablishDefaultConfiguration(v38))
          {
            __int16 v55 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_91;
            }
            *(_WORD *)buf = 0;
            int v56 = "MCNewWiFiPayloadHandler cannot establish new service.";
LABEL_90:
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, v56, buf, 2u);
            goto LABEL_91;
          }
          servicea = v32;
          CFDataRef v32 = v29;
        }
        BOOL v31 = v157;
      }
LABEL_50:
      if (!SCNetworkSetAddService(v31, v32))
      {
        __int16 v55 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_91;
        }
        *(_WORD *)buf = 0;
        int v56 = "MCNewWiFiPayloadHandler cannot add new service.";
        goto LABEL_90;
      }
      ++v30;
    }
    while (v30 < CFArrayGetCount(v28));
    if (!v29 || !servicea)
    {
      CFRelease(v28);
      if (!v29) {
        goto LABEL_110;
      }
      goto LABEL_109;
    }
    CFArrayRef ServiceOrder = SCNetworkSetGetServiceOrder(set);
    if (ServiceOrder) {
      CFArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, ServiceOrder);
    }
    else {
      CFArrayRef MutableCopy = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    }
    CFArrayRef v61 = MutableCopy;
    CFIndex Count = CFArrayGetCount(MutableCopy);
    CFStringRef ServiceID = SCNetworkServiceGetServiceID(servicea);
    v163.location = 0;
    v163.length = Count;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v61, v163, ServiceID);
    if (FirstIndexOfValue == -1)
    {
      __int16 v67 = _MCLogObjects[0];
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v160 = v61;
        __int16 v161 = 2114;
        CFArrayRef v162 = ServiceOrder;
        uint64_t v68 = "MCNewWiFiPayloadHandler failed to set service order: %{public}@. Maintaining old order: %{public}@";
        __int16 v69 = v67;
        os_log_type_t v70 = OS_LOG_TYPE_ERROR;
        uint32_t v71 = 22;
        goto LABEL_106;
      }
    }
    else
    {
      CFIndex v65 = FirstIndexOfValue;
      CFStringRef v66 = SCNetworkServiceGetServiceID(v29);
      CFArraySetValueAtIndex(v61, v65, v66);
      SCNetworkSetSetServiceOrder(v157, v61);
      __int16 v67 = _MCLogObjects[0];
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v160 = v61;
        uint64_t v68 = "MCNewWiFiPayloadHandler set service order: %{public}@";
        __int16 v69 = v67;
        os_log_type_t v70 = OS_LOG_TYPE_DEFAULT;
        uint32_t v71 = 12;
LABEL_106:
        _os_log_impl((void *)&_mh_execute_header, v69, v70, v68, buf, v71);
      }
    }

    CFRelease(v61);
    CFRelease(v28);
    goto LABEL_108;
  }
  v147 = v7;
  v148 = a4;
  if (CFArrayGetCount(v11) < 1) {
    goto LABEL_10;
  }
  CFIndex v12 = 0;
  while (1)
  {
    unsigned int v13 = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v11, v12);
    os_log_t v14 = (__CFString *)SCNetworkSetGetSetID(v13);
    if (v14)
    {
      if ([(__CFString *)v14 isEqualToString:service]) {
        break;
      }
    }
    if (++v12 >= CFArrayGetCount(v11)) {
      goto LABEL_10;
    }
  }
  if (!v13)
  {
LABEL_10:
    uint64_t v15 = _MCLogObjects[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot retrieve custom network set from system configuration.", buf, 2u);
    }

    a4 = v148;
    goto LABEL_13;
  }
  BOOL v43 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v160 = service;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler attempting to modify service for custom set ID: %{public}@...", buf, 0xCu);
  }
  CFArrayRef v44 = SCNetworkSetCopyServices(v13);
  if (!v44)
  {
    v59 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot get existing services.", buf, 2u);
    }

    uint64_t v22 = 0;
    CFTypeRef cf = 0;
    CFArrayRef v29 = 0;
    goto LABEL_191;
  }
  CFArrayRef v45 = v44;
  if (CFArrayGetCount(v44) <= 0)
  {
    CFRelease(v45);
    v157 = 0;
    long long v53 = 0;
  }
  else
  {
    CFArrayRef v29 = 0;
    CFIndex v46 = 0;
    do
    {
      uint64_t v47 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v45, v46);
      SCNetworkInterfaceRef v48 = SCNetworkServiceGetInterface(v47);
      if (v48)
      {
        id v49 = v48;
        while (1)
        {
          CFStringRef v50 = SCNetworkInterfaceGetInterfaceType(v49);
          if (CFEqual(v50, kSCNetworkInterfaceTypeIEEE80211)) {
            break;
          }
          id v49 = SCNetworkInterfaceGetInterface(v49);
          if (!v49) {
            goto LABEL_80;
          }
        }
        if (!v29)
        {
          long long v51 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler creating a new service...", buf, 2u);
          }
          long long v52 = SCNetworkServiceCreate(v9, v49);
          CFArrayRef v29 = v52;
          if (!v52)
          {
            v104 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v105 = "MCNewWiFiPayloadHandler cannot create new service.";
              goto LABEL_189;
            }
LABEL_190:
            CFRelease(v45);

            uint64_t v22 = 0;
            CFTypeRef cf = 0;
LABEL_191:
            v157 = 0;
            set = 0;
            unsigned int v57 = 1;
            int v58 = 1;
            os_log_t v7 = v147;
            a4 = v148;
            goto LABEL_131;
          }
          if (!SCNetworkServiceEstablishDefaultConfiguration(v52))
          {
            v104 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_190;
            }
            *(_WORD *)buf = 0;
            v105 = "MCNewWiFiPayloadHandler cannot establish new service.";
LABEL_189:
            _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, v105, buf, 2u);
            goto LABEL_190;
          }
          if (!SCNetworkServiceRemove(v47))
          {
            v104 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_190;
            }
            *(_WORD *)buf = 0;
            v105 = "MCNewWiFiPayloadHandler cannot remove old service.";
            goto LABEL_189;
          }
          if (!SCNetworkSetAddService(v13, v29))
          {
            v104 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_190;
            }
            *(_WORD *)buf = 0;
            v105 = "MCNewWiFiPayloadHandler cannot add new service.";
            goto LABEL_189;
          }
        }
      }
LABEL_80:
      ++v46;
    }
    while (v46 < CFArrayGetCount(v45));
    CFRelease(v45);
    if (v29) {
      CFRelease(v29);
    }
    v157 = 0;
    long long v53 = 0;
  }
  long long v60 = service;
LABEL_113:
  CFArrayRef v74 = (const __CFArray *)WiFiManagerClientCopyDevices();
  set = v53;
  if (v74)
  {
    CFArrayRef v75 = v74;
    if (CFArrayGetCount(v74))
    {
      CFArrayGetValueAtIndex(v75, 0);
      v146 = WiFiDeviceClientGetInterfaceName();
    }
    else
    {
      v146 = 0;
    }
    CFRelease(v75);
  }
  else
  {
    v146 = 0;
  }
  CFArrayRef v76 = SCNetworkSetCopyServices(v13);
  SCNetworkServiceRef serviceb = v60;
  if (!v76) {
    goto LABEL_127;
  }
  CFArrayRef v77 = v76;
  if (CFArrayGetCount(v76) < 1)
  {
LABEL_126:
    CFRelease(v77);
    goto LABEL_127;
  }
  CFIndex v78 = 0;
  while (1)
  {
    v79 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v77, v78);
    v80 = SCNetworkServiceGetInterface(v79);
    if ([(__CFString *)(id)SCNetworkInterfaceGetInterfaceType(v80) isEqualToString:kSCNetworkInterfaceTypeIEEE80211])break; {
LABEL_125:
    }
    if (++v78 >= CFArrayGetCount(v77)) {
      goto LABEL_126;
    }
  }
  v81 = SCNetworkInterfaceGetBSDName(v80);
  if (![v81 isEqualToString:v146])
  {

    goto LABEL_125;
  }
  v92 = _MCLogObjects[0];
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v160 = v146;
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler found WiFi service matching interface name: %{public}@", buf, 0xCu);
  }

  v93 = (const __SCNetworkService *)CFRetain(v79);
  CFRelease(v77);
  if (!v93)
  {
LABEL_127:
    v82 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler could not find WiFi service in system configuration.", buf, 2u);
    }
    CFTypeRef cf = 0;
    uint64_t v22 = 0;
    unsigned int v57 = 1;
    int v58 = 1;
    os_log_t v7 = v147;
    a4 = v148;
    goto LABEL_130;
  }
  v94 = SCNetworkSetGetServiceOrder(v13);
  CFTypeRef cf = v93;
  if (([v94 containsObject:SCNetworkServiceGetServiceID(v93)] & 1) == 0)
  {
    v140 = +[NSAssertionHandler currentHandler];
    [v140 handleFailureInMethod:v144, self, @"MCNewWiFiPayloadHandler.m", 999, @"MCNewWiFiPayloadHandler's new WiFi service %@ isn't in the new network set", v93 object file lineNumber description];
  }
  os_log_t v7 = v147;
  v95 = [v147 qosMarkingConfig];
  if ([v95 count] && !SCNetworkInterfaceSetQoSMarkingPolicy())
  {
    v103 = _MCLogObjects[0];
    a4 = v148;
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler could not set WiFi service QoS Marking Policy in system configuration.", buf, 2u);
    }
    uint64_t v22 = 0;
    unsigned int v57 = 1;
    int v58 = 1;
    goto LABEL_236;
  }
  uint64_t v22 = SCNetworkServiceCopyProtocol(v93, kSCEntNetProxies);
  a4 = v148;
  v145 = v95;
  if (v22)
  {
    unsigned int v96 = [v147 proxyType];
    if (v96 == 1)
    {
      os_log_t v97 = +[NSMutableDictionary dictionary];
      v106 = [v147 proxyPACURLString];

      if (v106)
      {
        [v97 setObject:&off_1000F5260 forKeyedSubscript:kSCPropNetProxiesProxyAutoConfigEnable];
        v107 = [v147 proxyPACURLString];
        [v97 setObject:v107 forKeyedSubscript:kSCPropNetProxiesProxyAutoConfigURLString];
      }
      else
      {
        [v97 setObject:&off_1000F5260 forKeyedSubscript:kSCPropNetProxiesProxyAutoDiscoveryEnable];
      }
      if ([v147 proxyPACFallbackAllowed]) {
        v110 = &off_1000F5260;
      }
      else {
        v110 = &off_1000F5278;
      }
      [v97 setObject:v110 forKeyedSubscript:kSCPropNetProxiesFallBackAllowed];
      v111 = +[NSNumber numberWithInt:2];
      [v97 setObject:v111 forKey:@"HTTPProxyType"];

      a4 = v148;
    }
    else if (v96 == 2)
    {
      os_log_t v97 = +[NSMutableDictionary dictionary];
      v98 = [v147 proxyServer];

      if (v98)
      {
        v99 = [v147 proxyServer];
        [v97 setObject:v99 forKey:kSCPropNetProxiesHTTPProxy];

        v100 = [v147 proxyServer];
        [v97 setObject:v100 forKey:kSCPropNetProxiesHTTPSProxy];
      }
      v101 = [v147 proxyServerPort];
      if (v101)
      {
        [v97 setObject:v101 forKey:kSCPropNetProxiesHTTPPort];
      }
      else
      {
        v108 = +[NSNumber numberWithInt:80];
        [v97 setObject:v108 forKey:kSCPropNetProxiesHTTPPort];

        a4 = v148;
      }

      v109 = [v147 proxyServerPort];
      if (v109)
      {
        [v97 setObject:v109 forKey:kSCPropNetProxiesHTTPSPort];
      }
      else
      {
        +[NSNumber numberWithInt:80];
        v113 = v112 = a4;
        [v97 setObject:v113 forKey:kSCPropNetProxiesHTTPSPort];

        a4 = v112;
      }

      v114 = +[NSNumber numberWithInt:1];
      [v97 setObject:v114 forKey:kSCPropNetProxiesHTTPEnable];

      v115 = +[NSNumber numberWithInt:1];
      [v97 setObject:v115 forKey:kSCPropNetProxiesHTTPSEnable];

      v116 = +[NSNumber numberWithInt:1];
      [v97 setObject:v116 forKey:@"HTTPProxyType"];
    }
    else
    {
      os_log_t v97 = (os_log_t)[(__CFDictionary *)SCNetworkProtocolGetConfiguration(v22) mutableCopy];
    }
    v117 = [v147 proxyUsername];
    if (v117)
    {

      goto LABEL_208;
    }
    v118 = [v147 proxyPassword];

    if (v118)
    {
LABEL_208:
      v119 = +[NSNumber numberWithInt:1];
      [v97 setObject:v119 forKey:@"HTTPProxyAuthenticated"];

      uint64_t v120 = [v147 proxyUsername];
      v121 = (void *)v120;
      if (v120) {
        CFStringRef v122 = (const __CFString *)v120;
      }
      else {
        CFStringRef v122 = &stru_1000ECAD0;
      }
      [v97 setObject:v122 forKey:@"HTTPProxyUsername"];

      [v97 setObject:&stru_1000ECAD0 forKey:@"HTTPProxyPassword"];
    }
    SCNetworkProtocolSetConfiguration(v22, (CFDictionaryRef)v97);
    v123 = _MCLogObjects[0];
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v160 = v97;
      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler set proxy protocol configuration: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    os_log_t v97 = _MCLogObjects[0];
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot find proxy protocol for the WiFi service.", buf, 2u);
    }
  }

  SCPreferencesCommitChanges(v9);
  SCPreferencesApplyChanges(v9);
  SCPreferencesSynchronize(v9);
  SCPreferencesUnlock(v9);
  v124 = [v147 proxyUsername];

  if (!v124)
  {
    unsigned int v57 = 0;
LABEL_233:
    uint64_t Property = WiFiNetworkGetProperty();
    v95 = v145;
    if (Property) {
      [(MCNewWiFiPayloadHandler *)self _updateWiFiCustomSetWithSetID:Property forSSID:name];
    }
    int v58 = 0;
    goto LABEL_236;
  }
  v149 = a4;
  v125 = [v147 proxyUsername];
  v126 = [v147 proxyPassword];
  v127 = +[NSURLCredential credentialWithUser:v125 password:v126 persistence:2];

  unsigned int v57 = ![(MCNewWiFiPayloadHandler *)self _applyProxyCredential:v127];
  if (v57)
  {
    v129 = v147;
    goto LABEL_226;
  }
  v128 = [v147 proxyUsername];
  v129 = v147;
  v130 = [v147 proxyPassword];
  v131 = (const void *)CFURLCredentialCreate();

  if (!v131)
  {
LABEL_232:

    os_log_t v7 = v147;
    a4 = v149;
    goto LABEL_233;
  }
  Archive = (const void *)_CFURLCredentialCreateArchive();
  if (!Archive)
  {
LABEL_231:
    CFRelease(v131);
    goto LABEL_232;
  }
  v133 = Archive;
  CFDataRef Data = CFPropertyListCreateData(0, Archive, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  CFRelease(v133);
  if (!Data)
  {
    v138 = _MCLogObjects[0];
    if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot serialize credential. Ignoring.", buf, 2u);
    }
    goto LABEL_230;
  }
  uint64_t v135 = +[NSString MCMakeUUID];
  v143 = [(MCNewPayloadHandler *)self profileHandler];
  v142 = [v143 profile];
  id v158 = 0;
  v141 = v135;
  +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setData:forService:account:label:description:useSystemKeychain:outError:", Data, @"MCWiFiCredential", v135, 0, 0, [v142 isInstalledForSystem], &v158);
  id v136 = v158;

  CFRelease(Data);
  if (!v136)
  {
    v138 = v141;
    [v147 setCredentialUUID:v141];
LABEL_230:

    goto LABEL_231;
  }
  v137 = _MCLogObjects[0];
  if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v160 = v136;
    _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot commit credential to keychain with error: %{public}@", buf, 0xCu);
  }

  CFRelease(v131);
  unsigned int v57 = 1;
LABEL_226:

  int v58 = 0;
  os_log_t v7 = v129;
  a4 = v149;
  v95 = v145;
LABEL_236:

LABEL_130:
  CFArrayRef v29 = 0;
LABEL_131:

  BOOL v23 = v57 != 0;
  if (v29)
  {
    SCNetworkServiceRemove(v29);
    CFRelease(v29);
  }
  if (v157)
  {
    SCNetworkSetRemove(v157);
    CFRelease(v157);
  }
  if (set) {
    CFRelease(set);
  }
  if (!cf)
  {
    if (!v58) {
      goto LABEL_140;
    }
LABEL_139:
    SCPreferencesUnlock(v9);
    goto LABEL_140;
  }
  CFRelease(cf);
  if (v58) {
    goto LABEL_139;
  }
LABEL_140:
  if (v11) {
    CFRelease(v11);
  }
  CFRelease(v9);
  if (v22)
  {
    CFRelease(v22);
    if (v23) {
      goto LABEL_144;
    }
LABEL_150:
    v86 = _MCLogObjects[0];
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      v90 = [v7 ssid];
      *(_DWORD *)buf = 138543362;
      id v160 = v90;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler successfully configured WiFi for SSID: %{public}@", buf, 0xCu);
    }
    BOOL v89 = 1;
LABEL_153:

    goto LABEL_154;
  }
  if (!v23) {
    goto LABEL_150;
  }
LABEL_144:
  v83 = _MCLogObjects[0];
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
  {
    v84 = [v7 ssid];
    *(_DWORD *)buf = 138543362;
    id v160 = v84;
    _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler failed to configure WiFi for SSID: %{public}@", buf, 0xCu);
  }
  if (a4)
  {
    uint64_t v85 = MCWiFiErrorDomain;
    v86 = [@"ERROR_WIFI_COULD_NOT_SETUP_PROXY" MCAppendGreenteaSuffix];
    v87 = [v7 ssid];
    v88 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v85, 13005, v88, MCErrorTypeFatal, v87, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v89 = 0;
    goto LABEL_153;
  }
  BOOL v89 = 0;
LABEL_154:

  return v89;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  SCPreferencesRef v9 = [(MCNewPayloadHandler *)self payload];
  unsigned int v10 = [(MCNewWiFiPayloadHandler *)self _isWiFiDaemonAvailable];
  CFArrayRef v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"NO";
    if (v10) {
      CFStringRef v12 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    *(void *)BOOL v89 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler Wi-Fi daemon is available (install): %{public}@", buf, 0xCu);
  }
  unsigned int v13 = (const void *)WiFiNetworkCreate();
  if (!v13 || (self->_manager ? (char v14 = v10) : (char v14 = 0), (v14 & 1) == 0))
  {
    CFArrayRef v27 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      BOOL v28 = self->_manager != 0;
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)BOOL v89 = v13 != 0;
      *(_WORD *)&v89[4] = 1026;
      *(_DWORD *)&v89[6] = v28;
      LOWORD(v90) = 1026;
      *(_DWORD *)((char *)&v90 + 2) = v10;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot create WiFi network. Network? %{public}d, Manager? %{public}d, wifid? %{public}d", buf, 0x14u);
    }
    uint64_t v29 = MCWiFiErrorDomain;
    CFIndex v30 = [@"ERROR_WIFI_COULD_NOT_CREATE" MCAppendGreenteaSuffix];
    BOOL v31 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v29, 13003, v31, MCErrorTypeFatal, 0);
    id v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_27:
    if (!v13) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  [v9 ssid];
  WiFiNetworkSetProperty();
  +[NSNumber numberWithInt:2];
  WiFiNetworkSetProperty();
  [v9 isHidden];
  WiFiNetworkSetDirectedState();
  uint64_t v15 = [v8 objectForKey:kMCInstallProfileOptionFilterFlag];
  unsigned __int8 v16 = [v15 intValue];

  if ((v16 & 2) != 0)
  {
    WiFiNetworkSetProperty();
    CFIndex v17 = [(id)objc_opt_class() _originatorIdentifierFromInstallationOptions:v8];
    if (v17) {
      WiFiNetworkAddSIMIdentifier();
    }
    CFIndex v78 = self;
    id v18 = [(id)objc_opt_class() _originatorNameFromInstallationOptions:v8];
    if (v18) {
      WiFiNetworkSetOriginatorName();
    }
    os_log_t v19 = [v9 isFirstAutoJoinRestricted];
    unsigned int v20 = v19;
    if (v19)
    {
      [v19 BOOLValue];
      WiFiNetworkDisableAutoJoinUntilFirstUserJoin();
    }
    os_log_t v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = v21;
      [v9 ssid];
      v24 = BOOL v23 = a6;
      *(_DWORD *)buf = 138544130;
      *(void *)BOOL v89 = v24;
      *(_WORD *)&v89[8] = 2114;
      v90 = v18;
      __int16 v91 = 2114;
      v92 = v17;
      __int16 v93 = 2114;
      v94 = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler Carrier Profile WiFi originator properties: SSID=%{public}@, name=%{public}@, identifier=%{public}@, autojoin=%{public}@", buf, 0x2Au);

      a6 = v23;
    }

    self = v78;
  }
  [v9 UUID];
  WiFiNetworkSetProperty();
  [v9 organization];
  WiFiNetworkSetProperty();
  [v9 identifier];
  WiFiNetworkSetProperty();
  if (([v9 isWEP] & 1) == 0 && !objc_msgSend(v9, "isWPA"))
  {
    id v26 = 0;
LABEL_38:
    if ([v9 captiveBypass]) {
      WiFiNetworkSetProperty();
    }
    if ([v9 isHotspot]) {
      WiFiNetworkSetProperty();
    }
    v38 = [v9 domainName];

    if (v38)
    {
      id v39 = [v9 domainName];
      WiFiNetworkSetProperty();
    }
    v40 = [v9 HESSID];

    if (v40)
    {
      os_log_t v41 = [v9 HESSID];
      WiFiNetworkSetProperty();
    }
    [v9 isServiceProviderRoamingEnabled];
    WiFiNetworkSetProperty();
    id v42 = [v9 roamingConsortiumOIs];
    id v43 = [v42 count];

    if (v43)
    {
      CFArrayRef v44 = [v9 roamingConsortiumOIs];
      WiFiNetworkSetProperty();
    }
    CFArrayRef v45 = [v9 NAIRealmNames];
    id v46 = [v45 count];

    if (v46)
    {
      uint64_t v47 = [v9 NAIRealmNames];
      WiFiNetworkSetProperty();
    }
    SCNetworkInterfaceRef v48 = [v9 MCCAndMNCs];
    id v49 = [v48 count];

    id v77 = v8;
    if (v49)
    {
      CFArrayRef v75 = a6;
      v79 = self;
      CFStringRef v50 = [v9 MCCAndMNCs];
      long long v51 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v50 count]);

      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v52 = [v9 MCCAndMNCs];
      id v53 = [v52 countByEnumeratingWithState:&v82 objects:v87 count:16];
      if (v53)
      {
        id v54 = v53;
        uint64_t v55 = *(void *)v83;
        do
        {
          for (i = 0; i != v54; i = (char *)i + 1)
          {
            if (*(void *)v83 != v55) {
              objc_enumerationMutation(v52);
            }
            unsigned int v57 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            if ([v57 characterAtIndex:3] == 48)
            {
              id v58 = [v57 mutableCopy];
              [v58 replaceCharactersInRange:3 withString:@"F"];
              [v51 addObject:v58];
            }
            else
            {
              [v51 addObject:v57];
            }
          }
          id v54 = [v52 countByEnumeratingWithState:&v82 objects:v87 count:16];
        }
        while (v54);
      }

      WiFiNetworkSetProperty();
      self = v79;
      a6 = v75;
    }
    v59 = [v9 displayedOperatorName];

    if (v59)
    {
      long long v60 = [v9 displayedOperatorName];
      WiFiNetworkSetProperty();
    }
    CFArrayRef v61 = [v9 disableAssociationMACRandomization];

    if (v61)
    {
      os_log_t v62 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        long long v63 = v62;
        id v64 = [v9 disableAssociationMACRandomization];
        *(_DWORD *)buf = 138543362;
        *(void *)BOOL v89 = v64;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting MAC randomization disable to: %{public}@", buf, 0xCu);
      }
      CFIndex v65 = [v9 disableAssociationMACRandomization];
      [v65 BOOLValue];
      WiFiNetworkSetProperty();
    }
    sub_10005E704();
    CFStringRef v66 = [v9 password];
    id v67 = [v66 length];

    if (!v67) {
      goto LABEL_76;
    }
    CFArrayRef v76 = [v9 password];
    [v9 ssid];
    v69 = uint64_t v68 = self;
    os_log_type_t v70 = [(MCNewPayloadHandler *)v68 profileHandler];
    uint32_t v71 = [v70 profile];
    id v81 = v26;
    LOWORD(v74) = [v71 isInstalledForSystem];
    +[MCKeychain setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", v76, @"AirPort", v69, 0, 0, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0, v74, &v81);
    id v72 = v81;

    id v8 = v77;
    self = v68;

    id v26 = v72;
    if (!v72)
    {
LABEL_76:
      if (![(MCNewWiFiPayloadHandler *)self _networkServiceRequired]
        || (id v80 = v26,
            [(MCNewWiFiPayloadHandler *)self _configureNetworkServiceForWiFiNetwork:v13 outError:&v80], v73 = v80, v26, (id v26 = v73) == 0))
      {
        WiFiManagerClientAddNetwork();
        if (([v9 autoJoin] & 1) == 0)
        {
          WiFiManagerClientDisableNetwork();
          WiFiManagerClientEnable();
        }
      }
    }
    goto LABEL_27;
  }
  id v86 = 0;
  unsigned int v25 = [(MCNewWiFiPayloadHandler *)self _configureEncryptionTypeForWiFiNetwork:v13 payload:v9 outError:&v86];
  id v26 = v86;
  if (v25) {
    goto LABEL_38;
  }
LABEL_28:
  CFRelease(v13);
LABEL_29:
  CFDataRef v32 = _MCLogObjects[0];
  if (v26)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)BOOL v89 = v26;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler failed installWithInstaller with error: %{public}@", buf, 0xCu);
    }
    if (a6)
    {
      uint64_t v33 = MCWiFiErrorDomain;
      uint64_t v34 = [@"ERROR_WIFI_COULD_NOT_INSTALL" MCAppendGreenteaSuffix];
      id v35 = [v9 ssid];
      os_log_t v36 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v33, 13000, v36, v26, MCErrorTypeFatal, v35, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler successfully completed installWithInstaller with no errors.", buf, 2u);
  }

  return v26 == 0;
}

+ (id)_originatorIdentifierFromInstallationOptions:(id)a3
{
  unsigned int v3 = [a3 objectForKey:kMCInstallProfileOptionCarrierIdentifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)_originatorNameFromInstallationOptions:(id)a3
{
  unsigned int v3 = [a3 objectForKey:kMCInstallProfileOptionCarrierName];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isInstalled
{
  if (self->_manager && (CFArrayRef v3 = (const __CFArray *)WiFiManagerClientCopyNetworks()) != 0)
  {
    CFArrayRef v4 = v3;
    CFIndex Count = CFArrayGetCount(v3);
    if (Count < 1)
    {
      char v8 = 0;
    }
    else
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      char v8 = 0;
      do
      {
        if (CFArrayGetValueAtIndex(v4, v7))
        {
          SCPreferencesRef v9 = WiFiNetworkGetProperty();
          if (v9)
          {
            unsigned int v10 = [(MCNewPayloadHandler *)self payload];
            CFArrayRef v11 = [v10 UUID];
            unsigned int v12 = [v9 isEqualToString:v11] ^ 1;
          }
          else
          {
            LOBYTE(v12) = 1;
          }
          v8 |= v12;
        }
        ++v7;
      }
      while (v6 != v7);
    }
    CFRelease(v4);
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

- (BOOL)_isWiFiDaemonAvailable
{
  if (!self->_manager) {
    return 0;
  }
  CFArrayRef v2 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (!v2) {
    return 0;
  }
  CFArrayRef v3 = v2;
  BOOL v4 = CFArrayGetCount(v2) > 0;
  CFRelease(v3);
  return v4;
}

- (void)_removeProxyCredential
{
  CFArrayRef v3 = [(MCNewPayloadHandler *)self payload];
  uint64_t v4 = [v3 proxyServer];
  if (v4)
  {
    id v5 = (void *)v4;
    unsigned int v6 = [v3 proxyType];

    if (v6 == 2)
    {
      CFIndex v7 = [v3 proxyServerPort];
      if (v7)
      {
        char v8 = [v3 proxyServerPort];
        uint64_t v9 = (int)[v8 intValue];
      }
      else
      {
        uint64_t v9 = 80;
      }

      unsigned int v10 = +[NSURLCredentialStorage sharedCredentialStorage];
      CFArrayRef v11 = [(MCNewPayloadHandler *)self profileHandler];
      unsigned int v12 = [v11 profile];
      [v10 set_useSystemKeychain:[v12 isInstalledForSystem]];

      id v13 = objc_alloc((Class)NSURLProtectionSpace);
      char v14 = [v3 proxyServer];
      id v15 = [v13 initWithProxyHost:v14 port:v9 type:NSURLProtectionSpaceHTTP realm:0 authenticationMethod:NSURLAuthenticationMethodDefault];

      unsigned __int8 v16 = [v10 defaultCredentialForProtectionSpace:v15];
      if (v16)
      {
        unsigned int v25 = NSURLCredentialStorageRemoveSynchronizableCredentials;
        id v26 = &__kCFBooleanTrue;
        CFIndex v17 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        [v10 removeCredential:v16 forProtectionSpace:v15 options:v17];
      }
      id v18 = objc_alloc((Class)NSURLProtectionSpace);
      os_log_t v19 = [v3 proxyServer];
      id v20 = [v18 initWithProxyHost:v19 port:v9 type:NSURLProtectionSpaceHTTPS realm:0 authenticationMethod:NSURLAuthenticationMethodDefault];

      os_log_t v21 = [v10 defaultCredentialForProtectionSpace:v20];
      if (v21)
      {
        BOOL v23 = NSURLCredentialStorageRemoveSynchronizableCredentials;
        uint64_t v24 = &__kCFBooleanTrue;
        uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        [v10 removeCredential:v21 forProtectionSpace:v20 options:v22];
      }
    }
  }
}

- (void)_removeNetworkWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler removing WiFi network with UUID: %{public}@", buf, 0xCu);
  }
  if (self->_manager)
  {
    CFArrayRef v6 = (const __CFArray *)WiFiManagerClientCopyNetworks();
    if (v6)
    {
      CFArrayRef v7 = v6;
      CFIndex Count = CFArrayGetCount(v6);
      uint64_t v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = Count;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler iterating over %d WiFi networks", buf, 8u);
      }
      if (Count >= 1)
      {
        CFIndex v10 = 0;
        while (1)
        {
          CFArrayGetValueAtIndex(v7, v10);
          CFArrayRef v11 = WiFiNetworkGetProperty();
          unsigned int v12 = WiFiNetworkGetSSID();
          id v13 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = v12;
            __int16 v18 = 2114;
            os_log_t v19 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "MCNewWiFiPayloadHandler considering WiFi network \"%{public}@\" with payload UUID: %{public}@", buf, 0x16u);
          }
          if (v11 && [v11 isEqualToString:v4]) {
            break;
          }

          if (Count == ++v10) {
            goto LABEL_20;
          }
        }
        id v15 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v17 = v12;
          __int16 v18 = 2114;
          os_log_t v19 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler calling WiFiManagerClientRemoveNetwork() for WiFi network \"%{public}@\" with payload UUID: %{public}@", buf, 0x16u);
        }
        WiFiNetworkIsEAP();
        WiFiManagerClientRemoveNetwork();
      }
LABEL_20:
      CFRelease(v7);
    }
    else
    {
      char v14 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler WiFiManagerClientCopyNetworks returned nil.", buf, 2u);
      }
    }
    sub_10005E704();
  }
}

- (void)setAside
{
  if (self->_manager)
  {
    CFArrayRef v3 = (const __CFArray *)WiFiManagerClientCopyNetworks();
    if (v3)
    {
      CFArrayRef v4 = v3;
      CFIndex Count = CFArrayGetCount(v3);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        CFIndex v7 = 0;
        while (1)
        {
          CFArrayGetValueAtIndex(v4, v7);
          char v8 = WiFiNetworkGetProperty();
          if (v8)
          {
            uint64_t v9 = [(MCNewPayloadHandler *)self payload];
            CFIndex v10 = [v9 UUID];
            unsigned int v11 = [v8 isEqualToString:v10];

            if (v11) {
              break;
            }
          }

          if (v6 == ++v7) {
            goto LABEL_11;
          }
        }
        unsigned int v12 = +[NSString MCMakeUUID];
        setAsideUUID = self->_setAsideUUID;
        self->_setAsideUUID = v12;

        WiFiNetworkSetProperty();
        WiFiManagerClientUpdateNetwork();
        WiFiNetworkIsEAP();
      }
LABEL_11:
      CFRelease(v4);
    }
    id v14 = [(MCNewPayloadHandler *)self payload];
    if ([v14 proxyType] == 2) {
      [(MCNewWiFiPayloadHandler *)self _removeProxyCredential];
    }
    sub_10005E704();
  }
}

- (void)unsetAside
{
  if (self->_manager)
  {
    id v27 = [(MCNewPayloadHandler *)self payload];
    CFArrayRef v3 = [(MCNewPayloadHandler *)self profileHandler];
    unsigned int v4 = [v3 isSetAside];

    if (v4)
    {
      CFArrayRef v5 = (const __CFArray *)WiFiManagerClientCopyNetworks();
      if (v5)
      {
        CFArrayRef v6 = v5;
        CFIndex Count = CFArrayGetCount(v5);
        if (Count >= 1)
        {
          CFIndex v8 = Count;
          CFIndex v9 = 0;
          while (1)
          {
            CFArrayGetValueAtIndex(v6, v9);
            CFIndex v10 = WiFiNetworkGetProperty();
            unsigned int v11 = v10;
            if (v10)
            {
              if ([v10 isEqualToString:self->_setAsideUUID]) {
                break;
              }
            }

            if (v8 == ++v9) {
              goto LABEL_14;
            }
          }
          [v27 UUID];
          WiFiNetworkSetProperty();
          WiFiManagerClientUpdateNetwork();
          uint64_t Property = WiFiNetworkGetProperty();
          if (Property)
          {
            uint64_t v13 = Property;
            id v14 = [v27 ssid];
            [(MCNewWiFiPayloadHandler *)self _updateWiFiCustomSetWithSetID:v13 forSSID:v14];
          }
          WiFiNetworkIsEAP();
        }
LABEL_14:
        CFRelease(v6);
      }
      sub_10005E704();
      setAsideUUID = self->_setAsideUUID;
      self->_setAsideUUID = 0;
    }
    unsigned __int8 v16 = [v27 credentialUUID];
    if (v16)
    {
      id v17 = [(MCNewPayloadHandler *)self profileHandler];
      __int16 v18 = [v17 profile];
      CFDataRef v19 = (const __CFData *)+[MCKeychain dataFromService:account:label:description:useSystemKeychain:outError:](MCKeychain, "dataFromService:account:label:description:useSystemKeychain:outError:", @"MCWiFiCredential", v16, 0, 0, [v18 isInstalledForSystem], 0);

      if (v19)
      {
        CFPropertyListRef v20 = CFPropertyListCreateWithData(0, v19, 0, 0, 0);
        if (v20)
        {
          os_log_t v21 = v20;
          uint64_t v22 = _CFURLCredentialCreateFromArchive();
          if (v22)
          {
            BOOL v23 = (const void *)v22;
            uint64_t v24 = CFURLCredentialGetUsername();
            unsigned int v25 = (void *)CFURLCredentialCopyPassword();
            id v26 = +[NSURLCredential credentialWithUser:v24 password:v25 persistence:2];
            [(MCNewWiFiPayloadHandler *)self _applyProxyCredential:v26];
            CFRelease(v23);
          }
          CFRelease(v21);
        }
      }
    }
  }
}

- (void)remove
{
  CFArrayRef v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v4 = [v3 isSetAside];
  CFArrayRef v5 = &stru_1000ECAD0;
  if (v4) {
    CFArrayRef v5 = @"set-aside ";
  }
  CFArrayRef v6 = v5;

  CFIndex v7 = [(MCNewPayloadHandler *)self profileHandler];
  if ([v7 isSetAside])
  {
    CFIndex v8 = self->_setAsideUUID;
  }
  else
  {
    CFIndex v9 = [(MCNewPayloadHandler *)self payload];
    CFIndex v8 = [v9 UUID];
  }
  CFIndex v10 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138543618;
    CFStringRef v27 = v6;
    __int16 v28 = 2114;
    uint64_t v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler removing %{public}@WiFi payload with UUID: %{public}@", (uint8_t *)&v26, 0x16u);
  }
  unsigned int v11 = [(MCNewWiFiPayloadHandler *)self _isWiFiDaemonAvailable];
  unsigned int v12 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = @"NO";
    if (v11) {
      CFStringRef v13 = @"YES";
    }
    int v26 = 138543362;
    CFStringRef v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler Wi-Fi daemon is available (remove): %{public}@", (uint8_t *)&v26, 0xCu);
  }
  if (!self->_manager)
  {
    __int16 v18 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    int v26 = 138543618;
    CFStringRef v27 = v6;
    __int16 v28 = 2114;
    uint64_t v29 = v8;
    CFDataRef v19 = "MCNewWiFiPayloadHandler unable to remove %{public}@WiFi payload with UUID: %{public}@ - no manager";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v26, 0x16u);
    goto LABEL_27;
  }
  if ((v11 & 1) == 0)
  {
    __int16 v18 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    int v26 = 138543618;
    CFStringRef v27 = v6;
    __int16 v28 = 2114;
    uint64_t v29 = v8;
    CFDataRef v19 = "MCNewWiFiPayloadHandler unable to remove %{public}@WiFi payload with UUID: %{public}@ - wifid not available";
    goto LABEL_20;
  }
  id v14 = [(MCNewPayloadHandler *)self payload];
  id v15 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v16 = [v15 isSetAside];

  if (v16)
  {
    [(MCNewWiFiPayloadHandler *)self _removeNetworkWithUUID:self->_setAsideUUID];
    setAsideUUID = self->_setAsideUUID;
    self->_setAsideUUID = 0;
  }
  else
  {
    CFPropertyListRef v20 = [(MCNewPayloadHandler *)self payload];
    os_log_t v21 = [v20 UUID];
    [(MCNewWiFiPayloadHandler *)self _removeNetworkWithUUID:v21];

    [(MCNewWiFiPayloadHandler *)self _removeProxyCredential];
  }
  uint64_t v22 = [v14 credentialUUID];
  if (v22)
  {
    BOOL v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      CFStringRef v27 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler removing credential with UUID: %{public}@", (uint8_t *)&v26, 0xCu);
    }
    uint64_t v24 = [(MCNewPayloadHandler *)self profileHandler];
    unsigned int v25 = [v24 profile];
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", @"MCWiFiCredential", v22, 0, 0, [v25 isInstalledForSystem], 0);
  }
LABEL_27:
}

+ (id)managedWiFiNetworkNames
{
  CFArrayRef v2 = +[NSMutableArray array];
  if (qword_1001059B8) {
    goto LABEL_5;
  }
  qword_1001059B8 = WiFiManagerClientCreate();
  CFArrayRef v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    int v17 = 67109120;
    LODWORD(v18) = qword_1001059B8 != 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "MCNewWiFiPayloadHandler attempted to create WiFiManagerClient and got success status: %d", (uint8_t *)&v17, 8u);
  }
  if (qword_1001059B8)
  {
LABEL_5:
    CFArrayRef v4 = (const __CFArray *)WiFiManagerClientCopyNetworks();
    CFArrayRef v5 = v4;
    if (v4) {
      CFIndex Count = CFArrayGetCount(v4);
    }
    else {
      CFIndex Count = 0;
    }
    CFIndex v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      int v17 = 134217984;
      CFIndex v18 = Count;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "MCNewWiFiPayloadHandler checking %ld networks for profile-installed configurations...", (uint8_t *)&v17, 0xCu);
    }
    if (Count >= 1)
    {
      for (CFIndex i = 0; Count != i; ++i)
      {
        if (CFArrayGetValueAtIndex(v5, i))
        {
          if (WiFiNetworkGetProperty())
          {
            uint64_t SSID = WiFiNetworkGetSSID();
            if (SSID)
            {
              [v2 addObject:SSID];
            }
            else
            {
              os_log_t v14 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
              {
                LOWORD(v17) = 0;
                unsigned int v11 = v14;
                unsigned int v12 = "MCNewWiFiPayloadHandler skipped Wi-Fi network missing SSID";
                goto LABEL_22;
              }
            }
          }
          else
          {
            os_log_t v13 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v17) = 0;
              unsigned int v11 = v13;
              unsigned int v12 = "MCNewWiFiPayloadHandler skipped Wi-Fi network missing UUID";
              goto LABEL_22;
            }
          }
        }
        else
        {
          os_log_t v10 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v17) = 0;
            unsigned int v11 = v10;
            unsigned int v12 = "MCNewWiFiPayloadHandler skipped non-existent Wi-Fi network";
LABEL_22:
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v17, 2u);
          }
        }
      }
    }
    if (v5) {
      CFRelease(v5);
    }
  }
  id v15 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138543362;
    CFIndex v18 = (CFIndex)v2;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "MCNewWiFiPayloadHandler managed Wi-Fi networks: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end