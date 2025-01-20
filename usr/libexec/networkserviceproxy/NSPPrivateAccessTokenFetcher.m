@interface NSPPrivateAccessTokenFetcher
+ (BOOL)checkOriginAllowedAsThirdParty:(id)a3;
+ (void)fetchAuxiliaryAuthenticationDataFromCacheForType:(unint64_t)a3 label:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6;
+ (void)saveAuxiliaryAuthenticationDataToCache:(id)a3 type:(unint64_t)a4 forLabel:(id)a5 cacheKey:(id)a6;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)systemClient;
- (NSDictionary)customAttesterHeaders;
- (NSPPrivateAccessTokenFetcher)initWithChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5;
- (NSString)auxiliaryAuthenticationCacheKey;
- (NSString)bundleID;
- (NSString)selectedOrigin;
- (NSURL)customAttester;
- (id)initForKnownIssuerWithChallenge:(id)a3;
- (id)initForKnownIssuerWithLongLivedTokenChallenge:(id)a3 oneTimeTokenChallenge:(id)a4;
- (void)addSecondaryChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5;
- (void)fetchLinkedTokenPairWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchTokenPairWithQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchTokenWithQueue:(id)a3 completionHandler:(id)a4;
- (void)generateTokenRequestWithQueue:(id)a3 completionHandler:(id)a4;
- (void)handleTokenResponse:(id)a3 withQueue:(id)a4 completionHandler:(id)a5;
- (void)saveTokenToCache:(id)a3;
- (void)setAuditToken:(id *)a3;
- (void)setAuxiliaryAuthenticationCacheKey:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCustomAttester:(id)a3 headers:(id)a4;
- (void)setSelectedOrigin:(id)a3;
- (void)setSystemClient:(BOOL)a3;
@end

@implementation NSPPrivateAccessTokenFetcher

- (NSPPrivateAccessTokenFetcher)initWithChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v17 = nplog_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
LABEL_9:

LABEL_12:
      v13 = 0;
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v21 = "-[NSPPrivateAccessTokenFetcher initWithChallenge:tokenKey:originNameKey:]";
    v18 = "%s called with null challenge";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v9)
  {
    v17 = nplog_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v21 = "-[NSPPrivateAccessTokenFetcher initWithChallenge:tokenKey:originNameKey:]";
    v18 = "%s called with null tokenKey";
    goto LABEL_14;
  }
  v19.receiver = self;
  v19.super_class = (Class)NSPPrivateAccessTokenFetcher;
  v11 = [(NSPPrivateAccessTokenFetcher *)&v19 init];
  if (!v11)
  {
    nplog_obj();
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    goto LABEL_12;
  }
  v13 = v11;
  objc_setProperty_atomic(v11, v12, v8, 56);
  objc_setProperty_atomic(v13, v14, v9, 72);
  objc_setProperty_atomic(v13, v15, v10, 80);
LABEL_5:

  return v13;
}

- (id)initForKnownIssuerWithChallenge:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithChallenge:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null challenge", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v10.receiver = self;
  v10.super_class = (Class)NSPPrivateAccessTokenFetcher;
  v5 = [(NSPPrivateAccessTokenFetcher *)&v10 init];
  if (!v5)
  {
    nplog_obj();
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
LABEL_10:

    v7 = 0;
    goto LABEL_4;
  }
  v7 = v5;
  objc_setProperty_atomic(v5, v6, v4, 56);
LABEL_4:

  return v7;
}

- (id)initForKnownIssuerWithLongLivedTokenChallenge:(id)a3 oneTimeTokenChallenge:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    SEL v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
LABEL_9:

