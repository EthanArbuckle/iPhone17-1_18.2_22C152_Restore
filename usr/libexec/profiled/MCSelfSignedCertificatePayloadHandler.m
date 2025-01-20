@interface MCSelfSignedCertificatePayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4;
- (id)_createKeyPairType:(id)a3 size:(unint64_t)a4 hardwareBound:(BOOL)a5 outPublicKey:(__SecKey *)a6 outPrivateKey:(__SecKey *)a7;
- (id)generateSelfSignedCertificatePublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4 keyUsage:(unsigned int)a5 extendedKeyUsage:(id)a6 lifetime:(unint64_t)a7 outCert:(__SecCertificate *)a8;
- (void)dealloc;
@end

@implementation MCSelfSignedCertificatePayloadHandler

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)MCSelfSignedCertificatePayloadHandler;
  [(MCSelfSignedCertificatePayloadHandler *)&v4 dealloc];
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a5;
  v9 = [(MCNewPayloadHandler *)self payload];
  id v27 = 0;
  v10 = [(MCSelfSignedCertificatePayloadHandler *)self copyIdentityImmediatelyWithInteractionClient:v8 outError:&v27];
  id v11 = v27;
  if (!v11)
  {
    v26 = a6;
    v12 = [(MCNewCertificatePayloadHandler *)self accessibility];
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Storing self-signed identity with accessibility %@", buf, 0xCu);
    }
    v14 = [v9 UUID];
    uint64_t v15 = kMCAppleIdentitiesKeychainGroup;
    v16 = [(MCNewPayloadHandler *)self profileHandler];
    v17 = [v16 profile];
    v18 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v10, v14, v15, [v17 isInstalledForSystem], v12);

    CFRelease(v10);
    if (v18)
    {
      v19 = [v9 UUID];
      [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v18 andUUID:v19];

      if (v8)
      {
        id v11 = 0;
        if (([v8 didUpdateStatus:0] & 1) == 0)
        {
          v20 = [(MCNewPayloadHandler *)self profileHandler];
          id v11 = [v20 userCancelledError];
        }
      }
      else
      {
        id v11 = 0;
      }
      [v9 setCertificatePersistentID:v18];
      v23 = [v9 UUID];
      [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v18 andUUID:v23];

      v24 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Successfully installed certificate.", buf, 2u);
      }
    }
    else
    {
      uint64_t v21 = MCCertificateErrorDomain;
      v22 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v21, 9002, v22, MCErrorTypeFatal, 0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    a6 = v26;
  }
  if (a6 && v11) {
    *a6 = [v11 MCCopyAsPrimaryError];
  }

  return v11 == 0;
}

- (id)_createKeyPairType:(id)a3 size:(unint64_t)a4 hardwareBound:(BOOL)a5 outPublicKey:(__SecKey *)a6 outPrivateKey:(__SecKey *)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  CFErrorRef error = 0;
  v12 = +[NSMutableDictionary dictionaryWithCapacity:3];
  if ([v11 isEqualToString:kMCSSCKeyTypeRSA])
  {
    v13 = &kSecAttrKeyTypeRSA;
  }
  else
  {
    if (![v11 isEqualToString:kMCSSCKeyTypeECSECPrimeRandom]) {
      goto LABEL_6;
    }
    v13 = &kSecAttrKeyTypeECSECPrimeRandom;
  }
  [v12 setObject:*v13 forKeyedSubscript:kSecAttrKeyType];
