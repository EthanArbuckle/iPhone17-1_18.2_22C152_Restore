@interface PaymentExpressMode
+ (id)_expressModesInDatabase:(id)a3 forPredicate:(id)a4;
+ (id)_predicateForPaymentApplication:(id)a3;
+ (id)_predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)databaseTable;
+ (id)expressModesInDatabase:(id)a3 forPaymentApplication:(id)a4;
+ (id)expressModesInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4;
+ (id)insertExpressModes:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4;
- (PaymentExpressMode)initWithExpressMode:(id)a3 forPaymentApplication:(id)a4 database:(id)a5;
- (id)expressMode;
@end

@implementation PaymentExpressMode

+ (id)databaseTable
{
  return @"payment_express_mode";
}

+ (id)expressModesInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPaymentApplicationPID:a4];
  v8 = [a1 _expressModesInDatabase:v6 forPredicate:v7];

  return v8;
}

+ (id)_predicateForPaymentApplicationPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application_pid" equalToValue:v3];

  return v4;
}

+ (id)_expressModesInDatabase:(id)a3 forPredicate:(id)a4
{
  v4 = [a1 queryWithDatabase:a3 predicate:a4];
  id v5 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v13 = @"express_mode";
  id v6 = +[NSArray arrayWithObjects:&v13 count:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002A4C28;
  v11[3] = &unk_100731258;
  id v12 = v5;
  id v7 = v5;
  [v4 enumeratePersistentIDsAndProperties:v6 usingBlock:v11];

  if ([v7 count]) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  return v9;
}

+ (id)expressModesInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPaymentApplication:a4];
  v8 = [a1 _expressModesInDatabase:v6 forPredicate:v7];

  return v8;
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  id v8 = [a1 _predicateForPaymentApplication:a4];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)insertExpressModes:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v16);
        id v18 = objc_alloc((Class)a1);
        id v19 = objc_msgSend(v18, "initWithExpressMode:forPaymentApplication:database:", v17, v9, v10, (void)v23);
        if (v19) {
          [v11 addObject:v19];
        }

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  if ([v11 count]) {
    v20 = v11;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  return v21;
}

+ (id)_predicateForPaymentApplication:(id)a3
{
  if (a3) {
    objc_msgSend(a1, "_predicateForPaymentApplicationPID:", objc_msgSend(a3, "persistentID"));
  }
  else {
  v3 = +[SQLiteBooleanPredicate falsePredicate];
  }
  return v3;
}

- (PaymentExpressMode)initWithExpressMode:(id)a3 forPaymentApplication:(id)a4 database:(id)a5
{
  if (a4)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    id v12 = +[NSNull null];
    id v13 = [v9 persistentID];

    id v14 = +[NSNumber numberWithLongLong:v13];
    [v11 setObject:v14 forKeyedSubscript:@"payment_application_pid"];

    if (v10) {
      id v15 = v10;
    }
    else {
      id v15 = v12;
    }
    [v11 setObject:v15 forKeyedSubscript:@"express_mode"];

    v16 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
    self = v16;

    uint64_t v17 = self;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)expressMode
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100020A9C;
  id v11 = sub_100021040;
  id v12 = 0;
  CFStringRef v13 = @"express_mode";
  v3 = +[NSArray arrayWithObjects:&v13 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002A5158;
  v6[3] = &unk_100744CF8;
  v6[4] = &v7;
  [(SQLiteEntity *)self getValuesForProperties:v3 withApplier:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

@end