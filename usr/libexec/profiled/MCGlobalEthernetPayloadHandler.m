@interface MCGlobalEthernetPayloadHandler
- (BOOL)_install:(id)a3 username:(id)a4 password:(id)a5 identity:(__SecIdentity *)a6;
- (BOOL)_isMetadataValid:(__EAPOLClientProfile *)a3;
- (BOOL)_setEAPConfig:(id)a3;
- (BOOL)_uninstall;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCGlobalEthernetPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (id)profileMetadata;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCGlobalEthernetPayloadHandler

- (MCGlobalEthernetPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MCGlobalEthernetPayloadHandler;
  return [(MCNewPayloadHandler *)&v5 initWithPayload:a3 profileHandler:a4];
}

- (id)profileMetadata
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 UUID];
  v4 = +[NSDictionary dictionaryWithObject:v3 forKey:kMCPayloadUUIDKey];

  return v4;
}

- (BOOL)_install:(id)a3 username:(id)a4 password:(id)a5 identity:(__SecIdentity *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(MCNewPayloadHandler *)self payload];
  uint64_t v14 = EAPOLClientConfigurationCreateWithAuthorization();
  if (v14)
  {
    v15 = (const void *)v14;
    uint64_t SystemEthernetProfile = EAPOLClientConfigurationGetSystemEthernetProfile();
    if (SystemEthernetProfile
      && ![(MCGlobalEthernetPayloadHandler *)self _isMetadataValid:SystemEthernetProfile])
    {
      os_log_t v28 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v29 = v28;
        int v49 = 138543362;
        id v50 = (id)objc_opt_class();
        id v30 = v50;
        v31 = "%{public}@ payload of this type is already installed";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&v49, 0xCu);
      }
    }
    else
    {
      uint64_t v17 = EAPOLClientProfileCreate();
      if (v17)
      {
        v18 = (const void *)v17;
        if (EAPOLClientProfileGetID())
        {
          uint64_t v19 = EAPOLClientItemIDCreateWithProfile();
          if (v19)
          {
            v20 = (const void *)v19;
            v21 = [v13 displayName];

            if (v21)
            {
              v22 = [v13 displayName];
              EAPOLClientProfileSetUserDefinedName();
            }
            EAPOLClientProfileSetAuthenticationProperties();
            v23 = [(MCGlobalEthernetPayloadHandler *)self profileMetadata];
            if (v23 && !EAPOLClientProfileSetInformation())
            {
              os_log_t v38 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                v39 = v38;
                int v49 = 138543362;
                id v50 = (id)objc_opt_class();
                id v40 = v50;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientProfileSetInformation() failed", (uint8_t *)&v49, 0xCu);
              }
              goto LABEL_46;
            }

            if (v11 && v12 && !EAPOLClientItemIDSetPasswordItem())
            {
              os_log_t v46 = _MCLogObjects[0];
              if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
                goto LABEL_46;
              }
              v42 = v46;
              int v49 = 138543362;
              id v50 = (id)objc_opt_class();
              id v43 = v50;
              v44 = "%{public}@ EAPOLClientItemIDSetPasswordItem() failed";
            }
            else if (a6 && !EAPOLClientItemIDSetIdentity())
            {
              os_log_t v45 = _MCLogObjects[0];
              if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
                goto LABEL_46;
              }
              v42 = v45;
              int v49 = 138543362;
              id v50 = (id)objc_opt_class();
              id v43 = v50;
              v44 = "%{public}@ EAPOLClientItemIDSetIdentity() failed";
            }
            else
            {
              if (EAPOLClientConfigurationSetSystemEthernetProfile())
              {
                if (EAPOLClientConfigurationSave())
                {
                  BOOL v24 = 1;
LABEL_47:
                  CFRelease(v20);
                  goto LABEL_48;
                }
                os_log_t v47 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  v42 = v47;
                  int v49 = 138543362;
                  id v50 = (id)objc_opt_class();
                  id v43 = v50;
                  v44 = "%{public}@ EAPOLClientConfigurationSave() failed";
                  goto LABEL_45;
                }
LABEL_46:
                BOOL v24 = 0;
                goto LABEL_47;
              }
              os_log_t v41 = _MCLogObjects[0];
              if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
                goto LABEL_46;
              }
              v42 = v41;
              int v49 = 138543362;
              id v50 = (id)objc_opt_class();
              id v43 = v50;
              v44 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
            }
