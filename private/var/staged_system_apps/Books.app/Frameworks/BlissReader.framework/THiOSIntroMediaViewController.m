@interface THiOSIntroMediaViewController
- (AVPlayerViewController)moviePlayerViewController;
- (BOOL)controlsHidden;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isMovie;
- (BOOL)isPlaying;
- (BOOL)movieIsInAspectFitMode;
- (BOOL)moviePlayerControllerIsLoaded;
- (BOOL)moviePlayerControllerIsShowing;
- (BOOL)needsMoviePosterForOpenAnimation;
- (BOOL)p_isAtEnd;
- (BOOL)p_isImage;
- (BOOL)prefersStatusBarHidden;
- (BOOL)registeredForNotification;
- (CGSize)hostViewSizeForIntroMediaController:(id)a3;
- (NSTimer)fadeoutTimer;
- (THiOSIntroMediaViewController)initWithDocumentRoot:(id)a3;
- (THiOSIntroMediaViewControllerDelegate)delegate;
- (UIButton)closeButton;
- (UIImage)image;
- (UIView)scrimView;
- (double)movieAspectRatio;
- (double)playbackRate;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)controlsInfoForIntroMediaController:(id)a3;
- (id)movieGestureView;
- (int64_t)preferredStatusBarStyle;
- (void)audioPlaybackWillStart:(id)a3;
- (void)dealloc;
- (void)didBecomeActive:(id)a3;
- (void)ensureReadyToPlay;
- (void)hideControls;
- (void)introMediaControllerShouldToggleControls;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_cancelUIFadeOutTimer;
- (void)p_configureCloseButton;
- (void)p_hideMovieControlsAnimated:(BOOL)a3;
- (void)p_nextPage;
- (void)p_playForBookOpen:(BOOL)a3;
- (void)p_playerDidPlayToEnd:(id)a3;
- (void)p_releaseOutlets;
- (void)p_removePlaybackNotifications;
- (void)p_resetMoviePlayer;
- (void)p_resetUIFadeOutTimer;
- (void)p_setupPlaybackNotifications;
- (void)p_showMovieControls;
- (void)p_unloadMoviePlayer;
- (void)p_updateFrameForSize:(CGSize)a3;
- (void)p_updateSetShowsDoneButton;
- (void)pause;
- (void)pauseAndDismissMoviePlayer;
- (void)play;
- (void)playForBookOpen;
- (void)playForIntroMediaBecomesVisible;
- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)prepareControlsForTOC;
- (void)prepareMovieForTOC;
- (void)setCloseButton:(id)a3;
- (void)setControlsHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFadeoutTimer:(id)a3;
- (void)setImage:(id)a3;
- (void)setMovieAspectRatio:(double)a3;
- (void)setMovieIsInAspectFitMode:(BOOL)a3;
- (void)setMoviePlayerControllerIsLoaded:(BOOL)a3;
- (void)setMoviePlayerControllerIsShowing:(BOOL)a3;
- (void)setMoviePlayerViewController:(id)a3;
- (void)setNeedsMoviePosterForOpenAnimation:(BOOL)a3;
- (void)setRegisteredForNotification:(BOOL)a3;
- (void)setScrimView:(id)a3;
- (void)showControls;
- (void)stop;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willResignActive:(id)a3;
@end

@implementation THiOSIntroMediaViewController

