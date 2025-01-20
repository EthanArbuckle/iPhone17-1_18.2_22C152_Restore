@interface PKPaymentTransactionIconGenerator
- (PKPaymentTransactionIconGenerator)initWithCache:(BOOL)a3 scale:(double)a4;
- (id)_cacheImageFromDownloaderCacheForURL:(id)a3;
- (id)_iconCacheKeyForApp:(int64_t)a3 bundleIdentifier:(id)a4 size:(CGSize)a5;
- (id)_iconCacheKeyForMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 imageOut:(id *)a6;
- (id)_iconCacheKeyForPayLaterMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 imageOut:(id *)a6;
- (id)_iconCacheKeyForPaymentTransaction:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 imageOut:(id *)a6;
- (id)_iconForCacheKey:(id)a3;
- (id)_iconForTransaction:(id)a3 merchant:(id)a4 payLaterMerchant:(id)a5 size:(CGSize)a6 ignoreLogoURL:(BOOL)a7 requestType:(unint64_t)a8 iconHandler:(id)a9;
- (id)fileDownloader;
- (id)iconCacheKeyForTransaction:(id)a3 size:(CGSize)a4;
- (id)iconForMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 requestType:(unint64_t)a6 iconHandler:(id)a7;
- (id)iconForPayLaterMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 requestType:(unint64_t)a6 iconHandler:(id)a7;
- (id)iconForTransaction:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 requestType:(unint64_t)a6 iconHandler:(id)a7;
- (void)_downloadLogoForURL:(id)a3 withCompletionHandler:(id)a4;
- (void)_iconForApplication:(int64_t)a3 applicationIdentifier:(id)a4 requestToProcess:(id)a5 iconHandler:(id)a6;
- (void)_iconForReleasedData:(id)a3 requestToProcess:(id)a4 iconHandler:(id)a5;
- (void)queue_processNextIconRequest;
@end

@implementation PKPaymentTransactionIconGenerator

- (PKPaymentTransactionIconGenerator)initWithCache:(BOOL)a3 scale:(double)a4
{
  BOOL v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentTransactionIconGenerator;
  v6 = [(PKPaymentTransactionIconGenerator *)&v21 init];
  if (v6)
  {
    v6->_hasNetworkAccess = PKProcessHasNetworkPrivilegies();
    v6->_useCache = v5;
    if (v5)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      iconCache = v6->_iconCache;
      v6->_iconCache = v7;

      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      iconCacheKeys = v6->_iconCacheKeys;
      v6->_iconCacheKeys = v9;
    }
    v6->_scale = a4;
    v6->_lockRequests._os_unfair_lock_opaque = 0;
    v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    highPriorityIconRequests = v6->_highPriorityIconRequests;
    v6->_highPriorityIconRequests = v11;

    v13 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    lowPriorityIconRequests = v6->_lowPriorityIconRequests;
    v6->_lowPriorityIconRequests = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    inflightRequests = v6->_inflightRequests;
    v6->_inflightRequests = v15;

    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passbook.transaction.icons", v17);
    queueIcons = v6->_queueIcons;
    v6->_queueIcons = (OS_dispatch_queue *)v18;
  }
  return v6;
}

- (id)iconForTransaction:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 requestType:(unint64_t)a6 iconHandler:(id)a7
{
  return -[PKPaymentTransactionIconGenerator _iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](self, "_iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", a3, 0, 0, a5, a6, a7, a4.width, a4.height);
}