LABEL_45:
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v44, (uint8_t *)&v49, 0xCu);

            goto LABEL_46;
          }
          os_log_t v37 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v34 = v37;
            int v49 = 138543362;
            id v50 = (id)objc_opt_class();
            id v35 = v50;
            v36 = "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL";
            goto LABEL_32;
          }
        }
        else
        {
          os_log_t v33 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v34 = v33;
            int v49 = 138543362;
            id v50 = (id)objc_opt_class();
            id v35 = v50;
            v36 = "%{public}@ EAPOLClientProfileGetID() returned NULL";
LABEL_32:
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v36, (uint8_t *)&v49, 0xCu);
          }
        }
        BOOL v24 = 0;
LABEL_48:
        CFRelease(v18);
        goto LABEL_49;
      }
      os_log_t v32 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v29 = v32;
        int v49 = 138543362;
        id v50 = (id)objc_opt_class();
        id v30 = v50;
        v31 = "%{public}@ EAPOLClientProfileCreate() returned NULL";
        goto LABEL_26;
      }
    }
    BOOL v24 = 0;
LABEL_49:
    CFRelease(v15);
    goto LABEL_50;
  }
  os_log_t v25 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v26 = v25;
    int v49 = 138543362;
    id v50 = (id)objc_opt_class();
    id v27 = v50;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", (uint8_t *)&v49, 0xCu);
  }
  BOOL v24 = 0;
LABEL_50:

  return v24;
}

- (BOOL)_uninstall
{
  v3 = [(MCNewPayloadHandler *)self payload];
  uint64_t v4 = EAPOLClientConfigurationCreateWithAuthorization();
  if (v4)
  {
    objc_super v5 = (const void *)v4;
    if (self->_setAsideProfileID) {
      uint64_t ProfileWithID = EAPOLClientConfigurationGetProfileWithID();
    }
    else {
      uint64_t ProfileWithID = EAPOLClientConfigurationGetSystemEthernetProfile();
    }
    if (ProfileWithID)
    {
      if ([(MCGlobalEthernetPayloadHandler *)self _isMetadataValid:ProfileWithID])
      {
        uint64_t v11 = EAPOLClientItemIDCreateWithProfile();
        if (v11)
        {
          id v12 = (const void *)v11;
          if (!EAPOLClientItemIDRemovePasswordItem())
          {
            os_log_t v13 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v14 = v13;
              int v36 = 138543362;
              id v37 = (id)objc_opt_class();
              id v15 = v37;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPOLClientItemIDRemovePasswordItem() failed", (uint8_t *)&v36, 0xCu);
            }
          }
          if (!EAPOLClientItemIDSetIdentity())
          {
            os_log_t v16 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = v16;
              v18 = objc_opt_class();
              int v36 = 138543362;
              id v37 = v18;
              id v19 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPOLClientItemIDSetIdentity() failed", (uint8_t *)&v36, 0xCu);
            }
          }
          if (self->_setAsideProfileID || EAPOLClientConfigurationSetSystemEthernetProfile())
          {
            if (EAPOLClientConfigurationRemoveProfile())
            {
              if (EAPOLClientConfigurationSave())
              {
                BOOL v10 = 1;
LABEL_40:
                CFRelease(v12);
                goto LABEL_30;
              }
              os_log_t v32 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                os_log_t v28 = v32;
                os_log_t v33 = objc_opt_class();
                int v36 = 138543362;
                id v37 = v33;
                id v30 = v33;
                v31 = "%{public}@ EAPOLClientConfigurationSave() failed";
                goto LABEL_38;
              }
            }
            else
            {
              os_log_t v27 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                os_log_t v28 = v27;
                v29 = objc_opt_class();
                int v36 = 138543362;
                id v37 = v29;
                id v30 = v29;
                v31 = "%{public}@ EAPOLClientConfigurationRemoveProfile() failed";
LABEL_38:
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&v36, 0xCu);
              }
            }
          }
          else
          {
            os_log_t v34 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              os_log_t v28 = v34;
              id v35 = objc_opt_class();
              int v36 = 138543362;
              id v37 = v35;
              id v30 = v35;
              v31 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
              goto LABEL_38;
            }
          }
          BOOL v10 = 0;
          goto LABEL_40;
        }
        os_log_t v25 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          v21 = v25;
          int v36 = 138543362;
          id v37 = (id)objc_opt_class();
          id v22 = v37;
          v23 = "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL";
          goto LABEL_28;
        }