- (THiOSIntroMediaViewController)initWithDocumentRoot:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THiOSIntroMediaViewController;
  v4 = [(THiOSIntroMediaViewController *)&v7 initWithNibName:0 bundle:0];
  if (v4)
  {
    v5 = [[THWIntroMediaController alloc] initWithDocumentRoot:a3];
    v4->_introMediaController = v5;
    if (v5)
    {
      [(THWIntroMediaController *)v5 setDelegate:v4];
      [+[NSNotificationCenter defaultCenter] addObserver:v4 selector:"didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
      [+[NSNotificationCenter defaultCenter] addObserver:v4 selector:"willResignActive:" name:UIApplicationWillResignActiveNotification object:0];
      [+[BCAudioMuxingCoordinator sharedInstance] addAudioMuxingObserver:v4];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  [+[BCAudioMuxingCoordinator sharedInstance] removeAudioMuxingObserver:self];
  [(THiOSIntroMediaViewController *)self p_removePlaybackNotifications];
  [(THiOSIntroMediaViewController *)self p_releaseOutlets];
  [(THiOSIntroMediaViewController *)self p_cancelUIFadeOutTimer];
  [(THWIntroMediaController *)self->_introMediaController setDelegate:0];

  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)THiOSIntroMediaViewController;
  [(THiOSIntroMediaViewController *)&v3 dealloc];
}

- (void)p_releaseOutlets
{
  [(THiOSIntroMediaViewController *)self p_unloadMoviePlayer];
  [self->mTapGesture view]->removeGestureRecognizer:self->mTapGesture;
  [(UITapGestureRecognizer *)self->mTapGesture setDelegate:0];

  self->mTapGesture = 0;
  [(THiOSIntroMediaViewController *)self setImage:0];
  [(UIButton *)[(THiOSIntroMediaViewController *)self closeButton] removeFromSuperview];
  [(THiOSIntroMediaViewController *)self setCloseButton:0];
  [(THiOSIntroMediaViewController *)self setDelegate:0];

  [(THiOSIntroMediaViewController *)self setScrimView:0];
}

- (BOOL)prefersStatusBarHidden
{
  if ([(THWIntroMediaController *)self->_introMediaController isMovie]) {
    return 1;
  }

  return [(THiOSIntroMediaViewController *)self controlsHidden];
}

- (int64_t)preferredStatusBarStyle
{
  return [(THWIntroMediaController *)self->_introMediaController isMovie] ^ 1;
}

- (BOOL)p_isImage
{
  return ![(THWIntroMediaController *)self->_introMediaController isMovie];
}

- (void)loadView
{
  v19.receiver = self;
  v19.super_class = (Class)THiOSIntroMediaViewController;
  [(THiOSIntroMediaViewController *)&v19 loadView];
  [self view].frame
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = -[THiOSIntroMediaView initWithFrame:]([THiOSIntroMediaView alloc], "initWithFrame:", v3, v5, v7, v9);
  [(THiOSIntroMediaView *)v11 setClipsToBounds:0];
  [(THiOSIntroMediaViewController *)self setView:v11];
  [self view].autoresizingMask = 18;
  [self view].contentMode = 1;
  [(THiOSIntroMediaViewController *)self setMovieIsInAspectFitMode:1];
  [self view].userInteractionEnabled = 1;

  if (v8 >= v10) {
    double v12 = v8;
  }
  else {
    double v12 = v10;
  }
  id v13 = [objc_alloc((Class)UIView) initWithFrame:v4, v6, v12 * 1.42, v12 * 1.42];
  [v13 setBackgroundColor:[UIColor blackColor]];
  [self view].addSubview:v13;
  [self view].center;
  [v13 setCenter:];
  [(THiOSIntroMediaViewController *)self setScrimView:v13];

  if (![(THWIntroMediaController *)self->_introMediaController isMovie])
  {
    v14 = [(THBookDescription *)[(THDocumentRoot *)[(THWIntroMediaController *)self->_introMediaController documentRoot] bookDescription] drmContext];
    if (v14) {
      v15 = +[UIImage imageWithData:[(PFDContext *)v14 dataWithContentsOfFile:[(NSURL *)[(THWIntroMediaController *)self->_introMediaController url] path] error:0]];
    }
    else {
      v15 = +[UIImage imageWithContentsOfFile:[(NSURL *)[(THWIntroMediaController *)self->_introMediaController url] path]];
    }
    [(THiOSIntroMediaViewController *)self setImage:v15];
    [self view].backgroundColor = [UIColor blackColor];
    id v16 = [objc_alloc((Class)UIImageView) initWithImage:[self image]];
    [v16 setContentMode:1];
    [v16 setAutoresizingMask:18];
    [self view].frame;
    [v16 setFrame:];
    [v16 setUserInteractionEnabled:0];
    [self.view addSubview:v16];

    v17 = +[UIButton buttonWithType:0];
    [(UIButton *)v17 setAdjustsImageWhenHighlighted:1];
    [(UIButton *)v17 addTarget:self action:"p_nextPage" forControlEvents:64];
    [(UIButton *)v17 setImage:+[UIImage th_imageNamed:@"ib_media_close-N"] forState:0];
    [(UIButton *)v17 sizeToFit];
    [(UIButton *)v17 setAlpha:0.0];
    [(THiOSIntroMediaViewController *)self setCloseButton:v17];
    [-[THiOSIntroMediaViewController view](self, "view") addSubview:[self closeButton]];
    v18 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"introMediaControllerShouldToggleControls"];
    self->mTapGesture = v18;
    [(UITapGestureRecognizer *)v18 setDelegate:self];
    [self->mTapGesture addGestureRecognizer:[self view]];
  }
}

