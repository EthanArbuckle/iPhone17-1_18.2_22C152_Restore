@interface BKLibraryBookCoverViewController
- (BKClassicScrubberTrack)progressTrack;
- (BKLibraryBookCoverViewController)initWithCoder:(id)a3;
- (BKLibraryBookCoverViewController)initWithCoverImage:(id)a3 shadowImage:(id)a4;
- (BKLibraryBookCoverViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BKLibraryBookCoverViewControllerDelegate)delegate;
- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented;
- (BOOL)coverAnimationHostIsFullyVisible:(id)a3;
- (BOOL)coverAnimationHostWantsScrollOnClose;
- (BOOL)coverAnimationSourceUseLargeCover;
- (BOOL)isNightMode;
- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)showBackButton;
- (BOOL)showBackChevron;
- (BOOL)wallpaperStyleWantsTransparentLightEffect;
- (CGRect)coverAnimationSourceFrame;
- (NSLayoutConstraint)imageBottomConstraint;
- (NSLayoutConstraint)imageLeadingConstraint;
- (NSLayoutConstraint)imageTopConstraint;
- (NSLayoutConstraint)imageTrailingConstraint;
- (NSLayoutConstraint)progressTrackBottomConstraint;
- (NSLayoutConstraint)progressTrackLeadingConstraint;
- (NSLayoutConstraint)progressTrackTrailingConstraint;
- (NSNumber)progressValue;
- (NSString)progressText;
- (UIColor)backgroundColor;
- (UIColor)savedBackgroundColor;
- (UIImage)coverImage;
- (UIImage)fallbackImage;
- (UIImage)shadowImage;
- (UIImageView)imageView;
- (UIImageView)shadowImageView;
- (UINavigationBar)navBarForBackButton;
- (UINavigationItem)navBarBackItem;
- (UIViewController)coverImageViewController;
- (UIViewController)statusBarOverrideViewController;
- (double)progressTrackBottomSpecDistance;
- (double)progressTrackLeadingSpecDistance;
- (double)progressTrackTrailingSpecDistance;
- (id)coverAnimationHostTopViewsToFadeOut;
- (id)coverAnimationSourceImage;
- (int64_t)coverAnimationSourceAlignment;
- (int64_t)positionForBar:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (void)_adjustShadowForCurrentCoverBounds;
- (void)_setupShadowEffects;
- (void)_updateBackButtonAnimated:(BOOL)a3;
- (void)_updateImage:(id)a3;
- (void)_updateProgress;
- (void)_updateShadowImage:(id)a3;
- (void)bookOpenRevealDidEnd;
- (void)coverAnimationSourceFinalize;
- (void)coverAnimationSourcePrepare;
- (void)dealloc;
- (void)navigationBar:(id)a3 didPopItem:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageBottomConstraint:(id)a3;
- (void)setImageLeadingConstraint:(id)a3;
- (void)setImageTopConstraint:(id)a3;
- (void)setImageTrailingConstraint:(id)a3;
- (void)setImageView:(id)a3;
- (void)setNavBarBackItem:(id)a3;
- (void)setNavBarForBackButton:(id)a3;
- (void)setProgressText:(id)a3;
- (void)setProgressTrack:(id)a3;
- (void)setProgressTrackBottomConstraint:(id)a3;
- (void)setProgressTrackBottomSpecDistance:(double)a3;
- (void)setProgressTrackLeadingConstraint:(id)a3;
- (void)setProgressTrackLeadingSpecDistance:(double)a3;
- (void)setProgressTrackTrailingConstraint:(id)a3;
- (void)setProgressTrackTrailingSpecDistance:(double)a3;
- (void)setProgressValue:(id)a3;
- (void)setSavedBackgroundColor:(id)a3;
- (void)setShadowImageView:(id)a3;
- (void)setShowBackButton:(BOOL)a3;
- (void)setShowBackChevron:(BOOL)a3;
- (void)setStatusBarOverrideViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation BKLibraryBookCoverViewController

