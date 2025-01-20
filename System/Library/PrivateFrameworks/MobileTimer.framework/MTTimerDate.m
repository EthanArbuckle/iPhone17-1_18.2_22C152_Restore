@interface MTTimerDate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTime:(id)a3;
- (MTTimerDate)initWithCoder:(id)a3;
- (MTTimerDate)initWithDate:(id)a3;
- (MTTimerDate)initWithDate:(id)a3 currentDateProvider:(id)a4;
- (NSDate)date;
- (double)remainingTime;
- (id)currentDateProvider;
- (int64_t)compare:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentDateProvider:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation MTTimerDate

- (MTTimerDate)initWithDate:(id)a3
{
  id v4 = a3;
  v5 = MTCurrentDateProvider();
  v6 = [(MTTimerDate *)self initWithDate:v4 currentDateProvider:v5];

  return v6;
}

- (MTTimerDate)initWithDate:(id)a3 currentDateProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTTimerDate;
  v8 = [(MTTimerDate *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    date = v8->_date;
    v8->_date = (NSDate *)v9;

    uint64_t v11 = [v7 copy];
    id currentDateProvider = v8->_currentDateProvider;
    v8->_id currentDateProvider = (id)v11;
  }
  return v8;
}

- (double)remainingTime
{
  v3 = (*((void (**)(void))self->_currentDateProvider + 2))();
  id v4 = [(MTTimerDate *)self date];
  int v5 = [v4 mtIsAfterDate:v3];

  double v6 = 0.0;
  if (v5)
  {
    id v7 = [(MTTimerDate *)self date];
    [v7 timeIntervalSinceDate:v3];
    double v6 = v8;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1EEE26C58]) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;
  if (v6) {
    BOOL v7 = [(MTTimerDate *)self isEqualToTime:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToTime:(id)a3
{
  return MTCompareTimerTimes(self, a3) == 0;
}

- (int64_t)compare:(id)a3
{
  return MTCompareTimerTimes(self, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTTimerDate)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [(MTTimerDate *)self initWithDate:0];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTimerTimeDate"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    double v8 = MTCurrentDateProvider();
    uint64_t v9 = [v8 copy];
    id currentDateProvider = v5->_currentDateProvider;
    v5->_id currentDateProvider = (id)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MTTimerDate *)self date];
  [v4 encodeObject:v5 forKey:@"MTTimerTimeDate"];
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end