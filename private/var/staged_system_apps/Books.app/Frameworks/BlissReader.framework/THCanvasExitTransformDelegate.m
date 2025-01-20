@interface THCanvasExitTransformDelegate
- ($A219A65C3B9F57E4A1EAB42BC6271E0A)shadowPropertiesForFreeTransformController:(SEL)a3 defaults:(id)a4;
- (BOOL)freeTransformControllerShouldAllowPinchDown:(id)a3;
- (BOOL)freeTransformControllerShouldAllowPinchUp:(id)a3;
- (BOOL)freeTransformControllerShouldBegin:(id)a3;
- (BOOL)freeTransformControllerShouldDelayRecognizeUntilScaleChange:(id)a3;
- (BOOL)freeTransformControllerShouldFadeShadowOut:(id)a3;
- (BOOL)freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:(id)a3;
- (BOOL)freeTransformControllerWantsCurtainFadeOut:(id)a3;
- (BOOL)p_shouldShowShroudForVisibleSize:(CGSize)a3;
- (BOOL)savedPagingState;
- (BOOL)thumbFadeOutAnimationInProgress;
- (CGRect)freeTransformControllerOriginalTargetLayerFrame:(id)a3;
- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3;
- (CGRect)shadowBoundsForFreeTransformController:(id)a3;
- (CGSize)curtainSizeForFreeTransformController:(id)a3;
- (THCanvasExitTransformDelegate)initWithBookViewController:(id)a3;
- (double)targetLayerShadowOpacity;
- (id)curtainColorForFreeTransformController:(id)a3;
- (id)p_shadowFadeInAnimation:(double)a3;
- (id)p_shadowFadeOutAnimation:(double)a3;
- (id)unmovingParentViewForFreeTransformController:(id)a3;
- (void)freeTransformControllerDidBegin:(id)a3;
- (void)freeTransformControllerDidContinue:(id)a3 withScale:(double)a4;
- (void)freeTransformControllerDidEnd:(id)a3 passedThreshold:(BOOL)a4;
- (void)freeTransformControllerWillBeginCompletionAnimation:(id)a3 passedThreshold:(BOOL)a4;
- (void)p_showThumbUsingTinyThumb:(BOOL)a3 freeTransformController:(id)a4;
- (void)setSavedPagingState:(BOOL)a3;
- (void)setTargetLayerShadowOpacity:(double)a3;
- (void)setThumbFadeOutAnimationInProgress:(BOOL)a3;
@end

@implementation THCanvasExitTransformDelegate

- (THCanvasExitTransformDelegate)initWithBookViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THCanvasExitTransformDelegate;
  v4 = [(THCanvasExitTransformDelegate *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mBookViewController = (THBookViewController *)a3;
    v4->mDocumentViewController = (THDocumentViewController *)[a3 documentViewController];
    v5->mChapterBrowserController = [(THBookViewController *)v5->mBookViewController chapterBrowserController];
  }
  return v5;
}

- (CGRect)shadowBoundsForFreeTransformController:(id)a3
{
  [(THDocumentViewController *)self->mDocumentViewController shadowBoundsForCanvasExitTransformDelegate:self];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)p_shouldShowShroudForVisibleSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (TSUPhoneUI()) {
    return 1;
  }
  objc_msgSend(objc_msgSend(-[THDocumentViewController view](self->mDocumentViewController, "view"), "window"), "statusBarMinDimension");
  double v8 = v7;
  [(THDocumentViewController *)self->mDocumentViewController paginatedSpreadSize];
  BOOL result = 0;
  if (v9 > 0.0 && width > 0.0) {
    return vabdd_f64(v10 / v9, (height - v8) / width) >= 0.00999999978;
  }
  return result;
}

- (BOOL)freeTransformControllerShouldBegin:(id)a3
{
  return ![(THDocumentViewController *)self->mDocumentViewController showingExpandedWidgetView];
}

