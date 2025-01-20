@interface HKSHSleepChartDataSourceProvider
- (HKSHSleepChartDataSourceProvider)initWithCalendar:(id)a3 queryIdentifier:(id)a4;
- (NSCalendar)calendar;
- (NSString)queryIdentifier;
- (id)makeSleepDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4;
- (id)makeSleepStagesDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4;
@end

@implementation HKSHSleepChartDataSourceProvider

- (HKSHSleepChartDataSourceProvider)initWithCalendar:(id)a3 queryIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKSHSleepChartDataSourceProvider;
  v9 = [(HKSHSleepChartDataSourceProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendar, a3);
    objc_storeStrong((id *)&v10->_queryIdentifier, a4);
  }

  return v10;
}

- (id)makeSleepDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F67C18];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  uint64_t v10 = *MEMORY[0x1E4F67938];
  v11 = [(HKSHSleepChartDataSourceProvider *)self queryIdentifier];
  objc_super v12 = [(HKSHSleepChartDataSourceProvider *)self calendar];
  v13 = (void *)[v9 initWithHealthStore:v8 representativeDisplayType:v7 queryOptions:0 cacheIdentifier:v10 queryIdentifier:v11 calendar:v12];

  return v13;
}

- (id)makeSleepStagesDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F67C18];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  uint64_t v10 = *MEMORY[0x1E4F67940];
  v11 = [(HKSHSleepChartDataSourceProvider *)self queryIdentifier];
  objc_super v12 = [(HKSHSleepChartDataSourceProvider *)self calendar];
  v13 = (void *)[v9 initWithHealthStore:v8 representativeDisplayType:v7 queryOptions:6 cacheIdentifier:v10 queryIdentifier:v11 calendar:v12];

  return v13;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end