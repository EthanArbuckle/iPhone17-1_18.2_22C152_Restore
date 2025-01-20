@interface MCNewSCEPPayloadHandler
+ (id)atsOverrideDataWithInsecureHTTPForHost:(id)a3 fromATSOverrideData:(id)a4;
+ (id)mutableATSExceptionInExceptionDomains:(id)a3 matchingHost:(id)a4;
+ (void)allowInsecureHTTPLoadsOfURL:(id)a3 forConfiguration:(id)a4;
- (BOOL)_createKeyPairLength:(unint64_t)a3 outPublicKey:(__SecKey *)a4 outPrivateKey:(__SecKey *)a5;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4;
- (id)_SCEPOperationURLWithBaseURLString:(id)a3 operation:(id)a4 message:(id)a5;
- (id)_invalidRAResponse;
- (id)_performPKIOperation:(id)a3 withPayload:(id)a4 usingPost:(BOOL)a5 error:(id *)a6;
- (id)_synchronousTransactionWithURL:(id)a3 method:(id)a4 content:(id)a5 contentType:(id)a6 outResponseCode:(int64_t *)a7 outContentType:(id *)a8 outError:(id *)a9;
- (id)userInputFields;
- (void)dealloc;
@end

@implementation MCNewSCEPPayloadHandler

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)MCNewSCEPPayloadHandler;
  [(MCNewSCEPPayloadHandler *)&v4 dealloc];
}

- (id)userInputFields
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 challenge];

  if (v3)
  {
    objc_super v4 = +[NSArray array];
  }
  else
  {
    objc_super v4 = +[NSMutableArray array];
    v5 = MCLocalizedString();
    v6 = [v2 friendlyName];
    v7 = MCLocalizedFormat();
    v8 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"challenge", v5, v7, 0, 0, 0, 0, 0, 3);
    [v4 addObject:v8];
  }

  return v4;
}

- (id)_SCEPOperationURLWithBaseURLString:(id)a3 operation:(id)a4 message:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)NSURLComponents) initWithString:v9];

  id v11 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"operation" value:v8];
  id v17 = v11;
  v12 = +[NSArray arrayWithObjects:&v17 count:1];
  id v13 = [v12 mutableCopy];

  if (v7)
  {
    id v14 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"message" value:v7];
    [v13 addObject:v14];
  }
  [v10 setQueryItems:v13];
  v15 = [v10 URL];

  return v15;
}

+ (id)mutableATSExceptionInExceptionDomains:(id)a3 matchingHost:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  for (id i = v6; ; id i = (id)v14)
  {
    id v8 = [v5 objectForKeyedSubscript:i];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    id v9 = v8;
    id v10 = v9;
    if (i == v6)
    {
      id i = v6;
      goto LABEL_12;
    }
    id v11 = [v9 objectForKeyedSubscript:@"NSIncludesSubdomains"];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v11 BOOLValue]) {
      break;
    }

LABEL_7:
    v12 = (char *)[i rangeOfString:@"."];
    if (!v13)
    {
      id v10 = 0;
      goto LABEL_12;
    }
    uint64_t v14 = [i substringFromIndex:v12 + 1];
  }
LABEL_12:

  return v10;
}

+ (id)atsOverrideDataWithInsecureHTTPForHost:(id)a3 fromATSOverrideData:(id)a4
{
  id v5 = a3;
  id v6 = +[NSPropertyListSerialization propertyListWithData:a4 options:1 format:0 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSMutableDictionary dictionaryWithCapacity:1];
  }
  id v8 = v7;
  id v9 = [v7 objectForKeyedSubscript:@"NSExceptionDomains"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
  }
  else
  {
    id v10 = +[NSMutableDictionary dictionaryWithCapacity:1];
    [v8 setObject:v10 forKeyedSubscript:@"NSExceptionDomains"];
  }
  id v11 = [(id)objc_opt_class() mutableATSExceptionInExceptionDomains:v10 matchingHost:v5];
  if (!v11)
  {
    id v11 = +[NSMutableDictionary dictionaryWithCapacity:1];
    [v10 setObject:v11 forKeyedSubscript:v5];
  }
  v12 = +[NSNumber numberWithBool:1];
  [v11 setObject:v12 forKeyedSubscript:@"NSExceptionAllowsInsecureHTTPLoads"];

  uint64_t v13 = +[NSPropertyListSerialization dataWithPropertyList:v8 format:200 options:0 error:0];

  return v13;
}

