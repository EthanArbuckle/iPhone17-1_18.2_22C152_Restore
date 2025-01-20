@interface SearchUIMusicStatusCache
- (MPMediaItem)nowPlayingItem;
- (SearchUIMusicStatusCache)init;
- (int64_t)playbackState;
- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)setNowPlayingItem:(id)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)updateNowPlayingItem;
- (void)updatePlaybackState;
@end

@implementation SearchUIMusicStatusCache

- (SearchUIMusicStatusCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIMusicStatusCache;
  v2 = [(TLKAsyncCache *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_updateNowPlayingItem name:*MEMORY[0x1E4F31728] object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_updatePlaybackState name:*MEMORY[0x1E4F31730] object:0];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__SearchUIMusicStatusCache_init__block_invoke;
    v6[3] = &unk_1E6E72730;
    v7 = v2;
    +[SearchUIMediaUtilities dispatchOnMusicQueueIfNecessary:v6];
  }
  return v2;
}

void __32__SearchUIMusicStatusCache_init__block_invoke(uint64_t a1)
{
  v2 = +[SearchUIMediaUtilities musicPlayer];
  [v2 beginGeneratingPlaybackNotifications];

  v3 = +[SearchUIMediaUtilities musicPlayer];
  v4 = [v3 nowPlayingItem];
  [*(id *)(a1 + 32) setNowPlayingItem:v4];

  id v5 = +[SearchUIMediaUtilities musicPlayer];
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackState:", objc_msgSend(v5, "playbackState"));
}

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  id v4 = a4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__SearchUIMusicStatusCache_computeObjectForKey_completionHandler___block_invoke;
  v6[3] = &unk_1E6E734B0;
  id v7 = v4;
  id v5 = v4;
  +[SearchUIMusicUtilities canPlayAppleMusicWithCompletionHandler:v6];
}

void __66__SearchUIMusicStatusCache_computeObjectForKey_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)updateNowPlayingItem
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__SearchUIMusicStatusCache_updateNowPlayingItem__block_invoke;
  v2[3] = &unk_1E6E72730;
  v2[4] = self;
  +[SearchUIMediaUtilities dispatchOnMusicQueueIfNecessary:v2];
}

void __48__SearchUIMusicStatusCache_updateNowPlayingItem__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SearchUIMediaUtilities musicPlayer];
  id v5 = [(id)v2 nowPlayingItem];

  id v3 = [*(id *)(a1 + 32) nowPlayingItem];
  LOBYTE(v2) = +[SearchUIMediaUtilities isMediaItem:v5 equalToMediaItem:v3];

  if ((v2 & 1) == 0)
  {
    [*(id *)(a1 + 32) setNowPlayingItem:v5];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"SearchUIMusicNowPlayingItemDidChangeNotification" object:0];
  }
}

- (void)updatePlaybackState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__SearchUIMusicStatusCache_updatePlaybackState__block_invoke;
  v2[3] = &unk_1E6E72730;
  v2[4] = self;
  +[SearchUIMediaUtilities dispatchOnMusicQueueIfNecessary:v2];
}

void __47__SearchUIMusicStatusCache_updatePlaybackState__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SearchUIMediaUtilities musicPlayer];
  uint64_t v3 = [v2 playbackState];

  if (v3 != [*(id *)(a1 + 32) playbackState])
  {
    [*(id *)(a1 + 32) setPlaybackState:v3];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"SearchUIMusicPlaybackStateDidChangeNotification" object:0];
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x1E4F319C0] systemMusicPlayer];
  [v4 endGeneratingPlaybackNotifications];

  v5.receiver = self;
  v5.super_class = (Class)SearchUIMusicStatusCache;
  [(SearchUIMusicStatusCache *)&v5 dealloc];
}

- (MPMediaItem)nowPlayingItem
{
  return (MPMediaItem *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNowPlayingItem:(id)a3
{
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_playbackState = a3;
}

- (void).cxx_destruct
{
}

@end