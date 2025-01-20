@interface SKUIRedeemOperation
- (BOOL)cameraRecognized;
- (SKUIClientContext)clientContext;
- (SKUIRedeemOperation)initWithCode:(id)a3;
- (id)_authenticationContext;
- (id)_itemsForItemIdentifiers:(id)a3;
- (id)_performRequestWithProperties:(id)a3 error:(id *)a4;
- (id)_redeemForSuccessDictionary:(id)a3;
- (id)_requestPropertiesForThankYouWithURL:(id)a3;
- (id)resultBlock;
- (void)_applyThankYouDictionary:(id)a3 toRedeem:(id)a4;
- (void)main;
- (void)setCameraRecognized:(BOOL)a3;
- (void)setClientContext:(id)a3;
- (void)setResultBlock:(id)a3;
@end

@implementation SKUIRedeemOperation

- (SKUIRedeemOperation)initWithCode:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemOperation initWithCode:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIRedeemOperation;
  v6 = [(SKUIRedeemOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_code, a3);
  }

  return v7;
}

- (void)main
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__99;
  v65 = __Block_byref_object_dispose__99;
  id v66 = 0;
  v3 = [MEMORY[0x1E4FA81D8] sharedConfig];
  int v4 = [v3 shouldLog];
  int v5 = [v3 shouldLogToDisk];
  v6 = [v3 OSLogObject];
  v7 = v6;
  if (v5) {
    v4 |= 2u;
  }
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_8;
  }
  v8 = objc_opt_class();
  code = self->_code;
  *(_DWORD *)v70 = 138543618;
  *(void *)&v70[4] = v8;
  *(_WORD *)&v70[12] = 2114;
  *(void *)&v70[14] = code;
  id v10 = v8;
  LODWORD(v52) = 22;
  v51 = v70;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v70, v52);
    free(v11);
    v51 = v7;
    SSFileLog();
