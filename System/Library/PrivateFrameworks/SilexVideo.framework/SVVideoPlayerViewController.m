@interface SVVideoPlayerViewController
- (AVPlayerViewController)playerViewController;
- (BOOL)enablePictureInPictureBehaviors;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isFullscreen;
- (BOOL)isFullscreenInProgress;
- (BOOL)isLoading;
- (BOOL)isPictureInPictureActive;
- (BOOL)isPlaying;
- (BOOL)playButtonTapped;
- (BOOL)playbackAllowedForPlaybackCoordinator:(id)a3;
- (BOOL)playerViewController:(id)a3 shouldExitFullScreenWithReason:(int64_t)a4;
- (BOOL)showsPlaybackControls;
- (SVAdGradientView)adGradientView;
- (SVAdPrivacyButton)adPrivacyButton;
- (SVAutomaticFullscreenVideoPlaybackBehaviorManager)fullscreenBehaviorManager;
- (SVKeyValueObserver)videoBoundsObserver;
- (SVLearnMoreButton)learnMoreButton;
- (SVPlaybackCoordinator)coordinator;
- (SVPlaybackCoordinator)primaryContentCoordinator;
- (SVVideoAdProviding)videoAd;
- (SVVideoAdSkipButton)skipButton;
- (SVVideoPlaybackQueue)queue;
- (SVVideoPlayerViewController)init;
- (SVVideoPlayerViewControllerDataSource)dataSource;
- (SVVideoPlayerViewControllerDelegate)delegate;
- (SVVideoVolumeObserver)volumeObserver;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIGestureRecognizer)tapGesture;
- (UIViewController)viewControllerForModalPresentation;
- (unint64_t)fullscreenBehavior;
- (unint64_t)mode;
- (void)adSkipButtonTapped:(id)a3;
- (void)addDebuggerAction:(id)a3;
- (void)advance;
- (void)dealloc;
- (void)embedVideoPlayerIfNeeded;
- (void)enterFullscreenWithCompletionBlock:(id)a3;
- (void)exitFullscreenWithCompletionBlock:(id)a3;
- (void)finished;
- (void)flashPlaybackControlsWithDuration:(double)a3;
- (void)fullscreenBehaviorManagerRequiresFullscreenPlayback:(id)a3;
- (void)learnMoreButtonTapped:(id)a3;
- (void)loadView;
- (void)pause;
- (void)playWithButtonTapped:(BOOL)a3;
- (void)playbackCoordinator:(id)a3 timeElapsed:(double)a4 duration:(double)a5;
- (void)playbackCoordinatorFinishedLoadingVideoURL:(id)a3;
- (void)playbackCoordinatorPausedPlayback:(id)a3;
- (void)playbackCoordinatorResumedPlayback:(id)a3;
- (void)playbackCoordinatorStartedPlayback:(id)a3;
- (void)playbackCoordinatorStateChanged:(id)a3;
- (void)playerViewController:(id)a3 metricsCollectionEventOccured:(int64_t)a4;
- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)playerViewControllerDidStartPictureInPicture:(id)a3;
- (void)playerViewControllerDidStopPictureInPicture:(id)a3;
- (void)playerViewControllerWillStartPictureInPicture:(id)a3;
- (void)playerViewControllerWillStopPictureInPicture:(id)a3;
- (void)refreshControlsForPlaybackCoordinator:(id)a3;
- (void)removeVideoPlayerIfNeeded;
- (void)setActivityIndicatorView:(id)a3;
- (void)setAdGradientView:(id)a3;
- (void)setAdPrivacyButton:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnablePictureInPictureBehaviors:(BOOL)a3;
- (void)setFullscreen:(BOOL)a3;
- (void)setFullscreenBehavior:(unint64_t)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPlayButtonTapped:(BOOL)a3;
- (void)setPlayerViewController:(id)a3;
- (void)setPrimaryContentCoordinator:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShowsPlaybackControls:(BOOL)a3;
- (void)setSkipButton:(id)a3;
- (void)setVideoAd:(id)a3;
- (void)setVideoBoundsObserver:(id)a3;
- (void)setVolumeObserver:(id)a3;
- (void)setupQueueIfNeeded;
- (void)startPictureInPictureIfPossible;
- (void)startPlaybackForCoordinatorIfAllowed:(id)a3;
- (void)stopPictureInPicture;
- (void)tapped;
- (void)transitionToCoordinator:(id)a3;
- (void)updateAdsButtonsVisibility;
- (void)updateSkipButtonWithThreshold:(unint64_t)a3 time:(double)a4;
- (void)updateViewConstraints;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willUnload;
@end

@implementation SVVideoPlayerViewController

- (SVVideoPlayerViewController)init
{
  v28.receiver = self;
  v28.super_class = (Class)SVVideoPlayerViewController;
  v2 = [(SVVideoPlayerViewController *)&v28 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x263EFA9C8]);
    playerViewController = v2->_playerViewController;
    v2->_playerViewController = v3;

    [(AVPlayerViewController *)v2->_playerViewController setAllowsPictureInPicturePlayback:0];
    [(AVPlayerViewController *)v2->_playerViewController setModalPresentationStyle:5];
    [(AVPlayerViewController *)v2->_playerViewController setDelegate:v2];
    [(AVPlayerViewController *)v2->_playerViewController setUpdatesNowPlayingInfoCenter:0];
    v5 = objc_alloc_init(SVAutomaticFullscreenVideoPlaybackBehaviorManager);
    fullscreenBehaviorManager = v2->_fullscreenBehaviorManager;
    v2->_fullscreenBehaviorManager = v5;

    [(SVAutomaticFullscreenVideoPlaybackBehaviorManager *)v2->_fullscreenBehaviorManager setDelegate:v2];
    objc_initWeak(&location, v2->_fullscreenBehaviorManager);
    v7 = [SVKeyValueObserver alloc];
    v8 = v2->_playerViewController;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __35__SVVideoPlayerViewController_init__block_invoke;
    v25 = &unk_264771050;
    objc_copyWeak(&v26, &location);
    uint64_t v9 = [(SVKeyValueObserver *)v7 initWithKeyPath:@"videoBounds" ofObject:v8 withOptions:1 change:&v22];
    videoBoundsObserver = v2->_videoBoundsObserver;
    v2->_videoBoundsObserver = (SVKeyValueObserver *)v9;

    v11 = objc_alloc_init(SVLearnMoreButton);
    learnMoreButton = v2->_learnMoreButton;
    v2->_learnMoreButton = v11;

    -[SVLearnMoreButton setTranslatesAutoresizingMaskIntoConstraints:](v2->_learnMoreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v22, v23, v24, v25);
    [(SVLearnMoreButton *)v2->_learnMoreButton addTarget:v2 action:sel_learnMoreButtonTapped_ forControlEvents:64];
    [(SVLearnMoreButton *)v2->_learnMoreButton setHidden:1];
    v13 = objc_alloc_init(SVVideoAdSkipButton);
    skipButton = v2->_skipButton;
    v2->_skipButton = v13;

    [(SVVideoAdSkipButton *)v2->_skipButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SVVideoAdSkipButton *)v2->_skipButton addTarget:v2 action:sel_adSkipButtonTapped_ forControlEvents:64];
    [(SVVideoAdSkipButton *)v2->_skipButton setHidden:1];
    uint64_t v15 = [objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:0];
    activityIndicatorView = v2->_activityIndicatorView;
    v2->_activityIndicatorView = (UIActivityIndicatorView *)v15;

    [(UIActivityIndicatorView *)v2->_activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v2->_activityIndicatorView setHidesWhenStopped:1];
    uint64_t v17 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v2 action:sel_tapped];
    tapGesture = v2->_tapGesture;
    v2->_tapGesture = (UIGestureRecognizer *)v17;

    [(UIGestureRecognizer *)v2->_tapGesture setDelegate:v2];
    v19 = objc_alloc_init(SVAdGradientView);
    adGradientView = v2->_adGradientView;
    v2->_adGradientView = v19;

    [(SVAdGradientView *)v2->_adGradientView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SVAdGradientView *)v2->_adGradientView setHidden:1];
    v2->_showsPlaybackControls = 1;
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__SVVideoPlayerViewController_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 objectForKey:*MEMORY[0x263F081B8]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v5 CGRectValue];
  objc_msgSend(WeakRetained, "setVideoBounds:");
}

