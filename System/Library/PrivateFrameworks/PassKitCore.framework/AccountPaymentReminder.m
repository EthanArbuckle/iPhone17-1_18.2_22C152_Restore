@interface AccountPaymentReminder
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForAccountPaymentReminder;
+ (id)databaseTable;
+ (id)insertPaymentReminder:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)paymentRemindersWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePaymentReminderWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (id)paymentReminder;
@end

@implementation AccountPaymentReminder

+ (id)paymentRemindersWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEventPID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = +[NSMutableSet set];
  CFStringRef v21 = @"pid";
  v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_10037B0A4;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertPaymentReminder:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  id v11 = [v9 minimumDue];
  id v12 = PKCurrencyDecimalToStorageNumber();

  [v10 setObjectOrNull:v12 forKey:@"b"];
  id v13 = [v9 currencyCode];
  [v10 setObjectOrNull:v13 forKey:@"c"];

  v14 = [v9 paymentDueDate];

  v15 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v15 forKey:@"d"];

  uint64_t v16 = +[NSNumber numberWithLongLong:a4];
  [v10 setObject:v16 forKey:@"a"];

  id v17 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v8];
  return v17;
}

- (id)paymentReminder
{
  id v3 = objc_alloc_init((Class)PKAccountPaymentReminder);
  v4 = +[AccountPaymentReminder _propertySettersForAccountPaymentReminder];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10037B380;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (void)deletePaymentReminderWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForEventPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"rambutans";
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForAccountPaymentReminder
{
  v4[0] = @"c";
  v4[1] = @"b";
  v5[0] = &stru_10074BF60;
  v5[1] = &stru_10074BF80;
  v4[2] = @"d";
  v5[2] = &stru_10074BFA0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end