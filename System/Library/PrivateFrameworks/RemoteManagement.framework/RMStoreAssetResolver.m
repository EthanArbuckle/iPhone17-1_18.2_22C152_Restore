@interface RMStoreAssetResolver
+ (BOOL)removedAsset:(id)a3 personaID:(id)a4 error:(id *)a5;
+ (id)newStoreAssetResolver:(id)a3;
+ (void)resolveAsset:(id)a3 unresolvedAsset:(id)a4 personaID:(id)a5 isDDM:(BOOL)a6 enrollmentType:(int64_t)a7 completionHandler:(id)a8;
+ (void)unassignAssets:(id)a3 personaID:(id)a4 completionHandler:(id)a5;
- (BOOL)_storeAssetData:(id)a3 asset:(id)a4 assetKey:(id)a5 enrollmentType:(int64_t)a6 error:(id *)a7;
- (BOOL)_validateAsset:(id)a3 reference:(id)a4 url:(id)a5 statusCode:(id)a6 headers:(id)a7 data:(id)a8 downloadURL:(id)a9 error:(id *)a10;
- (BOOL)isContentTypeMismatchedWithExpectedType:(id)a3 headers:(id)a4 statusCode:(int64_t)a5;
- (BOOL)isHashMismatchedWithExpectedHash:(id)a3 data:(id)a4 downloadURL:(id)a5 dataSize:(unint64_t)a6;
- (BOOL)isPayloadSizeMismatchedWithExpectedSize:(unint64_t)a3 actualSize:(unint64_t)a4 statusCode:(int64_t)a5;
- (RMManagedKeychainController)keychainController;
- (RMStoreAssetResolver)initWithManagedKeychainController:(id)a3;
- (__CFString)_getKeychainAccessibilityFromAsset:(id)a3 unresolvedAsset:(id)a4;
- (id)_dataURLForAsset:(id)a3 reference:(id)a4 queryParameters:(id)a5;
- (id)_getAssetAuthenticationFromAsset:(id)a3;
- (id)_getAssetReferenceFromAsset:(id)a3;
- (id)_getContentType:(id)a3;
- (id)_keychainItemForAsset:(id)a3 unresolvedAsset:(id)a4 assetKey:(id)a5 configurationKey:(id)a6 returnUserName:(id *)a7 error:(id *)a8;
- (id)getSHA256StringFromData:(id)a3;
- (id)getSHA256StringFromURL:(id)a3;
- (void)_assignKeychainItemForAsset:(id)a3 unresolvedAsset:(id)a4 assetKey:(id)a5 configurationKey:(id)a6 completionHandler:(id)a7;
- (void)_processResponseWithAsset:(id)a3 reference:(id)a4 unresolvedAsset:(id)a5 url:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9;
- (void)_resolveAsset:(id)a3 unresolvedAsset:(id)a4 isDDM:(BOOL)a5 completionHandler:(id)a6;
- (void)_resolveAsset:(id)a3 unresolvedAsset:(id)a4 reference:(id)a5 url:(id)a6 useDDM:(BOOL)a7 completionHandler:(id)a8;
- (void)_resolveKeychainAsset:(id)a3 unresolvedAsset:(id)a4 isDDM:(BOOL)a5 enrollmentType:(int64_t)a6 completionHandler:(id)a7;
- (void)setKeychainController:(id)a3;
@end

@implementation RMStoreAssetResolver

+ (void)resolveAsset:(id)a3 unresolvedAsset:(id)a4 personaID:(id)a5 isDDM:(BOOL)a6 enrollmentType:(int64_t)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  id v13 = a4;
  id v14 = a8;
  id v15 = a5;
  id v16 = a3;
  id v17 = +[RMManagedKeychainController newManagedKeychainControllerForScope:personaID:](RMManagedKeychainController, "newManagedKeychainControllerForScope:personaID:", +[RMStoreHelper storeScope], v15);

  id v18 = +[RMStoreAssetResolver newStoreAssetResolver:v17];
  [v17 lockBeforeModifyingKeychain];
  objc_opt_class();
  LOBYTE(v15) = objc_opt_isKindOfClass();
  v19 = +[RMLog storeAssetResolver];
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v20) {
      sub_10006E320();
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10006B134;
    v26[3] = &unk_1000C6A28;
    v21 = &v27;
    id v27 = v17;
    id v28 = v14;
    id v22 = v14;
    [v18 _resolveKeychainAsset:v16 unresolvedAsset:v13 isDDM:v10 enrollmentType:a7 completionHandler:v26];

    id v16 = v28;
  }
  else
  {
    if (v20) {
      sub_10006E354();
    }

    [v17 unlockAfterModifyingKeychain];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10006B1B4;
    v24[3] = &unk_1000C6A50;
    v21 = &v25;
    id v25 = v14;
    id v23 = v14;
    [v18 _resolveAsset:v16 unresolvedAsset:v13 isDDM:v10 completionHandler:v24];
  }
}

