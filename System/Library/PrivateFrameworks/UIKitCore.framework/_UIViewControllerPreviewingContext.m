@interface _UIViewControllerPreviewingContext
- (CGRect)preferredSourceViewRectInCoordinateSpace:(id)a3;
- (CGRect)sourceRect;
- (UIGestureRecognizer)previewingGestureRecognizerForFailureRelationship;
- (UIView)customViewForInteractiveHighlight;
- (UIView)sourceView;
- (UIViewController)viewController;
- (UIViewControllerPreviewingDelegate)delegate;
- (_UIPreviewInteractionController)previewInteractionController;
- (_UIViewControllerPreviewingContext)initWithSourceView:(id)a3 viewController:(id)a4;
- (id)previewInteractionController:(id)a3 viewControllerForPreviewingAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5 presentingViewController:(id *)a6;
- (void)previewInteractionController:(id)a3 commitViewController:(id)a4;
- (void)previewInteractionController:(id)a3 didDismissViewController:(id)a4 committing:(BOOL)a5;
- (void)previewInteractionController:(id)a3 willDismissViewController:(id)a4;
- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4;
- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4 forLocation:(CGPoint)a5 inSourceView:(id)a6;
- (void)setCustomViewForInteractiveHighlight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreviewInteractionController:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setViewController:(id)a3;
- (void)unregister;
@end

@implementation _UIViewControllerPreviewingContext

- (_UIViewControllerPreviewingContext)initWithSourceView:(id)a3 viewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIViewControllerPreviewingContext;
  v9 = [(_UIViewControllerPreviewingContext *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceView, a3);
    objc_storeWeak((id *)&v10->_viewController, v8);
    v11 = [[_UIPreviewInteractionController alloc] initWithView:v7];
    previewInteractionController = v10->_previewInteractionController;
    v10->_previewInteractionController = v11;

    [(_UIPreviewInteractionController *)v10->_previewInteractionController setDelegate:v10];
    [(_UIPreviewInteractionController *)v10->_previewInteractionController setCurrentPreviewingContext:v10];
    v13 = v10;
  }

  return v10;
}

- (UIGestureRecognizer)previewingGestureRecognizerForFailureRelationship
{
  v2 = [(_UIViewControllerPreviewingContext *)self previewInteractionController];
  v3 = [v2 presentationGestureRecognizer];

  return (UIGestureRecognizer *)v3;
}

