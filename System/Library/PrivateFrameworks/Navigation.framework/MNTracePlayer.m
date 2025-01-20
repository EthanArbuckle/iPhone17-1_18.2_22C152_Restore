@interface MNTracePlayer
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (BOOL)requestDirectionsNearTimestamp:(double)a3 withHandler:(id)a4;
- (BOOL)shouldPlayETARequests;
- (BOOL)shouldPlayNetworkEvents;
- (BOOL)shouldUpdateRouteWhenJumping;
- (MNSessionUpdateManager)sessionUpdater;
- (MNTrace)trace;
- (MNTracePlayer)initWithPath:(id)a3;
- (MNTracePlayer)initWithPath:(id)a3 outError:(id *)a4;
- (MNTracePlayer)initWithTrace:(id)a3;
- (double)currentTime;
- (double)duration;
- (double)position;
- (double)speedMultiplier;
- (id)_changeRouteRowForTimestamp:(double)a3;
- (id)_directionsRowForChangeRouteRow:(id)a3;
- (id)_etauRowForChangeRouteRow:(id)a3;
- (id)_locationRowBeforeTimestamp:(double)a3;
- (id)_locationWithCurrentDate:(id)a3;
- (id)_routeForRouteChangeRow:(id)a3;
- (id)guidanceEventNearTimestamp:(double)a3;
- (unint64_t)_directionsRowIndexBeforeTimestamp:(double)a3;
- (void)_createTimelineStreams;
- (void)dealloc;
- (void)jumpToBookmarkAtIndex:(unint64_t)a3;
- (void)jumpToLocationAtIndex:(unint64_t)a3;
- (void)jumpToTime:(double)a3;
- (void)pause;
- (void)registerObserver:(id)a3;
- (void)resume;
- (void)setShouldPlayETARequests:(BOOL)a3;
- (void)setShouldPlayNetworkEvents:(BOOL)a3;
- (void)setShouldUpdateRouteWhenJumping:(BOOL)a3;
- (void)setSpeedMultiplier:(double)a3;
- (void)skipByTimeInterval:(double)a3;
- (void)start;
- (void)startAtLocationIndex:(unint64_t)a3;
- (void)stop;
- (void)tracePlayerScheduler:(id)a3 didUpdatePosition:(double)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation MNTracePlayer

- (MNTracePlayer)initWithPath:(id)a3
{
  return [(MNTracePlayer *)self initWithPath:a3 outError:0];
}

- (MNTracePlayer)initWithPath:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(MNTraceLoader);
  v8 = [(MNTraceLoader *)v7 loadTraceWithPath:v6 outError:a4];

  if (v8)
  {
    self = [(MNTracePlayer *)self initWithTrace:v8];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MNTracePlayer)initWithTrace:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MNTracePlayer;
  id v6 = [(MNTracePlayer *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trace, a3);
    v8 = objc_alloc_init(MNTracePlayerScheduler);
    scheduler = v7->_scheduler;
    v7->_scheduler = v8;

    [(MNTracePlayerScheduler *)v7->_scheduler setDelegate:v7];
    id v10 = objc_alloc(MEMORY[0x1E4F647B0]);
    uint64_t v11 = [v10 initWithProtocol:&unk_1F0E42458 queue:MEMORY[0x1E4F14428]];
    observers = v7->_observers;
    v7->_observers = (GEOObserverHashTable *)v11;

    v13 = [(MNTrace *)v7->_trace locations];
    v14 = [v13 lastObject];
    [v14 timestamp];
    v7->_duration = v15;

    [(MNTracePlayer *)v7 setSpeedMultiplier:1.0];
    [(MNTracePlayer *)v7 _createTimelineStreams];
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    processedWaypointEvents = v7->_processedWaypointEvents;
    v7->_processedWaypointEvents = (NSMutableArray *)v16;

    v18 = v7;
  }

  return v7;
}

- (void)dealloc
{
  v3 = +[MNTimeManager sharedManager];
  [v3 setProvider:0];

  [(MNTracePlayerScheduler *)self->_scheduler setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)MNTracePlayer;
  [(MNTracePlayer *)&v4 dealloc];
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)start
{
}

- (void)startAtLocationIndex:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_isPlaying)
  {
    id v5 = [(MNTrace *)self->_trace locations];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = [(MNTrace *)self->_trace locations];
      unint64_t v8 = [v7 count];

      if (v8 <= a3)
      {
        v19 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_super v20 = [(MNTrace *)self->_trace locations];
          *(_DWORD *)buf = 67109376;
          int v23 = a3;
          __int16 v24 = 1024;
          int v25 = [v20 count];
          _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_ERROR, "Starting index (%d) out of bounds of location array: [0,%d]", buf, 0xEu);
        }
      }
      else
      {
        if (self->_traceStartTimestamp == 0.0)
        {
          v9 = [(MNTrace *)self->_trace locations];
          id v10 = [v9 firstObject];

          uint64_t v11 = [v10 location];
          v12 = [v11 timestamp];
          [v12 timeIntervalSinceReferenceDate];
          self->_traceStartTimestamp = v13;
        }
        *(_WORD *)&self->_isPlaying = 1;
        [(MNTracePlayerScheduler *)self->_scheduler resume];
        v14 = +[MNTimeManager sharedManager];
        [v14 setProvider:self];

        [(GEOObserverHashTable *)self->_observers tracePlayerDidStart:self];
        double v15 = [(MNTrace *)self->_trace locations];
        id v21 = [v15 objectAtIndex:a3];

        uint64_t v16 = [v21 location];
        v17 = [(MNTracePlayer *)self _locationWithCurrentDate:v16];
        [(GEOObserverHashTable *)self->_observers tracePlayer:self didUpdateLocation:v17];
        [v21 timestamp];
        -[MNTracePlayerScheduler setPosition:](self->_scheduler, "setPosition:");
      }
    }
    else
    {
      v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "Trace is empty", buf, 2u);
      }
    }
  }
}

