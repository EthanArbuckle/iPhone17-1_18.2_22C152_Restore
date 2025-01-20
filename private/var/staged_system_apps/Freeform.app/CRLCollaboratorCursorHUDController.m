@interface CRLCollaboratorCursorHUDController
- (BOOL)isFollowing;
- (BOOL)p_isCompact;
- (BOOL)shouldAutoHide;
- (BOOL)shouldAutoShrink;
- (BOOL)shouldAutoTimeout;
- (CGPoint)p_cachedAnchorPointForDirection:(unint64_t)a3;
- (CGRect)p_unscaledHUDFrame;
- (CGRect)scaledFrameForHUDAtPoint:(CGPoint)a3 withDirection:(unint64_t)a4;
- (CGSize)p_avatarSize;
- (CGSize)p_displayStringSize;
- (CGSize)p_followButtonSize;
- (CGSize)p_followButtonStringSize;
- (CGSize)p_sizeForString:(id)a3 font:(id)a4;
- (CRLCollaboratorCursorHUDController)initWithCollaboratorPresence:(id)a3 delegate:(id)a4 hudSize:(unint64_t)a5 shouldAutoShrink:(BOOL)a6 shouldAutoHide:(BOOL)a7 isFollowing:(BOOL)a8 isLocalParticipant:(BOOL)a9;
- (CRLCollaboratorCursorHUDController)initWithCollaboratorPresence:(id)a3 delegate:(id)a4 string:(id)a5 hudSize:(unint64_t)a6 shouldAutoTimeout:(BOOL)a7;
- (NSArray)decoratorOverlayRenderables;
- (NSString)string;
- (_TtC8Freeform23CRLCollaboratorPresence)collaboratorPresence;
- (double)p_avatarLeadingSpace;
- (double)p_avatarTrailingSpace;
- (double)p_currentDesiredOpacity;
- (double)p_displayStringTrailingSpace;
- (double)p_followButtonInternalHorizontalPadding;
- (double)p_followButtonTrailingSpace;
- (double)p_maximumDisplayStringWidth;
- (double)p_totalHeight;
- (double)p_verticalTextOffset;
- (double)p_widthOfEverythingExceptDisplayString;
- (id)decoratorOverlayViews;
- (id)p_bezierPathForHUDWithFrame:(CGRect)a3 direction:(unint64_t)a4 outAnchorPoint:(CGPoint *)a5;
- (id)p_cachedPath;
- (id)p_decoratorOverlayRenderablesLegacy;
- (id)p_decoratorOverlayRenderablesWithFollow;
- (id)p_delegate;
- (id)p_followToggleOverlayView;
- (id)p_fontForDisplayString;
- (id)p_fontForFollowButtonString;
- (id)p_sizeToggleOverlayView;
- (id)p_stringToDisplay;
- (int64_t)p_getAccessibilitySizeFromTraitCollection;
- (unint64_t)hudSize;
- (void)dealloc;
- (void)didEndZoomingOperation;
- (void)hideHUD;
- (void)moveHUDToPoint:(CGPoint)a3 withDirection:(unint64_t)a4;
- (void)p_autoHideHUD;
- (void)p_autoShrinkHUD;
- (void)p_clearPathAndAnchorPointCaches;
- (void)p_followButtonPressed:(id)a3;
- (void)p_hideFollowHUD;
- (void)p_hideHUDLegacy;
- (void)p_stringFontSize:(double *)a3 fontWeight:(double *)a4 isDisplayString:(BOOL)a5;
- (void)p_toggleSize;
- (void)p_updateButtonRenderableFillColor;
- (void)resetAutoHideTimer;
- (void)resetAutoShrinkTimer;
- (void)resetFadeOutTimer;
- (void)setIsFollowing:(BOOL)a3;
- (void)setShouldFadeOutUnconditionally:(BOOL)a3;
- (void)showHUDAtPoint:(CGPoint)a3 withDirection:(unint64_t)a4;
- (void)startAutoHideTimer;
- (void)startAutoShrinkTimer;
- (void)stopAutoHideTimer;
- (void)stopAutoShrinkTimer;
- (void)teardown;
- (void)userInteractionBeganForView:(id)a3;
- (void)userInteractionCancelledForView:(id)a3;
- (void)userInteractionEndedForView:(id)a3;
@end

@implementation CRLCollaboratorCursorHUDController

- (CRLCollaboratorCursorHUDController)initWithCollaboratorPresence:(id)a3 delegate:(id)a4 string:(id)a5 hudSize:(unint64_t)a6 shouldAutoTimeout:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = v15;
  if (v13)
  {
    if (v15) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E19C8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10108A928();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E19E8);
  }
  v17 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v17);
  }
  v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController initWithCollaboratorPresence:delegate:string:hudSize:shouldAutoTimeout:]");
  v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 110, 0, "Invalid parameter not satisfying: %{public}s", "collaboratorPresence != nil");

  if (!v16)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1A08);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108A894();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1A28);
    }
    v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController initWithCollaboratorPresence:delegate:string:hudSize:shouldAutoTimeout:]");
    v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 111, 0, "Invalid parameter not satisfying: %{public}s", "string != nil");
  }
LABEL_22:
  v44.receiver = self;
  v44.super_class = (Class)CRLCollaboratorCursorHUDController;
  v23 = [(CRLCollaboratorCursorHUDController *)&v44 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->mCollaboratorPresence, a3);
    objc_storeWeak((id *)&v24->mDelegate, v14);
    v25 = (NSString *)[v16 copy];
    mFullNameString = v24->mFullNameString;
    v24->mFullNameString = v25;

    mShortNameString = v24->mShortNameString;
    v24->mShortNameString = 0;

    mFollowString = v24->mFollowString;
    v24->mFollowString = 0;

    v24->mHUDSize = a6;
    v29 = objc_alloc_init(CRLOnce);
    mPreferredSizeOfFullNameStringOnce = v24->mPreferredSizeOfFullNameStringOnce;
    v24->mPreferredSizeOfFullNameStringOnce = v29;

    v31 = objc_alloc_init(CRLOnce);
    mPreferredSizeOfShortNameStringOnce = v24->mPreferredSizeOfShortNameStringOnce;
    v24->mPreferredSizeOfShortNameStringOnce = v31;

    v24->mIsFollowing = 0;
    v24->mShouldAutoTimeout = a7;
    mFollowButtonRenderable = v24->mFollowButtonRenderable;
    v24->mFollowButtonRenderable = 0;

    [(CRLCollaboratorCursorHUDController *)v24 p_avatarSize];
    double v35 = v34;
    double v37 = v36;
    v38 = [_TtC8Freeform29CRLCollaboratorAvatarRenderer alloc];
    v39 = [v13 owner];
    v40 = [v39 contact];
    v41 = -[CRLCollaboratorAvatarRenderer initWithContact:size:](v38, "initWithContact:size:", v40, v35, v37);
    mAvatarRenderer = v24->mAvatarRenderer;
    v24->mAvatarRenderer = v41;

    v24->mFollowEnabled = 0;
    *(_WORD *)&v24->mShouldAutoHide = 0;
  }

  return v24;
}

- (CRLCollaboratorCursorHUDController)initWithCollaboratorPresence:(id)a3 delegate:(id)a4 hudSize:(unint64_t)a5 shouldAutoShrink:(BOOL)a6 shouldAutoHide:(BOOL)a7 isFollowing:(BOOL)a8 isLocalParticipant:(BOOL)a9
{
  BOOL v11 = a6;
  id v16 = a3;
  id v17 = a4;
  if (!v16)
  {
    HIDWORD(v48) = v11;
    LODWORD(v48) = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1A48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108A9BC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1A68);
    }
    v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v18);
    }
    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController initWithCollaboratorPresence:delegate:hudSize:shouldAutoShrink:shouldAutoHide:isFollowing:isLocalParticipant:]");
    v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 138, 0, "Invalid parameter not satisfying: %{public}s", "collaboratorPresence != nil", v48);

    LOBYTE(v11) = v49;
  }
  v50.receiver = self;
  v50.super_class = (Class)CRLCollaboratorCursorHUDController;
  v21 = [(CRLCollaboratorCursorHUDController *)&v50 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->mCollaboratorPresence, a3);
    objc_storeWeak((id *)&v22->mDelegate, v17);
    v22->mHUDSize = a5;
    v23 = objc_alloc_init(CRLOnce);
    mPreferredSizeOfFullNameStringOnce = v22->mPreferredSizeOfFullNameStringOnce;
    v22->mPreferredSizeOfFullNameStringOnce = v23;

    v25 = objc_alloc_init(CRLOnce);
    mPreferredSizeOfShortNameStringOnce = v22->mPreferredSizeOfShortNameStringOnce;
    v22->mPreferredSizeOfShortNameStringOnce = v25;

    v27 = objc_alloc_init(CRLOnce);
    mPreferredSizeOfFollowStringOnce = v22->mPreferredSizeOfFollowStringOnce;
    v22->mPreferredSizeOfFollowStringOnce = v27;

    v22->mIsFollowing = a8;
    v22->mIsLocalParticipant = a9;
    v22->mShouldAutoHide = a7;
    v22->mShouldAutoShrink = v11;
    v22->mShouldAutoTimeout = 0;
    v22->mFollowEnabled = 1;
    v29 = [v16 shortDisplayName];
    v30 = (NSString *)[v29 copy];
    mShortNameString = v22->mShortNameString;
    v22->mShortNameString = v30;

    v32 = [v16 displayName];
    v33 = (NSString *)[v32 copy];
    mFullNameString = v22->mFullNameString;
    v22->mFullNameString = v33;

    double v35 = +[NSBundle mainBundle];
    uint64_t v36 = [v35 localizedStringForKey:@"Follow" value:0 table:0];
    mFollowString = v22->mFollowString;
    v22->mFollowString = (NSString *)v36;

    [(CRLCollaboratorCursorHUDController *)v22 p_avatarSize];
    double v39 = v38;
    double v41 = v40;
    v42 = [_TtC8Freeform29CRLCollaboratorAvatarRenderer alloc];
    v43 = [v16 owner];
    objc_super v44 = [v43 contact];
    v45 = -[CRLCollaboratorAvatarRenderer initWithContact:size:](v42, "initWithContact:size:", v44, v39, v41);
    mAvatarRenderer = v22->mAvatarRenderer;
    v22->mAvatarRenderer = v45;
  }
  return v22;
}

