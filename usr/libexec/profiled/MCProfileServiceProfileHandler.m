@interface MCProfileServiceProfileHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCProfileServiceProfileHandler)initWithProfile:(id)a3;
- (id)_badIdentityError;
- (id)_sdpErrorForFinalProfile:(id)a3;
- (id)fetchFinalProfileWithClient:(id)a3 outProfileData:(id *)a4 outError:(id *)a5;
- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6;
- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6;
- (void)dealloc;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)removeWithInstaller:(id)a3 options:(id)a4;
- (void)setAsideWithInstaller:(id)a3;
- (void)unsetAside;
@end

@implementation MCProfileServiceProfileHandler

- (MCProfileServiceProfileHandler)initWithProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCProfileServiceProfileHandler;
  v5 = [(MCProfileHandler *)&v10 initWithProfile:v4];
  if (v5)
  {
    uint64_t v6 = [v4 enrollmentIdentityPersistentID];
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSData *)v6;

    v8 = v5->_persistentID;
    if (v8) {
      v5->_identity = (__SecIdentity *)+[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", v8, [v4 isInstalledForSystem]);
    }
  }

  return v5;
}

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)MCProfileServiceProfileHandler;
  [(MCProfileServiceProfileHandler *)&v4 dealloc];
}

- (id)_badIdentityError
{
  uint64_t v2 = MCOTAProfilesErrorDomain;
  v3 = MCErrorArray();
  objc_super v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 24002, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = +[MCDependencyManager sharedManager];
  v11 = [v10 MCHexString];

  [v12 addDependent:v9 ofParent:v11 inDomain:kMCDMCertificateToPayloadUUIDDependencyKey reciprocalDomain:kMCDMPayloadUUIDToCertificateDependencyKey toSystem:v7 user:v6];
}

- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = +[MCDependencyManager sharedManager];
  v11 = [v10 MCHexString];

  [v12 removeDependent:v9 fromParent:v11 inDomain:kMCDMCertificateToPayloadUUIDDependencyKey reciprocalDomain:kMCDMPayloadUUIDToCertificateDependencyKey fromSystem:v7 user:v6];
}

