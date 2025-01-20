@interface WBSHistoryActivityThrottler
- (BOOL)shouldRecordHistoryVisitAtTime:(double)a3;
- (WBSHistoryActivityThrottler)initWithLimitPerSecond:(unint64_t)a3;
- (unint64_t)activityLimitPerSecond;
- (void)setActivityLimitPerSecond:(unint64_t)a3;
@end

@implementation WBSHistoryActivityThrottler

- (WBSHistoryActivityThrottler)initWithLimitPerSecond:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryActivityThrottler;
  v4 = [(WBSHistoryActivityThrottler *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_activityLimitPerSecond = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    activityTimes = v5->_activityTimes;
    v5->_activityTimes = (NSMutableArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)shouldRecordHistoryVisitAtTime:(double)a3
{
  unint64_t v5 = [(NSMutableArray *)self->_activityTimes count];
  activityTimes = self->_activityTimes;
  if (v5 < self->_activityLimitPerSecond) {
    goto LABEL_4;
  }
  v7 = [(NSMutableArray *)self->_activityTimes firstObject];
  [v7 doubleValue];
  double v9 = v8;

  if (a3 - v9 >= 1.0)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_activityTimes, "removeObjectAtIndex:", 0, a3 - v9);
    activityTimes = self->_activityTimes;
LABEL_4:
    objc_super v10 = [NSNumber numberWithDouble:a3];
    [(NSMutableArray *)activityTimes addObject:v10];

    return 1;
  }
  return 0;
}

- (unint64_t)activityLimitPerSecond
{
  return self->_activityLimitPerSecond;
}

- (void)setActivityLimitPerSecond:(unint64_t)a3
{
  self->_activityLimitPerSecond = a3;
}

- (void).cxx_destruct
{
}

@end