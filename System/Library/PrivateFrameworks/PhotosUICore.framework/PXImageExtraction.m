@interface PXImageExtraction
- (BOOL)isCancelled;
- (void)_setCancelled:(BOOL)a3;
- (void)cancel;
@end

@implementation PXImageExtraction

- (void)_setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)cancel
{
}

@end