- (void)freeTransformControllerDidBegin:(id)a3
{
  [(THDocumentViewController *)self->mDocumentViewController currentRelativePageIndexRange];
  if (v4 == 2)
  {
    self->_savedPagingState = [self->mDocumentViewController->canvasScrollView isPagingEnabled];
    [self->mDocumentViewController->canvasScrollView setPagingEnabled:0];
  }
  [(THBookViewController *)self->mBookViewController hideNavigationHistory];
  [(THBookViewController *)self->mBookViewController temporarilySetHUDViewHidden:1];
  [self->mDocumentViewController->view frame];
  if (!-[THCanvasExitTransformDelegate p_shouldShowShroudForVisibleSize:](self, "p_shouldShowShroudForVisibleSize:", v5, v6))[(THTOCViewController *)self->mChapterBrowserController setShroudedFraction:0.0]; {
  self->mChapterIndex = [(THDocumentViewController *)self->mDocumentViewController currentChapter];
  }
  id v7 = [(THDocumentViewController *)self->mDocumentViewController currentRelativePageIndexRange];
  self->mAnimatingPageIndexRange.location = (NSUInteger)v7;
  self->mAnimatingPageIndexRange.length = v8;
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THCanvasExitTransformDelegate freeTransformControllerDidBegin:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THCanvasExitTransformDelegate.m") lineNumber:108 description:@"Current page index is bogus"];
  }
  [(THBookViewController *)self->mBookViewController putTOCInBack];
  [(THChapterBrowserController *)self->mChapterBrowserController willTransitionFromChapterIndex:self->mChapterIndex];
  [(THChapterBrowserController *)self->mChapterBrowserController hidePageThumbnailAtIndex:self->mAnimatingPageIndexRange.location chapterIndex:self->mChapterIndex scrollIfNecessary:1];
  if (self->mAnimatingPageIndexRange.length == 2) {
    [(THChapterBrowserController *)self->mChapterBrowserController hidePageThumbnailAtIndex:self->mAnimatingPageIndexRange.location + 1 chapterIndex:self->mChapterIndex scrollIfNecessary:0];
  }
  [(THChapterBrowserController *)self->mChapterBrowserController scrollToThumbnailAtIndex:self->mAnimatingPageIndexRange.location];
  id v9 = [(THDocumentViewController *)self->mDocumentViewController interactiveCanvasController];

  [v9 didBeginFreeTransform];
}

- (BOOL)freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:(id)a3
{
  return 0;
}