- (void)loadView
{
  v3 = objc_alloc_init(SVTouchAbsorbingView);
  [(SVVideoPlayerViewController *)self setView:v3];
}

- (void)dealloc
{
  v3 = [(SVVideoPlayerViewController *)self coordinator];
  [v3 setHost:0];

  v4.receiver = self;
  v4.super_class = (Class)SVVideoPlayerViewController;
  [(SVVideoPlayerViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)SVVideoPlayerViewController;
  [(SVVideoPlayerViewController *)&v33 viewDidLoad];
  v3 = [(SVVideoPlayerViewController *)self playerViewController];
  [(SVVideoPlayerViewController *)self addChildViewController:v3];

  objc_super v4 = [(SVVideoPlayerViewController *)self view];
  id v5 = [(SVVideoPlayerViewController *)self playerViewController];
  v6 = [v5 view];
  [v4 addSubview:v6];

  v7 = [(SVVideoPlayerViewController *)self playerViewController];
  v8 = [v7 view];
  [v8 setHidden:1];

  uint64_t v9 = [(SVVideoPlayerViewController *)self playerViewController];
  v10 = [v9 view];
  v11 = [(SVVideoPlayerViewController *)self view];
  [v11 bounds];
  objc_msgSend(v10, "setFrame:");

  v12 = [(SVVideoPlayerViewController *)self playerViewController];
  [v12 didMoveToParentViewController:self];

  v13 = [(SVVideoPlayerViewController *)self playerViewController];
  [v13 setShowsPlaybackControls:0];

  v14 = [(SVVideoPlayerViewController *)self view];
  uint64_t v15 = [MEMORY[0x263F1C550] blackColor];
  [v14 setBackgroundColor:v15];

  v16 = [(SVVideoPlayerViewController *)self view];
  uint64_t v17 = [(SVVideoPlayerViewController *)self activityIndicatorView];
  [v16 addSubview:v17];

  v18 = [(SVVideoPlayerViewController *)self playerViewController];
  v19 = [v18 view];
  v20 = [(SVVideoPlayerViewController *)self tapGesture];
  [v19 addGestureRecognizer:v20];

  v21 = [(SVVideoPlayerViewController *)self playerViewController];
  uint64_t v22 = [v21 customControlsView];
  uint64_t v23 = [(SVVideoPlayerViewController *)self learnMoreButton];
  [v22 addSubview:v23];

  v24 = [(SVVideoPlayerViewController *)self playerViewController];
  v25 = [v24 customControlsView];
  id v26 = [(SVVideoPlayerViewController *)self skipButton];
  [v25 addSubview:v26];

  v27 = [(SVVideoPlayerViewController *)self playerViewController];
  objc_super v28 = [v27 contentOverlayView];
  v29 = [(SVVideoPlayerViewController *)self adGradientView];
  [v28 addSubview:v29];

  v30 = [(SVVideoPlayerViewController *)self playerViewController];
  v31 = [v30 customControlsView];
  [v31 setAccessibilityElementsHidden:0];

  v32 = [(SVVideoPlayerViewController *)self view];
  [v32 setNeedsUpdateConstraints];
}

- (void)viewDidLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SVVideoPlayerViewController;
  [(SVVideoPlayerViewController *)&v18 viewDidLayoutSubviews];
  v3 = [(SVVideoPlayerViewController *)self playerViewController];
  objc_super v4 = [v3 view];
  id v5 = [v4 superview];
  v6 = [(SVVideoPlayerViewController *)self view];

  if (v5 == v6)
  {
    v7 = [(SVVideoPlayerViewController *)self view];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [(SVVideoPlayerViewController *)self playerViewController];
    uint64_t v17 = [v16 view];
    objc_msgSend(v17, "setFrame:", v9, v11, v13, v15);
  }
}

