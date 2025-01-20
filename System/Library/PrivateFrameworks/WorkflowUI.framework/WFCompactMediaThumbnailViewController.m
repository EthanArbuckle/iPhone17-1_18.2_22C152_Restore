@interface WFCompactMediaThumbnailViewController
- (AVPlayerItem)playerItem;
- (BOOL)contentHeightLikelyToChange;
- (WFCompactMediaThumbnailViewController)initWithAVPlayerItem:(id)a3;
- (double)contentHeightForWidth:(double)a3;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation WFCompactMediaThumbnailViewController

- (void).cxx_destruct
{
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)WFMediaThumbnailPresentationSizeContext == a6)
  {
    [(WFCompactThumbnailViewController *)self invalidateContentSize];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFCompactMediaThumbnailViewController;
    -[WFCompactMediaThumbnailViewController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (double)contentHeightForWidth:(double)a3
{
  v4 = [(WFCompactMediaThumbnailViewController *)self playerItem];
  [v4 presentationSize];
  double v6 = v5;
  double v8 = v7;

  if (v6 == *MEMORY[0x263F001B0] && v8 == *(double *)(MEMORY[0x263F001B0] + 8)) {
    return 200.0;
  }
  double v10 = 0.0;
  if (v6 > 0.0 && v8 > 0.0) {
    double v10 = v8 / v6;
  }
  return v10 * a3;
}

- (BOOL)contentHeightLikelyToChange
{
  return 1;
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)WFCompactMediaThumbnailViewController;
  [(WFCompactMediaThumbnailViewController *)&v10 loadView];
  id v3 = objc_alloc_init(MEMORY[0x263EFA9C8]);
  v4 = (void *)MEMORY[0x263EFA7F0];
  double v5 = [(WFCompactMediaThumbnailViewController *)self playerItem];
  double v6 = [v4 playerWithPlayerItem:v5];
  [v3 setPlayer:v6];

  [v3 setOverrideParentApplicationDisplayIdentifier:*MEMORY[0x263F855B8]];
  [v3 setRequiresLinearPlayback:0];
  [(WFCompactMediaThumbnailViewController *)self addChildViewController:v3];
  double v7 = [v3 view];
  double v8 = [(WFCompactMediaThumbnailViewController *)self view];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");

  [v7 setAutoresizingMask:18];
  v9 = [(WFCompactMediaThumbnailViewController *)self view];
  [v9 addSubview:v7];

  [v3 didMoveToParentViewController:self];
}

- (void)dealloc
{
  id v3 = [(WFCompactMediaThumbnailViewController *)self playerItem];
  [v3 removeObserver:self forKeyPath:@"presentationSize" context:WFMediaThumbnailPresentationSizeContext];

  v4.receiver = self;
  v4.super_class = (Class)WFCompactMediaThumbnailViewController;
  [(WFCompactMediaThumbnailViewController *)&v4 dealloc];
}

- (WFCompactMediaThumbnailViewController)initWithAVPlayerItem:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCompactMediaThumbnailViewController;
  double v6 = [(WFCompactMediaThumbnailViewController *)&v10 initWithNibName:0 bundle:0];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playerItem, a3);
    [v5 addObserver:v7 forKeyPath:@"presentationSize" options:0 context:WFMediaThumbnailPresentationSizeContext];
    double v8 = v7;
  }

  return v7;
}

@end