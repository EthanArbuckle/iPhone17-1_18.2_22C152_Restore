@interface MTMediaActivityTracker
+ (id)playlistItemComparator;
- (BOOL)shouldGenerateTransitions;
- (MTMediaActivity)playActivity;
- (MTMediaActivity)seekActivity;
- (MTMediaActivityTracker)initWithVPAFKit:(id)a3 playlist:(id)a4 eventData:(id)a5;
- (MTMediaPlaylist)playlist;
- (MTMediaTimeTracker)timeTracker;
- (MTVPAFKit)vpafKit;
- (NSMutableArray)eventData;
- (id)combineEventData:(id)a3 withPlaylistDataForItem:(id)a4;
- (id)startActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7;
- (void)generatePlaylistTransitionsIfNecessary:(unint64_t)a3;
- (void)playStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)playStartedWithPlaybackRate:(float)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7;
- (void)playStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)playTransitionedAtOverallPosition:(unint64_t)a3 eventData:(id)a4;
- (void)resetEventData:(id)a3;
- (void)seekStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)seekStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)setEventData:(id)a3;
- (void)setPlayActivity:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setSeekActivity:(id)a3;
- (void)setShouldGenerateTransitions:(BOOL)a3;
- (void)setTimeTracker:(id)a3;
- (void)setVpafKit:(id)a3;
- (void)stopActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7;
- (void)synchronizeAtOverallPosition:(unint64_t)a3;
- (void)synchronizePlaybackRate:(float)a3 overallPosition:(unint64_t)a4;
- (void)updateEventData:(id)a3;
@end

@implementation MTMediaActivityTracker

- (MTMediaActivityTracker)initWithVPAFKit:(id)a3 playlist:(id)a4 eventData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MTMediaActivityTracker;
  v11 = [(MTMediaActivityTracker *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(MTMediaActivityTracker *)v11 setVpafKit:v8];
    [(MTMediaActivityTracker *)v12 setPlaylist:v9];
    v13 = (void *)[v10 mutableCopy];
    [(MTMediaActivityTracker *)v12 setEventData:v13];

    [(MTMediaActivityTracker *)v12 setShouldGenerateTransitions:1];
  }

  return v12;
}

- (void)playStartedWithPlaybackRate:(float)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v10 = [(MTMediaActivityTracker *)self startActivity:0 overallPosition:a4 type:a5 reason:a6 eventData:a7];
  if ([(MTMediaActivityTracker *)self shouldGenerateTransitions])
  {
    v11 = [MTMediaTimeTracker alloc];
    *(float *)&double v12 = a3;
    v13 = [(MTMediaTimeTracker *)v11 initWithPosition:a4 playbackRate:v12];
    [(MTMediaActivityTracker *)self setTimeTracker:v13];
  }
}

- (void)playStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  LODWORD(v6) = 1.0;
  [(MTMediaActivityTracker *)self playStartedWithPlaybackRate:a3 overallPosition:a4 type:a5 reason:a6 eventData:v6];
}

- (void)playStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  [(MTMediaActivityTracker *)self generatePlaylistTransitionsIfNecessary:a3];
  [(MTMediaActivityTracker *)self stopActivity:0 overallPosition:a3 type:v12 reason:v11 eventData:v10];

  [(MTMediaActivityTracker *)self setTimeTracker:0];
}

- (void)playTransitionedAtOverallPosition:(unint64_t)a3 eventData:(id)a4
{
  id v7 = a4;
  [(MTMediaActivityTracker *)self stopActivity:0 overallPosition:a3 type:@"automatic" reason:@"transition" eventData:v7];
  id v6 = [(MTMediaActivityTracker *)self startActivity:0 overallPosition:a3 type:@"automatic" reason:@"transition" eventData:v7];
}

- (void)seekStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v6 = [(MTMediaActivityTracker *)self startActivity:1 overallPosition:a3 type:a4 reason:a5 eventData:a6];
}

- (void)seekStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
}