+ (void)allowInsecureHTTPLoadsOfURL:(id)a3 forConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_class();
  id v11 = [v6 host];

  id v8 = [v11 lowercaseString];
  id v9 = [v5 _atsContext];
  id v10 = [v7 atsOverrideDataWithInsecureHTTPForHost:v8 fromATSOverrideData:v9];
  [v5 set_atsContext:v10];
}

- (id)_synchronousTransactionWithURL:(id)a3 method:(id)a4 content:(id)a5 contentType:(id)a6 outResponseCode:(int64_t *)a7 outContentType:(id *)a8 outError:(id *)a9
{
  id v14 = a3;
  id v39 = a4;
  id v40 = a5;
  id v41 = a6;
  v42 = v14;
  v15 = +[NSMutableURLRequest requestWithURL:v14];
  [v15 setHTTPMethod:v39];
  if (v40) {
    [v15 setHTTPBody:];
  }
  if (v41) {
    [v15 setValue:v41 forHTTPHeaderField:@"Content-Type"];
  }
  v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v42;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Performing synchronous URL request: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v51 = 0x3032000000;
  v52 = sub_100075C7C;
  v53 = sub_100075C8C;
  id v54 = 0;
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  uint64_t v18 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  [(id)objc_opt_class() allowInsecureHTTPLoadsOfURL:v42 forConfiguration:v18];
  v37 = (void *)v18;
  v19 = +[NSURLSession sessionWithConfiguration:v18];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100075C94;
  v43[3] = &unk_1000EC0F0;
  p_long long buf = &buf;
  v20 = v17;
  v44 = v20;
  v21 = [v19 dataTaskWithRequest:v15 completionHandler:v43];
  [v21 resume];
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  v38 = [v21 response];
  v22 = [v21 error];
  v36 = v19;
  v23 = _MCLogObjects[0];
  if (v22)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v46 = 138543618;
      id v47 = v42;
      __int16 v48 = 2114;
      v49 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "URL request to %{public}@ failed. Error: %{public}@", v46, 0x16u);
    }
    if (a9)
    {
      v24 = [v22 domain];
      id v25 = [v22 code];
      v26 = [v22 localizedDescription];
      v27 = MCErrorArrayFromLocalizedDescription();
      uint64_t v28 = MCErrorTypeFatal;
      v29 = +[NSError MCErrorWithDomain:v24 code:v25 descriptionArray:v27 errorType:MCErrorTypeFatal];

      v30 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCSCEPErrorDomain, 22005, v30, v29, v28, 0);
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v31 = _MCLogObjects[0];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      id v32 = [v38 statusCode];
      *(_DWORD *)v46 = 134217984;
      id v47 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "URL request failed. Status code: %ld", v46, 0xCu);
    }

    id v33 = 0;
  }
  else
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "URL request succeeded.", v46, 2u);
    }
    if (a7) {
      *a7 = (int64_t)[v38 statusCode];
    }
    if (a8)
    {
      v34 = [v38 allHeaderFields];
      *a8 = [v34 objectForKey:@"Content-Type"];
    }
    id v33 = *(id *)(*((void *)&buf + 1) + 40);
  }

  _Block_object_dispose(&buf, 8);

  return v33;
}

- (id)_invalidRAResponse
{
  uint64_t v2 = MCSCEPErrorDomain;
  v3 = MCErrorArray();
  objc_super v4 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 22003, v3, MCErrorTypeFatal, 0);

  return v4;
}

