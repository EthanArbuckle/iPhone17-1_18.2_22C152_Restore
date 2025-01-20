@interface VideosExtrasNavigationController
- (BOOL)showsBuiltInNavControls;
- (VideosExtrasContext)context;
- (VideosExtrasMainTemplateViewController)mainTemplateViewController;
- (VideosExtrasNavigationController)initWithContext:(id)a3;
- (id)_viewControllerForDocument:(id)a3 index:(int64_t *)a4;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)documents;
- (void)_dismissViewController:(id)a3;
- (void)_installBackButtonOnNavigationItem:(id)a3 withTitle:(id)a4;
- (void)_installDoneButtonOnNavigationItem:(id)a3;
- (void)_popViewControllerFromBackButton;
- (void)_presentDialogTemplate:(id)a3;
- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5;
- (void)loadingView:(id)a3 documentDidUpdate:(id)a4 options:(id)a5;
- (void)popDocument;
- (void)popToDocument:(id)a3;
- (void)popToRootDocument;
- (void)pushDocument:(id)a3 options:(id)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5;
- (void)setClearsStackOnNextPush;
- (void)setShowsBuiltInNavControls:(BOOL)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
- (void)willShowViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation VideosExtrasNavigationController

- (VideosExtrasNavigationController)initWithContext:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4FB1EC0];
  id v5 = a3;
  v6 = (UIViewController *)[[v4 alloc] initWithNibName:0 bundle:0];
  uint64_t v7 = objc_opt_class();
  v13.receiver = self;
  v13.super_class = (Class)VideosExtrasNavigationController;
  v8 = [(VideosExtrasNavigationController *)&v13 initWithNavigationBarClass:v7 toolbarClass:0];
  v9 = [(UIViewController *)v6 navigationItem];
  [(VideosExtrasNavigationController *)v8 _installDoneButtonOnNavigationItem:v9];

  v14[0] = v6;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [(VideosExtrasNavigationController *)v8 setViewControllers:v10];

  emptyViewController = v8->_emptyViewController;
  v8->_emptyViewController = v6;

  objc_storeWeak((id *)&v8->_context, v5);
  v8->_showsBuiltInNavControls = 1;
  return v8;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasNavigationController;
  [(VideosExtrasNavigationController *)&v4 viewDidLoad];
  [(VideosExtrasNavigationController *)self setNavigationBarHidden:1 animated:0];
  v3 = [(VideosExtrasNavigationController *)self navigationBar];
  [v3 setUserInteractionEnabled:0];
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  v2 = [(VideosExtrasNavigationController *)self childViewControllers];
  v3 = [v2 lastObject];

  return v3;
}

- (VideosExtrasMainTemplateViewController)mainTemplateViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v3 = [WeakRetained extrasRootViewController];
  objc_super v4 = [v3 mainTemplateViewController];

  return (VideosExtrasMainTemplateViewController *)v4;
}

