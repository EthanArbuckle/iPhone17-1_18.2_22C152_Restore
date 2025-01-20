@interface SUUISyncWishlistOperation
- (BOOL)_loadRemoteItemsForWishlist:(id)a3 didChange:(BOOL *)a4 error:(id *)a5;
- (BOOL)_mergeItems:(id)a3 wishlist:(id)a4 didChange:(BOOL *)a5 error:(id *)a6;
- (SUUISyncWishlistOperation)init;
- (SUUISyncWishlistOperation)initWithClientContext:(id)a3;
- (id)resultBlock;
- (void)_sendLocalChangesForWishlist:(id)a3;
- (void)main;
- (void)setResultBlock:(id)a3;
@end

@implementation SUUISyncWishlistOperation

- (SUUISyncWishlistOperation)init
{
  v3 = +[SUUIClientContext defaultContext];
  v4 = [(SUUISyncWishlistOperation *)self initWithClientContext:v3];

  return v4;
}

- (SUUISyncWishlistOperation)initWithClientContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUISyncWishlistOperation;
  v6 = [(SUUISyncWishlistOperation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUISyncWishlistOperation", 0);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (id)resultBlock
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__39;
  v10 = __Block_byref_object_dispose__39;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SUUISyncWishlistOperation_resultBlock__block_invoke;
  v5[3] = &unk_2654008E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __40__SUUISyncWishlistOperation_resultBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 264) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)setResultBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SUUISyncWishlistOperation_setResultBlock___block_invoke;
  v7[3] = &unk_265400DC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void *__44__SUUISyncWishlistOperation_setResultBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 264) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 264);
    *(void *)(v5 + 264) = v4;
    return (void *)MEMORY[0x270F9A758](v4, v6);
  }
  return result;
}

- (void)main
{
  unsigned __int8 v13 = 0;
  uint64_t v3 = [MEMORY[0x263F7B0E8] defaultStore];
  uint64_t v4 = [v3 activeAccount];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F7B428]);
    uint64_t v6 = [v4 uniqueIdentifier];
    v7 = objc_msgSend(v5, "initWithAccountIdentifier:", objc_msgSend(v6, "longLongValue"));

    [(SUUISyncWishlistOperation *)self _sendLocalChangesForWishlist:v7];
    id v12 = 0;
    BOOL v8 = [(SUUISyncWishlistOperation *)self _loadRemoteItemsForWishlist:v7 didChange:&v13 error:&v12];
    id v9 = v12;
  }
  else
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7BD38] code:1 userInfo:0];
    BOOL v8 = 0;
  }
  uint64_t v10 = [(SUUISyncWishlistOperation *)self resultBlock];
  id v11 = (void *)v10;
  if (v10) {
    (*(void (**)(uint64_t, BOOL, void, id))(v10 + 16))(v10, v8, v13, v9);
  }
}

