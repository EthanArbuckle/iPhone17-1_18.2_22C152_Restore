@interface SUUISplitViewDocumentViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_isFullyPopulated;
- (SUUINavigationDocumentController)leftNavigationDocumentController;
- (SUUINavigationDocumentController)rightNavigationDocumentController;
- (SUUISplitViewDocumentViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4;
- (id)_defaultBackgroundColor;
- (id)leftBarButtonItemsForDocument:(id)a3;
- (void)_SUUI_endDelayingPresentation;
- (void)_reloadSplitViewControllers;
- (void)dealloc;
- (void)delayPresentationIfNeededForParentViewController:(id)a3;
- (void)documentDidUpdate:(id)a3;
- (void)loadView;
- (void)navigationDocumentStackDidChange:(id)a3;
- (void)setLeftNavigationDocumentController:(id)a3;
- (void)setRightNavigationDocumentController:(id)a3;
- (void)suui_viewWillAppear:(BOOL)a3;
@end

@implementation SUUISplitViewDocumentViewController

- (SUUISplitViewDocumentViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUISplitViewDocumentViewController;
  v9 = [(SUUISplitViewDocumentViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_templateElement, a3);
    [(SUUIViewController *)v10 setClientContext:v8];
    v11 = objc_alloc_init(_SUUISplitViewDocumentSplitViewController);
    splitViewController = v10->_splitViewController;
    v10->_splitViewController = &v11->super;

    [(SUUISplitViewDocumentViewController *)v10 _reloadSplitViewControllers];
    [(SUUISplitViewDocumentViewController *)v10 addChildViewController:v10->_splitViewController];
  }

  return v10;
}

- (void)dealloc
{
  [(SUUINavigationDocumentController *)self->_leftNavigationDocumentController setDelegate:0];
  [(SUUINavigationDocumentController *)self->_rightNavigationDocumentController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUISplitViewDocumentViewController;
  [(SUUIViewController *)&v3 dealloc];
}

- (void)delayPresentationIfNeededForParentViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  p_delayingPresentationViewController = &self->_delayingPresentationViewController;
  delayingPresentationViewController = self->_delayingPresentationViewController;
  if (delayingPresentationViewController != v5)
  {
    [(UIViewController *)delayingPresentationViewController _endDelayingPresentation];
    if ([(SUUISplitViewTemplateElement *)self->_templateElement usesInlineSplitContent]
      || [(SUUISplitViewDocumentViewController *)self _isFullyPopulated])
    {
      id v8 = *p_delayingPresentationViewController;
      *p_delayingPresentationViewController = 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_delayingPresentationViewController, a3);
      objc_initWeak(&location, self);
      v9 = *p_delayingPresentationViewController;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __88__SUUISplitViewDocumentViewController_delayPresentationIfNeededForParentViewController___block_invoke;
      v10[3] = &unk_2654022A8;
      objc_copyWeak(&v11, &location);
      [(UIViewController *)v9 _beginDelayingPresentation:v10 cancellationHandler:3.0];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __88__SUUISplitViewDocumentViewController_delayPresentationIfNeededForParentViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_SUUI_endDelayingPresentation");

  return 1;
}

- (void)documentDidUpdate:(id)a3
{
  v4 = [a3 templateElement];
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  if (self->_splitViewController)
  {
    [(SUUISplitViewDocumentViewController *)self _reloadSplitViewControllers];
  }
}

- (id)leftBarButtonItemsForDocument:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(UISplitViewController *)self->_splitViewController displayModeButtonItem];
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)suui_viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUUINavigationDocumentController *)self->_leftNavigationDocumentController navigationController];
  v6 = [v5 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "suui_viewWillAppear:", v3);
  }
  id v7 = [(SUUINavigationDocumentController *)self->_rightNavigationDocumentController navigationController];
  id v8 = [v7 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v8, "suui_viewWillAppear:", v3);
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUISplitViewDocumentViewController;
  [(SUUIViewController *)&v9 suui_viewWillAppear:v3];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)loadView
{
  id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
  BOOL v3 = [(SUUISplitViewDocumentViewController *)self _defaultBackgroundColor];
  [v5 setBackgroundColor:v3];

  v4 = [(UISplitViewController *)self->_splitViewController view];
  [v4 setAutoresizingMask:18];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");
  [v5 addSubview:v4];
  [(SUUISplitViewDocumentViewController *)self setView:v5];
}

- (void)navigationDocumentStackDidChange:(id)a3
{
  v13 = (SUUINavigationDocumentController *)a3;
  if ([(SUUISplitViewDocumentViewController *)self _isFullyPopulated]) {
    [(SUUISplitViewDocumentViewController *)self _SUUI_endDelayingPresentation];
  }
  v4 = v13;
  if (self->_leftNavigationDocumentController == v13)
  {
    id v5 = [(SUUINavigationDocumentController *)v13 documents];
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
  v2 = [(SUUISplitViewTemplateElement *)self->_templateElement style];
  BOOL v3 = [v2 ikBackgroundColor];
  v4 = [v3 color];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x263F825C8] whiteColor];
  }
  v6 = v5;

  return v6;
}

