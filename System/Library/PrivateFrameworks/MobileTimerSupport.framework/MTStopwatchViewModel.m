@interface MTStopwatchViewModel
- (MTStopwatch)getStopwatch;
- (MTStopwatchViewModel)initWithStopwatch:(id)a3 manager:(id)a4 delegate:(id)a5 dateProvider:(id)a6 registerForNotifications:(BOOL)a7 broadcastUpdates:(BOOL)a8;
- (_TtC18MobileTimerSupport18StopwatchViewModel)viewModel;
- (double)runningTotalForLap:(int64_t)a3;
- (id)sourceIdentifier;
- (void)addLap:(double)a3;
- (void)clearAllLaps;
- (void)invalidateDisplayLink;
- (void)lapLapTimer;
- (void)pauseLapTimer;
- (void)resetLapTimer;
- (void)resumeLapTimer;
- (void)setViewModel:(id)a3;
- (void)startLapTimer;
- (void)updateStopwatch:(id)a3;
- (void)updateTime;
- (void)updateWithDisplayLink;
@end

@implementation MTStopwatchViewModel

- (MTStopwatchViewModel)initWithStopwatch:(id)a3 manager:(id)a4 delegate:(id)a5 dateProvider:(id)a6 registerForNotifications:(BOOL)a7 broadcastUpdates:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MTStopwatchViewModel;
  v18 = [(MTStopwatchViewModel *)&v21 init];
  if (v18)
  {
    v19 = [[_TtC18MobileTimerSupport18StopwatchViewModel alloc] initWithStopwatch:v14 manager:v15 delegate:v16 dateProvider:v17 registerForNotifications:v9 broadcastUpdates:v8];
    [(MTStopwatchViewModel *)v18 setViewModel:v19];
  }
  return v18;
}

- (void)updateStopwatch:(id)a3
{
  id v4 = a3;
  id v5 = [(MTStopwatchViewModel *)self viewModel];
  [v5 updateStopwatch:v4];
}

- (void)updateWithDisplayLink
{
  id v2 = [(MTStopwatchViewModel *)self viewModel];
  [v2 updateWithDisplayLink];
}

- (void)invalidateDisplayLink
{
  id v2 = [(MTStopwatchViewModel *)self viewModel];
  [v2 invalidateDisplayLink];
}

- (void)addLap:(double)a3
{
  id v4 = [(MTStopwatchViewModel *)self viewModel];
  [v4 addLap:a3];
}

- (void)clearAllLaps
{
  id v2 = [(MTStopwatchViewModel *)self viewModel];
  [v2 clearAllLaps];
}

- (void)lapLapTimer
{
  id v2 = [(MTStopwatchViewModel *)self viewModel];
  [v2 lapLapTimer];
}

- (void)pauseLapTimer
{
  id v2 = [(MTStopwatchViewModel *)self viewModel];
  [v2 pauseLapTimer];
}

- (void)resetLapTimer
{
  id v2 = [(MTStopwatchViewModel *)self viewModel];
  [v2 resetLapTimer];
}

- (void)resumeLapTimer
{
  id v2 = [(MTStopwatchViewModel *)self viewModel];
  [v2 resumeLapTimer];
}

- (void)startLapTimer
{
  id v2 = [(MTStopwatchViewModel *)self viewModel];
  [v2 startLapTimer];
}

- (MTStopwatch)getStopwatch
{
  id v2 = [(MTStopwatchViewModel *)self viewModel];
  v3 = [v2 getStopwatch];

  return (MTStopwatch *)v3;
}

- (void)updateTime
{
  id v2 = [(MTStopwatchViewModel *)self viewModel];
  [v2 updateTime];
}

- (double)runningTotalForLap:(int64_t)a3
{
  id v4 = [(MTStopwatchViewModel *)self viewModel];
  [v4 runningTotalForLap:a3];
  double v6 = v5;

  return v6;
}

- (id)sourceIdentifier
{
  id v2 = [(MTStopwatchViewModel *)self viewModel];
  v3 = [v2 sourceIdentifier];

  return v3;
}

- (_TtC18MobileTimerSupport18StopwatchViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end