- (void)dealloc
{
  [(NSTimer *)self->mHideHUDTimer invalidate];
  [(NSTimer *)self->mAbsoluteTimeTimer invalidate];
  [(NSTimer *)self->mAutoShrinkTimer invalidate];
  [(NSTimer *)self->mAutoHideTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRLCollaboratorCursorHUDController;
  [(CRLCollaboratorCursorHUDController *)&v3 dealloc];
}

- (void)teardown
{
  [(NSTimer *)self->mHideHUDTimer invalidate];
  mHideHUDTimer = self->mHideHUDTimer;
  self->mHideHUDTimer = 0;

  [(NSTimer *)self->mAbsoluteTimeTimer invalidate];
  mAbsoluteTimeTimer = self->mAbsoluteTimeTimer;
  self->mAbsoluteTimeTimer = 0;

  [(CRLCollaboratorCursorHUDController *)self stopAutoHideTimer];
  [(CRLCollaboratorCursorHUDController *)self stopAutoShrinkTimer];
  v5 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
  [v5 removeCollaboratorHUDController:self];

  mHUDRenderable = self->mHUDRenderable;
  self->mHUDRenderable = 0;

  mSizeToggleOverlayView = self->mSizeToggleOverlayView;
  self->mSizeToggleOverlayView = 0;

  mFollowToggleOverlayView = self->mFollowToggleOverlayView;
  self->mFollowToggleOverlayView = 0;

  self->mShouldAutoTimeout = 0;
}

- (void)showHUDAtPoint:(CGPoint)a3 withDirection:(unint64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
  [v8 addCollaboratorHUDController:self];

  if (sub_100067C90())
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1A88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108AA50();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1AA8);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController showHUDAtPoint:withDirection:]");
    BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
    v15.CGFloat x = x;
    v15.CGFloat y = y;
    v12 = NSStringFromCGPoint(v15);
    +[CRLAssertionHandler handleFailureInFunction:v10, v11, 189, 0, "Invalid target point for collaborator HUD! %@", v12 file lineNumber isFatal description];

    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
  }
  self->mTargetPoint.CGFloat x = x;
  self->mTargetPoint.CGFloat y = y;
  self->mDirection = a4;
  if (self->mFollowEnabled)
  {
    if (!self->mHUDSize)
    {
      if (self->mShouldAutoShrink) {
        [(CRLCollaboratorCursorHUDController *)self resetAutoShrinkTimer];
      }
      if (self->mShouldAutoHide) {
        [(CRLCollaboratorCursorHUDController *)self resetAutoHideTimer];
      }
    }
  }
  else
  {
    [(CRLCollaboratorCursorHUDController *)self resetFadeOutTimer];
    if (self->mShouldUnconditionallyFadeOutHUD
      && self->mShouldAutoTimeout
      && !self->mAbsoluteTimeTimer
      && self->mHUDSize == 1)
    {
      id v13 = +[NSTimer scheduledTimerWithTimeInterval:self target:"hideHUD" selector:0 userInfo:0 repeats:7.0];
      mAbsoluteTimeTimer = self->mAbsoluteTimeTimer;
      self->mAbsoluteTimeTimer = v13;
    }
    if (!self->mHUDSize && !self->mShouldAutoTimeout && !self->mAutoShrinkTimer) {
      [(CRLCollaboratorCursorHUDController *)self resetAutoShrinkTimer];
    }
  }
}

- (void)hideHUD
{
  if (self->mFollowEnabled) {
    [(CRLCollaboratorCursorHUDController *)self p_hideFollowHUD];
  }
  else {
    [(CRLCollaboratorCursorHUDController *)self p_hideHUDLegacy];
  }
}

- (void)resetFadeOutTimer
{
  if (self->mShouldUnconditionallyFadeOutHUD && self->mShouldAutoTimeout)
  {
    [(NSTimer *)self->mHideHUDTimer invalidate];
    objc_super v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"hideHUD" selector:0 userInfo:0 repeats:1.75];
    mHideHUDTimer = self->mHideHUDTimer;
    self->mHideHUDTimer = v3;
  }
}

- (void)setShouldFadeOutUnconditionally:(BOOL)a3
{
  self->mShouldUnconditionallyFadeOutHUD = a3;
}

- (void)moveHUDToPoint:(CGPoint)a3 withDirection:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if (sub_100067C90())
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1AC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108AB10();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1AE8);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController moveHUDToPoint:withDirection:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
    v18.double x = x;
    v18.double y = y;
    BOOL v11 = NSStringFromCGPoint(v18);
    +[CRLAssertionHandler handleFailureInFunction:v9, v10, 249, 0, "Invalid target point for collaborator HUD! %@", v11 file lineNumber isFatal description];
  }
  else
  {
    if (self->mTargetPoint.x == x && self->mTargetPoint.y == y)
    {
      unint64_t mDirection = self->mDirection;
      self->mTargetPoint.double x = x;
      self->mTargetPoint.double y = y;
      self->unint64_t mDirection = a4;
      mHUDRenderable = self->mHUDRenderable;
      self->mHUDRenderable = 0;

      if (mDirection == a4) {
        return;
      }
    }
    else
    {
      self->mTargetPoint.double x = x;
      self->mTargetPoint.double y = y;
      self->unint64_t mDirection = a4;
      id v13 = self->mHUDRenderable;
      self->mHUDRenderable = 0;
    }
    id v16 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
    [v16 positionDidUpdateForCollaboratorHUDController:self];
  }
}

- (CGRect)scaledFrameForHUDAtPoint:(CGPoint)a3 withDirection:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if (sub_100067C90())
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1B08);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108ABD0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1B28);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController scaledFrameForHUDAtPoint:withDirection:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
    v35.double x = x;
    v35.double y = y;
    BOOL v11 = NSStringFromCGPoint(v35);
    +[CRLAssertionHandler handleFailureInFunction:v9, v10, 265, 0, "Invalid target point for collaborator HUD! %@", v11 file lineNumber isFatal description];

    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  [(CRLCollaboratorCursorHUDController *)self p_unscaledHUDFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = +[CRLCanvasShapeRenderable renderable];
  CGPoint v34 = CGPointZero;
  -[CRLCollaboratorCursorHUDController p_bezierPathForHUDWithFrame:direction:outAnchorPoint:](self, "p_bezierPathForHUDWithFrame:direction:outAnchorPoint:", a4, &v34, v13, v15, v17, v19);
  id v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPath:", objc_msgSend(v21, "CGPath"));
  [v21 bounds];
  [v20 setBounds:];
  [v20 setAnchorPoint:v34];
  [v20 setPosition:x, y];
  [v20 frame];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v30 = v23;
  double v31 = v25;
  double v32 = v27;
  double v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (id)p_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);

  return WeakRetained;
}

- (BOOL)p_isCompact
{
  return self->mHUDSize == 1;
}

- (void)didEndZoomingOperation
{
  id v3 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
  [v3 updatePositionForCollaboratorHUDController:self];
}

- (void)p_hideFollowHUD
{
  [(CRLCollaboratorCursorHUDController *)self stopAutoHideTimer];
  [(CRLCanvasRenderable *)self->mHUDRenderable setOpacity:0.0];
  [(CRLCollaboratorCursorOverlayView *)self->mSizeToggleOverlayView setAlpha:0.0];
  [(CRLCollaboratorCursorOverlayView *)self->mFollowToggleOverlayView setAlpha:0.0];
  id v3 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
  [v3 removeCollaboratorHUDController:self];
}

