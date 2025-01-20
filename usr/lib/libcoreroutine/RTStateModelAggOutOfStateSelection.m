@interface RTStateModelAggOutOfStateSelection
- (NSMutableArray)selectOOStStates;
- (RTStateModelAggOutOfStateSelection)init;
- (RTStateModelAggOutOfStateSelection)initWithSelectOOStStates:(id)a3 dailyDensityCorrection:(double)a4 weeklyDensityCorrection:(double)a5;
- (double)dailyDensityCorrection;
- (double)weeklyDensityCorrection;
- (void)setDailyDensityCorrection:(double)a3;
- (void)setSelectOOStStates:(id)a3;
- (void)setWeeklyDensityCorrection:(double)a3;
@end

@implementation RTStateModelAggOutOfStateSelection

- (void).cxx_destruct
{
}

- (void)setSelectOOStStates:(id)a3
{
}

- (NSMutableArray)selectOOStStates
{
  return self->_selectOOStStates;
}

- (RTStateModelAggOutOfStateSelection)initWithSelectOOStStates:(id)a3 dailyDensityCorrection:(double)a4 weeklyDensityCorrection:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RTStateModelAggOutOfStateSelection;
  v10 = [(RTStateModelAggOutOfStateSelection *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_selectOOStStates, a3);
    v11->_weeklyDensityCorrection = a5;
    v11->_dailyDensityCorrection = a4;
  }

  return v11;
}

- (RTStateModelAggOutOfStateSelection)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTStateModelAggOutOfStateSelection;
  v2 = [(RTStateModelAggOutOfStateSelection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(RTStateModelAggOutOfStateSelection *)v2 setWeeklyDensityCorrection:1.0];
    [(RTStateModelAggOutOfStateSelection *)v3 setDailyDensityCorrection:1.0];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(RTStateModelAggOutOfStateSelection *)v3 setSelectOOStStates:v4];
  }
  return v3;
}

- (double)weeklyDensityCorrection
{
  return self->_weeklyDensityCorrection;
}

- (void)setWeeklyDensityCorrection:(double)a3
{
  self->_weeklyDensityCorrection = a3;
}

- (double)dailyDensityCorrection
{
  return self->_dailyDensityCorrection;
}

- (void)setDailyDensityCorrection:(double)a3
{
  self->_dailyDensityCorrection = a3;
}

@end