@interface THTOCViewController
- (BOOL)animatesPageDuringTransition;
- (BOOL)closeButtonIsNeeded;
- (BOOL)forceStatusBarVisible;
- (BOOL)introMediaControllerIsActive;
- (BOOL)introMediaControllerIsOffscreen;
- (BOOL)paginatedTOCShowsStatusBar;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)statusBarShouldBeHidden;
- (BOOL)touchBarWantsSearch;
- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 inLayer:(id)a5;
- (THBookPropertiesProvider)bookPropertiesDelegate;
- (THTOCViewController)initWithBookPropertiesDelegate:(id)a3 delegate:(id)a4;
- (THTOCViewController)initWithNibName:(id)a3 bundle:(id)a4 bookPropertiesDelegate:(id)a5 delegate:(id)a6;
- (THTOCViewControllerDataSource)dataSource;
- (THTOCViewControllerDelegate)delegate;
- (TSWPassThroughView)shroudOverlayView;
- (double)shroudedFraction;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (int64_t)preferredStatusBarStyle;
- (void)dealloc;
- (void)didTransitionFromCanvas;
- (void)introMediaControllerMoviePlayerWillHideControls;
- (void)introMediaControllerMoviePlayerWillShowControls;
- (void)introMediaControllerShouldAdvancePast:(id)a3;
- (void)relinquishIntroMediaViewController;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceStatusBarVisible:(BOOL)a3;
- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4;
- (void)setShrouded:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)setShroudedFraction:(double)a3;
- (void)setShroudedFraction:(double)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)takeIntroMediaViewController:(id)a3;
- (void)willTransitionFromChapterIndex:(unint64_t)a3;
@end

@implementation THTOCViewController

- (THTOCViewController)initWithBookPropertiesDelegate:(id)a3 delegate:(id)a4
{
  uint64_t v7 = THBundle();

  return [(THTOCViewController *)self initWithNibName:0 bundle:v7 bookPropertiesDelegate:a3 delegate:a4];
}

- (THTOCViewController)initWithNibName:(id)a3 bundle:(id)a4 bookPropertiesDelegate:(id)a5 delegate:(id)a6
{
  result = [(THTOCViewController *)self initWithNibName:a3 bundle:a4];
  if (result)
  {
    result->_bookPropertiesDelegate = (THBookPropertiesProvider *)a5;
    result->mDelegate = (THTOCViewControllerDelegate *)a6;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THTOCViewController;
  [(THTOCViewController *)&v3 dealloc];
}

- (TSWPassThroughView)shroudOverlayView
{
  return self->mShroudOverlayView;
}

- (void)relinquishIntroMediaViewController
{
  id v2 = +[TSUAssertionHandler currentHandler];
  objc_super v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController relinquishIntroMediaViewController]");
  v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"];

  [v2 handleFailureInFunction:v3 file:v4 lineNumber:50 description:@"Abstract method"];
}

- (void)takeIntroMediaViewController:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController takeIntroMediaViewController:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:54 description:@"Abstract method"];
}

- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4
{
  id v4 = +[TSUAssertionHandler currentHandler];
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController setIntroMediaViewController:showIt:]");
  v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:58 description:@"Abstract method"];
}

- (BOOL)animatesPageDuringTransition
{
  return 0;
}

- (void)willTransitionFromChapterIndex:(unint64_t)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController willTransitionFromChapterIndex:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:67 description:@"Abstract method"];
}

- (void)didTransitionFromCanvas
{
  id v2 = +[TSUAssertionHandler currentHandler];
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController didTransitionFromCanvas]");
  id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"];

  [v2 handleFailureInFunction:v3 file:v4 lineNumber:71 description:@"Abstract method"];
}

- (CGRect)rectForPageThumbnailAtIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4 inLayer:(id)a5
{
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController rectForPageThumbnailAtIndex:chapterIndex:inLayer:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m") lineNumber:75 description:@"Abstract method"];
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)introMediaControllerMoviePlayerWillShowControls
{
  id v2 = +[TSUAssertionHandler currentHandler];
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController introMediaControllerMoviePlayerWillShowControls]");
  id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"];

  [v2 handleFailureInFunction:v3 file:v4 lineNumber:80 description:@"Abstract method"];
}

- (void)introMediaControllerMoviePlayerWillHideControls
{
  id v2 = +[TSUAssertionHandler currentHandler];
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController introMediaControllerMoviePlayerWillHideControls]");
  id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"];

  [v2 handleFailureInFunction:v3 file:v4 lineNumber:84 description:@"Abstract method"];
}

