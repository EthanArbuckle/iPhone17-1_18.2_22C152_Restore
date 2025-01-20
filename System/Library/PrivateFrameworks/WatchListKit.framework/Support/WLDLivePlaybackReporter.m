@interface WLDLivePlaybackReporter
+ (id)_contentEventFromSummary:(id)a3 schedule:(id)a4 event:(id)a5;
+ (void)_decorateEBSSummary:(id)a3 completion:(id)a4;
+ (void)_decorateLiveSummary:(id)a3 completion:(id)a4;
+ (void)decorateSummary:(id)a3 completion:(id)a4;
- (WLDLivePlaybackReporter)initWithSessionID:(id)a3;
- (WLKPlaybackSummary)lastSummary;
- (WLKTransactionScope)transaction;
- (id)_debugStringForInput:(unint64_t)a3;
- (id)schedule;
- (unint64_t)state;
- (void)_configureTimerForDate:(id)a3 playbackDate:(id)a4 input:(unint64_t)a5;
- (void)_evaluateEventsForReportingWithPlaybackDate:(id)a3 schedule:(id)a4 completion:(id)a5;
- (void)_evaluateScheduleWithPlaybackDate:(id)a3;
- (void)_getScheduleWithPlaybackDate:(id)a3 completion:(id)a4;
- (void)_handlePlayerStateDidBecomePlayingWithCompletion:(id)a3;
- (void)_handleTimerFiredAtEventStart:(id)a3;
- (void)_handleTimerFiredAtScheduleBoundary:(id)a3;
- (void)_invalidateTimer;
- (void)_processInput:(unint64_t)a3 completion:(id)a4;
- (void)_reportPlayEvents:(id)a3 account:(id)a4 completion:(id)a5;
- (void)getCachedCanonicalIDForSummary:(id)a3 completionHandler:(id)a4;
- (void)reportPlayback:(id)a3 completion:(id)a4;
- (void)setLastSummary:(id)a3;
- (void)setSchedule:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTransaction:(id)a3;
@end

@implementation WLDLivePlaybackReporter

- (WLDLivePlaybackReporter)initWithSessionID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLDLivePlaybackReporter;
  v6 = [(WLDLivePlaybackReporter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionID, a3);
    v7->_scheduleAlreadyFetchedAtBoundary = 0;
    [(WLDLivePlaybackReporter *)v7 setState:1];
  }

  return v7;
}

- (void)reportPlayback:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = WLDDispatchQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke;
  block[3] = &unk_100044EC8;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke(id *a1)
{
  id v2 = a1[4];
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_2;
    v5[3] = &unk_100044EF0;
    id v3 = a1[6];
    id v4 = a1[5];
    id v7 = v3;
    v5[4] = v4;
    id v6 = v2;
    [v6 resolveChannelID:v5];
  }
  else
  {
    NSLog(&CFSTR("WLDLivePlaybackReporter: Received nil summary, performing cleanup, calling completion and returning early cau"
                 "se no need to report a tune out").isa);
    [a1[5] _invalidateTimer];
    [a1[5] setTransaction:0];
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = WLDDispatchQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_3;
    block[3] = &unk_100044EC8;
    v8 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v10 = v8;
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v7, block);
  }
  else
  {
    NSLog(@"WLDLivePlaybackReporter: Error: Failed to resolve channel %@", v5);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_3(id *a1)
{
  [a1[4] setLastSummary:a1[5]];
  id v2 = [a1[5] playbackState];
  id v3 = a1[4];
  if (v2 == (id)1)
  {
    id v4 = [a1[4] transaction];

    if (!v4)
    {
      id v5 = a1[4];
      id v6 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDLivePlaybackReporter._processInput"];
      [v5 setTransaction:v6];
    }
    id v7 = a1[4];
    id v8 = a1[6];
    [v7 _processInput:0 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_4;
    v9[3] = &unk_100044EA0;
    v9[4] = v3;
    id v10 = a1[6];
    [v3 _processInput:1 completion:v9];
  }
}

void __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setTransaction:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getCachedCanonicalIDForSummary:(id)a3 completionHandler:(id)a4
{
  id v9 = (void (**)(id, void *, void))a4;
  id v5 = [(WLDLivePlaybackReporter *)self schedule];

  if (v5)
  {
    id v6 = [(WLDLivePlaybackReporter *)self schedule];
    id v7 = +[NSDate date];
    id v8 = [v6 eventForDate:v7];

    if (v8)
    {
      id v5 = [v8 canonicalID];
    }
    else
    {
      id v5 = 0;
    }
  }
  v9[2](v9, v5, 0);
}

- (id)schedule
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_schedule;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSchedule:(id)a3
{
  id v6 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (([(WLKSchedule *)v5->_schedule isEqual:v6] & 1) == 0) {
    objc_storeStrong((id *)&v5->_schedule, a3);
  }
  objc_sync_exit(v5);
}

+ (void)decorateSummary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 playbackType] == (id)2)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __54__WLDLivePlaybackReporter_decorateSummary_completion___block_invoke;
    v12[3] = &unk_100044F18;
    id v13 = v7;
    [a1 _decorateLiveSummary:v6 completion:v12];
    id v8 = v13;
  }
  else
  {
    if ([v6 playbackType] != (id)1)
    {
      NSLog(@"WLDLivePlaybackReporter: decorate failed -- unsupported playback type");
      id v9 = WLKError();
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);

      goto LABEL_7;
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __54__WLDLivePlaybackReporter_decorateSummary_completion___block_invoke_2;
    v10[3] = &unk_100044F18;
    id v11 = v7;
    [a1 _decorateEBSSummary:v6 completion:v10];
    id v8 = v11;
  }

