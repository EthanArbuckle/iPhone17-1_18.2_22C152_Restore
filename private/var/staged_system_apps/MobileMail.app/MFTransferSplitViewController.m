@interface MFTransferSplitViewController
- (AccountListController)accountListController;
- (BOOL)didAppear;
- (BOOL)executeIfSplitViewIsAvailable:(id)a3;
- (BOOL)usePushFromLeftPresentation;
- (MFTransferSplitViewController)initWithItems:(id)a3 scene:(id)a4 options:(unint64_t)a5 didDismissHandler:(id)a6;
- (MFTransferStackViewController)stackViewController;
- (MessageDisplayCapable)scene;
- (TransferNavigationController)transferNavigationController;
- (id)_disabledMailAccountForSourceAccounts:(id)a3 toSameAccountOnly:(BOOL)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)didDismissHandler;
- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4;
- (void)_ensureSupplementaryViewControllerIsVisibleAnimated:(BOOL)a3;
- (void)_restoreLayoutForDisplayMode:(int64_t)a3;
- (void)setAccountListController:(id)a3;
- (void)setDidAppear:(BOOL)a3;
- (void)setDidDismissHandler:(id)a3;
- (void)setScene:(id)a3;
- (void)setStackViewController:(id)a3;
- (void)setTransferNavigationController:(id)a3;
- (void)setUsePushFromLeftPresentation:(BOOL)a3;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)splitViewController:(id)a3 willCollapseToProposedTopColumn:(int64_t *)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)transferMailboxPickerController:(id)a3 animateMessageToPoint:(CGPoint)a4 inView:(id)a5 completion:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MFTransferSplitViewController

- (MFTransferSplitViewController)initWithItems:(id)a3 scene:(id)a4 options:(unint64_t)a5 didDismissHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MFTransferSplitViewController;
  v14 = [(MFTransferSplitViewController *)&v21 initWithStyle:2];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_itemsToDisplay, a3);
    objc_storeWeak((id *)&v15->_scene, v12);
    v15->_transferOptions = a5;
    id v16 = objc_retainBlock(v13);
    id didDismissHandler = v15->_didDismissHandler;
    v15->_id didDismissHandler = v16;

    [(MFTransferSplitViewController *)v15 setDelegate:v15];
    v18 = objc_opt_new();
    v19 = +[UIColor mailSplitViewBorderColor];
    [v18 setBorderColor:v19];

    [(MFTransferSplitViewController *)v15 setConfiguration:v18];
  }

  return v15;
}

- (TransferNavigationController)transferNavigationController
{
  transferNavigationController = self->_transferNavigationController;
  if (!transferNavigationController)
  {
    v4 = [TransferNavigationController alloc];
    itemsToDisplay = self->_itemsToDisplay;
    v6 = [(MFTransferSplitViewController *)self scene];
    v7 = [(TransferNavigationController *)v4 initWithMessages:itemsToDisplay scene:v6 options:self->_transferOptions];
    v8 = self->_transferNavigationController;
    self->_transferNavigationController = v7;

    transferNavigationController = self->_transferNavigationController;
  }

  return transferNavigationController;
}

- (MFTransferStackViewController)stackViewController
{
  stackViewController = self->_stackViewController;
  if (!stackViewController)
  {
    v4 = [MFTransferStackViewController alloc];
    v5 = [(MFTransferSplitViewController *)self scene];
    v6 = [(MFTransferStackViewController *)v4 initWithScene:v5];
    v7 = self->_stackViewController;
    self->_stackViewController = v6;

    stackViewController = self->_stackViewController;
  }

  return stackViewController;
}