- (void)p_hideHUDLegacy
{
  [(NSTimer *)self->mHideHUDTimer invalidate];
  mHideHUDTimer = self->mHideHUDTimer;
  self->mHideHUDTimer = 0;

  [(NSTimer *)self->mAbsoluteTimeTimer invalidate];
  mAbsoluteTimeTimer = self->mAbsoluteTimeTimer;
  self->mAbsoluteTimeTimer = 0;

  if (self->mFadeStartTime == 0.0)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    self->mFadeStartTime = v5;
  }
  [(CRLCollaboratorCursorHUDController *)self p_currentDesiredOpacity];
  double v7 = v6;
  *(float *)&double v6 = v6;
  [(CRLCanvasRenderable *)self->mHUDRenderable setOpacity:v6];
  [(CRLCollaboratorCursorOverlayView *)self->mSizeToggleOverlayView setAlpha:v7];
  [(CRLCollaboratorCursorOverlayView *)self->mFollowToggleOverlayView setAlpha:v7];
  +[CATransaction begin];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001FBC60;
  v11[3] = &unk_1014CBBB0;
  v11[4] = self;
  +[CATransaction setCompletionBlock:v11];
  [(CRLCanvasRenderable *)self->mHUDRenderable opacity];
  double v9 = sub_100065C88(0.0, 0.200000003, v8);
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
  [(CRLCanvasRenderable *)self->mHUDRenderable setOpacity:0.0];
  +[CATransaction commit];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001FBD08;
  v10[3] = &unk_1014CBBB0;
  v10[4] = self;
  +[UIView animateWithDuration:v10 animations:v9];
}

- (double)p_currentDesiredOpacity
{
  if (self->mFadeStartTime == 0.0) {
    return 1.0;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double result = (v3 - self->mFadeStartTime) / -0.200000003 + 1.0;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (void)p_followButtonPressed:(id)a3
{
  id v4 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
  [v4 beginFollowing:self->mCollaboratorPresence forHUDController:self];
}

- (id)p_stringToDisplay
{
  if (self->mFollowEnabled && !self->mIsFollowing) {
    uint64_t v2 = 112;
  }
  else {
    uint64_t v2 = 104;
  }
  return *(id *)((char *)&self->super.isa + v2);
}

- (NSArray)decoratorOverlayRenderables
{
  if (self->mFollowEnabled) {
    [(CRLCollaboratorCursorHUDController *)self p_decoratorOverlayRenderablesWithFollow];
  }
  else {
  uint64_t v2 = [(CRLCollaboratorCursorHUDController *)self p_decoratorOverlayRenderablesLegacy];
  }

  return (NSArray *)v2;
}

- (id)p_decoratorOverlayRenderablesLegacy
{
  mHideHUDTimer = self->mHideHUDTimer;
  id v4 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
  [(CRLCollaboratorCursorHUDController *)self p_currentDesiredOpacity];
  double v6 = v5;
  [v4 updatePositionForCollaboratorHUDController:self];
  if (self->mHideHUDTimer) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = mHideHUDTimer == 0;
  }
  if (v7)
  {
    mHUDRenderable = self->mHUDRenderable;
    if (!mHUDRenderable)
    {
      int v9 = sub_1003E86EC();
      [(CRLCollaboratorCursorHUDController *)self p_unscaledHUDFrame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v18 = [(CRLCollaboratorCursorHUDController *)self p_stringToDisplay];
      double v19 = +[CRLCanvasShapeRenderable renderable];
      v20 = self->mHUDRenderable;
      self->mHUDRenderable = v19;

      [(CRLCanvasRenderable *)self->mHUDRenderable setZPosition:1.0];
      if (sub_100065AF4(v11, v13, v15, v17))
      {
        CGPoint v75 = CGPointZero;
        id v21 = -[CRLCollaboratorCursorHUDController p_bezierPathForHUDWithFrame:direction:outAnchorPoint:](self, "p_bezierPathForHUDWithFrame:direction:outAnchorPoint:", self->mDirection, &v75, v11, v13, v15, v17);
        if ([v21 isEmpty])
        {
          unsigned int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E1B88);
          }
          double v23 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v70 = v23;
            v96.origin.double x = v11;
            v96.origin.double y = v13;
            v96.size.width = v15;
            v96.size.height = v17;
            v71 = NSStringFromCGRect(v96);
            unint64_t mDirection = self->mDirection;
            unint64_t mHUDSize = self->mHUDSize;
            *(_DWORD *)buf = 67110914;
            *(_DWORD *)&buf[4] = v22;
            __int16 v78 = 2082;
            v79 = "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesLegacy]";
            __int16 v80 = 2082;
            v81 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m";
            __int16 v82 = 1024;
            int v83 = 433;
            __int16 v84 = 2114;
            v85 = v71;
            __int16 v86 = 2048;
            unint64_t v87 = mDirection;
            __int16 v88 = 2048;
            unint64_t v89 = mHUDSize;
            __int16 v90 = 2112;
            v91 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Produced an empty bezier path for HUD with frame %{public}@ direction %zi HUD size %zi string %@", buf, 0x4Au);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E1BA8);
          }
          double v24 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v24);
          }
          double v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesLegacy]");
          double v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
          v93.origin.double x = v11;
          v93.origin.double y = v13;
          v93.size.width = v15;
          v93.size.height = v17;
          double v27 = NSStringFromCGRect(v93);
          +[CRLAssertionHandler handleFailureInFunction:v25, v26, 433, 0, "Produced an empty bezier path for HUD with frame %{public}@ direction %zi HUD size %zi string %@", v27, self->mDirection, self->mHUDSize, v18 file lineNumber isFatal description];
        }
        else
        {
          id v35 = v21;
          -[CRLCanvasShapeRenderable setPath:](self->mHUDRenderable, "setPath:", [v35 CGPath]);
          [v35 bounds];
          -[CRLCanvasRenderable setBounds:](self->mHUDRenderable, "setBounds:");
          [(CRLCanvasRenderable *)self->mHUDRenderable setAnchorPoint:v75];
          if ((sub_100067C90() & 1) == 0)
          {
            -[CRLCanvasRenderable setPosition:](self->mHUDRenderable, "setPosition:", self->mTargetPoint.x, self->mTargetPoint.y);
            [(CRLCanvasRenderable *)self->mHUDRenderable frame];
            double v37 = v36;
            CGFloat v39 = v38;
            CGFloat v41 = v40;
            CGFloat v43 = v42;
            [v4 contentsScale];
            [(CRLCanvasRenderable *)self->mHUDRenderable setFrame:sub_100067584(v37, v39, v41, v43, v44)];
          }
          if ([(CRLCollaboratorCursorHUDController *)self p_isCompact])
          {
            double v25 = +[CRLColor clearColor];
          }
          else
          {
            v45 = [(CRLCollaboratorPresence *)self->mCollaboratorPresence owner];
            double v25 = [v45 collaboratorColorForType:1];
          }
          -[CRLCanvasShapeRenderable setFillColor:](self->mHUDRenderable, "setFillColor:", [v25 CGColor]);
          *(float *)&double v46 = v6;
          [(CRLCanvasRenderable *)self->mHUDRenderable setOpacity:v46];
          double v26 = +[CRLCanvasRenderable renderable];
          mAvatarRenderer = self->mAvatarRenderer;
          [v4 contentsScale];
          double v27 = -[CRLCollaboratorAvatarRenderer renderAvatarImageWithContentsScale:](mAvatarRenderer, "renderAvatarImageWithContentsScale:");
          [(CRLCollaboratorCursorHUDController *)self p_avatarSize];
          double v49 = v48;
          double v51 = v50;
          [(CRLCollaboratorCursorHUDController *)self p_avatarLeadingSpace];
          if (v9) {
            double v53 = v15 - v52 - v49;
          }
          else {
            double v53 = v52;
          }
          [v26 setContents:[v27 CGImage]];
          [v26 setFrame:v53, (v17 - v51) * 0.5, v49, v51];
          [v4 contentsScale];
          [v26 setContentsScale:];
          [(CRLCanvasRenderable *)self->mHUDRenderable addSubrenderable:v26];
          if (![(CRLCollaboratorCursorHUDController *)self p_isCompact])
          {
            [(CRLCollaboratorCursorHUDController *)self p_displayStringSize];
            double v55 = v54;
            double v57 = v56;
            v58 = +[CRLCanvasTextRenderable renderable];
            [(CRLCollaboratorCursorHUDController *)self p_avatarLeadingSpace];
            double v60 = v49 + v59;
            [(CRLCollaboratorCursorHUDController *)self p_avatarTrailingSpace];
            double v62 = v60 + v61;
            if (v9) {
              double v63 = v15 - (v55 + v62);
            }
            else {
              double v63 = v62;
            }
            [v58 setString:v18];
            [v4 contentsScale];
            [v58 setFrame:sub_100067584(v63, (v17 - v57) * 0.5, v55, v57, v64)];
            *(void *)buf = 0;
            double v74 = 0.0;
            [(CRLCollaboratorCursorHUDController *)self p_stringFontSize:buf fontWeight:&v74 isDisplayString:1];
            [v58 setFontSize:*(double *)buf];
            if ((unint64_t)[v18 length] >= 4) {
              [v58 setTruncationMode:kCATruncationEnd];
            }
            v65 = +[UIFont systemFontOfSize:*(double *)buf weight:v74];
            [v58 setFont:v65];
            v66 = +[CRLColor whiteColor];
            [v58 setForegroundColor:[v66 CGColor]];

            [v4 contentsScale];
            [v58 setContentsScale:];
            [(CRLCanvasRenderable *)self->mHUDRenderable addSubrenderable:v58];
          }
        }
      }
      else
      {
        unsigned int v29 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E1B48);
        }
        double v30 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v68 = v30;
          v95.origin.double x = v11;
          v95.origin.double y = v13;
          v95.size.width = v15;
          v95.size.height = v17;
          v69 = NSStringFromCGRect(v95);
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)&buf[4] = v29;
          __int16 v78 = 2082;
          v79 = "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesLegacy]";
          __int16 v80 = 2082;
          v81 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m";
          __int16 v82 = 1024;
          int v83 = 428;
          __int16 v84 = 2114;
          v85 = v69;
          __int16 v86 = 2112;
          unint64_t v87 = (unint64_t)v18;
          _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Not creating cursor HUD because frame is %{public}@ for string %@", buf, 0x36u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E1B68);
        }
        double v31 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v31);
        }
        double v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesLegacy]");
        double v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
        v94.origin.double x = v11;
        v94.origin.double y = v13;
        v94.size.width = v15;
        v94.size.height = v17;
        CGPoint v34 = NSStringFromCGRect(v94);
        +[CRLAssertionHandler handleFailureInFunction:v32, v33, 428, 0, "Not creating cursor HUD because frame is %{public}@ for string %@", v34, v18 file lineNumber isFatal description];
      }
      if (v6 < 1.0)
      {
        +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"hideHUD" object:0];
        [(CRLCollaboratorCursorHUDController *)self performSelector:"hideHUD" withObject:0 afterDelay:0.0];
      }

      mHUDRenderable = self->mHUDRenderable;
    }
    v76 = mHUDRenderable;
    double v28 = +[NSArray arrayWithObjects:&v76 count:1];
  }
  else
  {
    double v28 = &__NSArray0__struct;
  }

  return v28;
}

