@interface MTPAFActivity
- (BOOL)stopped;
- (MTMediaTimeTracker)timeTracker;
- (MTPAFActivity)initWithType:(int64_t)a3 playbackRate:(float)a4 atMilliseconds:(unint64_t)a5 triggerType:(id)a6 reason:(id)a7 eventData:(id)a8;
- (NSArray)itemActivities;
- (NSArray)startEventData;
- (NSArray)stopEventData;
- (NSString)startReason;
- (NSString)startTriggerType;
- (NSString)stopReason;
- (NSString)stopTriggerType;
- (int64_t)activityType;
- (unint64_t)lastPosition;
- (unint64_t)startPosition;
- (void)addItemsFromPlaylist:(id)a3 pafKit:(id)a4;
- (void)setActivityType:(int64_t)a3;
- (void)setItemActivities:(id)a3;
- (void)setLastPosition:(unint64_t)a3;
- (void)setStartEventData:(id)a3;
- (void)setStartPosition:(unint64_t)a3;
- (void)setStartReason:(id)a3;
- (void)setStartTriggerType:(id)a3;
- (void)setStopEventData:(id)a3;
- (void)setStopReason:(id)a3;
- (void)setStopTriggerType:(id)a3;
- (void)setStopped:(BOOL)a3;
- (void)setTimeTracker:(id)a3;
- (void)startItemActivityIfPossible:(id)a3;
- (void)stopItemActivityIfPossible:(id)a3;
- (void)stoppedAtMilliseconds:(unint64_t)a3 triggerType:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)synchronizeAtMilliseconds:(unint64_t)a3;
- (void)updateItemActivities:(id)a3;
@end

@implementation MTPAFActivity

- (MTPAFActivity)initWithType:(int64_t)a3 playbackRate:(float)a4 atMilliseconds:(unint64_t)a5 triggerType:(id)a6 reason:(id)a7 eventData:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if (a3 == 1)
  {
    v17 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218211000, v17, OS_LOG_TYPE_DEBUG, "MetricsKit: MTPAFActivityTypeSeek is not supported yet", buf, 2u);
    }

    v18 = 0;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)MTPAFActivity;
    v19 = [(MTPAFActivity *)&v25 init];
    v20 = v19;
    if (v19)
    {
      [(MTPAFActivity *)v19 setActivityType:a3];
      [(MTPAFActivity *)v20 setStartPosition:a5];
      [(MTPAFActivity *)v20 setLastPosition:a5];
      [(MTPAFActivity *)v20 setStartTriggerType:v14];
      [(MTPAFActivity *)v20 setStartReason:v15];
      [(MTPAFActivity *)v20 setStartEventData:v16];
      v21 = [MTMediaTimeTracker alloc];
      *(float *)&double v22 = a4;
      v23 = [(MTMediaTimeTracker *)v21 initWithPosition:a5 playbackRate:v22];
      [(MTPAFActivity *)v20 setTimeTracker:v23];
    }
    self = v20;
    v18 = self;
  }

  return v18;
}

- (void)addItemsFromPlaylist:(id)a3 pafKit:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 currentItems];
  v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v10) {
    goto LABEL_13;
  }
  uint64_t v11 = *(void *)v29;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * v12);
      id v14 = objc_alloc_init(MTPAFItemActivity);
      [(MTPAFItemActivity *)v14 setItem:v13];
      [(MTPAFItemActivity *)v14 setPlaylist:v6];
      int64_t v15 = [(MTPAFActivity *)self activityType];
      if (v15)
      {
        if (v15 != 1) {
          goto LABEL_11;
        }
        id v16 = [v7 eventHandlers];
        v17 = [v16 seekStart];
        [(MTPAFItemActivity *)v14 setStartEventHandler:v17];

        v18 = [v7 eventHandlers];
        uint64_t v19 = [v18 seekStop];
      }
      else
      {
        v20 = [v7 eventHandlers];
        v21 = [v20 playStart];
        [(MTPAFItemActivity *)v14 setStartEventHandler:v21];

        v18 = [v7 eventHandlers];
        uint64_t v19 = [v18 playStop];
      }
      double v22 = (void *)v19;
      [(MTPAFItemActivity *)v14 setStopEventHandler:v19];

LABEL_11:
      [v9 addObject:v14];

      ++v12;
    }
    while (v10 != v12);
    uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v10);
LABEL_13:

  v23 = self;
  objc_sync_enter(v23);
  v24 = [(MTPAFActivity *)v23 itemActivities];

  if (v24)
  {
    objc_super v25 = [(MTPAFActivity *)v23 itemActivities];
    v26 = [v25 arrayByAddingObjectsFromArray:v9];
    [(MTPAFActivity *)v23 setItemActivities:v26];
  }
  else
  {
    objc_super v25 = (void *)[v9 copy];
    [(MTPAFActivity *)v23 setItemActivities:v25];
  }

  [(MTPAFActivity *)v23 updateItemActivities:v9];
  objc_sync_exit(v23);
}

- (void)synchronizeAtMilliseconds:(unint64_t)a3
{
  id obj = self;
  objc_sync_enter(obj);
  v4 = [(MTPAFActivity *)obj timeTracker];
  [v4 updatePosition:a3];

  [(MTPAFActivity *)obj setLastPosition:a3];
  v5 = [(MTPAFActivity *)obj itemActivities];
  [(MTPAFActivity *)obj updateItemActivities:v5];

  objc_sync_exit(obj);
}

