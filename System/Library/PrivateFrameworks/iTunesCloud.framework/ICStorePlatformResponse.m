@interface ICStorePlatformResponse
- (BOOL)isAuthenticated;
- (ICStorePlatformResponse)initWithResponseDictionary:(id)a3;
- (ICStorePlatformResponse)initWithResponseDictionary:(id)a3 requestedItemIdentifiers:(id)a4;
- (ICStorePlatformResponse)initWithURLResponse:(id)a3 requestedItemIdentifiers:(id)a4;
- (ICURLAggregatedPerformanceMetrics)performanceMetrics;
- (NSArray)allItems;
- (NSDate)expirationDate;
- (NSDictionary)resultsDictionary;
- (NSNumber)accountIdentifier;
- (NSNumber)enqueuerAccountIdentifier;
- (NSString)storefrontIdentifier;
- (id)itemForIdentifier:(id)a3;
- (id)rawResponse;
- (void)_enumerateResultDictionariesUsingBlock:(id)a3;
- (void)enumerateItemsUsingBlock:(id)a3;
@end

@implementation ICStorePlatformResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_requestedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_enqueuerAccountIdentifier, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSNumber)enqueuerAccountIdentifier
{
  return self->_enqueuerAccountIdentifier;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)_enumerateResultDictionariesUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_responseDictionary objectForKey:@"storePlatformData"];
  v6 = [(NSDictionary *)self->_responseDictionary objectForKey:@"results"];
  if (_NSIsNSDictionary())
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__ICStorePlatformResponse__enumerateResultDictionariesUsingBlock___block_invoke;
    v8[3] = &unk_1E5ACB830;
    id v9 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else if (_NSIsNSDictionary())
  {
    char v7 = 0;
    (*((void (**)(id, void *, __CFString *, char *))v4 + 2))(v4, v6, &stru_1EF5F5C40, &v7);
  }
}

void __66__ICStorePlatformResponse__enumerateResultDictionariesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (_NSIsNSDictionary())
  {
    v6 = [v5 objectForKey:@"results"];
    if (_NSIsNSDictionary()) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (id)rawResponse
{
  return self->_responseDictionary;
}

- (NSDictionary)resultsDictionary
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"results"];
  if (_NSIsNSDictionary()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)isAuthenticated
{
  v2 = [(NSDictionary *)self->_responseDictionary valueForKey:@"isAuthenticated"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (NSString)storefrontIdentifier
{
  storefrontIdentifier = self->_storefrontIdentifier;
  if (storefrontIdentifier)
  {
    char v3 = storefrontIdentifier;
    goto LABEL_16;
  }
  id v4 = [(NSDictionary *)self->_responseDictionary objectForKey:@"meta"];
  if (_NSIsNSDictionary())
  {
    id v5 = [v4 objectForKey:@"storefront"];
    if (!_NSIsNSDictionary())
    {
      char v3 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v6 = [v5 objectForKey:@"id"];
    if (_NSIsNSString())
    {
      id v7 = v6;
    }
    else
    {
      if (!_NSIsNSNumber())
      {
        char v3 = 0;
        goto LABEL_13;
      }
      id v7 = [v6 stringValue];
    }
    char v3 = v7;
LABEL_13:

    goto LABEL_14;
  }
  char v3 = 0;
LABEL_15:

LABEL_16:

  return v3;
}

- (id)itemForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__32568;
  v16 = __Block_byref_object_dispose__32569;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__ICStorePlatformResponse_itemForIdentifier___block_invoke;
  v8[3] = &unk_1E5ACB808;
  id v5 = v4;
  v10 = self;
  v11 = &v12;
  id v9 = v5;
  [(ICStorePlatformResponse *)self _enumerateResultDictionariesUsingBlock:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v6;
}

void __45__ICStorePlatformResponse_itemForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 objectForKey:*(void *)(a1 + 32)];
  if (v6)
  {
    id v12 = v6;
    if (_NSIsNSDictionary())
    {
      id v7 = [ICStorePlatformMetadata alloc];
      v8 = [*(id *)(a1 + 40) expirationDate];
      uint64_t v9 = [(ICStorePlatformMetadata *)v7 initWithMetadataDictionary:v12 expirationDate:v8];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    *a4 = 1;
    id v6 = v12;
  }
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_requestedItemIdentifiers count])
  {
    requestedItemIdentifiers = self->_requestedItemIdentifiers;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke;
    v10[3] = &unk_1E5ACB790;
    v10[4] = self;
    id v11 = v4;
    id v6 = v4;
    [(NSArray *)requestedItemIdentifiers enumerateObjectsUsingBlock:v10];
  }
  else
  {
    id v6 = [(ICStorePlatformResponse *)self expirationDate];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke_2;
    v8[3] = &unk_1E5ACB7E0;
    void v8[4] = v6;
    id v9 = v4;
    id v7 = v4;
    [(ICStorePlatformResponse *)self _enumerateResultDictionariesUsingBlock:v8];
  }
}

