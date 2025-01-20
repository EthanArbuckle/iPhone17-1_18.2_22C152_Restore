@interface RUIScrollableWelcomeController
- (BOOL)shouldUseCustomButtonTray;
- (UIScrollView)contentScrollView;
- (UIViewController)contentController;
- (int64_t)navigationBarScrollToEdgeBehavior;
- (void)_inlineButtonTray;
- (void)_layoutButtonTray;
- (void)_setupScrollView;
- (void)_updateParentPreferredContentSize;
- (void)setContentController:(id)a3;
- (void)setContentScrollView:(id)a3;
- (void)setShouldUseCustomButtonTray:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RUIScrollableWelcomeController

- (int64_t)navigationBarScrollToEdgeBehavior
{
  return 0;
}

- (void)_layoutButtonTray
{
  v5.receiver = self;
  v5.super_class = (Class)RUIScrollableWelcomeController;
  [(RUIScrollableWelcomeController *)&v5 _layoutButtonTray];
  if ([(RUIScrollableWelcomeController *)self shouldUseCustomButtonTray])
  {
    v3 = [(RUIScrollableWelcomeController *)self buttonTray];
    v4 = [v3 stackView];
    [v4 setAlignment:3];
  }
}

- (void)_setupScrollView
{
  v43[4] = *MEMORY[0x263EF8340];
  v3 = [(RUIScrollableWelcomeController *)self contentController];
  [(RUIScrollableWelcomeController *)self addChildViewController:v3];

  v4 = [(RUIScrollableWelcomeController *)self view];
  objc_super v5 = [(RUIScrollableWelcomeController *)self contentController];
  v6 = [v5 view];
  [v4 addSubview:v6];

  v7 = [(RUIScrollableWelcomeController *)self contentController];
  v8 = [v7 view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [[RUIScrollViewWeakLayoutObserver alloc] initWithLayoutObserver:self];
  scrollViewLayoutObserver = self->_scrollViewLayoutObserver;
  self->_scrollViewLayoutObserver = v9;

  v11 = self->_scrollViewLayoutObserver;
  v12 = [(RUIScrollableWelcomeController *)self scrollView];
  [v12 _setLayoutObserver:v11];

  v13 = [(RUIScrollableWelcomeController *)self view];
  v14 = [v13 bottomAnchor];
  v15 = [(RUIScrollableWelcomeController *)self contentController];
  v16 = [v15 view];
  v17 = [v16 bottomAnchor];
  v42 = [v14 constraintEqualToAnchor:v17];

  LODWORD(v18) = 1144750080;
  [v42 setPriority:v18];
  v19 = [(RUIScrollableWelcomeController *)self contentController];
  [v19 didMoveToParentViewController:self];

  v34 = (void *)MEMORY[0x263F08938];
  v41 = [(RUIScrollableWelcomeController *)self view];
  v39 = [v41 topAnchor];
  v40 = [(RUIScrollableWelcomeController *)self contentController];
  v38 = [v40 view];
  v37 = [v38 topAnchor];
  v36 = [v39 constraintEqualToAnchor:v37];
  v43[0] = v36;
  v35 = [(RUIScrollableWelcomeController *)self view];
  v32 = [v35 leadingAnchor];
  v33 = [(RUIScrollableWelcomeController *)self contentController];
  v31 = [v33 view];
  v20 = [v31 leadingAnchor];
  v21 = [v32 constraintEqualToAnchor:v20];
  v43[1] = v21;
  v22 = [(RUIScrollableWelcomeController *)self view];
  v23 = [v22 trailingAnchor];
  v24 = [(RUIScrollableWelcomeController *)self contentController];
  v25 = [v24 view];
  v26 = [v25 trailingAnchor];
  v27 = [v23 constraintEqualToAnchor:v26];
  v43[2] = v27;
  v43[3] = v42;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:4];
  [v34 activateConstraints:v28];

  v29 = [(RUIScrollableWelcomeController *)self view];
  v30 = [(RUIScrollableWelcomeController *)self buttonTray];
  [v29 addSubview:v30];

  [(RUIScrollableWelcomeController *)self _layoutButtonTray];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RUIScrollableWelcomeController;
  [(OBBaseWelcomeController *)&v3 viewDidLayoutSubviews];
  [(RUIScrollableWelcomeController *)self _updateParentPreferredContentSize];
}

