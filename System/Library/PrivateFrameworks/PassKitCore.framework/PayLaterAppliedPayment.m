@interface PayLaterAppliedPayment
+ (id)_appliedPaymentsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForDisputePID:(int64_t)a3;
+ (id)_predicateForInstallmentPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAppliedPayment;
+ (id)_propertyValuesForPayLaterAppliedPayment:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterAppliedPayments:(id)a3 forDisputePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterAppliedPayments:(id)a3 forInstallmentPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterAppliedPaymentsForDisputePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)payLaterAppliedPaymentsForInstallmentPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAppliedPaymentsForDisputePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAppliedPaymentsForInstallmentPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterAppliedPayment)initWithPayLaterAppliedPayment:(id)a3 forDisputePID:(int64_t)a4 inDatabase:(id)a5;
- (PayLaterAppliedPayment)initWithPayLaterAppliedPayment:(id)a3 forInstallmentPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_amountApplied;
@end

@implementation PayLaterAppliedPayment

+ (id)databaseTable
{
  return @"oregano";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"b";
  }
  return 0;
}

- (PayLaterAppliedPayment)initWithPayLaterAppliedPayment:(id)a3 forInstallmentPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPayLaterAppliedPayment:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

- (PayLaterAppliedPayment)initWithPayLaterAppliedPayment:(id)a3 forDisputePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPayLaterAppliedPayment:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"b"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

+ (id)insertOrUpdatePayLaterAppliedPayments:(id)a3 forInstallmentPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterAppliedPaymentsForInstallmentPID:a4 inDatabase:v9];
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v17 = objc_alloc((Class)a1);
        id v18 = objc_msgSend(v17, "initWithPayLaterAppliedPayment:forInstallmentPID:inDatabase:", v16, a4, v9, (void)v21);
        [v10 safelyAddObject:v18];
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  id v19 = [v10 copy];
  return v19;
}

+ (id)insertOrUpdatePayLaterAppliedPayments:(id)a3 forDisputePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterAppliedPaymentsForDisputePID:a4 inDatabase:v9];
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v17 = objc_alloc((Class)a1);
        id v18 = objc_msgSend(v17, "initWithPayLaterAppliedPayment:forDisputePID:inDatabase:", v16, a4, v9, (void)v21);
        [v10 safelyAddObject:v18];
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  id v19 = [v10 copy];
  return v19;
}

+ (id)payLaterAppliedPaymentsForInstallmentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentPID:a3];
  id v8 = [a1 _appliedPaymentsWithPredicate:v7 inDatabase:v6];

  return v8;
}

+ (id)payLaterAppliedPaymentsForDisputePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForDisputePID:a3];
  id v8 = [a1 _appliedPaymentsWithPredicate:v7 inDatabase:v6];

  return v8;
}

+ (id)_appliedPaymentsWithPredicate:(id)a3 inDatabase:(id)a4
{
  v5 = [a1 queryWithDatabase:a4 predicate:a3];
  id v6 = [a1 _propertySettersForPayLaterAppliedPayment];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [v6 allKeys];
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_10038B33C;
  id v17 = &unk_10072DE00;
  id v18 = v5;
  id v19 = v6;
  id v20 = v7;
  id v21 = a1;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  [v11 enumeratePersistentIDsAndProperties:v8 usingBlock:&v14];

  id v12 = objc_msgSend(v9, "copy", v14, v15, v16, v17);
  return v12;
}

+ (void)deletePayLaterAppliedPaymentsForInstallmentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForInstallmentPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deletePayLaterAppliedPaymentsForDisputePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForDisputePID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PayLaterAppliedPayment;
  return [(SQLiteEntity *)&v3 deleteFromDatabase];
}

- (id)_amountApplied
{
  objc_super v3 = [(SQLiteEntity *)self valueForProperty:@"d"];
  v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"e"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
  }

  return v8;
}

+ (id)_predicateForInstallmentPID:(int64_t)a3
{
  objc_super v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForDisputePID:(int64_t)a3
{
  objc_super v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesForPayLaterAppliedPayment:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [v3 paymentIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"c"];

  id v6 = [v3 amountApplied];
  BOOL v7 = [v6 amount];
  id v8 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v8 forKey:@"d"];

  id v9 = [v3 amountApplied];

  id v10 = [v9 currency];
  [v4 setObjectOrNull:v10 forKey:@"e"];

  id v11 = [v4 copy];
  return v11;
}

+ (id)_propertySettersForPayLaterAppliedPayment
{
  CFStringRef v4 = @"c";
  uint64_t v5 = &stru_10074CB18;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

@end