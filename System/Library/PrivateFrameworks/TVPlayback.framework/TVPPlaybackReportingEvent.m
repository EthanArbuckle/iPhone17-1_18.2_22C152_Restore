@interface TVPPlaybackReportingEvent
- (BOOL)isUIInteraction;
- (NSString)name;
- (TVPPlaybackReportingEvent)startEvent;
- (double)duration;
- (double)timestamp;
- (id)value;
- (int64_t)durationMS;
- (int64_t)type;
- (void)setDuration:(double)a3;
- (void)setDurationMS:(int64_t)a3;
- (void)setIsUIInteraction:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setStartEvent:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation TVPPlaybackReportingEvent

- (double)duration
{
  if ([(TVPPlaybackReportingEvent *)self type] == 1
    || (double v3 = 0.0, [(TVPPlaybackReportingEvent *)self type] == 2))
  {
    [(TVPPlaybackReportingEvent *)self timestamp];
    double v5 = v4;
    v6 = [(TVPPlaybackReportingEvent *)self startEvent];
    [v6 timestamp];
    double v3 = v5 - v7;
  }
  return v3;
}

- (int64_t)durationMS
{
  [(TVPPlaybackReportingEvent *)self duration];
  return llround(v2 * 1000.0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setDurationMS:(int64_t)a3
{
  self->_durationMS = a3;
}

- (TVPPlaybackReportingEvent)startEvent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_startEvent);
  return (TVPPlaybackReportingEvent *)WeakRetained;
}

- (void)setStartEvent:(id)a3
{
}

- (BOOL)isUIInteraction
{
  return self->_isUIInteraction;
}

- (void)setIsUIInteraction:(BOOL)a3
{
  self->_isUIInteraction = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_startEvent);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end