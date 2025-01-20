@interface PKIssuerProvisioningExtensionAuthorizationRemoteViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
- (BOOL)_isPresentationContextByDefault;
- (PKIssuerProvisioningExtensionAuthorizationRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)pkui_finish;
- (void)pkui_setCompletionHandler:(id)a3;
- (void)serviceViewControllerDidCompleteWithResult:(int64_t)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation PKIssuerProvisioningExtensionAuthorizationRemoteViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (PKIssuerProvisioningExtensionAuthorizationRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationRemoteViewController;
  result = [(PKIssuerProvisioningExtensionAuthorizationRemoteViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->_result = 0;
  }
  return result;
}

- (void)dealloc
{
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v4 = _Block_copy(completionHandler);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PKIssuerProvisioningExtensionAuthorizationRemoteViewController_dealloc__block_invoke;
    block[3] = &unk_1E59CAA98;
    id v8 = v4;
    id v5 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v6.receiver = self;
  v6.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationRemoteViewController;
  [(_UIRemoteViewController *)&v6 dealloc];
}

uint64_t __73__PKIssuerProvisioningExtensionAuthorizationRemoteViewController_dealloc__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_isPresentationContextByDefault
{
  return 1;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationRemoteViewController;
  [(_UIRemoteViewController *)&v4 viewServiceDidTerminateWithError:a3];
  [(PKIssuerProvisioningExtensionAuthorizationRemoteViewController *)self pkui_finish];
}

- (void)serviceViewControllerDidCompleteWithResult:(int64_t)a3
{
  self->_result = a3;
  [(PKIssuerProvisioningExtensionAuthorizationRemoteViewController *)self pkui_finish];
}

- (void)pkui_finish
{
  if (!self->_finished)
  {
    self->_finished = 1;
    id completionHandler = (void (**)(id, BOOL))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, self->_result == 1);
      id v4 = self->_completionHandler;
      self->_id completionHandler = 0;
    }
  }
}

- (void)pkui_setCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  id completionHandler = (void (**)(id, BOOL))self->_completionHandler;
  if (completionHandler != v4)
  {
    if (self->_finished)
    {
      if (!v4) {
        goto LABEL_9;
      }
      id v8 = v4;
      v4[2](v4, self->_result == 1);
    }
    else
    {
      id v8 = v4;
      if (completionHandler)
      {
        completionHandler[2](completionHandler, 0);
        id v4 = v8;
      }
      objc_super v6 = _Block_copy(v4);
      id v7 = self->_completionHandler;
      self->_id completionHandler = v6;
    }
    id v4 = v8;
  }
LABEL_9:
}

- (void).cxx_destruct
{
}

@end