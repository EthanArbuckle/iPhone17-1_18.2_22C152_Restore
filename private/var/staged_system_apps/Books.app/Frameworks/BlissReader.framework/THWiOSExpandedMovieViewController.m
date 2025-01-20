@interface THWiOSExpandedMovieViewController
- ($A219A65C3B9F57E4A1EAB42BC6271E0A)shadowPropertiesForFreeTransformController:(SEL)a3 defaults:(id)a4;
- (AVPlayerViewController)moviePlayerViewController;
- (BOOL)animationControllerSetsDestination:(id)a3;
- (BOOL)expandedRepControllerHasRoomForPanels;
- (BOOL)freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:(id)a3;
- (BOOL)freeTransformControllerWantsCurtainFadeOut:(id)a3;
- (BOOL)freeTransformGestureRecognizerShouldAllowPinchDown:(id)a3;
- (BOOL)freeTransformGestureRecognizerShouldAllowPinchUp:(id)a3;
- (BOOL)freeTransformGestureRecognizerShouldDelayRecognizeUntilScaleChange:(id)a3;
- (BOOL)freeTransformGestureRecognizerShouldRubberband:(id)a3;
- (BOOL)isDismissing;
- (BOOL)isFSOMovie;
- (BOOL)isZoomed;
- (BOOL)prefersStatusBarHidden;
- (BOOL)presented;
- (BOOL)receivedPreRoll;
- (BOOL)registeredForNotification;
- (BOOL)shouldAutorotate;
- (CALayer)rotationScrim;
- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3;
- (CGRect)rectForCompletionAnimationWithRep:(id)a3;
- (CGSize)curtainSizeForFreeTransformController:(id)a3;
- (OS_dispatch_queue)dispatchQueue;
- (THAnimationController)animationController;
- (THDocumentRoot)documentRoot;
- (THWExpandedViewControllerDelegate)delegate;
- (THWFreeTransformController)freeTransformController;
- (THWFreeTransformGestureRecognizer)freeTransformGestureRecognizer;
- (THWMovieInfo)movieInfo;
- (THWiOSExpandedMovieAnimationDelegate)animationDelegate;
- (THWiOSExpandedMovieViewController)initWithDocumentRoot:(id)a3 expandableRep:(id)a4 delegate:(id)a5;
- (UIColor)rootBackgroundColor;
- (UIImageView)moviePosterView;
- (id)animationControllerForDismissedController:(id)a3;
- (id)curtainColorForFreeTransform;
- (id)expandedRepSourceRep;
- (id)hostCanvasLayer;
- (id)p_curtainColor;
- (id)presentCompletionBlock;
- (id)unmovingParentViewForFreeTransformController:(id)a3;
- (int)expandedRepControllerState;
- (void)animationController:(id)a3 updateWhitePointAdaptivtyStyleWithDuration:(double)a4;
- (void)animationControllerDidPresent:(id)a3;
- (void)animationControllerDidPresentPostCommit:(id)a3;
- (void)animationControllerSetupTarget:(id)a3;
- (void)animationControllerWillPresent:(id)a3;
- (void)audioPlaybackWillStart:(id)a3;
- (void)bookViewDidAnimateRotationToSize:(CGSize)a3 withContext:(id)a4;
- (void)bookViewWillRotateTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)dealloc;
- (void)dismissExpandedAnimatedWithCompletionBlock:(id)a3;
- (void)dismissExpandedImmediate;
- (void)freeTransformControllerDidBegin:(id)a3;
- (void)freeTransformControllerDidFinishFreeTransforming:(id)a3 passedThreshold:(BOOL)a4 completionBlock:(id)a5;
- (void)freeTransformDidBeginWithRep:(id)a3 expandableRep:(id)a4;
- (void)handleGesture:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_addViewToRoot;
- (void)p_completeDismiss;
- (void)p_dismissExpandedAnimatedWithCompletionBlock:(id)a3 freeTransformDidEnd:(BOOL)a4;
- (void)p_dismissExpandedImmediateWithCompletionBlock:(id)a3;
- (void)p_initializeMoviePlayerController;
- (void)p_moviePlayerPlaybackDidFinish:(id)a3;
- (void)p_removePlaybackNotifications;
- (void)p_setMoviePlayerBackgroundColor:(id)a3 animated:(BOOL)a4;
- (void)p_setupFTC;
- (void)p_setupFreeTransformController;
- (void)p_setupPlaybackNotifications;
- (void)p_unloadMoviePlayer;
- (void)pauseAndDismissMoviePlayer;
- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)presentExpandedAnimatedWithCompletionBlock:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setExpandedRepControllerState:(int)a3;
- (void)setFreeTransformController:(id)a3;
- (void)setFreeTransformGestureRecognizer:(id)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setIsFSOMovie:(BOOL)a3;
- (void)setMovieInfo:(id)a3;
- (void)setMoviePlayerViewController:(id)a3;
- (void)setMoviePosterView:(id)a3;
- (void)setPresentCompletionBlock:(id)a3;
- (void)setPresented:(BOOL)a3;
- (void)setReceivedPreRoll:(BOOL)a3;
- (void)setRegisteredForNotification:(BOOL)a3;
- (void)setRootBackgroundColor:(id)a3;
- (void)setRotationScrim:(id)a3;
- (void)teardown;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation THWiOSExpandedMovieViewController

