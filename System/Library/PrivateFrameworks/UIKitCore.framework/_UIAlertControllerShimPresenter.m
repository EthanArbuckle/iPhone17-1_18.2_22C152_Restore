@interface _UIAlertControllerShimPresenter
+ (BOOL)_shouldPresentActionSheetsFullscreen;
+ (id)_currentFullScreenAlertPresenters;
+ (void)_addPresenter:(id)a3;
+ (void)_cancelPendingTouchesIfAppropriateForWindow:(id)a3;
+ (void)_removePresenter:(id)a3;
- (UIAlertController)alertController;
- (UIAlertView)legacyAlert;
- (UIPopoverControllerDelegate)popoverDelegate;
- (_UIAlertControllerShimPresenterWindow)window;
- (id)_popoverController;
- (void)_createWindowIfNecessaryWithScene:(id)a3;
- (void)_dismissAlertControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_presentAlertControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_presentAlertControllerAnimated:(BOOL)a3 hostingScene:(id)a4 completion:(id)a5;
- (void)_presentAlertControllerFromBarButtonItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentAlertControllerFromRect:(CGRect)a3 inView:(id)a4 direction:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)_tearDownInPopoverViewController;
- (void)dealloc;
- (void)setAlertController:(id)a3;
- (void)setLegacyAlert:(id)a3;
- (void)setPopoverDelegate:(id)a3;
@end

@implementation _UIAlertControllerShimPresenter

- (void)_presentAlertControllerAnimated:(BOOL)a3 hostingScene:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  [(_UIAlertControllerShimPresenter *)self _createWindowIfNecessaryWithScene:a4];
  [(UIWindow *)self->_window makeKeyWindow];
  +[_UIAlertControllerShimPresenter _cancelPendingTouchesIfAppropriateForWindow:self->_window];
  +[_UIAlertControllerShimPresenter _addPresenter:self];
  v9 = [(_UIAlertControllerShimPresenter *)self alertController];
  [v9 _setDismissedFromShim:0];

  window = self->_window;
  v11 = [(_UIAlertControllerShimPresenter *)self alertController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91___UIAlertControllerShimPresenter__presentAlertControllerAnimated_hostingScene_completion___block_invoke;
  v13[3] = &unk_1E52D9FE8;
  id v14 = v8;
  id v12 = v8;
  [(_UIAlertControllerShimPresenterWindow *)window presentAlertController:v11 animated:v6 completionBlock:v13];
}

- (void)_presentAlertControllerAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)_presentAlertControllerFromBarButtonItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [a3 view];
  [v9 bounds];
  -[_UIAlertControllerShimPresenter _presentAlertControllerFromRect:inView:direction:animated:completion:](self, "_presentAlertControllerFromRect:inView:direction:animated:completion:", v9, 15, v5, v8);
}