- (AccountListController)accountListController
{
  accountListController = self->_accountListController;
  if (!accountListController)
  {
    unint64_t transferOptions = self->_transferOptions;
    v6 = [(MFTransferSplitViewController *)self transferNavigationController];
    v7 = [v6 mailboxPickerController];
    v8 = [v7 sourceAccounts];

    v9 = [(MFTransferSplitViewController *)self _disabledMailAccountForSourceAccounts:v8 toSameAccountOnly:(transferOptions >> 7) & 1];
    if ((self->_transferOptions & 0x80) != 0 && [v8 count] != (id)1)
    {
      v20 = +[NSAssertionHandler currentHandler];
      [v20 handleFailureInMethod:a2, self, @"MFTransferSplitViewController.m", 81, @"TransferOptionSameAccountOnly option only allows messages in one account. Accounts: %@", v8 object file lineNumber description];
    }
    v10 = [AccountListController alloc];
    id v11 = [(MFTransferSplitViewController *)self scene];
    id v12 = [(AccountListController *)v10 initWithScene:v11];
    id v13 = self->_accountListController;
    self->_accountListController = v12;

    v14 = [(MFTransferSplitViewController *)self transferNavigationController];
    v15 = [v14 mailboxPickerController];
    [(AccountListController *)self->_accountListController setAccountListDelegate:v15];

    id v16 = [(MFTransferSplitViewController *)self transferNavigationController];
    v17 = [v16 mailboxPickerController];
    v18 = [v17 account];
    [(AccountListController *)self->_accountListController setSelectedAccount:v18];

    [(AccountListController *)self->_accountListController setDisabledAccounts:v9];
    accountListController = self->_accountListController;
  }

  return accountListController;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFTransferSplitViewController;
  [(MFTransferSplitViewController *)&v9 traitCollectionDidChange:v4];
  if ([(MFTransferSplitViewController *)self didAppear])
  {
    v5 = [(MFTransferSplitViewController *)self traitCollection];
    unsigned int v6 = [v5 mf_traitDifferenceAffectsTextLayout:v4];

    if (v6)
    {
      v7 = [(MFTransferSplitViewController *)self transferNavigationController];
      v8 = [v7 mailboxPickerController];
      [v8 dismiss];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MFTransferSplitViewController;
  -[MFTransferSplitViewController viewWillAppear:](&v30, "viewWillAppear:");
  v5 = [(MFTransferSplitViewController *)self stackViewController];
  unsigned int v6 = [v5 navigationController];

  if (v6)
  {
    v7 = [v6 viewControllers];
    v8 = [v7 lastObject];
    objc_super v9 = [(MFTransferSplitViewController *)self stackViewController];

    if (v8 == v9) {
      id v10 = [v6 popViewControllerAnimated:0];
    }
  }
  id v11 = [(MFTransferSplitViewController *)self transferNavigationController];
  id v12 = [v11 mailboxPickerController];
  [v12 setAnimationDelegate:self];

  id v13 = objc_alloc((Class)UINavigationController);
  v14 = [(MFTransferSplitViewController *)self stackViewController];
  v15 = (UINavigationController *)[v13 initWithRootViewController:v14];
  stackNavigationController = self->_stackNavigationController;
  self->_stackNavigationController = v15;

  v17 = [(MFTransferSplitViewController *)self accountListController];
  [(MFTransferSplitViewController *)self setViewController:v17 forColumn:0];

  [(MFTransferSplitViewController *)self setViewController:v11 forColumn:1];
  [(MFTransferSplitViewController *)self setViewController:self->_stackNavigationController forColumn:2];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001F57B0;
  v25[3] = &unk_100606128;
  v25[4] = &v26;
  [(MFTransferSplitViewController *)self executeIfSplitViewIsAvailable:v25];
  [(MFTransferSplitViewController *)self _restoreLayoutForDisplayMode:v27[3]];
  v18 = [(MFTransferSplitViewController *)self view];
  [v18 layoutIfNeeded];

  unint64_t transferOptions = self->_transferOptions;
  v20 = [(MFTransferSplitViewController *)self stackViewController];
  [v20 setTransferOptions:transferOptions];

  [v11 beginAppearanceTransition:1 animated:v3];
  [(UINavigationController *)self->_stackNavigationController beginAppearanceTransition:1 animated:v3];
  objc_super v21 = [(MFTransferSplitViewController *)self stackViewController];
  v22 = [v21 stackController];
  LOBYTE(transferOptions) = [v22 hasStackedItems];

  if ((transferOptions & 1) == 0)
  {
    v23 = [(NSArray *)self->_itemsToDisplay ef_map:&stru_10060D578];
    v24 = [(MFTransferSplitViewController *)self stackViewController];
    [v24 displayStackedViewsForItemsWithIDs:v23];
  }
  _Block_object_dispose(&v26, 8);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFTransferSplitViewController;
  [(MFTransferSplitViewController *)&v4 viewDidAppear:a3];
  [(MFTransferSplitViewController *)self setDidAppear:1];
  if ([(MFTransferSplitViewController *)self displayMode] == (id)1) {
    [(MFTransferSplitViewController *)self _ensureSupplementaryViewControllerIsVisibleAnimated:1];
  }
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)MFTransferSplitViewController;
  [(MFTransferSplitViewController *)&v16 viewDidLoad];
  BOOL v3 = +[UIColor clearColor];
  objc_super v4 = [(MFTransferSplitViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(MFTransferSplitViewController *)self scene];
  unsigned int v6 = [v5 mf_window];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(MFTransferSplitViewController *)self view];
  [v15 setFrame:v8, v10, v12, v14];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFTransferSplitViewController;
  [(MFTransferSplitViewController *)&v6 viewDidDisappear:a3];
  [(MFTransferSplitViewController *)self setDidAppear:0];
  uint64_t v4 = [(MFTransferSplitViewController *)self didDismissHandler];
  v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  [(MFTransferSplitViewController *)self setDidDismissHandler:0];
}

- (void)_restoreLayoutForDisplayMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) <= 4) {
    [(MFTransferSplitViewController *)self mf_setColumn:qword_1005A83C8[a3 - 2] visible:1 animated:0 completion:0];
  }
}