LABEL_29:
        BOOL v10 = 0;
LABEL_30:
        CFRelease(v5);
        goto LABEL_31;
      }
      os_log_t v24 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      v21 = v24;
      int v36 = 138543362;
      id v37 = (id)objc_opt_class();
      id v22 = v37;
      v23 = "%{public}@ metadata validation failed";
    }
    else
    {
      os_log_t v20 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      v21 = v20;
      int v36 = 138543362;
      id v37 = (id)objc_opt_class();
      id v22 = v37;
      v23 = "%{public}@ failed to find EAP profile";
    }
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v36, 0xCu);

    goto LABEL_29;
  }
  os_log_t v7 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    int v36 = 138543362;
    id v37 = (id)objc_opt_class();
    id v9 = v37;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", (uint8_t *)&v36, 0xCu);
  }
  BOOL v10 = 0;
LABEL_31:

  return v10;
}

- (BOOL)_setEAPConfig:(id)a3
{
  id v4 = a3;
  CFTypeRef cf = 0;
  objc_super v5 = [(MCNewPayloadHandler *)self payload];
  id v6 = [v4 mutableCopy];
  if ([v5 usernameRequired]
    && ([v5 username], os_log_t v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    os_log_t v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v10;
      *(_DWORD *)buf = 138543362;
      id v75 = (id)objc_opt_class();
      id v12 = v75;
      os_log_t v13 = "%{public}@ username is not available";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
    }
  }
  else
  {
    if (![v5 passwordRequired]
      || ([v5 password], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      int v9 = 1;
      goto LABEL_12;
    }
    os_log_t v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v14;
      *(_DWORD *)buf = 138543362;
      id v75 = (id)objc_opt_class();
      id v12 = v75;
      os_log_t v13 = "%{public}@ password is not available";
      goto LABEL_10;
    }
  }
  int v9 = 0;
LABEL_12:
  id v15 = [v6 objectForKey:@"TLSTrustedCertificates"];

  if (v15)
  {
    if (!v9) {
      goto LABEL_48;
    }
  }
  else
  {
    int v63 = v9;
    v64 = v6;
    id v66 = v4;
    v67 = +[NSMutableArray array];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v65 = v5;
    id obj = [v5 payloadCertificateAnchorUUIDs];
    id v16 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v70;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v70 != v18) {
            objc_enumerationMutation(obj);
          }
          os_log_t v20 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          v21 = [(MCNewPayloadHandler *)self profileHandler];
          id v22 = [v21 persistentIDForCertificateUUID:v20];

          if (v22)
          {
            v23 = [(MCNewPayloadHandler *)self profileHandler];
            os_log_t v24 = [v23 profile];
            id v25 = [v24 isInstalledForSystem];

            v26 = (__SecCertificate *)+[MCKeychain copyCertificateWithPersistentID:v22 useSystemKeychain:v25];
            if (v26)
            {
              os_log_t v27 = v26;
              CFDataRef v28 = SecCertificateCopyData(v26);
              if (v28)
              {
                os_log_t v29 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  id v30 = v29;
                  v31 = objc_opt_class();
                  *(_DWORD *)buf = 138543874;
                  id v75 = v31;
                  __int16 v76 = 2114;
                  id v77 = v20;
                  __int16 v78 = 1026;
                  int v79 = (int)v25;
                  id v32 = v31;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ adding trusted certificate UUID %{public}@ with system keychain? %{public}d", buf, 0x1Cu);
                }
                [v67 addObject:v28];
              }

              CFRelease(v27);
            }
          }
          else
          {
            os_log_t v33 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              os_log_t v34 = v33;
              id v35 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              id v75 = v35;
              __int16 v76 = 2114;
              id v77 = v20;
              id v36 = v35;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ certificate UUID %{public}@ referenced by this payload does not exist, skipping.", buf, 0x16u);
            }
          }
        }
        id v17 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
      }
      while (v17);
    }

    id v6 = v64;
    if ([v67 count]) {
      [v64 setObject:v67 forKey:@"TLSTrustedCertificates"];
    }

    objc_super v5 = v65;
    id v4 = v66;
    if (!v63) {
      goto LABEL_48;
    }
  }
  id v37 = [v5 certificateUUID];

  if (v37)
  {
    os_log_t v38 = [(MCNewPayloadHandler *)self profileHandler];
    v39 = [v5 certificateUUID];
    id v40 = [v38 persistentIDForCertificateUUID:v39];

    os_log_t v41 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      id v43 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v75 = v43;
      __int16 v76 = 1026;
      LODWORD(v77) = v40 != 0;
      id v44 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ handling identity certs? %{public}d", buf, 0x12u);
    }
    if (v40 && (EAPSecIdentityHandleCreateSecIdentity() || !cf))
    {
      os_log_t v54 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v55 = v54;
        v56 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v75 = v56;
        id v57 = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPSecIdentityHandleCreateSecIdentity() failed", buf, 0xCu);
      }
      goto LABEL_48;
    }
  }
  os_log_t v45 = [v5 username];
  os_log_t v46 = [v45 dataUsingEncoding:4];

  os_log_t v47 = [v5 password];
  v48 = [v47 dataUsingEncoding:4];

  LODWORD(v47) = [(MCGlobalEthernetPayloadHandler *)self _install:v6 username:v46 password:v48 identity:cf];
  if (!v47)
  {
LABEL_48:
    os_log_t v58 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v59 = v58;
      v60 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v75 = v60;
      id v61 = v60;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%{public}@ installation failed.", buf, 0xCu);
    }
    BOOL v53 = 0;
    goto LABEL_51;
  }
  os_log_t v49 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    id v50 = v49;
    v51 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v75 = v51;
    __int16 v76 = 2114;
    id v77 = v6;
    id v52 = v51;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ installation succeeded with EAP profile: %{public}@", buf, 0x16u);
  }
  BOOL v53 = 1;
