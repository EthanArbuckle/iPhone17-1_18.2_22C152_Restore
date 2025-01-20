@interface CRLiOSSheetViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)shouldStretchWidth;
- (BOOL)shouldTouchesOutsideCancel;
- (CRLiOSSheetViewController)initWithCoder:(id)a3;
- (CRLiOSSheetViewController)initWithContentViewController:(id)a3;
- (CRLiOSSheetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIButton)cancelButton;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)containerView;
- (UIViewController)contentViewController;
- (double)inset;
- (double)transitionDuration:(id)a3;
- (id)cancelHandler;
- (void)addCancelButtonWithTitle:(id)a3;
- (void)animateTransition:(id)a3;
- (void)didCancel;
- (void)didTapUsingGestureRecognizer:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setCancelButton:(id)a3;
- (void)setCancelHandler:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setShouldStretchWidth:(BOOL)a3;
- (void)setShouldTouchesOutsideCancel:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CRLiOSSheetViewController

- (CRLiOSSheetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D26C8);
  }
  v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v17 = v7;
    __int16 v18 = 2082;
    v19 = "-[CRLiOSSheetViewController initWithNibName:bundle:]";
    __int16 v20 = 2082;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m";
    __int16 v22 = 1024;
    int v23 = 24;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D26E8);
  }
  v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    v11 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v17 = v7;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSSheetViewController initWithNibName:bundle:]");
  v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:24 isFatal:0 description:"Do not call method"];

  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLiOSSheetViewController initWithNibName:bundle:]");
  id v15 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

