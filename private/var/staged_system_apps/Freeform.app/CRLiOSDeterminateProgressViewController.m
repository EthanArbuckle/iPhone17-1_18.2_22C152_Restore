@interface CRLiOSDeterminateProgressViewController
+ (id)progressViewControllerWithTitle:(id)a3 crlProgress:(id)a4 cancelHandler:(id)a5;
+ (id)progressViewControllerWithTitle:(id)a3 progress:(id)a4 cancelHandler:(id)a5;
- (BOOL)cancelButtonVisible;
- (BOOL)cancelled;
- (BOOL)isCancelButtonEnabled;
- (BOOL)shouldTouchesOutsideCancel;
- (CRLiOSDeterminateProgressViewController)init;
- (CRLiOSDeterminateProgressViewControllerDelegate)delegate;
- (NSProgress)progress;
- (NSString)cancelButtonTitle;
- (NSString)message;
- (UIActivityIndicatorView)spinnerView;
- (UIButton)cancelButton;
- (UIFont)messageFont;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIProgressView)progressView;
- (UIView)dividerLine;
- (double)transitionDuration:(id)a3;
- (id)adaptiveViewController;
- (id)cancelButtonTitleNonNil;
- (id)cancelHandler;
- (id)nibName;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)overridePreferredStatusBarStyle;
- (int64_t)preferredStatusBarStyle;
- (void)animateTransition:(id)a3;
- (void)cancel:(id)a3;
- (void)cancelAnimated:(BOOL)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)runCancellationHandlers;
- (void)setCancelButton:(id)a3;
- (void)setCancelButtonEnabled:(BOOL)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setCancelButtonVisible:(BOOL)a3;
- (void)setCancelHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDividerLine:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageFont:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setOverridePreferredStatusBarStyle:(int64_t)a3;
- (void)setProgress:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setShouldTouchesOutsideCancel:(BOOL)a3;
- (void)setSpinnerView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupControlColors;
- (void)startObservingProgress:(id)a3;
- (void)stopObservingProgress:(id)a3;
- (void)updateMessageLabelWithProgress:(id)a3;
- (void)updateProgressViewDisplayWithProgress:(id)a3;
- (void)updateProgressViewWithProgress:(id)a3;
- (void)updateViewSize;
- (void)viewDidLoad;
@end

@implementation CRLiOSDeterminateProgressViewController

- (id)nibName
{
  return @"CRLiOSDeterminateProgressView";
}

- (CRLiOSDeterminateProgressViewController)init
{
  v3 = [(CRLiOSDeterminateProgressViewController *)self nibName];
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSDeterminateProgressViewController;
  v4 = [(CRLiOSDeterminateProgressViewController *)&v6 initWithNibName:v3 bundle:0];

  if (v4)
  {
    [(CRLiOSDeterminateProgressViewController *)v4 setModalPresentationStyle:4];
    [(CRLiOSDeterminateProgressViewController *)v4 setTransitioningDelegate:v4];
    v4->_shouldTouchesOutsideCancel = 1;
  }
  return v4;
}

+ (id)progressViewControllerWithTitle:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 loadViewIfNeeded];
  [v11 setTitle:v10];

  [v11 setMessage:&stru_101538650];
  [v11 setProgress:v9];

  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"Cancel" value:0 table:0];
  [v11 setCancelButtonTitle:v13];

  [v11 setCancelHandler:v8];

  return v11;
}

+ (id)progressViewControllerWithTitle:(id)a3 crlProgress:(id)a4 cancelHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[NSProgress crl_progressWithCRLProgress:a4 totalUnitCount:100];
  id v11 = [a1 progressViewControllerWithTitle:v9 progress:v10 cancelHandler:v8];

  return v11;
}

- (void)setOverridePreferredStatusBarStyle:(int64_t)a3
{
  self->_didOverrideOverridePreferredStatusBarStyle = 1;
  self->_overridePreferredStatusBarStyle = a3;
}

