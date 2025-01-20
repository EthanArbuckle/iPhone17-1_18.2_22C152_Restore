@interface CRPreflight
- (BOOL)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5;
- (id)_extractCertsFromResponse:(id)a3;
- (id)_getVersionInfo:(id)a3;
- (id)_httpSendRequest:(id)a3 proxySettings:(id)a4 withError:(id *)a5;
- (id)requestBAACertificates:(id)a3 apticket:(id)a4 proxySettings:(id)a5 withError:(id *)a6;
- (id)sha256Data:(id)a3;
- (id)sign:(id)a3 keyBlob:(id)a4;
- (void)challengeStrongComponents:(id)a3 withReply:(id)a4;
- (void)issueRepairCert:(id)a3 withReply:(id)a4;
- (void)queryRepairDeltaWithReply:(id)a3;
@end

@implementation CRPreflight

- (void)queryRepairDeltaWithReply:(id)a3
{
  v3 = (void (**)(id, uint64_t, void *, void *))a3;
  v4 = objc_opt_new();
  id v49 = 0;
  v5 = +[CRFDRUtils findUnsealedDataWithError:&v49];
  id v6 = v49;
  v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (v8)
  {
    if ([v5 count])
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v25 = v5;
      id v39 = [v25 countByEnumeratingWithState:&v45 objects:v61 count:16];
      if (v39)
      {
        unsigned int v33 = v9;
        v34 = v7;
        v35 = v5;
        v36 = v3;
        uint64_t v37 = *(void *)v46;
        v38 = v25;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v46 != v37) {
              objc_enumerationMutation(v25);
            }
            uint64_t v40 = v10;
            uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * v10);
            v12 = [v25 objectForKeyedSubscript:v11];
            v13 = (void *)AMFDRSealingMapCopyAssemblyIdentifierForClass();
            v14 = handleForCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v56 = "-[CRPreflight queryRepairDeltaWithReply:]";
              __int16 v57 = 2112;
              uint64_t v58 = v11;
              __int16 v59 = 2112;
              v60 = v13;
              _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s: key: %@, asid: %@", buf, 0x20u);
            }

            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            id v15 = v12;
            id v16 = [v15 countByEnumeratingWithState:&v41 objects:v54 count:16];
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v42;
              do
              {
                for (i = 0; i != v17; i = (char *)i + 1)
                {
                  if (*(void *)v42 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  v20 = [*(id *)(*((void *)&v41 + 1) + 8 * i) dataUsingEncoding:4];
                  v21 = [v20 base64EncodedStringWithOptions:0];

                  if (v13)
                  {
                    uint64_t v22 = [v13 stringByReplacingOccurrencesOfString:@"-" withString:@","];
                    v23 = (void *)v22;
                    if (v22)
                    {
                      v52[0] = @"key";
                      v52[1] = @"identifier";
                      v53[0] = v11;
                      v53[1] = v21;
                      v52[2] = @"asid";
                      v53[2] = v22;
                      v24 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3];
                      [v4 addObject:v24];
                    }
                    else
                    {
                      v24 = handleForCategory();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v56 = (const char *)v13;
                        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to change asid format: %@", buf, 0xCu);
                      }
                    }
                  }
                  else
                  {
                    v50[0] = @"key";
                    v50[1] = @"identifier";
                    v51[0] = v11;
                    v51[1] = v21;
                    v23 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
                    [v4 addObject:v23];
                  }
                }
                id v17 = [v15 countByEnumeratingWithState:&v41 objects:v54 count:16];
              }
              while (v17);
            }

            uint64_t v10 = v40 + 1;
            v25 = v38;
          }
          while ((id)(v40 + 1) != v39);
          id v39 = [v38 countByEnumeratingWithState:&v45 objects:v61 count:16];
        }
        while (v39);
        v5 = v35;
        v3 = v36;
        v7 = v34;
        uint64_t v9 = v33;
      }
    }
    else
    {
      v25 = handleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No delta components found", buf, 2u);
      }
    }
  }
  else
  {
    v25 = handleForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10003DC20((uint64_t)v7, v25, v27, v28, v29, v30, v31, v32);
    }
  }

  if (v3) {
    v3[2](v3, v9, v4, v7);
  }
}

