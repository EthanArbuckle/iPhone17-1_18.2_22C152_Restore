@interface MCACMEPayloadHandler
- (BOOL)anonymous;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4;
- (void)dealloc;
- (void)setAnonymous:(BOOL)a3;
@end

@implementation MCACMEPayloadHandler

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)MCACMEPayloadHandler;
  [(MCACMEPayloadHandler *)&v4 dealloc];
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = [(MCNewPayloadHandler *)self payload];
  v12 = [v11 profile];
  unsigned int v13 = [v12 isUserEnrollmentProfile];

  if (v13)
  {
    self->_anonymous = 1;
  }
  else
  {
    v14 = [v9 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
    int v15 = [v14 BOOLValue];

    if (v15)
    {
      v16 = +[MDMConfiguration sharedConfiguration];
      self->_anonymous = [v16 isUserEnrollment];
    }
    else
    {
      self->_anonymous = 0;
    }
  }
  id v35 = 0;
  v17 = [(MCACMEPayloadHandler *)self copyIdentityImmediatelyWithInteractionClient:v10 outError:&v35];
  id v18 = v35;
  if (!v18)
  {
    v33 = a6;
    id v34 = v9;
    v19 = [(MCNewCertificatePayloadHandler *)self accessibility];
    v20 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Storing ACME identity with accessibility %@", buf, 0xCu);
    }
    v21 = [v11 UUID];
    uint64_t v22 = kMCAppleIdentitiesKeychainGroup;
    v23 = [(MCNewPayloadHandler *)self profileHandler];
    v24 = [v23 profile];
    v25 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v17, v21, v22, [v24 isInstalledForSystem], v19);

    if (v17) {
      CFRelease(v17);
    }
    if (v25)
    {
      v26 = [v11 UUID];
      [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v25 andUUID:v26];

      if (v10)
      {
        id v18 = 0;
        a6 = v33;
        if (([v10 didUpdateStatus:0] & 1) == 0)
        {
          v27 = [(MCNewPayloadHandler *)self profileHandler];
          id v18 = [v27 userCancelledError];
        }
      }
      else
      {
        id v18 = 0;
        a6 = v33;
      }
      [v11 setCertificatePersistentID:v25];
      v30 = [v11 UUID];
      [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v25 andUUID:v30];

      v31 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Successfully installed certificate.", buf, 2u);
      }
      id v9 = v34;
    }
    else
    {
      uint64_t v28 = MCCertificateErrorDomain;
      v29 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v28, 9002, v29, MCErrorTypeFatal, 0);
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      a6 = v33;
      id v9 = v34;
    }
  }
  if (a6 && v18) {
    *a6 = [v18 MCCopyAsPrimaryError];
  }

  return v18 == 0;
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  identity = self->_identity;
  if (!identity)
  {
    v55 = [(MCNewPayloadHandler *)self payload];
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x3032000000;
    v71 = sub_100027534;
    v72 = sub_100027544;
    id v73 = 0;
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x2020000000;
    uint64_t v67 = 0;
    if ([v55 isHardwareBound])
    {
      v8 = +[MCDeviceCapabilities currentDevice];
      unsigned __int8 v9 = [v8 hasSEP];

      if ((v9 & 1) == 0)
      {
        id v10 = MCErrorArray();
        uint64_t v11 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCACMEErrorDomain, 60001, v10, 0, MCErrorTypeFatal, 0);
        v12 = (void *)v69[5];
        v69[5] = v11;
      }
    }
    if (v6
      && (MCLocalizedString(),
          unsigned int v13 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v14 = [v6 didUpdateStatus:v13],
          v13,
          (v14 & 1) == 0))
    {
      v33 = [(MCNewPayloadHandler *)self profileHandler];
      uint64_t v34 = [v33 userCancelledError];
      id v35 = (void *)v69[5];
      v69[5] = v34;
    }
    else
    {
      int v15 = [v55 keyType];
      unsigned __int8 v16 = [v15 isEqualToString:kMCACMEKeyTypeRSA];

      if (v16)
      {
        v17 = (id *)&kSecAttrKeyTypeRSA;
      }
      else
      {
        id v18 = [v55 keyType];
        unsigned __int8 v19 = [v18 isEqualToString:kMCACMEKeyTypeECSECPrimeRandom];

        if ((v19 & 1) == 0)
        {
          v40 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Invalid ACME key type", (uint8_t *)&buf, 2u);
          }
          if (!a4) {
            goto LABEL_52;
          }
          v41 = MCErrorArray();
          +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCACMEErrorDomain, 60000, v41, 0, MCErrorTypeFatal, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_51;
        }
        v17 = (id *)&kSecAttrKeyTypeECSECPrimeRandom;
      }
      id v54 = *v17;
      v20 = [v55 directoryURLString];
      v21 = +[NSURL URLWithString:v20];

      if (!v21)
      {
        if (a4)
        {
          v39 = MCErrorArray();
          +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCACMEErrorDomain, 60000, v39, 0, MCErrorTypeFatal, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_51;
      }
      uint64_t v22 = +[NSMutableDictionary dictionary];
      [v22 setObject:v21 forKeyedSubscript:kSecACMEDirectoryURL];
      unsigned int v23 = [v55 isHardwareBound];
      v24 = &kCFBooleanTrue;
      if (!v23) {
        v24 = &kCFBooleanFalse;
      }
      [v22 setObject:*v24 forKeyedSubscript:kSecUseHardwareBoundKey];
      [v22 setObject:v54 forKeyedSubscript:kSecAttrKeyType];
      v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v55 keySize]);
      [v22 setObject:v25 forKeyedSubscript:kSecAttrKeySizeInBits];

      v26 = [v55 subjectAltName];
      [v22 setObject:v26 forKeyedSubscript:kSecSubjectAltName];

      v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v55 usageFlags]);
      [v22 setObject:v27 forKeyedSubscript:kSecCertificateKeyUsage];

      uint64_t v28 = [v55 extendedKeyUsage];
      [v22 setObject:v28 forKeyedSubscript:kSecCertificateExtendedKeyUsage];

      v29 = [v55 clientIdentifier];
      [v22 setObject:v29 forKeyedSubscript:kSecClientIdentifier];

      [v22 setObject:kSecCMSHashingAlgorithmSHA256 forKeyedSubscript:kSecCMSSignHashAlgorithm];
      if ([v55 attest])
      {
        v30 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000F5170, &off_1000F5188, &off_1000F51A0, 0);
        v31 = +[DMCMobileGestalt chipID];
        if (v31 && ![v30 containsObject:v31])
        {
          v43 = +[MDMConfiguration sharedConfiguration];
          v44 = +[MDMSharedDefinitions oidsAnonymous:self->_anonymous nonce:1 coresidency:0];
          [v22 setObject:v44 forKeyedSubscript:kSecAttestationOids];
        }
        else
        {
          v32 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Ignoring request for attestation on unsupported device. Continuing without attestation.", (uint8_t *)&buf, 2u);
          }
        }
      }
      v45 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        if (self->_anonymous) {
          CFStringRef v46 = &stru_1000ECAD0;
        }
        else {
          CFStringRef v46 = @"non-";
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Requesting %@anonymous ACME attestation", (uint8_t *)&buf, 0xCu);
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v75 = 0x3032000000;
      v76 = sub_100027534;
      v77 = sub_100027544;
      dispatch_semaphore_t v78 = dispatch_semaphore_create(0);
      v47 = [v55 subject];
      v48 = dispatch_get_global_queue(0, 0);
      v57 = _NSConcreteStackBlock;
      uint64_t v58 = 3221225472;
      v59 = sub_10002754C;
      v60 = &unk_1000EB8D0;
      v61 = &v68;
      v62 = &v64;
      p_long long buf = &buf;
      SecRequestClientIdentity();

      v49 = *(NSObject **)(*((void *)&buf + 1) + 40);
      dispatch_time_t v50 = dispatch_time(0, 60000000000);
      if (dispatch_semaphore_wait(v49, v50))
      {
        v51 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v56 = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Timeout waiting for ACME identity", v56, 2u);
        }
        if (a4)
        {
          v52 = MCErrorArray();
          +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCACMEErrorDomain, 60002, v52, 0, MCErrorTypeFatal, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        _Block_object_dispose(&buf, 8);

        goto LABEL_51;
      }
      _Block_object_dispose(&buf, 8);

      if (!v6)
      {
LABEL_22:
        v36 = (void *)v69[5];
        if (!v36)
        {
          v42 = (const void *)v65[3];
          if (v42)
          {
            CFRetain(v42);
            a4 = (id *)v65[3];
            self->_identity = (__SecIdentity *)a4;
          }
          else
          {
            a4 = (id *)self->_identity;
          }
          goto LABEL_52;
        }
        if (a4) {
          *a4 = v36;
        }
        v37 = _MCLogObjects[0];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = [(id)v69[5] MCVerboseDescription];
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Cannot obtain ACME certificate: %{public}@", (uint8_t *)&buf, 0xCu);
        }
LABEL_51:
        a4 = 0;
LABEL_52:
        _Block_object_dispose(&v64, 8);
        _Block_object_dispose(&v68, 8);

        goto LABEL_53;
      }
    }
    [v6 didUpdateStatus:0];
    goto LABEL_22;
  }
  CFRetain(identity);
  a4 = (id *)self->_identity;
LABEL_53:

  return (__SecIdentity *)a4;
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (void)setAnonymous:(BOOL)a3
{
  self->_anonymous = a3;
}

@end