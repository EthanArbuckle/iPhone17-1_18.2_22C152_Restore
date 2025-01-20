@interface APReportValidator
+ (void)verifyPastDueReports:(id)a3 deliveredReport:(id)a4 completion:(id)a5;
- (APDBDeliveredReport)deliveredReport;
- (APDBDeliveredReportRow)lastReport;
- (APReportDate)reportDate;
- (APReportValidator)initWithReportDatasource:(id)a3 deliveredReport:(id)a4 currentDate:(id)a5;
- (BOOL)validateCurrent;
- (NSString)reportType;
- (id)_pastDueDailyReportDates;
- (id)_pastDueMonthlyReportDates;
- (id)_pastDueWeeklyReportDates;
- (id)pastDueReportDates;
- (int64_t)reportFrequency;
@end

@implementation APReportValidator

+ (void)verifyPastDueReports:(id)a3 deliveredReport:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);
  v12 = dispatch_queue_create("com.apple.ap.pastduereport", v11);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057B74;
  block[3] = &unk_100233D18;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v12, block);
}

- (APReportValidator)initWithReportDatasource:(id)a3 deliveredReport:(id)a4 currentDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)APReportValidator;
  v11 = [(APReportValidator *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 reportType];
    reportType = v11->_reportType;
    v11->_reportType = (NSString *)v12;

    v11->_reportFrequency = (int64_t)[(id)objc_opt_class() reportFrequency];
    objc_storeStrong((id *)&v11->_deliveredReport, a4);
    uint64_t v14 = [v9 lastDeliveryReportWithType:v11->_reportType];
    lastReport = v11->_lastReport;
    v11->_lastReport = (APDBDeliveredReportRow *)v14;

    v16 = [[APReportDate alloc] initWithDate:v10];
    reportDate = v11->_reportDate;
    v11->_reportDate = v16;
  }
  return v11;
}

- (BOOL)validateCurrent
{
  v3 = [(APReportValidator *)self lastReport];
  if (v3)
  {
    v4 = [(APReportValidator *)self reportDate];
    v5 = [v3 reportDate];
    uint64_t v6 = (uint64_t)[v4 numberOfDaysSinceDate:v5];

    int64_t v7 = [(APReportValidator *)self reportFrequency];
    BOOL v8 = v6 > 0;
    if (v7 != 1901) {
      BOOL v8 = 0;
    }
    if (v7 == 1902) {
      BOOL v9 = v6 > 6;
    }
    else {
      BOOL v9 = v8;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)pastDueReportDates
{
  v3 = [(APReportValidator *)self lastReport];

  if (v3)
  {
    int64_t v4 = [(APReportValidator *)self reportFrequency];
    switch(v4)
    {
      case 1903:
        v5 = [(APReportValidator *)self _pastDueMonthlyReportDates];
        break;
      case 1902:
        v5 = [(APReportValidator *)self _pastDueWeeklyReportDates];
        break;
      case 1901:
        v5 = [(APReportValidator *)self _pastDueDailyReportDates];
        break;
      default:
        v5 = 0;
        break;
    }
  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)_pastDueDailyReportDates
{
  v3 = +[NSMutableArray array];
  int64_t v4 = [(APReportValidator *)self reportDate];
  v5 = [(APReportValidator *)self reportType];
  uint64_t v6 = 7;
  do
  {
    id v7 = [v4 reportDayMinus:v6];
    BOOL v8 = [(APReportValidator *)self deliveredReport];
    BOOL v9 = +[NSNumber numberWithInteger:v7];
    id v10 = [v8 deliveryReportWithType:v5 dayOfYear:v9];

    if (!v10)
    {
      v11 = [v4 currentDateMinusDays:v6];
      if (v11)
      {
        [v3 addObject:v11];
      }
      else
      {
        uint64_t v12 = APLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Reports: Error creating report date.", v14, 2u);
        }
      }
    }

    --v6;
  }
  while (v6);

  return v3;
}

- (id)_pastDueWeeklyReportDates
{
  return +[NSMutableArray array];
}

- (id)_pastDueMonthlyReportDates
{
  return +[NSMutableArray array];
}

- (NSString)reportType
{
  return self->_reportType;
}

- (APDBDeliveredReportRow)lastReport
{
  return self->_lastReport;
}

- (int64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (APReportDate)reportDate
{
  return self->_reportDate;
}

- (APDBDeliveredReport)deliveredReport
{
  return self->_deliveredReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveredReport, 0);
  objc_storeStrong((id *)&self->_reportDate, 0);
  objc_storeStrong((id *)&self->_lastReport, 0);

  objc_storeStrong((id *)&self->_reportType, 0);
}

@end