- (int64_t)preferredStatusBarStyle
{
  if (self->_didOverrideOverridePreferredStatusBarStyle)
  {
    return [(CRLiOSDeterminateProgressViewController *)self overridePreferredStatusBarStyle];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)CRLiOSDeterminateProgressViewController;
    return [(CRLiOSDeterminateProgressViewController *)&v3 preferredStatusBarStyle];
  }
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSDeterminateProgressViewController;
  [(CRLiOSDeterminateProgressViewController *)&v8 viewDidLoad];
  [(CRLiOSDeterminateProgressViewController *)self setupControlColors];
  [(CRLiOSDeterminateProgressViewController *)self updateViewSize];
  objc_super v3 = [(CRLiOSDeterminateProgressViewController *)self view];
  v4 = [v3 layer];
  [v4 setCornerRadius:8.0];

  v5 = [(CRLiOSDeterminateProgressViewController *)self title];
  [(UILabel *)self->_titleLabel setText:v5];

  [(UILabel *)self->_messageLabel setText:&stru_101538650];
  cancelButton = self->_cancelButton;
  v7 = [(CRLiOSDeterminateProgressViewController *)self cancelButtonTitleNonNil];
  [(UIButton *)cancelButton setTitle:v7 forState:0];

  [(CRLiOSDeterminateProgressViewController *)self updateProgressViewWithProgress:self->_progress];
  [(CRLiOSDeterminateProgressViewController *)self updateMessageLabelWithProgress:self->_progress];
}

- (void)dealloc
{
  [(CRLiOSDeterminateProgressViewController *)self stopObservingProgress:self->_progress];
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSDeterminateProgressViewController;
  [(CRLiOSDeterminateProgressViewController *)&v3 dealloc];
}

- (void)setupControlColors
{
  objc_super v3 = +[UIColor secondarySystemGroupedBackgroundColor];
  v4 = [(CRLiOSDeterminateProgressViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = +[UIColor labelColor];
  [(CRLiOSDeterminateProgressViewController *)self setValue:v5 forKeyPath:@"titleLabel.textColor"];

  objc_super v6 = +[UIColor secondaryLabelColor];
  [(CRLiOSDeterminateProgressViewController *)self setValue:v6 forKeyPath:@"messageLabel.textColor"];

  id v7 = +[UIColor separatorColor];
  [(CRLiOSDeterminateProgressViewController *)self setValue:v7 forKeyPath:@"dividerLine.backgroundColor"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_10166E398 == a6)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v21 = sub_1003E92F8;
    v22 = &unk_1014CBE78;
    v23 = self;
    id v24 = v11;
    if (+[NSThread isMainThread])
    {
      v21((uint64_t)v20);
      goto LABEL_12;
    }
    v13 = v20;
LABEL_11:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    goto LABEL_12;
  }
  if (off_10166E3A0 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    v16 = sub_1003E9408;
    v17 = &unk_1014CBE78;
    v18 = self;
    id v19 = v11;
    if (+[NSThread isMainThread])
    {
      v16((uint64_t)block);
      goto LABEL_12;
    }
    v13 = block;
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)CRLiOSDeterminateProgressViewController;
  [(CRLiOSDeterminateProgressViewController *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_12:
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSDeterminateProgressViewController;
  id v4 = a3;
  [(CRLiOSDeterminateProgressViewController *)&v5 setTitle:v4];
  -[UILabel setText:](self->_titleLabel, "setText:", v4, v5.receiver, v5.super_class);
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return [(UILabel *)self->_messageLabel text];
}

- (UIFont)messageFont
{
  return [(UILabel *)self->_messageLabel font];
}

- (void)setMessageFont:(id)a3
{
}

- (void)setProgress:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  progress = self->_progress;
  if (v5 | (unint64_t)progress)
  {
    id v8 = (id)v5;
    unsigned __int8 v7 = [(NSProgress *)progress isEqual:v5];
    unint64_t v5 = (unint64_t)v8;
    if ((v7 & 1) == 0)
    {
      [(CRLiOSDeterminateProgressViewController *)self stopObservingProgress:self->_progress];
      objc_storeStrong((id *)&self->_progress, a3);
      [(CRLiOSDeterminateProgressViewController *)self updateProgressViewWithProgress:v8];
      self->_cancelled = 0;
      [(CRLiOSDeterminateProgressViewController *)self startObservingProgress:v8];
      unint64_t v5 = (unint64_t)v8;
    }
  }
}

- (void)startObservingProgress:(id)a3
{
  id v4 = off_10166E398;
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"cancelled" options:5 context:v4];
  [v5 addObserver:self forKeyPath:@"fractionCompleted" options:5 context:off_10166E398];
  [v5 addObserver:self forKeyPath:@"isIndeterminate" options:4 context:off_10166E3A0];
}

- (void)stopObservingProgress:(id)a3
{
  id v4 = off_10166E398;
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"cancelled" context:v4];
  [v5 removeObserver:self forKeyPath:@"fractionCompleted" context:off_10166E398];
  [v5 removeObserver:self forKeyPath:@"isIndeterminate" context:off_10166E3A0];
}

