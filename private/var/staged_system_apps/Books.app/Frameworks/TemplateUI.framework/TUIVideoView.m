@interface TUIVideoView
+ (id)renderModelWithIdentifier:(id)a3 url:(id)a4 posterFrameResource:(id)a5 videoId:(id)a6 loop:(BOOL)a7 muted:(BOOL)a8 allowFullScreen:(BOOL)a9 autoPlay:(BOOL)a10 showPlaybackControls:(BOOL)a11 gravity:(id)a12 cornerRadius:(double)a13 topTriggerName:(id)a14 bottomTriggerName:(id)a15 leftTriggerName:(id)a16 rightTriggerName:(id)a17 actionHandler:(id)a18;
- (AVPlayerController)playerController;
- (AVPlayerViewController)videoViewController;
- (BOOL)isPlaying;
- (BOOL)shouldMuteOnNextDisplay;
- (TUIImageResource)posterFrameResource;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIImageView)posterFrameImageView;
- (UITapGestureRecognizer)fullScreenTapGesture;
- (_TUIVideoPlayButton)playButton;
- (double)currentTime;
- (double)duration;
- (id)accessibilityElements;
- (id)viewStateSave;
- (unint64_t)videoMode;
- (void)_configureActivityIndicatorView;
- (void)_configureFullscreenTapGestureRecognizer;
- (void)_configurePlayButtonView;
- (void)_configurePosterFrameImageView;
- (void)_configureVideoViewController;
- (void)_configureWithModel:(id)a3;
- (void)_handleFullScreenTapGesture:(id)a3;
- (void)_handlePlayTapGesture:(id)a3;
- (void)_registerTriggers;
- (void)_reportAction:(unint64_t)a3 origin:(unint64_t)a4 videoId:(id)a5;
- (void)_reportEvent:(unint64_t)a3 mediaTimePlayed:(double)a4 videoId:(id)a5;
- (void)_setPlayButtonVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setPosterFrameImageVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_unregisterTriggers;
- (void)_updateStateBasedSubviewsAnimated:(BOOL)a3;
- (void)_updateStateBasedTapGestureRecognizers;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)didBecomeActiveHost;
- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5;
- (void)imageResourceDidChangeImage:(id)a3;
- (void)layoutSubviews;
- (void)managerAttemptingActionWithOrigin:(unint64_t)a3 actionCase:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playerViewController:(id)a3 metricsCollectionEventOccured:(int64_t)a4;
- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)playerWithVideoId:(id)a3 didChangeState:(unint64_t)a4;
- (void)playerWithVideoId:(id)a3 didSetFailureReason:(unint64_t)a4 mediaTimePlayed:(double)a5;
- (void)playerWithVideoId:(id)a3 didSetMuted:(BOOL)a4 mediaTimePlayed:(double)a5;
- (void)playerWithVideoId:(id)a3 didStallPlaybackAtTime:(double)a4;
- (void)playerWithVideoIdDidPause:(id)a3 mediaTimePlayed:(double)a4;
- (void)playerWithVideoIdDidPlay:(id)a3 mediaTimePlayed:(double)a4;
- (void)playerWithVideoIdDidPlayToEnd:(id)a3 mediaTimePlayed:(double)a4;
- (void)setActivityIndicatorView:(id)a3;
- (void)setFullScreenTapGesture:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setPosterFrameImageView:(id)a3;
- (void)setPosterFrameResource:(id)a3;
- (void)setShouldMuteOnNextDisplay:(BOOL)a3;
- (void)setVideoViewController:(id)a3;
- (void)viewStateRestore:(id)a3;
- (void)willBecomeInactiveHost;
@end

@implementation TUIVideoView

+ (id)renderModelWithIdentifier:(id)a3 url:(id)a4 posterFrameResource:(id)a5 videoId:(id)a6 loop:(BOOL)a7 muted:(BOOL)a8 allowFullScreen:(BOOL)a9 autoPlay:(BOOL)a10 showPlaybackControls:(BOOL)a11 gravity:(id)a12 cornerRadius:(double)a13 topTriggerName:(id)a14 bottomTriggerName:(id)a15 leftTriggerName:(id)a16 rightTriggerName:(id)a17 actionHandler:(id)a18
{
  BOOL v37 = a7;
  BOOL v38 = a8;
  id v22 = a18;
  id v23 = a17;
  id v24 = a16;
  id v25 = a15;
  id v26 = a14;
  id v27 = a12;
  id v28 = a6;
  id v29 = a5;
  id v30 = a4;
  id v36 = a3;
  LOWORD(v34) = __PAIR16__(a11, a10);
  v31 = -[_TUIRenderModelVideo initWithUrl:posterFrameResource:videoId:loop:muted:allowFullScreen:autoPlay:showPlaybackControls:gravity:cornerRadius:topTriggerName:bottomTriggerName:leftTriggerName:rightTriggerName:actionHandler:]([_TUIRenderModelVideo alloc], "initWithUrl:posterFrameResource:videoId:loop:muted:allowFullScreen:autoPlay:showPlaybackControls:gravity:cornerRadius:topTriggerName:bottomTriggerName:leftTriggerName:rightTriggerName:actionHandler:", v30, v29, v28, v37, v38, a9, a13, v34, v27, v26, v25, v24, v23, v22);

  v32 = [[TUIRenderModelView alloc] initWithReuseIdentifier:@"TUIReuseIdentifierVideoView" identifier:v36 submodel:v31];

  return v32;
}