- (void)issueRepairCert:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void *, void *, id))a4;
  id v64 = 0;
  BOOL v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v78 = "-[CRPreflight issueRepairCert:withReply:]";
    __int16 v79 = 2112;
    id v80 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s parameters: %@", buf, 0x16u);
  }

  if (!v6)
  {
    v24 = 0;
    v19 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"miniPreflight"];
  if (v9
    && (uint64_t v10 = (void *)v9,
        [v6 objectForKeyedSubscript:@"miniPreflight"],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v11,
        v10,
        (isKindOfClass & 1) != 0))
  {
    v13 = [v6 objectForKeyedSubscript:@"miniPreflight"];
    unsigned __int8 v14 = [v13 BOOLValue];
  }
  else
  {
    unsigned __int8 v14 = 0;
  }
  uint64_t v15 = [v6 objectForKeyedSubscript:@"socksHost"];
  if (v15
    && (id v16 = (void *)v15,
        [v6 objectForKeyedSubscript:@"socksHost"],
        id v17 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v18 = objc_opt_isKindOfClass(),
        v17,
        v16,
        (v18 & 1) != 0))
  {
    v19 = [v6 objectForKeyedSubscript:@"socksHost"];
  }
  else
  {
    v19 = 0;
  }
  uint64_t v20 = [v6 objectForKeyedSubscript:@"socksPort"];
  if (!v20
    || (v21 = (void *)v20,
        [v6 objectForKeyedSubscript:@"socksPort"],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v23 = objc_opt_isKindOfClass(),
        v22,
        v21,
        (v23 & 1) == 0))
  {
    v24 = 0;
    v25 = 0;
    if (v14) {
      goto LABEL_31;
    }
LABEL_19:
    id v26 = +[CRPersonalizationManager getDefaultAMAuthInstallRef];
    if (v26)
    {
      id v32 = v26;
      if (v19 && v24) {
        AMAuthInstallSetSOCKSProxyInformation((uint64_t)v26, v19, v24, v27, v28, v29, v30, v31);
      }
      if (!+[CRPersonalizationManager shouldPersonalizeWithSSOByDefault](CRPersonalizationManager, "shouldPersonalizeWithSSOByDefault")|| !+[CRPersonalizationManager enableSSO:v32])
      {
        v36 = +[CRPersonalizationManager initWithAuthInstallObj:v32];
        id v63 = 0;
        unsigned int v37 = [v36 getRepairTicket:&v64 error:&v63];
        id v38 = v63;

        if (!v37 || v38)
        {
          v61 = (void *)v19;
          uint64_t v49 = CRErrorDomain;
          NSErrorUserInfoKey v71 = NSLocalizedDescriptionKey;
          v50 = +[NSString stringWithFormat:@"Failed to get repair ticket: %@", v38];
          v72 = v50;
          v51 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
          id v35 = +[NSError errorWithDomain:v49 code:-85 userInfo:v51];

          uint64_t v40 = 0;
          long long v41 = 0;
          v25 = 0;
          goto LABEL_45;
        }
        goto LABEL_28;
      }
      v61 = (void *)v19;
      uint64_t v33 = CRErrorDomain;
      NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
      CFStringRef v74 = @"Failed to enable SSO";
      v34 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      id v35 = +[NSError errorWithDomain:v33 code:-85 userInfo:v34];
    }
    else
    {
      v61 = (void *)v19;
      uint64_t v44 = CRErrorDomain;
      NSErrorUserInfoKey v75 = NSLocalizedDescriptionKey;
      long long v45 = +[NSString stringWithFormat:@"Failed to get auth ref"];
      v76 = v45;
      long long v46 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      id v35 = +[NSError errorWithDomain:v44 code:-85 userInfo:v46];
    }
    uint64_t v40 = 0;
    long long v41 = 0;
    v25 = 0;
LABEL_38:
    id v38 = 0;
    goto LABEL_45;
  }
  v24 = [v6 objectForKeyedSubscript:@"socksPort"];
  if ((v14 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_28:
  v25 = 0;
  if (v19 && v24)
  {
    v69[0] = @"socksHost";
    v69[1] = @"socksPort";
    v70[0] = v19;
    v70[1] = v24;
    v25 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
  }
LABEL_31:
  id v39 = objc_alloc_init(CRRIK);
  v61 = (void *)v19;
  if (!v39)
  {
    uint64_t v47 = CRErrorDomain;
    NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
    CFStringRef v68 = @"Create RIK failed";
    long long v48 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    id v35 = +[NSError errorWithDomain:v47 code:-75 userInfo:v48];

    uint64_t v40 = 0;
    long long v41 = 0;
    goto LABEL_38;
  }
  uint64_t v40 = v39;
  id v62 = 0;
  long long v41 = [(CRPreflight *)self requestBAACertificates:v39 apticket:v64 proxySettings:v25 withError:&v62];
  id v42 = v62;
  id v38 = v42;
  if (v41 && !v42)
  {
    id v35 = 0;
    uint64_t v43 = 1;
    goto LABEL_46;
  }
  if (v42)
  {
    v52 = [v42 domain];
    uint64_t v60 = CRErrorDomain;
    unsigned int v53 = [v52 isEqual:];

    if (v53)
    {
      id v35 = v38;
      uint64_t v43 = 0;
      id v38 = v35;
      goto LABEL_46;
    }
  }
  else
  {
    uint64_t v60 = CRErrorDomain;
  }
  NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
  v54 = +[NSString stringWithFormat:@"Failed to request BAA: %@", v38];
  v66 = v54;
  +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
  v55 = v7;
  __int16 v57 = v56 = v24;
  id v35 = +[NSError errorWithDomain:v60 code:-76 userInfo:v57];

  v24 = v56;
  v7 = v55;

LABEL_45:
  uint64_t v43 = 0;
LABEL_46:
  if (v7)
  {
    [(CRRIK *)v40 keyBlob];
    v59 = uint64_t v58 = v24;
    v7[2](v7, v43, v59, v41, v35);

    v24 = v58;
  }
  AMSupportSafeRelease();
}

- (void)challengeStrongComponents:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void *, void *))a4;
  v7 = objc_opt_new();
  uint64_t v40 = objc_opt_new();
  if (!v5) {
    goto LABEL_5;
  }
  BOOL v8 = [v5 objectForKeyedSubscript:@"challenges"];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = [v5 objectForKeyedSubscript:@"challenges"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v8 = [v5 objectForKeyedSubscript:@"challenges"];
      goto LABEL_6;
    }
