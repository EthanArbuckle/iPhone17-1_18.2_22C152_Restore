@interface SBActivityAmbientFullOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasBackgroundTintColor;
- (BOOL)_isWidgetBasedActivity;
- (BOOL)_itemIsFirstPartyActivity:(id)a3;
- (CGRect)_grabberViewFrame;
- (PLPlatterView)platterView;
- (UIView)backgroundTintView;
- (unint64_t)supportedInterfaceOrientations;
- (void)_layoutSubviews;
- (void)_updateBackgroundTintViewWithBounds:(CGRect)a3 color:(id)a4;
- (void)activityHostViewControllerBackgroundTintColorDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SBActivityAmbientFullOverlayViewController

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)SBActivityAmbientFullOverlayViewController;
  [(SBActivityViewController *)&v22 viewDidLoad];
  v3 = [(SBActivityViewController *)self activityItem];
  BOOL v4 = [(SBActivityAmbientFullOverlayViewController *)self _itemIsFirstPartyActivity:v3];

  if (!v4)
  {
    v5 = [(SBActivityViewController *)self activityHostViewController];
    v6 = [v5 backgroundTintColor];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F428B8] blackColor];
    }
    v9 = v8;

    if (v9) {
      uint64_t v10 = 22;
    }
    else {
      uint64_t v10 = 1;
    }
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    backgroundTintView = self->_backgroundTintView;
    self->_backgroundTintView = v11;

    [(UIView *)self->_backgroundTintView setBackgroundColor:v9];
    v13 = [(SBActivityAmbientFullOverlayViewController *)self view];
    [v13 addSubview:self->_backgroundTintView];

    v14 = [(SBActivityAmbientFullOverlayViewController *)self view];
    [v14 sendSubviewToBack:self->_backgroundTintView];

    v15 = (PLPlatterView *)[objc_alloc(MEMORY[0x1E4F91460]) initWithRecipe:v10];
    platterView = self->_platterView;
    self->_platterView = v15;

    [(PLPlatterView *)self->_platterView setUsesBackgroundView:1];
    [(PLPlatterView *)self->_platterView setOverrideUserInterfaceStyle:2];
    [(PLPlatterView *)self->_platterView setMaterialGroupNameBase:@"Activities"];
    v17 = [(SBActivityAmbientFullOverlayViewController *)self view];
    [v17 addSubview:self->_platterView];

    v18 = [(SBActivityAmbientFullOverlayViewController *)self view];
    [v18 sendSubviewToBack:self->_platterView];
  }
  v19 = (PLGrabberView *)objc_alloc_init(MEMORY[0x1E4F91438]);
  grabberView = self->_grabberView;
  self->_grabberView = v19;

  v21 = [(SBActivityAmbientFullOverlayViewController *)self view];
  [v21 addSubview:self->_grabberView];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBActivityAmbientFullOverlayViewController;
  [(SBActivityViewController *)&v3 viewWillLayoutSubviews];
  [(SBActivityAmbientFullOverlayViewController *)self _layoutSubviews];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (void)_layoutSubviews
{
  objc_super v3 = [(SBActivityAmbientFullOverlayViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  platterView = self->_platterView;
  if (platterView) {
    -[PLPlatterView setFrame:](platterView, "setFrame:", v5, v7, v9, v11);
  }
  if ([(SBActivityAmbientFullOverlayViewController *)self _hasBackgroundTintColor])
  {
    v13 = [(SBActivityViewController *)self activityHostViewController];
    v14 = [v13 backgroundTintColor];
  }
  else
  {
    if (![(SBActivityAmbientFullOverlayViewController *)self _isWidgetBasedActivity]) {
      goto LABEL_8;
    }
    v14 = [MEMORY[0x1E4F428B8] blackColor];
  }
  -[SBActivityAmbientFullOverlayViewController _updateBackgroundTintViewWithBounds:color:](self, "_updateBackgroundTintViewWithBounds:color:", v14, v5, v7, v9, v11);

LABEL_8:
  grabberView = self->_grabberView;
  [(SBActivityAmbientFullOverlayViewController *)self _grabberViewFrame];
  -[PLGrabberView setFrame:](grabberView, "setFrame:");
  id v16 = [(SBActivityAmbientFullOverlayViewController *)self view];
  [v16 bringSubviewToFront:self->_grabberView];
}

- (void)_updateBackgroundTintViewWithBounds:(CGRect)a3 color:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  backgroundTintView = self->_backgroundTintView;
  id v15 = v9;
  if (!backgroundTintView)
  {
    double v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    v12 = self->_backgroundTintView;
    self->_backgroundTintView = v11;

    [(UIView *)self->_backgroundTintView removeFromSuperview];
    v13 = [(SBActivityAmbientFullOverlayViewController *)self view];
    [v13 addSubview:self->_backgroundTintView];

    v14 = [(SBActivityAmbientFullOverlayViewController *)self view];
    [v14 sendSubviewToBack:self->_backgroundTintView];

    backgroundTintView = self->_backgroundTintView;
    if (self->_platterView)
    {
      -[UIView bringSubviewToFront:](backgroundTintView, "bringSubviewToFront:");
      backgroundTintView = self->_backgroundTintView;
    }
    id v9 = v15;
  }
  [(UIView *)backgroundTintView setBackgroundColor:v9];
  -[UIView setBounds:](self->_backgroundTintView, "setBounds:", x, y, width, height);
  -[UIView setFrame:](self->_backgroundTintView, "setFrame:", x, y, width, height);
}

- (BOOL)_hasBackgroundTintColor
{
  v2 = [(SBActivityViewController *)self activityHostViewController];
  objc_super v3 = [v2 backgroundTintColor];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_isWidgetBasedActivity
{
  v2 = [(SBActivityViewController *)self activityItem];
  objc_super v3 = [v2 descriptor];
  BOOL v4 = [v3 contentType] == 0;

  return v4;
}

- (BOOL)_itemIsFirstPartyActivity:(id)a3
{
  objc_super v3 = [a3 descriptor];
  BOOL v4 = [v3 platterTargetBundleIdentifier];

  double v5 = +[SBActivityManager sharedInstance];
  double v6 = [v5 firstPartyActivityGroupingIdentifiers];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (CGRect)_grabberViewFrame
{
  objc_super v3 = [(SBActivityAmbientFullOverlayViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v25.origin.double x = v5;
  v25.origin.double y = v7;
  v25.size.double width = v9;
  v25.size.double height = v11;
  CGRectGetMidX(v25);
  v26.origin.double x = v5;
  v26.origin.double y = v7;
  v26.size.double width = v9;
  v26.size.double height = v11;
  CGRectGetMaxY(v26);
  v12 = [(SBActivityAmbientFullOverlayViewController *)self traitCollection];
  [v12 displayScale];
  BSRectRoundForScale();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)activityHostViewControllerBackgroundTintColorDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBActivityAmbientFullOverlayViewController;
  [(SBActivityViewController *)&v6 activityHostViewControllerBackgroundTintColorDidChange:a3];
  double v4 = [(SBActivityAmbientFullOverlayViewController *)self view];
  [v4 setNeedsLayout];

  CGFloat v5 = [(SBActivityAmbientFullOverlayViewController *)self view];
  [v5 layoutIfNeeded];
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (UIView)backgroundTintView
{
  return self->_backgroundTintView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTintView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
}

@end