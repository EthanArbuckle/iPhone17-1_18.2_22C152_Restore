@interface SiriUISnippetExtensionCardSectionViewController
+ (id)cardSectionClasses;
- (BOOL)_shouldAttemptToConnectToRemoteViewController;
- (CGSize)maximumSizeForRemoteViewController:(id)a3;
- (CGSize)minimumSizeForRemoteViewController:(id)a3;
- (void)_attemptToConnectToRemoteViewControllerWithInteraction:(id)a3 forParameters:(id)a4;
- (void)_cancelTouchesIfNecessary;
- (void)_loadCardSectionView;
- (void)_resumeTouchesIfNecessary;
- (void)dealloc;
@end

@implementation SiriUISnippetExtensionCardSectionViewController

- (void)dealloc
{
  [(SiriUISnippetExtensionCardSectionViewController *)self _resumeTouchesIfNecessary];
  id v3 = (id)[(INUIRemoteViewController *)self->_remoteViewController disconnect];
  v4.receiver = self;
  v4.super_class = (Class)SiriUISnippetExtensionCardSectionViewController;
  [(SiriUISnippetExtensionCardSectionViewController *)&v4 dealloc];
}

+ (id)cardSectionClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (void)_loadCardSectionView
{
  uint64_t v3 = [SiriUICardSectionView alloc];
  objc_super v4 = -[SiriUICardSectionView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(SiriUISnippetExtensionCardSectionViewController *)self setView:v4];
}

- (void)_cancelTouchesIfNecessary
{
  uint64_t v3 = [(INUIRemoteViewController *)self->_remoteViewController _cancelTouchesForCurrentEventInHostedContent];
  id touchDeliveryPolicyAssertion = self->_touchDeliveryPolicyAssertion;
  self->_id touchDeliveryPolicyAssertion = v3;
  MEMORY[0x270F9A758](v3, touchDeliveryPolicyAssertion);
}

- (void)_resumeTouchesIfNecessary
{
  [self->_touchDeliveryPolicyAssertion invalidate];
  id touchDeliveryPolicyAssertion = self->_touchDeliveryPolicyAssertion;
  self->_id touchDeliveryPolicyAssertion = 0;
}

- (BOOL)_shouldAttemptToConnectToRemoteViewController
{
  return 1;
}

- (void)_attemptToConnectToRemoteViewControllerWithInteraction:(id)a3 forParameters:(id)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x263F10338];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke;
  v8[3] = &unk_26469FC28;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  [v6 _requestRemoteViewControllerForSnippetExtensionInteraction:v7 delegate:self connectionHandler:v8];
}

void __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    v11 = *MEMORY[0x263F28348];
    v12 = *MEMORY[0x263F28348];
    if (v7)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v19 = "-[SiriUISnippetExtensionCardSectionViewController _attemptToConnectToRemoteViewControllerWithInteraction:for"
            "Parameters:]_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_2231EF000, v11, OS_LOG_TYPE_DEFAULT, "%s No remote view controller for interaction: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) _finishLoadingViewIfNecessary];
  }
  else
  {
    [v5 setServiceViewShouldShareTouchesWithHost:1];
    v8 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_2;
    v14[3] = &unk_26469FC00;
    id v9 = v8;
    uint64_t v10 = *(void *)(a1 + 40);
    id v15 = v9;
    uint64_t v16 = v10;
    id v17 = v5;
    [v17 configureForParameters:0 ofInteraction:v9 interactiveBehavior:0 context:0 completion:v14];
  }
}

void __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_2(uint64_t a1, double a2, double a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_2_cold_1();
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void **)(v12 + 1032);
    if (v13)
    {
      [v13 willMoveToParentViewController:0];
      v14 = [*(id *)(*(void *)(a1 + 40) + 1032) view];
      [v14 removeFromSuperview];

      [*(id *)(*(void *)(a1 + 40) + 1032) removeFromParentViewController];
      uint64_t v12 = *(void *)(a1 + 40);
    }
    objc_storeStrong((id *)(v12 + 1032), *(id *)(a1 + 48));
    [*(id *)(a1 + 40) addChildViewController:*(void *)(a1 + 48)];
    id v15 = [*(id *)(a1 + 40) view];
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, a2, a3);

    uint64_t v16 = [*(id *)(a1 + 40) view];
    objc_msgSend(v16, "setContentSize:", a2, a3);

    id v17 = [*(id *)(a1 + 40) view];
    v18 = [*(id *)(a1 + 48) view];
    [v17 setContentView:v18];

    [*(id *)(a1 + 48) didMoveToParentViewController:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 40) _finishLoadingViewIfNecessary];
}

- (CGSize)minimumSizeForRemoteViewController:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)maximumSizeForRemoteViewController:(id)a3
{
  double v4 = [(CRKCardSectionViewController *)self delegate];
  [v4 boundingSizeForCardSectionViewController:self];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchDeliveryPolicyAssertion, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

void __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_2231EF000, v0, v1, "%s Failed to instantiate remote view controller with error: %{public}@ for interaction: %@", v2);
}

void __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_2_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_2231EF000, v0, v1, "%s Failed to configure remote view controller with error: %{public}@ for interaction: %@", v2);
}

@end