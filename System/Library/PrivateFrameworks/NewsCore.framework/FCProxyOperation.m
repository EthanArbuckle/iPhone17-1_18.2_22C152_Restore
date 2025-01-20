@interface FCProxyOperation
+ (id)proxyForOperation:(id)a3;
+ (void)initialize;
- (unint64_t)propertiesInheritedByChildOperations;
- (void)_revisitQualityOfService;
- (void)_revisitRelativePriority;
- (void)operationDidFinishWithError:(id)a3;
- (void)performOperation;
- (void)setPurpose:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRelativePriority:(int64_t)a3;
- (void)setUnderlyingOperation:(uint64_t)a1;
@end

@implementation FCProxyOperation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F81C18]);
    v3 = (void *)_MergedGlobals_155;
    _MergedGlobals_155 = (uint64_t)v2;

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = qword_1EB5D11F8;
    qword_1EB5D11F8 = (uint64_t)v4;
    MEMORY[0x1F41817F8](v4, v5);
  }
}

+ (id)proxyForOperation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(FCProxyOperation);
  -[FCProxyOperation setUnderlyingOperation:]((uint64_t)v4, v3);
  uint64_t v5 = (void *)_MergedGlobals_155;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__FCProxyOperation_proxyForOperation___block_invoke;
  v11[3] = &unk_1E5B4BE70;
  id v12 = v3;
  v6 = v4;
  v13 = v6;
  id v7 = v3;
  [v5 performWithLockSync:v11];
  v8 = v13;
  v9 = v6;

  return v9;
}

- (void)setUnderlyingOperation:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 368), a2);
  }
}

void __38__FCProxyOperation_proxyForOperation___block_invoke(uint64_t a1)
{
  id v2 = (void *)qword_1EB5D11F8;
  id v3 = [*(id *)(a1 + 32) operationID];
  id v7 = [v2 objectForKey:v3];

  id v4 = v7;
  if (!v7)
  {
    id v4 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  }
  id v8 = v4;
  [v4 addObject:*(void *)(a1 + 40)];
  uint64_t v5 = (void *)qword_1EB5D11F8;
  v6 = [*(id *)(a1 + 32) operationID];
  [v5 setObject:v8 forKey:v6];
}

- (void)performOperation
{
  id v2 = self;
  id v3 = v2;
  if (v2) {
    underlyingOperation = v2->_underlyingOperation;
  }
  else {
    underlyingOperation = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__FCProxyOperation_performOperation__block_invoke;
  v7[3] = &unk_1E5B4C018;
  uint64_t v5 = v2;
  id v8 = v5;
  [(FCOperation *)underlyingOperation addCompletionHandler:v7];
  if (v3) {
    v6 = v5->_underlyingOperation;
  }
  else {
    v6 = 0;
  }
  [(FCOperation *)v6 startIfNeeded];
}

uint64_t __36__FCProxyOperation_performOperation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
}

- (void)operationDidFinishWithError:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__FCProxyOperation_operationDidFinishWithError___block_invoke;
  v4[3] = &unk_1E5B4C018;
  v4[4] = self;
  [(id)_MergedGlobals_155 performWithLockSync:v4];
  -[FCProxyOperation setUnderlyingOperation:]((uint64_t)self, 0);
}

void __48__FCProxyOperation_operationDidFinishWithError___block_invoke(uint64_t a1)
{
  id v2 = (void *)qword_1EB5D11F8;
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[46];
  }
  id v4 = v3;
  uint64_t v5 = [v4 operationID];
  id v6 = [v2 objectForKey:v5];

  if ([v6 containsObject:*(void *)(a1 + 32)])
  {
    [v6 removeObject:*(void *)(a1 + 32)];
    -[FCProxyOperation _revisitRelativePriority](*(void *)(a1 + 32));
    -[FCProxyOperation _revisitQualityOfService](*(void *)(a1 + 32));
  }
}

- (void)_revisitRelativePriority
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = (void *)qword_1EB5D11F8;
    id v3 = *(id *)(a1 + 368);
    id v4 = [v3 operationID];
    uint64_t v5 = [v2 objectForKey:v4];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      uint64_t v10 = -1;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "relativePriority", (void)v13);
          if (v10 <= v12) {
            uint64_t v10 = v12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v10 = -1;
    }

    [*(id *)(a1 + 368) setRelativePriority:v10];
  }
}

- (void)_revisitQualityOfService
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = (void *)qword_1EB5D11F8;
    id v3 = *(id *)(a1 + 368);
    id v4 = [v3 operationID];
    uint64_t v5 = [v2 objectForKey:v4];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      uint64_t v10 = 9;
      do
      {
        uint64_t v11 = 0;
        uint64_t v12 = v10;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "qualityOfService", (void)v16);
          uint64_t v10 = v13;
          if (v12 != -1 || v13 <= 24)
          {
            if (v12 <= v13) {
              uint64_t v14 = v13;
            }
            else {
              uint64_t v14 = v12;
            }
            if (v12 < 18 && v13 == -1) {
              uint64_t v10 = -1;
            }
            else {
              uint64_t v10 = v14;
            }
          }
          ++v11;
          uint64_t v12 = v10;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v10 = 9;
    }

    [*(id *)(a1 + 368) setQualityOfService:v10];
  }
}

- (unint64_t)propertiesInheritedByChildOperations
{
  return 0;
}

- (void)setRelativePriority:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCProxyOperation;
  [(FCOperation *)&v5 setRelativePriority:a3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__FCProxyOperation_setRelativePriority___block_invoke;
  v4[3] = &unk_1E5B4C018;
  v4[4] = self;
  [(id)_MergedGlobals_155 performWithLockSync:v4];
}

void __40__FCProxyOperation_setRelativePriority___block_invoke(uint64_t a1)
{
}

- (void)setQualityOfService:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCProxyOperation;
  [(FCOperation *)&v5 setQualityOfService:a3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__FCProxyOperation_setQualityOfService___block_invoke;
  v4[3] = &unk_1E5B4C018;
  v4[4] = self;
  [(id)_MergedGlobals_155 performWithLockSync:v4];
}

void __40__FCProxyOperation_setQualityOfService___block_invoke(uint64_t a1)
{
}

- (void)setPurpose:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FCProxyOperation;
  id v4 = a3;
  [(FCOperation *)&v6 setPurpose:v4];
  if (self) {
    underlyingOperation = self->_underlyingOperation;
  }
  else {
    underlyingOperation = 0;
  }
  -[FCOperation setPurpose:](underlyingOperation, "setPurpose:", v4, v6.receiver, v6.super_class);
}

- (void).cxx_destruct
{
}

@end