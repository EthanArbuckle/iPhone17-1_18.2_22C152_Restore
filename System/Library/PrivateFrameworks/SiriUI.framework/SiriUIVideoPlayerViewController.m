@interface SiriUIVideoPlayerViewController
- (BOOL)shouldPlayHighResolutionContent;
- (SiriUIVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SiriUIVideoPlayerViewControllerDelegate)videoPlayerControllerDelegate;
- (void)_playbackDidFinish:(id)a3;
- (void)_registerObservers;
- (void)_removeObservers;
- (void)_restoreAudioPlaybackCategoryAndOptions;
- (void)_updateAudioSessionCategory;
- (void)dealloc;
- (void)doneButtonTapped:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setPlayer:(id)a3;
- (void)setVideoPlayerControllerDelegate:(id)a3;
- (void)shouldPlayHighResolutionContent;
@end

@implementation SiriUIVideoPlayerViewController

- (SiriUIVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SiriUIVideoPlayerViewController;
  v4 = [(SiriUIVideoPlayerViewController *)&v8 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_observingPlayerStatus = 0;
    v4->_observingItemStatus = 0;
    v4->_observingPlayback = 0;
    v4->_observingViewController = 0;
    v4->_playerStatusObserverContext = &v4->_observingPlayerStatus;
    v4->_itemStatusObserverContext = &v4->_observingItemStatus;
    v6 = [(SiriUIVideoPlayerViewController *)v4 player];

    if (v6) {
      [(SiriUIVideoPlayerViewController *)v5 _registerObservers];
    }
  }
  return v5;
}

- (void)setPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUIVideoPlayerViewController *)self player];

  if (v5 != v4)
  {
    v6 = [(SiriUIVideoPlayerViewController *)self player];

    if (v6)
    {
      [(SiriUIVideoPlayerViewController *)self _removeObservers];
      [(SiriUIVideoPlayerViewController *)self _restoreAudioPlaybackCategoryAndOptions];
    }
    v7.receiver = self;
    v7.super_class = (Class)SiriUIVideoPlayerViewController;
    [(SiriUIVideoPlayerViewController *)&v7 setPlayer:v4];
    [(SiriUIVideoPlayerViewController *)self _registerObservers];
  }
}

- (void)dealloc
{
  [(SiriUIVideoPlayerViewController *)self _removeObservers];
  v3.receiver = self;
  v3.super_class = (Class)SiriUIVideoPlayerViewController;
  [(SiriUIVideoPlayerViewController *)&v3 dealloc];
}

- (void)doneButtonTapped:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  v6 = [v4 defaultCenter];
  objc_super v7 = [MEMORY[0x263F089F8] notificationWithName:@"AVPlayerViewControllerUserDidTapDoneButtonNotification" object:self];
  [v6 postNotification:v7];

  v8.receiver = self;
  v8.super_class = (Class)SiriUIVideoPlayerViewController;
  [(SiriUIVideoPlayerViewController *)&v8 doneButtonTapped:v5];
}

- (BOOL)shouldPlayHighResolutionContent
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double Width = CGRectGetWidth(v18);
  [v2 scale];
  if (Width * v4 <= 320.0)
  {
    char v12 = 0;
  }
  else
  {
    sockaddr address = (sockaddr)xmmword_22323E600;
    id v5 = SCNetworkReachabilityCreateWithAddress(0, &address);
    SCNetworkReachabilityFlags flags = 0;
    SCNetworkReachabilityGetFlags(v5, &flags);
    CFRelease(v5);
    if ((~flags & 0x40002) != 0)
    {
      char v12 = 1;
    }
    else
    {
      v6 = (void *)[objc_alloc(MEMORY[0x263F02D30]) initWithQueue:0];
      id v14 = 0;
      objc_super v7 = [v6 getDataStatus:0 error:&v14];
      id v8 = v14;
      if (v7)
      {
        v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D658028];
        v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "indicator"));
        char v11 = [v9 containsObject:v10];

        char v12 = v11 ^ 1;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
          -[SiriUIVideoPlayerViewController shouldPlayHighResolutionContent]();
        }
        char v12 = 1;
      }
    }
  }

  return v12;
}

- (void)_playbackDidFinish:(id)a3
{
  double v4 = [(SiriUIVideoPlayerViewController *)self videoPlayerControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SiriUIVideoPlayerViewController *)self videoPlayerControllerDelegate];
    [v6 playbackDidFinishForVideoPlayerViewController:self];

    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"SiriUIVideoPlaybackDidFinishNotification" object:self];
  }
}

