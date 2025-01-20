@interface WBSCalculationResultProvider
- (WBSCalculationResultProvider)init;
- (void)evaluateQuery:(id)a3 resultHandler:(id)a4;
@end

@implementation WBSCalculationResultProvider

- (WBSCalculationResultProvider)init
{
  v15.receiver = self;
  v15.super_class = (Class)WBSCalculationResultProvider;
  v2 = [(WBSCalculationResultProvider *)&v15 init];
  if (v2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.safarishared.%p", v2);
    id v3 = objc_claimAutoreleasedReturnValue();
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    calculationQueue = v2->_calculationQueue;
    v2->_calculationQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ht", @"htt", @"ww", 0);
    queryStringsToIgnore = v2->_queryStringsToIgnore;
    v2->_queryStringsToIgnore = (NSSet *)v8;

    queryPrefixesToIgnore = v2->_queryPrefixesToIgnore;
    v2->_queryPrefixesToIgnore = (NSArray *)&unk_1EFC220A0;

    *(void *)&v2->_queryLock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:2048 error:0];
    phoneNumberDetector = v2->_phoneNumberDetector;
    v2->_phoneNumberDetector = (NSDataDetector *)v11;

    v13 = v2;
  }

  return v2;
}

- (void)evaluateQuery:(id)a3 resultHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  os_unfair_lock_lock(&self->_queryLock);
  os_unfair_lock_lock(&self->_calculateRequestLock);
  currentCalculateRequest = self->_currentCalculateRequest;
  if (currentCalculateRequest) {
    [currentCalculateRequest cancel];
  }
  os_unfair_lock_unlock(&self->_calculateRequestLock);
  v9 = [v6 queryString];
  v10 = objc_msgSend(v9, "safari_stringByTrimmingWhitespace");

  if ([(NSString *)self->_currentQueryString isEqualToString:v10]
    || (unint64_t)[v10 length] < 2
    || [(NSSet *)self->_queryStringsToIgnore containsObject:v10])
  {
    v7[2](v7, 0);
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v11 = self->_queryPrefixesToIgnore;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v11);
          }
          if ([v10 hasPrefix:*(void *)(*((void *)&v23 + 1) + 8 * i)])
          {
            v7[2](v7, 0);

            goto LABEL_7;
          }
        }
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    phoneNumberDetector = self->_phoneNumberDetector;
    v16 = [v6 queryString];
    v17 = [v6 queryString];
    uint64_t v18 = -[NSDataDetector numberOfMatchesInString:options:range:](phoneNumberDetector, "numberOfMatchesInString:options:range:", v16, 0, 0, [v17 length]);

    if (v18 || (unint64_t)(WBSUnifiedFieldInputTypeForString(v10) - 1) <= 1)
    {
      v7[2](v7, 0);
    }
    else
    {
      objc_storeStrong((id *)&self->_currentQueryString, v10);
      calculationQueue = self->_calculationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke;
      block[3] = &unk_1E5C8C8F8;
      block[4] = self;
      id v21 = v10;
      v22 = v7;
      dispatch_async(calculationQueue, block);
    }
  }
LABEL_7:

  os_unfair_lock_unlock(&self->_queryLock);
}

void __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if ([v2 isEqualToString:*(void *)(a1 + 40)])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    id v3 = (void *)MEMORY[0x1E4F56918];
    uint64_t v4 = *(void *)(a1 + 40);
    if (evaluationOptions_onceToken != -1) {
      dispatch_once(&evaluationOptions_onceToken, &__block_literal_global_10);
    }
    v5 = (void *)evaluationOptions_options;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_3;
    v11[3] = &unk_1E5C8CE18;
    id v6 = &v12;
    id v12 = *(id *)(a1 + 48);
    id v7 = v5;
    uint64_t v8 = [v3 evaluate:v4 options:v7 resultHandler:v11];
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 56);
    *(void *)(v9 + 56) = v8;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_2;
    block[3] = &unk_1E5C8CDC8;
    id v6 = &v14;
    id v14 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_4;
  v5[3] = &unk_1E5C8CDF0;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) formattedResult];
  if ([v2 length])
  {
    id v3 = [*(id *)(a1 + 32) inputValueAndUnit];
    if (([v3 isTrivial] & 1) == 0)
    {

LABEL_10:
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = [[WBSCalculationResult alloc] initWithCalculateResult:*(void *)(a1 + 32)];
      (*(void (**)(uint64_t, WBSCalculationResult *))(v6 + 16))(v6, v7);

      return;
    }
    uint64_t v4 = [*(id *)(a1 + 32) unitType];

    if (v4 == 16) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  v5();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalculateRequest, 0);
  objc_storeStrong((id *)&self->_phoneNumberDetector, 0);
  objc_storeStrong((id *)&self->_calculationQueue, 0);
  objc_storeStrong((id *)&self->_queryPrefixesToIgnore, 0);
  objc_storeStrong((id *)&self->_queryStringsToIgnore, 0);
  objc_storeStrong((id *)&self->_currentQueryString, 0);
}

@end