LABEL_5:
    BOOL v8 = 0;
  }
LABEL_6:
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (!v12)
  {
    uint64_t v31 = 0;
    uint64_t v32 = 1;
    goto LABEL_55;
  }
  id v13 = v12;
  id v39 = v7;
  v36 = v6;
  id v37 = v5;
  uint64_t v14 = *(void *)v48;
LABEL_8:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v48 != v14) {
      objc_enumerationMutation(obj);
    }
    id v16 = *(void **)(*((void *)&v47 + 1) + 8 * v15);
    CFDataRef v45 = 0;
    CFDataRef v46 = 0;
    int v44 = 0;
    id v17 = [v16 objectForKeyedSubscript:@"key"];
    uint64_t v18 = [v16 objectForKeyedSubscript:@"nonce"];
    v19 = (void *)v18;
    if (v17) {
      BOOL v20 = v18 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    if (v20) {
      goto LABEL_44;
    }
    if ([v17 isEqual:@"vcrt"])
    {
      v21 = [(CRPreflight *)self sha256Data:v19];
      [v40 vcrtSign:v21 outSignature:&v46 outDeviceNonce:&v45 outError:&v44];

LABEL_17:
      int v22 = 1;
      goto LABEL_23;
    }
    if ([v17 isEqual:@"bcrt"])
    {
      [v40 bcrtSign:v19 outSignature:&v46 outDeviceNonce:0 outError:&v44];
    }
    else
    {
      if (![v17 isEqual:@"tcrt"])
      {
        if (![v17 isEqual:@"prpc"])
        {
          uint64_t v29 = handleForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_10003DC8C(&buf, v43, v29);
          }
          goto LABEL_43;
        }
        [v40 prpcSign:v19 outSignature:&v46 outDeviceNonce:&v45 outError:&v44];
        goto LABEL_17;
      }
      [v40 tcrtSign:v19 outSignature:&v46 outDeviceNonce:0 outError:&v44];
    }
    int v22 = 0;
