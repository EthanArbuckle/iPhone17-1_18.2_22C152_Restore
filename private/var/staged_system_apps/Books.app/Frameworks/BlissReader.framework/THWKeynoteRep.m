@interface THWKeynoteRep
- (BOOL)autoplayAllowed;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4;
- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4;
- (BOOL)expandedHasContentForPanel:(int)a3;
- (BOOL)expandedHasRoomForPanelsWithHeight:(double)a3 inFrame:(CGRect)a4;
- (BOOL)freeTransformInteractionEnabledOverride;
- (BOOL)freeTransformUseTracedShadowPath;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)isExpanded;
- (BOOL)isFreeTransformInProgress;
- (BOOL)keynoteShowRep:(id)a3 handleURL:(id)a4;
- (BOOL)meetsStageDimensionRequirementForExpanded;
- (BOOL)panelDescriptionExpanded;
- (BOOL)shouldAnimateTargetLayer:(id)a3;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)tracksScore;
- (BOOL)wantsPressAction;
- (BOOL)wantsPressAnimation;
- (BOOL)widgetInteractionAllowAutoplayForCompact;
- (BOOL)widgetInteractionAllowOnPageForCompact;
- (CALayer)pressableAnimationShadowLayer;
- (CGAffineTransform)freeTransform;
- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (CGRect)ftcTargetFrame;
- (CGRect)pressableNaturalBounds;
- (CGRect)rectForCompletion;
- (THAnimationController)animationController;
- (THWAutoplayConfig)autoplayConfig;
- (THWExpandedRepController)expandedRepController;
- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler;
- (THWKeynoteRep)initWithLayout:(id)a3 canvas:(id)a4;
- (THWKeynoteShowRep)showRep;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (THWTransportControlRep)transportControlRep;
- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (id)animationLayer;
- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5;
- (id)cloneForTransportControl:(id)a3;
- (id)expandedChildInfosForPanel:(int)a3;
- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4;
- (id)expandedSupportedGestureKinds;
- (id)shadowAnimationLayer;
- (id)shadowPath;
- (id)targetLayer;
- (int)autoRotationMode;
- (int)expandedAppearance;
- (int)expandedAppearanceForPanel:(int)a3;
- (int)positionForChildView:(id)a3;
- (int)pressableAction;
- (unint64_t)hitTestOptions;
- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5;
- (void)animationControllerDidPresent:(id)a3;
- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4;
- (void)dealloc;
- (void)didPresentExpandedPostCommit;
- (void)expandableExpandedPresentationDidEnd;
- (void)expandedDidRotateTransitionToSize:(CGSize)a3;
- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4;
- (void)expandedWillPresentWithController:(id)a3;
- (void)freeTransformDidEnd;
- (void)freeTransformWillBegin;
- (void)handleNavigateNextCommand;
- (void)handleNavigatePreviousCommand;
- (void)p_keynoteShowDidUpdate:(id)a3;
- (void)p_play;
- (void)p_stop;
- (void)p_togglePanelDescriptionExpanded;
- (void)setHandlingPress:(BOOL)a3;
- (void)setPanelDescriptionExpanded:(BOOL)a3;
- (void)setPressableHandler:(id)a3;
- (void)viewScaleDidChange;
- (void)wasAddedToParent;
- (void)willBeRemovedFromParent;
- (void)willBeginHandlingGesture:(id)a3;
@end

@implementation THWKeynoteRep

- (THWKeynoteRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THWKeynoteRep;
  v4 = [(THWKeynoteRep *)&v6 initWithLayout:a3 canvas:a4];
  if (v4) {
    v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWKeynoteRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteRep;
  [(THWKeynoteRep *)&v3 dealloc];
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  if (!self->_pressableHandler)
  {
    objc_opt_class();
    [(THWKeynoteRep *)self interactiveCanvasController];
    id v3 = [(id)TSUDynamicCast() pressHandlerForPressableReps];
    if (v3)
    {
      v4 = [[THWPressableRepGestureTargetHandler alloc] initWithPressableRep:self pressHandler:v3];
      self->_pressableHandler = v4;
      [(THWPressableRepGestureTargetHandler *)v4 setEnabledOnlyIfWidgetInteractionDisabledOnPage:1];
    }
  }
  return self->_pressableHandler;
}

- (void)wasAddedToParent
{
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteRep;
  [(THWKeynoteRep *)&v3 wasAddedToParent];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"p_keynoteShowDidUpdate:" name:@"kTSWTransportControlCloneDidUpdateNotification" object:0];
}

- (void)willBeRemovedFromParent
{
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteRep;
  [(THWKeynoteRep *)&v3 willBeRemovedFromParent];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kTSWTransportControlCloneDidUpdateNotification" object:0];
}

