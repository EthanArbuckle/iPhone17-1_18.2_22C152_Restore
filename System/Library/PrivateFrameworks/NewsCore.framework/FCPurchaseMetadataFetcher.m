@interface FCPurchaseMetadataFetcher
- (FCPurchaseMetadataFetcher)init;
- (id)clientIdentifier;
- (id)fetchPurchaseMetadataForPurchaseID:(id)a3 restorePurchase:(BOOL)a4;
- (id)promiseStoreExternalVersionWithAppAdamID:(void *)a1;
@end

@implementation FCPurchaseMetadataFetcher

id __73__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithLookupResult___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 integerValue] == 1) {
    -[FCPurchaseLookupResult setIntroOffer:](*(void *)(a1 + 32), 0);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v4) {
    v5 = *(void **)(v4 + 48);
  }
  else {
    v5 = 0;
  }
  return -[FCPurchaseMetadataFetcher promiseStoreExternalVersionWithAppAdamID:](v3, v5);
}

void __64__FCPurchaseMetadataFetcher_promisePurchaseLookupWithAppAdamID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F4DD40]);
  v8 = -[FCPurchaseMetadataFetcher clientIdentifier](*(id *)(a1 + 32));
  v9 = +[FCAMSBag bag];
  v10 = (void *)[v7 initWithType:2 clientIdentifier:v8 clientVersion:@"1" bag:v9];

  v21[0] = *(void *)(a1 + 40);
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v10 setItemIdentifiers:v11];

  uint64_t v20 = *MEMORY[0x1E4F4DB08];
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  [v10 setAdditionalPlatforms:v12];

  v13 = [v10 perform];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__FCPurchaseMetadataFetcher_promisePurchaseLookupWithAppAdamID___block_invoke_2;
  v16[3] = &unk_1E5B515E8;
  id v18 = v6;
  id v17 = *(id *)(a1 + 40);
  id v19 = v5;
  id v14 = v5;
  id v15 = v6;
  [v13 addFinishBlock:v16];
}

void __70__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithAppAdamID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F4DD40]);
  v8 = -[FCPurchaseMetadataFetcher clientIdentifier](*(id *)(a1 + 32));
  v9 = +[FCAMSBag bag];
  v10 = (void *)[v7 initWithType:0 clientIdentifier:v8 clientVersion:@"1" bag:v9];

  v11 = [*(id *)(a1 + 40) stringValue];
  v21[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v10 setItemIdentifiers:v12];

  uint64_t v20 = *MEMORY[0x1E4F4DB08];
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  [v10 setAdditionalPlatforms:v13];

  id v14 = [v10 perform];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithAppAdamID___block_invoke_2;
  v17[3] = &unk_1E5B51688;
  id v18 = v5;
  id v19 = v6;
  id v15 = v6;
  id v16 = v5;
  [v14 addFinishBlock:v17];
}

- (id)clientIdentifier
{
  if (a1)
  {
    if (qword_1EB5D1228 != -1) {
      dispatch_once(&qword_1EB5D1228, &__block_literal_global_44);
    }
    a1 = (id)_MergedGlobals_158;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)fetchPurchaseMetadataForPurchaseID:(id)a3 restorePurchase:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F81BF0];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke;
  v37[3] = &unk_1E5B4FEB0;
  v37[4] = self;
  id v28 = v6;
  id v38 = v28;
  v27 = [v7 firstly:v37];
  v8 = [v27 thenOn];
  if (self) {
    accessQueue = self->_accessQueue;
  }
  else {
    accessQueue = 0;
  }
  v10 = accessQueue;
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  v34 = __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_2;
  v35 = &unk_1E5B51550;
  v36 = self;
  v26 = v10;
  v25 = v8[2](v8);
  v11 = [v25 thenOn];
  if (self) {
    v12 = self->_accessQueue;
  }
  else {
    v12 = 0;
  }
  v13 = v12;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_3;
  v30[3] = &unk_1E5B51578;
  v30[4] = self;
  BOOL v31 = a4;
  id v14 = ((void (**)(void, OS_dispatch_queue *, void *))v11)[2](v11, v13, v30);
  uint64_t v15 = [v14 thenOn];
  id v16 = (void *)v15;
  if (self) {
    id v17 = self->_accessQueue;
  }
  else {
    id v17 = 0;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_4;
  v29[3] = &unk_1E5B515A0;
  v29[4] = self;
  id v18 = *(void (**)(void *, OS_dispatch_queue *, void *))(v15 + 16);
  id v19 = v17;
  uint64_t v20 = v18(v16, v19, v29);
  v21 = [v20 thenOn];
  v22 = dispatch_get_global_queue(25, 0);
  v23 = ((void (**)(void, void *, void *))v21)[2](v21, v22, &__block_literal_global_38_0);

  return v23;
}

