@interface APDBReportEventCount
- (BOOL)addCountForDayOfYear:(id)a3 purpose:(id)a4 event:(id)a5 value:(id)a6 environment:(id)a7 branch:(id)a8;
- (BOOL)deleteCountsBetweenStartDay:(id)a3 endDay:(id)a4;
- (BOOL)deleteCountsOlderThan:(id)a3;
- (Class)rowClass;
- (id)environments;
- (id)groupedEventCountForDayOfYear:(id)a3 purpose:(id)a4;
- (id)groupedEventCountForDayOfYear:(id)a3 purpose:(id)a4 event:(id)a5;
- (id)groupedEventCountForDayOfYear:(id)a3 purpose:(id)a4 event:(id)a5 value:(id)a6;
- (id)groupedEventCountForStartDay:(id)a3 endDay:(id)a4 purpose:(id)a5;
- (id)groupedEventCountForStartDay:(id)a3 endDay:(id)a4 purpose:(id)a5 event:(id)a6;
- (id)groupedEventCountForStartDay:(id)a3 endDay:(id)a4 purpose:(id)a5 event:(id)a6 value:(id)a7;
@end

@implementation APDBReportEventCount

- (Class)rowClass
{
  return (Class)objc_opt_class();
}

- (BOOL)addCountForDayOfYear:(id)a3 purpose:(id)a4 event:(id)a5 value:(id)a6 environment:(id)a7 branch:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = [(APDBReportEventCount *)self manager];
  if (!v20)
  {
    v21 = APLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v66 = (id)objc_opt_class();
      id v22 = v66;
      v23 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_14;
    }
LABEL_15:
    BOOL v24 = 0;
    goto LABEL_16;
  }
  if (!v14 || !v15 || !v16 || !v18)
  {
    v21 = APLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v66 = (id)objc_opt_class();
      id v22 = v66;
      v23 = "[%{private}@]: Error on Adding event count, NONNULL params are NULL";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ((uint64_t)[v14 integerValue] > 1231 || (uint64_t)objc_msgSend(v14, "integerValue") <= 100)
  {
    v21 = APLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v66 = (id)objc_opt_class();
      id v22 = v66;
      v23 = "[%{private}@]: Error on Adding event count, day of year is out of range.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (v17) {
    v21 = v17;
  }
  else {
    v21 = @"valueNullPlaceholder";
  }
  id v57 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v14];
  id v56 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"purpose" forColumnType:0 withValue:v15];
  id v55 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"event" forColumnType:0 withValue:v16];
  id v54 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"value" forColumnType:3 withValue:v21];
  id v52 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"count" forColumnType:0 withValue:&off_100248E28];
  id v53 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"environment" forColumnType:3 withValue:v18];
  id v26 = objc_alloc((Class)APDatabaseColumn);
  v27 = +[NSDate date];
  id v28 = [v26 initWithName:@"lastCountDate" forColumnType:4 withValue:v27];

  [v20 beginTransaction];
  v64[0] = v57;
  v64[1] = v56;
  v64[2] = v55;
  v64[3] = v54;
  v64[4] = v52;
  v64[5] = v53;
  v64[6] = v28;
  v64[7] = v28;
  v51 = v28;
  v29 = +[NSArray arrayWithObjects:v64 count:8];
  id v30 = [v20 executeInsertQuery:@"INSERT INTO APDBReportEventCount (dayOfYear, purpose, event, value, count, environment, lastCountDate) VALUES (?, ?, ?, ?, ?, ?, ?) ON CONFLICT (dayOfYear, purpose, event, value, environment) DO UPDATE SET count = count + 1, lastCountDate = ?", v29 withParameters];

  if (v30 == (id)-1) {
    goto LABEL_31;
  }
  if (![v19 count]) {
    goto LABEL_30;
  }
  v44 = v21;
  v45 = v20;
  id v46 = v18;
  id v47 = v17;
  id v48 = v16;
  id v49 = v15;
  id v50 = v14;
  id v31 = objc_alloc_init((Class)NSMutableArray);
  id v32 = objc_alloc_init((Class)NSMutableArray);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v33 = v19;
  id v34 = [v33 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v59;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v59 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"branch" forColumnType:3 withValue:*(void *)(*((void *)&v58 + 1) + 8 * i)];
        v62[0] = v57;
        v62[1] = v56;
        v62[2] = v55;
        v62[3] = v54;
        v62[4] = v53;
        v62[5] = v38;
        v39 = +[NSArray arrayWithObjects:v62 count:6];
        [v31 addObjectsFromArray:v39];

        [v32 addObject:@"((SELECT rowid FROM APDBReportEventCount WHERE dayOfYear = ? AND purpose = ? AND event = ? AND value = ? AND environment = ?), ?)"];
      }
      id v35 = [v33 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v35);
  }

  v40 = [v32 componentsJoinedByString:@", "];
  v41 = +[NSString stringWithFormat:@"INSERT INTO APDBEventBranch (eventId, branch) VALUES %@ ON CONFLICT (eventId, branch) DO NOTHING", v40];
  v20 = v45;
  v42 = (char *)[v45 executeInsertQuery:v41 withParameters:v31];

  BOOL v43 = v42 + 1 == 0;
  id v15 = v49;
  id v14 = v50;
  id v17 = v47;
  id v16 = v48;
  id v18 = v46;
  v21 = v44;
  if (v43)
  {
LABEL_31:
    BOOL v24 = 0;
  }
  else
  {
LABEL_30:
    [v20 commitTransaction];
    BOOL v24 = 1;
  }

