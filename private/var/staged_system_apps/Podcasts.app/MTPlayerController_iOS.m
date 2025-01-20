@interface MTPlayerController_iOS
+ (void)setDefaultInstance:(id)a3;
- (BOOL)isOnScreenForVolumeDisplay;
- (BOOL)isTargetPlaying;
- (BOOL)shouldPresentNowPlayingForItem:(id)a3 presentationType:(unint64_t)a4;
- (BOOL)volumeControlAvailable;
- (MPVolumeController)volumeController;
- (MTPlayerController_iOS)init;
- (NSString)volumeAudioCategory;
- (id)_nowPlayingRootViewController;
- (id)playerPath;
- (void)decreaseVolume;
- (void)dismissNowPlayingAnimated:(BOOL)a3;
- (void)dismissNowPlayingAnimated:(BOOL)a3 completion:(id)a4;
- (void)increaseVolume;
- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4;
- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewControllerDidStartPictureInPicture:(id)a3;
- (void)playerViewControllerDidStopPictureInPicture:(id)a3;
- (void)playerViewControllerWillStartPictureInPicture:(id)a3;
- (void)playerViewControllerWillStopPictureInPicture:(id)a3;
- (void)presentNowPlayingAnimated:(BOOL)a3;
- (void)setOnScreenForVolumeDisplay:(BOOL)a3;
- (void)setPlayerRoute:(id)a3;
- (void)setVolumeAudioCategory:(id)a3;
- (void)setVolumeController:(id)a3;
@end

@implementation MTPlayerController_iOS

+ (void)setDefaultInstance:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTPlayerController_iOS;
  [super setDefaultInstance:a3];
  id v3 = +[MTAppShortcutManager sharedInstance];
}

- (MTPlayerController_iOS)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTPlayerController_iOS;
  v2 = [(MTPlayerController *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100131FE4;
    v9[3] = &unk_10054D570;
    objc_super v4 = v2;
    v10 = v4;
    +[IMAVPlayer performOnMainQueue:v9];
    v5 = dispatch_get_global_queue(0, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100132074;
    v7[3] = &unk_10054D570;
    v8 = v4;
    dispatch_async(v5, v7);
  }
  return v3;
}

- (NSString)volumeAudioCategory
{
  v2 = [(MTPlayerController_iOS *)self volumeController];
  id v3 = [v2 volumeAudioCategory];

  return (NSString *)v3;
}

- (BOOL)shouldPresentNowPlayingForItem:(id)a3 presentationType:(unint64_t)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTPlayerController_iOS;
  if ([(MTPlayerController *)&v9 shouldPresentNowPlayingForItem:v6 presentationType:a4])
  {
    unsigned int v7 = [v6 isVideo] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)dismissNowPlayingAnimated:(BOOL)a3
{
}

- (void)dismissNowPlayingAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v8 = (void (**)(void))a4;
  id v6 = [(MTPlayerController_iOS *)self _nowPlayingRootViewController];
  if (v6)
  {
    unsigned int v7 = [(MTPlayerController_iOS *)self _nowPlayingRootViewController];
    [v7 dismissNowPlayingWithAnimated:v4 completion:v8];
  }
  else if (v8)
  {
    v8[2]();
  }
}

- (void)presentNowPlayingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTPlayerController_iOS *)self _nowPlayingRootViewController];
  [v4 presentNowPlayingWithAnimated:v3 completion:0];
}

- (BOOL)isTargetPlaying
{
  v2 = +[PodcastsPlayerAdapter sharedInstance];
  unsigned __int8 v3 = [v2 isTargetPlaying];

  return v3;
}

- (id)playerPath
{
  v2 = +[PodcastsPlayerAdapter sharedInstance];
  unsigned __int8 v3 = [v2 playbackPlayerPath];

  return v3;
}

- (void)setPlayerRoute:(id)a3
{
  id v3 = a3;
  id v4 = +[PodcastsPlayerAdapter sharedInstance];
  [v4 setRoute:v3];
}

- (BOOL)volumeControlAvailable
{
  v2 = [(MTPlayerController_iOS *)self volumeController];
  unsigned __int8 v3 = [v2 isVolumeControlAvailable];

  return v3;
}

- (void)increaseVolume
{
  id v3 = [(MTPlayerController_iOS *)self volumeController];
  LODWORD(v2) = 1031798784;
  [v3 adjustVolumeValue:v2];
}

- (void)decreaseVolume
{
  id v3 = [(MTPlayerController_iOS *)self volumeController];
  LODWORD(v2) = -1115684864;
  [v3 adjustVolumeValue:v2];
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  -[MTPlayerController_iOS setOnScreenForVolumeDisplay:](self, "setOnScreenForVolumeDisplay:", 1, a4);
  [(MTPlayerController *)self setIsPlayingFullScreenVideo:1];
  id v5 = +[MPVolumeHUDController sharedInstance];
  [v5 setNeedsUpdate];
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  -[MTPlayerController setIsPlayingFullScreenVideo:](self, "setIsPlayingFullScreenVideo:", 0, a4);
  [(MTPlayerController_iOS *)self setOnScreenForVolumeDisplay:0];
  id v5 = +[MPVolumeHUDController sharedInstance];
  [v5 setNeedsUpdate];
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [(MTPlayerController_iOS *)self _nowPlayingRootViewController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001325DC;
  v8[3] = &unk_10054D6E8;
  id v9 = v5;
  id v7 = v5;
  [v6 presentNowPlayingWithAnimated:1 completion:v8];
}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  NSLog(@"PIP Started", a2, a3);
  id v4 = [(MTPlayerController_iOS *)self _nowPlayingRootViewController];
  [v4 dismissNowPlayingWithAnimated:1 completion:0];
}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
}

- (id)_nowPlayingRootViewController
{
  double v2 = +[UIApplication sharedApplication];
  id v3 = [v2 delegate];
  id v4 = [v3 window];
  id v5 = [v4 rootViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = [v5 viewControllers];
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v15;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v6 = v12;

              goto LABEL_15;
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    id v6 = 0;
  }
LABEL_15:

  return v6;
}

- (BOOL)isOnScreenForVolumeDisplay
{
  return self->_onScreenForVolumeDisplay;
}

- (void)setOnScreenForVolumeDisplay:(BOOL)a3
{
  self->_onScreenForVolumeDisplay = a3;
}

- (void)setVolumeAudioCategory:(id)a3
{
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeController, 0);

  objc_storeStrong((id *)&self->_volumeAudioCategory, 0);
}

@end