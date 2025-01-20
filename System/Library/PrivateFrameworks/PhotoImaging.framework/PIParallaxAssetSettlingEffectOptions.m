@interface PIParallaxAssetSettlingEffectOptions
- (BOOL)isInteractiveRequest;
- (BOOL)loadVideoStatusOnly;
- (BOOL)needsInProcessHandling;
- (void)setIsInteractiveRequest:(BOOL)a3;
- (void)setLoadVideoStatusOnly:(BOOL)a3;
- (void)setNeedsInProcessHandling:(BOOL)a3;
@end

@implementation PIParallaxAssetSettlingEffectOptions

- (void)setLoadVideoStatusOnly:(BOOL)a3
{
  self->_loadVideoStatusOnly = a3;
}

- (BOOL)loadVideoStatusOnly
{
  return self->_loadVideoStatusOnly;
}

- (void)setNeedsInProcessHandling:(BOOL)a3
{
  self->_needsInProcessHandling = a3;
}

- (BOOL)needsInProcessHandling
{
  return self->_needsInProcessHandling;
}

- (void)setIsInteractiveRequest:(BOOL)a3
{
  self->_isInteractiveRequest = a3;
}

- (BOOL)isInteractiveRequest
{
  return self->_isInteractiveRequest;
}

@end