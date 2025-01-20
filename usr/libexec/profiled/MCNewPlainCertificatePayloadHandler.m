@interface MCNewPlainCertificatePayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (__SecIdentity)_copyContentsOfPKCS12DataWithPasscode:(id)a3 outError:(id *)a4;
- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4;
- (id)_cannotStoreCertificateError;
- (id)_cannotStoreRootCertificateError;
- (id)_invalidPasscodeError;
- (id)_malformedCertificateError;
- (id)_storeCertificate:(__SecCertificate *)a3 allowSSLTrust:(BOOL)a4 outError:(id *)a5;
- (id)_tooManyCertificatesError;
- (id)userInputFields;
- (int)_grantPartialNonSSLTrustPolicyForCertificate:(__SecCertificate *)a3;
- (void)_revertFullSSLTrustIfNeeded;
- (void)dealloc;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNewPlainCertificatePayloadHandler

- (id)userInputFields
{
  v2 = [(MCNewPayloadHandler *)self payload];
  if ([v2 dataEncoding] == 1)
  {
    v3 = +[NSMutableArray array];
    v4 = [v2 password];
    id v5 = [v4 length];

    if (!v5)
    {
      v6 = MCLocalizedString();
      v7 = [v2 certificateFileName];
      v8 = MCLocalizedFormat();
      v9 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"certificatePassword", v6, v8, 0, 0, 0, 0, 0, 3);
      [v3 addObject:v9];
    }
  }
  else
  {
    v3 = +[NSArray array];
  }

  return v3;
}

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)MCNewPlainCertificatePayloadHandler;
  [(MCNewPlainCertificatePayloadHandler *)&v4 dealloc];
}

- (__SecIdentity)_copyContentsOfPKCS12DataWithPasscode:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  v7 = [(MCNewPayloadHandler *)self payload];
  CFArrayRef theArray = 0;
  if (v6)
  {
    CFStringRef v16 = kSecImportExportPassphrase;
    id v17 = v6;
    CFDictionaryRef v8 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    if (SecPKCS12Import((CFDataRef)[v7 certificateData], v8, &theArray))
    {
      uint64_t v9 = [(MCNewPlainCertificatePayloadHandler *)self _invalidPasscodeError];
    }
    else
    {
      if (CFArrayGetCount(theArray) == 1)
      {
        v10 = 0;
        goto LABEL_10;
      }
      uint64_t v9 = [(MCNewPlainCertificatePayloadHandler *)self _tooManyCertificatesError];
    }
    v10 = (void *)v9;
LABEL_10:

    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  v10 = [(MCNewPlainCertificatePayloadHandler *)self _invalidPasscodeError];
  if (!a4) {
    goto LABEL_13;
  }
LABEL_11:
  if (v10)
  {
    v11 = 0;
    *a4 = v10;
    goto LABEL_17;
  }
LABEL_13:
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, 0);
  Value = (__SecIdentity *)CFDictionaryGetValue(ValueAtIndex, kSecImportItemIdentity);
  v11 = Value;
  if (Value) {
    CFRetain(Value);
  }
  if (theArray) {
    CFRelease(theArray);
  }
