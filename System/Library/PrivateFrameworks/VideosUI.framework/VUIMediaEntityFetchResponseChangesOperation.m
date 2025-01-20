@interface VUIMediaEntityFetchResponseChangesOperation
+ (id)_changeSetFromCurrentMediaEntities:(id)a3 toLatestMediaEntities:(id)a4;
- (NSArray)currentFetchResponses;
- (NSArray)fetchResponseChanges;
- (NSArray)latestFetchResponses;
- (NSError)error;
- (VUIMediaEntityFetchResponseChangesOperation)init;
- (VUIMediaEntityFetchResponseChangesOperation)initWithLatestFetchResponses:(id)a3 currentFetchResponses:(id)a4;
- (id)_groupingChangeSetWithCurrentGrouping:(id)a3 latestGrouping:(id)a4;
- (id)_groupingChangeSetWithLatestFetchResponse:(id)a3 currentFetchResponse:(id)a4;
- (id)_mediaEntitiesChangeSetWithLatestFetchResponse:(id)a3 currentFetchResponse:(id)a4;
- (void)_preloadMediaEntityMetadata;
- (void)_preloadMetadataForFetchResponse:(id)a3;
- (void)executionDidBegin;
- (void)setCurrentFetchResponses:(id)a3;
- (void)setError:(id)a3;
- (void)setFetchResponseChanges:(id)a3;
- (void)setLatestFetchResponses:(id)a3;
@end

@implementation VUIMediaEntityFetchResponseChangesOperation

- (VUIMediaEntityFetchResponseChangesOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaEntityFetchResponseChangesOperation)initWithLatestFetchResponses:(id)a3 currentFetchResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E4F1C3C8];
  if (!v6)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"latestFetchResponses" format];
    if (v8) {
      goto LABEL_3;
    }
LABEL_10:
    [MEMORY[0x1E4F1CA00] raise:*v9, @"The %@ parameter must not be nil.", @"currentFetchResponses" format];
    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_10;
  }
LABEL_3:
  if (![v6 count] || (uint64_t v10 = objc_msgSend(v6, "count"), v10 != objc_msgSend(v8, "count"))) {
    [MEMORY[0x1E4F1CA00] raise:*v9 format:@"The fetch responses arrays parameters must be non empty and contain the same number of response objects"];
  }
  v17.receiver = self;
  v17.super_class = (Class)VUIMediaEntityFetchResponseChangesOperation;
  v11 = [(VUIMediaEntityFetchResponseChangesOperation *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v6 copy];
    latestFetchResponses = v11->_latestFetchResponses;
    v11->_latestFetchResponses = (NSArray *)v12;

    uint64_t v14 = [v8 copy];
    currentFetchResponses = v11->_currentFetchResponses;
    v11->_currentFetchResponses = (NSArray *)v14;
  }
  return v11;
}

- (void)executionDidBegin
{
  [(VUIMediaEntityFetchResponseChangesOperation *)self _preloadMediaEntityMetadata];
  if (([(VUIMediaEntityFetchResponseChangesOperation *)self isCancelled] & 1) == 0)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = [(VUIMediaEntityFetchResponseChangesOperation *)self currentFetchResponses];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = __64__VUIMediaEntityFetchResponseChangesOperation_executionDidBegin__block_invoke;
    v9 = &unk_1E6DFAC08;
    uint64_t v10 = self;
    id v11 = v3;
    id v5 = v3;
    [v4 enumerateObjectsUsingBlock:&v6];

    -[VUIMediaEntityFetchResponseChangesOperation setFetchResponseChanges:](self, "setFetchResponseChanges:", v5, v6, v7, v8, v9, v10);
  }
  [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
}

void __64__VUIMediaEntityFetchResponseChangesOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 latestFetchResponses];
  id v11 = [v7 objectAtIndex:a3];

  v8 = [*(id *)(a1 + 32) _mediaEntitiesChangeSetWithLatestFetchResponse:v11 currentFetchResponse:v6];
  v9 = [[VUIMediaEntityFetchResponseChanges alloc] initWithMediaEntitiesChangeSet:v8];
  uint64_t v10 = [*(id *)(a1 + 32) _groupingChangeSetWithLatestFetchResponse:v11 currentFetchResponse:v6];

  [(VUIMediaEntityFetchResponseChanges *)v9 setGroupingChangeSet:v10];
  [*(id *)(a1 + 40) addObject:v9];
}

