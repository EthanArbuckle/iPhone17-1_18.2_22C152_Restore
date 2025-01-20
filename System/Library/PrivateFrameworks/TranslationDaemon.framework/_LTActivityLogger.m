@interface _LTActivityLogger
- (_LTActivityLogger)init;
- (_LTActivityLoggerDelegate)delegate;
- (_LTDAnalyticsAssetSnapshotProviding)assetSnapshotProvider;
- (id)_activityDatePreferenceKeyForTask:(int64_t)a3;
- (id)_featureNameForTask:(int64_t)a3;
- (id)_weekNameForDate:(id)a3;
- (id)activityLogger:(id)a3 lastLoggedDateForTask:(int64_t)a4;
- (id)lastAggregateLogDateForActivityLogger:(id)a3;
- (void)_logActivityForTask:(int64_t)a3 interval:(unint64_t)a4 date:(id)a5;
- (void)_logAllIntervalsForTask:(int64_t)a3 date:(id)a4;
- (void)_logAssetSnapshotForDate:(id)a3;
- (void)_registerActivity:(int64_t)a3 onDate:(id)a4;
- (void)_sendDailyUsageForTask:(int64_t)a3 date:(id)a4;
- (void)_sendMonthlyUsageForTask:(int64_t)a3 date:(id)a4;
- (void)_sendWeeklyMobileAssetSnapshot:(id)a3 date:(id)a4;
- (void)_sendWeeklyUsageForTask:(int64_t)a3 date:(id)a4;
- (void)_updateLastLoggedDate:(id)a3 forTask:(int64_t)a4;
- (void)activityLogger:(id)a3 logAggregateUsageForInterval:(unint64_t)a4 date:(id)a5;
- (void)activityLogger:(id)a3 logAssetSnapshot:(id)a4 forDate:(id)a5;
- (void)activityLogger:(id)a3 logUsageForTask:(int64_t)a4 interval:(unint64_t)a5 date:(id)a6;
- (void)activityLogger:(id)a3 updateLastAggregateLogDate:(id)a4;
- (void)activityLogger:(id)a3 updateLastLoggedDate:(id)a4 forTask:(int64_t)a5;
- (void)registerActivity:(int64_t)a3;
- (void)setAssetSnapshotProvider:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _LTActivityLogger

- (_LTActivityLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_LTActivityLogger;
  v2 = [(_LTActivityLogger *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;

    objc_storeWeak((id *)&v2->_delegate, v2);
    v5 = v2;
  }

  return v2;
}

- (void)registerActivity:(int64_t)a3
{
  v5 = [MEMORY[0x263EFF910] date];
  if (!a3)
  {
    v6 = _LTOSLogXPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[_LTActivityLogger registerActivity:](v6);
    }
  }
  [(_LTActivityLogger *)self _registerActivity:a3 onDate:v5];
}

- (void)_registerActivity:(int64_t)a3 onDate:(id)a4
{
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v7 = WeakRetained;
  if (!a3)
  {
    v8 = [WeakRetained lastAggregateLogDateForActivityLogger:self];
    if (v8) {
      goto LABEL_3;
    }
LABEL_10:
    [(_LTActivityLogger *)self _logAllIntervalsForTask:a3 date:v9];
    goto LABEL_11;
  }
  v8 = [WeakRetained activityLogger:self lastLoggedDateForTask:a3];
  [(_LTActivityLogger *)self _registerActivity:0 onDate:v9];
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  if (![(NSCalendar *)self->_calendar isDate:v9 inSameDayAsDate:v8]) {
    [(_LTActivityLogger *)self _logActivityForTask:a3 interval:0 date:v9];
  }
  if (![(NSCalendar *)self->_calendar isDate:v9 equalToDate:v8 toUnitGranularity:0x2000])[(_LTActivityLogger *)self _logActivityForTask:a3 interval:1 date:v9]; {
  if (![(NSCalendar *)self->_calendar isDate:v9 equalToDate:v8 toUnitGranularity:8])[(_LTActivityLogger *)self _logActivityForTask:a3 interval:2 date:v9];
  }
LABEL_11:
  [(_LTActivityLogger *)self _updateLastLoggedDate:v9 forTask:a3];
}