LABEL_8:
  }
  if (!self->_code) {
    goto LABEL_46;
  }
  *(void *)v70 = 0;
  *(void *)&v70[8] = v70;
  *(void *)&v70[16] = 0x3032000000;
  v71 = __Block_byref_object_copy__99;
  v72 = __Block_byref_object_dispose__99;
  id v73 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  id v13 = objc_alloc(MEMORY[0x1E4FA8288]);
  v69 = self->_code;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  v15 = (void *)[v13 initWithRedeemCodes:v14];

  v16 = [(SKUIRedeemOperation *)self _authenticationContext];
  [v15 setAuthenticationContext:v16];

  [v15 setCameraRecognized:self->_cameraRecognized];
  [v15 setHeadless:0];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __27__SKUIRedeemOperation_main__block_invoke;
  v57[3] = &unk_1E642AA18;
  v59 = v70;
  v60 = &v61;
  v17 = v12;
  v58 = v17;
  [v15 startWithRedeemResponseBlock:v57];
  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  v18 = *(void **)(*(void *)&v70[8] + 40);
  if (v18)
  {
    v19 = [v18 dictionaryForCode:self->_code];
    if (v19)
    {
      v20 = [(SKUIRedeemOperation *)self _redeemForSuccessDictionary:v19];
    }
    else
    {
      uint64_t v21 = [*(id *)(*(void *)&v70[8] + 40) errorForCode:self->_code];
      v22 = (void *)v62[5];
      v62[5] = v21;

      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }
  v23 = objc_msgSend(v20, "redirectURL", v51);

  if (v23)
  {
    v24 = [v20 redirectURL];
    v25 = [(SKUIRedeemOperation *)self _requestPropertiesForThankYouWithURL:v24];

    v26 = [(SKUIRedeemOperation *)self _performRequestWithProperties:v25 error:0];
    [v20 setThankYouDictionary:v26];
    if (v26) {
      [(SKUIRedeemOperation *)self _applyThankYouDictionary:v26 toRedeem:v20];
    }
  }
  _Block_object_dispose(v70, 8);

  if (!v20)
  {
LABEL_46:
    if (!v62[5])
    {
      v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v67 = *MEMORY[0x1E4F28568];
      v28 = self->_clientContext;
      v29 = @"Redeem";
      if (v28) {
        [(SKUIClientContext *)v28 localizedStringForKey:@"REDEEM_UNAVAILABLE" inTable:v29];
      }
      else {
      v30 = +[SKUIClientContext localizedStringForKey:@"REDEEM_UNAVAILABLE" inBundles:0 inTable:v29];
      }

      v68 = v30;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      uint64_t v32 = [v27 errorWithDomain:*MEMORY[0x1E4F3C348] code:0 userInfo:v31];
      v33 = (void *)v62[5];
      v62[5] = v32;
    }
    v20 = 0;
  }
  if (v62[5])
  {
    v34 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v35 = [v34 shouldLog];
    int v36 = [v34 shouldLogToDisk];
    v37 = [v34 OSLogObject];
    v38 = v37;
    if (v36) {
      v35 |= 2u;
    }
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      v35 &= 2u;
    }
    if (!v35) {
      goto LABEL_42;
    }
    v39 = objc_opt_class();
    v40 = self->_code;
    v41 = (uint64_t (*)(uint64_t, uint64_t))v62[5];
    *(_DWORD *)v70 = 138543874;
    *(void *)&v70[4] = v39;
    *(_WORD *)&v70[12] = 2114;
    *(void *)&v70[14] = v40;
    *(_WORD *)&v70[22] = 2114;
    v71 = v41;
    id v42 = v39;
    LODWORD(v52) = 32;
    v43 = (void *)_os_log_send_and_compose_impl();

    if (v43)
    {
LABEL_41:
      v38 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, v70, v52);
      free(v43);
      SSFileLog();
LABEL_42:
    }
  }
  else
  {
    v34 = [MEMORY[0x1E4FA81D8] sharedConfig];
    int v44 = [v34 shouldLog];
    int v45 = [v34 shouldLogToDisk];
    v46 = [v34 OSLogObject];
    v38 = v46;
    if (v45) {
      v44 |= 2u;
    }
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
      v44 &= 2u;
    }
    if (!v44) {
      goto LABEL_42;
    }
    v47 = objc_opt_class();
    v48 = self->_code;
    *(_DWORD *)v70 = 138543618;
    *(void *)&v70[4] = v47;
    *(_WORD *)&v70[12] = 2114;
    *(void *)&v70[14] = v48;
    id v49 = v47;
    LODWORD(v52) = 22;
    v43 = (void *)_os_log_send_and_compose_impl();

    if (v43) {
      goto LABEL_41;
    }
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SKUIRedeemOperation_main__block_invoke_13;
  block[3] = &unk_1E6427958;
  id v54 = v20;
  v55 = self;
  v56 = &v61;
  id v50 = v20;
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(&v61, 8);
}

void __27__SKUIRedeemOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __27__SKUIRedeemOperation_main__block_invoke_13(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = +[SKUIItemStateCenter defaultCenter];
    [v2 reloadFromServer];

    v3 = [MEMORY[0x1E4FA8100] defaultStore];
    int v4 = [v3 activeAccount];
    id v5 = [v3 activeAccount];
    id v6 = [*(id *)(a1 + 32) creditDisplay];
    [v5 setCreditsString:v6];

    [v3 saveAccount:v4 verifyCredentials:0 completion:0];
  }
  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 272) + 16);

  return v7();
}