- (id)fetchFinalProfileWithClient:(id)a3 outProfileData:(id *)a4 outError:(id *)a5
{
  id v81 = a3;
  BOOL v7 = [(MCProfileHandler *)self profile];
  v8 = [v7 URLString];
  uint64_t v82 = +[NSURL URLWithString:v8];

  p_cache = &OBJC_METACLASS___MCPasscodeAnalytics.cache;
  if (self->_identity)
  {
    id v10 = 0;
    v11 = 0;
    id v12 = 0;
    goto LABEL_3;
  }
  v21 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Enrolling in OTA Profile service...", buf, 2u);
  }
  v22 = [v7 deviceAttributes];
  v23 = [v7 challenge];
  id v87 = 0;
  v24 = +[MCMachineInfo machineInfoWithKeys:v22 challenge:v23 identity:0 additionalInfo:0 outError:&v87];
  id v10 = v87;

  if (v10)
  {
    v11 = 0;
    id v19 = 0;
    id v12 = 0;
    v25 = a5;
    id v26 = (id)v82;
    goto LABEL_33;
  }
  v79 = a4;
  id v30 = [objc_alloc((Class)DMCHTTPTransaction) initWithURL:v82 method:@"POST"];
  [v30 setTimeout:45.0];
  [v30 setUserAgent:kMCProfileUserAgent];
  [v30 setContentType:@"application/pkcs7-signature"];
  [v30 setData:v24];
  [v30 performSynchronously];
  v31 = [v30 responseData];
  id v12 = [v30 permanentlyRedirectedURL];
  uint64_t v32 = [v30 error];
  if (v32)
  {
    id v10 = (id)v32;
    v11 = 0;
    int v33 = 2;
  }
  else
  {
    id v86 = 0;
    v36 = +[MCProfile profileWithData:v31 outError:&v86];
    id v37 = v86;
    v77 = v36;
    if (v37)
    {
      id v10 = v37;
      v11 = 0;
      int v33 = 2;
    }
    else
    {
      v76 = v31;
      v43 = [v36 payloads];
      id v44 = [v43 count];

      if (v44 == (id)1)
      {
        v45 = [v36 payloads];
        v46 = [v45 objectAtIndex:0];

        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v46 isIdentity])
        {
          v47 = 0;
        }
        else
        {
          v47 = [(MCProfileServiceProfileHandler *)self _badIdentityError];
        }
        v75 = v46;
        v11 = [v46 handlerWithProfileHandler:self];
        id v85 = v47;
        v60 = (__SecIdentity *)[v11 copyIdentityImmediatelyWithInteractionClient:v81 outError:&v85];
        id v10 = v85;

        self->_identity = v60;
        if (v10)
        {
          int v33 = 2;
        }
        else
        {
          id v73 = [v7 installType];
          v61 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v89 = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "Temporarily storing identity for profile service profile, storing with accessibility %@", buf, 0xCu);
          }
          BOOL v62 = v73 != (id)2;
          BOOL v72 = v73 != (id)2;
          BOOL v74 = v73 == (id)2;
          identity = self->_identity;
          v63 = [v7 UUID];
          v64 = +[MCKeychain saveItem:identity withLabel:v63 group:kMCAppleIdentitiesKeychainGroup useSystemKeychain:v62 accessibility:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly];
          persistentID = self->_persistentID;
          self->_persistentID = v64;

          v71 = self->_persistentID;
          v66 = [v7 UUID];
          [(MCProfileServiceProfileHandler *)self _retainDependencyBetweenPersistentID:v71 andUUID:v66 forSystem:v62 user:v74];

          v67 = self->_persistentID;
          v68 = [v7 UUID];
          [(MCProfileServiceProfileHandler *)self _releaseDependencyBetweenPersistentID:v67 andUUID:v68 forSystem:v72 user:v74];

          int v33 = 0;
        }
      }
      else
      {
        id v10 = [(MCProfileServiceProfileHandler *)self _badIdentityError];
        v11 = 0;
        int v33 = 2;
      }
      v31 = v76;
    }
  }
  if (!v33)
  {
    a4 = v79;
    p_cache = (void **)(&OBJC_METACLASS___MCPasscodeAnalytics + 16);
LABEL_3:
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Retrieving profile from OTA Profile service...", buf, 2u);
    }
    v14 = p_cache + 43;
    v15 = [v7 deviceAttributes];
    v16 = self->_identity;
    id v84 = v10;
    v17 = [v14 machineInfoWithKeys:v15 challenge:0 identity:v16 additionalInfo:0 outError:&v84];
    id v18 = v84;

    if (v18)
    {
      id v19 = 0;
      id v10 = v18;
      v20 = (void *)v82;
LABEL_29:

      goto LABEL_30;
    }
    v20 = (void *)v82;
    id v27 = [objc_alloc((Class)DMCHTTPTransaction) initWithURL:v82 method:@"POST"];
    [v27 setTimeout:45.0];
    [v27 setUserAgent:kMCProfileUserAgent];
    [v27 setContentType:@"application/pkcs7-signature"];
    [v27 setData:v17];
    [v27 performSynchronously];
    v28 = [v27 responseData];
    uint64_t v78 = [v27 permanentlyRedirectedURL];

    uint64_t v29 = [v27 error];
    if (v29)
    {
      id v10 = (id)v29;
      id v19 = 0;
LABEL_28:

      id v12 = (void *)v78;
      goto LABEL_29;
    }
    v34 = a4;
    id v83 = 0;
    id v19 = +[MCProfile profileWithData:v28 outError:&v83];
    id v35 = v83;
    if (v35)
    {
LABEL_16:
      id v10 = v35;
      goto LABEL_28;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![v19 isUserEnrollmentProfile])
      {
        if (v81)
        {
          if (+[DMCMobileGestalt isVisionDevice]
            && [v19 isMDMProfile]
            && (+[DMCFeatureFlags isVisionProfileEnrollEnabled] & 1) == 0)
          {
            uint64_t v69 = MCOTAProfilesErrorDomain;
            v39 = MCErrorArrayByDevice();
            uint64_t v40 = MCErrorTypeFatal;
            uint64_t v41 = v69;
            uint64_t v42 = 24006;
            goto LABEL_27;
          }
          id v35 = [(MCProfileServiceProfileHandler *)self _sdpErrorForFinalProfile:v19];
          if (v35) {
            goto LABEL_16;
          }
        }
        id v10 = 0;
        if (v34) {
          id *v34 = v28;
        }
        goto LABEL_28;
      }
      uint64_t v38 = MCOTAProfilesErrorDomain;
      v39 = MCErrorArray();
      uint64_t v40 = MCErrorTypeFatal;
      uint64_t v41 = v38;
      uint64_t v42 = 24004;
    }
    else
    {
      uint64_t v48 = MCOTAProfilesErrorDomain;
      v39 = MCErrorArray();
      uint64_t v40 = MCErrorTypeFatal;
      uint64_t v41 = v48;
      uint64_t v42 = 24003;
    }
