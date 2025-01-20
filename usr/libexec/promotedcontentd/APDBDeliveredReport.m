@interface APDBDeliveredReport
- (BOOL)deleteReportsBetweenStartDay:(id)a3 endDay:(id)a4;
- (BOOL)deleteReportsOlderThan:(id)a3;
- (Class)rowClass;
- (id)deliveryReportWithType:(id)a3 dayOfYear:(id)a4;
- (id)deliveryReportsWithType:(id)a3;
- (id)lastDeliveryReportWithType:(id)a3;
- (id)storeDeliveryReportType:(id)a3 dayOfYear:(id)a4 frequency:(id)a5 reportDate:(id)a6;
@end

@implementation APDBDeliveredReport

- (Class)rowClass
{
  return (Class)objc_opt_class();
}

- (id)storeDeliveryReportType:(id)a3 dayOfYear:(id)a4 frequency:(id)a5 reportDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(APDBDeliveredReport *)self manager];

  if (v14)
  {
    if (v10 && v11 && v12 && v13)
    {
      id v15 = [[APDBDeliveredReportRow alloc] initType:v10 dayOfYear:v11 frequency:v12 reportDate:v13 table:self];
      if ([v15 save]) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }

      goto LABEL_16;
    }
    v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138477827;
      id v22 = (id)objc_opt_class();
      id v18 = v22;
      v19 = "[%{private}@]: Error storing delivery report, NONNULL params are NULL";
      goto LABEL_12;
    }
  }
  else
  {
    v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138477827;
      id v22 = (id)objc_opt_class();
      id v18 = v22;
      v19 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 0xCu);
    }
  }

  id v16 = 0;
LABEL_16:

  return v16;
}

- (id)lastDeliveryReportWithType:(id)a3
{
  id v4 = a3;
  v5 = [(APDBDeliveredReport *)self manager];
  if (!v5)
  {
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      id v11 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
    }
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  if (!v4)
  {
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      id v11 = "[%{private}@]: Error getting last delivery report, NONNULL params are NULL";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v6 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"type" forColumnType:3 withValue:v4];
  id v13 = v6;
  v7 = +[NSArray arrayWithObjects:&v13 count:1];
  v8 = [v5 executeSelectQuery:@"SELECT rowid, * FROM APDBDeliveredReport WHERE type = ? ORDER BY reportDate DESC LIMIT 1", self, v7 forTable withParameters];

  if (v8 && [v8 count])
  {
    v9 = [v8 lastObject];
  }
  else
  {
    v9 = 0;
  }

LABEL_14:

  return v9;
}

- (id)deliveryReportsWithType:(id)a3
{
  id v4 = a3;
  v5 = [(APDBDeliveredReport *)self manager];
  if (v5)
  {
    if (v4)
    {
      v6 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"type" forColumnType:3 withValue:v4];
      id v12 = v6;
      v7 = +[NSArray arrayWithObjects:&v12 count:1];
      v8 = [v5 executeSelectQuery:@"SELECT rowid, * FROM APDBDeliveredReport WHERE type = ? ORDER BY reportDate", self, v7 forTable withParameters];

      goto LABEL_10;
    }
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = (id)objc_opt_class();
      id v9 = v14;
      id v10 = "[%{private}@]: Error getting delivery report with type, NONNULL params are NULL";
      goto LABEL_8;
    }
  }
  else
  {
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = (id)objc_opt_class();
      id v9 = v14;
      id v10 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)deliveryReportWithType:(id)a3 dayOfYear:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(APDBDeliveredReport *)self manager];
  if (!v8)
  {
    id v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v19 = (id)objc_opt_class();
      id v14 = v19;
      id v15 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
    }
LABEL_12:
    id v13 = 0;
    goto LABEL_15;
  }
  if (!v6 || !v7)
  {
    id v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v19 = (id)objc_opt_class();
      id v14 = v19;
      id v15 = "[%{private}@]: Error getting delivery report with type and day of year, NONNULL params are NULL";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v9 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"type" forColumnType:3 withValue:v6];
  id v10 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v7];
  v17[0] = v9;
  v17[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v17 count:2];
  id v12 = [v8 executeSelectQuery:@"SELECT rowid, * FROM APDBDeliveredReport WHERE type = ? AND dayOfYear = ? ORDER BY reportDate", self, v11 forTable withParameters];

  if (v12 && [v12 count])
  {
    id v13 = [v12 lastObject];
  }
  else
  {
    id v13 = 0;
  }

LABEL_15:

  return v13;
}

- (BOOL)deleteReportsBetweenStartDay:(id)a3 endDay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(APDBDeliveredReport *)self manager];
  if (!v8)
  {
    id v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v23 = (id)objc_opt_class();
      id v10 = v23;
      id v11 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_14;
    }
LABEL_15:
    unsigned __int8 v12 = 0;
    goto LABEL_16;
  }
  if (!v6 || !v7)
  {
    id v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v23 = (id)objc_opt_class();
      id v10 = v23;
      id v11 = "[%{private}@]: Error deleting delivery report between days, NONNULL params are NULL";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ((uint64_t)[v6 integerValue] > 1231
    || (uint64_t)[v7 integerValue] > 1231
    || (uint64_t)[v6 integerValue] < 101
    || (uint64_t)[v7 integerValue] <= 100)
  {
    id v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v23 = (id)objc_opt_class();
      id v10 = v23;
      id v11 = "[%{private}@]: Error deleting delivery report between days, days out of range.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  id v9 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v6];
  id v14 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v7];
  id v15 = [v7 integerValue];
  if ((uint64_t)v15 >= (uint64_t)[v6 integerValue])
  {
    v20[0] = v9;
    v20[1] = v14;
    id v18 = +[NSArray arrayWithObjects:v20 count:2];
    CFStringRef v19 = @"DELETE FROM APDBDeliveredReport WHERE dayOfYear >= ? AND dayOfYear <= ?";
  }
  else
  {
    id v16 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:&off_100248DF8];
    id v17 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:&off_100248E10];
    v21[0] = v9;
    v21[1] = v16;
    v21[2] = v17;
    v21[3] = v14;
    id v18 = +[NSArray arrayWithObjects:v21 count:4];

    CFStringRef v19 = @"DELETE FROM APDBDeliveredReport WHERE ((dayOfYear >= ? AND dayOfYear <= ?) OR (dayOfYear >= ? AND dayOfYear <= ?))";
  }
  unsigned __int8 v12 = [v8 executeQuery:v19 withParameters:v18];

LABEL_16:
  return v12;
}

- (BOOL)deleteReportsOlderThan:(id)a3
{
  id v4 = a3;
  v5 = [(APDBDeliveredReport *)self manager];
  if (!v5)
  {
    id v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = (id)objc_opt_class();
      id v9 = v14;
      id v10 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    }
LABEL_9:
    unsigned __int8 v8 = 0;
    goto LABEL_10;
  }
  if (!v4)
  {
    id v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = (id)objc_opt_class();
      id v9 = v14;
      id v10 = "[%{private}@]: Error deleting delivery report older than, NONNULL params are NULL";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v6 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"reportDate" forColumnType:4 withValue:v4];
  unsigned __int8 v12 = v6;
  id v7 = +[NSArray arrayWithObjects:&v12 count:1];
  unsigned __int8 v8 = [v5 executeQuery:@"DELETE FROM APDBDeliveredReport WHERE reportDate < ?" withParameters:v7];

LABEL_10:
  return v8;
}

@end