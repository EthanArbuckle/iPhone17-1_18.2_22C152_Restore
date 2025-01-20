@interface _NAMainThreadScheduler
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (void)performBlock:(id)a3;
@end

@implementation _NAMainThreadScheduler

- (void)performBlock:(id)a3
{
  block = (void (**)(void))a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    block[2]();
  }
  else
  {
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D418], block);
    v4 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v4);
  }
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F1CB00];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50___NAMainThreadScheduler_afterDelay_performBlock___block_invoke;
  v15[3] = &unk_1E6109B80;
  id v7 = v5;
  id v16 = v7;
  v8 = [v6 timerWithTimeInterval:0 repeats:v15 block:a3];
  v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v9 addTimer:v8 forMode:*MEMORY[0x1E4F1C3A0]];

  v10 = objc_alloc_init(NACancelationToken);
  objc_initWeak(&location, v8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50___NAMainThreadScheduler_afterDelay_performBlock___block_invoke_2;
  v12[3] = &unk_1E6109B08;
  objc_copyWeak(&v13, &location);
  [(NACancelationToken *)v10 addCancelationBlock:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v10;
}

- (id)performCancelableBlock:(id)a3
{
  v3 = (void (**)(id, NACancelationToken *))a3;
  v4 = objc_alloc_init(NACancelationToken);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v3[2](v3, v4);
  }
  else
  {
    Main = CFRunLoopGetMain();
    v6 = (const void *)*MEMORY[0x1E4F1D418];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49___NAMainThreadScheduler_performCancelableBlock___block_invoke;
    v8[3] = &unk_1E6109B58;
    v9 = v4;
    v10 = v3;
    CFRunLoopPerformBlock(Main, v6, v8);
  }
  return v4;
}

@end