@interface PaymentApplicationMerchantSupport
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)fetchSupportedCountries:(BOOL)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertCountryCodes:(id)a3 supported:(BOOL)a4 withPaymentApplication:(id)a5 inDatabase:(id)a6;
+ (id)predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)predicateForSupported:(BOOL)a3;
+ (id)predicateForSupportedCountries:(BOOL)a3 forPaymentApplication:(id)a4;
+ (id)predicateForSupportedCountries:(BOOL)a3 forPaymentApplicationPID:(int64_t)a4;
+ (id)supportedCountryCodesForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (id)supportedCountryCodesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)unsupportedCountryCodesForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (id)unsupportedCountryCodesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (void)deleteSupportedCountryCodes:(BOOL)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (void)updateSupportedCountryCodes:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (void)updateUnsupportedCountryCodes:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
- (PaymentApplicationMerchantSupport)initWithMerchantCountryCode:(id)a3 supported:(BOOL)a4 forPaymentApplication:(id)a5 database:(id)a6;
@end

@implementation PaymentApplicationMerchantSupport

+ (id)databaseTable
{
  return @"payment_application_merchant_support";
}

+ (id)fetchSupportedCountries:(BOOL)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v9 = [a1 predicateForSupportedCountries:v6 forPaymentApplicationPID:a4];
  v10 = [a1 queryWithDatabase:v8 predicate:v9];

  id v11 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v18 = @"merchant_country_code";
  v12 = +[NSArray arrayWithObjects:&v18 count:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100108C94;
  v16[3] = &unk_100731258;
  id v13 = v11;
  id v17 = v13;
  [v10 enumeratePersistentIDsAndProperties:v12 usingBlock:v16];

  if ([v13 count]) {
    id v14 = [v13 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

+ (id)predicateForSupportedCountries:(BOOL)a3 forPaymentApplicationPID:(int64_t)a4
{
  BOOL v4 = a3;
  BOOL v6 = [a1 predicateForPaymentApplicationPID:a4];
  v7 = [a1 predicateForSupported:v4];
  v11[0] = v6;
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)predicateForSupported:(BOOL)a3
{
  v3 = +[NSNumber numberWithBool:a3];
  BOOL v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"supported" equalToValue:v3];

  return v4;
}

+ (id)predicateForPaymentApplicationPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  BOOL v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application_pid" equalToValue:v3];

  return v4;
}

+ (id)unsupportedCountryCodesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  return _[a1 fetchSupportedCountries:0 forPaymentApplicationPID:a3 inDatabase:a4];
}

+ (id)supportedCountryCodesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  return _[a1 fetchSupportedCountries:1 forPaymentApplicationPID:a3 inDatabase:a4];
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"payment_application_pid";
  }
  else {
    return 0;
  }
}

- (PaymentApplicationMerchantSupport)initWithMerchantCountryCode:(id)a3 supported:(BOOL)a4 forPaymentApplication:(id)a5 database:(id)a6
{
  if (a5)
  {
    BOOL v8 = a4;
    id v10 = a6;
    id v11 = a5;
    id v12 = a3;
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    id v14 = +[NSNull null];
    id v15 = [v11 persistentID];

    v16 = +[NSNumber numberWithLongLong:v15];
    [v13 setObject:v16 forKeyedSubscript:@"payment_application_pid"];

    if (v12) {
      id v17 = v12;
    }
    else {
      id v17 = v14;
    }
    [v13 setObject:v17 forKeyedSubscript:@"merchant_country_code"];

    CFStringRef v18 = +[NSNumber numberWithBool:v8];
    [v13 setObject:v18 forKeyedSubscript:@"supported"];

    v19 = [(SQLiteEntity *)self initWithPropertyValues:v13 inDatabase:v10];
    self = v19;

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)supportedCountryCodesForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = objc_msgSend(a1, "supportedCountryCodesForPaymentApplicationPID:inDatabase:", objc_msgSend(a3, "persistentID"), v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)unsupportedCountryCodesForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = objc_msgSend(a1, "unsupportedCountryCodesForPaymentApplicationPID:inDatabase:", objc_msgSend(a3, "persistentID"), v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (void)deleteEntitiesForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 deleteSupportedCountryCodes:1 forPaymentApplication:v7 inDatabase:v6];
  [a1 deleteSupportedCountryCodes:0 forPaymentApplication:v7 inDatabase:v6];
}

+ (void)updateSupportedCountryCodes:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100108EA4;
  v12[3] = &unk_100734FC8;
  id v13 = a4;
  id v14 = a5;
  id v15 = v8;
  id v16 = a1;
  id v9 = v8;
  id v10 = v14;
  id v11 = v13;
  sub_10000817C((uint64_t)v10, v12);
}

+ (void)updateUnsupportedCountryCodes:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100108FD4;
  v12[3] = &unk_100734FC8;
  id v13 = a4;
  id v14 = a5;
  id v15 = v8;
  id v16 = a1;
  id v9 = v8;
  id v10 = v14;
  id v11 = v13;
  sub_10000817C((uint64_t)v10, v12);
}

+ (void)deleteSupportedCountryCodes:(BOOL)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v10 = [a1 predicateForSupportedCountries:v6 forPaymentApplication:a4];
  id v9 = +[SQLiteEntity queryWithDatabase:v8 predicate:v10];

  [v9 deleteAllEntities];
}

+ (id)insertCountryCodes:(id)a3 supported:(BOOL)a4 withPaymentApplication:(id)a5 inDatabase:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10 && [v10 count])
  {
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v10;
    id v14 = v10;
    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [objc_alloc((Class)a1) initWithMerchantCountryCode:*(void *)(*((void *)&v24 + 1) + 8 * i) supported:v8 forPaymentApplication:v11 database:v12];
          if (v19) {
            [v13 addObject:v19];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }

    if ([v13 count]) {
      v20 = v13;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    id v10 = v23;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

+ (id)predicateForSupportedCountries:(BOOL)a3 forPaymentApplication:(id)a4
{
  if (a4) {
    objc_msgSend(a1, "predicateForSupportedCountries:forPaymentApplicationPID:", a3, objc_msgSend(a4, "persistentID"));
  }
  else {
  BOOL v4 = +[SQLiteBooleanPredicate falsePredicate];
  }
  return v4;
}

@end