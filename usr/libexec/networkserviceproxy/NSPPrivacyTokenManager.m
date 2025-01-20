@interface NSPPrivacyTokenManager
+ (id)sharedTokenManager;
- (BOOL)updateTokenFetchURL:(id)a3 accessTokenURL:(id)a4 accessTokenTypes:(id)a5 accessTokenBlockedIssuers:(id)a6 authenticationType:(int)a7 ignoreInvalidCerts:(BOOL)a8;
- (id)description;
- (id)tokenFetchURL;
- (void)copyTokenInfo:(id)a3;
- (void)fetchPairedPrivateAccessTokensForChallenge:(id)a3 overrideAttester:(id)a4 tokenKey:(id)a5 originNameKey:(id)a6 selectedOrigin:(id)a7 pairedChallenge:(id)a8 overridePairedAttester:(id)a9 pairedTokenKey:(id)a10 auditToken:(id)a11 bundleID:(id)a12 allowTools:(BOOL)a13 systemTokenClient:(BOOL)a14 accessToken:(id)a15 completionHandler:(id)a16;
- (void)fetchPrivacyTokensOnInterface:(id)a3 tierType:(id)a4 proxyURL:(id)a5 tokenVendor:(id)a6 tokenIssuancePublicKey:(id)a7 tokenChallenge:(id)a8 tokenCount:(unint64_t)a9 accessToken:(id)a10 retryAttempt:(unint64_t)a11 completionHandler:(id)a12;
- (void)fetchPrivateAccessTokenForChallenge:(id)a3 overrideAttester:(id)a4 customAttester:(id)a5 customAttesterHeaders:(id)a6 tokenKey:(id)a7 originNameKey:(id)a8 selectedOrigin:(id)a9 auxiliaryAuthInfoCacheKey:(id)a10 auditToken:(id)a11 bundleID:(id)a12 allowTools:(BOOL)a13 systemTokenClient:(BOOL)a14 accessToken:(id)a15 completionHandler:(id)a16;
- (void)getTokenServerIPWithInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation NSPPrivacyTokenManager

+ (id)sharedTokenManager
{
  if (qword_1001232D0 != -1) {
    dispatch_once(&qword_1001232D0, &stru_100106CD0);
  }
  v2 = (void *)qword_1001232C8;

  return v2;
}

- (id)description
{
  return @"Privacy Token Manager";
}

- (id)tokenFetchURL
{
  return self->_tokenFetchURL;
}

- (BOOL)updateTokenFetchURL:(id)a3 accessTokenURL:(id)a4 accessTokenTypes:(id)a5 accessTokenBlockedIssuers:(id)a6 authenticationType:(int)a7 ignoreInvalidCerts:(BOOL)a8
{
  uint64_t v9 = *(void *)&a7;
  v15 = (char *)a3;
  id v16 = a4;
  id v17 = a5;
  id v28 = a6;
  if (!v15)
  {
    v25 = nplog_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[NSPPrivacyTokenManager updateTokenFetchURL:accessTokenURL:accessTokenTypes:accessTokenBlockedIssuers:authe"
            "nticationType:ignoreInvalidCerts:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "%s called with null tokenFetchURL", buf, 0xCu);
    }

    goto LABEL_23;
  }
  BOOL v27 = a8;
  v18 = nplog_obj();
  v19 = v18;
  if (!v9)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[NSPPrivacyTokenManager updateTokenFetchURL:accessTokenURL:accessTokenTypes:accessTokenBlockedIssuers:authe"
            "nticationType:ignoreInvalidCerts:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "%s called with null (authenticationType != NSPPrivacyProxyAuthenticationInfo_AuthenticationType_UNKNOWN)", buf, 0xCu);
    }

LABEL_23:
    BOOL v23 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = v16;
    if (v9 >= 5)
    {
      v20 = +[NSString stringWithFormat:@"(unknown: %i)", v9];
    }
    else
    {
      v20 = off_100107008[(int)v9 - 1];
    }
    *(_DWORD *)buf = 138412802;
    v30 = v15;
    __int16 v31 = 2112;
    id v32 = v26;
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "updating token fetch url %@ access token url %@ authentication type %@", buf, 0x20u);

    id v16 = v26;
  }

  objc_storeStrong((id *)&self->_tokenFetchURL, a3);
  objc_storeStrong((id *)&self->_accessTokenURL, a4);
  objc_storeStrong((id *)&self->_accessTokenTypes, a5);
  objc_storeStrong((id *)&self->_accessTokenBlockedIssuers, a6);
  self->_ignoreInvalidCerts = v27;
  if (v9 == 3)
  {
    sub_100050C4C();
LABEL_15:
    self->_authenticationClass = (Class)objc_opt_class();
    BOOL v23 = 1;
    goto LABEL_16;
  }
  if (v9 == 2 || v9 == 1) {
    goto LABEL_15;
  }
  id v21 = v16;
  v22 = nplog_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "invalid authentication type %d", buf, 8u);
  }

  BOOL v23 = 0;
  id v16 = v21;
LABEL_16:

  return v23;
}

