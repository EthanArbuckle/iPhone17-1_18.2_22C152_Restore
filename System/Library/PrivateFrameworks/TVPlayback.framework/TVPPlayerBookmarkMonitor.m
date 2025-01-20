@interface TVPPlayerBookmarkMonitor
- (BOOL)playerHasFinishedLoading;
- (NSTimer)bookmarkPeriodicSaveTimer;
- (TVPPlayback)player;
- (TVPPlayerBookmarkMonitor)initWithPlayer:(id)a3;
- (void)_bookmarkPeriodicSaveTimerFired:(id)a3;
- (void)_playerCurrentMediaItemWillChange:(id)a3;
- (void)_playerErrorDidOccur:(id)a3;
- (void)_playerStateWillChange:(id)a3;
- (void)_updateBookmarkTimeForMediaItem:(id)a3 player:(id)a4 playbackOfMediaItemIsEnding:(BOOL)a5;
- (void)_updatePlayCountForMediaItem:(id)a3 player:(id)a4;
- (void)dealloc;
- (void)setBookmarkPeriodicSaveTimer:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerHasFinishedLoading:(BOOL)a3;
@end

@implementation TVPPlayerBookmarkMonitor

- (TVPPlayerBookmarkMonitor)initWithPlayer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPPlayerBookmarkMonitor;
  v5 = [(TVPPlayerBookmarkMonitor *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_player, v4);
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v6 selector:sel__playerStateWillChange_ name:@"TVPPlaybackStateWillChangeNotification" object:v4];
    [v7 addObserver:v6 selector:sel__playerCurrentMediaItemWillChange_ name:@"TVPPlaybackCurrentMediaItemWillChangeNotification" object:v4];
    [v7 addObserver:v6 selector:sel__playerErrorDidOccur_ name:@"TVPPlaybackErrorNotification" object:v4];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVPPlayerBookmarkMonitor;
  [(TVPPlayerBookmarkMonitor *)&v4 dealloc];
}

- (void)_playerStateWillChange:(id)a3
{
  id v4 = a3;
  id v22 = [v4 object];
  v5 = [v22 currentMediaItem];
  v6 = [v4 userInfo];

  v7 = [v6 objectForKey:@"TVPPlaybackStateNewStateKey"];
  uint64_t v8 = +[TVPPlaybackState playing];
  if (v7 == (void *)v8)
  {
  }
  else
  {
    objc_super v9 = (void *)v8;
    v10 = +[TVPPlaybackState paused];

    if (v7 != v10)
    {
      if (!v5) {
        goto LABEL_16;
      }
      goto LABEL_7;
    }
  }
  [(TVPPlayerBookmarkMonitor *)self setPlayerHasFinishedLoading:1];
  if (!v5) {
    goto LABEL_16;
  }
LABEL_7:
  uint64_t v11 = +[TVPPlaybackState stopped];
  if (v7 == (void *)v11)
  {
  }
  else
  {
    v12 = (void *)v11;
    v13 = +[TVPPlaybackState paused];

    if (v7 != v13) {
      goto LABEL_16;
    }
  }
  v14 = +[TVPPlaybackState stopped];

  if ([v5 hasTrait:@"TVPMediaItemTraitSupportsBookmarks"]) {
    [(TVPPlayerBookmarkMonitor *)self _updateBookmarkTimeForMediaItem:v5 player:v22 playbackOfMediaItemIsEnding:v7 == v14];
  }
  if ([v5 hasTrait:@"TVPMediaItemTraitSupportsPlayCounts"] && v7 == v14) {
    [(TVPPlayerBookmarkMonitor *)self _updatePlayCountForMediaItem:v5 player:v22];
  }
LABEL_16:
  v15 = +[TVPPlaybackState stopped];

  if (v7 == v15) {
    [(TVPPlayerBookmarkMonitor *)self setPlayerHasFinishedLoading:0];
  }
  v16 = +[TVPPlaybackState playing];

  v17 = [(TVPPlayerBookmarkMonitor *)self bookmarkPeriodicSaveTimer];
  v18 = v17;
  if (v7 != v16)
  {
    [(TVPPlayerBookmarkMonitor *)self setBookmarkPeriodicSaveTimer:0];
    [v18 invalidate];
LABEL_20:

    goto LABEL_22;
  }

  if (!v18)
  {
    v19 = [v5 mediaItemMetadataForProperty:@"TVPMediaItemMetadataBookmarkSaveInterval"];
    v18 = v19;
    if (v19) {
      [v19 doubleValue];
    }
    else {
      double v20 = 300.0;
    }
    v21 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__bookmarkPeriodicSaveTimerFired_ selector:0 userInfo:1 repeats:v20];
    [(TVPPlayerBookmarkMonitor *)self setBookmarkPeriodicSaveTimer:v21];

    goto LABEL_20;
  }