- (BOOL)_isFullyPopulated
{
  BOOL v3 = [(SUUINavigationDocumentController *)self->_leftNavigationDocumentController documentStackItems];
  if ([v3 count])
  {
    v4 = [(SUUINavigationDocumentController *)self->_rightNavigationDocumentController documentStackItems];
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
  v42[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUUISplitViewTemplateElement *)self->_templateElement leftSplitElement];
  v4 = [v3 style];

  if (!self->_leftNavigationDocumentController)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F829B8]);
    v6 = [[SUUINavigationDocumentController alloc] initWithNavigationController:v5];
    leftNavigationDocumentController = self->_leftNavigationDocumentController;
    self->_leftNavigationDocumentController = v6;

    id v8 = self->_leftNavigationDocumentController;
    objc_super v9 = [(SUUIViewController *)self clientContext];
    [(SUUINavigationDocumentController *)v8 setClientContext:v9];

    [(SUUINavigationDocumentController *)self->_leftNavigationDocumentController setDelegate:self];
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
      objc_super v14 = [(SUUISplitViewDocumentViewController *)self _defaultBackgroundColor];
      [v13 setBackgroundColor:v14];
    }
  }
  v15 = [(SUUISplitViewTemplateElement *)self->_templateElement leftNavigationDocument];
  [v15 setNavigationDocumentController:self->_leftNavigationDocumentController];

  if (!self->_rightNavigationDocumentController)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F829B8]);
    v17 = [[SUUINavigationDocumentController alloc] initWithNavigationController:v16];
    rightNavigationDocumentController = self->_rightNavigationDocumentController;
    self->_rightNavigationDocumentController = v17;

    v19 = self->_rightNavigationDocumentController;
    v20 = [(SUUIViewController *)self clientContext];
    [(SUUINavigationDocumentController *)v19 setClientContext:v20];

    [(SUUINavigationDocumentController *)self->_rightNavigationDocumentController setDelegate:self];
    v21 = [(SUUISplitViewTemplateElement *)self->_templateElement rightSplitElement];
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
      v27 = [(SUUISplitViewDocumentViewController *)self _defaultBackgroundColor];
      [v26 setBackgroundColor:v27];
    }
  }
  v28 = [(SUUISplitViewTemplateElement *)self->_templateElement rightNavigationDocument];
  [v28 setNavigationDocumentController:self->_rightNavigationDocumentController];

  splitViewController = self->_splitViewController;
  v30 = [(SUUINavigationDocumentController *)self->_leftNavigationDocumentController navigationController];
  v42[0] = v30;
  v31 = [(SUUINavigationDocumentController *)self->_rightNavigationDocumentController navigationController];
  v42[1] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
  [(UISplitViewController *)splitViewController setViewControllers:v32];

  [(UISplitViewController *)self->_splitViewController setPreferredDisplayMode:[(SUUISplitViewTemplateElement *)self->_templateElement preferredDisplayMode]];
  v33 = [v4 itemWidth];
  [v33 floatValue];
  float v35 = v34;
  double v36 = v34;

  if (v35 >= 1.0)
  {
    [(UISplitViewController *)self->_splitViewController setMaximumPrimaryColumnWidth:v36];
    [(UISplitViewController *)self->_splitViewController setMinimumPrimaryColumnWidth:v36];
    v40 = self->_splitViewController;
    double v41 = *MEMORY[0x263F83990];
  }
  else
  {
    v37 = self->_splitViewController;
    if (v35 >= 0.00000011921)
    {
      [(UISplitViewController *)v37 setMaximumPrimaryColumnWidth:1.79769313e308];
      v38 = self->_splitViewController;
      double v39 = *MEMORY[0x263F83990];
    }
    else
    {
      double v36 = *MEMORY[0x263F83990];
      [(UISplitViewController *)v37 setMaximumPrimaryColumnWidth:*MEMORY[0x263F83990]];
      v38 = self->_splitViewController;
      double v39 = v36;
    }
    [(UISplitViewController *)v38 setMinimumPrimaryColumnWidth:v39];
    v40 = self->_splitViewController;
    double v41 = v36;
  }
  [(UISplitViewController *)v40 setPreferredPrimaryColumnWidthFraction:v41];
}

- (void)_SUUI_endDelayingPresentation
{
  delayingPresentationViewController = self->_delayingPresentationViewController;
  if (delayingPresentationViewController)
  {
    [(UIViewController *)delayingPresentationViewController _endDelayingPresentation];
    v4 = self->_delayingPresentationViewController;
    self->_delayingPresentationViewController = 0;
  }
}

- (SUUINavigationDocumentController)leftNavigationDocumentController
{
  return self->_leftNavigationDocumentController;
}

- (void)setLeftNavigationDocumentController:(id)a3
{
}

- (SUUINavigationDocumentController)rightNavigationDocumentController
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

@end