- (void)fetchPrivacyTokensOnInterface:(id)a3 tierType:(id)a4 proxyURL:(id)a5 tokenVendor:(id)a6 tokenIssuancePublicKey:(id)a7 tokenChallenge:(id)a8 tokenCount:(unint64_t)a9 accessToken:(id)a10 retryAttempt:(unint64_t)a11 completionHandler:(id)a12
{
  id v85 = a3;
  id v88 = a4;
  id v91 = a5;
  id v87 = a6;
  id v96 = a7;
  id v89 = a8;
  id v86 = a10;
  id v90 = a12;
  id v17 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v17);

  if (!v91)
  {
    v76 = nplog_obj();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v122 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicKey"
             ":tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_FAULT, "%s called with null proxyURL", buf, 0xCu);
    }
    goto LABEL_102;
  }
  if (!a9)
  {
    v76 = nplog_obj();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v122 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicKey"
             ":tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_FAULT, "%s called with null (tokenCount > 0)", buf, 0xCu);
    }
    goto LABEL_102;
  }
  if (!v96)
  {
    v76 = nplog_obj();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v122 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicKey"
             ":tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_FAULT, "%s called with null tokenIssuancePublicKey", buf, 0xCu);
    }
LABEL_102:

    (*((void (**)(id, void, void, void, void, void, void))v90 + 2))(v90, 0, 0, 0, 0, 0, 0);
    goto LABEL_85;
  }
  if (!v89)
  {
    v18 = 0;
    v19 = self;
LABEL_10:
    if (v19) {
      v19->_totalRequestedTokenCount += a9;
    }
    id v21 = objc_alloc_init((Class)NSPPrivacyProxyTokenInfo);
    id v117 = 0;
    id v94 = [objc_alloc((Class)RSABSSATokenBlinder) initWithPublicKey:v96 error:&v117];
    v83 = (char *)v117;
    if (v83)
    {
      v22 = nplog_obj();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v122 = v83;
        __int16 v123 = 2112;
        id v124 = v91;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "RSABSSATokenBlinder initWithPublicKey failed with error %@ for %@", buf, 0x16u);
      }
LABEL_15:

      (*((void (**)(id, void, void, void, void, void, uint64_t))v90 + 2))(v90, 0, 0, 0, 0, 0, 1);
LABEL_84:

      goto LABEL_85;
    }
    if (!v94)
    {
      v22 = nplog_obj();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v122 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicK"
               "ey:tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "%s called with null tokenBlinder", buf, 0xCu);
      }
      goto LABEL_15;
    }
    BOOL v23 = &AnalyticsSendEventLazy_ptr;
    if (v18)
    {
      id v95 = objc_alloc_init((Class)NSMutableArray);
      id v93 = objc_alloc_init((Class)NSMutableArray);
      unint64_t v24 = a9;
      do
      {
        v25 = sub_1000B72A8();
        if (!v25)
        {
          v74 = nplog_obj();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v122 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePub"
                   "licKey:tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
            _os_log_fault_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_FAULT, "%s called with null clientNonce", buf, 0xCu);
          }

          (*((void (**)(id, void, void, void, void, void, uint64_t))v90 + 2))(v90, 0, 0, 0, 0, 0, 1);
          goto LABEL_83;
        }
        id v26 = sub_1000B7398((uint64_t)NSPPrivateAccessTokenRequest, v18, v25, v96);
        if (!v26)
        {
          v75 = nplog_obj();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v122 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePub"
                   "licKey:tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
            _os_log_fault_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_FAULT, "%s called with null messageToBlind", buf, 0xCu);
          }

          (*((void (**)(id, void, void, void, void, void, uint64_t))v90 + 2))(v90, 0, 0, 0, 0, 0, 1);
          goto LABEL_83;
        }
        [v95 addObject:v26];
        [v93 addObject:v25];

        --v24;
      }
      while (v24);
      id v27 = v94;
      id v28 = v95;
      if (!self)
      {
        id v95 = v28;
        v84 = 0;

        goto LABEL_45;
      }
      if (!v28)
      {
        id v95 = 0;
        char v29 = 1;
        goto LABEL_29;
      }
      id v95 = v28;
      if ([v28 count] == (id)a9)
      {
        char v29 = 0;
        goto LABEL_29;
      }
      __int16 v31 = nplog_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v122 = "-[NSPPrivacyTokenManager generateTokensUsingTokenBlinder:contentArray:tokenCount:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "%s called with null (contentArray.count == tokenCount)", buf, 0xCu);
      }
    }
    else
    {
      id v30 = v94;
      id v93 = 0;
      if (!self)
      {
        id v95 = 0;
        v84 = 0;

        goto LABEL_45;
      }
      char v29 = 1;
      id v95 = 0;
LABEL_29:
      __int16 v31 = objc_alloc_init((Class)NSMutableArray);
      uint64_t v32 = 0;
      while (1)
      {
        if (v29)
        {
          __int16 v33 = 0;
        }
        else
        {
          BOOL v23 = [v95 objectAtIndexedSubscript:v32];
          __int16 v33 = v23;
        }
        id v118 = 0;
        v34 = [v94 tokenWaitingActivationWithContent:v33 error:&v118];
        v35 = (char *)v118;
        if ((v29 & 1) == 0) {

        }
        if (v35) {
          break;
        }
        if (!v34)
        {
          v34 = nplog_obj();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v122 = "-[NSPPrivacyTokenManager generateTokensUsingTokenBlinder:contentArray:tokenCount:]";
            _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "%s called with null waitingActivation", buf, 0xCu);
          }
          goto LABEL_42;
        }
        [v31 addObject:v34];

        if (a9 == ++v32)
        {
          __int16 v31 = v31;
          v84 = v31;
          goto LABEL_44;
        }
      }
      v36 = nplog_obj();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v122 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "tokenWaitingActivationWithContent failed with error %@", buf, 0xCu);
      }