LABEL_17:

  return v11;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  v7 = [(MCNewPayloadHandler *)self payload];
  if ([v7 dataEncoding] == 1)
  {
    CFDictionaryRef v8 = [v7 password];
    uint64_t v9 = +[MCNewPayloadHandler prioritizeUserInput:v6 key:@"certificatePassword" overField:v8];

    id v14 = 0;
    v10 = [(MCNewPlainCertificatePayloadHandler *)self _copyContentsOfPKCS12DataWithPasscode:v9 outError:&v14];
    id v11 = v14;
    if (v10) {
      CFRelease(v10);
    }

    BOOL v12 = v11 == 0;
    if (a4 && v11) {
      *a4 = v11;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (id)_storeCertificate:(__SecCertificate *)a3 allowSSLTrust:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  CFDictionaryRef v8 = [(MCNewPayloadHandler *)self payload];
  uint64_t v9 = [(MCNewCertificatePayloadHandler *)self accessibility];
  v10 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Storing certificate, storing with accessibility %@", buf, 0xCu);
  }
  id v11 = [v8 UUID];
  uint64_t v12 = kMCAppleCertificatesKeychainGroup;
  v13 = [(MCNewPayloadHandler *)self profileHandler];
  id v14 = [v13 profile];
  v15 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", a3, v11, v12, [v14 isInstalledForSystem], v9);

  v54 = v8;
  if (!v15)
  {
    v18 = [(MCNewPlainCertificatePayloadHandler *)self _cannotStoreCertificateError];
    goto LABEL_10;
  }
  CFStringRef v16 = [v8 UUID];
  [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v15 andUUID:v16];

  [v8 setCertificatePersistentID:v15];
  id v17 = a3;
  if (([v8 isFullyTrustedRootCert] & 1) == 0
    && SecCertificateIsSelfSignedCA())
  {
    if (v6)
    {
      SecTrustStoreForDomain();
      if (SecTrustStoreSetTrustSettings())
      {
LABEL_8:
        v18 = [(MCNewPlainCertificatePayloadHandler *)self _cannotStoreRootCertificateError];
LABEL_10:
        id v19 = v18;
        if (!v18) {
          goto LABEL_54;
        }
        if (a5)
        {
          id v19 = v18;
          id v20 = 0;
          *a5 = v19;
        }
        else
        {
          id v20 = 0;
        }
        goto LABEL_55;
      }
    }
    else if ([(MCNewPlainCertificatePayloadHandler *)self _grantPartialNonSSLTrustPolicyForCertificate:a3])
    {
      goto LABEL_8;
    }
  }
  v21 = (void *)SecCertificateCopyRFC822Names();
  if (!v21) {
    goto LABEL_54;
  }
  v52 = v15;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v22 = v21;
  id v23 = [v22 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (!v23) {
    goto LABEL_53;
  }
  id v24 = v23;
  uint64_t v25 = *(void *)v61;
  id v55 = v22;
  do
  {
    v26 = 0;
    do
    {
      if (*(void *)v61 != v25) {
        objc_enumerationMutation(v22);
      }
      v27 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v26);
      id v28 = +[MFMessageKeychainManager copySMIMEEncryptionPolicyForAddress:v27];
      if (v28)
      {
        v29 = v28;
        SecTrustRef trust = 0;
        if (SecTrustCreateWithCertificates(v17, v28, &trust))
        {
          v30 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Cannot create certificate trust for S/MIME processing.", buf, 2u);
          }
          goto LABEL_39;
        }
        if (SecTrustGetCertificateCount(trust) < 1) {
          goto LABEL_38;
        }
        SecTrustGetCertificateAtIndex(trust, 0);
        v32 = SecCertificateGetSHA1Digest();
        v33 = [v32 MCHexString];
        v34 = +[NSString stringWithFormat:@"S/MIME: %@ - %@", v27, v33];

        v64[0] = kSecClass;
        v64[1] = kSecAttrGeneric;
        v65[1] = v32;
        v65[2] = @"com.apple.certui";
        v64[2] = kSecAttrService;
        v64[3] = kSecAttrAccount;
        v64[4] = kSecReturnData;
        v65[0] = kSecClassGenericPassword;
        v65[3] = v34;
        v65[4] = &__kCFBooleanTrue;
        CFDictionaryRef v35 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:5];
        CFTypeRef result = 0;
        OSStatus v36 = SecItemCopyMatching(v35, &result);
        v37 = (void *)result;
        if (v36 == -25300) {
          goto LABEL_37;
        }
        OSStatus v38 = v36;
        if (v36)
        {
          os_log_t v45 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
            goto LABEL_37;
          }
          *(_DWORD *)buf = 67109120;
          LODWORD(v68) = v38;
          v42 = v45;
          os_log_type_t v43 = OS_LOG_TYPE_ERROR;
          v44 = "Could not query keychain for existing S/MIME certificate. Status: %d";
LABEL_35:
          uint32_t v46 = 8;
        }
        else
        {
          SecTrustSetExceptions(trust, (CFDataRef)result);
          SecTrustResultType v57 = kSecTrustResultInvalid;
          SecTrustEvaluateWithError(trust, 0);
          OSStatus TrustResult = SecTrustGetTrustResult(trust, &v57);
          if (TrustResult)
          {
            OSStatus v40 = TrustResult;
            os_log_t v41 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v68) = v40;
              v42 = v41;
              os_log_type_t v43 = OS_LOG_TYPE_ERROR;
              v44 = "Could not evaluate S/MIME certificate trust. Status: %d";
              goto LABEL_35;
            }
LABEL_37:

            id v22 = v55;
            id v17 = a3;
LABEL_38:
            CFRelease(trust);
LABEL_39:
            CFRelease(v29);
            goto LABEL_40;
          }
          if (v57 == kSecTrustResultDeny)
          {
            os_log_t v47 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
              goto LABEL_37;
            }
            *(_WORD *)buf = 0;
            v42 = v47;
            os_log_type_t v43 = OS_LOG_TYPE_INFO;
            v44 = "Not using certificate for S/MIME because we are denying this certificate.";
          }
          else
          {
            if ((SecCertificateGetKeyUsage() & 4) != 0)
            {
              log = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v68 = v27;
                _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Saving certificate as the S/MIME encryption certificate for %{public}@", buf, 0xCu);
              }
              id v49 = +[MFMessageKeychainManager saveEncryptionCertificate:a3 forAddress:v27];
              goto LABEL_37;
            }
            os_log_t v48 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
              goto LABEL_37;
            }
            *(_WORD *)buf = 0;
            v42 = v48;
            os_log_type_t v43 = OS_LOG_TYPE_INFO;
            v44 = "Not using certificate for S/MIME because it doesn't have the Key Encipherment usage.";
          }
          uint32_t v46 = 2;
        }
        _os_log_impl((void *)&_mh_execute_header, v42, v43, v44, buf, v46);
        goto LABEL_37;
      }
      v31 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v68 = v27;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Cannot copy S/MIME policy for email address %{public}@", buf, 0xCu);
      }