LABEL_22:
}

- (void)_playerCurrentMediaItemWillChange:(id)a3
{
  id v7 = [a3 object];
  id v4 = [v7 currentMediaItem];
  if (v4)
  {
    v5 = [v7 state];
    v6 = +[TVPPlaybackState stopped];

    if (v5 != v6)
    {
      if ([v4 hasTrait:@"TVPMediaItemTraitSupportsBookmarks"]) {
        [(TVPPlayerBookmarkMonitor *)self _updateBookmarkTimeForMediaItem:v4 player:v7 playbackOfMediaItemIsEnding:1];
      }
      if ([v4 hasTrait:@"TVPMediaItemTraitSupportsPlayCounts"]) {
        [(TVPPlayerBookmarkMonitor *)self _updatePlayCountForMediaItem:v4 player:v7];
      }
    }
  }
  [(TVPPlayerBookmarkMonitor *)self setPlayerHasFinishedLoading:0];
}

- (void)_playerErrorDidOccur:(id)a3
{
  id v6 = [a3 object];
  id v4 = [v6 currentMediaItem];
  v5 = v4;
  if (v4)
  {
    if ([v4 hasTrait:@"TVPMediaItemTraitSupportsBookmarks"]) {
      [(TVPPlayerBookmarkMonitor *)self _updateBookmarkTimeForMediaItem:v5 player:v6 playbackOfMediaItemIsEnding:1];
    }
    if ([v5 hasTrait:@"TVPMediaItemTraitSupportsPlayCounts"]) {
      [(TVPPlayerBookmarkMonitor *)self _updatePlayCountForMediaItem:v5 player:v6];
    }
  }
}

- (void)_bookmarkPeriodicSaveTimerFired:(id)a3
{
  id v6 = [(TVPPlayerBookmarkMonitor *)self player];
  id v4 = [v6 currentMediaItem];
  v5 = v4;
  if (v4 && [v4 hasTrait:@"TVPMediaItemTraitSupportsBookmarks"]) {
    [(TVPPlayerBookmarkMonitor *)self _updateBookmarkTimeForMediaItem:v5 player:v6 playbackOfMediaItemIsEnding:0];
  }
}

- (void)_updateBookmarkTimeForMediaItem:(id)a3 player:(id)a4 playbackOfMediaItemIsEnding:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  if (objc_opt_respondsToSelector())
  {
    [v8 duration];
    double v10 = v9;
    BOOL v11 = v9 == 0.0 || v9 == 3.40282347e38;
    if (!v11 && [(TVPPlayerBookmarkMonitor *)self playerHasFinishedLoading])
    {
      [v8 elapsedTime];
      double v13 = v12;
      v14 = [v15 mediaItemMetadataForProperty:@"TVPMediaItemMetadataWatchedTime"];
      +[TVPPlaybackUtilities suggestedBookmarkTimeForElapsedTime:v14 duration:v13 playedThreshold:v10];
      objc_msgSend(v15, "updateBookmarkWithSuggestedTime:forElapsedTime:duration:playbackOfMediaItemIsEnding:", v5);
    }
  }
}

- (void)_updatePlayCountForMediaItem:(id)a3 player:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    [v6 duration];
    BOOL v8 = v7 == 0.0 || v7 == 3.40282347e38;
    if (!v8 && [(TVPPlayerBookmarkMonitor *)self playerHasFinishedLoading])
    {
      [v6 elapsedTime];
      objc_msgSend(v9, "updatePlayCountForElapsedTime:duration:");
    }
  }
}

- (NSTimer)bookmarkPeriodicSaveTimer
{
  return self->_bookmarkPeriodicSaveTimer;
}

- (void)setBookmarkPeriodicSaveTimer:(id)a3
{
}

- (TVPPlayback)player
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  return (TVPPlayback *)WeakRetained;
}

- (void)setPlayer:(id)a3
{
}

- (BOOL)playerHasFinishedLoading
{
  return self->_playerHasFinishedLoading;
}

- (void)setPlayerHasFinishedLoading:(BOOL)a3
{
  self->_playerHasFinishedLoading = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_player);
  objc_storeStrong((id *)&self->_bookmarkPeriodicSaveTimer, 0);
}

@end