@interface VSViewServiceHostViewController
- (BOOL)_shouldAuthenticateAccountProviderWithIdentifier:(id)a3;
- (BOOL)hasRequestedPresentation;
- (BOOL)hasRetriedOnce;
- (BOOL)isModalInPresentation;
- (NSMutableDictionary)requestsByID;
- (VSOptional)currentRequest;
- (VSViewControllerFactory)viewControllerFactory;
- (VSViewServiceHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VSViewServiceHostViewControllerDelegate)delegate;
- (VSViewServiceRemoteViewController)remoteViewController;
- (id)_requestForID:(id)a3;
- (int64_t)modalPresentationStyle;
- (void)_addRemoteViewControllerAsChildViewController;
- (void)_cancelButtonPressed:(id)a3;
- (void)_connectToViewServiceForRequest:(id)a3;
- (void)_didCancelRequest:(id)a3;
- (void)_didChooseAdditionalProvidersForRequest:(id)a3;
- (void)_didCompleteRequest:(id)a3;
- (void)_dismissViewServiceHostViewController;
- (void)_presentViewServiceHostViewController;
- (void)_removeRemoteViewControllerAsChildViewController;
- (void)_request:(id)a3 didFailWithError:(id)a4;
- (void)_request:(id)a3 didFinishWithResponse:(id)a4;
- (void)dealloc;
- (void)dismissViewServiceRemoteViewController:(id)a3;
- (void)enqueueViewServiceRequest:(id)a3 withIdentifier:(id)a4;
- (void)presentViewServiceRemoteViewController:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasRequestedPresentation:(BOOL)a3;
- (void)setHasRetriedOnce:(BOOL)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setRequestsByID:(id)a3;
- (void)setViewControllerFactory:(id)a3;
- (void)viewServiceRemoteViewController:(id)a3 didCancelRequest:(id)a4;
- (void)viewServiceRemoteViewController:(id)a3 didChooseAdditionalProvidersForRequest:(id)a4;
- (void)viewServiceRemoteViewController:(id)a3 didSelectProviderWithIdentifier:(id)a4 vetoHandler:(id)a5;
- (void)viewServiceRemoteViewController:(id)a3 didTerminateWithError:(id)a4;
- (void)viewServiceRemoteViewController:(id)a3 request:(id)a4 didFailWithError:(id)a5;
- (void)viewServiceRemoteViewController:(id)a3 request:(id)a4 didFinishWithResponse:(id)a5;
@end

@implementation VSViewServiceHostViewController

- (VSViewServiceHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  VSRequireMainThread();
  v16.receiver = self;
  v16.super_class = (Class)VSViewServiceHostViewController;
  v8 = [(VSViewServiceHostViewController *)&v16 initWithNibName:v7 bundle:v6];

  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    requestsByID = v8->_requestsByID;
    v8->_requestsByID = v9;

    uint64_t v11 = +[VSViewControllerFactory sharedFactory];
    viewControllerFactory = v8->_viewControllerFactory;
    v8->_viewControllerFactory = (VSViewControllerFactory *)v11;

    v13 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    currentRequest = v8->_currentRequest;
    v8->_currentRequest = v13;
  }
  return v8;
}

- (void)dealloc
{
  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSViewServiceHostViewController;
  [(VSViewServiceHostViewController *)&v3 dealloc];
}

- (void)enqueueViewServiceRequest:(id)a3 withIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Will enque view service request in host view controller: %@", buf, 0xCu);
  }

  v9 = [(VSViewServiceHostViewController *)self requestsByID];
  v10 = [v9 objectForKey:v7];

  if (v10) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Request %@ already enqueued.", v7 format];
  }
  uint64_t v11 = (void *)[v6 copy];
  [v9 setObject:v11 forKey:v7];

  if ([v9 count] == 1) {
    [(VSViewServiceHostViewController *)self _connectToViewServiceForRequest:v7];
  }
}

- (id)_requestForID:(id)a3
{
  v4 = (void *)MEMORY[0x263F1E250];
  id v5 = a3;
  id v6 = [(VSViewServiceHostViewController *)self requestsByID];
  id v7 = [v6 objectForKey:v5];

  v8 = [v4 optionalWithObject:v7];

  return v8;
}