LABEL_40:
      v26 = (char *)v26 + 1;
    }
    while (v24 != v26);
    id v50 = [v22 countByEnumeratingWithState:&v60 objects:v66 count:16];
    id v24 = v50;
  }
  while (v50);
LABEL_53:

  CFRelease(v22);
  v15 = v52;
LABEL_54:
  id v20 = v15;
  id v19 = 0;
LABEL_55:

  return v20;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MCNewPayloadHandler *)self payload];
  uint64_t v12 = [v11 UUID];
  if ([v11 dataEncoding] != 1)
  {
    if ([v11 dataEncoding])
    {
      id v14 = [(MCNewPlainCertificatePayloadHandler *)self _malformedCertificateError];
      id v20 = 0;
LABEL_16:
      [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v20 andUUID:v12];

      goto LABEL_17;
    }
    v34 = a6;
    id v22 = [v11 certificateData];
    id v23 = +[MCCrypto copyCertificateRefFromPKCS1Data:v22];

    if (v23
      || ([v11 certificateData],
          id v24 = objc_claimAutoreleasedReturnValue(),
          id v23 = +[MCCrypto copyCertificateRefFromPEMData:v24], v24, v23))
    {
      uint64_t v25 = [v9 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
      unsigned int v26 = [v25 BOOLValue];

      v27 = [v11 profile];
      unsigned int v28 = [v27 containsPayloadOfClass:objc_opt_class()];

      if (v10) {
        int v29 = v26;
      }
      else {
        int v29 = 1;
      }
      id v35 = 0;
      id v20 = [(MCNewPlainCertificatePayloadHandler *)self _storeCertificate:v23 allowSSLTrust:v29 | v28 outError:&v35];
      id v14 = v35;
      CFRelease(v23);
      if (v20)
      {
        [v11 setCertificatePersistentID:v20];
        a6 = v34;
        goto LABEL_16;
      }
      uint64_t v31 = [(MCNewPlainCertificatePayloadHandler *)self _cannotStoreCertificateError];

      id v14 = (id)v31;
    }
    else
    {
      id v14 = [(MCNewPlainCertificatePayloadHandler *)self _malformedCertificateError];
    }
    a6 = v34;
    goto LABEL_17;
  }
  id v36 = 0;
  v13 = [(MCNewPlainCertificatePayloadHandler *)self copyIdentityImmediatelyWithInteractionClient:v10 outError:&v36];
  id v14 = v36;
  if (!v14)
  {
    id v32 = v9;
    v33 = a6;
    v15 = [(MCNewCertificatePayloadHandler *)self accessibility];
    CFStringRef v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Storing identity, storing with accessibility %@", buf, 0xCu);
    }
    uint64_t v17 = kMCAppleIdentitiesKeychainGroup;
    v18 = [(MCNewPayloadHandler *)self profileHandler];
    id v19 = [v18 profile];
    id v20 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v13, v12, v17, [v19 isInstalledForSystem], -[MCNewCertificatePayloadHandler accessibility](self, "accessibility"));

    if (!v20)
    {
      CFRelease(v13);
      id v14 = [(MCNewPlainCertificatePayloadHandler *)self _cannotStoreCertificateError];
      id v9 = v32;
      a6 = v33;
      goto LABEL_17;
    }
    [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v20 andUUID:v12];
    [v11 setCertificatePersistentID:v20];
    *(void *)buf = 0;
    SecIdentityCopyCertificate(v13, (SecCertificateRef *)buf);
    v21 = (__CFString *)SecCertificateCopySubjectSummary(*(SecCertificateRef *)buf);
    CFRelease(v13);
    CFRelease(*(CFTypeRef *)buf);
    [v11 setDisplayName:v21];

    id v14 = 0;
    id v9 = v32;
    a6 = v33;
    goto LABEL_16;
  }