- (id)iconCacheKeyForTransaction:(id)a3 size:(CGSize)a4
{
  return -[PKPaymentTransactionIconGenerator _iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:", a3, 1, 0, a4.width, a4.height);
}

- (id)iconForMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 requestType:(unint64_t)a6 iconHandler:(id)a7
{
  return -[PKPaymentTransactionIconGenerator _iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](self, "_iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", 0, a3, 0, a5, a6, a7, a4.width, a4.height);
}

- (id)iconForPayLaterMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 requestType:(unint64_t)a6 iconHandler:(id)a7
{
  return -[PKPaymentTransactionIconGenerator _iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](self, "_iconForTransaction:merchant:payLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", 0, 0, a3, a5, a6, a7, a4.width, a4.height);
}

- (id)_iconForTransaction:(id)a3 merchant:(id)a4 payLaterMerchant:(id)a5 size:(CGSize)a6 ignoreLogoURL:(BOOL)a7 requestType:(unint64_t)a8 iconHandler:(id)a9
{
  BOOL v11 = a7;
  double height = a6.height;
  double width = a6.width;
  v72[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a9;
  objc_super v21 = v20;
  if (!v20 || !v17 && !v18 && !v19)
  {
    id v22 = 0;
    goto LABEL_48;
  }
  id v70 = v20;
  if (v17)
  {
    id v23 = v18;
    -[PKPaymentTransactionIconGenerator _iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:", v17, v11, 0, width, height);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = self;
    [(PKPaymentTransactionIconGenerator *)self _iconForCacheKey:v24];
    v27 = unint64_t v26 = a8;
    v28 = [v17 merchant];
    LODWORD(v29) = CacheKeyIsFinalForMerchant(v24, v28, v11);

    v30 = (void *)v27;
    a8 = v26;
    if (!v30) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  if (v18)
  {
    -[PKPaymentTransactionIconGenerator _iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:", v18, v11, 0, width, height);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = v18;
    v25 = self;
    v30 = [(PKPaymentTransactionIconGenerator *)self _iconForCacheKey:v24];
    id v23 = v29;
    LODWORD(v29) = CacheKeyIsFinalForMerchant(v24, v29, v11);
    if (!v30) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  if (!v19)
  {
    v30 = [(PKPaymentTransactionIconGenerator *)self _iconForCacheKey:0];
    id v24 = 0;
    goto LABEL_26;
  }
  v31 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:", v19, v11, 0, width, height);
  uint64_t v61 = [(PKPaymentTransactionIconGenerator *)self _iconForCacheKey:v31];
  id v24 = v31;
  v66 = [v19 mapsBrand];
  v32 = [v66 logoURL];
  v33 = [v32 absoluteString];

  v67 = v33;
  if (!v33 || v11) {
    goto LABEL_21;
  }
  id v29 = v24;
  id v34 = v33;
  if (v34 == v29)
  {

LABEL_21:
    id v23 = 0;
    v25 = self;
    LODWORD(v29) = 1;
    goto LABEL_22;
  }
  v35 = v34;
  if (v29)
  {
    int v64 = [v29 isEqualToString:v34];

    if (!v64)
    {
      id v23 = 0;
      v25 = self;
      LODWORD(v29) = 0;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  id v23 = 0;
  v25 = self;

LABEL_22:
  v30 = (void *)v61;
  if (!v61)
  {
LABEL_25:
    self = v25;
    id v18 = v23;
    objc_super v21 = v70;
LABEL_26:
    v36 = objc_alloc_init(PKPaymentTransactionIconRequest);
    -[PKPaymentTransactionIconRequest setSize:](v36, "setSize:", width, height);
    [(PKPaymentTransactionIconRequest *)v36 setTransaction:v17];
    [(PKPaymentTransactionIconRequest *)v36 setMerchant:v18];
    [(PKPaymentTransactionIconRequest *)v36 setPayLaterMerchant:v19];
    [(PKPaymentTransactionIconRequest *)v36 setCacheKey:v24];
    [(PKPaymentTransactionIconRequest *)v36 setIgnoreLogoURL:v11];
    p_lockRequests = &self->_lockRequests;
    os_unfair_lock_lock(&self->_lockRequests);
    id v69 = v19;
    if (a8)
    {
      if (a8 != 1)
      {
        id v40 = 0;
        char v38 = 0;
LABEL_32:
        id v68 = v24;
        v65 = v40;
        if ([(NSMutableArray *)self->_inflightRequests containsObject:v36])
        {
          v62 = v30;
          v41 = [(NSMutableArray *)self->_inflightRequests objectAtIndex:[(NSMutableArray *)self->_inflightRequests indexOfObject:v36]];
          v42 = [v41 completionHandlers];
          v43 = (void *)[v21 copy];
          v44 = _Block_copy(v43);
          v45 = [v42 arrayByAddingObject:v44];
          [v41 setCompletionHandlers:v45];

          p_lockRequests = &self->_lockRequests;
          v46 = v65;

          v30 = v62;
LABEL_42:
          id v24 = v68;
          id v19 = v69;
          goto LABEL_43;
        }
        p_highPriorityIconRequests = &self->_highPriorityIconRequests;
        if ([(NSMutableOrderedSet *)self->_highPriorityIconRequests containsObject:v36])
        {
          if ((v38 & 1) == 0)
          {
            v48 = [0 completionHandlers];
            v49 = (void *)[v21 copy];
            v50 = v30;
            v51 = _Block_copy(v49);
            v52 = [v48 arrayByAddingObject:v51];
            [0 setCompletionHandlers:v52];

            v30 = v50;
            p_lockRequests = &self->_lockRequests;

            id v24 = v68;
            id v19 = v69;
            v46 = v65;
LABEL_43:
            if (self->_processingRequest)
            {
              os_unfair_lock_unlock(p_lockRequests);
            }
            else
            {
              self->_processingRequest = 1;
              os_unfair_lock_unlock(p_lockRequests);
              queueIcons = self->_queueIcons;
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __126__PKPaymentTransactionIconGenerator__iconForTransaction_merchant_payLaterMerchant_size_ignoreLogoURL_requestType_iconHandler___block_invoke;
              block[3] = &unk_1E59CA7D0;
              block[4] = self;
              dispatch_async(queueIcons, block);
            }
            id v22 = v30;

            goto LABEL_47;
          }
        }
        else
        {
          p_highPriorityIconRequests = &self->_lowPriorityIconRequests;
          if (![(NSMutableOrderedSet *)self->_lowPriorityIconRequests containsObject:v36])goto LABEL_40; {
        }
          }
        v53 = [(NSMutableOrderedSet *)*p_highPriorityIconRequests objectAtIndex:[(NSMutableOrderedSet *)*p_highPriorityIconRequests indexOfObject:v36]];
        [(NSMutableOrderedSet *)*p_highPriorityIconRequests removeObject:v36];
        if (v53)
        {
          v60 = [v53 completionHandlers];
          v54 = (void *)[v21 copy];
          v63 = v30;
          v55 = _Block_copy(v54);
          v56 = [v60 arrayByAddingObject:v55];
          [(PKPaymentTransactionIconRequest *)v36 setCompletionHandlers:v56];

          p_lockRequests = &self->_lockRequests;
          v30 = v63;

LABEL_41:
          v46 = v65;
          [v65 addObject:v36];
          goto LABEL_42;
        }
LABEL_40:
        v53 = (void *)[v21 copy];
        v72[0] = v53;
        v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
        [(PKPaymentTransactionIconRequest *)v36 setCompletionHandlers:v57];

        goto LABEL_41;
      }
      char v38 = 0;
      uint64_t v39 = 48;
    }
    else
    {
      char v38 = 1;
      uint64_t v39 = 40;
    }
    id v40 = *(id *)((char *)&self->super.isa + v39);
    goto LABEL_32;
  }
LABEL_23:
  if (!v29) {
    goto LABEL_25;
  }
  id v22 = v30;
  id v18 = v23;
  objc_super v21 = v70;
LABEL_47:

LABEL_48:

  return v22;
}

uint64_t __126__PKPaymentTransactionIconGenerator__iconForTransaction_merchant_payLaterMerchant_size_ignoreLogoURL_requestType_iconHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_processNextIconRequest");
}

- (void)queue_processNextIconRequest
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  p_lockRequests = &self->_lockRequests;
  os_unfair_lock_lock(&self->_lockRequests);
  uint64_t v4 = [(NSMutableOrderedSet *)self->_highPriorityIconRequests lastObject];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    [(NSMutableOrderedSet *)self->_highPriorityIconRequests removeObject:v4];
    os_unfair_lock_unlock(p_lockRequests);
LABEL_4:
    v46 = p_lockRequests;
    while (1)
    {
      v6 = (void *)MEMORY[0x1A6224460]();
      v7 = [v5 transaction];
      v8 = [v5 merchant];
      v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [v7 merchant];
      }
      BOOL v11 = v10;

      v12 = [v5 payLaterMerchant];
      uint64_t v13 = [v5 logoURL];
      uint64_t v14 = [v5 ignoreLogoURL];
      uint64_t v15 = v14;
      v51 = (void *)v13;
      if (v13)
      {
        if ((v14 & 1) == 0) {
          break;
        }
      }
      v49 = v12;
      if ([v7 transactionType] != 15 || objc_msgSend(v7, "transactionSource") != 2) {
        goto LABEL_32;
      }
      id v18 = [v7 releasedData];
      uint64_t v19 = [v18 application];
      if (!v19)
      {

LABEL_32:
        if (v7)
        {
          [v5 size];
          uint64_t v58 = 0;
          id v34 = (id *)&v58;
          id v35 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:", v7, v15, &v58);
          goto LABEL_38;
        }
        if (v11)
        {
          [v5 size];
          uint64_t v57 = 0;
          id v34 = (id *)&v57;
          id v36 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:", v11, v15, &v57);
          goto LABEL_38;
        }
        if (v12)
        {
          [v5 size];
          uint64_t v56 = 0;
          id v34 = (id *)&v56;
          id v37 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:", v12, v15, &v56);
LABEL_38:
          char v38 = v11;
          id v24 = *v34;
        }
        else
        {
          char v38 = 0;
          id v24 = 0;
        }
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        uint64_t v39 = [v5 completionHandlers];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v52 objects:v73 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v53 != v42) {
                objc_enumerationMutation(v39);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v52 + 1) + 8 * i) + 16))();
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v52 objects:v73 count:16];
          }
          while (v41);
        }

        p_lockRequests = v46;
        BOOL v11 = v38;
        v12 = v49;
        goto LABEL_47;
      }
      id v20 = (void *)v19;
      [v7 releasedData];
      objc_super v21 = v48 = v6;
      [v21 application];
      v23 = id v22 = v11;
      uint64_t v45 = [v23 client];

      BOOL v11 = v22;
      v12 = v49;

      v6 = v48;
      if (v45 != 2) {
        goto LABEL_32;
      }
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __65__PKPaymentTransactionIconGenerator_queue_processNextIconRequest__block_invoke_79;
      v59[3] = &unk_1E59DBD88;
      id v60 = v5;
      [(PKPaymentTransactionIconGenerator *)self _iconForReleasedData:v7 requestToProcess:v60 iconHandler:v59];
      id v24 = v60;
