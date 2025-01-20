@interface ICMovieController
+ (BOOL)isFullScreen;
+ (ICMovieController)sharedController;
+ (void)pauseIfPlaying;
+ (void)stopIfPlaying;
- (AVAsset)activeAsset;
- (AVPlayerViewController)moviePlayerController;
- (BOOL)isFullScreen;
- (BOOL)playbackForPreview;
- (BOOL)prepareForPlayback;
- (ICMovieAttachmentView)activeMovieAttachmentView;
- (id)ic_viewControllerManager;
- (void)dealloc;
- (void)moviePlayerTapped;
- (void)pauseIfPlaying;
- (void)play;
- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)prepareForPlayback;
- (void)setActiveAsset:(id)a3;
- (void)setActiveMovieAttachmentView:(id)a3;
- (void)setIsFullScreen:(BOOL)a3;
- (void)setMoviePlayerController:(id)a3;
- (void)setPlaybackForPreview:(BOOL)a3;
- (void)stopIfPlaying;
- (void)updatePlayer;
@end

@implementation ICMovieController

+ (void)stopIfPlaying
{
  if (sDidCreateSharedController == 1)
  {
    id v2 = [a1 sharedController];
    [v2 stopIfPlaying];
  }
}

+ (void)pauseIfPlaying
{
  if (sDidCreateSharedController == 1)
  {
    id v2 = [a1 sharedController];
    [v2 pauseIfPlaying];
  }
}

+ (BOOL)isFullScreen
{
  if (sDidCreateSharedController != 1) {
    return 0;
  }
  id v2 = [a1 sharedController];
  char v3 = [v2 isFullScreen];

  return v3;
}

+ (ICMovieController)sharedController
{
  if (s_onceToken != -1) {
    dispatch_once(&s_onceToken, &__block_literal_global_28);
  }
  id v2 = (void *)sharedController_s_instance;

  return (ICMovieController *)v2;
}

void __37__ICMovieController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(ICMovieController);
  v1 = (void *)sharedController_s_instance;
  sharedController_s_instance = (uint64_t)v0;

  sDidCreateSharedController = 1;
}

- (void)dealloc
{
  [(ICMovieController *)self stopIfPlaying];
  [(ICMovieController *)self setMoviePlayerController:0];
  v3.receiver = self;
  v3.super_class = (Class)ICMovieController;
  [(ICMovieController *)&v3 dealloc];
}

- (id)ic_viewControllerManager
{
  id v2 = [(ICMovieController *)self activeMovieAttachmentView];
  objc_super v3 = objc_msgSend(v2, "ic_viewControllerManager");

  return v3;
}

- (void)updatePlayer
{
  objc_super v3 = (void *)MEMORY[0x263EFA800];
  v4 = [(ICMovieController *)self activeAsset];
  id v14 = [v3 playerItemWithAsset:v4];

  v5 = [MEMORY[0x263EFA7F0] playerWithPlayerItem:v14];
  uint64_t v6 = [(ICMovieController *)self moviePlayerController];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(ICMovieController *)self moviePlayerController];
    v9 = [v8 player];
    v10 = [v9 currentItem];
    v11 = [v10 asset];
    v12 = [(ICMovieController *)self activeAsset];

    if (v11 != v12)
    {
      v13 = [(ICMovieController *)self moviePlayerController];
      [v13 setPlayer:v5];
    }
  }
}

- (BOOL)prepareForPlayback
{
  objc_super v3 = [(ICMovieController *)self activeMovieAttachmentView];
  v4 = [v3 attachment];
  v5 = [v4 attachmentModel];
  int v6 = [v5 isReadyToPresent];

  if (v6)
  {
    v7 = objc_opt_new();
    v8 = v7;
    if (v7)
    {
      [v7 setDelegate:self];
      v9 = [(ICMovieController *)self activeMovieAttachmentView];
      objc_msgSend(v8, "setAllowsPictureInPicturePlayback:", objc_msgSend(v9, "allowsPictureInPicture"));

      objc_msgSend(v8, "setAllowsEnteringFullScreen:", objc_msgSend(MEMORY[0x263F82670], "ic_isVision") ^ 1);
      [(ICMovieController *)self setMoviePlayerController:v8];
      v10 = [(ICMovieController *)self activeMovieAttachmentView];
      char v11 = [v10 shouldPlayFullscreenOnly];

      if ((v11 & 1) == 0)
      {
        v12 = [v8 view];
        v13 = [(ICMovieController *)self activeMovieAttachmentView];
        [v13 bounds];
        objc_msgSend(v12, "setFrame:");

        id v14 = [(ICMovieController *)self activeMovieAttachmentView];
        v15 = [v8 view];
        [v14 addSubview:v15];
      }
      v16 = [(ICMovieController *)self activeMovieAttachmentView];
      [v16 setIcaxIsShowingPlayer:1];

      LODWORD(v16) = *MEMORY[0x263F831C0];
      v17 = [v8 view];
      UIAccessibilityPostNotification((UIAccessibilityNotifications)v16, v17);
    }
    v18 = [MEMORY[0x263EF93E0] sharedInstance];
    uint64_t v19 = *MEMORY[0x263EF9060];
    uint64_t v22 = 0;
    if (([v18 setCategory:v19 error:&v22] & 1) == 0)
    {
      v20 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[ICMovieController prepareForPlayback](v20);
      }
    }
    [(ICMovieController *)self updatePlayer];
  }
  return v6;
}

