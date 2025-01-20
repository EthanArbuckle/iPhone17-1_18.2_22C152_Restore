@interface OspreyDeferredObject
- (OspreyDeferredObject)initWithFulfillmentQueue:(id)a3;
- (void)fulfill:(id)a3;
- (void)fulfilledWithCompletion:(id)a3;
@end

@implementation OspreyDeferredObject

- (OspreyDeferredObject)initWithFulfillmentQueue:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OspreyDeferredObject;
  v6 = [(OspreyDeferredObject *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fulfillmentQueue, a3);
    dispatch_group_t v8 = dispatch_group_create();
    fulfillmentGroup = v7->_fulfillmentGroup;
    v7->_fulfillmentGroup = (OS_dispatch_group *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("OspreyDeferredObject.deferral", 0);
    deferralQueue = v7->_deferralQueue;
    v7->_deferralQueue = (OS_dispatch_queue *)v10;

    dispatch_suspend((dispatch_object_t)v7->_deferralQueue);
    dispatch_group_enter((dispatch_group_t)v7->_fulfillmentGroup);
    fulfillmentQueue = v7->_fulfillmentQueue;
    v12 = v7->_fulfillmentGroup;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__OspreyDeferredObject_initWithFulfillmentQueue___block_invoke;
    block[3] = &unk_1E63CB9D0;
    v16 = v7;
    dispatch_group_notify(v12, fulfillmentQueue, block);
  }
  return v7;
}

void __49__OspreyDeferredObject_initWithFulfillmentQueue___block_invoke(uint64_t a1)
{
}

- (void)fulfill:(id)a3
{
  id v4 = a3;
  fulfillmentQueue = self->_fulfillmentQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__OspreyDeferredObject_fulfill___block_invoke;
  v7[3] = &unk_1E63CBBC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(fulfillmentQueue, v7);
}

void __32__OspreyDeferredObject_fulfill___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);

  dispatch_group_leave(v2);
}

- (void)fulfilledWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    deferralQueue = self->_deferralQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__OspreyDeferredObject_fulfilledWithCompletion___block_invoke;
    v7[3] = &unk_1E63CBBE8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(deferralQueue, v7);
  }
}

uint64_t __48__OspreyDeferredObject_fulfilledWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fulfillmentGroup, 0);
  objc_storeStrong((id *)&self->_fulfillmentQueue, 0);
  objc_storeStrong((id *)&self->_deferralQueue, 0);

  objc_storeStrong(&self->_promised, 0);
}

@end