LABEL_16:
  return v24;
}

- (id)groupedEventCountForDayOfYear:(id)a3 purpose:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(APDBReportEventCount *)self manager];
  if (!v8)
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v18 = (id)objc_opt_class();
      id v10 = v18;
      v11 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_12;
    }
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  if (!v6 || !v7)
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v18 = (id)objc_opt_class();
      id v10 = v18;
      v11 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if ((uint64_t)[v6 integerValue] > 1231 || (uint64_t)objc_msgSend(v6, "integerValue") <= 100)
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v18 = (id)objc_opt_class();
      id v10 = v18;
      v11 = "[%{private}@]: Error on getting event count, days are out of range.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v9 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v6];
  id v14 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"purpose" forColumnType:0 withValue:v7];
  v16[0] = v9;
  v16[1] = v14;
  id v15 = +[NSArray arrayWithObjects:v16 count:2];
  v12 = [v8 executeSelectQuery:@"SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear = ? AND purpose = ?", self, v15, @"environment" forTable withParameters groupedByColumn];

LABEL_14:

  return v12;
}

- (id)groupedEventCountForStartDay:(id)a3 endDay:(id)a4 purpose:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(APDBReportEventCount *)self manager];
  if (!v11)
  {
    v12 = APLogForCategory();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138477827;
    id v29 = (id)objc_opt_class();
    id v21 = v29;
    id v22 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);

    goto LABEL_18;
  }
  if (!v8 || !v9 || !v10)
  {
    v12 = APLogForCategory();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138477827;
    id v29 = (id)objc_opt_class();
    id v21 = v29;
    id v22 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
    goto LABEL_17;
  }
  if ((uint64_t)[v8 integerValue] <= 366
    && (uint64_t)[v9 integerValue] <= 366
    && (uint64_t)[v8 integerValue] >= 1
    && (uint64_t)[v9 integerValue] > 0)
  {
    v12 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v8];
    id v13 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v9];
    id v14 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"purpose" forColumnType:0 withValue:v10];
    id v15 = [v9 integerValue];
    if ((uint64_t)v15 >= (uint64_t)[v8 integerValue])
    {
      v26[0] = v12;
      v26[1] = v13;
      v26[2] = v14;
      id v19 = +[NSArray arrayWithObjects:v26 count:3];
      CFStringRef v20 = @"SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear >= ? AND dayOfYear <= ? AND purpose = ?";
    }
    else
    {
      id v25 = v14;
      id v16 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:&off_100248E40];
      id v17 = v13;
      id v18 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:&off_100248E28];
      v27[0] = v12;
      v27[1] = v16;
      v27[2] = v18;
      v27[3] = v17;
      v27[4] = v25;
      id v19 = +[NSArray arrayWithObjects:v27 count:5];

      id v13 = v17;
      id v14 = v25;
      CFStringRef v20 = @"SELECT rowid, * FROM APDBReportEventCount WHERE ((dayOfYear >= ? AND dayOfYear <= ?) OR (dayOfYear >= ? AND dayOfYear <= ?)) AND purpose = ?";
    }
    v23 = [v11 executeSelectQuery:v20 forTable:self withParameters:v19 groupedByColumn:@"environment"];

    goto LABEL_19;
  }
  v12 = APLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    id v29 = (id)objc_opt_class();
    id v21 = v29;
    id v22 = "[%{private}@]: Error on getting event count, days are out of range.";
    goto LABEL_17;
  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (id)groupedEventCountForDayOfYear:(id)a3 purpose:(id)a4 event:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(APDBReportEventCount *)self manager];
  if (!v11)
  {
    v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v22 = (id)objc_opt_class();
      id v13 = v22;
      id v14 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_13;
    }