+ (void)unassignAssets:(id)a3 personaID:(id)a4 completionHandler:(id)a5
{
  v7 = (void (**)(id, void))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[RMManagedKeychainController newManagedKeychainControllerForScope:personaID:](RMManagedKeychainController, "newManagedKeychainControllerForScope:personaID:", +[RMStoreHelper storeScope], v8);

  [v10 lockBeforeModifyingKeychain];
  v11 = [v9 key];

  id v14 = 0;
  LODWORD(v9) = [v10 unassignAllAssetsFromConfigurationKey:v11 error:&v14];
  id v12 = v14;

  [v10 unlockAfterModifyingKeychain];
  if (v9) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  ((void (**)(id, id))v7)[2](v7, v13);
}

+ (BOOL)removedAsset:(id)a3 personaID:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[RMManagedKeychainController newManagedKeychainControllerForScope:personaID:](RMManagedKeychainController, "newManagedKeychainControllerForScope:personaID:", +[RMStoreHelper storeScope], v7);

  [v9 lockBeforeModifyingKeychain];
  id v10 = [v8 key];

  LOBYTE(a5) = [v9 removedKeychainItemsForAssetKey:v10 error:a5];
  [v9 unlockAfterModifyingKeychain];

  return (char)a5;
}

+ (id)newStoreAssetResolver:(id)a3
{
  id v3 = a3;
  v4 = [[RMStoreAssetResolver alloc] initWithManagedKeychainController:v3];

  return v4;
}

- (RMStoreAssetResolver)initWithManagedKeychainController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMStoreAssetResolver;
  v6 = [(RMStoreAssetResolver *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keychainController, a3);
  }

  return v7;
}

- (void)_resolveAsset:(id)a3 unresolvedAsset:(id)a4 isDDM:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = [(RMStoreAssetResolver *)self _getAssetReferenceFromAsset:v10];
  if (v13)
  {
    id v14 = [v11 queryParameters];
    id v15 = [(RMStoreAssetResolver *)self _dataURLForAsset:v10 reference:v13 queryParameters:v14];

    if (+[RMStoreUtility isValidURL:v15])
    {
      id v16 = [(RMStoreAssetResolver *)self _getAssetAuthenticationFromAsset:v10];
      id v17 = v16;
      id v18 = (id)v7;
      if (v16)
      {
        v19 = [v16 payloadType];
        id v18 = [v19 isEqualToString:@"MDM"];
      }
      if (!v18 || v7)
      {
        [(RMStoreAssetResolver *)self _resolveAsset:v10 unresolvedAsset:v11 reference:v13 url:v15 useDDM:v18 completionHandler:v12];
      }
      else
      {
        BOOL v20 = +[RMErrorUtilities createAssetInvalidError:@"Cannot use MDM as source of asset data"];
        v21 = +[RMLog storeAssetResolver];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10006E3F0();
        }

        v12[2](v12, 0, v20);
      }
    }
    else
    {
      id v17 = +[RMErrorUtilities createAssetInvalidURLError:v15];
      id v23 = +[RMLog storeAssetResolver];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10006E430();
      }

      v12[2](v12, 0, v17);
    }
  }
  else
  {
    id v15 = +[RMErrorUtilities createAssetInvalidError:@"Asset has no Reference"];
    id v22 = +[RMLog storeAssetResolver];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10006E388();
    }

    v12[2](v12, 0, v15);
  }
}

- (void)_resolveAsset:(id)a3 unresolvedAsset:(id)a4 reference:(id)a5 url:(id)a6 useDDM:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v44 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (![v14 resolveAs])
  {
    id v18 = objc_opt_new();
    id v23 = [v15 payloadContentType];
    if (v23)
    {
      CFStringRef v61 = @"Accept";
      [v15 payloadContentType];
      id v24 = v14;
      id v25 = v18;
      id v26 = v15;
      id v27 = v17;
      id v28 = self;
      id v29 = v16;
      v31 = BOOL v30 = v9;
      v62 = v31;
      uint64_t v32 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];

      BOOL v9 = v30;
      v19 = (void *)v32;
      id v16 = v29;
      self = v28;
      id v17 = v27;
      id v15 = v26;
      id v18 = v25;
      id v14 = v24;
    }
    else
    {
      v19 = &__NSDictionary0__struct;
    }

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10006BBB8;
    v53[3] = &unk_1000C6A78;
    v53[4] = self;
    id v54 = v44;
    id v55 = v15;
    id v56 = v14;
    id v57 = v16;
    id v58 = v17;
    [v18 fetchResponseDataAtURL:v57 useDDM:v9 additionalHeaders:v19 completionHandler:v53];

    goto LABEL_15;
  }
  if ([v14 resolveAs] == (id)1)
  {
    v42 = self;
    BOOL v43 = v9;
    id v18 = [v14 downloadURL];
    v19 = [v14 extensionToken];
    if (!v19)
    {
      uint64_t v41 = -1;
LABEL_17:
      v34 = objc_opt_new();
      v35 = [v15 payloadContentType];
      if (v35)
      {
        CFStringRef v59 = @"Accept";
        [v15 payloadContentType];
        v37 = v36 = v34;
        v60 = v37;
        v38 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];

        v34 = v36;
      }
      else
      {
        v38 = &__NSDictionary0__struct;
      }

      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10006BBF4;
      v45[3] = &unk_1000C6AC8;
      v45[4] = v42;
      id v46 = v44;
      id v47 = v15;
      id v48 = v14;
      uint64_t v52 = v41;
      id v49 = v16;
      id v50 = v18;
      id v51 = v17;
      id v39 = v18;
      [v34 downloadResponseDataAtURL:v49 downloadURL:v39 extensionToken:0 useDDM:v43 additionalHeaders:v38 completionHandler:v45];

      id v18 = v19;
      goto LABEL_21;
    }
    id v20 = +[RMSandbox consumeToken:v19];
    v21 = +[RMLog storeAssetResolver];
    id v22 = v21;
    if (v20 != (id)-1)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_10006E538();
      }
      uint64_t v41 = (uint64_t)v20;

      goto LABEL_17;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10006E498((uint64_t)v18, v22);
    }

    v40 = +[RMErrorUtilities createInternalError];
    (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v40);