- (void)dealloc
{
  [(AVPlayerController *)self->_playerController removeObserver:self forKeyPath:@"scrubbing" context:&off_255920];
  v3 = [(TUIVideoView *)self videoViewController];
  [v3 removeObserver:self forKeyPath:@"playerController" context:&off_255920];

  v4 = [(TUIVideoView *)self videoViewController];
  [v4 removeObserver:self forKeyPath:@"readyForDisplay" context:&off_255920];

  v5 = [(TUIVideoView *)self videoViewController];
  [v5 removeFromParentViewController];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_posterFrameResource);
  [WeakRetained removeInterest];

  id v7 = objc_loadWeakRetained((id *)&self->_posterFrameResource);
  [v7 removeObserver:self];

  v8 = [(_TUIRenderModelVideo *)self->_renderModel videoId];

  if (v8)
  {
    v9 = [(TUIReusableBaseView *)self feedControllerHost];
    v10 = [v9 videoPlayerManager];
    v11 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
    [v10 endHostingForVideoId:v11 forHost:self];
  }
  [(TUIVideoView *)self _unregisterTriggers];
  v12.receiver = self;
  v12.super_class = (Class)TUIVideoView;
  [(TUIVideoView *)&v12 dealloc];
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TUIVideoView;
  id v4 = a3;
  [(TUIReusableBaseView *)&v7 applyLayoutAttributes:v4];
  v5 = [v4 renderModel];

  v6 = [v5 submodel];
  [(TUIVideoView *)self _configureWithModel:v6];
}

- (void)_configureWithModel:(id)a3
{
  p_renderModel = &self->_renderModel;
  id v24 = a3;
  if (([v24 isEqualToRenderModel:*p_renderModel] & 1) == 0)
  {
    if (*p_renderModel)
    {
      v6 = [(_TUIRenderModelVideo *)*p_renderModel videoId];
      objc_super v7 = [v24 videoId];
      unsigned __int8 v8 = [v6 isEqual:v7];

      if ((v8 & 1) == 0)
      {
        v9 = [(TUIReusableBaseView *)self feedControllerHost];
        v10 = [v9 videoPlayerManager];
        [v10 endHostingForVideoId:v6 forHost:self];
      }
      [(TUIVideoView *)self _unregisterTriggers];
    }
    objc_storeStrong((id *)&self->_renderModel, a3);
    [(TUIVideoView *)self _registerTriggers];
    [(TUIVideoView *)self _configureFullscreenTapGestureRecognizer];
    [(TUIVideoView *)self _configureVideoViewController];
    [(TUIVideoView *)self _updateStateBasedTapGestureRecognizers];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_posterFrameResource);
    id v12 = [(_TUIRenderModelVideo *)*p_renderModel posterFrameResource];

    if (WeakRetained != v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_posterFrameResource);
      [v13 removeInterest];

      id v14 = objc_loadWeakRetained((id *)&self->_posterFrameResource);
      [v14 removeObserver:self];

      v15 = [(_TUIRenderModelVideo *)*p_renderModel posterFrameResource];
      objc_storeWeak((id *)&self->_posterFrameResource, v15);

      id v16 = objc_loadWeakRetained((id *)&self->_posterFrameResource);
      [v16 addInterest];

      id v17 = objc_loadWeakRetained((id *)&self->_posterFrameResource);
      [v17 addObserver:self];
    }
    if ([(_TUIRenderModelVideo *)*p_renderModel autoPlay]) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 0;
    }
    if ([(_TUIRenderModelVideo *)*p_renderModel muted]) {
      v18 |= 4uLL;
    }
    uint64_t v19 = v18 | [(_TUIRenderModelVideo *)*p_renderModel loop];
    v20 = [(TUIReusableBaseView *)self feedControllerHost];
    v21 = [v20 videoPlayerManager];
    id v22 = [v24 url];
    id v23 = [v24 videoId];
    [v21 configureHostWithPlayerForURL:v22 videoId:v23 host:self options:v19];
  }
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)TUIVideoView;
  [(TUIVideoView *)&v18 layoutSubviews];
  [(TUIVideoView *)self _configurePosterFrameImageView];
  [(TUIVideoView *)self _configurePlayButtonView];
  [(TUIVideoView *)self _configureActivityIndicatorView];
  [(TUIVideoView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(TUIVideoView *)self videoViewController];
  id v12 = [v11 view];
  [v12 setFrame:v4, v6, v8, v10];

  -[UIImageView setFrame:](self->_posterFrameImageView, "setFrame:", v4, v6, v8, v10);
  [(TUIVideoView *)self center];
  -[UIActivityIndicatorView setCenter:](self->_activityIndicatorView, "setCenter:");
  +[_TUIVideoPlayButton computeSizeFittingVideoSize:](_TUIVideoPlayButton, "computeSizeFittingVideoSize:", v8, v10);
  double v14 = v13;
  double v16 = v15;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  CGFloat v17 = CGRectGetWidth(v19) * 0.5 - v14 * 0.5;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  -[_TUIVideoPlayButton setFrame:](self->_playButton, "setFrame:", v17, CGRectGetHeight(v20) * 0.5 - v16 * 0.5, v14, v16);
}

