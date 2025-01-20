@interface CreditInstallmentPlanPayment
+ (id)_paymentsWithQuery:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForInstallmentPlanPayment:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayments:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
+ (id)paymentWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)paymentsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deletePaymentsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (CreditInstallmentPlanPayment)initWithInstallmentPlanPayment:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (id)payment;
- (void)updateWithPayment:(id)a3;
@end

@implementation CreditInstallmentPlanPayment

+ (id)databaseTable
{
  return @"raisin";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  else {
    return 0;
  }
}

- (CreditInstallmentPlanPayment)initWithInstallmentPlanPayment:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _propertyValuesForInstallmentPlanPayment:v10];
  v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  [(SQLiteEntity *)v12 setValue:v9 forProperty:@"a"];

  v13 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)v12 persistentID]];
  v14 = [v10 lineItems];

  id v15 = +[CreditInstallmentPlanLineItem insertOrUpdateLineItems:v14 forInstallmentPlanPaymentPID:v13 inDatabase:v8];
  return v12;
}

+ (id)paymentsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentPlanPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _paymentsWithQuery:v8];

  return v9;
}

+ (id)paymentWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 payment];

  return v9;
}

+ (id)insertOrUpdatePayments:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v27 = a4;
  id v9 = a5;
  id v29 = objc_alloc_init((Class)NSMutableSet);
  id v10 = objc_alloc_init((Class)NSMutableSet);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v16 = [v15 identifier];
        v17 = [a1 _predicateForIdentifier:v16];
        v18 = [a1 anyInDatabase:v9 predicate:v17];
        if (v18)
        {
          id v19 = v18;
          [v18 updateWithPayment:v15];
        }
        else
        {
          id v19 = [objc_alloc((Class)a1) initWithInstallmentPlanPayment:v15 forInstallmentPlanPID:v27 inDatabase:v9];
        }
        [v29 addObject:v16];
        [v10 addObject:v19];
      }
      id v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v12);
  }

  v20 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"b" values:v29];
  v34[0] = v20;
  v21 = [a1 _predicateForInstallmentPlanPID:v27];
  v34[1] = v21;
  v22 = +[NSArray arrayWithObjects:v34 count:2];
  v23 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v22];

  v24 = [a1 queryWithDatabase:v9 predicate:v23];
  [v24 deleteAllEntities];
  if ([v10 count]) {
    id v25 = [v10 copy];
  }
  else {
    id v25 = 0;
  }

  return v25;
}

- (void)updateWithPayment:(id)a3
{
  id v4 = a3;
  id v9 = [(id)objc_opt_class() _propertyValuesForInstallmentPlanPayment:v4];
  [(SQLiteEntity *)self setValuesWithDictionary:v9];
  v5 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)self persistentID]];
  id v6 = [(SQLiteEntity *)self database];
  v7 = [v4 lineItems];

  id v8 = +[CreditInstallmentPlanLineItem insertOrUpdateLineItems:v7 forInstallmentPlanPaymentPID:v5 inDatabase:v6];
}

- (id)payment
{
  v3 = [(id)objc_opt_class() _propertySetters];
  id v4 = objc_alloc_init((Class)PKCreditInstallmentPlanPayment);
  v5 = [v3 allKeys];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000223E8;
  v16[3] = &unk_10072DDD8;
  v16[4] = self;
  id v6 = v3;
  id v17 = v6;
  id v7 = v4;
  id v18 = v7;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v16];

  id v8 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)self persistentID]];
  id v9 = [(SQLiteEntity *)self database];
  id v10 = +[CreditInstallmentPlanLineItem lineItemsForInstallmentPlanPaymentPID:v8 inDatabase:v9];
  [v7 setLineItems:v10];
  id v11 = [(SQLiteEntity *)self valueForProperty:@"c"];
  if (v11)
  {
    id v12 = +[CreditAccountStatement creditAccountStatementWithIdentifier:v11 inDatabase:v9];
    uint64_t v13 = [v12 creditAccountStatement];

    [v7 setStatement:v13];
  }
  id v14 = v7;

  return v14;
}

+ (void)deletePaymentsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForInstallmentPlanPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)self persistentID]];
  id v4 = [(SQLiteEntity *)v2 database];
  +[CreditInstallmentPlanLineItem deleteLineItemsForInstallmentPlanPaymentPID:v3 inDatabase:v4];
  v6.receiver = v2;
  v6.super_class = (Class)CreditInstallmentPlanPayment;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForInstallmentPlanPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_paymentsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySetters];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [v5 allKeys];
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1000226F4;
  v16 = &unk_10072DE00;
  id v20 = a1;
  id v17 = v5;
  id v18 = v4;
  id v8 = v6;
  id v19 = v8;
  id v9 = v4;
  id v10 = v5;
  [v9 enumeratePersistentIDsAndProperties:v7 usingBlock:&v13];

  if (objc_msgSend(v8, "count", v13, v14, v15, v16)) {
    id v11 = [v8 copy];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

+ (id)_propertyValuesForInstallmentPlanPayment:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 statementIdentifier];
  [v4 setObjectOrNull:v6 forKey:@"c"];

  id v7 = [v3 currencyCode];
  [v4 setObjectOrNull:v7 forKey:@"d"];

  id v8 = [v3 amountDue];
  id v9 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v9 forKey:@"e"];

  id v10 = [v3 amountPaid];
  id v11 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v11 forKey:@"f"];

  id v12 = [v3 dueDate];
  uint64_t v13 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v13 forKey:@"g"];

  uint64_t v14 = [v3 statementDate];
  id v15 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v15 forKey:@"k"];

  v16 = [v3 originalAmountDue];
  id v17 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v17 forKey:@"h"];

  id v18 = [v3 paymentNumber];
  if (v18) {
    [v4 setInteger:v18 forKey:@"i"];
  }
  id v19 = [v3 paymentCount];
  if (v19) {
    [v4 setInteger:v19 forKey:@"j"];
  }
  id v20 = [v4 copy];

  return v20;
}

+ (id)_propertySetters
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10072DE40;
  v5[1] = &stru_10072DE60;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_10072DE80;
  v5[3] = &stru_10072DEA0;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_10072DEC0;
  v5[5] = &stru_10072DEE0;
  v4[6] = @"k";
  v4[7] = @"h";
  v5[6] = &stru_10072DF00;
  v5[7] = &stru_10072DF20;
  v4[8] = @"i";
  v4[9] = @"j";
  v5[8] = &stru_10072DF40;
  v5[9] = &stru_10072DF60;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:10];
  return v2;
}

@end