- (void)_didCompleteRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Did complete request %@", buf, 0xCu);
  }

  id v6 = [(VSViewServiceHostViewController *)self requestsByID];
  id v7 = [v6 allKeys];
  char v8 = [v7 containsObject:v4];

  if ((v8 & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Unrecognized request ID: %@", v4 format];
  }
  [v6 removeObjectForKey:v4];
  if ([v6 count])
  {
    v9 = [v6 allKeys];
    id v10 = [v9 objectAtIndex:0];

    uint64_t v11 = VSDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_impl(&dword_23F9AB000, v11, OS_LOG_TYPE_DEFAULT, "Will handle next request: %@", buf, 0xCu);
    }

    [(VSViewServiceHostViewController *)self _connectToViewServiceForRequest:v10];
  }
  else
  {
    v12 = VSDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v12, OS_LOG_TYPE_DEFAULT, "No more requests remain.", buf, 2u);
    }

    id v10 = objc_alloc_init(MEMORY[0x263F1E250]);
    [(VSViewServiceHostViewController *)self setCurrentRequest:v10];
  }
}

- (void)_request:(id)a3 didFinishWithResponse:(id)a4
{
  id v6 = a4;
  id v7 = [(VSViewServiceHostViewController *)self _requestForID:a3];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__VSViewServiceHostViewController__request_didFinishWithResponse___block_invoke;
  v9[3] = &unk_265076978;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 conditionallyUnwrapObject:v9];
}

void __66__VSViewServiceHostViewController__request_didFinishWithResponse___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 viewServiceHostViewController:*(void *)(a1 + 32) request:v4 didFinishWithResponse:*(void *)(a1 + 40)];
}

- (void)_request:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  id v7 = [(VSViewServiceHostViewController *)self _requestForID:a3];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__VSViewServiceHostViewController__request_didFailWithError___block_invoke;
  v9[3] = &unk_265076978;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 conditionallyUnwrapObject:v9];
}

void __61__VSViewServiceHostViewController__request_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 viewServiceHostViewController:*(void *)(a1 + 32) request:v4 didFailWithError:*(void *)(a1 + 40)];
}

- (void)_didCancelRequest:(id)a3
{
  id v4 = [(VSViewServiceHostViewController *)self _requestForID:a3];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__VSViewServiceHostViewController__didCancelRequest___block_invoke;
  v5[3] = &unk_2650769A0;
  v5[4] = self;
  [v4 conditionallyUnwrapObject:v5];
}

void __53__VSViewServiceHostViewController__didCancelRequest___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 viewServiceHostViewController:*(void *)(a1 + 32) didCancelRequest:v4];
}

- (void)_didChooseAdditionalProvidersForRequest:(id)a3
{
  id v4 = [(VSViewServiceHostViewController *)self _requestForID:a3];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __75__VSViewServiceHostViewController__didChooseAdditionalProvidersForRequest___block_invoke;
  v5[3] = &unk_2650769A0;
  v5[4] = self;
  [v4 conditionallyUnwrapObject:v5];
}

void __75__VSViewServiceHostViewController__didChooseAdditionalProvidersForRequest___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 viewServiceHostViewController:*(void *)(a1 + 32) didChooseAdditionalProvidersForRequest:v4];
}

- (void)_presentViewServiceHostViewController
{
  id v3 = [(VSViewServiceHostViewController *)self delegate];
  [v3 presentViewServiceHostViewController:self];
}

- (void)_dismissViewServiceHostViewController
{
  id v3 = [(VSViewServiceHostViewController *)self delegate];
  [v3 dismissViewServiceHostViewController:self];
}

- (BOOL)_shouldAuthenticateAccountProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(VSViewServiceHostViewController *)self delegate];
  LOBYTE(self) = [v5 viewServiceHostViewController:self shouldAuthenticateAccountProviderWithIdentifier:v4];

  return (char)self;
}

- (void)_cancelButtonPressed:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(VSViewServiceHostViewController *)self requestsByID];
  id v5 = [v4 allKeys];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        [(VSViewServiceHostViewController *)self _didCancelRequest:v11];
        [(VSViewServiceHostViewController *)self _didCompleteRequest:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)presentViewServiceRemoteViewController:(id)a3
{
  if (![(VSViewServiceHostViewController *)self hasRequestedPresentation])
  {
    [(VSViewServiceHostViewController *)self setHasRequestedPresentation:1];
    [(VSViewServiceHostViewController *)self _presentViewServiceHostViewController];
  }
  [(VSViewServiceHostViewController *)self _addRemoteViewControllerAsChildViewController];
}