- (BOOL)_createKeyPairLength:(unint64_t)a3 outPublicKey:(__SecKey *)a4 outPrivateKey:(__SecKey *)a5
{
  v11[0] = kSecAttrKeyTypeRSA;
  v10[0] = kSecAttrKeyType;
  v10[1] = kSecAttrKeySizeInBits;
  id v7 = +[NSNumber numberWithUnsignedInteger:a3];
  v11[1] = v7;
  CFDictionaryRef v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  LOBYTE(a5) = SecKeyGeneratePair(v8, a4, a5) == 0;
  return (char)a5;
}

- (id)_performPKIOperation:(id)a3 withPayload:(id)a4 usingPost:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = @"GET";
  if (v7) {
    v12 = @"POST";
  }
  uint64_t v13 = v12;
  if (v7)
  {
    id v14 = 0;
  }
  else
  {
    id v14 = [v11 base64EncodedStringWithOptions:0];
  }
  v15 = [(MCNewSCEPPayloadHandler *)self _SCEPOperationURLWithBaseURLString:v10 operation:@"PKIOperation" message:v14];
  v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Sending CSR via %{public}@.", buf, 0xCu);
  }
  if (v7) {
    id v17 = v11;
  }
  else {
    id v17 = 0;
  }
  uint64_t v18 = [(MCNewSCEPPayloadHandler *)self _synchronousTransactionWithURL:v15 method:v13 content:v17 contentType:@"application/x-pki-message" outResponseCode:0 outContentType:0 outError:a6];

  return v18;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a5;
  id v9 = [(MCNewPayloadHandler *)self payload];
  id v27 = 0;
  id v10 = [(MCNewSCEPPayloadHandler *)self copyIdentityImmediatelyWithInteractionClient:v8 outError:&v27];
  id v11 = v27;
  if (!v11)
  {
    v26 = a6;
    v12 = [(MCNewCertificatePayloadHandler *)self accessibility];
    uint64_t v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Storing SCEP identity, storing with accessibility %@", buf, 0xCu);
    }
    id v14 = [v9 UUID];
    uint64_t v15 = kMCAppleIdentitiesKeychainGroup;
    v16 = [(MCNewPayloadHandler *)self profileHandler];
    id v17 = [v16 profile];
    uint64_t v18 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v10, v14, v15, [v17 isInstalledForSystem], v12);

    v19 = [v9 UUID];
    [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v18 andUUID:v19];

    CFRelease(v10);
    if (v18)
    {
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
        *(_WORD *)long long buf = 0;
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

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  identity = self->_identity;
  if (identity)
  {
    CFRetain(identity);
    id v8 = self->_identity;
    goto LABEL_34;
  }
  id v9 = [(MCNewPayloadHandler *)self payload];
  id v10 = [(MCNewPayloadHandler *)self userInputResponses];
  id v11 = [v9 challenge];
  v12 = +[MCNewPayloadHandler prioritizeUserInput:v10 key:@"challenge" overField:v11];

  CFTypeRef v169 = 0;
  CFTypeRef v170 = 0;
  if (v6)
  {
    uint64_t v13 = MCLocalizedString();
    unsigned __int8 v14 = [v6 didUpdateStatus:v13];

    if ((v14 & 1) == 0) {
      goto LABEL_14;
    }
  }
  if (!-[MCNewSCEPPayloadHandler _createKeyPairLength:outPublicKey:outPrivateKey:](self, "_createKeyPairLength:outPublicKey:outPrivateKey:", [v9 keySize], &v170, &v169))
  {
    uint64_t v28 = MCSCEPErrorDomain;
    MCErrorArray();
    v30 = v29 = a4;
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v28, 22001, v30, MCErrorTypeFatal, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    a4 = v29;
    goto LABEL_16;
  }
  if (v6)
  {
    uint64_t v15 = MCLocalizedString();
    unsigned __int8 v16 = [v6 didUpdateStatus:v15];

    if ((v16 & 1) == 0)
    {
LABEL_14:
      id v27 = [(MCNewPayloadHandler *)self profileHandler];
      id v23 = [v27 userCancelledError];

LABEL_16:
      v26 = 0;
      v24 = 0;
      goto LABEL_17;
    }
  }
  id v17 = [v9 URLString];
  uint64_t v18 = [v9 CAInstanceName];
  uint64_t v19 = [(MCNewSCEPPayloadHandler *)self _SCEPOperationURLWithBaseURLString:v17 operation:@"GetCACert" message:v18];

  id v167 = 0;
  id v168 = 0;
  v161 = (void *)v19;
  CFDataRef v20 = [(MCNewSCEPPayloadHandler *)self _synchronousTransactionWithURL:v19 method:@"GET" content:0 contentType:0 outResponseCode:0 outContentType:&v168 outError:&v167];
  id v21 = v168;
  id v22 = v167;
  v160 = v21;
  if (v22)
  {
    id v23 = v22;
LABEL_10:
    v24 = 0;
    id v25 = 0;
    v162 = 0;
    goto LABEL_11;
  }
  CFDataRef data = v20;
  if (![v21 isEqualToString:@"application/x-x509-ca-cert"])
  {
    if (![v21 isEqualToString:@"application/x-x509-ca-ra-cert"])
    {
      id v25 = 0;
      v38 = 0;
      goto LABEL_45;
    }
    id v25 = (const void *)SecCMSCertificatesOnlyMessageCopyCertificates();
    if (v25)
    {
      *(void *)long long buf = 0;
      id v166 = 0;
      [v9 CAFingerprint];
      if (!SecSCEPValidateCACertMessage())
      {
        if (*(void *)buf)
        {
          v118 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v165 = 0;
            _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEBUG, "GetCACert returned an RA certificate.", v165, 2u);
          }
          uint64_t v119 = +[NSArray arrayWithObject:*(void *)buf];
          v120 = *(const void **)buf;
          CFRetain(*(CFTypeRef *)buf);
        }
        else
        {
          v120 = 0;
          uint64_t v119 = 0;
        }
        CFRelease(v25);
        v38 = (void *)v119;
        id v25 = v120;
        goto LABEL_45;
      }
      id v23 = [(MCNewSCEPPayloadHandler *)self _invalidRAResponse];
      CFRelease(v25);
      v24 = 0;
      id v25 = 0;
    }
    else
    {
      id v23 = [(MCNewSCEPPayloadHandler *)self _invalidRAResponse];
      v24 = 0;
    }
    v162 = 0;
    goto LABEL_11;
  }
  v36 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "GetCACert returned a CA certificate.", buf, 2u);
  }
  SecCertificateRef v37 = SecCertificateCreateWithData(kCFAllocatorDefault, v20);
  if (!v37)
  {
    uint64_t v63 = MCSCEPErrorDomain;
    MCErrorArray();
    v64 = v155 = a4;
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v63, 22002, v64, MCErrorTypeFatal, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    a4 = v155;
    goto LABEL_10;
  }
  id v25 = v37;
  v38 = +[NSArray arrayWithObject:v37];