LABEL_15:
    goto LABEL_21;
  }
  v33 = +[RMLog storeAssetResolver];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_10006E5A4(v14, v33);
  }

  id v18 = +[RMErrorUtilities createInternalError];
  (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v18);
LABEL_21:
}

- (void)_resolveKeychainAsset:(id)a3 unresolvedAsset:(id)a4 isDDM:(BOOL)a5 enrollmentType:(int64_t)a6 completionHandler:(id)a7
{
  BOOL v21 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = [v12 assetKey];
  id v15 = [v12 configurationKey];
  id v16 = [(RMStoreAssetResolver *)self keychainController];
  id v17 = [v14 key];
  unsigned __int8 v18 = [v16 hasDataForAssetKey:v17];

  v19 = +[RMLog storeAssetResolver];
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18)
  {
    if (v20) {
      sub_10006E698();
    }

    [(RMStoreAssetResolver *)self _assignKeychainItemForAsset:v11 unresolvedAsset:v12 assetKey:v14 configurationKey:v15 completionHandler:v13];
  }
  else
  {
    if (v20) {
      sub_10006E6CC();
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10006BF8C;
    v22[3] = &unk_1000C6AF0;
    id v27 = v13;
    v22[4] = self;
    id v23 = v11;
    id v24 = v14;
    int64_t v28 = a6;
    id v25 = v12;
    id v26 = v15;
    [(RMStoreAssetResolver *)self _resolveAsset:v23 unresolvedAsset:v25 isDDM:v21 completionHandler:v22];
  }
}