LABEL_23:
    CFDataRef v23 = v46;
    if (!v46)
    {
      v24 = handleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LODWORD(bytes) = 138412290;
        *(void *)((char *)&bytes + 4) = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to get strong component signature: %@", (uint8_t *)&bytes, 0xCu);
      }

      long long bytes = 0uLL;
      int v58 = 0;
      CFDataRef v23 = CFDataCreate(0, (const UInt8 *)&bytes, 20);
      CFDataRef v46 = v23;
    }
    CFDataRef v25 = v45;
    if (v45) {
      int v26 = 0;
    }
    else {
      int v26 = v22;
    }
    if (v26 == 1)
    {
      uint64_t v27 = handleForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LODWORD(bytes) = 138412290;
        *(void *)((char *)&bytes + 4) = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to get strong component nonce: %@", (uint8_t *)&bytes, 0xCu);
      }

      long long bytes = 0uLL;
      int v58 = 0;
      CFDataRef v25 = CFDataCreate(0, (const UInt8 *)&bytes, 20);
      CFDataRef v45 = v25;
      CFDataRef v23 = v46;
    }
    char v28 = v25 ? 0 : v22;
    if (!v23 || (v28 & 1) != 0) {
      break;
    }
    if (v22)
    {
      v53[0] = @"key";
      v53[1] = @"signature";
      v54[0] = v17;
      v54[1] = v23;
      v53[2] = @"deviceNonce";
      v54[2] = v25;
      uint64_t v29 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];
    }
    else
    {
      v51[0] = @"key";
      v51[1] = @"signature";
      v52[0] = v17;
      v52[1] = v23;
      uint64_t v29 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
    }

    [v7 addObject:v29];
LABEL_43:

LABEL_44:
    if (v13 == (id)++v15)
    {
      id v30 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
      id v13 = v30;
      if (!v30)
      {
        uint64_t v31 = 0;
        uint64_t v32 = 1;
        goto LABEL_53;
      }
      goto LABEL_8;
    }
  }
  uint64_t v33 = CRErrorDomain;
  NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
  v34 = +[NSString stringWithFormat:@"Failed to challenge strong component: %@", v17];
  v56 = v34;
  id v35 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  uint64_t v31 = +[NSError errorWithDomain:v33 code:-42 userInfo:v35];

  uint64_t v32 = 0;
LABEL_53:
  id v6 = v36;
  id v5 = v37;
  v7 = v39;
LABEL_55:

  if (v6) {
    v6[2](v6, v32, v7, v31);
  }
}

- (id)sign:(id)a3 keyBlob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      BOOL v8 = [[CRRIK alloc] initWithKeyBlob:v7];
      if (v8)
      {
        p_super = &v8->super;
        uint64_t v10 = [(CRPreflight *)self sha256Data:v6];
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          id v12 = [p_super sign:v10];

          goto LABEL_16;
        }
        id v13 = handleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10003DD68();
        }
      }
      else
      {
        p_super = handleForCategory();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          sub_10003DD34();
        }
      }
    }
    else
    {
      p_super = handleForCategory();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_10003DD00();
      }
    }
  }
  else
  {
    p_super = handleForCategory();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_10003DCCC();
    }
  }
  id v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    p_super = handleForCategory();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_10003DCCC();
    }
    goto LABEL_12;
  }
  uint64_t v11 = [[CRRIK alloc] initWithKeyBlob:v10];
  if (!v11)
  {
    p_super = handleForCategory();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_10003DD34();
    }
    goto LABEL_12;
  }
  p_super = &v11->super;
  uint64_t v13 = [(CRPreflight *)self sha256Data:v8];
  if (!v13)
  {
    id v16 = handleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003DD68();
    }

