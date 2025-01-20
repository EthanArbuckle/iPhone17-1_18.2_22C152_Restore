@interface ValueAddedServiceTransaction
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForMerchantPID:(id)a3;
+ (id)_predicateForMerchantWithIdentifier:(id)a3;
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentTransaction:(id)a3;
+ (id)_propertySettersForValueAddedServiceTransaction;
+ (id)_valueAddedServiceTransactionsWithQuery:(id)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertValueAddedServiceTransaction:(id)a3 withPass:(id)a4 paymentTransaction:(id)a5 valueAddedMerchant:(id)a6 inDatabase:(id)a7;
+ (id)valueAddedServiceTransactionsInDatabase:(id)a3 forPassUniqueIdentifier:(id)a4 limit:(int64_t)a5;
+ (id)valueAddedServiceTransactionsInDatabase:(id)a3 forPaymentTransaction:(id)a4;
+ (unint64_t)numberOfValueAddedServiceTransactionsForMerchant:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5;
- (BOOL)deleteFromDatabase;
- (ValueAddedServiceTransaction)initWithValueAddedServiceTransaction:(id)a3 pass:(id)a4 paymentTransaction:(id)a5 valueAddedMerchant:(id)a6 inDatabase:(id)a7;
- (id)valueAddedServiceTransaction;
- (void)updateWithValueAddedServiceTransaction:(id)a3 paymentTransaction:(id)a4;
@end

@implementation ValueAddedServiceTransaction

- (ValueAddedServiceTransaction)initWithValueAddedServiceTransaction:(id)a3 pass:(id)a4 paymentTransaction:(id)a5 valueAddedMerchant:(id)a6 inDatabase:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = +[NSMutableDictionary dictionary];
  id v18 = [v15 persistentID];

  v19 = +[NSNumber numberWithLongLong:v18];
  [v17 setObjectOrNull:v19 forKey:@"pass_pid"];

  id v20 = [v14 persistentID];
  v21 = +[NSNumber numberWithLongLong:v20];
  [v17 setObjectOrNull:v21 forKey:@"payment_transaction_pid"];

  v22 = [v16 identifier];
  [v17 setObjectOrNull:v22 forKey:@"identifier"];

  v23 = [v16 merchantURL];
  [v17 setObjectOrNull:v23 forKey:@"merchant_url"];

  v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v16 didSucceed]);
  [v17 setObjectOrNull:v24 forKey:@"successful"];

  v25 = [v16 terminalApplicationVersion];
  [v17 setObjectOrNull:v25 forKey:@"terminal_application_version"];

  v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v16 terminalMode]);
  [v17 setObjectOrNull:v26 forKey:@"terminal_mode"];

  v27 = [v16 transactionDate];

  [v17 setObjectOrNull:v27 forKey:@"transaction_date"];
  id v28 = [v13 persistentID];

  v29 = +[NSNumber numberWithLongLong:v28];
  [v17 setObjectOrNull:v29 forKey:@"merchant_pid"];

  v30 = [(SQLiteEntity *)self initWithPropertyValues:v17 inDatabase:v12];
  return v30;
}

+ (id)insertValueAddedServiceTransaction:(id)a3 withPass:(id)a4 paymentTransaction:(id)a5 valueAddedMerchant:(id)a6 inDatabase:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [objc_alloc((Class)a1) initWithValueAddedServiceTransaction:v16 pass:v15 paymentTransaction:v14 valueAddedMerchant:v13 inDatabase:v12];

  return v17;
}

+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5
{
  id v8 = a4;
  v9 = [a1 _predicateForPass:a3];
  CFStringRef v18 = @"transaction_date";
  v10 = +[NSArray arrayWithObjects:&v18 count:1];
  CFStringRef v17 = @"DESC";
  v11 = +[NSArray arrayWithObjects:&v17 count:1];
  id v12 = [a1 queryWithDatabase:v8 predicate:v9 orderingProperties:v10 orderingDirections:v11];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10038DB2C;
  v14[3] = &unk_100748F08;
  id v15 = v8;
  int64_t v16 = a5;
  id v13 = v8;
  [v12 enumeratePersistentIDsUsingBlock:v14];
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPass:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPaymentTransaction:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"merchant_pid"];
  v4 = +[ValueAddedServiceTransaction _predicateForMerchantPID:v3];
  database = self->super._database;
  CFStringRef v15 = @"transaction_date";
  id v6 = +[NSArray arrayWithObjects:&v15 count:1];
  CFStringRef v14 = @"DESC";
  v7 = +[NSArray arrayWithObjects:&v14 count:1];
  id v8 = +[SQLiteEntity queryWithDatabase:database predicate:v4 orderingProperties:v6 orderingDirections:v7 limit:PKMaxPerPassValueAddedServiceTransactionHistory];

  v9 = +[ValueAddedServiceTransaction _valueAddedServiceTransactionsWithQuery:v8];
  if ((unint64_t)[v9 count] <= 1)
  {
    v10 = +[ValueAddedMerchant anyInDatabase:self->super._database withPersistentID:v3];
    [v10 deleteFromDatabase];
  }
  v13.receiver = self;
  v13.super_class = (Class)ValueAddedServiceTransaction;
  BOOL v11 = [(SQLiteEntity *)&v13 deleteFromDatabase];

  return v11;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForIdentifier:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)valueAddedServiceTransactionsInDatabase:(id)a3 forPassUniqueIdentifier:(id)a4 limit:(int64_t)a5
{
  id v8 = a3;
  v9 = [a1 _predicateForPassWithUniqueIdentifier:a4];
  CFStringRef v16 = @"transaction_date";
  v10 = +[NSArray arrayWithObjects:&v16 count:1];
  CFStringRef v15 = @"DESC";
  BOOL v11 = +[NSArray arrayWithObjects:&v15 count:1];
  id v12 = +[SQLiteEntity queryWithDatabase:v8 predicate:v9 orderingProperties:v10 orderingDirections:v11 limit:a5];

  objc_super v13 = [a1 _valueAddedServiceTransactionsWithQuery:v12];

  return v13;
}

