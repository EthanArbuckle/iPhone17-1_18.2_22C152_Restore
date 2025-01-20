@interface _UIRotatingAlertController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldAbortAdaptationFromTraitCollection:(id)a3 toTraitCollection:(id)a4 withTransitionCoordinator:(id)a5;
- (BOOL)presentSheet;
- (BOOL)presentSheetFromRect:(CGRect)a3;
- (_UIRotatingAlertController)init;
- (_UIRotatingAlertControllerDelegate)rotatingSheetDelegate;
- (unint64_t)arrowDirections;
- (void)_didRotateAndLayout;
- (void)_presentingViewControllerDidChange:(id)a3;
- (void)_presentingViewControllerWillChange:(id)a3;
- (void)_updateSheetPositionAfterRotation;
- (void)dealloc;
- (void)didRotate:(id)a3;
- (void)doneWithSheet;
- (void)setArrowDirections:(unint64_t)a3;
- (void)setRotatingSheetDelegate:(id)a3;
- (void)willRotate:(id)a3;
@end

@implementation _UIRotatingAlertController

- (_UIRotatingAlertController)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIRotatingAlertController;
  v2 = [(UIViewController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_arrowDirections = 15;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_willRotate_ name:@"UIWindowWillRotateNotification" object:0];
    [v4 addObserver:v3 selector:sel_didRotate_ name:@"UIWindowDidRotateNotification" object:0];
    v5 = v3;
  }
  return v3;
}

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIWindowWillRotateNotification";
  v6[1] = @"UIWindowDidRotateNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIRotatingAlertController;
  [(UIAlertController *)&v5 dealloc];
}

- (BOOL)presentSheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
  [WeakRetained initialPresentationRectInHostViewForSheet:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  return -[_UIRotatingAlertController presentSheetFromRect:](self, "presentSheetFromRect:", v5, v7, v9, v11);
}

- (BOOL)presentSheetFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
  double v9 = [WeakRetained hostViewForSheet:self];

  if (v9)
  {
    presentedViewControllerWhileRotating = (_UIRotatingAlertController *)self->_presentedViewControllerWhileRotating;
    if (!presentedViewControllerWhileRotating) {
      presentedViewControllerWhileRotating = self;
    }
    double v11 = presentedViewControllerWhileRotating;
    [(UIAlertController *)v11 setModalPresentationStyle:7];
    v12 = [(UIViewController *)v11 popoverPresentationController];
    [v12 setSourceView:v9];
    objc_msgSend(v12, "setSourceRect:", x, y, width, height);
    [v12 setPermittedArrowDirections:self->_arrowDirections];
    if (self->_popoverPresentationControllerDelegateWhileRotating) {
      objc_msgSend(v12, "setDelegate:");
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 presentAlertController:self animated:1 completionBlock:0];
    }
    else
    {
      v14 = +[UIViewController _viewControllerForFullScreenPresentationFromView:v9];
      [v14 presentViewController:v11 animated:1 completion:0];
      v15 = [v14 presentedViewController];

      if (v11 != v15)
      {
        BOOL v13 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    BOOL v13 = 1;
    goto LABEL_12;
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (void)doneWithSheet
{
  presentedViewControllerWhileRotating = self->_presentedViewControllerWhileRotating;
  self->_presentedViewControllerWhileRotating = 0;

  popoverPresentationControllerDelegateWhileRotating = self->_popoverPresentationControllerDelegateWhileRotating;
  self->_popoverPresentationControllerDelegateWhileRotating = 0;

  double v5 = (void *)MEMORY[0x1E4FBA8A8];
  [v5 cancelPreviousPerformRequestsWithTarget:self selector:sel__didRotateAndLayout object:0];
}

- (void)_presentingViewControllerWillChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIRotatingAlertController;
  [(UIViewController *)&v8 _presentingViewControllerWillChange:v4];
  double v5 = [(_UIRotatingAlertController *)self rotatingSheetDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(_UIRotatingAlertController *)self rotatingSheetDelegate];
    [v7 sheet:self presentingViewControllerWillChange:v4];
  }
}

- (void)_presentingViewControllerDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIRotatingAlertController;
  [(UIViewController *)&v8 _presentingViewControllerDidChange:v4];
  double v5 = [(_UIRotatingAlertController *)self rotatingSheetDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(_UIRotatingAlertController *)self rotatingSheetDelegate];
    [v7 sheet:self presentingViewControllerDidChange:v4];
  }
}

- (BOOL)_shouldAbortAdaptationFromTraitCollection:(id)a3 toTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  if (!a5) {
    return 0;
  }
  objc_msgSend(a5, "targetTransform", a3, a4);
  return !CGAffineTransformIsIdentity(&v6);
}

