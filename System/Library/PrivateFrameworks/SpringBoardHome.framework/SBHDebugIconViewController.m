@interface SBHDebugIconViewController
- (BOOL)showsSquareCorners;
- (CGRect)visibleBounds;
- (SBHDebugIconViewController)initWithIcon:(id)a3;
- (SBIcon)icon;
- (SBIconImageInfo)iconImageInfo;
- (double)continuousCornerRadius;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SBHDebugIconViewController

- (SBHDebugIconViewController)initWithIcon:(id)a3
{
  id v5 = a3;
  v6 = [(SBHDebugIconViewController *)self initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_icon, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)SBHDebugIconViewController;
  [(SBHDebugIconViewController *)&v10 viewDidLoad];
  v3 = [(SBHDebugIconViewController *)self view];
  v4 = [(SBHDebugIconViewController *)self icon];
  id v5 = [v4 uniqueIdentifier];
  v6 = v5;
  if (v5)
  {
    double v7 = (double)([v5 hash] % 0xFFuLL) / 255.0;
  }
  else
  {
    uint32_t v8 = arc4random();
    double v7 = (double)v8 / 4294967300.0 + (1.0 - (double)v8 / 4294967300.0) * 0.0;
  }
  v9 = [MEMORY[0x1E4FB1618] colorWithHue:v7 saturation:0.8 brightness:0.8 alpha:1.0];
  [v3 setBackgroundColor:v9];
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(v3, v4, v5, v6, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    if ([(SBHDebugIconViewController *)self isViewLoaded])
    {
      id v13 = [(SBHDebugIconViewController *)self view];
      [v13 _setContinuousCornerRadius:v7];
    }
  }
}

- (CGRect)visibleBounds
{
  v2 = [(SBHDebugIconViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (SBIcon)icon
{
  return self->_icon;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (void).cxx_destruct
{
}

@end