LABEL_42:
    }
    v84 = 0;
LABEL_44:

LABEL_45:
    if ([v84 count])
    {
      id v37 = [v84 count];
      if (self) {
        self->_totalUnactivatedTokenCount += (unint64_t)v37;
      }
      v38 = nplog_obj();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (const char *)[v84 count];
        *(_DWORD *)buf = 134218242;
        v122 = v39;
        __int16 v123 = 2112;
        id v124 = v87;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "generated %lu unactivated tokens for %@", buf, 0x16u);
      }

      if (v18)
      {
        long long v111 = 0uLL;
        long long v112 = 0uLL;
        long long v109 = 0uLL;
        long long v110 = 0uLL;
        v40 = v84;
        id v41 = [v40 countByEnumeratingWithState:&v109 objects:v119 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v110;
          while (2)
          {
            for (i = 0; i != v41; i = (char *)i + 1)
            {
              if (*(void *)v110 != v42) {
                objc_enumerationMutation(v40);
              }
              v44 = *(void **)(*((void *)&v109 + 1) + 8 * i);
              v45 = [NSPPrivateAccessTokenRequest alloc];
              v46 = [v44 blindedMessage];
              id v47 = sub_1000B7720((uint64_t)v45, v18, v96, 0, 0, v46);

              if (!v47 || (id v49 = objc_getProperty(v47, v48, 24, 1)) == 0)
              {
                v78 = nplog_obj();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v122 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssua"
                         "ncePublicKey:tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
                  _os_log_fault_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_FAULT, "%s called with null requestData", buf, 0xCu);
                }

                (*((void (**)(id, void, void, void, void, void, uint64_t))v90 + 2))(v90, 0, 0, 0, 0, 0, 1);
                goto LABEL_82;
              }
              v50 = v49;
              [v21 addTokenRequestList:v49];
            }
            id v41 = [v40 countByEnumeratingWithState:&v109 objects:v119 count:16];
            if (v41) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        long long v115 = 0uLL;
        long long v116 = 0uLL;
        long long v113 = 0uLL;
        long long v114 = 0uLL;
        v51 = v84;
        id v52 = [v51 countByEnumeratingWithState:&v113 objects:v120 count:16];
        if (v52)
        {
          uint64_t v53 = *(void *)v114;
          do
          {
            for (j = 0; j != v52; j = (char *)j + 1)
            {
              if (*(void *)v114 != v53) {
                objc_enumerationMutation(v51);
              }
              v55 = [*(id *)(*((void *)&v113 + 1) + 8 * (void)j) blindedMessage];
              [v21 addUnactivatedTokenList:v55];
            }
            id v52 = [v51 countByEnumeratingWithState:&v113 objects:v120 count:16];
          }
          while (v52);
        }
      }

      v56 = [v94 keyId];
      [v21 setTokenKeyID:v56];

      [v21 setProxyURL:v91];
      [v21 setVendor:v87];
      id v57 = objc_alloc_init((Class)NSPPrivacyProxyTokenActivationQuery);
      [v57 setTokenInfo:v21];
      v79 = (void *)mach_absolute_time();
      v58 = [(NSPPrivacyTokenManager *)self tokenFetchURL];
      v59 = sub_1000A79CC((uint64_t)self, v58, v85, 0, 0, a11 != 0);

      if (v88) {
        [v59 setValue:v88 forHTTPHeaderField:@"X-Mask-User-Tier"];
      }
      if (v86) {
        [v59 setValue:v86 forHTTPHeaderField:@"X-Mask-Subscription-Token"];
      }
      v60 = +[NSString stringWithFormat:@"%lu", a11];
      if (v60) {
        [v59 setValue:v60 forHTTPHeaderField:@"Retry-Attempt"];
      }
      id v82 = objc_alloc_init((Class)NSURLSessionDelegate);
      v61 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
      v62 = [v61 _socketStreamProperties];
      if (v62)
      {
        v63 = [v61 _socketStreamProperties];
        v81 = +[NSMutableDictionary dictionaryWithDictionary:v63];
      }
      else
      {
        v81 = +[NSMutableDictionary dictionary];
      }

      [v81 setObject:&__kCFBooleanTrue forKeyedSubscript:_kCFStreamPropertyPrefersNoProxy];
      [v61 set_socketStreamProperties:v81];
      [v61 setTimeoutIntervalForRequest:60.0];
      [v61 set_loggingPrivacyLevel:1];
      v64 = [(NSPPrivacyTokenManager *)self tokenFetchURL];
      v80 = +[NSURL URLWithString:v64];

      v65 = [v80 host];
      [v82 setValidationHostname:v65];

      if (self)
      {
        v66 = self;
        BOOL ignoreInvalidCerts = self->_ignoreInvalidCerts;
      }
      else
      {
        BOOL ignoreInvalidCerts = 0;
        v66 = 0;
      }
      BOOL v68 = v66 == 0;
      [v82 setIgnoreInvalidCerts:ignoreInvalidCerts];
      v69 = +[NSOperationQueue mainQueue];
      v70 = +[NSURLSession sessionWithConfiguration:v61 delegate:v82 delegateQueue:v69];

      [v70 setSessionDescription:@"PrivacyProxyTokenFetch"];
      objc_initWeak((id *)buf, self);
      if (v68) {
        Class authenticationClass = 0;
      }
      else {
        Class authenticationClass = self->_authenticationClass;
      }
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472;
      v97[2] = sub_1000A8D94;
      v97[3] = &unk_100106D20;
      objc_copyWeak(v108, (id *)buf);
      id v72 = v70;
      id v98 = v72;
      id v73 = v59;
      id v99 = v73;
      id v107 = v90;
      v100 = v84;
      v101 = v18;
      id v102 = v96;
      id v103 = v93;
      id v104 = v87;
      id v105 = v91;
      id v106 = v88;
      v108[1] = (id)a9;
      v108[2] = v79;
      [(objc_class *)authenticationClass sendRequestForTokens:v73 tokenFetchURLSession:v72 tokenActivationQuery:v57 completionHandler:v97];

      objc_destroyWeak(v108);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v77 = nplog_obj();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v122 = "-[NSPPrivacyTokenManager fetchPrivacyTokensOnInterface:tierType:proxyURL:tokenVendor:tokenIssuancePublicK"
               "ey:tokenChallenge:tokenCount:accessToken:retryAttempt:completionHandler:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_FAULT, "%s called with null (tokenWaitingActivationList.count > 0)", buf, 0xCu);
      }

      (*((void (**)(id, void, void, void, void, void, uint64_t))v90 + 2))(v90, 0, 0, 0, 0, 0, 1);
    }