- (id)_authenticationContext
{
  v2 = [MEMORY[0x1E4FA8100] defaultStore];
  v3 = [v2 activeAccount];

  id v4 = objc_alloc_init(MEMORY[0x1E4FB87E8]);
  if (v3
    && ([v3 uniqueIdentifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v4 canPerformExtendedBiometricActionsForAccountIdentifier:v5],
        v5,
        v6))
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FA8260]) initWithAccount:v3];
    [v7 setShouldCreateNewSession:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_redeemForSuccessDictionary:(id)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v86 = a3;
  v3 = [v86 objectForKey:@"status"];
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v3 integerValue] < 0)
  {
    v39 = 0;
    goto LABEL_122;
  }
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v87 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v86 objectForKey:@"salables"];

  objc_opt_class();
  v90 = v4;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v40 = 0;
    goto LABEL_52;
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v85 = v5;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v102 objects:v111 count:16];
  if (!v6)
  {
    v88 = 0;
    goto LABEL_51;
  }
  uint64_t v7 = v6;
  v88 = 0;
  uint64_t v8 = *(void *)v103;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v103 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v102 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v10 objectForKey:@"parentSalableAdamId"];
        id v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [v10 objectForKey:@"salableAdamId"];
        }
        id v14 = v13;

        if (objc_opt_respondsToSelector())
        {
          v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "longLongValue"));
          v110 = v15;
          v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
          v17 = [(SKUIRedeemOperation *)self _itemsForItemIdentifiers:v16];

          if ([(SKUIRedeemItem *)v17 count])
          {
            [v4 addObjectsFromArray:v17];
LABEL_39:

            v37 = [v10 objectForKey:@"parentSalableName"];

            if (v37)
            {
              v38 = [v10 objectForKey:@"salableName"];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = v38;

                v88 = v14;
              }
              else
              {
                id v14 = v38;
              }
            }

            continue;
          }
        }
        v17 = objc_alloc_init(SKUIRedeemItem);
        v18 = [v10 objectForKey:@"productType"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v19 = [&unk_1F1D621C0 objectForKey:@"productType"];
          v20 = v19;
          if (!v19) {
            v19 = &unk_1F1D61F88;
          }
          uint64_t v21 = objc_msgSend(v19, "integerValue", v85);

          [(SKUIItem *)v17 setItemKind:v21];
        }
        v22 = objc_msgSend(v10, "objectForKey:", @"parentSalableName", v85);
        v23 = v22;
        if (v22)
        {
          id v24 = v22;
        }
        else
        {
          id v24 = [v10 objectForKey:@"salableName"];
        }
        v25 = v24;

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SKUIItem *)v17 setTitle:v25];
        }
        v26 = [v10 objectForKey:@"parentSalableAdamId"];
        v27 = v26;
        if (v26)
        {
          id v28 = v26;
        }
        else
        {
          id v28 = [v10 objectForKey:@"salableAdamId"];
        }
        v29 = v28;

        if (objc_opt_respondsToSelector()) {
          -[SKUIItem setItemIdentifier:](v17, "setItemIdentifier:", [v29 longLongValue]);
        }
        v30 = [v10 objectForKey:@"hiResCoverArtUrl"];
        v31 = v30;
        if (v30)
        {
          id v32 = v30;
        }
        else
        {
          id v32 = [v10 objectForKey:@"lowResCoverArtUrl"];
        }
        id v14 = v32;

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v33 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
          if (v33)
          {
            v34 = -[SKUIArtwork initWithURL:size:]([SKUIArtwork alloc], "initWithURL:size:", v33, 10.0, 10.0);
            int v35 = objc_alloc_init(SKUIArtworkList);
            v109 = v34;
            int v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
            [(SKUIArtworkList *)v35 setArtworks:v36];

            [(SKUIRedeemItem *)v17 setArtworks:v35];
            id v4 = v90;
          }
        }
        [v4 addObject:v17];
        goto LABEL_39;
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v102 objects:v111 count:16];
  }
  while (v7);
LABEL_51:

  v40 = v88;
  id v5 = v85;