- (void)synchronizePlaybackRate:(float)a3 overallPosition:(unint64_t)a4
{
  id v7 = [(MTMediaActivityTracker *)self playActivity];
  v22 = v7;
  if (!v7 || [v7 type])
  {
    BOOL v14 = a3 <= 0.0;
    goto LABEL_4;
  }
  BOOL v14 = a3 <= 0.0;
  int v17 = [v22 isStopped];
  if ((v17 & 1) != 0 || a3 <= 0.0)
  {
    if (a3 > 0.0) {
      char v20 = 1;
    }
    else {
      char v20 = v17;
    }
    if ((v20 & 1) == 0)
    {
      objc_super v15 = @"Inconsistent state: did you forget to call playStopped?";
LABEL_6:
      id v16 = MTConfigurationError(110, v15, v8, v9, v10, v11, v12, v13, v21);
      goto LABEL_7;
    }
    if (((v17 ^ 1) & 1) == 0)
    {
LABEL_4:
      if (v14) {
        goto LABEL_7;
      }
      objc_super v15 = @"Inconsistent state: did you forget to call playStarted?";
      goto LABEL_6;
    }
  }
  else
  {
    [(MTMediaActivityTracker *)self generatePlaylistTransitionsIfNecessary:a4];
    v18 = [(MTMediaActivityTracker *)self timeTracker];
    *(float *)&double v19 = a3;
    [v18 updatePosition:a4 playbackRate:v19];
  }
LABEL_7:

  MEMORY[0x270F9A758]();
}

- (void)synchronizeAtOverallPosition:(unint64_t)a3
{
  id v5 = [(MTMediaActivityTracker *)self timeTracker];
  [v5 playbackRate];
  -[MTMediaActivityTracker synchronizePlaybackRate:overallPosition:](self, "synchronizePlaybackRate:overallPosition:", a3);
}

- (void)updateEventData:(id)a3
{
  id v4 = a3;
  id v5 = [(MTMediaActivityTracker *)self eventData];
  [v5 addObjectsFromArray:v4];
}

- (void)resetEventData:(id)a3
{
  if (a3)
  {
    id v4 = (NSMutableArray *)[a3 mutableCopy];
  }
  else
  {
    id v4 = [MEMORY[0x263EFF980] array];
  }
  self->_eventData = v4;

  MEMORY[0x270F9A758]();
}

- (NSMutableArray)eventData
{
  eventData = self->_eventData;
  if (!eventData)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    id v5 = self->_eventData;
    self->_eventData = v4;

    eventData = self->_eventData;
  }

  return eventData;
}

- (id)combineEventData:(id)a3 withPlaylistDataForItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [(MTMediaActivityTracker *)self playlist];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [(MTMediaActivityTracker *)self playlist];
    uint64_t v11 = [v10 eventData];
  }
  else
  {
    uint64_t v11 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v12 = 0;
    if (!v11) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v12 = [v7 eventData];
  if (v11) {
LABEL_8:
  }
    [v8 addObjectsFromArray:v11];
LABEL_9:
  if (v12) {
    [v8 addObjectsFromArray:v12];
  }
  uint64_t v13 = [(MTMediaActivityTracker *)self eventData];
  [v8 addObjectsFromArray:v13];

  if (v6) {
    [v8 addObjectsFromArray:v6];
  }
  BOOL v14 = (void *)[v8 copy];

  return v14;
}

- (id)startActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  objc_super v15 = [(MTMediaActivityTracker *)self playlist];
  id v16 = [v15 itemAtOverallPosition:a4 rangeOptions:1];

  int v17 = [MTMediaActivity alloc];
  v18 = [(MTMediaActivityTracker *)self vpafKit];
  double v19 = [(MTMediaActivity *)v17 initWithType:a3 playlistItem:v16 pafKit:v18];

  char v20 = [(MTMediaActivityTracker *)self combineEventData:v12 withPlaylistDataForItem:v16];

  [(MTMediaActivity *)v19 startedAtOverallPosition:a4 type:v14 reason:v13 eventData:v20];
  if (a3 == 1)
  {
    [(MTMediaActivityTracker *)self setSeekActivity:v19];
  }
  else if (!a3)
  {
    [(MTMediaActivityTracker *)self setPlayActivity:v19];
  }

  return v19;
}

- (void)stopActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v26 = a5;
  id v12 = a6;
  id v19 = a7;
  if (a3 == 1)
  {
    char v20 = [(MTMediaActivityTracker *)self seekActivity];
    [(MTMediaActivityTracker *)self setSeekActivity:0];
    uint64_t v21 = [(MTMediaActivityTracker *)self playlist];
    v22 = [v21 itemAtOverallPosition:a4 rangeOptions:2];
    [v20 setPlaylistItem:v22];

    if (!v20) {
      goto LABEL_9;
    }
  }
  else
  {
    if (a3)
    {
      char v20 = 0;
      goto LABEL_9;
    }
    char v20 = [(MTMediaActivityTracker *)self playActivity];
    [(MTMediaActivityTracker *)self setPlayActivity:0];
    if (!v20) {
      goto LABEL_9;
    }
  }
  if (![v20 isStopped])
  {
    v23 = [v20 playlistItem];
    v24 = [(MTMediaActivityTracker *)self combineEventData:v19 withPlaylistDataForItem:v23];
    [v20 stoppedAtOverallPosition:a4 type:v26 reason:v12 eventData:v24];

    goto LABEL_10;
  }