- (CGRect)preferredSourceViewRectInCoordinateSpace:(id)a3
{
  id v4 = a3;
  [(_UIViewControllerPreviewingContext *)self sourceRect];
  v39.origin.CGFloat x = v5;
  v39.origin.CGFloat y = v6;
  v39.size.CGFloat width = v7;
  v39.size.CGFloat height = v8;
  v9 = [(_UIViewControllerPreviewingContext *)self sourceView];
  previewInteractionController = self->_previewInteractionController;
  id v38 = v9;
  [(_UIPreviewInteractionController *)previewInteractionController _overrideSourceViewForBinaryCompatibilityIfNeeded:&v38 sourceRect:&v39];
  id v11 = v38;

  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  if (CGRectIsEmpty(v39))
  {
    v39.origin.CGFloat x = v13;
    v39.origin.CGFloat y = v15;
    CGFloat height = v19;
    CGFloat width = v17;
    CGFloat y = v15;
    CGFloat x = v13;
    v39.size.CGFloat width = v17;
    v39.size.CGFloat height = v19;
  }
  else
  {
    CGFloat x = v39.origin.x;
    CGFloat y = v39.origin.y;
    CGFloat width = v39.size.width;
    CGFloat height = v39.size.height;
  }
  v43.origin.CGFloat x = v13;
  v43.origin.CGFloat y = v15;
  v43.size.CGFloat width = v17;
  v43.size.CGFloat height = v19;
  if (CGRectEqualToRect(*(CGRect *)&x, v43))
  {
    v24 = [v11 window];
    v25 = v24;
    if (v24)
    {
      [v24 bounds];
      objc_msgSend(v11, "convertRect:fromCoordinateSpace:", v25);
      CGFloat v26 = v40.origin.x;
      CGFloat v27 = v40.origin.y;
      CGFloat v28 = v40.size.width;
      CGFloat v29 = v40.size.height;
      if (CGRectIntersectsRect(v40, v39))
      {
        v41.origin.CGFloat x = v26;
        v41.origin.CGFloat y = v27;
        v41.size.CGFloat width = v28;
        v41.size.CGFloat height = v29;
        CGRect v39 = CGRectIntersection(v41, v39);
      }
    }
  }
  if (v4 && v11 != v4)
  {
    objc_msgSend(v11, "convertRect:toCoordinateSpace:", v4, v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
    v39.origin.CGFloat x = v30;
    v39.origin.CGFloat y = v31;
    v39.size.CGFloat width = v32;
    v39.size.CGFloat height = v33;
  }

  double v34 = v39.origin.x;
  double v35 = v39.origin.y;
  double v36 = v39.size.width;
  double v37 = v39.size.height;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v34;
  return result;
}

- (void)unregister
{
  sourceView = self->_sourceView;
  self->_sourceView = 0;

  objc_storeWeak((id *)&self->_viewController, 0);
  previewInteractionController = self->_previewInteractionController;
  self->_previewInteractionController = 0;
}

- (id)previewInteractionController:(id)a3 viewControllerForPreviewingAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5 presentingViewController:(id *)a6
{
  double y = a4.y;
  double x = a4.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  id v11 = [WeakRetained presentedViewController];

  if (v11)
  {
    double v12 = 0;
    goto LABEL_11;
  }
  CGFloat v13 = [(_UIViewControllerPreviewingContext *)self sourceView];
  [v13 bounds];
  -[_UIViewControllerPreviewingContext setSourceRect:](self, "setSourceRect:");

  [(_UIViewControllerPreviewingContext *)self setCustomViewForInteractiveHighlight:0];
  double v14 = [(_UIViewControllerPreviewingContext *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = objc_msgSend(v14, "previewingContext:viewControllerForLocation:", self, x, y);
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = objc_msgSend(v14, "previewViewControllerForLocation:inSourceView:", self->_sourceView, x, y);
LABEL_7:
    double v12 = (void *)v15;
    if (v15) {
      *a6 = WeakRetained;
    }
    goto LABEL_10;
  }
  double v12 = 0;
LABEL_10:

LABEL_11:
  return v12;
}

- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4 forLocation:(CGPoint)a5 inSourceView:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  id v12 = a4;
  id v10 = a6;
  id v11 = [(_UIViewControllerPreviewingContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v11, "willPresentPreviewViewController:forLocation:inSourceView:", v12, v10, x, y);
  }
}

- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4
{
  id v6 = a4;
  CGFloat v5 = [(_UIViewControllerPreviewingContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 _previewingContext:self willPresentViewController:v6];
  }
}

- (void)previewInteractionController:(id)a3 willDismissViewController:(id)a4
{
  id v6 = a4;
  CGFloat v5 = [(_UIViewControllerPreviewingContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 _previewingContext:self willDismissViewController:v6];
  }
}

- (void)previewInteractionController:(id)a3 didDismissViewController:(id)a4 committing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  CGFloat v7 = [(_UIViewControllerPreviewingContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 didDismissPreviewViewController:v8 committing:v5];
  }
}

- (void)previewInteractionController:(id)a3 commitViewController:(id)a4
{
  id v6 = a4;
  BOOL v5 = [(_UIViewControllerPreviewingContext *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 previewingContext:self commitViewController:v6];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v5 commitPreviewViewController:v6 committedViewController:v6];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v5 commitPreviewViewController:v6];
  }
}

- (UIViewControllerPreviewingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIViewControllerPreviewingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIView)customViewForInteractiveHighlight
{
  return self->_customViewForInteractiveHighlight;
}

- (void)setCustomViewForInteractiveHighlight:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (_UIPreviewInteractionController)previewInteractionController
{
  return self->_previewInteractionController;
}

- (void)setPreviewInteractionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewInteractionController, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_customViewForInteractiveHighlight, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end