LABEL_82:

LABEL_83:
    goto LABEL_84;
  }
  v18 = [[NSPPrivateAccessTokenChallenge alloc] initWithData:v89];
  v19 = self;
  if (v18) {
    goto LABEL_10;
  }
  v20 = nplog_obj();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v122 = (const char *)v91;
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to parse token challenge for %@", buf, 0xCu);
  }

  (*((void (**)(id, void, void, void, void, void, uint64_t))v90 + 2))(v90, 0, 0, 0, 0, 0, 1);
LABEL_85:
}

- (void)fetchPrivateAccessTokenForChallenge:(id)a3 overrideAttester:(id)a4 customAttester:(id)a5 customAttesterHeaders:(id)a6 tokenKey:(id)a7 originNameKey:(id)a8 selectedOrigin:(id)a9 auxiliaryAuthInfoCacheKey:(id)a10 auditToken:(id)a11 bundleID:(id)a12 allowTools:(BOOL)a13 systemTokenClient:(BOOL)a14 accessToken:(id)a15 completionHandler:(id)a16
{
  id v21 = a3;
  unint64_t v78 = (unint64_t)a4;
  id v77 = a5;
  id v71 = a6;
  id v74 = a7;
  id v72 = a8;
  id v76 = a9;
  id v73 = a10;
  id v70 = a11;
  id v75 = a12;
  id v80 = a15;
  id v22 = a16;
  BOOL v23 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v23);

  if (!v21)
  {
    BOOL v68 = nplog_obj();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPrivateAccessTokenForChallenge:overrideAttester:cust"
                                      "omAttester:customAttesterHeaders:tokenKey:originNameKey:selectedOrigin:auxiliaryAu"
                                      "thInfoCacheKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_FAULT, "%s called with null challenge", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, void, uint64_t, void))v22 + 2))(v22, 0, 1004, 0);
    goto LABEL_83;
  }
  if (!v22)
  {
    v69 = nplog_obj();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPrivateAccessTokenForChallenge:overrideAttester:cust"
                                      "omAttester:customAttesterHeaders:tokenKey:originNameKey:selectedOrigin:auxiliaryAu"
                                      "thInfoCacheKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_FAULT, "%s called with null completionHandler", (uint8_t *)&buf, 0xCu);
    }

    MEMORY[0x10](0, 0, 1004, 0);
    goto LABEL_83;
  }
  if (self) {
    unint64_t v24 = self->_accessTokenURL;
  }
  else {
    unint64_t v24 = 0;
  }
  if (v78 | v24)
  {
  }
  else if (!v77)
  {
    v25 = nplog_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Cannot fetch private access token, no attester URL", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, void, uint64_t, void))v22 + 2))(v22, 0, 1005, 0);
    goto LABEL_83;
  }
  id v26 = [v21 issuerName];
  if ([v26 hasSuffix:@"corp.apple.com"])
  {
    id v27 = [v21 issuerName];
    unsigned int v28 = [v27 containsString:@"idms"];

    if (v80 || (v28 & 1) != 0 || a14)
    {
      if (v28)
      {
        id v29 = v76;
        if (!v29)
        {
          id v29 = [v21 originName];
        }
        if (([v29 hasSuffix:@".apple.com"] & 1) == 0
          && ([v29 hasSuffix:@".apple"] & 1) == 0)
        {
          v67 = nplog_obj();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "Bad origin name for IDMS issuer", (uint8_t *)&buf, 2u);
          }

          (*((void (**)(id, void, uint64_t, void))v22 + 2))(v22, 0, 1001, 0);
          goto LABEL_83;
        }
      }
      goto LABEL_26;
    }
