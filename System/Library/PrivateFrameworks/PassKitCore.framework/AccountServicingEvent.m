@interface AccountServicingEvent
+ (BOOL)hasServicingEventsWithStatus:(unint64_t)a3 inDatabase:(id)a4;
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForAccountServicing;
+ (id)databaseTable;
+ (id)insertServicingEvent:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)servicingEventsWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteServicingEventWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (id)amount;
- (id)currencyAmountWithIntegerValue:(int64_t)a3;
- (id)partiallyApprovedAmount;
- (id)servicingEvent;
@end

@implementation AccountServicingEvent

+ (id)servicingEventsWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEventPID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = +[NSMutableSet set];
  CFStringRef v21 = @"pid";
  v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1002D3020;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (BOOL)hasServicingEventsWithStatus:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = +[NSNumber numberWithUnsignedInteger:a3];
  v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"g" equalToValue:v7];

  v9 = [a1 queryWithDatabase:v6 predicate:v8];

  LOBYTE(a1) = [v9 exists];
  return (char)a1;
}

+ (id)insertServicingEvent:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  id v11 = [v9 identifier];
  [v10 setObjectOrNull:v11 forKey:@"b"];

  id v12 = [v9 amount];
  id v13 = [v12 amount];
  v14 = PKCurrencyDecimalToStorageNumber();

  [v10 setObjectOrNull:v14 forKey:@"c"];
  v15 = [v9 amount];
  uint64_t v16 = [v15 currency];
  [v10 setObjectOrNull:v16 forKey:@"d"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "status"), @"g");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "activityType"), @"e");
  v17 = [v9 activityIdentifier];
  [v10 setObjectOrNull:v17 forKey:@"f"];

  v18 = [v9 reasonCode];
  [v10 setObjectOrNull:v18 forKey:@"h"];

  id v19 = [v9 openDate];
  id v20 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v20 forKey:@"i"];

  CFStringRef v21 = [v9 lastUpdatedDate];
  v22 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v22 forKey:@"j"];

  v23 = +[NSNumber numberWithLongLong:a4];
  [v10 setObject:v23 forKey:@"a"];

  v24 = [v9 claimIdentifier];
  [v10 setObjectOrNull:v24 forKey:@"k"];

  v25 = [v9 linkedCaseIdentifiers];
  v26 = _SQLValueForStringArray(v25);
  [v10 setObjectOrNull:v26 forKey:@"l"];

  v27 = [v9 statusDetails];

  v28 = [v27 statusReasons];
  v29 = _SQLValueForStringArray(v28);
  [v10 setObjectOrNull:v29 forKey:@"m"];

  v30 = [v27 customerResponseByDate];
  v31 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v31 forKey:@"n"];

  v32 = [v27 merchantResponseByDate];
  v33 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v33 forKey:@"o"];

  v34 = [v27 evidenceDocumentTypes];
  v35 = _SQLValueForStringArray(v34);
  [v10 setObjectOrNull:v35 forKey:@"p"];

  v36 = [v27 resolutionReason];
  [v10 setObjectOrNull:v36 forKey:@"q"];

  v37 = [v27 partiallyApprovedAmount];
  v38 = [v37 amount];
  uint64_t v39 = PKCurrencyDecimalToStorageInteger();

  [v10 setLongLong:v39 forKey:@"r"];
  v40 = [v27 resolutionDate];
  v41 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v41 forKey:@"s"];

  id v42 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v8];
  return v42;
}

- (id)servicingEvent
{
  id v3 = objc_alloc_init((Class)PKAccountServicingEvent);
  id v4 = objc_alloc_init((Class)PKAccountServicingEventStatusDetails);
  [v3 setStatusDetails:v4];
  v5 = +[AccountServicingEvent _propertySettersForAccountServicing];
  id v6 = [v5 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D36C0;
  v11[3] = &unk_10072DDD8;
  id v12 = v5;
  id v7 = v3;
  id v13 = v7;
  v14 = self;
  id v8 = v5;
  [(SQLiteEntity *)self getValuesForProperties:v6 withApplier:v11];

  id v9 = v7;
  return v9;
}

- (id)currencyAmountWithIntegerValue:(int64_t)a3
{
  id v4 = PKCurrencyStorageIntegerToCurrencyDecimal();
  v5 = [(SQLiteEntity *)self valueForProperty:@"d"];
  if (v4)
  {
    id v6 = +[NSDecimalNumber notANumber];
    unsigned __int8 v7 = [v4 isEqualToNumber:v6];

    id v8 = 0;
    if ((v7 & 1) == 0 && v5) {
      id v8 = [objc_alloc((Class)PKCurrencyAmount) initWithAmount:v4 currency:v5 exponent:0];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)amount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"c"];
  id v4 = -[AccountServicingEvent currencyAmountWithIntegerValue:](self, "currencyAmountWithIntegerValue:", [v3 longLongValue]);

  return v4;
}

- (id)partiallyApprovedAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"r"];
  id v4 = -[AccountServicingEvent currencyAmountWithIntegerValue:](self, "currencyAmountWithIntegerValue:", [v3 longLongValue]);

  return v4;
}

+ (void)deleteServicingEventWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = [a1 _predicateForEventPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"tomatoes";
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForAccountServicing
{
  v4[0] = @"b";
  v4[1] = @"g";
  v5[0] = &stru_100746898;
  v5[1] = &stru_1007468B8;
  v4[2] = @"e";
  v4[3] = @"f";
  v5[2] = &stru_1007468D8;
  v5[3] = &stru_1007468F8;
  v4[4] = @"h";
  v4[5] = @"i";
  v5[4] = &stru_100746918;
  v5[5] = &stru_100746938;
  v4[6] = @"j";
  v4[7] = @"k";
  v5[6] = &stru_100746958;
  v5[7] = &stru_100746978;
  v4[8] = @"l";
  v4[9] = @"m";
  v5[8] = &stru_100746998;
  v5[9] = &stru_1007469B8;
  v4[10] = @"n";
  v4[11] = @"o";
  v5[10] = &stru_1007469D8;
  v5[11] = &stru_1007469F8;
  v4[12] = @"p";
  v4[13] = @"q";
  v5[12] = &stru_100746A18;
  v5[13] = &stru_100746A38;
  v4[14] = @"s";
  v5[14] = &stru_100746A58;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:15];
  return v2;
}

@end