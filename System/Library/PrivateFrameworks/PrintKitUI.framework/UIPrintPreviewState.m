@interface UIPrintPreviewState
- (BOOL)cancelled;
- (void)setCancelled:(BOOL)a3;
@end

@implementation UIPrintPreviewState

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end