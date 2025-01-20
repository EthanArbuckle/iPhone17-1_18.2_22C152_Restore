@interface SKUISplitViewDocumentViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_isFullyPopulated;
- (SKUINavigationDocumentController)leftNavigationDocumentController;
- (SKUINavigationDocumentController)rightNavigationDocumentController;
- (SKUISplitViewDocumentViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4;
- (id)_defaultBackgroundColor;
- (id)leftBarButtonItemsForDocument:(id)a3;
- (void)_reloadSplitViewControllers;
- (void)_skui_endDelayingPresentation;
- (void)dealloc;
- (void)delayPresentationIfNeededForParentViewController:(id)a3;
- (void)documentDidUpdate:(id)a3;
- (void)loadView;
- (void)navigationDocumentStackDidChange:(id)a3;
- (void)setLeftNavigationDocumentController:(id)a3;
- (void)setRightNavigationDocumentController:(id)a3;
- (void)skui_viewWillAppear:(BOOL)a3;
@end

@implementation SKUISplitViewDocumentViewController

- (SKUISplitViewDocumentViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISplitViewDocumentViewController initWithTemplateElement:clientContext:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUISplitViewDocumentViewController;
  v9 = [(SKUISplitViewDocumentViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_templateElement, a3);
    [(SKUIViewController *)v10 setClientContext:v8];
    v11 = objc_alloc_init(_SKUISplitViewDocumentSplitViewController);
    splitViewController = v10->_splitViewController;
    v10->_splitViewController = &v11->super;

    [(SKUISplitViewDocumentViewController *)v10 _reloadSplitViewControllers];
    [(SKUISplitViewDocumentViewController *)v10 addChildViewController:v10->_splitViewController];
  }

  return v10;
}

- (void)dealloc
{
  [(SKUINavigationDocumentController *)self->_leftNavigationDocumentController setDelegate:0];
  [(SKUINavigationDocumentController *)self->_rightNavigationDocumentController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUISplitViewDocumentViewController;
  [(SKUIViewController *)&v3 dealloc];
}

- (void)delayPresentationIfNeededForParentViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  p_delayingPresentationViewController = &self->_delayingPresentationViewController;
  delayingPresentationViewController = self->_delayingPresentationViewController;
  if (delayingPresentationViewController != v5)
  {
    [(UIViewController *)delayingPresentationViewController _endDelayingPresentation];
    if ([(SKUISplitViewTemplateElement *)self->_templateElement usesInlineSplitContent]
      || [(SKUISplitViewDocumentViewController *)self _isFullyPopulated])
    {
      id v8 = *p_delayingPresentationViewController;
      *p_delayingPresentationViewController = 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_delayingPresentationViewController, a3);
      objc_initWeak(&location, self);
      v9 = *p_delayingPresentationViewController;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __88__SKUISplitViewDocumentViewController_delayPresentationIfNeededForParentViewController___block_invoke;
      v10[3] = &unk_1E6425F90;
      objc_copyWeak(&v11, &location);
      [(UIViewController *)v9 _beginDelayingPresentation:v10 cancellationHandler:3.0];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __88__SKUISplitViewDocumentViewController_delayPresentationIfNeededForParentViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_skui_endDelayingPresentation");

  return 1;
}

- (void)documentDidUpdate:(id)a3
{
  v4 = [a3 templateElement];
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  if (self->_splitViewController)
  {
    [(SKUISplitViewDocumentViewController *)self _reloadSplitViewControllers];
  }
}

- (id)leftBarButtonItemsForDocument:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UISplitViewController *)self->_splitViewController displayModeButtonItem];
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)skui_viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SKUINavigationDocumentController *)self->_leftNavigationDocumentController navigationController];
  v6 = [v5 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "skui_viewWillAppear:", v3);
  }
  id v7 = [(SKUINavigationDocumentController *)self->_rightNavigationDocumentController navigationController];
  id v8 = [v7 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v8, "skui_viewWillAppear:", v3);
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUISplitViewDocumentViewController;
  [(SKUIViewController *)&v9 skui_viewWillAppear:v3];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)loadView
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  BOOL v3 = [(SKUISplitViewDocumentViewController *)self _defaultBackgroundColor];
  [v5 setBackgroundColor:v3];

  v4 = [(UISplitViewController *)self->_splitViewController view];
  [v4 setAutoresizingMask:18];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");
  [v5 addSubview:v4];
  [(SKUISplitViewDocumentViewController *)self setView:v5];
}

