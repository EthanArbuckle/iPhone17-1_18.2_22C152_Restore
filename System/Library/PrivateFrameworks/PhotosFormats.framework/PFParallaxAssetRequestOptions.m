@interface PFParallaxAssetRequestOptions
- (BOOL)needsInProcessHandling;
- (void)setNeedsInProcessHandling:(BOOL)a3;
@end

@implementation PFParallaxAssetRequestOptions

- (void)setNeedsInProcessHandling:(BOOL)a3
{
  self->_needsInProcessHandling = a3;
}

- (BOOL)needsInProcessHandling
{
  return self->_needsInProcessHandling;
}

@end