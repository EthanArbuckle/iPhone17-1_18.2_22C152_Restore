@interface APECBackoffTimer
- (APClock)clock;
- (APECBackoffTimer)initWithClock:(id)a3;
- (BOOL)isWaitingForBackoff;
- (NSDate)scheduledDate;
- (NSDateInterval)currentTimer;
- (int64_t)currentIndex;
- (int64_t)indexContainingDuration:(double)a3;
- (int64_t)nextIndex;
- (void)resetTimer;
- (void)setClock:(id)a3;
- (void)setCurrentIndex:(int64_t)a3;
- (void)setCurrentTimer:(id)a3;
- (void)startMinimumTimer:(double)a3;
- (void)startNextTimer;
- (void)startTimerAt:(int64_t)a3;
@end

@implementation APECBackoffTimer

- (APECBackoffTimer)initWithClock:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APECBackoffTimer;
  v6 = [(APECBackoffTimer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clock, a3);
    v7->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (NSDate)scheduledDate
{
  v2 = [(APECBackoffTimer *)self currentTimer];
  v3 = [v2 endDate];

  return (NSDate *)v3;
}

- (BOOL)isWaitingForBackoff
{
  v3 = [(APECBackoffTimer *)self currentTimer];
  if (v3)
  {
    v4 = [(APECBackoffTimer *)self currentTimer];
    id v5 = [(APECBackoffTimer *)self clock];
    v6 = [v5 now];
    unsigned __int8 v7 = [v4 containsDate:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)resetTimer
{
  [(APECBackoffTimer *)self setCurrentIndex:0x7FFFFFFFFFFFFFFFLL];

  [(APECBackoffTimer *)self setCurrentTimer:0];
}

- (void)startMinimumTimer:(double)a3
{
  int64_t v4 = [(APECBackoffTimer *)self indexContainingDuration:a3];

  [(APECBackoffTimer *)self startTimerAt:v4];
}

- (void)startNextTimer
{
  int64_t v3 = [(APECBackoffTimer *)self nextIndex];

  [(APECBackoffTimer *)self startTimerAt:v3];
}

- (int64_t)indexContainingDuration:(double)a3
{
  for (unint64_t i = 0; i != 9; ++i)
  {
    if (dbl_1001D73C0[i] >= a3) {
      break;
    }
  }
  if (i >= 8) {
    return 8;
  }
  else {
    return i;
  }
}

- (int64_t)nextIndex
{
  if ([(APECBackoffTimer *)self currentIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v4 = [(APECBackoffTimer *)self currentIndex];
  int64_t result = [(APECBackoffTimer *)self currentIndex];
  if (v4 < 8) {
    ++result;
  }
  return result;
}

- (void)startTimerAt:(int64_t)a3
{
  [(APECBackoffTimer *)self setCurrentIndex:a3];
  id v4 = objc_alloc((Class)NSDateInterval);
  id v7 = [(APECBackoffTimer *)self clock];
  id v5 = [v7 now];
  id v6 = [v4 initWithStartDate:v5 duration:dbl_1001D73C0[-[APECBackoffTimer currentIndex](self, "currentIndex")]];
  [(APECBackoffTimer *)self setCurrentTimer:v6];
}

- (APClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(int64_t)a3
{
  self->_currentIndex = a3;
}

- (NSDateInterval)currentTimer
{
  return self->_currentTimer;
}

- (void)setCurrentTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimer, 0);

  objc_storeStrong((id *)&self->_clock, 0);
}

@end