LABEL_17:
  if (a6 && v14) {
    *a6 = [v14 MCCopyAsPrimaryError];
  }

  return v14 == 0;
}

- (void)setAside
{
  [(MCNewPlainCertificatePayloadHandler *)self _revertFullSSLTrustIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)MCNewPlainCertificatePayloadHandler;
  [(MCNewCertificatePayloadHandler *)&v3 setAside];
}

- (void)unsetAside
{
  objc_super v3 = [(MCNewPayloadHandler *)self payload];
  objc_super v4 = [v3 profile];
  if ([v4 shouldHaveFullSSLTrust] && objc_msgSend(v3, "isRoot"))
  {
    id v5 = [v3 copyCertificate];
    if (v5)
    {
      BOOL v6 = v5;
      v7 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "On payload unset aside: restoring full SSL trust policy of root cert.", buf, 2u);
      }
      SecTrustStoreForDomain();
      int v8 = SecTrustStoreSetTrustSettings();
      if (v8)
      {
        int v9 = v8;
        id v10 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v14 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to restore full SSL trust trust policy for certificate: %ld", buf, 0xCu);
        }
      }
      CFRelease(v6);
    }
  }
  else
  {
    id v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Root cert was not installed with full trust from payload.", buf, 2u);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)MCNewPlainCertificatePayloadHandler;
  [(MCNewCertificatePayloadHandler *)&v12 unsetAside];
}

- (void)remove
{
  objc_super v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0) {
    [(MCNewPlainCertificatePayloadHandler *)self _revertFullSSLTrustIfNeeded];
  }
  v5.receiver = self;
  v5.super_class = (Class)MCNewPlainCertificatePayloadHandler;
  [(MCNewCertificatePayloadHandler *)&v5 remove];
}

