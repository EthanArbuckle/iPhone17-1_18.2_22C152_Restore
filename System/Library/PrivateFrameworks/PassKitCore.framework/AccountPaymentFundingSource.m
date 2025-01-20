@interface AccountPaymentFundingSource
+ (BOOL)_deleteFundingSourcesWithQuery:(id)a3;
+ (BOOL)deletePaymentFundingSourcesForAccountPID:(id)a3 inDatabase:(id)a4;
+ (id)_fundingSourcesWithQuery:(id)a3;
+ (id)_predicateForAccountPID:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPersistentID:(id)a3;
+ (id)_propertySettersForPaymentFundingSource;
+ (id)_propertyValuesForPaymentFundingSource:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePaymentFundingSources:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
+ (id)paymentFundingSourceForAccountPID:(id)a3 identifier:(id)a4 inDatabase:(id)a5;
+ (id)paymentFundingSourcesForAccountPID:(id)a3 inDatabase:(id)a4;
- (AccountPaymentFundingSource)initWithPaymentFundingSource:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
- (BOOL)_deletePaymentFundingSource;
- (id)fundingSource;
- (int64_t)_type;
- (void)_insertOrUpdateFundingDetails:(id)a3;
- (void)updatePaymentFundingSource:(id)a3;
@end

@implementation AccountPaymentFundingSource

+ (id)databaseTable
{
  return @"account_payment_funding_source";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"account_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdatePaymentFundingSources:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v28 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v30 = objc_alloc_init((Class)NSMutableSet);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v11) {
    goto LABEL_12;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v32;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v32 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      v16 = [v15 identifier];
      v17 = [a1 _predicateForIdentifier:v16];
      id v18 = [a1 anyInDatabase:v9 predicate:v17];

      if (v18)
      {
        [v18 updatePaymentFundingSource:v15];
      }
      else
      {
        id v18 = [objc_alloc((Class)a1) initWithPaymentFundingSource:v15 forAccountPID:v28 inDatabase:v9];
        if (!v18) {
          continue;
        }
      }
      v19 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v18 persistentID]);
      [v30 addObject:v19];

      v20 = [v18 fundingSource];
      [v10 addObject:v20];
    }
    id v12 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  }
  while (v12);
LABEL_12:

  v21 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"pid" values:v30];
  v22 = [a1 _predicateForAccountPID:v28];
  v35[0] = v22;
  v35[1] = v21;
  v23 = +[NSArray arrayWithObjects:v35 count:2];
  v24 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v23];

  v25 = [a1 queryWithDatabase:v9 predicate:v24];
  [a1 _deleteFundingSourcesWithQuery:v25];
  if ([v10 count]) {
    id v26 = [v10 copy];
  }
  else {
    id v26 = 0;
  }

  return v26;
}

- (AccountPaymentFundingSource)initWithPaymentFundingSource:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() _propertyValuesForPaymentFundingSource:v10];
  [v11 setObjectOrNull:v9 forKey:@"account_pid"];

  id v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  uint64_t v13 = v12;
  v14 = [v10 fundingDetails];

  [(AccountPaymentFundingSource *)v13 _insertOrUpdateFundingDetails:v14];
  return v13;
}

- (void)updatePaymentFundingSource:(id)a3
{
  id v4 = a3;
  id v6 = [(id)objc_opt_class() _propertyValuesForPaymentFundingSource:v4];
  [(SQLiteEntity *)self setValuesWithDictionary:v6];
  v5 = [v4 fundingDetails];

  [(AccountPaymentFundingSource *)self _insertOrUpdateFundingDetails:v5];
}

- (void)_insertOrUpdateFundingDetails:(id)a3
{
  id v7 = a3;
  if (((unint64_t)[(AccountPaymentFundingSource *)self _type] | 4) == 5)
  {
    int64_t v4 = [(SQLiteEntity *)self persistentID];
    v5 = [(SQLiteEntity *)self database];
    id v6 = +[AccountPaymentFundingDetailsBankAccount insertOrUpdateFundingDetails:v7 forAccountFundingSourcePID:v4 inDatabase:v5];
  }
}

+ (id)paymentFundingSourcesForAccountPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _fundingSourcesWithQuery:v8];

  return v9;
}

+ (id)paymentFundingSourceForAccountPID:(id)a3 identifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _predicateForIdentifier:a4];
  v17[0] = v10;
  id v11 = [a1 _predicateForAccountPID:v9];

  v17[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v17 count:2];
  uint64_t v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  v14 = [a1 anyInDatabase:v8 predicate:v13];

  v15 = [v14 fundingSource];

  return v15;
}

+ (BOOL)deletePaymentFundingSourcesForAccountPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  LOBYTE(v7) = [a1 _deleteFundingSourcesWithQuery:v8];
  return (char)v7;
}

+ (BOOL)_deleteFundingSourcesWithQuery:(id)a3
{
  id v4 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100299B90;
  v11[3] = &unk_100731020;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v12 = v5;
  [v4 enumeratePersistentIDsUsingBlock:v11];
  id v6 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"pid" values:v5];
  id v7 = [v4 database];
  id v8 = [a1 queryWithDatabase:v7 predicate:v6];

  if ([v8 deleteAllEntities]) {
    unsigned __int8 v9 = [v4 deleteAllEntities];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)_deletePaymentFundingSource
{
  if (((unint64_t)[(AccountPaymentFundingSource *)self _type] | 4) == 5)
  {
    int64_t v3 = [(SQLiteEntity *)self persistentID];
    id v4 = [(SQLiteEntity *)self database];
    unsigned int v5 = +[AccountPaymentFundingDetailsBankAccount deleteFundingDetailsForAccountFundingSourcePID:v3 inDatabase:v4];

    if (!v5) {
      return 0;
    }
  }
  return [(SQLiteEntity *)self deleteFromDatabase];
}

+ (id)_predicateForAccountPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"account_pid" equalToValue:a3];
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForPersistentID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

- (id)fundingSource
{
  id v3 = objc_alloc_init((Class)PKAccountPaymentFundingSource);
  id v4 = [(id)objc_opt_class() _propertySettersForPaymentFundingSource];
  unsigned int v5 = [v4 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100299E40;
  v14[3] = &unk_10072DDD8;
  v14[4] = self;
  id v6 = v4;
  id v15 = v6;
  id v7 = v3;
  id v16 = v7;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  if (((unint64_t)[v7 type] | 4) == 5)
  {
    int64_t v8 = [(SQLiteEntity *)self persistentID];
    unsigned __int8 v9 = [(SQLiteEntity *)self database];
    id v10 = +[AccountPaymentFundingDetailsBankAccount fundingDetailsForAccountFundingSourcePID:v8 inDatabase:v9];
    [v7 setFundingDetails:v10];
  }
  id v11 = v16;
  id v12 = v7;

  return v12;
}

+ (id)_fundingSourcesWithQuery:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100299FA4;
  v7[3] = &unk_1007396C8;
  id v10 = a1;
  id v8 = a3;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v9 = v3;
  id v4 = v8;
  [v4 enumeratePersistentIDsUsingBlock:v7];
  if ([v3 count]) {
    id v5 = [v3 copy];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (int64_t)_type
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"type"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

+ (id)_propertyValuesForPaymentFundingSource:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"identifier"];

  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 type]);
  [v4 setObjectOrNull:v6 forKey:@"type"];

  id v7 = [v3 accountSuffix];

  [v4 setObjectOrNull:v7 forKey:@"account_suffix"];
  return v4;
}

+ (id)_propertySettersForPaymentFundingSource
{
  v4[0] = @"identifier";
  v4[1] = @"type";
  v5[0] = &stru_100744560;
  v5[1] = &stru_100744580;
  v4[2] = @"account_suffix";
  v5[2] = &stru_1007445A0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end