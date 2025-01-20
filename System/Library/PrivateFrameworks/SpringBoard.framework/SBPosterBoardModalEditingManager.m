@interface SBPosterBoardModalEditingManager
- (BOOL)beginExternalPosterEditingSessionWithEditingRequest:(id)a3 completion:(id)a4;
- (SBPosterBoardModalEditingManager)init;
- (void)_dismissTransientOverlayViewControllerIfPresenting:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentTransientOverlayViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)posterEditingTransientOverlayViewController:(id)a3 didDismissWithResponse:(id)a4;
- (void)posterEditingTransientOverlayViewController:(id)a3 willDismissWithResponse:(id)a4;
- (void)sendRequestDismissalActionWithEditingRequest:(id)a3;
@end

@implementation SBPosterBoardModalEditingManager

- (SBPosterBoardModalEditingManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBPosterBoardModalEditingManager;
  v2 = [(SBPosterBoardModalEditingManager *)&v8 init];
  if (v2)
  {
    v3 = (PRUISExternallyHostedPosterEditingServer *)objc_alloc_init(MEMORY[0x1E4F923F0]);
    posterEditingServer = v2->_posterEditingServer;
    v2->_posterEditingServer = v3;

    [(PRUISExternallyHostedPosterEditingServer *)v2->_posterEditingServer activate];
    [(PRUISExternallyHostedPosterEditingServer *)v2->_posterEditingServer setDelegate:v2];
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    presentedTransientOverlayControllers = v2->_presentedTransientOverlayControllers;
    v2->_presentedTransientOverlayControllers = (NSMutableArray *)v5;
  }
  return v2;
}

- (BOOL)beginExternalPosterEditingSessionWithEditingRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    id v8 = a4;
    v9 = [[SBPosterEditingTransientOverlayViewController alloc] initWithEditingRequest:v7];
    [(SBPosterEditingTransientOverlayViewController *)v9 setDelegate:self];
    [(SBPosterBoardModalEditingManager *)self _presentTransientOverlayViewController:v9 animated:0 completion:v8];
  }
  else
  {
    v10 = (void (**)(void))a4;
    v11 = SBLogWallpaper();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SBPosterBoardModalEditingManager beginExternalPosterEditingSessionWithEditingRequest:completion:]((uint64_t)self, (uint64_t)a2, v11);
    }

    v10[2](v10);
  }

  return v7 != 0;
}

- (void)sendRequestDismissalActionWithEditingRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBPosterBoardModalEditingManager.m", 57, @"Invalid parameter not satisfying: %@", @"editingRequest" object file lineNumber description];
  }
  presentedTransientOverlayControllers = self->_presentedTransientOverlayControllers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__SBPosterBoardModalEditingManager_sendRequestDismissalActionWithEditingRequest___block_invoke;
  v11[3] = &unk_1E6B00658;
  id v12 = v5;
  id v7 = v5;
  id v8 = [(NSMutableArray *)presentedTransientOverlayControllers bs_firstObjectPassingTest:v11];
  v9 = v8;
  if (v8) {
    [v8 sendRequestDismissalAction];
  }
}

uint64_t __81__SBPosterBoardModalEditingManager_sendRequestDismissalActionWithEditingRequest___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 editingRequest];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

- (void)posterEditingTransientOverlayViewController:(id)a3 willDismissWithResponse:(id)a4
{
  posterEditingServer = self->_posterEditingServer;
  id v6 = a4;
  id v7 = [a3 editingRequest];
  [(PRUISExternallyHostedPosterEditingServer *)posterEditingServer sessionWithEditingRequest:v7 willEndEditingWithResponse:v6];
}

- (void)posterEditingTransientOverlayViewController:(id)a3 didDismissWithResponse:(id)a4
{
  posterEditingServer = self->_posterEditingServer;
  id v7 = a4;
  id v9 = a3;
  id v8 = [v9 editingRequest];
  [(PRUISExternallyHostedPosterEditingServer *)posterEditingServer sessionWithEditingRequest:v8 didEndEditingWithResponse:v7];

  [(SBPosterBoardModalEditingManager *)self _dismissTransientOverlayViewControllerIfPresenting:v9 animated:0 completion:0];
}

- (void)_presentTransientOverlayViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (([(NSMutableArray *)self->_presentedTransientOverlayControllers containsObject:v8] & 1) == 0)
  {
    objc_initWeak(&location, self);
    v10 = +[SBWorkspace mainWorkspace];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __95__SBPosterBoardModalEditingManager__presentTransientOverlayViewController_animated_completion___block_invoke;
    v11[3] = &unk_1E6AF6A20;
    objc_copyWeak(&v14, &location);
    id v12 = v8;
    id v13 = v9;
    [v10 presentTransientOverlayViewController:v12 animated:v6 completion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __95__SBPosterBoardModalEditingManager__presentTransientOverlayViewController_animated_completion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[2] addObject:*(void *)(a1 + 32)];
    uint64_t v3 = v5;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v3);
    uint64_t v3 = v5;
  }
}

- (void)_dismissTransientOverlayViewControllerIfPresenting:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(NSMutableArray *)self->_presentedTransientOverlayControllers containsObject:v8])
  {
    objc_initWeak(&location, self);
    v10 = +[SBWorkspace mainWorkspace];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __107__SBPosterBoardModalEditingManager__dismissTransientOverlayViewControllerIfPresenting_animated_completion___block_invoke;
    v11[3] = &unk_1E6AF6A20;
    objc_copyWeak(&v14, &location);
    id v12 = v8;
    id v13 = v9;
    [v10 dismissTransientOverlayViewController:v12 animated:v6 completion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __107__SBPosterBoardModalEditingManager__dismissTransientOverlayViewControllerIfPresenting_animated_completion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[2] removeObject:*(void *)(a1 + 32)];
    uint64_t v3 = v5;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v3);
    uint64_t v3 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedTransientOverlayControllers, 0);
  objc_storeStrong((id *)&self->_posterEditingServer, 0);
}

- (void)beginExternalPosterEditingSessionWithEditingRequest:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _SBFLoggingMethodProem();
  int v5 = 138543362;
  BOOL v6 = v4;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ an entry point is required!", (uint8_t *)&v5, 0xCu);
}

@end