- (void)updateViewConstraints
{
  v3 = [(SVVideoPlayerViewController *)self playerViewController];
  objc_super v4 = [v3 customControlsView];
  id v5 = [v4 animatedUnobscuredCenterAreaLayoutGuide];

  v6 = [(SVVideoPlayerViewController *)self playerViewController];
  v7 = [v6 customControlsView];
  double v8 = [v7 transportControlsAreaLayoutGuide];

  double v9 = [(SVVideoPlayerViewController *)self adPrivacyButton];

  if (v9)
  {
    double v10 = [(SVVideoPlayerViewController *)self adPrivacyButton];
    double v11 = [v10 leadingAnchor];
    double v12 = [v8 leadingAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    double v14 = [(SVVideoPlayerViewController *)self adPrivacyButton];
    double v15 = [v14 bottomAnchor];
    v16 = [v5 bottomAnchor];
    uint64_t v17 = [v15 constraintEqualToAnchor:v16 constant:-2.0];
    [v17 setActive:1];

    objc_super v18 = [(SVVideoPlayerViewController *)self learnMoreButton];
    v19 = [v18 leadingAnchor];
    v20 = [(SVVideoPlayerViewController *)self adPrivacyButton];
    v21 = [v20 trailingAnchor];
    uint64_t v22 = [v19 constraintEqualToAnchor:v21 constant:3.0];
    [v22 setActive:1];

    uint64_t v23 = [(SVVideoPlayerViewController *)self learnMoreButton];
    v24 = [v23 bottomAnchor];
    v25 = [v5 bottomAnchor];
    id v26 = [v24 constraintEqualToAnchor:v25 constant:-4.0];
    [v26 setActive:1];
  }
  v27 = [(SVVideoPlayerViewController *)self skipButton];
  objc_super v28 = [v27 trailingAnchor];
  v29 = [v8 trailingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [(SVVideoPlayerViewController *)self skipButton];
  v32 = [v31 bottomAnchor];
  objc_super v33 = [v5 bottomAnchor];
  v34 = [v32 constraintEqualToAnchor:v33 constant:-4.0];
  [v34 setActive:1];

  v35 = [(SVVideoPlayerViewController *)self activityIndicatorView];
  v36 = [v35 centerXAnchor];
  v37 = [(SVVideoPlayerViewController *)self view];
  v38 = [v37 centerXAnchor];
  v39 = [v36 constraintEqualToAnchor:v38];
  [v39 setActive:1];

  v40 = [(SVVideoPlayerViewController *)self activityIndicatorView];
  v41 = [v40 centerYAnchor];
  v42 = [(SVVideoPlayerViewController *)self view];
  v43 = [v42 centerYAnchor];
  v44 = [v41 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  v45 = [(SVVideoPlayerViewController *)self adGradientView];
  v46 = [v45 leadingAnchor];
  v47 = [(SVVideoPlayerViewController *)self playerViewController];
  v48 = [v47 contentOverlayView];
  v49 = [v48 leadingAnchor];
  v50 = [v46 constraintEqualToAnchor:v49];
  [v50 setActive:1];

  v51 = [(SVVideoPlayerViewController *)self adGradientView];
  v52 = [v51 trailingAnchor];
  v53 = [(SVVideoPlayerViewController *)self playerViewController];
  v54 = [v53 contentOverlayView];
  v55 = [v54 trailingAnchor];
  v56 = [v52 constraintEqualToAnchor:v55];
  [v56 setActive:1];

  v57 = [(SVVideoPlayerViewController *)self adGradientView];
  v58 = [v57 topAnchor];
  v59 = [(SVVideoPlayerViewController *)self playerViewController];
  v60 = [v59 contentOverlayView];
  v61 = [v60 topAnchor];
  v62 = [v58 constraintEqualToAnchor:v61];
  [v62 setActive:1];

  v63 = [(SVVideoPlayerViewController *)self adGradientView];
  v64 = [v63 bottomAnchor];
  v65 = [(SVVideoPlayerViewController *)self playerViewController];
  v66 = [v65 contentOverlayView];
  v67 = [v66 bottomAnchor];
  v68 = [v64 constraintEqualToAnchor:v67];
  [v68 setActive:1];

  v69.receiver = self;
  v69.super_class = (Class)SVVideoPlayerViewController;
  [(SVVideoPlayerViewController *)&v69 updateViewConstraints];
}

- (void)playWithButtonTapped:(BOOL)a3
{
  BOOL v3 = a3;
  [(SVVideoPlayerViewController *)self setupQueueIfNeeded];
  [(SVVideoPlayerViewController *)self setPlayButtonTapped:v3];
  id v5 = [(SVVideoPlayerViewController *)self coordinator];

  if (v5)
  {
    id v6 = [(SVVideoPlayerViewController *)self coordinator];
    [(SVVideoPlayerViewController *)self startPlaybackForCoordinatorIfAllowed:v6];
  }
  else
  {
    [(SVVideoPlayerViewController *)self advance];
  }
}

- (void)pause
{
  BOOL v3 = [(SVVideoPlayerViewController *)self coordinator];
  objc_super v4 = [(SVVideoPlayerViewController *)self playerViewController];
  [v3 setHost:v4];

  id v5 = [(SVVideoPlayerViewController *)self coordinator];
  [v5 pause];
}

- (void)enterFullscreenWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (![(SVVideoPlayerViewController *)self isFullscreen])
  {
    id v5 = [(SVVideoPlayerViewController *)self view];
    [v5 layoutIfNeeded];

    objc_initWeak(&location, self);
    id v6 = [(SVVideoPlayerViewController *)self playerViewController];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __66__SVVideoPlayerViewController_enterFullscreenWithCompletionBlock___block_invoke;
    v7[3] = &unk_264771348;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [v6 enterFullScreenAnimated:1 completionHandler:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __66__SVVideoPlayerViewController_enterFullscreenWithCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setFullscreen:1];

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
    UIAccessibilityPostNotification(v4, 0);
  }
}

- (void)exitFullscreenWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if ([(SVVideoPlayerViewController *)self isFullscreen])
  {
    id v5 = [(SVVideoPlayerViewController *)self view];
    [v5 layoutIfNeeded];

    objc_initWeak(&location, self);
    id v6 = [(SVVideoPlayerViewController *)self playerViewController];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__SVVideoPlayerViewController_exitFullscreenWithCompletionBlock___block_invoke;
    v7[3] = &unk_264771348;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    [v6 exitFullScreenAnimated:1 completionHandler:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __65__SVVideoPlayerViewController_exitFullscreenWithCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setFullscreen:0];

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
    UIAccessibilityPostNotification(v4, 0);
  }
}

- (void)startPictureInPictureIfPossible
{
  id v7 = [(SVVideoPlayerViewController *)self playerViewController];
  if ([v7 isPictureInPictureActive])
  {
LABEL_2:

    return;
  }
  BOOL v3 = [(SVVideoPlayerViewController *)self isPlaying];

  if (!v3 || [(SVVideoPlayerViewController *)self isFullscreen]) {
    return;
  }
  if ([MEMORY[0x263EFA9B8] isPictureInPictureSupported])
  {
    UIAccessibilityNotifications v4 = [(SVVideoPlayerViewController *)self playerViewController];
    if ([v4 allowsPictureInPicturePlayback]
      && [(SVVideoPlayerViewController *)self enablePictureInPictureBehaviors]
      && [(SVVideoPlayerViewController *)self mode] != 1)
    {
      id v5 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v6 = [v5 userInterfaceIdiom];

      if (v6 != 5)
      {
        id v7 = [(SVVideoPlayerViewController *)self playerViewController];
        [v7 startPictureInPicture];
        goto LABEL_2;
      }
    }
    else
    {
    }
  }

  [(SVVideoPlayerViewController *)self pause];
}

- (void)stopPictureInPicture
{
  id v2 = [(SVVideoPlayerViewController *)self playerViewController];
  [v2 stopPictureInPicture];
}

- (BOOL)isPlaying
{
  id v2 = [(SVVideoPlayerViewController *)self coordinator];
  BOOL v3 = [v2 state] == 3;

  return v3;
}

- (BOOL)isLoading
{
  id v2 = [(SVVideoPlayerViewController *)self coordinator];
  BOOL v3 = [v2 state] == 1;

  return v3;
}

- (BOOL)isPictureInPictureActive
{
  id v2 = [(SVVideoPlayerViewController *)self playerViewController];
  char v3 = [v2 isPictureInPictureActive];

  return v3;
}

- (void)addDebuggerAction:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  UIAccessibilityNotifications v4 = (objc_class *)MEMORY[0x263EFA990];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithTitle:@"Debugger" type:0];
  id v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"ant.circle"];
  [v6 setImage:v7];

  [v6 setAction:v5];
  v9[0] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [(AVPlayerViewController *)self->_playerViewController setCustomControlItems:v8];
}

