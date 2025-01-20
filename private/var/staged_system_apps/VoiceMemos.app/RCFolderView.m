@interface RCFolderView
- (BOOL)isCollectionViewInEditMode;
- (BOOL)isRecordingViewHidden;
- (NSLayoutConstraint)recordingViewBottomConstraint;
- (NSLayoutConstraint)wrapperViewBottomConstraint;
- (RCFolderView)initWithFrame:(CGRect)a3;
- (RCFolderViewDelegate)delegate;
- (RCRecordingView)recordingView;
- (UIView)recordingsCollectionViewControllerWrapperView;
- (void)_updateBottomLayoutForCollectionViewEditMode:(BOOL)a3 delegate:(id)a4;
- (void)_updateLibraryCollectionViewBottomConstraint;
- (void)setDelegate:(id)a3;
- (void)setIsCollectionViewInEditMode:(BOOL)a3;
- (void)setIsRecordingViewHidden:(BOOL)a3;
- (void)setRecordingView:(id)a3;
- (void)setRecordingViewBottomConstraint:(id)a3;
- (void)setRecordingsCollectionViewControllerWrapperView:(id)a3;
- (void)setWrapperViewBottomConstraint:(id)a3;
- (void)updateBottomLayoutForEditing:(BOOL)a3 delegate:(id)a4;
- (void)updateConstraints;
@end

@implementation RCFolderView