LABEL_51:
  if (cf) {
    CFRelease(cf);
  }

  return v53;
}

- (BOOL)_isMetadataValid:(__EAPOLClientProfile *)a3
{
  v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = EAPOLClientProfileGetInformation();
  objc_super v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v6 = kMCPayloadUUIDKey;
  os_log_t v7 = [v4 objectForKey:kMCPayloadUUIDKey];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_5;
  }
  int v9 = [v5 objectForKey:v6];
  os_log_t v10 = [v3 UUID];
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

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v8 = [(MCNewPayloadHandler *)self payload];
  int v9 = [v8 eapClientConfiguration];

  if (!v9) {
    goto LABEL_6;
  }
  os_log_t v10 = [v8 eapClientConfiguration];
  unsigned __int8 v11 = [(MCGlobalEthernetPayloadHandler *)self _setEAPConfig:v10];

  if ((v11 & 1) == 0)
  {
    if (!a6) {
      goto LABEL_7;
    }
    uint64_t v12 = MCGlobalEthernetErrorDomain;
    os_log_t v13 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v12, 62000, v13, MCErrorTypeFatal, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    LOBYTE(a6) = 0;
    goto LABEL_7;
  }
  LOBYTE(a6) = 1;
LABEL_7:

  return (char)a6;
}

- (void)remove
{
  if (![(MCGlobalEthernetPayloadHandler *)self _uninstall])
  {
    os_log_t v3 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      int v11 = 138543362;
      id v12 = (id)objc_opt_class();
      id v5 = v12;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@ uninstallation failed.", (uint8_t *)&v11, 0xCu);
    }
  }
  os_log_t v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    os_log_t v7 = v6;
    v8 = objc_opt_class();
    int v11 = 138543362;
    id v12 = v8;
    id v9 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@ uninstallation succeeded", (uint8_t *)&v11, 0xCu);
  }
  setAsideProfileID = self->_setAsideProfileID;
  self->_setAsideProfileID = 0;
}

