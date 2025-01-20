@interface VUIAcquisitionRequest
- (BOOL)isCancelled;
- (VUIStoreAcquisitionProperties)properties;
- (id)completionBlock;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation VUIAcquisitionRequest

- (VUIStoreAcquisitionProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end