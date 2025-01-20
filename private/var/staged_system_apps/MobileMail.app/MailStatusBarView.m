@interface MailStatusBarView
+ (id)log;
- (MFProgressToolbar)toolbarView;
- (MailStatusBarView)initWithFrame:(CGRect)a3;
- (int64_t)state;
- (void)dealloc;
- (void)mailStatusUndoViewUndoButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayWithStatusInfo:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTarget:(id)a3 withAction:(SEL)a4;
- (void)setToolbarView:(id)a3;
- (void)showIndeterminateStatusWithStatusInfo:(id)a3;
- (void)showProgressBarWithStatusInfo:(id)a3;
- (void)showUndoButtonWithStatusInfo:(id)a3;
- (void)showUpdateStatusWithStatusInfo:(id)a3;
- (void)switchSubviewToView:(id)a3 showProgress:(BOOL)a4;
@end

@implementation MailStatusBarView

- (void)setNeedsDisplay
{
  v3 = self->_delegate;
  if (objc_opt_respondsToSelector())
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1001254F8;
    v4[3] = &unk_100608D38;
    v4[4] = self;
    [(MailStatusBarViewDelegate *)v3 currentStatusInfoWithCompletion:v4];
  }
}

- (void)setNeedsDisplayWithStatusInfo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  v8 = self;
  v5 = +[EFScheduler mainThreadScheduler];
  [v5 performBlock:&v6];
}

- (void)setToolbarView:(id)a3
{
}

- (void)showIndeterminateStatusWithStatusInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 status];

  if (v5)
  {
    indeterminateView = self->_indeterminateView;
    if (!indeterminateView)
    {
      id v7 = [MailStatusIndeterminateView alloc];
      [(MailStatusBarView *)self bounds];
      v8 = -[MailStatusLabelView initWithFrame:](v7, "initWithFrame:");
      v9 = self->_indeterminateView;
      self->_indeterminateView = v8;

      [(MailStatusLabelView *)self->_indeterminateView setDelegate:self->_delegate];
      indeterminateView = self->_indeterminateView;
    }
    [(MailStatusIndeterminateView *)indeterminateView updateWithStatusInfo:v4];
    [(MailStatusBarView *)self switchSubviewToView:self->_indeterminateView showProgress:0];
  }
  else
  {
    v10 = +[MailStatusBarView log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = [v4 debugDescription];
      sub_10045B2BC(v11, v12, v10);
    }
  }
}

- (void)switchSubviewToView:(id)a3 showProgress:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(MailStatusBarView *)self bounds];
  [v6 setFrame:];
  id v7 = [(MailStatusBarView *)self subviews];
  if ([v7 count] == (id)1
    && ([v7 objectAtIndex:0], id v8 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v8,
                                                 v8 == v6))
  {
    [v6 setNeedsDisplay];
  }
  else
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v10 = objc_alloc_init((Class)NSMutableArray);
    [v9 addObjectsFromArray:v7];
    if (v6)
    {
      [v10 addObject:v6];
      if ([v9 containsObject:v6])
      {
        [v9 removeObject:v6];
      }
      else
      {
        [v6 setAlpha:0.0];
        [(MailStatusBarView *)self addSubview:v6];
      }
      [v6 setNeedsDisplay];
    }
    v11 = [(MailStatusBarView *)self toolbarView];
    [v11 showProgress:v4];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001B24C;
    v16[3] = &unk_100604618;
    id v17 = v9;
    id v12 = v10;
    id v18 = v12;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006130;
    v14[3] = &unk_100604550;
    id v13 = v17;
    id v15 = v13;
    +[UIView animateWithDuration:4 delay:v16 options:v14 animations:0.25 completion:0.0];
  }
}

- (MFProgressToolbar)toolbarView
{
  return self->_toolbarView;
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_delegate, a3);
  [(MailStatusLabelView *)self->_updateView setDelegate:self->_delegate];
  [(MailStatusLabelView *)self->_progressStatusView setDelegate:self->_delegate];
}