- (void)updateProgressViewWithProgress:(id)a3
{
  progressView = self->_progressView;
  if (a3) {
    -[UIProgressView setObservedProgress:](progressView, "setObservedProgress:");
  }
  else {
    [(UIProgressView *)progressView setProgress:0.0];
  }
}

- (void)updateProgressViewDisplayWithProgress:(id)a3
{
  unsigned int v4 = [a3 isIndeterminate];
  unsigned int v5 = [(UIActivityIndicatorView *)self->_spinnerView isHidden];
  uint64_t v6 = v4 & v5;
  if (v6 == 1)
  {
    [(UIActivityIndicatorView *)self->_spinnerView startAnimating];
  }
  else
  {
    if ((v4 | v5)) {
      return;
    }
    [(UIActivityIndicatorView *)self->_spinnerView stopAnimating];
  }
  progressView = self->_progressView;

  [(UIProgressView *)progressView setHidden:v6];
}

- (void)updateMessageLabelWithProgress:(id)a3
{
  id v7 = a3;
  unsigned int v4 = [(CRLiOSDeterminateProgressViewController *)self delegate];
  unsigned int v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 determinateProgressViewController:self messageLabelTextForProgress:v7];
    [(UILabel *)self->_messageLabel setText:v6];
  }
}

- (void)updateViewSize
{
  double v3 = dbl_101178360[!self->_cancelButtonVisible];
  -[CRLiOSDeterminateProgressViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v3);
  if ([(CRLiOSDeterminateProgressViewController *)self isViewLoaded])
  {
    unsigned int v4 = [(CRLiOSDeterminateProgressViewController *)self view];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;

    id v9 = [(CRLiOSDeterminateProgressViewController *)self view];
    [v9 setFrame:v6, v8, 270.0, v3];
  }
}

- (void)cancel:(id)a3
{
}

- (BOOL)cancelled
{
  return [(NSProgress *)self->_progress isCancelled] || self->_cancelled;
}

- (void)setCancelButtonVisible:(BOOL)a3
{
  if (self->_cancelButtonVisible != a3)
  {
    self->_cancelButtonVisible = a3;
    [(CRLiOSDeterminateProgressViewController *)self updateViewSize];
  }
}

- (void)setCancelButtonEnabled:(BOOL)a3
{
}

- (BOOL)isCancelButtonEnabled
{
  return [(UIButton *)self->_cancelButton isEnabled];
}