LABEL_23:
    id v30 = nplog_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "No eligible account found, cannot request token", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, void, uint64_t, void))v22 + 2))(v22, 0, 1003, 0);
    goto LABEL_83;
  }

  if (!v80 && !a14) {
    goto LABEL_23;
  }
LABEL_26:
  __int16 v31 = self;
  if (self)
  {
    accessTokenTypes = self->_accessTokenTypes;
    if (accessTokenTypes)
    {
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      __int16 v33 = accessTokenTypes;
      id v34 = [(NSArray *)v33 countByEnumeratingWithState:&v95 objects:v104 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v96;
        while (2)
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v96 != v35) {
              objc_enumerationMutation(v33);
            }
            unsigned int v37 = [*(id *)(*((void *)&v95 + 1) + 8 * i) unsignedShortValue];
            if (v37 == [v21 tokenType])
            {

              __int16 v31 = self;
              goto LABEL_40;
            }
          }
          id v34 = [(NSArray *)v33 countByEnumeratingWithState:&v95 objects:v104 count:16];
          if (v34) {
            continue;
          }
          break;
        }
      }

      v38 = nplog_obj();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v39 = [v21 tokenType];
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Cannot fetch token type %u, not in allowed type list", (uint8_t *)&buf, 8u);
      }
      goto LABEL_38;
    }
LABEL_40:
    accessTokenBlockedIssuers = v31->_accessTokenBlockedIssuers;
  }
  else
  {
    accessTokenBlockedIssuers = 0;
  }
  if ([(NSArray *)accessTokenBlockedIssuers count])
  {
    id v41 = self;
    if (self) {
      id v41 = self->_accessTokenBlockedIssuers;
    }
    id v42 = v41;
    v43 = [v21 issuerName];
    v44 = [v43 lowercaseString];
    unsigned int v45 = [v42 containsObject:v44];

    if (v45)
    {
      v38 = nplog_obj();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v46 = [v21 issuerName];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v46;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Cannot fetch token from issuer %@, not allowed", (uint8_t *)&buf, 0xCu);
      }
LABEL_38:

      (*((void (**)(id, void, uint64_t, void))v22 + 2))(v22, 0, 1008, 0);
      goto LABEL_83;
    }
  }
  if (a14)
  {
LABEL_49:
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v100 = 0x3032000000;
    v101 = sub_100005DEC;
    id v102 = sub_1000AE690;
    id v103 = (id)os_transaction_create();
    BOOL v47 = sub_1000B5C60(v21, a14);
    if (v47)
    {
      unsigned int v94 = 0;
      v48 = [v74 key];
      id v49 = sub_100043DD0((uint64_t)NSPPrivateAccessTokenCache, v21, v48, &v94);

      BOOL v50 = v49 == 0;
      if (v49)
      {
        (*((void (**)(id, id, void, void))v22 + 2))(v22, v49, 0, 0);
        BOOL v51 = v94 >= 2;
      }
      else
      {
        BOOL v51 = 0;
      }
      int v52 = !v51;

      uint64_t v53 = dispatch_group_create();
      if (!v52)
      {
        v61 = 0;
LABEL_82:
        v65 = NPGetInternalQueue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000AEA78;
        block[3] = &unk_100105460;
        id v82 = v61;
        p_long long buf = &buf;
        id v66 = v61;
        dispatch_group_notify(v53, v65, block);

        _Block_object_dispose(&buf, 8);
        goto LABEL_83;
      }
      unsigned int v54 = 5;
    }
    else
    {
      BOOL v50 = 1;
      uint64_t v53 = dispatch_group_create();
      unsigned int v54 = 0;
    }
    v56 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    id v57 = [v56 _socketStreamProperties];
    if (v57)
    {
      v58 = [v56 _socketStreamProperties];
      v59 = +[NSMutableDictionary dictionaryWithDictionary:v58];
    }
    else
    {
      v59 = +[NSMutableDictionary dictionary];
    }

    [v59 setObject:&__kCFBooleanTrue forKeyedSubscript:_kCFStreamPropertyPrefersNoProxy];
    [v56 set_socketStreamProperties:v59];
    [v56 setTimeoutIntervalForRequest:60.0];
    [v56 set_sourceApplicationAuditTokenData:v70];
    [v56 set_sourceApplicationBundleIdentifier:v75];
    [v56 set_usesNWLoader:1];
    v61 = +[NSURLSession sessionWithConfiguration:v56];
    [v61 setSessionDescription:@"PrivateAccessTokenFetch"];

    if (v50)
    {
      dispatch_group_enter(v53);
      if (v78) {
        unsigned int v62 = v54 + 1;
      }
      else {
        unsigned int v62 = 1;
      }
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_1000AE698;
      v90[3] = &unk_100106E38;
      id v93 = v22;
      id v91 = v21;
      v92 = v53;
      sub_1000AAAE8((uint64_t)self, v91, (void *)v78, v77, v71, v74, v62, v72, v76, v73, v75, v80, 0, v61, 0, v90);
    }
    if (v78)
    {
      if (v47 && !v50)
      {
        dispatch_group_enter(v53);
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = sub_1000AE958;
        v84[3] = &unk_100106E60;
        id v85 = v21;
        uint64_t v53 = v53;
        id v86 = v53;
        sub_1000AAAE8((uint64_t)self, v85, (void *)v78, v77, v71, v74, v54, v72, v76, v73, v75, v80, 0, v61, 0, v84);
      }
    }
    else if (v47)
    {
      do
      {
        dispatch_group_enter(v53);
        v87[0] = _NSConcreteStackBlock;
        v87[1] = 3221225472;
        v87[2] = sub_1000AE838;
        v87[3] = &unk_100106E60;
        id v63 = v21;
        id v88 = v63;
        v64 = v53;
        id v89 = v64;
        sub_1000AAAE8((uint64_t)self, v63, 0, v77, v71, v74, 1u, v72, v76, v73, v75, v80, 0, v61, 0, v87);

        --v54;
      }
      while (v54);
      uint64_t v53 = v64;
    }
    goto LABEL_82;
  }
  if (sub_1000AD668((uint64_t)self, v70, v21, v76, a13))
  {
    if (sub_100046C30((uint64_t)NSPPrivateAccessTokenCache, v21, v76)) {
      goto LABEL_49;
    }
    v55 = nplog_obj();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Not allowed to fetch private access token, rate limited", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, void, uint64_t, void))v22 + 2))(v22, 0, 1009, 0);
  }
  else
  {
    v60 = nplog_obj();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Not allowed to fetch private access token for origin", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, void, uint64_t, void))v22 + 2))(v22, 0, 1001, 0);
  }