LABEL_47:

      os_unfair_lock_lock(p_lockRequests);
      uint64_t v44 = [(NSMutableOrderedSet *)self->_highPriorityIconRequests lastObject];

      if (v44)
      {
        [(NSMutableOrderedSet *)self->_highPriorityIconRequests removeObject:v44];
        BOOL v5 = (void *)v44;
      }
      else
      {
        BOOL v5 = [(NSMutableOrderedSet *)self->_lowPriorityIconRequests lastObject];
        [(NSMutableOrderedSet *)self->_lowPriorityIconRequests removeObject:v5];
      }
      os_unfair_lock_unlock(p_lockRequests);

      if (!v5) {
        goto LABEL_54;
      }
    }
    v47 = v6;
    if (v7)
    {
      [v5 size];
      uint64_t v72 = 0;
      v16 = (id *)&v72;
      uint64_t v17 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPaymentTransaction:size:ignoreLogoURL:imageOut:", v7, 0, &v72);
    }
    else if (v11)
    {
      [v5 size];
      uint64_t v71 = 0;
      v16 = (id *)&v71;
      uint64_t v17 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:", v11, 0, &v71);
    }
    else
    {
      if (!v12)
      {
        id v24 = 0;
        v25 = 0;
LABEL_30:
        os_unfair_lock_lock(p_lockRequests);
        [(NSMutableArray *)self->_inflightRequests addObject:v5];
        os_unfair_lock_unlock(p_lockRequests);
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __65__PKPaymentTransactionIconGenerator_queue_processNextIconRequest__block_invoke;
        v61[3] = &unk_1E59DD948;
        id v32 = v51;
        id v62 = v32;
        v63 = self;
        id v64 = v25;
        id v65 = v5;
        id v33 = v25;
        [(PKPaymentTransactionIconGenerator *)self _downloadLogoForURL:v32 withCompletionHandler:v61];

        v6 = v47;
        goto LABEL_47;
      }
      [v5 size];
      uint64_t v70 = 0;
      v16 = (id *)&v70;
      uint64_t v17 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForPayLaterMerchant:size:ignoreLogoURL:imageOut:", v12, 0, &v70);
    }
    v25 = (void *)v17;
    id v24 = *v16;
    if (v24)
    {
      v50 = v12;
      unint64_t v26 = v11;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      uint64_t v27 = [v5 completionHandlers];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v66 objects:v74 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v67;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v67 != v30) {
              objc_enumerationMutation(v27);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v66 + 1) + 8 * j) + 16))();
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v66 objects:v74 count:16];
        }
        while (v29);
      }

      p_lockRequests = v46;
      BOOL v11 = v26;
      v12 = v50;
    }
    goto LABEL_30;
  }
  BOOL v5 = [(NSMutableOrderedSet *)self->_lowPriorityIconRequests lastObject];
  [(NSMutableOrderedSet *)self->_lowPriorityIconRequests removeObject:v5];
  os_unfair_lock_unlock(p_lockRequests);
  if (v5) {
    goto LABEL_4;
  }