LABEL_12:
      v11 = 0;
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v18 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithLongLivedTokenChallenge:oneTimeTokenChallenge:]";
    SEL v15 = "%s called with null longLivedTokenChallenge";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v7)
  {
    SEL v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v18 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithLongLivedTokenChallenge:oneTimeTokenChallenge:]";
    SEL v15 = "%s called with null oneTimeTokenChallenge";
    goto LABEL_14;
  }
  v16.receiver = self;
  v16.super_class = (Class)NSPPrivateAccessTokenFetcher;
  id v9 = [(NSPPrivateAccessTokenFetcher *)&v16 init];
  if (!v9)
  {
    nplog_obj();
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    goto LABEL_12;
  }
  v11 = v9;
  objc_setProperty_atomic(v9, v10, v6, 56);
  objc_setProperty_atomic(v11, v12, v8, 64);
LABEL_5:

  return v11;
}

- (void)addSecondaryChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v17 = [[NSPPrivateAccessTokenFetcher alloc] initWithChallenge:v10 tokenKey:v9 originNameKey:v8];

  SEL v12 = v17;
  if (v17)
  {
    if (self)
    {
      if (!objc_getProperty(self, v11, 88, 1))
      {
        id v14 = objc_alloc_init((Class)NSMutableArray);
        objc_setProperty_atomic(self, v15, v14, 88);
      }
      id Property = objc_getProperty(self, v13, 88, 1);
    }
    else
    {

      id Property = 0;
    }
    [Property addObject:v17];
    SEL v12 = v17;
  }
}

- (void)setCustomAttester:(id)a3 headers:(id)a4
{
  if (self)
  {
    id newValue = a4;
    objc_setProperty_atomic(self, v6, a3, 40);
    objc_setProperty_atomic(self, v7, newValue, 48);
  }
}

- (void)fetchTokenWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v10 = nplog_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    objc_super v16 = "-[NSPPrivateAccessTokenFetcher fetchTokenWithQueue:completionHandler:]";
    v11 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, v11, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v7)
  {
    id v10 = nplog_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    objc_super v16 = "-[NSPPrivateAccessTokenFetcher fetchTokenWithQueue:completionHandler:]";
    v11 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v9 = getServerConnection();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B9918;
  v12[3] = &unk_1001071B8;
  v13 = v6;
  id v14 = v8;
  [v9 fetchPrivateAccessTokenWithFetcher:self completionHandler:v12];

  id v10 = v13;
LABEL_4:
}

- (void)fetchTokenPairWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v10 = nplog_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    objc_super v16 = "-[NSPPrivateAccessTokenFetcher fetchTokenPairWithQueue:completionHandler:]";
    v11 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, v11, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v7)
  {
    id v10 = nplog_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    objc_super v16 = "-[NSPPrivateAccessTokenFetcher fetchTokenPairWithQueue:completionHandler:]";
    v11 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v9 = getServerConnection();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B9C28;
  v12[3] = &unk_100107208;
  v13 = v6;
  id v14 = v8;
  [v9 fetchPrivateAccessTokenPairWithFetcher:self completionHandler:v12];

  id v10 = v13;
LABEL_4:
}

- (void)fetchLinkedTokenPairWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v10 = nplog_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    objc_super v16 = "-[NSPPrivateAccessTokenFetcher fetchLinkedTokenPairWithQueue:completionHandler:]";
    v11 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, v11, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v7)
  {
    id v10 = nplog_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    objc_super v16 = "-[NSPPrivateAccessTokenFetcher fetchLinkedTokenPairWithQueue:completionHandler:]";
    v11 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v9 = getServerConnection();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B9F60;
  v12[3] = &unk_100107208;
  v13 = v6;
  id v14 = v8;
  [v9 fetchPrivateAccessTokenPairWithFetcher:self completionHandler:v12];

  id v10 = v13;
LABEL_4:
}