LABEL_6:
  v14 = +[NSNumber numberWithUnsignedInteger:a4];
  [v12 setObject:v14 forKeyedSubscript:kSecAttrKeySizeInBits];

  if (v9) {
    [v12 setObject:kSecAttrTokenIDSecureEnclave forKeyedSubscript:kSecAttrTokenID];
  }
  uint64_t v15 = SecKeyCreateRandomKey((CFDictionaryRef)v12, &error);
  v16 = v15;
  if (error)
  {
    v17 = 0;
    goto LABEL_13;
  }
  v17 = SecKeyCopyPublicKey(v15);
  if (!v17)
  {
    uint64_t v18 = MCSelfSignedCertificateErrorDomain;
    v19 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v18, 59001, v19, MCErrorTypeFatal, 0);
    CFErrorRef error = (CFErrorRef)objc_claimAutoreleasedReturnValue();
  }
  if (error)
  {
LABEL_13:
    if (v16) {
      CFRelease(v16);
    }
    if (v17)
    {
      v20 = v17;
LABEL_17:
      CFRelease(v20);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (a6)
  {
    *a6 = v17;
  }
  else if (v17)
  {
    CFRelease(v17);
  }
  if (a7)
  {
    *a7 = v16;
  }
  else if (v16)
  {
    v20 = v16;
    goto LABEL_17;
  }
LABEL_18:
  CFErrorRef v21 = error;

  return v21;
}

- (id)generateSelfSignedCertificatePublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4 keyUsage:(unsigned int)a5 extendedKeyUsage:(id)a6 lifetime:(unint64_t)a7 outCert:(__SecCertificate *)a8
{
  uint64_t v9 = kSecOidCommonName;
  v34[0] = kSecOidCommonName;
  id v31 = a6;
  v10 = [(MCNewPayloadHandler *)self payload];
  id v11 = [v10 identifier];
  v34[1] = v11;
  v12 = +[NSArray arrayWithObjects:v34 count:2];
  v35 = v12;
  v13 = +[NSArray arrayWithObjects:&v35 count:1];
  v36[0] = v13;
  v32[0] = v9;
  v14 = [(MCNewPayloadHandler *)self profileHandler];
  uint64_t v15 = [v14 profile];
  v16 = [v15 identifier];
  v32[1] = v16;
  v17 = +[NSArray arrayWithObjects:v32 count:2];
  v33 = v17;
  uint64_t v18 = +[NSArray arrayWithObjects:&v33 count:1];
  v36[1] = v18;
  v19 = +[NSArray arrayWithObjects:v36 count:2];

  v20 = +[NSMutableDictionary dictionaryWithCapacity:3];
  CFErrorRef v21 = +[NSNumber numberWithUnsignedInt:a5];
  [v20 setObject:v21 forKeyedSubscript:kSecCertificateKeyUsage];

  v22 = +[NSNumber numberWithUnsignedInteger:a7];
  [v20 setObject:v22 forKeyedSubscript:kSecCertificateLifetime];

  [v20 setObject:v31 forKeyedSubscript:kSecCertificateExtendedKeyUsage];
  SelfSignedCertificate = (__SecCertificate *)SecGenerateSelfSignedCertificate();
  if (SelfSignedCertificate)
  {
    if (a8)
    {
      v24 = 0;
      *a8 = SelfSignedCertificate;
    }
    else
    {
      CFRelease(SelfSignedCertificate);
      v24 = 0;
    }
  }
  else
  {
    uint64_t v25 = MCSelfSignedCertificateErrorDomain;
    v26 = MCErrorArray();
    v24 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v25, 59002, v26, MCErrorTypeFatal, 0);
  }

  return v24;
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  identity = self->_identity;
  if (!identity)
  {
    uint64_t v9 = [(MCNewPayloadHandler *)self payload];
    CFTypeRef v37 = 0;
    CFTypeRef cf = 0;
    CFTypeRef v36 = 0;
    if (v6)
    {
      v10 = MCLocalizedString();
      unsigned __int8 v11 = [v6 didUpdateStatus:v10];

      if ((v11 & 1) == 0) {
        goto LABEL_12;
      }
    }
    v12 = [v9 keyType];
    v13 = [-[MCSelfSignedCertificatePayloadHandler _createKeyPairType:size:hardwareBound:outPublicKey:outPrivateKey:](self, "_createKeyPairType:size:hardwareBound:outPublicKey:outPrivateKey:", v12, [v9 keySize], objc_msgSend(v9, "isHardwareBound"), &v37, &v36);

    if (v13)
    {
      uint64_t v14 = MCSelfSignedCertificateErrorDomain;
      uint64_t v15 = MCErrorArray();
      uint64_t v16 = MCErrorTypeFatal;
      uint64_t v17 = v14;
      uint64_t v18 = 59000;
LABEL_11:
      v26 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v17, v18, v15, v13, v16, 0);

      goto LABEL_13;
    }
    if (v6
      && (MCLocalizedString(),
          v19 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v20 = [v6 didUpdateStatus:v19],
          v19,
          (v20 & 1) == 0))
    {
LABEL_12:
      id v27 = [(MCNewPayloadHandler *)self profileHandler];
      v26 = [v27 userCancelledError];
    }
    else
    {
      CFTypeRef v22 = v36;
      CFTypeRef v21 = v37;
      id v23 = [v9 keyUsage];
      v24 = [v9 extendedKeyUsage];
      v13 = -[MCSelfSignedCertificatePayloadHandler generateSelfSignedCertificatePublicKey:privateKey:keyUsage:extendedKeyUsage:lifetime:outCert:](self, "generateSelfSignedCertificatePublicKey:privateKey:keyUsage:extendedKeyUsage:lifetime:outCert:", v21, v22, v23, v24, [v9 lifetime], &cf);

      if (v13)
      {
        uint64_t v25 = MCSelfSignedCertificateErrorDomain;
        uint64_t v15 = MCErrorArray();
        uint64_t v16 = MCErrorTypeFatal;
        uint64_t v17 = v25;
        uint64_t v18 = 59002;
        goto LABEL_11;
      }
      v33 = (__SecIdentity *)SecIdentityCreate();
      self->_identity = v33;
      if (v33)
      {
        v26 = 0;
      }
      else
      {
        uint64_t v34 = MCSelfSignedCertificateErrorDomain;
        v35 = MCErrorArray();
        v26 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v34, 59003, v35, MCErrorTypeFatal, 0);
      }
    }
LABEL_13:
    if (cf) {
      CFRelease(cf);
    }
    if (v37) {
      CFRelease(v37);
    }
    if (v36) {
      CFRelease(v36);
    }
    if (v6) {
      [v6 didUpdateStatus:0];
    }
    if (v26)
    {
      if (a4) {
        *a4 = v26;
      }
      os_log_t v28 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v29 = v28;
        v30 = [v26 MCVerboseDescription];
        *(_DWORD *)buf = 138543362;
        v40 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Cannot generate self-signed certificate: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v31 = self->_identity;
      if (v31)
      {
        CFRetain(v31);
        id v8 = self->_identity;
LABEL_29:

        goto LABEL_30;
      }
    }
    id v8 = 0;
    goto LABEL_29;
  }
  CFRetain(identity);
  id v8 = self->_identity;
LABEL_30:

  return v8;
}

@end