LABEL_54:
  os_unfair_lock_lock(p_lockRequests);
  self->_processingRequest = 0;
  os_unfair_lock_unlock(p_lockRequests);
}

void __65__PKPaymentTransactionIconGenerator_queue_processNextIconRequest__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5 && !a3)
  {
    v6 = [MEMORY[0x1E4FB1818] imageWithData:v5];
    v7 = [*(id *)(a1 + 32) absoluteString];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 80));
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v7;
        __int16 v24 = 2048;
        uint64_t v25 = [v5 length];
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Downloaded data did not result in an image, key: %@, data length: %lu", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v10 + 24))
      {
        [*(id *)(v10 + 8) setObject:v6 forKey:v7];
        [*(id *)(*(void *)(a1 + 40) + 16) addObject:v7];
      }
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (*(void *)(a1 + 48) && *(unsigned char *)(v11 + 24))
    {
      objc_msgSend(*(id *)(v11 + 8), "removeObjectForKey:");
      [*(id *)(*(void *)(a1 + 40) + 16) addObject:*(void *)(a1 + 48)];
      uint64_t v11 = *(void *)(a1 + 40);
    }
    [*(id *)(v11 + 56) removeObject:*(void *)(a1 + 56)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 80));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = objc_msgSend(*(id *)(a1 + 56), "completionHandlers", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v16++) + 16))();
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

