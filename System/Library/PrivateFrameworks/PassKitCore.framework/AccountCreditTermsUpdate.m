@interface AccountCreditTermsUpdate
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForAccountCreditTermsUpdate;
+ (id)creditTermsUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertCreditTermsUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteCreditTermsUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)creditLimit;
- (id)creditTermsUpdate;
@end

@implementation AccountCreditTermsUpdate

+ (id)creditTermsUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEventPID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = +[NSMutableSet set];
  CFStringRef v21 = @"pid";
  v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100418824;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertCreditTermsUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[NSMutableDictionary dictionary];
  id v11 = [v8 creditLimit];
  id v12 = [v11 amount];
  id v13 = PKCurrencyDecimalToStorageNumber();

  [v10 setObjectOrNull:v13 forKey:@"f"];
  v14 = [v8 creditLimit];
  v15 = [v14 currency];
  [v10 setObjectOrNull:v15 forKey:@"g"];

  uint64_t v16 = [v8 requestIdentifier];
  [v10 setObjectOrNull:v16 forKey:@"d"];

  v17 = [v8 adverseActionContentIdentifier];
  [v10 setObjectOrNull:v17 forKey:@"e"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v8, "type"), @"b");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v8, "initiator"), @"c");
  v18 = +[NSNumber numberWithLongLong:a4];
  [v10 setObject:v18 forKey:@"a"];

  id v19 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v9];
  if (v19)
  {
    id v20 = [v8 rates];
    id v21 = +[CreditAccountRates insertAccountRates:forCreditTermsUpdatePID:inDatabase:](CreditAccountRates, "insertAccountRates:forCreditTermsUpdatePID:inDatabase:", v20, [v19 persistentID], v9);
  }
  return v19;
}

- (id)creditTermsUpdate
{
  id v3 = objc_alloc_init((Class)PKAccountCreditTermsUpdate);
  v4 = +[AccountCreditTermsUpdate _propertySettersForAccountCreditTermsUpdate];
  v5 = [v4 allKeys];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100418BB0;
  v10[3] = &unk_10072DDD8;
  id v11 = v4;
  id v6 = v3;
  id v12 = v6;
  id v13 = self;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v10];

  id v8 = v6;
  return v8;
}

- (id)creditLimit
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"f"];
  v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  v5 = [(SQLiteEntity *)self valueForProperty:@"g"];
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

+ (void)deleteCreditTermsUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = [a1 _predicateForEventPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)self database];
  +[CreditAccountRates deleteCreditAccountRatesForCreditTermsUpdatePID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)AccountCreditTermsUpdate;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (id)databaseTable
{
  return @"watermelons";
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForAccountCreditTermsUpdate
{
  v4[0] = @"d";
  v4[1] = @"e";
  v5[0] = &stru_10074FE20;
  v5[1] = &stru_10074FE40;
  v4[2] = @"b";
  v4[3] = @"c";
  v5[2] = &stru_10074FE60;
  v5[3] = &stru_10074FE80;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end