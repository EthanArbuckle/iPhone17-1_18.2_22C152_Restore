@interface PLFileStats
+ (double)totalLogDuration;
+ (double)totalLogDurationFromTable:(id)a3 where:(id)a4;
+ (id)cpuTimeForProcess:(id)a3;
+ (id)logEndDate;
+ (id)logEndDateFromTable:(id)a3;
+ (id)logStartDate;
+ (id)logStartDateFromTable:(id)a3;
+ (id)select:(id)a3 from:(id)a4 where:(id)a5;
+ (id)statsForFile:(id)a3;
+ (id)tableCounts;
+ (int64_t)fileSizeAtPath:(id)a3;
@end

@implementation PLFileStats

+ (int64_t)fileSizeAtPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  v5 = [v3 defaultManager];
  v6 = [v5 attributesOfItemAtPath:v4 error:0];

  if (v6
    && (uint64_t v7 = *MEMORY[0x1E4F28390],
        [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28390]],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    v9 = [v6 objectForKeyedSubscript:v7];
    int64_t v10 = [v9 longLongValue];
  }
  else
  {
    int64_t v10 = -1;
  }

  return v10;
}

+ (id)statsForFile:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  v5 = [v3 dictionary];
  v6 = NSNumber;
  uint64_t v7 = [(id)objc_opt_class() fileSizeAtPath:v4];

  v8 = [v6 numberWithLongLong:v7];
  if (v8) {
    [v5 setObject:v8 forKeyedSubscript:@"FileSize"];
  }
  v9 = [(id)objc_opt_class() tableCounts];

  if (v9) {
    [v5 setObject:v9 forKeyedSubscript:@"TableCounts"];
  }
  int64_t v10 = [(id)objc_opt_class() select:@"CRKey" from:@"PLConfigAgent_EventNone_Config" where:0];
  v11 = [v10 lastObject];
  v12 = [v11 objectForKeyedSubscript:@"CRKey"];

  if (v12) {
    [v5 setObject:v12 forKeyedSubscript:@"CRKey"];
  }
  v13 = [(id)objc_opt_class() select:@"Build" from:@"PLConfigAgent_EventNone_Config" where:0];
  v14 = [v13 lastObject];
  v15 = [v14 objectForKeyedSubscript:@"Build"];

  if (v15) {
    [v5 setObject:v15 forKeyedSubscript:@"Build"];
  }
  v16 = NSNumber;
  [(id)objc_opt_class() totalLogDuration];
  v17 = objc_msgSend(v16, "numberWithDouble:");

  if (v17) {
    [v5 setObject:v17 forKeyedSubscript:@"TotalLogDuration"];
  }
  v18 = NSNumber;
  v19 = [(id)objc_opt_class() logEndDate];
  [v19 timeIntervalSince1970];
  v20 = objc_msgSend(v18, "numberWithDouble:");

  if (v20) {
    [v5 setObject:v20 forKeyedSubscript:@"LastBatteryTimestamp"];
  }
  v21 = [(id)objc_opt_class() cpuTimeForProcess:@"PerfPowerServicesExtended"];

  if (v21) {
    [v5 setObject:v21 forKeyedSubscript:@"TotalPowerlogCPUTime"];
  }

  return v5;
}

+ (id)logStartDate
{
  if (+[PLUtilities hasBattery]) {
    v2 = @"PLBatteryAgent_EventBackward_Battery";
  }
  else {
    v2 = @"PLNetworkAgent_EventBackward_CumulativeNetworkUsage";
  }
  v3 = objc_opt_class();
  return (id)[v3 logStartDateFromTable:v2];
}

+ (id)logEndDate
{
  if (+[PLUtilities hasBattery]) {
    v2 = @"PLBatteryAgent_EventBackward_Battery";
  }
  else {
    v2 = @"PLNetworkAgent_EventBackward_CumulativeNetworkUsage";
  }
  v3 = objc_opt_class();
  return (id)[v3 logEndDateFromTable:v2];
}