void __65__PKPaymentTransactionIconGenerator_queue_processNextIconRequest__block_invoke_79(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "completionHandlers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_iconForCacheKey:(id)a3
{
  id v4 = a3;
  if (v4 && self->_useCache)
  {
    os_unfair_lock_lock(&self->_lockRequests);
    uint64_t v5 = [(NSMutableDictionary *)self->_iconCache objectForKey:v4];
    [(NSMutableArray *)self->_iconCacheKeys removeObject:v4];
    [(NSMutableArray *)self->_iconCacheKeys addObject:v4];
    if ((unint64_t)[(NSMutableArray *)self->_iconCacheKeys count] >= 0x12D)
    {
      uint64_t v6 = [(NSMutableArray *)self->_iconCacheKeys firstObject];
      [(NSMutableArray *)self->_iconCacheKeys removeObject:v6];
      [(NSMutableDictionary *)self->_iconCache removeObjectForKey:v6];
    }
    os_unfair_lock_unlock(&self->_lockRequests);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_iconCacheKeyForPaymentTransaction:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 imageOut:(id *)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  long long v12 = [v11 merchant];
  switch([MEMORY[0x1E4F84D18] iconTypeForTransaction:v11 ignoreLogoURL:v7])
  {
    case 0:
      uint64_t v13 = [v11 merchant];
      uint64_t v14 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:](self, "_iconCacheKeyForMerchant:size:ignoreLogoURL:imageOut:", v13, v7, a6, width, height);

      goto LABEL_31;
    case 1:
      uint64_t v15 = [v11 transitType];
      if (v7)
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = [v12 logoImageURL];
      }
      uint64_t v30 = [(PKPaymentTransactionIconGenerator *)self _cacheImageFromDownloaderCacheForURL:v16];
      if (v30)
      {
        id v21 = (id)v30;
        uint64_t v14 = [v16 absoluteString];
        int v31 = 0;
        goto LABEL_45;
      }
      id v32 = NSString;
      id v33 = [v12 uniqueIdentifier];
      v54.double width = width;
      v54.double height = height;
      id v34 = NSStringFromCGSize(v54);
      uint64_t v14 = [v32 stringWithFormat:@"%lu-%@-%@", v15, v33, v34];

      if (v15 == 513)
      {
        uint64_t v35 = PKIconCurrencyCodeForTransaction(v11);
        id v36 = (void *)v35;
        if (v35)
        {
          uint64_t v37 = [v14 stringByAppendingFormat:@"-%@", v35];

          uint64_t v14 = (void *)v37;
        }
      }
      uint64_t v38 = [(PKPaymentTransactionIconGenerator *)self _iconForCacheKey:v14];
      id v21 = (id)v38;
      int v31 = 0;
      if (!a6 || v38) {
        goto LABEL_45;
      }
      uint64_t v39 = PKGEOFeaturesStyleAttributesFromTransitType(v15);
      uint64_t v40 = v39;
      if (v39)
      {
        PKIconFromGEOFeatureStyleAttributes(v39, 0, width, height, self->_scale);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        if (v21) {
          goto LABEL_44;
        }
        uint64_t v41 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v49 = v40;
          __int16 v50 = 2048;
          uint64_t v51 = v15;
          _os_log_impl(&dword_19F450000, v41, OS_LOG_TYPE_DEFAULT, "Missing icon for attributes: %@, transitSubtype: %ld, falling back to default transit icon", buf, 0x16u);
        }

        uint64_t v42 = PKDefaultTransitIcon(0, width, height, self->_scale);
      }
      else if (v15 == 517)
      {
        uint64_t v42 = PKDefaultCardReadIcon(0, width, height, self->_scale);
      }
      else
      {
        if (v15 == 513) {
          PKDefaultTopUpIconForTransaction(v11, 0, width, height, self->_scale);
        }
        else {
        uint64_t v42 = PKIconForMerchant(v12, 0, 0, 1, width, height, self->_scale);
        }
      }
      id v21 = (id)v42;
LABEL_44:

      int v31 = 1;
LABEL_45:

      long long v17 = 0;
      goto LABEL_46;
    case 2:
      long long v17 = [MEMORY[0x1E4F84D18] staticIconNameForTransaction:v11];
      if (!v17)
      {
        id v21 = 0;
        uint64_t v14 = 0;
        goto LABEL_33;
      }
      long long v18 = NSString;
      v53.double width = width;
      v53.double height = height;
      long long v19 = NSStringFromCGSize(v53);
      uint64_t v14 = [v18 stringWithFormat:@"%@-%@", v17, v19];

      if (!a6)
      {
        id v21 = 0;
        goto LABEL_33;
      }
      uint64_t v20 = [(PKPaymentTransactionIconGenerator *)self _iconForCacheKey:v14];
      if (v20)
      {
        id v21 = (id)v20;
LABEL_33:
        BOOL v43 = v21 != 0;
        goto LABEL_51;
      }
      uint64_t v44 = PKPassKitUIBundle();
      uint64_t v45 = [v44 URLForResource:v17 withExtension:@"pdf"];
      PKUIImageFromPDF(v45, width, height, self->_scale);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        PKUIImageNamed(v17);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      int v31 = 1;
LABEL_46:
      BOOL v43 = v21 != 0;
      if (v21 && v14 && v31 && self->_useCache)
      {
        os_unfair_lock_lock(&self->_lockRequests);
        [(NSMutableDictionary *)self->_iconCache setObject:v21 forKey:v14];
        [(NSMutableArray *)self->_iconCacheKeys addObject:v14];
        os_unfair_lock_unlock(&self->_lockRequests);
      }
LABEL_51:
      if (a6 && v43)
      {
        id v21 = v21;
        *a6 = v21;
      }
LABEL_54:
      id v46 = v14;

      return v46;
    case 3:
      id v22 = [v11 releasedData];
      id v23 = [v22 application];
      uint64_t v24 = [v23 client];

      if (v24 != 2) {
        goto LABEL_13;
      }
      uint64_t v25 = [v11 releasedData];
      uint64_t v26 = [v25 application];
      uint64_t v27 = [v26 bundleIdentifier];

      uint64_t v28 = [v11 merchant];
      uint64_t v29 = [v28 adamIdentifier];

      if (v29 > 0 || v27)
      {
        uint64_t v14 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForApp:bundleIdentifier:size:](self, "_iconCacheKeyForApp:bundleIdentifier:size:", v29, v27, width, height);
      }
      else
      {
        uint64_t v14 = 0;
      }

