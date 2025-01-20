@interface AccountEndpointBackOff
+ (id)_predicateForAccountType:(unint64_t)a3 accountPID:(int64_t)a4;
+ (id)_predicateForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5;
+ (id)anyInDatabase:(id)a3 forAccountType:(unint64_t)a4 accountPID:(int64_t)a5;
+ (id)anyInDatabase:(id)a3 forAccountType:(unint64_t)a4 endpointType:(unint64_t)a5 accountPID:(int64_t)a6;
+ (id)databaseTable;
+ (id)insertIfNotExistsForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6;
+ (void)deleteBackOffForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6;
+ (void)deleteEntriesForAccountType:(unint64_t)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountEndpointBackOff)initWithForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6;
- (id)nextPossibleFetchDate;
- (unint64_t)accountType;
- (unint64_t)endpointType;
- (void)increaseBackoffLevel;
@end

@implementation AccountEndpointBackOff

+ (id)databaseTable
{
  return @"account_endpoint_backoff";
}

+ (id)insertIfNotExistsForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = [a1 anyInDatabase:v10 forAccountType:a3 endpointType:a4 accountPID:a5];
  if (!v11)
  {
    id v11 = [objc_alloc((Class)a1) initWithForAccountType:a3 endpointType:a4 accountPID:a5 inDatabase:v10];
    v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 5) {
        CFStringRef v13 = @"broadway";
      }
      else {
        CFStringRef v13 = off_10074FEA0[a3];
      }
      if (a4 > 0xA) {
        CFStringRef v14 = @"account";
      }
      else {
        CFStringRef v14 = off_10074FED0[a4];
      }
      v15 = [v11 nextPossibleFetchDate];
      int v17 = 138412802;
      CFStringRef v18 = v13;
      __int16 v19 = 2112;
      CFStringRef v20 = v14;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Creating new account endpoint backoff for account type %@, endpoint type, %@, next update date %@", (uint8_t *)&v17, 0x20u);
    }
  }

  return v11;
}

- (AccountEndpointBackOff)initWithForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setInteger:a5 forKey:@"account_pid"];
  [v11 setInteger:a3 forKey:@"account_type"];
  [v11 setInteger:a4 forKey:@"endpoint_type"];
  [v11 setInteger:0 forKey:@"backoff_level"];
  v12 = +[NSDate dateWithTimeIntervalSinceNow:30.0];
  CFStringRef v13 = (void *)_SQLValueForDate();
  [v11 setObjectOrNull:v13 forKey:@"next_fetch"];

  id v14 = [v11 copy];
  v15 = [(SQLiteEntity *)self initWithPropertyValues:v14 inDatabase:v10];

  return v15;
}

+ (id)anyInDatabase:(id)a3 forAccountType:(unint64_t)a4 endpointType:(unint64_t)a5 accountPID:(int64_t)a6
{
  id v10 = a3;
  id v11 = [a1 _predicateForAccountType:a4 endpointType:a5 accountPID:a6];
  v12 = [a1 anyInDatabase:v10 predicate:v11];

  return v12;
}

+ (id)anyInDatabase:(id)a3 forAccountType:(unint64_t)a4 accountPID:(int64_t)a5
{
  id v8 = a3;
  v9 = [a1 _predicateForAccountType:a4 accountPID:a5];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (void)deleteBackOffForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = [a1 _predicateForAccountType:a3 endpointType:a4 accountPID:a5];
  v12 = [a1 queryWithDatabase:v10 predicate:v11];

  CFStringRef v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 5) {
      CFStringRef v14 = @"broadway";
    }
    else {
      CFStringRef v14 = off_10074FEA0[a3];
    }
    if (a4 > 0xA) {
      CFStringRef v15 = @"account";
    }
    else {
      CFStringRef v15 = off_10074FED0[a4];
    }
    int v16 = 138412546;
    CFStringRef v17 = v14;
    __int16 v18 = 2112;
    CFStringRef v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleting backoff level for account type %@, endpoint type %@", (uint8_t *)&v16, 0x16u);
  }

  [v12 deleteAllEntities];
}

+ (void)deleteEntriesForAccountType:(unint64_t)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [a1 _predicateForAccountType:a3 accountPID:a4];
  id v10 = [a1 queryWithDatabase:v8 predicate:v9];

  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 5) {
      CFStringRef v12 = @"broadway";
    }
    else {
      CFStringRef v12 = off_10074FEA0[a3];
    }
    int v13 = 138412290;
    CFStringRef v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deleting all backoff levels for account type %@", (uint8_t *)&v13, 0xCu);
  }

  [v10 deleteAllEntities];
}

+ (id)_predicateForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5
{
  v7 = +[NSNumber numberWithUnsignedInteger:a3];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_type" equalToValue:v7];
  v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4, v8);
  id v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"endpoint_type" equalToValue:v9];
  v16[1] = v10;
  id v11 = +[NSNumber numberWithLongLong:a5];
  CFStringRef v12 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_pid" equalToValue:v11];
  v16[2] = v12;
  int v13 = +[NSArray arrayWithObjects:v16 count:3];
  CFStringRef v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  return v14;
}

+ (id)_predicateForAccountType:(unint64_t)a3 accountPID:(int64_t)a4
{
  v5 = +[NSNumber numberWithUnsignedInteger:a3];
  v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_type" equalToValue:v5];
  v12[0] = v6;
  v7 = +[NSNumber numberWithLongLong:a4];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_pid" equalToValue:v7];
  v12[1] = v8;
  v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

- (void)increaseBackoffLevel
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"backoff_level"];
  v4 = (char *)[v3 integerValue];

  v5 = v4 + 1;
  uint64_t v6 = 13;
  if ((unint64_t)(v4 + 1) < 0xD) {
    uint64_t v6 = (uint64_t)(v4 + 1);
  }
  v7 = +[NSDate dateWithTimeIntervalSinceNow:dbl_1005B3A60[v6]];
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = [(AccountEndpointBackOff *)self accountType];
    if (v9 > 5) {
      CFStringRef v10 = @"broadway";
    }
    else {
      CFStringRef v10 = off_10074FEA0[v9];
    }
    unint64_t v11 = [(AccountEndpointBackOff *)self endpointType];
    if (v11 > 0xA) {
      CFStringRef v12 = @"account";
    }
    else {
      CFStringRef v12 = off_10074FED0[v11];
    }
    *(_DWORD *)buf = 138412802;
    CFStringRef v19 = v10;
    __int16 v20 = 2112;
    CFStringRef v21 = v12;
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Increasing backoff level for account type %@, endpoint type %@, next fetch date %@", buf, 0x20u);
  }

  int v13 = [(SQLiteEntity *)self database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10041A790;
  v15[3] = &unk_10073DBA0;
  id v16 = v7;
  CFStringRef v17 = v5;
  v15[4] = self;
  id v14 = v7;
  sub_10000817C((uint64_t)v13, v15);
}

- (id)nextPossibleFetchDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"next_fetch"];
  v3 = (void *)_DateForSQLValue();

  return v3;
}

- (unint64_t)accountType
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"account_type"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (unint64_t)endpointType
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"endpoint_type"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

@end