- (void)showUpdateStatusWithStatusInfo:(id)a3
{
  id v4 = a3;
  updateView = self->_updateView;
  id v9 = v4;
  if (!updateView)
  {
    id v6 = [MailStatusUpdateView alloc];
    [(MailStatusBarView *)self bounds];
    id v7 = -[MailStatusUpdateView initWithFrame:](v6, "initWithFrame:");
    id v8 = self->_updateView;
    self->_updateView = v7;

    [(MailStatusLabelView *)self->_updateView setDelegate:self->_delegate];
    updateView = self->_updateView;
    id v4 = v9;
  }
  [(MailStatusUpdateView *)updateView updateWithStatusInfo:v4];
  [(MailStatusBarView *)self switchSubviewToView:self->_updateView showProgress:0];
}

- (void)setTarget:(id)a3 withAction:(SEL)a4
{
  id v7 = a3;
  if (v7 && a4)
  {
    id v6 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v7 action:a4];
    [(MailStatusBarView *)self addGestureRecognizer:v6];
  }
  else
  {
    [(MailStatusBarView *)self removeAllGestureRecognizers];
  }
}

- (MailStatusBarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (pthread_main_np() != 1)
  {
    id v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MailStatusBarView.m" lineNumber:53 description:@"Current thread must be main"];
  }
  v18.receiver = self;
  v18.super_class = (Class)MailStatusBarView;
  id v9 = -[MailStatusBarView initWithFrame:](&v18, "initWithFrame:", x, y, width, height);
  id v10 = v9;
  if (v9)
  {
    [(MailStatusBarView *)v9 setOpaque:0];
    [(MailStatusBarView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(MailStatusBarView *)v10 widthAnchor];
    id v12 = [v11 constraintEqualToConstant:230.0];

    LODWORD(v13) = 1144750080;
    [v12 setPriority:v13];
    [v12 setActive:1];
    v14 = [(MailStatusBarView *)v10 heightAnchor];
    id v15 = [v14 constraintEqualToConstant:23.0];
    [v15 setActive:1];
  }
  return v10;
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001252B8;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699760 != -1) {
    dispatch_once(&qword_100699760, block);
  }
  v2 = (void *)qword_100699758;

  return v2;
}

- (void)showProgressBarWithStatusInfo:(id)a3
{
  id v4 = a3;
  progressStatusView = self->_progressStatusView;
  id v10 = v4;
  if (!progressStatusView)
  {
    id v6 = [MailStatusProgressBarView alloc];
    [(MailStatusBarView *)self bounds];
    id v7 = -[MailStatusLabelView initWithFrame:](v6, "initWithFrame:");
    id v8 = self->_progressStatusView;
    self->_progressStatusView = v7;

    [(MailStatusLabelView *)self->_progressStatusView setDelegate:self->_delegate];
    id v9 = [(MailStatusBarView *)self toolbarView];
    [(MailStatusProgressBarView *)self->_progressStatusView setToolbarView:v9];

    progressStatusView = self->_progressStatusView;
    id v4 = v10;
  }
  [(MailStatusProgressBarView *)progressStatusView updateWithStatusInfo:v4];
  [(MailStatusBarView *)self switchSubviewToView:self->_progressStatusView showProgress:1];
}

- (void)showUndoButtonWithStatusInfo:(id)a3
{
  id v8 = a3;
  undoView = self->_undoView;
  if (!undoView)
  {
    id v5 = [MailStatusUndoView alloc];
    [(MailStatusBarView *)self bounds];
    id v6 = -[MailStatusUndoView initWithFrame:](v5, "initWithFrame:");
    id v7 = self->_undoView;
    self->_undoView = v6;

    [(MailStatusUndoView *)self->_undoView setDelegate:self];
    undoView = self->_undoView;
  }
  [(MailStatusBarView *)self switchSubviewToView:undoView showProgress:0];
}

- (void)mailStatusUndoViewUndoButtonTapped:(id)a3
{
}

- (void)dealloc
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  [(MailStatusLabelView *)self->_progressStatusView setDelegate:0];
  [(MailStatusLabelView *)self->_updateView setDelegate:0];
  [(MailStatusLabelView *)self->_indeterminateView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MailStatusBarView;
  [(MailStatusBarView *)&v3 dealloc];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarView, 0);
  objc_storeStrong((id *)&self->_undoView, 0);
  objc_storeStrong((id *)&self->_indeterminateView, 0);
  objc_storeStrong((id *)&self->_updateView, 0);
  objc_storeStrong((id *)&self->_progressStatusView, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end