LABEL_7:
}

uint64_t __54__WLDLivePlaybackReporter_decorateSummary_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__WLDLivePlaybackReporter_decorateSummary_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_processInput:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = WLDDispatchQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__WLDLivePlaybackReporter__processInput_completion___block_invoke;
  block[3] = &unk_100044F40;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __52__WLDLivePlaybackReporter__processInput_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained state];
  if (v2)
  {
    if (v2 != (id)1) {
      goto LABEL_15;
    }
    id v3 = [*(id *)(a1 + 32) _debugStringForInput:*(void *)(a1 + 56)];
    NSLog(@"WLDLivePlaybackReporter: [StateMachine][PlayerStateNotPlaying] input:[%@]", v3);

    uint64_t v4 = *(void *)(a1 + 56);
    if (!v4)
    {
      [WeakRetained _handlePlayerStateDidBecomePlayingWithCompletion:*(void *)(a1 + 40)];
      goto LABEL_15;
    }
    id v5 = [WeakRetained _debugStringForInput:*(void *)(a1 + 56)];
    NSLog(@"WLDLivePlaybackReporter: [StateMachine][PlayerStateNotPlaying] No action for input: %lu %@", v4, v5);
    goto LABEL_13;
  }
  id v6 = [*(id *)(a1 + 32) _debugStringForInput:*(void *)(a1 + 56)];
  NSLog(@"WLDLivePlaybackReporter: [StateMachine][PlayerStatePlaying] input:[%@]", v6);

  uint64_t v7 = *(void *)(a1 + 56);
  if (v7 == 3)
  {
    [WeakRetained _handleTimerFiredAtScheduleBoundary:*(void *)(a1 + 40)];
    goto LABEL_15;
  }
  if (v7 == 2)
  {
    [WeakRetained _handleTimerFiredAtEventStart:*(void *)(a1 + 40)];
    goto LABEL_15;
  }
  if (v7 != 1)
  {
    id v5 = [WeakRetained _debugStringForInput:*(void *)(a1 + 56)];
    NSLog(@"WLDLivePlaybackReporter: [StateMachine][PlayerStatePlaying] No action for input: %lu %@", v7, v5);
LABEL_13:

    goto LABEL_14;
  }
  [WeakRetained _invalidateTimer];
  [WeakRetained setState:1];
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_15:
}