LABEL_27:
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v41, v42, v39, v40, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  id v19 = 0;
  v20 = (void *)v82;
LABEL_30:

  if (!v10)
  {
    [v7 setEnrollmentIdentityPersistentID:self->_persistentID];
    [v19 setOTAProfile:v7];
    os_log_t v56 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v57 = v56;
      v58 = [v19 identifier];
      *(_DWORD *)buf = 138543362;
      CFStringRef v89 = v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Received final profile: %{public}@", buf, 0xCu);
    }
    id v19 = v19;
    id v10 = 0;
    v55 = v19;
    goto LABEL_42;
  }
  if (v12)
  {
    v49 = [v10 userInfo];
    id v26 = [v49 mutableCopy];

    v50 = [v12 absoluteString];
    [v26 setObject:v50 forKey:MCErrorPermanentlyRedirectedURLString];

    v24 = [v10 domain];
    uint64_t v51 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, [v10 code], v26);

    id v10 = (id)v51;
    v25 = a5;
LABEL_33:

    if (!v25) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  v25 = a5;
  if (a5) {
LABEL_34:
  }
    id *v25 = [v10 MCCopyAsPrimaryError];
LABEL_35:
  os_log_t v52 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v53 = v52;
    v54 = [v10 MCVerboseDescription];
    *(_DWORD *)buf = 138543362;
    CFStringRef v89 = v54;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failure occurred while retrieving profile during OTA Profile Enrollment: %{public}@", buf, 0xCu);
  }
  if (v11)
  {
    [v11 remove];
    v55 = 0;
LABEL_42:

    goto LABEL_44;
  }
  v55 = 0;