- (unint64_t)videoMode
{
  return self->_isInFullScreen;
}

- (double)currentTime
{
  v2 = [(TUIVideoView *)self videoViewController];
  double v3 = [v2 player];
  double v4 = v3;
  if (v3) {
    [v3 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (double)duration
{
  v2 = [(TUIVideoView *)self videoViewController];
  double v3 = [v2 player];
  double v4 = [v3 currentItem];
  double v5 = v4;
  if (v4) {
    [v4 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (BOOL)isPlaying
{
  double v3 = [(TUIReusableBaseView *)self feedControllerHost];
  double v4 = [v3 videoPlayerManager];
  double v5 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
  unsigned __int8 v6 = [v4 playerWithVideoIdIsPlaying:v5];

  return v6;
}

- (void)setPlayerController:(id)a3
{
  double v5 = (AVPlayerController *)a3;
  playerController = self->_playerController;
  if (playerController != v5)
  {
    double v7 = v5;
    if (playerController) {
      [(AVPlayerController *)playerController removeObserver:self forKeyPath:@"scrubbing" context:&off_255920];
    }
    objc_storeStrong((id *)&self->_playerController, a3);
    [(AVPlayerController *)self->_playerController addObserver:self forKeyPath:@"scrubbing" options:1 context:&off_255920];
    double v5 = v7;
  }
}

- (id)viewStateSave
{
  v2 = [[_TUIVideoViewState alloc] initWithMuteState:[(TUIVideoView *)self shouldMuteOnNextDisplay]];

  return v2;
}

- (void)viewStateRestore:(id)a3
{
  if (a3)
  {
    id v4 = [a3 muted];
    [(TUIVideoView *)self setShouldMuteOnNextDisplay:v4];
  }
}

- (void)_registerTriggers
{
  double v3 = [(_TUIRenderModelVideo *)self->_renderModel topTriggerName];
  if ([v3 length])
  {
    id v4 = [(_TUIRenderModelVideo *)self->_renderModel bottomTriggerName];
    id v5 = [v4 length];

    if (!v5) {
      goto LABEL_5;
    }
    unsigned __int8 v6 = [(TUIReusableBaseView *)self feedControllerHost];
    double v7 = [v6 triggerStateManager];
    double v8 = [(_TUIRenderModelVideo *)self->_renderModel topTriggerName];
    [v7 addObserver:self forTrigger:v8];

    double v3 = [(TUIReusableBaseView *)self feedControllerHost];
    double v9 = [v3 triggerStateManager];
    double v10 = [(_TUIRenderModelVideo *)self->_renderModel bottomTriggerName];
    [v9 addObserver:self forTrigger:v10];
  }
LABEL_5:
  id v18 = [(_TUIRenderModelVideo *)self->_renderModel leftTriggerName];
  if ([v18 length])
  {
    v11 = [(_TUIRenderModelVideo *)self->_renderModel rightTriggerName];
    id v12 = [v11 length];

    if (!v12) {
      return;
    }
    double v13 = [(TUIReusableBaseView *)self feedControllerHost];
    double v14 = [v13 triggerStateManager];
    double v15 = [(_TUIRenderModelVideo *)self->_renderModel leftTriggerName];
    [v14 addObserver:self forTrigger:v15];

    id v18 = [(TUIReusableBaseView *)self feedControllerHost];
    double v16 = [v18 triggerStateManager];
    CGFloat v17 = [(_TUIRenderModelVideo *)self->_renderModel rightTriggerName];
    [v16 addObserver:self forTrigger:v17];
  }
}

- (void)_unregisterTriggers
{
  double v3 = [(_TUIRenderModelVideo *)self->_renderModel topTriggerName];
  if ([v3 length])
  {
    id v4 = [(_TUIRenderModelVideo *)self->_renderModel bottomTriggerName];
    id v5 = [v4 length];

    if (!v5) {
      goto LABEL_5;
    }
    unsigned __int8 v6 = [(TUIReusableBaseView *)self feedControllerHost];
    double v7 = [v6 triggerStateManager];
    double v8 = [(_TUIRenderModelVideo *)self->_renderModel topTriggerName];
    [v7 removeObserver:self forTrigger:v8];

    double v3 = [(TUIReusableBaseView *)self feedControllerHost];
    double v9 = [v3 triggerStateManager];
    double v10 = [(_TUIRenderModelVideo *)self->_renderModel bottomTriggerName];
    [v9 removeObserver:self forTrigger:v10];
  }
LABEL_5:
  id v18 = [(_TUIRenderModelVideo *)self->_renderModel leftTriggerName];
  if ([v18 length])
  {
    v11 = [(_TUIRenderModelVideo *)self->_renderModel rightTriggerName];
    id v12 = [v11 length];

    if (!v12) {
      return;
    }
    double v13 = [(TUIReusableBaseView *)self feedControllerHost];
    double v14 = [v13 triggerStateManager];
    double v15 = [(_TUIRenderModelVideo *)self->_renderModel leftTriggerName];
    [v14 removeObserver:self forTrigger:v15];

    id v18 = [(TUIReusableBaseView *)self feedControllerHost];
    double v16 = [v18 triggerStateManager];
    CGFloat v17 = [(_TUIRenderModelVideo *)self->_renderModel rightTriggerName];
    [v16 removeObserver:self forTrigger:v17];
  }
}

- (void)_setPosterFrameImageVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(TUIVideoView *)self posterFrameImageView];
  [v7 alpha];
  BOOL v9 = v8 != 1.0;

  if (((v9 ^ v5) & 1) == 0)
  {
    if (v4)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_111D50;
      v12[3] = &unk_252AC0;
      v12[4] = self;
      BOOL v13 = v5;
      +[UIView animateWithDuration:v12 animations:0 completion:0.2];
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_111DA8;
      v10[3] = &unk_252AC0;
      v10[4] = self;
      BOOL v11 = v5;
      +[UIView performWithoutAnimation:v10];
    }
  }
}

- (void)_setPlayButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(TUIVideoView *)self playButton];
  [v7 alpha];
  BOOL v9 = v8 != 1.0;

  if (((v9 ^ v5) & 1) == 0)
  {
    if (v4)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_111F70;
      v14[3] = &unk_252AC0;
      v14[4] = self;
      BOOL v15 = v5;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_111FC8;
      v12[3] = &unk_255930;
      v12[4] = self;
      BOOL v13 = v5;
      +[UIView animateWithDuration:v14 animations:v12 completion:0.3];
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_112048;
      v10[3] = &unk_252AC0;
      v10[4] = self;
      BOOL v11 = v5;
      +[UIView performWithoutAnimation:v10];
    }
  }
}