id __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__FCPurchaseMetadataFetcher_promisePurchaseLookupWithAppAdamID___block_invoke;
    v6[3] = &unk_1E5B50378;
    v6[4] = v1;
    id v7 = v2;
    uint64_t v4 = (void *)[v3 initWithResolver:v6];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (FCPurchaseMetadataFetcher)init
{
  v7.receiver = self;
  v7.super_class = (Class)FCPurchaseMetadataFetcher;
  id v2 = [(FCPurchaseMetadataFetcher *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.news.purchaseMetadataFetcher", v3);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

void __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F4BBF8] sharedInstance];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_3;
  v3[3] = &unk_1E5B51660;
  id v5 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  [v2 getAllIAPsForActiveAccountWithResultHandler:v3];
}

void __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F4BBF8] sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_2;
  v6[3] = &unk_1E5B4E7A8;
  id v8 = v3;
  id v7 = *(id *)(a1 + 32);
  id v5 = v3;
  [v4 refreshIAPsForActiveAccountWithCompletionHandler:v6];
}

id __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (objc_storeStrong((id *)(v2 + 24), a2), (id v4 = *(id **)(a1 + 32)) != 0))
  {
    id v5 = v4[3];
    id v6 = v5;
    if (v5)
    {
      id v7 = (void *)*((void *)v5 + 6);
      if (*((void *)v5 + 7))
      {
        id v8 = v7;
        id v9 = objc_alloc(MEMORY[0x1E4F81BF0]);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke;
        v17[3] = &unk_1E5B4EEF0;
        id v10 = v8;
        id v18 = v10;
        v11 = (void *)[v9 initWithResolver:v17];

        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __73__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithLookupResult___block_invoke;
        v14[3] = &unk_1E5B51610;
        id v6 = v6;
        id v15 = v6;
        id v16 = v4;
        v12 = [v11 then:v14];

        goto LABEL_9;
      }
    }
    else
    {
      id v7 = 0;
    }
    v12 = -[FCPurchaseMetadataFetcher promiseStoreExternalVersionWithAppAdamID:](v4, v7);
  }
  else
  {
    id v6 = 0;
    v12 = 0;
  }
LABEL_9:

  return v12;
}

- (id)promiseStoreExternalVersionWithAppAdamID:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithAppAdamID___block_invoke;
    v6[3] = &unk_1E5B50378;
    void v6[4] = a1;
    id v7 = v3;
    a1 = (void *)[v4 initWithResolver:v6];
  }
  return a1;
}

