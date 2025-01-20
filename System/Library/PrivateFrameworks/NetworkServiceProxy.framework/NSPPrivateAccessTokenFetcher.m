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
- (void)generateTokenRequestForKey:(void *)a3 withQueue:(void *)a4 completionHandler:;
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
    _os_log_fault_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
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
      _os_log_fault_impl(&dword_1A0FEE000, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
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
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithChallenge:]";
      _os_log_fault_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_FAULT, "%s called with null challenge", buf, 0xCu);
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
      _os_log_fault_impl(&dword_1A0FEE000, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
    _os_log_fault_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
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
      _os_log_fault_impl(&dword_1A0FEE000, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
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
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
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
    _os_log_fault_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_FAULT, v11, buf, 0xCu);
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
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__NSPPrivateAccessTokenFetcher_fetchTokenWithQueue_completionHandler___block_invoke;
  v12[3] = &unk_1E5A3BA60;
  uint64_t v13 = v6;
  id v14 = v8;
  [v9 fetchPrivateAccessTokenWithFetcher:self completionHandler:v12];

  id v10 = v13;
LABEL_4:
}

void __70__NSPPrivateAccessTokenFetcher_fetchTokenWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_error_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch private access token: %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__NSPPrivateAccessTokenFetcher_fetchTokenWithQueue_completionHandler___block_invoke_162;
  block[3] = &unk_1E5A3B830;
  id v8 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __70__NSPPrivateAccessTokenFetcher_fetchTokenWithQueue_completionHandler___block_invoke_162(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchTokenPairWithQueue:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
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
    id v11 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_FAULT, v11, buf, 0xCu);
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
    id v11 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v9 = getServerConnection();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__NSPPrivateAccessTokenFetcher_fetchTokenPairWithQueue_completionHandler___block_invoke;
  v12[3] = &unk_1E5A3BA88;
  id v13 = v6;
  id v14 = v8;
  [v9 fetchPrivateAccessTokenPairWithFetcher:self completionHandler:v12];

  id v10 = v13;
LABEL_4:
}

void __74__NSPPrivateAccessTokenFetcher_fetchTokenPairWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v10;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch private access token pair: %@", buf, 0xCu);
    }
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__NSPPrivateAccessTokenFetcher_fetchTokenPairWithQueue_completionHandler___block_invoke_164;
  v17[3] = &unk_1E5A3B998;
  SEL v12 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v21 = v13;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v12, v17);
}

uint64_t __74__NSPPrivateAccessTokenFetcher_fetchTokenPairWithQueue_completionHandler___block_invoke_164(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)fetchLinkedTokenPairWithQueue:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
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
    id v16 = "-[NSPPrivateAccessTokenFetcher fetchLinkedTokenPairWithQueue:completionHandler:]";
    id v11 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_FAULT, v11, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v7)
  {
    id v10 = nplog_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    id v16 = "-[NSPPrivateAccessTokenFetcher fetchLinkedTokenPairWithQueue:completionHandler:]";
    id v11 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  id v9 = getServerConnection();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__NSPPrivateAccessTokenFetcher_fetchLinkedTokenPairWithQueue_completionHandler___block_invoke;
  v12[3] = &unk_1E5A3BA88;
  id v13 = v6;
  id v14 = v8;
  [v9 fetchPrivateAccessTokenPairWithFetcher:self completionHandler:v12];

  id v10 = v13;
LABEL_4:
}

void __80__NSPPrivateAccessTokenFetcher_fetchLinkedTokenPairWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    id v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v12;
      _os_log_error_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch linked private access token pair: %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__NSPPrivateAccessTokenFetcher_fetchLinkedTokenPairWithQueue_completionHandler___block_invoke_166;
  block[3] = &unk_1E5A3B9E8;
  id v14 = *(NSObject **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v24 = v12;
  id v25 = v15;
  id v21 = v9;
  id v22 = v10;
  id v23 = v11;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = v9;
  dispatch_async(v14, block);
}

uint64_t __80__NSPPrivateAccessTokenFetcher_fetchLinkedTokenPairWithQueue_completionHandler___block_invoke_166(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

+ (BOOL)checkOriginAllowedAsThirdParty:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = getServerConnection();
    char v5 = [v4 checkOriginAllowedAsThirdParty:v3];
  }
  else
  {
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      id v9 = "+[NSPPrivateAccessTokenFetcher checkOriginAllowedAsThirdParty:]";
      _os_log_fault_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_FAULT, "%s called with null origin", (uint8_t *)&v8, 0xCu);
    }

    char v5 = 0;
  }

  return v5;
}