- (int)positionForChildView:(id)a3
{
  return 2;
}

- (unint64_t)hitTestOptions
{
  return 4;
}

- (void)viewScaleDidChange
{
  if ([(THWPressableRepGestureTargetHandler *)[(THWKeynoteRep *)self pressableHandler] widgetInteractionDisabledOnPage])
  {
    [(THWKeynoteRep *)self p_stop];
  }
  [self layout].invalidateFrame;
  id v3 = [(THWKeynoteRep *)self layout];

  [v3 invalidateChildren];
}

- (id)cloneForTransportControl:(id)a3
{
  id v3 = [(THWKeynoteRep *)self showRep];

  return [(THWKeynoteShowRep *)v3 transportControlClone];
}

- (void)p_play
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1940CC;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Keynote Play", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)p_stop
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_194190;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Keynote Stop", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = THBundle();
  if (v5) {
    CFStringRef v7 = @"play-keynote-64-P";
  }
  else {
    CFStringRef v7 = @"play-keynote-64";
  }

  return +[TSUImage imageNamed:v7 inBundle:v6];
}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
  [a4 setContentsGravity:kCAGravityResizeAspectFill];
  objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
  TSDMultiplySizeScalar();
  [a4 bounds];
  TSDShrinkSizeToFitInSize();
  double v7 = v6;
  double v9 = v8;
  [a4 bounds];
  double v12 = THScaleNeededToFitSizeInSize(v10, v11, v7, v9);
  CATransform3DMakeScale(&v14, v12, v12, 1.0);
  CATransform3D v13 = v14;
  [a4 setTransform:&v13];
}

- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4
{
  if (![(THWKeynoteRep *)self pressableHandler]) {
    return 1;
  }
  BOOL v5 = [(THWKeynoteRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v5 widgetInteractionEnabled];
}

- (THAnimationController)animationController
{
  result = self->_animationController;
  if (!result)
  {
    v4 = objc_alloc_init(THAnimationController);
    self->_animationController = v4;
    [(THAnimationController *)v4 setSource:self];
    [(THAnimationController *)self->_animationController addObserver:self];
    return self->_animationController;
  }
  return result;
}

- (void)expandableExpandedPresentationDidEnd
{
  if ([(THWPressableRepGestureTargetHandler *)[(THWKeynoteRep *)self pressableHandler] widgetInteractionDisabledOnPage])
  {
    [(THWKeynoteRep *)self p_stop];
  }
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [self info].adornmentInfo;

  return [v4 panelContentProviderHasContentForPanel:v3];
}

- (id)expandedChildInfosForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [self info].adornmentInfo;

  return [v4 panelContentProviderChildInfosForPanel:v3];
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  id v4 = [(THWKeynoteRep *)self layout];

  [v4 invalidateFrame];
}

- (id)expandedSupportedGestureKinds
{
  v2 = [(THWKeynoteRep *)self showRep];

  return [(THWKeynoteShowRep *)v2 supportedGestureKinds];
}

- (BOOL)expandedHasRoomForPanelsWithHeight:(double)a3 inFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [(-[THWKeynoteRep showRep](self, "showRep")) layout] showSize;
  TSDScaleSizeWithinSize();
  double v10 = v9;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  return CGRectGetHeight(v12) - v10 >= a3;
}

- (void)didPresentExpandedPostCommit
{
  +[CATransaction flush];
  uint64_t v3 = [(THWKeynoteRep *)self showRep];

  [(THWKeynoteShowRep *)v3 playPreparedShow];
}

- (int)expandedAppearance
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 2;
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (void)p_togglePanelDescriptionExpanded
{
  [(THWKeynoteRep *)self setPanelDescriptionExpanded:[(THWKeynoteRep *)self panelDescriptionExpanded] ^ 1];
  [(THWExpandedRepController *)self->_expandedRepController expandedRepControllerAnimatePanel:1 withCrossFadeContent:1 backgroundLayout:0 duration:0.25];
  expandedRepController = self->_expandedRepController;

  [(THWExpandedRepController *)expandedRepController expandedRepControllerInvalidateChildrenInPanel:1 invalidateWPAuto:1];
}

- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4
{
  if (a3 != 1) {
    return 0;
  }
  v7[7] = v4;
  v7[8] = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1946DC;
  v7[3] = &unk_456DE0;
  v7[4] = self;
  return [[THWTapGestureAction alloc] initWithAction:v7];
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    id v6 = [self layout:a3 layoutController];
    if ([v6 isCompactHeight])
    {
      return 2;
    }
    else if ([v6 isCompactWidth])
    {
      return 5;
    }
  }
  return a5;
}