LABEL_45:
  v162 = v38;
  id v39 = [v38 count];
  v158 = v12;
  if (!v25 || !v39)
  {
    uint64_t v61 = MCSCEPErrorDomain;
    v62 = MCErrorArray();
    CFDataRef v20 = data;
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v61, 22004, v62, MCErrorTypeFatal, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    v12 = v158;
    v24 = 0;
    goto LABEL_11;
  }
  v153 = v25;
  v154 = a4;
  uint64_t v40 = kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate;
  id v41 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v40;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Temporarily storing SCEP server certificate, storing with accessibility %@", buf, 0xCu);
  }
  v42 = [v9 UUID];
  v43 = +[NSString stringWithFormat:@"%@-signing", v42];
  uint64_t v44 = kMCAppleCertificatesKeychainGroup;
  v45 = [(MCNewPayloadHandler *)self profileHandler];
  [v45 profile];
  id v47 = v46 = v40;
  uint64_t v156 = v44;
  v24 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v153, v43, v44, [v47 isInstalledForSystem], v46);

  v147 = v24;
  if (!v24)
  {
    uint64_t v65 = MCSCEPErrorDomain;
    uint64_t v66 = MCErrorArray();
    uint64_t v67 = v65;
    v68 = (void *)v66;
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v67, 22012, v66, MCErrorTypeFatal, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v158;
    CFDataRef v20 = data;
    a4 = v154;
    goto LABEL_142;
  }
  __int16 v48 = [v9 UUID];
  [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v24 andUUID:v48];

  v49 = [v9 CACaps];
  if (v49) {
    goto LABEL_51;
  }
  v72 = [v9 URLString];
  v73 = [v9 CAInstanceName];
  uint64_t v74 = [(MCNewSCEPPayloadHandler *)self _SCEPOperationURLWithBaseURLString:v72 operation:@"GetCACaps" message:v73];

  v68 = (void *)v74;
  id v164 = 0;
  v75 = [(MCNewSCEPPayloadHandler *)self _synchronousTransactionWithURL:v74 method:@"GET" content:0 contentType:0 outResponseCode:0 outContentType:0 outError:&v164];
  id v76 = v164;
  v12 = v158;
  if (v76)
  {
    id v23 = v76;
    v146 = v75;
    v24 = 0;
    a4 = v154;
    CFDataRef v20 = data;

    goto LABEL_142;
  }
  if ([v75 length])
  {
    id v121 = [objc_alloc((Class)NSString) initWithData:v75 encoding:4];
    +[NSCharacterSet characterSetWithCharactersInString:@"\r\n"];
    v123 = v122 = v68;
    [v121 componentsSeparatedByCharactersInSet:v123];
    v49 = v124 = v75;

    if (v49)
    {
LABEL_51:
      unsigned int v148 = [v49 containsObject:@"POSTPKIOperation"];
      unsigned int v50 = [v49 containsObject:@"AES"];
      unsigned __int8 v51 = [v49 containsObject:@"DES3"];
      unsigned int v52 = [v49 containsObject:@"SHA-512"];
      unsigned int v53 = [v49 containsObject:@"SHA-256"];
      unsigned int v151 = [v49 containsObject:@"SHA-1"];
      v142 = v49;
      goto LABEL_52;
    }
  }
  else
  {
  }
  v137 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "Did not receive GetCACaps information from SCEP server. Assuming support for SHA-1 only.", buf, 2u);
  }
  v142 = 0;
  unsigned int v53 = 0;
  unsigned int v52 = 0;
  unsigned __int8 v51 = 0;
  unsigned int v50 = 0;
  unsigned int v148 = 0;
  unsigned int v151 = 1;