- (void)generateTokenRequestForKey:(void *)a3 withQueue:(void *)a4 completionHandler:
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = a2;
    uint64_t v10 = objc_alloc_init(NSPPrivacyProxyTokenKey);
    [(NSPPrivacyProxyTokenKey *)v10 setKey:v9];

    id v11 = [NSPPrivateAccessTokenChallenge alloc];
    id v13 = [(NSPPrivateAccessTokenChallenge *)v11 initWithData:objc_getProperty(a1, v12, 56, 1)];
    if (![(NSPPrivateAccessTokenChallenge *)v13 isSupportedTokenType])
    {
      id v24 = nplog_obj();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LOWORD(bytes[0]) = 0;
        _os_log_error_impl(&dword_1A0FEE000, v24, OS_LOG_TYPE_ERROR, "Unsupported token type, cannot generate token request", (uint8_t *)bytes, 2u);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __87__NSPPrivateAccessTokenFetcher_generateTokenRequestForKey_withQueue_completionHandler___block_invoke;
      block[3] = &unk_1E5A3BAB0;
      id v97 = v8;
      dispatch_async(v7, block);
      id v23 = v97;
LABEL_58:

      goto LABEL_59;
    }
    self = a1;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v79 = v13;
    id v15 = v13;
    id v16 = v10;
    id v82 = v14;
    self;
    id v17 = objc_alloc(MEMORY[0x1E4F5E530]);
    id v18 = [(NSPPrivacyProxyTokenKey *)v16 key];
    *(void *)buf = 0;
    id v19 = (void *)[v17 initWithPublicKey:v18 error:buf];
    id v20 = *(id *)buf;

    if (v20)
    {
      id v21 = nplog_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        [(NSPPrivateAccessTokenChallenge *)v15 issuerName];
        v69 = v68 = v19;
        LODWORD(bytes[0]) = 138412546;
        *(void *)((char *)bytes + 4) = v20;
        WORD6(bytes[0]) = 2112;
        *(void *)((char *)bytes + 14) = v69;
        _os_log_error_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_ERROR, "RSABSSATokenBlinder initWithPublicKey failed with error %@ for %@", (uint8_t *)bytes, 0x16u);

        id v19 = v68;
      }
LABEL_6:
      id v22 = 0;
      id v23 = v82;
LABEL_34:

      v80 = v22;
      if ([v22 count])
      {
        v77 = v7;
        v78 = v10;
        v75 = v8;
        id v40 = objc_getProperty(self, v39, 80, 1);
        v41 = [self selectedOrigin];
        v86 = v15;
        v88 = v16;
        id v84 = v40;
        id v83 = v41;
        id v42 = v22;
        self;
        id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        *(_OWORD *)md = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id v44 = v42;
        uint64_t v45 = [v44 countByEnumeratingWithState:md objects:bytes count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v102;
          while (2)
          {
            for (uint64_t i = 0; i != v46; ++i)
            {
              if (*(void *)v102 != v47) {
                objc_enumerationMutation(v44);
              }
              v49 = *(void **)(*(void *)&md[8] + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v50 = v49;
                v51 = [NSPPrivateAccessTokenRequest alloc];
                v52 = [(NSPPrivacyProxyTokenKey *)v88 key];
                v53 = [v50 blindedMessage];
                id v54 = -[NSPPrivateAccessTokenRequest initWithChallenge:tokenKey:originNameKey:selectedOrigin:blindedMessage:]((uint64_t)v51, v86, v52, v84, v83, v53);

                if (!v54)
                {
                  v67 = nplog_obj();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    *(void *)&uint8_t buf[4] = "+[NSPPrivateAccessTokenFetcher createTokenRequestsForChallenge:tokenKey:originN"
                                         "ameKey:selectedOrigin:waitingTokens:]";
                    _os_log_fault_impl(&dword_1A0FEE000, v67, OS_LOG_TYPE_FAULT, "%s called with null tokenRequest", buf, 0xCu);
                  }

                  id v55 = 0;
                  goto LABEL_46;
                }
                [v43 addObject:v54];
              }
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:md objects:bytes count:16];
            if (v46) {
              continue;
            }
            break;
          }
        }

        id v55 = v43;
