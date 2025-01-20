@interface SSInstallAttributionParamsRequest
- (BOOL)overrideCampaignLimit;
- (NSNumber)appAdamId;
- (NSNumber)campaignId;
- (NSNumber)timestamp;
- (NSString)adNetworkId;
- (NSString)attributionSignature;
- (NSString)impressionId;
- (NSString)originatingBundleId;
- (SSInstallAttributionParamsRequest)initWithAppAdamId:(id)a3 adNetworkId:(id)a4 campaignId:(id)a5 impressionId:(id)a6 timestamp:(id)a7 attributionSignature:(id)a8;
- (SSInstallAttributionParamsRequest)initWithAppAdamId:(id)a3 adNetworkId:(id)a4 campaignId:(id)a5 impressionId:(id)a6 timestamp:(id)a7 attributionSignature:(id)a8 originatingBundleId:(id)a9;
- (SSInstallAttributionParamsRequest)initWithAppAdamId:(id)a3 adNetworkId:(id)a4 campaignId:(id)a5 impressionId:(id)a6 timestamp:(id)a7 attributionSignature:(id)a8 originatingBundleId:(id)a9 overrideCampaignLimit:(BOOL)a10;
- (SSInstallAttributionParamsRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation SSInstallAttributionParamsRequest

- (SSInstallAttributionParamsRequest)initWithAppAdamId:(id)a3 adNetworkId:(id)a4 campaignId:(id)a5 impressionId:(id)a6 timestamp:(id)a7 attributionSignature:(id)a8
{
  LOBYTE(v9) = 0;
  return [(SSInstallAttributionParamsRequest *)self initWithAppAdamId:a3 adNetworkId:a4 campaignId:a5 impressionId:a6 timestamp:a7 attributionSignature:a8 originatingBundleId:0 overrideCampaignLimit:v9];
}

- (SSInstallAttributionParamsRequest)initWithAppAdamId:(id)a3 adNetworkId:(id)a4 campaignId:(id)a5 impressionId:(id)a6 timestamp:(id)a7 attributionSignature:(id)a8 originatingBundleId:(id)a9
{
  LOBYTE(v10) = 0;
  return [(SSInstallAttributionParamsRequest *)self initWithAppAdamId:a3 adNetworkId:a4 campaignId:a5 impressionId:a6 timestamp:a7 attributionSignature:a8 originatingBundleId:a9 overrideCampaignLimit:v10];
}

- (SSInstallAttributionParamsRequest)initWithAppAdamId:(id)a3 adNetworkId:(id)a4 campaignId:(id)a5 impressionId:(id)a6 timestamp:(id)a7 attributionSignature:(id)a8 originatingBundleId:(id)a9 overrideCampaignLimit:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v39.receiver = self;
  v39.super_class = (Class)SSInstallAttributionParamsRequest;
  v23 = [(SSRequest *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    appAdamId = v23->_appAdamId;
    v23->_appAdamId = (NSNumber *)v24;

    uint64_t v26 = [v17 copy];
    adNetworkId = v23->_adNetworkId;
    v23->_adNetworkId = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    campaignId = v23->_campaignId;
    v23->_campaignId = (NSNumber *)v28;

    uint64_t v30 = [v19 copy];
    impressionId = v23->_impressionId;
    v23->_impressionId = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    timestamp = v23->_timestamp;
    v23->_timestamp = (NSNumber *)v32;

    uint64_t v34 = [v21 copy];
    attributionSignature = v23->_attributionSignature;
    v23->_attributionSignature = (NSString *)v34;

    uint64_t v36 = [v22 copy];
    originatingBundleId = v23->_originatingBundleId;
    v23->_originatingBundleId = (NSString *)v36;

    v23->_overrideCampaignLimit = a10;
  }

  return v23;
}

- (void)startWithCompletionBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v21 = 136446210;
      id v22 = "-[SSInstallAttributionParamsRequest startWithCompletionBlock:]";
      LODWORD(v18) = 12;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__SSInstallAttributionParamsRequest_startWithCompletionBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:200 messageBlock:v19];
}

void __62__SSInstallAttributionParamsRequest_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      int v7 = SSError(@"SSErrorDomain", 121, 0, 0);
    }
    else
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v6 = xpc_dictionary_get_value(v4, "1");
      int v7 = (void *)[v5 initWithXPCEncoding:v6];
    }
    v8 = dispatch_get_global_queue(0, 0);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __62__SSInstallAttributionParamsRequest_startWithCompletionBlock___block_invoke_2;
    uint64_t v14 = &unk_1E5BA7328;
    id v9 = *(id *)(a1 + 40);
    id v15 = v7;
    id v16 = v9;
    id v10 = v7;
    dispatch_async(v8, &v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v11, v12, v13, v14);
}

uint64_t __62__SSInstallAttributionParamsRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__SSInstallAttributionParamsRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E5BA7018;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(dispatchQueue, v8);
  id v6 = v5;

  return v6;
}

void __52__SSInstallAttributionParamsRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "appAdamId", *(void *)(*(void *)(a1 + 40) + 104));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "adNetworkId", *(void *)(*(void *)(a1 + 40) + 112));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "campaignId", *(void *)(*(void *)(a1 + 40) + 120));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "impressionId", *(void *)(*(void *)(a1 + 40) + 128));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "timestamp", *(void *)(*(void *)(a1 + 40) + 136));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "attributionSignature", *(void *)(*(void *)(a1 + 40) + 144));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "originatingBundleId", *(void *)(*(void *)(a1 + 40) + 152));
  v2 = *(void **)(a1 + 32);
  char v3 = *(unsigned char *)(*(void *)(a1 + 40) + 96);
  xpc_dictionary_set_BOOL(v2, "overrideCampaignLimit", v3);
}

- (SSInstallAttributionParamsRequest)initWithXPCEncoding:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4 || MEMORY[0x1A62689E0](v4) != MEMORY[0x1E4F14590]) {
    goto LABEL_22;
  }
  v42.receiver = self;
  v42.super_class = (Class)SSInstallAttributionParamsRequest;
  self = [(SSRequest *)&v42 init];
  if (self)
  {
    uint64_t v6 = objc_opt_class();
    int v7 = (NSNumber *)SSXPCDictionaryCopyObjectWithClass(v5, "appAdamId", v6);
    appAdamId = self->_appAdamId;
    self->_appAdamId = v7;

    uint64_t v9 = objc_opt_class();
    id v10 = (NSString *)SSXPCDictionaryCopyObjectWithClass(v5, "adNetworkId", v9);
    adNetworkId = self->_adNetworkId;
    self->_adNetworkId = v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = (NSNumber *)SSXPCDictionaryCopyObjectWithClass(v5, "campaignId", v12);
    campaignId = self->_campaignId;
    self->_campaignId = v13;

    uint64_t v15 = objc_opt_class();
    id v16 = (NSString *)SSXPCDictionaryCopyObjectWithClass(v5, "impressionId", v15);
    impressionId = self->_impressionId;
    self->_impressionId = v16;

    uint64_t v18 = objc_opt_class();
    id v19 = (NSNumber *)SSXPCDictionaryCopyObjectWithClass(v5, "timestamp", v18);
    timestamp = self->_timestamp;
    self->_timestamp = v19;

    uint64_t v21 = objc_opt_class();
    id v22 = (NSString *)SSXPCDictionaryCopyObjectWithClass(v5, "attributionSignature", v21);
    attributionSignature = self->_attributionSignature;
    self->_attributionSignature = v22;

    uint64_t v24 = objc_opt_class();
    v25 = (NSString *)SSXPCDictionaryCopyObjectWithClass(v5, "originatingBundleId", v24);
    originatingBundleId = self->_originatingBundleId;
    self->_originatingBundleId = v25;

    self->_overrideCampaignLimit = xpc_dictionary_get_BOOL(v5, "overrideCampaignLimit");
    if (!self->_appAdamId
      || !self->_adNetworkId
      || !self->_campaignId
      || !self->_impressionId
      || !self->_timestamp
      || !self->_attributionSignature)
    {
      v27 = +[SSLogConfig sharedConfig];
      if (!v27)
      {
        v27 = +[SSLogConfig sharedConfig];
      }
      int v28 = [v27 shouldLog];
      if ([v27 shouldLogToDisk]) {
        int v29 = v28 | 2;
      }
      else {
        int v29 = v28;
      }
      uint64_t v30 = [v27 OSLogObject];
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        v29 &= 2u;
      }
      if (v29)
      {
        v31 = objc_opt_class();
        int v43 = 138543362;
        v44 = v31;
        id v32 = v31;
        LODWORD(v41) = 12;
        v33 = (void *)_os_log_send_and_compose_impl();

        if (!v33)
        {
LABEL_21:

LABEL_22:
          self = 0;
          goto LABEL_23;
        }
        uint64_t v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v33, 4, &v43, v41);
        free(v33);
        SSFileLog(v27, @"%@", v34, v35, v36, v37, v38, v39, (uint64_t)v30);
      }

      goto LABEL_21;
    }
  }
LABEL_23:

  return self;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (NSString)adNetworkId
{
  return self->_adNetworkId;
}

- (NSNumber)campaignId
{
  return self->_campaignId;
}

- (NSString)impressionId
{
  return self->_impressionId;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (NSString)attributionSignature
{
  return self->_attributionSignature;
}

- (NSString)originatingBundleId
{
  return self->_originatingBundleId;
}

- (BOOL)overrideCampaignLimit
{
  return self->_overrideCampaignLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingBundleId, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_impressionId, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end