- (void)didBecomeActive:(id)a3
{
  self->mIsResignedActive = 0;
}

- (void)willResignActive:(id)a3
{
  self->mIsResignedActive = 1;
  if ([(THiOSIntroMediaViewController *)self isPlaying])
  {
    [(THiOSIntroMediaViewController *)self pause];
  }
  else if ([(THiOSIntroMediaViewControllerDelegate *)[(THiOSIntroMediaViewController *)self delegate] introMediaControllerIsOffscreen])
  {
    self->mMovieNeedsUnloading = 1;
    [(THiOSIntroMediaViewController *)self p_unloadMoviePlayer];
  }
}

- (void)p_unloadMoviePlayer
{
  [(THiOSIntroMediaViewController *)self p_removePlaybackNotifications];
  [[(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player] pause];
  if ([(THiOSIntroMediaViewController *)self moviePlayerViewController])
  {
    double v3 = self->_moviePlayerViewController;
    self->_moviePlayerViewController = 0;
    [(THiOSIntroMediaViewController *)self setMoviePlayerControllerIsLoaded:0];
  }
}

- (void)p_updateSetShowsDoneButton
{
  id v2 = [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] childViewControllerForStatusBarHidden];
  if (objc_opt_respondsToSelector())
  {
    [v2 setShowsDoneButton:1];
  }
}

- (void)p_resetMoviePlayer
{
  if (![(THiOSIntroMediaViewController *)self moviePlayerViewController])
  {
    self->mMovieNeedsUnloading = 0;
    id v3 = [objc_alloc((Class)AVPlayer) initWithPlayerItem:[AVPlayerItem playerItemWithURL:[self->_introMediaController url]]];
    double v4 = [(THBookDescription *)[(THDocumentRoot *)[(THWIntroMediaController *)self->_introMediaController documentRoot] bookDescription] drmContext];
    [v3 setAllowsExternalPlayback:[v4 kiUanAfQBD5qIUraolUj] ^ 1];
    if ([(PFDContext *)v4 kiUanAfQBD5qIUraolUj]) {
      -[PFDContext authorizeAVPlayerItemForPlayback:](v4, "authorizeAVPlayerItemForPlayback:", [v3 currentItem]);
    }
    long long v5 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    [v3 seekToTime:&v5];
    self->_moviePlayerViewController = (AVPlayerViewController *)objc_alloc_init((Class)AVPlayerViewController);
    [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] setAllowsPictureInPicturePlayback:0];
    [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] setDelegate:self];
    [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] setPlayer:v3];

    [(THiOSIntroMediaViewController *)self p_setupPlaybackNotifications];
    [(THiOSIntroMediaViewController *)self setMoviePlayerControllerIsLoaded:0];
    [(THiOSIntroMediaViewController *)self setMoviePlayerControllerIsShowing:0];
  }
  if (![(THiOSIntroMediaViewController *)self moviePlayerControllerIsShowing])
  {
    if (![(THiOSIntroMediaViewController *)self parentViewController]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSIntroMediaViewController p_resetMoviePlayer]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSIntroMediaViewController.m") lineNumber:291 description:@"invalid nil value for '%s'", "self.parentViewController"];
    }
    [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] setShowsPlaybackControls:1];
    [(THiOSIntroMediaViewController *)self presentViewController:[(THiOSIntroMediaViewController *)self moviePlayerViewController] animated:1 completion:0];
    [(THiOSIntroMediaViewController *)self setMoviePlayerControllerIsShowing:1];
  }
}

