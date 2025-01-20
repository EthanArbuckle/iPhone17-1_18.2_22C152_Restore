@interface PHTextCycleLabel
- (NSArray)cycleStrings;
- (NSTimer)cycleTimer;
- (int64_t)currentCycleStringIndex;
- (void)cycleToNextString;
- (void)dealloc;
- (void)setCurrentCycleStringIndex:(int64_t)a3;
- (void)setCycleStrings:(id)a3;
- (void)setCycleTimer:(id)a3;
- (void)setText:(id)a3;
- (void)startCyclingStrings;
@end

@implementation PHTextCycleLabel

- (void)startCyclingStrings
{
  v3 = [(PHTextCycleLabel *)self cycleStrings];
  id v4 = [v3 count];

  if (v4)
  {
    [(PHTextCycleLabel *)self setCurrentCycleStringIndex:0];
    v5 = [(NSArray *)self->_cycleStrings objectAtIndex:[(PHTextCycleLabel *)self currentCycleStringIndex]];
    v10.receiver = self;
    v10.super_class = (Class)PHTextCycleLabel;
    [(PHTextCycleLabel *)&v10 setText:v5];

    v6 = [(PHTextCycleLabel *)self cycleTimer];

    if (v6)
    {
      v7 = [(PHTextCycleLabel *)self cycleTimer];
      [v7 invalidate];

      [(PHTextCycleLabel *)self setCycleTimer:0];
    }
    v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:"cycleToNextString" selector:0 userInfo:1 repeats:2.5];
    cycleTimer = self->_cycleTimer;
    self->_cycleTimer = v8;
  }
}

- (void)cycleToNextString
{
  v3 = [(PHTextCycleLabel *)self cycleStrings];
  id v4 = [v3 count];

  if (v4)
  {
    [(PHTextCycleLabel *)self setCurrentCycleStringIndex:(char *)[(PHTextCycleLabel *)self currentCycleStringIndex] + 1];
    if ([(PHTextCycleLabel *)self currentCycleStringIndex] >= (uint64_t)v4) {
      [(PHTextCycleLabel *)self setCurrentCycleStringIndex:0];
    }
    v5 = [(PHTextCycleLabel *)self cycleStrings];
    v6 = [v5 objectAtIndex:[self currentCycleStringIndex]];

    v7 = +[CATransition animation];
    [v7 setDuration:0.699999988];
    [v7 setType:kCATransitionFade];
    v8 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [v7 setTimingFunction:v8];

    v9 = [(PHTextCycleLabel *)self layer];
    [v9 addAnimation:v7 forKey:@"labelTextChangeTransition"];

    v10.receiver = self;
    v10.super_class = (Class)PHTextCycleLabel;
    [(PHTextCycleLabel *)&v10 setText:v6];
  }
}

- (void)setText:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHTextCycleLabel;
  [(PHTextCycleLabel *)&v6 setText:a3];
  [(PHTextCycleLabel *)self setNumberOfLines:2];
  [(PHTextCycleLabel *)self setAdjustsFontSizeToFitWidth:1];
  cycleTimer = self->_cycleTimer;
  if (cycleTimer)
  {
    [(NSTimer *)cycleTimer invalidate];
    v5 = self->_cycleTimer;
    self->_cycleTimer = 0;

    self->_currentCycleStringIndex = 0;
  }
}

- (void)dealloc
{
  [(NSTimer *)self->_cycleTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PHTextCycleLabel;
  [(PHTextCycleLabel *)&v3 dealloc];
}

- (NSArray)cycleStrings
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCycleStrings:(id)a3
{
}

- (NSTimer)cycleTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCycleTimer:(id)a3
{
}

- (int64_t)currentCycleStringIndex
{
  return self->_currentCycleStringIndex;
}

- (void)setCurrentCycleStringIndex:(int64_t)a3
{
  self->_currentCycleStringIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cycleTimer, 0);

  objc_storeStrong((id *)&self->_cycleStrings, 0);
}

@end