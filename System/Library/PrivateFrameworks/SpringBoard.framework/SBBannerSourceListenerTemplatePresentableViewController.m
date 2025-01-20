@interface SBBannerSourceListenerTemplatePresentableViewController
- (BOOL)isTemplateContent;
- (BOOL)providesTemplateContent;
- (BOOL)shouldAcquireWindowLevelAssertion;
- (SBBannerSourceListenerTemplatePresentableViewController)initWithPresentable:(id)a3;
- (SBBannerSourceListenerTemplatePresentableViewController)initWithSpecification:(id)a3 serviceDomain:(id)a4 readyCompletion:(id)a5;
- (UIEdgeInsets)bannerContentOutsets;
- (id)_pillView;
- (id)_templateContentProvider;
- (id)leadingTemplateViewProvider;
- (id)primaryTemplateItemProvider;
- (id)secondaryTemplateItemProvider;
- (id)trailingTemplateViewProvider;
- (int64_t)userInterfaceStyleOverride;
- (void)_handleButtonPrimaryAction:(id)a3 forEvent:(int64_t)a4;
- (void)_handleTapOnPillView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SBBannerSourceListenerTemplatePresentableViewController

- (SBBannerSourceListenerTemplatePresentableViewController)initWithSpecification:(id)a3 serviceDomain:(id)a4 readyCompletion:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v10 providesTemplateContent] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBBannerSourceListenerTemplatePresentableViewController.m", 33, @"Presentable specification doesn't specify a presentable that provides template content: %@", v10 object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)SBBannerSourceListenerTemplatePresentableViewController;
  v13 = [(BNBannerSourceListenerPresentableViewController *)&v19 initWithSpecification:v10 serviceDomain:v11 readyCompletion:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_templateContentProvidingSpecification, a3);
    v15 = objc_alloc_init(SBBannerCustomTransitioningDelegate);
    customTransitioningDelegate = v14->_customTransitioningDelegate;
    v14->_customTransitioningDelegate = v15;

    [(SBBannerSourceListenerTemplatePresentableViewController *)v14 setTransitioningDelegate:v14->_customTransitioningDelegate];
  }

  return v14;
}

- (SBBannerSourceListenerTemplatePresentableViewController)initWithPresentable:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBBannerSourceListenerTemplatePresentableViewController;
  v3 = [(BNBannerSourceListenerPresentableViewController *)&v7 initWithPresentable:a3];
  if (v3)
  {
    v4 = objc_alloc_init(SBBannerCustomTransitioningDelegate);
    customTransitioningDelegate = v3->_customTransitioningDelegate;
    v3->_customTransitioningDelegate = v4;

    [(SBBannerSourceListenerTemplatePresentableViewController *)v3 setTransitioningDelegate:v3->_customTransitioningDelegate];
  }
  return v3;
}

- (BOOL)isTemplateContent
{
  return 1;
}

- (BOOL)providesTemplateContent
{
  return 1;
}

- (id)leadingTemplateViewProvider
{
  v2 = [(SBBannerSourceListenerTemplatePresentableViewController *)self _templateContentProvider];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 leadingTemplateViewProvider];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)trailingTemplateViewProvider
{
  v2 = [(SBBannerSourceListenerTemplatePresentableViewController *)self _templateContentProvider];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 trailingTemplateViewProvider];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)primaryTemplateItemProvider
{
  v2 = [(SBBannerSourceListenerTemplatePresentableViewController *)self _templateContentProvider];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 primaryTemplateItemProvider];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)secondaryTemplateItemProvider
{
  v2 = [(SBBannerSourceListenerTemplatePresentableViewController *)self _templateContentProvider];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 secondaryTemplateItemProvider];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (int64_t)userInterfaceStyleOverride
{
  v2 = [(SBBannerSourceListenerTemplatePresentableViewController *)self _templateContentProvider];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 userInterfaceStyleOverride];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)SBBannerSourceListenerTemplatePresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v6 viewDidLoad];
  int64_t v3 = [(SBBannerSourceListenerTemplatePresentableViewController *)self _pillView];
  [(BNBannerSourceListenerPresentableViewController *)self _setContentView:v3];
  [v3 intrinsicContentSize];
  -[SBBannerSourceListenerTemplatePresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  v4 = [(SBBannerSourceListenerTemplatePresentableViewController *)self view];
  [v4 addSubview:v3];

  int64_t v5 = [(SBBannerSourceListenerTemplatePresentableViewController *)self userInterfaceStyleOverride];
  if (v5) {
    [(SBBannerSourceListenerTemplatePresentableViewController *)self setOverrideUserInterfaceStyle:v5];
  }
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBBannerSourceListenerTemplatePresentableViewController;
  [(SBBannerSourceListenerTemplatePresentableViewController *)&v4 viewWillLayoutSubviews];
  int64_t v3 = [(SBBannerSourceListenerTemplatePresentableViewController *)self view];
  [v3 bounds];

  [(SBBannerSourceListenerTemplatePresentableViewController *)self bannerContentOutsets];
  UIRectInset();
  -[PLPillView setFrame:](self->_pillView, "setFrame:");
}