LABEL_31:
      long long v17 = 0;
      id v21 = 0;
      goto LABEL_54;
    default:
LABEL_13:
      long long v17 = 0;
      id v21 = 0;
      uint64_t v14 = 0;
      goto LABEL_54;
  }
}

- (id)_iconCacheKeyForMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 imageOut:(id *)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a3;
  long long v12 = v11;
  if (a5)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = [v11 logoImageURL];
  }
  uint64_t v14 = [(PKPaymentTransactionIconGenerator *)self _cacheImageFromDownloaderCacheForURL:v13];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = [v13 absoluteString];
    BOOL v17 = a6 != 0;
  }
  else
  {
    long long v19 = NSString;
    uint64_t v20 = [v12 uniqueIdentifier];
    v24.CGFloat width = width;
    v24.CGFloat height = height;
    id v21 = NSStringFromCGSize(v24);
    uint64_t v16 = [v19 stringWithFormat:@"%@-%@", v20, v21];

    uint64_t v22 = [(PKPaymentTransactionIconGenerator *)self _iconForCacheKey:v16];
    uint64_t v15 = (void *)v22;
    BOOL v17 = a6 != 0;
    if (a6)
    {
      if (!v22)
      {
        BOOL v17 = 1;
        uint64_t v15 = PKIconForMerchant(v12, 0, 0, 1, width, height, self->_scale);
        if (v15)
        {
          if (v16 && self->_useCache)
          {
            os_unfair_lock_lock(&self->_lockRequests);
            [(NSMutableDictionary *)self->_iconCache setObject:v15 forKey:v16];
            [(NSMutableArray *)self->_iconCacheKeys addObject:v16];
            os_unfair_lock_unlock(&self->_lockRequests);
            BOOL v17 = 1;
          }
        }
      }
    }
  }
  if (v17 && v15) {
    *a6 = v15;
  }

  return v16;
}