LABEL_52:
  id v54 = +[NSMutableDictionary dictionaryWithCapacity:5];
  v55 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 usageFlags]);
  [v54 setObject:v55 forKeyedSubscript:kSecCertificateKeyUsage];

  [v54 setObject:v158 forKeyedSubscript:kSecCSRChallengePassword];
  v56 = [v9 subjectAltName];
  [v54 setObject:v56 forKeyedSubscript:kSecSubjectAltName];

  v145 = v54;
  if (v50)
  {
    [v54 setObject:kSecCMSEncryptionAlgorithmAESCBC forKeyedSubscript:kSecCMSBulkEncryptionAlgorithm];
    os_log_t v57 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_64;
    }
    *(_WORD *)long long buf = 0;
    v58 = "SCEP: AES is supported.";
    v59 = v57;
    os_log_type_t v60 = OS_LOG_TYPE_INFO;
    goto LABEL_63;
  }
  if ((v51 & 1) == 0)
  {
    os_log_t v69 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      v58 = "Insufficient required capability from Certificate Authority. AES, 3DES not supported. Falling back to 3DES anyway.";
      v59 = v69;
      os_log_type_t v60 = OS_LOG_TYPE_ERROR;
LABEL_63:
      _os_log_impl((void *)&_mh_execute_header, v59, v60, v58, buf, 2u);
    }
  }