- (void)_handlePlayerStateDidBecomePlayingWithCompletion:(id)a3
{
  id v4 = a3;
  [(WLDLivePlaybackReporter *)self setState:0];
  id v5 = [(WLDLivePlaybackReporter *)self lastSummary];
  id v6 = [v5 currentPlaybackDate];

  if (!v6)
  {
    NSLog(@"WLDLivePlaybackReporter::Falling back to current date and currentPlaybackDate is not available");
    id v6 = +[NSDate date];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __76__WLDLivePlaybackReporter__handlePlayerStateDidBecomePlayingWithCompletion___block_invoke;
  v9[3] = &unk_100044F68;
  v9[4] = self;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  [(WLDLivePlaybackReporter *)self _getScheduleWithPlaybackDate:v8 completion:v9];
}

void __76__WLDLivePlaybackReporter__handlePlayerStateDidBecomePlayingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && ![*(id *)(a1 + 32) state])
  {
    [*(id *)(a1 + 32) _evaluateEventsForReportingWithPlaybackDate:*(void *)(a1 + 40) schedule:v6 completion:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _evaluateScheduleWithPlaybackDate:*(void *)(a1 + 40)];
  }
  else
  {
    if ([*(id *)(a1 + 32) state]) {
      NSLog(&CFSTR("WLDLivePlaybackReporter::_handlePlayerStateDidBecomePlaying - Not reporting or evaluating schedule as state"
    }
                   " is no longer playing").isa);
    else {
      NSLog(@"WLDLivePlaybackReporter:_handlePlayerStateDidBecomePlaying - decorate failed %@", v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_handleTimerFiredAtEventStart:(id)a3
{
  id v4 = a3;
  id v5 = WLDDispatchQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __57__WLDLivePlaybackReporter__handleTimerFiredAtEventStart___block_invoke;
  v7[3] = &unk_100044FB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__WLDLivePlaybackReporter__handleTimerFiredAtEventStart___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  objc_sync_exit(v2);

  id v4 = [*(id *)(a1 + 32) schedule];
  id v5 = [v4 eventForDate:v3 fuzziness:2.0];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) lastSummary];
    id v7 = objc_opt_class();
    id v8 = [*(id *)(a1 + 32) schedule];
    id v9 = [v7 _contentEventFromSummary:v6 schedule:v8 event:v5];

    v16 = v9;
    id v10 = +[NSArray arrayWithObjects:&v16 count:1];
    id v11 = [v6 accountID];
    id v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 longLongValue]);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __57__WLDLivePlaybackReporter__handleTimerFiredAtEventStart___block_invoke_2;
    v14[3] = &unk_100044F90;
    id v13 = *(void **)(a1 + 32);
    id v15 = *(id *)(a1 + 40);
    [v13 _reportPlayEvents:v10 account:v12 completion:v14];
  }
  else if (*(void *)(a1 + 40))
  {
    NSLog(@"WLDLivePlaybackReporter: Next event not found when timer fired. Investigate this.");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  [*(id *)(a1 + 32) _evaluateScheduleWithPlaybackDate:*(void *)(*(void *)(a1 + 32) + 24)];
}

void __57__WLDLivePlaybackReporter__handleTimerFiredAtEventStart___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  NSLog(@"WLDLivePlaybackReporter: Live activity timer based event start report success: %d Error: %@", a2, v5);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleTimerFiredAtScheduleBoundary:(id)a3
{
  id v4 = a3;
  [(WLDLivePlaybackReporter *)self _invalidateTimer];
  id v5 = [(WLDLivePlaybackReporter *)self schedule];
  id v6 = [v5 endDate];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __63__WLDLivePlaybackReporter__handleTimerFiredAtScheduleBoundary___block_invoke;
  v9[3] = &unk_100044F68;
  v9[4] = self;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  [(WLDLivePlaybackReporter *)self _getScheduleWithPlaybackDate:v8 completion:v9];
}