- (id)_iconCacheKeyForPayLaterMerchant:(id)a3 size:(CGSize)a4 ignoreLogoURL:(BOOL)a5 imageOut:(id *)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a3;
  long long v12 = v11;
  if (a5)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v14 = [v11 mapsBrand];
    uint64_t v13 = [v14 logoURL];
  }
  uint64_t v15 = [(PKPaymentTransactionIconGenerator *)self _cacheImageFromDownloaderCacheForURL:v13];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    BOOL v17 = [v13 absoluteString];
  }
  else
  {
    long long v18 = NSString;
    long long v19 = [v12 uniqueIdentifier];
    v24.CGFloat width = width;
    v24.CGFloat height = height;
    uint64_t v20 = NSStringFromCGSize(v24);
    BOOL v17 = [v18 stringWithFormat:@"%@-%@", v19, v20];

    uint64_t v21 = [(PKPaymentTransactionIconGenerator *)self _iconForCacheKey:v17];
    if (v21)
    {
      uint64_t v16 = (void *)v21;
    }
    else
    {
      uint64_t v16 = PKIconForPayLaterMerchant(v12, 0, 0, width, height, self->_scale);
      if (v16 && v17 && self->_useCache)
      {
        os_unfair_lock_lock(&self->_lockRequests);
        [(NSMutableDictionary *)self->_iconCache setObject:v16 forKey:v17];
        [(NSMutableArray *)self->_iconCacheKeys addObject:v17];
        os_unfair_lock_unlock(&self->_lockRequests);
      }
    }
  }
  if (a6 && v16) {
    *a6 = v16;
  }

  return v17;
}

- (id)_cacheImageFromDownloaderCacheForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 absoluteString];
  if (v5)
  {
    uint64_t v6 = [(PKPaymentTransactionIconGenerator *)self _iconForCacheKey:v5];
    if (!v6)
    {
      BOOL v7 = [(PKPaymentTransactionIconGenerator *)self fileDownloader];
      uint64_t v8 = [v7 cachedDataForURL:v4];

      if (v8)
      {
        uint64_t v6 = [MEMORY[0x1E4FB1818] imageWithData:v8];
        if (v6 && self->_useCache)
        {
          os_unfair_lock_lock(&self->_lockRequests);
          [(NSMutableDictionary *)self->_iconCache setObject:v6 forKey:v5];
          [(NSMutableArray *)self->_iconCacheKeys addObject:v5];
          os_unfair_lock_unlock(&self->_lockRequests);
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_downloadLogoForURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_hasNetworkAccess)
  {
    uint64_t v8 = [(PKPaymentTransactionIconGenerator *)self fileDownloader];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__PKPaymentTransactionIconGenerator__downloadLogoForURL_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E59CE028;
    id v13 = v7;
    [v8 downloadFromUrl:v6 completionHandler:v12];
  }
  else
  {
    paymentService = self->_paymentService;
    if (!paymentService)
    {
      long long v10 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
      id v11 = self->_paymentService;
      self->_paymentService = v10;

      paymentService = self->_paymentService;
    }
    [(PKPaymentService *)paymentService logoImageDataForURL:v6 completion:v7];
  }
}

uint64_t __79__PKPaymentTransactionIconGenerator__downloadLogoForURL_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fileDownloader
{
  fileDownloader = self->_fileDownloader;
  if (fileDownloader || !self->_hasNetworkAccess)
  {
    id v3 = fileDownloader;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    [v5 setTimeoutIntervalForResource:15.0];
    [v5 setRequestCachePolicy:0];
    [v5 setHTTPMaximumConnectionsPerHost:10];
    id v6 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v5];
    id v7 = (PKObjectDownloader *)[objc_alloc(MEMORY[0x1E4F84830]) initWithSession:v6];
    uint64_t v8 = self->_fileDownloader;
    self->_fileDownloader = v7;

    id v3 = self->_fileDownloader;
  }

  return v3;
}

- (id)_iconCacheKeyForApp:(int64_t)a3 bundleIdentifier:(id)a4 size:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v8 = a4;
  long long v9 = v8;
  if (a3 >= 1)
  {
    long long v10 = NSString;
    v16.CGFloat width = width;
    v16.CGFloat height = height;
    id v11 = NSStringFromCGSize(v16);
    [v10 stringWithFormat:@"app-%lu-%@", a3, v11];
    id v13 = LABEL_5:;

    goto LABEL_6;
  }
  if (v8)
  {
    long long v12 = NSString;
    v17.CGFloat width = width;
    v17.CGFloat height = height;
    id v11 = NSStringFromCGSize(v17);
    [v12 stringWithFormat:@"app-%@-%@", v9, v11];
    goto LABEL_5;
  }
  id v13 = 0;
LABEL_6:

  return v13;
}