- (void)_logAllIntervalsForTask:(int64_t)a3 date:(id)a4
{
  id v6 = a4;
  [(_LTActivityLogger *)self _logActivityForTask:a3 interval:0 date:v6];
  [(_LTActivityLogger *)self _logActivityForTask:a3 interval:1 date:v6];
  [(_LTActivityLogger *)self _logActivityForTask:a3 interval:2 date:v6];
}

- (void)_logActivityForTask:(int64_t)a3 interval:(unint64_t)a4 date:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = _LTOSLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 > 2) {
      v10 = @"undefined";
    }
    else {
      v10 = off_265545B90[a4];
    }
    v11 = v9;
    v12 = [(_LTActivityLogger *)self _featureNameForTask:a3];
    int v15 = 138543618;
    v16 = v10;
    __int16 v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_2600DC000, v11, OS_LOG_TYPE_DEFAULT, "Log %{public}@ activity for %{public}@", (uint8_t *)&v15, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = WeakRetained;
  if (a3)
  {
    [WeakRetained activityLogger:self logUsageForTask:a3 interval:a4 date:v8];
  }
  else
  {
    [WeakRetained activityLogger:self logAggregateUsageForInterval:a4 date:v8];
    if (a4 == 1) {
      [(_LTActivityLogger *)self _logAssetSnapshotForDate:v8];
    }
  }
}

- (void)_logAssetSnapshotForDate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetSnapshotProvider);
  id v6 = WeakRetained;
  if (WeakRetained) {
    objc_super v7 = (_LTDAnalyticsAssetSnapshotProvider *)WeakRetained;
  }
  else {
    objc_super v7 = objc_alloc_init(_LTDAnalyticsAssetSnapshotProvider);
  }
  id v8 = v7;

  id v9 = _LTOSLogAssets();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_LTActivityLogger _logAssetSnapshotForDate:](v9);
  }
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46___LTActivityLogger__logAssetSnapshotForDate___block_invoke;
  v11[3] = &unk_265545B70;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [(_LTDAnalyticsAssetSnapshotProvider *)v8 collectAssetSnapshotWithCompletion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_updateLastLoggedDate:(id)a3 forTask:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = _LTOSLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v10 = v7;
    v11 = [(_LTActivityLogger *)self _featureNameForTask:a4];
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_debug_impl(&dword_2600DC000, v10, OS_LOG_TYPE_DEBUG, "Updating last logged date for %{public}@ to: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (a4) {
    [WeakRetained activityLogger:self updateLastLoggedDate:v6 forTask:a4];
  }
  else {
    [WeakRetained activityLogger:self updateLastAggregateLogDate:v6];
  }
}

- (void)activityLogger:(id)a3 logUsageForTask:(int64_t)a4 interval:(unint64_t)a5 date:(id)a6
{
  id v11 = a3;
  id v10 = a6;
  switch(a5)
  {
    case 2uLL:
      [(_LTActivityLogger *)self _sendMonthlyUsageForTask:a4 date:v10];
      break;
    case 1uLL:
      [(_LTActivityLogger *)self _sendWeeklyUsageForTask:a4 date:v10];
      break;
    case 0uLL:
      [(_LTActivityLogger *)self _sendDailyUsageForTask:a4 date:v10];
      break;
  }
}

- (id)activityLogger:(id)a3 lastLoggedDateForTask:(int64_t)a4
{
  id v4 = [(_LTActivityLogger *)self _activityDatePreferenceKeyForTask:a4];
  v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v6 = [v5 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)activityLogger:(id)a3 updateLastLoggedDate:(id)a4 forTask:(int64_t)a5
{
  id v7 = a4;
  id v9 = [(_LTActivityLogger *)self _activityDatePreferenceKeyForTask:a5];
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v8 setObject:v7 forKey:v9];
}