- (void)stop
{
  v3 = +[MNTimeManager sharedManager];
  [v3 setProvider:0];

  [(MNTracePlayerScheduler *)self->_scheduler pause];
  *(_WORD *)&self->_isPlaying = 256;
  [(MNTracePlayerScheduler *)self->_scheduler removeAllTimelineStreams];
  locationStream = self->_locationStream;
  self->_locationStream = 0;

  etaUpdatesStream = self->_etaUpdatesStream;
  self->_etaUpdatesStream = 0;

  observers = self->_observers;
  [(GEOObserverHashTable *)observers tracePlayerDidStop:self];
}

- (void)pause
{
  if (self->_isPlaying && !self->_isPaused)
  {
    self->_isPaused = 1;
    [(MNTracePlayerScheduler *)self->_scheduler pause];
    observers = self->_observers;
    [(GEOObserverHashTable *)observers tracePlayerDidPause:self];
  }
}

- (void)resume
{
  if (self->_isPlaying && self->_isPaused)
  {
    self->_isPaused = 0;
    [(MNTracePlayerScheduler *)self->_scheduler resume];
    observers = self->_observers;
    [(GEOObserverHashTable *)observers tracePlayerDidResume:self];
  }
}

- (id)guidanceEventNearTimestamp:(double)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(MNTrace *)self->_trace navigationEvents];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {

    id v8 = 0;
LABEL_15:
    uint64_t v16 = 0;
    goto LABEL_16;
  }
  uint64_t v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v19;
  double v10 = 978307200.0;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      [v12 relativeTimestamp];
      double v14 = vabdd_f64(v13, a3);
      if (v14 < v10)
      {
        id v15 = v12;

        double v10 = v14;
        id v8 = v15;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v7);

  uint64_t v16 = 0;
  if (v8 && v10 < 5.0)
  {
    if ([(NSMutableArray *)self->_processedWaypointEvents indexOfObject:v8] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)self->_processedWaypointEvents addObject:v8];
      id v8 = v8;
      uint64_t v16 = v8;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v16;
}

- (BOOL)requestDirectionsNearTimestamp:(double)a3 withHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v7 = [(MNTrace *)self->_trace directions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (!v8)
  {

    goto LABEL_19;
  }
  uint64_t v9 = v8;
  double v10 = 0;
  uint64_t v11 = *(void *)v41;
  double v12 = 978307200.0;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v41 != v11) {
        objc_enumerationMutation(v7);
      }
      double v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      [v14 requestTimestamp];
      double v16 = vabdd_f64(v15, a3);
      if (v16 < v12)
      {
        v17 = v14;

        double v12 = v16;
        double v10 = v17;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v50 count:16];
  }
  while (v9);

  if (v12 >= 5.0)
  {
    if (v10)
    {
      v30 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        [v10 requestTimestamp];
        double v32 = v31;
        [(MNTracePlayer *)self position];
        *(_DWORD *)buf = 134218240;
        double v45 = v32;
        __int16 v46 = 2048;
        double v47 = v33;
        _os_log_impl(&dword_1B542B000, v30, OS_LOG_TYPE_INFO, "Found directions request, but request time (%0.2f) was not close to current playback time (%0.2f)", buf, 0x16u);
      }

LABEL_21:
      BOOL v29 = 0;
      goto LABEL_22;
    }
LABEL_19:
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Didn't find any directions in trace.", buf, 2u);
    }
    goto LABEL_21;
  }
  long long v18 = [v10 response];
  long long v19 = [v10 error];
  [v10 requestTimestamp];
  double v21 = v20;
  [v10 responseTimestamp];
  double v23 = v22 - v21;
  double v24 = fmin(v22 - v21, 0.01);
  int v25 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    double v45 = v21;
    __int16 v46 = 2048;
    double v47 = v24;
    __int16 v48 = 2048;
    double v49 = v23;
    _os_log_impl(&dword_1B542B000, v25, OS_LOG_TYPE_INFO, "Found nearby request with timestamp %0.2f. Playing back with response delay of %0.1f seconds (original delay %0.1f seconds)", buf, 0x20u);
  }

  dispatch_time_t v26 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __60__MNTracePlayer_requestDirectionsNearTimestamp_withHandler___block_invoke;
  v35[3] = &unk_1E60FB800;
  id v36 = v18;
  id v38 = v19;
  id v39 = v6;
  v37 = v10;
  id v27 = v19;
  double v10 = v10;
  id v28 = v18;
  dispatch_after(v26, MEMORY[0x1E4F14428], v35);

  BOOL v29 = 1;
LABEL_22:

  return v29;
}