void __64__FCPurchaseMetadataFetcher_promisePurchaseLookupWithAppAdamID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v41 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_42;
  }
  id v6 = [v5 responseDataItems];
  id v7 = [v6 firstObject];

  uint64_t v40 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.news.purchaselookup" code:1001 userInfo:0];
  objc_opt_class();
  id v8 = [v7 objectForKeyedSubscript:@"attributes"];
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  v11 = objc_msgSend(v41, "fc_appAdamID");
  v12 = objc_msgSend(v41, "fc_offerName");
  v13 = objc_msgSend(v41, "fc_subscriptionPeriodInISO");
  id v14 = 0;
  if (!v13 || !v12)
  {
    id v15 = 0;
    id v16 = 0;
    goto LABEL_40;
  }
  id v15 = 0;
  id v16 = 0;
  if (v11)
  {
    objc_opt_class();
    id v38 = v10;
    id v17 = [v10 objectForKeyedSubscript:@"offers"];
    v39 = v7;
    if (v17)
    {
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = 0;
    }
    id v19 = v18;

    if ([v19 count])
    {
      objc_opt_class();
      uint64_t v20 = [v19 firstObject];
      if (v20)
      {
        if (objc_opt_isKindOfClass()) {
          v21 = v20;
        }
        else {
          v21 = 0;
        }
      }
      else
      {
        v21 = 0;
      }
      id v22 = v21;

      v23 = objc_msgSend(v41, "fc_introductoryOffers");
      id v16 = [v23 firstObject];

      objc_opt_class();
      v24 = [v22 objectForKeyedSubscript:@"priceFormatted"];
      if (v24)
      {
        if (objc_opt_isKindOfClass()) {
          v25 = v24;
        }
        else {
          v25 = 0;
        }
      }
      else
      {
        v25 = 0;
      }
      id v15 = v25;

      objc_opt_class();
      v26 = [v22 objectForKeyedSubscript:@"price"];
      if (v26)
      {
        if (objc_opt_isKindOfClass()) {
          v27 = v26;
        }
        else {
          v27 = 0;
        }
      }
      else
      {
        v27 = 0;
      }
      id v14 = v27;

      if (v15)
      {
        id v10 = v38;
        id v7 = v39;
        if (v14)
        {
          id v28 = objc_alloc_init(FCPurchaseLookupResult);
          p_isa = (id *)&v28->super.isa;
          if (v28)
          {
            objc_setProperty_nonatomic_copy(v28, v29, *(id *)(a1 + 32), 8);
            objc_setProperty_nonatomic_copy(p_isa, v31, v11, 48);
            objc_setProperty_nonatomic_copy(p_isa, v32, v12, 16);
            objc_setProperty_nonatomic_copy(p_isa, v33, v13, 24);
            objc_setProperty_nonatomic_copy(p_isa, v34, v15, 32);
            objc_storeStrong(p_isa + 7, v16);
            objc_setProperty_nonatomic_copy(p_isa, v35, v14, 40);
          }
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          v36 = (void *)v40;
          goto LABEL_41;
        }
        goto LABEL_40;
      }
    }
    else
    {

      id v14 = 0;
      id v15 = 0;
      id v16 = 0;
    }
    id v10 = v38;
    id v7 = v39;
  }
LABEL_40:
  v37 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  v36 = (void *)v40;
  v37();
LABEL_41:

LABEL_42:
}

void __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_4;
    v12 = &unk_1E5B51638;
    id v13 = *(id *)(a1 + 32);
    id v14 = &v15;
    [v5 enumerateObjectsUsingBlock:&v9];
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", *((unsigned __int8 *)v16 + 24), v9, v10, v11, v12);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    _Block_object_dispose(&v15, 8);
  }
}

void __45__FCPurchaseMetadataFetcher_clientIdentifier__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];

  if ([v1 isEqualToString:@"com.apple.stocks"])
  {
    uint64_t v2 = (void *)_MergedGlobals_158;
    id v3 = @"com.apple.stocks.subscriptions";
  }
  else
  {
    if (![v1 isEqualToString:@"com.apple.news"]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v4 = (void *)[[NSString alloc] initWithFormat:@"FCPurchaseMetadataFetcher: Unknown clientID for bundle %@.", v1];
      *(_DWORD *)buf = 136315906;
      id v6 = "-[FCPurchaseMetadataFetcher clientIdentifier]_block_invoke";
      __int16 v7 = 2080;
      id v8 = "FCPurchaseMetadataFetcher.m";
      __int16 v9 = 1024;
      int v10 = 85;
      __int16 v11 = 2114;
      v12 = v4;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    uint64_t v2 = (void *)_MergedGlobals_158;
    id v3 = @"com.apple.news.subscriptions";
  }
  _MergedGlobals_158 = (uint64_t)v3;
}

id __100__FCPurchaseMetadataFetcher_promiseProductLookupWithLookupResult_externalVersionID_restorePurchase___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  id v5 = (void *)a1[4];
  if (v5) {
    objc_setProperty_nonatomic_copy(v5, v3, v4, 8);
  }
  id v6 = [FCProductLookup alloc];
  uint64_t v7 = a1[5];
  if (v7)
  {
    id v8 = *(void **)(v7 + 16);
    __int16 v9 = *(void **)(v7 + 48);
  }
  else
  {
    id v8 = 0;
    __int16 v9 = 0;
  }
  int v10 = (void *)a1[6];
  id v11 = v8;
  v12 = -[FCProductLookup initWithOfferName:appAdamID:storeExternalVersionID:bundleID:]((id *)&v6->super.isa, v11, v9, v10, v4);

  uint64_t v13 = -[FCProductLookup lookup](v12);

  return v13;
}

