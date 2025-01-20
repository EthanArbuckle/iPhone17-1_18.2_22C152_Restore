@interface SSVURLBagInterpreter
- (BOOL)shouldSendAnonymousMachineIdentifierForURL:(id)a3;
- (NSArray)AMDDomains;
- (NSDictionary)mescalSignedActions;
- (NSDictionary)mescalSignedRequests;
- (NSDictionary)mescalSignedResponses;
- (NSString)storeFrontSuffix;
- (NSURL)mescalCertificateURL;
- (NSURL)mescalPrimingURL;
- (NSURL)mescalSetupURL;
- (NSURL)pastisCertificateURL;
- (NSURL)pastisKeyServerURL;
- (SSVURLBagInterpreter)initWithSSBag:(id)a3;
- (SSVURLBagInterpreter)initWithURLBag:(id)a3;
- (SSVURLBagInterpreter)initWithURLBagDictionary:(id)a3;
- (id)URLForURLBagKey:(id)a3;
- (id)_valueForKey:(id)a3 withClass:(Class)a4;
- (id)cachedValueFromBag:(id)a3 key:(id)a4 withType:(unint64_t)a5 updateCache:(BOOL)a6;
- (id)mescalSignaturePolicyForRequestURL:(id)a3;
- (id)mescalSignaturePolicyForResponseURL:(id)a3;
- (id)valueForURLBagKey:(id)a3;
@end

@implementation SSVURLBagInterpreter

- (SSVURLBagInterpreter)initWithURLBag:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  id v20 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __39__SSVURLBagInterpreter_initWithURLBag___block_invoke;
  v12 = &unk_1E5BA8CD0;
  v14 = &v15;
  v6 = v5;
  v13 = v6;
  [v4 loadWithCompletionBlock:&v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = -[SSVURLBagInterpreter initWithURLBagDictionary:](self, "initWithURLBagDictionary:", v16[5], v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __39__SSVURLBagInterpreter_initWithURLBag___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (SSVURLBagInterpreter)initWithURLBagDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SSVURLBagInterpreter;
  dispatch_semaphore_t v5 = [(SSVURLBagInterpreter *)&v23 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedBagValues = v5->_cachedBagValues;
    v5->_cachedBagValues = v6;

    uint64_t v8 = 0;
    v24[2] = xmmword_1E5BA8D10;
    v24[3] = *(_OWORD *)&off_1E5BA8D20;
    v24[4] = xmmword_1E5BA8D30;
    v24[0] = xmmword_1E5BA8CF0;
    v24[1] = *(_OWORD *)&off_1E5BA8D00;
    do
    {
      uint64_t v9 = *(void *)((char *)v24 + v8);
      uint64_t v10 = [v4 objectForKey:v9];
      if (v10) {
        [(NSMutableDictionary *)v5->_cachedBagValues setObject:v10 forKey:v9];
      }

      v8 += 8;
    }
    while (v8 != 80);
    v11 = [v4 objectForKey:@"musicCommon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v11 objectForKey:@"musicMescal"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [v12 objectForKey:@"actions"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v13 copy];
          subscriptionSignedActions = v5->_subscriptionSignedActions;
          v5->_subscriptionSignedActions = (NSArray *)v14;
        }
        v16 = [[SSVSAPSignaturePolicy alloc] initWithSignedActionsDictionary:v12];
        subscriptionSignaturePolicy = v5->_subscriptionSignaturePolicy;
        v5->_subscriptionSignaturePolicy = v16;

        v18 = [v12 objectForKey:@"primeUrl"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
          mescalPrimingURL = v5->_mescalPrimingURL;
          v5->_mescalPrimingURL = (NSURL *)v19;
        }
      }
    }
    for (uint64_t i = 72; i != -8; i -= 8)
  }
  return v5;
}