- (void)embedVideoPlayerIfNeeded
{
  char v3 = [(SVVideoPlayerViewController *)self playerViewController];
  UIAccessibilityNotifications v4 = [v3 parentViewController];

  if (v4 != self)
  {
    id v5 = [(SVVideoPlayerViewController *)self playerViewController];
    [(SVVideoPlayerViewController *)self addChildViewController:v5];

    uint64_t v6 = [(SVVideoPlayerViewController *)self view];
    id v7 = [(SVVideoPlayerViewController *)self playerViewController];
    id v8 = [v7 view];
    [v6 addSubview:v8];

    id v9 = [(SVVideoPlayerViewController *)self playerViewController];
    double v10 = [v9 view];
    double v11 = [(SVVideoPlayerViewController *)self view];
    [v11 bounds];
    objc_msgSend(v10, "setFrame:");

    double v12 = [(SVVideoPlayerViewController *)self playerViewController];
    [v12 didMoveToParentViewController:self];

    id v13 = [(SVVideoPlayerViewController *)self view];
    [v13 layoutIfNeeded];
  }
}

- (void)removeVideoPlayerIfNeeded
{
  char v3 = [(SVVideoPlayerViewController *)self playerViewController];
  UIAccessibilityNotifications v4 = [v3 parentViewController];

  if (v4)
  {
    id v5 = [(SVVideoPlayerViewController *)self playerViewController];
    [v5 willMoveToParentViewController:0];

    uint64_t v6 = [(SVVideoPlayerViewController *)self playerViewController];
    id v7 = [v6 view];
    [v7 removeFromSuperview];

    id v8 = [(SVVideoPlayerViewController *)self playerViewController];
    [v8 removeFromParentViewController];
  }
}

- (void)willUnload
{
  id v2 = [(SVVideoPlayerViewController *)self videoAd];
  [v2 willUnload];
}

- (BOOL)isFullscreenInProgress
{
  char v3 = [(SVVideoPlayerViewController *)self presentedViewController];

  if (!v3) {
    return 0;
  }
  UIAccessibilityNotifications v4 = [(SVVideoPlayerViewController *)self presentedViewController];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);

  LOBYTE(v4) = [v6 isEqualToString:@"AVFullScreenViewController"];
  return (char)v4;
}

- (void)flashPlaybackControlsWithDuration:(double)a3
{
}

- (void)fullscreenBehaviorManagerRequiresFullscreenPlayback:(id)a3
{
  if (![(SVVideoPlayerViewController *)self isFullscreen]
    && [(SVVideoPlayerViewController *)self isPlaying])
  {
    [(SVVideoPlayerViewController *)self enterFullscreenWithCompletionBlock:0];
  }
}

- (void)setFullscreenBehavior:(unint64_t)a3
{
  if (self->_fullscreenBehavior != a3)
  {
    self->_fullscreenBehavior = a3;
    id v4 = [(SVVideoPlayerViewController *)self fullscreenBehaviorManager];
    [v4 setBehavior:a3];
  }
}

- (BOOL)playerViewController:(id)a3 shouldExitFullScreenWithReason:(int64_t)a4
{
  id v5 = [(SVVideoPlayerViewController *)self fullscreenBehaviorManager];
  int v6 = [v5 fullscreenPlaybackRequiredForCurrentConditions];

  if (v6) {
    [(SVVideoPlayerViewController *)self pause];
  }
  return 1;
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __122__SVVideoPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke;
  v7[3] = &unk_264771370;
  BOOL v8 = a4;
  void v7[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __122__SVVideoPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2;
  v5[3] = &unk_264771398;
  v5[4] = self;
  BOOL v6 = a4;
  [a5 addCoordinatedAnimations:v7 completion:v5];
}

void __122__SVVideoPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) adGradientView];
  [v2 setAlpha:v1];
}

uint64_t __122__SVVideoPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setShowsPlaybackControls:*(unsigned __int8 *)(result + 40)];
  }
  return result;
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(SVVideoPlayerViewController *)self playerViewController];
  [v6 resignFirstResponder];

  id v7 = [(SVVideoPlayerViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SVVideoPlayerViewController *)self delegate];
    [v9 videoPlayerViewControllerWillExitFullscreen:self];
  }
  double v10 = [(SVVideoPlayerViewController *)self adPrivacyButton];
  [v10 setHidden:1];

  double v11 = [(SVVideoPlayerViewController *)self learnMoreButton];
  [v11 setHidden:1];

  double v12 = [(SVVideoPlayerViewController *)self skipButton];
  [v12 setHidden:1];

  id v13 = [(SVVideoPlayerViewController *)self adGradientView];
  [v13 setHidden:1];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __106__SVVideoPlayerViewController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v14[3] = &unk_2647713C0;
  v14[4] = self;
  [v5 animateAlongsideTransition:0 completion:v14];
}