- (BOOL)_storeAssetData:(id)a3 asset:(id)a4 assetKey:(id)a5 enrollmentType:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [v13 declarationType];
  id v16 = +[RMModelAssetCredentialUserNameAndPasswordDeclaration registeredIdentifier];
  unsigned int v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    v126[0] = 0;
    unsigned __int8 v18 = +[RMModelUserNameAndPasswordCredentialDeclaration loadData:v12 serializationType:1 error:v126];
    id v19 = v126[0];
    if (v19)
    {
      BOOL v20 = +[RMLog storeAssetResolver];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10006E768();
      }

      if (a7)
      {
        CFStringRef v21 = @"Could not deserialize password credential";
        goto LABEL_7;
      }
      goto LABEL_29;
    }
    id v23 = [(RMStoreAssetResolver *)self keychainController];
    v37 = [v18 payloadPassword];
    [v18 payloadUserName];
    v38 = a7;
    id v39 = v12;
    uint64_t v41 = v40 = v14;
    v42 = [v40 key];
    unsigned __int8 v24 = [v23 storePassword:v37 userName:v41 assetKey:v42 error:v38];

    id v14 = v40;
    id v12 = v39;

    goto LABEL_46;
  }
  id v25 = [v13 declarationType];
  id v26 = +[RMModelAssetCredentialCertificateDeclaration registeredIdentifier];
  unsigned int v27 = [v25 isEqualToString:v26];

  if (!v27)
  {
    v33 = [v13 declarationType];
    v34 = +[RMModelAssetCredentialIdentityDeclaration registeredIdentifier];
    unsigned int v35 = [v33 isEqualToString:v34];

    if (v35)
    {
      id v125 = 0;
      unsigned __int8 v18 = +[RMModelIdentityCredentialDeclaration loadData:v12 serializationType:1 error:&v125];
      id v19 = v125;
      if (v19)
      {
        v36 = +[RMLog storeAssetResolver];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_10006E85C();
        }

        if (a7)
        {
          CFStringRef v21 = @"Could not deserialize identity credential";
LABEL_7:
          id v22 = +[RMErrorUtilities createAssetInvalidError:v21];
          id v23 = v22;
          if (v22)
          {
            id v23 = v22;
            unsigned __int8 v24 = 0;
            *a7 = v23;
          }
          else
          {
            unsigned __int8 v24 = 0;
          }
          goto LABEL_46;
        }
LABEL_29:
        unsigned __int8 v24 = 0;
LABEL_47:

        goto LABEL_48;
      }
      id v23 = [(RMStoreAssetResolver *)self keychainController];
      v60 = [v18 payloadIdentity];
      CFStringRef v61 = [v18 payloadPassword];
      uint64_t v62 = [v14 key];
      v63 = a7;
      id v64 = v12;
      id v65 = v14;
      v66 = (void *)v62;
      unsigned __int8 v24 = [v23 storePKCS12Data:v60 password:v61 assetKey:v62 error:v63];

      id v14 = v65;
      id v12 = v64;

LABEL_46:
      goto LABEL_47;
    }
    v45 = [v13 declarationType];
    id v46 = +[RMModelAssetCredentialSCEPDeclaration registeredIdentifier];
    unsigned int v47 = [v45 isEqualToString:v46];

    if (v47)
    {
      id v124 = 0;
      unsigned __int8 v18 = +[RMModelSCEPCredentialDeclaration loadData:v12 serializationType:1 error:&v124];
      id v19 = v124;
      if (v19)
      {
        id v48 = +[RMLog storeAssetResolver];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_10006E8C4();
        }

        if (!a7) {
          goto LABEL_29;
        }
        id v49 = +[RMErrorUtilities createAssetInvalidError:@"Could not deserialize SCEP credential"];
        id v50 = v49;
        if (v49)
        {
          id v50 = v49;
          unsigned __int8 v24 = 0;
          *a7 = v50;
        }
        else
        {
          unsigned __int8 v24 = 0;
        }
      }
      else
      {
        v70 = +[NSMutableDictionary dictionaryWithCapacity:4];
        v71 = [v18 payloadSubjectAltName];
        v72 = [v71 payloadDNSName];
        [v70 setObject:v72 forKeyedSubscript:@"dNSName"];

        v73 = [v18 payloadSubjectAltName];
        v74 = [v73 payloadNtPrincipalName];
        [v70 setObject:v74 forKeyedSubscript:@"ntPrincipalName"];

        v75 = [v18 payloadSubjectAltName];
        v76 = [v75 payloadRfc822Name];
        [v70 setObject:v76 forKeyedSubscript:@"rfc822Name"];

        v77 = [v18 payloadSubjectAltName];
        v78 = [v77 payloadUniformResourceIdentifier];
        [v70 setObject:v78 forKeyedSubscript:@"uniformResourceIdentifier"];

        v119 = [(RMStoreAssetResolver *)self keychainController];
        v117 = [v18 payloadURL];
        v116 = [v18 payloadName];
        v114 = [v18 payloadCAFingerprint];
        v110 = [v18 payloadChallenge];
        v106 = [v18 payloadSubject];
        v112 = [v18 payloadKeysize];
        id v102 = [v112 unsignedIntegerValue];
        v108 = [v18 payloadKeyUsage];
        id v100 = [v108 unsignedIntegerValue];
        v104 = [v18 payloadRetries];
        id v79 = [v104 unsignedIntegerValue];
        [v18 payloadRetryDelay];
        v80 = v121 = v14;
        unsigned int v81 = [v80 unsignedIntValue];
        v82 = [v121 key];
        LODWORD(v97) = v81;
        id v96 = v79;
        id v50 = v70;
        unsigned __int8 v24 = [v119 storeSCEPIdentityURL:v117 caInstanceName:v116 caFingerprint:v114 caCapabilities:0 challenge:v110 subject:v106 keySize:v102 usageFlags:v100 subjectAltName:v70 retries:v96 retryDelay:v97 assetKey:v82 error:a7];

        id v14 = v121;
      }

      goto LABEL_47;
    }
    id v54 = [v13 declarationType];
    id v55 = +[RMModelAssetCredentialACMEDeclaration registeredIdentifier];
    unsigned int v56 = [v54 isEqualToString:v55];

    if (!v56)
    {
      v68 = +[RMLog storeAssetResolver];
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
        sub_10006E994(v13, v68);
      }

      if (!a7)
      {
        unsigned __int8 v24 = 0;
        goto LABEL_49;
      }
      v69 = +[RMErrorUtilities createAssetInvalidError:@"Keychain asset type not recognized during store"];
      id v19 = v69;
      if (v69)
      {
        id v19 = v69;
        unsigned __int8 v24 = 0;
        *a7 = v19;
        goto LABEL_48;
      }
      goto LABEL_37;
    }
    id v123 = 0;
    id v57 = +[RMModelACMECredentialDeclaration loadData:v12 serializationType:1 error:&v123];
    id v19 = v123;
    if (v19)
    {
      id v58 = +[RMLog storeAssetResolver];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        sub_10006E92C();
      }

      if (!a7)
      {
        unsigned __int8 v24 = 0;
LABEL_63:

        goto LABEL_48;
      }
      id v59 = +[RMErrorUtilities createAssetInvalidError:@"Could not deserialize ACME credential"];
      if (v59)
      {
        id v59 = v59;
        unsigned __int8 v24 = 0;
        *a7 = v59;
      }
      else
      {
        unsigned __int8 v24 = 0;
      }
    }
    else
    {
      v83 = +[NSMutableDictionary dictionaryWithCapacity:4];
      v84 = [v57 payloadSubjectAltName];
      [v84 payloadDNSName];
      v85 = v122 = v14;
      [v83 setObject:v85 forKeyedSubscript:@"dNSName"];

      v86 = [v57 payloadSubjectAltName];
      v87 = [v86 payloadNtPrincipalName];
      [v83 setObject:v87 forKeyedSubscript:@"ntPrincipalName"];

      v88 = [v57 payloadSubjectAltName];
      v89 = [v88 payloadRfc822Name];
      [v83 setObject:v89 forKeyedSubscript:@"rfc822Name"];

      v90 = [v57 payloadSubjectAltName];
      v91 = [v90 payloadUniformResourceIdentifier];
      [v83 setObject:v91 forKeyedSubscript:@"uniformResourceIdentifier"];

      v120 = [(RMStoreAssetResolver *)self keychainController];
      v118 = [v57 payloadDirectoryURL];
      v111 = [v57 payloadClientIdentifier];
      v115 = [v57 payloadKeySize];
      id v109 = [v115 unsignedLongValue];
      v107 = [v57 payloadKeyType];
      v113 = [v57 payloadHardwareBound];
      unsigned int v103 = [v113 BOOLValue];
      v101 = [v57 payloadSubject];
      v105 = [v57 payloadUsageFlags];
      id v99 = [v105 unsignedLongValue];
      v98 = [v57 payloadExtendedKeyUsage];
      v92 = [v57 payloadAttest];
      unsigned __int8 v93 = [v92 BOOLValue];
      LOBYTE(v90) = a6 == 0;
      v94 = [v122 key];
      BYTE1(v95) = (_BYTE)v90;
      LOBYTE(v95) = v93;
      unsigned __int8 v24 = objc_msgSend(v120, "storeACMEDirectoryURL:clientIdentifier:keySize:keyType:hardwareBound:subject:subjectAltName:usageFlags:extendedKeyUsage:attest:isUserEnrollment:assetKey:error:", v118, v111, v109, v107, v103, v101, v83, v99, v98, v95, v94, a7);

      id v14 = v122;
      id v59 = v83;
    }

    goto LABEL_63;
  }
  id v19 = [(RMStoreAssetResolver *)self _getAssetReferenceFromAsset:v13];
  int64_t v28 = [v19 payloadContentType];
  unsigned int v29 = [v28 isEqualToString:@"application/pem"];

  if (!v29)
  {
    BOOL v43 = [v19 payloadContentType];
    unsigned int v44 = [v43 isEqualToString:@"application/pkcs1"];

    if (v44)
    {
      BOOL v30 = [(RMStoreAssetResolver *)self keychainController];
      v31 = [v14 key];
      unsigned __int8 v32 = [v30 storePKCS1Data:v12 assetKey:v31 error:a7];
      goto LABEL_21;
    }
    id v51 = +[RMLog storeAssetResolver];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_10006E7D0(v19, v51);
    }

    if (a7)
    {
      uint64_t v52 = +[RMErrorUtilities createAssetInvalidError:@"Keychain asset content type not recognized"];
      v53 = v52;
      if (v52) {
        *a7 = v52;
      }
    }
