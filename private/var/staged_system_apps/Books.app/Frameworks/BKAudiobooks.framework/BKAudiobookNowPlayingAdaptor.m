@interface BKAudiobookNowPlayingAdaptor
+ (id)sharedInstance;
- (BKAudiobookGenericCoverProvider)genericCoverProvider;
- (BKAudiobookNowPlayingAdaptor)initWithPlayer:(id)a3;
- (BKAudiobookPlayer)player;
- (BOOL)audiobookPlayerActiveOutput;
- (NSString)sessionID;
- (void)invalidatePlaybackQueue;
- (void)player:(id)a3 audiobookDidChange:(id)a4;
- (void)player:(id)a3 chapterDidChange:(id)a4;
- (void)player:(id)a3 currentPositionDidChange:(double)a4 inChapter:(unint64_t)a5 absolutePosition:(double)a6;
- (void)player:(id)a3 isStalling:(BOOL)a4 isLoadingResources:(BOOL)a5;
- (void)player:(id)a3 playbackRateDidChange:(float)a4;
- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)setAudiobookPlayerActiveOutput:(BOOL)a3;
- (void)setGenericCoverProvider:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation BKAudiobookNowPlayingAdaptor

+ (id)sharedInstance
{
  if (qword_48DE0 != -1) {
    dispatch_once(&qword_48DE0, &stru_3CD18);
  }
  v2 = (void *)qword_48DE8;

  return v2;
}

- (BKAudiobookNowPlayingAdaptor)initWithPlayer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKAudiobookNowPlayingAdaptor;
  v6 = [(BKAudiobookNowPlayingAdaptor *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v8 = [(BKAudiobookNowPlayingAdaptor *)v7 player];
    [v8 addObserver:v7];
  }
  return v7;
}

- (void)setAudiobookPlayerActiveOutput:(BOOL)a3
{
  if (self->_audiobookPlayerActiveOutput != a3)
  {
    BOOL v3 = a3;
    self->_audiobookPlayerActiveOutput = a3;
    id v5 = BKAudiobooksNowPlayingAdaptorLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "audiobook player set to active", buf, 2u);
      }

      MRMediaRemoteSetCanBeNowPlayingApplication();
      [(BKAudiobookNowPlayingAdaptor *)self invalidatePlaybackQueue];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "audiobook player set to inactive", v7, 2u);
      }

      MRMediaRemoteSetCanBeNowPlayingApplication();
    }
  }
}

- (void)invalidatePlaybackQueue
{
  v2 = BKAudiobooksNowPlayingAdaptorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "invalidatePlaybackQueue", v4, 2u);
  }

  BOOL v3 = +[MPNowPlayingInfoCenter defaultCenter];
  [v3 invalidatePlaybackQueue];
}

- (void)player:(id)a3 audiobookDidChange:(id)a4
{
  [(BKAudiobookNowPlayingAdaptor *)self invalidatePlaybackQueue];

  [(BKAudiobookNowPlayingAdaptor *)self nowPlayingInfoChanged:0];
}

- (void)player:(id)a3 chapterDidChange:(id)a4
{
  [(BKAudiobookNowPlayingAdaptor *)self invalidatePlaybackQueue];

  [(BKAudiobookNowPlayingAdaptor *)self nowPlayingInfoChanged:0];
}

- (void)player:(id)a3 currentPositionDidChange:(double)a4 inChapter:(unint64_t)a5 absolutePosition:(double)a6
{
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  if ((unint64_t)(a5 - 1) <= 1) {
    -[BKAudiobookNowPlayingAdaptor setAudiobookPlayerActiveOutput:](self, "setAudiobookPlayerActiveOutput:", 1, a4);
  }

  [(BKAudiobookNowPlayingAdaptor *)self nowPlayingInfoChanged:1];
}

- (void)player:(id)a3 playbackRateDidChange:(float)a4
{
}

- (void)player:(id)a3 isStalling:(BOOL)a4 isLoadingResources:(BOOL)a5
{
}

- (BOOL)audiobookPlayerActiveOutput
{
  return self->_audiobookPlayerActiveOutput;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (BKAudiobookGenericCoverProvider)genericCoverProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_genericCoverProvider);

  return (BKAudiobookGenericCoverProvider *)WeakRetained;
}

- (void)setGenericCoverProvider:(id)a3
{
}

- (BKAudiobookPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_genericCoverProvider);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end