LABEL_52:
  v89 = v40;
  v41 = objc_msgSend(v86, "objectForKey:", @"downloads", v85);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v93 = v41;
    id v42 = v41;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v98 objects:v108 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v99;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v99 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v98 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v48 = [v47 objectForKey:@"songId"];
            if (objc_opt_respondsToSelector())
            {
              id v49 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v48, "longLongValue"));
              v107 = v49;
              id v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
              v51 = [(SKUIRedeemOperation *)self _itemsForItemIdentifiers:v50];

              [v87 addObjectsFromArray:v51];
              id v4 = v90;
            }
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v98 objects:v108 count:16];
      }
      while (v44);
    }

    v41 = v93;
  }
  if ([v4 count])
  {
    if ([v4 count] == 1)
    {
      uint64_t v52 = [v4 valueForKeyPath:@"itemIdentifier"];
      v53 = (void *)v52;
      id v54 = (void *)MEMORY[0x1E4F1CBF0];
      if (v52) {
        id v54 = (void *)v52;
      }
      id v55 = v54;

      v56 = [MEMORY[0x1E4F1CAD0] setWithArray:v55];
      v57 = [v41 valueForKeyPath:@"songId"];

      v58 = [MEMORY[0x1E4F1CA48] array];
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v59 = v57;
      uint64_t v60 = [v59 countByEnumeratingWithState:&v94 objects:v106 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v95;
        do
        {
          for (uint64_t k = 0; k != v61; ++k)
          {
            if (*(void *)v95 != v62) {
              objc_enumerationMutation(v59);
            }
            uint64_t v64 = *(void *)(*((void *)&v94 + 1) + 8 * k);
            if (([v56 containsObject:v64] & 1) == 0) {
              [v58 addObject:v64];
            }
          }
          uint64_t v61 = [v59 countByEnumeratingWithState:&v94 objects:v106 count:16];
        }
        while (v61);
      }
    }
    else
    {
      v58 = 0;
      id v55 = v87;
    }
  }
  else
  {
    v58 = 0;
    id v55 = v4;
    id v4 = v87;
  }

  v65 = [v86 objectForKey:@"redeemedCredit"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v66 = [v65 objectForKey:@"totalCredit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v67 = v66;
    }
    else {
      id v67 = 0;
    }
    if (![v67 length])
    {
      v68 = [v65 objectForKey:@"money"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v66 = v68;

        id v67 = v66;
      }
      else
      {
        id v66 = v68;
      }
    }
  }
  else
  {
    id v67 = 0;
  }
  v69 = [v86 objectForKey:@"totalCredit"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v70 = [v69 objectForKey:@"totalCredit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v71 = v70;
    }
    else {
      id v71 = 0;
    }
    if (![v71 length])
    {
      v72 = [v69 objectForKey:@"money"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v70 = v72;

        id v71 = v70;
      }
      else
      {
        id v70 = v72;
      }
    }
  }
  else
  {
    id v71 = 0;
  }
  id v73 = [v86 objectForKey:@"creditDisplay"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v74 = [v73 stringValue];
  }
  else
  {
    uint64_t v74 = 0;
  }
  v75 = [v86 objectForKey:@"postRedemptionRedirectURL"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v76 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v75];
  }
  else {
    v76 = 0;
  }
  v77 = [v86 objectForKey:@"customizedThankYouPageURL"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v78 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v77];
  }
  else {
    v78 = 0;
  }
  v3 = [v86 objectForKey:@"iTunesPassAlertInterval"];

  double v79 = -1.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 doubleValue];
    double v79 = v80;
  }
  if ([v67 length] || objc_msgSend(v4, "count"))
  {
    v39 = objc_alloc_init(SKUIRedeem);
    [(SKUIRedeem *)v39 setBalance:v71];
    [(SKUIRedeem *)v39 setCredit:v67];
    [(SKUIRedeem *)v39 setCreditDisplay:v74];
    v81 = v89;
    [(SKUIRedeem *)v39 setInAppPurchase:v89];
    if ([v4 count]) {
      v82 = v4;
    }
    else {
      v82 = 0;
    }
    [(SKUIRedeem *)v39 setItems:v82];
    if ([v58 count]) {
      v83 = v58;
    }
    else {
      v83 = 0;
    }
    [(SKUIRedeem *)v39 setDownloads:v83];
    [(SKUIRedeem *)v39 setITunesPassLearnMoreAlertInterval:v79];
    [(SKUIRedeem *)v39 setRedirectURL:v76];
    [(SKUIRedeem *)v39 setCustomizedThankyouURL:v78];
  }
  else
  {
    v39 = 0;
    v81 = v89;
  }

LABEL_122:

  return v39;
}

- (id)_itemsForItemIdentifiers:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v40 + 1) + 8 * i) stringValue];
        [v4 addObject:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v6);
  }

  id v26 = objc_alloc_init(MEMORY[0x1E4FA81F0]);
  [v26 setKeyProfile:*MEMORY[0x1E4FA86D0]];
  [v26 setValue:v4 forRequestParameter:*MEMORY[0x1E4FA86F0]];
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__99;
  v38 = __Block_byref_object_dispose__99;
  id v39 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __48__SKUIRedeemOperation__itemsForItemIdentifiers___block_invoke;
  v31[3] = &unk_1E642AA40;
  v33 = &v34;
  id v11 = v10;
  id v32 = v11;
  [v26 startWithLookupBlock:v31];
  v25 = v11;
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  id v12 = [(id)v35[5] allItems];
  id v13 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        v19 = [SKUIItem alloc];
        v20 = objc_msgSend(v18, "lookupDictionary", v25);
        uint64_t v21 = [(SKUIItem *)v19 initWithLookupDictionary:v20];
        [v13 addObject:v21];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v44 count:16];
    }
    while (v15);
  }

  if ([v13 count]) {
    v22 = v13;
  }
  else {
    v22 = 0;
  }
  id v23 = v22;

  _Block_object_dispose(&v34, 8);

  return v23;
}