LABEL_37:
    unsigned __int8 v24 = 0;
    goto LABEL_48;
  }
  BOOL v30 = [(RMStoreAssetResolver *)self keychainController];
  v31 = [v14 key];
  unsigned __int8 v32 = [v30 storePEMData:v12 assetKey:v31 error:a7];
LABEL_21:
  unsigned __int8 v24 = v32;

LABEL_48:
LABEL_49:

  return v24;
}

- (void)_assignKeychainItemForAsset:(id)a3 unresolvedAsset:(id)a4 assetKey:(id)a5 configurationKey:(id)a6 completionHandler:(id)a7
{
  id v18 = 0;
  id v19 = 0;
  id v12 = (void (**)(id, id, void))a7;
  id v13 = [(RMStoreAssetResolver *)self _keychainItemForAsset:a3 unresolvedAsset:a4 assetKey:a5 configurationKey:a6 returnUserName:&v19 error:&v18];
  id v14 = v19;
  id v15 = v18;
  if (v13)
  {
    id v16 = [objc_alloc((Class)RMStoreResolvedAsset) initWithKeychainReference:v13 userName:v14];
    v12[2](v12, v16, 0);

    id v12 = (void (**)(id, id, void))v16;
  }
  else
  {
    unsigned int v17 = +[RMLog storeAssetResolver];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10006EA20();
    }

    ((void (**)(id, id, id))v12)[2](v12, 0, v15);
  }
}