void __60__MNTracePlayer_requestDirectionsNearTimestamp_withHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 56);
    if (v2)
    {
      id v9 = [*(id *)(a1 + 40) waypoints];
      v3 = [*(id *)(a1 + 40) request];
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = [*(id *)(a1 + 40) error];
      (*(void (**)(uint64_t, id, void *, uint64_t, void *, void))(v2 + 16))(v2, v9, v3, v4, v5, 0);
    }
  }
  else if (*(void *)(a1 + 48))
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      uint64_t v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
  else
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "Found directions request, but no response", buf, 2u);
    }
  }
}

- (void)jumpToTime:(double)a3
{
  [(MNTracePlayerScheduler *)self->_scheduler position];
  double v6 = v5;
  [(MNTracePlayerScheduler *)self->_scheduler setPosition:a3];
  lastReportedLocation = self->_lastReportedLocation;
  self->_lastReportedLocation = 0;

  [(NSMutableArray *)self->_processedWaypointEvents removeAllObjects];
  if (self->_shouldUpdateRouteWhenJumping)
  {
    uint64_t v8 = [(MNTracePlayer *)self _changeRouteRowForTimestamp:a3];
    if (!v8)
    {
      uint64_t v8 = objc_alloc_init(MNTraceNavigationUpdatesChangeRouteRow);
      [(MNTraceNavigationUpdatesRow *)v8 setTimestamp:a3];
    }
    id v9 = [(MNTracePlayer *)self _routeForRouteChangeRow:v8];
    if (v9)
    {
      [(GEOObserverHashTable *)self->_observers tracePlayer:self didUpdateCurrentRoute:v9 reason:0];
      double v10 = [(MNTracePlayer *)self _locationRowBeforeTimestamp:a3];
      if (!v10) {
        goto LABEL_16;
      }
      goto LABEL_6;
    }
    goto LABEL_15;
  }
  if (GEOConfigGetBOOL())
  {
    uint64_t v8 = objc_alloc_init(MNTraceDirectionsRow);
    [(MNTraceNavigationUpdatesChangeRouteRow *)v8 setRequestTimestamp:a3];
    uint64_t v11 = [(MNTrace *)self->_trace directions];
    double v12 = [(MNTrace *)self->_trace directions];
    uint64_t v13 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(v12, "count"), 1024, &__block_literal_global_44);

    unint64_t v14 = v13 - 1;
    if (v13 != 1)
    {
      double v15 = [(MNTrace *)self->_trace directions];
      unint64_t v16 = [v15 count];

      if (v14 < v16)
      {
        v17 = [(MNTrace *)self->_trace directions];
        long long v18 = [v17 objectAtIndexedSubscript:v14];

        observers = self->_observers;
        double v20 = [v18 response];
        double v21 = [v18 request];
        double v22 = [v18 waypoints];
        [(GEOObserverHashTable *)observers tracePlayer:self didJumpToRouteResponse:v20 request:v21 waypoints:v22];
      }
    }
    id v9 = objc_alloc_init(MNTraceLocationRow);
    [(MNTraceLocationRow *)v9 setTimestamp:a3];
    double v23 = [(MNTrace *)self->_trace locations];
    double v24 = [(MNTrace *)self->_trace locations];
    uint64_t v25 = objc_msgSend(v23, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(v24, "count"), 1024, &__block_literal_global_116);

    unint64_t v26 = v25 - 1;
    if (v25 != 1)
    {
      id v27 = [(MNTrace *)self->_trace locations];
      unint64_t v28 = [v27 count];

      if (v26 < v28)
      {
        BOOL v29 = [(MNTrace *)self->_trace locations];
        double v10 = [v29 objectAtIndexedSubscript:v26];

LABEL_6:
        if ([v10 originalMatchType] == 1)
        {
          id v30 = [v10 location];
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        id v30 = 0;
        goto LABEL_17;
      }
    }
LABEL_15:
    id v30 = 0;
LABEL_18:

    [(GEOObserverHashTable *)self->_observers tracePlayer:self didSeekToTime:v30 fromTime:a3 location:v6];
    goto LABEL_19;
  }
  id v30 = 0;
  [(GEOObserverHashTable *)self->_observers tracePlayer:self didSeekToTime:0 fromTime:a3 location:v6];
LABEL_19:
}

uint64_t __28__MNTracePlayer_jumpToTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  [a2 requestTimestamp];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 requestTimestamp];
  double v9 = v8;

  double v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __28__MNTracePlayer_jumpToTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  double v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (void)jumpToLocationAtIndex:(unint64_t)a3
{
  id v5 = [(MNTrace *)self->_trace locations];
  id v7 = [v5 objectAtIndex:a3];

  [v7 timestamp];
  -[MNTracePlayerScheduler setPosition:](self->_scheduler, "setPosition:");
  lastReportedLocation = self->_lastReportedLocation;
  self->_lastReportedLocation = 0;

  [(NSMutableArray *)self->_processedWaypointEvents removeAllObjects];
}

- (void)skipByTimeInterval:(double)a3
{
  [(MNTracePlayer *)self position];
  double v6 = v5 + a3;
  [(MNTracePlayer *)self jumpToTime:v6];
}

- (void)jumpToBookmarkAtIndex:(unint64_t)a3
{
  double v5 = [(MNTracePlayer *)self trace];
  double v6 = [v5 bookmarks];
  id v8 = [v6 objectAtIndex:a3];

  [v8 doubleValue];
  [(MNTracePlayer *)self jumpToTime:v7 + -5.0];
}