- (void)_presentAlertControllerFromRect:(CGRect)a3 inView:(id)a4 direction:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v15 = a4;
  id v16 = a7;
  v17 = [v15 window];
  +[_UIAlertControllerShimPresenter _cancelPendingTouchesIfAppropriateForWindow:v17];

  v18 = [(_UIAlertControllerShimPresenter *)self alertController];
  [v18 _setDismissedFromShim:0];

  v19 = +[_UIPopoverView popoverViewContainingView:v15];
  v20 = [v19 popoverController];
  v21 = v20;
  if (v19)
  {
    v22 = [v20 _managingSplitViewController];
    BOOL v23 = v22 == 0;
  }
  else
  {
    BOOL v23 = 0;
  }
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    v24 = [v15 _viewControllerForAncestor];
    if ([v24 _isInContextOfPresentationControllerOfClass:objc_opt_class() effective:0])
    {
      v25 = [(_UIAlertControllerShimPresenter *)self alertController];
      [v24 presentViewController:v25 animated:v8 completion:v16];

      goto LABEL_17;
    }
  }
  if (v23)
  {
    v26 = [v19 contentView];
    v27 = objc_alloc_init(UIViewController);
    inPopoverViewController = self->_inPopoverViewController;
    self->_inPopoverViewController = v27;

    v29 = [(UIViewController *)self->_inPopoverViewController view];
    [v26 bounds];
    objc_msgSend(v29, "setFrame:");
    [v26 addSubview:v29];
    v30 = self->_inPopoverViewController;
    v31 = [(_UIAlertControllerShimPresenter *)self alertController];
    [(UIViewController *)v30 presentViewController:v31 animated:v8 completion:0];
  }
  else if (+[_UIAlertControllerShimPresenter _shouldPresentActionSheetsFullscreen])
  {
    [(_UIAlertControllerShimPresenter *)self _presentAlertControllerAnimated:v8 completion:v16];
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __104___UIAlertControllerShimPresenter__presentAlertControllerFromRect_inView_direction_animated_completion___block_invoke;
    aBlock[3] = &unk_1E52DA0E8;
    aBlock[4] = self;
    CGFloat v43 = x;
    CGFloat v44 = y;
    CGFloat v45 = width;
    CGFloat v46 = height;
    id v32 = v15;
    id v41 = v32;
    unint64_t v47 = a5;
    BOOL v48 = v8;
    id v42 = v16;
    v33 = (void (**)(void))_Block_copy(aBlock);
    if (_UIAppUseModernRotationAndPresentationBehaviors()
      && ([v32 _viewControllerForAncestor],
          v34 = objc_claimAutoreleasedReturnValue(),
          [v34 transitionCoordinator],
          v35 = objc_claimAutoreleasedReturnValue(),
          v35,
          v34,
          v35))
    {
      v36 = [v32 _viewControllerForAncestor];
      v37 = [v36 transitionCoordinator];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __104___UIAlertControllerShimPresenter__presentAlertControllerFromRect_inView_direction_animated_completion___block_invoke_2;
      v38[3] = &unk_1E52DA110;
      v39 = v33;
      [v37 animateAlongsideTransition:0 completion:v38];
    }
    else
    {
      v33[2](v33);
    }
  }
LABEL_17:
}

- (void)_dismissAlertControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(_UIAlertControllerShimPresenter *)self alertController];
  [v7 _setDismissedFromShim:1];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E52DA160;
  aBlock[4] = self;
  id v8 = v6;
  id v25 = v8;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  popoverController = self->_popoverController;
  if (popoverController)
  {
    [(UIPopoverController *)popoverController dismissPopoverAnimated:v4];
    v9[2](v9);
  }
  else
  {
    v11 = [(_UIAlertControllerShimPresenter *)self alertController];
    id v12 = [v11 presentingViewController];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke_2;
    v20[3] = &unk_1E52DA138;
    v20[4] = self;
    id v13 = v12;
    id v21 = v13;
    BOOL v23 = v4;
    id v14 = v9;
    id v22 = v14;
    id v15 = (void (**)(void))_Block_copy(v20);
    if (v13)
    {
      id v16 = [v13 transitionCoordinator];

      if (v16)
      {
        v17 = [v13 transitionCoordinator];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke_3;
        v18[3] = &unk_1E52DA110;
        v19 = v15;
        [v17 animateAlongsideTransition:0 completion:v18];
      }
      else
      {
        v15[2](v15);
      }
    }
    else
    {
      v14[2](v14);
    }
  }
}

- (id)_popoverController
{
  if (!self->_popoverController)
  {
    v3 = +[UIDevice currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      BOOL v5 = [UIPopoverController alloc];
      id v6 = [(_UIAlertControllerShimPresenter *)self alertController];
      v7 = [(UIPopoverController *)v5 initWithContentViewController:v6];
      popoverController = self->_popoverController;
      self->_popoverController = v7;

      id v9 = self->_popoverController;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverDelegate);
      [(UIPopoverController *)v9 setDelegate:WeakRetained];

      if (!_UIAppUseModernRotationAndPresentationBehaviors())
      {
        v11 = [(_UIAlertControllerShimPresenter *)self alertController];
        [v11 _setCompatibilityPopoverController:self->_popoverController];
      }
    }
  }
  id v12 = self->_popoverController;
  return v12;
}