- (BKLibraryBookCoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (BKLibraryBookCoverViewController)initWithCoder:(id)a3
{
  return 0;
}

- (BKLibraryBookCoverViewController)initWithCoverImage:(id)a3 shadowImage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookCoverViewController;
  v9 = [(BKLibraryBookCoverViewController *)&v14 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coverImage, a3);
    objc_storeStrong((id *)&v10->_shadowImage, a4);
    uint64_t v11 = +[UIColor systemBackgroundColor];
    backgroundColor = v10->_backgroundColor;
    v10->_backgroundColor = (UIColor *)v11;
  }
  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BKLibraryBookCoverViewController;
  [(BKLibraryBookCoverViewController *)&v2 dealloc];
}

- (BOOL)isNightMode
{
  objc_super v2 = [(BKLibraryBookCoverViewController *)self traitCollection];
  unsigned __int8 v3 = [v2 bc_userInterfaceStyleDark];

  return v3;
}

- (void)_updateImage:(id)a3
{
  p_imageView = &self->_imageView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_imageView);
  [WeakRetained setImage:v5];

  id v7 = objc_loadWeakRetained((id *)p_imageView);
  id v8 = [v7 image];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  v13 = [(BKLibraryBookCoverViewController *)self view];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;

  if (v10 / v12 <= v15 / v17)
  {
    if (v10 / v12 < v15 / v17) {
      double v15 = v10 * (v17 / v12);
    }
  }
  else
  {
    double v17 = v12 * (v15 / v10);
  }

  -[BKLibraryBookCoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", v15, v17);
}

- (void)_updateShadowImage:(id)a3
{
}

- (void)_adjustShadowForCurrentCoverBounds
{
  unsigned __int8 v3 = [(BKLibraryBookCoverViewController *)self shadowImage];

  if (v3)
  {
    shadowImage = self->_shadowImage;
    id v14 = [(BKLibraryBookCoverViewController *)self imageView];
    [v14 frame];
    -[UIImage bk_frameForImageFittedInFrame:](shadowImage, "bk_frameForImageFittedInFrame:");
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(BKLibraryBookCoverViewController *)self shadowImageView];
    [v13 setFrame:v6, v8, v10, v12];
  }
}

- (void)_setupShadowEffects
{
  unsigned __int8 v3 = [(BKLibraryBookCoverViewController *)self shadowImageView];
  +[BKBookBloomOpenAnimator setBlurRadius:v3 forView:60.0];

  id v4 = [(BKLibraryBookCoverViewController *)self shadowImageView];
  +[BKBookBloomOpenAnimator setBrightnessFilter:v4 forView:-0.6];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookCoverViewController;
  -[BKLibraryBookCoverViewController viewDidAppear:](&v5, "viewDidAppear:");
  [(BKLibraryBookCoverViewController *)self _updateBackButtonAnimated:v3];
}