- (void)navigationDocumentStackDidChange:(id)a3
{
  v13 = (SKUINavigationDocumentController *)a3;
  if ([(SKUISplitViewDocumentViewController *)self _isFullyPopulated]) {
    [(SKUISplitViewDocumentViewController *)self _skui_endDelayingPresentation];
  }
  v4 = v13;
  if (self->_leftNavigationDocumentController == v13)
  {
    id v5 = [(SKUINavigationDocumentController *)v13 documents];
    v6 = [v5 lastObject];

    id v7 = [v6 navigationBarElement];
    if (!v7)
    {
      id v8 = [v6 templateElement];
      if (objc_opt_respondsToSelector())
      {
        id v7 = [v8 navigationBarElement];
      }
      else
      {
        id v7 = 0;
      }
    }
    objc_super v9 = [v7 firstChildForElementType:138];
    splitViewController = self->_splitViewController;
    id v11 = [v9 text];
    v12 = [v11 string];
    [(UISplitViewController *)splitViewController _setDisplayModeButtonItemTitle:v12];

    v4 = v13;
  }
}

- (id)_defaultBackgroundColor
{
  v2 = [(SKUISplitViewTemplateElement *)self->_templateElement style];
  BOOL v3 = [v2 ikBackgroundColor];
  v4 = [v3 color];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  v6 = v5;

  return v6;
}