- (void)setShroudedFraction:(double)a3 animated:(BOOL)a4 duration:(double)a5
{
  if (self->mShroudedFraction != a3)
  {
    BOOL v7 = a4;
    self->mShroudedFraction = a3;
    memset(&v23, 0, sizeof(v23));
    CATransform3DMakeScale(&v23, a3 * 0.300000012 + 1.0, a3 * 0.300000012 + 1.0, 1.0);
    if (!self->mShroudOverlayView)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      v9 = [TSWPassThroughView alloc];
      [self view].bounds;
      self->mShroudOverlayView = -[TSWPassThroughView initWithFrame:](v9, "initWithFrame:");
      [(TSWPassThroughView *)self->mShroudOverlayView setBackgroundColor:+[UIColor bc_darkSystemBackgroundForTraitCollection:[(THTOCViewController *)self traitCollection]]];
      [(TSWPassThroughView *)self->mShroudOverlayView setAutoresizingMask:18];
      [self->mShroudOverlayView layer].opacity = 0.0;
      [self->mShroudOverlayView addSubview:[self view]];
      +[CATransaction commit];
    }
    memset(&v22, 0, sizeof(v22));
    v10 = [(UIView *)[(THTOCViewController *)self viewToShroud] layer];
    if (v10) {
      [(CALayer *)v10 transform];
    }
    else {
      memset(&v22, 0, sizeof(v22));
    }
    [self->mShroudOverlayView layer].opacity;
    int v12 = v11;
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    float v13 = a3;
    id v14 = [(TSWPassThroughView *)self->mShroudOverlayView layer];
    *(float *)&double v15 = v13;
    [v14 setOpacity:v15];
    if ([(THTOCViewController *)self shouldZoomShroudedView])
    {
      v21[1] = v23;
      v21[0] = v23;
      [(CALayer *)[(UIView *)[(THTOCViewController *)self viewToShroud] layer] setTransform:v21];
    }
    +[CATransaction commit];
    if (v7)
    {
      +[CATransaction begin];
      +[CATransaction setAnimationDuration:a5];
      v16 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
      LODWORD(v17) = v12;
      [(CABasicAnimation *)v16 setFromValue:+[NSNumber numberWithFloat:v17]];
      *(float *)&double v18 = v13;
      [(CABasicAnimation *)v16 setToValue:+[NSNumber numberWithFloat:v18]];
      [(CABasicAnimation *)v16 setRemovedOnCompletion:1];
      [self->mShroudOverlayView.layer addAnimation:v16 forKey:@"shadeAnimation"];
      if ([(THTOCViewController *)self shouldZoomShroudedView])
      {
        v19 = +[CABasicAnimation animationWithKeyPath:@"transform"];
        CATransform3D v20 = v22;
        [(CABasicAnimation *)v19 setFromValue:+[NSValue valueWithCATransform3D:&v20]];
        CATransform3D v20 = v23;
        [(CABasicAnimation *)v19 setToValue:+[NSValue valueWithCATransform3D:&v20]];
        [(CABasicAnimation *)v19 setRemovedOnCompletion:1];
        [(CALayer *)[(UIView *)[(THTOCViewController *)self viewToShroud] layer] addAnimation:v19 forKey:@"shadeAnimation"];
      }
      +[CATransaction commit];
    }
  }
}

- (void)setShrouded:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  if ([(THTOCViewControllerDelegate *)[(THTOCViewController *)self delegate] tocViewControllerMayBeShrouded:self])
  {
    double v9 = 0.0;
    if (v7) {
      double v9 = 1.0;
    }
    [(THTOCViewController *)self setShroudedFraction:v6 animated:v9 duration:a5];
  }
}

- (double)shroudedFraction
{
  return self->mShroudedFraction;
}

- (void)setShroudedFraction:(double)a3
{
  unsigned int v5 = [(THTOCViewControllerDelegate *)[(THTOCViewController *)self delegate] tocViewControllerMayBeShrouded:self];
  double v6 = 0.0;
  if (v5) {
    double v6 = a3;
  }

  [(THTOCViewController *)self setShroudedFraction:0 animated:v6 duration:0.0];
}

- (BOOL)statusBarShouldBeHidden
{
  return 0;
}

- (BOOL)closeButtonIsNeeded
{
  return 0;
}

- (BOOL)introMediaControllerIsActive
{
  return 0;
}

- (BOOL)introMediaControllerIsOffscreen
{
  return 0;
}

- (void)introMediaControllerShouldAdvancePast:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCViewController introMediaControllerShouldAdvancePast:]");
  unsigned int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCViewController.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:213 description:@"Abstract method"];
}

- (BOOL)paginatedTOCShowsStatusBar
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return [(THTOCViewController *)self theme] == 0;
}

- (id)childViewControllerForStatusBarHidden
{
  if (![(THTOCViewController *)self introMediaControllerIsActive]
    || [(THTOCViewController *)self forceStatusBarVisible])
  {
    return 0;
  }

  return [(THTOCViewController *)self introMediaViewController];
}

- (id)childViewControllerForStatusBarStyle
{
  if (![(THTOCViewController *)self introMediaControllerIsActive]
    || [(THTOCViewController *)self forceStatusBarVisible])
  {
    return 0;
  }

  return [(THTOCViewController *)self introMediaViewController];
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 0;
}

- (BOOL)touchBarWantsSearch
{
  return 1;
}

- (THTOCViewControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THTOCViewControllerDelegate *)a3;
}

- (THTOCViewControllerDataSource)dataSource
{
  return self->mDataSource;
}

- (void)setDataSource:(id)a3
{
  self->mDataSource = (THTOCViewControllerDataSource *)a3;
}

- (THBookPropertiesProvider)bookPropertiesDelegate
{
  return self->_bookPropertiesDelegate;
}

- (BOOL)forceStatusBarVisible
{
  return self->_forceStatusBarVisible;
}

- (void)setForceStatusBarVisible:(BOOL)a3
{
  self->_forceStatusBarVisible = a3;
}

@end