- (void)_configureVideoViewController
{
  double v3 = [(TUIVideoView *)self videoViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)AVPlayerViewController);
    [(TUIVideoView *)self setVideoViewController:v4];

    BOOL v5 = [(TUIVideoView *)self videoViewController];
    [v5 setDelegate:self];

    unsigned __int8 v6 = [(TUIVideoView *)self videoViewController];
    [v6 setCanPausePlaybackWhenExitingFullScreen:0];

    double v7 = [(TUIVideoView *)self videoViewController];
    [v7 setCanToggleVideoGravityWhenEmbeddedInline:0];

    double v8 = [(TUIVideoView *)self videoViewController];
    [v8 setModalPresentationStyle:5];

    BOOL v9 = [(TUIVideoView *)self videoViewController];
    [v9 setUpdatesNowPlayingInfoCenter:0];

    double v10 = [(TUIVideoView *)self videoViewController];
    [v10 setAllowsPictureInPicturePlayback:0];

    BOOL v11 = [(TUIVideoView *)self videoViewController];
    [v11 setExitsFullScreenWhenPlaybackEnds:1];

    id v12 = [(TUIVideoView *)self videoViewController];
    BOOL v13 = [v12 view];
    [v13 setClipsToBounds:1];

    double v14 = [(TUIVideoView *)self videoViewController];
    BOOL v15 = [v14 view];
    double v16 = [v15 layer];
    [v16 setMasksToBounds:1];

    CGFloat v17 = [(TUIReusableBaseView *)self feedControllerHost];
    id v18 = [(TUIVideoView *)self videoViewController];
    [v17 addChildViewController:v18];

    CGRect v19 = [(TUIVideoView *)self videoViewController];
    CGRect v20 = [v19 view];
    [(TUIVideoView *)self addSubview:v20];

    v21 = [(TUIReusableBaseView *)self feedControllerHost];
    id v22 = [(TUIVideoView *)self videoViewController];
    [v21 didAddChildViewController:v22];

    id v23 = [(TUIVideoView *)self videoViewController];
    [v23 addObserver:self forKeyPath:@"readyForDisplay" options:5 context:&off_255920];

    id v24 = [(TUIVideoView *)self videoViewController];
    [v24 addObserver:self forKeyPath:@"playerController" options:1 context:&off_255920];
  }
  BOOL isInFullScreen = self->_isInFullScreen;
  id v26 = [(TUIVideoView *)self videoViewController];
  id v27 = v26;
  if (isInFullScreen)
  {
    [v26 setShowsPlaybackControls:1];

    id v28 = [(TUIVideoView *)self videoViewController];
    [v28 setCanHidePlaybackControls:1];

    id v29 = [(TUIVideoView *)self videoViewController];
    id v42 = v29;
    uint64_t v30 = 0;
  }
  else
  {
    [v26 setCanHidePlaybackControls:0];

    v31 = [(_TUIRenderModelVideo *)self->_renderModel gravity];
    v32 = [(TUIVideoView *)self videoViewController];
    [v32 setVideoGravity:v31];

    [(_TUIRenderModelVideo *)self->_renderModel cornerRadius];
    double v34 = v33;
    v35 = [(TUIVideoView *)self videoViewController];
    id v36 = [v35 view];
    BOOL v37 = [v36 layer];
    [v37 setCornerRadius:v34];

    BOOL v38 = [(_TUIRenderModelVideo *)self->_renderModel allowFullScreen];
    v39 = [(TUIVideoView *)self videoViewController];
    [v39 setAllowsEnteringFullScreen:v38];

    BOOL v40 = [(_TUIRenderModelVideo *)self->_renderModel showPlaybackControls];
    v41 = [(TUIVideoView *)self videoViewController];
    [v41 setShowsPlaybackControls:v40];

    id v29 = [(TUIVideoView *)self videoViewController];
    id v42 = v29;
    uint64_t v30 = 1;
  }
  [v29 setPreferredUnobscuredArea:v30];
}