LABEL_44:

  return v55;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(MCProfileHandler *)self profile];
  v24.receiver = self;
  v24.super_class = (Class)MCProfileServiceProfileHandler;
  id v25 = 0;
  [(MCProfileHandler *)&v24 installWithInstaller:v12 options:v11 interactionClient:v10 outError:&v25];

  id v14 = v25;
  v15 = v14;
  if (v14)
  {
    if (a6) {
      *a6 = v14;
    }
  }
  else
  {
    id v16 = [v13 installType];
    BOOL v17 = v16 != (id)2;
    BOOL v18 = v16 == (id)2;
    id v19 = [v13 enrollmentIdentityPersistentID];
    v20 = [v13 UUID];
    [(MCProfileServiceProfileHandler *)self _retainDependencyBetweenPersistentID:v19 andUUID:v20 forSystem:v17 user:v18];

    v21 = +[MCInstaller sharedInstaller];
    v22 = [v13 identifier];
    [v21 purgePurgatoryProfileWithIdentifier:v22 targetDevice:[MCProfile thisDeviceType]];
  }
  return v15 == 0;
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "OTA Profile installed", buf, 2u);
  }
  id v9 = [(MCProfileHandler *)self profile];
  if ([v9 confirmInstallation])
  {
    id v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending installation confirmation to OTA Profile service. No error check is performed.", v16, 2u);
    }
    id v11 = +[NSPropertyListSerialization dataWithPropertyList:&off_1000F5360 format:100 options:0 error:0];
    if (v11)
    {
      id v12 = [v9 URLString];
      v13 = +[NSURL URLWithString:v12];

      id v14 = +[NSMutableData data];
      if (!SecCMSSignDataAndAttributes())
      {
        id v15 = [objc_alloc((Class)DMCHTTPTransaction) initWithURL:v13 method:@"POST"];
        [v15 setTimeout:45.0];
        [v15 setUserAgent:kMCProfileUserAgent];
        [v15 setContentType:@"application/pkcs7-signature"];
        [v15 setData:v14];
        [v15 performSynchronously];
      }
    }
  }
}

- (void)setAsideWithInstaller:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MCProfileServiceProfileHandler;
  [(MCProfileHandler *)&v10 setAsideWithInstaller:a3];
  objc_super v4 = [(MCProfileHandler *)self profile];
  id v5 = [v4 installType];
  BOOL v6 = v5 != (id)2;
  BOOL v7 = v5 == (id)2;
  v8 = [v4 enrollmentIdentityPersistentID];
  id v9 = [v4 UUID];
  [(MCProfileServiceProfileHandler *)self _releaseDependencyBetweenPersistentID:v8 andUUID:v9 forSystem:v6 user:v7];
}

- (void)unsetAside
{
  v9.receiver = self;
  v9.super_class = (Class)MCProfileServiceProfileHandler;
  [(MCProfileHandler *)&v9 unsetAside];
  v3 = [(MCProfileHandler *)self profile];
  id v4 = [v3 installType];
  BOOL v5 = v4 != (id)2;
  BOOL v6 = v4 == (id)2;
  BOOL v7 = [v3 enrollmentIdentityPersistentID];
  v8 = [v3 UUID];
  [(MCProfileServiceProfileHandler *)self _retainDependencyBetweenPersistentID:v7 andUUID:v8 forSystem:v5 user:v6];
}

- (void)removeWithInstaller:(id)a3 options:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MCProfileServiceProfileHandler;
  [(MCProfileHandler *)&v11 removeWithInstaller:a3 options:a4];
  if (![(MCProfileHandler *)self isSetAside])
  {
    BOOL v5 = [(MCProfileHandler *)self profile];
    id v6 = [v5 installType];
    BOOL v7 = v6 != (id)2;
    BOOL v8 = v6 == (id)2;
    objc_super v9 = [v5 enrollmentIdentityPersistentID];
    objc_super v10 = [v5 UUID];
    [(MCProfileServiceProfileHandler *)self _releaseDependencyBetweenPersistentID:v9 andUUID:v10 forSystem:v7 user:v8];
  }
}

- (id)_sdpErrorForFinalProfile:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100082254;
  BOOL v17 = sub_100082264;
  id v18 = 0;
  BOOL v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  objc_super v9 = sub_10008226C;
  objc_super v10 = &unk_1000EC370;
  id v12 = &v13;
  id v4 = (id)objc_opt_new();
  id v11 = v4;
  +[MCInstaller isInteractiveProfileInstallationAllowedBySDP:v3 completion:&v7];
  [v4 waitForCompletion:v7, v8, v9, v10];
  id v5 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v5;
}

- (void).cxx_destruct
{
}

@end