LABEL_64:
  v12 = v158;
  if (v52)
  {
    [v145 setObject:kSecCMSHashingAlgorithmSHA512 forKeyedSubscript:kSecCMSSignHashAlgorithm];
    v70 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_77;
    }
    *(_WORD *)long long buf = 0;
    v71 = "SHA-512 is supported.";
    goto LABEL_76;
  }
  if (v53)
  {
    [v145 setObject:kSecCMSHashingAlgorithmSHA256 forKeyedSubscript:kSecCMSSignHashAlgorithm];
    v70 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_77;
    }
    *(_WORD *)long long buf = 0;
    v71 = "SHA-512 not supported. Falling back to SHA-256 hash.";
    goto LABEL_76;
  }
  if (!v151)
  {
    v128 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_ERROR, "Insufficient required capability from Certificate Authority. SHA-512, SHA-256, and SHA-1 not supported.", buf, 2u);
    }
    uint64_t v129 = MCSCEPErrorDomain;
    uint64_t v111 = MCErrorArray();
    uint64_t v112 = MCErrorTypeFatal;
    uint64_t v113 = v129;
    uint64_t v114 = 22006;
    goto LABEL_123;
  }
  [v145 setObject:kSecCMSHashingAlgorithmSHA1 forKeyedSubscript:kSecCMSSignHashAlgorithm];
  v70 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    v71 = "SHA-512 & SHA-256 not supported. Falling back to SHA-1 hash.";
LABEL_76:
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, v71, buf, 2u);
  }
LABEL_77:
  uint64_t v77 = SecSCEPCreateTemporaryIdentity();
  if (!v77)
  {
    uint64_t v110 = MCSCEPErrorDomain;
    uint64_t v111 = MCErrorArray();
    uint64_t v112 = MCErrorTypeFatal;
    uint64_t v113 = v110;
    uint64_t v114 = 22009;
LABEL_123:
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v113, v114, v111, v112, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v130 = (void *)v111;
    v24 = 0;
    a4 = v154;
    CFDataRef v20 = data;
    v68 = v142;
    goto LABEL_141;
  }
  v24 = (void *)v77;
  v78 = [v9 UUID];
  v79 = +[NSString stringWithFormat:@"%@-tempID", v78];
  v80 = [(MCNewPayloadHandler *)self profileHandler];
  v81 = [v80 profile];
  uint64_t v82 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:", v24, v79, v156, [v81 isInstalledForSystem]);

  v141 = (void *)v82;
  if (!v82)
  {
    uint64_t v115 = MCSCEPErrorDomain;
    uint64_t v116 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v115, 22010, v116, MCErrorTypeFatal, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v117 = (void *)v116;
    v12 = v158;
    CFDataRef v20 = data;
    a4 = v154;
    v68 = v142;
    goto LABEL_140;
  }
  v83 = [v9 UUID];
  [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v82 andUUID:v83];

  [v9 subject];
  uint64_t v84 = SecSCEPGenerateCertificateRequest();
  v140 = (void *)v84;
  if (!v84)
  {
    uint64_t v125 = MCSCEPErrorDomain;
    uint64_t v126 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v125, 22011, v126, MCErrorTypeFatal, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v127 = (void *)v126;
    v12 = v158;
    CFDataRef v20 = data;
    a4 = v154;
    v68 = v142;
    goto LABEL_139;
  }
  v85 = (void *)v84;
  v86 = (char *)[v9 retries] + 1;
  unsigned int v138 = [v9 retryDelay];
  id v87 = v85;
  id v23 = 0;
  uint64_t v149 = MCErrorTypeFatal;
  uint64_t v143 = MCSCEPErrorDomain;
  char v139 = 1;
  id v150 = v87;
  v12 = v158;
  a4 = v154;