- (double)position
{
  [(MNTracePlayerScheduler *)self->_scheduler position];
  return result;
}

- (double)currentTime
{
  double traceStartTimestamp = self->_traceStartTimestamp;
  [(MNTracePlayer *)self position];
  return traceStartTimestamp + v3;
}

- (void)setSpeedMultiplier:(double)a3
{
  if (self->_speedMultiplier != a3)
  {
    self->_speedMultiplier = a3;
    -[MNTracePlayerScheduler setSpeedMultiplier:](self->_scheduler, "setSpeedMultiplier:");
  }
}

- (void)tracePlayerScheduler:(id)a3 didUpdatePosition:(double)a4
{
}

- (void)_createTimelineStreams
{
  objc_initWeak(&location, self);
  double v3 = [(MNTrace *)self->_trace locations];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    double v5 = [MNTracePlayerTimelineStream alloc];
    double v6 = [(MNTrace *)self->_trace locations];
    double v7 = [(MNTracePlayerTimelineStream *)v5 initWithData:v6];

    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke;
    v51[3] = &unk_1E60FB868;
    objc_copyWeak(&v52, &location);
    [(MNTracePlayerTimelineStream *)v7 setHandler:v51];
    [(MNTracePlayerScheduler *)self->_scheduler addTimelineStream:v7];
    locationStream = self->_locationStream;
    self->_locationStream = v7;

    objc_destroyWeak(&v52);
  }
  double v9 = [(MNTrace *)self->_trace vehicleHeadingData];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [MNTracePlayerTimelineStream alloc];
    double v12 = [(MNTrace *)self->_trace vehicleHeadingData];
    uint64_t v13 = [(MNTracePlayerTimelineStream *)v11 initWithData:v12];

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_119;
    v49[3] = &unk_1E60FB868;
    objc_copyWeak(&v50, &location);
    [(MNTracePlayerTimelineStream *)v13 setHandler:v49];
    [(MNTracePlayerScheduler *)self->_scheduler addTimelineStream:v13];
    objc_destroyWeak(&v50);
  }
  unint64_t v14 = [(MNTrace *)self->_trace vehicleSpeedData];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    unint64_t v16 = [MNTracePlayerTimelineStream alloc];
    v17 = [(MNTrace *)self->_trace vehicleSpeedData];
    long long v18 = [(MNTracePlayerTimelineStream *)v16 initWithData:v17];

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_2;
    v47[3] = &unk_1E60FB868;
    objc_copyWeak(&v48, &location);
    [(MNTracePlayerTimelineStream *)v18 setHandler:v47];
    [(MNTracePlayerScheduler *)self->_scheduler addTimelineStream:v18];
    objc_destroyWeak(&v48);
  }
  long long v19 = [(MNTrace *)self->_trace motionData];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    double v21 = [MNTracePlayerTimelineStream alloc];
    double v22 = [(MNTrace *)self->_trace motionData];
    double v23 = [(MNTracePlayerTimelineStream *)v21 initWithData:v22];

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_3;
    v45[3] = &unk_1E60FB868;
    objc_copyWeak(&v46, &location);
    [(MNTracePlayerTimelineStream *)v23 setHandler:v45];
    [(MNTracePlayerScheduler *)self->_scheduler addTimelineStream:v23];
    objc_destroyWeak(&v46);
  }
  double v24 = [(MNTrace *)self->_trace headingData];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    unint64_t v26 = [MNTracePlayerTimelineStream alloc];
    id v27 = [(MNTrace *)self->_trace headingData];
    unint64_t v28 = [(MNTracePlayerTimelineStream *)v26 initWithData:v27];

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_4;
    v43[3] = &unk_1E60FB868;
    objc_copyWeak(&v44, &location);
    [(MNTracePlayerTimelineStream *)v28 setHandler:v43];
    [(MNTracePlayerScheduler *)self->_scheduler addTimelineStream:v28];
    objc_destroyWeak(&v44);
  }
  BOOL v29 = [(MNTrace *)self->_trace evData];
  uint64_t v30 = [v29 count];

  if (v30)
  {
    double v31 = [MNTracePlayerTimelineStream alloc];
    double v32 = [(MNTrace *)self->_trace evData];
    double v33 = [(MNTracePlayerTimelineStream *)v31 initWithData:v32];

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_5;
    v41[3] = &unk_1E60FB868;
    objc_copyWeak(&v42, &location);
    [(MNTracePlayerTimelineStream *)v33 setHandler:v41];
    [(MNTracePlayerScheduler *)self->_scheduler addTimelineStream:v33];
    objc_destroyWeak(&v42);
  }
  v34 = [(MNTrace *)self->_trace navigationUpdates];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    id v36 = [MNTracePlayerTimelineStream alloc];
    v37 = [(MNTrace *)self->_trace navigationUpdates];
    id v38 = [(MNTracePlayerTimelineStream *)v36 initWithData:v37];

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_6;
    v39[3] = &unk_1E60FB890;
    objc_copyWeak(&v40, &location);
    v39[4] = self;
    [(MNTracePlayerTimelineStream *)v38 setHandler:v39];
    [(MNTracePlayerScheduler *)self->_scheduler addTimelineStream:v38];
    objc_destroyWeak(&v40);
  }
  objc_destroyWeak(&location);
}