void __63__WLDLivePlaybackReporter__handleTimerFiredAtScheduleBoundary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && ![*(id *)(a1 + 32) state])
  {
    [*(id *)(a1 + 32) _evaluateEventsForReportingWithPlaybackDate:*(void *)(a1 + 40) schedule:v6 completion:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _evaluateScheduleWithPlaybackDate:*(void *)(a1 + 40)];
  }
  else
  {
    if ([*(id *)(a1 + 32) state]) {
      NSLog(&CFSTR("WLDLivePlaybackReporter::_handleTimerFiredAtScheduleBoundary - Not reporting or evaluating schedule as stat"
    }
                   "e is no longer playing").isa);
    else {
      NSLog(@"WLDLivePlaybackReporter:_handleTimerFiredAtScheduleBoundary - decorate failed %@", v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_getScheduleWithPlaybackDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WLDLivePlaybackReporter *)self lastSummary];
  id v9 = [(WLDLivePlaybackReporter *)self schedule];
  id v10 = [v9 endDate];

  BOOL v11 = 0;
  if (v6 && v10)
  {
    id v12 = [v6 laterDate:v10];
    BOOL v11 = v12 == v6;
  }
  id v13 = [(WLDLivePlaybackReporter *)self schedule];
  if (!v13)
  {
    if (!v11)
    {
      NSLog(@"WLDLivePlaybackReporter: No existing schedule, fetching one");
      goto LABEL_13;
    }
LABEL_9:
    NSLog(@"WLDLivePlaybackReporter: User scrubbed beyond existing schedule end date, re-fetching schedule");
    self->_BOOL scheduleAlreadyFetchedAtBoundary = 1;
LABEL_13:
    v16 = objc_opt_class();
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __67__WLDLivePlaybackReporter__getScheduleWithPlaybackDate_completion___block_invoke;
    v17[3] = &unk_100044FE0;
    v17[4] = self;
    id v18 = v7;
    [v16 decorateSummary:v8 completion:v17];

    goto LABEL_14;
  }
  if (v11)
  {
    BOOL scheduleAlreadyFetchedAtBoundary = self->_scheduleAlreadyFetchedAtBoundary;

    if (!scheduleAlreadyFetchedAtBoundary) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  NSLog(@"WLDLivePlaybackReporter: Returning existing schedule");
  id v15 = [(WLDLivePlaybackReporter *)self schedule];
  (*((void (**)(id, void *, void))v7 + 2))(v7, v15, 0);

LABEL_14:
}

void __67__WLDLivePlaybackReporter__getScheduleWithPlaybackDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = [*(id *)(a1 + 32) schedule];
    unsigned __int8 v7 = [v6 isEqual:v10];

    if ((v7 & 1) == 0)
    {
      [*(id *)(a1 + 32) setSchedule:v10];
      *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    NSLog(@"WLDLivePlaybackReporter: decorate failed %@", v5);
    uint64_t v9 = *(void *)(a1 + 40);
    if (!v9) {
      goto LABEL_8;
    }
    id v8 = *(void (**)(void))(v9 + 16);
  }
  v8();
LABEL_8:
}

+ (void)_decorateLiveSummary:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __59__WLDLivePlaybackReporter__decorateLiveSummary_completion___block_invoke;
  v7[3] = &unk_100045030;
  id v8 = a3;
  id v9 = a4;
  id v5 = v8;
  id v6 = v9;
  [v5 resolveChannelID:v7];
}

void __59__WLDLivePlaybackReporter__decorateLiveSummary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = v6;
  if (v5)
  {
    id v8 = [*(id *)(a1 + 32) serviceID];
    if ([v5 length] && objc_msgSend(v8, "length"))
    {
      id v9 = [objc_alloc((Class)WLKPlayActivityDecorateLiveOperation) initWithChannelID:v5 serviceID:v8];
      objc_initWeak(&location, v9);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = __59__WLDLivePlaybackReporter__decorateLiveSummary_completion___block_invoke_2;
      v12[3] = &unk_100045008;
      objc_copyWeak(&v14, &location);
      id v13 = *(id *)(a1 + 40);
      [v9 setCompletionBlock:v12];
      id v10 = WLDOperationQueue();
      [v10 addOperation:v9];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      NSLog(@"WLDLivePlaybackReporter: Live summary doesn't meet preconditions. channelID:%@ serviceID:%@", v5, v8);
      uint64_t v11 = *(void *)(a1 + 40);
      WLKError();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v9);
    }
  }
  else
  {
    NSLog(@"WLDPlaybackReporter: Error: Failed to resolve channelID %@", v6);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __59__WLDLivePlaybackReporter__decorateLiveSummary_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained responseDictionary];
  id v3 = [objc_alloc((Class)WLKSchedule) initWithDictionary:v2];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [WeakRetained error];
  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v3, v5);
}

+ (void)_decorateEBSSummary:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __58__WLDLivePlaybackReporter__decorateEBSSummary_completion___block_invoke;
  v7[3] = &unk_100045030;
  id v8 = a3;
  id v9 = a4;
  id v5 = v8;
  id v6 = v9;
  [v5 resolveChannelID:v7];
}

