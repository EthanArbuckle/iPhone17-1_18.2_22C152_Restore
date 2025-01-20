@interface VUIASDDialogObserver
- (UIViewController)presenterViewController;
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)setPresenterViewController:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation VUIASDDialogObserver

- (void)startListening
{
  id v3 = [MEMORY[0x1E4F4BC58] defaultCenter];
  [v3 setDialogObserver:self];
}

- (void)stopListening
{
  id v2 = [MEMORY[0x1E4F4BC58] defaultCenter];
  [v2 setDialogObserver:0];
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __64__VUIASDDialogObserver_handleAuthenticateRequest_resultHandler___block_invoke;
  v14 = &unk_1E6DF43D0;
  objc_copyWeak(&v17, &location);
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  v10 = &v11;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v11, v12)) {
    v13((uint64_t)v10);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __64__VUIASDDialogObserver_handleAuthenticateRequest_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = +[VUIApplicationRouter topMostVisibleViewController];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [WeakRetained presenterViewController];
  }
  id v6 = v5;

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F4DF30]) initWithRequest:*(void *)(a1 + 32) presentingViewController:v6];
  id v8 = [v7 performAuthentication];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__VUIASDDialogObserver_handleAuthenticateRequest_resultHandler___block_invoke_2;
  v9[3] = &unk_1E6DF5998;
  id v10 = *(id *)(a1 + 40);
  [v8 addFinishBlock:v9];
}

void __64__VUIASDDialogObserver_handleAuthenticateRequest_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    a2;
    id v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIASDDialogObserver - Error presenting AMS Auth dialog -- error: %@", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void, void *, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, 0);
  }
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __58__VUIASDDialogObserver_handleDialogRequest_resultHandler___block_invoke;
  v14 = &unk_1E6DF43D0;
  objc_copyWeak(&v17, &location);
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = &v11;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v11, v12)) {
    v13((uint64_t)v10);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __58__VUIASDDialogObserver_handleDialogRequest_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = +[VUIApplicationRouter topMostVisibleViewController];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [WeakRetained presenterViewController];
  }
  id v6 = v5;

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F4DF28]) initWithRequest:*(void *)(a1 + 32) presentingViewController:v6];
  id v8 = [v7 present];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__VUIASDDialogObserver_handleDialogRequest_resultHandler___block_invoke_2;
  v9[3] = &unk_1E6DF59C0;
  id v10 = *(id *)(a1 + 40);
  [v8 addFinishBlock:v9];
}

void __58__VUIASDDialogObserver_handleDialogRequest_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    a2;
    id v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIASDDialogObserver - Error presenting AMS Dialog - error: %@", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void, void *, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, 0);
  }
}

- (UIViewController)presenterViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresenterViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end