+ (BOOL)checkOriginAllowedAsThirdParty:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = getServerConnection();
    unsigned __int8 v5 = [v4 checkOriginAllowedAsThirdParty:v3];
  }
  else
  {
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      id v9 = "+[NSPPrivateAccessTokenFetcher checkOriginAllowedAsThirdParty:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s called with null origin", (uint8_t *)&v8, 0xCu);
    }

    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)generateTokenRequestWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self)
  {
    if (objc_getProperty(self, v7, 96, 1))
    {
      id v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Cannot fetch multiple local tokens with a single token fetcher", buf, 2u);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000BB484;
      block[3] = &unk_100106908;
      v20 = v8;
      dispatch_async(v6, block);
      v11 = v20;
      goto LABEL_6;
    }
    if (objc_getProperty(self, v9, 72, 1))
    {
      id Property = objc_getProperty(self, v12, 72, 1);
      sub_1000BAAE8(self, Property, v6, v8);
      goto LABEL_9;
    }
  }
  id v14 = getServerConnection();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000BB564;
  v15[3] = &unk_100107280;
  objc_super v16 = v6;
  v17 = self;
  id v18 = v8;
  [v14 fetchKnownPrivateAccessTokenKeyWithFetcher:self completionHandler:v15];

  v11 = v16;
LABEL_6:

LABEL_9:
}

- (void)handleTokenResponse:(id)a3 withQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (v8
    && self
    && (id v12 = objc_getProperty(self, v10, 96, 1)) != 0
    && (id v14 = v12, Property = objc_getProperty(self, v13, 104, 1), v14, Property))
  {
    id v17 = objc_getProperty(self, v16, 104, 1);
    id v19 = objc_getProperty(self, v18, 112, 1);
    id v21 = objc_getProperty(self, v20, 96, 1);
    id v23 = objc_getProperty(self, v22, 120, 1);
    v24 = [NSPPrivateAccessTokenChallenge alloc];
    v26 = [(NSPPrivateAccessTokenChallenge *)v24 initWithData:objc_getProperty(self, v25, 56, 1)];
    uint64_t v27 = sub_1000B6B80((uint64_t)v17, v8);

    id v57 = 0;
    v48 = (void *)v27;
    v28 = [v21 activateTokenWithServerResponse:v27 error:&v57];

    id v29 = v57;
    v30 = v29;
    if (v28)
    {
      id v46 = v29;
      v31 = [NSPPrivateAccessTokenResponse alloc];
      id v47 = v23;
      v32 = [v23 key];
      v33 = [v28 signature];
      v34 = sub_1000B5D80(&v31->super, v26, v19, v32, v33);

      v35 = nplog_obj();
      v36 = v35;
      if (v34)
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Generated token from response", buf, 2u);
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000BBD60;
        block[3] = &unk_100107258;
        id v50 = objc_getProperty(v34, v37, 8, 1);
        id v51 = v11;
        id v38 = v50;
        dispatch_async(v9, block);
        objc_setProperty_atomic(self, v39, 0, 96);
        objc_setProperty_atomic(self, v40, 0, 104);
        objc_setProperty_atomic(self, v41, 0, 112);
        objc_setProperty_atomic(self, v42, 0, 120);
      }
      else
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to create token structure, cannot handle token response", buf, 2u);
        }

        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_1000BBC80;
        v52[3] = &unk_100106908;
        id v53 = v11;
        dispatch_async(v9, v52);
        id v38 = v53;
      }
      id v23 = v47;

      v45 = v46;
    }
    else
    {
      v44 = nplog_obj();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failted to activate waiting token, cannot handle token response", buf, 2u);
      }

      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1000BBC68;
      v54[3] = &unk_100107258;
      v56 = v11;
      id v55 = v30;
      dispatch_async(v9, v54);

      v34 = v56;
      v45 = v30;
    }
  }
  else
  {
    v43 = nplog_obj();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Invalid state, cannot handle token response", buf, 2u);
    }

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_1000BBB88;
    v58[3] = &unk_100106908;
    id v59 = v11;
    dispatch_async(v9, v58);
    id v19 = v59;
  }
}

