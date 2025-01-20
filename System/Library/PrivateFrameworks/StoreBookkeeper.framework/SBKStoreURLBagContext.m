@interface SBKStoreURLBagContext
+ (id)ExtrasDomainIdentifier;
+ (id)UPPDomainIdentifier;
+ (void)_findFirstValueInBag:(id)a3 keyEnumerator:(id)a4 valueTransformer:(id)a5 defaultValue:(id)a6 completionBlock:(id)a7;
+ (void)enumerateRequestURLBagKeysWithBlock:(id)a3;
+ (void)loadBagContextFromURLBag:(id)a3 domain:(id)a4 completionBlock:(id)a5;
- (BOOL)domainDisabled;
- (NSString)domain;
- (NSURL)pullAllKeyValueRequestURL;
- (NSURL)pullKeyValueRequestURL;
- (NSURL)pushAllKeyValueRequestURL;
- (NSURL)pushKeyValueRequestURL;
- (NSURL)syncRequestURL;
- (SBKStoreURLBagContext)init;
- (SBKStoreURLBagContext)initWithBag:(id)a3 domain:(id)a4;
- (SSURLBag)bag;
- (double)pollingIntervalInSeconds;
- (id)_initWithDomain:(id)a3 syncRequestURL:(id)a4 domainDisabled:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setBag:(id)a3;
- (void)setDomain:(id)a3;
- (void)setDomainDisabled:(BOOL)a3;
- (void)setPollingIntervalInSeconds:(double)a3;
- (void)setPullAllKeyValueRequestURL:(id)a3;
- (void)setPullKeyValueRequestURL:(id)a3;
- (void)setPushAllKeyValueRequestURL:(id)a3;
- (void)setPushKeyValueRequestURL:(id)a3;
- (void)setSyncRequestURL:(id)a3;
@end

@implementation SBKStoreURLBagContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_pullAllKeyValueRequestURL, 0);
  objc_storeStrong((id *)&self->_pushAllKeyValueRequestURL, 0);
  objc_storeStrong((id *)&self->_pullKeyValueRequestURL, 0);
  objc_storeStrong((id *)&self->_pushKeyValueRequestURL, 0);
  objc_storeStrong((id *)&self->_syncRequestURL, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setBag:(id)a3
{
}

- (SSURLBag)bag
{
  return self->_bag;
}

- (void)setDomainDisabled:(BOOL)a3
{
  self->_domainDisabled = a3;
}

- (BOOL)domainDisabled
{
  return self->_domainDisabled;
}

- (void)setPullAllKeyValueRequestURL:(id)a3
{
}

- (NSURL)pullAllKeyValueRequestURL
{
  return self->_pullAllKeyValueRequestURL;
}

- (void)setPushAllKeyValueRequestURL:(id)a3
{
}

- (NSURL)pushAllKeyValueRequestURL
{
  return self->_pushAllKeyValueRequestURL;
}

- (void)setPullKeyValueRequestURL:(id)a3
{
}

- (NSURL)pullKeyValueRequestURL
{
  return self->_pullKeyValueRequestURL;
}

- (void)setPushKeyValueRequestURL:(id)a3
{
}

- (NSURL)pushKeyValueRequestURL
{
  return self->_pushKeyValueRequestURL;
}

- (void)setSyncRequestURL:(id)a3
{
}

- (NSURL)syncRequestURL
{
  return self->_syncRequestURL;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (double)pollingIntervalInSeconds
{
  double result = self->_pollingIntervalInSeconds;
  if (fabs(result) <= 0.00000011920929) {
    return 604800.0;
  }
  return result;
}

- (void)setPollingIntervalInSeconds:(double)a3
{
  if (fabs(a3) <= 0.00000011920929) {
    a3 = 604800.0;
  }
  self->_pollingIntervalInSeconds = a3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(SBKStoreURLBagContext *)self domain];
  v6 = objc_msgSend(v4, "_initWithDomain:syncRequestURL:domainDisabled:", v5, 0, -[SBKStoreURLBagContext domainDisabled](self, "domainDisabled"));

  v7 = objc_opt_class();
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __45__SBKStoreURLBagContext_mutableCopyWithZone___block_invoke;
  v15 = &unk_2648AF6E0;
  v8 = v6;
  id v16 = v8;
  v17 = self;
  [v7 enumerateRequestURLBagKeysWithBlock:&v12];
  [(SBKStoreURLBagContext *)self pollingIntervalInSeconds];
  v8[2] = v9;
  v10 = v8;

  return v10;
}

void __45__SBKStoreURLBagContext_mutableCopyWithZone___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a3;
  id v6 = [v4 valueForKey:v5];
  [v3 setValue:v6 forKey:v5];
}