- (void)_registerObservers
{
  if (!self->_observingPlayerStatus)
  {
    objc_super v3 = [(SiriUIVideoPlayerViewController *)self player];
    double v4 = NSStringFromSelector(sel_status);
    [v3 addObserver:self forKeyPath:v4 options:1 context:self->_playerStatusObserverContext];

    self->_observingPlayerStatus = 1;
  }
  char v5 = [(SiriUIVideoPlayerViewController *)self player];
  id v10 = [v5 currentItem];

  if (!self->_observingItemStatus)
  {
    v6 = NSStringFromSelector(sel_status);
    [v10 addObserver:self forKeyPath:v6 options:1 context:self->_itemStatusObserverContext];

    self->_observingItemStatus = 1;
  }
  if (!self->_observingPlayback)
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:self selector:sel__playbackDidFinish_ name:*MEMORY[0x263EFA050] object:v10];

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel__playbackDidFinish_ name:*MEMORY[0x263EFA060] object:v10];

    self->_observingPlayback = 1;
  }
  if (!self->_observingViewController)
  {
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:self selector:sel__playbackDidFinish_ name:@"AVPlayerViewControllerUserDidTapDoneButtonNotification" object:self];

    self->_observingViewController = 1;
  }
}

- (void)_removeObservers
{
  if (self->_observingPlayerStatus)
  {
    objc_super v3 = [(SiriUIVideoPlayerViewController *)self player];
    double v4 = [v3 currentItem];
    char v5 = NSStringFromSelector(sel_status);
    [v4 removeObserver:self forKeyPath:v5 context:self->_itemStatusObserverContext];

    self->_observingPlayerStatus = 0;
  }
  if (self->_observingItemStatus)
  {
    v6 = [(SiriUIVideoPlayerViewController *)self player];
    id v7 = NSStringFromSelector(sel_status);
    [v6 removeObserver:self forKeyPath:v7 context:self->_playerStatusObserverContext];

    self->_observingItemStatus = 0;
  }
  if (self->_observingPlayback)
  {
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v9 = *MEMORY[0x263EFA050];
    id v10 = [(SiriUIVideoPlayerViewController *)self player];
    char v11 = [v10 currentItem];
    [v8 removeObserver:self name:v9 object:v11];

    char v12 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v13 = *MEMORY[0x263EFA060];
    id v14 = [(SiriUIVideoPlayerViewController *)self player];
    v15 = [v14 currentItem];
    [v12 removeObserver:self name:v13 object:v15];

    self->_observingPlayback = 0;
  }
  if (self->_observingViewController)
  {
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 removeObserver:self name:@"AVPlayerViewControllerUserDidTapDoneButtonNotification" object:self];

    self->_observingViewController = 0;
  }
}

- (void)_updateAudioSessionCategory
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_2231EF000, v0, v1, "%s Unable to set audio session category from %{public}@ to AVAudioSessionCategoryPlayback: %{public}@", v2);
}

- (void)_restoreAudioPlaybackCategoryAndOptions
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2231EF000, v0, OS_LOG_TYPE_ERROR, "%s Expected audio session category to be AVAudioSessionCategoryPlayback, but was %{public}@; not changing post-trailer-playback",
    (uint8_t *)v1,
    0x16u);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (self->_playerStatusObserverContext == a6)
  {
    if ([v11 status] == 1)
    {
      [(SiriUIVideoPlayerViewController *)self _updateAudioSessionCategory];
      [v11 play];
      uint64_t v17 = [MEMORY[0x263F08A00] defaultCenter];
      CGRect v18 = v17;
      v19 = &SiriUIVideoPlaybackDidStartNotification;
      goto LABEL_10;
    }
  }
  else if (self->_itemStatusObserverContext == a6 && [v11 status] == 2)
  {
    uint64_t v13 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriUIVideoPlayerViewController observeValueForKeyPath:ofObject:change:context:](v13);
    }
    id v14 = [(SiriUIVideoPlayerViewController *)self videoPlayerControllerDelegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v16 = [(SiriUIVideoPlayerViewController *)self videoPlayerControllerDelegate];
      [v16 playbackDidFailForVideoPlayerViewController:self];

      uint64_t v17 = [MEMORY[0x263F08A00] defaultCenter];
      CGRect v18 = v17;
      v19 = &SiriUIVideoPlaybackDidFinishNotification;
LABEL_10:
      [v17 postNotificationName:*v19 object:self];
    }
  }
}

- (SiriUIVideoPlayerViewControllerDelegate)videoPlayerControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoPlayerControllerDelegate);
  return (SiriUIVideoPlayerViewControllerDelegate *)WeakRetained;
}

- (void)setVideoPlayerControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_videoPlayerControllerDelegate);
  objc_storeStrong((id *)&self->_savedAudioSessionCategory, 0);
}

- (void)shouldPlayHighResolutionContent
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2231EF000, v0, OS_LOG_TYPE_ERROR, "%s Unable to determine the current CTDataStatus: %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)observeValueForKeyPath:(os_log_t)log ofObject:change:context:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SiriUIVideoPlayerViewController observeValueForKeyPath:ofObject:change:context:]";
  _os_log_error_impl(&dword_2231EF000, log, OS_LOG_TYPE_ERROR, "%s Unable to play video: no media types are available", (uint8_t *)&v1, 0xCu);
}

@end