@interface TITypologyStatisticTimeElapsed
- (TITypologyStatisticTimeElapsed)init;
- (TITypologyTimer)adjustedTimer;
- (TITypologyTimer)timer;
- (double)adjustedElapsedTime;
- (double)elapsedTime;
- (id)aggregateReport;
- (id)structuredReport;
- (void)setAdjustedTimer:(id)a3;
- (void)setTimer:(id)a3;
- (void)visitRecordKeyboardInput:(id)a3;
@end

@implementation TITypologyStatisticTimeElapsed

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustedTimer, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)setAdjustedTimer:(id)a3
{
}

- (TITypologyTimer)adjustedTimer
{
  return self->_adjustedTimer;
}

- (void)setTimer:(id)a3
{
}

- (TITypologyTimer)timer
{
  return self->_timer;
}

- (void)visitRecordKeyboardInput:(id)a3
{
  id v4 = a3;
  v5 = [(TITypologyStatisticTimeElapsed *)self timer];
  [v4 timestamp];
  objc_msgSend(v5, "addInputEventWithTimestamp:");

  id v8 = [(TITypologyStatisticTimeElapsed *)self adjustedTimer];
  [v4 timestamp];
  double v7 = v6;

  [v8 addInputEventWithTimestamp:v7];
}

- (double)adjustedElapsedTime
{
  v2 = [(TITypologyStatisticTimeElapsed *)self adjustedTimer];
  [v2 elapsedTime];
  double v4 = v3;

  return v4;
}

- (double)elapsedTime
{
  v2 = [(TITypologyStatisticTimeElapsed *)self timer];
  [v2 elapsedTime];
  double v4 = v3;

  return v4;
}

- (id)aggregateReport
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(TITypologyStatisticTimeElapsed *)self adjustedElapsedTime];
  *(float *)&double v4 = v4;
  if (*(float *)&v4 > 0.0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithFloat:");
    [v3 setObject:v5 forKey:@"typingDuration.distr"];
  }

  return v3;
}

- (id)structuredReport
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"Time Elapsed";
  double v3 = NSNumber;
  [(TITypologyStatisticTimeElapsed *)self elapsedTime];
  *(float *)&double v4 = v4;
  v5 = [v3 numberWithFloat:v4];
  v11[1] = @"Adjusted Time Elapsed";
  v12[0] = v5;
  double v6 = NSNumber;
  [(TITypologyStatisticTimeElapsed *)self adjustedElapsedTime];
  *(float *)&double v7 = v7;
  id v8 = [v6 numberWithFloat:v7];
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (TITypologyStatisticTimeElapsed)init
{
  v8.receiver = self;
  v8.super_class = (Class)TITypologyStatisticTimeElapsed;
  v2 = [(TITypologyStatisticTimeElapsed *)&v8 init];
  if (v2)
  {
    double v3 = objc_alloc_init(TITypologyTimer);
    timer = v2->_timer;
    v2->_timer = v3;

    v5 = objc_alloc_init(TITypologyTimer);
    adjustedTimer = v2->_adjustedTimer;
    v2->_adjustedTimer = v5;

    [(TITypologyTimer *)v2->_adjustedTimer setMaxTimeIntervalBetweenInputs:2.0];
  }
  return v2;
}

@end