- (void)setClearsStackOnNextPush
{
  self->_clearStackOnPush = 1;
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  loadingView = self->_loadingView;
  if (loadingView)
  {
    [(VideosExtrasLoadingView *)loadingView cancelCountdownToVisibility];
    [(VideosExtrasLoadingView *)self->_loadingView removeFromSuperview];
    v8 = self->_loadingView;
    self->_loadingView = 0;
  }
  v9 = [v21 templateElement];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [[VideosExtrasLoadingView alloc] initWithDocument:v21 options:v6 delegate:self];
    v11 = self->_loadingView;
    self->_loadingView = v10;

    v12 = self->_loadingView;
    objc_super v13 = [(VideosExtrasNavigationController *)self topViewController];
    v14 = [v13 view];
    [v14 bounds];
    -[VideosExtrasLoadingView setFrame:](v12, "setFrame:");

    v15 = [(VideosExtrasNavigationController *)self topViewController];
    v16 = [v15 view];

    if (self->_loadingView)
    {
      if (v16)
      {
        v17 = [(VideosExtrasNavigationController *)self mainTemplateViewController];

        if (v17)
        {
          [v16 addSubview:self->_loadingView];
          [(VideosExtrasLoadingView *)self->_loadingView startCountdownToVisibilityWithInterval:0.33];
        }
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(VideosExtrasNavigationController *)self _presentDialogTemplate:v9];
    goto LABEL_16;
  }
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    v16 = +[VideosExtrasTemplateViewController templateViewControllerWithDocument:v21 options:v6 context:WeakRetained];

    if (v16)
    {
      emptyViewController = self->_emptyViewController;
      v20 = [(VideosExtrasNavigationController *)self topViewController];

      if (emptyViewController == v20) {
        [(UINavigationController *)self _VideosExtras_replaceViewController:self->_emptyViewController withViewController:v16 animated:0];
      }
      else {
        [(VideosExtrasNavigationController *)self pushViewController:v16 animated:1];
      }
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)popDocument
{
  id v2 = (id)[(VideosExtrasNavigationController *)self popViewControllerAnimated:1];
}

- (void)popToDocument:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(VideosExtrasNavigationController *)self viewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v10 document];

          if (v11 == v4)
          {
            id v12 = (id)[(VideosExtrasNavigationController *)self popToViewController:v10 animated:1];
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)popToRootDocument
{
  id v4 = [(VideosExtrasNavigationController *)self documents];
  v3 = [v4 firstObject];
  [(VideosExtrasNavigationController *)self popToDocument:v3];
}

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v14 = 0;
  id v9 = [(VideosExtrasNavigationController *)self _viewControllerForDocument:v7 index:&v14];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    id v11 = +[VideosExtrasTemplateViewController templateViewControllerWithDocument:v7 options:v8 context:WeakRetained];

    id v12 = [(VideosExtrasNavigationController *)self viewControllers];
    long long v13 = (void *)[v12 mutableCopy];

    [v13 insertObject:v11 atIndex:v14];
    [(VideosExtrasNavigationController *)self setViewControllers:v13];
  }
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v14 = 0;
  id v9 = [(VideosExtrasNavigationController *)self _viewControllerForDocument:v7 index:&v14];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    id v11 = +[VideosExtrasTemplateViewController templateViewControllerWithDocument:v7 options:v8 context:WeakRetained];

    id v12 = [(VideosExtrasNavigationController *)self viewControllers];
    long long v13 = (void *)[v12 mutableCopy];

    [v13 replaceObjectAtIndex:v14 withObject:v11];
    [(VideosExtrasNavigationController *)self setViewControllers:v13];
  }
}

- (id)_viewControllerForDocument:(id)a3 index:(int64_t *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(VideosExtrasNavigationController *)self viewControllers];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          objc_msgSend(v11, "document", (void)v15);
          id v12 = (id)objc_claimAutoreleasedReturnValue();

          if (v12 == v6)
          {
            id v8 = v11;
            int64_t v13 = [v7 indexOfObject:v8];
            goto LABEL_12;
          }
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  if (a4) {
    *a4 = v13;
  }

  return v8;
}

- (id)documents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(VideosExtrasNavigationController *)self viewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v10 = [v9 document];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_dismissViewController:(id)a3
{
  p_context = &self->_context;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained extrasDoneButtonPressed];
  }
  else
  {
    [WeakRetained extrasRequestsPlaybackStop];
    id v4 = objc_loadWeakRetained((id *)p_context);
    uint64_t v5 = [v4 extrasRootViewController];
    uint64_t v6 = [v5 presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_presentDialogTemplate:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 title];
  uint64_t v5 = [v4 text];
  uint64_t v6 = [v5 string];

  uint64_t v7 = [v3 descriptionText];
  id v8 = [v7 text];
  uint64_t v9 = [v8 string];

  id v21 = (void *)v9;
  v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v9 preferredStyle:0];
  [v10 setPreferredStyle:1];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = [v3 buttons];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = [*(id *)(*((void *)&v25 + 1) + 8 * i) text];
        uint64_t v17 = [v16 text];
        long long v18 = [v17 string];

        v19 = [MEMORY[0x1E4FB1410] actionWithTitle:v18 style:0 handler:0];
        [v10 addAction:v19];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VideosExtrasNavigationController__presentDialogTemplate___block_invoke;
  block[3] = &unk_1E6DF3F68;
  block[4] = self;
  id v24 = v10;
  id v20 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__VideosExtrasNavigationController__presentDialogTemplate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)loadingView:(id)a3 documentDidUpdate:(id)a4 options:(id)a5
{
  loadingView = self->_loadingView;
  id v8 = a5;
  id v9 = a4;
  [(VideosExtrasLoadingView *)loadingView cancelCountdownToVisibility];
  [(VideosExtrasLoadingView *)self->_loadingView removeFromSuperview];
  [(VideosExtrasNavigationController *)self pushDocument:v9 options:v8];
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_context = &self->_context;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  id v9 = [WeakRetained extrasRootViewController];
  v10 = [v9 detectMainDocument:v7];

  v11.receiver = self;
  v11.super_class = (Class)VideosExtrasNavigationController;
  [(VideosExtrasNavigationController *)&v11 setViewControllers:v10 animated:v4];
}

