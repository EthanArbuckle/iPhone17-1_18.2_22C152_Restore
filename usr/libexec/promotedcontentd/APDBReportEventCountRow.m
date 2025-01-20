@interface APDBReportEventCountRow
- (NSArray)branch;
- (NSString)value;
- (void)setValue:(id)a3;
@end

@implementation APDBReportEventCountRow

- (NSString)value
{
  v2 = [(APDBReportEventCountRow *)self valueForColumnName:@"value"];
  if ([v2 isEqualToString:@"valueNullPlaceholder"]) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }

  return (NSString *)v3;
}

- (void)setValue:(id)a3
{
  if (!a3) {
    a3 = @"valueNullPlaceholder";
  }
  [(APDBReportEventCountRow *)self setValue:a3 forColumnName:@"value"];
}

- (NSArray)branch
{
  id v3 = [(APDBReportEventCountRow *)self table];
  v4 = [v3 manager];

  if (v4)
  {
    id v5 = objc_alloc((Class)APDatabaseColumn);
    v6 = [(APDBReportEventCountRow *)self rowid];
    v7 = [v5 initWithName:@"rowid" forColumnType:0 withValue:v6];

    v12 = v7;
    v8 = +[NSArray arrayWithObjects:&v12 count:1];
    v9 = [v4 executeSelectStringsQuery:@"SELECT branch FROM APDBEventBranch WHERE eventId = ?" withParameters:v8];
  }
  else
  {
    v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = (id)objc_opt_class();
      id v10 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nill.", buf, 0xCu);
    }
    v9 = 0;
  }

  return (NSArray *)v9;
}

@end