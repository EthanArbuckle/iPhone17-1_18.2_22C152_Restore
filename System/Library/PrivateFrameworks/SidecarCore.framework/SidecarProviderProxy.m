@interface SidecarProviderProxy
+ (SidecarProviderProxy)defaultProxy;
- (SidecarProviderProxy)init;
- (SidecarServiceProviderDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)sidecarServiceTerminate;
- (void)sidecarSession:(id)a3 receivedMessage:(id)a4;
- (void)sidecarSessionStarted:(id)a3;
@end

@implementation SidecarProviderProxy

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (SidecarServiceProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SidecarServiceProviderDelegate *)WeakRetained;
}

- (void)sidecarServiceTerminate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sidecarServiceProviderTerminate];
}

- (void)sidecarSession:(id)a3 receivedMessage:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = [(SidecarRequest *)[SidecarResponse alloc] initWithSession:v7 message:v6];

  [(SidecarRequest *)v8 setDelegate:WeakRetained];
  [v7 setDelegate:v8];
  [(SidecarRequest *)v8 sidecarSessionStarted:v7];

  [WeakRetained sidecarServiceProviderHandleRequest:v8];
}

- (void)sidecarSessionStarted:(id)a3
{
}

- (SidecarProviderProxy)init
{
  v3.receiver = self;
  v3.super_class = (Class)SidecarProviderProxy;
  return [(SidecarProviderProxy *)&v3 init];
}

+ (SidecarProviderProxy)defaultProxy
{
  if (defaultProxy_once != -1) {
    dispatch_once(&defaultProxy_once, &__block_literal_global_287);
  }
  v2 = (void *)defaultProxy_proxy;

  return (SidecarProviderProxy *)v2;
}

uint64_t __36__SidecarProviderProxy_defaultProxy__block_invoke()
{
  defaultProxy_proxy = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

@end