+ (void)loadBagContextFromURLBag:(id)a3 domain:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__1220;
  v47[4] = __Block_byref_object_dispose__1221;
  v48 = [[SBKStoreURLBagContext alloc] initWithBag:v8 domain:v9];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__1220;
  v45[4] = __Block_byref_object_dispose__1221;
  id v46 = 0;
  dispatch_group_t v11 = dispatch_group_create();
  dispatch_queue_t v12 = dispatch_queue_create(0, 0);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke;
  v40[3] = &unk_2648AF5F8;
  uint64_t v13 = v12;
  v41 = v13;
  v43 = v47;
  v44 = v45;
  v14 = v11;
  v42 = v14;
  v15 = (void *)MEMORY[0x230F4DE10](v40);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_3;
  v35[3] = &unk_2648AF648;
  id v16 = v14;
  v36 = v16;
  id v39 = a1;
  id v17 = v8;
  id v37 = v17;
  id v18 = v15;
  id v38 = v18;
  v19 = (void *)MEMORY[0x230F4DE10](v35);
  v20 = objc_opt_class();
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_8;
  v31[3] = &unk_2648AF690;
  id v21 = v19;
  id v33 = v21;
  id v34 = &__block_literal_global_53_1223;
  id v22 = v9;
  id v32 = v22;
  [v20 enumerateRequestURLBagKeysWithBlock:v31];
  (*((void (**)(id, __CFString *, void, void *, __CFString *, id, void))v21 + 2))(v21, @"domainDisabled", MEMORY[0x263EFFA80], &__block_literal_global_56, @"kvs-sync-disabled", v22, 0);
  (*((void (**)(id, __CFString *, void *, void *, __CFString *, id, void))v21 + 2))(v21, @"pollingIntervalInSeconds", &unk_26DF16CF0, &__block_literal_global_59, @"kvs-sync-polling-interval-secs", v22, 0);
  v23 = dispatch_queue_create(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_73;
  block[3] = &unk_2648AF6B8;
  v29 = v45;
  v30 = v47;
  v27 = v16;
  id v28 = v10;
  id v24 = v10;
  v25 = v16;
  dispatch_async(v23, block);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);
}

void __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_2;
  block[3] = &unk_2648AF5D0;
  id v15 = v8;
  id v16 = v7;
  id v17 = v9;
  long long v18 = *(_OWORD *)(a1 + 48);
  id v11 = v9;
  id v12 = v7;
  id v13 = v8;
  dispatch_sync(v10, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v27 = a2;
  id v13 = a5;
  v14 = *(NSObject **)(a1 + 32);
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  dispatch_group_enter(v14);
  v19 = [MEMORY[0x263EFF980] array];
  v20 = [NSString stringWithFormat:@"%@.%@", v13, v16];
  id v21 = [v15 objectForKey:v16];

  [v19 addObject:v20];
  if (v21) {
    [v19 addObject:v21];
  }
  [v19 addObject:v13];
  id v22 = *(void **)(a1 + 56);
  uint64_t v23 = *(void *)(a1 + 40);
  id v24 = [v19 objectEnumerator];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_4;
  v28[3] = &unk_2648AF620;
  id v25 = *(id *)(a1 + 48);
  id v29 = v27;
  id v30 = v25;
  id v26 = v27;
  [v22 _findFirstValueInBag:v23 keyEnumerator:v24 valueTransformer:v17 defaultValue:v18 completionBlock:v28];
}

uint64_t __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_8(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, uint64_t, void, void))(a1[5] + 16))(a1[5], a3, 0, a1[6], a2, a1[4], 0);
}

uint64_t __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_73(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

id __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = NSNumber;
  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    uint64_t v5 = 0;
  }
  else
  {
    [v2 doubleValue];
    uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  }

  id v2 = (id)v5;
LABEL_6:
  return v2;
}

id __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "BOOLValue"));
  }

  id v2 = (id)v3;
LABEL_6:
  return v2;
}

id __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [NSURL URLWithString:v2];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    uint64_t v3 = 0;
  }

  id v2 = (id)v3;
LABEL_6:
  return v2;
}

uint64_t __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

void __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_2(void *a1)
{
  [*(id *)(*(void *)(a1[7] + 8) + 40) setValue:a1[4] forKey:a1[5]];
  id v2 = (void *)a1[6];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1[8] + 8);
    uint64_t v5 = *(void *)(v3 + 40);
    id v4 = (id *)(v3 + 40);
    if (!v5)
    {
      objc_storeStrong(v4, v2);
    }
  }
}