LABEL_46:
        id v13 = v79;
        id v23 = v82;

        id v8 = v75;
        id v7 = v77;
        if ([v55 count])
        {
          v56 = [v44 firstObject];
          objc_setProperty_atomic(self, v57, v56, 96);

          v58 = [v55 firstObject];
          objc_setProperty_atomic(self, v59, v58, 104);

          v60 = [v82 firstObject];
          objc_setProperty_atomic(self, v61, v60, 112);

          objc_setProperty_atomic(self, v62, v88, 120);
          v63 = nplog_obj();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            LOWORD(bytes[0]) = 0;
            _os_log_impl(&dword_1A0FEE000, v63, OS_LOG_TYPE_INFO, "Generated token request", (uint8_t *)bytes, 2u);
          }

          v89[0] = MEMORY[0x1E4F143A8];
          v89[1] = 3221225472;
          v89[2] = __87__NSPPrivateAccessTokenFetcher_generateTokenRequestForKey_withQueue_completionHandler___block_invoke_187;
          v89[3] = &unk_1E5A3B790;
          v64 = &v91;
          id v91 = v75;
          id v90 = v55;
          dispatch_async(v77, v89);

          uint64_t v10 = v78;
        }
        else
        {
          v66 = nplog_obj();
          uint64_t v10 = v78;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            LOWORD(bytes[0]) = 0;
            _os_log_error_impl(&dword_1A0FEE000, v66, OS_LOG_TYPE_ERROR, "Failed to generate token request", (uint8_t *)bytes, 2u);
          }

          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __87__NSPPrivateAccessTokenFetcher_generateTokenRequestForKey_withQueue_completionHandler___block_invoke_183;
          v92[3] = &unk_1E5A3BAB0;
          v64 = &v93;
          id v93 = v75;
          dispatch_async(v77, v92);
        }
      }
      else
      {
        v65 = nplog_obj();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          LOWORD(bytes[0]) = 0;
          _os_log_error_impl(&dword_1A0FEE000, v65, OS_LOG_TYPE_ERROR, "Failed to generate waiting tokens, cannot generate token request", (uint8_t *)bytes, 2u);
        }

        v94[0] = MEMORY[0x1E4F143A8];
        v94[1] = 3221225472;
        v94[2] = __87__NSPPrivateAccessTokenFetcher_generateTokenRequestForKey_withQueue_completionHandler___block_invoke_179;
        v94[3] = &unk_1E5A3BAB0;
        id v95 = v8;
        dispatch_async(v7, v94);
        id v55 = v95;
        id v13 = v79;
      }

      goto LABEL_58;
    }
    if (!v19)
    {
      id v21 = nplog_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        LODWORD(bytes[0]) = 136315138;
        *(void *)((char *)bytes + 4) = "+[NSPPrivateAccessTokenFetcher createWaitingTokensForChallenge:tokenKey:pairedT"
                                         "oken:clientNonces:clientSalts:tokenCount:]";
        _os_log_fault_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_FAULT, "%s called with null tokenBlinder", (uint8_t *)bytes, 0xCu);
      }
      goto LABEL_6;
    }
    v87 = v19;
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self;
    memset(bytes, 0, 32);
    if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x20uLL, bytes) < 0)
    {
      v35 = nplog_obj();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)md = 0;
        _os_log_error_impl(&dword_1A0FEE000, v35, OS_LOG_TYPE_ERROR, "generate tokens: SecRandomCopyBytes failed", md, 2u);
      }
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F1C9B8] dataWithBytes:bytes length:32];
      if (v25)
      {
        v26 = (void *)v25;
        id v74 = v8;
        v76 = v7;
        id v27 = [(NSPPrivacyProxyTokenKey *)v16 key];
        v85 = v15;
        uint64_t v28 = v15;
        id v29 = v26;
        id v30 = v27;
        self;
        if (v28)
        {
          if ([v29 length] == 32)
          {
            if (v30)
            {
              id v31 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
              __int16 v98 = __rev16([(NSPPrivateAccessTokenChallenge *)v28 tokenType]);
              [v31 appendBytes:&v98 length:2];
              [v31 appendData:v29];
              memset(bytes, 0, 32);
              v32 = [(NSPPrivateAccessTokenChallenge *)v28 challengeData];
              CC_SHA256((const void *)[v32 bytes], objc_msgSend(v32, "length"), (unsigned __int8 *)bytes);
              [v31 appendBytes:bytes length:32];
              *(_OWORD *)md = 0u;
              long long v102 = 0u;
              CC_SHA256((const void *)[v30 bytes], objc_msgSend(v30, "length"), md);
              [v31 appendBytes:md length:32];

              goto LABEL_17;
            }
            v70 = nplog_obj();
            if (!os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
            {
LABEL_73:

              id v31 = 0;
LABEL_17:

              if (!v31)
              {
                v72 = nplog_obj();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
                {
                  LODWORD(bytes[0]) = 136315138;
                  *(void *)((char *)bytes + 4) = "+[NSPPrivateAccessTokenFetcher createWaitingTokensForChallenge:tokenK"
                                                   "ey:pairedToken:clientNonces:clientSalts:tokenCount:]";
                  _os_log_fault_impl(&dword_1A0FEE000, v72, OS_LOG_TYPE_FAULT, "%s called with null messageToBlind", (uint8_t *)bytes, 0xCu);
                }

                id v22 = 0;
                id v8 = v74;
                id v7 = v76;
                id v23 = v82;
                id v15 = v85;
                goto LABEL_33;
              }
              [v21 addObject:v31];
              [v82 addObject:v29];

              id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              if (v21)
              {
                v34 = [v21 objectAtIndexedSubscript:0];
              }
              else
              {
                v34 = 0;
              }
              id v15 = v85;
              *(void *)md = 0;
              v37 = [v87 tokenWaitingActivationWithContent:v34 error:md];
              v38 = *(id *)md;
              if (v21) {

              }
              if (v37)
              {
                [v33 addObject:v37];

                if ([v33 count])
                {
                  id v22 = v33;
                  id v8 = v74;
                  id v7 = v76;
                  id v23 = v82;
LABEL_32:

LABEL_33:
                  id v19 = v87;
                  goto LABEL_34;
                }
                v38 = nplog_obj();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
                {
                  LODWORD(bytes[0]) = 136315138;
                  *(void *)((char *)bytes + 4) = "+[NSPPrivateAccessTokenFetcher createWaitingTokensForChallenge:tokenK"
                                                   "ey:pairedToken:clientNonces:clientSalts:tokenCount:]";
                  _os_log_fault_impl(&dword_1A0FEE000, v38, OS_LOG_TYPE_FAULT, "%s called with null (waitingTokens.count > 0)", (uint8_t *)bytes, 0xCu);
                }
              }
              else
              {
                v73 = nplog_obj();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
                {
                  LODWORD(bytes[0]) = 136315138;
                  *(void *)((char *)bytes + 4) = "+[NSPPrivateAccessTokenFetcher createWaitingTokensForChallenge:tokenK"
                                                   "ey:pairedToken:clientNonces:clientSalts:tokenCount:]";
                  _os_log_fault_impl(&dword_1A0FEE000, v73, OS_LOG_TYPE_FAULT, "%s called with null waitingActivation", (uint8_t *)bytes, 0xCu);
                }
              }
              id v22 = 0;
              id v8 = v74;
              id v7 = v76;
              id v23 = v82;
              id v15 = v85;
              goto LABEL_32;
            }
            LODWORD(bytes[0]) = 136315138;
            *(void *)((char *)bytes + 4) = "+[NSPPrivateAccessTokenRequest messageToBlindForChallenge:clientNonce:tokenKey:]";
            v71 = "%s called with null tokenKey";
          }
          else
          {
            v70 = nplog_obj();
            if (!os_log_type_enabled(v70, OS_LOG_TYPE_FAULT)) {
              goto LABEL_73;
            }
            LODWORD(bytes[0]) = 136315138;
            *(void *)((char *)bytes + 4) = "+[NSPPrivateAccessTokenRequest messageToBlindForChallenge:clientNonce:tokenKey:]";
            v71 = "%s called with null (clientNonce.length == 32)";
          }
        }
        else
        {
          v70 = nplog_obj();
          if (!os_log_type_enabled(v70, OS_LOG_TYPE_FAULT)) {
            goto LABEL_73;
          }
          LODWORD(bytes[0]) = 136315138;
          *(void *)((char *)bytes + 4) = "+[NSPPrivateAccessTokenRequest messageToBlindForChallenge:clientNonce:tokenKey:]";
          v71 = "%s called with null challenge";
        }
        _os_log_fault_impl(&dword_1A0FEE000, v70, OS_LOG_TYPE_FAULT, v71, (uint8_t *)bytes, 0xCu);
        goto LABEL_73;
      }
    }
    v36 = nplog_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      LODWORD(bytes[0]) = 136315138;
      *(void *)((char *)bytes + 4) = "+[NSPPrivateAccessTokenFetcher createWaitingTokensForChallenge:tokenKey:pairedTok"
                                       "en:clientNonces:clientSalts:tokenCount:]";
      _os_log_fault_impl(&dword_1A0FEE000, v36, OS_LOG_TYPE_FAULT, "%s called with null clientNonce", (uint8_t *)bytes, 0xCu);
    }

    id v22 = 0;
    id v23 = v82;
    goto LABEL_33;
  }