- (id)p_decoratorOverlayRenderablesWithFollow
{
  double v3 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
  [v3 updatePositionForCollaboratorHUDController:self];
  mHUDRenderable = self->mHUDRenderable;
  if (!mHUDRenderable)
  {
    int v5 = sub_1003E86EC();
    [(CRLCollaboratorCursorHUDController *)self p_unscaledHUDFrame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = +[CRLCanvasShapeRenderable renderable];
    double v15 = self->mHUDRenderable;
    self->mHUDRenderable = v14;

    double v16 = [(CRLCollaboratorCursorHUDController *)self p_stringToDisplay];
    mFollowButtonRenderable = self->mFollowButtonRenderable;
    self->mFollowButtonRenderable = 0;

    [(CRLCanvasRenderable *)self->mHUDRenderable setZPosition:1.0];
    if (sub_100065AF4(v7, v9, v11, v13))
    {
      CGPoint v115 = CGPointZero;
      double v18 = -[CRLCollaboratorCursorHUDController p_bezierPathForHUDWithFrame:direction:outAnchorPoint:](self, "p_bezierPathForHUDWithFrame:direction:outAnchorPoint:", self->mDirection, &v115, v7, v9, v11, v13);
      if ([v18 isEmpty])
      {
        unsigned int v19 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E1C08);
        }
        v20 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v104 = v20;
          v135.origin.double x = v7;
          v135.origin.double y = v9;
          v135.size.width = v11;
          v135.size.height = v13;
          v105 = NSStringFromCGRect(v135);
          unint64_t mDirection = self->mDirection;
          unint64_t mHUDSize = self->mHUDSize;
          *(_DWORD *)buf = 67110914;
          *(_DWORD *)&buf[4] = v19;
          *(_WORD *)&uint8_t buf[8] = 2082;
          *(void *)&buf[10] = "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesWithFollow]";
          *(_WORD *)&buf[18] = 2082;
          *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m";
          __int16 v118 = 1024;
          int v119 = 531;
          __int16 v120 = 2114;
          v121 = v105;
          __int16 v122 = 2048;
          unint64_t v123 = mDirection;
          __int16 v124 = 2048;
          unint64_t v125 = mHUDSize;
          __int16 v126 = 2112;
          v127 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Produced an empty bezier path for HUD with frame %{public}@ direction %zi HUD size %zi string %@", buf, 0x4Au);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E1C28);
        }
        id v21 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v21);
        }
        unsigned int v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesWithFollow]");
        double v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
        v129.origin.double x = v7;
        v129.origin.double y = v9;
        v129.size.width = v11;
        v129.size.height = v13;
        double v24 = NSStringFromCGRect(v129);
        +[CRLAssertionHandler handleFailureInFunction:v22, v23, 531, 0, "Produced an empty bezier path for HUD with frame %{public}@ direction %zi HUD size %zi string %@", v24, self->mDirection, self->mHUDSize, v16 file lineNumber isFatal description];
      }
      else
      {
        id v31 = v18;
        -[CRLCanvasShapeRenderable setPath:](self->mHUDRenderable, "setPath:", [v31 CGPath]);
        [v31 bounds];
        -[CRLCanvasRenderable setBounds:](self->mHUDRenderable, "setBounds:");
        [(CRLCanvasRenderable *)self->mHUDRenderable setAnchorPoint:v115];
        if ((sub_100067C90() & 1) == 0)
        {
          -[CRLCanvasRenderable setPosition:](self->mHUDRenderable, "setPosition:", self->mTargetPoint.x, self->mTargetPoint.y);
          [(CRLCanvasRenderable *)self->mHUDRenderable frame];
          double v33 = v32;
          CGFloat v35 = v34;
          CGFloat v37 = v36;
          CGFloat v39 = v38;
          [v3 contentsScale];
          [(CRLCanvasRenderable *)self->mHUDRenderable setFrame:sub_100067584(v33, v35, v37, v39, v40)];
        }
        CGFloat v41 = [(CRLCollaboratorPresence *)self->mCollaboratorPresence owner];
        unsigned int v22 = [v41 collaboratorColorForType:1];

        if (!v22)
        {
          if (qword_101719BE8 != -1) {
            dispatch_once(&qword_101719BE8, &stru_1014E1C48);
          }
          double v42 = off_10166B618;
          if (os_log_type_enabled((os_log_t)off_10166B618, OS_LOG_TYPE_INFO))
          {
            mCollaboratorPresence = self->mCollaboratorPresence;
            double v44 = v42;
            v45 = [(CRLCollaboratorPresence *)mCollaboratorPresence owner];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = mCollaboratorPresence;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v45;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Collaborator Cursor: Unable to load collaborator color for presence: %{public}@ %{public}@", buf, 0x16u);
          }
        }
        v111 = v18;
        -[CRLCanvasShapeRenderable setFillColor:](self->mHUDRenderable, "setFillColor:", [v22 CGColor]);
        double v46 = +[CRLColor blackColor];
        -[CRLCanvasRenderable setShadowColor:](self->mHUDRenderable, "setShadowColor:", [v46 CGColor]);

        LODWORD(v47) = 1045220557;
        [(CRLCanvasRenderable *)self->mHUDRenderable setShadowOpacity:v47];
        [(CRLCanvasRenderable *)self->mHUDRenderable setShadowRadius:12.0];
        -[CRLCanvasRenderable setShadowOffset:](self->mHUDRenderable, "setShadowOffset:", 0.0, 2.0);
        double v23 = +[CRLCanvasRenderable renderable];
        mAvatarRenderer = self->mAvatarRenderer;
        [v3 contentsScale];
        double v24 = -[CRLCollaboratorAvatarRenderer renderAvatarImageWithContentsScale:](mAvatarRenderer, "renderAvatarImageWithContentsScale:");
        [(CRLCollaboratorCursorHUDController *)self p_avatarSize];
        double v50 = v49;
        double v52 = v51;
        [(CRLCollaboratorCursorHUDController *)self p_avatarLeadingSpace];
        if (v5) {
          double v54 = v11 - v53 - v50;
        }
        else {
          double v54 = v53;
        }
        [v23 setContents:[v24 CGImage]];
        [v23 setFrame:v54, (v13 - v52) * 0.5, v50, v52];
        [v3 contentsScale];
        [v23 setContentsScale:];
        double v55 = +[CRLCanvasShapeRenderable renderable];
        double v56 = +[CRLColor colorWithWhite:0.0 alpha:0.100000001];
        [v55 setFillColor:[v56 CGColor]];

        v131.origin.double x = v54;
        v131.origin.double y = (v13 - v52) * 0.5;
        v131.size.width = v50;
        v131.size.height = v52;
        CGRect v132 = CGRectInset(v131, -1.0, -1.0);
        +[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", v132.origin.x, v132.origin.y, v132.size.width, v132.size.height);
        id v57 = objc_claimAutoreleasedReturnValue();
        [v55 setPath:[v57 CGPath]];
        [v23 anchorPoint];
        [v55 setAnchorPoint:];
        [(CRLCanvasRenderable *)self->mHUDRenderable addSubrenderable:v55];
        [(CRLCanvasRenderable *)self->mHUDRenderable addSubrenderable:v23];
        if (![(CRLCollaboratorCursorHUDController *)self p_isCompact])
        {
          id v110 = v57;
          [(CRLCollaboratorCursorHUDController *)self p_displayStringSize];
          double v59 = v58;
          double v61 = v60;
          double v62 = +[CRLCanvasTextRenderable renderable];
          [v62 setString:v16];
          [(CRLCollaboratorCursorHUDController *)self p_avatarLeadingSpace];
          double v64 = v50 + v63;
          [(CRLCollaboratorCursorHUDController *)self p_avatarTrailingSpace];
          double v66 = v64 + v65;
          double v67 = v59 + v66;
          if (v5) {
            double v68 = v11 - (v59 + v66);
          }
          else {
            double v68 = v66;
          }
          [v3 contentsScale];
          [v62 setFrame:sub_100067584(v68, (v13 - v61) * 0.5, v59, v61, v69)];
          *(void *)buf = 0;
          uint64_t v114 = 0;
          [(CRLCollaboratorCursorHUDController *)self p_stringFontSize:buf fontWeight:&v114 isDisplayString:1];
          [v62 setFontSize:*(double *)buf];
          if ((unint64_t)[v16 length] >= 4) {
            [v62 setTruncationMode:kCATruncationEnd];
          }
          [v62 setFont:[self p_fontForDisplayString]];
          v70 = +[CRLColor whiteColor];
          objc_msgSend(v62, "setForegroundColor:", objc_msgSend(v70, "CGColor"));

          [v3 contentsScale];
          [v62 setContentsScale:];
          [(CRLCanvasRenderable *)self->mHUDRenderable addSubrenderable:v62];
          if (!self->mIsFollowing && !self->mIsLocalParticipant)
          {
            [(CRLCollaboratorCursorHUDController *)self p_followButtonSize];
            double v72 = v71;
            double v74 = v73;
            [(CRLCollaboratorCursorHUDController *)self p_displayStringTrailingSpace];
            double v76 = v67 + v75;
            if (v5) {
              double v77 = v11 - (v72 + v76);
            }
            else {
              double v77 = v76;
            }
            [v3 contentsScale];
            double v79 = sub_100067584(v77, (v13 - v74) * 0.5, v72, v74, v78);
            double v81 = v80;
            double v83 = v82;
            double v85 = v84;
            __int16 v86 = +[CRLCanvasShapeRenderable renderable];
            +[CRLBezierPath bezierPathWithContinuousCornerRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithContinuousCornerRoundedRect:cornerRadius:", v79, v81, v83, v85, v85 * 0.5);
            id v109 = objc_claimAutoreleasedReturnValue();
            -[CRLCanvasShapeRenderable setPath:](v86, "setPath:", [v109 CGPath]);
            [(CRLCanvasRenderable *)self->mHUDRenderable addSubrenderable:v86];
            unint64_t v87 = self->mFollowButtonRenderable;
            self->mFollowButtonRenderable = v86;
            v108 = v86;

            [(CRLCollaboratorCursorHUDController *)self p_updateButtonRenderableFillColor];
            [(CRLCollaboratorCursorHUDController *)self p_followButtonStringSize];
            CGFloat v89 = v88;
            double v91 = v90;
            v133.origin.double x = v79;
            v133.origin.double y = v81;
            v133.size.width = v83;
            v133.size.height = v85;
            double MinX = CGRectGetMinX(v133);
            [(CRLCollaboratorCursorHUDController *)self p_followButtonInternalHorizontalPadding];
            double v94 = MinX + v93;
            [(CRLCollaboratorCursorHUDController *)self p_verticalTextOffset];
            CGFloat v96 = (v13 - v91) * 0.5 - v95;
            v97 = +[CRLCanvasTextRenderable renderable];
            [v97 setString:self->mFollowString];
            [v3 contentsScale];
            [v97 setFrame:sub_100067584(v94, v96, v89, v91, v98)];
            uint64_t v112 = 0;
            double v113 = 0.0;
            [(CRLCollaboratorCursorHUDController *)self p_stringFontSize:&v113 fontWeight:&v112 isDisplayString:0];
            [v97 setFontSize:v113];
            [v97 setFont:[self p_fontForFollowButtonString]];
            v99 = +[CRLColor whiteColor];
            objc_msgSend(v97, "setForegroundColor:", objc_msgSend(v99, "CGColor"));

            [v3 contentsScale];
            [v97 setContentsScale:];
            [(CRLCanvasRenderable *)self->mHUDRenderable addSubrenderable:v97];
          }
          id v57 = v110;
        }

        double v18 = v111;
      }
    }
    else
    {
      unsigned int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1BC8);
      }
      double v26 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        v102 = v26;
        v134.origin.double x = v7;
        v134.origin.double y = v9;
        v134.size.width = v11;
        v134.size.height = v13;
        v103 = NSStringFromCGRect(v134);
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v25;
        *(_WORD *)&uint8_t buf[8] = 2082;
        *(void *)&buf[10] = "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesWithFollow]";
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m";
        __int16 v118 = 1024;
        int v119 = 526;
        __int16 v120 = 2114;
        v121 = v103;
        __int16 v122 = 2112;
        unint64_t v123 = (unint64_t)v16;
        _os_log_error_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Not creating cursor HUD because frame is %{public}@ for string %@", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1BE8);
      }
      double v27 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v27);
      }
      double v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesWithFollow]");
      unsigned int v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
      v130.origin.double x = v7;
      v130.origin.double y = v9;
      v130.size.width = v11;
      v130.size.height = v13;
      double v30 = NSStringFromCGRect(v130);
      +[CRLAssertionHandler handleFailureInFunction:v28, v29, 526, 0, "Not creating cursor HUD because frame is %{public}@ for string %@", v30, v16 file lineNumber isFatal description];
    }
    mHUDRenderable = self->mHUDRenderable;
  }
  v116 = mHUDRenderable;
  v100 = +[NSArray arrayWithObjects:&v116 count:1];

  return v100;
}

