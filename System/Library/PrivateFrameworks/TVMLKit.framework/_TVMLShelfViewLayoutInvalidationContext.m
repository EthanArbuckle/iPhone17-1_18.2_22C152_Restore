@interface _TVMLShelfViewLayoutInvalidationContext
- (BOOL)invalidateShowcase;
- (void)setInvalidateShowcase:(BOOL)a3;
@end

@implementation _TVMLShelfViewLayoutInvalidationContext

- (BOOL)invalidateShowcase
{
  return self->_invalidateShowcase;
}

- (void)setInvalidateShowcase:(BOOL)a3
{
  self->_invalidateShowcase = a3;
}

@end