LABEL_59:
}

void __87__NSPPrivateAccessTokenFetcher_generateTokenRequestForKey_withQueue_completionHandler___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v6[0] = @"Unsupported token type";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = (void *)[v2 initWithDomain:@"privacyProxyErrorDomain" code:1008 userInfo:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__NSPPrivateAccessTokenFetcher_generateTokenRequestForKey_withQueue_completionHandler___block_invoke_179(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v6[0] = @"Could not create waiting tokens";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = (void *)[v2 initWithDomain:@"privacyProxyErrorDomain" code:1004 userInfo:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__NSPPrivateAccessTokenFetcher_generateTokenRequestForKey_withQueue_completionHandler___block_invoke_183(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v6[0] = @"Could not create token requests";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = (void *)[v2 initWithDomain:@"privacyProxyErrorDomain" code:1004 userInfo:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__NSPPrivateAccessTokenFetcher_generateTokenRequestForKey_withQueue_completionHandler___block_invoke_187(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) firstObject];
  id v5 = v2;
  if (v2) {
    id Property = objc_getProperty(v2, v3, 24, 1);
  }
  else {
    id Property = 0;
  }
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, Property, 0);
}

- (void)generateTokenRequestWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self)
  {
    if (objc_getProperty(self, v7, 96, 1))
    {
      uint64_t v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, "Cannot fetch multiple local tokens with a single token fetcher", buf, 2u);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__NSPPrivateAccessTokenFetcher_generateTokenRequestWithQueue_completionHandler___block_invoke;
      block[3] = &unk_1E5A3BAB0;
      id v20 = v8;
      dispatch_async(v6, block);
      id v11 = v20;
      goto LABEL_6;
    }
    if (objc_getProperty(self, v9, 72, 1))
    {
      id Property = objc_getProperty(self, v12, 72, 1);
      -[NSPPrivateAccessTokenFetcher generateTokenRequestForKey:withQueue:completionHandler:](self, Property, v6, v8);
      goto LABEL_9;
    }
  }
  id v14 = getServerConnection();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__NSPPrivateAccessTokenFetcher_generateTokenRequestWithQueue_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5A3BAD8;
  id v16 = v6;
  id v17 = self;
  id v18 = v8;
  [v14 fetchKnownPrivateAccessTokenKeyWithFetcher:self completionHandler:v15];

  id v11 = v16;