- (id)_keychainItemForAsset:(id)a3 unresolvedAsset:(id)a4 assetKey:(id)a5 configurationKey:(id)a6 returnUserName:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = [v14 declarationType];
  id v19 = +[RMModelAssetCredentialUserNameAndPasswordDeclaration registeredIdentifier];
  unsigned int v20 = [v18 isEqualToString:v19];

  if (v20)
  {
    CFStringRef v21 = [(RMStoreAssetResolver *)self keychainController];
    id v22 = [v16 key];
    id v23 = [v17 key];
    unsigned __int8 v24 = [(RMStoreAssetResolver *)self _getKeychainAccessibilityFromAsset:v14 unresolvedAsset:v15];
    uint64_t v25 = [v15 keychainGroup];
    id v26 = a7;
    id v27 = v14;
    id v28 = v15;
    id v29 = v17;
    id v30 = v16;
    v31 = (void *)v25;
    unsigned __int8 v32 = [v21 assignPasswordForAssetKey:v22 toConfigurationKey:v23 access:v24 group:v25 returnUserName:v26 error:a8];

    v33 = v30;
    id v17 = v29;
    id v15 = v28;
    id v14 = v27;

    goto LABEL_11;
  }
  v34 = v16;
  unsigned int v35 = [v14 declarationType];
  v36 = +[RMModelAssetCredentialCertificateDeclaration registeredIdentifier];
  unsigned int v37 = [v35 isEqualToString:v36];

  if (v37)
  {
    v38 = [(RMStoreAssetResolver *)self keychainController];
    id v39 = v34;
    v40 = [v34 key];
    uint64_t v41 = [v17 key];
    v42 = [(RMStoreAssetResolver *)self _getKeychainAccessibilityFromAsset:v14 unresolvedAsset:v15];
    BOOL v43 = [v15 keychainGroup];
    uint64_t v44 = [v38 assignCertificateForAssetKey:v40 toConfigurationKey:v41 access:v42 group:v43 error:a8];
LABEL_10:
    unsigned __int8 v32 = (void *)v44;

    v33 = v39;
    goto LABEL_11;
  }
  v45 = [v14 declarationType];
  id v46 = +[RMModelAssetCredentialIdentityDeclaration registeredIdentifier];
  id v58 = a8;
  if ([v45 isEqualToString:v46]) {
    goto LABEL_8;
  }
  unsigned int v47 = [v14 declarationType];
  id v48 = +[RMModelAssetCredentialSCEPDeclaration registeredIdentifier];
  if ([v47 isEqualToString:v48])
  {

LABEL_8:
LABEL_9:
    v38 = [(RMStoreAssetResolver *)self keychainController];
    id v39 = v34;
    v40 = [v34 key];
    uint64_t v41 = [v17 key];
    id v49 = [(RMStoreAssetResolver *)self _getKeychainAccessibilityFromAsset:v14 unresolvedAsset:v15];
    BOOL v43 = [v15 keychainGroup];
    uint64_t v44 = [v38 assignIdentityForAssetKey:v40 configurationKey:v41 access:v49 group:v43 error:v58];
    goto LABEL_10;
  }
  id v51 = [v14 declarationType];
  +[RMModelAssetCredentialACMEDeclaration registeredIdentifier];
  uint64_t v52 = v56 = v47;
  unsigned __int8 v57 = [v51 isEqualToString:v52];

  if (v57) {
    goto LABEL_9;
  }
  v53 = +[RMLog storeAssetResolver];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
    sub_10006EA88(v14, v53);
  }

  v33 = v34;
  if (v58)
  {
    id v54 = +[RMErrorUtilities createAssetInvalidError:@"Keychain asset type not recognized during assign"];
    id v55 = v54;
    if (v54) {
      *id v58 = v54;
    }
  }
  unsigned __int8 v32 = 0;
LABEL_11:

  return v32;
}

- (id)_getAssetReferenceFromAsset:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 payloadReference];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_getAssetAuthenticationFromAsset:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 payloadAuthentication];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (__CFString)_getKeychainAccessibilityFromAsset:(id)a3 unresolvedAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = RMModelAssetCredentialIdentityDeclaration_Accessible_default;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), id v8 = v7, (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [v5 payloadAccessible];
  }
  if ([v8 isEqualToString:v7])
  {
    BOOL v9 = [v6 keychainDefaultAccessibility];
    if (v9)
    {
      id v10 = [v6 keychainDefaultAccessibility];
    }
    else
    {
      id v10 = (__CFString *)kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
    }
  }
  else
  {
    if ([v8 isEqualToString:RMModelAssetCredentialIdentityDeclaration_Accessible_afterFirstUnlock])id v11 = &kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly; {
    else
    }
      id v11 = &kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
    id v10 = (__CFString *)*v11;
  }

  return v10;
}

- (id)_dataURLForAsset:(id)a3 reference:(id)a4 queryParameters:(id)a5
{
  id v6 = a5;
  id v7 = [a4 payloadDataURL];
  id v8 = +[NSURLComponents componentsWithString:v7];

  if ([v6 count])
  {
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006D54C;
    v13[3] = &unk_1000C6020;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v14;
    [v6 enumerateKeysAndObjectsUsingBlock:v13];
    id v10 = [v9 copy];
    [v8 setQueryItems:v10];
  }
  id v11 = [v8 URL];

  return v11;
}