LABEL_14:
    id v15 = 0;
    goto LABEL_15;
  }
  if (!v8 || !v9 || !v10)
  {
    v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v22 = (id)objc_opt_class();
      id v13 = v22;
      id v14 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ((uint64_t)[v8 integerValue] > 1231 || (uint64_t)objc_msgSend(v8, "integerValue") <= 100)
  {
    v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v22 = (id)objc_opt_class();
      id v13 = v22;
      id v14 = "[%{private}@]: Error on getting event count, days are out of range.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v12 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v8];
  id v17 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"purpose" forColumnType:0 withValue:v9];
  id v18 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"event" forColumnType:0 withValue:v10];
  v20[0] = v12;
  v20[1] = v17;
  v20[2] = v18;
  id v19 = +[NSArray arrayWithObjects:v20 count:3];
  id v15 = [v11 executeSelectQuery:@"SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear = ? AND purpose = ? AND event = ?", self, v19, @"environment" forTable withParameters groupedByColumn];

LABEL_15:

  return v15;
}

- (id)groupedEventCountForStartDay:(id)a3 endDay:(id)a4 purpose:(id)a5 event:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(APDBReportEventCount *)self manager];
  if (v14)
  {
    if (v10 && v11 && v12 && v13)
    {
      if ((uint64_t)[v10 integerValue] <= 1231
        && (uint64_t)[v11 integerValue] <= 1231
        && (uint64_t)[v10 integerValue] >= 101
        && (uint64_t)[v11 integerValue] > 100)
      {
        id v15 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v10];
        id v20 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v11];
        id v28 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"purpose" forColumnType:0 withValue:v12];
        id v29 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"event" forColumnType:0 withValue:v13];
        id v21 = [v11 integerValue];
        if ((uint64_t)v21 >= (uint64_t)[v10 integerValue])
        {
          v30[0] = v15;
          v30[1] = v20;
          v23 = v28;
          v30[2] = v28;
          v30[3] = v29;
          BOOL v24 = +[NSArray arrayWithObjects:v30 count:4];
          CFStringRef v25 = @"SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear >= ? AND dayOfYear <= ? AND purpose = ? AND event = ?";
        }
        else
        {
          id v26 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:&off_100248E58];
          id v27 = v20;
          id v22 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:&off_100248E70];
          v31[0] = v15;
          v31[1] = v26;
          v23 = v28;
          v31[2] = v22;
          v31[3] = v27;
          v31[4] = v28;
          v31[5] = v29;
          BOOL v24 = +[NSArray arrayWithObjects:v31 count:6];

          id v20 = v27;
          CFStringRef v25 = @"SELECT rowid, * FROM APDBReportEventCount WHERE ((dayOfYear >= ? AND dayOfYear <= ?) OR (dayOfYear >= ? AND dayOfYear <= ?)) AND purpose = ? AND event = ?";
        }
        id v18 = [v14 executeSelectQuery:v25 forTable:self withParameters:v24 groupedByColumn:@"environment"];

        goto LABEL_18;
      }
      id v15 = APLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v33 = (id)objc_opt_class();
        id v16 = v33;
        id v17 = "[%{private}@]: Error on getting event count, days are out of range.";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
      }
    }
    else
    {
      id v15 = APLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v33 = (id)objc_opt_class();
        id v16 = v33;
        id v17 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
        goto LABEL_16;
      }
    }
  }
  else
  {
    id v15 = APLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v33 = (id)objc_opt_class();
      id v16 = v33;
      id v17 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_16;
    }
  }
  id v18 = 0;
