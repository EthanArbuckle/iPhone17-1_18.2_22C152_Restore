@interface MTExpiringFuture
- (MTExpiringFuture)initWithTimeout:(double)a3;
@end

@implementation MTExpiringFuture

- (MTExpiringFuture)initWithTimeout:(double)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MTExpiringFuture;
  v4 = [(MTExpiringFuture *)&v12 init];
  v5 = v4;
  if (a3 > 0.0 && v4 != 0)
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__MTExpiringFuture_initWithTimeout___block_invoke;
    block[3] = &unk_1E59150A8;
    v11 = v5;
    dispatch_after(v7, v8, block);
  }
  return v5;
}

void __36__MTExpiringFuture_initWithTimeout___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F28C58], "na_timeoutError");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 finishWithError:v3];
  }
}

@end