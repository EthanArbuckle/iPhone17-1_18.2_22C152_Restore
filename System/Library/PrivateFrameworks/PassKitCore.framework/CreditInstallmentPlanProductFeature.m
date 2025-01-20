@interface CreditInstallmentPlanProductFeature
+ (id)_predicateForProductPID:(id)a3;
+ (id)_propertyValuesForFeature:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)featuresForProductPID:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateFeatures:(id)a3 forProductPID:(id)a4 inDatabase:(id)a5;
+ (void)deleteFeatureForProductPID:(id)a3 inDatabase:(id)a4;
- (CreditInstallmentPlanProductFeature)initWithFeature:(id)a3 forProductPID:(id)a4 inDatabase:(id)a5;
- (id)feature;
- (void)updateWithFeature:(id)a3;
@end

@implementation CreditInstallmentPlanProductFeature

+ (id)databaseTable
{
  return @"squash";
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

- (CreditInstallmentPlanProductFeature)initWithFeature:(id)a3 forProductPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _propertyValuesForFeature:v10];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  v13 = v12;
  [(SQLiteEntity *)v13 setValue:v9 forProperty:@"a"];

  return v13;
}

+ (void)deleteFeatureForProductPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForProductPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)insertOrUpdateFeatures:(id)a3 forProductPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 deleteFeatureForProductPID:v9 inDatabase:v10];
  id v11 = objc_alloc_init((Class)NSMutableSet);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v18 = objc_alloc((Class)a1);
        id v19 = objc_msgSend(v18, "initWithFeature:forProductPID:inDatabase:", v17, v9, v10, (void)v22);
        if (v19) {
          [v11 addObject:v19];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  if ([v11 count]) {
    id v20 = [v11 copy];
  }
  else {
    id v20 = 0;
  }

  return v20;
}

- (void)updateWithFeature:(id)a3
{
}

+ (id)featuresForProductPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForProductPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v16 = @"b";
  id v10 = +[NSArray arrayWithObjects:&v16 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10044D2F4;
  v14[3] = &unk_100731258;
  id v11 = v9;
  id v15 = v11;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:v14];
  if ([v11 count]) {
    id v12 = [v11 copy];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (id)feature
{
  return [(SQLiteEntity *)self valueForProperty:@"b"];
}

+ (id)_predicateForProductPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_propertyValuesForFeature:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObjectOrNull:v3 forKey:@"b"];

  id v5 = [v4 copy];
  return v5;
}

@end