- (CRLiOSSheetViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D2708);
  }
  id v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v14 = v4;
    __int16 v15 = 2082;
    v16 = "-[CRLiOSSheetViewController initWithCoder:]";
    __int16 v17 = 2082;
    __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m";
    __int16 v19 = 1024;
    int v20 = 29;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D2728);
  }
  id v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unsigned int v7 = v6;
    v8 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v14 = v4;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSSheetViewController initWithCoder:]");
  v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:29 isFatal:0 description:"Do not call method"];

  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLiOSSheetViewController initWithCoder:]");
  id v12 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (CRLiOSSheetViewController)initWithContentViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSSheetViewController;
  id v6 = [(CRLiOSSheetViewController *)&v9 initWithNibName:0 bundle:0];
  unsigned int v7 = v6;
  if (v6)
  {
    [(CRLiOSSheetViewController *)v6 setModalPresentationStyle:4];
    [(CRLiOSSheetViewController *)v7 setTransitioningDelegate:v7];
    v7->_shouldStretchWidth = 1;
    [(CRLiOSSheetViewController *)v7 addChildViewController:v5];
    objc_storeStrong((id *)&v7->_contentViewController, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v74.receiver = self;
  v74.super_class = (Class)CRLiOSSheetViewController;
  [(CRLiOSSheetViewController *)&v74 viewDidLoad];
  id v3 = [(CRLiOSSheetViewController *)self view];
  unsigned int v4 = +[UIColor colorWithWhite:0.0 alpha:0.400000006];
  [v3 setBackgroundColor:v4];

  id v5 = objc_opt_new();
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v5];
  id v6 = [(UIViewController *)self->_contentViewController view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:v6];
  objc_storeStrong((id *)&self->_containerView, v5);
  [(UIViewController *)self->_contentViewController didMoveToParentViewController:self];
  [(CRLiOSSheetViewController *)self inset];
  double v8 = v7;
  objc_super v9 = objc_opt_new();
  if (self->_shouldStretchWidth)
  {
    v10 = [v5 leadingAnchor];
    v11 = [v3 leadingAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11];
    [v9 addObject:v12];

    v13 = [v5 trailingAnchor];
    [v3 trailingAnchor];
  }
  else
  {
    unsigned int v14 = [v5 widthAnchor];
    __int16 v15 = [v14 constraintEqualToConstant:0.0];
    maxWidthConstraint = self->_maxWidthConstraint;
    self->_maxWidthConstraint = v15;

    LODWORD(v17) = 1145569280;
    [(NSLayoutConstraint *)self->_maxWidthConstraint setPriority:v17];
    __int16 v18 = [v5 leadingAnchor];
    __int16 v19 = [v3 leadingAnchor];
    int v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19 constant:v8];
    [v9 addObject:v20];

    v21 = [v3 trailingAnchor];
    __int16 v22 = [v5 trailingAnchor];
    int v23 = [v21 constraintGreaterThanOrEqualToAnchor:v22 constant:v8];
    [v9 addObject:v23];

    v13 = [v5 centerXAnchor];
    [v3 centerXAnchor];
  v24 = };
  v25 = [v13 constraintEqualToAnchor:v24];
  [v9 addObject:v25];

  v26 = [v6 leadingAnchor];
  v27 = [v5 leadingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v9 addObject:v28];

  v29 = [v6 trailingAnchor];
  v30 = [v5 trailingAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  [v9 addObject:v31];

  v32 = [v5 bottomAnchor];
  v73 = v3;
  v33 = [v3 bottomAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v9 addObject:v34];

  [(UIViewController *)self->_contentViewController preferredContentSize];
  double v36 = v35;
  v37 = [v6 heightAnchor];
  v38 = [v37 constraintEqualToConstant:v36];
  [v9 addObject:v38];

  v39 = objc_opt_new();
  [v39 setIdentifier:@"containerViewLayoutGuide"];
  [v5 addLayoutGuide:v39];
  if (self->_cancelButton)
  {
    v40 = [v6 backgroundColor];
    [(UIButton *)self->_cancelButton setBackgroundColor:v40];

    [(UIButton *)self->_cancelButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_containerView addSubview:self->_cancelButton];
    v41 = [(UIButton *)self->_cancelButton topAnchor];
    v42 = [v6 bottomAnchor];
    v43 = [v41 constraintEqualToAnchor:v42 constant:8.0];
    [v9 addObject:v43];

    v44 = [(UIButton *)self->_cancelButton heightAnchor];
    v45 = [v44 constraintEqualToConstant:57.0];
    [v9 addObject:v45];

    v46 = [(UIButton *)self->_cancelButton leadingAnchor];
    v47 = [v5 leadingAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    [v9 addObject:v48];

    v49 = [(UIButton *)self->_cancelButton trailingAnchor];
    v50 = [v5 trailingAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v9 addObject:v51];

    v52 = [v5 safeAreaLayoutGuide];
    v53 = [v52 bottomAnchor];
    v54 = [(UIButton *)self->_cancelButton bottomAnchor];
    v55 = [v53 constraintEqualToAnchor:v54 constant:v8];
    [v9 addObject:v55];
  }
  else
  {
    v56 = [v6 topAnchor];
    v57 = [v5 topAnchor];
    v58 = [v56 constraintEqualToAnchor:v57];
    [v9 addObject:v58];

    v52 = [v6 bottomAnchor];
    v53 = [v5 bottomAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    [v9 addObject:v54];
  }

  v59 = [v39 topAnchor];
  v60 = [v6 topAnchor];
  v61 = [v59 constraintEqualToAnchor:v60];
  [v9 addObject:v61];

  v62 = [v39 bottomAnchor];
  v63 = [v5 bottomAnchor];
  v64 = [v62 constraintEqualToAnchor:v63];
  [v9 addObject:v64];

  v65 = [v5 heightAnchor];
  v66 = [v39 heightAnchor];
  v67 = [v65 constraintEqualToAnchor:v66];
  [v9 addObject:v67];

  if (!*((unsigned char *)&self->super.super.super.isa + v72))
  {
    v68 = [v6 layer];
    [v68 setCornerRadius:14.0];
    [v68 setMasksToBounds:1];
    v69 = [(UIButton *)self->_cancelButton layer];
    [v69 setCornerRadius:14.0];
    [v69 setMasksToBounds:1];
  }
  if (self->_shouldTouchesOutsideCancel)
  {
    v70 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"didTapUsingGestureRecognizer:"];
    [(UITapGestureRecognizer *)v70 setDelegate:self];
    [(UITapGestureRecognizer *)v70 setCancelsTouchesInView:0];
    [v73 addGestureRecognizer:v70];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v70;
  }
  +[NSLayoutConstraint activateConstraints:v9];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSSheetViewController;
  [(CRLiOSSheetViewController *)&v5 viewWillAppear:a3];
  unsigned int v4 = [(CRLiOSSheetViewController *)self view];
  [v4 setNeedsUpdateConstraints];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSSheetViewController;
  [(CRLiOSSheetViewController *)&v5 viewDidDisappear:a3];
  id cancelHandler = self->_cancelHandler;
  self->_id cancelHandler = 0;
}

- (void)updateViewConstraints
{
  if (self->_maxWidthConstraint)
  {
    id v3 = [(CRLiOSSheetViewController *)self view];
    unsigned int v4 = [v3 window];

    if (v4)
    {
      [v4 bounds];
      if (v5 >= v6) {
        double v7 = v6;
      }
      else {
        double v7 = v5;
      }
      [(CRLiOSSheetViewController *)self inset];
      [(NSLayoutConstraint *)self->_maxWidthConstraint setConstant:v7 + v8 * -2.0];
    }
    [(NSLayoutConstraint *)self->_maxWidthConstraint setActive:v4 != 0];
  }
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSSheetViewController;
  [(CRLiOSSheetViewController *)&v9 updateViewConstraints];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSSheetViewController;
  [(CRLiOSSheetViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(CRLiOSSheetViewController *)self view];
  unsigned int v4 = [v3 window];
  [v4 bounds];
  [v3 setFrame:];
}

- (void)setShouldTouchesOutsideCancel:(BOOL)a3
{
  if ([(CRLiOSSheetViewController *)self isViewLoaded])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2748);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101073094();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2768);
    }
    objc_super v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSSheetViewController setShouldTouchesOutsideCancel:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:177 isFatal:0 description:"Can't set shouldTouchesOutsideCancel after loading the view"];
  }
  self->_shouldTouchesOutsideCancel = a3;
}

