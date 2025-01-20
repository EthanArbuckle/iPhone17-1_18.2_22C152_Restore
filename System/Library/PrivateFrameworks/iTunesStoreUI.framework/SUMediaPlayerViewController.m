@interface SUMediaPlayerViewController
+ (BOOL)_URLIsITunesU:(id)a3;
+ (void)_sendPingRequestsForURLs:(id)a3 URLBagKey:(id)a4 playerItem:(id)a5;
+ (void)sendDownloadPingRequestsForMediaPlayerItem:(id)a3;
+ (void)sendPlaybackPingRequestsForMediaPlayerItem:(id)a3;
- (AVPlayerViewController)playerViewController;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (SUClientInterface)clientInterface;
- (SUMediaPlayerItem)mediaPlayerItem;
- (SUMediaPlayerViewController)init;
- (SUMediaPlayerViewController)initWithMediaPlayerItem:(id)a3;
- (id)_backgroundContainerView;
- (id)copyScriptViewController;
- (void)_dequeueOperation:(id)a3;
- (void)_enqueueOperation:(id)a3;
- (void)_loadBackgroundImage;
- (void)_playbackFinishedNotification:(id)a3;
- (void)_prepareMediaItem;
- (void)_setIsActivePlayer:(BOOL)a3;
- (void)_showBackgroundImage:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)operationFinished:(id)a3;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)setClientInterface:(id)a3;
- (void)setPlayerViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUMediaPlayerViewController

- (SUMediaPlayerViewController)init
{
  return [(SUMediaPlayerViewController *)self initWithMediaPlayerItem:0];
}

- (SUMediaPlayerViewController)initWithMediaPlayerItem:(id)a3
{
  if (![a3 URL]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Must play a media item with a URL"];
  }
  v10.receiver = self;
  v10.super_class = (Class)SUMediaPlayerViewController;
  v5 = [(SUMediaPlayerViewController *)&v10 init];
  if (v5)
  {
    v5->_mediaItem = (SUMediaPlayerItem *)[a3 copy];
    [(SUMediaPlayerViewController *)v5 setModalPresentationStyle:0];
    v6 = (AVPlayerViewController *)objc_opt_new();
    v5->_playerViewController = v6;
    [(AVPlayerViewController *)v6 setDelegate:v5];
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFA7F0]), "initWithURL:", -[SUMediaPlayerItem URL](v5->_mediaItem, "URL"));
    [(AVPlayerViewController *)v5->_playerViewController setPlayer:v7];
    [v7 addObserver:v5 forKeyPath:@"currentItem.playbackLikelyToKeepUp" options:0 context:0];

    v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__playbackFinishedNotification_, *MEMORY[0x263EFA050], -[AVPlayer currentItem](-[AVPlayerViewController player](-[SUMediaPlayerViewController playerViewController](v5, "playerViewController"), "player"), "currentItem"));
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [[(AVPlayerViewController *)[(SUMediaPlayerViewController *)self playerViewController] player] removeObserver:self forKeyPath:@"currentItem.playbackLikelyToKeepUp"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  operations = self->_operations;
  uint64_t v4 = [(NSMutableArray *)operations countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(operations);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v8 setDelegate:0];
        [v8 cancel];
      }
      uint64_t v5 = [(NSMutableArray *)operations countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)SUMediaPlayerViewController;
  [(SUMediaPlayerViewController *)&v9 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"currentItem.playbackLikelyToKeepUp", a4, a5, a6)
    && [(AVPlayerItem *)[[(AVPlayerViewController *)[(SUMediaPlayerViewController *)self playerViewController] player] currentItem] isPlaybackLikelyToKeepUp])
  {
    v7 = [(AVPlayerViewController *)[(SUMediaPlayerViewController *)self playerViewController] player];
    [(AVPlayer *)v7 play];
  }
}

+ (void)sendDownloadPingRequestsForMediaPlayerItem:(id)a3
{
  uint64_t v5 = [a3 downloadPingURLs];

  [a1 _sendPingRequestsForURLs:v5 URLBagKey:@"podcast-get-episode" playerItem:a3];
}

+ (void)sendPlaybackPingRequestsForMediaPlayerItem:(id)a3
{
  uint64_t v5 = [a3 playbackPingURLs];

  [a1 _sendPingRequestsForURLs:v5 URLBagKey:@"podcast-play-episode" playerItem:a3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SUMediaPlayerViewController;
  [(SUMediaPlayerViewController *)&v3 viewDidLoad];
  [(AVPlayerViewController *)[(SUMediaPlayerViewController *)self playerViewController] showFullScreenPresentationFromView:[(SUMediaPlayerViewController *)self view] completion:0];
}

- (id)copyScriptViewController
{
  objc_super v3 = objc_alloc_init(SUScriptMediaPlayerViewController);
  [(SUScriptViewController *)v3 setNativeViewController:self];
  return v3;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
  if (v5 != 1)
  {
    if ([[(AVPlayerViewController *)[(SUMediaPlayerViewController *)self playerViewController] player] isExternalPlaybackActive])
    {
      LOBYTE(v5) = (unint64_t)(a3 - 1) < 2;
    }
    else
    {
      LOBYTE(v5) = (unint64_t)(a3 - 3) < 2;
    }
  }
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_playerState)
  {
    self->_playerState = 1;
    [(SUMediaPlayerViewController *)self _prepareMediaItem];
  }
  [(SUMediaPlayerViewController *)self _setIsActivePlayer:1];
  v5.receiver = self;
  v5.super_class = (Class)SUMediaPlayerViewController;
  [(SUMediaPlayerViewController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUClientInterface *)[(SUMediaPlayerViewController *)self clientInterface] _mediaPlayerViewControllerWillDismiss:self animated:a3];
  v5.receiver = self;
  v5.super_class = (Class)SUMediaPlayerViewController;
  [(SUMediaPlayerViewController *)&v5 viewWillDisappear:v3];
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = +[SUDialogManager newDialogWithError:a4];
    [[(AVPlayerViewController *)[(SUMediaPlayerViewController *)self playerViewController] player] pause];
    [(SUClientInterface *)[(SUMediaPlayerViewController *)self clientInterface] _presentDialog:v7];
    [(UIViewController *)self dismissAnimated:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIView *)self->_backgroundContainerView removeFromSuperview];
    }
  }

  [(SUMediaPlayerViewController *)self _dequeueOperation:a3];
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
}