- (void)setAside
{
  os_log_t v3 = [(MCNewPayloadHandler *)self payload];
  setAsideProfileID = self->_setAsideProfileID;
  self->_setAsideProfileID = 0;

  uint64_t v5 = EAPOLClientConfigurationCreateWithAuthorization();
  if (v5)
  {
    os_log_t v6 = (const void *)v5;
    uint64_t SystemEthernetProfile = EAPOLClientConfigurationGetSystemEthernetProfile();
    if (SystemEthernetProfile)
    {
      if ([(MCGlobalEthernetPayloadHandler *)self _isMetadataValid:SystemEthernetProfile])
      {
        EAPOLClientProfileGetID();
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        id v9 = self->_setAsideProfileID;
        self->_setAsideProfileID = v8;

        if (self->_setAsideProfileID)
        {
          if (EAPOLClientConfigurationSetSystemEthernetProfile())
          {
            if (EAPOLClientConfigurationSave()) {
              goto LABEL_20;
            }
            os_log_t v10 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_20;
            }
            int v11 = v10;
            int v21 = 138543362;
            id v22 = (id)objc_opt_class();
            id v12 = v22;
            os_log_t v13 = "%{public}@ EAPOLClientConfigurationSave() failed";
            goto LABEL_19;
          }
          os_log_t v20 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            int v11 = v20;
            int v21 = 138543362;
            id v22 = (id)objc_opt_class();
            id v12 = v22;
            os_log_t v13 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
            goto LABEL_19;
          }
LABEL_20:
          CFRelease(v6);
          goto LABEL_21;
        }
        os_log_t v19 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        int v11 = v19;
        int v21 = 138543362;
        id v22 = (id)objc_opt_class();
        id v12 = v22;
        os_log_t v13 = "%{public}@ EAPOLClientProfileGetID() returned NULL";
      }
      else
      {
        os_log_t v18 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        int v11 = v18;
        int v21 = 138543362;
        id v22 = (id)objc_opt_class();
        id v12 = v22;
        os_log_t v13 = "%{public}@ metadata validation failed";
      }
    }
    else
    {
      os_log_t v17 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      int v11 = v17;
      int v21 = 138543362;
      id v22 = (id)objc_opt_class();
      id v12 = v22;
      os_log_t v13 = "%{public}@ EAPOLClientProfileCreate() returned NULL";
    }
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v21, 0xCu);

    goto LABEL_20;
  }
  os_log_t v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    id v15 = v14;
    int v21 = 138543362;
    id v22 = (id)objc_opt_class();
    id v16 = v22;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", (uint8_t *)&v21, 0xCu);
  }
LABEL_21:
}

- (void)unsetAside
{
  os_log_t v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [(MCNewPayloadHandler *)self profileHandler];
  if (![v4 isSetAside]) {
    goto LABEL_10;
  }
  setAsideProfileID = self->_setAsideProfileID;

  if (setAsideProfileID)
  {
    uint64_t v6 = EAPOLClientConfigurationCreateWithAuthorization();
    if (v6)
    {
      os_log_t v7 = (const void *)v6;
      if (EAPOLClientConfigurationGetProfileWithID())
      {
        if (EAPOLClientConfigurationSetSystemEthernetProfile())
        {
          if (EAPOLClientConfigurationSave())
          {
            v8 = self->_setAsideProfileID;
            self->_setAsideProfileID = 0;

LABEL_18:
            CFRelease(v7);
            goto LABEL_19;
          }
          os_log_t v16 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          id v12 = v16;
          int v17 = 138543362;
          id v18 = (id)objc_opt_class();
          id v13 = v18;
          os_log_t v14 = "%{public}@ EAPOLClientConfigurationSave() failed";
        }
        else
        {
          os_log_t v15 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          id v12 = v15;
          int v17 = 138543362;
          id v18 = (id)objc_opt_class();
          id v13 = v18;
          os_log_t v14 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
        }
      }
      else
      {
        os_log_t v11 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
        id v12 = v11;
        int v17 = 138543362;
        id v18 = (id)objc_opt_class();
        id v13 = v18;
        os_log_t v14 = "%{public}@ EAPOLClientConfigurationGetProfileWithID() returned NULL";
      }
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v17, 0xCu);

      goto LABEL_18;
    }
    os_log_t v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v4 = v9;
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v10 = v18;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", (uint8_t *)&v17, 0xCu);

LABEL_10:
    }
  }
LABEL_19:
}

- (void).cxx_destruct
{
}

@end