void __39__MNTracePlayer__createTimelineStreams__block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    double v7 = [WeakRetained trace];
    id v8 = [v7 locations];
    double v9 = [v8 objectAtIndex:a2];

    uint64_t v10 = [v9 locationEventType];
    uint64_t v11 = [v9 location];
    double v12 = [v9 error];
    uint64_t v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v18[0] = 67109376;
      v18[1] = a2;
      __int16 v19 = 2048;
      double v20 = a3;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_INFO, "Trace index: %d | timestamp: %0.2f\n", (uint8_t *)v18, 0x12u);
    }

    switch(v10)
    {
      case 2:
        unint64_t v16 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18[0]) = 0;
          _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_INFO, "Trace resumes location updates.", (uint8_t *)v18, 2u);
        }

        [v6[3] tracePlayerDidResumeLocationUpdates:v6];
        break;
      case 1:
        v17 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18[0]) = 0;
          _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_INFO, "Trace paused location updates.", (uint8_t *)v18, 2u);
        }

        [v6[3] tracePlayerDidPauseLocationUpdates:v6];
        break;
      case 0:
        if (v11)
        {
          uint64_t v14 = [v6 _locationWithCurrentDate:v11];
          [v6[3] tracePlayer:v6 didUpdateLocation:v14];
          id v15 = v6[6];
          v6[6] = (id)v14;
LABEL_17:

          break;
        }
        if (v12)
        {
          [v6[3] tracePlayer:v6 didReceiveLocationError:v12];
          id v15 = v6[6];
          v6[6] = 0;
          goto LABEL_17;
        }
        break;
    }
  }
}

void __39__MNTracePlayer__createTimelineStreams__block_invoke_119(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    double v7 = [WeakRetained trace];
    id v8 = [v7 vehicleHeadingData];
    double v9 = [v8 objectAtIndex:a2];

    [v9 vehicleHeading];
    objc_msgSend(v6[3], "tracePlayer:didUpdateVehicleHeading:timestamp:", v6, v10);
  }
}

void __39__MNTracePlayer__createTimelineStreams__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    double v7 = [WeakRetained trace];
    id v8 = [v7 vehicleSpeedData];
    double v9 = [v8 objectAtIndex:a2];

    [v9 vehicleSpeed];
    objc_msgSend(v6[3], "tracePlayer:didUpdateVehicleSpeed:timestamp:", v6, v10);
  }
}

void __39__MNTracePlayer__createTimelineStreams__block_invoke_3(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v7 = WeakRetained;
    uint64_t v4 = [WeakRetained trace];
    double v5 = [v4 motionData];
    double v6 = [v5 objectAtIndex:a2];

    objc_msgSend(v7[3], "tracePlayer:didUpdateMotion:exitType:confidence:", v7, objc_msgSend(v6, "motionType"), objc_msgSend(v6, "exitType"), objc_msgSend(v6, "confidence"));
    WeakRetained = v7;
  }
}

void __39__MNTracePlayer__createTimelineStreams__block_invoke_4(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = [WeakRetained trace];
    double v6 = [v5 headingData];
    double v7 = [v6 objectAtIndex:a2];

    [v7 trueHeading];
    uint64_t v9 = v8;
    [v7 magneticHeading];
    uint64_t v11 = v10;
    [v7 headingAccuracy];
    memset(v14, 0, 24);
    v14[3] = v11;
    v14[4] = v9;
    v14[5] = v12;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v17 = 0;
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1E5E0]) initWithClientHeading:v14];
    [v4[3] tracePlayer:v4 didUpdateHeading:v13];
  }
}

void __39__MNTracePlayer__createTimelineStreams__block_invoke_5(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained;
    uint64_t v4 = [WeakRetained trace];
    double v5 = [v4 evData];
    double v6 = [v5 objectAtIndexedSubscript:a2];

    double v7 = (void *)v9[3];
    uint64_t v8 = [v6 vehicle];
    [v7 tracePlayer:v9 didUpdateEVData:v8];

    WeakRetained = v9;
  }
}

uint64_t __39__MNTracePlayer__createTimelineStreams__block_invoke_6(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    long long v18 = WeakRetained;
    double v6 = [WeakRetained trace];
    double v7 = [v6 navigationUpdates];
    uint64_t v8 = [v7 objectAtIndex:a2];
    uint64_t v9 = [v8 navigationUpdateType];

    if (v9 == 2)
    {
      WeakRetained = (void *)GEOConfigGetBOOL();
      double v5 = v18;
      if (!WeakRetained) {
        goto LABEL_13;
      }
      uint64_t v14 = [v18 trace];
      long long v15 = [v14 navigationUpdates];
      uint64_t v12 = [v15 objectAtIndex:a2];

      if ([v12 reason] != 1) {
        goto LABEL_12;
      }
      long long v16 = *(void **)(*(void *)(a1 + 32) + 24);
      uint64_t v13 = [v12 waypoint];
      objc_msgSend(v16, "tracePlayer:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:", v18, v13, objc_msgSend(v12, "legIndex"), objc_msgSend(v12, "reason"));
      goto LABEL_11;
    }
    double v5 = v18;
    if (v9 == 1)
    {
      WeakRetained = (void *)GEOConfigGetBOOL();
      double v5 = v18;
      if (WeakRetained)
      {
        uint64_t v10 = [v18 trace];
        uint64_t v11 = [v10 navigationUpdates];
        uint64_t v12 = [v11 objectAtIndex:a2];

        if (![v12 reason])
        {
LABEL_12:

          double v5 = v18;
          goto LABEL_13;
        }
        uint64_t v13 = [v18 _routeForRouteChangeRow:v12];
        if (v13) {
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "tracePlayer:didUpdateCurrentRoute:reason:", v18, v13, objc_msgSend(v12, "reason"));
        }
LABEL_11:

        goto LABEL_12;
      }
    }
  }