- (THWiOSExpandedMovieViewController)initWithDocumentRoot:(id)a3 expandableRep:(id)a4 delegate:(id)a5
{
  objc_opt_class();
  [a4 expandedContentDrawableToPresent];
  uint64_t v9 = TSUDynamicCast();
  if (!v9)
  {
    objc_opt_class();
    [a4 info];
    v10 = (void *)TSUDynamicCast();
    objc_opt_class();
    [v10 expandedStageDrawable];
    uint64_t v9 = TSUDynamicCast();
  }
  v15.receiver = self;
  v15.super_class = (Class)THWiOSExpandedMovieViewController;
  v11 = [(THWiOSExpandedMovieViewController *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(THWiOSExpandedMovieViewController *)v11 setMovieInfo:v9];
    [(THWiOSExpandedMovieViewController *)v12 setDelegate:a5];
    v12->_documentRoot = (THDocumentRoot *)a3;
    [v12 view].setAutoresizesSubviews:1;
    [v12 view].autoresizingMask = 18;
    [(THWiOSExpandedMovieViewController *)v12 setModalPresentationStyle:0];
    [(THWiOSExpandedMovieViewController *)v12 setExpandedRepControllerState:0];
    v12->_animationDelegate = [[THWiOSExpandedMovieAnimationDelegate alloc] initWithMovieViewController:v12];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ibooks.expandedMovie", v13);
    objc_opt_class();
    [(THWiOSExpandedMovieViewController *)v12 expandedRepSourceRep];
    if (![(id)TSUDynamicCast() moviePlayerViewController])
    {
      [(THWiOSExpandedMovieViewController *)v12 p_initializeMoviePlayerController];
      [(THWiOSExpandedMovieViewController *)v12 setIsFSOMovie:1];
    }
    [+[BCAudioMuxingCoordinator sharedInstance] addAudioMuxingObserver:v12];
  }
  return v12;
}

- (void)p_initializeMoviePlayerController
{
  v3 = +[AVPlayerItem playerItemWithURL:[(THWMovieInfo *)[(THWiOSExpandedMovieViewController *)self movieInfo] movieRemoteURL]];
  id v4 = [objc_alloc((Class)AVPlayer) initWithPlayerItem:v3];
  id v5 = [(THWMovieInfo *)[(THWiOSExpandedMovieViewController *)self movieInfo] drmContext];
  [v4 setAllowsExternalPlayback:[v5 kiUanAfQBD5qIUraolUj] ^ 1];
  if ([v5 kiUanAfQBD5qIUraolUj]) {
    [v5 authorizeAVPlayerItemForPlayback:v3];
  }
  self->_moviePlayerViewController = (AVPlayerViewController *)objc_alloc_init((Class)AVPlayerViewController);
  [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] setDelegate:self];
  [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] setPlayer:v4];
  [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] setAllowsPictureInPicturePlayback:0];
  [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] setModalPresentationStyle:0];
  if ([(THWMovieInfo *)[(THWiOSExpandedMovieViewController *)self movieInfo] loopOption] == (char *)&dword_0 + 1) {
    [(-[AVPlayerViewController playerController](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "playerController")) setLooping:1];
  }

  [(THWiOSExpandedMovieViewController *)self p_setupPlaybackNotifications];
  id v6 = +[THWAVController sharedController];

  [v6 stopPlayer];
}

- (void)p_setupPlaybackNotifications
{
  objc_sync_enter(self);
  if (![(THWiOSExpandedMovieViewController *)self moviePlayerViewController]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedMovieViewController p_setupPlaybackNotifications]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Movie/THWiOSExpandedMovieViewController.m") lineNumber:148 description:@"invalid nil value for '%s'", "self.moviePlayerViewController"];
  }
  if ([[(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player] currentItem]&& ![(THWiOSExpandedMovieViewController *)self registeredForNotification])
  {
    v3 = [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player];
    [(AVPlayer *)v3 addObserver:self forKeyPath:@"status" options:1 context:off_56E848];
    [+[NSNotificationCenter defaultCenter] addObserver:self selector:"p_moviePlayerPlaybackDidFinish:" name:AVPlayerItemDidPlayToEndTimeNotification object:[[(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player] currentItem]];
    [(THWiOSExpandedMovieViewController *)self setRegisteredForNotification:1];
  }
  [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] setDelegate:self];

  objc_sync_exit(self);
}