- (void)_ensureSupplementaryViewControllerIsVisibleAnimated:(BOOL)a3
{
}

- (void)setUsePushFromLeftPresentation:(BOOL)a3
{
  self->_usePushFromLeftPresentation = a3;
  if (a3) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }
  [(MFTransferSplitViewController *)self setTransitioningDelegate:v3];
}

- (void)transferMailboxPickerController:(id)a3 animateMessageToPoint:(CGPoint)a4 inView:(id)a5 completion:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a5;
  id v11 = a6;
  double v12 = [v10 window];
  [v10 convertPoint:0 toView:x, y];
  [v12 convertPoint:0 toWindow:];
  double v14 = v13;
  double v16 = v15;

  v17 = [(MFTransferSplitViewController *)self stackViewController];
  v18 = [v17 stackContainerView];

  v19 = [v18 snapshotView];
  v20 = [(MFTransferSplitViewController *)self view];
  [v18 frame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  uint64_t v29 = [v18 superview];
  [v20 convertRect:v29 fromView:v22, v24, v26, v28];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  [v20 addSubview:v19];
  [v19 setFrame:v31, v33, v35, v37];
  CGFloat b = CGAffineTransformIdentity.b;
  CGFloat c = CGAffineTransformIdentity.c;
  CGFloat d = CGAffineTransformIdentity.d;
  tdouble x = CGAffineTransformIdentity.tx;
  tdouble y = CGAffineTransformIdentity.ty;
  v86[0] = *(void *)&CGAffineTransformIdentity.a;
  *(CGFloat *)&v86[1] = b;
  *(CGFloat *)&v86[2] = c;
  *(CGFloat *)&v86[3] = d;
  *(CGFloat *)&v86[4] = tx;
  *(CGFloat *)&v86[5] = ty;
  [v19 setTransform:v86];
  [v18 setHidden:1];
  v43 = [v19 layer];
  [v43 position];
  double v45 = v44;
  double v47 = v46;

  v48 = [v19 superview];
  v49 = [v19 window];
  [v49 convertPoint:0 fromWindow:v14, v16];
  [v48 convertPoint:0 fromView:];
  double v51 = v50;
  double v53 = v52;

  double v75 = v53;
  double v76 = v51;
  if (v19)
  {
    [v19 transform];
    double v54 = *((double *)&v83 + 1);
    double v55 = *(double *)&v83;
    double v57 = *((double *)&v84 + 1);
    double v56 = *(double *)&v84;
    double v59 = *((double *)&v85 + 1);
    double v58 = *(double *)&v85;
  }
  else
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v83 = 0u;
    double v59 = 0.0;
    double v57 = 0.0;
    double v54 = 0.0;
    double v58 = 0.0;
    double v56 = 0.0;
    double v55 = 0.0;
  }
  *(void *)&long long v60 = -1;
  *((void *)&v60 + 1) = -1;
  *(_OWORD *)&m.CGFloat c = v60;
  *(_OWORD *)&m.tdouble x = v60;
  *(_OWORD *)&m.double a = v60;
  if (v19) {
    [v19 transform];
  }
  else {
    memset(&v81, 0, sizeof(v81));
  }
  CGAffineTransformTranslate(&m, &v81, v58 + v47 * v56 + v55 * v45 - v45, v59 + v47 * v57 + v54 * v45 - v47);
  double a = m.a;
  double v61 = m.b;
  double v64 = m.c;
  double v63 = m.d;
  double v66 = m.tx;
  double v65 = m.ty;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, &m, v45, v47);
  CGPathAddQuadCurveToPoint(Mutable, &m, (v45 + v66 + v75 * v64 + a * v76) * 0.5 + 0.0, (v47 + v65 + v75 * v63 + v61 * v76) * 0.5 + -450.0, v66 + v75 * v64 + a * v76, v65 + v75 * v63 + v61 * v76);
  id v68 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v69 = +[CAKeyframeAnimation animationWithKeyPath:@"position"];
  [v69 setPath:Mutable];
  CGPathRelease(Mutable);
  [v68 addObject:v69];
  v70 = +[CAAnimationGroup animation];
  [v70 setAnimations:v68];
  UIAnimationDragCoefficient();
  [v70 setDuration:v71 * 0.5];
  v72 = [v19 layer];
  [v72 addAnimation:v70 forKey:0];

  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_1001F6088;
  v79[3] = &unk_1006047A0;
  id v73 = v19;
  id v80 = v73;
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_1001F6144;
  v77[3] = &unk_100606650;
  id v74 = v11;
  id v78 = v74;
  +[UIView animateWithDuration:196609 delay:v79 options:v77 animations:0.200000003 completion:0.299999997];
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  return self->_stackNavigationController;
}