LABEL_12:
    unsigned __int8 v15 = 0;
    goto LABEL_13;
  }
  uint64_t v14 = (void *)v13;
  unsigned __int8 v15 = [p_super verify:v13 signature:v9];

LABEL_13:
  return v15;
}

- (id)sha256Data:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 length];
  if ((unint64_t)(v4 - 1) > 0xFFFFFFFD)
  {
    id v5 = 0;
  }
  else
  {
    CC_SHA256([v3 bytes], (CC_LONG)v4, (unsigned __int8 *)&v7);
    id v5 = +[NSData dataWithBytes:&v7 length:32];
  }

  return v5;
}

- (id)requestBAACertificates:(id)a3 apticket:(id)a4 proxySettings:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v42 = a5;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
  long long v41 = v11;
  if (!v10)
  {
    int v26 = handleForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10003DD9C();
    }
    goto LABEL_16;
  }
  uint64_t v13 = [v10 attestationBlob];
  if (!v13)
  {
    int v26 = handleForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10003DDD0();
    }
LABEL_16:

    CFDataRef v23 = 0;
    v24 = 0;
    id v16 = 0;
    uint64_t v14 = 0;
LABEL_17:
    id v20 = 0;
    uint64_t v27 = 0;
    uint64_t v18 = 0;
    goto LABEL_18;
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = [v10 pubKeyBlob];
  if (!v15)
  {
    id v30 = handleForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10003DE04();
    }

    CFDataRef v23 = 0;
    v24 = 0;
    id v16 = 0;
    goto LABEL_17;
  }
  id v16 = (void *)v15;
  id v39 = a6;
  if (v11) {
    [v12 setObject:v11 forKeyedSubscript:kMAOptionsBAALiveImage4Manifest];
  }
  [v12 setObject:v14 forKeyedSubscript:kMAOptionsBAAClientAttestationData];
  [v12 setObject:v16 forKeyedSubscript:kMAOptionsBAAClientAttestationPublicKey];
  [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:kMAOptionsBAASCRTAttestation];
  v44[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
  v44[1] = kMAOptionsBAAOIDDeviceIdentifiers;
  v44[2] = kMAOptionsBAAOIDHardwareProperties;
  v44[3] = kMAOptionsBAAOIDKeyUsageProperties;
  v44[4] = kMAOptionsBAAOIDDeviceOSInformation;
  id v17 = +[NSArray arrayWithObjects:v44 count:5];
  [v12 setObject:v17 forKeyedSubscript:kMAOptionsBAAOIDSToInclude];

  v43[1] = 0;
  uint64_t v18 = DeviceIdentityCreateClientCertificateRequest();
  id v19 = 0;
  id v20 = v19;
  if (!v18 || v19)
  {
    uint64_t v31 = handleForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10003DE38((uint64_t)v20, v31, v32, v33, v34, v35, v36, v37);
    }

    CFDataRef v23 = 0;
    v24 = 0;
    uint64_t v27 = 0;
    goto LABEL_18;
  }
  int v21 = MGGetBoolAnswer();
  int v22 = @"corerepaird-SB";
  if (v21) {
    int v22 = @"corerepaird-CB";
  }
  CFDataRef v23 = v22;
  v24 = [(CRPreflight *)self _getVersionInfo:v18];
  if (v24)
  {
    CFDataRef v25 = +[NSString stringWithFormat:@"%@ - %@", v24, v23];
    [v18 setValue:v25 forHTTPHeaderField:@"User-Agent"];
  }
  else
  {
    [v18 setValue:v23 forHTTPHeaderField:@"User-Agent"];
  }
  v43[0] = 0;
  uint64_t v27 = [(CRPreflight *)self _httpSendRequest:v18 proxySettings:v42 withError:v43];
  id v38 = v43[0];
  id v20 = v38;
  if (v27 && !v38)
  {
    id v28 = [(CRPreflight *)self _extractCertsFromResponse:v27];
    goto LABEL_19;
  }
  if (!v39)
  {
LABEL_18:
    id v28 = 0;
    goto LABEL_19;
  }
  id v20 = v38;
  id v28 = 0;
  *id v39 = v20;
