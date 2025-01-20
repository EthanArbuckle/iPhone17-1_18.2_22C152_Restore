@interface TransactionReceipt
+ (id)_predicateForUniqueID:(id)a3;
+ (id)_propertySettersForTransactionReceipt;
+ (id)_propertyValuesForTransactionReceipt:(id)a3;
+ (id)anyInDatabase:(id)a3 withUniqueID:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateTransactionReceipt:(id)a3 inDatabase:(id)a4;
- (TransactionReceipt)initWithTransactionReceipt:(id)a3 inDatabase:(id)a4;
- (id)transactionReceipt;
- (void)updateWithTransactionReceipt:(id)a3;
@end

@implementation TransactionReceipt

- (TransactionReceipt)initWithTransactionReceipt:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() _propertyValuesForTransactionReceipt:v7];

  v9 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v9;
}

+ (id)databaseTable
{
  return @"transaction_receipt";
}

+ (id)anyInDatabase:(id)a3 withUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForUniqueID:a4];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)insertOrUpdateTransactionReceipt:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 uniqueID];
  v9 = [a1 anyInDatabase:v7 withUniqueID:v8];
  if (v9)
  {
    id v10 = v9;
    [v9 updateWithTransactionReceipt:v6];
  }
  else
  {
    id v10 = [objc_alloc((Class)a1) initWithTransactionReceipt:v6 inDatabase:v7];
  }

  return v10;
}

- (void)updateWithTransactionReceipt:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForTransactionReceipt:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

- (id)transactionReceipt
{
  id v3 = objc_alloc_init((Class)PKTransactionReceipt);
  id v4 = [(id)objc_opt_class() _propertySettersForTransactionReceipt];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003BADB8;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_predicateForUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"unique_id" equalToValue:a3];
}

+ (id)_propertyValuesForTransactionReceipt:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 uniqueID];
  [v4 setObjectOrNull:v5 forKey:@"unique_id"];

  id v6 = [v3 receiptProviderIdentifier];
  [v4 setObjectOrNull:v6 forKey:@"receipt_provider_identifier"];

  id v7 = [v3 receiptIdentifier];

  [v4 setObjectOrNull:v7 forKey:@"receipt_identifier"];
  id v8 = [v4 copy];

  return v8;
}

+ (id)_propertySettersForTransactionReceipt
{
  v4[0] = @"unique_id";
  v4[1] = @"receipt_provider_identifier";
  v5[0] = &stru_10074E478;
  v5[1] = &stru_10074E498;
  v4[2] = @"receipt_identifier";
  v5[2] = &stru_10074E4B8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end