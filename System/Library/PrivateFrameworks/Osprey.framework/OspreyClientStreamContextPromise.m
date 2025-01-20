@interface OspreyClientStreamContextPromise
- (OspreyClientStreamContextPromise)initWithFulfillmentQueue:(id)a3;
- (void)finishWriting;
- (void)fulfill:(id)a3;
- (void)writeFrame:(id)a3;
- (void)writeFrame:(id)a3 compressed:(BOOL)a4;
@end

@implementation OspreyClientStreamContextPromise

- (OspreyClientStreamContextPromise)initWithFulfillmentQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OspreyClientStreamContextPromise;
  v5 = [(OspreyClientStreamContextPromise *)&v9 init];
  if (v5)
  {
    v6 = [[OspreyDeferredObject alloc] initWithFulfillmentQueue:v4];
    deferredContext = v5->_deferredContext;
    v5->_deferredContext = v6;
  }
  return v5;
}

- (void)fulfill:(id)a3
{
}

- (void)finishWriting
{
}

uint64_t __49__OspreyClientStreamContextPromise_finishWriting__block_invoke(uint64_t a1, void *a2)
{
  return [a2 finishWriting];
}

- (void)writeFrame:(id)a3
{
  id v4 = a3;
  deferredContext = self->_deferredContext;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__OspreyClientStreamContextPromise_writeFrame___block_invoke;
  v7[3] = &unk_1E63CBF60;
  id v8 = v4;
  id v6 = v4;
  [(OspreyDeferredObject *)deferredContext fulfilledWithCompletion:v7];
}

uint64_t __47__OspreyClientStreamContextPromise_writeFrame___block_invoke(uint64_t a1, void *a2)
{
  return [a2 writeFrame:*(void *)(a1 + 32)];
}

- (void)writeFrame:(id)a3 compressed:(BOOL)a4
{
  id v6 = a3;
  deferredContext = self->_deferredContext;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__OspreyClientStreamContextPromise_writeFrame_compressed___block_invoke;
  v9[3] = &unk_1E63CBF88;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  [(OspreyDeferredObject *)deferredContext fulfilledWithCompletion:v9];
}

uint64_t __58__OspreyClientStreamContextPromise_writeFrame_compressed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 writeFrame:*(void *)(a1 + 32) compressed:*(unsigned __int8 *)(a1 + 40)];
}

- (void).cxx_destruct
{
}

@end