LABEL_13:
  return MEMORY[0x1F41817F8](WeakRetained, v5);
}

- (void)setShouldPlayETARequests:(BOOL)a3
{
  if (self->_shouldPlayETARequests != a3)
  {
    self->_shouldPlayETARequests = a3;
    if (a3)
    {
      uint64_t v4 = [(MNTrace *)self->_trace etaUpdates];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        double v6 = [MNTracePlayerTimelineStream alloc];
        double v7 = [(MNTrace *)self->_trace etaUpdates];
        uint64_t v8 = [(MNTracePlayerTimelineStream *)v6 initWithData:v7];
        etaUpdatesStream = self->_etaUpdatesStream;
        self->_etaUpdatesStream = v8;

        objc_initWeak(&location, self);
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        long long v16 = __42__MNTracePlayer_setShouldPlayETARequests___block_invoke;
        uint64_t v17 = &unk_1E60FB868;
        objc_copyWeak(&v18, &location);
        [(MNTracePlayerTimelineStream *)self->_etaUpdatesStream setHandler:&v14];
        -[MNTracePlayerScheduler addTimelineStream:](self->_scheduler, "addTimelineStream:", self->_etaUpdatesStream, v14, v15, v16, v17);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      uint64_t v10 = objc_alloc_init(MNTracePlayerETAUpdater);
      etaUpdater = self->_etaUpdater;
      self->_etaUpdater = v10;
    }
    else
    {
      [(MNTracePlayerScheduler *)self->_scheduler removeTimelineStream:self->_etaUpdatesStream];
      uint64_t v12 = self->_etaUpdatesStream;
      self->_etaUpdatesStream = 0;

      uint64_t v13 = self->_etaUpdater;
      self->_etaUpdater = 0;
    }
  }
}

void __42__MNTracePlayer_setShouldPlayETARequests___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((unsigned char *)WeakRetained + 81))
  {
    double v7 = WeakRetained;
    uint64_t v4 = [WeakRetained trace];
    uint64_t v5 = [v4 etaUpdates];
    double v6 = [v5 objectAtIndex:a2];

    [v7[11] playETAUpdate:v6];
    WeakRetained = v7;
  }
}

- (MNSessionUpdateManager)sessionUpdater
{
  return (MNSessionUpdateManager *)self->_etaUpdater;
}

- (void)setShouldPlayNetworkEvents:(BOOL)a3
{
  if (self->_shouldPlayNetworkEvents != a3)
  {
    self->_shouldPlayNetworkEvents = a3;
    if (a3)
    {
      uint64_t v4 = [(MNTrace *)self->_trace networkEvents];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        double v6 = [MNTracePlayerTimelineStream alloc];
        double v7 = [(MNTrace *)self->_trace networkEvents];
        uint64_t v8 = [(MNTracePlayerTimelineStream *)v6 initWithData:v7];
        networkEventsStream = self->_networkEventsStream;
        self->_networkEventsStream = v8;

        objc_initWeak(&location, self);
        uint64_t v11 = MEMORY[0x1E4F143A8];
        uint64_t v12 = 3221225472;
        uint64_t v13 = __44__MNTracePlayer_setShouldPlayNetworkEvents___block_invoke;
        uint64_t v14 = &unk_1E60FB868;
        objc_copyWeak(&v15, &location);
        [(MNTracePlayerTimelineStream *)self->_networkEventsStream setHandler:&v11];
        -[MNTracePlayerScheduler addTimelineStream:](self->_scheduler, "addTimelineStream:", self->_networkEventsStream, v11, v12, v13, v14);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      [(MNTracePlayerScheduler *)self->_scheduler removeTimelineStream:self->_networkEventsStream];
      uint64_t v10 = self->_networkEventsStream;
      self->_networkEventsStream = 0;
    }
  }
}

void __44__MNTracePlayer_setShouldPlayNetworkEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((unsigned char *)WeakRetained + 104))
  {
    double v7 = WeakRetained;
    uint64_t v4 = [WeakRetained trace];
    uint64_t v5 = [v4 networkEvents];
    double v6 = [v5 objectAtIndexedSubscript:a2];

    [v7[3] tracePlayer:v7 didRecieveNetworkEvent:v6];
    WeakRetained = v7;
  }
}