- (void)operationFinished:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_playerState = 2;
    [[(AVPlayerViewController *)[(SUMediaPlayerViewController *)self playerViewController] player] play];
    [(id)objc_opt_class() sendPlaybackPingRequestsForMediaPlayerItem:self->_mediaItem];
  }

  [(SUMediaPlayerViewController *)self _dequeueOperation:a3];
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __106__SUMediaPlayerViewController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v4[3] = &unk_264814D10;
  v4[4] = self;
  [a4 animateAlongsideTransition:0 completion:v4];
}

uint64_t __106__SUMediaPlayerViewController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAnimated:0];
}

- (void)_playbackFinishedNotification:(id)a3
{
}

+ (void)_sendPingRequestsForURLs:(id)a3 URLBagKey:(id)a4 playerItem:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([a3 count])
  {
    objc_super v9 = (void *)[MEMORY[0x263F894E0] mainQueue];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v9, "addOperation:", objc_msgSend(MEMORY[0x263F89528], "pingOperationWithUrl:", *(void *)(*((void *)&v18 + 1) + 8 * i)));
        }
        uint64_t v11 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v14 = [a5 itemIdentifier];
    if (v14)
    {
      uint64_t v15 = v14;
      if ([a5 itemType] == 1007
        && (objc_msgSend(a1, "_URLIsITunesU:", objc_msgSend(a5, "URL")) & 1) == 0)
      {
        v16 = (void *)[MEMORY[0x263F894E0] mainQueue];
        uint64_t v17 = [MEMORY[0x263F89528] itemPingOperationWithIdentifier:v15 urlBagKey:a4];
        [v16 addOperation:v17];
      }
    }
  }
}

+ (BOOL)_URLIsITunesU:(id)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"deimos.*\\.apple\\.com" options:1 error:0];
  objc_super v5 = (void *)[a3 host];
  uint64_t v6 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_backgroundContainerView
{
  id result = self->_backgroundContainerView;
  if (!result)
  {
    uint64_t v4 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    self->_backgroundContainerView = v4;
    [(UIView *)v4 setAutoresizingMask:18];
    -[UIView setBackgroundColor:](self->_backgroundContainerView, "setBackgroundColor:", [MEMORY[0x263F1C550] blackColor]);
    return self->_backgroundContainerView;
  }
  return result;
}

- (void)_dequeueOperation:(id)a3
{
  [a3 setDelegate:0];
  operations = self->_operations;

  [(NSMutableArray *)operations removeObjectIdenticalTo:a3];
}

- (void)_enqueueOperation:(id)a3
{
  operations = self->_operations;
  if (!operations)
  {
    operations = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_operations = operations;
  }
  [(NSMutableArray *)operations addObject:a3];
  [a3 setDelegate:self];
  [a3 setShouldMessageMainThread:1];
  uint64_t v6 = (void *)[MEMORY[0x263F894E0] mainQueue];

  [v6 addOperation:a3];
}

- (void)_loadBackgroundImage
{
  BOOL v3 = [(SUMediaPlayerItem *)self->_mediaItem backgroundImageURL];
  if (v3)
  {
    uint64_t v4 = v3;
    id v7 = objc_alloc_init(MEMORY[0x263F89528]);
    objc_super v5 = objc_alloc_init(SUImageDataProvider);
    -[SUImageDataProvider setFillColor:](v5, "setFillColor:", [MEMORY[0x263F1C550] blackColor]);
    [v7 setDataProvider:v5];

    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:v4];
    [v7 setRequestProperties:v6];

    [(SUMediaPlayerViewController *)self _enqueueOperation:v7];
  }
}

- (void)_prepareMediaItem
{
  BOOL v3 = [[SUPrepareMediaItemOperation alloc] initWithMediaPlayerItem:self->_mediaItem];
  [(SUMediaPlayerViewController *)self _enqueueOperation:v3];
}

- (void)_setIsActivePlayer:(BOOL)a3
{
  id v5 = +[SUClientApplicationController sharedController];
  uint64_t v6 = v5;
  if (!a3)
  {
    if ((SUMediaPlayerViewController *)[v5 _activeMediaPlayer] != self) {
      return;
    }
    id v7 = self;
    self = 0;
  }

  [v6 _setActiveMediaPlayer:self];
}

- (void)_showBackgroundImage:(id)a3
{
  if (a3)
  {
    id v5 = [(SUMediaPlayerViewController *)self _backgroundContainerView];
    id v15 = (id)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:a3];
    [v15 setAutoresizingMask:45];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    [v15 frame];
    float v11 = (v7 - v10) * 0.5;
    float v13 = (v9 - v12) * 0.5;
    objc_msgSend(v15, "setFrame:", floorf(v11), floorf(v13));
    [(UIView *)self->_backgroundContainerView addSubview:v15];
  }
  else
  {
    backgroundContainerView = self->_backgroundContainerView;
    [(UIView *)backgroundContainerView removeFromSuperview];
  }
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
}

- (SUMediaPlayerItem)mediaPlayerItem
{
  return self->_mediaItem;
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
}

@end