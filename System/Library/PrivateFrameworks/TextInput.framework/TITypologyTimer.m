@interface TITypologyTimer
- (BOOL)foundFirstInput;
- (double)elapsedTime;
- (double)maxTimeIntervalBetweenInputs;
- (double)mostRecentTimestamp;
- (void)addInputEventWithTimestamp:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setFoundFirstInput:(BOOL)a3;
- (void)setMaxTimeIntervalBetweenInputs:(double)a3;
- (void)setMostRecentTimestamp:(double)a3;
@end

@implementation TITypologyTimer

- (void)setFoundFirstInput:(BOOL)a3
{
  self->_foundFirstInput = a3;
}

- (BOOL)foundFirstInput
{
  return self->_foundFirstInput;
}

- (void)setMaxTimeIntervalBetweenInputs:(double)a3
{
  self->_maxTimeIntervalBetweenInputs = a3;
}

- (double)maxTimeIntervalBetweenInputs
{
  return self->_maxTimeIntervalBetweenInputs;
}

- (void)setMostRecentTimestamp:(double)a3
{
  self->_mostRecentTimestamp = a3;
}

- (double)mostRecentTimestamp
{
  return self->_mostRecentTimestamp;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)addInputEventWithTimestamp:(double)a3
{
  if (![(TITypologyTimer *)self foundFirstInput])
  {
    [(TITypologyTimer *)self setMostRecentTimestamp:a3];
    [(TITypologyTimer *)self setFoundFirstInput:1];
  }
  [(TITypologyTimer *)self mostRecentTimestamp];
  double v6 = a3 - v5;
  [(TITypologyTimer *)self maxTimeIntervalBetweenInputs];
  if (v7 > 0.0)
  {
    [(TITypologyTimer *)self maxTimeIntervalBetweenInputs];
    if (v6 >= v8) {
      double v6 = v8;
    }
  }
  [(TITypologyTimer *)self elapsedTime];
  [(TITypologyTimer *)self setElapsedTime:v6 + v9];

  [(TITypologyTimer *)self setMostRecentTimestamp:a3];
}

@end