- (void)viewDidLoad
{
  v47.receiver = self;
  v47.super_class = (Class)BKLibraryBookCoverViewController;
  [(BKLibraryBookCoverViewController *)&v47 viewDidLoad];
  BOOL v3 = +[UIColor labelColor];
  id v4 = (UIViewController *)[objc_alloc((Class)UIViewController) initWithNibName:0 bundle:0];
  coverImageViewController = self->_coverImageViewController;
  self->_coverImageViewController = v4;

  double v6 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:self->_shadowImage];
  shadowImageView = self->_shadowImageView;
  self->_shadowImageView = v6;

  [(UIImageView *)self->_shadowImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BKLibraryBookCoverViewController *)self _setupShadowEffects];
  double v8 = [(BKLibraryBookCoverViewController *)self view];
  double v9 = [(BKLibraryBookCoverViewController *)self shadowImageView];
  double v10 = [(BKLibraryBookCoverViewController *)self imageView];
  [v8 insertSubview:v9 belowSubview:v10];

  double v11 = [(BKLibraryBookCoverViewController *)self progressTrackBottomConstraint];
  [v11 constant];
  -[BKLibraryBookCoverViewController setProgressTrackBottomSpecDistance:](self, "setProgressTrackBottomSpecDistance:");

  double v12 = [(BKLibraryBookCoverViewController *)self progressTrackLeadingConstraint];
  [v12 constant];
  -[BKLibraryBookCoverViewController setProgressTrackLeadingSpecDistance:](self, "setProgressTrackLeadingSpecDistance:");

  v13 = [(BKLibraryBookCoverViewController *)self progressTrackTrailingConstraint];
  [v13 constant];
  -[BKLibraryBookCoverViewController setProgressTrackTrailingSpecDistance:](self, "setProgressTrackTrailingSpecDistance:");

  id v14 = +[BKBookBloomOpenAnimator backgroundColorForZoomedBookCover];
  double v15 = [(BKLibraryBookCoverViewController *)self view];
  [v15 setBackgroundColor:v14];

  if (self->_coverImage || self->_fallbackImage) {
    -[BKLibraryBookCoverViewController _updateImage:](self, "_updateImage:");
  }
  [(BKLibraryBookCoverViewController *)self _updateShadowImage:self->_shadowImage];
  double v16 = [(BKLibraryBookCoverViewController *)self progressTrack];
  [v16 setLoadingProgress:1.0];

  double v17 = [(BKLibraryBookCoverViewController *)self progressTrack];
  [v17 setReadingProgress:0.0];

  v18 = [(BKLibraryBookCoverViewController *)self progressTrack];
  [v18 setAlpha:0.0];

  v19 = [(BKLibraryBookCoverViewController *)self progressTrack];
  [v19 setThickness:3.0];

  v20 = [(BKLibraryBookCoverViewController *)self progressTrack];
  [v20 setRoundEndCaps:1];

  v21 = [(BKLibraryBookCoverViewController *)self progressTrack];
  [v21 setTrackForegroundColor:v3];

  v22 = +[UIColor colorWithRed:0.0156862745 green:0.0156862745 blue:0.0588235294 alpha:0.2];
  v23 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2];
  v24 = +[UIColor bc_dynamicColorWithLightColor:v22 darkColor:v23];

  v25 = [(BKLibraryBookCoverViewController *)self progressTrack];
  [v25 setTrackBackgroundColor:v24];

  [(BKLibraryBookCoverViewController *)self _updateProgress];
  id v26 = objc_alloc_init((Class)UINavigationBar);
  v27 = objc_opt_new();
  [v26 setBackgroundImage:v27 forBarMetrics:0];

  [v26 setTranslucent:1];
  [v26 setTintColor:v3];
  [v26 _setHidesShadow:1];
  [v26 setDelegate:self];
  [v26 setAlpha:0.0];
  v28 = [(BKLibraryBookCoverViewController *)self view];
  [v28 addSubview:v26];

  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  v29 = [v26 leftAnchor];
  v30 = [(BKLibraryBookCoverViewController *)self view];
  v31 = [v30 leftAnchor];
  v32 = [v29 constraintLessThanOrEqualToAnchor:v31];
  [v32 setActive:1];

  v33 = [v26 rightAnchor];
  v34 = [(BKLibraryBookCoverViewController *)self view];
  v35 = [v34 rightAnchor];
  v36 = [v33 constraintLessThanOrEqualToAnchor:v35];
  [v36 setActive:1];

  v37 = [v26 topAnchor];
  v38 = [(BKLibraryBookCoverViewController *)self view];
  v39 = [v38 safeAreaLayoutGuide];
  v40 = [v39 topAnchor];
  v41 = [v37 constraintLessThanOrEqualToAnchor:v40];
  [v41 setActive:1];

  v42 = [(BKLibraryBookCoverViewController *)self navBarBackItem];
  v48[0] = v42;
  v43 = objc_opt_new();
  v48[1] = v43;
  v44 = +[NSArray arrayWithObjects:v48 count:2];
  [v26 setItems:v44 animated:0];

  if (![(BKLibraryBookCoverViewController *)self showBackChevron])
  {
    v45 = objc_opt_new();
    [v26 setBackIndicatorImage:v45];

    v46 = objc_opt_new();
    [v26 setBackIndicatorTransitionMaskImage:v46];
  }
  [(BKLibraryBookCoverViewController *)self setNavBarForBackButton:v26];
}