- (void)_revertFullSSLTrustIfNeeded
{
  v2 = self;
  objc_super v3 = [(MCNewPayloadHandler *)self payload];
  unsigned __int8 v4 = [v3 profile];
  if (![v4 shouldHaveFullSSLTrust])
  {
    BOOL v6 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    id v32 = "Root cert was not installed with full trust from payload.";
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v32, buf, 2u);
    goto LABEL_41;
  }
  unsigned int v5 = [v3 isFullyTrustedRootCert];
  BOOL v6 = _MCLogObjects[0];
  BOOL v7 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (!v7) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    id v32 = "Root cert is not fully trusted root cert, skipping partial trust restore.";
    goto LABEL_32;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Removing fully-trusted root cert payload.", buf, 2u);
  }
  int v8 = [v3 UUID];
  int v9 = +[MCDependencyManager sharedManager];
  id v10 = [v3 persistentResourceID];
  id v11 = [v9 dependentsOfParent:v10 inDomain:kMCDMCertificateToPayloadUUIDDependencyKey];
  id v12 = [v11 mutableCopy];

  [v12 removeObject:v8];
  if ([v12 count])
  {
    v13 = [v4 identifier];
    uint64_t v14 = +[MCManifest sharedManifest];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v15 = [v14 allInstalledProfileIdentifiers];
    id v45 = [v15 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v45)
    {
      uint64_t v16 = *(void *)v51;
      OSStatus v38 = v8;
      v39 = v4;
      os_log_type_t v43 = v13;
      id v44 = v12;
      uint64_t v36 = *(void *)v51;
      v37 = v2;
      os_log_t v41 = v15;
      v42 = v14;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v51 != v16) {
            objc_enumerationMutation(v15);
          }
          v18 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if ((objc_msgSend(v18, "isEqual:", v13, v36, v37) & 1) == 0)
          {
            OSStatus v40 = v18;
            id v19 = [v14 installedProfileWithIdentifier:v18];
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v20 = v12;
            id v21 = [v20 countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (v21)
            {
              id v22 = v21;
              uint64_t v23 = *(void *)v47;
              while (2)
              {
                for (j = 0; j != v22; j = (char *)j + 1)
                {
                  if (*(void *)v47 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
                  uint64_t v26 = [v19 payloadWithUUID:v25];
                  if (v26)
                  {
                    v27 = (void *)v26;
                    unsigned int v28 = [v19 shouldHaveFullSSLTrust];

                    if (v28)
                    {
                      v33 = _MCLogObjects[0];
                      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543618;
                        uint64_t v55 = v25;
                        __int16 v56 = 2114;
                        SecTrustResultType v57 = v40;
                        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Payload %{public}@ from profile %{public}@ has installed this root cert with full trust.", buf, 0x16u);
                      }

                      v34 = _MCLogObjects[0];
                      int v8 = v38;
                      unsigned __int8 v4 = v39;
                      v13 = v43;
                      id v12 = v44;
                      uint64_t v14 = v42;
                      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Root cert was installed with full trust, but other certs may have a full-trust dependency. Skipping restore of partial trust.", buf, 2u);
                      }
                      goto LABEL_37;
                    }
                  }
                }
                id v22 = [v20 countByEnumeratingWithState:&v46 objects:v58 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
            }

            v13 = v43;
            id v12 = v44;
            uint64_t v16 = v36;
            v2 = v37;
            v15 = v41;
            uint64_t v14 = v42;
          }
        }
        int v8 = v38;
        unsigned __int8 v4 = v39;
        id v45 = [v15 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v45);
    }

    int v29 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Root cert was installed with full trust, and no other certs have a full-trust dependency. Attempting to restore partial trust.", buf, 2u);
    }
    id v30 = [v3 copyCertificate];
    if (v30)
    {
      uint64_t v31 = v30;
      [(MCNewPlainCertificatePayloadHandler *)v2 _grantPartialNonSSLTrustPolicyForCertificate:v30];
      CFRelease(v31);
    }
LABEL_37:
  }
  else
  {
    id v35 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "No other payloads are dependent on fully-trusted root cert that is about to be removed. Skipping restore of partial trust.", buf, 2u);
    }
  }

LABEL_41:
}

- (int)_grantPartialNonSSLTrustPolicyForCertificate:(__SecCertificate *)a3
{
  CFRetain(a3);
  SecPolicyRef SSL = SecPolicyCreateSSL(1u, 0);
  unsigned int v5 = _MCLogObjects[0];
  if (SSL)
  {
    SecPolicyRef v6 = SSL;
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting partial trust policy for root cert.", (uint8_t *)&v13, 2u);
    }
    v17[0] = @"kSecTrustSettingsPolicy";
    v17[1] = @"kSecTrustSettingsResult";
    v18[0] = v6;
    v18[1] = &off_1000F51B8;
    BOOL v7 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    v19[0] = v7;
    CFStringRef v15 = @"kSecTrustSettingsResult";
    uint64_t v16 = &off_1000F51D0;
    int v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v19[1] = v8;
    int v9 = +[NSArray arrayWithObjects:v19 count:2];

    SecTrustStoreForDomain();
    int v10 = SecTrustStoreSetTrustSettings();
    if (v10)
    {
      id v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        int v13 = 134217984;
        uint64_t v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to set partial trust policy for certificate: %ld", (uint8_t *)&v13, 0xCu);
      }
    }
    CFRelease(v6);
  }
  else
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to create partial trust policy for certificate.", (uint8_t *)&v13, 2u);
    }
    int v10 = -50;
  }
  CFRelease(a3);
  return v10;
}