- (void)setPopoverDelegate:(id)a3
{
  id v5 = a3;
  objc_storeWeak((id *)&self->_popoverDelegate, v5);
  popoverController = self->_popoverController;
  if (popoverController) {
    [(UIPopoverController *)popoverController setDelegate:v5];
  }
}

- (UIPopoverControllerDelegate)popoverDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverDelegate);
  return (UIPopoverControllerDelegate *)WeakRetained;
}

- (void)_tearDownInPopoverViewController
{
  v3 = [(UIViewController *)self->_inPopoverViewController view];
  [v3 removeFromSuperview];

  inPopoverViewController = self->_inPopoverViewController;
  self->_inPopoverViewController = 0;
}

+ (BOOL)_shouldPresentActionSheetsFullscreen
{
  v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

+ (void)_cancelPendingTouchesIfAppropriateForWindow:(id)a3
{
  id v3 = (id)[(id)UIApp _touchesEventForWindow:a3];
  uint64_t v4 = (void *)UIApp;
  [v4 _cancelUnfinishedTouchesForEvent:v3];
}

- (void)_createWindowIfNecessaryWithScene:(id)a3
{
  id v4 = a3;
  if (!self->_window)
  {
    id v7 = v4;
    if (v4) {
      id v5 = [[_UIAlertControllerShimPresenterWindow alloc] initWithWindowScene:v4];
    }
    else {
      id v5 = objc_alloc_init(_UIAlertControllerShimPresenterWindow);
    }
    window = self->_window;
    self->_window = v5;

    id v4 = v7;
  }
}

- (void)dealloc
{
  [(_UIAlertControllerShimPresenter *)self _tearDownInPopoverViewController];
  id v3 = [(_UIAlertControllerShimPresenter *)self alertController];
  [v3 _setCompatibilityPopoverController:0];

  +[_UIAlertControllerShimPresenter _removePresenter:self];
  v4.receiver = self;
  v4.super_class = (Class)_UIAlertControllerShimPresenter;
  [(_UIAlertControllerShimPresenter *)&v4 dealloc];
}

+ (id)_currentFullScreenAlertPresenters
{
  v2 = (void *)__currentFullScreenAlertPresenters;
  if (!__currentFullScreenAlertPresenters)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v4 = (void *)__currentFullScreenAlertPresenters;
    __currentFullScreenAlertPresenters = (uint64_t)v3;

    v2 = (void *)__currentFullScreenAlertPresenters;
  }
  return v2;
}

+ (void)_addPresenter:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = +[_UIAlertControllerShimPresenter _currentFullScreenAlertPresenters];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 window];
        [v10 setHidden:1];

        v11 = [v9 alertController];
        [v11 setTextFieldsCanBecomeFirstResponder:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  [v4 removeObject:v3];
  [v4 addObject:v3];
  id v12 = [v3 window];
  [v12 setHidden:0];
}

+ (void)_removePresenter:(id)a3
{
  id v9 = a3;
  id v3 = [v9 window];
  [v3 setHidden:1];

  objc_super v4 = +[_UIAlertControllerShimPresenter _currentFullScreenAlertPresenters];
  if ([v4 containsObject:v9]) {
    [v4 removeObject:v9];
  }
  uint64_t v5 = [v4 lastObject];
  uint64_t v6 = [v5 window];
  [v6 setHidden:0];

  uint64_t v7 = [v4 lastObject];
  id v8 = [v7 alertController];
  [v8 setTextFieldsCanBecomeFirstResponder:1];
}

- (_UIAlertControllerShimPresenterWindow)window
{
  return self->_window;
}

- (UIAlertController)alertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  return (UIAlertController *)WeakRetained;
}

- (void)setAlertController:(id)a3
{
}

- (UIAlertView)legacyAlert
{
  return self->_legacyAlert;
}

- (void)setLegacyAlert:(id)a3
{
  self->_legacyAlert = (UIAlertView *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_inPopoverViewController, 0);
  objc_destroyWeak((id *)&self->_popoverDelegate);
  objc_storeStrong((id *)&self->_popoverController, 0);
}

@end