- (void)stoppedAtMilliseconds:(unint64_t)a3 triggerType:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v14 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = self;
  objc_sync_enter(v12);
  [(MTPAFActivity *)v12 setStopped:1];
  [(MTPAFActivity *)v12 setLastPosition:a3];
  [(MTPAFActivity *)v12 setStopTriggerType:v14];
  [(MTPAFActivity *)v12 setStopReason:v10];
  [(MTPAFActivity *)v12 setStopEventData:v11];
  uint64_t v13 = [(MTPAFActivity *)v12 itemActivities];
  [(MTPAFActivity *)v12 updateItemActivities:v13];

  objc_sync_exit(v12);
}

- (void)startItemActivityIfPossible:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 startMetricsData];
  if (!v5)
  {
    id v6 = [v4 item];
    unint64_t v7 = [(__CFString *)v6 start];
    if (v7 <= [(MTPAFActivity *)self lastPosition])
    {
      v8 = [v4 item];
      unint64_t v9 = [v8 end];
      unint64_t v10 = [(MTPAFActivity *)self startPosition];

      if (v9 <= v10) {
        goto LABEL_10;
      }
      id v11 = [v4 item];
      unint64_t v12 = [v11 start];
      unint64_t v13 = [(MTPAFActivity *)self startPosition];

      if (v12 <= v13)
      {
        id v6 = [(MTPAFActivity *)self startTriggerType];
        id v14 = [(MTPAFActivity *)self startReason];
        v20 = [(MTPAFActivity *)self startEventData];
      }
      else
      {
        id v6 = @"automatic";
        id v14 = @"transition";
        int64_t v15 = [(MTPAFActivity *)self timeTracker];
        id v16 = [v4 item];
        v17 = objc_msgSend(v15, "estimatedTimeAtPastPosition:", objc_msgSend(v16, "start"));

        v18 = objc_msgSend(v17, "mt_millisecondsSince1970", @"eventTime");
        double v22 = v18;
        uint64_t v19 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        v23[0] = v19;
        v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      }
      objc_msgSend(v4, "startAtOverallPosition:triggerType:reason:eventData:", -[MTPAFActivity startPosition](self, "startPosition"), v6, v14, v20);
    }
    goto LABEL_10;
  }

LABEL_10:
}

- (void)stopItemActivityIfPossible:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 startMetricsData];
  if (v5)
  {
    id v6 = (__CFString *)v5;
    unint64_t v7 = [v4 stopMetricsData];
    if (v7)
    {

LABEL_11:
      goto LABEL_12;
    }
    v8 = [v4 item];
    unint64_t v9 = [v8 end];
    if (v9 < [(MTPAFActivity *)self lastPosition])
    {

LABEL_7:
      id v11 = [v4 item];
      unint64_t v12 = [v11 end];
      unint64_t v13 = [(MTPAFActivity *)self lastPosition];

      if (v12 >= v13)
      {
        id v6 = [(MTPAFActivity *)self stopTriggerType];
        id v14 = [(MTPAFActivity *)self stopReason];
        v20 = [(MTPAFActivity *)self stopEventData];
      }
      else
      {
        id v6 = @"automatic";
        id v14 = @"transition";
        int64_t v15 = [(MTPAFActivity *)self timeTracker];
        id v16 = [v4 item];
        v17 = objc_msgSend(v15, "estimatedTimeAtPastPosition:", objc_msgSend(v16, "end"));

        v18 = objc_msgSend(v17, "mt_millisecondsSince1970", @"eventTime");
        double v22 = v18;
        uint64_t v19 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        v23[0] = v19;
        v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      }
      objc_msgSend(v4, "stopAtOverallPosition:triggerType:reason:eventData:", -[MTPAFActivity lastPosition](self, "lastPosition"), v6, v14, v20);

      goto LABEL_11;
    }
    BOOL v10 = [(MTPAFActivity *)self stopped];

    if (v10) {
      goto LABEL_7;
    }
  }
LABEL_12:
}

- (void)updateItemActivities:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        [(MTPAFActivity *)self startItemActivityIfPossible:v9];
        [(MTPAFActivity *)self stopItemActivityIfPossible:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int64_t)a3
{
  self->_activityType = a3;
}

- (unint64_t)startPosition
{
  return self->_startPosition;
}

- (void)setStartPosition:(unint64_t)a3
{
  self->_startPosition = a3;
}

- (unint64_t)lastPosition
{
  return self->_lastPosition;
}

- (void)setLastPosition:(unint64_t)a3
{
  self->_lastPosition = a3;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (NSString)startTriggerType
{
  return self->_startTriggerType;
}

- (void)setStartTriggerType:(id)a3
{
}

- (NSString)startReason
{
  return self->_startReason;
}

- (void)setStartReason:(id)a3
{
}

- (NSArray)startEventData
{
  return self->_startEventData;
}

- (void)setStartEventData:(id)a3
{
}

- (NSString)stopTriggerType
{
  return self->_stopTriggerType;
}

- (void)setStopTriggerType:(id)a3
{
}

- (NSString)stopReason
{
  return self->_stopReason;
}

- (void)setStopReason:(id)a3
{
}

- (NSArray)stopEventData
{
  return self->_stopEventData;
}

- (void)setStopEventData:(id)a3
{
}

- (NSArray)itemActivities
{
  return self->_itemActivities;
}

- (void)setItemActivities:(id)a3
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
  objc_storeStrong((id *)&self->_itemActivities, 0);
  objc_storeStrong((id *)&self->_stopEventData, 0);
  objc_storeStrong((id *)&self->_stopReason, 0);
  objc_storeStrong((id *)&self->_stopTriggerType, 0);
  objc_storeStrong((id *)&self->_startEventData, 0);
  objc_storeStrong((id *)&self->_startReason, 0);

  objc_storeStrong((id *)&self->_startTriggerType, 0);
}

@end