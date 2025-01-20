@interface SUUIEntityProviderInvalidationContext
- (BOOL)invalidateDataSourceCounts;
- (BOOL)invalidateEverything;
- (void)setInvalidateDataSourceCounts:(BOOL)a3;
- (void)setInvalidateEverything:(BOOL)a3;
@end

@implementation SUUIEntityProviderInvalidationContext

- (void)setInvalidateDataSourceCounts:(BOOL)a3
{
  self->_invalidateDataSourceCounts = a3;
}

- (void)setInvalidateEverything:(BOOL)a3
{
  self->_invalidateEverything = a3;
}

- (BOOL)invalidateEverything
{
  return self->_invalidateEverything;
}

- (BOOL)invalidateDataSourceCounts
{
  return self->_invalidateDataSourceCounts;
}

@end