- (SSVURLBagInterpreter)initWithSSBag:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SSVURLBagInterpreter;
  dispatch_semaphore_t v5 = [(SSVURLBagInterpreter *)&v26 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedBagValues = v5->_cachedBagValues;
    v5->_cachedBagValues = v6;

    id v8 = [(SSVURLBagInterpreter *)v5 cachedValueFromBag:v4 key:@"amd-domains" withType:0 updateCache:1];
    id v9 = [(SSVURLBagInterpreter *)v5 cachedValueFromBag:v4 key:@"sign-sap-setup-cert" withType:5 updateCache:1];
    id v10 = [(SSVURLBagInterpreter *)v5 cachedValueFromBag:v4 key:@"sign-sap-setup" withType:5 updateCache:1];
    id v11 = [(SSVURLBagInterpreter *)v5 cachedValueFromBag:v4 key:@"signed-actions" withType:2 updateCache:1];
    id v12 = [(SSVURLBagInterpreter *)v5 cachedValueFromBag:v4 key:@"sign-sap-request" withType:2 updateCache:1];
    id v13 = [(SSVURLBagInterpreter *)v5 cachedValueFromBag:v4 key:@"sign-sap-response" withType:2 updateCache:1];
    id v14 = [(SSVURLBagInterpreter *)v5 cachedValueFromBag:v4 key:@"storefront-header-suffix" withType:5 updateCache:1];
    id v15 = [(SSVURLBagInterpreter *)v5 cachedValueFromBag:v4 key:@"fps-request" withType:5 updateCache:1];
    id v16 = [(SSVURLBagInterpreter *)v5 cachedValueFromBag:v4 key:@"fps-cert" withType:5 updateCache:1];
    uint64_t v17 = [(SSVURLBagInterpreter *)v5 cachedValueFromBag:v4 key:@"musicCommon" withType:2 updateCache:0];
    v18 = [v17 objectForKey:@"musicMescal"];
    if (v18)
    {
      uint64_t v19 = [[SSVSAPSignaturePolicy alloc] initWithSignedActionsDictionary:v18];
      subscriptionSignaturePolicy = v5->_subscriptionSignaturePolicy;
      v5->_subscriptionSignaturePolicy = v19;

      v21 = [v18 objectForKey:@"actions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v5->_subscriptionSignedActions, v21);
      }
      v22 = [v18 objectForKey:@"primeUrl"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = [MEMORY[0x1E4F1CB10] URLWithString:v22];
        mescalPrimingURL = v5->_mescalPrimingURL;
        v5->_mescalPrimingURL = (NSURL *)v23;
      }
    }
  }
  return v5;
}

- (id)cachedValueFromBag:(id)a3 key:(id)a4 withType:(unint64_t)a5 updateCache:(BOOL)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  switch(a5)
  {
    case 0uLL:
      uint64_t v37 = 0;
      id v11 = (id *)&v37;
      uint64_t v12 = [v9 arrayForKey:v10 error:&v37];
      goto LABEL_10;
    case 1uLL:
      uint64_t v36 = 0;
      id v11 = (id *)&v36;
      uint64_t v12 = [v9 BOOLForKey:v10 error:&v36];
      goto LABEL_10;
    case 2uLL:
      uint64_t v31 = 0;
      id v11 = (id *)&v31;
      uint64_t v12 = [v9 dictionaryForKey:v10 error:&v31];
      goto LABEL_10;
    case 3uLL:
      uint64_t v35 = 0;
      id v11 = (id *)&v35;
      uint64_t v12 = [v9 doubleForKey:v10 error:&v35];
      goto LABEL_10;
    case 4uLL:
      uint64_t v34 = 0;
      id v11 = (id *)&v34;
      uint64_t v12 = [v9 integerForKey:v10 error:&v34];
      goto LABEL_10;
    case 5uLL:
      uint64_t v33 = 0;
      id v11 = (id *)&v33;
      uint64_t v12 = [v9 stringForKey:v10 error:&v33];
      goto LABEL_10;
    case 6uLL:
      uint64_t v32 = 0;
      id v11 = (id *)&v32;
      uint64_t v12 = [v9 URLForKey:v10 error:&v32];
LABEL_10:
      id v14 = (void *)v12;
      id v15 = *v11;
      id v13 = v15;
      if (!v14 || v15) {
        goto LABEL_13;
      }
      [(NSMutableDictionary *)self->_cachedBagValues setObject:v14 forKeyedSubscript:v10];
      goto LABEL_25;
    default:
      id v13 = 0;
      id v14 = 0;
LABEL_13:
      id v16 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v16)
      {
        id v16 = +[SSLogConfig sharedConfig];
      }
      int v17 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        int v18 = v17 | 2;
      }
      else {
        int v18 = v17;
      }
      uint64_t v19 = [v16 OSLogObject];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        v18 &= 2u;
      }
      if (!v18) {
        goto LABEL_23;
      }
      id v20 = objc_opt_class();
      int v38 = 138412802;
      v39 = v20;
      __int16 v40 = 2112;
      id v41 = v10;
      __int16 v42 = 2112;
      v43 = v13;
      id v21 = v20;
      LODWORD(v30) = 32;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (v22)
      {
        uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v38, v30);
        free(v22);
        SSFileLog(v16, @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v19);
LABEL_23:
      }
LABEL_25:

      return v14;
  }
}

- (NSArray)AMDDomains
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)[(SSVURLBagInterpreter *)self _valueForKey:@"amd-domains" withClass:v3];
}

- (NSURL)mescalCertificateURL
{
  return (NSURL *)[(SSVURLBagInterpreter *)self URLForURLBagKey:@"sign-sap-setup-cert"];
}

