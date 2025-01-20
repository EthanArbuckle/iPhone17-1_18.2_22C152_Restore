@interface AccountAssistanceProgramMessage
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForAssistanceProgramMessage;
+ (id)assistanceProgramMessagesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertAssistanceProgramMessage:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAssistanceProgramMessagePID:(int64_t)a3 inDatabase:(id)a4;
- (id)assistanceProgramMessage;
@end

@implementation AccountAssistanceProgramMessage

+ (id)assistanceProgramMessagesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEventPID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = +[NSMutableSet set];
  CFStringRef v19 = @"pid";
  v10 = +[NSArray arrayWithObjects:&v19 count:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10041E028;
  v16[3] = &unk_10072ED00;
  id v17 = v6;
  id v11 = v9;
  id v18 = v11;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:v16];

  v13 = v18;
  id v14 = v11;

  return v14;
}

+ (id)insertAssistanceProgramMessage:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  id v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObject:v11 forKey:@"a"];

  id v12 = [v9 pastDue];
  v13 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v13 forKey:@"b"];

  id v14 = [v9 chargeOffPreventionAmount];
  v15 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v15 forKey:@"c"];

  v16 = [v9 currentBalance];

  id v17 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v17 forKey:@"d"];

  id v18 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v8];
  return v18;
}

- (id)assistanceProgramMessage
{
  id v3 = objc_alloc_init((Class)PKAccountAssistanceProgramMessage);
  v4 = +[AccountAssistanceProgramMessage _propertySettersForAssistanceProgramMessage];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10041E310;
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

+ (id)_predicateForEventPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (void)deleteAssistanceProgramMessagePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForEventPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"coconuts";
}

+ (id)_propertySettersForAssistanceProgramMessage
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_1007501F0;
  v5[1] = &stru_100750210;
  v4[2] = @"d";
  v5[2] = &stru_100750230;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end