- (void)p_updateButtonRenderableFillColor
{
  double v3 = 0.5;
  if (!self->mInteractionInProgress) {
    double v3 = 0.300000012;
  }
  id v4 = +[CRLColor colorWithWhite:0.0 alpha:v3];
  -[CRLCanvasShapeRenderable setFillColor:](self->mFollowButtonRenderable, "setFillColor:", [v4 CGColor]);
}

- (id)p_followToggleOverlayView
{
  mFollowToggleOverlayView = self->mFollowToggleOverlayView;
  if (!mFollowToggleOverlayView)
  {
    id v4 = -[CRLCollaboratorCursorOverlayView initWithFrame:]([CRLCollaboratorCursorOverlayView alloc], "initWithFrame:", NSZeroRect.origin.x, NSZeroRect.origin.y, NSZeroRect.size.width, NSZeroRect.size.height);
    int v5 = self->mFollowToggleOverlayView;
    self->mFollowToggleOverlayView = v4;

    mFollowToggleOverlayView = self->mFollowToggleOverlayView;
  }

  return mFollowToggleOverlayView;
}

- (id)p_sizeToggleOverlayView
{
  mSizeToggleOverlayView = self->mSizeToggleOverlayView;
  if (!mSizeToggleOverlayView)
  {
    id v4 = -[CRLCollaboratorCursorOverlayView initWithFrame:]([CRLCollaboratorCursorOverlayView alloc], "initWithFrame:", NSZeroRect.origin.x, NSZeroRect.origin.y, NSZeroRect.size.width, NSZeroRect.size.height);
    int v5 = self->mSizeToggleOverlayView;
    self->mSizeToggleOverlayView = v4;

    mSizeToggleOverlayView = self->mSizeToggleOverlayView;
  }

  return mSizeToggleOverlayView;
}