- (void)_handleFullScreenTapGesture:(id)a3
{
  id v3 = [(TUIVideoView *)self videoViewController];
  [v3 enterFullScreenWithCompletion:0];
}

- (void)_handlePlayTapGesture:(id)a3
{
  id v6 = [(TUIReusableBaseView *)self feedControllerHost];
  id v4 = [v6 videoPlayerManager];
  BOOL v5 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
  [v4 hostWantsToPlayVideoWithVideoId:v5 requestingHost:self isTriggerInitiated:0];
}

- (void)_configureFullscreenTapGestureRecognizer
{
  if (!self->_fullScreenTapGesture)
  {
    id v3 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleFullScreenTapGesture:"];
    fullScreenTapGesture = self->_fullScreenTapGesture;
    self->_fullScreenTapGesture = v3;
  }
}

- (void)_configurePosterFrameImageView
{
  if (!self->_posterFrameImageView)
  {
    id v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    posterFrameImageView = self->_posterFrameImageView;
    self->_posterFrameImageView = v3;

    BOOL v5 = [(UIImageView *)self->_posterFrameImageView layer];
    [v5 setMasksToBounds:1];

    [(TUIVideoView *)self addSubview:self->_posterFrameImageView];
  }
  id v12 = [(_TUIRenderModelVideo *)self->_renderModel gravity];
  if ([v12 isEqualToString:AVLayerVideoGravityResizeAspect])
  {
    id v6 = self->_posterFrameImageView;
    uint64_t v7 = 1;
  }
  else
  {
    unsigned int v8 = [v12 isEqualToString:AVLayerVideoGravityResizeAspectFill];
    id v6 = self->_posterFrameImageView;
    if (v8) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  [(UIImageView *)v6 setContentMode:v7];
  [(_TUIRenderModelVideo *)self->_renderModel cornerRadius];
  double v10 = v9;
  BOOL v11 = [(UIImageView *)self->_posterFrameImageView layer];
  [v11 setCornerRadius:v10];
}

- (void)_configurePlayButtonView
{
  if (!self->_playButton)
  {
    id v3 = objc_alloc_init(_TUIVideoPlayButton);
    playButton = self->_playButton;
    self->_playButton = v3;

    [(_TUIVideoPlayButton *)self->_playButton addTarget:self action:"_handlePlayTapGesture:" forControlEvents:64];
    BOOL v5 = self->_playButton;
    [(TUIVideoView *)self addSubview:v5];
  }
}

- (void)_configureActivityIndicatorView
{
  if (!self->_activityIndicatorView)
  {
    id v3 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    activityIndicatorView = self->_activityIndicatorView;
    self->_activityIndicatorView = v3;

    [(UIActivityIndicatorView *)self->_activityIndicatorView setHidesWhenStopped:1];
    BOOL v5 = +[UIColor whiteColor];
    [(UIActivityIndicatorView *)self->_activityIndicatorView setColor:v5];

    id v6 = self->_activityIndicatorView;
    [(TUIVideoView *)self addSubview:v6];
  }
}

- (void)_updateStateBasedSubviewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(TUIReusableBaseView *)self feedControllerHost];
  id v6 = [v5 videoPlayerManager];
  uint64_t v7 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
  unsigned int v8 = (char *)[v6 stateForPlayerWithVideoId:v7];

  double v9 = [(TUIVideoView *)self videoViewController];
  unsigned int v10 = [v9 isReadyForDisplay];

  [(TUIVideoView *)self _setPosterFrameImageVisible:v10 ^ 1 animated:v3];
  if (v8 == (unsigned char *)&dword_4 + 1 || v8 == (unsigned char *)&def_141F14 + 3)
  {
    BOOL v13 = 0;
    if (![(_TUIRenderModelVideo *)self->_renderModel showPlaybackControls])
    {
      char v12 = self->_isInFullScreen ? 0 : v10;
      if (v12) {
        BOOL v13 = 1;
      }
    }
    [(TUIVideoView *)self _setPlayButtonVisible:v13 animated:v3];
  }
  else
  {
    [(TUIVideoView *)self _setPlayButtonVisible:0 animated:v3];
    if (v8 == (unsigned char *)&dword_8 + 1) {
      unsigned int v14 = v10;
    }
    else {
      unsigned int v14 = 0;
    }
    if (v14 == 1)
    {
      activityIndicatorView = self->_activityIndicatorView;
      [(UIActivityIndicatorView *)activityIndicatorView startAnimating];
      return;
    }
  }
  double v16 = self->_activityIndicatorView;

  [(UIActivityIndicatorView *)v16 stopAnimating];
}

