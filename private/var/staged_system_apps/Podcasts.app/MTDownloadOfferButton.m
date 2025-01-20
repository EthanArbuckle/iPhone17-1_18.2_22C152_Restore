@interface MTDownloadOfferButton
- (MTDownloadOfferButton)initWithFrame:(CGRect)a3;
- (MusicLibraryAddKeepLocalControlStatus)_currentStatus;
- (UIEdgeInsets)touchInsets;
- (double)progress;
- (void)_updateUI;
- (void)setProgress:(double)a3;
- (void)setProgressType:(int64_t)a3 animated:(BOOL)a4;
- (void)setTouchInsets:(UIEdgeInsets)a3;
@end

@implementation MTDownloadOfferButton

- (MTDownloadOfferButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTDownloadOfferButton;
  v3 = -[MTDownloadOfferButton initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_progress = 0.0;
    v3->_progressType = 0;
    [(MTDownloadOfferButton *)v3 setDisplayStyle:0];
    [(MTDownloadOfferButton *)v4 setDownloadingCenterIconType:1];
    v5 = +[UIColor clearColor];
    [(MTDownloadOfferButton *)v4 setBackgroundColor:v5];

    [(MTDownloadOfferButton *)v4 setExclusiveTouch:1];
    [(MTDownloadOfferButton *)v4 setControlHitOutsets:8.0];
    [(MTDownloadOfferButton *)v4 _updateUI];
    [(MTDownloadOfferButton *)v4 sizeToFit];
  }
  return v4;
}

- (void)setProgress:(double)a3
{
  if (vabdd_f64(self->_progress, a3) > 2.22044605e-16)
  {
    int64_t progressType = self->_progressType;
    id v6 = [(MTDownloadOfferButton *)self _currentStatus];
    self->_progress = a3;
    [(MTDownloadOfferButton *)self _logStateChange:@"progress", progressType, v6, v7 oldButtonType oldStatus];
    [(MTDownloadOfferButton *)self _updateUI];
  }
}

- (void)setProgressType:(int64_t)a3 animated:(BOOL)a4
{
  if (a4) {
    unsigned __int8 v6 = +[UIView areAnimationsEnabled];
  }
  else {
    unsigned __int8 v6 = 0;
  }
  int64_t progressType = self->_progressType;
  if (progressType != a3)
  {
    id v8 = [(MTDownloadOfferButton *)self _currentStatus];
    self->_int64_t progressType = a3;
    [(MTDownloadOfferButton *)self _logStateChange:@"buttonType", progressType, v8, v9 oldButtonType oldStatus];
    if (v6)
    {
      [(MTDownloadOfferButton *)self _updateUI];
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100103914;
      v10[3] = &unk_10054D570;
      v10[4] = self;
      +[UIView performWithoutAnimation:v10];
    }
  }
}

- (void)_updateUI
{
  BOOL v3 = +[UIView areAnimationsEnabled];
  id v5 = [(MTDownloadOfferButton *)self _currentStatus];

  -[MTDownloadOfferButton setControlStatus:animated:](self, "setControlStatus:animated:", v5, v4, v3);
}

- (MusicLibraryAddKeepLocalControlStatus)_currentStatus
{
  int64_t progressType = self->_progressType;
  if ((unint64_t)(progressType - 1) > 3)
  {
    double progress = 0.0;
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = progressType + 2;
    double progress = self->_progress;
  }
  result.var1 = progress;
  result.var0 = v4;
  return result;
}

- (double)progress
{
  return self->_progress;
}

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

@end