void *__80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_setProperty_nonatomic_copy(v5, v3, v4, 16);
    id v6 = *(void **)(a1 + 32);
    if (v6)
    {
      uint64_t v7 = (void *)v6[3];
      goto LABEL_4;
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = 0;
LABEL_4:
  id v8 = v7;
  id v9 = v4;
  if (v6)
  {
    if (v8) {
      int v10 = (void *)v8[6];
    }
    else {
      int v10 = 0;
    }
    id v11 = v10;
    id v12 = objc_alloc(MEMORY[0x1E4F81BF0]);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    char v18 = __58__FCPurchaseMetadataFetcher_promiseBundleIDWithAppAdamID___block_invoke;
    id v19 = &unk_1E5B50378;
    uint64_t v20 = v6;
    uint64_t v13 = v11;
    v21 = v13;
    id v14 = (void *)[v12 initWithResolver:&v16];

    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    char v18 = __100__FCPurchaseMetadataFetcher_promiseProductLookupWithLookupResult_externalVersionID_restorePurchase___block_invoke;
    id v19 = &unk_1E5B516B0;
    uint64_t v20 = v6;
    v21 = v8;
    id v22 = v9;
    id v6 = [v14 then:&v16];
  }
  return v6;
}

FCPurchase *__80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_4(uint64_t a1, void *a2)
{
  id v57 = a2;
  id v3 = [FCPurchase alloc];
  id v4 = *(id **)(a1 + 32);
  v51 = v3;
  if (v4)
  {
    id v5 = (id **)v4[3];
    if (v5)
    {
      v56 = v5;
      id v4 = v5[1];
    }
    else
    {
      v56 = 0;
      id v4 = 0;
    }
  }
  else
  {
    v56 = 0;
  }
  id v6 = v4;
  uint64_t v7 = [v6 copy];
  id v8 = *(id **)(a1 + 32);
  if (v8)
  {
    id v9 = (id **)v8[3];
    if (v9)
    {
      v54 = v9;
      id v8 = v9[6];
    }
    else
    {
      v54 = 0;
      id v8 = 0;
    }
  }
  else
  {
    v54 = 0;
  }
  int v10 = v8;
  id v11 = (void *)[v10 copy];
  id v12 = *(id **)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = (id **)v12[3];
    if (v13)
    {
      v50 = v13;
      id v12 = v13[4];
    }
    else
    {
      v50 = 0;
      id v12 = 0;
    }
  }
  else
  {
    v50 = 0;
  }
  id v14 = v12;
  uint64_t v15 = [v14 copy];
  uint64_t v16 = *(id **)(a1 + 32);
  if (v16)
  {
    uint64_t v17 = (id **)v16[3];
    if (v17)
    {
      v47 = v17;
      uint64_t v16 = v17[3];
    }
    else
    {
      v47 = 0;
      uint64_t v16 = 0;
    }
  }
  else
  {
    v47 = 0;
  }
  char v18 = v16;
  v46 = (void *)[v18 copy];
  id v19 = *(id **)(a1 + 32);
  if (v19)
  {
    uint64_t v20 = (id **)v19[3];
    if (v20)
    {
      v45 = v20;
      id v19 = v20[2];
    }
    else
    {
      v45 = 0;
      id v19 = 0;
    }
  }
  else
  {
    v45 = 0;
  }
  v44 = v19;
  uint64_t v21 = [v44 copy];
  id v22 = *(void **)(a1 + 32);
  v43 = (void *)v21;
  if (v22) {
    id v22 = (void *)v22[2];
  }
  v42 = v22;
  uint64_t v23 = [v42 copy];
  v24 = *(void **)(a1 + 32);
  uint64_t v40 = (void *)v23;
  if (v24) {
    v24 = (void *)v24[1];
  }
  id v41 = v24;
  v25 = (void *)[v41 copy];
  v26 = *(id **)(a1 + 32);
  v53 = v10;
  v48 = (void *)v15;
  v49 = v14;
  if (v26)
  {
    v27 = (id **)v26[3];
    id v28 = (void *)v7;
    if (v27)
    {
      v39 = v27;
      v26 = v27[5];
    }
    else
    {
      v39 = 0;
      v26 = 0;
    }
  }
  else
  {
    id v28 = (void *)v7;
    v39 = 0;
  }
  id v38 = v26;
  v29 = (void *)[v38 copy];
  v30 = *(id **)(a1 + 32);
  v55 = v6;
  if (v30)
  {
    SEL v31 = (id **)v30[3];
    SEL v32 = v31;
    if (v31) {
      v30 = v31[7];
    }
    else {
      v30 = 0;
    }
  }
  else
  {
    SEL v32 = 0;
  }
  SEL v33 = v30;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2050000000;
  SEL v34 = (void *)qword_1EB5D1230;
  uint64_t v62 = qword_1EB5D1230;
  if (!qword_1EB5D1230)
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __getSKMutablePaymentClass_block_invoke;
    v58[3] = &unk_1E5B516D8;
    v58[4] = &v59;
    __getSKMutablePaymentClass_block_invoke((uint64_t)v58);
    SEL v34 = (void *)v60[3];
  }
  id v35 = v34;
  _Block_object_dispose(&v59, 8);
  v36 = [v35 paymentWithProduct:v57];
  v52 = [(FCPurchase *)v51 initWithPurchaseID:v28 appAdamID:v11 subscriptionPriceFormatted:v48 subscriptionPeriodInISO_8601:v46 offerName:v43 storeExternalVersion:v40 bundleID:v25 price:v29 introOffer:v33 payment:v36];

  return v52;
}

