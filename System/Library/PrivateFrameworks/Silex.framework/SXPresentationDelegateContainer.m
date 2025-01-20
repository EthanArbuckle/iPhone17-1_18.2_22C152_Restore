@interface SXPresentationDelegateContainer
- (SXPresentationDelegate)presentationDelegate;
- (void)registerPresentationDelegate:(id)a3;
@end

@implementation SXPresentationDelegateContainer

- (void)registerPresentationDelegate:(id)a3
{
}

- (SXPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (SXPresentationDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end