@interface TVPVideoView
+ (id)preservedVideoViewsForPlayer:(id)a3 identifier:(id)a4;
+ (void)_playerStateDidChange:(id)a3;
+ (void)_purgePreservedVideoViewsForPlayer:(id)a3;
+ (void)initialize;
+ (void)preserveVideoViewForReuse:(id)a3 identifier:(id)a4;
- (BOOL)isPrimarySubtitleDisplayer;
- (BOOL)isReadyForDisplay;
- (TVPAVFPlayback)player;
- (TVPPlayerLayerView)playerLayerView;
- (TVPVideoView)initWithFrame:(CGRect)a3;
- (UIImageView)stillImageView;
- (UILabel)debugLabel;
- (id)AVPlayer;
- (int64_t)videoGravity;
- (void)_playerStillImageDidChange:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAVPlayer:(id)a3;
- (void)setIsPrimarySubtitleDisplayer:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerLayerView:(id)a3;
- (void)setReadyForDisplay:(BOOL)a3;
- (void)setStillImageView:(id)a3;
- (void)setVideoGravity:(int64_t)a3;
@end

@implementation TVPVideoView

+ (void)initialize
{
  if (initialize_onceToken_4 != -1) {
    dispatch_once(&initialize_onceToken_4, &__block_literal_global_9);
  }
}

uint64_t __26__TVPVideoView_initialize__block_invoke()
{
  sPreservedVideoViews = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

+ (void)preserveVideoViewForReuse:(id)a3 identifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 player];
  v9 = v8;
  if (!v6) {
    goto LABEL_19;
  }
  if (!v7) {
    goto LABEL_19;
  }
  if (!v8) {
    goto LABEL_19;
  }
  v10 = [v8 state];
  v11 = +[TVPPlaybackState stopped];

  if (v10 == v11) {
    goto LABEL_19;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  p_vtable = &OBJC_METACLASS___TVPPlaybackReportingEventCollection.vtable;
  v13 = objc_msgSend((id)sPreservedVideoViews, "allKeys", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = [a1 preservedVideoViewsForPlayer:v9 identifier:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        v16 += [v19 count];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);

    p_vtable = (void **)(&OBJC_METACLASS___TVPPlaybackReportingEventCollection + 24);
    if (v16) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v20 = [MEMORY[0x263F08A00] defaultCenter];
  [v20 addObserver:a1 selector:sel__playerStateDidChange_ name:@"TVPPlaybackStateDidChangeNotification" object:v9];

LABEL_16:
  id v21 = [p_vtable[302] objectForKey:v7];
  if (!v21) {
    id v21 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  [v21 addObject:v6];
  [p_vtable[302] setObject:v21 forKey:v7];

LABEL_19:
}

+ (id)preservedVideoViewsForPlayer:(id)a3 identifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v5 && v6)
  {
    v8 = [(id)sPreservedVideoViews objectForKey:v6];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v14 = [v13 player];

          if (v14 == v5) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  return v7;
}

- (void)setVideoGravity:(int64_t)a3
{
  self->_videoGravity = a3;
  id v9 = (id)*MEMORY[0x263EF9C70];
  if (a3 == 2)
  {
    id v5 = (id *)MEMORY[0x263EF9C68];
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    id v5 = (id *)MEMORY[0x263EF9C78];
  }
  id v6 = *v5;

  id v9 = v6;
LABEL_6:
  id v7 = [(TVPVideoView *)self playerLayerView];
  v8 = [v7 avPlayerLayer];
  [v8 setVideoGravity:v9];
}

- (int64_t)videoGravity
{
  v2 = [(TVPVideoView *)self playerLayerView];
  v3 = [v2 avPlayerLayer];
  v4 = [v3 videoGravity];

  if ([v4 isEqualToString:*MEMORY[0x263EF9C68]])
  {
    int64_t v5 = 2;
  }
  else if ([v4 isEqualToString:*MEMORY[0x263EF9C70]])
  {
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = [v4 isEqualToString:*MEMORY[0x263EF9C78]];
  }

  return v5;
}

+ (void)_playerStateDidChange:(id)a3
{
  id v7 = [a3 object];
  v4 = [v7 state];
  int64_t v5 = +[TVPPlaybackState stopped];

  if (v4 == v5)
  {
    [a1 _purgePreservedVideoViewsForPlayer:v7];
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:a1 name:@"TVPPlaybackStateDidChangeNotification" object:v7];
  }
}

+ (void)_purgePreservedVideoViewsForPlayer:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [(id)sPreservedVideoViews allValues];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v8 = (void *)[v7 copy];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v17 + 1) + 8 * j);
              id v14 = [v13 player];

              if (v14 == v3) {
                [v7 removeObject:v13];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v10);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }
}

