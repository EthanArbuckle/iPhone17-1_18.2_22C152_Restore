@interface PUScrubberTilingLayoutInvalidationContext
- (BOOL)invalidatedExpandedItem;
- (void)invalidateExpandedItem;
@end

@implementation PUScrubberTilingLayoutInvalidationContext

- (BOOL)invalidatedExpandedItem
{
  return self->_invalidatedExpandedItem;
}

- (void)invalidateExpandedItem
{
  self->_invalidatedExpandedItem = 1;
}

@end