- (void)setCancelButtonTitle:(id)a3
{
  id v4 = a3;
  double v5 = self->_cancelButtonTitle;
  double v6 = (NSString *)v4;
  id v11 = v6;
  if (v5 == v6)
  {

    cancelButtonTitle = v11;
LABEL_9:

    double v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    double v8 = v11;
    goto LABEL_8;
  }
  unsigned __int8 v7 = [(NSString *)v5 isEqualToString:v6];

  double v8 = v11;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    id v10 = (NSString *)[(NSString *)v8 copy];
    cancelButtonTitle = self->_cancelButtonTitle;
    self->_cancelButtonTitle = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (id)cancelButtonTitleNonNil
{
  cancelButtonTitle = self->_cancelButtonTitle;
  if (cancelButtonTitle)
  {
    double v3 = cancelButtonTitle;
  }
  else
  {
    id v4 = +[NSBundle mainBundle];
    double v3 = [v4 localizedStringForKey:@"Cancel" value:0 table:0];
  }

  return v3;
}

- (void)runCancellationHandlers
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v14 = 8;
  double v3 = self->_cancellationHandlers;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [v8 second:v14];

        if (v9)
        {
          id v10 = [v8 first];

          if (v10)
          {
            id v11 = [v8 first];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            void block[2] = sub_1003E9CD8;
            block[3] = &unk_1014CBBB0;
            block[4] = v8;
            dispatch_async(v11, block);
          }
          else
          {
            id v12 = [v8 second];
            v12[2]();
          }
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  [*(id *)((char *)&self->super.super.super.isa + v14) removeAllObjects];
  cancelHandler = (void (**)(void))self->_cancelHandler;
  if (cancelHandler) {
    cancelHandler[2]();
  }
}

- (void)cancelAnimated:(BOOL)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v11 = sub_1003E9E20;
  id v12 = &unk_1014F6D90;
  id v14 = a4;
  id v15 = a5;
  v13 = self;
  BOOL v16 = a3;
  id v8 = v14;
  id v9 = v15;
  if (+[NSThread isMainThread]) {
    v11((uint64_t)&v10);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v10);
  }
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[TSDiOSModalPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v7];

  [(TSDiOSModalPresentationController *)v9 setDelegate:self];

  return v9;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ([v4 isAnimated])
  {
    [(CRLiOSDeterminateProgressViewController *)self transitionDuration:v4];
    double v5 = v6;
  }
  if ([(CRLiOSDeterminateProgressViewController *)self isBeingPresented])
  {
    id v7 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
    id v8 = [v7 view];
    [v4 finalFrameForViewController:v7];
    [v8 setFrame:];
    CGAffineTransformMakeScale(&v24, 1.2, 1.2);
    CGAffineTransform v23 = v24;
    [v8 setTransform:&v23];
    [v8 setAlpha:0.0];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1003EA5D8;
    v21[3] = &unk_1014CBBB0;
    id v22 = v8;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1003EA630;
    v19[3] = &unk_1014CE260;
    id v20 = v4;
    id v9 = v8;
    +[UIView animateWithDuration:0x20000 delay:v21 options:v19 animations:v5 completion:0.0];

LABEL_7:
    goto LABEL_17;
  }
  if ([(CRLiOSDeterminateProgressViewController *)self isBeingDismissed])
  {
    [v4 viewForKey:UITransitionContextFromViewKey];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1003EA63C;
    v17[3] = &unk_1014CBBB0;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003EA648;
    v15[3] = &unk_1014CE260;
    id v16 = v4;
    id v7 = v18;
    +[UIView animateWithDuration:0x20000 delay:v17 options:v15 animations:v5 completion:0.0];

    goto LABEL_7;
  }
  int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F6DB0);
  }
  id v11 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010ADBDC((uint64_t)v4, v10, v11);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F6DD0);
  }
  id v12 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101066770(v12, v10);
  }
  v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDeterminateProgressViewController animateTransition:]");
  id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDeterminateProgressViewController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v13, v14, 470, 0, "Unknown transition: %@", v4 file lineNumber isFatal description];

  [v4 completeTransition:1];
LABEL_17:
}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (id)adaptiveViewController
{
  double v3 = [[CRLiOSSheetViewController alloc] initWithContentViewController:self];
  [(CRLiOSSheetViewController *)v3 setShouldStretchWidth:0];
  [(CRLiOSSheetViewController *)v3 setShouldTouchesOutsideCancel:[(CRLiOSDeterminateProgressViewController *)self shouldTouchesOutsideCancel]];
  id v4 = [(CRLiOSDeterminateProgressViewController *)self cancelButtonTitleNonNil];
  [(CRLiOSSheetViewController *)v3 addCancelButtonWithTitle:v4];

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003EA814;
  v6[3] = &unk_1014CBF60;
  objc_copyWeak(&v7, &location);
  [(CRLiOSSheetViewController *)v3 setCancelHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v3;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return 5;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = [v4 presentedViewController];

  id v7 = sub_1002469D0(v5, v6);

  id v8 = [v7 adaptiveViewController];

  return v8;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v6 = a3;
  id v7 = (objc_class *)objc_opt_class();
  id v8 = [v6 presentedViewController];

  sub_10024715C(v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 setCancelButtonVisible:a4 == -1];
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
}

- (CRLiOSDeterminateProgressViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLiOSDeterminateProgressViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  self->_progressView = (UIProgressView *)a3;
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
  self->_spinnerView = (UIActivityIndicatorView *)a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  self->_titleLabel = (UILabel *)a3;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  self->_messageLabel = (UILabel *)a3;
}

- (UIView)dividerLine
{
  return self->_dividerLine;
}

- (void)setDividerLine:(id)a3
{
  self->_dividerLine = (UIView *)a3;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  self->_cancelButton = (UIButton *)a3;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (int64_t)overridePreferredStatusBarStyle
{
  return self->_overridePreferredStatusBarStyle;
}

- (BOOL)cancelButtonVisible
{
  return self->_cancelButtonVisible;
}

- (BOOL)shouldTouchesOutsideCancel
{
  return self->_shouldTouchesOutsideCancel;
}

- (void)setShouldTouchesOutsideCancel:(BOOL)a3
{
  self->_shouldTouchesOutsideCancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_cancelHandler, 0);

  objc_storeStrong((id *)&self->_cancellationHandlers, 0);
}

@end