- (id)decoratorOverlayViews
{
  if (!self->mFollowEnabled
    || !self->mHUDRenderable
    || ([(CRLCollaboratorCursorHUDController *)self p_delegate],
        double v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 shouldSuppressCollaboratorCursorHUDForController:self],
        v3,
        (v4 & 1) != 0))
  {
    id v5 = &__NSArray0__struct;
    goto LABEL_5;
  }
  unsigned int v7 = [(CRLCollaboratorCursorHUDController *)self p_isCompact];
  int v8 = sub_1003E86EC();
  [(CRLCollaboratorCursorHUDController *)self p_unscaledHUDFrame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (sub_100065AF4(v9, v11, v13, v15))
  {
    if ((v7 & 1) == 0)
    {
LABEL_30:
      double v27 = +[NSMutableArray array];
      [(CRLCollaboratorCursorHUDController *)self p_avatarLeadingSpace];
      double v29 = v28;
      [(CRLCollaboratorCursorHUDController *)self p_avatarSize];
      double v31 = v29 + v30;
      [(CRLCollaboratorCursorHUDController *)self p_avatarTrailingSpace];
      double v33 = v32 + v31;
      if (v8) {
        double v34 = v14 - v33;
      }
      else {
        double v34 = 0.0;
      }
      if (!sub_100065AF4(v34, 0.0, v33, v16))
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E1CE8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10108AD18();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E1D08);
        }
        CGFloat v35 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v35);
        }
        double v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController decoratorOverlayViews]");
        CGFloat v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v36 file:v37 lineNumber:714 isFatal:0 description:"Non-finite sizeOverlayFrameInRenderable."];
      }
      [(CRLCanvasRenderable *)self->mHUDRenderable frame];
      double v39 = sub_100064698(v34, 0.0, v38);
      double v41 = v40;
      double v42 = [(CRLCollaboratorCursorHUDController *)self p_sizeToggleOverlayView];
      [v42 setInteractionDelegate:self];
      [v42 setFrame:v39, v41, v33, v16];
      [v27 addObject:v42];
      if (!self->mIsFollowing)
      {
        [(CRLCollaboratorCursorHUDController *)self p_followButtonSize];
        double v44 = v43;
        [(CRLCollaboratorCursorHUDController *)self p_displayStringSize];
        double v46 = v33 + v45;
        [(CRLCollaboratorCursorHUDController *)self p_displayStringTrailingSpace];
        double v48 = v47 + v46;
        if (v8) {
          double v49 = v14 - (v44 + v48);
        }
        else {
          double v49 = v48;
        }
        if (!sub_100065AF4(v49, 0.0, v44, v16))
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E1D28);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10108AC90();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E1D48);
          }
          double v50 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v50);
          }
          double v51 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController decoratorOverlayViews]");
          double v52 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
          +[CRLAssertionHandler handleFailureInFunction:v51 file:v52 lineNumber:732 isFatal:0 description:"Non-finite followButtonFrameInRenderable."];
        }
        [(CRLCanvasRenderable *)self->mHUDRenderable frame];
        double v54 = sub_100064698(v49, 0.0, v53);
        double v56 = v55;
        id v57 = [(CRLCollaboratorCursorHUDController *)self p_followToggleOverlayView];
        [v57 setInteractionDelegate:self];
        [v57 setFrame:v54, v56, v44, v16];
        [v27 addObject:v57];
      }
      id v5 = [v27 copy];

      goto LABEL_59;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1C68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108AE28();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1C88);
    }
    double v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    double v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController decoratorOverlayViews]");
    unsigned int v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:687 isFatal:0 description:"Non-finite standardHUDFrame."];

    if (!v7) {
      goto LABEL_30;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1CA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108ADA0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1CC8);
    }
    v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController decoratorOverlayViews]");
    unsigned int v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:694 isFatal:0 description:"Non-finite avatarFrameInRenderable."];
  }
  [(CRLCanvasRenderable *)self->mHUDRenderable frame];
  double v24 = sub_100064698(v10, v12, v23);
  double v26 = v25;
  double v27 = [(CRLCollaboratorCursorHUDController *)self p_sizeToggleOverlayView];
  [v27 setInteractionDelegate:self];
  [v27 setFrame:v24, v26, v14, v16];
  double v58 = v27;
  id v5 = +[NSArray arrayWithObjects:&v58 count:1];
LABEL_59:

LABEL_5:

  return v5;
}

- (id)p_cachedPath
{
  double v3 = self->mCachedPath;
  unsigned __int8 v4 = v3;
  if (v3 && [(CRLBezierPath *)v3 isEmpty])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1D68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108AEB0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1D88);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_cachedPath]");
    unsigned int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:757 isFatal:0 description:"Retrieving cached path which is empty! Ignoring."];

    mCachedPath = self->mCachedPath;
    self->mCachedPath = 0;

    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (CGPoint)p_cachedAnchorPointForDirection:(unint64_t)a3
{
  if (self->mCachedPathDirection == a3)
  {
    CGFloat x = self->mCachedAnchorPoint.x;
    CGFloat y = self->mCachedAnchorPoint.y;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1DA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108AF38();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1DC8);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_cachedAnchorPointForDirection:]");
    unsigned int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:771 isFatal:0 description:"p_cachedAnchorPointIfAvailableForDirection should only be called when p_cachedPathIfAvailableForDirection is not nil for the same direction"];
  }
  double v8 = x;
  double v9 = y;
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (void)p_clearPathAndAnchorPointCaches
{
  mCachedPath = self->mCachedPath;
  self->mCachedPath = 0;
}