- (void)willRotate:(id)a3
{
  id v4 = [a3 object];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
  CGAffineTransform v6 = [WeakRetained hostViewForSheet:self];

  double v7 = [(UIViewController *)self _existingView];
  uint64_t v8 = [v7 window];
  if (!v8)
  {
LABEL_10:

    goto LABEL_11;
  }
  double v9 = (void *)v8;
  double v10 = [v6 window];

  if (v10 == v4)
  {
    double v7 = +[UIViewController _viewControllerForFullScreenPresentationFromView:v6];
    double v11 = [v7 presentedViewController];
    v12 = [v11 presentationController];
    uint64_t v13 = [v12 presentationStyle];

    if (v13 == 7 && !self->_isRotating)
    {
      self->_isRotating = 1;
      self->_readyToPresentAfterRotation = 0;
      v14 = [(UIViewController *)self presentingViewController];

      if (v14)
      {
        v15 = [(UIViewController *)self presentedViewController];
      }
      else
      {
        v15 = v11;
      }
      presentedViewControllerWhileRotating = self->_presentedViewControllerWhileRotating;
      self->_presentedViewControllerWhileRotating = v15;
      v17 = v15;

      v18 = [v11 popoverPresentationController];
      v19 = [v18 delegate];
      popoverPresentationControllerDelegateWhileRotating = self->_popoverPresentationControllerDelegateWhileRotating;
      self->_popoverPresentationControllerDelegateWhileRotating = v19;

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __41___UIRotatingAlertController_willRotate___block_invoke;
      v21[3] = &unk_1E52D9F70;
      v21[4] = self;
      [v7 dismissViewControllerAnimated:0 completion:v21];
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_updateSheetPositionAfterRotation
{
  presentedViewControllerWhileRotating = (_UIRotatingAlertController *)self->_presentedViewControllerWhileRotating;
  if (!presentedViewControllerWhileRotating) {
    presentedViewControllerWhileRotating = self;
  }
  v27 = presentedViewControllerWhileRotating;
  id v4 = [(UIViewController *)v27 presentingViewController];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    CGAffineTransform v6 = [(UIViewController *)self presentingViewController];
    BOOL v5 = v6 != 0;
  }
  if (self->_isRotating && self->_readyToPresentAfterRotation && !v5)
  {
    self->_isRotating = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
    [WeakRetained presentationRectInHostViewForSheet:self];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    BOOL v17 = [(UIViewController *)self->_presentedViewControllerWhileRotating isModalInPresentation];
    v29.origin.double x = v10;
    v29.origin.double y = v12;
    v29.size.double width = v14;
    v29.size.double height = v16;
    if (!CGRectIsEmpty(v29) || v17)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
      v20 = [v19 hostViewForSheet:self];
      [v20 bounds];
      v33.origin.double x = v10;
      v33.origin.double y = v12;
      v33.size.double width = v14;
      v33.size.double height = v16;
      CGRect v31 = CGRectIntersection(v30, v33);
      double x = v31.origin.x;
      double y = v31.origin.y;
      double width = v31.size.width;
      double height = v31.size.height;

      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      if (CGRectIsEmpty(v32))
      {
        if (v17) {
          [(_UIRotatingAlertController *)self presentSheet];
        }
      }
      else
      {
        -[_UIRotatingAlertController presentSheetFromRect:](self, "presentSheetFromRect:", x, y, width, height);
      }
      v25 = self->_presentedViewControllerWhileRotating;
      self->_presentedViewControllerWhileRotating = 0;

      popoverPresentationControllerDelegateWhileRotating = self->_popoverPresentationControllerDelegateWhileRotating;
      self->_popoverPresentationControllerDelegateWhileRotating = 0;
    }
  }
}

- (void)_didRotateAndLayout
{
  self->_readyToPresentAfterRotation = 1;
  [(_UIRotatingAlertController *)self _updateSheetPositionAfterRotation];
}

- (void)didRotate:(id)a3
{
  id v7 = [a3 object];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
  BOOL v5 = [WeakRetained hostViewForSheet:self];

  id v6 = [v5 window];

  if (v6 == v7) {
    [(_UIRotatingAlertController *)self performSelector:sel__didRotateAndLayout withObject:0 afterDelay:0.0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIRotatingAlertControllerDelegate)rotatingSheetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
  return (_UIRotatingAlertControllerDelegate *)WeakRetained;
}

- (void)setRotatingSheetDelegate:(id)a3
{
}

- (unint64_t)arrowDirections
{
  return self->_arrowDirections;
}

- (void)setArrowDirections:(unint64_t)a3
{
  self->_arrowDirections = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rotatingSheetDelegate);
  objc_storeStrong((id *)&self->_popoverPresentationControllerDelegateWhileRotating, 0);
  objc_storeStrong((id *)&self->_presentedViewControllerWhileRotating, 0);
}

@end