- (TVPVideoView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TVPVideoView;
  id v3 = -[TVPVideoView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_isPrimarySubtitleDisplayer = 1;
    uint64_t v5 = [TVPPlayerLayerView alloc];
    [(TVPVideoView *)v4 bounds];
    uint64_t v6 = -[TVPPlayerLayerView initWithFrame:](v5, "initWithFrame:");
    playerLayerView = v4->_playerLayerView;
    v4->_playerLayerView = (TVPPlayerLayerView *)v6;

    [(TVPPlayerLayerView *)v4->_playerLayerView addObserver:v4 forKeyPath:@"avPlayerLayer.readyForDisplay" options:0 context:AVPlayerLayerReadyForDisplayKVOContext];
    [(TVPPlayerLayerView *)v4->_playerLayerView setAutoresizingMask:18];
    v8 = v4->_playerLayerView;
    uint64_t v9 = [MEMORY[0x263F1C550] blackColor];
    [(TVPPlayerLayerView *)v8 setBackgroundColor:v9];

    [(TVPVideoView *)v4 addSubview:v4->_playerLayerView];
    [(TVPVideoView *)v4 setClipsToBounds:1];
  }
  return v4;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(TVPPlayerLayerView *)self->_playerLayerView removeObserver:self forKeyPath:@"avPlayerLayer.readyForDisplay" context:AVPlayerLayerReadyForDisplayKVOContext];
  v4.receiver = self;
  v4.super_class = (Class)TVPVideoView;
  [(TVPVideoView *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)AVPlayerLayerReadyForDisplayKVOContext == a6)
  {
    id v7 = [(TVPPlayerLayerView *)self->_playerLayerView avPlayerLayer];
    -[TVPVideoView setReadyForDisplay:](self, "setReadyForDisplay:", [v7 isReadyForDisplay]);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TVPVideoView;
    -[TVPVideoView observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setPlayer:(id)a3
{
  uint64_t v5 = (TVPAVFPlayback *)a3;
  p_player = &self->_player;
  player = self->_player;
  v12 = v5;
  if (player != v5)
  {
    if (player)
    {
      objc_super v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 removeObserver:self name:@"TVPPlayerStillImageDidChangeNotification" object:*p_player];

      uint64_t v9 = *p_player;
    }
    else
    {
      uint64_t v9 = 0;
    }
    [(TVPAVFPlayback *)v9 removeWeakReferenceToVideoView:self];
    objc_storeStrong((id *)&self->_player, a3);
    [(TVPAVFPlayback *)*p_player addWeakReferenceToVideoView:self];
    uint64_t v10 = [(TVPAVFPlayback *)*p_player avPlayer];
    [(TVPVideoView *)self setAVPlayer:v10];

    if (*p_player)
    {
      objc_super v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 addObserver:self selector:sel__playerStillImageDidChange_ name:@"TVPPlayerStillImageDidChangeNotification" object:*p_player];
    }
  }
}

- (void)setIsPrimarySubtitleDisplayer:(BOOL)a3
{
  self->_isPrimarySubtitleDisplayer = a3;
  if (!a3)
  {
    id v3 = [(TVPPlayerLayerView *)self->_playerLayerView avPlayerLayer];
    [v3 setLanczosFilterDownscalingEnabled:1];
    [v3 setLanczosFilterDownscaleFactor:3];
  }
}

- (void)setAVPlayer:(id)a3
{
  playerLayerView = self->_playerLayerView;
  id v4 = a3;
  id v5 = [(TVPPlayerLayerView *)playerLayerView avPlayerLayer];
  [v5 setPlayer:v4];
}

- (id)AVPlayer
{
  v2 = [(TVPPlayerLayerView *)self->_playerLayerView avPlayerLayer];
  id v3 = [v2 player];

  return v3;
}

- (void)_playerStillImageDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v10 = [v4 objectForKey:@"TVPPlayerStillImageKey"];

  id v5 = [(TVPVideoView *)self stillImageView];
  if (v10)
  {
    if (!v5)
    {
      id v6 = objc_alloc(MEMORY[0x263F1C6D0]);
      [(TVPVideoView *)self bounds];
      id v5 = objc_msgSend(v6, "initWithFrame:");
      id v7 = [MEMORY[0x263F1C550] blackColor];
      [v5 setBackgroundColor:v7];

      [v5 setContentMode:1];
      [(TVPVideoView *)self setStillImageView:v5];
      objc_super v8 = [(TVPVideoView *)self playerLayerView];
      [(TVPVideoView *)self insertSubview:v5 aboveSubview:v8];
    }
    uint64_t v9 = [(TVPVideoView *)self stillImageView];
    [v9 setImage:v10];
  }
  else
  {
    [v5 removeFromSuperview];

    [(TVPVideoView *)self setStillImageView:0];
  }
}

- (TVPAVFPlayback)player
{
  return self->_player;
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (BOOL)isPrimarySubtitleDisplayer
{
  return self->_isPrimarySubtitleDisplayer;
}

- (BOOL)isReadyForDisplay
{
  return self->_readyForDisplay;
}

- (void)setReadyForDisplay:(BOOL)a3
{
  self->_readyForDisplay = a3;
}

- (TVPPlayerLayerView)playerLayerView
{
  return self->_playerLayerView;
}

- (void)setPlayerLayerView:(id)a3
{
}

- (UIImageView)stillImageView
{
  return self->_stillImageView;
}

- (void)setStillImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillImageView, 0);
  objc_storeStrong((id *)&self->_playerLayerView, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end