- (id)p_bezierPathForHUDWithFrame:(CGRect)a3 direction:(unint64_t)a4 outAnchorPoint:(CGPoint *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v12 = [(CRLCollaboratorCursorHUDController *)self p_cachedPath];
  if (v12)
  {
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    if (CGRectEqualToRect(v29, self->mCachedFrameForPaths) && self->mCachedPathDirection == a4)
    {
      id v13 = [v12 copy];
      [(CRLCollaboratorCursorHUDController *)self p_cachedAnchorPointForDirection:a4];
      double v15 = v14;
      double v17 = v16;
      if (!a5) {
        goto LABEL_21;
      }
LABEL_20:
      a5->double x = v15;
      a5->double y = v17;
      goto LABEL_21;
    }
  }
  double v15 = 0.5;
  double v18 = +[CRLBezierPath bezierPathWithContinuousCornerRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithContinuousCornerRoundedRect:cornerRadius:", x, y, width, height, height * 0.5);
  double v17 = 0.5;
  switch(a4)
  {
    case 0uLL:
      goto LABEL_15;
    case 1uLL:
      v30.origin.double x = x;
      v30.origin.double y = y;
      v30.size.double width = width;
      v30.size.double height = height;
      double MidX = CGRectGetMidX(v30);
      v31.origin.double x = x;
      v31.origin.double y = y;
      v31.size.double width = width;
      v31.size.double height = height;
      double MinY = CGRectGetMinY(v31);
      double v21 = -7.0;
      goto LABEL_10;
    case 2uLL:
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      double MidX = CGRectGetMidX(v32);
      v33.origin.double x = x;
      v33.origin.double y = y;
      v33.size.double width = width;
      v33.size.double height = height;
      double MinY = CGRectGetMaxY(v33);
      double v21 = 7.0;
LABEL_10:
      double MidY = MinY + v21;
      break;
    case 3uLL:
      v34.origin.double x = x;
      v34.origin.double y = y;
      v34.size.double width = width;
      v34.size.double height = height;
      double v23 = CGRectGetMinX(v34) + 2.0;
      v35.origin.double x = x;
      v35.origin.double y = y;
      v35.size.double width = width;
      v35.size.double height = height;
      double MidY = CGRectGetMidY(v35);
      double v24 = -7.0;
      goto LABEL_13;
    case 4uLL:
      v36.origin.double x = x;
      v36.origin.double y = y;
      v36.size.double width = width;
      v36.size.double height = height;
      double v23 = CGRectGetMaxX(v36) + -2.0;
      v37.origin.double x = x;
      v37.origin.double y = y;
      v37.size.double width = width;
      v37.size.double height = height;
      double MidY = CGRectGetMidY(v37);
      double v24 = 7.0;
LABEL_13:
      double MidX = v23 + v24;
      break;
    default:
      double MidX = CGPointZero.x;
      double MidY = CGPointZero.y;
      break;
  }
  [v18 bounds];
  double v15 = MidX / v25;
  double v17 = MidY / v26;
LABEL_15:
  id v13 = v18;
  v38.origin.double x = x;
  v38.origin.double y = y;
  v38.size.double width = width;
  v38.size.double height = height;
  if (!CGRectEqualToRect(v38, self->mCachedFrameForPaths))
  {
    self->mCachedFrameForPaths.origin.double x = x;
    self->mCachedFrameForPaths.origin.double y = y;
    self->mCachedFrameForPaths.size.double width = width;
    self->mCachedFrameForPaths.size.double height = height;
    [(CRLCollaboratorCursorHUDController *)self p_clearPathAndAnchorPointCaches];
  }
  if (([v13 isEmpty] & 1) == 0)
  {
    objc_storeStrong((id *)&self->mCachedPath, v18);
    self->mCachedPathDirection = a4;
    self->mCachedAnchorPoint.double x = v15;
    self->mCachedAnchorPoint.double y = v17;
  }

  if (a5) {
    goto LABEL_20;
  }
LABEL_21:

  return v13;
}

- (void)userInteractionBeganForView:(id)a3
{
  self->mInteractionInProgress = 1;
  [(CRLCollaboratorCursorHUDController *)self p_updateButtonRenderableFillColor];
}

- (void)userInteractionEndedForView:(id)a3
{
  id v5 = (CRLCollaboratorCursorOverlayView *)a3;
  self->mInteractionInProgress = 0;
  [(CRLCollaboratorCursorHUDController *)self p_updateButtonRenderableFillColor];
  unsigned __int8 v4 = v5;
  if (self->mSizeToggleOverlayView == v5)
  {
    [(CRLCollaboratorCursorHUDController *)self p_toggleSize];
    goto LABEL_6;
  }
  if (self->mFollowToggleOverlayView == v5 && !self->mIsFollowing)
  {
    [(CRLCollaboratorCursorHUDController *)self p_followButtonPressed:v5];
LABEL_6:
    unsigned __int8 v4 = v5;
  }
}

- (void)userInteractionCancelledForView:(id)a3
{
  self->mInteractionInProgress = 0;
  [(CRLCollaboratorCursorHUDController *)self p_updateButtonRenderableFillColor];
}

- (void)p_toggleSize
{
  if (self->mFollowEnabled || !self->mShouldAutoTimeout)
  {
    id v3 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
    [v3 toggleSizeForCollaboratorHUDController:self];
  }
}

- (CGRect)p_unscaledHUDFrame
{
  [(CRLCollaboratorCursorHUDController *)self p_avatarLeadingSpace];
  double v4 = v3;
  [(CRLCollaboratorCursorHUDController *)self p_avatarSize];
  double v6 = v4 + v5;
  [(CRLCollaboratorCursorHUDController *)self p_avatarTrailingSpace];
  double v8 = v7 + v6;
  [(CRLCollaboratorCursorHUDController *)self p_displayStringSize];
  double v10 = v8 + v9;
  [(CRLCollaboratorCursorHUDController *)self p_displayStringTrailingSpace];
  double v12 = v11 + v10;
  [(CRLCollaboratorCursorHUDController *)self p_followButtonSize];
  double v14 = v12 + v13;
  [(CRLCollaboratorCursorHUDController *)self p_followButtonTrailingSpace];
  double v16 = v15 + v14;
  [(CRLCollaboratorCursorHUDController *)self p_totalHeight];
  double v18 = v17;
  *(float *)&double v17 = v16;
  double v19 = fmaxf(*(float *)&v17, 22.0);
  double v20 = 0.0;
  double v21 = 0.0;
  result.size.double height = v18;
  result.size.double width = v19;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (double)p_avatarLeadingSpace
{
  unsigned int v3 = [(CRLCollaboratorCursorHUDController *)self p_isCompact];
  double result = 8.0;
  if (v3) {
    double result = 4.0;
  }
  double v5 = 3.0;
  if (v3) {
    double v5 = 0.0;
  }
  if (!self->mFollowEnabled) {
    return v5;
  }
  return result;
}

- (double)p_avatarTrailingSpace
{
  unsigned int v3 = [(CRLCollaboratorCursorHUDController *)self p_isCompact];
  double result = 8.0;
  if (v3) {
    double result = 4.0;
  }
  double v5 = 5.0;
  if (v3) {
    double v5 = 0.0;
  }
  if (!self->mFollowEnabled) {
    return v5;
  }
  return result;
}

- (double)p_verticalTextOffset
{
  return -0.5;
}

- (CGSize)p_avatarSize
{
  unsigned int v3 = [(CRLCollaboratorCursorHUDController *)self p_isCompact];
  if (self->mFollowEnabled)
  {
    double v4 = 30.0;
    if ((v3 & 1) == 0)
    {
      unint64_t v5 = [(CRLCollaboratorCursorHUDController *)self p_getAccessibilitySizeFromTraitCollection];
      double v4 = 0.0;
      if (v5 < 5) {
        double v4 = dbl_101176F18[v5];
      }
    }
  }
  else
  {
    double v4 = 24.0;
    if (v3) {
      double v4 = 30.0;
    }
  }
  double v6 = v4;
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (CGSize)p_sizeForString:(id)a3 font:(id)a4
{
  NSAttributedStringKey v17 = NSFontAttributeName;
  id v18 = a4;
  id v5 = a4;
  id v6 = a3;
  double v7 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v8 = objc_alloc((Class)NSAttributedString);

  CFAttributedStringRef v9 = (const __CFAttributedString *)[v8 initWithString:v6 attributes:v7];
  double v10 = CTLineCreateWithAttributedString(v9);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v10, 0);
  double width = BoundsWithOptions.size.width;
  if (v10) {
    CFRelease(v10);
  }
  double v12 = sub_1000674B8(width);
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (id)p_fontForFollowButtonString
{
  double v4 = 0.0;
  double v5 = 0.0;
  [(CRLCollaboratorCursorHUDController *)self p_stringFontSize:&v5 fontWeight:&v4 isDisplayString:0];
  uint64_t v2 = +[UIFont systemFontOfSize:v5 weight:v4];

  return v2;
}

- (id)p_fontForDisplayString
{
  double v4 = 0.0;
  double v5 = 0.0;
  [(CRLCollaboratorCursorHUDController *)self p_stringFontSize:&v5 fontWeight:&v4 isDisplayString:1];
  uint64_t v2 = +[UIFont systemFontOfSize:v5 weight:v4];

  return v2;
}

- (CGSize)p_followButtonStringSize
{
  if (self->mFollowString)
  {
    mPreferredSizeOfFollowStringOnce = self->mPreferredSizeOfFollowStringOnce;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001FEC4C;
    v6[3] = &unk_1014CBBB0;
    v6[4] = self;
    [(CRLOnce *)mPreferredSizeOfFollowStringOnce performBlockOnce:v6];
  }
  else
  {
    self->mCachedPreferredSizeOfFollowString = CGSizeZero;
  }
  double width = self->mCachedPreferredSizeOfFollowString.width;
  double height = self->mCachedPreferredSizeOfFollowString.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)p_displayStringSize
{
  mPreferredSizeOfFullNameStringOnce = self->mPreferredSizeOfFullNameStringOnce;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001FEE04;
  v15[3] = &unk_1014CBBB0;
  v15[4] = self;
  [(CRLOnce *)mPreferredSizeOfFullNameStringOnce performBlockOnce:v15];
  p_mCachedPreferredSizeOfFullNameString = &CGSizeZero;
  if (self->mShortNameString)
  {
    mPreferredSizeOfShortNameStringOnce = self->mPreferredSizeOfShortNameStringOnce;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001FEE68;
    v14[3] = &unk_1014CBBB0;
    v14[4] = self;
    [(CRLOnce *)mPreferredSizeOfShortNameStringOnce performBlockOnce:v14];
  }
  else
  {
    self->mCachedPreferredSizeOfShortNameString = CGSizeZero;
  }
  if ([(CRLCollaboratorCursorHUDController *)self p_isCompact])
  {
    p_double height = &CGSizeZero.height;
  }
  else
  {
    p_mCachedPreferredSizeOfShortNameString = &self->mCachedPreferredSizeOfShortNameString;
    if (self->mIsFollowing) {
      p_double height = &self->mCachedPreferredSizeOfFullNameString.height;
    }
    else {
      p_double height = &self->mCachedPreferredSizeOfShortNameString.height;
    }
    if (self->mIsFollowing) {
      p_mCachedPreferredSizeOfShortNameString = &self->mCachedPreferredSizeOfFullNameString;
    }
    if (self->mFollowEnabled)
    {
      p_mCachedPreferredSizeOfFullNameString = p_mCachedPreferredSizeOfShortNameString;
    }
    else
    {
      p_double height = &self->mCachedPreferredSizeOfFullNameString.height;
      p_mCachedPreferredSizeOfFullNameString = &self->mCachedPreferredSizeOfFullNameString;
    }
  }
  double width = p_mCachedPreferredSizeOfFullNameString->width;
  double v9 = *p_height;
  [(CRLCollaboratorCursorHUDController *)self p_maximumDisplayStringWidth];
  *(float *)&double v10 = v10;
  float v11 = width;
  double v12 = fminf(*(float *)&v10, v11);
  double v13 = v9;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (double)p_maximumDisplayStringWidth
{
  unsigned __int8 v3 = [(CRLCollaboratorCursorHUDController *)self p_isCompact];
  double result = 0.0;
  if ((v3 & 1) == 0)
  {
    double v5 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
    [v5 visibleCanvasWidth];
    double v7 = v6;

    [(CRLCollaboratorCursorHUDController *)self p_widthOfEverythingExceptDisplayString];
    return v7 + -40.0 - v8;
  }
  return result;
}

- (double)p_widthOfEverythingExceptDisplayString
{
  [(CRLCollaboratorCursorHUDController *)self p_avatarLeadingSpace];
  double v4 = v3;
  [(CRLCollaboratorCursorHUDController *)self p_avatarSize];
  double v6 = v4 + v5;
  [(CRLCollaboratorCursorHUDController *)self p_avatarTrailingSpace];
  double v8 = v7 + v6;
  [(CRLCollaboratorCursorHUDController *)self p_displayStringTrailingSpace];
  double v10 = v9 + v8;
  [(CRLCollaboratorCursorHUDController *)self p_followButtonSize];
  double v12 = v10 + v11;
  [(CRLCollaboratorCursorHUDController *)self p_followButtonTrailingSpace];
  return v13 + v12;
}

- (double)p_displayStringTrailingSpace
{
  unsigned int v2 = [(CRLCollaboratorCursorHUDController *)self p_isCompact];
  double result = 8.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (CGSize)p_followButtonSize
{
  unsigned int v3 = [(CRLCollaboratorCursorHUDController *)self p_isCompact];
  if (self->mFollowEnabled && ((!self->mIsFollowing && !self->mIsLocalParticipant) & ~v3) != 0)
  {
    if ((unint64_t)[(CRLCollaboratorCursorHUDController *)self p_getAccessibilitySizeFromTraitCollection] <= 1)double height = 24.0; {
    else
    }
      double height = 28.0;
    [(CRLCollaboratorCursorHUDController *)self p_followButtonStringSize];
    double width = v6 + 8.0 + 8.0;
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  double v7 = height;
  result.double height = v7;
  result.double width = width;
  return result;
}

- (double)p_followButtonTrailingSpace
{
  unsigned int v3 = [(CRLCollaboratorCursorHUDController *)self p_isCompact];
  if (self->mIsFollowing) {
    int v4 = 1;
  }
  else {
    int v4 = v3;
  }
  if (self->mFollowEnabled) {
    int v5 = v4;
  }
  else {
    int v5 = 1;
  }
  double result = 8.0;
  if (v5) {
    return 0.0;
  }
  return result;
}

- (double)p_followButtonInternalHorizontalPadding
{
  BOOL v2 = self->mIsFollowing || !self->mFollowEnabled;
  double result = 0.0;
  if (!v2) {
    return 8.0;
  }
  return result;
}

- (double)p_totalHeight
{
  unsigned int v3 = [(CRLCollaboratorCursorHUDController *)self p_isCompact];
  BOOL mFollowEnabled = self->mFollowEnabled;
  [(CRLCollaboratorCursorHUDController *)self p_avatarSize];
  double v6 = v5;
  if (mFollowEnabled)
  {
    if (v3)
    {
      return v5 + 8.0;
    }
    else if ((unint64_t)[(CRLCollaboratorCursorHUDController *)self p_getAccessibilitySizeFromTraitCollection] <= 1)
    {
      return 40.0;
    }
    else
    {
      return 42.0;
    }
  }
  else
  {
    [(CRLCollaboratorCursorHUDController *)self p_displayStringSize];
    if ((v3 & 1) == 0)
    {
      float v8 = v6 + 6.0;
      float v9 = v7 + 2.0;
      return fmaxf(v8, v9);
    }
  }
  return v6;
}

- (void)p_stringFontSize:(double *)a3 fontWeight:(double *)a4 isDisplayString:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v9 = [(CRLCollaboratorCursorHUDController *)self p_isCompact];
  if (self->mFollowEnabled)
  {
    if (v5)
    {
      UIFontWeight v10 = UIFontWeightMedium;
      switch([(CRLCollaboratorCursorHUDController *)self p_getAccessibilitySizeFromTraitCollection])
      {
        case 0:
          goto LABEL_11;
        case 1:
          goto LABEL_12;
        case 2:
          double v11 = 19.0;
          break;
        case 3:
          double v11 = 21.0;
          break;
        case 4:
          double v11 = 23.0;
          break;
        default:
          goto LABEL_10;
      }
    }
    else
    {
      UIFontWeight v10 = UIFontWeightBold;
      switch([(CRLCollaboratorCursorHUDController *)self p_getAccessibilitySizeFromTraitCollection])
      {
        case 0:
          double v11 = 11.0;
          break;
        case 1:
LABEL_11:
          double v11 = 13.0;
          break;
        case 2:
LABEL_12:
          double v11 = 15.0;
          break;
        case 3:
          double v11 = 17.0;
          break;
        case 4:
          double v11 = 20.0;
          break;
        default:
LABEL_10:
          double v11 = 0.0;
          break;
      }
    }
  }
  else
  {
    UIFontWeight v10 = UIFontWeightMedium;
    double v11 = 15.0;
    if (v9) {
      double v11 = 10.0;
    }
  }
  if (a3) {
    *a3 = v11;
  }
  if (a4) {
    *a4 = v10;
  }
}

- (int64_t)p_getAccessibilitySizeFromTraitCollection
{
  BOOL v2 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
  unsigned int v3 = [v2 currentTraitCollection];

  int v4 = [v3 preferredContentSizeCategory];
  if ([v4 isEqualToString:UIContentSizeCategoryExtraLarge])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:UIContentSizeCategoryExtraExtraLarge])
  {
    int64_t v5 = 2;
  }
  else if ([v4 isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge])
  {
    int64_t v5 = 3;
  }
  else if (([v4 isEqualToString:UIContentSizeCategoryAccessibilityMedium] & 1) != 0 {
         || ([v4 isEqualToString:UIContentSizeCategoryAccessibilityLarge] & 1) != 0
  }
         || ([v4 isEqualToString:UIContentSizeCategoryAccessibilityExtraLarge] & 1) != 0
         || ([v4 isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraLarge] & 1) != 0)
  {
    int64_t v5 = 4;
  }
  else if ([v4 isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraExtraLarge])
  {
    int64_t v5 = 4;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)resetAutoHideTimer
{
  if (self->mAutoHideTimer) {
    [(CRLCollaboratorCursorHUDController *)self stopAutoHideTimer];
  }

  [(CRLCollaboratorCursorHUDController *)self startAutoHideTimer];
}

- (void)stopAutoHideTimer
{
  mAutoHideTimer = self->mAutoHideTimer;
  if (mAutoHideTimer)
  {
    [(NSTimer *)mAutoHideTimer invalidate];
    int v4 = self->mAutoHideTimer;
    self->mAutoHideTimer = 0;
  }
}

- (void)startAutoHideTimer
{
  if (self->mAutoHideTimer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1DE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108AFC0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1E08);
    }
    unsigned int v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    int v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController startAutoHideTimer]");
    int64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1396, 0, "expected nil value for '%{public}s'", "mAutoHideTimer");
  }
  double v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"p_autoHideHUD" selector:0 userInfo:0 repeats:7.0];
  mAutoHideTimer = self->mAutoHideTimer;
  self->mAutoHideTimer = v6;
}