uint64_t __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) itemForIdentifier:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

void __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke_3;
  v7[3] = &unk_1E5ACB7B8;
  uint64_t v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  uint64_t v9 = a4;
  [a2 enumerateKeysAndObjectsUsingBlock:v7];
}

void __52__ICStorePlatformResponse_enumerateItemsUsingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if (_NSIsNSDictionary())
  {
    id v7 = [[ICStorePlatformMetadata alloc] initWithMetadataDictionary:v6 expirationDate:*(void *)(a1 + 32)];
    if (v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      **(unsigned char **)(a1 + 48) = 0;
      *a4 = 0;
    }
  }
}

- (NSArray)allItems
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__ICStorePlatformResponse_allItems__block_invoke;
  v5[3] = &unk_1E5ACB768;
  v5[4] = v3;
  [(ICStorePlatformResponse *)self enumerateItemsUsingBlock:v5];

  return (NSArray *)v3;
}

uint64_t __35__ICStorePlatformResponse_allItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (ICStorePlatformResponse)initWithURLResponse:(id)a3 requestedItemIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 parsedBodyDictionary];
  if (!v8)
  {
    uint64_t v9 = 0;
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v9 = [(ICStorePlatformResponse *)self initWithResponseDictionary:v8 requestedItemIdentifiers:v7];
  if (v9)
  {
    self = [v6 urlRequest];
    uint64_t v10 = [v6 urlResponse];
    id v11 = objc_msgSend(v10, "ic_valueForHTTPHeaderField:", @"X-Set-Apple-Store-Front");
    if (v11
      || (objc_msgSend(v10, "ic_valueForHTTPHeaderField:", @"X-Apple-Request-Store-Front"),
          (id v11 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([(ICStorePlatformResponse *)self ic_valueForHTTPHeaderField:@"X-Apple-Store-Front"], (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = [v11 copy];
      storefrontIdentifier = v9->_storefrontIdentifier;
      v9->_storefrontIdentifier = (NSString *)v12;
    }
    id v14 = [(ICStorePlatformResponse *)self ic_valueForHTTPHeaderField:@"X-Dsid"];
    v15 = (const char *)[v14 UTF8String];

    if (v15)
    {
      uint64_t v16 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLongLong:", strtoull(v15, 0, 10));
      accountIdentifier = v9->_accountIdentifier;
      v9->_accountIdentifier = (NSNumber *)v16;
    }
    id v18 = [(ICStorePlatformResponse *)self ic_valueForHTTPHeaderField:@"X-Enqueuer-DSID"];
    v19 = (const char *)[v18 UTF8String];

    if (v19)
    {
      uint64_t v20 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLongLong:", strtoull(v19, 0, 10));
      enqueuerAccountIdentifier = v9->_enqueuerAccountIdentifier;
      v9->_enqueuerAccountIdentifier = (NSNumber *)v20;
    }
    if ([v10 hasCacheControl])
    {
      [v10 cacheControlMaxAge];
      uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");
      expirationDate = v9->_expirationDate;
      v9->_expirationDate = (NSDate *)v22;
    }
    v24 = [v6 performanceMetrics];

    if (v24)
    {
      uint64_t v25 = [v6 aggregatedPerformanceMetrics];
      performanceMetrics = v9->_performanceMetrics;
      v9->_performanceMetrics = (ICURLAggregatedPerformanceMetrics *)v25;
    }
    goto LABEL_17;
  }
LABEL_18:

  return v9;
}

- (ICStorePlatformResponse)initWithResponseDictionary:(id)a3 requestedItemIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICStorePlatformResponse;
  id v8 = [(ICStorePlatformResponse *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    requestedItemIdentifiers = v8->_requestedItemIdentifiers;
    v8->_requestedItemIdentifiers = (NSArray *)v9;

    uint64_t v11 = [v6 copy];
    responseDictionary = v8->_responseDictionary;
    v8->_responseDictionary = (NSDictionary *)v11;
  }
  return v8;
}

- (ICStorePlatformResponse)initWithResponseDictionary:(id)a3
{
  return [(ICStorePlatformResponse *)self initWithResponseDictionary:a3 requestedItemIdentifiers:MEMORY[0x1E4F1CBF0]];
}

@end