- (void)_updateStateBasedTapGestureRecognizers
{
  BOOL v3 = [(TUIReusableBaseView *)self feedControllerHost];
  id v4 = [v3 videoPlayerManager];
  BOOL v5 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
  id v6 = (int *)[v4 stateForPlayerWithVideoId:v5];

  if (self->_isInFullScreen
    || [(_TUIRenderModelVideo *)self->_renderModel showPlaybackControls]
    || ([(_TUIRenderModelVideo *)self->_renderModel allowFullScreen]
      ? (BOOL v7 = v6 == &dword_4)
      : (BOOL v7 = 0),
        !v7))
  {
    unsigned int v8 = TUIVideoLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v12 = 0;
      _os_log_impl(&def_141F14, v8, OS_LOG_TYPE_INFO, "Removing fullscreen tap gesture recognizer", v12, 2u);
    }

    double v9 = [(TUIVideoView *)self videoViewController];
    unsigned int v10 = [v9 view];
    [v10 removeGestureRecognizer:self->_fullScreenTapGesture];
  }
  else
  {
    BOOL v11 = TUIVideoLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_141F14, v11, OS_LOG_TYPE_INFO, "Adding fullscreen tap gesture recognizer", buf, 2u);
    }

    double v9 = [(TUIVideoView *)self videoViewController];
    unsigned int v10 = [v9 view];
    [v10 addGestureRecognizer:self->_fullScreenTapGesture];
  }
}

- (void)_reportEvent:(unint64_t)a3 mediaTimePlayed:(double)a4 videoId:(id)a5
{
  id v8 = a5;
  double v9 = [TUIVideoEventMetadata alloc];
  unint64_t v10 = [(TUIVideoView *)self videoMode];
  BOOL v11 = [(TUIVideoView *)self videoViewController];
  char v12 = [v11 player];
  id v13 = [v12 isMuted];
  BOOL v14 = [(TUIVideoView *)self isPlaying];
  [(TUIVideoView *)self duration];
  double v16 = [(TUIVideoEventMetadata *)v9 initWithEventCase:a3 mode:v10 isMuted:v13 isPlaying:v14 mediaTimePlayed:v8 mediaDuration:a4 mediaId:v15];

  if (v16)
  {
    CGFloat v17 = [(_TUIRenderModelVideo *)self->_renderModel actionHandler];

    if (v17)
    {
      id v18 = [(TUIVideoEventMetadata *)v16 serialize];
      CGRect v19 = [(TUIVideoEventMetadata *)v16 triggerForEvent:a3];
      CGRect v20 = [(_TUIRenderModelVideo *)self->_renderModel actionHandler];
      CFStringRef v22 = @"eventData";
      id v23 = v18;
      v21 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      [v20 invoke:v19 arguments:v21];
    }
  }
}

- (void)_reportAction:(unint64_t)a3 origin:(unint64_t)a4 videoId:(id)a5
{
  id v8 = a5;
  double v9 = [TUIVideoActionMetadata alloc];
  unint64_t v10 = [(TUIVideoView *)self videoMode];
  BOOL v11 = [(TUIVideoView *)self videoViewController];
  char v12 = [v11 player];
  id v13 = [v12 isMuted];
  BOOL v14 = [(TUIVideoView *)self isPlaying];
  [(TUIVideoView *)self currentTime];
  double v16 = v15;
  [(TUIVideoView *)self duration];
  id v18 = [(TUIVideoActionMetadata *)v9 initWithActionCase:a3 origin:a4 mode:v10 isMuted:v13 isPlaying:v14 mediaTimePlayed:v8 mediaDuration:v16 mediaId:v17];

  if (v18)
  {
    CGRect v19 = [(_TUIRenderModelVideo *)self->_renderModel actionHandler];

    if (v19)
    {
      CGRect v20 = [(TUIVideoActionMetadata *)v18 serialize];
      v21 = [(TUIVideoActionMetadata *)v18 triggerForAction:a3];
      CFStringRef v22 = [(_TUIRenderModelVideo *)self->_renderModel actionHandler];
      CFStringRef v24 = @"actionData";
      id v25 = v20;
      id v23 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      [v22 invoke:v21 arguments:v23];
    }
  }
}

- (void)imageResourceDidChangeImage:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_112FD0;
  v5[3] = &unk_251828;
  id v6 = a3;
  BOOL v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)playerWithVideoId:(id)a3 didChangeState:(unint64_t)a4
{
  -[TUIVideoView _updateStateBasedSubviewsAnimated:](self, "_updateStateBasedSubviewsAnimated:", 1, a4);

  [(TUIVideoView *)self _updateStateBasedTapGestureRecognizers];
}

- (void)playerWithVideoIdDidPlayToEnd:(id)a3 mediaTimePlayed:(double)a4
{
}

