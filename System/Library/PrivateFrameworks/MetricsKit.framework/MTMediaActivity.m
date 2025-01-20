@interface MTMediaActivity
+ (unint64_t)startOverallPositionForItem:(id)a3;
- (BOOL)isStopped;
- (MTMediaActivity)initWithType:(int64_t)a3 playlistItem:(id)a4 pafKit:(id)a5;
- (MTMediaPlaylistItem)playlistItem;
- (MTMetricsData)startMetricsData;
- (MTMetricsData)stopMetricsData;
- (MTPAFKit)pafKit;
- (id)eventDataForTransitioningEvents;
- (id)startEventHandler;
- (id)stopEventHandler;
- (int64_t)type;
- (unint64_t)positionFromOverallPosition:(unint64_t)a3;
- (void)setPafKit:(id)a3;
- (void)setPlaylistItem:(id)a3;
- (void)setStartMetricsData:(id)a3;
- (void)setStopMetricsData:(id)a3;
- (void)setType:(int64_t)a3;
- (void)startedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)stoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6;
@end

@implementation MTMediaActivity

- (MTMediaActivity)initWithType:(int64_t)a3 playlistItem:(id)a4 pafKit:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MTMediaActivity;
  v10 = [(MTMediaActivity *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(MTMediaActivity *)v10 setPafKit:v9];
    [(MTMediaActivity *)v11 setType:a3];
    [(MTMediaActivity *)v11 setPlaylistItem:v8];
  }

  return v11;
}

- (unint64_t)positionFromOverallPosition:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = [(MTMediaActivity *)self playlistItem];
  unint64_t v6 = +[MTMediaActivity startOverallPositionForItem:v5];

  unint64_t v7 = a3 - v6;
  if (a3 < v6)
  {
    id v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134218240;
      unint64_t v15 = a3;
      __int16 v16 = 2048;
      unint64_t v17 = v6;
      _os_log_impl(&dword_218211000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Media Activity is recorded with incorrect overallPosition: %ld playlist item startOverallPosition: %ld", (uint8_t *)&v14, 0x16u);
    }
  }
  id v9 = [(MTMediaActivity *)self playlistItem];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(MTMediaActivity *)self playlistItem];
    uint64_t v12 = [v11 startPosition];
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v7 + v12;
}

- (void)startedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  objc_super v13 = [(MTMediaActivity *)self startEventHandler];
  int v14 = objc_msgSend(v13, "metricsDataForStartActionWithPosition:overallPosition:type:reason:eventData:", -[MTMediaActivity positionFromOverallPosition:](self, "positionFromOverallPosition:", a3), a3, v12, v11, v10);

  [(MTMediaActivity *)self setStartMetricsData:v14];
  if ([(MTMediaActivity *)self type] != 1)
  {
    id v16 = [(MTMediaActivity *)self startMetricsData];
    id v15 = (id)[v16 recordEvent];
  }
}

- (void)stoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  objc_super v13 = [(MTMediaActivity *)self stopEventHandler];
  unint64_t v14 = [(MTMediaActivity *)self positionFromOverallPosition:a3];
  id v15 = [(MTMediaActivity *)self startMetricsData];
  id v16 = [v13 metricsDataForStopActionWithPosition:v14 overallPosition:a3 type:v12 reason:v11 startMetricsData:v15 eventData:v10];

  [(MTMediaActivity *)self setStopMetricsData:v16];
  id v18 = [(MTMediaActivity *)self stopMetricsData];
  id v17 = (id)[v18 recordEvent];
}

- (BOOL)isStopped
{
  v2 = [(MTMediaActivity *)self stopMetricsData];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)eventDataForTransitioningEvents
{
  v2 = [(MTMediaActivity *)self startMetricsData];
  BOOL v3 = [v2 userAndClientIDFields];

  return v3;
}

- (id)startEventHandler
{
  int64_t v3 = [(MTMediaActivity *)self type];
  if (v3 == 1)
  {
    v4 = [(MTMediaActivity *)self pafKit];
    v5 = [v4 eventHandlers];
    uint64_t v6 = [v5 seekStart];
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = [(MTMediaActivity *)self pafKit];
    v5 = [v4 eventHandlers];
    uint64_t v6 = [v5 playStart];
LABEL_5:
    unint64_t v7 = (void *)v6;

    goto LABEL_7;
  }
  uint64_t v8 = [(MTMediaActivity *)self type];
  id v15 = MTConfigurationError(109, @"No start event handler found for media activity type: %d", v9, v10, v11, v12, v13, v14, v8);
  unint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (id)stopEventHandler
{
  int64_t v3 = [(MTMediaActivity *)self type];
  if (v3 == 1)
  {
    v4 = [(MTMediaActivity *)self pafKit];
    v5 = [v4 eventHandlers];
    uint64_t v6 = [v5 seekStop];
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = [(MTMediaActivity *)self pafKit];
    v5 = [v4 eventHandlers];
    uint64_t v6 = [v5 playStop];
LABEL_5:
    unint64_t v7 = (void *)v6;

    goto LABEL_7;
  }
  uint64_t v8 = [(MTMediaActivity *)self type];
  id v15 = MTConfigurationError(109, @"No stop event handler found for media activity type: %d", v9, v10, v11, v12, v13, v14, v8);
  unint64_t v7 = 0;
LABEL_7:

  return v7;
}

+ (unint64_t)startOverallPositionForItem:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 startOverallPosition];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      unint64_t v5 = 0;
      goto LABEL_7;
    }
    uint64_t v4 = [v3 overallPosition];
  }
  unint64_t v5 = v4;
LABEL_7:

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (MTMediaPlaylistItem)playlistItem
{
  return self->_playlistItem;
}

- (void)setPlaylistItem:(id)a3
{
}

- (MTMetricsData)startMetricsData
{
  return self->_startMetricsData;
}

- (void)setStartMetricsData:(id)a3
{
}

- (MTMetricsData)stopMetricsData
{
  return self->_stopMetricsData;
}

- (void)setStopMetricsData:(id)a3
{
}

- (MTPAFKit)pafKit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pafKit);

  return (MTPAFKit *)WeakRetained;
}

- (void)setPafKit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pafKit);
  objc_storeStrong((id *)&self->_stopMetricsData, 0);
  objc_storeStrong((id *)&self->_startMetricsData, 0);

  objc_storeStrong((id *)&self->_playlistItem, 0);
}

@end