- (void)viewWillLayoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)BKLibraryBookCoverViewController;
  [(BKLibraryBookCoverViewController *)&v51 viewWillLayoutSubviews];
  [(BKLibraryBookCoverViewController *)self coverAnimationSourceFrame];
  double v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(BKLibraryBookCoverViewController *)self view];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;

  v52.origin.x = v4;
  v52.origin.y = v6;
  v52.size.width = v8;
  v52.size.height = v10;
  double v16 = v15 - CGRectGetMaxY(v52);
  v53.origin.x = v4;
  v53.origin.y = v6;
  v53.size.width = v8;
  v53.size.height = v10;
  double v17 = v13 - CGRectGetMaxX(v53);
  v18 = [(BKLibraryBookCoverViewController *)self imageTopConstraint];
  [v18 setConstant:v6];

  v19 = [(BKLibraryBookCoverViewController *)self imageBottomConstraint];
  [v19 setConstant:v16];

  v20 = [(BKLibraryBookCoverViewController *)self imageLeadingConstraint];
  [v20 setConstant:v4];

  v21 = [(BKLibraryBookCoverViewController *)self imageTrailingConstraint];
  [v21 setConstant:v17];

  v22 = [(BKLibraryBookCoverViewController *)self traitCollection];
  id v23 = [v22 horizontalSizeClass];

  if (v23 == (id)2)
  {
    double v24 = (v13 + -320.0) * 0.5;
    [(BKLibraryBookCoverViewController *)self progressTrackBottomSpecDistance];
    double v26 = v16 + v25 + -32.0;
    v27 = [(BKLibraryBookCoverViewController *)self progressTrackBottomConstraint];
    [v27 setConstant:v26];

    [(BKLibraryBookCoverViewController *)self progressTrackLeadingSpecDistance];
    double v29 = v24 + v28;
    v30 = [(BKLibraryBookCoverViewController *)self progressTrackLeadingConstraint];
    [v30 setConstant:v29];

    [(BKLibraryBookCoverViewController *)self progressTrackTrailingSpecDistance];
    double v32 = v24 + v31;
  }
  else
  {
    [(BKLibraryBookCoverViewController *)self progressTrackBottomSpecDistance];
    double v34 = v16 + v33 + -24.0;
    v35 = [(BKLibraryBookCoverViewController *)self progressTrackBottomConstraint];
    [v35 setConstant:v34];

    [(BKLibraryBookCoverViewController *)self progressTrackLeadingSpecDistance];
    double v37 = v4 + v36 + 1.0;
    v38 = [(BKLibraryBookCoverViewController *)self progressTrackLeadingConstraint];
    [v38 setConstant:v37];

    [(BKLibraryBookCoverViewController *)self progressTrackTrailingSpecDistance];
    double v32 = v17 + v39 + 1.0;
  }
  v40 = [(BKLibraryBookCoverViewController *)self progressTrackTrailingConstraint];
  [v40 setConstant:v32];

  [(BKLibraryBookCoverViewController *)self coverAnimationSourceFrame];
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  v49 = [(BKLibraryBookCoverViewController *)self coverImageViewController];
  v50 = [v49 view];
  [v50 setFrame:v42, v44, v46, v48];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BKLibraryBookCoverViewController;
  [(BKLibraryBookCoverViewController *)&v18 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
    CGFloat v8 = [WeakRetained image];
    [v8 size];
    double v10 = v9;
    double v12 = v11;

    [v6 bounds];
    double v14 = v13;
    double v16 = v15;
    double v17 = v13 / v15;
    if (v10 / v12 <= v17)
    {
      if (v10 / v12 < v17) {
        double v14 = v10 * (v16 / v12);
      }
    }
    else
    {
      double v16 = v12 * (v13 / v10);
    }
    -[BKLibraryBookCoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", v14, v16, v10 / v12);
  }
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  BOOL v4 = [(BKLibraryBookCoverViewController *)self navBarForBackButton];
  [v4 setAlpha:0.0];

  return 1;
}

- (void)navigationBar:(id)a3 didPopItem:(id)a4
{
  if ([(BKLibraryBookCoverViewController *)self showBackChevron])
  {
    [(BKLibraryBookCoverViewController *)self im_dismissAnimated:1];
  }
  else
  {
    id v5 = [(BKLibraryBookCoverViewController *)self delegate];
    [v5 dismissLibraryBookCoverViewController:self animated:1];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookCoverViewController;
  [(BKLibraryBookCoverViewController *)&v3 viewDidLayoutSubviews];
  [(BKLibraryBookCoverViewController *)self _adjustShadowForCurrentCoverBounds];
}

- (void)_updateProgress
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10018C4D0;
  v2[3] = &unk_100A43D60;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.1];
}

