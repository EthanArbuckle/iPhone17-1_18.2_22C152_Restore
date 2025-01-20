@interface ICNASceneSessionTracker
- (BOOL)timerIsOn;
- (ICNASceneSessionTracker)initWithSessionTypeEnum:(int64_t)a3;
- (NSDate)lastStartDate;
- (double)duration;
- (id)sessionSummaryItemData;
- (int64_t)sessionTypeEnum;
- (unint64_t)count;
- (void)endTimer;
- (void)setCount:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setLastStartDate:(id)a3;
- (void)setSessionTypeEnum:(int64_t)a3;
- (void)startTimer;
@end

@implementation ICNASceneSessionTracker

- (ICNASceneSessionTracker)initWithSessionTypeEnum:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICNASceneSessionTracker;
  v4 = [(ICNASceneSessionTracker *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_sessionTypeEnum = a3;
    v4->_duration = 0.0;
    lastStartDate = v4->_lastStartDate;
    v4->_lastStartDate = 0;

    v5->_count = 0;
  }
  return v5;
}

- (void)startTimer
{
  if (![(ICNASceneSessionTracker *)self timerIsOn])
  {
    [(ICNASceneSessionTracker *)self setCount:[(ICNASceneSessionTracker *)self count] + 1];
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [(ICNASceneSessionTracker *)self setLastStartDate:v3];
  }
}

- (void)endTimer
{
  if ([(ICNASceneSessionTracker *)self timerIsOn])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    v4 = [(ICNASceneSessionTracker *)self lastStartDate];
    [v3 timeIntervalSinceDate:v4];
    double v6 = v5;
    [(ICNASceneSessionTracker *)self duration];
    [(ICNASceneSessionTracker *)self setDuration:v6 + v7];

    [(ICNASceneSessionTracker *)self setLastStartDate:0];
  }
}

- (id)sessionSummaryItemData
{
  id v3 = [[ICASSessionType alloc] initWithSessionType:[(ICNASceneSessionTracker *)self sessionTypeEnum]];
  [(ICNASceneSessionTracker *)self duration];
  double v5 = v4;
  double v6 = [(ICNASceneSessionTracker *)self lastStartDate];
  if (v6)
  {
    double v7 = [MEMORY[0x1E4F1C9C8] date];
    objc_super v8 = [(ICNASceneSessionTracker *)self lastStartDate];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  v11 = [ICASSessionSummaryArrayItemData alloc];
  v12 = NSNumber;
  ICNARoundTo2SigFigs((v5 + v10) * 1000.0);
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[ICNASceneSessionTracker count](self, "count")));
  v15 = [(ICASSessionSummaryArrayItemData *)v11 initWithSessionType:v3 sessionDuration:v13 sessionCount:v14];

  return v15;
}

- (BOOL)timerIsOn
{
  v2 = [(ICNASceneSessionTracker *)self lastStartDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)sessionTypeEnum
{
  return self->_sessionTypeEnum;
}

- (void)setSessionTypeEnum:(int64_t)a3
{
  self->_sessionTypeEnum = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDate)lastStartDate
{
  return self->_lastStartDate;
}

- (void)setLastStartDate:(id)a3
{
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
}

@end