@interface RTIInputSystemServiceSessionPlaceholder
+ (id)placeholderServiceSessionWithIdentifier:(id)a3 traits:(id)a4 state:(id)a5;
- (RTIInputSystemServiceSessionPlaceholder)initWithConnection:(id)a3;
- (RTIInputSystemServiceSessionPlaceholder)initWithIdentifier:(id)a3 traits:(id)a4 state:(id)a5;
- (id)bundleIdentifier;
- (id)valueForEntitlement:(id)a3;
- (int)pid;
- (void)_updateAppIdsFromConnectionOnInternalQueueWithCompletionHandler:(id)a3;
- (void)flushOperations;
- (void)flushOperationsWithResultHandler:(id)a3;
@end

@implementation RTIInputSystemServiceSessionPlaceholder

+ (id)placeholderServiceSessionWithIdentifier:(id)a3 traits:(id)a4 state:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:v9 traits:v8 state:v7];

  return v10;
}

- (RTIInputSystemServiceSessionPlaceholder)initWithConnection:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", a3);
  v5 = objc_alloc_init(RTIDocumentTraits);
  v6 = objc_alloc_init(RTIDocumentState);
  id v7 = [(RTIInputSystemServiceSessionPlaceholder *)self initWithIdentifier:v4 traits:v5 state:v6];

  return v7;
}

- (RTIInputSystemServiceSessionPlaceholder)initWithIdentifier:(id)a3 traits:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RTIInputSystemServiceSessionPlaceholder;
  v11 = [(RTIInputSystemServiceSession *)&v16 initWithConnection:0];
  v12 = v11;
  if (v11)
  {
    [(RTIInputSystemSession *)v11 setUuid:v8];
    v13 = (void *)[v9 copy];
    [(RTIInputSystemSession *)v12 setDocumentTraits:v13];

    v14 = (void *)[v10 copy];
    [(RTIInputSystemSession *)v12 setDocumentState:v14];
  }
  return v12;
}

- (int)pid
{
  return 0;
}

- (id)bundleIdentifier
{
  return 0;
}

- (id)valueForEntitlement:(id)a3
{
  return 0;
}

- (void)_updateAppIdsFromConnectionOnInternalQueueWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)flushOperations
{
  v3 = [(RTIInputSystemServiceSession *)self internalQueue];
  dispatch_assert_queue_not_V2(v3);

  v4 = [(RTIInputSystemServiceSession *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTIInputSystemServiceSessionPlaceholder_flushOperations__block_invoke;
  block[3] = &unk_1E583C300;
  block[4] = self;
  dispatch_sync(v4, block);
}

void __58__RTIInputSystemServiceSessionPlaceholder_flushOperations__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textOperations];

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = [v3 textOperations];
    v5 = [*(id *)(a1 + 32) documentState];
    [v3 _applyLocalTextOperations:v4 toDocumentState:v5];

    v6 = *(void **)(a1 + 32);
    [v6 setTextOperations:0];
  }
}

- (void)flushOperationsWithResultHandler:(id)a3
{
  v4 = [(RTIInputSystemServiceSession *)self internalQueue];
  dispatch_assert_queue_not_V2(v4);

  v5 = [(RTIInputSystemServiceSession *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__RTIInputSystemServiceSessionPlaceholder_flushOperationsWithResultHandler___block_invoke;
  block[3] = &unk_1E583C300;
  block[4] = self;
  dispatch_sync(v5, block);
}

void __76__RTIInputSystemServiceSessionPlaceholder_flushOperationsWithResultHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textOperations];

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = [v3 textOperations];
    v5 = [*(id *)(a1 + 32) documentState];
    [v3 _applyLocalTextOperations:v4 toDocumentState:v5];

    v6 = *(void **)(a1 + 32);
    [v6 setTextOperations:0];
  }
}

@end