@interface TVShelfViewLayoutInvalidationContext
- (BOOL)invalidateLayout;
- (BOOL)invalidateVerticalBumps;
- (NSIndexPath)focusedItemIndexPath;
- (void)setFocusedItemIndexPath:(id)a3;
- (void)setInvalidateLayout:(BOOL)a3;
- (void)setInvalidateVerticalBumps:(BOOL)a3;
@end

@implementation TVShelfViewLayoutInvalidationContext

- (BOOL)invalidateLayout
{
  return self->_invalidateLayout;
}

- (void)setInvalidateLayout:(BOOL)a3
{
  self->_invalidateLayout = a3;
}

- (BOOL)invalidateVerticalBumps
{
  return self->_invalidateVerticalBumps;
}

- (void)setInvalidateVerticalBumps:(BOOL)a3
{
  self->_invalidateVerticalBumps = a3;
}

- (NSIndexPath)focusedItemIndexPath
{
  return self->_focusedItemIndexPath;
}

- (void)setFocusedItemIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end