void __48__SKUIRedeemOperation__itemsForItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_applyThankYouDictionary:(id)a3 toRedeem:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [a3 objectForKey:@"typ"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_42;
  }
  uint64_t v7 = [v6 objectForKey:@"explanation"];
  unint64_t v8 = 0x1E4F1C000uLL;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v35 = v5;
      uint64_t v12 = *(void *)v42;
      int v13 = 1;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_opt_class();
          v13 &= objc_opt_isKindOfClass();
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v11);

      id v5 = v35;
      unint64_t v8 = 0x1E4F1C000;
      if ((v13 & 1) == 0) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    uint64_t v15 = [v9 componentsJoinedByString:@"\n"];
    [v5 setMessage:v15];
  }
LABEL_14:
  uint64_t v16 = [v6 objectForKey:@"title"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setTitle:v16];
  }
  v17 = [v6 objectForKey:@"finalPageUrl"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
    [v5 setRedirectURL:v18];
  }
  v19 = [v6 objectForKey:@"links"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v36 = v5;
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v27 = [[SKUILink alloc] initWithLinkDictionary:v26];
            if (v27) {
              [v20 addObject:v27];
            }
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v23);
    }

    id v5 = v36;
    [v36 setLinks:v20];

    unint64_t v8 = 0x1E4F1C000uLL;
  }
  long long v28 = [v6 objectForKey:@"artwork"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v29 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v28];

    long long v30 = [v29 objectForKey:@"imgSrc"];
    if (v30)
    {
      [v29 setObject:v30 forKey:@"url"];
      v31 = [v29 objectForKey:@"isLogo"];
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v31 BOOLValue])
      {
        id v32 = [SKUIArtworkList alloc];
        uint64_t v45 = v29;
        v33 = [*(id *)(v8 + 2424) arrayWithObjects:&v45 count:1];
        uint64_t v34 = [(SKUIArtworkList *)v32 initWithArtworkListArray:v33];

        if (v34) {
          [v5 setHeaderArtworkProvider:v34];
        }
      }
    }
  }
  else
  {
    long long v29 = v28;
  }

LABEL_42:
}

- (id)_requestPropertiesForThankYouWithURL:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FA8268];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithURL:v4];

  [v5 setITunesStoreRequest:1];
  uint64_t v6 = SSVDefaultUserAgent();
  [v5 setValue:v6 forHTTPHeaderField:@"User-Agent"];

  [v5 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

  return v5;
}

- (id)_performRequestWithProperties:(id)a3 error:(id *)a4
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__99;
  uint64_t v23 = __Block_byref_object_dispose__99;
  id v24 = 0;
  uint64_t v6 = [(SSURLConnectionRequest *)[SKUIURLConnectionRequest alloc] initWithRequestProperties:v4];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __59__SKUIRedeemOperation__performRequestWithProperties_error___block_invoke;
  uint64_t v16 = &unk_1E642A138;
  v18 = &v19;
  uint64_t v7 = v5;
  v17 = v7;
  [(SKUIURLConnectionRequest *)v6 startWithConnectionResponseBlock:&v13];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v8 = objc_msgSend((id)v20[5], "bodyData", v13, v14, v15, v16);
  if (v8)
  {
    id v9 = +[SSVURLDataConsumer consumer];
    uint64_t v10 = [v9 objectForData:v8 response:0 error:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  _Block_object_dispose(&v19, 8);

  return v11;
}

void __59__SKUIRedeemOperation__performRequestWithProperties_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)cameraRecognized
{
  return self->_cameraRecognized;
}

- (void)setCameraRecognized:(BOOL)a3
{
  self->_cameraRecognized = a3;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (id)resultBlock
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setResultBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_code, 0);
}

- (void)initWithCode:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemOperation initWithCode:]";
}

@end