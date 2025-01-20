@interface ChangeHistoryEvent
+ (id)databaseTable;
+ (id)eventsMatchingPredicate:(id)a3 inDatabase:(id)a4;
+ (id)eventsWithRecordType:(int64_t)a3 inDatabase:(id)a4;
+ (id)eventsWithRecordType:(int64_t)a3 recodUniqueID:(id)a4 inDatabase:(id)a5;
+ (id)predicateForAllChangeEvents;
+ (id)predicateForChangeEventRecord:(int64_t)a3;
+ (id)predicateForChangeEventRecordType:(int64_t)a3 recordUniqueID:(id)a4;
+ (id)predicateForChangeEventRecordUniqueIDs:(id)a3;
+ (id)predicateForChangeEventType:(int64_t)a3;
+ (id)predicateForChangeEventWithIdentifier:(id)a3;
+ (id)predicateForChangeEventsOlderThan:(int64_t)a3;
+ (id)propertySettersForChangeHistoryEvent;
+ (id)propertyValuesFromEvent:(id)a3;
+ (unint64_t)numberOfChangeEventsInDatabase:(id)a3;
+ (void)deleteAllEventsInDatabase:(id)a3;
+ (void)deleteEvents:(id)a3 inDatabase:(id)a4;
+ (void)deleteEventsMatchingPredicate:(id)a3 inDatabase:(id)a4;
+ (void)deleteEventsOlderThan:(unint64_t)a3 inDatabase:(id)a4;
+ (void)insertEvents:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (ChangeHistoryEvent)initWithEvent:(id)a3 inDatabase:(id)a4;
- (id)recordUniqueID;
- (int64_t)recordType;
@end

@implementation ChangeHistoryEvent

+ (id)databaseTable
{
  return @"change_history_event";
}

- (ChangeHistoryEvent)initWithEvent:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = +[ChangeHistoryEvent propertyValuesFromEvent:a3];
  v10.receiver = self;
  v10.super_class = (Class)ChangeHistoryEvent;
  v8 = [(SQLiteEntity *)&v10 initWithPropertyValues:v7 inDatabase:v6];

  return v8;
}

+ (void)insertEvents:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10043C8F8;
  v9[3] = &unk_10073DBA0;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  sub_10000817C((uint64_t)v7, v9);
}

+ (unint64_t)numberOfChangeEventsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = [a1 predicateForAllChangeEvents];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  id v7 = [v6 countOfEntities];
  return (unint64_t)v7;
}

+ (id)eventsWithRecordType:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 predicateForChangeEventRecord:a3];
  id v8 = [a1 eventsMatchingPredicate:v7 inDatabase:v6];

  return v8;
}

+ (id)eventsMatchingPredicate:(id)a3 inDatabase:(id)a4
{
  v5 = [a1 queryWithDatabase:a4 predicate:a3];
  id v6 = [a1 propertySettersForChangeHistoryEvent];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [v6 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10043CC3C;
  v13[3] = &unk_10072EAD8;
  id v15 = v7;
  id v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  [v5 enumeratePersistentIDsAndProperties:v8 usingBlock:v13];

  id v11 = [v9 copy];
  return v11;
}

- (BOOL)deleteFromDatabase
{
  v3 = [(ChangeHistoryEvent *)self recordUniqueID];
  int64_t v4 = [(ChangeHistoryEvent *)self recordType];
  v5 = [(SQLiteEntity *)self database];
  +[ChangeHistoryEventRetryDetails deleteRetryDetailsForEventUniqueIdentifier:v3 recordType:v4 inDatabase:v5];

  v7.receiver = self;
  v7.super_class = (Class)ChangeHistoryEvent;
  return [(SQLiteEntity *)&v7 deleteFromDatabase];
}

+ (void)deleteEvents:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10043CE3C;
  v9[3] = &unk_10073DBA0;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  sub_10000817C((uint64_t)v7, v9);
}

+ (void)deleteAllEventsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [a1 predicateForAllChangeEvents];
  [a1 deleteEventsMatchingPredicate:v5 inDatabase:v4];
}

+ (void)deleteEventsOlderThan:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 predicateForChangeEventsOlderThan:a3];
  [a1 deleteEventsMatchingPredicate:v7 inDatabase:v6];
}

+ (void)deleteEventsMatchingPredicate:(id)a3 inDatabase:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10043D134;
  v8[3] = &unk_10073DBA0;
  id v10 = a3;
  id v11 = a1;
  id v9 = a4;
  id v6 = v10;
  id v7 = v9;
  sub_10000817C((uint64_t)v7, v8);
}

+ (id)eventsWithRecordType:(int64_t)a3 recodUniqueID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 predicateForChangeEventRecordType:a3 recordUniqueID:a4];
  id v10 = [a1 eventsMatchingPredicate:v9 inDatabase:v8];

  return v10;
}

+ (id)predicateForChangeEventRecordType:(int64_t)a3 recordUniqueID:(id)a4
{
  id v6 = a4;
  id v7 = [a1 predicateForChangeEventRecord:a3];
  id v13 = v6;
  v14[0] = v7;
  id v8 = +[NSArray arrayWithObjects:&v13 count:1];
  id v9 = [a1 predicateForChangeEventRecordUniqueIDs:v8];
  v14[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v14 count:2];
  id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  return v11;
}

+ (id)predicateForChangeEventType:(int64_t)a3
{
  v3 = +[NSNumber numberWithInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:v3];

  return v4;
}

+ (id)predicateForChangeEventRecordUniqueIDs:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:@"record_uniqueID" equalToValues:a3];
}

+ (id)predicateForChangeEventRecord:(int64_t)a3
{
  v3 = +[NSNumber numberWithInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"record_type" equalToValue:v3];

  return v4;
}

+ (id)predicateForChangeEventWithIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)predicateForAllChangeEvents
{
  return +[SQLiteBooleanPredicate truePredicate];
}

+ (id)predicateForChangeEventsOlderThan:(int64_t)a3
{
  id v4 = +[NSDate date];
  id v5 = [v4 dateByAddingTimeInterval:(double)a3 * -86400.0];
  id v6 = (void *)_SQLValueForDate();
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"timestamp" lessThanValue:v6];

  return v7;
}

- (id)recordUniqueID
{
  return [(SQLiteEntity *)self valueForProperty:@"record_uniqueID"];
}

- (int64_t)recordType
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"record_type"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

+ (id)propertySettersForChangeHistoryEvent
{
  v4[0] = @"identifier";
  v4[1] = @"type";
  v5[0] = &stru_1007513A0;
  v5[1] = &stru_1007513C0;
  v4[2] = @"record_type";
  v4[3] = @"record_uniqueID";
  v5[2] = &stru_1007513E0;
  v5[3] = &stru_100751400;
  v4[4] = @"timestamp";
  v5[4] = &stru_100751420;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (id)propertyValuesFromEvent:(id)a3
{
  v12[0] = @"identifier";
  id v3 = a3;
  id v4 = [v3 identifier];
  v13[0] = v4;
  v12[1] = @"type";
  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 type]);
  v13[1] = v5;
  v12[2] = @"record_type";
  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 recordType]);
  v13[2] = v6;
  v12[3] = @"record_uniqueID";
  id v7 = [v3 recordUniqueID];
  v13[3] = v7;
  v12[4] = @"timestamp";
  id v8 = [v3 timestamp];

  id v9 = (void *)_SQLValueForDate();
  void v13[4] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];

  return v10;
}

@end