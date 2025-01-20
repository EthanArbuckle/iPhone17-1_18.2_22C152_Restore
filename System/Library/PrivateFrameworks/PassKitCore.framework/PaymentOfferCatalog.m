@interface PaymentOfferCatalog
+ (id)_commonDictionaryForPaymentOfferCatalog:(id)a3;
+ (id)_dbCatalogInDatabase:(id)a3;
+ (id)_propertySettersForCatalog;
+ (id)catalogInDatabase:(id)a3;
+ (id)databaseTable;
+ (void)deleteCatalogInDatabase:(id)a3;
+ (void)insertOrUpdateCatalog:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)catalog;
@end

@implementation PaymentOfferCatalog

+ (id)databaseTable
{
  return @"elephant";
}

+ (void)insertOrUpdateCatalog:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [a1 deleteCatalogInDatabase:v7];
  if (v6)
  {
    v17 = [(id)objc_opt_class() _commonDictionaryForPaymentOfferCatalog:v6];
    id v16 = [objc_alloc((Class)a1) initWithPropertyValues:v17 inDatabase:v7];
    id v8 = [v16 persistentID];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = [v6 catalog];
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v15 = [v14 type];
          if (v15 == (id)2)
          {
            +[PaymentOfferRewardsCriteria insertOrUpdateRewardsCriteria:v14 forCatalogPID:v8 inDatabase:v7];
          }
          else if (v15 == (id)1)
          {
            +[PaymentOfferInstallmentCriteria insertOrUpdateInstallmentCriteria:v14 forCatalogPID:v8 inDatabase:v7];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

+ (void)deleteCatalogInDatabase:(id)a3
{
  id v3 = [a1 _dbCatalogInDatabase:a3];
  [v3 deleteFromDatabase];
}

+ (id)_dbCatalogInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 anyInDatabase:v4 predicate:v5];

  return v6;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)v2 database];
  +[PaymentOfferInstallmentCriteria deletePaymentOfferInstallmentCriteriaForCatalogPID:v3 inDatabase:v4];
  +[PaymentOfferRewardsCriteria deletePaymentOfferRewardsCriteriaForCatalogPID:v3 inDatabase:v4];
  v6.receiver = v2;
  v6.super_class = (Class)PaymentOfferCatalog;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

+ (id)catalogInDatabase:(id)a3
{
  int64_t v3 = [a1 _dbCatalogInDatabase:a3];
  id v4 = [v3 catalog];

  return v4;
}

+ (id)_propertySettersForCatalog
{
  CFStringRef v4 = @"a";
  v5 = &stru_1007440D0;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (id)catalog
{
  id v3 = objc_alloc_init((Class)PKPaymentOfferCatalog);
  CFStringRef v4 = [(id)objc_opt_class() _propertySettersForCatalog];
  v5 = [v4 allKeys];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10027C2B4;
  v16[3] = &unk_10072DDD8;
  v16[4] = self;
  id v6 = v4;
  id v17 = v6;
  id v7 = v3;
  id v18 = v7;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v16];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  v9 = [(SQLiteEntity *)self database];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = +[PaymentOfferInstallmentCriteria installmentCriteriaForCatalogPID:v8 inDatabase:v9];
  objc_msgSend(v10, "pk_safelyAddObjectsFromArray:", v11);

  uint64_t v12 = +[PaymentOfferRewardsCriteria rewardsCriteriaForCatalogPID:v8 inDatabase:v9];
  objc_msgSend(v10, "pk_safelyAddObjectsFromArray:", v12);

  if ([v10 count])
  {
    id v13 = [v10 copy];
    [v7 setCatalog:v13];
  }
  else
  {
    [v7 setCatalog:0];
  }
  id v14 = v7;

  return v14;
}

+ (id)_commonDictionaryForPaymentOfferCatalog:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 lastUpdated];

  id v6 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v6 forKey:@"a"];

  return v4;
}

@end