- (BOOL)_isFullyPopulated
{
  BOOL v3 = [(SKUINavigationDocumentController *)self->_leftNavigationDocumentController documentStackItems];
  if ([v3 count])
  {
    v4 = [(SKUINavigationDocumentController *)self->_rightNavigationDocumentController documentStackItems];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_reloadSplitViewControllers
{
  v42[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SKUISplitViewTemplateElement *)self->_templateElement leftSplitElement];
  v4 = [v3 style];

  if (!self->_leftNavigationDocumentController)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB19E8]);
    v6 = [[SKUINavigationDocumentController alloc] initWithNavigationController:v5];
    leftNavigationDocumentController = self->_leftNavigationDocumentController;
    self->_leftNavigationDocumentController = v6;

    id v8 = self->_leftNavigationDocumentController;
    objc_super v9 = [(SKUIViewController *)self clientContext];
    [(SKUINavigationDocumentController *)v8 setClientContext:v9];

    [(SKUINavigationDocumentController *)self->_leftNavigationDocumentController setDelegate:self];
    v10 = [v4 ikBackgroundColor];
    id v11 = [v10 color];

    v12 = [v5 view];
    v13 = v12;
    if (v11)
    {
      [v12 setBackgroundColor:v11];
    }
    else
    {
      objc_super v14 = [(SKUISplitViewDocumentViewController *)self _defaultBackgroundColor];
      [v13 setBackgroundColor:v14];
    }
  }
  v15 = [(SKUISplitViewTemplateElement *)self->_templateElement leftNavigationDocument];
  [v15 setNavigationDocumentController:self->_leftNavigationDocumentController];

  if (!self->_rightNavigationDocumentController)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4FB19E8]);
    v17 = [[SKUINavigationDocumentController alloc] initWithNavigationController:v16];
    rightNavigationDocumentController = self->_rightNavigationDocumentController;
    self->_rightNavigationDocumentController = v17;

    v19 = self->_rightNavigationDocumentController;
    v20 = [(SKUIViewController *)self clientContext];
    [(SKUINavigationDocumentController *)v19 setClientContext:v20];

    [(SKUINavigationDocumentController *)self->_rightNavigationDocumentController setDelegate:self];
    v21 = [(SKUISplitViewTemplateElement *)self->_templateElement rightSplitElement];
    v22 = [v21 style];
    v23 = [v22 ikBackgroundColor];
    v24 = [v23 color];

    v25 = [v16 view];
    v26 = v25;
    if (v24)
    {
      [v25 setBackgroundColor:v24];
    }
    else
    {
      v27 = [(SKUISplitViewDocumentViewController *)self _defaultBackgroundColor];
      [v26 setBackgroundColor:v27];
    }
  }
  v28 = [(SKUISplitViewTemplateElement *)self->_templateElement rightNavigationDocument];
  [v28 setNavigationDocumentController:self->_rightNavigationDocumentController];

  splitViewController = self->_splitViewController;
  v30 = [(SKUINavigationDocumentController *)self->_leftNavigationDocumentController navigationController];
  v42[0] = v30;
  v31 = [(SKUINavigationDocumentController *)self->_rightNavigationDocumentController navigationController];
  v42[1] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  [(UISplitViewController *)splitViewController setViewControllers:v32];

  [(UISplitViewController *)self->_splitViewController setPreferredDisplayMode:[(SKUISplitViewTemplateElement *)self->_templateElement preferredDisplayMode]];
  v33 = [v4 itemWidth];
  [v33 floatValue];
  float v35 = v34;
  double v36 = v34;

  if (v35 >= 1.0)
  {
    [(UISplitViewController *)self->_splitViewController setMaximumPrimaryColumnWidth:v36];
    [(UISplitViewController *)self->_splitViewController setMinimumPrimaryColumnWidth:v36];
    v40 = self->_splitViewController;
    double v41 = *MEMORY[0x1E4FB2F10];
  }
  else
  {
    v37 = self->_splitViewController;
    if (v35 >= 0.00000011921)
    {
      [(UISplitViewController *)v37 setMaximumPrimaryColumnWidth:1.79769313e308];
      v38 = self->_splitViewController;
      double v39 = *MEMORY[0x1E4FB2F10];
    }
    else
    {
      double v36 = *MEMORY[0x1E4FB2F10];
      [(UISplitViewController *)v37 setMaximumPrimaryColumnWidth:*MEMORY[0x1E4FB2F10]];
      v38 = self->_splitViewController;
      double v39 = v36;
    }
    [(UISplitViewController *)v38 setMinimumPrimaryColumnWidth:v39];
    v40 = self->_splitViewController;
    double v41 = v36;
  }
  [(UISplitViewController *)v40 setPreferredPrimaryColumnWidthFraction:v41];
}

- (void)_skui_endDelayingPresentation
{
  delayingPresentationViewController = self->_delayingPresentationViewController;
  if (delayingPresentationViewController)
  {
    [(UIViewController *)delayingPresentationViewController _endDelayingPresentation];
    v4 = self->_delayingPresentationViewController;
    self->_delayingPresentationViewController = 0;
  }
}

- (SKUINavigationDocumentController)leftNavigationDocumentController
{
  return self->_leftNavigationDocumentController;
}

- (void)setLeftNavigationDocumentController:(id)a3
{
}

- (SKUINavigationDocumentController)rightNavigationDocumentController
{
  return self->_rightNavigationDocumentController;
}

- (void)setRightNavigationDocumentController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNavigationDocumentController, 0);
  objc_storeStrong((id *)&self->_leftNavigationDocumentController, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);

  objc_storeStrong((id *)&self->_delayingPresentationViewController, 0);
}

- (void)initWithTemplateElement:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISplitViewDocumentViewController initWithTemplateElement:clientContext:]";
}

@end