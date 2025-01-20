@interface MBAnalyticsEventPlugin
- (double)startTime;
- (id)endedBackupWithEngine:(id)a3 error:(id)a4;
- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5;
- (id)endingBackupWithEngine:(id)a3;
- (id)startingBackupWithEngine:(id)a3;
- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4;
- (void)setStartTime:(double)a3;
@end

@implementation MBAnalyticsEventPlugin

- (id)startingBackupWithEngine:(id)a3
{
  id v4 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  -[MBAnalyticsEventPlugin setStartTime:](self, "setStartTime:");
  v5 = [v4 analyticsEvent];

  [v5 setMetric:@"total" value:1];
  return 0;
}

- (id)endingBackupWithEngine:(id)a3
{
  return 0;
}

- (id)endedBackupWithEngine:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 analyticsEvent];
  v9 = v8;
  if (v6)
  {
    [v8 setMetric:@"failed" value:1];

    v10 = [v7 analyticsEvent];

    [v10 setError:v6];
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v12 = v11;
    [(MBAnalyticsEventPlugin *)self startTime];
    [v9 setMetric:@"duration" value:(unint64_t)(v12 - v13)];

    v10 = [v7 analyticsEvent];

    [v10 setMetric:@"successes" value:1];
  }

  return 0;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v5 = a4;
  +[NSDate timeIntervalSinceReferenceDate];
  -[MBAnalyticsEventPlugin setStartTime:](self, "setStartTime:");
  id v6 = [v5 analyticsEvent];

  [v6 setMetric:@"total" value:1];
  return 0;
}

- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [v8 analyticsEvent];
  v10 = v9;
  if (v7)
  {
    [v9 setMetric:@"failed" value:1];

    double v11 = [v8 analyticsEvent];

    [v11 setError:v7];
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v13 = v12;
    [(MBAnalyticsEventPlugin *)self startTime];
    [v10 setMetric:@"duration" value:(unint64_t)(v13 - v14)];

    double v11 = [v8 analyticsEvent];

    [v11 setMetric:@"successes" value:1];
  }

  return 0;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

@end