LABEL_18:

  return v18;
}

- (id)groupedEventCountForDayOfYear:(id)a3 purpose:(id)a4 event:(id)a5 value:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(APDBReportEventCount *)self manager];
  if (v14)
  {
    if (v10 && v11 && v12)
    {
      if ((uint64_t)[v10 integerValue] <= 1231 && (uint64_t)objc_msgSend(v10, "integerValue") > 100)
      {
        if (v13) {
          id v15 = v13;
        }
        else {
          id v15 = @"valueNullPlaceholder";
        }
        id v25 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v10];
        id v24 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"purpose" forColumnType:0 withValue:v11];
        id v20 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"event" forColumnType:0 withValue:v12];
        id v21 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"value" forColumnType:3 withValue:v15];
        v26[0] = v25;
        v26[1] = v24;
        v26[2] = v20;
        void v26[3] = v21;
        id v22 = v20;
        v23 = +[NSArray arrayWithObjects:v26 count:4];
        id v18 = [v14 executeSelectQuery:@"SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear = ? AND purpose = ? AND event = ? AND value = ?", self, v23, @"environment" forTable withParameters groupedByColumn];

        goto LABEL_15;
      }
      id v15 = APLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v28 = (id)objc_opt_class();
        id v16 = v28;
        id v17 = "[%{private}@]: Error on getting event count, days are out of range.";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
      }
    }
    else
    {
      id v15 = APLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v28 = (id)objc_opt_class();
        id v16 = v28;
        id v17 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
        goto LABEL_13;
      }
    }
  }
  else
  {
    id v15 = APLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v28 = (id)objc_opt_class();
      id v16 = v28;
      id v17 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_13;
    }
  }
  id v18 = 0;
LABEL_15:

  return v18;
}

