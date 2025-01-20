@interface SFBrowserController
- (SFBrowserControllerProxy)proxy;
- (void)setProxy:(id)a3;
@end

@implementation SFBrowserController

- (void)setProxy:(id)a3
{
}

- (SFBrowserControllerProxy)proxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);

  return (SFBrowserControllerProxy *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end