id __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

void __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = [v6 appAdamId];
  int v8 = [v7 isEqualToNumber:*(void *)(a1 + 32)];

  if (v8)
  {
    id v9 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = v9;
      if ([v6 hasUsedFreeOffer]) {
        id v12 = @"YES";
      }
      else {
        id v12 = @"NO";
      }
      *(_DWORD *)id v14 = 138412802;
      if ([v6 hasUsedIntroPricingOffer]) {
        uint64_t v13 = @"YES";
      }
      else {
        uint64_t v13 = @"NO";
      }
      *(void *)&void v14[4] = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      char v18 = v13;
      _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "FCPurchaseMetaDataFetcher checkIfOfferUsedAlready appAdamId=%@ hasUsedFreeOffer = %@ hasUsedIntroPricingOffer = %@", v14, 0x20u);
    }
    if ((objc_msgSend(v6, "hasUsedFreeOffer", *(void *)v14) & 1) != 0
      || [v6 hasUsedIntroPricingOffer])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void __70__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithAppAdamID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.news.purchaselookup" code:1002 userInfo:0];
    id v6 = objc_msgSend(v8, "fc_externalVersionID");
    if (v6) {
      uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else {
      uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v7();
  }
}

void __58__FCPurchaseMetadataFetcher_promiseBundleIDWithAppAdamID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F4DD40]);
  id v8 = -[FCPurchaseMetadataFetcher clientIdentifier](*(id *)(a1 + 32));
  id v9 = +[FCAMSBag bag];
  uint64_t v10 = (void *)[v7 initWithType:0 clientIdentifier:v8 clientVersion:@"1" bag:v9];

  id v11 = [*(id *)(a1 + 40) stringValue];
  v21[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v10 setItemIdentifiers:v12];

  uint64_t v20 = *MEMORY[0x1E4F4DB08];
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  [v10 setAdditionalPlatforms:v13];

  id v14 = [v10 perform];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__FCPurchaseMetadataFetcher_promiseBundleIDWithAppAdamID___block_invoke_2;
  v17[3] = &unk_1E5B51688;
  id v18 = v5;
  id v19 = v6;
  id v15 = v6;
  id v16 = v5;
  [v14 addFinishBlock:v17];
}

void __58__FCPurchaseMetadataFetcher_promiseBundleIDWithAppAdamID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.news.purchaselookup" code:1003 userInfo:0];
    id v6 = objc_msgSend(v8, "fc_bundleID");
    if (v6) {
      id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else {
      id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v7();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_lookupResult, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end