uint64_t __106__SVVideoPlayerViewController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  [*(id *)(a1 + 32) updateAdsButtonsVisibility];
  if (([v10 isCancelled] & 1) == 0)
  {
    char v3 = [v10 viewForKey:*MEMORY[0x263F1D7A8]];
    id v4 = [*(id *)(a1 + 32) tapGesture];
    [v3 removeGestureRecognizer:v4];

    id v5 = [*(id *)(a1 + 32) view];
    uint64_t v6 = [*(id *)(a1 + 32) tapGesture];
    [v5 addGestureRecognizer:v6];

    id v7 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v6) = objc_opt_respondsToSelector();

    if (v6)
    {
      char v8 = [*(id *)(a1 + 32) delegate];
      [v8 videoPlayerViewControllerDidExitFullscreen:*(void *)(a1 + 32)];
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SVVideoPlayerViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(SVVideoPlayerViewController *)self delegate];
    [v8 videoPlayerViewControllerWillEnterFullscreen:self];
  }
  id v9 = [(SVVideoPlayerViewController *)self adPrivacyButton];
  [v9 setHidden:1];

  id v10 = [(SVVideoPlayerViewController *)self learnMoreButton];
  [v10 setHidden:1];

  double v11 = [(SVVideoPlayerViewController *)self skipButton];
  [v11 setHidden:1];

  double v12 = [(SVVideoPlayerViewController *)self adGradientView];
  [v12 setHidden:1];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __108__SVVideoPlayerViewController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v13[3] = &unk_2647713C0;
  v13[4] = self;
  [v5 animateAlongsideTransition:0 completion:v13];
}

void __108__SVVideoPlayerViewController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [*(id *)(a1 + 32) updateAdsButtonsVisibility];
  if (([v7 isCancelled] & 1) == 0)
  {
    char v3 = [*(id *)(a1 + 32) view];
    id v4 = [*(id *)(a1 + 32) tapGesture];
    [v3 removeGestureRecognizer:v4];

    id v5 = [v7 viewForKey:*MEMORY[0x263F1D7B8]];
    uint64_t v6 = [*(id *)(a1 + 32) tapGesture];
    [v5 addGestureRecognizer:v6];
  }
}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
  id v4 = [(SVVideoPlayerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SVVideoPlayerViewController *)self delegate];
    [v6 videoPlayerViewControllerWillStartPictureInPicture:self];
  }
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  id v4 = [(SVVideoPlayerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SVVideoPlayerViewController *)self delegate];
    [v6 videoPlayerViewControllerDidStartPictureInPicture:self];
  }
  id v7 = [(SVVideoPlayerViewController *)self coordinator];
  id v10 = [v7 video];

  if (objc_opt_respondsToSelector())
  {
    char v8 = [(SVVideoPlayerViewController *)self coordinator];
    id v9 = [v8 video];
    [v9 startedPictureInPicture];
  }
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  id v4 = [(SVVideoPlayerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SVVideoPlayerViewController *)self delegate];
    [v6 videoPlayerViewControllerWillStopPictureInPicture:self];
  }
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  id v4 = [(SVVideoPlayerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SVVideoPlayerViewController *)self delegate];
    [v6 videoPlayerViewControllerDidStopPictureInPicture:self];
  }
  id v7 = [(SVVideoPlayerViewController *)self coordinator];
  id v10 = [v7 video];

  if (objc_opt_respondsToSelector())
  {
    char v8 = [(SVVideoPlayerViewController *)self coordinator];
    id v9 = [v8 video];
    [v9 stoppedPictureInPicture];
  }
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  char v8 = (void (**)(id, uint64_t))a4;
  char v5 = [(SVVideoPlayerViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SVVideoPlayerViewController *)self delegate];
    [v7 videoPlayerViewController:self restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:v8];
  }
  else
  {
    v8[2](v8, 1);
  }
}

- (void)playerViewController:(id)a3 metricsCollectionEventOccured:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 5)
  {
    id v12 = v6;
    [(SVVideoPlayerViewController *)self setFullscreen:0];
    double v11 = [(SVVideoPlayerViewController *)self coordinator];
    char v8 = [v11 video];

    if (objc_opt_respondsToSelector())
    {
      id v9 = [(SVVideoPlayerViewController *)self coordinator];
      id v10 = [v9 video];
      [v10 exitedFullscreen];
      goto LABEL_7;
    }
  }
  else
  {
    if (a4 != 4) {
      goto LABEL_9;
    }
    id v12 = v6;
    [(SVVideoPlayerViewController *)self setFullscreen:1];
    id v7 = [(SVVideoPlayerViewController *)self coordinator];
    char v8 = [v7 video];

    if (objc_opt_respondsToSelector())
    {
      id v9 = [(SVVideoPlayerViewController *)self coordinator];
      id v10 = [v9 video];
      [v10 enteredFullscreen];
LABEL_7:
    }
  }

  id v6 = v12;
LABEL_9:
}

- (void)playbackCoordinatorStartedPlayback:(id)a3
{
  id v13 = a3;
  id v4 = [v13 video];
  char v5 = [(SVVideoPlayerViewController *)self videoAd];

  if (v4 != v5)
  {
    id v6 = [(SVVideoPlayerViewController *)self videoAd];
    [v6 nextVideoStartedPlaying];

    id v7 = [(SVVideoPlayerViewController *)self videoAd];
    char v8 = [v7 metricsView];
    [v8 removeFromSuperview];

    [(SVVideoPlayerViewController *)self setVideoAd:0];
  }
  [(SVVideoPlayerViewController *)self refreshControlsForPlaybackCoordinator:v13];
  id v9 = [(SVVideoPlayerViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(SVVideoPlayerViewController *)self delegate];
    id v12 = [v13 video];
    [v11 videoPlayerViewController:self startedPlaybackOfVideo:v12];
  }
}

- (void)playbackCoordinatorPausedPlayback:(id)a3
{
  id v8 = a3;
  -[SVVideoPlayerViewController refreshControlsForPlaybackCoordinator:](self, "refreshControlsForPlaybackCoordinator:");
  id v4 = [(SVVideoPlayerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SVVideoPlayerViewController *)self delegate];
    id v7 = [v8 video];
    [v6 videoPlayerViewController:self pausedPlaybackOfVideo:v7];
  }
}

- (void)playbackCoordinatorResumedPlayback:(id)a3
{
  id v8 = a3;
  id v4 = [(SVVideoPlayerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SVVideoPlayerViewController *)self delegate];
    id v7 = [v8 video];
    [v6 videoPlayerViewController:self resumedPlaybackOfVideo:v7];
  }
}