- (id)groupedEventCountForStartDay:(id)a3 endDay:(id)a4 purpose:(id)a5 event:(id)a6 value:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(APDBReportEventCount *)self manager];
  if (v17)
  {
    if (v12 && v13 && v14 && v15)
    {
      if ((uint64_t)[v12 integerValue] <= 1231
        && (uint64_t)[v13 integerValue] <= 1231
        && (uint64_t)[v12 integerValue] >= 101
        && (uint64_t)[v13 integerValue] > 100)
      {
        if (v16) {
          id v18 = v16;
        }
        else {
          id v18 = @"valueNullPlaceholder";
        }
        id v29 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v12];
        id v33 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:v13];
        id v32 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"purpose" forColumnType:0 withValue:v14];
        id v31 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"event" forColumnType:0 withValue:v15];
        id v30 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"value" forColumnType:3 withValue:v18];
        id v23 = [v13 integerValue];
        if ((uint64_t)v23 >= (uint64_t)[v12 integerValue])
        {
          id v26 = v29;
          v34[0] = v29;
          v34[1] = v33;
          v34[2] = v32;
          v34[3] = v31;
          v34[4] = v30;
          id v25 = +[NSArray arrayWithObjects:v34 count:5];
          CFStringRef v27 = @"SELECT rowid, * FROM APDBReportEventCount WHERE dayOfYear >= ? AND dayOfYear <= ? AND purpose = ? AND event = ? AND value = ?";
        }
        else
        {
          id v28 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:&off_100248E58];
          id v24 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:&off_100248E70];
          v35[0] = v29;
          v35[1] = v28;
          v35[2] = v24;
          v35[3] = v33;
          v35[4] = v32;
          v35[5] = v31;
          v35[6] = v30;
          id v25 = +[NSArray arrayWithObjects:v35 count:7];

          id v26 = v29;
          CFStringRef v27 = @"SELECT rowid, * FROM APDBReportEventCount WHERE ((dayOfYear >= ? AND dayOfYear <= ?) OR (dayOfYear >= ? AND dayOfYear <= ?)) AND purpose = ? AND event = ? AND value = ?";
        }
        id v21 = [v17 executeSelectQuery:v27 forTable:self withParameters:v25 groupedByColumn:v28];

        goto LABEL_18;
      }
      id v18 = APLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v37 = (id)objc_opt_class();
        id v19 = v37;
        id v20 = "[%{private}@]: Error on getting event count, days are out of range.";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
      }
    }
    else
    {
      id v18 = APLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v37 = (id)objc_opt_class();
        id v19 = v37;
        id v20 = "[%{private}@]: Error on getting event count, NONNULL params are NULL";
        goto LABEL_16;
      }
    }
  }
  else
  {
    id v18 = APLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v37 = (id)objc_opt_class();
      id v19 = v37;
      id v20 = "[%{private}@]: Error APDatabaseManager is nill.";
      goto LABEL_16;
    }
  }
  id v21 = 0;
LABEL_18:

  return v21;
}

- (BOOL)deleteCountsBetweenStartDay:(id)a3 endDay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(APDBReportEventCount *)self manager];
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
      id v11 = "[%{private}@]: Error on delete counts between dates, days are null.";
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
      id v11 = "[%{private}@]: Error on delete counts between dates, days are out of range.";
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
    CFStringRef v19 = @"DELETE FROM APDBReportEventCount WHERE dayOfYear >= ? AND dayOfYear <= ?";
  }
  else
  {
    id v16 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:&off_100248E58];
    id v17 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"dayOfYear" forColumnType:0 withValue:&off_100248E70];
    v21[0] = v9;
    v21[1] = v16;
    v21[2] = v17;
    v21[3] = v14;
    id v18 = +[NSArray arrayWithObjects:v21 count:4];

    CFStringRef v19 = @"DELETE FROM APDBReportEventCount WHERE ((dayOfYear >= ? AND dayOfYear <= ?) OR (dayOfYear >= ? AND dayOfYear <= ?))";
  }
  unsigned __int8 v12 = [v8 executeQuery:v19 withParameters:v18];

LABEL_16:
  return v12;
}

- (BOOL)deleteCountsOlderThan:(id)a3
{
  id v4 = a3;
  v5 = [(APDBReportEventCount *)self manager];
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
      id v10 = "[%{private}@]: Error on Delete event counts older than, date is nil.";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v6 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"lastCountDate" forColumnType:4 withValue:v4];
  unsigned __int8 v12 = v6;
  id v7 = +[NSArray arrayWithObjects:&v12 count:1];
  unsigned __int8 v8 = [v5 executeQuery:@"DELETE FROM APDBReportEventCount WHERE lastCountDate < ?" withParameters:v7];

LABEL_10:
  return v8;
}

- (id)environments
{
  v2 = [(APDBReportEventCount *)self manager];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 executeSelectStringsQuery:@"SELECT environment FROM APDBReportEventCount GROUP BY environment" withParameters:&__NSArray0__struct];
  }
  else
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138477827;
      id v9 = (id)objc_opt_class();
      id v6 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nill.", (uint8_t *)&v8, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

@end