LABEL_19:

  return v28;
}

- (id)_httpSendRequest:(id)a3 proxySettings:(id)a4 withError:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  CFStringRef v68 = sub_10000804C;
  v69 = sub_10000805C;
  id v70 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x3032000000;
  id v62 = sub_10000804C;
  id v63 = sub_10000805C;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_10000804C;
  __int16 v57 = sub_10000805C;
  id v58 = 0;
  uint64_t v49 = 0;
  long long v50 = &v49;
  uint64_t v51 = 0x2020000000;
  int v52 = 0;
  if (v6)
  {
    if (v7)
    {
      id v9 = [v7 objectForKeyedSubscript:@"socksHost"];
      BOOL v10 = v9 == 0;

      if (v10)
      {
        id v11 = 0;
      }
      else
      {
        id v11 = [v8 objectForKeyedSubscript:@"socksHost"];
      }
      uint64_t v13 = [v8 objectForKeyedSubscript:@"socksPort"];
      BOOL v14 = v13 == 0;

      if (!v14)
      {
        uint64_t v15 = [v8 objectForKeyedSubscript:@"socksPort"];
LABEL_13:
        id v16 = [v6 allHTTPHeaderFields];
        id v17 = handleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v6 description];
          *(_DWORD *)uint8_t buf = 138412290;
          id v80 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "HTTP Request: %@", buf, 0xCu);
        }
        id v19 = handleForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint8_t buf = 138412290;
          id v80 = v16;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "HTTP Request Header: %@", buf, 0xCu);
        }

        id v20 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
        if (v20)
        {
          if (v11 && v15)
          {
            v77[0] = @"SOCKSProxy";
            v77[1] = @"SOCKSPort";
            v78[0] = v11;
            v78[1] = v15;
            v77[2] = @"SOCKSEnable";
            v78[2] = &__kCFBooleanTrue;
            int v21 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:3];
            [v20 setConnectionProxyDictionary:v21];
          }
          int v22 = +[NSURLSession sessionWithConfiguration:v20];
          if (v22)
          {
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            id v43[2] = sub_100008064;
            v43[3] = &unk_100058BB0;
            CFDataRef v45 = &v59;
            CFDataRef v46 = &v49;
            long long v47 = &v65;
            long long v48 = &v53;
            CFDataRef v23 = dispatch_semaphore_create(0);
            int v44 = v23;
            long long v41 = [v22 dataTaskWithRequest:v6 completionHandler:v43];
            [v41 resume];
            dispatch_time_t v24 = dispatch_time(0, 90000000000);
            if (dispatch_semaphore_wait(v23, v24))
            {
              if (a5)
              {
                NSErrorUserInfoKey v75 = NSLocalizedDescriptionKey;
                CFStringRef v76 = @"Request BAA timeout";
                CFDataRef v25 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
                *a5 = +[NSError errorWithDomain:CRErrorDomain code:-76 userInfo:v25];
              }
              id v12 = 0;
            }
            else
            {
              int v26 = handleForCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v27 = (void *)v60[5];
                *(_DWORD *)uint8_t buf = 138412290;
                id v80 = v27;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "HTTP Response Header: %@", buf, 0xCu);
              }

              id v28 = handleForCategory();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                int v29 = *((_DWORD *)v50 + 6);
                *(_DWORD *)uint8_t buf = 67109120;
                LODWORD(v80) = v29;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "HTTP Status: %d", buf, 8u);
              }

              id v30 = handleForCategory();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v31 = (void *)v54[5];
                *(_DWORD *)uint8_t buf = 138412290;
                id v80 = v31;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "HTTP Error: %@", buf, 0xCu);
              }

              if (v66[5])
              {
                id v32 = objc_alloc((Class)NSString);
                id v33 = [v32 initWithData:v66[5] encoding:4];
                uint64_t v34 = handleForCategory();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint8_t buf = 138412290;
                  id v80 = v33;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "HTTP Response: %@", buf, 0xCu);
                }
              }
              if (a5)
              {
                uint64_t v35 = v54[5];
                if (v35 || *((_DWORD *)v50 + 6) != 200)
                {
                  uint64_t v36 = +[NSString stringWithFormat:@"Request BAA failed with status: %d error: %@", *((unsigned int *)v50 + 6), v35];
                  uint64_t v37 = (void *)v36;
                  uint64_t v40 = CRErrorDomain;
                  if (*((_DWORD *)v50 + 6) == 429)
                  {
                    NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
                    uint64_t v74 = v36;
                    id v38 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
                    +[NSError errorWithDomain:v40 code:-94 userInfo:v38];
                  }
                  else
                  {
                    NSErrorUserInfoKey v71 = NSLocalizedDescriptionKey;
                    uint64_t v72 = v36;
                    id v38 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
                    +[NSError errorWithDomain:v40 code:-76 userInfo:v38];
                  }
                  *a5 = (id)objc_claimAutoreleasedReturnValue();
                }
              }
              id v12 = (id)v66[5];
            }
          }
          else
          {
            CFDataRef v23 = handleForCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              sub_10003DF0C();
            }
            id v12 = 0;
          }
        }
        else
        {
          int v22 = handleForCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_10003DED8();
          }
          id v12 = 0;
        }

        goto LABEL_53;
      }
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  id v11 = handleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10003DEA4();
  }
  id v12 = 0;
