@interface PUImageExtraction
- (BOOL)_isCancelled;
- (void)_setCancelled:(BOOL)a3;
- (void)cancel;
@end

@implementation PUImageExtraction

- (void)_setCancelled:(BOOL)a3
{
  self->__cancelled = a3;
}

- (BOOL)_isCancelled
{
  return self->__cancelled;
}

- (void)cancel
{
}

@end