- (void)handleNavigateNextCommand
{
  v2 = [(THWKeynoteShowRep *)[(THWKeynoteRep *)self showRep] transportControlClone];
  if ([(TSWTransportControlClone *)v2 transportControlCloneCanGotoNext])
  {
    [(TSWTransportControlClone *)v2 transportControlCloneGotoNext];
  }
}

- (void)handleNavigatePreviousCommand
{
  v2 = [(THWKeynoteShowRep *)[(THWKeynoteRep *)self showRep] transportControlClone];
  if ([(TSWTransportControlClone *)v2 transportControlCloneCanGotoPrev])
  {
    [(TSWTransportControlClone *)v2 transportControlCloneGotoPrev];
  }
}

- (int)autoRotationMode
{
  return 3;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  [(-[THWKeynoteRep showRep](self, "showRep")) layout].showSize;
  TSDScaleSizeWithinSize();
  double v6 = v5;
  double v8 = v7;
  [(-[THWKeynoteRep showRep](self, "showRep")) layout].showSize
  TSDScaleSizeWithinSize();
  *(float *)&double v9 = v9 / v6;
  *(float *)&double v10 = v10 / v8;
  return fminf(*(float *)&v9, *(float *)&v10);
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  id v3 = [(THWKeynoteRep *)self layout];

  [v3 invalidateFrame];
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWKeynoteRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]|| (id result = [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWKeynoteRep *)self freeTransformableHandler] ftc] freeTransformLayer]) == 0)
  {
    id v4 = [(THWKeynoteRep *)self interactiveCanvasController];
    double v5 = [(THWKeynoteRep *)self showRep];
    return [v4 layerForRep:v5];
  }
  return result;
}

- (id)shadowAnimationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWKeynoteRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])return 0; {
  id v3 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWKeynoteRep *)self freeTransformableHandler] ftc];
  }

  return [(THWFreeTransformController *)v3 shadowLayer];
}

- (CGAffineTransform)freeTransform
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id result = (CGAffineTransform *)[(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWKeynoteRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress];
  if (result)
  {
    id result = [(THWFreeTransformableRepGestureTargetHandler *)[(THWKeynoteRep *)self freeTransformableHandler] ftc];
    if (result)
    {
      id result = (CGAffineTransform *)[(CGAffineTransform *)result currentTransform];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    long long v7 = v9;
    *(_OWORD *)&retstr->a = v8;
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tdouble x = v10;
  }
  return result;
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWKeynoteRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]&& ![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWKeynoteRep *)self freeTransformableHandler] ftc] passedThreshold])
  {
    return 0;
  }

  return [(THWKeynoteRep *)self animationLayer];
}

- (CGRect)ftcTargetFrame
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWKeynoteRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])
  {
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWKeynoteRep *)self freeTransformableHandler] ftc] completionTargetRect];
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)animationControllerDidPresent:(id)a3
{
  self->_animationController = 0;
}

- (THWKeynoteShowRep)showRep
{
  objc_opt_class();
  [self canvas] repForLayout:[self layout] showLayout];

  return (THWKeynoteShowRep *)TSUDynamicCast();
}

- (THWTransportControlRep)transportControlRep
{
  objc_opt_class();
  [self canvas] repForLayout:[self layout] transportControlLayout];

  return (THWTransportControlRep *)TSUDynamicCast();
}

- (void)p_keynoteShowDidUpdate:(id)a3
{
  id v4 = (TSWTransportControlClone *)[a3 object];
  if (v4 == [(THWKeynoteShowRep *)[(THWKeynoteRep *)self showRep] transportControlClone])
  {
    id v5 = [(THWKeynoteRep *)self layout];
    [v5 hidePlayButton];
  }
}

- (BOOL)canHandleGesture:(id)a3 forChildRep:(id)a4
{
  if ([(THWPressableRepGestureTargetHandler *)[(THWKeynoteRep *)self pressableHandler] canHandleGesture:a3 forChildRep:a4])
  {
    return 1;
  }
  id v6 = [a3 gestureKind];
  return v6 == (id)TSDFreeTransform;
}

- (BOOL)isExpanded
{
  id v2 = [(THWKeynoteRep *)self layout];

  return [v2 isExpanded];
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  objc_msgSend(objc_msgSend(-[THWKeynoteRep layout](self, "layout"), "geometry"), "size");
  return v3 < 660.0 || v2 < 960.0;
}

- (id)shadowPath
{
  return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 1;
}

- (BOOL)isFreeTransformInProgress
{
  double v2 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWKeynoteRep *)self freeTransformableHandler] ftc];

  return [(THWFreeTransformController *)v2 isFreeTransformInProgress];
}