- (NSURL)mescalSetupURL
{
  return (NSURL *)[(SSVURLBagInterpreter *)self URLForURLBagKey:@"sign-sap-setup"];
}

- (id)mescalSignaturePolicyForRequestURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_semaphore_t v5 = [v4 path];
  v6 = [(SSVURLBagInterpreter *)self mescalSignedRequests];
  int v7 = SSVURLPathMatchesActionDictionary(v5, v6);

  if (v7)
  {
    id v8 = [[SSVSAPSignatureComponent alloc] initWithComponentType:0 key:0];
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v8, 0);
    id v10 = [[SSVSAPSignaturePolicy alloc] initWithPolicyType:2 signatureComponents:v9];
LABEL_3:

    goto LABEL_18;
  }
  id v11 = [(SSVURLBagInterpreter *)self mescalSignedActions];
  SSVURLBagGetSignaturePolicyDictionaryForURL(v4, v11);
  id v8 = (SSVSAPSignatureComponent *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v10 = [[SSVSAPSignaturePolicy alloc] initWithSignedActionsDictionary:v8];
  }
  else
  {
    if (self->_subscriptionSignaturePolicy && [(NSArray *)self->_subscriptionSignedActions count])
    {
      id v9 = [v4 lastPathComponent];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v12 = self->_subscriptionSignedActions;
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v12);
            }
            if (![*(id *)(*((void *)&v18 + 1) + 8 * i) caseInsensitiveCompare:v9])
            {
              id v10 = self->_subscriptionSignaturePolicy;
              goto LABEL_22;
            }
          }
          uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
      id v10 = 0;
LABEL_22:

      goto LABEL_3;
    }
    id v10 = 0;
  }
LABEL_18:

  return v10;
}

- (id)mescalSignaturePolicyForResponseURL:(id)a3
{
  id v4 = [a3 path];
  dispatch_semaphore_t v5 = [(SSVURLBagInterpreter *)self mescalSignedResponses];
  int v6 = SSVURLPathMatchesActionDictionary(v4, v5);

  if (v6)
  {
    int v7 = [[SSVSAPSignatureComponent alloc] initWithComponentType:0 key:0];
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v7, 0);
    id v9 = [[SSVSAPSignaturePolicy alloc] initWithPolicyType:2 signatureComponents:v8];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (NSDictionary)mescalSignedActions
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(SSVURLBagInterpreter *)self _valueForKey:@"signed-actions" withClass:v3];
}

- (NSDictionary)mescalSignedRequests
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(SSVURLBagInterpreter *)self _valueForKey:@"sign-sap-request" withClass:v3];
}

- (NSDictionary)mescalSignedResponses
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(SSVURLBagInterpreter *)self _valueForKey:@"sign-sap-response" withClass:v3];
}

- (NSURL)pastisCertificateURL
{
  return (NSURL *)[(SSVURLBagInterpreter *)self URLForURLBagKey:@"fps-cert"];
}

- (NSURL)pastisKeyServerURL
{
  return (NSURL *)[(SSVURLBagInterpreter *)self URLForURLBagKey:@"fps-request"];
}

- (BOOL)shouldSendAnonymousMachineIdentifierForURL:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(SSVURLBagInterpreter *)self AMDDomains];
  char ShouldSendAMDForURL = SSVURLBagShouldSendAMDForURL(v4, v5);

  return ShouldSendAMDForURL;
}

- (NSString)storeFrontSuffix
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(SSVURLBagInterpreter *)self _valueForKey:@"storefront-header-suffix" withClass:v3];
}

- (id)URLForURLBagKey:(id)a3
{
  uint64_t v3 = [(SSVURLBagInterpreter *)self valueForURLBagKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
LABEL_5:
    dispatch_semaphore_t v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_5;
  }
  dispatch_semaphore_t v5 = 0;
LABEL_7:

  return v5;
}

- (id)valueForURLBagKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_cachedBagValues objectForKey:a3];
}

- (id)_valueForKey:(id)a3 withClass:(Class)a4
{
  uint64_t v5 = [(NSMutableDictionary *)self->_cachedBagValues objectForKey:a3];
  int v6 = (void *)v5;
  if (a4 && v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    int v6 = 0;
  }
  return v6;
}

- (NSURL)mescalPrimingURL
{
  return self->_mescalPrimingURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mescalPrimingURL, 0);
  objc_storeStrong((id *)&self->_subscriptionSignaturePolicy, 0);
  objc_storeStrong((id *)&self->_subscriptionSignedActions, 0);
  objc_storeStrong((id *)&self->_cachedBagValues, 0);
}

@end