- (void)playerWithVideoId:(id)a3 didStallPlaybackAtTime:(double)a4
{
}

- (void)playerWithVideoIdDidPlay:(id)a3 mediaTimePlayed:(double)a4
{
  -[TUIVideoView _reportEvent:mediaTimePlayed:videoId:](self, "_reportEvent:mediaTimePlayed:videoId:", 2 * (a4 >= 1.0), a3);
}

- (void)playerWithVideoIdDidPause:(id)a3 mediaTimePlayed:(double)a4
{
}

- (void)playerWithVideoId:(id)a3 didSetMuted:(BOOL)a4 mediaTimePlayed:(double)a5
{
  if (a4) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 4;
  }
  [(TUIVideoView *)self _reportEvent:v6 mediaTimePlayed:a3 videoId:a5];
}

- (void)playerWithVideoId:(id)a3 didSetFailureReason:(unint64_t)a4 mediaTimePlayed:(double)a5
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == &off_255920)
  {
    if ([v10 isEqualToString:@"scrubbing"])
    {
      uint64_t v12 = objc_opt_class();
      id v13 = [v11 objectForKey:NSKeyValueChangeNewKey];
      BOOL v14 = TUIDynamicCast(v12, v13);
      unsigned int v15 = [v14 BOOLValue];

      [(TUIVideoView *)self currentTime];
      double v17 = v16;
      id v18 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
      if (v15) {
        uint64_t v19 = 10;
      }
      else {
        uint64_t v19 = 11;
      }
      [(TUIVideoView *)self _reportEvent:v19 mediaTimePlayed:v18 videoId:v17];
    }
    else
    {
      if ([v10 isEqualToString:@"readyForDisplay"])
      {
        [(TUIVideoView *)self _updateStateBasedSubviewsAnimated:1];
        goto LABEL_11;
      }
      if (![v10 isEqualToString:@"playerController"]) {
        goto LABEL_11;
      }
      id v18 = [(TUIVideoView *)self videoViewController];
      CGRect v20 = [v18 playerController];
      [(TUIVideoView *)self setPlayerController:v20];
    }
    goto LABEL_11;
  }
  v21.receiver = self;
  v21.super_class = (Class)TUIVideoView;
  [(TUIVideoView *)&v21 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_11:
}

- (id)accessibilityElements
{
  BOOL v3 = [(TUIVideoView *)self videoViewController];
  id v4 = [v3 view];
  playButton = self->_playButton;
  v8[0] = v4;
  v8[1] = playButton;
  uint64_t v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  uint64_t v6 = [(TUIReusableBaseView *)self feedControllerHost];
  BOOL v7 = [v6 triggerStateManager];
  id v8 = [(_TUIRenderModelVideo *)self->_renderModel topTriggerName];
  double v9 = (int *)[v7 stateForTriggerWithName:v8];

  id v10 = [(TUIReusableBaseView *)self feedControllerHost];
  id v11 = [v10 triggerStateManager];
  uint64_t v12 = [(_TUIRenderModelVideo *)self->_renderModel bottomTriggerName];
  id v13 = (int *)[v11 stateForTriggerWithName:v12];

  BOOL v14 = [(TUIReusableBaseView *)self feedControllerHost];
  unsigned int v15 = [v14 triggerStateManager];
  double v16 = [(_TUIRenderModelVideo *)self->_renderModel leftTriggerName];
  unint64_t v17 = (unint64_t)[v15 stateForTriggerWithName:v16];

  id v18 = [(TUIReusableBaseView *)self feedControllerHost];
  uint64_t v19 = [v18 triggerStateManager];
  CGRect v20 = [(_TUIRenderModelVideo *)self->_renderModel rightTriggerName];
  objc_super v21 = (int *)[v19 stateForTriggerWithName:v20];

  BOOL v23 = v9 == (int *)((char *)&def_141F14 + 2) || v13 == (int *)((char *)&def_141F14 + 2);
  CFStringRef v24 = [(TUIReusableBaseView *)self feedControllerHost];
  id v25 = [v24 videoPlayerManager];
  unsigned int v26 = [v25 isInForeground];

  BOOL v30 = v9 == &dword_4 || v13 == &dword_4 || v17 == 4 || v21 == &dword_4;
  BOOL v32 = (v17 & 0xFFFFFFFFFFFFFFFDLL) == 0 || v21 == (int *)((char *)&def_141F14 + 2) || v21 == 0;
  int v33 = !v32;
  int v46 = v33;
  int v34 = !v32 || v30;
  BOOL v35 = v23;
  uint64_t v36 = v23 & ~v34 & v26;
  BOOL v37 = [(TUIReusableBaseView *)self feedControllerHost];
  BOOL v38 = [v37 videoPlayerManager];
  v39 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
  [v38 hostWantsToSetPlayerIsWithinVisibleBoundsForPlayerWithVideoId:v39 requestingHost:self isWithinVisibleBounds:v36];

  if (a4 != 4)
  {
    BOOL v40 = [(TUIReusableBaseView *)self feedControllerHost];
    v41 = [v40 videoPlayerManager];
    id v42 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
    v43 = [(_TUIRenderModelVideo *)self->_renderModel url];
    [v41 setActiveHostOfPlayerForVideoId:v42 videoUrl:v43 host:self];
  }
  if (!self->_fullScreenTransitionInFlight && !self->_isInFullScreen)
  {
    [(TUIVideoView *)self _updateStateBasedSubviewsAnimated:1];
    if ((v30 | v46 | !v35))
    {
      id v48 = [(TUIReusableBaseView *)self feedControllerHost];
      v44 = [v48 videoPlayerManager];
      v45 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
      [v44 hostWantsToPausePlayerWithVideoId:v45 requestingHost:self isTriggerInitiated:1];
    }
    else
    {
      if (![(_TUIRenderModelVideo *)self->_renderModel autoPlay]) {
        return;
      }
      id v48 = [(TUIReusableBaseView *)self feedControllerHost];
      v44 = [v48 videoPlayerManager];
      v45 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
      [v44 hostWantsToPlayVideoWithVideoId:v45 requestingHost:self isTriggerInitiated:1];
    }
  }
}

