@interface FCPurchaseLookupFetchOperation
- (FCContentContext)contentContext;
- (FCPurchaseLookupFetchOperation)init;
- (FCPurchaseLookupFetchOperation)initWithPurchaseIDs:(id)a3 contentContext:(id)a4;
- (NSArray)purchaseIDs;
- (id)_prefixedPurchasedIDs:(id)a3;
- (id)processFetchedResults:(id)a3 error:(id)a4;
- (void)performOperation;
- (void)setContentContext:(id)a3;
- (void)setPurchaseIDs:(id)a3;
@end

@implementation FCPurchaseLookupFetchOperation

void __62__FCPurchaseLookupFetchOperation_processFetchedResults_error___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 base];
  v5 = [v4 identifier];

  if ([v5 hasPrefix:@"IAP-"])
  {
    v6 = [v5 substringFromIndex:objc_msgSend(@"IAP-", "length")];
    v7 = [v3 channelTagIDs];

    if (v7)
    {
      v8 = (void *)a1[4];
      v9 = [v3 channelTagIDs];
      v10 = (void *)[v9 copy];
      [v8 setObject:v10 forKey:v6];
    }
    v11 = [v3 bundleChannelTagIDs];

    if (v11)
    {
      v12 = (void *)a1[5];
      v13 = [v3 bundleChannelTagIDs];
      v14 = (void *)[v13 copy];
      [v12 setObject:v14 forKey:v6];
    }
  }
  else
  {
    v15 = FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412290;
      v22 = v5;
      _os_log_error_impl(&dword_1A460D000, v15, OS_LOG_TYPE_ERROR, "Purchase lookup identifier should have prefix IAP- but found %@", (uint8_t *)&v21, 0xCu);
    }
  }
  v16 = [v3 bundleChannelTagIDsVersion];

  if (v16)
  {
    v17 = [v3 bundleChannelTagIDsVersion];
    uint64_t v18 = [v17 copy];
    uint64_t v19 = *(void *)(a1[6] + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

- (void)performOperation
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];

  if (([v4 isEqualToString:@"com.apple.stocks.widget"] & 1) != 0
    || [v4 isEqualToString:@"com.apple.news.widget"])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__FCPurchaseLookupFetchOperation_performOperation__block_invoke;
    v13[3] = &unk_1E5B4C018;
    v13[4] = self;
    __50__FCPurchaseLookupFetchOperation_performOperation__block_invoke((uint64_t)v13);
  }
  else
  {
    v5 = objc_alloc_init(FCRecordChainFetchOperation);
    v6 = [(FCPurchaseLookupFetchOperation *)self contentContext];
    [(FCRecordChainFetchOperation *)v5 setContext:v6];

    v7 = +[FCCachePolicy cachePolicyWithSoftMaxAge:900.0];
    [(FCRecordChainFetchOperation *)v5 setCachePolicy:v7];

    v8 = [(FCPurchaseLookupFetchOperation *)self purchaseIDs];
    v9 = [(FCPurchaseLookupFetchOperation *)self _prefixedPurchasedIDs:v8];
    [(FCRecordChainFetchOperation *)v5 setTopLevelRecordIDs:v9];

    v14 = @"PurchaseLookup";
    v15[0] = MEMORY[0x1E4F1CBF0];
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [(FCRecordChainFetchOperation *)v5 setLinkKeysByRecordType:v10];

    v11 = +[FCEdgeCacheHint edgeCacheHintForPurchaseLookup];
    [(FCRecordChainFetchOperation *)v5 setEdgeCacheHint:v11];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__FCPurchaseLookupFetchOperation_performOperation__block_invoke_2;
    v12[3] = &unk_1E5B4E3F0;
    v12[4] = self;
    [(FCRecordChainFetchOperation *)v5 setRecordChainCompletionHandler:v12];
    [(FCOperation *)self associateChildOperation:v5];
    [(FCOperation *)v5 start];
  }
}

- (NSArray)purchaseIDs
{
  return self->_purchaseIDs;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (id)_prefixedPurchasedIDs:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__FCPurchaseLookupFetchOperation__prefixedPurchasedIDs___block_invoke;
  v9[3] = &unk_1E5B4E468;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  v7 = (void *)[v6 copy];
  return v7;
}

- (FCPurchaseLookupFetchOperation)initWithPurchaseIDs:(id)a3 contentContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCPurchaseLookupFetchOperation;
  v9 = [(FCFetchOperation *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_purchaseIDs, a3);
    objc_storeStrong((id *)&v10->_contentContext, a4);
  }

  return v10;
}

void __50__FCPurchaseLookupFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "Error when fetching purchase lookup record error=%{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  v9 = [v5 allValues];
  id v10 = objc_msgSend(v9, "fc_onlyObject");
  v11 = [v8 processFetchedResults:v10 error:v6];
  [v8 finishExecutingWithFetchedObject:v11];
}

- (id)processFetchedResults:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = __Block_byref_object_copy__79;
  v22 = __Block_byref_object_dispose__79;
  id v23 = [NSString string];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__FCPurchaseLookupFetchOperation_processFetchedResults_error___block_invoke;
  v14[3] = &unk_1E5B5B810;
  id v9 = v7;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  v17 = &v18;
  [v5 enumerateRecordsAndInterestTokensWithBlock:v14];
  v11 = [FCPurchaseLookupFetchOperationResult alloc];
  int v12 = [(FCPurchaseLookupFetchOperationResult *)v11 initWithChannelIDsByPurchaseID:v9 bundleChannelIDsByPurchaseID:v10 bundleChannelIDsVersion:v19[5] error:v6];

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_purchaseIDs, 0);
}

void __56__FCPurchaseLookupFetchOperation__prefixedPurchasedIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithFormat:@"%@%@", @"IAP-", a2];
  [v2 addObject:v3];
}

- (FCPurchaseLookupFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCPurchaseLookupFetchOperation init]";
    __int16 v9 = 2080;
    id v10 = "FCPurchaseLookupFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 40;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPurchaseLookupFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

void __50__FCPurchaseLookupFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:41 userInfo:0];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v2];
}

- (void)setPurchaseIDs:(id)a3
{
}

- (void)setContentContext:(id)a3
{
}

@end