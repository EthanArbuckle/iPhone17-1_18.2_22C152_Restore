@interface BKViewController
- (BKViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)forcePopoverInsteadOfSheet;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (UIViewController)currentOverlayViewController;
- (id)barButtonItemForButton:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)layoutDirection;
- (void)cleanupPopovers;
- (void)dealloc;
- (void)dismissCurrentPopover;
- (void)dismissCurrentPopoverAnimated:(BOOL)a3;
- (void)dismissCurrentPopoverWithCompletion:(id)a3;
- (void)dismissCurrentPopoverWithCompletion:(id)a3 animated:(BOOL)a4;
- (void)hideOverlayViewControllerWithCompletion:(id)a3;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)releaseViews;
- (void)setCurrentOverlayViewController:(id)a3;
- (void)setForcePopoverInsteadOfSheet:(BOOL)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)showOverlayViewController:(id)a3 fromItem:(id)a4 popoverOnPhone:(BOOL)a5 passthroughViews:(id)a6 popoverBackgroundColor:(id)a7;
@end

@implementation BKViewController

- (BKViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  v6 = AEBundle();
  v10.receiver = self;
  v10.super_class = (Class)BKViewController;
  v7 = [(BKViewController *)&v10 initWithNibName:v5 bundle:v6];

  if (v7)
  {
    v8 = +[UIApplication sharedApplication];
    -[BKViewController setLayoutDirection:](v7, "setLayoutDirection:", [v8 userInterfaceLayoutDirection]);
  }
  return v7;
}

- (void)dealloc
{
  [(BKViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)BKViewController;
  [(BKViewController *)&v3 dealloc];
}

- (void)releaseViews
{
  topLeftCorner = self->_topLeftCorner;
  self->_topLeftCorner = 0;

  topRightCorner = self->_topRightCorner;
  self->_topRightCorner = 0;

  [(BKViewController *)self dismissCurrentPopover];
  [(BKViewController *)self cleanupPopovers];
  v5.receiver = self;
  v5.super_class = (Class)BKViewController;
  [(BKViewController *)&v5 releaseViews];
}

- (void)cleanupPopovers
{
  self->_currentPopoverDirections = 15;
}

- (void)dismissCurrentPopover
{
}

- (void)dismissCurrentPopoverAnimated:(BOOL)a3
{
}

- (void)dismissCurrentPopoverWithCompletion:(id)a3
{
}

- (void)dismissCurrentPopoverWithCompletion:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(BKViewController *)self bc_contextualPresentedViewController];
  v8 = [v7 bc_deepestPresentedViewController];

  if (!v8)
  {
    [(BKViewController *)self cleanupPopovers];
    objc_super v10 = objc_retainBlock(v6);
    v9 = v10;
    if (v10) {
      ((void (*))v10[2].isa)(v10);
    }
    goto LABEL_6;
  }
  if (([v8 isBeingPresented] & 1) != 0
    || [v8 isBeingDismissed])
  {
    v9 = BCIMLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_137D18((uint64_t)v8, v9);
    }
LABEL_6:

    goto LABEL_13;
  }
  v11 = BCIMLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "dismissCurrentPopoverWithCompletion: dismissing top view controller: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_76774;
  v12[3] = &unk_1DC7F0;
  objc_copyWeak(&v14, (id *)buf);
  id v13 = v6;
  BOOL v15 = v4;
  [v8 dismissViewControllerAnimated:v4 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
LABEL_13:
}

- (void)setCurrentOverlayViewController:(id)a3
{
  p_currentOverlayViewController = &self->_currentOverlayViewController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_currentOverlayViewController);
  unsigned __int8 v7 = [WeakRetained isEqual:v5];

  objc_storeWeak((id *)p_currentOverlayViewController, v5);
  if ((v7 & 1) == 0)
  {
    [(BKViewController *)self didChangeCurrentOverlayViewController];
  }
}

- (id)barButtonItemForButton:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = BUDynamicCast();

  return v4;
}