- (void)willBecomeInactiveHost
{
  self->_shouldMuteOnNextDisplay = 1;
}

- (void)didBecomeActiveHost
{
  if (self->_shouldMuteOnNextDisplay)
  {
    BOOL v3 = [(TUIReusableBaseView *)self feedControllerHost];
    id v4 = [v3 videoPlayerManager];
    BOOL v5 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
    [v4 setMuteStateForPlayerWithVideoId:v5 muted:1 requestingHost:self isTriggerInitiated:1];

    self->_shouldMuteOnNextDisplay = 0;
  }
  [(TUIVideoView *)self _updateStateBasedSubviewsAnimated:1];
  id v8 = [(TUIReusableBaseView *)self feedControllerHost];
  uint64_t v6 = [v8 videoPlayerManager];
  BOOL v7 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
  [v6 setLoopingStateForPlayerWithVideoId:v7 loop:[self->_renderModel loop] requestingHost:self];
}

- (void)managerAttemptingActionWithOrigin:(unint64_t)a3 actionCase:(unint64_t)a4
{
  id v7 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
  [(TUIVideoView *)self _reportAction:a4 origin:a3 videoId:v7];
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  self->_fullScreenTransitionInFlight = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11394C;
  v4[3] = &unk_255958;
  v4[4] = self;
  [a4 animateAlongsideTransition:0 completion:v4];
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  self->_fullScreenTransitionInFlight = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_113B0C;
  v4[3] = &unk_255958;
  v4[4] = self;
  [a4 animateAlongsideTransition:0 completion:v4];
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (!a4 && !self->_isInFullScreen)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_113CE0;
    v11[3] = &unk_251990;
    v11[4] = self;
    [v9 addCoordinatedAnimations:v11 completion:0];
  }
}

- (void)playerViewController:(id)a3 metricsCollectionEventOccured:(int64_t)a4
{
  id v6 = a3;
  id v10 = v6;
  switch(a4)
  {
    case 0:
      id v7 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
      id v8 = self;
      uint64_t v9 = 0;
      goto LABEL_8;
    case 1:
      id v7 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
      id v8 = self;
      uint64_t v9 = 1;
      goto LABEL_8;
    case 2:
      id v7 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
      id v8 = self;
      uint64_t v9 = 2;
      goto LABEL_8;
    case 3:
      id v7 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
      id v8 = self;
      uint64_t v9 = 3;
      goto LABEL_8;
    case 4:
      id v7 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
      id v8 = self;
      uint64_t v9 = 4;
      goto LABEL_8;
    case 5:
      id v7 = [(_TUIRenderModelVideo *)self->_renderModel videoId];
      id v8 = self;
      uint64_t v9 = 5;
LABEL_8:
      [(TUIVideoView *)v8 _reportAction:v9 origin:0 videoId:v7];

      id v6 = v10;
      break;
    default:
      break;
  }
}

- (AVPlayerViewController)videoViewController
{
  return self->videoViewController;
}

- (void)setVideoViewController:(id)a3
{
}

- (UIImageView)posterFrameImageView
{
  return self->_posterFrameImageView;
}

- (void)setPosterFrameImageView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (_TUIVideoPlayButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
}

- (UITapGestureRecognizer)fullScreenTapGesture
{
  return self->_fullScreenTapGesture;
}

- (void)setFullScreenTapGesture:(id)a3
{
}

- (TUIImageResource)posterFrameResource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_posterFrameResource);

  return (TUIImageResource *)WeakRetained;
}

- (void)setPosterFrameResource:(id)a3
{
}

- (BOOL)shouldMuteOnNextDisplay
{
  return self->_shouldMuteOnNextDisplay;
}

- (void)setShouldMuteOnNextDisplay:(BOOL)a3
{
  self->_shouldMuteOnNextDisplay = a3;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_destroyWeak((id *)&self->_posterFrameResource);
  objc_storeStrong((id *)&self->_fullScreenTapGesture, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_posterFrameImageView, 0);
  objc_storeStrong((id *)&self->videoViewController, 0);

  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end