@interface MNETADisplayFormatter
- (MNETADisplayFormatter)initWithTimeZone:(id)a3;
- (MNETADisplayFormatterDelegate)delegate;
- (NSDate)displayETAToEndOfLeg;
- (NSDate)displayETAToEndOfRoute;
- (double)_displayTimeIntervalForTimeInterval:(double)a3;
- (double)displayRemainingTimeToEndOfLeg;
- (double)displayRemainingTimeToEndOfRoute;
- (double)remainingTimeToEndOfLeg;
- (double)remainingTimeToEndOfRoute;
- (id)_displayDateWithRemainingTime:(double)a3;
- (void)_scheduleUpdateTimer;
- (void)_updateDisplayETA;
- (void)_updateTimerFired;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setRemainingTimeToEndOfLeg:(double)a3;
- (void)setRemainingTimeToEndOfRoute:(double)a3;
@end

@implementation MNETADisplayFormatter

- (MNETADisplayFormatter)initWithTimeZone:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNETADisplayFormatter;
  v6 = [(MNETADisplayFormatter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_timeZone, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  [(MNWeakTimer *)self->_updateTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MNETADisplayFormatter;
  [(MNETADisplayFormatter *)&v3 dealloc];
}

- (void)setRemainingTimeToEndOfRoute:(double)a3
{
  self->_remainingTimeToEndOfRoute = a3;
  [(MNETADisplayFormatter *)self _updateDisplayETA];
}

- (void)setRemainingTimeToEndOfLeg:(double)a3
{
  self->_remainingTimeToEndOfLeg = a3;
  [(MNETADisplayFormatter *)self _updateDisplayETA];
}

- (void)_updateDisplayETA
{
  [(MNETADisplayFormatter *)self _displayTimeIntervalForTimeInterval:self->_remainingTimeToEndOfLeg];
  double v4 = v3;
  -[MNETADisplayFormatter _displayDateWithRemainingTime:](self, "_displayDateWithRemainingTime:");
  id v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  [(MNETADisplayFormatter *)self _displayTimeIntervalForTimeInterval:self->_remainingTimeToEndOfRoute];
  double v7 = v6;
  -[MNETADisplayFormatter _displayDateWithRemainingTime:](self, "_displayDateWithRemainingTime:");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v13 = [[MNDisplayETAInfo alloc] initWithDisplayETAToEndOfLeg:v5 displayRemainingMinutesToEndOfLeg:(unint64_t)v4 displayETAToEndOfRoute:v8 displayRemainingMinutesToEndOfRoute:(unint64_t)v7];
  if (self->_displayETAToEndOfLeg != v5
    || self->_displayRemainingTimeToEndOfLeg != v4
    || self->_displayETAToEndOfRoute != v8
    || (displayETAToEndOfLeg = v5, self->_displayRemainingTimeToEndOfRoute != v7))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained etaDisplayFormatter:self didUpdateDisplayETA:v13];

    displayETAToEndOfLeg = self->_displayETAToEndOfLeg;
  }
  self->_displayRemainingTimeToEndOfLeg = v4;
  self->_displayETAToEndOfLeg = v5;
  v11 = v5;

  self->_displayRemainingTimeToEndOfRoute = v7;
  displayETAToEndOfRoute = self->_displayETAToEndOfRoute;
  self->_displayETAToEndOfRoute = v8;

  if (!self->_updateTimer) {
    [(MNETADisplayFormatter *)self _scheduleUpdateTimer];
  }
}

- (void)_scheduleUpdateTimer
{
  double v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  double v6 = +[MNWeakTimer scheduledTimerWithTimeInterval:self target:sel__updateTimerFired selector:60.0 - (double)((unint64_t)v5 % 0x3C)];
  updateTimer = self->_updateTimer;
  self->_updateTimer = v6;
  MEMORY[0x1F41817F8](v6, updateTimer);
}

- (void)_updateTimerFired
{
  [(MNWeakTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

  [(MNETADisplayFormatter *)self _updateDisplayETA];
}

- (double)_displayTimeIntervalForTimeInterval:(double)a3
{
  return ceil(a3 / 60.0) * 60.0;
}

- (id)_displayDateWithRemainingTime:(double)a3
{
  double v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSince1970];
  double v6 = floor(v5 / 60.0) * 60.0;

  double v7 = (void *)MEMORY[0x1E4F1C9C8];
  return (id)[v7 dateWithTimeIntervalSince1970:v6 + a3];
}

- (MNETADisplayFormatterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNETADisplayFormatterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)remainingTimeToEndOfRoute
{
  return self->_remainingTimeToEndOfRoute;
}

- (double)remainingTimeToEndOfLeg
{
  return self->_remainingTimeToEndOfLeg;
}

- (double)displayRemainingTimeToEndOfLeg
{
  return self->_displayRemainingTimeToEndOfLeg;
}

- (NSDate)displayETAToEndOfLeg
{
  return self->_displayETAToEndOfLeg;
}

- (double)displayRemainingTimeToEndOfRoute
{
  return self->_displayRemainingTimeToEndOfRoute;
}

- (NSDate)displayETAToEndOfRoute
{
  return self->_displayETAToEndOfRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayETAToEndOfRoute, 0);
  objc_storeStrong((id *)&self->_displayETAToEndOfLeg, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end