- (BOOL)_loadRemoteItemsForWishlist:(id)a3 didChange:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  v50[0] = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__5;
  v48 = __Block_byref_object_dispose__6;
  id v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  id v9 = [(SUUIClientContext *)self->_clientContext URLBag];
  uint64_t v10 = [v9 valueForKey:@"viewWishlistBaseUrl" error:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v20 = [v19 shouldLog];
    int v21 = [v19 shouldLogToDisk];
    v22 = [v19 OSLogObject];
    v23 = v22;
    if (v21) {
      v20 |= 2u;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      int v24 = v20;
    }
    else {
      int v24 = v20 & 2;
    }
    if (v24)
    {
      LOWORD(v34) = 0;
      LODWORD(v31) = 2;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_14:

        uint64_t v26 = SSError();
        id v11 = (void *)v45[5];
        v45[5] = v26;
        goto LABEL_15;
      }
      v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v34, v31);
      free(v25);
      SSFileLog();
    }

    goto LABEL_14;
  }
  id v11 = (void *)[objc_alloc(NSURL) initWithString:v10];
  id v12 = (void *)[objc_alloc(MEMORY[0x263EFC5E8]) initWithURL:v11];
  [v12 setCachePolicy:1];
  unsigned __int8 v13 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v11];
  v14 = +[SSVURLDataConsumer consumer];
  [v13 setDataConsumer:v14];

  [v13 setITunesStoreRequest:1];
  v15 = [(SUUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
  [v13 setStoreFrontSuffix:v15];

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__5;
  v38 = __Block_byref_object_dispose__6;
  id v39 = 0;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __73__SUUISyncWishlistOperation__loadRemoteItemsForWishlist_didChange_error___block_invoke;
  v33[3] = &unk_265404318;
  v33[4] = &v44;
  v33[5] = &v34;
  v33[6] = &v40;
  [v13 setOutputBlock:v33];
  [v13 main];
  if (*((unsigned char *)v41 + 24))
  {
    uint64_t v16 = v35[5];
    v17 = (id *)(v45 + 5);
    id obj = (id)v45[5];
    BOOL v18 = [(SUUISyncWishlistOperation *)self _mergeItems:v16 wishlist:v8 didChange:v50 error:&obj];
    objc_storeStrong(v17, obj);
    *((unsigned char *)v41 + 24) = v18;
  }
  _Block_object_dispose(&v34, 8);

LABEL_15:
  v27 = v41;
  int v28 = *((unsigned __int8 *)v41 + 24);
  if (a4 && *((unsigned char *)v41 + 24))
  {
    *a4 = v50[0];
    int v28 = *((unsigned __int8 *)v27 + 24);
  }
  if (a5 && !v28)
  {
    *a5 = (id) v45[5];
    int v28 = *((unsigned __int8 *)v41 + 24);
  }
  BOOL v29 = v28 != 0;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v29;
}

void __73__SUUISyncWishlistOperation__loadRemoteItemsForWishlist_didChange_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
}

- (BOOL)_mergeItems:(id)a3 wishlist:(id)a4 didChange:(BOOL *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__SUUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke;
  v17[3] = &unk_265404390;
  id v11 = v9;
  id v18 = v11;
  int v20 = &v26;
  int v21 = &v22;
  id v12 = v10;
  id v19 = v12;
  [v12 performTransactionWithBlock:v17];
  unsigned __int8 v13 = v23;
  int v14 = *((unsigned __int8 *)v23 + 24);
  if (a5 && *((unsigned char *)v23 + 24))
  {
    *a5 = *((unsigned char *)v27 + 24);
    int v14 = *((unsigned __int8 *)v13 + 24);
  }
  if (a6 && !v14)
  {
    *a6 = 0;
    int v14 = *((unsigned __int8 *)v23 + 24);
  }
  BOOL v15 = v14 != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

BOOL __66__SUUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v5 = [MEMORY[0x263F7B308] predicateWithProperty:*MEMORY[0x263F7BD60] equalToLongLong:0];
  uint64_t v6 = [MEMORY[0x263F7B430] queryWithDatabase:v3 predicate:v5];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __66__SUUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke_2;
  v33[3] = &unk_265404340;
  id v7 = v4;
  id v34 = v7;
  [v6 enumeratePersistentIDsUsingBlock:v33];
  id v8 = *(void **)(a1 + 32);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __66__SUUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke_3;
  v29[3] = &unk_265404368;
  id v9 = v3;
  id v30 = v9;
  id v10 = v7;
  id v31 = v10;
  long long v32 = *(_OWORD *)(a1 + 48);
  [v8 enumerateObjectsUsingBlock:v29];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v23 = v6;
    uint64_t v24 = v5;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x25A2A9B80]();
        id v18 = objc_msgSend(objc_alloc(MEMORY[0x263F7B430]), "initWithPersistentID:inDatabase:", objc_msgSend(v16, "longLongValue"), v9);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v18 deleteFromDatabase];

        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
          if (v13) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    uint64_t v6 = v23;
    id v5 = v24;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v19 = *(void **)(a1 + 40);
    int v20 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    [v19 setLastSyncTime:v20];

    BOOL v21 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 0;
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