- (id)p_shadowFadeInAnimation:(double)a3
{
  uint64_t v4 = +[CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
  [(CABasicAnimation *)v4 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
  [(CABasicAnimation *)v4 setDuration:0.15];
  [(CABasicAnimation *)v4 setFromValue:+[NSNumber numberWithFloat:0.0]];
  *(float *)&double v5 = a3;
  [(CABasicAnimation *)v4 setToValue:+[NSNumber numberWithFloat:v5]];
  [(CABasicAnimation *)v4 setRemovedOnCompletion:0];
  return v4;
}

- (id)p_shadowFadeOutAnimation:(double)a3
{
  uint64_t v4 = +[CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
  [(CABasicAnimation *)v4 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
  [(CABasicAnimation *)v4 setDuration:0.15];
  *(float *)&double v5 = a3;
  [(CABasicAnimation *)v4 setFromValue:+[NSNumber numberWithFloat:v5]];
  [(CABasicAnimation *)v4 setToValue:+[NSNumber numberWithFloat:0.0]];
  [(CABasicAnimation *)v4 setFillMode:kCAFillModeForwards];
  [(CABasicAnimation *)v4 setRemovedOnCompletion:0];
  return v4;
}

- (void)p_showThumbUsingTinyThumb:(BOOL)a3 freeTransformController:(id)a4
{
  BOOL v5 = a3;
  id v7 = [(THDocumentViewController *)self->mDocumentViewController canvasScrollView];
  mThumbView = self->mThumbView;
  if (!mThumbView)
  {
    id v9 = objc_alloc((Class)UIView);
    [v7 frame];
    double v10 = [v9 initWithFrame:];
    self->mThumbView = v10;
    [(UIView *)v10 setAlpha:0.0];
    objc_msgSend(objc_msgSend(v7, "superview"), "addSubview:", self->mThumbView);
    mThumbView = self->mThumbView;
  }
  if (self->mUsingTinyThumb == v5)
  {
    if ([(NSArray *)[(UIView *)mThumbView subviews] count]) {
      goto LABEL_26;
    }
    mThumbView = self->mThumbView;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v11 = [(UIView *)mThumbView subviews];
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v40;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * i) removeFromSuperview];
      }
      id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v13);
  }
  v16 = &off_343000;
  if (self->mAnimatingPageIndexRange.length == 1)
  {
    id v17 = [objc_alloc((Class)UIImageView) initWithImage:[self thumbnailImageForPageAtIndex:self->mAnimatingPageIndexRange.location chapterIndex:self->mChapterIndex tinyThumb:v5]];
    unsigned int v18 = [(THDocumentViewController *)self->mDocumentViewController is2UpForCanvasExitTransformDelegate:self];
    [(UIView *)self->mThumbView bounds];
    if (v18)
    {
      double v22 = v21 * 0.5;
      double v19 = (v21 - v21 * 0.5) * 0.5;
      double v20 = 0.0;
    }
    else
    {
      double v22 = v21;
    }
    [v17 setFrame:v19, v20, v22];
    [(UIView *)self->mThumbView addSubview:v17];
  }
  else
  {
    [(UIView *)self->mThumbView bounds];
    double v24 = v23;
    double v26 = v25;
    NSUInteger location = self->mAnimatingPageIndexRange.location;
    id v28 = [objc_alloc((Class)UIImageView) initWithImage:[self thumbnailImageForPageAtIndex:self->mChapterIndex tinyThumb:v5]];
    id v29 = [objc_alloc((Class)UIImageView) initWithImage:[self thumbnailImageForPageAtIndex:location + 1 chapterIndex:self->mChapterIndex tinyThumb:v5]];
    double v30 = v24 * 0.5;
    if (self->mAnimatingPageIndexRange.location)
    {
      double v31 = 0.0;
      [v28 setFrame:0.0, 0.0, v30, v26];
      double v32 = v30;
    }
    else
    {
      double v33 = v26 * 1.08;
      double v34 = (v26 - v26 * 1.08) * 0.5;
      [v28 setFrame:0.0, v34, v30 * 1.08, v26 * 1.08];
      double v32 = v30 * 0.92;
      double v26 = v26 * 0.92;
      double v31 = v33 + v34 - v26;
      double v30 = v30 * 1.08;
    }
    [v29 setFrame:v30, v31, v32, v26];
    [(UIView *)self->mThumbView addSubview:v28];
    [(UIView *)self->mThumbView addSubview:v29];

    v16 = &off_343000;
    if (!self->mAnimatingPageIndexRange.location)
    {
      if (self->_targetLayerShadowOpacity == 0.0)
      {
        objc_msgSend(objc_msgSend(a4, "shadowLayer"), "shadowOpacity");
        self->_targetLayerShadowOpacity = v35;
        objc_msgSend(objc_msgSend(a4, "shadowLayer"), "shadowOpacity");
        objc_msgSend(objc_msgSend(a4, "shadowLayer"), "addAnimation:forKey:", -[THCanvasExitTransformDelegate p_shadowFadeOutAnimation:](self, "p_shadowFadeOutAnimation:", v36), @"kCanvasExitTransformFadeOutAnimationName");
      }
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_B3830;
      v38[3] = &unk_456DE0;
      v38[4] = v7;
      +[UIView animateWithDuration:v38 animations:0.15];
    }
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_B383C;
  v37[3] = &unk_456DE0;
  v37[4] = self;
  +[UIView animateWithDuration:v37 animations:*((double *)v16 + 468)];
LABEL_26:
  self->mUsingTinyThumb = v5;
}

- (void)freeTransformControllerDidContinue:(id)a3 withScale:(double)a4
{
  [self->mDocumentViewController->view frame];
  if (-[THCanvasExitTransformDelegate p_shouldShowShroudForVisibleSize:](self, "p_shouldShowShroudForVisibleSize:", v7, v8))
  {
    mChapterBrowserController = self->mChapterBrowserController;
    TSUClamp();
    -[THTOCViewController setShroudedFraction:](mChapterBrowserController, "setShroudedFraction:");
  }
  if (a4 >= 0.5)
  {
    if (self->mThumbView && !self->_thumbFadeOutAnimationInProgress)
    {
      self->_thumbFadeOutAnimationInProgress = 1;
      if (self->_targetLayerShadowOpacity > 0.0)
      {
        objc_msgSend(objc_msgSend(a3, "shadowLayer"), "removeAllAnimations");
        objc_msgSend(objc_msgSend(a3, "shadowLayer"), "addAnimation:forKey:", -[THCanvasExitTransformDelegate p_shadowFadeInAnimation:](self, "p_shadowFadeInAnimation:", self->_targetLayerShadowOpacity), @"kCanvasExitTransformFadeInAnimationName");
        self->_targetLayerShadowOpacity = 0.0;
      }
      id v10 = [(THDocumentViewController *)self->mDocumentViewController canvasScrollView];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_B3A1C;
      v12[3] = &unk_456E38;
      v12[4] = v10;
      v12[5] = self;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_B3A64;
      v11[3] = &unk_457140;
      v11[4] = self;
      +[UIView animateWithDuration:v12 animations:v11 completion:0.15];
    }
  }
  else
  {
    [(THCanvasExitTransformDelegate *)self p_showThumbUsingTinyThumb:a4 < 0.25 freeTransformController:a3];
  }
}

- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3
{
  -[THChapterBrowserController rectForPageThumbnailAtIndex:chapterIndex:inLayer:](self->mChapterBrowserController, "rectForPageThumbnailAtIndex:chapterIndex:inLayer:", self->mAnimatingPageIndexRange.location, self->mChapterIndex, objc_msgSend(objc_msgSend(a3, "freeTransformLayer"), "superlayer"));
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  if (self->mAnimatingPageIndexRange.length == 2)
  {
    -[THChapterBrowserController rectForPageThumbnailAtIndex:chapterIndex:inLayer:](self->mChapterBrowserController, "rectForPageThumbnailAtIndex:chapterIndex:inLayer:", self->mAnimatingPageIndexRange.location + 1, self->mChapterIndex, objc_msgSend(objc_msgSend(a3, "freeTransformLayer"), "superlayer"));
    v24.origin.CGFloat x = v13;
    v24.origin.CGFloat y = v14;
    v24.size.CGFloat width = v15;
    v24.size.CGFloat height = v16;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRect v22 = CGRectUnion(v21, v24);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (BOOL)freeTransformControllerShouldFadeShadowOut:(id)a3
{
  return 1;
}

- (void)freeTransformControllerWillBeginCompletionAnimation:(id)a3 passedThreshold:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4 && !self->mThumbView) {
    [(THCanvasExitTransformDelegate *)self p_showThumbUsingTinyThumb:1 freeTransformController:a3];
  }
  mChapterBrowserController = self->mChapterBrowserController;

  [(THTOCViewController *)mChapterBrowserController setShrouded:!v4 animated:1 duration:0.25];
}

- (void)freeTransformControllerDidEnd:(id)a3 passedThreshold:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_targetLayerShadowOpacity > 0.0)
  {
    objc_msgSend(objc_msgSend(a3, "shadowLayer"), "addAnimation:forKey:", -[THCanvasExitTransformDelegate p_shadowFadeInAnimation:](self, "p_shadowFadeInAnimation:"), @"kCanvasExitTransformFadeInAnimationName");
    self->_targetLayerShadowOpacitCGFloat y = 0.0;
  }
  id v6 = [(THDocumentViewController *)self->mDocumentViewController canvasScrollView];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_B3DF4;
  v9[3] = &unk_456DE0;
  v9[4] = v6;
  +[UIView animateWithDuration:v9 animations:0.15];
  [(UIView *)self->mThumbView removeFromSuperview];

  self->mThumbView = 0;
  if (!v4)
  {
    [(THBookViewController *)self->mBookViewController removeTOC];
    [(THBookViewController *)self->mBookViewController setCenterTitleForCurrentNavigationUnit];
    [self->mDocumentViewController->canvasViewController becomeFirstResponder];
    [(THBookViewController *)self->mBookViewController temporarilySetHUDViewHidden:0];
  }
  [(THChapterBrowserController *)self->mChapterBrowserController showPageThumbnailAtIndex:self->mAnimatingPageIndexRange.location];
  if (self->mAnimatingPageIndexRange.length == 2) {
    [(THChapterBrowserController *)self->mChapterBrowserController showPageThumbnailAtIndex:self->mAnimatingPageIndexRange.location + 1];
  }
  [self->mDocumentViewController->interactiveCanvasController didEndFreeTransform];
  if (v4)
  {
    [(THBookViewController *)self->mBookViewController dismissActivePopover];
    if (![(THChapterBrowserController *)self->mChapterBrowserController paginatedTOCShowsStatusBar])
    {
      unsigned int v7 = [(THBookViewController *)self->mBookViewController isToolbarHidden];
      mBookViewController = self->mBookViewController;
      if (v7) {
        [(THBookViewController *)mBookViewController refreshStatusBarAppearance];
      }
      else {
        [(THBookViewController *)mBookViewController hideToolbarAnimated:1];
      }
    }
    [(THChapterBrowserController *)self->mChapterBrowserController didTransitionFromCanvas];
    [(THTOCViewControllerDelegate *)[(THTOCViewController *)self->mChapterBrowserController delegate] didTransitionFromViewController:self->mDocumentViewController toTOCViewController:self->mChapterBrowserController];
    [(THDocumentViewController *)self->mDocumentViewController setVisibleInfoUpdatesAllowedInLandscape:0];
    [(THBookViewController *)self->mBookViewController refreshStatusBarAppearance];
    [(THBookViewController *)self->mBookViewController recordOutgoingMajorNavigationJump];
  }
  [(THChapterBrowserController *)self->mChapterBrowserController setIsPinchingDownFromCanvas:0];
  if (self->mAnimatingPageIndexRange.length == 2) {
    [self->mDocumentViewController->canvasScrollView setPagingEnabled:self->_savedPagingState];
  }
}