- (void)playbackCoordinator:(id)a3 timeElapsed:(double)a4 duration:(double)a5
{
  id v10 = a3;
  id v7 = [v10 video];
  int v8 = [v7 conformsToProtocol:&unk_26D988128];

  if (v8)
  {
    id v9 = [v10 video];
    -[SVVideoPlayerViewController updateSkipButtonWithThreshold:time:](self, "updateSkipButtonWithThreshold:time:", [v9 skipThreshold], a4);
  }
}

- (void)playbackCoordinatorStateChanged:(id)a3
{
  id v7 = a3;
  if ([v7 state] == 2)
  {
    [(SVVideoPlayerViewController *)self refreshControlsForPlaybackCoordinator:v7];
    id v4 = [v7 video];
    int v5 = [v4 conformsToProtocol:&unk_26D988128];

    if (v5)
    {
      id v6 = [v7 video];
      -[SVVideoPlayerViewController updateSkipButtonWithThreshold:time:](self, "updateSkipButtonWithThreshold:time:", [v6 skipThreshold], 0.0);
    }
    if ([(SVVideoPlayerViewController *)self playbackAllowedForPlaybackCoordinator:v7])
    {
      objc_msgSend(v7, "playWithButtonTapped:", -[SVVideoPlayerViewController playButtonTapped](self, "playButtonTapped"));
    }
    else
    {
      [v7 pause];
    }
  }
}

- (void)playbackCoordinatorFinishedLoadingVideoURL:(id)a3
{
  id v8 = a3;
  id v4 = [(SVVideoPlayerViewController *)self coordinator];

  if (v4 == v8)
  {
    int v5 = [(SVVideoPlayerViewController *)self playerViewController];
    [v8 setHost:v5];

    id v6 = [(SVVideoPlayerViewController *)self playerViewController];
    id v7 = [v6 view];
    [v7 setHidden:0];
  }
}

- (void)learnMoreButtonTapped:(id)a3
{
  id v4 = [(SVVideoPlayerViewController *)self coordinator];
  id v5 = [v4 video];

  [v5 presentAction];
  [(SVVideoPlayerViewController *)self pause];
}

- (void)adSkipButtonTapped:(id)a3
{
  id v4 = [(SVVideoPlayerViewController *)self coordinator];
  id v7 = [v4 video];

  if ([v7 conformsToProtocol:&unk_26D988128])
  {
    id v5 = [(SVVideoPlayerViewController *)self coordinator];
    id v6 = [v5 video];

    [v6 skipped];
    [(SVVideoPlayerViewController *)self advance];
  }
}

- (void)refreshControlsForPlaybackCoordinator:(id)a3
{
  id v24 = a3;
  BOOL v4 = [v24 state] == 1 || !objc_msgSend(v24, "state") || objc_msgSend(v24, "state") == 2;
  BOOL v5 = [v24 state] == 3 || objc_msgSend(v24, "state") == 4 || objc_msgSend(v24, "state") == 5;
  id v6 = [v24 video];
  uint64_t v7 = [v6 conformsToProtocol:&unk_26D988128];

  if (v7)
  {
    id v8 = [v24 video];
    BOOL v9 = [v24 state] != 3 && objc_msgSend(v24, "state") != 4;
    uint64_t v10 = [v8 hasAction] ^ 1 | v9;
  }
  else
  {
    uint64_t v10 = 1;
    BOOL v9 = 1;
  }
  double v11 = [(SVVideoPlayerViewController *)self adPrivacyButton];
  [v11 setHidden:v9 withShowDelay:0.1];

  id v12 = [(SVVideoPlayerViewController *)self learnMoreButton];
  [v12 setHidden:v10 withShowDelay:0.1];

  id v13 = [(SVVideoPlayerViewController *)self skipButton];
  [v13 setHidden:v9 withShowDelay:0.1];

  double v14 = [(SVVideoPlayerViewController *)self adGradientView];
  [v14 setHidden:v9 withShowDelay:0.1];

  double v15 = [(SVVideoPlayerViewController *)self activityIndicatorView];
  v16 = v15;
  if (v4) {
    [v15 startAnimating];
  }
  else {
    [v15 stopAnimating];
  }

  uint64_t v17 = [(SVVideoPlayerViewController *)self playerViewController];
  [v17 setShowsPlaybackControls:v5];

  objc_super v18 = [(SVVideoPlayerViewController *)self playerViewController];
  [v18 setRequiresLinearPlayback:v7];

  if ((v7 & 1) != 0 || !self->_enablePictureInPictureBehaviors)
  {
    uint64_t v23 = [(SVVideoPlayerViewController *)self playerViewController];
    [v23 setAllowsPictureInPicturePlayback:0];

    v20 = [(SVVideoPlayerViewController *)self playerViewController];
    v21 = v20;
    uint64_t v22 = 0;
  }
  else
  {
    v19 = [(SVVideoPlayerViewController *)self playerViewController];
    [v19 setAllowsPictureInPicturePlayback:1];

    v20 = [(SVVideoPlayerViewController *)self playerViewController];
    v21 = v20;
    uint64_t v22 = 1;
  }
  [v20 setCanStartPictureInPictureAutomaticallyFromInline:v22];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)setupQueueIfNeeded
{
  v46[2] = *MEMORY[0x263EF8340];
  char v3 = [(SVVideoPlayerViewController *)self queue];

  if (!v3)
  {
    BOOL v4 = objc_alloc_init(SVVideoPlaybackQueue);
    BOOL v5 = [(SVVideoPlayerViewController *)self dataSource];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [(SVVideoPlayerViewController *)self dataSource];
      id v8 = [v7 videoAdForVideoPlayerViewController:self];

      if (v8)
      {
        BOOL v9 = [v8 metricsView];

        if (v9)
        {
          uint64_t v10 = [v8 metricsView];
          double v11 = [(SVVideoPlayerViewController *)self playerViewController];
          id v12 = [v11 contentOverlayView];
          [v12 bounds];
          objc_msgSend(v10, "setFrame:");

          id v13 = [v8 metricsView];
          [v13 setAutoresizingMask:18];

          double v14 = [v8 metricsView];
          [v14 setUserInteractionEnabled:0];

          double v15 = [(SVVideoPlayerViewController *)self playerViewController];
          v16 = [v15 contentOverlayView];
          uint64_t v17 = [v8 metricsView];
          [v16 addSubview:v17];
        }
        objc_super v18 = [v8 privacyMarker];
        [(SVVideoPlayerViewController *)self setAdPrivacyButton:v18];

        v19 = [(SVVideoPlayerViewController *)self adPrivacyButton];
        [v19 setHidden:1];

        v20 = [(SVVideoPlayerViewController *)self adPrivacyButton];
        [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

        v21 = [(SVVideoPlayerViewController *)self adPrivacyButton];
        [v21 addTarget:self action:sel_pause forControlEvents:64];

        uint64_t v22 = [(SVVideoPlayerViewController *)self playerViewController];
        uint64_t v23 = [v22 customControlsView];
        id v24 = [(SVVideoPlayerViewController *)self adPrivacyButton];
        [v23 addSubview:v24];

        [(SVVideoPlayerViewController *)self updateViewConstraints];
        v25 = [SVAVURLAssetFactory alloc];
        uint64_t v26 = *MEMORY[0x263EFA2B8];
        v45[0] = *MEMORY[0x263EFA2A8];
        v45[1] = v26;
        v46[0] = &unk_26D96E730;
        v46[1] = &unk_26D96E748;
        v27 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
        objc_super v28 = [(SVAVURLAssetFactory *)v25 initWithOptions:v27];

        v29 = [[SVAVPlayerItemFactory alloc] initWithAutomaticallyLoadedAssetKeys:&unk_26D96E7A8 assetFactory:v28 preferredForwardBufferDuration:0.0];
        v30 = [[SVAVPlayerFactory alloc] initWithAudioMode:1 playerItemFactory:v29];
        v31 = [[SVPlaybackCoordinator alloc] initWithVideo:v8 playerFactory:v30];
        [(SVVideoPlaybackQueue *)v4 appendItem:v31];
        [(SVVideoPlayerViewController *)self setVideoAd:v8];
      }
    }
    v32 = [(SVVideoPlayerViewController *)self dataSource];
    char v33 = objc_opt_respondsToSelector();

    if (v33)
    {
      v34 = [(SVVideoPlayerViewController *)self dataSource];
      v35 = [v34 videoForVideoPlayerViewController:self];

      v36 = [SVAVURLAssetFactory alloc];
      uint64_t v43 = *MEMORY[0x263EFA2B8];
      v44 = &unk_26D96E748;
      v37 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      v38 = [(SVAVURLAssetFactory *)v36 initWithOptions:v37];

      v39 = [[SVAVPlayerItemFactory alloc] initWithAutomaticallyLoadedAssetKeys:&unk_26D96E7C0 assetFactory:v38 preferredForwardBufferDuration:10.0];
      v40 = [[SVAVPlayerFactory alloc] initWithAudioMode:1 playerItemFactory:v39];
      v41 = [[SVPlaybackCoordinator alloc] initWithVideo:v35 playerFactory:v40];
      [(SVVideoPlaybackQueue *)v4 appendItem:v41];
      v42 = [(SVVideoPlayerViewController *)self playerViewController];
      [(SVPlaybackCoordinator *)v41 setHost:v42];

      [(SVVideoPlayerViewController *)self setPrimaryContentCoordinator:v41];
    }
    [(SVVideoPlayerViewController *)self setQueue:v4];
  }
}

