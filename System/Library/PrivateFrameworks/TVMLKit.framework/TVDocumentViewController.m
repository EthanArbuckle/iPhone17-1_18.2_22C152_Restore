@interface TVDocumentViewController
+ (id)viewControllerWithContext:(id)a3 forAppController:(id)a4;
- (BOOL)handleEvent:(id)a3 withElement:(id)a4 targetResponder:(id)a5;
- (NSDictionary)documentContext;
- (TVApplicationController)appController;
- (TVDocumentViewControllerDelegate)delegate;
- (id)tvdvc_initWithNibName:(id)a3 bundle:(id)a4;
- (void)didFailUpdateWithError:(id)a3;
- (void)didUpdateDocument;
- (void)didUpdateWithContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentContext:(id)a3;
- (void)updateUsingContext:(id)a3;
- (void)willUpdateDocument;
@end

@implementation TVDocumentViewController

- (id)tvdvc_initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TVDocumentViewController;
  v6 = [(TVDocumentViewController *)&v8 initWithNibName:a3 bundle:a4];
  return v6;
}

+ (id)viewControllerWithContext:(id)a3 forAppController:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F4B480];
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)[[v5 alloc] initWithContextDictionary:v7 element:0];
  id v9 = objc_alloc(MEMORY[0x263F4B438]);
  v10 = [v6 _appContext];

  v11 = (void *)[v9 initWithAppContext:v10 serviceContext:v8];
  v12 = [[_TVAppDocumentRequestController alloc] initWithDocumentServiceRequest:v11];
  [(TVDocumentViewController *)v12 setDocumentContext:v7];

  return v12;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v7 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    uint64_t v6 = [obj conformsToProtocol:&unk_26E601EB8];
    if (v6)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      p_delegateFlags = &self->_delegateFlags;
      self->_delegateFlags.respondsToWillUpdate = objc_opt_respondsToSelector() & 1;

      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      p_delegateFlags->respondsToDidUpdate = objc_opt_respondsToSelector() & 1;

      id v11 = objc_loadWeakRetained((id *)p_delegate);
      p_delegateFlags->respondsToHandleEvent = objc_opt_respondsToSelector() & 1;

      id v12 = objc_loadWeakRetained((id *)p_delegate);
      p_delegateFlags->respondsToDidFailWithError = objc_opt_respondsToSelector() & 1;

      id v13 = objc_loadWeakRetained((id *)p_delegate);
      p_delegateFlags->respondsToDidUpdateWithContext = objc_opt_respondsToSelector() & 1;
    }
    else
    {
      *(_DWORD *)&self->_delegateFlags.respondsToWillUpdate = 0;
      self->_delegateFlags.respondsToDidUpdateWithContext = 0;
    }
    id v7 = obj;
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)updateUsingContext:(id)a3
{
  id v4 = a3;
  id v6 = [(TVDocumentViewController *)self documentContext];
  [(TVDocumentViewController *)self setDocumentContext:v4];

  id v5 = [(TVDocumentViewController *)self documentContext];

  if (v6 != v5) {
    [(TVDocumentViewController *)self didChangeDocumentContext];
  }
}

- (void)willUpdateDocument
{
  if (self->_delegateFlags.respondsToWillUpdate)
  {
    id v3 = [(TVDocumentViewController *)self delegate];
    [v3 documentViewControllerWillUpdate:self];
  }
}

- (void)didUpdateDocument
{
  if (self->_delegateFlags.respondsToDidUpdate)
  {
    id v3 = [(TVDocumentViewController *)self delegate];
    [v3 documentViewControllerDidUpdate:self];
  }
}

- (void)didUpdateWithContext:(id)a3
{
  if (self->_delegateFlags.respondsToDidUpdateWithContext)
  {
    id v4 = a3;
    id v5 = [(TVDocumentViewController *)self delegate];
    [v5 documentViewController:self didUpdateWithContext:v4];
  }
}

- (void)didFailUpdateWithError:(id)a3
{
  if (self->_delegateFlags.respondsToDidFailWithError)
  {
    id v4 = a3;
    id v5 = [(TVDocumentViewController *)self delegate];
    [v5 documentViewController:self didFailUpdateWithError:v4];
  }
}

- (BOOL)handleEvent:(id)a3 withElement:(id)a4 targetResponder:(id)a5
{
  if (!self->_delegateFlags.respondsToHandleEvent) {
    return 0;
  }
  id v6 = self;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(TVDocumentViewController *)v6 delegate];
  LOBYTE(v6) = [v9 documentViewController:v6 handleEvent:v8 withElement:v7];

  return (char)v6;
}

- (NSDictionary)documentContext
{
  return self->_documentContext;
}

- (void)setDocumentContext:(id)a3
{
}

- (TVApplicationController)appController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appController);
  return (TVApplicationController *)WeakRetained;
}

- (TVDocumentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVDocumentViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appController);
  objc_storeStrong((id *)&self->_documentContext, 0);
}

@end