- (id)unmovingParentViewForFreeTransformController:(id)a3
{
  return [(THBookViewController *)self->mBookViewController view];
}

- (id)curtainColorForFreeTransformController:(id)a3
{
  return 0;
}

- (CGSize)curtainSizeForFreeTransformController:(id)a3
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)freeTransformControllerWantsCurtainFadeOut:(id)a3
{
  return 0;
}

- ($A219A65C3B9F57E4A1EAB42BC6271E0A)shadowPropertiesForFreeTransformController:(SEL)a3 defaults:(id)a4
{
  [a4 completionTargetRect];
  CGRectGetWidth(v8);
  objc_msgSend(objc_msgSend(a4, "targetLayer"), "frame");
  CGRectGetWidth(v9);
  [(THDocumentViewController *)self->mDocumentViewController is2UpForCanvasExitTransformDelegate:self];
  return ($A219A65C3B9F57E4A1EAB42BC6271E0A *)TSDMultiplySizeScalar();
}

- (CGRect)freeTransformControllerOriginalTargetLayerFrame:(id)a3
{
  [(THDocumentViewController *)self->mDocumentViewController shadowBoundsForCanvasExitTransformDelegate:self];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (BOOL)freeTransformControllerShouldDelayRecognizeUntilScaleChange:(id)a3
{
  return 1;
}

- (BOOL)freeTransformControllerShouldAllowPinchDown:(id)a3
{
  id v3 = [self->mDocumentViewController canvasViewController]->canvasLayer;
  if (![v3 allowsPinchZoom]) {
    return 1;
  }
  [v3 viewScale];
  double v5 = v4;
  [v3 minimumPinchViewScale];
  return vabdd_f64(v5, v6) < 0.00999999978;
}

- (BOOL)freeTransformControllerShouldAllowPinchUp:(id)a3
{
  id v3 = [self->mDocumentViewController canvasViewController]->canvasLayer;
  if (![v3 allowsPinchZoom]) {
    return 1;
  }
  [v3 minimumPinchViewScale];
  double v5 = v4;
  [v3 maximumPinchViewScale];
  return vabdd_f64(v5, v6) < 0.00999999978;
}

- (double)targetLayerShadowOpacity
{
  return self->_targetLayerShadowOpacity;
}

- (void)setTargetLayerShadowOpacity:(double)a3
{
  self->_targetLayerShadowOpacitCGFloat y = a3;
}

- (BOOL)thumbFadeOutAnimationInProgress
{
  return self->_thumbFadeOutAnimationInProgress;
}

- (void)setThumbFadeOutAnimationInProgress:(BOOL)a3
{
  self->_thumbFadeOutAnimationInProgress = a3;
}

- (BOOL)savedPagingState
{
  return self->_savedPagingState;
}

- (void)setSavedPagingState:(BOOL)a3
{
  self->_savedPagingState = a3;
}

@end