- (void)activityLogger:(id)a3 logAggregateUsageForInterval:(unint64_t)a4 date:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 2uLL:
      [(_LTActivityLogger *)self _sendMonthlyUsageForTask:0 date:v8];
      break;
    case 1uLL:
      [(_LTActivityLogger *)self _sendWeeklyUsageForTask:0 date:v8];
      break;
    case 0uLL:
      [(_LTActivityLogger *)self _sendDailyUsageForTask:0 date:v8];
      break;
  }
}

- (void)activityLogger:(id)a3 logAssetSnapshot:(id)a4 forDate:(id)a5
{
}

- (id)lastAggregateLogDateForActivityLogger:(id)a3
{
  return [(_LTActivityLogger *)self activityLogger:a3 lastLoggedDateForTask:0];
}

- (void)activityLogger:(id)a3 updateLastAggregateLogDate:(id)a4
{
}

- (void)_sendDailyUsageForTask:(int64_t)a3 date:(id)a4
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = -[_LTActivityLogger _featureNameForTask:](self, "_featureNameForTask:", a3, a4);
  id v6 = @"feature";
  v7[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  AnalyticsSendEvent();
}

- (id)_weekNameForDate:(id)a3
{
  uint64_t v3 = [(NSCalendar *)self->_calendar components:8196 fromDate:a3];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%0*ld_%ld", 2, objc_msgSend(v3, "weekOfYear"), objc_msgSend(v3, "year"));

  return v4;
}

- (void)_sendWeeklyUsageForTask:(int64_t)a3 date:(id)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(_LTActivityLogger *)self _featureNameForTask:a3];
  id v8 = [(_LTActivityLogger *)self _weekNameForDate:v6];

  v10[0] = @"feature";
  v10[1] = @"week_name";
  v11[0] = v7;
  v11[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  AnalyticsSendEvent();
}

- (void)_sendMonthlyUsageForTask:(int64_t)a3 date:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(_LTActivityLogger *)self _featureNameForTask:a3];
  id v8 = [(NSCalendar *)self->_calendar components:12 fromDate:v6];

  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%0*ld_%ld", 2, objc_msgSend(v8, "month"), objc_msgSend(v8, "year"));
  v11[0] = @"feature";
  v11[1] = @"month_name";
  v12[0] = v7;
  v12[1] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  AnalyticsSendEvent();
}

- (void)_sendWeeklyMobileAssetSnapshot:(id)a3 date:(id)a4
{
  v18[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(_LTActivityLogger *)self _weekNameForDate:a4];
  v18[0] = v7;
  v17[0] = @"week_name";
  v17[1] = @"asset_build_number";
  uint64_t v8 = [v6 assetBuild];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = @"<UNAVAILABLE>";
  }
  v18[1] = v10;
  v17[2] = @"expected_configuration_version";
  uint64_t v11 = [v6 expectedAssetVersion];
  int v12 = (void *)v11;
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  else {
    id v13 = @"<UNAVAILABLE>";
  }
  v18[2] = v13;
  v17[3] = @"installed_configuration_version";
  __int16 v14 = [v6 installedAssetVersion];

  if (v14) {
    id v15 = v14;
  }
  else {
    id v15 = @"<UNAVAILABLE>";
  }
  v18[3] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  AnalyticsSendEvent();
}

- (id)_featureNameForTask:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return @"aggregate";
  }
  else {
    return off_265545BA8[a3];
  }
}

- (id)_activityDatePreferenceKeyForTask:(int64_t)a3
{
  uint64_t v3 = [(_LTActivityLogger *)self _featureNameForTask:a3];
  id v4 = [NSString stringWithFormat:@"%@_%@", @"LastActivityDate", v3];

  return v4;
}

- (_LTActivityLoggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_LTActivityLoggerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_LTDAnalyticsAssetSnapshotProviding)assetSnapshotProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetSnapshotProvider);
  return (_LTDAnalyticsAssetSnapshotProviding *)WeakRetained;
}

- (void)setAssetSnapshotProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetSnapshotProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)registerActivity:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2600DC000, log, OS_LOG_TYPE_FAULT, "Client attempted to register unspecified event; clients should always specify which event is being logged",
    v1,
    2u);
}

- (void)_logAssetSnapshotForDate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Beginning request to collect asset snapshot", v1, 2u);
}

@end