- (void)willShowViewController:(id)a3 animated:(BOOL)a4
{
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  uint64_t v6 = [WeakRetained extrasRootViewController];
  id v7 = [v6 mainTemplateViewController];
  if (v7 == v14)
  {

LABEL_6:
    [(VideosExtrasNavigationController *)self setNavigationBarHidden:1 animated:0];
    objc_super v11 = [(VideosExtrasNavigationController *)self navigationBar];
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v14 videoPlaybackViewController];
    id v9 = objc_loadWeakRetained((id *)&self->_context);
    v10 = [v9 featurePlaybackViewController];

    if (v8 == v10) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(VideosExtrasNavigationController *)self setNavigationBarHidden:0 animated:0];
  objc_super v11 = [(VideosExtrasNavigationController *)self navigationBar];
  uint64_t v12 = v11;
  uint64_t v13 = 1;
LABEL_9:
  [v11 setUserInteractionEnabled:v13];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(VideosExtrasNavigationController *)self viewControllers];
  id v8 = [v7 arrayByAddingObject:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v10 = [WeakRetained extrasRootViewController];
  objc_super v11 = [v10 detectMainDocument:v8];

  if ([v11 containsObject:v6])
  {
    if (self->_clearStackOnPush)
    {
      self->_clearStackOnPush = 0;
      uint64_t v12 = [v6 navigationItem];
      [(VideosExtrasNavigationController *)self _installDoneButtonOnNavigationItem:v12];
      v18[0] = v6;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [(VideosExtrasNavigationController *)self setViewControllers:v13 animated:0];
    }
    else
    {
      uint64_t v12 = [v6 navigationItem];
      id v14 = [(VideosExtrasNavigationController *)self topViewController];
      uint64_t v13 = [v14 title];

      if (![v13 length])
      {
        long long v15 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
        uint64_t v16 = [v15 localizedStringForKey:@"BACK" value:0 table:@"VideosExtras"];

        uint64_t v13 = (void *)v16;
      }
      [(VideosExtrasNavigationController *)self _installBackButtonOnNavigationItem:v12 withTitle:v13];
      v17.receiver = self;
      v17.super_class = (Class)VideosExtrasNavigationController;
      [(VideosExtrasNavigationController *)&v17 pushViewController:v6 animated:v4];
    }
  }
}

- (void)_installDoneButtonOnNavigationItem:(id)a3
{
  if (self->_showsBuiltInNavControls)
  {
    id v4 = a3;
    uint64_t v5 = [(VideosExtrasNavigationController *)self navigationBar];
    +[VideosExtrasNavigationBarButton extrasNavigationButton:](VideosExtrasNavigationBarButton, "extrasNavigationButton:", [v5 _activeBarMetrics]);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    id v7 = [v6 localizedStringForKey:@"DONE" value:0 table:@"VideosExtras"];
    [v9 setTitle:v7 forState:0];

    [v9 addTarget:self action:sel__dismissViewController_ forControlEvents:64];
    [v9 sizeToFit];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v9];
    [v4 setLeftBarButtonItem:v8];
  }
}

- (void)_popViewControllerFromBackButton
{
  id v2 = (id)[(VideosExtrasNavigationController *)self popViewControllerAnimated:1];
}

- (void)_installBackButtonOnNavigationItem:(id)a3 withTitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VideosExtrasNavigationController *)self navigationBar];
  +[VideosExtrasNavigationBarButton extrasBackButton:](VideosExtrasNavigationBarButton, "extrasBackButton:", [v8 _activeBarMetrics]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v10 setTitle:v6 forState:0];
  [v10 addTarget:self action:sel__popViewControllerFromBackButton forControlEvents:64];
  [v10 sizeToFit];
  if (objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v10, "semanticContentAttribute")) == 1)
  {
    [v10 imageEdgeInsets];
    objc_msgSend(v10, "setImageEdgeInsets:");
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v10];
  [v7 setLeftBarButtonItem:v9];
}

- (BOOL)showsBuiltInNavControls
{
  return self->_showsBuiltInNavControls;
}

- (void)setShowsBuiltInNavControls:(BOOL)a3
{
  self->_showsBuiltInNavControls = a3;
}

- (VideosExtrasContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (VideosExtrasContext *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_emptyViewController, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end