LABEL_83:
}

- (void)fetchPairedPrivateAccessTokensForChallenge:(id)a3 overrideAttester:(id)a4 tokenKey:(id)a5 originNameKey:(id)a6 selectedOrigin:(id)a7 pairedChallenge:(id)a8 overridePairedAttester:(id)a9 pairedTokenKey:(id)a10 auditToken:(id)a11 bundleID:(id)a12 allowTools:(BOOL)a13 systemTokenClient:(BOOL)a14 accessToken:(id)a15 completionHandler:(id)a16
{
  id v21 = a3;
  id v69 = a4;
  id v65 = a5;
  id v61 = a6;
  id v67 = a7;
  id v22 = a8;
  id v68 = a9;
  id v64 = a10;
  id v66 = a11;
  id v63 = a12;
  id v62 = a15;
  id v23 = a16;
  unint64_t v24 = NPGetInternalQueue();
  dispatch_assert_queue_V2(v24);

  if (!v21)
  {
    unsigned int v37 = nplog_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPairedPrivateAccessTokensForChallenge:overrideAttest"
                                      "er:tokenKey:originNameKey:selectedOrigin:pairedChallenge:overridePairedAttester:pa"
                                      "iredTokenKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "%s called with null longLivedTokenChallenge", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_58;
  }
  if (!v22)
  {
    unsigned int v37 = nplog_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPairedPrivateAccessTokensForChallenge:overrideAttest"
                                      "er:tokenKey:originNameKey:selectedOrigin:pairedChallenge:overridePairedAttester:pa"
                                      "iredTokenKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "%s called with null oneTimeTokenChallenge", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_58;
  }
  if (v23)
  {
    if (v69 && v68)
    {
      if (a14)
      {
LABEL_7:
        if (sub_1000B5C60(v21, a14))
        {
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v136 = 0x3032000000;
          v137 = sub_100005DEC;
          v138 = sub_1000AE690;
          v25 = [v65 key];
          id v139 = sub_100045A60((uint64_t)NSPPrivateAccessTokenCache, v21, v25);

          uint64_t v26 = *(void *)(*((void *)&buf + 1) + 40);
          if (v26)
          {
            LODWORD(v130) = 0;
            id v27 = [v64 key];
            unsigned int v28 = *(void **)(*((void *)&buf + 1) + 40);
            id v113 = 0;
            id v29 = sub_100045F88((uint64_t)NSPPrivateAccessTokenCache, v22, v27, v21, v28, &v130, &v113);
            id v30 = v113;

            BOOL v60 = v29 == 0;
            if (v29)
            {
              (*((void (**)(id, void, id, id, void, void))v23 + 2))(v23, *(void *)(*((void *)&buf + 1) + 40), v29, v30, 0, 0);
              BOOL v31 = v130 >= 0xD;
            }
            else
            {
              BOOL v31 = 0;
            }
            int v32 = !v31;

            if (!v32)
            {
              BOOL v60 = 0;
              int v33 = 0;
              id v34 = 0;
              goto LABEL_48;
            }
          }
          else
          {
            unsigned int v39 = [v21 issuerName];
            v40 = sub_1000AA150((uint64_t)self, v39);

            if (v40)
            {
              id v41 = nplog_obj();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                id v42 = [v21 issuerName];
                LODWORD(v130) = 138412290;
                *(void *)((char *)&v130 + 4) = v42;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Waiting for ongoing call to fetch long-lived token for %@", (uint8_t *)&v130, 0xCu);
              }
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1000AFA48;
              block[3] = &unk_100106E88;
              id v115 = v21;
              long long v116 = self;
              id v117 = v69;
              id v118 = v65;
              id v119 = v61;
              id v120 = v67;
              id v121 = v22;
              id v122 = v68;
              id v123 = v64;
              id v124 = v66;
              id v125 = v63;
              BOOL v128 = a13;
              BOOL v129 = a14;
              id v126 = v62;
              id v127 = v23;
              dispatch_async(v40, block);

              goto LABEL_51;
            }
            sub_100046BBC((uint64_t)NSPPrivateAccessTokenCache, v22);
            BOOL v60 = 1;
          }
          v43 = [v22 issuerName];
          v44 = sub_1000AA150((uint64_t)self, v43);

          if (v44)
          {
            if (v60)
            {
              unsigned int v45 = nplog_obj();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                v46 = [v22 issuerName];
                LODWORD(v130) = 138412290;
                *(void *)((char *)&v130 + 4) = v46;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Waiting for ongoing call to fetch one-time token for %@", (uint8_t *)&v130, 0xCu);
              }
              v97[0] = _NSConcreteStackBlock;
              v97[1] = 3221225472;
              v97[2] = sub_1000AFB3C;
              v97[3] = &unk_100106E88;
              long long v98 = v22;
              id v99 = self;
              id v100 = v21;
              id v101 = v69;
              id v102 = v65;
              id v103 = v61;
              id v104 = v67;
              id v105 = v68;
              id v106 = v64;
              id v107 = v66;
              id v108 = v63;
              BOOL v111 = a13;
              BOOL v112 = a14;
              id v109 = v62;
              id v110 = v23;
              dispatch_async(v44, v97);

              BOOL v47 = v98;
            }
            else
            {
              BOOL v47 = nplog_obj();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                int v52 = [v22 issuerName];
                LODWORD(v130) = 138412290;
                *(void *)((char *)&v130 + 4) = v52;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Not waiting for ongoing call to fetch one-time token for %@, returned from cache", (uint8_t *)&v130, 0xCu);
              }
            }

            goto LABEL_51;
          }
          v48 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
          id v49 = [v48 _socketStreamProperties];
          if (v49)
          {
            BOOL v50 = [v48 _socketStreamProperties];
            BOOL v51 = +[NSMutableDictionary dictionaryWithDictionary:v50];
          }
          else
          {
            BOOL v51 = +[NSMutableDictionary dictionary];
          }

          [v51 setObject:&__kCFBooleanTrue forKeyedSubscript:_kCFStreamPropertyPrefersNoProxy];
          [v48 set_socketStreamProperties:v51];
          [v48 setTimeoutIntervalForRequest:60.0];
          [v48 set_sourceApplicationAuditTokenData:v66];
          [v48 set_sourceApplicationBundleIdentifier:v63];
          [v48 set_usesNWLoader:1];
          id v34 = +[NSURLSession sessionWithConfiguration:v48];
          [v34 setSessionDescription:@"PrivateAccessTokenFetch"];

          int v33 = 50;
LABEL_48:
          *(void *)&long long v130 = 0;
          *((void *)&v130 + 1) = &v130;
          uint64_t v131 = 0x3032000000;
          v132 = sub_100005DEC;
          v133 = sub_1000AE690;
          id v134 = (id)os_transaction_create();
          uint64_t v53 = dispatch_group_create();
          unsigned int v54 = [v21 issuerName];
          if (!v26)
          {
            dispatch_group_enter(v53);
            sub_1000A9EC8((uint64_t)self, v54);
            v84[0] = _NSConcreteStackBlock;
            v84[1] = 3221225472;
            v84[2] = sub_1000AFC30;
            v84[3] = &unk_100106ED8;
            id v95 = v23;
            id v85 = v53;
            id v86 = self;
            id v87 = v21;
            id v88 = v69;
            id v89 = v65;
            id v90 = v61;
            id v91 = v67;
            id v92 = v63;
            id v93 = v62;
            id v94 = v34;
            p_long long buf = &buf;
            sub_1000A9538((uint64_t)self, v89, v88, v84);
          }
          v55 = NPGetInternalQueue();
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_1000AFEB0;
          v70[3] = &unk_100106FA0;
          v70[4] = self;
          id v71 = v54;
          id v72 = v22;
          id v80 = &buf;
          BOOL v83 = v60;
          int v82 = v33;
          id v73 = v64;
          id v74 = v68;
          id v79 = v23;
          id v75 = v63;
          id v76 = v62;
          id v77 = v34;
          id v78 = v21;
          v81 = &v130;
          id v56 = v34;
          id v57 = v54;
          dispatch_group_notify(v53, v55, v70);

          _Block_object_dispose(&v130, 8);
LABEL_51:
          _Block_object_dispose(&buf, 8);

          goto LABEL_52;
        }
        unsigned int v37 = nplog_obj();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Long-lived token must be cacheable", (uint8_t *)&buf, 2u);
        }
