@interface PKBannerPresentableConfiguration
- (id)didFinishHandler;
- (id)didStartHandler;
- (id)factory;
- (void)setDidFinishHandler:(id)a3;
- (void)setDidStartHandler:(id)a3;
- (void)setFactory:(id)a3;
@end

@implementation PKBannerPresentableConfiguration

- (id)factory
{
  return self->_factory;
}

- (void)setFactory:(id)a3
{
}

- (id)didStartHandler
{
  return self->_didStartHandler;
}

- (void)setDidStartHandler:(id)a3
{
}

- (id)didFinishHandler
{
  return self->_didFinishHandler;
}

- (void)setDidFinishHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);

  objc_storeStrong(&self->_factory, 0);
}

@end