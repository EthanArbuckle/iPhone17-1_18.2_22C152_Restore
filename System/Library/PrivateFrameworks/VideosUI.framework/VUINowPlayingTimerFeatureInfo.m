@interface VUINowPlayingTimerFeatureInfo
- (NSDate)backgroundedDate;
- (NSDate)startDate;
- (NSTimer)oneTimeTimer;
- (NSTimer)repeatingTimer;
- (void)setBackgroundedDate:(id)a3;
- (void)setOneTimeTimer:(id)a3;
- (void)setRepeatingTimer:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation VUINowPlayingTimerFeatureInfo

- (NSTimer)repeatingTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_repeatingTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setRepeatingTimer:(id)a3
{
}

- (NSTimer)oneTimeTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oneTimeTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setOneTimeTimer:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)backgroundedDate
{
  return self->_backgroundedDate;
}

- (void)setBackgroundedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundedDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_destroyWeak((id *)&self->_oneTimeTimer);
  objc_destroyWeak((id *)&self->_repeatingTimer);
}

@end