LABEL_58:

        (*((void (**)(id, void, void, void, uint64_t, void))v23 + 2))(v23, 0, 0, 0, 1004, 0);
        goto LABEL_52;
      }
      if (sub_1000AD668((uint64_t)self, v66, v21, v67, a13))
      {
        if (sub_100046C30((uint64_t)NSPPrivateAccessTokenCache, v21, v67)) {
          goto LABEL_7;
        }
        v36 = nplog_obj();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Not allowed to fetch private access token, rate limited", (uint8_t *)&buf, 2u);
        }

        (*((void (**)(id, void, void, void, uint64_t, void))v23 + 2))(v23, 0, 0, 0, 1009, 0);
      }
      else
      {
        v38 = nplog_obj();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Not allowed to fetch private access token for origin", (uint8_t *)&buf, 2u);
        }

        (*((void (**)(id, void, void, void, uint64_t, void))v23 + 2))(v23, 0, 0, 0, 1001, 0);
      }
    }
    else
    {
      uint64_t v35 = nplog_obj();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Cannot fetch private access token, no attester URLs", (uint8_t *)&buf, 2u);
      }

      (*((void (**)(id, void, void, void, uint64_t, void))v23 + 2))(v23, 0, 0, 0, 1005, 0);
    }
  }
  else
  {
    v58 = nplog_obj();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPPrivacyTokenManager fetchPairedPrivateAccessTokensForChallenge:overrideAttest"
                                      "er:tokenKey:originNameKey:selectedOrigin:pairedChallenge:overridePairedAttester:pa"
                                      "iredTokenKey:auditToken:bundleID:allowTools:systemTokenClient:accessToken:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_FAULT, "%s called with null completionHandler", (uint8_t *)&buf, 0xCu);
    }

    MEMORY[0x10](0, 0, 0, 0);
  }
