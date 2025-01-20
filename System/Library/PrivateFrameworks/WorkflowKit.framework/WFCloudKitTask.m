@interface WFCloudKitTask
- (BOOL)isCancelled;
- (id)cancellationHandler;
- (void)cancel;
- (void)setCancellationHandler:(id)a3;
- (void)setCancelled:(BOOL)a3;
@end

@implementation WFCloudKitTask

- (void).cxx_destruct
{
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void)setCancellationHandler:(id)a3
{
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)cancel
{
  if (![(WFCloudKitTask *)self isCancelled])
  {
    [(WFCloudKitTask *)self setCancelled:1];
    v3 = [(WFCloudKitTask *)self cancellationHandler];

    if (v3)
    {
      v4 = [(WFCloudKitTask *)self cancellationHandler];
      v4[2]();
    }
  }
}

@end