void __66__SUUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[objc_alloc(NSNumber) initWithLongLong:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

void __66__SUUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke_3(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  id v7 = (void *)MEMORY[0x25A2A9B80]();
  id v8 = SUUIWishlistItemPropertiesWithItem(v15);
  if (v8)
  {
    id v9 = [NSNumber numberWithUnsignedInteger:a3 + 1];
    [v8 setObject:v9 forKey:*MEMORY[0x263F7BD58]];

    id v10 = objc_msgSend(MEMORY[0x263F7B308], "predicateWithProperty:equalToLongLong:", *MEMORY[0x263F7BD48], objc_msgSend(v15, "itemIdentifier"));
    id v11 = [MEMORY[0x263F7B430] anyInDatabase:a1[4] predicate:v10];
    if (v11)
    {
      uint64_t v12 = v11;
      [v11 setValuesWithDictionary:v8];
      uint64_t v13 = (void *)a1[5];
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "persistentID"));
      [v13 removeObject:v14];
    }
    else
    {
      [v8 setObject:&unk_2705D0B68 forKey:*MEMORY[0x263F7BD60]];
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F7B430]) initWithPropertyValues:v8 inDatabase:a1[4]];
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v12 != 0;
      *a4 = *(unsigned char *)(*(void *)(a1[7] + 8) + 24) ^ 1;
    }
  }
}

- (void)_sendLocalChangesForWishlist:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __58__SUUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke;
  v23[3] = &unk_265403098;
  id v5 = v4;
  id v24 = v5;
  [v3 performTransactionWithBlock:v23];
  if (![v5 count]) {
    goto LABEL_19;
  }
  uint64_t v6 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  id v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v10 = [v5 count];
  int v26 = 134217984;
  uint64_t v27 = v10;
  LODWORD(v18) = 12;
  v17 = &v26;
  id v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    id v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v26, v18);
    free(v11);
    v17 = (int *)v9;
    SSFileLog();
LABEL_10:
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "main", v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v14);
  }

LABEL_19:
}

uint64_t __58__SUUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke(uint64_t a1, void *a2)
{
  location[1] = *(id *)MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F7BD60];
  id v5 = [MEMORY[0x263F7B308] predicateWithProperty:*MEMORY[0x263F7BD60] equalToLongLong:1];
  uint64_t v6 = [MEMORY[0x263F7B430] queryWithDatabase:v3 predicate:v5];
  location[0] = (id)*MEMORY[0x263F7BD40];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__SUUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke_2;
  v14[3] = &unk_2654043B8;
  id v15 = *(id *)(a1 + 32);
  [v6 enumeratePersistentIDsAndProperties:location count:1 usingBlock:v14];
  int v7 = [MEMORY[0x263F7B308] predicateWithProperty:v4 equalToLongLong:2];

  int v8 = [MEMORY[0x263F7B430] queryWithDatabase:v3 predicate:v7];

  objc_storeStrong(location, (id)*MEMORY[0x263F7BD48]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__SUUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke_3;
  v11[3] = &unk_2654043E0;
  id v12 = v3;
  id v13 = *(id *)(a1 + 32);
  id v9 = v3;
  [v8 enumeratePersistentIDsAndProperties:location count:1 usingBlock:v11];

  return 1;
}

void __58__SUUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x25A2A9B80]();
  if (*a3)
  {
    uint64_t v6 = [MEMORY[0x263F08900] JSONObjectWithData:*a3 options:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = [[SUUIItem alloc] initWithCacheRepresentation:v6];
      if (v7)
      {
        int v8 = [[SUUIAddToWishlistOperation alloc] initWithItem:v7 reason:1];
        [*(id *)(a1 + 32) addObject:v8];
      }
    }
  }
}

void __58__SUUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke_3(uint64_t a1, uint64_t a2, id *a3)
{
  uint64_t v6 = (void *)MEMORY[0x25A2A9B80]();
  if (*a3)
  {
    int v7 = -[SUUIRemoveFromWishlistOperation initWithItemIdentifier:entityIdentifier:reason:]([SUUIRemoveFromWishlistOperation alloc], "initWithItemIdentifier:entityIdentifier:reason:", [*a3 longLongValue], a2, 1);
    [*(id *)(a1 + 40) addObject:v7];
  }
  else
  {
    int v7 = (SUUIRemoveFromWishlistOperation *)[objc_alloc(MEMORY[0x263F7B430]) initWithPersistentID:a2 inDatabase:*(void *)(a1 + 32)];
    [(SUUIRemoveFromWishlistOperation *)v7 deleteFromDatabase];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end