@interface PayLaterAccountProduct
+ (id)_commonDictionaryForProduct:(id)a3;
+ (id)_payLaterProductsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_payLaterProductsWithQuery:(id)a3;
+ (id)_predicateForAccountDetailsPID:(int64_t)a3;
+ (id)_predicateForProductType:(unint64_t)a3;
+ (id)_propertySettersForPayLaterProductSetters;
+ (id)anyInDatabase:(id)a3 forProductType:(unint64_t)a4 accountDetailsPID:(int64_t)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)payLaterProductsForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAccountProductForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePayLaterAccountProducts:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PayLaterAccountProduct)initWithAccountProduct:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (void)updateWithProduct:(id)a3;
@end

@implementation PayLaterAccountProduct

+ (id)databaseTable
{
  return @"cucamelon";
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

- (PayLaterAccountProduct)initWithAccountProduct:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForProduct:v9];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  id v13 = [(SQLiteEntity *)v12 persistentID];
  v14 = [v9 productDetails];
  id v15 = +[PayLaterAccountProductDetails insertOrUpdatePayLaterProductDetails:v14 forPayLaterAccountProductPID:v13 inDatabase:v8];

  v16 = [v9 eligibleSpend];

  id v17 = +[PayLaterAccountProductEligibleSpend insertOrUpdatePayLaterProductEligibleSpend:v16 forPayLaterAccountProductPID:v13 inDatabase:v8];
  return v12;
}

+ (void)insertOrUpdatePayLaterAccountProducts:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v16 = [v15 productType];
        id v17 = [a1 anyInDatabase:v9 forProductType:v16 accountDetailsPID:a4];
        if (v17)
        {
          id v18 = v17;
          [v17 updateWithProduct:v15];
        }
        else
        {
          id v18 = [objc_alloc((Class)a1) initWithAccountProduct:v15 forAccountDetailsPID:a4 inDatabase:v9];
        }
        v19 = +[NSNumber numberWithUnsignedInteger:v16];
        [v10 addObject:v19];
      }
      id v12 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  v20 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"b" values:v10];
  v21 = [a1 _predicateForAccountDetailsPID:a4];
  v30[0] = v20;
  v30[1] = v21;
  v22 = +[NSArray arrayWithObjects:v30 count:2];
  v23 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v22];

  v24 = [a1 queryWithDatabase:v9 predicate:v23];
  [v24 deleteAllEntities];
}

+ (void)deletePayLaterAccountProductForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)v2 database];
  +[PayLaterAccountProductDetails deletePayLaterProductDetailsForPayLaterProductPID:v3 inDatabase:v4];
  +[PayLaterAccountProductEligibleSpend deletePayLaterProductEligibleSpendForPayLaterProductPID:v3 inDatabase:v4];
  v6.receiver = v2;
  v6.super_class = (Class)PayLaterAccountProduct;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

+ (id)payLaterProductsForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountDetailsPID:a3];
  id v8 = [a1 _payLaterProductsInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (id)_payLaterProductsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  v5 = +[SQLiteEntity queryWithDatabase:a3 predicate:a4];
  id v6 = [a1 _payLaterProductsWithQuery:v5];

  return v6;
}

+ (id)_payLaterProductsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForPayLaterProductSetters];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  v7 = [v5 allKeys];
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_10042F010;
  id v16 = &unk_10072DE00;
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

- (void)updateWithProduct:(id)a3
{
  id v4 = a3;
  id v11 = [(id)objc_opt_class() _commonDictionaryForProduct:v4];
  int64_t v5 = [(SQLiteEntity *)self persistentID];
  id v6 = [(SQLiteEntity *)self database];
  v7 = [v4 productDetails];
  id v8 = +[PayLaterAccountProductDetails insertOrUpdatePayLaterProductDetails:v7 forPayLaterAccountProductPID:v5 inDatabase:v6];

  id v9 = [v4 eligibleSpend];

  id v10 = +[PayLaterAccountProductEligibleSpend insertOrUpdatePayLaterProductEligibleSpend:v9 forPayLaterAccountProductPID:v5 inDatabase:v6];
  [(SQLiteEntity *)self setValuesWithDictionary:v11];
}

+ (id)_predicateForAccountDetailsPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForProductType:(unint64_t)a3
{
  int64_t v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)anyInDatabase:(id)a3 forProductType:(unint64_t)a4 accountDetailsPID:(int64_t)a5
{
  id v8 = a3;
  id v9 = [a1 _predicateForProductType:a4];
  v15[0] = v9;
  id v10 = [a1 _predicateForAccountDetailsPID:a5];
  v15[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v15 count:2];
  id v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];
  uint64_t v13 = [a1 anyInDatabase:v8 predicate:v12];

  return v13;
}

+ (id)_propertySettersForPayLaterProductSetters
{
  CFStringRef v4 = @"b";
  int64_t v5 = &stru_100750DA8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

+ (id)_commonDictionaryForProduct:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 productType];

  id v6 = +[NSNumber numberWithUnsignedInteger:v5];
  [v4 setObjectOrNull:v6 forKey:@"b"];

  return v4;
}

@end