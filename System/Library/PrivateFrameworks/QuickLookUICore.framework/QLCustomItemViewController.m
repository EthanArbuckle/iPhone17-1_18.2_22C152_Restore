@interface QLCustomItemViewController
- (BOOL)isShareEnabled;
- (NSDictionary)previewOptions;
- (QLCustomItemViewControllerHost)hostViewControllerProxy;
- (UIView)shareSheetPresentationView;
- (void)dismissPreviewController;
- (void)forwardMessageToHost:(id)a3 completionHandler:(id)a4;
- (void)getFrameWithCompletionBlock:(id)a3;
- (void)presentActivityViewControllerFromView:(id)a3;
- (void)presentActivityViewControllerFromView:(id)a3 withURL:(id)a4;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setFullScreen:(BOOL)a3;
- (void)setHostViewControllerProxy:(id)a3;
- (void)setIsShareEnabled:(BOOL)a3;
- (void)setPreviewOptions:(id)a3;
- (void)setShareSheetPresentationView:(id)a3;
@end

@implementation QLCustomItemViewController

- (void)dismissPreviewController
{
  id v2 = [(QLCustomItemViewController *)self hostViewControllerProxy];
  [v2 dismissQuickLook];
}

- (void)presentActivityViewControllerFromView:(id)a3
{
}

- (void)presentActivityViewControllerFromView:(id)a3 withURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeWeak((id *)&self->_shareSheetPresentationView, v6);
  objc_initWeak(&location, self);
  v8 = [(QLCustomItemViewController *)self hostViewControllerProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__QLCustomItemViewController_presentActivityViewControllerFromView_withURL___block_invoke;
  v9[3] = &unk_1E6DD4210;
  objc_copyWeak(&v10, &location);
  [v8 presentShareSheetWithPopoverTracker:self customSharedURL:v7 dismissCompletion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __76__QLCustomItemViewController_presentActivityViewControllerFromView_withURL___block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __76__QLCustomItemViewController_presentActivityViewControllerFromView_withURL___block_invoke_2;
  v1[3] = &unk_1E6DD4210;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  QLRunInMainThread(v1);
  objc_destroyWeak(&v2);
}

void __76__QLCustomItemViewController_presentActivityViewControllerFromView_withURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained didDismissActivityViewController];
    id WeakRetained = v2;
  }
}

- (void)setFullScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(QLCustomItemViewController *)self hostViewControllerProxy];
  [v4 setFullScreen:v3];
}

- (void)forwardMessageToHost:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &__block_literal_global_2;
  }
  id v8 = a3;
  v9 = [(QLCustomItemViewController *)self hostViewControllerProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__QLCustomItemViewController_forwardMessageToHost_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6DD4280;
  id v12 = v7;
  id v10 = v7;
  [v9 forwardMessageToHostOfCustomViewController:v8 completionHandler:v11];
}

void __69__QLCustomItemViewController_forwardMessageToHost_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__QLCustomItemViewController_forwardMessageToHost_completionHandler___block_invoke_3;
  v10[3] = &unk_1E6DD4258;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  QLRunInMainThread(v10);
}

uint64_t __69__QLCustomItemViewController_forwardMessageToHost_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (QLAppearance *)a3;
  uint64_t v7 = [(QLAppearance *)v6 presentationMode];
  if (v7 != [(QLAppearance *)self->_lastAppearance presentationMode]) {
    [(QLCustomItemViewController *)self presentationModeDidChange:[(QLAppearance *)v6 presentationMode] animated:v4];
  }
  lastAppearance = self->_lastAppearance;
  self->_lastAppearance = v6;
}

- (void)getFrameWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__QLCustomItemViewController_getFrameWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E6DD42A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  QLRunInMainThread(v6);
}

void __58__QLCustomItemViewController_getFrameWithCompletionBlock___block_invoke(uint64_t a1)
{
  BOOL v3 = (id *)a1;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = 1000;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
  if (WeakRetained)
  {
    id v1 = objc_loadWeakRetained((id *)v3[4] + 125);
    id v2 = [v1 superview];
    uint64_t v5 = (uint64_t)objc_loadWeakRetained((id *)v3[4] + 125);
    [(id)v5 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    BOOL v3 = [v3[4] view];
    objc_msgSend(v2, "convertRect:toView:", v3, v11, v13, v15, v17);
  }
  else
  {
    v6.n128_u64[0] = *MEMORY[0x1E4F1DB28];
    v7.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB28] + 8);
    v8.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB28] + 16);
    v9.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB28] + 24);
  }
  (*(void (**)(uint64_t, __n128, __n128, __n128, __n128))(v4 + 16))(v4, v6, v7, v8, v9);
  if (WeakRetained)
  {
  }
}

- (NSDictionary)previewOptions
{
  return self->_previewOptions;
}

- (void)setPreviewOptions:(id)a3
{
}

- (BOOL)isShareEnabled
{
  return self->_isShareEnabled;
}

- (void)setIsShareEnabled:(BOOL)a3
{
  self->_isShareEnabled = a3;
}

- (UIView)shareSheetPresentationView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shareSheetPresentationView);
  return (UIView *)WeakRetained;
}

- (void)setShareSheetPresentationView:(id)a3
{
}

- (QLCustomItemViewControllerHost)hostViewControllerProxy
{
  return (QLCustomItemViewControllerHost *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setHostViewControllerProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostViewControllerProxy, 0);
  objc_destroyWeak((id *)&self->_shareSheetPresentationView);
  objc_storeStrong((id *)&self->_previewOptions, 0);
  objc_storeStrong((id *)&self->_lastAppearance, 0);
}

@end