- (void)p_setupPlaybackNotifications
{
  objc_sync_enter(self);
  if (![(THiOSIntroMediaViewController *)self moviePlayerViewController]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSIntroMediaViewController p_setupPlaybackNotifications]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSIntroMediaViewController.m") lineNumber:302 description:@"invalid nil value for '%s'", "self.moviePlayerViewController"];
  }
  if ([[(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player] currentItem]&& ![(THiOSIntroMediaViewController *)self registeredForNotification])
  {
    id v3 = [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player];
    [(AVPlayer *)v3 addObserver:self forKeyPath:@"status" options:1 context:off_56DE78];
    [+[NSNotificationCenter defaultCenter] addObserver:self selector:"p_playerDidPlayToEnd:" name:AVPlayerItemDidPlayToEndTimeNotification object:[[(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player] currentItem]];
    [(THiOSIntroMediaViewController *)self setRegisteredForNotification:1];
  }

  objc_sync_exit(self);
}

- (void)p_removePlaybackNotifications
{
  objc_sync_enter(self);
  if ([(THiOSIntroMediaViewController *)self moviePlayerViewController]
    && [(THiOSIntroMediaViewController *)self registeredForNotification])
  {
    [[(AVPlayerViewController *)self->_moviePlayerViewController player] removeObserver:self forKeyPath:@"status"];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:[[(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player] currentItem]];
    [(THiOSIntroMediaViewController *)self setRegisteredForNotification:0];
  }

  objc_sync_exit(self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_56DE78 == a6 && [a3 isEqualToString:@"status"])
  {
    if ((char *)[[(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player] status] == (char *)&dword_0 + 1)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_101AE0;
      v12[3] = &unk_457140;
      v12[4] = self;
      [[(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player] prerollAtRate:v12 completionHandler:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0))];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)THiOSIntroMediaViewController;
    [(THiOSIntroMediaViewController *)&v11 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

- (void)pauseAndDismissMoviePlayer
{
  [(THiOSIntroMediaViewController *)self pause];
  [(THiOSIntroMediaViewController *)self p_unloadMoviePlayer];
  if ([(THiOSIntroMediaViewController *)self delegate])
  {
    id v3 = [(THiOSIntroMediaViewController *)self delegate];
    [(THiOSIntroMediaViewControllerDelegate *)v3 introMediaControllerShouldAdvancePast:self];
  }
  else
  {
    [(THiOSIntroMediaViewController *)self prepareControlsForTOC];
  }
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  double v4 = [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player];

  [(AVPlayer *)v4 play];
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
}

- (void)audioPlaybackWillStart:(id)a3
{
  if (a3 != self) {
    [(THiOSIntroMediaViewController *)self pause];
  }
}

- (void)introMediaControllerShouldToggleControls
{
  if ([(THiOSIntroMediaViewController *)self areControlsHidden])
  {
    [(THiOSIntroMediaViewController *)self showControls];
  }
  else
  {
    [(THiOSIntroMediaViewController *)self hideControls];
  }
}

- (void)p_playerDidPlayToEnd:(id)a3
{
  if (!self->mIsResignedActive)
  {
    double v4 = (AVPlayerViewController *)[(THiOSIntroMediaViewController *)self presentedViewController];
    if (v4 == [(THiOSIntroMediaViewController *)self moviePlayerViewController]) {
      [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] dismissViewControllerAnimated:1 completion:0];
    }
    if ([(THiOSIntroMediaViewController *)self delegate]) {
      [(THiOSIntroMediaViewControllerDelegate *)[(THiOSIntroMediaViewController *)self delegate] introMediaControllerShouldAdvancePast:self];
    }
    else {
      [(THiOSIntroMediaViewController *)self prepareControlsForTOC];
    }
    self->mMovieNeedsUnloading = 1;
  }
}

- (void)p_nextPage
{
  [(UIButton *)[(THiOSIntroMediaViewController *)self closeButton] setAlpha:0.0];
  id v3 = [(THiOSIntroMediaViewController *)self delegate];

  [(THiOSIntroMediaViewControllerDelegate *)v3 introMediaControllerShouldAdvancePast:self];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (void)playForIntroMediaBecomesVisible
{
  [(THiOSIntroMediaViewController *)self p_updateSetShowsDoneButton];
  if ([(THWIntroMediaController *)self->_introMediaController isMovie])
  {
    id v3 = [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player];
    if (v3 && ([(AVPlayer *)v3 currentTime], v4 > 0))
    {
      [(THiOSIntroMediaViewController *)self p_showMovieControls];
    }
    else
    {
      [(THiOSIntroMediaViewController *)self play];
      [(THiOSIntroMediaViewController *)self p_hideMovieControlsAnimated:1];
    }
  }
  else
  {
    [(THiOSIntroMediaViewController *)self showControls];
  }
}

- (void)playForBookOpen
{
}

- (void)play
{
}

- (BOOL)p_isAtEnd
{
  id v3 = [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player];
  if (v3) {
    [(AVPlayer *)v3 currentTime];
  }
  uint64_t v4 = [[(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player] currentItem];
  if (v4)
  {
    [(AVPlayerItem *)v4 duration];
    uint64_t v5 = v8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  return vabdd_f64((double)0, (double)v5) < 0.00999999978 || v5 < 0;
}

- (void)p_playForBookOpen:(BOOL)a3
{
  BOOL v3 = a3;
  [(THiOSIntroMediaViewController *)self p_updateSetShowsDoneButton];
  [+[BCAudioMuxingCoordinator sharedInstance] notifyPlaybackWillStart:self];
  if ([(THiOSIntroMediaViewController *)self p_isAtEnd])
  {
    uint64_t v5 = [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player];
    long long v6 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    [(AVPlayer *)v5 seekToTime:&v6];
  }
  [[(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player] play];
  if (v3) {
    [(THiOSIntroMediaViewController *)self p_hideMovieControlsAnimated:1];
  }
}

- (void)pause
{
  id v2 = [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player];

  [(AVPlayer *)v2 pause];
}

- (void)stop
{
  id v2 = [(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player];

  [(AVPlayer *)v2 pause];
}

- (void)ensureReadyToPlay
{
  if ([(THWIntroMediaController *)self->_introMediaController isMovie]
    && ![(THiOSIntroMediaViewController *)self isPlaying])
  {
    [(THiOSIntroMediaViewController *)self p_resetMoviePlayer];
  }
}

- (void)prepareControlsForTOC
{
  if ([(THiOSIntroMediaViewController *)self isViewLoaded]
    && ![(THiOSIntroMediaViewController *)self controlsHidden])
  {
    if ([(THWIntroMediaController *)self->_introMediaController isMovie]) {
      [(THiOSIntroMediaViewController *)self p_hideMovieControlsAnimated:0];
    }
    else {
      [(THiOSIntroMediaViewController *)self hideControls];
    }
    [(THiOSIntroMediaViewController *)self p_resetUIFadeOutTimer];
  }

  [(THiOSIntroMediaViewController *)self refreshStatusBarAppearance];
}

- (void)prepareMovieForTOC
{
  if ([(THiOSIntroMediaViewController *)self isViewLoaded]
    && [(THWIntroMediaController *)self->_introMediaController isMovie]
    && self->mMovieNeedsUnloading)
  {
    [(THiOSIntroMediaViewController *)self p_unloadMoviePlayer];
  }
}

- (BOOL)isPlaying
{
  [(THiOSIntroMediaViewController *)self playbackRate];
  return v2 != 0.0;
}

- (double)playbackRate
{
  if (![(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player])return 0.0; {
  [[(AVPlayerViewController *)[(THiOSIntroMediaViewController *)self moviePlayerViewController] player] rate];
  }
  return v3;
}

- (BOOL)isMovie
{
  return [(THWIntroMediaController *)self->_introMediaController isMovie];
}

- (void)showControls
{
  [(THiOSIntroMediaViewController *)self p_resetUIFadeOutTimer];
  if ([(THWIntroMediaController *)self->_introMediaController isMovie])
  {
    [(THiOSIntroMediaViewController *)self p_showMovieControls];
    [(THiOSIntroMediaViewController *)self refreshStatusBarAppearance];
  }
  else
  {
    if ([(THiOSIntroMediaViewControllerDelegate *)[(THiOSIntroMediaViewController *)self delegate] closeButtonIsNeeded])
    {
      [(THiOSIntroMediaViewController *)self p_configureCloseButton];
      v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      v23 = sub_10230C;
      v24 = &unk_456DE0;
      v25 = self;
      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      v18 = sub_102368;
      objc_super v19 = &unk_457140;
      v20 = self;
      double v3 = 0.75;
      uint64_t v4 = &v21;
      uint64_t v5 = &v16;
    }
    else
    {
      [(UIButton *)[(THiOSIntroMediaViewController *)self closeButton] setAlpha:0.0];
      objc_super v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472;
      id v13 = sub_102370;
      v14 = &unk_456DE0;
      v15 = self;
      long long v6 = _NSConcreteStackBlock;
      uint64_t v7 = 3221225472;
      uint64_t v8 = sub_1023B4;
      double v9 = &unk_457140;
      double v10 = self;
      double v3 = 0.75;
      uint64_t v4 = &v11;
      uint64_t v5 = &v6;
    }
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v5, v3, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      v25);
  }
}

- (void)p_configureCloseButton
{
  if ([(THiOSIntroMediaViewController *)self controlsHidden])
  {
    [(UIImage *)[(THiOSIntroMediaViewController *)self image] size];
    double v4 = v3;
    double v6 = v5;
    [self view].frame;
    double v8 = v7;
    [self view].frame;
    if (v4 <= v6)
    {
      double v13 = v9;
      [self view].bounds;
      if (v6 == 0.0)
      {
        double v13 = v14 * 0.5;
      }
      else
      {
        double v15 = v14 / v6;
        [self view].bounds;
        double v8 = (v16 - v4 * v15) * 0.5;
      }
    }
    else
    {
      [self view].bounds;
      double v11 = v10 / v4;
      [self view].bounds;
      double v13 = (v12 - v6 * v11) * 0.5;
    }
    objc_msgSend(objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "window"), "statusBarMinDimension");
    if (v13 >= v17) {
      double v17 = -0.0;
    }
    double v18 = v13 + v17;
    [(UIButton *)[(THiOSIntroMediaViewController *)self closeButton] frame];
    double v20 = v19;
    double v22 = v21;
    v23 = [(THiOSIntroMediaViewController *)self closeButton];
    -[UIButton setFrame:](v23, "setFrame:", v8 + 4.0, v18 + 4.0, v20, v22);
  }
}

- (void)hideControls
{
  if ([(THWIntroMediaController *)self->_introMediaController isMovie])
  {
    [(THiOSIntroMediaViewController *)self p_hideMovieControlsAnimated:1];
  }
  else
  {
    [(THiOSIntroMediaViewController *)self p_cancelUIFadeOutTimer];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_102624;
    v4[3] = &unk_456DE0;
    v4[4] = self;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10269C;
    v3[3] = &unk_457140;
    v3[4] = self;
    +[UIView animateWithDuration:v4 animations:v3 completion:0.75];
  }
}

- (void)p_hideMovieControlsAnimated:(BOOL)a3
{
  if (![(THiOSIntroMediaViewController *)self controlsHidden])
  {
    [(THiOSIntroMediaViewController *)self setControlsHidden:1];
    [(THiOSIntroMediaViewController *)self refreshStatusBarAppearance];
  }
}

- (void)p_showMovieControls
{
  if ([(THiOSIntroMediaViewController *)self controlsHidden])
  {
    [(THiOSIntroMediaViewController *)self setControlsHidden:0];
    [(THiOSIntroMediaViewController *)self refreshStatusBarAppearance];
  }
}

- (id)movieGestureView
{
  if (![(THWIntroMediaController *)self->_introMediaController isMovie]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSIntroMediaViewController movieGestureView]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSIntroMediaViewController.m") lineNumber:677 description:@"Intro media is not a movie."];
  }
  if (![(THWIntroMediaController *)self->_introMediaController isMovie]) {
    return 0;
  }
  id v3 = [[-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController") view] superview];

  return [v3 superview];
}

- (id)controlsInfoForIntroMediaController:(id)a3
{
  return 0;
}

- (CGSize)hostViewSizeForIntroMediaController:(id)a3
{
  [self view:a3].frame;
  double v4 = v3;
  double v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)p_resetUIFadeOutTimer
{
  if (![(THWIntroMediaController *)self->_introMediaController isMovie])
  {
    [(THiOSIntroMediaViewController *)self p_cancelUIFadeOutTimer];
    double v3 = +[NSTimer scheduledTimerWithTimeInterval:self target:"p_hideUITimerFired" selector:0 userInfo:0 repeats:5.0];
    [(THiOSIntroMediaViewController *)self setFadeoutTimer:v3];
  }
}

- (void)p_cancelUIFadeOutTimer
{
  [(NSTimer *)[(THiOSIntroMediaViewController *)self fadeoutTimer] invalidate];

  [(THiOSIntroMediaViewController *)self setFadeoutTimer:0];
}

- (void)p_updateFrameForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double y = CGRectZero.origin.y;
  [self view].frame
  v19.origin.x = v7;
  v19.origin.double y = v8;
  v19.size.double width = v9;
  v19.size.double height = v10;
  v18.origin.x = CGRectZero.origin.x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  if (!CGRectEqualToRect(v18, v19))
  {
    [self.view setFrame:CGRectZero.origin.x, y, width, height];
    if (width >= height) {
      double v11 = width;
    }
    else {
      double v11 = height;
    }
    -[UIView setBounds:]([(THiOSIntroMediaViewController *)self scrimView], "setBounds:", CGRectZero.origin.x, y, v11 * 1.42, v11 * 1.42);
    [self view].center;
    double v13 = v12;
    double v15 = v14;
    double v16 = [(THiOSIntroMediaViewController *)self scrimView];
    -[UIView setCenter:](v16, "setCenter:", v13, v15);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  -[THiOSIntroMediaViewController p_updateFrameForSize:](self, "p_updateFrameForSize:");
  v8.receiver = self;
  v8.super_class = (Class)THiOSIntroMediaViewController;
  -[THiOSIntroMediaViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  if (![(THWIntroMediaController *)self->_introMediaController isMovie]) {
    return 0;
  }

  return [(THiOSIntroMediaViewController *)self moviePlayerViewController];
}

- (THiOSIntroMediaViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THiOSIntroMediaViewControllerDelegate *)a3;
}

- (BOOL)needsMoviePosterForOpenAnimation
{
  return self->_needsMoviePosterForOpenAnimation;
}

- (void)setNeedsMoviePosterForOpenAnimation:(BOOL)a3
{
  self->_needsMoviePosterForOpenAnimation = a3;
}

- (UIView)scrimView
{
  return self->_scrimView;
}

- (void)setScrimView:(id)a3
{
}

- (NSTimer)fadeoutTimer
{
  return self->_fadeoutTimer;
}

- (void)setFadeoutTimer:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (AVPlayerViewController)moviePlayerViewController
{
  return self->_moviePlayerViewController;
}

- (void)setMoviePlayerViewController:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (BOOL)movieIsInAspectFitMode
{
  return self->_movieIsInAspectFitMode;
}

- (void)setMovieIsInAspectFitMode:(BOOL)a3
{
  self->_movieIsInAspectFitMode = a3;
}

- (double)movieAspectRatio
{
  return self->_movieAspectRatio;
}

- (void)setMovieAspectRatio:(double)a3
{
  self->_movieAspectRatio = a3;
}

- (BOOL)controlsHidden
{
  return self->_controlsHidden;
}

- (void)setControlsHidden:(BOOL)a3
{
  self->_controlsHidden = a3;
}

- (BOOL)moviePlayerControllerIsLoaded
{
  return self->_moviePlayerControllerIsLoaded;
}

- (void)setMoviePlayerControllerIsLoaded:(BOOL)a3
{
  self->_moviePlayerControllerIsLoaded = a3;
}

- (BOOL)moviePlayerControllerIsShowing
{
  return self->_moviePlayerControllerIsShowing;
}

- (void)setMoviePlayerControllerIsShowing:(BOOL)a3
{
  self->_moviePlayerControllerIsShowing = a3;
}

- (BOOL)registeredForNotification
{
  return self->_registeredForNotification;
}

- (void)setRegisteredForNotification:(BOOL)a3
{
  self->_registeredForNotification = a3;
}

@end