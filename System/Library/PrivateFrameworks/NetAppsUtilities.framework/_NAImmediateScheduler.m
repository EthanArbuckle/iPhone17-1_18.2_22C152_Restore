@interface _NAImmediateScheduler
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (void)performBlock:(id)a3;
@end

@implementation _NAImmediateScheduler

- (void)performBlock:(id)a3
{
}

- (id)performCancelableBlock:(id)a3
{
  v3 = (void (**)(id, NACancelationToken *))a3;
  v4 = objc_alloc_init(NACancelationToken);
  v3[2](v3, v4);

  return v4;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F29060];
  v6 = (void (**)(void))a4;
  [v5 sleepForTimeInterval:a3];
  v6[2](v6);

  v7 = objc_alloc_init(NACancelationToken);
  return v7;
}

@end