void __58__WLDLivePlaybackReporter__decorateEBSSummary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = v6;
  if (v5)
  {
    id v8 = [*(id *)(a1 + 32) contentID];
    if ([v5 length] && objc_msgSend(v8, "length"))
    {
      id v9 = [objc_alloc((Class)WLKPlayActivityDecorateEBSOperation) initWithChannelID:v5 externalContentID:v8];
      objc_initWeak(&location, v9);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = __58__WLDLivePlaybackReporter__decorateEBSSummary_completion___block_invoke_2;
      v12[3] = &unk_100045008;
      objc_copyWeak(&v14, &location);
      id v13 = *(id *)(a1 + 40);
      [v9 setCompletionBlock:v12];
      id v10 = WLDOperationQueue();
      [v10 addOperation:v9];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      NSLog(@"WLDLivePlaybackReporter: EBS summary doesn't meet preconditions. channelID:%@ contentID:%@", v5, v8);
      uint64_t v11 = *(void *)(a1 + 40);
      WLKError();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v9);
    }
  }
  else
  {
    NSLog(@"WLDLivePlaybackReporter: Error: Failed to resolve channelID %@", v6);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __58__WLDLivePlaybackReporter__decorateEBSSummary_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained responseDictionary];
  id v3 = [objc_alloc((Class)WLKSchedule) initWithDictionary:v2];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [WeakRetained error];
  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v3, v5);
}

- (void)_evaluateEventsForReportingWithPlaybackDate:(id)a3 schedule:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(WLDLivePlaybackReporter *)self lastSummary];
  id v12 = +[NSMutableArray array];
  id v13 = [v8 eventForDate:v10];

  if (v13)
  {
    NSLog(@"WLDLivePlaybackReporter: will report event");
    id v14 = [(id)objc_opt_class() _contentEventFromSummary:v11 schedule:v8 event:v13];
    [v12 addObject:v14];
  }
  if ([v12 count])
  {
    id v15 = [v11 accountID];
    v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v15 longLongValue]);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __91__WLDLivePlaybackReporter__evaluateEventsForReportingWithPlaybackDate_schedule_completion___block_invoke;
    v17[3] = &unk_100044F90;
    id v18 = v9;
    [(WLDLivePlaybackReporter *)self _reportPlayEvents:v12 account:v16 completion:v17];
  }
  else
  {
    NSLog(@"WLDLivePlaybackReporter: Will not report. We have no events");
    if (v9) {
      (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
    }
  }
}

void __91__WLDLivePlaybackReporter__evaluateEventsForReportingWithPlaybackDate_schedule_completion___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  NSLog(@"WLDLivePlaybackReporter: Live activity report success: %d", a2);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_reportPlayEvents:(id)a3 account:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[WLDPlayActivityReportOperation alloc] initWithLivePlayEvents:v7];
  [(WLDPlayActivityReportOperation *)v10 setDSID:v8];
  objc_initWeak(&location, v10);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = __64__WLDLivePlaybackReporter__reportPlayEvents_account_completion___block_invoke;
  v16 = &unk_100045008;
  objc_copyWeak(&v18, &location);
  id v11 = v9;
  id v17 = v11;
  [(WLDPlayActivityReportOperation *)v10 setCompletionBlock:&v13];
  NSLog(@"WLDLivePlaybackReporter: Queueing activity report for events: %p", v7, v13, v14, v15, v16);
  id v12 = WLDOperationQueue();
  [v12 addOperation:v10];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __64__WLDLivePlaybackReporter__reportPlayEvents_account_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained error];
  id v3 = [WeakRetained httpResponse];
  NSLog(@"WLDLivePlaybackReporter: success: %d response:%@", v2 == 0, v3);

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [WeakRetained error];
  id v6 = [WeakRetained error];
  (*(void (**)(uint64_t, BOOL, void *))(v4 + 16))(v4, v5 == 0, v6);
}

- (id)_debugStringForInput:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_100045098[a3];
  }
}

+ (id)_contentEventFromSummary:(id)a3 schedule:(id)a4 event:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = +[NSDate date];
  id v9 = objc_alloc_init(UWLLiveActivityEvent);
  id v10 = [v7 bundleID];
  [(UWLLiveActivityEvent *)v9 setBundleId:v10];

  id v11 = [v7 externalProfileID];
  [(UWLLiveActivityEvent *)v9 setProfileId:v11];

  id v12 = [v7 timestamp];

  [v8 timeIntervalSinceDate:v12];
  [(UWLLiveActivityEvent *)v9 setMillisecondsSinceEvent:(uint64_t)(v13 * 1000.0)];

  [(UWLLiveActivityEvent *)v9 setCause:3];
  [(UWLLiveActivityEvent *)v9 setContractOrTimed:1];
  uint64_t v14 = [v6 nowPlayingPassThrough];

  [(UWLLiveActivityEvent *)v9 setPassThrough:v14];

  return v9;
}