LABEL_6:

LABEL_9:
}

void __80__NSPPrivateAccessTokenFetcher_generateTokenRequestWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v6[0] = @"Cannot fetch multiple local tokens with a single token fetcher";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = (void *)[v2 initWithDomain:@"privacyProxyErrorDomain" code:1004 userInfo:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__NSPPrivateAccessTokenFetcher_generateTokenRequestWithQueue_completionHandler___block_invoke_2(void **a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = a1[4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__NSPPrivateAccessTokenFetcher_generateTokenRequestWithQueue_completionHandler___block_invoke_3;
    v7[3] = &unk_1E5A3B790;
    id v9 = a1[6];
    id v8 = v5;
    dispatch_async(v6, v7);
  }
  else
  {
    -[NSPPrivateAccessTokenFetcher generateTokenRequestForKey:withQueue:completionHandler:](a1[5], a2, a1[4], a1[6]);
  }
}

uint64_t __80__NSPPrivateAccessTokenFetcher_generateTokenRequestWithQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)handleTokenResponse:(id)a3 withQueue:(id)a4 completionHandler:(id)a5
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (v8)
  {
    if (self)
    {
      id v12 = objc_getProperty(self, v10, 96, 1);
      if (v12)
      {
        id v14 = v12;
        id Property = objc_getProperty(self, v13, 104, 1);

        if (Property)
        {
          id v17 = objc_getProperty(self, v16, 104, 1);
          id v19 = objc_getProperty(self, v18, 112, 1);
          id v21 = objc_getProperty(self, v20, 96, 1);
          id v23 = objc_getProperty(self, v22, 120, 1);
          id v24 = [NSPPrivateAccessTokenChallenge alloc];
          v120 = [(NSPPrivateAccessTokenChallenge *)v24 initWithData:objc_getProperty(self, v25, 56, 1)];
          id v26 = v8;
          uint64_t v28 = v26;
          id v118 = v19;
          id v119 = v23;
          if (v17)
          {
            if (v17[5] != 3)
            {
              id v45 = v26;
              goto LABEL_36;
            }
            id v116 = v26;
            if (*((void *)v17 + 12))
            {
              v112 = v9;
              id v114 = v21;
              if (objc_getProperty(v17, v27, 104, 1))
              {
                cchpke_params_x25519_AESGCM128_HKDF_SHA256();
                size_t v29 = cchpke_params_sizeof_aead_key();
                unint64_t v30 = cchpke_params_sizeof_aead_nonce();
                uint64_t v31 = cchpke_params_sizeof_aead_tag();
                uint64_t v32 = [v28 bytes];
                unint64_t v33 = [v28 length];
                uint64_t v34 = v31;
                size_t size = v30;
                if (v29 <= v30) {
                  unint64_t v35 = v30;
                }
                else {
                  unint64_t v35 = v29;
                }
                size_t v36 = v33 - (v35 + v34);
                if (v33 > v35 + v34)
                {
                  id v102 = v8;
                  id v103 = v11;
                  uint64_t v37 = v34;
                  uint64_t v38 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v32 length:v35];
                  v107 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v32 + v35 length:v36];
                  size_t v100 = v36;
                  uint64_t v101 = v37;
                  v106 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v32 + v35 + v36 length:v37];
                  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
                  objc_msgSend(v39, "appendData:", objc_getProperty(v17, v40, 104, 1));
                  uint64_t v105 = (void *)v38;
                  [v39 appendData:v38];
                  v41 = malloc_type_calloc(1uLL, v29, 0x1AB95420uLL);
                  int v42 = cchpke_initiator_export();
                  long long v104 = v39;
                  if (v42)
                  {
                    int v43 = v42;
                    id v44 = nplog_obj();
                    id v19 = v118;
                    id v23 = v119;
                    id v9 = v112;
                    id v8 = v102;
                    id v11 = v103;
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)&uint8_t buf[4] = v43;
                      _os_log_error_impl(&dword_1A0FEE000, v44, OS_LOG_TYPE_ERROR, "Export error: %d", buf, 8u);
                    }

                    free(v41);
                    id v45 = 0;
                    uint64_t v28 = v116;
                    goto LABEL_35;
                  }
                  size_t v49 = cchpke_params_sizeof_kdf_hash();
                  id v50 = malloc_type_calloc(1uLL, v49, 0x804A6B3CuLL);
                  ccsha256_di();
                  [v39 length];
                  [v39 bytes];
                  int v51 = cchkdf_extract();
                  free(v41);
                  if (v51)
                  {
                    v52 = nplog_obj();
                    id v23 = v119;
                    id v11 = v103;
                    id v8 = v102;
                    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)&uint8_t buf[4] = v51;
                      _os_log_error_impl(&dword_1A0FEE000, v52, OS_LOG_TYPE_ERROR, "Extract error: %d", buf, 8u);
                    }

                    v53 = v50;
                  }
                  else
                  {
                    id v54 = malloc_type_calloc(1uLL, v29, 0x5A61C278uLL);
                    int v55 = cchkdf_expand();
                    id v23 = v119;
                    id v11 = v103;
                    id v8 = v102;
                    if (!v55)
                    {
                      v99 = v54;
                      v85 = malloc_type_calloc(1uLL, size, 0x344C3843uLL);
                      int v86 = cchkdf_expand();
                      free(v50);
                      if (v86)
                      {
                        v87 = nplog_obj();
                        id v19 = v118;
                        id v9 = v112;
                        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 67109120;
                          *(_DWORD *)&uint8_t buf[4] = v86;
                          _os_log_error_impl(&dword_1A0FEE000, v87, OS_LOG_TYPE_ERROR, "Nonce expand error: %d", buf, 8u);
                        }

                        free(v99);
                        free(v85);
                        id v45 = 0;
                        uint64_t v28 = v116;
                        goto LABEL_35;
                      }
                      v88 = malloc_type_calloc(1uLL, v100, 0x84013ED8uLL);
                      ccaes_gcm_decrypt_mode();
                      uint64_t v89 = [v107 bytes];
                      uint64_t v98 = [v106 bytes];
                      uint64_t v97 = v89;
                      int v90 = ccgcm_one_shot();
                      free(v99);
                      free(v85);
                      if (v90)
                      {
                        id v91 = nplog_obj();
                        uint64_t v28 = v116;
                        id v9 = v112;
                        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 67109120;
                          *(_DWORD *)&uint8_t buf[4] = v90;
                          _os_log_error_impl(&dword_1A0FEE000, v91, OS_LOG_TYPE_ERROR, "Decrypt error: %d", buf, 8u);
                        }

                        free(v88);
                        id v45 = 0;
                        id v19 = v118;
                        id v23 = v119;
                        goto LABEL_35;
                      }
                      id v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", v88, v100, v97, v88, v101, v98);
                      free(v88);
                      id v19 = v118;
                      id v23 = v119;
                      goto LABEL_34;
                    }
                    int v56 = v55;
                    SEL v57 = nplog_obj();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)&uint8_t buf[4] = v56;
                      _os_log_error_impl(&dword_1A0FEE000, v57, OS_LOG_TYPE_ERROR, "Key expand error: %d", buf, 8u);
                    }

                    free(v50);
                    v53 = v54;
                  }
                  free(v53);
                  id v45 = 0;
                  id v19 = v118;