- (void)splitViewController:(id)a3 willCollapseToProposedTopColumn:(int64_t *)a4
{
  *a4 = 1;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v7 = a3;
  objc_super v6 = [(MFTransferSplitViewController *)self stackViewController];
  [v6 updateForDisplayMode:a4 isCollapsed:[v7 isCollapsed]];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v6 = objc_alloc_init(MFTransferSplitViewPresentationAnimationController);
  }
  else {
    objc_super v6 = 0;
  }

  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = objc_alloc_init(MFTransferSplitViewDismissalAnimationController);
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)executeIfSplitViewIsAvailable:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  id v5 = [(MFTransferSplitViewController *)self scene];
  unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___SplitLayoutCapable];
  if (v6)
  {
    id v7 = [v5 splitViewController];
    v4[2](v4, v7);
  }
  return v6;
}

- (id)_disabledMailAccountForSourceAccounts:(id)a3 toSameAccountOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  id v5 = +[UIApplication sharedApplication];
  unsigned int v6 = [v5 accountsProvider];
  v20 = [v6 displayedAccounts];

  id v7 = +[NSMutableSet set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v17;
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      double v9 = 0;
      id v21 = v8;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v9);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = v20;
        id v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v23;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              if (v4 && v15 != v10
                || (+[MailAccount canMoveMessagesFromAccount:v10 toAccount:*(void *)(*((void *)&v22 + 1) + 8 * i)] & 1) == 0)
              {
                [v7 addObject:v15];
              }
            }
            id v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }

        double v9 = (char *)v9 + 1;
      }
      while (v9 != v21);
      id v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  return v7;
}

- (void)setTransferNavigationController:(id)a3
{
}

- (void)setStackViewController:(id)a3
{
}

- (BOOL)usePushFromLeftPresentation
{
  return self->_usePushFromLeftPresentation;
}

- (MessageDisplayCapable)scene
{
  WeakRetaineCGFloat d = objc_loadWeakRetained((id *)&self->_scene);

  return (MessageDisplayCapable *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void)setAccountListController:(id)a3
{
}

- (id)didDismissHandler
{
  return self->_didDismissHandler;
}

- (void)setDidDismissHandler:(id)a3
{
}

- (BOOL)didAppear
{
  return self->_didAppear;
}

- (void)setDidAppear:(BOOL)a3
{
  self->_didAppear = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didDismissHandler, 0);
  objc_storeStrong((id *)&self->_accountListController, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_stackViewController, 0);
  objc_storeStrong((id *)&self->_transferNavigationController, 0);
  objc_storeStrong((id *)&self->_stackNavigationController, 0);

  objc_storeStrong((id *)&self->_itemsToDisplay, 0);
}

@end