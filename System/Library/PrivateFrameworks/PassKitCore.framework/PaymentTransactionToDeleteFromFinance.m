@interface PaymentTransactionToDeleteFromFinance
+ (BOOL)deletePaymentTransactionToDeleteFromFinanceWithPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_propertySettersForPaymentTransactionToDeleteFromFinance;
+ (id)databaseTable;
+ (id)transactionsToDeleteFromFinanceWithLimit:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertPaymentTransactionToDeleteFromFinance:(id)a3 inDatabase:(id)a4;
@end

@implementation PaymentTransactionToDeleteFromFinance

+ (id)databaseTable
{
  return @"transactions_to_delete_from_finance";
}

+ (id)transactionsToDeleteFromFinanceWithLimit:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _propertySettersForPaymentTransactionToDeleteFromFinance];
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = +[SQLiteEntity queryWithDatabase:v6 predicate:0 orderingProperties:0 orderingDirections:0 limit:a3];

  v10 = [v7 allKeys];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011AAB8;
  v15[3] = &unk_10072EAD8;
  id v17 = v8;
  id v18 = a1;
  id v16 = v7;
  id v11 = v8;
  id v12 = v7;
  [v9 enumeratePersistentIDsAndProperties:v10 usingBlock:v15];

  id v13 = [v11 copy];
  return v13;
}

+ (void)insertPaymentTransactionToDeleteFromFinance:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = [v7 transactionIdentifier];
  [v11 setObject:v8 forKey:@"transaction_identifier"];

  v9 = [v7 accountIdentifier];

  [v11 setObject:v9 forKey:@"account_identifier"];
  id v10 = [objc_alloc((Class)a1) initWithPropertyValues:v11 inDatabase:v6];
}

+ (BOOL)deletePaymentTransactionToDeleteFromFinanceWithPID:(int64_t)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = [(SQLiteEntity *)[PaymentTransactionToDeleteFromFinance alloc] initWithPersistentID:a3 inDatabase:v5];

  unsigned __int8 v7 = [(SQLiteEntity *)v6 deleteFromDatabase];
  return v7;
}

+ (id)_propertySettersForPaymentTransactionToDeleteFromFinance
{
  v4[0] = @"transaction_identifier";
  v4[1] = @"account_identifier";
  v5[0] = &stru_1007387E0;
  v5[1] = &stru_100738800;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end