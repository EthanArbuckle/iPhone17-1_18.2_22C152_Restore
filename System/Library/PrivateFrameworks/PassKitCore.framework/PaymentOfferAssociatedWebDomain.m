@interface PaymentOfferAssociatedWebDomain
+ (id)_commonDictionaryAssociatedWebDomain:(id)a3;
+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3;
+ (id)_webDomainsWithQuery:(id)a3;
+ (id)associatedWebDomainForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deletePaymentOfferAssociatedWebDomainsForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAssociatedWebDomains:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation PaymentOfferAssociatedWebDomain

+ (id)databaseTable
{
  return @"cat";
}

+ (void)insertOrUpdateAssociatedWebDomains:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePaymentOfferAssociatedWebDomainsForInstallmentCriteriaPID:a4 inDatabase:v9];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = [(id)objc_opt_class() _commonDictionaryAssociatedWebDomain:*(void *)(*((void *)&v17 + 1) + 8 * (void)v13)];
        v15 = +[NSNumber numberWithLongLong:a4];
        [v14 safelySetObject:v15 forKey:@"i_pid"];

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

+ (void)deletePaymentOfferAssociatedWebDomainsForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentCriteriaPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (id)associatedWebDomainForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentCriteriaPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _webDomainsWithQuery:v8];

  return v9;
}

+ (id)_webDomainsWithQuery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  [v3 database];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1004583F0;
  uint64_t v12 = &unk_100730E38;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  id v14 = v5;
  id v6 = v13;
  [v3 enumeratePersistentIDsUsingBlock:&v9];

  if (objc_msgSend(v5, "count", v9, v10, v11, v12)) {
    id v7 = [v5 copy];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"i_pid" equalToValue:v3];

  return v4;
}

+ (id)_commonDictionaryAssociatedWebDomain:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = (void *)_SQLValueForURL();

  [v4 setObjectOrNull:v5 forKey:@"a"];
  return v4;
}

@end