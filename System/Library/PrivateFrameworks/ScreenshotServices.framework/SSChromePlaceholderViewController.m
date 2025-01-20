@interface SSChromePlaceholderViewController
- (BOOL)_canShowWhileLocked;
- (CGRect)screenshotContentFrame;
- (UIColor)cropsCornerColor;
- (double)contentAlpha;
- (double)cropsCornerContentPadding;
- (double)cropsCornerEdgeLength;
- (double)cropsCornerLineWidth;
- (int)_preferredStatusBarVisibility;
- (int64_t)backgroundBlurEffectStyle;
- (int64_t)preferredStatusBarStyle;
- (void)setContentAlpha:(double)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SSChromePlaceholderViewController

- (int64_t)preferredStatusBarStyle
{
  return +[SSChromeHelper statusBarStyle];
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SSChromePlaceholderViewController;
  [(SSChromePlaceholderViewController *)&v12 viewDidLayoutSubviews];
  v3 = [(SSChromePlaceholderViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[SSChromePlaceholderView setFrame:](self->_placeholderView, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)SSChromePlaceholderViewController;
  [(SSChromePlaceholderViewController *)&v10 viewDidLoad];
  v3 = [(SSChromePlaceholderViewController *)self view];
  [v3 bounds];
  double v8 = -[SSChromePlaceholderView initWithFrame:]([SSChromePlaceholderView alloc], "initWithFrame:", v4, v5, v6, v7);
  placeholderView = self->_placeholderView;
  self->_placeholderView = v8;

  [v3 addSubview:self->_placeholderView];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int)_preferredStatusBarVisibility
{
  v3 = [(SSChromePlaceholderViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v6 = [(SSChromePlaceholderViewController *)self view];
  [v6 bounds];
  BOOL v8 = v5 < v7;

  double v9 = [(SSChromePlaceholderViewController *)self traitCollection];
  LODWORD(v3) = +[SSChromeHelper statusBarVisibilityForTraitCollection:v9 isPortrait:v8];

  return (int)v3;
}

- (int64_t)backgroundBlurEffectStyle
{
  return +[SSChromeHelper backgroundBlurEffectStyle];
}

- (double)contentAlpha
{
  [(SSChromePlaceholderView *)self->_placeholderView contentAlpha];
  return result;
}

- (UIColor)cropsCornerColor
{
  v2 = +[SSMaterial cropHandle];
  v3 = [v2 color];

  return (UIColor *)v3;
}

- (double)cropsCornerContentPadding
{
  +[SSChromeHelper cropsHandleOutset];
  return result;
}

- (double)cropsCornerEdgeLength
{
  +[SSChromeHelper cropsCornerLength];
  return result;
}

- (double)cropsCornerLineWidth
{
  +[SSChromeHelper cropsCornerWidth];
  return result;
}

- (CGRect)screenshotContentFrame
{
  v3 = [(SSChromePlaceholderViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(SSChromePlaceholderViewController *)self traitCollection];
  [v20 displayScale];

  +[SSChromeHelper availableRectForFullscreenContent:layoutBounds:bleedToBottom:topBarHeight:bottomBarHeight:userInterfaceIdiom:multipleScreenshots:](SSChromeHelper, "availableRectForFullscreenContent:layoutBounds:bleedToBottom:topBarHeight:bottomBarHeight:userInterfaceIdiom:multipleScreenshots:", 0, 1, 0, v5, v7, v9, v11, v5 + v15, v7 + v13, v9 - (v15 + v19), v11 - (v13 + v17), 0, 0);
  SSizeToFitSizeInAspectRatioOfSize(v9, v11, v21, v22);
  SSRoundSizeToScale();
  UIRectCenteredIntegralRect();
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)setContentAlpha:(double)a3
{
}

- (void).cxx_destruct
{
}

@end