- (UIEdgeInsets)bannerContentOutsets
{
  v2 = [(SBBannerSourceListenerTemplatePresentableViewController *)self _pillView];
  [v2 shadowOutsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)shouldAcquireWindowLevelAssertion
{
  v2 = [(SBBannerSourceListenerTemplatePresentableViewController *)self _templateContentProvider];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 shouldAcquireWindowLevelAssertion];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)_templateContentProvider
{
  char v3 = [(BNBannerSourceListenerPresentableViewController *)self presentable];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (char v4 = [v3 providesTemplateContent],
        templateContentProvidingSpecification = (BNTemplateContentProvidingSpecifying *)v3,
        (v4 & 1) == 0))
  {
    templateContentProvidingSpecification = self->_templateContentProvidingSpecification;
  }
  double v6 = templateContentProvidingSpecification;

  return v6;
}

- (void)_handleButtonPrimaryAction:(id)a3 forEvent:(int64_t)a4
{
}

- (void)_handleTapOnPillView:(id)a3
{
}

- (id)_pillView
{
  pillView = self->_pillView;
  if (!pillView)
  {
    char v4 = [(SBBannerSourceListenerTemplatePresentableViewController *)self _templateContentProvider];
    if (objc_opt_respondsToSelector())
    {
      double v5 = [v4 leadingTemplateViewProvider];
    }
    else
    {
      double v5 = 0;
    }
    objc_initWeak(location, self);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke;
    v37[3] = &unk_1E6AFE6C0;
    objc_copyWeak(&v38, location);
    uint64_t v6 = SBTemplateItemViewFromProvider(v5, v37);
    if (objc_opt_respondsToSelector())
    {
      double v7 = [v4 trailingTemplateViewProvider];
    }
    else
    {
      double v7 = 0;
    }
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_3;
    v35[3] = &unk_1E6AFE6C0;
    objc_copyWeak(&v36, location);
    uint64_t v8 = SBTemplateItemViewFromProvider(v7, v35);
    double v9 = (PLPillView *)[objc_alloc(MEMORY[0x1E4F91450]) initWithLeadingAccessoryView:v6 trailingAccessoryView:v8];
    double v10 = self->_pillView;
    self->_pillView = v9;

    [(PLPillView *)self->_pillView setMaterialGroupNameBase:@"SBBannerSourceListenerTemplatePresentableViewControllerMaterialGroup"];
    v30 = (void *)v8;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_5;
    v34[3] = &unk_1E6AFE6E8;
    v34[4] = self;
    double v11 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v34);
    v28 = (void *)v6;
    v29 = v5;
    ((void (**)(void, uint64_t, void *))v11)[2](v11, v6, v5);
    ((void (**)(void, void *, void *))v11)[2](v11, v30, v7);
    v26 = v7;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_6;
    v32[3] = &unk_1E6AFE760;
    objc_copyWeak(&v33, location);
    double v12 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v32);
    char v13 = objc_opt_respondsToSelector();
    if (v13)
    {
      double v14 = objc_msgSend(v4, "primaryTemplateItemProvider", v7);
    }
    else
    {
      double v14 = 0;
    }
    v31 = ((void (**)(void, void *, uint64_t))v12)[2](v12, v14, 1);
    if (v13) {

    }
    char v15 = objc_opt_respondsToSelector();
    if (v15)
    {
      v16 = [v4 secondaryTemplateItemProvider];
    }
    else
    {
      v16 = 0;
    }
    v17 = ((void (**)(void, void *, void))v12)[2](v12, v16, 0);
    if (v15) {

    }
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    objc_super v19 = v18;
    if (v31) {
      [v18 addObject:v31];
    }
    if (v17) {
      [v19 addObject:v17];
    }
    -[PLPillView setCenterContentItems:](self->_pillView, "setCenterContentItems:", v19, v26);
    v20 = self->_pillView;
    char v21 = objc_opt_respondsToSelector();
    if (v21)
    {
      v22 = [v4 presentableAccessibilityIdentifier];
    }
    else
    {
      v22 = 0;
    }
    [(PLPillView *)v20 setAccessibilityIdentifier:v22];
    if (v21) {

    }
    v23 = self->_pillView;
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTapOnPillView_];
    [(PLPillView *)v23 addGestureRecognizer:v24];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&v38);
    objc_destroyWeak(location);

    pillView = self->_pillView;
  }
  return pillView;
}