LABEL_52:
}

- (void)copyTokenInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 setDeviceIdentityValidationCount:dword_10012331C];
    [v5 setAnisetteValidationCount:dword_100123318];
    if (self)
    {
      [v5 setRequestedTokenCount:self->_totalRequestedTokenCount];
      [v5 setUnactivatedTokenCount:self->_totalUnactivatedTokenCount];
      unint64_t totalActivatedTokenCount = self->_totalActivatedTokenCount;
    }
    else
    {
      [v5 setRequestedTokenCount:0];
      [v5 setUnactivatedTokenCount:0];
      unint64_t totalActivatedTokenCount = 0;
    }
    [v5 setActivatedTokenCount:totalActivatedTokenCount];
  }
  else
  {
    v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[NSPPrivacyTokenManager copyTokenInfo:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s called with null proxyInfo", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)getTokenServerIPWithInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void (**)(void, void))v7;
  if (v6)
  {
    if (self && self->_tokenEndpointResolver)
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    else
    {
      uint64_t v9 = [(NSPPrivacyTokenManager *)self tokenFetchURL];
      v10 = +[NSURL URLWithString:v9];

      if (v10)
      {
        v11 = [v10 host];
        nw_endpoint_t host = nw_endpoint_create_host((const char *)[v11 UTF8String], "443");
        v13 = nw_parameters_create();
        v14 = [v6 cInterface];
        nw_parameters_require_interface(v13, v14);

        v15 = (void *)nw_resolver_create_with_endpoint();
        id v16 = v15;
        if (self)
        {
          objc_storeStrong((id *)&self->_tokenEndpointResolver, v15);

          objc_initWeak((id *)location, self);
          tokenEndpointResolver = self->_tokenEndpointResolver;
        }
        else
        {

          tokenEndpointResolver = 0;
          *(void *)location = 0;
        }
        v18 = tokenEndpointResolver;
        v19 = NPGetInternalQueue();
        objc_copyWeak(&v23, (id *)location);
        id v22 = v8;
        nw_resolver_set_update_handler();

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)location);
      }
      else
      {
        id v21 = nplog_obj();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)location = 136315138;
          *(void *)&location[4] = "-[NSPPrivacyTokenManager getTokenServerIPWithInterface:completionHandler:]";
          _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%s called with null url", location, 0xCu);
        }

        v8[2](v8, 0);
      }
    }
  }
  else
  {
    v20 = nplog_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136315138;
      *(void *)&location[4] = "-[NSPPrivacyTokenManager getTokenServerIPWithInterface:completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null interface", location, 0xCu);
    }

    v8[2](v8, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenEndpointResolver, 0);
  objc_storeStrong((id *)&self->_trueClientIPAddress, 0);
  objc_storeStrong((id *)&self->_waitingQueuesForIssuers, 0);
  objc_storeStrong((id *)&self->_retryIntervalsForIssuers, 0);
  objc_storeStrong((id *)&self->_accessTokenBlockedIssuers, 0);
  objc_storeStrong((id *)&self->_accessTokenTypes, 0);
  objc_storeStrong((id *)&self->_accessTokenURL, 0);

  objc_storeStrong((id *)&self->_tokenFetchURL, 0);
}

@end