- (void)advance
{
  char v3 = [(SVVideoPlayerViewController *)self queue];
  id v15 = [v3 advance];

  if (v15)
  {
    BOOL v4 = [(SVVideoPlayerViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      char v6 = [(SVVideoPlayerViewController *)self delegate];
      uint64_t v7 = [v15 video];
      [v6 videoPlayerViewController:self initiatedPlaybackOfVideo:v7];
    }
    [(SVVideoPlayerViewController *)self transitionToCoordinator:v15];
    [(SVVideoPlayerViewController *)self startPlaybackForCoordinatorIfAllowed:v15];
  }
  else
  {
    id v8 = [(SVVideoPlayerViewController *)self coordinator];
    uint64_t v9 = [v8 state];

    if (v9 == 5)
    {
      uint64_t v10 = [(SVVideoPlayerViewController *)self coordinator];
      [v10 pause];

      double v11 = [(SVVideoPlayerViewController *)self coordinator];
      id v12 = [(SVVideoPlayerViewController *)self playerViewController];
      [v11 setHost:v12];

      id v13 = [(SVVideoPlayerViewController *)self coordinator];
      [(SVVideoPlayerViewController *)self refreshControlsForPlaybackCoordinator:v13];
    }
    else
    {
      [(SVVideoPlayerViewController *)self finished];
    }
  }
  if ([(SVVideoPlayerViewController *)self mode] != 1)
  {
    double v14 = [(SVVideoPlayerViewController *)self adPrivacyButton];
    [v14 removeFromSuperview];

    [(SVVideoPlayerViewController *)self setAdPrivacyButton:0];
  }
}

- (void)transitionToCoordinator:(id)a3
{
  id v4 = a3;
  [(SVVideoPlayerViewController *)self refreshControlsForPlaybackCoordinator:v4];
  char v5 = [(SVVideoPlayerViewController *)self coordinator];
  [v5 setHost:0];

  char v6 = [(SVVideoPlayerViewController *)self coordinator];
  [v6 removePlaybackObserver:self];

  uint64_t v7 = [(SVVideoPlayerViewController *)self coordinator];
  uint64_t v8 = [(SVVideoPlayerViewController *)self fullscreenBehaviorManager];
  [v7 removePlaybackObserver:v8];

  [v4 addPlaybackObserver:self];
  uint64_t v9 = [(SVVideoPlayerViewController *)self fullscreenBehaviorManager];
  [v4 addPlaybackObserver:v9];

  [(SVVideoPlayerViewController *)self setCoordinator:v4];
  uint64_t v10 = [v4 video];
  unsigned int v11 = [v10 conformsToProtocol:&unk_26D988128];
  LOBYTE(v8) = v11;
  uint64_t v12 = v11;

  [(SVVideoPlayerViewController *)self setMode:v12];
  if ((v8 & 1) == 0)
  {
    id v13 = [(SVVideoPlayerViewController *)self coordinator];
    double v14 = [(SVVideoPlayerViewController *)self playerViewController];
    [v13 setHost:v14];

    id v15 = [(SVVideoPlayerViewController *)self playerViewController];
    v16 = [v15 view];
    [v16 setHidden:0];
  }
  uint64_t v17 = [SVVideoVolumeObserver alloc];
  objc_super v18 = [MEMORY[0x263EF93E0] sharedInstance];
  v19 = [(SVVideoVolumeObserver *)v17 initWithPlaybackCoordinator:v4 audioSession:v18];
  [(SVVideoPlayerViewController *)self setVolumeObserver:v19];

  v20 = [(SVVideoPlayerViewController *)self volumeObserver];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __55__SVVideoPlayerViewController_transitionToCoordinator___block_invoke;
  v22[3] = &unk_2647713E8;
  id v23 = v4;
  id v21 = v4;
  [v20 onMuteStateChange:v22];
}

void __55__SVVideoPlayerViewController_transitionToCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setMuted:", objc_msgSend(v6, "muted"));
  char v3 = [*(id *)(a1 + 32) video];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [*(id *)(a1 + 32) video];
    objc_msgSend(v5, "muteStateChanged:", objc_msgSend(v6, "muted"));
  }
}

