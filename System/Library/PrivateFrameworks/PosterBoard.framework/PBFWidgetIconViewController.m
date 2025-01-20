@interface PBFWidgetIconViewController
- (BOOL)showsSquareCorners;
- (BOOL)wantsLabelHidden;
- (CGRect)visibleBounds;
- (SBIconImageInfo)iconImageInfo;
- (UIImageView)iconImageView;
- (double)continuousCornerRadius;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setIconImageView:(id)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PBFWidgetIconViewController

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PBFWidgetIconViewController;
  [(PBFWidgetIconViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(PBFWidgetIconViewController *)self iconImageView];
  v4 = [(PBFWidgetIconViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)setIconImageView:(id)a3
{
  v4 = (UIImageView *)a3;
  [(UIImageView *)self->_iconImageView removeFromSuperview];
  iconImageView = self->_iconImageView;
  self->_iconImageView = v4;
  v6 = v4;

  id v7 = [(PBFWidgetIconViewController *)self view];
  [v7 addSubview:self->_iconImageView];
}

- (BOOL)wantsLabelHidden
{
  return 1;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  self->_iconImageInfo.size.width = v3;
  self->_iconImageInfo.size.height = v4;
  self->_iconImageInfo.scale = v5;
  self->_iconImageInfo.continuousCornerRadius = v6;
}

- (CGRect)visibleBounds
{
  double x = self->_visibleBounds.origin.x;
  double y = self->_visibleBounds.origin.y;
  double width = self->_visibleBounds.size.width;
  double height = self->_visibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void).cxx_destruct
{
}

@end