- (void)_processResponseWithAsset:(id)a3 reference:(id)a4 unresolvedAsset:(id)a5 url:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (!v20)
  {
    uint64_t v25 = HTTPResponseKeyBody;
    id v26 = a9;
    uint64_t v27 = [v19 objectForKeyedSubscript:v25];
    unsigned int v47 = v17;
    [v17 downloadURL];
    v29 = id v28 = v18;
    id v30 = [v19 objectForKeyedSubscript:HTTPResponseKeyStatusCode];
    id v45 = v19;
    v31 = [v19 objectForKeyedSubscript:HTTPResponseKeyHeaders];
    id v48 = (void *)v27;
    id v49 = 0;
    uint64_t v44 = v29;
    id v46 = (void *)v29;
    id v18 = v28;
    unsigned int v32 = [(RMStoreAssetResolver *)self _validateAsset:v15 reference:v16 url:v28 statusCode:v30 headers:v31 data:v27 downloadURL:v44 error:&v49];
    id v33 = v49;

    if (!v32)
    {
      id v40 = [v33 code];
      uint64_t v41 = +[RMLog storeAssetResolver];
      BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
      if (v40 == (id)1000)
      {
        unsigned int v37 = v48;
        v38 = v46;
        id v20 = 0;
        if (v42) {
          sub_10006EBA0();
        }
      }
      else
      {
        unsigned int v37 = v48;
        v38 = v46;
        id v20 = 0;
        if (v42) {
          sub_10006EC2C();
        }
      }

      id v23 = v33;
      id v24 = 0;
      goto LABEL_20;
    }
    v34 = +[RMLog storeAssetResolver];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      sub_10006EB14(v47, v34);
    }

    id v35 = objc_alloc((Class)RMStoreResolvedAsset);
    v36 = v35;
    unsigned int v37 = v48;
    v38 = v46;
    id v20 = 0;
    if (v46)
    {
      id v39 = [v35 initWithFile:v46];
    }
    else
    {
      if (!v48)
      {
        BOOL v43 = objc_opt_new();
        id v24 = [v36 initWithData:v43];

        unsigned int v37 = 0;
        goto LABEL_19;
      }
      id v39 = [v35 initWithData:v48];
    }
    id v24 = v39;
LABEL_19:
    id v23 = 0;
LABEL_20:

    id v17 = v47;
    id v19 = v45;
    goto LABEL_21;
  }
  id v21 = a9;
  id v22 = +[RMLog storeAssetResolver];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10006ECB8();
  }

  id v23 = v20;
  id v24 = 0;
LABEL_21:
  (*((void (**)(id, id, id))a9 + 2))(a9, v24, v23);
}

- (BOOL)_validateAsset:(id)a3 reference:(id)a4 url:(id)a5 statusCode:(id)a6 headers:(id)a7 data:(id)a8 downloadURL:(id)a9 error:(id *)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = +[RMLog storeAssetResolver];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_10006EDD0(v16, v21);
  }

  id v51 = v20;
  id v52 = v16;
  if (v19)
  {
    id v22 = [v19 length];
  }
  else
  {
    id v23 = +[NSFileManager defaultManager];
    id v24 = [v20 path];
    id v53 = 0;
    uint64_t v25 = [v23 attributesOfItemAtPath:v24 error:&v53];
    id v26 = v53;

    if (!v25)
    {
      id v46 = +[RMLog storeAssetResolver];
      v34 = v51;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_10006ED44();
      }

      id v33 = v52;
      if (a10)
      {
        unsigned int v47 = +[RMErrorUtilities createAssetSizeCannotBeVerifiedError];
        id v48 = v47;
        if (v47) {
          *a10 = v47;
        }
      }
      goto LABEL_31;
    }
    uint64_t v27 = [v25 objectForKeyedSubscript:NSFileSize];
    id v22 = [v27 unsignedIntegerValue];
  }
  uint64_t v28 = objc_msgSend(v15, "payloadSize", a10);
  if (!v28
    || (uint64_t v29 = (void *)v28,
        [v15 payloadSize],
        id v30 = objc_claimAutoreleasedReturnValue(),
        unsigned int v31 = -[RMStoreAssetResolver isPayloadSizeMismatchedWithExpectedSize:actualSize:statusCode:](self, "isPayloadSizeMismatchedWithExpectedSize:actualSize:statusCode:", [v30 unsignedIntegerValue], v22, objc_msgSend(v17, "integerValue")), v30, v29, !v31))
  {
    uint64_t v35 = [v15 payloadContentType];
    if (v35)
    {
      v36 = (void *)v35;
      unsigned int v37 = [v15 payloadContentType];
      unsigned int v38 = -[RMStoreAssetResolver isContentTypeMismatchedWithExpectedType:headers:statusCode:](self, "isContentTypeMismatchedWithExpectedType:headers:statusCode:", v37, v18, [v17 integerValue]);

      if (v38)
      {
        id v33 = v52;
        if (!v50)
        {
          BOOL v45 = 0;
          v34 = v51;
          goto LABEL_38;
        }
        id v39 = +[RMErrorUtilities createAssetContentTypeCannotBeVerifiedError];
        id v26 = v39;
        if (v39)
        {
          id v26 = v39;
          *id v50 = v26;
        }
        v34 = v51;
        goto LABEL_31;
      }
    }
    uint64_t v40 = [v15 payloadHashSHA256];
    if (v40)
    {
      uint64_t v41 = (void *)v40;
      BOOL v42 = [v15 payloadHashSHA256];
      v34 = v51;
      unsigned int v43 = [(RMStoreAssetResolver *)self isHashMismatchedWithExpectedHash:v42 data:v19 downloadURL:v51 dataSize:v22];

      if (v43)
      {
        if (v50)
        {
          uint64_t v44 = +[RMErrorUtilities createAssetHashCannotBeVerifiedError];
          id v26 = v44;
          if (v44)
          {
            id v26 = v44;
            *id v50 = v26;
          }
          id v33 = v52;
          goto LABEL_31;
        }
        BOOL v45 = 0;
      }
      else
      {
        BOOL v45 = 1;
      }
      id v33 = v52;
      goto LABEL_38;
    }
    BOOL v45 = 1;
LABEL_34:
    v34 = v51;
    id v33 = v52;
    goto LABEL_38;
  }
  if (!v50)
  {
    BOOL v45 = 0;
    goto LABEL_34;
  }
  unsigned int v32 = +[RMErrorUtilities createAssetSizeCannotBeVerifiedError];
  id v26 = v32;
  v34 = v51;
  id v33 = v52;
  if (v32)
  {
    id v26 = v32;
    *id v50 = v26;
  }