LABEL_81:
  v88 = v86;
  while (1)
  {
    unint64_t v157 = (unint64_t)v88;
    v89 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "Attempting to retrieve issued certificate...", buf, 2u);
    }

    v90 = [v9 URLString];
    id v163 = 0;
    v91 = [(MCNewSCEPPayloadHandler *)self _performPKIOperation:v90 withPayload:v150 usingPost:v148 error:&v163];
    id v23 = v163;

    if (v23)
    {

      unint64_t v157 = 0;
      goto LABEL_100;
    }
    id v166 = 0;
    uint64_t v92 = SecSCEPVerifyReply();
    id v93 = v166;
    v144 = (void *)v92;
    if (v92) {
      break;
    }
    v152 = v91;
    if (v166)
    {
      v94 = [v166 domain];
      id v95 = [v93 code];
      v96 = [v93 localizedDescription];
      v97 = MCErrorArrayFromLocalizedDescription();
      id v23 = +[NSError MCErrorWithDomain:v94 code:v95 descriptionArray:v97 errorType:v149];

      os_log_t v98 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v99 = v98;
        v100 = [v23 MCVerboseDescription];
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v100;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "Certificate retrieval reported error: %{public}@", buf, 0xCu);
      }
      v101 = [v93 domain];
      if ([v101 isEqualToString:@"PENDING"])
      {
        v102 = [v93 userInfo];

        a4 = v154;
        if (v102)
        {
          [v9 subject];
          [v93 userInfo];
          v103 = v150;
          id v150 = (id)SecSCEPGetCertInitial();
          goto LABEL_95;
        }
      }
      else
      {

        a4 = v154;
      }
    }
    else
    {
      id v23 = 0;
    }
    v103 = MCErrorArray();
    uint64_t v104 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v143, 22013, v103, v149, 0);

    unint64_t v157 = 0;
    id v23 = (id)v104;
LABEL_95:

    if (v23)
    {
      v12 = v158;
LABEL_100:
      os_log_t v105 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v106 = v105;
        v107 = [v23 MCVerboseDescription];
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v107;
        _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Could not retrieve issued certificate: %{public}@", buf, 0xCu);
      }
      unint64_t v108 = v157;
      if ((v157 == 0) | v139 & 1)
      {
        v139 &= v157 == 0;
      }
      else
      {
        v109 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "Sleeping before polling SCEP server again.", buf, 2u);
        }
        sleep(v138);
        char v139 = 0;
        unint64_t v108 = v157;
      }
      v86 = (char *)(v108 - 1);
      if (v108 < 2)
      {
        v144 = 0;
        goto LABEL_138;
      }
      goto LABEL_81;
    }
    v12 = v158;
    v88 = (char *)(v157 - 1);
    if (v157 <= 1) {
      goto LABEL_127;
    }
  }
  v131 = v91;
  v132 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "Issued certificate received.", buf, 2u);
  }

  v12 = v158;
LABEL_127:
  if ([v144 count])
  {
    [v144 objectAtIndex:0];
    v133 = (__SecIdentity *)SecIdentityCreate();
    self->_identity = v133;
    if (v133)
    {
      id v23 = 0;
      goto LABEL_138;
    }
    v134 = MCErrorArray();
    uint64_t v135 = v143;
    uint64_t v136 = 22008;
  }
  else
  {
    v134 = MCErrorArray();
    uint64_t v135 = v143;
    uint64_t v136 = 22007;
  }
  +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v135, v136, v134, v149, 0);
  id v23 = (id)objc_claimAutoreleasedReturnValue();

LABEL_138:
  CFDataRef v20 = data;
  v68 = v142;
  v127 = v144;
LABEL_139:

  v117 = v140;
LABEL_140:

  v130 = v141;
LABEL_141:

LABEL_142:
  id v25 = v153;
LABEL_11:

  if (v25) {
    CFRelease(v25);
  }
  v26 = v162;
LABEL_17:
  if (v170)
  {
    CFRelease(v170);
    CFTypeRef v170 = 0;
  }
  if (v169)
  {
    CFRelease(v169);
    CFTypeRef v169 = 0;
  }
  if (v24) {
    CFRelease(v24);
  }
  if (v6) {
    [v6 didUpdateStatus:0];
  }
  if (v23)
  {
    if (a4) {
      *a4 = v23;
    }
    os_log_t v31 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v32 = v31;
      id v33 = [v23 MCVerboseDescription];
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Cannot retrieve SCEP identity: %{public}@", buf, 0xCu);
    }
LABEL_32:
    id v8 = 0;
  }
  else
  {
    v34 = self->_identity;
    if (!v34) {
      goto LABEL_32;
    }
    CFRetain(v34);
    id v8 = self->_identity;
  }

LABEL_34:
  return v8;
}

@end