- (void)dismissViewServiceRemoteViewController:(id)a3
{
  if ([(VSViewServiceHostViewController *)self hasRequestedPresentation])
  {
    [(VSViewServiceHostViewController *)self setHasRequestedPresentation:0];
    [(VSViewServiceHostViewController *)self _dismissViewServiceHostViewController];
  }
}

- (void)viewServiceRemoteViewController:(id)a3 request:(id)a4 didFinishWithResponse:(id)a5
{
  id v7 = a4;
  [(VSViewServiceHostViewController *)self _request:v7 didFinishWithResponse:a5];
  [(VSViewServiceHostViewController *)self _didCompleteRequest:v7];
}

- (void)viewServiceRemoteViewController:(id)a3 didTerminateWithError:(id)a4
{
  id v5 = a4;
  id v6 = VSErrorLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[VSViewServiceHostViewController viewServiceRemoteViewController:didTerminateWithError:]((uint64_t)v5, v6);
  }

  id v7 = [(VSViewServiceHostViewController *)self currentRequest];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke;
  v10[3] = &unk_2650769F0;
  v10[4] = self;
  id v11 = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_12;
  v9[3] = &unk_265076A18;
  v9[4] = self;
  id v8 = v5;
  [v7 conditionallyUnwrapObject:v10 otherwise:v9];
}

void __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) hasRequestedPresentation];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 _removeRemoteViewControllerAsChildViewController];
    [*(id *)(a1 + 32) setRemoteViewController:0];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v3;
    id v6 = VSPrivateViewServiceCrashedErrorWithRecoveryHandler();
    id v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_cold_1((uint64_t)v6, v7);
    }

    id v8 = VSAlertForError(v6, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0, v10, 3221225472, __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_2, &unk_2650769C8, v11);
  }
  else if ([v5 hasRetriedOnce])
  {
    uint64_t v9 = VSPublicError();
    [*(id *)(a1 + 32) _request:v3 didFailWithError:v9];
    [*(id *)(a1 + 32) _didCompleteRequest:v3];
  }
  else
  {
    [*(id *)(a1 + 32) setHasRetriedOnce:1];
    [*(id *)(a1 + 32) setRemoteViewController:0];
    [*(id *)(a1 + 32) _connectToViewServiceForRequest:v3];
  }
}

uint64_t __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_2(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (a2)
  {
    return [v3 _connectToViewServiceForRequest:v4];
  }
  else
  {
    [v3 _didCancelRequest:v4];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    return [v6 _didCompleteRequest:v7];
  }
}

uint64_t __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRemoteViewController:0];
}

- (void)viewServiceRemoteViewController:(id)a3 request:(id)a4 didFailWithError:(id)a5
{
  id v7 = a4;
  [(VSViewServiceHostViewController *)self _request:v7 didFailWithError:a5];
  [(VSViewServiceHostViewController *)self _didCompleteRequest:v7];
}

- (void)viewServiceRemoteViewController:(id)a3 didChooseAdditionalProvidersForRequest:(id)a4
{
  id v5 = a4;
  [(VSViewServiceHostViewController *)self _didChooseAdditionalProvidersForRequest:v5];
  [(VSViewServiceHostViewController *)self _didCompleteRequest:v5];
}

- (void)viewServiceRemoteViewController:(id)a3 didCancelRequest:(id)a4
{
  id v5 = a4;
  [(VSViewServiceHostViewController *)self _didCancelRequest:v5];
  [(VSViewServiceHostViewController *)self _didCompleteRequest:v5];
}

- (void)viewServiceRemoteViewController:(id)a3 didSelectProviderWithIdentifier:(id)a4 vetoHandler:(id)a5
{
  id v7 = (void (**)(id, BOOL))a5;
  v7[2](v7, [(VSViewServiceHostViewController *)self _shouldAuthenticateAccountProviderWithIdentifier:a4]);
}

