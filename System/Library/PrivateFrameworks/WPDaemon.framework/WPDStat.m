@interface WPDStat
- (NSDate)lastTime;
- (WPDStat)init;
- (double)currentTime;
- (void)calculateTimeUpdate;
- (void)setCurrentTime:(double)a3;
- (void)setLastTime:(id)a3;
- (void)startTime;
- (void)stopTime;
@end

@implementation WPDStat

- (void)stopTime
{
  v3 = [(WPDStat *)self lastTime];

  if (v3)
  {
    id v8 = [MEMORY[0x263EFF910] date];
    v4 = [(WPDStat *)self lastTime];
    [v8 timeIntervalSinceDate:v4];
    double v6 = v5;
    [(WPDStat *)self currentTime];
    [(WPDStat *)self setCurrentTime:v6 + v7];

    [(WPDStat *)self setLastTime:0];
  }
}

- (NSDate)lastTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)startTime
{
  v3 = [(WPDStat *)self lastTime];

  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF910] date];
    [(WPDStat *)self setLastTime:v4];
  }
}

- (void)setLastTime:(id)a3
{
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (WPDStat)init
{
  v5.receiver = self;
  v5.super_class = (Class)WPDStat;
  v2 = [(WPDStat *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(WPDStat *)v2 setCurrentTime:0.0];
    [(WPDStat *)v3 setLastTime:0];
  }
  return v3;
}

- (void)calculateTimeUpdate
{
  v3 = [(WPDStat *)self lastTime];

  if (v3)
  {
    id v9 = [MEMORY[0x263EFF910] date];
    id v4 = [(WPDStat *)self lastTime];
    [v9 timeIntervalSinceDate:v4];
    double v6 = v5;
    [(WPDStat *)self currentTime];
    [(WPDStat *)self setCurrentTime:v6 + v7];

    id v8 = [MEMORY[0x263EFF910] date];
    [(WPDStat *)self setLastTime:v8];
  }
}

- (void).cxx_destruct
{
}

@end