- (void)saveTokenToCache:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = getServerConnection();
    [v5 addToken:v4 toCacheForFetcher:self];
  }
  else
  {
    id v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315138;
      id v8 = "-[NSPPrivateAccessTokenFetcher saveTokenToCache:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%s called with null token", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (void)saveAuxiliaryAuthenticationDataToCache:(id)a3 type:(unint64_t)a4 forLabel:(id)a5 cacheKey:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (!v9)
  {
    id v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136315138;
      id v17 = "+[NSPPrivateAccessTokenFetcher saveAuxiliaryAuthenticationDataToCache:type:forLabel:cacheKey:]";
      SEL v15 = "%s called with null auxiliaryData";
      goto LABEL_13;
    }
LABEL_11:

    goto LABEL_5;
  }
  if (!v10)
  {
    id v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136315138;
      id v17 = "+[NSPPrivateAccessTokenFetcher saveAuxiliaryAuthenticationDataToCache:type:forLabel:cacheKey:]";
      SEL v15 = "%s called with null label";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v11)
  {
    id v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    int v16 = 136315138;
    id v17 = "+[NSPPrivateAccessTokenFetcher saveAuxiliaryAuthenticationDataToCache:type:forLabel:cacheKey:]";
    SEL v15 = "%s called with null cacheKey";
LABEL_13:
    _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_11;
  }
  v13 = getServerConnection();
  [v13 addAuxiliaryAuthenticationData:v9 type:a4 label:v10 cacheKey:v12];

LABEL_5:
}

+ (void)fetchAuxiliaryAuthenticationDataFromCacheForType:(unint64_t)a3 label:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!v9)
  {
    v13 = nplog_obj();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      goto LABEL_4;
    }
    int v15 = 136315138;
    int v16 = "+[NSPPrivateAccessTokenFetcher fetchAuxiliaryAuthenticationDataFromCacheForType:label:cacheKey:completionHandler:]";
    id v14 = "%s called with null label";
LABEL_10:
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v15, 0xCu);
    goto LABEL_8;
  }
  if (!v10)
  {
    v13 = nplog_obj();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v15 = 136315138;
    int v16 = "+[NSPPrivateAccessTokenFetcher fetchAuxiliaryAuthenticationDataFromCacheForType:label:cacheKey:completionHandler:]";
    id v14 = "%s called with null cacheKey";
    goto LABEL_10;
  }
  id v12 = getServerConnection();
  [v12 fetchAuxiliaryAuthenticationDataFromCacheForType:a3 label:v9 cacheKey:v10 completionHandler:v11];

LABEL_4:
}

- (BOOL)systemClient
{
  return self->_systemClient;
}

- (void)setSystemClient:(BOOL)a3
{
  self->_systemClient = a3;
}

- (NSString)selectedOrigin
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSelectedOrigin:(id)a3
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (void)setAuditToken:(id *)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSString)auxiliaryAuthenticationCacheKey
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAuxiliaryAuthenticationCacheKey:(id)a3
{
}

- (NSURL)customAttester
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)customAttesterHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingTokenKey, 0);
  objc_storeStrong((id *)&self->_waitingClientNonce, 0);
  objc_storeStrong((id *)&self->_waitingTokenRequest, 0);
  objc_storeStrong((id *)&self->_waitingToken, 0);
  objc_storeStrong((id *)&self->_secondaryFetchers, 0);
  objc_storeStrong((id *)&self->_originNameKey, 0);
  objc_storeStrong((id *)&self->_tokenKey, 0);
  objc_storeStrong((id *)&self->_pairedChallengeData, 0);
  objc_storeStrong((id *)&self->_challengeData, 0);
  objc_storeStrong((id *)&self->_customAttesterHeaders, 0);
  objc_storeStrong((id *)&self->_customAttester, 0);
  objc_storeStrong((id *)&self->_auxiliaryAuthenticationCacheKey, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_selectedOrigin, 0);
}

@end