LABEL_53:

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v12;
}

- (id)_extractCertsFromResponse:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10000804C;
  int v21 = sub_10000805C;
  id v22 = +[NSMutableArray array];
  id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
  id v5 = +[NSRegularExpression regularExpressionWithPattern:@"-----BEGIN CERTIFICATE-----(.+?)-----END CERTIFICATE-----\n" options:40 error:0];
  id v6 = [v4 length];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_100008338;
  BOOL v14 = &unk_100058BD8;
  id v7 = v4;
  id v15 = v7;
  id v16 = &v17;
  [v5 enumerateMatchesInString:v7 options:0 range:0 usingBlock:v6];
  if (objc_msgSend((id)v18[5], "count", v11, v12, v13, v14))
  {
    id v8 = (id)v18[5];
  }
  else
  {
    id v9 = handleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003DF40();
    }

    id v8 = 0;
  }

  _Block_object_dispose(&v17, 8);

  return v8;
}

- (id)_getVersionInfo:(id)a3
{
  id v3 = [a3 allHTTPHeaderFields];
  id v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138412290;
    dispatch_time_t v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Original Headers: %@", buf, 0xCu);
  }

  id v5 = [v3 objectForKeyedSubscript:@"User-Agent"];
  if (v5)
  {
    id v22 = 0;
    id v6 = +[NSRegularExpression regularExpressionWithPattern:@"^.*\\(MobileActivation-.*?\\)" options:0 error:&v22];
    id v7 = v22;
    id v8 = v7;
    if (!v6 || v7)
    {
      BOOL v10 = handleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10003DFA8((uint64_t)v8, v10, v14, v15, v16, v17, v18, v19);
      }
    }
    else
    {
      id v9 = [v6 firstMatchInString:v5 options:0 range:[v5 length]];
      BOOL v10 = v9;
      if (v9)
      {
        id v11 = [v9 range];
        uint64_t v13 = [v5 substringWithRange:v11, v12];
LABEL_17:

        goto LABEL_18;
      }
      id v20 = handleForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10003E014();
      }
    }
    uint64_t v13 = 0;
    goto LABEL_17;
  }
  id v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10003DF74();
  }
  uint64_t v13 = 0;
LABEL_18:

  return v13;
}

@end