- (void)finished
{
  char v3 = [(SVVideoPlayerViewController *)self coordinator];
  [v3 seekToTime:0 withCompletionBlock:0.0];

  char v4 = [(SVVideoPlayerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SVVideoPlayerViewController *)self delegate];
    [v6 videoPlayerViewControllerFinishedVideoPlayback:self];
  }
}

- (void)startPlaybackForCoordinatorIfAllowed:(id)a3
{
  id v4 = a3;
  if (-[SVVideoPlayerViewController playbackAllowedForPlaybackCoordinator:](self, "playbackAllowedForPlaybackCoordinator:"))
  {
    objc_msgSend(v4, "playWithButtonTapped:", -[SVVideoPlayerViewController playButtonTapped](self, "playButtonTapped"));
  }
}

- (BOOL)playbackAllowedForPlaybackCoordinator:(id)a3
{
  id v4 = [(SVVideoPlayerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 1;
  }
  id v6 = [(SVVideoPlayerViewController *)self delegate];
  char v7 = [v6 videoPlayerViewControllerShouldStartPlayback:self];

  return v7;
}

- (void)updateSkipButtonWithThreshold:(unint64_t)a3 time:(double)a4
{
  unint64_t v4 = vcvtad_u64_f64(a4);
  BOOL v5 = a3 >= v4;
  unint64_t v6 = a3 - v4;
  if (!v5) {
    unint64_t v6 = 0;
  }
  if (a3 - 1 >= 0xFFFFFFFFFFFFFFFELL) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6;
  }
  id v8 = [(SVVideoPlayerViewController *)self skipButton];
  [v8 setSkipDuration:v7];
}

- (void)updateAdsButtonsVisibility
{
  char v3 = [(SVVideoPlayerViewController *)self coordinator];
  unint64_t v4 = [v3 video];
  int v5 = [v4 conformsToProtocol:&unk_26D988128];

  if (v5)
  {
    unint64_t v6 = [(SVVideoPlayerViewController *)self coordinator];
    unint64_t v7 = [v6 video];

    id v8 = [(SVVideoPlayerViewController *)self coordinator];
    if ([v8 state] == 3)
    {
      BOOL v9 = 0;
    }
    else
    {
      unsigned int v11 = [(SVVideoPlayerViewController *)self coordinator];
      BOOL v9 = [v11 state] != 4;
    }
    uint64_t v10 = [v7 hasAction] ^ 1 | v9;
  }
  else
  {
    uint64_t v10 = 1;
    BOOL v9 = 1;
  }
  uint64_t v12 = [(SVVideoPlayerViewController *)self adPrivacyButton];
  [v12 setHidden:v9 withShowDelay:0.1];

  id v13 = [(SVVideoPlayerViewController *)self learnMoreButton];
  [v13 setHidden:v10 withShowDelay:0.1];

  double v14 = [(SVVideoPlayerViewController *)self skipButton];
  [v14 setHidden:v9 withShowDelay:0.1];

  id v15 = [(SVVideoPlayerViewController *)self adGradientView];
  [v15 setHidden:v9 withShowDelay:0.1];
}

- (UIViewController)viewControllerForModalPresentation
{
  id v2 = [(SVVideoPlayerViewController *)self playerViewController];
  char v3 = [v2 viewControllerForFullScreenPresentation];

  return (UIViewController *)v3;
}

- (void)tapped
{
  char v3 = [(SVVideoPlayerViewController *)self coordinator];
  id v4 = [v3 video];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "tappedToToggleControlVisibility:", -[SVVideoPlayerViewController showsPlaybackControls](self, "showsPlaybackControls"));
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (SVVideoPlayerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SVVideoPlayerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SVVideoPlayerViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SVVideoPlayerViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)enablePictureInPictureBehaviors
{
  return self->_enablePictureInPictureBehaviors;
}

- (void)setEnablePictureInPictureBehaviors:(BOOL)a3
{
  self->_enablePictureInPictureBehaviors = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)isFullscreen
{
  return self->_fullscreen;
}

- (void)setFullscreen:(BOOL)a3
{
  self->_fullscreen = a3;
}

- (unint64_t)fullscreenBehavior
{
  return self->_fullscreenBehavior;
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
}

- (SVVideoPlaybackQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SVPlaybackCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (SVPlaybackCoordinator)primaryContentCoordinator
{
  return self->_primaryContentCoordinator;
}

- (void)setPrimaryContentCoordinator:(id)a3
{
}

- (SVVideoAdProviding)videoAd
{
  return self->_videoAd;
}

- (void)setVideoAd:(id)a3
{
}

- (BOOL)playButtonTapped
{
  return self->_playButtonTapped;
}

- (void)setPlayButtonTapped:(BOOL)a3
{
  self->_playButtonTapped = a3;
}

- (SVLearnMoreButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
}

- (SVVideoAdSkipButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (SVAdPrivacyButton)adPrivacyButton
{
  return self->_adPrivacyButton;
}

- (void)setAdPrivacyButton:(id)a3
{
}

- (SVAdGradientView)adGradientView
{
  return self->_adGradientView;
}

- (void)setAdGradientView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (SVKeyValueObserver)videoBoundsObserver
{
  return self->_videoBoundsObserver;
}

- (void)setVideoBoundsObserver:(id)a3
{
}

- (SVAutomaticFullscreenVideoPlaybackBehaviorManager)fullscreenBehaviorManager
{
  return self->_fullscreenBehaviorManager;
}

- (SVVideoVolumeObserver)volumeObserver
{
  return self->_volumeObserver;
}

- (void)setVolumeObserver:(id)a3
{
}

- (UIGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  self->_showsPlaybackControls = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_volumeObserver, 0);
  objc_storeStrong((id *)&self->_fullscreenBehaviorManager, 0);
  objc_storeStrong((id *)&self->_videoBoundsObserver, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_adGradientView, 0);
  objc_storeStrong((id *)&self->_adPrivacyButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_videoAd, 0);
  objc_storeStrong((id *)&self->_primaryContentCoordinator, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_destroyWeak((id *)&self->_delegate);
}

@end