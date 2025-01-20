@interface MapsProgressButton
- (BOOL)progressBarHidden;
- (MapsProgressButton)initWithFrame:(CGRect)a3;
- (double)progress;
- (int64_t)progressStyle;
- (unint64_t)fillStyle;
- (void)_customInit;
- (void)_insertProgressBarViewIfNecessary;
- (void)_updateProgressConstraints;
- (void)didMoveToWindow;
- (void)setFillStyle:(unint64_t)a3;
- (void)setProgress:(double)a3;
- (void)setProgressBarHidden:(BOOL)a3;
- (void)setProgressStyle:(int64_t)a3;
@end

@implementation MapsProgressButton

- (MapsProgressButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MapsProgressButton;
  v3 = -[MapsProgressButton initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MapsProgressButton *)v3 _customInit];
    v5 = v4;
  }

  return v4;
}

- (void)_customInit
{
  v3 = -[MapsProgressBarView initWithFrame:]([MapsProgressBarView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  progressBarView = self->_progressBarView;
  self->_progressBarView = v3;

  [(MapsProgressBarView *)self->_progressBarView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = self->_progressBarView;

  [(MapsProgressBarView *)v5 setUserInteractionEnabled:0];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MapsProgressButton;
  [(MapsThemeButton *)&v3 didMoveToWindow];
  [(MapsProgressButton *)self _insertProgressBarViewIfNecessary];
}

- (void)_insertProgressBarViewIfNecessary
{
  objc_super v3 = [(MapsProgressBarView *)self->_progressBarView superview];

  if (!v3)
  {
    [(MapsProgressButton *)self addSubview:self->_progressBarView];
    v4 = [(MapsProgressButton *)self titleLabel];
    [(MapsProgressButton *)self bringSubviewToFront:v4];

    v5 = [(MapsProgressBarView *)self->_progressBarView heightAnchor];
    v6 = [v5 constraintEqualToConstant:0.0];
    progressHeightConstraint = self->_progressHeightConstraint;
    self->_progressHeightConstraint = v6;

    v8 = [(MapsProgressBarView *)self->_progressBarView bottomAnchor];
    v9 = [(MapsProgressButton *)self bottomAnchor];
    v10 = [v8 constraintEqualToAnchor:v9 constant:0.0];
    progressBottomConstraint = self->_progressBottomConstraint;
    self->_progressBottomConstraint = v10;

    [(MapsProgressButton *)self _updateProgressConstraints];
    v12 = [(MapsProgressBarView *)self->_progressBarView leadingAnchor];
    v13 = [(MapsProgressButton *)self leadingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 constant:8.0];
    v20[0] = v14;
    v15 = [(MapsProgressBarView *)self->_progressBarView trailingAnchor];
    v16 = [(MapsProgressButton *)self trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:-8.0];
    v18 = self->_progressBottomConstraint;
    v20[1] = v17;
    v20[2] = v18;
    v20[3] = self->_progressHeightConstraint;
    v19 = +[NSArray arrayWithObjects:v20 count:4];
    +[NSLayoutConstraint activateConstraints:v19];
  }
}

- (void)_updateProgressConstraints
{
  int64_t v3 = [(MapsProgressButton *)self progressStyle];
  if (v3)
  {
    if (v3 != 1) {
      return;
    }
    double v4 = -8.0;
    double v5 = 4.0;
  }
  else
  {
    double v4 = -4.0;
    double v5 = 8.0;
  }
  [(NSLayoutConstraint *)self->_progressHeightConstraint setConstant:v5];
  progressBottomConstraint = self->_progressBottomConstraint;

  [(NSLayoutConstraint *)progressBottomConstraint setConstant:v4];
}

- (void)setProgressStyle:(int64_t)a3
{
  if (self->_progressStyle != a3)
  {
    self->_progressStyle = a3;
    [(MapsProgressButton *)self _updateProgressConstraints];
  }
}

- (double)progress
{
  [(MapsProgressBarView *)self->_progressBarView progress];
  return result;
}

- (void)setProgress:(double)a3
{
}

- (unint64_t)fillStyle
{
  return [(MapsProgressBarView *)self->_progressBarView fillStyle];
}

- (void)setFillStyle:(unint64_t)a3
{
}

- (BOOL)progressBarHidden
{
  return [(MapsProgressBarView *)self->_progressBarView isHidden];
}

- (void)setProgressBarHidden:(BOOL)a3
{
}

- (int64_t)progressStyle
{
  return self->_progressStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBottomConstraint, 0);
  objc_storeStrong((id *)&self->_progressHeightConstraint, 0);

  objc_storeStrong((id *)&self->_progressBarView, 0);
}

@end