- (void)setProgressValue:(id)a3
{
  id v8 = a3;
  [v8 floatValue];
  float v6 = v5;
  [(NSNumber *)self->_progressValue floatValue];
  if (v6 != v7 || !v8 || !self->_progressValue)
  {
    objc_storeStrong((id *)&self->_progressValue, a3);
    [(BKLibraryBookCoverViewController *)self _updateProgress];
  }
}

- (void)setShowBackButton:(BOOL)a3
{
  if (self->_showBackButton != a3)
  {
    self->_showBackButton = a3;
    [(BKLibraryBookCoverViewController *)self _updateBackButtonAnimated:1];
    BOOL v4 = !self->_showBackButton;
    id v5 = [(BKLibraryBookCoverViewController *)self navBarForBackButton];
    [v5 setAccessibilityElementsHidden:v4];
  }
}

- (void)_updateBackButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10018C774;
  v6[3] = &unk_100A43D60;
  v6[4] = self;
  BOOL v4 = objc_retainBlock(v6);
  id v5 = v4;
  if (v3) {
    +[UIView animateWithDuration:v4 animations:0.2];
  }
  else {
    ((void (*)(void *))v4[2])(v4);
  }
}

- (void)setStatusBarOverrideViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarOverrideViewController);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_statusBarOverrideViewController, obj);
    [(BKLibraryBookCoverViewController *)self setNeedsStatusBarAppearanceUpdate];
    [(BKLibraryBookCoverViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
    id v5 = obj;
  }
}

- (BOOL)prefersStatusBarHidden
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarOverrideViewController);
  BOOL v3 = WeakRetained;
  if (WeakRetained) {
    unsigned __int8 v4 = [WeakRetained prefersStatusBarHidden];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarOverrideViewController);
  BOOL v3 = WeakRetained;
  if (WeakRetained) {
    id v4 = [WeakRetained preferredStatusBarStyle];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (BOOL)coverAnimationHostIsFullyVisible:(id)a3
{
  return 1;
}

- (BOOL)coverAnimationHostWantsScrollOnClose
{
  return 0;
}

- (id)coverAnimationHostTopViewsToFadeOut
{
  [(BKLibraryBookCoverViewController *)self loadViewIfNeeded];
  BOOL v3 = [(BKLibraryBookCoverViewController *)self progressTrack];
  float v6 = v3;
  id v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (int64_t)coverAnimationSourceAlignment
{
  return 2;
}

- (CGRect)coverAnimationSourceFrame
{
  BOOL v3 = [(BKLibraryBookCoverViewController *)self imageView];
  id v4 = [v3 image];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  if ([(BKLibraryBookCoverViewController *)self im_isCompactWidth]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = (uint64_t)[(BKLibraryBookCoverViewController *)self im_isCompactHeight];
  }
  double v10 = [(BKLibraryBookCoverViewController *)self view];
  [v10 bounds];
  +[BKBookBloomOpenAnimator zoomedFrameForCoverWithSize:isCompact:containerViewBounds:](BKBookBloomOpenAnimator, "zoomedFrameForCoverWithSize:isCompact:containerViewBounds:", v9, v6, v8, v11, v12, v13, v14);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)coverAnimationSourceImage
{
  objc_super v2 = [(BKLibraryBookCoverViewController *)self imageView];
  BOOL v3 = [v2 image];

  return v3;
}

- (BOOL)coverAnimationSourceUseLargeCover
{
  return 1;
}

- (void)coverAnimationSourcePrepare
{
  BOOL v3 = [(BKLibraryBookCoverViewController *)self imageView];
  [v3 setHidden:1];

  id v4 = [(BKLibraryBookCoverViewController *)self shadowImageView];
  [v4 setHidden:1];
}

- (void)coverAnimationSourceFinalize
{
  BOOL v3 = [(BKLibraryBookCoverViewController *)self imageView];
  [v3 setHidden:0];

  id v4 = [(BKLibraryBookCoverViewController *)self shadowImageView];
  [v4 setHidden:0];
}

- (BOOL)wallpaperStyleWantsTransparentLightEffect
{
  return 1;
}

- (void)bookOpenRevealDidEnd
{
  id v4 = +[UIColor clearColor];
  BOOL v3 = [(BKLibraryBookCoverViewController *)self view];
  [v3 setBackgroundColor:v4];
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (BKLibraryBookCoverViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKLibraryBookCoverViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);

  return (UIImageView *)WeakRetained;
}

- (void)setImageView:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSString)progressText
{
  return self->_progressText;
}

- (void)setProgressText:(id)a3
{
}

- (NSNumber)progressValue
{
  return self->_progressValue;
}

- (BOOL)showBackButton
{
  return self->_showBackButton;
}

- (BOOL)showBackChevron
{
  return self->_showBackChevron;
}

- (void)setShowBackChevron:(BOOL)a3
{
  self->_showBackChevron = a3;
}

- (UIViewController)coverImageViewController
{
  return self->_coverImageViewController;
}

- (UIViewController)statusBarOverrideViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarOverrideViewController);

  return (UIViewController *)WeakRetained;
}