LABEL_34:
                  uint64_t v28 = v116;
                  id v9 = v112;
LABEL_35:

                  id v21 = v114;
                  goto LABEL_36;
                }
                unint64_t v47 = v33;
                v48 = nplog_obj();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)&uint8_t buf[4] = v47;
                  _os_log_error_impl(&dword_1A0FEE000, v48, OS_LOG_TYPE_ERROR, "Invalid length %zu", buf, 0xCu);
                }

                id v45 = 0;
                id v19 = v118;
                id v23 = v119;
                id v21 = v114;
                uint64_t v28 = v116;
                id v9 = v112;
              }
              else
              {
                v96 = nplog_obj();
                if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  *(void *)&uint8_t buf[4] = "-[NSPPrivateAccessTokenRequest decryptResponse:]";
                  _os_log_fault_impl(&dword_1A0FEE000, v96, OS_LOG_TYPE_FAULT, "%s called with null self.hpkeEnc", buf, 0xCu);
                }

                id v45 = 0;
                id v21 = v114;
              }
            }
            else
            {
              id v94 = v21;
              id v95 = nplog_obj();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "-[NSPPrivateAccessTokenRequest decryptResponse:]";
                _os_log_fault_impl(&dword_1A0FEE000, v95, OS_LOG_TYPE_FAULT, "%s called with null self.hpkeContext", buf, 0xCu);
              }

              id v45 = 0;
              id v21 = v94;
              uint64_t v28 = v116;
            }
          }
          else
          {
            id v45 = 0;
          }