- (id)_locationWithCurrentDate:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  if (self->_lastReportedLocation)
  {
    double v7 = [v4 timestamp];
    uint64_t v8 = [(MNLocation *)self->_lastReportedLocation originalDate];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    if (v10 < 0.0)
    {
      double v11 = v10 / self->_speedMultiplier;
      uint64_t v12 = [(MNLocation *)self->_lastReportedLocation timestamp];
      [v12 timeIntervalSinceReferenceDate];
      double v6 = v11 + v13;
    }
  }
  long long v29 = 0u;
  memset(v30, 0, 28);
  long long v28 = 0u;
  long long v26 = 0u;
  memset(v27, 0, sizeof(v27));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  if (v4) {
    [v4 clientLocation];
  }
  *(double *)((char *)v27 + 12) = v6;
  uint64_t v14 = [MNLocation alloc];
  id v15 = [v4 matchInfo];
  v21[6] = v28;
  v21[7] = v29;
  v22[0] = v30[0];
  *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)((char *)v30 + 12);
  v21[2] = v25;
  v21[3] = v26;
  v21[4] = v27[0];
  v21[5] = v27[1];
  v21[0] = v23;
  v21[1] = v24;
  long long v16 = [(MNLocation *)v14 initWithClientLocation:v21 matchInfo:v15];

  if (GEOConfigGetBOOL())
  {
    uint64_t v17 = [(MNLocation *)v16 uuid];

    if (!v17)
    {
      id v18 = [MEMORY[0x1E4F29128] UUID];
      [(MNLocation *)v16 setUuid:v18];
    }
  }
  __int16 v19 = [v4 timestamp];
  [(MNLocation *)v16 setOriginalDate:v19];

  return v16;
}

- (id)_locationRowBeforeTimestamp:(double)a3
{
  double v5 = objc_alloc_init(MNTraceLocationRow);
  [(MNTraceLocationRow *)v5 setTimestamp:a3];
  double v6 = [(MNTrace *)self->_trace locations];
  double v7 = [(MNTrace *)self->_trace locations];
  uint64_t v8 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v7, "count"), 1024, &__block_literal_global_126);

  if (v8) {
    unint64_t v9 = v8 - 1;
  }
  else {
    unint64_t v9 = 0;
  }
  double v10 = [(MNTrace *)self->_trace locations];
  unint64_t v11 = [v10 count];

  uint64_t v12 = 0;
  if (v9 < v11)
  {
    double v13 = [(MNTrace *)self->_trace locations];
    uint64_t v12 = [v13 objectAtIndexedSubscript:v9];
  }
  return v12;
}

uint64_t __45__MNTracePlayer__locationRowBeforeTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  double v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  double v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)_changeRouteRowForTimestamp:(double)a3
{
  id v4 = [(MNTrace *)self->_trace navigationUpdates];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_130];
  double v6 = [v4 filteredArrayUsingPredicate:v5];

  double v7 = objc_alloc_init(MNTraceNavigationUpdatesChangeRouteRow);
  [(MNTraceNavigationUpdatesRow *)v7 setTimestamp:a3];
  uint64_t v8 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v6, "count"), 1024, &__block_literal_global_133);
  if (v8) {
    unint64_t v9 = v8 - 1;
  }
  else {
    unint64_t v9 = 0;
  }
  if (v9 >= [v6 count]) {
    [v6 firstObject];
  }
  else {
  double v10 = [v6 objectAtIndexedSubscript:v9];
  }

  return v10;
}

BOOL __45__MNTracePlayer__changeRouteRowForTimestamp___block_invoke(uint64_t a1, void *a2)
{
  return [a2 navigationUpdateType] == 1;
}

uint64_t __45__MNTracePlayer__changeRouteRowForTimestamp___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  double v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  double v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (unint64_t)_directionsRowIndexBeforeTimestamp:(double)a3
{
  id v5 = objc_alloc_init(MNTraceDirectionsRow);
  [(MNTraceDirectionsRow *)v5 setResponseTimestamp:a3];
  double v6 = [(MNTrace *)self->_trace directions];
  double v7 = [(MNTrace *)self->_trace directions];
  uint64_t v8 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v7, "count"), 1024, &__block_literal_global_135_0);

  if (v8) {
    unint64_t v9 = v8 - 1;
  }
  else {
    unint64_t v9 = 0;
  }

  return v9;
}

uint64_t __52__MNTracePlayer__directionsRowIndexBeforeTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 responseTimestamp];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  double v7 = NSNumber;
  [v5 responseTimestamp];
  double v9 = v8;

  double v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)_directionsRowForChangeRouteRow:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 directionsResponseID], double v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    [v5 timestamp];
    unint64_t v7 = -[MNTracePlayer _directionsRowIndexBeforeTimestamp:](self, "_directionsRowIndexBeforeTimestamp:");
    double v8 = [(MNTrace *)self->_trace directions];
    unint64_t v9 = [v8 count];

    double v10 = 0;
    if ((v7 & 0x8000000000000000) == 0 && v7 < v9)
    {
      while (1)
      {
        uint64_t v11 = [(MNTrace *)self->_trace directions];
        double v10 = [v11 objectAtIndexedSubscript:v7];

        uint64_t v12 = [v10 response];
        double v13 = [v12 directionsResponseID];
        uint64_t v14 = [v5 directionsResponseID];
        char v15 = [v13 isEqualToData:v14];

        if (v15) {
          break;
        }

        if ((uint64_t)v7-- <= 0) {
          goto LABEL_8;
        }
      }
    }
  }
  else
  {
LABEL_8:
    double v10 = 0;
  }

  return v10;
}

