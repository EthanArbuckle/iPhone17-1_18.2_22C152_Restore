@interface PLRoutineServiceResult
- (BOOL)waitForReplyWithTimeout:(unint64_t)a3;
- (NSError)error;
- (PLRoutineServiceResult)init;
- (id)result;
- (void)receivedReplyWithResult:(id)a3 error:(id)a4;
@end

@implementation PLRoutineServiceResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
}

- (BOOL)waitForReplyWithTimeout:(unint64_t)a3
{
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * a3);
  return dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, v4) == 0;
}

- (void)receivedReplyWithResult:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v6 = v9;
  id v7 = v8;
  PLRunWithUnfairLock();
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

void __56__PLRoutineServiceResult_receivedReplyWithResult_error___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 48) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_time_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (NSError)error
{
  uint64_t v2 = PLResultWithUnfairLock();
  return (NSError *)v2;
}

id __31__PLRoutineServiceResult_error__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

- (id)result
{
  uint64_t v2 = PLResultWithUnfairLock();
  return v2;
}

id __32__PLRoutineServiceResult_result__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (PLRoutineServiceResult)init
{
  v8.receiver = self;
  v8.super_class = (Class)PLRoutineServiceResult;
  uint64_t v2 = [(PLRoutineServiceResult *)&v8 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    semaphore = v3->_semaphore;
    v3->_semaphore = (OS_dispatch_semaphore *)v4;

    id v6 = v3;
  }

  return v3;
}

@end