LABEL_36:

          id v129 = 0;
          v58 = [v21 activateTokenWithServerResponse:v45 error:&v129];

          id v117 = v129;
          if (!v58)
          {
            id v83 = nplog_obj();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1A0FEE000, v83, OS_LOG_TYPE_ERROR, "Failted to activate waiting token, cannot handle token response", buf, 2u);
            }

            v126[0] = MEMORY[0x1E4F143A8];
            v126[1] = 3221225472;
            v126[2] = __80__NSPPrivateAccessTokenFetcher_handleTokenResponse_withQueue_completionHandler___block_invoke_194;
            v126[3] = &unk_1E5A3B790;
            v128 = v11;
            id v84 = v117;
            id v127 = v117;
            dispatch_async(v9, v126);

            v73 = v128;
            goto LABEL_59;
          }
          v111 = v45;
          SEL v59 = [NSPPrivateAccessTokenResponse alloc];
          v60 = [v23 key];
          SEL v61 = [v58 signature];
          SEL v62 = v120;
          id v115 = v19;
          id v63 = v60;
          id v64 = v61;
          sizea = v62;
          v113 = v64;
          if (!v59)
          {
            v73 = 0;
            goto LABEL_48;
          }
          if (v62)
          {
            if (v115)
            {
              id v65 = v64;
              if ([v115 length] == 32)
              {
                if (v63)
                {
                  v108 = v58;
                  if (v65)
                  {
                    uint64_t v66 = [(NSPPrivateAccessTokenChallenge *)v62 challengeData];
                    if (v66)
                    {
                      v67 = (NSPPrivateAccessTokenResponse *)v66;
                      v133.receiver = v59;
                      v133.super_class = (Class)NSPPrivateAccessTokenResponse;
                      v68 = [(NSPPrivateAccessTokenFetcher *)&v133 init];
                      if (v68)
                      {
                        v69 = v68;
                        id v70 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
                        __int16 v132 = __rev16([(NSPPrivateAccessTokenChallenge *)v62 tokenType]);
                        [v70 appendBytes:&v132 length:2];
                        [v70 appendData:v115];
                        *(_OWORD *)buf = 0u;
                        long long v137 = 0u;
                        CC_SHA256((const void *)[(NSPPrivateAccessTokenResponse *)v67 bytes], [(NSPPrivateAccessTokenResponse *)v67 length], buf);
                        [v70 appendBytes:buf length:32];
                        *(_OWORD *)md = 0u;
                        long long v135 = 0u;
                        CC_SHA256((const void *)[v63 bytes], objc_msgSend(v63, "length"), md);
                        [v70 appendBytes:md length:32];
                        [v70 appendData:v113];
                        objc_setProperty_atomic(v69, v71, v70, 8);
                        p_super = v69;

                        SEL v59 = v67;
                        v73 = p_super;
                      }
                      else
                      {
                        p_super = nplog_obj();
                        if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_fault_impl(&dword_1A0FEE000, p_super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
                        }
                        v73 = 0;
                        SEL v59 = v67;
                      }
                    }
                    else
                    {
                      id v93 = nplog_obj();
                      if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 136315138;
                        *(void *)&uint8_t buf[4] = "-[NSPPrivateAccessTokenResponse initWithChallenge:clientNonce:tokenKey:blindSignature:]";
                        _os_log_fault_impl(&dword_1A0FEE000, v93, OS_LOG_TYPE_FAULT, "%s called with null challengeData", buf, 0xCu);
                      }

                      v73 = 0;
                      p_super = &v59->super;
                      SEL v59 = 0;
                    }
                  }
                  else
                  {
                    p_super = nplog_obj();
                    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      *(void *)&uint8_t buf[4] = "-[NSPPrivateAccessTokenResponse initWithChallenge:clientNonce:tokenKey:blindSignature:]";
                      _os_log_fault_impl(&dword_1A0FEE000, p_super, OS_LOG_TYPE_FAULT, "%s called with null blindSignature", buf, 0xCu);
                    }
                    v73 = 0;
                  }
                  v58 = v108;
                  goto LABEL_47;
                }
                p_super = nplog_obj();
                if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  *(void *)&uint8_t buf[4] = "-[NSPPrivateAccessTokenResponse initWithChallenge:clientNonce:tokenKey:blindSignature:]";
                  v92 = "%s called with null tokenKey";
                  goto LABEL_77;
                }
LABEL_78:
                v73 = 0;
LABEL_47:

LABEL_48:
                id v74 = nplog_obj();
                v75 = v74;
                id v23 = v119;
                id v45 = v111;
                if (v73)
                {
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1A0FEE000, v75, OS_LOG_TYPE_INFO, "Generated token from response", buf, 2u);
                  }

                  id v77 = objc_getProperty(v73, v76, 8, 1);
                  v121[0] = MEMORY[0x1E4F143A8];
                  v121[1] = 3221225472;
                  v121[2] = __80__NSPPrivateAccessTokenFetcher_handleTokenResponse_withQueue_completionHandler___block_invoke_200;
                  v121[3] = &unk_1E5A3B790;
                  id v122 = v77;
                  id v123 = v11;
                  id v78 = v77;
                  dispatch_async(v9, v121);
                  objc_setProperty_atomic(self, v79, 0, 96);
                  objc_setProperty_atomic(self, v80, 0, 104);
                  objc_setProperty_atomic(self, v81, 0, 112);
                  objc_setProperty_atomic(self, v82, 0, 120);
                }
                else
                {
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_1A0FEE000, v75, OS_LOG_TYPE_ERROR, "Failed to create token structure, cannot handle token response", buf, 2u);
                  }

                  v124[0] = MEMORY[0x1E4F143A8];
                  v124[1] = 3221225472;
                  v124[2] = __80__NSPPrivateAccessTokenFetcher_handleTokenResponse_withQueue_completionHandler___block_invoke_196;
                  v124[3] = &unk_1E5A3BAB0;
                  id v125 = v11;
                  dispatch_async(v9, v124);
                  id v78 = v125;
                }
                id v84 = v117;

                id v19 = v118;
LABEL_59:

                goto LABEL_20;
              }
              p_super = nplog_obj();
              if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
                goto LABEL_78;
              }
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "-[NSPPrivateAccessTokenResponse initWithChallenge:clientNonce:tokenKey:blindSignature:]";
              v92 = "%s called with null (clientNonce.length == 32)";
            }
            else
            {
              p_super = nplog_obj();
              if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
                goto LABEL_78;
              }
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "-[NSPPrivateAccessTokenResponse initWithChallenge:clientNonce:tokenKey:blindSignature:]";
              v92 = "%s called with null clientNonce";
            }
          }
          else
          {
            p_super = nplog_obj();
            if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
              goto LABEL_78;
            }
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[NSPPrivateAccessTokenResponse initWithChallenge:clientNonce:tokenKey:blindSignature:]";
            v92 = "%s called with null challenge";
          }
LABEL_77:
          _os_log_fault_impl(&dword_1A0FEE000, p_super, OS_LOG_TYPE_FAULT, v92, buf, 0xCu);
          goto LABEL_78;
        }
      }
    }
  }
  uint64_t v46 = nplog_obj();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A0FEE000, v46, OS_LOG_TYPE_ERROR, "Invalid state, cannot handle token response", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__NSPPrivateAccessTokenFetcher_handleTokenResponse_withQueue_completionHandler___block_invoke;
  block[3] = &unk_1E5A3BAB0;
  id v131 = v11;
  dispatch_async(v9, block);
  id v19 = v131;
LABEL_20:
}

void __80__NSPPrivateAccessTokenFetcher_handleTokenResponse_withQueue_completionHandler___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v6[0] = @"Invalid parameters";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = (void *)[v2 initWithDomain:@"privacyProxyErrorDomain" code:1004 userInfo:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__NSPPrivateAccessTokenFetcher_handleTokenResponse_withQueue_completionHandler___block_invoke_194(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __80__NSPPrivateAccessTokenFetcher_handleTokenResponse_withQueue_completionHandler___block_invoke_196(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v6[0] = @"Failed to process token response";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = (void *)[v2 initWithDomain:@"privacyProxyErrorDomain" code:1007 userInfo:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__NSPPrivateAccessTokenFetcher_handleTokenResponse_withQueue_completionHandler___block_invoke_200(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)saveTokenToCache:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = getServerConnection();
    [v5 addToken:v4 toCacheForFetcher:self];
  }
  else
  {
    id v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315138;
      id v8 = "-[NSPPrivateAccessTokenFetcher saveTokenToCache:]";
      _os_log_fault_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_FAULT, "%s called with null token", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (void)saveAuxiliaryAuthenticationDataToCache:(id)a3 type:(unint64_t)a4 forLabel:(id)a5 cacheKey:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
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
      id v15 = "%s called with null auxiliaryData";
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
      id v15 = "%s called with null label";
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
    id v15 = "%s called with null cacheKey";
LABEL_13:
    _os_log_fault_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_11;
  }
  id v13 = getServerConnection();
  [v13 addAuxiliaryAuthenticationData:v9 type:a4 label:v10 cacheKey:v12];

LABEL_5:
}

+ (void)fetchAuxiliaryAuthenticationDataFromCacheForType:(unint64_t)a3 label:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!v9)
  {
    id v13 = nplog_obj();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      goto LABEL_4;
    }
    int v15 = 136315138;
    int v16 = "+[NSPPrivateAccessTokenFetcher fetchAuxiliaryAuthenticationDataFromCacheForType:label:cacheKey:completionHandler:]";
    id v14 = "%s called with null label";
LABEL_10:
    _os_log_fault_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v15, 0xCu);
    goto LABEL_8;
  }
  if (!v10)
  {
    id v13 = nplog_obj();
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