- (UINavigationItem)navBarBackItem
{
  return self->_navBarBackItem;
}

- (void)setNavBarBackItem:(id)a3
{
}

- (UINavigationBar)navBarForBackButton
{
  return self->_navBarForBackButton;
}

- (void)setNavBarForBackButton:(id)a3
{
}

- (UIImage)coverImage
{
  return self->_coverImage;
}

- (UIImage)fallbackImage
{
  return self->_fallbackImage;
}

- (UIImageView)shadowImageView
{
  return self->_shadowImageView;
}

- (void)setShadowImageView:(id)a3
{
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (NSLayoutConstraint)imageTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageTopConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setImageTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageTrailingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageTrailingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setImageTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageLeadingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageLeadingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setImageLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageBottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageBottomConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setImageBottomConstraint:(id)a3
{
}

- (BKClassicScrubberTrack)progressTrack
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressTrack);

  return (BKClassicScrubberTrack *)WeakRetained;
}

- (void)setProgressTrack:(id)a3
{
}

- (NSLayoutConstraint)progressTrackBottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressTrackBottomConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setProgressTrackBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)progressTrackTrailingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressTrackTrailingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setProgressTrackTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)progressTrackLeadingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressTrackLeadingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setProgressTrackLeadingConstraint:(id)a3
{
}

- (double)progressTrackBottomSpecDistance
{
  return self->_progressTrackBottomSpecDistance;
}

- (void)setProgressTrackBottomSpecDistance:(double)a3
{
  self->_progressTrackBottomSpecDistance = a3;
}

- (double)progressTrackLeadingSpecDistance
{
  return self->_progressTrackLeadingSpecDistance;
}

- (void)setProgressTrackLeadingSpecDistance:(double)a3
{
  self->_progressTrackLeadingSpecDistance = a3;
}

- (double)progressTrackTrailingSpecDistance
{
  return self->_progressTrackTrailingSpecDistance;
}

- (void)setProgressTrackTrailingSpecDistance:(double)a3
{
  self->_progressTrackTrailingSpecDistance = a3;
}

- (UIColor)savedBackgroundColor
{
  return self->_savedBackgroundColor;
}

- (void)setSavedBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_progressTrackLeadingConstraint);
  objc_destroyWeak((id *)&self->_progressTrackTrailingConstraint);
  objc_destroyWeak((id *)&self->_progressTrackBottomConstraint);
  objc_destroyWeak((id *)&self->_progressTrack);
  objc_destroyWeak((id *)&self->_imageBottomConstraint);
  objc_destroyWeak((id *)&self->_imageLeadingConstraint);
  objc_destroyWeak((id *)&self->_imageTrailingConstraint);
  objc_destroyWeak((id *)&self->_imageTopConstraint);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
  objc_storeStrong((id *)&self->_coverImage, 0);
  objc_storeStrong((id *)&self->_navBarForBackButton, 0);
  objc_storeStrong((id *)&self->_navBarBackItem, 0);
  objc_destroyWeak((id *)&self->_statusBarOverrideViewController);
  objc_storeStrong((id *)&self->_coverImageViewController, 0);
  objc_storeStrong((id *)&self->_progressValue, 0);
  objc_storeStrong((id *)&self->_progressText, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_imageView);

  objc_destroyWeak((id *)&self->_delegate);
}

@end