+ (double)totalLogDuration
{
  v2 = [(id)objc_opt_class() logStartDate];
  v3 = [(id)objc_opt_class() logEndDate];
  id v4 = v3;
  double v5 = 0.0;
  if (v2 && v3)
  {
    [v3 timeIntervalSinceDate:v2];
    if (v6 >= 0.0) {
      double v5 = v6;
    }
    else {
      double v5 = 0.0;
    }
  }

  return v5;
}

+ (id)logStartDateFromTable:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() select:@"min(timestamp)" from:v3 where:0];

  double v5 = [v4 firstObject];
  double v6 = [v5 objectForKeyedSubscript:@"min(timestamp)"];

  uint64_t v7 = 0;
  if (objc_opt_respondsToSelector())
  {
    v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v6 doubleValue];
    uint64_t v7 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
  }

  return v7;
}

+ (id)logEndDateFromTable:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() select:@"max(timestamp)" from:v3 where:0];

  double v5 = [v4 firstObject];
  double v6 = [v5 objectForKeyedSubscript:@"max(timestamp)"];

  uint64_t v7 = 0;
  if (objc_opt_respondsToSelector())
  {
    v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v6 doubleValue];
    uint64_t v7 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
  }

  return v7;
}

+ (double)totalLogDurationFromTable:(id)a3 where:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() select:@"max(timestamp)-min(timestamp)" from:v6 where:v5];

  v8 = [v7 firstObject];
  v9 = [v8 objectForKeyedSubscript:@"max(timestamp)-min(timestamp)"];

  double v10 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v9 doubleValue];
    if (v11 >= 0.0) {
      double v10 = v11;
    }
    else {
      double v10 = 0.0;
    }
  }

  return v10;
}

+ (id)cpuTimeForProcess:(id)a3
{
  id v3 = [NSString stringWithFormat:@"SELECT sum(cpu_seconds) FROM(SELECT case when diff_raw < -10 then value else diff_raw end as cpu_seconds FROM(SELECT *, value - prevVal as diff_raw FROM(SELECT ID, ProcessName, value,(SELECT t2.value FROM PLProcessMonitorAgent_EventBackward_ProcessMonitor_Dynamic t2 where t2.ID < t1.ID and ProcessName == \"%@\" order by t2.ID desc limit 1) as prevVal FROM PLProcessMonitorAgent_EventBackward_ProcessMonitor_Dynamic t1 WHERE ProcessName == \"%@\")) WHERE cpu_seconds IS NOT NULL)", a3, a3];
  id v4 = +[PLSQLiteConnection sharedSQLiteConnection];
  id v5 = [v4 performQuery:v3];
  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"sum(cpu_seconds)"];

  return v7;
}

+ (id)tableCounts
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v2 = [(id)objc_opt_class() select:@"name" from:@"sqlite_master" where:@"type='table'"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "objectForKeyedSubscript:", @"name", v12);
        if (![v7 rangeOfString:@"PL"])
        {
          v8 = [(id)objc_opt_class() select:@"Count(*)" from:v7 where:0];
          v9 = [v8 firstObject];
          double v10 = [v9 objectForKeyedSubscript:@"Count(*)"];

          if (v10) {
            [v12 setObject:v10 forKeyedSubscript:v7];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return v12;
}

+ (id)select:(id)a3 from:(id)a4 where:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = v9;
  if (v9 && [v9 length])
  {
    double v11 = [NSString stringWithFormat:@" WHERE %@", v10];
  }
  else
  {
    double v11 = &stru_1F15208F0;
  }

  id v12 = [NSString stringWithFormat:@"SELECT %@ FROM '%@'%@;", v7, v8, v11];
  long long v13 = +[PLSQLiteConnection sharedSQLiteConnection];
  long long v14 = [v13 performQuery:v12];

  return v14;
}

@end