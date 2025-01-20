@interface PLSyncCancellingProgress
+ (id)discreteProgressWithTotalUnitCount:(int64_t)a3;
- (id)pl_cancellationHandler;
- (void)cancel;
- (void)setCancellationHandler:(id)a3;
- (void)setPl_cancellationHandler:(id)a3;
@end

@implementation PLSyncCancellingProgress

- (void).cxx_destruct
{
}

- (void)setPl_cancellationHandler:(id)a3
{
}

- (id)pl_cancellationHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)PLSyncCancellingProgress;
  [(PLSyncCancellingProgress *)&v5 cancel];
  uint64_t v3 = [(PLSyncCancellingProgress *)self pl_cancellationHandler];
  v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

- (void)setCancellationHandler:(id)a3
{
  id v6 = a3;
  [(PLSyncCancellingProgress *)self setPl_cancellationHandler:v6];
  int v4 = [(PLSyncCancellingProgress *)self isCancelled];
  objc_super v5 = v6;
  if (v6 && v4)
  {
    (*((void (**)(id))v6 + 2))(v6);
    objc_super v5 = v6;
  }
}

+ (id)discreteProgressWithTotalUnitCount:(int64_t)a3
{
  int v4 = [[PLSyncCancellingProgress alloc] initWithParent:0 userInfo:0];
  [(PLSyncCancellingProgress *)v4 setTotalUnitCount:a3];
  return v4;
}

@end