- (id)_etauRowForChangeRouteRow:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 etauResponseID], double v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    unint64_t v7 = objc_alloc_init(MNTraceETAUpdateRow);
    [v5 timestamp];
    -[MNTraceETAUpdateRow setResponseTimestamp:](v7, "setResponseTimestamp:");
    double v8 = [(MNTrace *)self->_trace etaUpdates];
    unint64_t v9 = [(MNTrace *)self->_trace etaUpdates];
    uint64_t v10 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v9, "count"), 1024, &__block_literal_global_139);

    if (v10) {
      unint64_t v11 = v10 - 1;
    }
    else {
      unint64_t v11 = 0;
    }
    uint64_t v12 = [(MNTrace *)self->_trace etaUpdates];
    unint64_t v13 = [v12 count];

    uint64_t v14 = 0;
    if ((v11 & 0x8000000000000000) == 0 && v11 < v13)
    {
      while (1)
      {
        char v15 = [(MNTrace *)self->_trace etaUpdates];
        uint64_t v14 = [v15 objectAtIndexedSubscript:v11];

        long long v16 = [v14 response];
        uint64_t v17 = [v16 responseId];
        id v18 = [v5 etauResponseID];
        char v19 = [v17 isEqualToData:v18];

        if (v19) {
          break;
        }

        if ((uint64_t)v11-- <= 0)
        {
          uint64_t v14 = 0;
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t __43__MNTracePlayer__etauRowForChangeRouteRow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 responseTimestamp];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  unint64_t v7 = NSNumber;
  [v5 responseTimestamp];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)_routeForRouteChangeRow:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    double v6 = [v4 directionsResponseID];

    if (v6)
    {
      uint64_t v7 = [(MNTracePlayer *)self _directionsRowForChangeRouteRow:v5];
      if (v7)
      {
        double v8 = (void *)v7;
LABEL_5:
        id v9 = objc_alloc(MEMORY[0x1E4F649D0]);
        uint64_t v10 = [v8 waypoints];
        uint64_t v11 = [v8 request];
        uint64_t v12 = [v11 routeAttributes];
        unint64_t v13 = [v8 response];
        uint64_t v14 = [v8 request];
        char v15 = (void *)[v9 initWithWaypoints:v10 routeAttributes:v12 directionsResponse:v13 directionsRequest:v14];

        long long v16 = [v15 allRouteInfos];
        goto LABEL_6;
      }
    }
    else
    {
      double v20 = [v5 etauResponseID];

      if (v20)
      {
        uint64_t v21 = [(MNTracePlayer *)self _etauRowForChangeRouteRow:v5];
        double v8 = v21;
        if (!v21
          || ([v21 requestTimestamp],
              unint64_t v22 = -[MNTracePlayer _directionsRowIndexBeforeTimestamp:](self, "_directionsRowIndexBeforeTimestamp:"),
              [(MNTrace *)self->_trace directions],
              long long v23 = objc_claimAutoreleasedReturnValue(),
              unint64_t v24 = [v23 count],
              v23,
              v22 >= v24))
        {
          char v19 = 0;
LABEL_15:

          goto LABEL_19;
        }
        long long v25 = [(MNTrace *)self->_trace directions];
        char v15 = [v25 objectAtIndexedSubscript:v22];

        id v26 = objc_alloc(MEMORY[0x1E4F649D0]);
        id v27 = [v15 waypoints];
        long long v28 = [v15 request];
        long long v29 = [v28 routeAttributes];
        uint64_t v30 = [v8 response];
        double v31 = [v15 response];
        double v32 = [v31 styleAttributes];
        double v33 = (void *)[v26 initWithWaypoints:v27 routeAttributes:v29 etauResponse:v30 styleAttributes:v32];

        long long v16 = [v33 allETAUAlternateRouteInfos];

LABEL_6:
        unint64_t v17 = [v5 routeIndex];
        if (v17 >= [v16 count])
        {
          char v19 = 0;
        }
        else
        {
          id v18 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v5, "routeIndex"));
          char v19 = [v18 route];
        }
        double v8 = v16;
        goto LABEL_15;
      }
      [v5 timestamp];
      unint64_t v34 = -[MNTracePlayer _directionsRowIndexBeforeTimestamp:](self, "_directionsRowIndexBeforeTimestamp:");
      uint64_t v35 = [(MNTrace *)self->_trace directions];
      unint64_t v36 = [v35 count];

      if (v34 < v36)
      {
        v37 = [(MNTrace *)self->_trace directions];
        double v8 = [v37 objectAtIndexedSubscript:v34];

        goto LABEL_5;
      }
    }
  }
  char v19 = 0;
LABEL_19:

  return v19;
}

- (MNTrace)trace
{
  return self->_trace;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (double)duration
{
  return self->_duration;
}

- (double)speedMultiplier
{
  return self->_speedMultiplier;
}

- (BOOL)shouldUpdateRouteWhenJumping
{
  return self->_shouldUpdateRouteWhenJumping;
}

- (void)setShouldUpdateRouteWhenJumping:(BOOL)a3
{
  self->_shouldUpdateRouteWhenJumping = a3;
}

- (BOOL)shouldPlayNetworkEvents
{
  return self->_shouldPlayNetworkEvents;
}

- (BOOL)shouldPlayETARequests
{
  return self->_shouldPlayETARequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedWaypointEvents, 0);
  objc_storeStrong((id *)&self->_networkEventsStream, 0);
  objc_storeStrong((id *)&self->_etaUpdatesStream, 0);
  objc_storeStrong((id *)&self->_etaUpdater, 0);
  objc_storeStrong((id *)&self->_lastReportedLocation, 0);
  objc_storeStrong((id *)&self->_locationStream, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_trace, 0);
}

@end