- (void)freeTransformWillBegin
{
  [THWKeynoteRep layout][self layout] hidePlayButton
  double v3 = [(THWKeynoteRep *)self showRep];

  [(THWKeynoteShowRep *)v3 pauseLayerUpdates];
}

- (void)freeTransformDidEnd
{
  [self layout].showPlayButton;
  double v3 = [(THWKeynoteRep *)self showRep];

  [(THWKeynoteShowRep *)v3 resumeLayerUpdatesAndLayoutImmediately];
}

- (CGRect)rectForCompletion
{
  id v2 = [(THWKeynoteShowRep *)[(THWKeynoteRep *)self showRep] layout];

  [v2 frameInParent];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)canHandleGesture:(id)a3
{
  if ([(THWPressableRepGestureTargetHandler *)[(THWKeynoteRep *)self pressableHandler] canHandleGesture:a3])
  {
    return 1;
  }
  double v6 = [(THWKeynoteRep *)self freeTransformableHandler];

  return [(THWFreeTransformableRepGestureTargetHandler *)v6 canHandleGesture:a3];
}

- (BOOL)handleGesture:(id)a3
{
  if ([(THWPressableRepGestureTargetHandler *)[(THWKeynoteRep *)self pressableHandler] handleGesture:a3])
  {
    return 1;
  }
  double v6 = [(THWKeynoteRep *)self freeTransformableHandler];

  return [(THWFreeTransformableRepGestureTargetHandler *)v6 handleGesture:a3];
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 == (id)TSDFreeTransform)
  {
    double v6 = [(THWKeynoteRep *)self freeTransformableHandler];
    [(THWFreeTransformableRepGestureTargetHandler *)v6 willBeginHandlingGesture:a3];
  }
}

- (BOOL)freeTransformInteractionEnabledOverride
{
  return 1;
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  id v2 = [(THWKeynoteRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v2 widgetInteractionDisabledOnPage];
}

- (BOOL)wantsPressAction
{
  if ([(THWKeynoteRep *)self meetsStageDimensionRequirementForExpanded]
    || (BOOL v3 = [(THWPressableRepGestureTargetHandler *)self->_pressableHandler widgetInteractionDisabledOnPage]))
  {
    LOBYTE(v3) = [(THWKeynoteRep *)self pressableAction] != 0;
  }
  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return [self layout:@"layout" a3].isExpanded ^ 1;
}

- (int)pressableAction
{
  return 2;
}

- (CGRect)pressableNaturalBounds
{
  id v2 = [(-[THWKeynoteRep showRep](self, "showRep")) layout].geometry;

  [v2 frame];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 1;
}

- (BOOL)widgetInteractionAllowAutoplayForCompact
{
  return 1;
}

- (THWAutoplayConfig)autoplayConfig
{
  id v2 = [(THWKeynoteRep *)self info];

  return (THWAutoplayConfig *)[v2 autoplayConfig];
}

- (BOOL)autoplayAllowed
{
  id v2 = [(THWKeynoteRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v2 widgetInteractionAllowAutoplay];
}

- (BOOL)keynoteShowRep:(id)a3 handleURL:(id)a4
{
  id v7 = objc_msgSend(objc_msgSend(a4, "scheme"), "lowercaseString");
  if ([(THWKeynoteRep *)self showRep] != a3) {
    goto LABEL_2;
  }
  LODWORD(v8) = [[TSKApplicationDelegate sharedDelegate] validURLSchemes] containsObject:v7];
  if (!v8) {
    return (char)v8;
  }
  if (![v7 isEqualToString:@"ibooks"] || objc_msgSend(a4, "host"))
  {
    [+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate") openURL:a4];
LABEL_2:
    LOBYTE(v8) = 0;
    return (char)v8;
  }
  if ([(THWKeynoteRep *)self isExpanded])
  {
    [self interactiveCanvasController].delegate
    long long v8 = (void *)TSUProtocolCast();
    if (!v8) {
      return (char)v8;
    }
    [v8 handleHyperlinkWithURL:a4];
  }
  else
  {
    objc_opt_class();
    [(THWKeynoteRep *)self interactiveCanvasController];
    [(id)TSUDynamicCast() performSelectorOnMainThread:"handleHyperlinkWithURL:" withObject:a4 waitUntilDone:0];
  }
  LOBYTE(v8) = 1;
  return (char)v8;
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (BOOL)tracksScore
{
  return self->_tracksScore;
}

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->_freeTransformableHandler;
}

- (void)setPressableHandler:(id)a3
{
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (BOOL)panelDescriptionExpanded
{
  return self->_panelDescriptionExpanded;
}

- (void)setPanelDescriptionExpanded:(BOOL)a3
{
  self->_panelDescriptionExpanded = a3;
}

@end