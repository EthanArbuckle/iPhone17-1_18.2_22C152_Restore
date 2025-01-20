@interface PassNotificationService
+ (id)_predicateForNotificationServicePID:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPassNotificationServiceWithNotificationService:(id)a3 inDatabase:(id)a4;
+ (id)queryWithDatabase:(id)a3 transactionServicePID:(unint64_t)a4;
- (PassNotificationService)initWithNotificationServicePID:(unint64_t)a3 inDatabase:(id)a4;
- (id)lastUpdatedDate;
- (id)lastUpdatedTag;
- (id)lastUpdatedTagDate;
- (id)notificationService;
- (unint64_t)registrationStatus;
- (void)updateWithLastUpdatedDate:(id)a3;
- (void)updateWithLastUpdatedTag:(id)a3;
- (void)updateWithNotificationService:(id)a3;
- (void)updateWithRegistrationStatus:(unint64_t)a3;
@end

@implementation PassNotificationService

- (PassNotificationService)initWithNotificationServicePID:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = +[NSMutableDictionary dictionary];
  v8 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v7 setObject:v8 forKey:@"notification_service_pid"];

  [v7 setInteger:2 forKey:@"registration_status"];
  v11.receiver = self;
  v11.super_class = (Class)PassNotificationService;
  v9 = [(SQLiteEntity *)&v11 initWithPropertyValues:v7 inDatabase:v6];

  return v9;
}

+ (id)databaseTable
{
  return @"pass_notification_service";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"notification_service_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"pid";
  }
  return 0;
}

+ (id)insertPassNotificationServiceWithNotificationService:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v9 = [v7 persistentID];

  id v10 = [v8 initWithNotificationServicePID:v9 inDatabase:v6];
  return v10;
}

+ (id)queryWithDatabase:(id)a3 transactionServicePID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v8 = [a1 _predicateForNotificationServicePID:v7];
  id v9 = [a1 queryWithDatabase:v6 predicate:v8];

  return v9;
}

- (id)notificationService
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"notification_service_pid"];
  if (v3)
  {
    v4 = [NotificationService alloc];
    id v5 = [v3 longLongValue];
    id v6 = [(SQLiteEntity *)self database];
    id v7 = [(SQLiteEntity *)v4 initWithPersistentID:v5 inDatabase:v6];
  }
  else
  {
    id v7 = 0;
  }
  if ([(SQLiteEntity *)v7 existsInDatabase]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (unint64_t)registrationStatus
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"registration_status"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)lastUpdatedDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"last_updated_date"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

- (id)lastUpdatedTag
{
  return [(SQLiteEntity *)self valueForProperty:@"last_updated_tag"];
}

- (id)lastUpdatedTagDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"last_updated_tag_date"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

- (void)updateWithRegistrationStatus:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"registration_status"];
}

- (void)updateWithNotificationService:(id)a3
{
  id v4 = (id)_SQLValueForEntity();
  [(SQLiteEntity *)self setValue:v4 forProperty:@"notification_service_pid"];
}

- (void)updateWithLastUpdatedDate:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  [v5 setObjectOrNull:v4 forKey:@"last_updated_date"];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

- (void)updateWithLastUpdatedTag:(id)a3
{
  id v6 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  if (v6)
  {
    id v5 = +[NSDate date];
  }
  else
  {
    id v5 = 0;
  }
  [v4 setObjectOrNull:v6 forKey:@"last_updated_tag"];
  [v4 setObjectOrNull:v5 forKey:@"last_updated_tag_date"];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (id)_predicateForNotificationServicePID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"notification_service_pid" equalToValue:a3];
}

@end