+ (id)valueAddedServiceTransactionsInDatabase:(id)a3 forPaymentTransaction:(id)a4
{
  id v6 = a3;
  v7 = [a4 identifier];
  id v8 = +[PaymentTransaction anyInDatabase:v6 withIdentifier:v7];

  v9 = [a1 _predicateForPaymentTransaction:v8];
  CFStringRef v16 = @"transaction_date";
  v10 = +[NSArray arrayWithObjects:&v16 count:1];
  CFStringRef v15 = @"DESC";
  BOOL v11 = +[NSArray arrayWithObjects:&v15 count:1];
  id v12 = +[SQLiteEntity queryWithDatabase:v6 predicate:v9 orderingProperties:v10 orderingDirections:v11];

  objc_super v13 = [a1 _valueAddedServiceTransactionsWithQuery:v12];

  return v13;
}

+ (unint64_t)numberOfValueAddedServiceTransactionsForMerchant:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a3 identifier];
  id v8 = [v7 hexEncoding];

  v9 = [a1 _predicateForMerchantWithIdentifier:v8];
  v10 = +[SQLiteEntity queryWithDatabase:v6 predicate:v9];

  id v11 = [v10 countOfEntities];
  return (unint64_t)v11;
}

- (void)updateWithValueAddedServiceTransaction:(id)a3 paymentTransaction:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    database = self->super._database;
    v9 = [v6 identifier];
    v10 = +[PaymentTransaction anyInDatabase:database withIdentifier:v9];

    if (v10)
    {
      id v11 = +[NSMutableDictionary dictionary];
      id v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v10 persistentID]);
      [v11 setObject:v12 forKey:@"payment_transaction_pid"];

      [(SQLiteEntity *)self setValuesWithDictionary:v11];
    }
  }
  objc_super v13 = [v21 merchant];
  CFStringRef v14 = v13;
  if (v13)
  {
    CFStringRef v15 = self->super._database;
    CFStringRef v16 = [v13 identifier];
    CFStringRef v17 = [v16 hexEncoding];
    CFStringRef v18 = +[ValueAddedMerchant anyInDatabase:v15 withIdentifier:v17];

    v19 = +[NSMutableDictionary dictionary];
    id v20 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v18 persistentID]);
    [v19 setObject:v20 forKey:@"merchant_pid"];

    [(SQLiteEntity *)self setValuesWithDictionary:v19];
  }
}

- (id)valueAddedServiceTransaction
{
  id v3 = objc_alloc_init((Class)PKValueAddedServiceTransaction);
  v4 = +[ValueAddedServiceTransaction _propertySettersForValueAddedServiceTransaction];
  database = self->super._database;
  id v6 = [(SQLiteEntity *)self valueForProperty:@"merchant_pid"];
  v7 = +[ValueAddedMerchant anyInDatabase:database withPersistentID:v6];
  id v8 = [v7 valueAddedMerchant];

  v9 = [v4 allKeys];
  CFStringRef v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  CFStringRef v17 = sub_10038E5BC;
  CFStringRef v18 = &unk_10072EDD0;
  id v19 = v4;
  id v10 = v3;
  id v20 = v10;
  id v11 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v9 withApplier:&v15];

  objc_msgSend(v10, "setMerchant:", v8, v15, v16, v17, v18);
  id v12 = v20;
  id v13 = v10;

  return v13;
}

+ (id)databaseTable
{
  return @"value_added_service_transaction";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"payment_transaction_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"merchant_pid";
  }
  return 0;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  id v13 = v7;
  if (v7 == @"pass.unique_id") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_6;
  }
  unsigned __int8 v8 = [(__CFString *)v7 isEqualToString:@"pass.unique_id"];

  if (v8)
  {
LABEL_4:
    CFStringRef v9 = @"JOIN pass ON pass.pid = value_added_service_transaction.pass_pid";
LABEL_5:
    [v6 addObject:v9];
    goto LABEL_6;
  }
  id v10 = v13;
  if (v10 == @"value_added_merchant.identifier"
    || (id v11 = v10,
        unsigned int v12 = [(__CFString *)v10 isEqualToString:@"value_added_merchant.identifier"], v11, v12))
  {
    CFStringRef v9 = @"JOIN value_added_merchant ON value_added_merchant.pid == value_added_service_transaction.merchant_pid";
    goto LABEL_5;
  }
LABEL_6:
}

+ (id)_predicateForPaymentTransaction:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (id)_predicateForMerchantWithIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"value_added_merchant.identifier" equalToValue:a3];
}

+ (id)_predicateForPass:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForMerchantPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_valueAddedServiceTransactionsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForValueAddedServiceTransaction];
  id v6 = +[NSMutableSet set];
  v7 = [v5 allKeys];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10038E994;
  v10[3] = &unk_100731410;
  id v11 = v5;
  id v12 = a1;
  id v8 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v10];

  return v6;
}

+ (id)_propertySettersForValueAddedServiceTransaction
{
  v4[0] = @"identifier";
  v4[1] = @"merchant_url";
  v5[0] = &stru_10074CE90;
  v5[1] = &stru_10074CEB0;
  v4[2] = @"successful";
  v4[3] = @"terminal_application_version";
  v5[2] = &stru_10074CED0;
  v5[3] = &stru_10074CEF0;
  v4[4] = @"terminal_mode";
  v4[5] = @"transaction_date";
  v5[4] = &stru_10074CF10;
  v5[5] = &stru_10074CF30;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

@end