- (void)_iconForReleasedData:(id)a3 requestToProcess:(id)a4 iconHandler:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [v18 releasedData];
  id v11 = [v10 application];
  uint64_t v12 = [v11 client];

  if (v12 == 2)
  {
    id v13 = [v18 merchant];
    uint64_t v14 = [v13 adamIdentifier];
    uint64_t v15 = [v18 releasedData];
    CGSize v16 = [v15 application];
    CGSize v17 = [v16 bundleIdentifier];
    [(PKPaymentTransactionIconGenerator *)self _iconForApplication:v14 applicationIdentifier:v17 requestToProcess:v8 iconHandler:v9];
  }
}

- (void)_iconForApplication:(int64_t)a3 applicationIdentifier:(id)a4 requestToProcess:(id)a5 iconHandler:(id)a6
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void *, uint64_t))a6;
  [v11 size];
  if (a3 > 0 || v10)
  {
    id v18 = -[PKPaymentTransactionIconGenerator _iconCacheKeyForApp:bundleIdentifier:size:](self, "_iconCacheKeyForApp:bundleIdentifier:size:", a3, v10);
    long long v19 = [(PKPaymentTransactionIconGenerator *)self _iconForCacheKey:v18];
    if (v19)
    {
      v12[2](v12, v19, 1);
    }
    else
    {
      if (a3)
      {
        uint64_t v20 = [NSNumber numberWithInteger:a3];
        v37[0] = v20;
        a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
      }
      if (v10)
      {
        id v36 = v10;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      }
      else
      {
        uint64_t v21 = 0;
      }
      uint64_t v22 = [[PKLinkedApplication alloc] initWithApplicationIdentifiers:v21 storeIDs:a3 defaultLaunchURL:0];
      [(PKLinkedApplication *)v22 setShouldApplyMask:0];
      [(PKLinkedApplication *)v22 setShouldApplyBorder:0];
      [v11 size];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      double v27 = PKUIScreenScale();
      uint64_t v28 = PKIconForMerchant(0, 0, 0, 1, v24, v26, v27);
      v12[2](v12, v28, 0);
      os_unfair_lock_lock(&self->_lockRequests);
      [(NSMutableArray *)self->_inflightRequests addObject:v11];
      os_unfair_lock_unlock(&self->_lockRequests);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __108__PKPaymentTransactionIconGenerator__iconForApplication_applicationIdentifier_requestToProcess_iconHandler___block_invoke;
      v30[3] = &unk_1E59CF3E0;
      int v31 = v22;
      id v32 = self;
      id v33 = v18;
      id v34 = v11;
      uint64_t v35 = v12;
      uint64_t v29 = v22;
      [(PKLinkedApplication *)v29 reloadApplicationStateIfNecessaryWithCompletion:v30];
    }
  }
  else
  {
    [v11 size];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    double v17 = PKUIScreenScale();
    id v18 = PKIconForMerchant(0, 0, 0, 1, v14, v16, v17);
    v12[2](v12, v18, 1);
  }
}

void __108__PKPaymentTransactionIconGenerator__iconForApplication_applicationIdentifier_requestToProcess_iconHandler___block_invoke(uint64_t a1)
{
  uint64_t v5 = [*(id *)(a1 + 32) iconImage];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 80));
  uint64_t v2 = *(void *)(a1 + 40);
  if (v5 && *(unsigned char *)(v2 + 24) && *(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(v2 + 8), "setObject:forKey:");
    [*(id *)(*(void *)(a1 + 40) + 16) addObject:*(void *)(a1 + 48)];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  [*(id *)(v2 + 56) removeObject:*(void *)(a1 + 56)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 80));
  uint64_t v3 = *(void *)(a1 + 64);
  id v4 = (void *)v5;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, v5, 1);
    id v4 = (void *)v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_fileDownloader, 0);
  objc_storeStrong((id *)&self->_queueIcons, 0);
  objc_storeStrong((id *)&self->_inflightRequests, 0);
  objc_storeStrong((id *)&self->_lowPriorityIconRequests, 0);
  objc_storeStrong((id *)&self->_highPriorityIconRequests, 0);
  objc_storeStrong((id *)&self->_iconCacheKeys, 0);

  objc_storeStrong((id *)&self->_iconCache, 0);
}

@end