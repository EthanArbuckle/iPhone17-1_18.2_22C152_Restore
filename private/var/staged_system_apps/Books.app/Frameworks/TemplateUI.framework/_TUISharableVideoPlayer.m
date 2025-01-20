@interface _TUISharableVideoPlayer
- (BOOL)isWithinVisibleBounds;
- (BOOL)shouldRelease;
- (BOOL)triggerPlaybackEnabled;
- (TUIVideoPlayer)player;
- (TUIVideoViewPlayerHosting)activeHost;
- (_TUISharableVideoPlayer)initWithURL:(id)a3 videoId:(id)a4;
- (id)description;
- (void)decrementHostCount;
- (void)incrementHostCount;
- (void)setActiveHost:(id)a3;
- (void)setIsWithinVisibleBounds:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setTriggerPlaybackEnabled:(BOOL)a3;
@end

@implementation _TUISharableVideoPlayer

- (_TUISharableVideoPlayer)initWithURL:(id)a3 videoId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_TUISharableVideoPlayer;
  v8 = [(_TUISharableVideoPlayer *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_hostCount = 1;
    v10 = [[TUIVideoPlayer alloc] initWithUrl:v6 videoId:v7];
    player = v9->_player;
    v9->_player = v10;

    v9->_triggerPlaybackEnabled = 1;
  }

  return v9;
}

- (void)incrementHostCount
{
}

- (void)decrementHostCount
{
  int64_t hostCount = self->_hostCount;
  BOOL v3 = hostCount < 1;
  int64_t v4 = hostCount - 1;
  if (!v3) {
    self->_int64_t hostCount = v4;
  }
}

- (BOOL)shouldRelease
{
  return self->_hostCount == 0;
}

- (id)description
{
  BOOL v3 = [(TUIVideoPlayer *)self->_player videoId];
  [(TUIVideoPlayer *)self->_player rate];
  v5 = +[NSString stringWithFormat:@"<_TUISharableVideoPlayer: %p, videoId: %@, rate: %f, isPlaying: %i, triggerPlaybackEnabled: %i, isWithinVisibleBounds: %i>", self, v3, v4, [(TUIVideoPlayer *)self->_player isPlaying], self->_triggerPlaybackEnabled, self->_isWithinVisibleBounds];

  return v5;
}

- (TUIVideoPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (TUIVideoViewPlayerHosting)activeHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeHost);

  return (TUIVideoViewPlayerHosting *)WeakRetained;
}

- (void)setActiveHost:(id)a3
{
}

- (BOOL)triggerPlaybackEnabled
{
  return self->_triggerPlaybackEnabled;
}

- (void)setTriggerPlaybackEnabled:(BOOL)a3
{
  self->_triggerPlaybackEnabled = a3;
}

- (BOOL)isWithinVisibleBounds
{
  return self->_isWithinVisibleBounds;
}

- (void)setIsWithinVisibleBounds:(BOOL)a3
{
  self->_isWithinVisibleBounds = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeHost);

  objc_storeStrong((id *)&self->_player, 0);
}

@end