- (void)didTapUsingGestureRecognizer:(id)a3
{
}

- (void)setShouldStretchWidth:(BOOL)a3
{
  self->_shouldStretchWidth = a3;
  if ([(CRLiOSSheetViewController *)self isViewLoaded])
  {
    id v4 = [(CRLiOSSheetViewController *)self view];
    [v4 setNeedsUpdateConstraints];
  }
}

- (void)addCancelButtonWithTitle:(id)a3
{
  id v4 = a3;
  if ([(CRLiOSSheetViewController *)self isViewLoaded])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2788);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010731A4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D27A8);
    }
    objc_super v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSSheetViewController addCancelButtonWithTitle:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:194 isFatal:0 description:"Can't add a cancel button after loading the view"];
  }
  if (self->_cancelButton)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D27C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107311C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D27E8);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    objc_super v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSSheetViewController addCancelButtonWithTitle:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSSheetViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:195 isFatal:0 description:"Can't have more than one cancel button"];
  }
  v11 = +[UIButton buttonWithType:1];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v11;

  [(UIButton *)self->_cancelButton setTitle:v4 forState:0];
  [(UIButton *)self->_cancelButton addTarget:self action:"didCancel" forControlEvents:64];
  v13 = +[UIFont boldSystemFontOfSize:21.0];
  unsigned int v14 = [(UIButton *)self->_cancelButton titleLabel];
  [v14 setFont:v13];
}

- (void)didCancel
{
  id cancelHandler = (void (**)(id))self->_cancelHandler;
  if (cancelHandler) {
    cancelHandler[2](self->_cancelHandler);
  }
  else {
    [(CRLiOSSheetViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (double)inset
{
  return 10.0;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (qword_101719AB0 != -1) {
    dispatch_once(&qword_101719AB0, &stru_1014D2808);
  }
  double v7 = off_10166B4E0;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG)) {
    sub_1010732EC(self, v4, v7);
  }

  if (qword_101719AB0 != -1) {
    dispatch_once(&qword_101719AB0, &stru_1014D2828);
  }
  double v8 = off_10166B4E0;
  if (os_log_type_enabled((os_log_t)off_10166B4E0, OS_LOG_TYPE_DEBUG)) {
    sub_10107322C((uint64_t)self, v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSSheetViewController;
  [(CRLiOSSheetViewController *)&v9 dismissViewControllerAnimated:v4 completion:v6];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_tapGestureRecognizer != a3) {
    return 1;
  }
  id v6 = [a4 view];
  double v7 = [(CRLiOSSheetViewController *)self view];
  BOOL v4 = v6 == v7;

  return v4;
}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLiOSSheetViewController *)self view];
  id v6 = [v4 containerView];
  [v6 addSubview:v5];

  [v5 layoutIfNeeded];
  [(UIView *)self->_containerView frame];
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  CGFloat v11 = CGRectGetHeight(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGRect v36 = CGRectOffset(v35, 0.0, v11);
  double v12 = v36.origin.x;
  double v13 = v36.origin.y;
  double v14 = v36.size.width;
  double v15 = v36.size.height;
  v16 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];

  if (v16 == self)
  {
    double v17 = [v5 backgroundColor];
    __int16 v18 = +[UIColor clearColor];
    [v5 setBackgroundColor:v18];

    -[UIView setFrame:](self->_containerView, "setFrame:", v12, v13, v14, v15);
    double v15 = height;
    double v14 = width;
    double v13 = y;
    double v12 = x;
  }
  else
  {
    double v17 = +[UIColor clearColor];
  }
  [(CRLiOSSheetViewController *)self transitionDuration:v4];
  double v20 = v19;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000B85C0;
  v26[3] = &unk_1014D2850;
  id v27 = v5;
  id v28 = v17;
  v29 = self;
  double v30 = v12;
  double v31 = v13;
  double v32 = v14;
  double v33 = v15;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000B8610;
  v24[3] = &unk_1014CE260;
  id v25 = v4;
  id v21 = v4;
  id v22 = v17;
  id v23 = v5;
  +[UIView animateWithDuration:v26 animations:v24 completion:v20];
}

- (BOOL)shouldTouchesOutsideCancel
{
  return self->_shouldTouchesOutsideCancel;
}

- (BOOL)shouldStretchWidth
{
  return self->_shouldStretchWidth;
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
}

- (UIViewController)contentViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContentViewController:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UIView)containerView
{
  return (UIView *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContainerView:(id)a3
{
}

- (UIButton)cancelButton
{
  return (UIButton *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCancelButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong(&self->_cancelHandler, 0);

  objc_storeStrong((id *)&self->_maxWidthConstraint, 0);
}

@end