id __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F426E8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_2;
  v4[3] = &unk_1E6AF9818;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v2 = [v1 actionWithHandler:v4];
  objc_destroyWeak(&v5);
  return v2;
}

void __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleButtonPrimaryAction:v3 forEvent:1];
}

id __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F426E8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_4;
  v4[3] = &unk_1E6AF9818;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v2 = [v1 actionWithHandler:v4];
  objc_destroyWeak(&v5);
  return v2;
}

void __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleButtonPrimaryAction:v3 forEvent:2];
}

void __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if ([v5 visualStyleCategory] >= 1 && objc_msgSend(v5, "visualStyle") >= 1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1088), "visualStylingProviderForCategory:", objc_msgSend(v5, "visualStyleCategory"));
    uint64_t v8 = [v5 visualStyle];
    if (isKindOfClass)
    {
      double v9 = [v7 _visualStylingForStyle:v8];

      id v10 = v14;
      double v11 = [v10 configuration];
      double v12 = [v11 background];
      char v13 = [v9 visualEffect];
      [v12 setVisualEffect:v13];

      [v11 setBackground:v12];
      [v10 setConfiguration:v11];

      double v7 = v9;
    }
    else
    {
      [v7 automaticallyUpdateView:v14 withStyle:v8];
    }
  }
}

id __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_6(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (v5)
  {
    double v7 = [v5 templateItemText];
    if (!v7
      || ((id v8 = objc_alloc(MEMORY[0x1E4F91440]), a3) ? (v9 = 1) : (v9 = 2),
          (id v10 = (void *)[v8 initWithText:v7 style:v9]) == 0))
    {
      uint64_t v11 = [v6 templateItemAttributedText];
      if (!v11
        || ((double v12 = (void *)v11, v13 = objc_alloc(MEMORY[0x1E4F91440]), a3) ? (v14 = 1) : (v14 = 2),
            id v10 = (void *)[v13 initWithAttributedText:v12 style:v14],
            v12,
            !v10))
      {
        uint64_t v18 = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        v20 = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_7;
        char v21 = &unk_1E6AFE738;
        objc_copyWeak(&v22, (id *)(a1 + 32));
        char v23 = a3;
        char v15 = SBTemplateItemViewFromProvider(v6, &v18);
        if (v15)
        {
          id v16 = objc_alloc(MEMORY[0x1E4F91440]);
          id v10 = objc_msgSend(v16, "initWithAccessoryView:", v15, v18, v19, v20, v21);
        }
        else
        {
          id v10 = 0;
        }

        objc_destroyWeak(&v22);
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_7(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F426E8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_8;
  v5[3] = &unk_1E6AFE710;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  char v7 = *(unsigned char *)(a1 + 40);
  id v3 = [v2 actionWithHandler:v5];
  objc_destroyWeak(&v6);
  return v3;
}

void __68__SBBannerSourceListenerTemplatePresentableViewController__pillView__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v7 = WeakRetained;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 4;
  }
  [WeakRetained _handleButtonPrimaryAction:v4 forEvent:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_templateContentProvidingSpecification, 0);
}

@end