- (void)_updateParentPreferredContentSize
{
  objc_super v3 = [(RUIScrollableWelcomeController *)self scrollView];
  [v3 contentSize];
  double v5 = v4;
  v6 = [(RUIScrollableWelcomeController *)self scrollView];
  [v6 contentInset];
  double v8 = v5 + v7;
  v9 = [(RUIScrollableWelcomeController *)self scrollView];
  [v9 contentInset];
  double v11 = v8 + v10;

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__RUIScrollableWelcomeController__updateParentPreferredContentSize__block_invoke;
  v12[3] = &unk_2642117E8;
  v12[4] = self;
  *(double *)&v12[5] = v11;
  [MEMORY[0x263F82E00] performWithoutAnimation:v12];
}

void __67__RUIScrollableWelcomeController__updateParentPreferredContentSize__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) scrollView];
  [v6 frame];
  double v3 = v2;
  double v4 = *(double *)(a1 + 40);
  double v5 = [*(id *)(a1 + 32) parentViewController];
  objc_msgSend(v5, "setPreferredContentSize:", v3, v4);
}

- (void)_inlineButtonTray
{
  v33[4] = *MEMORY[0x263EF8340];
  double v3 = [(RUIScrollableWelcomeController *)self buttonTray];
  [v3 removeFromSuperview];

  double v4 = [(RUIScrollableWelcomeController *)self view];
  double v5 = [(RUIScrollableWelcomeController *)self buttonTray];
  [v4 addSubview:v5];

  id v6 = [(RUIScrollableWelcomeController *)self view];
  double v7 = [v6 bottomAnchor];

  double v8 = [(RUIScrollableWelcomeController *)self tabBarController];

  if (v8)
  {
    v9 = [(RUIScrollableWelcomeController *)self view];
    double v10 = [v9 safeAreaLayoutGuide];
    uint64_t v11 = [v10 bottomAnchor];

    double v7 = (void *)v11;
  }
  v27 = v7;
  v23 = (void *)MEMORY[0x263F08938];
  v32 = [(RUIScrollableWelcomeController *)self buttonTray];
  v31 = [v32 bottomAnchor];
  v30 = [v31 constraintEqualToAnchor:v7 constant:0.0];
  v33[0] = v30;
  v29 = [(RUIScrollableWelcomeController *)self buttonTray];
  v26 = [v29 leadingAnchor];
  v28 = [(RUIScrollableWelcomeController *)self view];
  v25 = [v28 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:0.0];
  v33[1] = v24;
  v22 = [(RUIScrollableWelcomeController *)self buttonTray];
  v12 = [v22 trailingAnchor];
  v13 = [(RUIScrollableWelcomeController *)self view];
  v14 = [v13 trailingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14 constant:0.0];
  v33[2] = v15;
  v16 = [(RUIScrollableWelcomeController *)self buttonTray];
  v17 = [v16 topAnchor];
  double v18 = [(RUIScrollableWelcomeController *)self scrollView];
  v19 = [v18 bottomAnchor];
  v20 = [v17 constraintEqualToAnchor:v19 constant:0.0];
  v33[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  [v23 activateConstraints:v21];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RUIScrollableWelcomeController;
  [(RUIScrollableWelcomeController *)&v3 viewWillAppear:a3];
}

- (UIViewController)contentController
{
  return self->_contentController;
}

- (void)setContentController:(id)a3
{
}

- (UIScrollView)contentScrollView
{
  return self->_contentScrollView;
}

- (void)setContentScrollView:(id)a3
{
}

- (BOOL)shouldUseCustomButtonTray
{
  return self->_shouldUseCustomButtonTray;
}

- (void)setShouldUseCustomButtonTray:(BOOL)a3
{
  self->_shouldUseCustomButtonTray = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_contentController, 0);
  objc_storeStrong((id *)&self->_scrollViewLayoutObserver, 0);
}

@end