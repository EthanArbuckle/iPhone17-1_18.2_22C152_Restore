@interface SFProgressAlertView
- (BOOL)isFinished;
- (NSURL)fileURL;
- (SFProgressAlertView)initWithFrame:(CGRect)a3;
- (SFProgressAlertViewDelegate)delegate;
- (void)addProgress:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeProgress:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)transferFinished;
- (void)transferFinishedAnimated;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SFProgressAlertView

- (SFProgressAlertView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SFProgressAlertView;
  v3 = -[SFProgressAlertView initWithFrame:](&v28, "initWithFrame:", a3.origin.x, a3.origin.y, 65.0, 65.0);
  if (v3)
  {
    os_log_t v4 = os_log_create("com.apple.useractivity", "SPBProgressUI");
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

    progressKeyPaths = v3->_progressKeyPaths;
    v3->_progressKeyPaths = (NSArray *)&off_100008518;

    v7 = [SFCircleProgressView alloc];
    [(SFProgressAlertView *)v3 frame];
    v8 = -[SFCircleProgressView initWithFrame:](v7, "initWithFrame:");
    progressView = v3->_progressView;
    v3->_progressView = v8;

    [(SFCircleProgressView *)v3->_progressView setShowProgressTray:1];
    [(SFCircleProgressView *)v3->_progressView setProgressLineWidth:3.0];
    [(SFProgressAlertView *)v3 addSubview:v3->_progressView];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = +[UIImage imageNamed:@"Glyph-Checkmark.png" inBundle:v10];

    v12 = v3->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found checkmark Image: %@", buf, 0xCu);
    }
    v13 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 15.0, 15.0);
    checkmarkImageView = v3->_checkmarkImageView;
    v3->_checkmarkImageView = v13;

    [(UIView *)v3->_checkmarkImageView setAlpha:0.0];
    v15 = v3->_checkmarkImageView;
    v16 = [(SFCircleProgressView *)v3->_progressView progressColor];
    [(UIView *)v15 setBackgroundColor:v16];

    [(UIView *)v3->_checkmarkImageView _setBackdropMaskViewFlags:7];
    v17 = v3->_checkmarkImageView;
    [(SFCircleProgressView *)v3->_progressView center];
    -[UIView setCenter:](v17, "setCenter:");
    [(SFProgressAlertView *)v3 addSubview:v3->_checkmarkImageView];
    v18 = +[CALayer layer];
    [(UIView *)v3->_checkmarkImageView bounds];
    objc_msgSend(v18, "setFrame:");
    id v19 = v11;
    objc_msgSend(v18, "setContents:", objc_msgSend(v19, "CGImage"));
    v20 = [(UIView *)v3->_checkmarkImageView layer];
    [v20 setMask:v18];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000048CC;
    v26[3] = &unk_100008268;
    v21 = v3;
    v27 = v21;
    uint64_t v22 = +[NSProgress _addSubscriberForCategory:@"UASharedPasteboard" usingPublishingHandler:v26];
    id progressToken = v21->_progressToken;
    v21->_id progressToken = (id)v22;

    v24 = v3->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "iOS progress view created", buf, 2u);
    }
  }
  return v3;
}

- (void)dealloc
{
  if (self->_progressToken)
  {
    [(SFProgressAlertView *)self removeProgress:self->_progress];
    +[NSProgress _removeSubscriber:self->_progressToken];
    id progressToken = self->_progressToken;
    self->_id progressToken = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SFProgressAlertView;
  [(SFProgressAlertView *)&v4 dealloc];
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFProgressAlertView;
  -[SFProgressAlertView willMoveToWindow:](&v5, "willMoveToWindow:");
  if (a3)
  {
    if (self->_finished) {
      [(SFProgressAlertView *)self transferFinished];
    }
  }
}

- (void)transferFinished
{
  [(UIView *)self->_checkmarkImageView setAlpha:1.0];
  [(SFCircleProgressView *)self->_progressView setProgress:1.0];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C70;
  block[3] = &unk_100008290;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)transferFinishedAnimated
{
  if (!self->_finished)
  {
    self->_finished = 1;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100004DA8;
    v5[3] = &unk_100008290;
    v5[4] = self;
    dispatch_time_t v3 = objc_retainBlock(v5);
    [(SFCircleProgressView *)self->_progressView progressPresentationValue];
    if (v4 >= 1.0) {
      ((void (*)(void *))v3[2])(v3);
    }
    else {
      [(SFCircleProgressView *)self->_progressView animateProgressCompletedWithCompletion:v3];
    }
  }
}

- (void)addProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"fractionCompleted" options:0 context:0];
}

- (void)removeProgress:(id)a3
{
  [a3 removeObserver:self forKeyPath:@"fractionCompleted" context:0];
  progress = self->_progress;
  self->_progress = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000503C;
  v11[3] = &unk_1000082E0;
  v11[4] = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (SFProgressAlertViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFProgressAlertViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_progressToken, 0);

  objc_storeStrong((id *)&self->_progressKeyPaths, 0);
}

@end