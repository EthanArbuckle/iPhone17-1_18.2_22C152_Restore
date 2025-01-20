@interface SPUIViewController
+ (BOOL)isFeedbackSelector:(SEL)a3;
- (BOOL)isActiveViewController:(id)a3;
- (BOOL)isInStateRestoration;
- (BOOL)respondsToSelector:(SEL)a3;
- (SPUIResultsViewController)searchResultViewController;
- (SPUIViewController)init;
- (SPUIViewControllerDelegate)delegate;
- (id)activeViewController;
- (id)contentScrollView;
- (id)currentQuery;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)activateViewController:(id)a3 animate:(BOOL)a4;
- (void)didTapInEmptyRegion;
- (void)setDelegate:(id)a3;
- (void)setIsInStateRestoration:(BOOL)a3;
- (void)setSearchResultViewController:(id)a3;
@end

@implementation SPUIViewController

- (id)contentScrollView
{
  v2 = [(SPUIViewController *)self activeViewController];
  v3 = [v2 contentScrollView];

  return v3;
}

- (id)activeViewController
{
  v2 = [(SPUIViewController *)self childViewControllers];
  v3 = [v2 firstObject];

  return v3;
}

- (BOOL)isActiveViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUIViewController *)self activeViewController];

  return v5 == v4;
}

- (void)activateViewController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SPUIViewController *)self activeViewController];
  if (v7 != v6)
  {
    uint64_t v8 = MEMORY[0x263F79148];
    v9 = *(NSObject **)(MEMORY[0x263F79148] + 40);
    if (!v9)
    {
      SPUIInitLogging();
      v9 = *(NSObject **)(v8 + 40);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D2E6000, v9, OS_LOG_TYPE_DEFAULT, "activating vc", buf, 2u);
    }
    [v7 removeFromParentViewController];
    if (v6)
    {
      [(SPUIViewController *)self addChildViewController:v6];
      [(SPUIViewController *)self willUpdateActiveViewController];
      v10 = [(SPUIViewController *)self view];
      v11 = [v6 view];
      [v10 addSubview:v11];

      v12 = (void *)MEMORY[0x263F67C10];
      v13 = [v6 view];
      [v12 constrainViewToContainer:v13];

      v14 = [v6 view];
      [v14 setAlpha:0.0];

      v15 = (void *)MEMORY[0x263F67C78];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __53__SPUIViewController_activateViewController_animate___block_invoke;
      v19[3] = &unk_264E90910;
      id v20 = v6;
      id v21 = v7;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __53__SPUIViewController_activateViewController_animate___block_invoke_2;
      v16[3] = &unk_264E90910;
      id v17 = v21;
      v18 = self;
      [v15 performAnimatableChanges:v19 animated:v4 completion:v16];
    }
  }
}

- (SPUIViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SPUIViewControllerDelegate *)WeakRetained;
}

- (SPUIResultsViewController)searchResultViewController
{
  return (SPUIResultsViewController *)objc_getProperty(self, a2, 992, 1);
}

- (SPUIViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)SPUIViewController;
  v2 = [(SPUIViewController *)&v9 init];
  if (v2)
  {
    v3 = [SPUIResultsViewController alloc];
    BOOL v4 = +[SPUISearchModel sharedGeneralInstance];
    id v5 = [(SPUIResultsViewController *)v3 initWithSearchModel:v4];
    [(SPUIViewController *)v2 setSearchResultViewController:v5];

    id v6 = [(SPUIViewController *)v2 searchResultViewController];
    [v6 setDelegate:v2];

    id v7 = [(SPUIViewController *)v2 searchResultViewController];
    [v7 setFeedbackListener:v2];
  }
  return v2;
}

- (void)setSearchResultViewController:(id)a3
{
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ([(id)objc_opt_class() isFeedbackSelector:a3]
    && ![(SPUIViewController *)self isInStateRestoration])
  {
    id v5 = +[SPUIFeedbackManager feedbackListener];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SPUIViewController;
    id v5 = [(SPUIViewController *)&v7 forwardingTargetForSelector:a3];
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SPUIViewController;
  if (-[SPUIViewController respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [(id)objc_opt_class() isFeedbackSelector:a3];
    if (v5) {
      LOBYTE(v5) = ![(SPUIViewController *)self isInStateRestoration];
    }
  }
  return v5;
}

+ (BOOL)isFeedbackSelector:(SEL)a3
{
  return (unint64_t)protocol_getMethodDescription((Protocol *)&unk_26F13AE98, a3, 0, 1).name != 0;
}

- (void)setDelegate:(id)a3
{
}

uint64_t __53__SPUIViewController_activateViewController_animate___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) activeViewController];

  if (v2 != v3)
  {
    BOOL v4 = [*(id *)(a1 + 32) view];
    [v4 removeFromSuperview];
  }
  int v5 = *(void **)(a1 + 40);
  return [v5 didUpdateActiveViewController];
}

void __53__SPUIViewController_activateViewController_animate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 40) view];
  [v3 setAlpha:0.0];
}

- (id)currentQuery
{
  return 0;
}

- (void)didTapInEmptyRegion
{
  id v2 = [(SPUIViewController *)self delegate];
  [v2 dismissSearchViewWithReason:2];
}

- (BOOL)isInStateRestoration
{
  return self->_isInStateRestoration;
}

- (void)setIsInStateRestoration:(BOOL)a3
{
  self->_isInStateRestoration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end