- (void)p_removePlaybackNotifications
{
  objc_sync_enter(self);
  if ([(THWiOSExpandedMovieViewController *)self moviePlayerViewController]
    && [(THWiOSExpandedMovieViewController *)self registeredForNotification])
  {
    [[(AVPlayerViewController *)self->_moviePlayerViewController player] removeObserver:self forKeyPath:@"status"];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:[[(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player] currentItem]];
    [(THWiOSExpandedMovieViewController *)self setRegisteredForNotification:0];
  }
  [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] setDelegate:0];

  objc_sync_exit(self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_56E848 == a6 && [a3 isEqualToString:@"status"])
  {
    if ((char *)[[(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player] status] == (char *)&dword_0 + 1)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_13E844;
      v12[3] = &unk_457140;
      v12[4] = self;
      [[(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player] prerollAtRate:v12 completionHandler:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0))];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)THWiOSExpandedMovieViewController;
    [(THWiOSExpandedMovieViewController *)&v11 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

- (void)p_unloadMoviePlayer
{
  if ([(THWiOSExpandedMovieViewController *)self moviePlayerViewController])
  {
    [(THWiOSExpandedMovieViewController *)self p_removePlaybackNotifications];
    [[(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player] pause];
    v3 = self->_moviePlayerViewController;
    self->_moviePlayerViewController = 0;
  }
}

- (void)dealloc
{
  [(THWiOSExpandedMovieViewController *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)THWiOSExpandedMovieViewController;
  [(THWiOSExpandedMovieViewController *)&v3 dealloc];
}

- (void)teardown
{
  [+[BCAudioMuxingCoordinator sharedInstance] removeAudioMuxingObserver:self];
  [(THWiOSExpandedMovieViewController *)self setPresentCompletionBlock:0];

  self->_animationController = 0;
  [(THWiOSExpandedMovieViewController *)self p_unloadMoviePlayer];
  [(THWiOSExpandedMovieAnimationDelegate *)self->_animationDelegate setMovieViewController:0];

  self->_animationDelegate = 0;
  [(THWFreeTransformController *)self->_freeTransformController setDelegate:0];
  [(THWFreeTransformController *)self->_freeTransformController setTransformGR:0];
  [(THWFreeTransformController *)self->_freeTransformController setTargetLayer:0];

  self->_freeTransformController = 0;
  [(THWFreeTransformGestureRecognizer *)self->_freeTransformGestureRecognizer setFreeTransformDelegate:0];

  self->_freeTransformGestureRecognizer = 0;
  self->_documentRoot = 0;

  self->_rootBackgroundColor = 0;
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_release(dispatchQueue);
    self->_dispatchQueue = 0;
  }

  [(THWiOSExpandedMovieViewController *)self setMoviePosterView:0];
}

- (id)expandedRepSourceRep
{
  objc_super v3 = [(THWiOSExpandedMovieViewController *)self delegate];
  id v4 = [(THWiOSExpandedMovieViewController *)self movieInfo];

  return [(THWExpandedViewControllerDelegate *)v3 expandableRepForInfo:v4];
}

- (BOOL)shouldAutorotate
{
  return [(THWiOSExpandedMovieViewController *)self expandedRepControllerState] == 2;
}

- (void)p_setupFreeTransformController
{
  if (![(THWiOSExpandedMovieViewController *)self freeTransformController])
  {
    [(THWiOSExpandedMovieViewController *)self setFreeTransformController:objc_alloc_init(THWFreeTransformController)];
    [(THWFreeTransformController *)[(THWiOSExpandedMovieViewController *)self freeTransformController] setDelegate:self];
    [(THWFreeTransformController *)[(THWiOSExpandedMovieViewController *)self freeTransformController] setTransformGR:[(THWiOSExpandedMovieViewController *)self freeTransformGestureRecognizer]];
    [(THWFreeTransformController *)[(THWiOSExpandedMovieViewController *)self freeTransformController] setTargetLayer:[(THWiOSExpandedMovieAnimationDelegate *)self->_animationDelegate animationLayer]];
    objc_super v3 = [(THWiOSExpandedMovieViewController *)self freeTransformController];
    [(THWFreeTransformController *)v3 setScaleThreshold:0.75];
  }
}

- (void)handleGesture:(id)a3
{
  if ([(THWiOSExpandedMovieViewController *)self freeTransformGestureRecognizer] == a3)
  {
    [(THWiOSExpandedMovieViewController *)self p_setupFreeTransformController];
    id v4 = [(THWiOSExpandedMovieViewController *)self freeTransformController];
    id v5 = [(THWiOSExpandedMovieViewController *)self freeTransformGestureRecognizer];
    [(THWFreeTransformController *)v4 transformGRChanged:v5];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v19.receiver = self;
  v19.super_class = (Class)THWiOSExpandedMovieViewController;
  -[THWiOSExpandedMovieViewController viewWillTransitionToSize:withTransitionCoordinator:](&v19, "viewWillTransitionToSize:withTransitionCoordinator:");
  if (a4)
  {
    [a4 targetTransform];
    if (CGAffineTransformIsIdentity(&v18))
    {
      -[THWiOSExpandedMovieViewController bookViewWillTransitionToSize:withTransitionCoordinator:](self, "bookViewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
      char v8 = 0;
    }
    else
    {
      -[THWiOSExpandedMovieViewController bookViewWillRotateTransitionToSize:withTransitionCoordinator:](self, "bookViewWillRotateTransitionToSize:withTransitionCoordinator:", a4, width, height);
      char v8 = 1;
    }
    uint64_t v14 = 0;
    objc_super v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_13EE70;
    v12[3] = &unk_457428;
    char v13 = v8;
    v12[4] = self;
    void v12[5] = &v14;
    *(double *)&v12[6] = width;
    *(double *)&v12[7] = height;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_13EEA0;
    v10[3] = &unk_457428;
    char v11 = v8;
    v10[4] = self;
    v10[5] = &v14;
    *(double *)&v10[6] = width;
    *(double *)&v10[7] = height;
    unsigned __int8 v9 = [a4 animateAlongsideTransition:v12 completion:v10];
    *((unsigned char *)v15 + 24) = v9;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    -[THWiOSExpandedMovieViewController bookViewWillTransitionToSize:withTransitionCoordinator:](self, "bookViewWillTransitionToSize:withTransitionCoordinator:", 0, width, height);
    -[THWiOSExpandedMovieViewController bookViewDidTransitionToSize:withContext:](self, "bookViewDidTransitionToSize:withContext:", 0, width, height);
  }
}

- (void)bookViewWillRotateTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  [(THWiOSExpandedMovieViewController *)self setRotationScrim:+[CALayer layer]];
  [(CALayer *)[(THWiOSExpandedMovieViewController *)self rotationScrim] setBackgroundColor:[+[UIColor blackColor] CGColor]];
  [self view].bounds;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [self view].bounds
  CGFloat v14 = v13 * -0.707;
  [self view].bounds
  CGFloat v16 = v15 * -0.707;
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.double width = v10;
  v20.size.double height = v12;
  CGRect v21 = CGRectInset(v20, v14, v16);
  -[CALayer setFrame:]([(THWiOSExpandedMovieViewController *)self rotationScrim], "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
  [(CALayer *)[(THWiOSExpandedMovieViewController *)self rotationScrim] setZPosition:-32000.0];
  id v17 = [[self view] layer];
  CGAffineTransform v18 = [(THWiOSExpandedMovieViewController *)self rotationScrim];

  [v17 addSublayer:v18];
}

- (void)bookViewDidAnimateRotationToSize:(CGSize)a3 withContext:(id)a4
{
  [(CALayer *)[(THWiOSExpandedMovieViewController *)self rotationScrim] removeFromSuperlayer];

  [(THWiOSExpandedMovieViewController *)self setRotationScrim:0];
}

- (void)pauseAndDismissMoviePlayer
{
  [[(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player] pause];
  objc_super v3 = [(THWiOSExpandedMovieViewController *)self moviePlayerViewController];

  [(AVPlayerViewController *)v3 setShowsPlaybackControls:0];
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v4 = [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player];

  [(AVPlayer *)v4 play];
}

- (void)animationControllerWillPresent:(id)a3
{
  unsigned __int8 v4 = [(THWiOSExpandedMovieViewController *)self isDismissing];
  double v5 = [(THWiOSExpandedMovieViewController *)self delegate];
  if (v4)
  {
    [(THWExpandedViewControllerDelegate *)v5 expandedViewControllerWillDismiss:self];
  }
  else
  {
    [(THWExpandedViewControllerDelegate *)v5 expandedViewControllerWillPresent:self];
    id v6 = [self p_curtainColor];
    [(THWiOSExpandedMovieViewController *)self p_setMoviePlayerBackgroundColor:v6 animated:1];
  }
}

- (void)p_completeDismiss
{
  [(THWiOSExpandedMovieViewController *)self p_removePlaybackNotifications];
  objc_opt_class();
  [(THWiOSExpandedMovieViewController *)self expandedRepSourceRep];
  objc_super v3 = (void *)TSUDynamicCast();
  unsigned __int8 v4 = v3;
  if (!v3
    || [v3 moviePlayerViewController]
    || ([v4 wantsFullscreenOnlyDisplay] & 1) != 0)
  {
    [[(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player] pause];
    [(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view")) removeFromSuperview];
  }
  else
  {
    [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] removeFromParentViewController];
    [(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view")) removeFromSuperview];
    [v4 setMoviePlayerViewController:[self moviePlayerViewController]];

    self->_moviePlayerViewController = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v4 expandableExpandedPresentationDidEnd];
  }
  [(THWiOSExpandedMovieViewController *)self removeFromParentViewController];
  [self view].removeFromSuperview;
  [(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview")) setBackgroundColor:(-[THWiOSExpandedMovieViewController rootBackgroundColor](self, "rootBackgroundColor"))];
  double v5 = self;
  id v6 = [(THWiOSExpandedMovieViewController *)self delegate];

  [(THWExpandedViewControllerDelegate *)v6 expandedViewControllerDidDismiss:self];
}

- (void)animationControllerDidPresent:(id)a3
{
  if ([(THWiOSExpandedMovieViewController *)self isDismissing])
  {
    [(THWiOSExpandedMovieViewController *)self p_completeDismiss];
  }
  else
  {
    [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedMovieViewController *)self delegate] expandedViewControllerDidPresent:self];
    objc_opt_class();
    [(THWiOSExpandedMovieViewController *)self expandedRepSourceRep];
    unsigned __int8 v4 = (void *)TSUDynamicCast();
    if ([v4 moviePlayerViewController])
    {
      -[THWiOSExpandedMovieViewController setMoviePlayerViewController:](self, "setMoviePlayerViewController:", [v4 moviePlayerViewController]);
      [v4 setMoviePlayerViewController:0];
      [self view].bounds;
      [(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view")) setFrame:v5, v6, v7, v8];
      [(-[THWiOSExpandedMovieViewController view](self, "view")) addSubview:(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"))];
      [(THWiOSExpandedMovieViewController *)self addChildViewController:[(THWiOSExpandedMovieViewController *)self moviePlayerViewController]];
      [(THWiOSExpandedMovieViewController *)self p_setupPlaybackNotifications];
      [(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view")) setAutoresizingMask:18];
      [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] setShowsPlaybackControls:1];
      -[THWiOSExpandedMovieViewController p_setMoviePlayerBackgroundColor:animated:](self, "p_setMoviePlayerBackgroundColor:animated:", objc_msgSend(-[THWiOSExpandedMovieViewController p_curtainColor](self, "p_curtainColor"), "UIColor"), 0);
    }
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self);
    id v9 = [(THWiOSExpandedMovieViewController *)self view];
    [v9 setNeedsUpdateConstraints];
  }
}

- (void)animationControllerDidPresentPostCommit:(id)a3
{
  [(THWiOSExpandedMovieViewController *)self setIsDismissing:0];
  if ([(THWiOSExpandedMovieViewController *)self expandedRepControllerState] == 1)
  {
    uint64_t v5 = 2;
  }
  else
  {
    if ([(THWiOSExpandedMovieViewController *)self expandedRepControllerState] != 3) {
      goto LABEL_6;
    }
    uint64_t v5 = 4;
  }
  [(THWiOSExpandedMovieViewController *)self setExpandedRepControllerState:v5];
LABEL_6:
  [a3 removeObserver:self];
  if ([(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] view])
  {
    [self view].frame;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [self.delegate.rootSuperview bounds];
    v42.origin.x = v14;
    v42.origin.y = v15;
    v42.size.double width = v16;
    v42.size.double height = v17;
    v40.origin.x = v7;
    v40.origin.y = v9;
    v40.size.double width = v11;
    v40.size.double height = v13;
    if (!CGRectEqualToRect(v40, v42))
    {
      [self.delegate.rootSuperview bounds];
      [self.view setFrame:v18, v19, v20, v21];
    }
    [self view].bounds;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    [(-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController")) view].frame;
    v43.origin.x = v30;
    v43.origin.y = v31;
    v43.size.double width = v32;
    v43.size.double height = v33;
    v41.origin.x = v23;
    v41.origin.y = v25;
    v41.size.double width = v27;
    v41.size.double height = v29;
    if (!CGRectEqualToRect(v41, v43))
    {
      [self view].bounds
      [(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view")) setFrame:v34, v35, v36, v37];
    }
  }
  id v38 = [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] view];

  [v38 setAutoresizingMask:18];
}

- (void)p_moviePlayerPlaybackDidFinish:(id)a3
{
  uint64_t v5 = (AVPlayerItem *)[a3 object];
  if (v5 == -[AVPlayer currentItem](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "currentItem")&& objc_msgSend(objc_msgSend(a3, "name"), "isEqualToString:", AVPlayerItemDidPlayToEndTimeNotification))
  {
    unsigned int v6 = [(THWFreeTransformController *)[(THWiOSExpandedMovieViewController *)self freeTransformController] isFreeTransformInProgress];
    CGFloat v7 = (char *)[(THWMovieInfo *)[(THWiOSExpandedMovieViewController *)self movieInfo] loopOption];
    double v8 = v7;
    if (v6)
    {
      if (!v7)
      {
        CGFloat v9 = [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player];
        long long v12 = *(_OWORD *)&kCMTimeZero.value;
        CMTimeEpoch epoch = kCMTimeZero.epoch;
        [(AVPlayer *)v9 seekToTime:&v12];
        [[(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player] pause];
      }
    }
    else
    {
      double v10 = [(THWiOSExpandedMovieViewController *)self moviePlayerViewController];
      if (v8 == (unsigned char *)&dword_0 + 1)
      {
        CGFloat v11 = [(AVPlayerViewController *)v10 player];
        long long v12 = *(_OWORD *)&kCMTimeZero.value;
        CMTimeEpoch epoch = kCMTimeZero.epoch;
        [(AVPlayer *)v11 seekToTime:&v12];
        [[(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player] play];
      }
      else
      {
        [(AVPlayerViewController *)v10 setShowsPlaybackControls:0];
        [(THWiOSExpandedMovieViewController *)self dismissExpandedAnimatedWithCompletionBlock:0];
      }
    }
  }
}

- (void)p_addViewToRoot
{
  if (![(THWiOSExpandedMovieViewController *)self view]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWiOSExpandedMovieViewController p_addViewToRoot]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Movie/THWiOSExpandedMovieViewController.m"] lineNumber:548 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "self.view"]];
  }
  id v3 = [(THWiOSExpandedMovieViewController *)self view];
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v13[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v13[1] = v4;
  v13[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v3 setTransform:v13];
  [self.delegate.rootSuperview bounds];
  [self.view setFrame:v5, v6, v7, v8];
  [-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview") addSubview:[self view]];
  [(-[THWExpandedViewControllerDelegate rootSuperviewController](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperviewController")) addChildViewController:self];
  -[self setRootBackgroundColor:[-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview") backgroundColor]];
  if (![(THWiOSExpandedMovieViewController *)self isFSOMovie]) {
    [(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview")) setBackgroundColor:[UIColor blackColor]];
  }
  if ([(THWiOSExpandedMovieViewController *)self moviePlayerViewController])
  {
    [self view].bounds
    [(-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController")) view].frame = CGRectMake(v9, v10, v11, v12);
    [(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view")) setAutoresizingMask:18];
    [-[THWiOSExpandedMovieViewController view](self, "view") addSubview:[-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController") view]];
    if ([(THWiOSExpandedMovieViewController *)self isFSOMovie]) {
      [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] setShowsPlaybackControls:0];
    }
  }
  [self.view layoutIfNeeded];
}

- (void)p_setupFTC
{
  [(THWiOSExpandedMovieViewController *)self setFreeTransformGestureRecognizer:[[THWFreeTransformGestureRecognizer alloc] initWithTarget:self action:"handleGesture:"]];
  [(-[THWiOSExpandedMovieViewController view](self, "view")) addGestureRecognizer:(-[THWiOSExpandedMovieViewController freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"))];
  [(THWFreeTransformGestureRecognizer *)[(THWiOSExpandedMovieViewController *)self freeTransformGestureRecognizer] setUnmovingParentView:[(THWExpandedViewControllerDelegate *)[(THWiOSExpandedMovieViewController *)self delegate] rootSuperview]];
  id v3 = [(THWiOSExpandedMovieViewController *)self freeTransformGestureRecognizer];

  [(THWFreeTransformGestureRecognizer *)v3 setFreeTransformDelegate:self];
}

- (void)animationControllerSetupTarget:(id)a3
{
  if (![(THWiOSExpandedMovieViewController *)self isDismissing])
  {
    id v4 = [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] view];
    [v4 setAlpha:1.0];
  }
}

- (BOOL)animationControllerSetsDestination:(id)a3
{
  return 1;
}

- (id)animationControllerForDismissedController:(id)a3
{
  return 0;
}

- (void)presentExpandedAnimatedWithCompletionBlock:(id)a3
{
  [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] setTransitioningDelegate:self];
  [[(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player] play];
  double v5 = [(THWiOSExpandedMovieViewController *)self moviePlayerViewController];

  [(THWiOSExpandedMovieViewController *)self presentViewController:v5 withTransition:1 completion:a3];
}

- (void)dismissExpandedAnimatedWithCompletionBlock:(id)a3
{
  double v5 = (AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self presentedViewController];
  if (v5 == [(THWiOSExpandedMovieViewController *)self moviePlayerViewController])
  {
    double v7 = [(THWiOSExpandedMovieViewController *)self moviePlayerViewController];
    [(AVPlayerViewController *)v7 dismissViewControllerAnimated:1 completion:a3];
  }
  else if (a3)
  {
    double v6 = (void (*)(id))*((void *)a3 + 2);
    v6(a3);
  }
}

- (void)p_dismissExpandedImmediateWithCompletionBlock:(id)a3
{
  if (![(THWiOSExpandedMovieViewController *)self isDismissing])
  {
    [(THWiOSExpandedMovieViewController *)self setIsDismissing:1];
    [(THWiOSExpandedMovieViewController *)self setExpandedRepControllerState:3];
    [(THWiOSExpandedMovieViewController *)self refreshStatusBarAppearance];
    [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedMovieViewController *)self delegate] expandedViewControllerWillDismiss:self];
    [(THWiOSExpandedMovieViewController *)self setNeedsWhitePointAdaptivityStyleUpdate];
    if (a3) {
      (*((void (**)(id))a3 + 2))(a3);
    }
    [(THWiOSExpandedMovieViewController *)self p_completeDismiss];
    [(THWiOSExpandedMovieViewController *)self setIsDismissing:0];
    [(THWiOSExpandedMovieViewController *)self setExpandedRepControllerState:4];
  }
}

- (void)p_dismissExpandedAnimatedWithCompletionBlock:(id)a3 freeTransformDidEnd:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(THWiOSExpandedMovieViewController *)self isDismissing])
  {
    [(THWiOSExpandedMovieViewController *)self setIsDismissing:1];
    [(THWiOSExpandedMovieViewController *)self setExpandedRepControllerState:3];
    [(THWiOSExpandedMovieViewController *)self refreshStatusBarAppearance];
    id v7 = [(THWiOSExpandedMovieViewController *)self expandedRepSourceRep];
    if (v4)
    {
      id v8 = 0;
      id v9 = 0;
    }
    else
    {
      id v9 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "hostICC"), "layerHost"), "canvasLayer");
      id v8 = [[-[THWiOSExpandedMovieViewController view](self, "view") layer]];
      [(THWiOSExpandedMovieViewController *)self p_setMoviePlayerBackgroundColor:+[UIColor clearColor] animated:0];
    }
    [(THWiOSExpandedMovieViewController *)self setAnimationController:objc_alloc_init(THAnimationController)];
    uint64_t v10 = TSUProtocolCast();
    [(THAnimationController *)[(THWiOSExpandedMovieViewController *)self animationController] setSource:self->_animationDelegate];
    [(THAnimationController *)[(THWiOSExpandedMovieViewController *)self animationController] setDestination:v10];
    -[THAnimationController setHostLayer:[-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview") layer]];
    [(THAnimationController *)[(THWiOSExpandedMovieViewController *)self animationController] setForegroundLayer:v9];
    [(THAnimationController *)[(THWiOSExpandedMovieViewController *)self animationController] setBackgroundLayer:v8];
    [(THAnimationController *)[(THWiOSExpandedMovieViewController *)self animationController] addObserver:self];
    [(THAnimationController *)[(THWiOSExpandedMovieViewController *)self animationController] presentAnimationWithCompletionBlock:&v11 overshoot:v4];
  }
}

- (void)dismissExpandedImmediate
{
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)isZoomed
{
  return 0;
}

- (BOOL)expandedRepControllerHasRoomForPanels
{
  return 0;
}

- (BOOL)freeTransformControllerWantsCurtainFadeOut:(id)a3
{
  return 1;
}

- (CGSize)curtainSizeForFreeTransformController:(id)a3
{
  [self view:a3].frame;
  double v4 = v3;
  double v6 = v5;
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (void)freeTransformControllerDidBegin:(id)a3
{
  [(THWiOSExpandedMovieViewController *)self p_setMoviePlayerBackgroundColor:+[UIColor clearColor] animated:1];
  [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] setVideoGravity:AVLayerVideoGravityResizeAspect];
  double v4 = [(THWiOSExpandedMovieViewController *)self moviePlayerViewController];

  [(AVPlayerViewController *)v4 setShowsPlaybackControls:0];
}

- (void)p_setMoviePlayerBackgroundColor:(id)a3 animated:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1400A8;
  v4[3] = &unk_456E38;
  v4[4] = self;
  v4[5] = a3;
  if (a4) {
    +[UIView animateWithDuration:v4 animations:0.25];
  }
  else {
    sub_1400A8((uint64_t)v4);
  }
}

- (id)p_curtainColor
{
  return +[TSUColor blackColor];
}

- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3
{
  id v3 = [self expandedRepSourceRep:a3 layout];

  [v3 frameInParent];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)freeTransformControllerDidFinishFreeTransforming:(id)a3 passedThreshold:(BOOL)a4 completionBlock:(id)a5
{
  if (a4 || objc_msgSend(objc_msgSend(a3, "transformGR"), "state") == &dword_4)
  {
    [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedMovieViewController *)self delegate] expandedViewControllerWillBeginDismissing:self];
    if (objc_msgSend(objc_msgSend(a3, "transformGR"), "state") == &dword_4)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1403FC;
      v10[3] = &unk_456E88;
      v10[4] = self;
      v10[5] = a5;
      [(THWiOSExpandedMovieViewController *)self p_dismissExpandedImmediateWithCompletionBlock:v10];
    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_140468;
      v9[3] = &unk_456E88;
      v9[4] = self;
      v9[5] = a5;
      [(THWiOSExpandedMovieViewController *)self p_dismissExpandedAnimatedWithCompletionBlock:v9 freeTransformDidEnd:1];
    }
  }
  else
  {
    [self p_setMoviePlayerBackgroundColor:[self p_curtainColor] animated:1];
    [(THWiOSExpandedMovieViewController *)self setAnimationController:objc_alloc_init(THAnimationController)];
    [(THAnimationController *)[(THWiOSExpandedMovieViewController *)self animationController] setSource:self->_animationDelegate];
    [(THAnimationController *)[(THWiOSExpandedMovieViewController *)self animationController] setDestination:self->_animationDelegate];
    [-[THWiOSExpandedMovieViewController animationController](self, "animationController") setHostLayer:[-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview") layer]];
    [(THAnimationController *)[(THWiOSExpandedMovieViewController *)self animationController] presentAnimationWithCompletionBlock:&v8 overshoot:0];
  }
}

- (id)unmovingParentViewForFreeTransformController:(id)a3
{
  id v3 = [(THWiOSExpandedMovieViewController *)self delegate];

  return [(THWExpandedViewControllerDelegate *)v3 rootSuperview];
}

- ($A219A65C3B9F57E4A1EAB42BC6271E0A)shadowPropertiesForFreeTransformController:(SEL)a3 defaults:(id)a4
{
  return self;
}

- (BOOL)freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:(id)a3
{
  return 0;
}

- (BOOL)freeTransformGestureRecognizerShouldDelayRecognizeUntilScaleChange:(id)a3
{
  return 0;
}

- (BOOL)freeTransformGestureRecognizerShouldRubberband:(id)a3
{
  return 0;
}

- (BOOL)freeTransformGestureRecognizerShouldAllowPinchDown:(id)a3
{
  return 1;
}

- (BOOL)freeTransformGestureRecognizerShouldAllowPinchUp:(id)a3
{
  return 0;
}

- (id)hostCanvasLayer
{
  return 0;
}

- (id)curtainColorForFreeTransform
{
  return 0;
}

- (CGRect)rectForCompletionAnimationWithRep:(id)a3
{
  id v3 = [self expandedRepSourceRep:a3 layout];

  [v3 frameInParent];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)freeTransformDidBeginWithRep:(id)a3 expandableRep:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_14066C;
  v4[3] = &unk_456DE0;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, a4, 0.5);
}

- (void)animationController:(id)a3 updateWhitePointAdaptivtyStyleWithDuration:(double)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1406F4;
  v4[3] = &unk_456DE0;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:a4];
}

- (void)audioPlaybackWillStart:(id)a3
{
  if (a3 != self)
  {
    double v5 = [(AVPlayerViewController *)[(THWiOSExpandedMovieViewController *)self moviePlayerViewController] player];
    [(AVPlayer *)v5 pause];
  }
}

- (THWExpandedViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWExpandedViewControllerDelegate *)a3;
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (THWMovieInfo)movieInfo
{
  return self->_movieInfo;
}

- (void)setMovieInfo:(id)a3
{
  self->_movieInfo = (THWMovieInfo *)a3;
}

- (BOOL)presented
{
  return self->_presented;
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (THAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (THWiOSExpandedMovieAnimationDelegate)animationDelegate
{
  return self->_animationDelegate;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (AVPlayerViewController)moviePlayerViewController
{
  return self->_moviePlayerViewController;
}

- (void)setMoviePlayerViewController:(id)a3
{
}

- (BOOL)registeredForNotification
{
  return self->_registeredForNotification;
}

- (void)setRegisteredForNotification:(BOOL)a3
{
  self->_registeredForNotification = a3;
}

- (BOOL)isFSOMovie
{
  return self->_isFSOMovie;
}

- (void)setIsFSOMovie:(BOOL)a3
{
  self->_isFSOMovie = a3;
}

- (BOOL)receivedPreRoll
{
  return self->_receivedPreRoll;
}

- (void)setReceivedPreRoll:(BOOL)a3
{
  self->_receivedPreRoll = a3;
}

- (CALayer)rotationScrim
{
  return self->_rotationScrim;
}

- (void)setRotationScrim:(id)a3
{
  self->_rotationScrim = (CALayer *)a3;
}

- (int)expandedRepControllerState
{
  return self->_expandedRepControllerState;
}

- (void)setExpandedRepControllerState:(int)a3
{
  self->_expandedRepControllerState = a3;
}

- (THWFreeTransformController)freeTransformController
{
  return self->_freeTransformController;
}

- (void)setFreeTransformController:(id)a3
{
}

- (THWFreeTransformGestureRecognizer)freeTransformGestureRecognizer
{
  return self->_freeTransformGestureRecognizer;
}

- (void)setFreeTransformGestureRecognizer:(id)a3
{
}

- (UIColor)rootBackgroundColor
{
  return self->_rootBackgroundColor;
}

- (void)setRootBackgroundColor:(id)a3
{
}

- (UIImageView)moviePosterView
{
  return self->_moviePosterView;
}

- (void)setMoviePosterView:(id)a3
{
}

- (id)presentCompletionBlock
{
  return self->_presentCompletionBlock;
}

- (void)setPresentCompletionBlock:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

@end