- (void)_connectToViewServiceForRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Entering %@ for request %@.", buf, 0x16u);
  }
  id v8 = (void *)MEMORY[0x263F1E250];
  uint64_t v9 = (void *)[v5 copy];
  uint64_t v10 = [v8 optionalWithObject:v9];
  [(VSViewServiceHostViewController *)self setCurrentRequest:v10];

  uint64_t v11 = [(VSViewServiceHostViewController *)self remoteViewController];
  id v12 = v11;
  if (v11)
  {
    long long v13 = [v11 serviceViewControllerProxy];
    long long v14 = VSDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v5;
      _os_log_impl(&dword_23F9AB000, v14, OS_LOG_TYPE_DEFAULT, "Will send request %@ to view service.", buf, 0xCu);
    }

    long long v15 = [(VSViewServiceHostViewController *)self _requestForID:v5];
    objc_super v16 = [v15 forceUnwrapObject];

    [v13 _performRequest:v16 withIdentifier:v5];
    uint64_t v17 = VSDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v5;
      _os_log_impl(&dword_23F9AB000, v17, OS_LOG_TYPE_DEFAULT, "Did send request %@ to view service.", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v18 = VSDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_23F9AB000, v18, OS_LOG_TYPE_DEFAULT, "Will construct remote view controller.", v23, 2u);
    }

    v19 = [(VSViewServiceHostViewController *)self viewControllerFactory];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __67__VSViewServiceHostViewController__connectToViewServiceForRequest___block_invoke;
    v20[3] = &unk_265076A40;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v5;
    [v19 viewServiceRemoteViewControllerWithCompletion:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __67__VSViewServiceHostViewController__connectToViewServiceForRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = v5;
      uint64_t v9 = VSDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_23F9AB000, v9, OS_LOG_TYPE_DEFAULT, "Did construct remote view controller.", v12, 2u);
      }

      [WeakRetained setRemoteViewController:v8];
      [v8 setDelegate:WeakRetained];

      [WeakRetained _connectToViewServiceForRequest:*(void *)(a1 + 32)];
    }
    else
    {
      if (!v6) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The errorOrNil parameter must not be nil."];
      }
      id v10 = v6;
      uint64_t v11 = VSErrorLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __67__VSViewServiceHostViewController__connectToViewServiceForRequest___block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v10, v11);
      }

      [WeakRetained _request:*(void *)(a1 + 32) didFailWithError:v10];
      [WeakRetained _didCompleteRequest:*(void *)(a1 + 32)];
    }
  }
}

- (void)_removeRemoteViewControllerAsChildViewController
{
  id v6 = [(VSViewServiceHostViewController *)self remoteViewController];
  if (v6)
  {
    id v3 = [(VSViewServiceHostViewController *)self childViewControllers];
    int v4 = [v3 containsObject:v6];

    if (v4)
    {
      [v6 willMoveToParentViewController:0];
      id v5 = [v6 view];
      [v5 removeFromSuperview];
      [v6 removeFromParentViewController];
    }
  }
}

- (void)_addRemoteViewControllerAsChildViewController
{
  uint64_t v3 = [(VSViewServiceHostViewController *)self remoteViewController];
  if (v3)
  {
    id v7 = (void *)v3;
    [(VSViewServiceHostViewController *)self addChildViewController:v3];
    int v4 = [v7 view];
    id v5 = [(VSViewServiceHostViewController *)self view];
    [v5 bounds];
    objc_msgSend(v4, "setFrame:");

    [v4 setAutoresizingMask:18];
    id v6 = [(VSViewServiceHostViewController *)self view];
    [v6 insertSubview:v4 atIndex:0];

    [v7 didMoveToParentViewController:self];
  }
  MEMORY[0x270F9A758]();
}

- (VSViewServiceHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSViewServiceHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)requestsByID
{
  return self->_requestsByID;
}

- (void)setRequestsByID:(id)a3
{
}

- (VSOptional)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
}

- (VSViewServiceRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (BOOL)hasRetriedOnce
{
  return self->_hasRetriedOnce;
}

- (void)setHasRetriedOnce:(BOOL)a3
{
  self->_hasRetriedOnce = a3;
}

- (BOOL)hasRequestedPresentation
{
  return self->_hasRequestedPresentation;
}

- (void)setHasRequestedPresentation:(BOOL)a3
{
  self->_hasRequestedPresentation = a3;
}

- (VSViewControllerFactory)viewControllerFactory
{
  return self->_viewControllerFactory;
}

- (void)setViewControllerFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerFactory, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_requestsByID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewServiceRemoteViewController:(uint64_t)a1 didTerminateWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "View service did terminate with error: %@", (uint8_t *)&v2, 0xCu);
}

void __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Will present alert for termination error: %@", (uint8_t *)&v2, 0xCu);
}

void __67__VSViewServiceHostViewController__connectToViewServiceForRequest___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v6 = 138412546;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_error_impl(&dword_23F9AB000, a3, OS_LOG_TYPE_ERROR, "Remote view controller error while displaying %@: %@", (uint8_t *)&v6, 0x16u);
}

@end