- (void)_preloadMediaEntityMetadata
{
  id v3 = [(VUIMediaEntityFetchResponseChangesOperation *)self currentFetchResponses];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__VUIMediaEntityFetchResponseChangesOperation__preloadMediaEntityMetadata__block_invoke;
  v4[3] = &unk_1E6DFAC30;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __74__VUIMediaEntityFetchResponseChangesOperation__preloadMediaEntityMetadata__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _preloadMetadataForFetchResponse:a2];
  id v5 = [*(id *)(a1 + 32) latestFetchResponses];
  id v6 = [v5 objectAtIndex:a3];

  [*(id *)(a1 + 32) _preloadMetadataForFetchResponse:v6];
}

- (void)_preloadMetadataForFetchResponse:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a3 mediaEntities];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
      if ([(VUIMediaEntityFetchResponseChangesOperation *)self isCancelled]) {
        break;
      }
      [v9 populateMetadata];
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)_mediaEntitiesChangeSetWithLatestFetchResponse:(id)a3 currentFetchResponse:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 mediaEntities];
  uint64_t v7 = [v5 mediaEntities];

  uint64_t v8 = [(id)objc_opt_class() _changeSetFromCurrentMediaEntities:v6 toLatestMediaEntities:v7];

  return v8;
}

- (id)_groupingChangeSetWithLatestFetchResponse:(id)a3 currentFetchResponse:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 grouping];
  uint64_t v8 = [v6 grouping];

  v9 = 0;
  if (v8 && v7)
  {
    v9 = [(VUIMediaEntityFetchResponseChangesOperation *)self _groupingChangeSetWithCurrentGrouping:v8 latestGrouping:v7];
  }

  return v9;
}

- (id)_groupingChangeSetWithCurrentGrouping:(id)a3 latestGrouping:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FB3C58];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__VUIMediaEntityFetchResponseChangesOperation__groupingChangeSetWithCurrentGrouping_latestGrouping___block_invoke_2;
  v12[3] = &unk_1E6DFAC78;
  v12[4] = self;
  long long v10 = [v9 changeSetFromObjects:v8 toObjects:v7 identifierBlock:&__block_literal_global_121 updateChangeSetBlock:v12];

  return v10;
}

uint64_t __100__VUIMediaEntityFetchResponseChangesOperation__groupingChangeSetWithCurrentGrouping_latestGrouping___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

id __100__VUIMediaEntityFetchResponseChangesOperation__groupingChangeSetWithCurrentGrouping_latestGrouping___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = objc_opt_class();
  id v7 = [v5 mediaEntities];

  id v8 = [v4 mediaEntities];

  id v9 = [v6 _changeSetFromCurrentMediaEntities:v7 toLatestMediaEntities:v8];

  return v9;
}

+ (id)_changeSetFromCurrentMediaEntities:(id)a3 toLatestMediaEntities:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FB3C58];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  id v9 = [v8 changeSetFromObjects:v7 toObjects:v6 identifierBlock:&__block_literal_global_21_0 isEqualBlock:&__block_literal_global_24_0];

  return v9;
}

uint64_t __104__VUIMediaEntityFetchResponseChangesOperation__changeSetFromCurrentMediaEntities_toLatestMediaEntities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __104__VUIMediaEntityFetchResponseChangesOperation__changeSetFromCurrentMediaEntities_toLatestMediaEntities___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFetchedPropertiesEqualToFetchedMediaEntity:");
}

- (NSArray)fetchResponseChanges
{
  return self->_fetchResponseChanges;
}

- (void)setFetchResponseChanges:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSArray)latestFetchResponses
{
  return self->_latestFetchResponses;
}

- (void)setLatestFetchResponses:(id)a3
{
}

- (NSArray)currentFetchResponses
{
  return self->_currentFetchResponses;
}

- (void)setCurrentFetchResponses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFetchResponses, 0);
  objc_storeStrong((id *)&self->_latestFetchResponses, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fetchResponseChanges, 0);
}

@end