- (void)showOverlayViewController:(id)a3 fromItem:(id)a4 popoverOnPhone:(BOOL)a5 passthroughViews:(id)a6 popoverBackgroundColor:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_76AA0;
  v29[3] = &unk_1DC818;
  v29[4] = self;
  BOOL v34 = a5;
  id v16 = v12;
  id v30 = v16;
  id v31 = v15;
  id v32 = v14;
  id v33 = v13;
  id v17 = v13;
  id v18 = v14;
  id v19 = v15;
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_76E18;
  v26 = &unk_1DB3F0;
  id v27 = v16;
  v28 = objc_retainBlock(v29);
  v20 = v28;
  id v21 = v16;
  v22 = objc_retainBlock(&v23);
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v22, v23, v24, v25, v26);
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v42 = a3;
  v8 = [v42 bc_realSourceBarButtonItem];
  if (!v8) {
    goto LABEL_8;
  }
  v9 = [(BKViewController *)self view];
  objc_super v10 = [v8 _viewForPresenting];
  [v8 _rectForPresenting];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v10 bounds];
  [v10 convertRect:v9 toView:];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  [v10 convertRect:v9 toView:v12];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v35 = [v42 bc_fakeSourceView];
  if (!v35)
  {
    id v36 = [objc_alloc((Class)UIView) initWithFrame:v20, v22, v24, v26];
    v41 = +[UIColor clearColor];
    [v36 setBackgroundColor:v41];

    [v36 setUserInteractionEnabled:0];
    [v9 addSubview:v36];
    if (!a5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v36 = v35;
  [v35 setFrame:v20, v22, v24, v26];
  if (a5) {
LABEL_4:
  }
    *a5 = v36;
LABEL_5:
  if (a4)
  {
    [v9 convertRect:v36 toView:v28];
    a4->origin.x = v37;
    a4->origin.y = v38;
    a4->size.width = v39;
    a4->size.height = v40;
  }

LABEL_8:
}

- (void)hideOverlayViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKViewController *)self bc_contextualPresentedViewController];
  [v5 dismissViewControllerAnimated:1 completion:v4];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4 = a3;
  id v5 = [(BKViewController *)self traitCollection];
  int64_t v6 = [(BKViewController *)self adaptivePresentationStyleForPresentationController:v4 traitCollection:v5];

  return v6;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v5 = a4;
  if ([(BKViewController *)self forcePopoverInsteadOfSheet])
  {
    int64_t v6 = -1;
  }
  else if (v5 {
         || ([(BKViewController *)self traitCollection],
  }
             (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned __int8 v7 = (char *)[v5 horizontalSizeClass];
    if ([v5 verticalSizeClass] == (char *)&dword_0 + 1 || v7 == (unsigned char *)&dword_0 + 1) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = 7;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 presentedViewController];

  id v5 = BUDynamicCast();

  [v5 ae_willDismissPopoverContainingThisViewController];
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  id v4 = [v9 presentedViewController];
  id v5 = BUDynamicCast();

  [v5 ae_didDismissPopoverContainingThisViewController];
  int64_t v6 = [v9 presentedViewController];
  unsigned __int8 v7 = [(BKViewController *)self currentOverlayViewController];

  if (v6 == v7) {
    [(BKViewController *)self setCurrentOverlayViewController:0];
  }
  v8 = [v9 bc_fakeSourceView];
  [v8 removeFromSuperview];

  [v9 setBc_fakeSourceView:0];
  [v9 setBc_realSourceBarButtonItem:0];
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (UIViewController)currentOverlayViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentOverlayViewController);

  return (UIViewController *)WeakRetained;
}

- (BOOL)forcePopoverInsteadOfSheet
{
  return self->_forcePopoverInsteadOfSheet;
}

- (void)setForcePopoverInsteadOfSheet:(BOOL)a3
{
  self->_forcePopoverInsteadOfSheet = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentOverlayViewController);
  objc_storeStrong((id *)&self->_topRightCorner, 0);

  objc_storeStrong((id *)&self->_topLeftCorner, 0);
}

@end