- (RCFolderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCFolderView;
  v3 = -[RCFolderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor systemBackgroundColor];
    [(RCFolderView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (void)setRecordingsCollectionViewControllerWrapperView:(id)a3
{
  v4 = (UIView *)a3;
  [(UIView *)self->_recordingsCollectionViewControllerWrapperView removeFromSuperview];
  recordingsCollectionViewControllerWrapperView = self->_recordingsCollectionViewControllerWrapperView;
  self->_recordingsCollectionViewControllerWrapperView = v4;
  objc_super v6 = v4;

  [(RCFolderView *)self addSubview:v6];

  [(RCFolderView *)self setNeedsUpdateConstraints];
}

- (void)setRecordingView:(id)a3
{
  v4 = (RCRecordingView *)a3;
  [(RCRecordingView *)self->_recordingView removeFromSuperview];
  recordingView = self->_recordingView;
  self->_recordingView = v4;
  objc_super v6 = v4;

  [(RCFolderView *)self addSubview:v6];
  [(RCFolderView *)self setNeedsUpdateConstraints];

  [(RCFolderView *)self layoutSubviews];
}

- (void)updateConstraints
{
  v24.receiver = self;
  v24.super_class = (Class)RCFolderView;
  [(RCFolderView *)&v24 updateConstraints];
  v3 = [(RCFolderView *)self recordingsCollectionViewControllerWrapperView];
  v4 = [(RCFolderView *)self recordingView];
  v5 = v4;
  if (v4
    && v3
    && [v4 isDescendantOfView:self]
    && [v3 isDescendantOfView:self])
  {
    objc_super v6 = [(RCFolderView *)self wrapperViewBottomConstraint];

    if (v6)
    {
      v7 = [(RCFolderView *)self wrapperViewBottomConstraint];
      [(RCFolderView *)self removeConstraint:v7];
    }
    v8 = [(RCFolderView *)self recordingViewBottomConstraint];

    if (v8)
    {
      v9 = [(RCFolderView *)self recordingViewBottomConstraint];
      [(RCFolderView *)self removeConstraint:v9];
    }
    v10 = +[NSLayoutConstraint constraintWithItem:v5 attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:0.0];
    [(RCFolderView *)self setRecordingViewBottomConstraint:v10];

    [v5 addLeadingToLeadingConstraintWithView:self padding:0.0];
    [v5 addTrailingToTrailingConstraintWithView:self padding:0.0];
    [v3 alignCenterTopToCenterTopOfView:self padding:0.0];
    [v3 constrainWidthWithView:self padding:0.0];
    v11 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v11 recordingControlSectionHeight];
    double v13 = v12;

    v14 = +[UIApplication sharedApplication];
    v15 = [v14 delegate];
    v16 = [v15 window];
    [v16 safeAreaInsets];
    double v18 = v17;

    v19 = +[NSLayoutConstraint constraintWithItem:v3 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
    v20 = +[NSLayoutConstraint constraintWithItem:v3 attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:-v13 - v18];
    LODWORD(v21) = 1132068864;
    [v20 setPriority:v21];
    [(RCFolderView *)self setWrapperViewBottomConstraint:v20];
    v25[0] = v19;
    v25[1] = v20;
    v22 = [(RCFolderView *)self recordingViewBottomConstraint];
    v25[2] = v22;
    v23 = +[NSArray arrayWithObjects:v25 count:3];
    [(RCFolderView *)self addConstraints:v23];

    [(RCFolderView *)self _updateLibraryCollectionViewBottomConstraint];
  }
}

- (NSLayoutConstraint)recordingViewBottomConstraint
{
  return self->_recordingViewBottomConstraint;
}

- (NSLayoutConstraint)wrapperViewBottomConstraint
{
  return self->_wrapperViewBottomConstraint;
}

- (RCRecordingView)recordingView
{
  return self->_recordingView;
}

- (void)setWrapperViewBottomConstraint:(id)a3
{
}

- (void)setRecordingViewBottomConstraint:(id)a3
{
}

- (UIView)recordingsCollectionViewControllerWrapperView
{
  return self->_recordingsCollectionViewControllerWrapperView;
}

- (void)_updateLibraryCollectionViewBottomConstraint
{
  unsigned __int8 v3 = [(RCFolderView *)self isCollectionViewInEditMode];
  v4 = [(RCFolderView *)self recordingView];
  id v5 = [v4 displayStyle];

  double v6 = 0.0;
  if ((v3 & 1) == 0 && v5)
  {
    v7 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v7 recordingControlSectionHeight];
    double v6 = v8;
  }
  v9 = +[UIApplication sharedApplication];
  v10 = [v9 delegate];
  v11 = [v10 window];
  [v11 safeAreaInsets];
  double v13 = v12;

  id v14 = [(RCFolderView *)self wrapperViewBottomConstraint];
  [v14 setConstant:-v6 - v13];
}

- (BOOL)isCollectionViewInEditMode
{
  return self->_isCollectionViewInEditMode;
}

- (void)setDelegate:(id)a3
{
}

- (void)setIsRecordingViewHidden:(BOOL)a3
{
  if (self->_isRecordingViewHidden != a3) {
    self->_isRecordingViewHidden = a3;
  }
}

- (void)_updateBottomLayoutForCollectionViewEditMode:(BOOL)a3 delegate:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(RCFolderView *)self recordingView];
  unsigned int v8 = [v7 isHidden];
  if (v4)
  {
    if ((v8 & 1) == 0)
    {
      [v6 willUpdateBottomLayoutForEditing];
      [(RCFolderView *)self setIsRecordingViewHidden:1];
      +[CATransaction animationDuration];
      double v10 = v9;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10005A618;
      v21[3] = &unk_100221C38;
      v21[4] = self;
      id v22 = v7;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10005A680;
      v18[3] = &unk_100221C88;
      id v19 = v22;
      id v20 = v6;
      +[UIView animateWithDuration:v21 animations:v18 completion:v10];

      id v11 = v22;
LABEL_6:
    }
  }
  else if (v8)
  {
    [v6 willUpdateBottomLayoutForEditing];
    [(RCFolderView *)self setIsRecordingViewHidden:0];
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(UINavigationControllerHideShowBarDuration * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005A6C0;
    block[3] = &unk_100221CB0;
    id v15 = v7;
    v16 = self;
    id v17 = v6;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);

    id v11 = v15;
    goto LABEL_6;
  }
  double v13 = [(RCFolderView *)self delegate];
  [v13 finishedTransitionToEditing:v4];
}

- (void)updateBottomLayoutForEditing:(BOOL)a3 delegate:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(RCFolderView *)self setIsCollectionViewInEditMode:v4];
  [(RCFolderView *)self _updateLibraryCollectionViewBottomConstraint];
  [(RCFolderView *)self _updateBottomLayoutForCollectionViewEditMode:v4 delegate:v6];
}

- (RCFolderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCFolderViewDelegate *)WeakRetained;
}

- (BOOL)isRecordingViewHidden
{
  return self->_isRecordingViewHidden;
}

- (void)setIsCollectionViewInEditMode:(BOOL)a3
{
  self->_isCollectionViewInEditMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_wrapperViewBottomConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordingsCollectionViewControllerWrapperView, 0);

  objc_storeStrong((id *)&self->_recordingView, 0);
}

@end