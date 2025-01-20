@interface ChangeHistoryEventRetryDetails
+ (id)_predicateForEvent:(id)a3;
+ (id)_predicateForRecordUniqueID:(id)a3 recordType:(int64_t)a4;
+ (id)databaseTable;
+ (id)retryDateForEvent:(id)a3 inDatabase:(id)a4;
+ (void)deleteRetryDetailsForEventUniqueIdentifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5;
+ (void)increaseRetryIntervalForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5;
- (ChangeHistoryEventRetryDetails)initWithRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5;
- (id)retryDate;
- (int64_t)retryInterval;
- (void)increaseRetryInterval;
@end

@implementation ChangeHistoryEventRetryDetails

+ (id)databaseTable
{
  return @"change_history_event_retry_details";
}

- (ChangeHistoryEventRetryDetails)initWithRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  [v10 setObjectOrNull:v9 forKey:@"event_unique_identifier"];

  v11 = +[NSNumber numberWithInteger:a4];
  [v10 setObjectOrNull:v11 forKey:@"event_record_type"];

  v14.receiver = self;
  v14.super_class = (Class)ChangeHistoryEventRetryDetails;
  v12 = [(SQLiteEntity *)&v14 initWithPropertyValues:v10 inDatabase:v8];

  return v12;
}

- (void)increaseRetryInterval
{
  int64_t v3 = [(ChangeHistoryEventRetryDetails *)self retryInterval];
  if ((unint64_t)(v3 + 1) < 9) {
    uint64_t v4 = v3 + 1;
  }
  else {
    uint64_t v4 = 9;
  }
  id v8 = +[NSDate dateWithTimeIntervalSinceNow:dbl_1005B30E0[v4]];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v6 forKey:@"retry_date"];

  v7 = +[NSNumber numberWithInteger:v4];
  [v5 setObjectOrNull:v7 forKey:@"retry_interval"];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (void)increaseRetryIntervalForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a1 _predicateForRecordUniqueID:v8 recordType:a4];
  v11 = [a1 anyInDatabase:v9 predicate:v10];

  if (!v11) {
    v11 = [[ChangeHistoryEventRetryDetails alloc] initWithRecordUniqueIdenifier:v8 recordType:a4 inDatabase:v9];
  }
  [(ChangeHistoryEventRetryDetails *)v11 increaseRetryInterval];
  v12 = [(ChangeHistoryEventRetryDetails *)v11 retryDate];
  int64_t v13 = [(ChangeHistoryEventRetryDetails *)v11 retryInterval];
  objc_super v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543874;
    id v16 = v8;
    __int16 v17 = 2114;
    v18 = v12;
    __int16 v19 = 2050;
    int64_t v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating ChangeHistoryEventRetryDetails for recordUniqueID %{public}@ with retryDate %{public}@ and retryInterval %{public}ld", (uint8_t *)&v15, 0x20u);
  }
}

+ (id)retryDateForEvent:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEvent:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 retryDate];

  return v9;
}

+ (void)deleteRetryDetailsForEventUniqueIdentifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a1 _predicateForRecordUniqueID:v8 recordType:a4];
  v11 = [a1 anyInDatabase:v9 predicate:v10];

  if (v11)
  {
    v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      id v14 = v8;
      __int16 v15 = 2050;
      int64_t v16 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deleting ChangeHistoryEventRetryDetails for recordUniqueID %{public}@ and recordType %{public}ld", (uint8_t *)&v13, 0x16u);
    }

    [v11 deleteFromDatabase];
  }
}

+ (id)_predicateForEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordUniqueID];
  id v6 = [v4 recordType];

  v7 = [a1 _predicateForRecordUniqueID:v5 recordType:v6];

  return v7;
}

+ (id)_predicateForRecordUniqueID:(id)a3 recordType:(int64_t)a4
{
  id v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"event_unique_identifier" equalToValue:a3];
  v11[0] = v5;
  id v6 = +[NSNumber numberWithInteger:a4];
  v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"event_record_type" equalToValue:v6];
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

- (int64_t)retryInterval
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"retry_interval"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)retryDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"retry_date"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

@end