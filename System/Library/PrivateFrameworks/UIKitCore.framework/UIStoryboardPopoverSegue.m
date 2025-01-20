@interface UIStoryboardPopoverSegue
- (CGRect)_anchorRect;
- (NSArray)_passthroughViews;
- (UIBarButtonItem)_anchorBarButtonItem;
- (UIPopoverController)popoverController;
- (UIView)_anchorView;
- (unint64_t)_permittedArrowDirections;
- (void)_setAnchorBarButtonItem:(id)a3;
- (void)_setAnchorRect:(CGRect)a3;
- (void)_setAnchorView:(id)a3;
- (void)_setPassthroughViews:(id)a3;
- (void)_setPermittedArrowDirections:(unint64_t)a3;
- (void)perform;
@end

@implementation UIStoryboardPopoverSegue

- (UIPopoverController)popoverController
{
  popoverController = self->_popoverController;
  if (!popoverController)
  {
    v4 = [UIPopoverController alloc];
    v5 = [(UIStoryboardSegue *)self destinationViewController];
    v6 = [(UIPopoverController *)v4 initWithContentViewController:v5];
    v7 = self->_popoverController;
    self->_popoverController = v6;

    [(UIPopoverController *)self->_popoverController _setRetainsSelfWhilePresented:1];
    v8 = self->_popoverController;
    v9 = [(UIStoryboardPopoverSegue *)self _passthroughViews];
    [(UIPopoverController *)v8 setPassthroughViews:v9];

    popoverController = self->_popoverController;
  }
  return popoverController;
}

- (void)perform
{
  v4 = [(UIStoryboardSegue *)self destinationViewController];
  v5 = [(UIStoryboardSegue *)self sourceViewController];
  [v4 _setSourceViewControllerIfPresentedViaPopoverSegue:v5];

  v6 = [(UIStoryboardPopoverSegue *)self _anchorBarButtonItem];

  if (v6)
  {
    id v17 = [(UIStoryboardPopoverSegue *)self popoverController];
    v7 = [(UIStoryboardPopoverSegue *)self _anchorBarButtonItem];
    objc_msgSend(v17, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", v7, -[UIStoryboardPopoverSegue _permittedArrowDirections](self, "_permittedArrowDirections"), 1);
LABEL_5:

    goto LABEL_6;
  }
  v8 = [(UIStoryboardPopoverSegue *)self _anchorView];

  if (v8)
  {
    id v17 = [(UIStoryboardPopoverSegue *)self popoverController];
    [(UIStoryboardPopoverSegue *)self _anchorRect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v7 = [(UIStoryboardPopoverSegue *)self _anchorView];
    objc_msgSend(v17, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v7, -[UIStoryboardPopoverSegue _permittedArrowDirections](self, "_permittedArrowDirections"), 1, v10, v12, v14, v16);
    goto LABEL_5;
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"UIStoryboardPopoverSegue.m", 34, @"%@ must be presented from a bar button item or a view.", objc_opt_class() object file lineNumber description];
LABEL_6:
}

- (NSArray)_passthroughViews
{
  return self->_passthroughViews;
}

- (void)_setPassthroughViews:(id)a3
{
}

- (unint64_t)_permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)_setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (UIView)_anchorView
{
  return self->_anchorView;
}

- (void)_setAnchorView:(id)a3
{
}

- (UIBarButtonItem)_anchorBarButtonItem
{
  return self->_anchorBarButtonItem;
}

- (void)_setAnchorBarButtonItem:(id)a3
{
}

- (CGRect)_anchorRect
{
  double x = self->_anchorRect.origin.x;
  double y = self->_anchorRect.origin.y;
  double width = self->_anchorRect.size.width;
  double height = self->_anchorRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setAnchorRect:(CGRect)a3
{
  self->_anchorRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_anchorView, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);
}

@end