LABEL_9:
  id v25 = MTConfigurationError(110, @"There is no %@ activity to stop.", v13, v14, v15, v16, v17, v18, a3);
LABEL_10:
}

- (void)generatePlaylistTransitionsIfNecessary:(unint64_t)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  if ([(MTMediaActivityTracker *)self shouldGenerateTransitions])
  {
    id v5 = [(MTMediaActivityTracker *)self playActivity];
    id v6 = v5;
    if (v5 && ![v5 type] && (objc_msgSend(v6, "isStopped") & 1) == 0)
    {
      id v25 = [v6 eventDataForTransitioningEvents];
      id v7 = [(MTMediaActivityTracker *)self playlist];
      uint64_t v8 = [v6 playlistItem];
      uint64_t v9 = objc_msgSend(v7, "itemsBetweenStartOverallPosition:endOverallPosition:", +[MTMediaActivity startOverallPositionForItem:](MTMediaActivity, "startOverallPositionForItem:", v8), a3);

      uint64_t v10 = [(MTMediaActivityTracker *)self playlist];
      objc_opt_class();
      LOBYTE(v8) = objc_opt_isKindOfClass();

      if (v8)
      {
        uint64_t v11 = v9;
      }
      else
      {
        id v12 = +[MTMediaActivityTracker playlistItemComparator];
        uint64_t v11 = [v9 sortedArrayUsingComparator:v12];
      }
      if ((unint64_t)[v11 count] >= 2)
      {
        for (unint64_t i = 1; [v11 count] > i; ++i)
        {
          uint64_t v14 = [v11 objectAtIndexedSubscript:i];
          unint64_t v15 = +[MTMediaActivity startOverallPositionForItem:v14];
          uint64_t v16 = [v6 playlistItem];
          unint64_t v17 = +[MTMediaActivity startOverallPositionForItem:v16];

          if (v15 > v17)
          {
            if (v15 >= a3)
            {

              break;
            }
            uint64_t v18 = [(MTMediaActivityTracker *)self timeTracker];
            id v26 = [v18 estimatedTimeAtPosition:v15];

            v27 = @"eventTime";
            id v19 = objc_msgSend(v26, "mt_millisecondsSince1970");
            v28 = v19;
            [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
            v21 = char v20 = v11;
            v29[0] = v21;
            v29[1] = v25;
            [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
            v23 = unint64_t v22 = a3;

            uint64_t v11 = v20;
            [(MTMediaActivityTracker *)self stopActivity:0 overallPosition:v15 type:@"automatic" reason:@"transition" eventData:v23];
            uint64_t v24 = [(MTMediaActivityTracker *)self startActivity:0 overallPosition:v15 type:@"automatic" reason:@"transition" eventData:v23];

            a3 = v22;
            id v6 = (void *)v24;
          }
        }
      }
    }
  }
}

+ (id)playlistItemComparator
{
  return &__block_literal_global_18;
}

uint64_t __48__MTMediaActivityTracker_playlistItemComparator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = +[MTMediaActivity startOverallPositionForItem:a2];
  unint64_t v6 = +[MTMediaActivity startOverallPositionForItem:v4];

  uint64_t v7 = -1;
  if (v5 >= v6) {
    uint64_t v7 = 1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

- (BOOL)shouldGenerateTransitions
{
  return self->_shouldGenerateTransitions;
}

- (void)setShouldGenerateTransitions:(BOOL)a3
{
  self->_shouldGenerateTransitions = a3;
}

- (MTVPAFKit)vpafKit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vpafKit);

  return (MTVPAFKit *)WeakRetained;
}

- (void)setVpafKit:(id)a3
{
}

- (MTMediaPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (MTMediaActivity)playActivity
{
  return self->_playActivity;
}

- (void)setPlayActivity:(id)a3
{
}

- (MTMediaActivity)seekActivity
{
  return self->_seekActivity;
}

- (void)setSeekActivity:(id)a3
{
}

- (void)setEventData:(id)a3
{
}

- (MTMediaTimeTracker)timeTracker
{
  return self->_timeTracker;
}

- (void)setTimeTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTracker, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_seekActivity, 0);
  objc_storeStrong((id *)&self->_playActivity, 0);
  objc_storeStrong((id *)&self->_playlist, 0);

  objc_destroyWeak((id *)&self->_vpafKit);
}

@end