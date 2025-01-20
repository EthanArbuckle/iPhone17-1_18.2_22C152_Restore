@interface FCFeedPrewarmResult
- (FCFeedPrewarmResult)initWithSuccessfulRequests:(id)a3 failedRequests:(id)a4;
- (NSArray)failedRequests;
- (NSArray)successfulRequests;
- (NSSet)feedIDs;
@end

@implementation FCFeedPrewarmResult

- (FCFeedPrewarmResult)initWithSuccessfulRequests:(id)a3 failedRequests:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCFeedPrewarmResult;
  v8 = [(FCFeedPrewarmResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    successfulRequests = v8->_successfulRequests;
    v8->_successfulRequests = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    failedRequests = v8->_failedRequests;
    v8->_failedRequests = (NSArray *)v11;
  }
  return v8;
}

- (NSSet)feedIDs
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__FCFeedPrewarmResult_feedIDs__block_invoke;
  v4[3] = &unk_1E5B4C2F0;
  v4[4] = self;
  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "fc_set:", v4);
  return (NSSet *)v2;
}

void __30__FCFeedPrewarmResult_feedIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = [*(id *)(a1 + 32) successfulRequests];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v20 + 1) + 8 * v8) feedID];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = objc_msgSend(*(id *)(a1 + 32), "failedRequests", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v16 + 1) + 8 * v14) feedID];
        [v3 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
}

- (NSArray)successfulRequests
{
  return self->_successfulRequests;
}

- (NSArray)failedRequests
{
  return self->_failedRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedRequests, 0);
  objc_storeStrong((id *)&self->_successfulRequests, 0);
}

@end