- (void)play
{
  v24[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = [(ICMovieController *)self activeMovieAttachmentView];
  v5 = [v4 attachment];
  [v3 postNotificationName:@"ICMovieAttachmentViewWillPlayMovieNotification" object:v5];

  int v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = *MEMORY[0x263F5AB08];
  uint64_t v23 = *MEMORY[0x263F5AB00];
  v8 = [(ICMovieController *)self activeMovieAttachmentView];
  v9 = [v8 attachment];
  v24[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  [v6 postNotificationName:v7 object:0 userInfo:v10];

  char v11 = [(ICMovieController *)self moviePlayerController];
  v12 = [v11 player];

  [v12 setUsesExternalPlaybackWhileExternalScreenIsActive:1];
  BOOL v13 = [(ICMovieController *)self playbackForPreview];
  id v14 = [(ICMovieController *)self activeMovieAttachmentView];
  LODWORD(v9) = [v14 shouldPlayFullscreenOnly];

  if (!v9 || v13)
  {
    [v12 play];
  }
  else
  {
    v15 = [(ICMovieController *)self activeMovieAttachmentView];
    [v15 setUserInteractionEnabled:0];

    v16 = [(ICMovieController *)self activeMovieAttachmentView];
    v17 = [v16 window];
    v18 = [v17 rootViewController];
    uint64_t v19 = [(ICMovieController *)self moviePlayerController];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __25__ICMovieController_play__block_invoke;
    v20[3] = &unk_2640B82D8;
    id v21 = v12;
    uint64_t v22 = self;
    [v18 presentViewController:v19 animated:1 completion:v20];
  }
}

void __25__ICMovieController_play__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) play];
  id v2 = [*(id *)(a1 + 40) activeMovieAttachmentView];
  [v2 setUserInteractionEnabled:1];
}

- (void)pauseIfPlaying
{
  id v2 = [(ICMovieController *)self moviePlayerController];
  id v3 = [v2 player];

  [v3 pause];
}

- (void)stopIfPlaying
{
  id v2 = [(ICMovieController *)self moviePlayerController];
  id v3 = [v2 player];

  [v3 pause];
  long long v4 = *MEMORY[0x263F010E0];
  uint64_t v5 = *(void *)(MEMORY[0x263F010E0] + 16);
  [v3 seekToTime:&v4];
}

- (void)moviePlayerTapped
{
  id v3 = [(ICMovieController *)self moviePlayerController];
  long long v4 = [v3 player];
  uint64_t v5 = [v4 currentItem];
  int v6 = [v5 asset];
  uint64_t v7 = [(ICMovieController *)self activeAsset];

  v8 = [(ICMovieController *)self moviePlayerController];
  v9 = v8;
  if (v6 != v7)
  {
    v10 = [v8 player];
    [v10 rate];
    float v12 = v11;

    if (v12 != 0.0) {
      [(ICMovieController *)self stopIfPlaying];
    }
    BOOL v13 = self;
LABEL_5:
    if (![(ICMovieController *)v13 prepareForPlayback]) {
      return;
    }
    goto LABEL_9;
  }

  BOOL v13 = self;
  if (!v9) {
    goto LABEL_5;
  }
  id v14 = [(ICMovieController *)self moviePlayerController];
  v15 = [v14 player];
  [v15 rate];
  float v17 = v16;

  if (v17 == 0.0)
  {
LABEL_9:
    [(ICMovieController *)self play];
    return;
  }

  [(ICMovieController *)self pauseIfPlaying];
}

- (void)setActiveMovieAttachmentView:(id)a3
{
  v10 = (ICMovieAttachmentView *)a3;
  if (self->_activeMovieAttachmentView != v10)
  {
    [(ICMovieController *)self stopIfPlaying];
    [(ICMovieController *)self setPlaybackForPreview:0];
    uint64_t v5 = [(ICMovieController *)self moviePlayerController];
    int v6 = [v5 view];
    [v6 removeFromSuperview];

    [(ICMovieController *)self setMoviePlayerController:0];
    objc_storeStrong((id *)&self->_activeMovieAttachmentView, a3);
    uint64_t v7 = [(ICMovieAttachmentView *)v10 attachment];
    v8 = [v7 attachmentModel];
    v9 = [v8 asset];
    [(ICMovieController *)self setActiveAsset:v9];
  }
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
}

- (ICMovieAttachmentView)activeMovieAttachmentView
{
  return self->_activeMovieAttachmentView;
}

- (AVAsset)activeAsset
{
  return self->_activeAsset;
}

- (void)setActiveAsset:(id)a3
{
}

- (AVPlayerViewController)moviePlayerController
{
  return self->_moviePlayerController;
}

- (void)setMoviePlayerController:(id)a3
{
}

- (BOOL)playbackForPreview
{
  return self->_playbackForPreview;
}

- (void)setPlaybackForPreview:(BOOL)a3
{
  self->_playbackForPreview = a3;
}

- (BOOL)isFullScreen
{
  return self->_isFullScreen;
}

- (void)setIsFullScreen:(BOOL)a3
{
  self->_isFullScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moviePlayerController, 0);
  objc_storeStrong((id *)&self->_activeAsset, 0);

  objc_storeStrong((id *)&self->_activeMovieAttachmentView, 0);
}

- (void)prepareForPlayback
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Unable to set category for audio session", v1, 2u);
}

@end