LABEL_31:

  BOOL v45 = 0;
LABEL_38:

  return v45;
}

- (BOOL)isPayloadSizeMismatchedWithExpectedSize:(unint64_t)a3 actualSize:(unint64_t)a4 statusCode:(int64_t)a5
{
  if (!a3 && a5 && a5 != 204)
  {
    id v9 = +[RMLog storeAssetResolver];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10006EED0();
    }
  }
  if (a4 != a3)
  {
    id v7 = +[RMLog storeAssetResolver];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006EE5C();
    }
  }
  return a4 != a3;
}

- (BOOL)isContentTypeMismatchedWithExpectedType:(id)a3 headers:(id)a4 statusCode:(int64_t)a5
{
  if (!a5) {
    return 0;
  }
  id v7 = a3;
  uint64_t v8 = [a4 objectForKeyedSubscript:@"Content-Type"];
  id v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = @"text/html";
  }
  id v11 = [(RMStoreAssetResolver *)self _getContentType:v10];

  unsigned __int8 v12 = [v11 isEqualToString:v7];
  if ((v12 & 1) == 0)
  {
    id v13 = +[RMLog storeAssetResolver];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10006EF3C();
    }
  }
  char v14 = v12 ^ 1;

  return v14;
}

- (BOOL)isHashMismatchedWithExpectedHash:(id)a3 data:(id)a4 downloadURL:(id)a5 dataSize:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6)
  {
    if (v11) {
      [(RMStoreAssetResolver *)self getSHA256StringFromData:v11];
    }
    else {
    char v14 = [(RMStoreAssetResolver *)self getSHA256StringFromURL:v12];
    }
    id v15 = [v10 caseInsensitiveCompare:v14];
    BOOL v13 = v15 != 0;
    if (v15)
    {
      id v16 = +[RMLog storeAssetResolver];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10006EFA4();
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_getContentType:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rangeOfString:@";"];
  if (v5)
  {
    id v6 = [v3 substringToIndex:v4];
  }
  else
  {
    id v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (id)getSHA256StringFromData:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 length];
  uint64_t v5 = v4;
  if ((unint64_t)v4 >= 0x10000) {
    size_t v6 = 0x10000;
  }
  else {
    size_t v6 = (size_t)v4;
  }
  id v7 = malloc_type_malloc(v6, 0x9262BCBBuLL);
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  if (v5)
  {
    for (unint64_t i = 0; i < (unint64_t)v5; i += v9)
    {
      if (v6 >= (unint64_t)&v5[-i]) {
        size_t v9 = (size_t)&v5[-i];
      }
      else {
        size_t v9 = v6;
      }
      objc_msgSend(v3, "getBytes:range:", v7, i, v9);
      CC_SHA256_Update(&c, v7, v9);
    }
  }
  CC_SHA256_Final(md, &c);
  free(v7);
  id v10 = +[NSMutableString stringWithCapacity:64];
  for (uint64_t j = 0; j != 32; ++j)
    objc_msgSend(v10, "appendFormat:", @"%02X", md[j]);
  id v12 = [v10 copy];

  return v12;
}

- (id)getSHA256StringFromURL:(id)a3
{
  id v3 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  id v12 = 0;
  id v4 = +[NSFileHandle fileHandleForReadingFromURL:v3 error:&v12];
  id v5 = v12;
  if (v4)
  {
    while (1)
    {
      size_t v6 = [v4 readDataOfLength:0x10000];
      if (![v6 length]) {
        break;
      }
      id v7 = v6;
      CC_SHA256_Update(&c, [v7 bytes], (CC_LONG)objc_msgSend(v7, "length"));
    }
    CC_SHA256_Final(md, &c);
    uint64_t v8 = +[NSMutableString stringWithCapacity:64];
    for (uint64_t i = 0; i != 32; ++i)
      [v8 appendFormat:@"%02X", md[i]];
    id v10 = [v8 copy];
  }
  else
  {
    uint64_t v8 = +[RMLog storeAssetResolver];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10006F018((uint64_t)v3, (uint64_t)v5, v8);
    }
    id v10 = &stru_1000C74D0;
  }

  return v10;
}

- (RMManagedKeychainController)keychainController
{
  return self->_keychainController;
}

- (void)setKeychainController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end