+ (void)_findFirstValueInBag:(id)a3 keyEnumerator:(id)a4 valueTransformer:(id)a5 defaultValue:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v13 nextObject];
  if (v17)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __106__SBKStoreURLBagContext__findFirstValueInBag_keyEnumerator_valueTransformer_defaultValue_completionBlock___block_invoke;
    v18[3] = &unk_2648AF588;
    id v22 = v14;
    id v23 = v16;
    id v24 = a1;
    id v19 = v12;
    id v20 = v13;
    id v21 = v15;
    [v19 loadValueForKey:v17 completionBlock:v18];
  }
  else
  {
    (*((void (**)(id, id, void))v16 + 2))(v16, v15, 0);
  }
}

void __106__SBKStoreURLBagContext__findFirstValueInBag_keyEnumerator_valueTransformer_defaultValue_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = v6;
  if (v5
    && ((uint64_t v7 = *(void *)(a1 + 56)) == 0
     || ((*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6),
         uint64_t v8 = objc_claimAutoreleasedReturnValue(),
         v5,
         (id v5 = (id)v8) != 0)))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    [*(id *)(a1 + 72) _findFirstValueInBag:*(void *)(a1 + 32) keyEnumerator:*(void *)(a1 + 40) valueTransformer:*(void *)(a1 + 56) defaultValue:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 64)];
  }
}

+ (id)ExtrasDomainIdentifier
{
  return @"com.apple.upp-extras";
}

+ (id)UPPDomainIdentifier
{
  return @"com.apple.upp";
}

+ (void)enumerateRequestURLBagKeysWithBlock:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__SBKStoreURLBagContext_enumerateRequestURLBagKeysWithBlock___block_invoke;
  v5[3] = &unk_2648AF560;
  id v6 = v3;
  id v4 = v3;
  [&unk_26DF16CC8 enumerateKeysAndObjectsUsingBlock:v5];
}

uint64_t __61__SBKStoreURLBagContext_enumerateRequestURLBagKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(SBKStoreURLBagContext *)self domain];
  id v6 = objc_msgSend(v4, "_initWithDomain:syncRequestURL:domainDisabled:", v5, 0, -[SBKStoreURLBagContext domainDisabled](self, "domainDisabled"));

  uint64_t v7 = objc_opt_class();
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __38__SBKStoreURLBagContext_copyWithZone___block_invoke;
  id v15 = &unk_2648AF6E0;
  uint64_t v8 = v6;
  id v16 = v8;
  id v17 = self;
  [v7 enumerateRequestURLBagKeysWithBlock:&v12];
  [(SBKStoreURLBagContext *)self pollingIntervalInSeconds];
  v8[2] = v9;
  id v10 = v8;

  return v10;
}

void __38__SBKStoreURLBagContext_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a3;
  id v6 = [v4 valueForKey:v5];
  [v3 setValue:v6 forKey:v5];
}

- (SBKStoreURLBagContext)initWithBag:(id)a3 domain:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBKStoreURLBagContext;
  uint64_t v7 = [(SBKStoreURLBagContext *)&v10 init];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_domain, a4);
  }

  return v8;
}

- (id)description
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_opt_class();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __36__SBKStoreURLBagContext_description__block_invoke;
  v11[3] = &unk_2648AF6E0;
  id v12 = v3;
  uint64_t v13 = self;
  id v5 = v3;
  [v4 enumerateRequestURLBagKeysWithBlock:v11];
  id v6 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)SBKStoreURLBagContext;
  uint64_t v7 = [(SBKStoreURLBagContext *)&v10 description];
  uint64_t v8 = [v6 stringWithFormat:@"%@ domain=%@, enabled=%d, requestURLs = \n%@\n\n", v7, self->_domain, !self->_domainDisabled, v5];

  return v8;
}

void __36__SBKStoreURLBagContext_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSString;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v10 = [v6 valueForKey:v7];
  uint64_t v9 = [v4 stringWithFormat:@"%@(%@) = %@", v7, v8, v10];

  [v5 addObject:v9];
}

- (SBKStoreURLBagContext)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBKStoreURLBagContext.m" lineNumber:194 description:@"Use +loadBagContextFromURLBag:domain:completionBlock:"];

  return 0;
}

- (id)_initWithDomain:(id)a3 syncRequestURL:(id)a4 domainDisabled:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBKStoreURLBagContext;
  id v11 = [(SBKStoreURLBagContext *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_domain, a3);
    objc_storeStrong((id *)&v12->_syncRequestURL, a4);
    v12->_domainDisabled = a5;
  }

  return v12;
}

@end