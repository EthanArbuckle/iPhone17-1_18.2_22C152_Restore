@interface NNMKBatchedRequest
- (NNMKBatchedRequest)init;
- (NNMKProtoFetchRequest)latestFetchRequest;
- (NSMutableDictionary)messagesToBeSentInBatch;
- (id)diffFromMessages:(id)a3 maxMessagesToAdd:(unint64_t)a4;
- (void)setLatestFetchRequest:(id)a3;
- (void)setMessagesToBeSentInBatch:(id)a3;
@end

@implementation NNMKBatchedRequest

- (NNMKBatchedRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)NNMKBatchedRequest;
  v2 = [(NNMKBatchedRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    messagesToBeSentInBatch = v2->_messagesToBeSentInBatch;
    v2->_messagesToBeSentInBatch = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)diffFromMessages:(id)a3 maxMessagesToAdd:(unint64_t)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(NNMKBatchedRequest *)self latestFetchRequest];
  v8 = [v7 currentMessageIdsAndStatus];
  uint64_t v9 = [v8 decompressedData];

  v50 = (void *)v9;
  uint64_t v10 = [[NSString alloc] initWithData:v9 encoding:4];
  v11 = (void *)v10;
  v12 = &stru_26F11E918;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v13 = v12;

  unint64_t v48 = a4;
  v49 = v13;
  if ([(__CFString *)v13 length]) {
    [(__CFString *)v13 componentsSeparatedByString:@"\n"];
  }
  else {
  v14 = [MEMORY[0x263EFF8C0] array];
  }
  v15 = (void *)MEMORY[0x263EFF9C0];
  v16 = [v6 allKeys];
  v53 = [v15 setWithArray:v16];

  v51 = [MEMORY[0x263EFF9C0] set];
  v52 = [MEMORY[0x263EFF9C0] set];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v59 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        if ([v22 length])
        {
          v23 = [v22 componentsSeparatedByString:@"|"];
          v24 = [v23 objectAtIndexedSubscript:0];
          uint64_t v25 = [v24 integerValue];

          v26 = [v23 objectAtIndexedSubscript:1];
          v27 = [v6 objectForKeyedSubscript:v26];

          if (v27)
          {
            v28 = [v6 objectForKeyedSubscript:v26];
            if ([v28 status] != v25) {
              [v51 addObject:v26];
            }
            [v53 removeObject:v26];
          }
          else
          {
            [v52 addObject:v26];
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v19);
  }

  v29 = objc_alloc_init(NNMKDiffMessageResult);
  v30 = v53;
  [(NNMKDiffMessageResult *)v29 setMessageIdsToAddToWatch:v53];
  [(NNMKDiffMessageResult *)v29 setMessageIdsToUpdateOnWatch:v51];
  [(NNMKDiffMessageResult *)v29 setMessageIdsToDeleteFromWatch:v52];
  v31 = [(NNMKDiffMessageResult *)v29 messageIdsToAddToWatch];
  unint64_t v32 = [v31 count];

  if (v32 > v48)
  {
    v47 = v29;
    v33 = [MEMORY[0x263EFF980] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v34 = v53;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v55 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v54 + 1) + 8 * j)];
          if (v39) {
            objc_msgSend(v33, "insertObject:atIndex:", v39, objc_msgSend(v33, "indexOfObject:inSortedRange:options:usingComparator:", v39, 0, objc_msgSend(v33, "count"), 1024, &__block_literal_global_4));
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v54 objects:v62 count:16];
      }
      while (v36);
    }

    v40 = objc_msgSend(v33, "subarrayWithRange:", 0, v48);
    v29 = v47;
    [(NNMKDiffMessageResult *)v47 setMessageToAddToWatch:v40];

    v41 = [(NNMKDiffMessageResult *)v47 messageToAddToWatch];
    v42 = objc_msgSend(v41, "nnmk_map:", &__block_literal_global_15);

    v43 = [MEMORY[0x263EFF9C0] setWithArray:v42];
    [(NNMKDiffMessageResult *)v47 setMessageIdsToAddToWatch:v43];

    v44 = [(NNMKDiffMessageResult *)v47 messageIdsToUpdateOnWatch];
    [v44 removeAllObjects];

    v45 = [(NNMKDiffMessageResult *)v47 messageIdsToDeleteFromWatch];
    [v45 removeAllObjects];

    [(NNMKDiffMessageResult *)v47 setTrimed:1];
    v30 = v53;
  }

  return v29;
}

uint64_t __56__NNMKBatchedRequest_diffFromMessages_maxMessagesToAdd___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 dateReceived];
  id v6 = [v4 dateReceived];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __56__NNMKBatchedRequest_diffFromMessages_maxMessagesToAdd___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 messageId];
}

- (NSMutableDictionary)messagesToBeSentInBatch
{
  return self->_messagesToBeSentInBatch;
}

- (void)setMessagesToBeSentInBatch:(id)a3
{
}

- (NNMKProtoFetchRequest)latestFetchRequest
{
  return self->_latestFetchRequest;
}

- (void)setLatestFetchRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestFetchRequest, 0);
  objc_storeStrong((id *)&self->_messagesToBeSentInBatch, 0);
}

@end