- (void)resetAutoShrinkTimer
{
  if (self->mAutoShrinkTimer) {
    [(CRLCollaboratorCursorHUDController *)self stopAutoShrinkTimer];
  }

  [(CRLCollaboratorCursorHUDController *)self startAutoShrinkTimer];
}

- (void)stopAutoShrinkTimer
{
  mAutoShrinkTimer = self->mAutoShrinkTimer;
  if (mAutoShrinkTimer)
  {
    [(NSTimer *)mAutoShrinkTimer invalidate];
    int v4 = self->mAutoShrinkTimer;
    self->mAutoShrinkTimer = 0;
  }
}

- (void)startAutoShrinkTimer
{
  if (self->mAutoShrinkTimer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1E28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B054();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1E48);
    }
    unsigned int v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    int v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController startAutoShrinkTimer]");
    int64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1419, 0, "expected nil value for '%{public}s'", "mAutoShrinkTimer");
  }
  double v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"p_autoShrinkHUD" selector:0 userInfo:0 repeats:7.0];
  mAutoShrinkTimer = self->mAutoShrinkTimer;
  self->mAutoShrinkTimer = v6;
}

- (void)p_autoShrinkHUD
{
  if (!self->mShouldAutoTimeout)
  {
    if (self->mShouldUnconditionallyFadeOutHUD)
    {
      [(CRLCollaboratorCursorHUDController *)self hideHUD];
    }
    else
    {
      id v3 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
      [v3 toggleSizeForCollaboratorHUDController:self];
    }
  }
}

- (void)p_autoHideHUD
{
  id v3 = [(CRLCollaboratorCursorHUDController *)self p_delegate];
  [v3 removeCollaboratorHUDController:self];

  mHUDRenderable = self->mHUDRenderable;
  self->mHUDRenderable = 0;

  mSizeToggleOverlayView = self->mSizeToggleOverlayView;
  self->mSizeToggleOverlayView = 0;

  mFollowToggleOverlayView = self->mFollowToggleOverlayView;
  self->mFollowToggleOverlayView = 0;
}

- (_TtC8Freeform23CRLCollaboratorPresence)collaboratorPresence
{
  return self->mCollaboratorPresence;
}

- (unint64_t)hudSize
{
  return self->mHUDSize;
}

- (NSString)string
{
  return self->mFullNameString;
}

- (BOOL)isFollowing
{
  return self->mIsFollowing;
}

- (void)setIsFollowing:(BOOL)a3
{
  self->mIsFollowing = a3;
}

- (BOOL)shouldAutoTimeout
{
  return self->mShouldAutoTimeout;
}

- (BOOL)shouldAutoHide
{
  return self->mShouldAutoHide;
}

- (BOOL)shouldAutoShrink
{
  return self->mShouldAutoShrink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFollowButton, 0);
  objc_storeStrong((id *)&self->mFollowToggleOverlayView, 0);
  objc_storeStrong((id *)&self->mSizeToggleOverlayView, 0);
  objc_storeStrong((id *)&self->mAvatarRenderer, 0);
  objc_storeStrong((id *)&self->mCachedPath, 0);
  objc_storeStrong((id *)&self->mPreferredSizeOfFollowStringOnce, 0);
  objc_storeStrong((id *)&self->mPreferredSizeOfShortNameStringOnce, 0);
  objc_storeStrong((id *)&self->mPreferredSizeOfFullNameStringOnce, 0);
  objc_storeStrong((id *)&self->mFollowString, 0);
  objc_storeStrong((id *)&self->mShortNameString, 0);
  objc_storeStrong((id *)&self->mFullNameString, 0);
  objc_storeStrong((id *)&self->mFollowButtonRenderable, 0);
  objc_storeStrong((id *)&self->mHUDRenderable, 0);
  objc_storeStrong((id *)&self->mAutoHideTimer, 0);
  objc_storeStrong((id *)&self->mAutoShrinkTimer, 0);
  objc_storeStrong((id *)&self->mAbsoluteTimeTimer, 0);
  objc_storeStrong((id *)&self->mHideHUDTimer, 0);
  objc_destroyWeak((id *)&self->mDelegate);

  objc_storeStrong((id *)&self->mCollaboratorPresence, 0);
}

@end