- (void)_evaluateScheduleWithPlaybackDate:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [(WLDLivePlaybackReporter *)self schedule];
  id v5 = [v4 eventAfterDate:v15];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 startDate];
    CFStringRef v8 = @"_next event begins";
  }
  else
  {
    CFStringRef v8 = 0;
    id v7 = 0;
  }
  id v9 = [v4 endDate];
  id v10 = v9;
  uint64_t v11 = 2;
  id v12 = v15;
  if (v15 && !v7 && v9)
  {
    if (([v9 isEqual:v15] & 1) != 0
      || ([v10 laterDate:v15],
          double v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v13 != v10))
    {
      id v7 = 0;
      goto LABEL_16;
    }
    id v7 = [v4 endDate];
    CFStringRef v8 = @"_no event found";
    uint64_t v11 = 3;
    id v12 = v15;
  }
  if (v12)
  {
    if (v7)
    {
      if (([v7 isEqual:v12] & 1) == 0)
      {
        uint64_t v14 = [v7 laterDate:v15];

        if (v14 == v7)
        {
          NSLog(@"WLDLivePlaybackReporter: Set up timer for %@ context: %@", v7, v8);
          [(WLDLivePlaybackReporter *)self _configureTimerForDate:v7 playbackDate:v15 input:v11];
        }
      }
    }
  }
LABEL_16:
}

- (void)_configureTimerForDate:(id)a3 playbackDate:(id)a4 input:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  objc_storeStrong((id *)&v11->_timerEventDate, a3);
  id v12 = WLDDispatchQueue();
  dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v12);
  timer = v11->_timer;
  v11->_timer = (OS_dispatch_source *)v13;

  [v9 timeIntervalSinceDate:v10];
  if (v15 <= 0.0)
  {
    NSLog(@"WLDLivePlaybackReporter: Timer fire time cannot be less than or equal to 0, returning early. Investigate this.");
  }
  else
  {
    double v16 = 7200.0;
    if (v15 <= 7200.0)
    {
      double v16 = v15;
    }
    else
    {
      id v17 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
      NSLog(@"WLDLivePlaybackReporter: Requested fire date exceeds max, clamping: %@", v17);
    }
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v11->_timer, v18, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, v11);
    v19 = v11->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __69__WLDLivePlaybackReporter__configureTimerForDate_playbackDate_input___block_invoke;
    handler[3] = &unk_100045078;
    objc_copyWeak(v21, &location);
    v21[1] = (id)a5;
    dispatch_source_set_event_handler(v19, handler);
    dispatch_activate((dispatch_object_t)v11->_timer);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v11);
}

void __69__WLDLivePlaybackReporter__configureTimerForDate_playbackDate_input___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_processInput:completion:");
  }
}

void __69__WLDLivePlaybackReporter__configureTimerForDate_playbackDate_input___block_invoke_2(uint64_t a1, unsigned int a2)
{
}

- (void)_invalidateTimer
{
  obj = self;
  objc_sync_enter(obj);
  timer = obj->_timer;
  if (timer)
  {
    NSLog(@"WLDLivePlaybackReporter: Cancelling existing timer");
    timerEventDate = obj->_timerEventDate;
    obj->_timerEventDate = 0;

    dispatch_source_cancel((dispatch_source_t)obj->_timer);
    uint64_t v4 = obj;
    timer = obj->_timer;
  }
  else
  {
    uint64_t v4 = obj;
  }
  v4->_timer = 0;

  objc_sync_exit(obj);
}

- (unint64_t)state
{
  return self->state;
}

- (void)setState:(unint64_t)a3
{
  self->state = a3;
}

- (WLKPlaybackSummary)lastSummary
{
  return (WLKPlaybackSummary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastSummary:(id)a3
{
}

- (WLKTransactionScope)transaction
{
  return (WLKTransactionScope *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_lastSummary, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_timerEventDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_schedule, 0);
}

@end