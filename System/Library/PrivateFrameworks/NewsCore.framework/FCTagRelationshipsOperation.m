@interface FCTagRelationshipsOperation
- (FCContentContext)context;
- (FCTagProviding)tag;
- (FCTagRelationships)resultTagRelationships;
- (FCTagRelationshipsOperation)initWithContext:(id)a3 tag:(id)a4;
- (id)completionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCompletionHandler:(id)a3;
- (void)setResultTagRelationships:(id)a3;
@end

@implementation FCTagRelationshipsOperation

- (FCTagRelationshipsOperation)initWithContext:(id)a3 tag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCTagRelationshipsOperation;
  v9 = [(FCOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    uint64_t v11 = [v8 copy];
    tag = v10->_tag;
    v10->_tag = (FCTagProviding *)v11;
  }
  return v10;
}

- (void)performOperation
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v3 = @"relatedChannelTagIDsForOnboarding";
  v4 = +[FCAppleAccount sharedAccount];
  v5 = [v4 contentStoreFrontID];
  v6 = FCCKLocalizedRecordKey((uint64_t)v3, (uint64_t)v5);

  id v7 = objc_alloc_init(FCCKContentFetchOperation);
  id v8 = [(FCTagRelationshipsOperation *)self context];
  v9 = [v8 internalContentContext];
  v10 = [v9 contentDatabase];
  -[FCCKContentFetchOperation setDatabase:]((uint64_t)v7, v10);

  id v11 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v12 = [(FCTagRelationshipsOperation *)self tag];
  v13 = [v12 identifier];
  objc_super v14 = (void *)[v11 initWithRecordName:v13];
  v25[0] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v15, v16, 384);
  }

  v24[0] = v3;
  v24[1] = v6;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v17, v18, 400);
  }

  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __47__FCTagRelationshipsOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E5B56570;
  newValue[4] = self;
  id v22 = v6;
  v23 = v3;
  id v20 = v6;
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v19, newValue, 416);
  }
  [(FCOperation *)self associateChildOperation:v7];
  [(FCOperation *)v7 start];
}

void __47__FCTagRelationshipsOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __47__FCTagRelationshipsOperation_performOperation__block_invoke_2;
    v26 = &unk_1E5B4BE70;
    id v27 = *(id *)(a1 + 32);
    id v28 = v5;
    [v27 finishedPerformingOperationWithError:v28];
  }
  else
  {
    id v7 = [a2 allValues];
    id v8 = objc_msgSend(v7, "fc_onlyObject");

    v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v10 = [v9 count];
    uint64_t v11 = 40;
    if (!v10) {
      uint64_t v11 = 48;
    }
    v12 = [v8 objectForKeyedSubscript:*(void *)(a1 + v11)];

    v13 = [*(id *)(a1 + 32) context];
    objc_super v14 = [v13 tagController];
    v15 = [v14 fetchOperationForTagsWithIDs:v12];

    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __47__FCTagRelationshipsOperation_performOperation__block_invoke_3;
    id v20 = &unk_1E5B4BEC0;
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = v12;
    id v16 = v12;
    [v15 setFetchCompletionBlock:&v17];
    objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v15, v17, v18, v19, v20, v21);
    [v15 start];
  }
}

uint64_t __47__FCTagRelationshipsOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

void __47__FCTagRelationshipsOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    v4 = *(void **)(a1 + 32);
    id v10 = v3;
    id v5 = objc_msgSend(v10, "error", v9, 3221225472, __47__FCTagRelationshipsOperation_performOperation__block_invoke_4, &unk_1E5B4BE70, v4);
    [v4 finishedPerformingOperationWithError:v5];
  }
  else
  {
    v6 = [v3 fetchedObject];
    id v7 = objc_msgSend(v6, "nf_objectsForKeysWithoutMarker:", *(void *)(a1 + 40));
    id v8 = [[FCTagRelationships alloc] initWithRelatedChannelsForOnboarding:v7];
    [*(id *)(a1 + 32) setResultTagRelationships:v8];

    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  }
}

void __47__FCTagRelationshipsOperation_performOperation__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) error];
  [v1 finishedPerformingOperationWithError:v2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  v4 = [(FCTagRelationshipsOperation *)self completionHandler];

  if (v4)
  {
    id v5 = [(FCTagRelationshipsOperation *)self completionHandler];
    v6 = [(FCTagRelationshipsOperation *)self resultTagRelationships];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCTagProviding)tag
{
  return self->_tag;
}

- (FCTagRelationships)resultTagRelationships
{
  return self->_resultTagRelationships;
}

- (void)setResultTagRelationships:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTagRelationships, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end