- (id)_invalidPasscodeError
{
  v2 = [(MCNewPayloadHandler *)self payload];
  uint64_t v3 = MCCertificateErrorDomain;
  unsigned __int8 v4 = [v2 certificateFileName];
  unsigned int v5 = MCErrorArray();
  SecPolicyRef v6 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9000, v5, MCErrorTypeNeedsRetry, v4, 0);

  return v6;
}

- (id)_tooManyCertificatesError
{
  v2 = [(MCNewPayloadHandler *)self payload];
  uint64_t v3 = MCCertificateErrorDomain;
  unsigned __int8 v4 = [v2 certificateFileName];
  unsigned int v5 = MCErrorArray();
  SecPolicyRef v6 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9001, v5, MCErrorTypeFatal, v4, 0);

  return v6;
}

- (id)_cannotStoreCertificateError
{
  v2 = [(MCNewPayloadHandler *)self payload];
  uint64_t v3 = MCCertificateErrorDomain;
  unsigned __int8 v4 = [v2 certificateFileName];
  unsigned int v5 = MCErrorArray();
  SecPolicyRef v6 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9002, v5, MCErrorTypeFatal, v4, 0);

  return v6;
}

- (id)_cannotStoreRootCertificateError
{
  v2 = [(MCNewPayloadHandler *)self payload];
  uint64_t v3 = MCCertificateErrorDomain;
  unsigned __int8 v4 = [v2 certificateFileName];
  unsigned int v5 = MCErrorArray();
  SecPolicyRef v6 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9004, v5, MCErrorTypeFatal, v4, 0);

  return v6;
}

- (id)_malformedCertificateError
{
  v2 = [(MCNewPayloadHandler *)self payload];
  uint64_t v3 = MCCertificateErrorDomain;
  unsigned __int8 v4 = [v2 certificateFileName];
  unsigned int v5 = MCErrorArray();
  SecPolicyRef v6 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 9005, v5, MCErrorTypeFatal, v4, 0);

  return v6;
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  identity = self->_identity;
  if (!identity)
  {
    int v8 = [(MCNewPayloadHandler *)self payload];
    if ([v8 dataEncoding] == 1)
    {
      int v9 = [(MCNewPayloadHandler *)self userInputResponses];
      int v10 = [v8 password];
      id v11 = +[MCNewPayloadHandler prioritizeUserInput:v9 key:@"certificatePassword" overField:v10];

      if (v11)
      {
        id v22 = 0;
        id v12 = [(MCNewPlainCertificatePayloadHandler *)self _copyContentsOfPKCS12DataWithPasscode:v11 outError:&v22];
        id v13 = v22;
        self->_identity = v12;
      }
      else
      {
        id v13 = [(MCNewPlainCertificatePayloadHandler *)self _invalidPasscodeError];
      }

      if (!v13)
      {
LABEL_13:
        id v20 = self->_identity;
        if (v20)
        {
          CFRetain(v20);
          SecPolicyRef v6 = self->_identity;
LABEL_16:

          return v6;
        }
LABEL_15:
        SecPolicyRef v6 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v14 = MCCertificateErrorDomain;
      CFStringRef v15 = [v8 friendlyName];
      uint64_t v16 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v14, 9006, v16, MCErrorTypeFatal, v15, 0);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      if (!v13) {
        goto LABEL_13;
      }
    }
    if (a4) {
      *a4 = v13;
    }
    os_log_t v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      id v19 = [v13 MCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      id v24 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Cannot copy identity: %{public}@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  CFRetain(identity);
  return self->_identity;
}

@end