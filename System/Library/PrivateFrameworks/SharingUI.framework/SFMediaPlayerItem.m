@interface SFMediaPlayerItem
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldLoop;
- (NSArray)playbackNotificationTimeRanges;
- (NSMutableArray)playerItems;
- (NSURL)url;
- (SFMediaPlayerItem)initWithURL:(id)a3;
- (id)completedHandler;
- (id)description;
- (id)observerToken;
- (id)startedHandler;
- (id)timeRangeHandler;
- (unint64_t)hash;
- (void)invalidate;
- (void)setCompletedHandler:(id)a3;
- (void)setObserverToken:(id)a3;
- (void)setPlaybackNotificationTimeRanges:(id)a3 withTimeRangeHandler:(id)a4;
- (void)setPlayerItem:(id)a3;
- (void)setPlayerItems:(id)a3;
- (void)setShouldLoop:(BOOL)a3;
- (void)setStartedHandler:(id)a3;
@end

@implementation SFMediaPlayerItem

- (SFMediaPlayerItem)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFMediaPlayerItem;
  v6 = [(SFMediaPlayerItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (void)setPlaybackNotificationTimeRanges:(id)a3 withTimeRangeHandler:(id)a4
{
  id v6 = a4;
  v7 = (NSArray *)[a3 copy];
  playbackNotificationTimeRanges = self->_playbackNotificationTimeRanges;
  self->_playbackNotificationTimeRanges = v7;

  objc_super v9 = (void *)[v6 copy];
  id timeRangeHandler = self->_timeRangeHandler;
  self->_id timeRangeHandler = v9;
}

- (void)setPlayerItem:(id)a3
{
  id v12 = a3;
  v4 = [(SFMediaPlayerItem *)self playerItems];
  [v4 removeAllObjects];

  id v5 = [(SFMediaPlayerItem *)self playerItems];

  if (!v5)
  {
    id v6 = objc_opt_new();
    [(SFMediaPlayerItem *)self setPlayerItems:v6];
  }
  v7 = [(SFMediaPlayerItem *)self playerItems];
  [v7 addObject:v12];

  if ([(SFMediaPlayerItem *)self shouldLoop])
  {
    v8 = [(SFMediaPlayerItem *)self playerItems];
    objc_super v9 = (void *)[v12 copy];
    [v8 addObject:v9];

    v10 = [(SFMediaPlayerItem *)self playerItems];
    v11 = (void *)[v12 copy];
    [v10 addObject:v11];
  }
}

- (void)invalidate
{
  id timeRangeHandler = self->_timeRangeHandler;
  self->_id timeRangeHandler = 0;

  id startedHandler = self->_startedHandler;
  self->_id startedHandler = 0;

  id completedHandler = self->_completedHandler;
  self->_id completedHandler = 0;
}

- (id)description
{
  uint64_t v11 = objc_opt_class();
  NSAppendPrintF();
  id v14 = 0;
  id v12 = [(NSURL *)self->_url path];
  NSAppendPrintF();
  id v3 = v14;

  if ([(NSMutableArray *)self->_playerItems count])
  {
    v13 = [(NSMutableArray *)self->_playerItems firstObject];
    NSAppendPrintF();
    id v4 = v3;

    id v3 = v4;
  }
  if (self->_shouldLoop)
  {
    NSAppendPrintF();
    id v5 = v3;

    id v3 = v5;
  }
  if ([(NSArray *)self->_playbackNotificationTimeRanges count])
  {
    [(NSArray *)self->_playbackNotificationTimeRanges count];
    NSAppendPrintF();
    id v6 = v3;

    id v3 = v6;
  }
  if (self->_startedHandler)
  {
    NSAppendPrintF();
    id v7 = v3;

    id v3 = v7;
  }
  if (self->_completedHandler)
  {
    NSAppendPrintF();
    id v8 = v3;

    id v3 = v8;
  }
  NSAppendPrintF();
  id v9 = v3;

  return v9;
}

- (unint64_t)hash
{
  v2 = [(SFMediaPlayerItem *)self url];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = self;
      id v5 = [(SFMediaPlayerItem *)v4 url];
      id v6 = [(SFMediaPlayerItem *)v4 url];
      id v7 = v5;
      id v8 = v6;
      id v9 = v8;
      if (v7 != v8 && (v7 == 0) != (v8 != 0)) {
        [v7 isEqual:v8];
      }

      [(SFMediaPlayerItem *)v4 shouldLoop];
      [(SFMediaPlayerItem *)v4 shouldLoop];
    }
  }
  return 0;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)shouldLoop
{
  return self->_shouldLoop;
}

- (void)setShouldLoop:(BOOL)a3
{
  self->_shouldLoop = a3;
}

- (NSArray)playbackNotificationTimeRanges
{
  return self->_playbackNotificationTimeRanges;
}

- (id)timeRangeHandler
{
  return self->_timeRangeHandler;
}

- (id)startedHandler
{
  return self->_startedHandler;
}

- (void)setStartedHandler:(id)a3
{
}

- (id)completedHandler
{
  return self->_completedHandler;
}

- (void)setCompletedHandler:(id)a3
{
}

- (NSMutableArray)playerItems
{
  return self->_playerItems;
}

- (void)setPlayerItems:(id)a3
{
}

- (id)observerToken
{
  return self->_observerToken;
}

- (void)setObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_playerItems, 0);
  objc_storeStrong(&self->_completedHandler, 0);
  objc_storeStrong(&self->_startedHandler, 0);
  objc_storeStrong(&self->_timeRangeHandler, 0);
  objc_storeStrong((id *)&self->_playbackNotificationTimeRanges, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end