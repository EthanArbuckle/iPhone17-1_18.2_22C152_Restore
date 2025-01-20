@interface AppleBalanceAccountFeatureDescriptor
+ (id)_appleBalanceAccountFeatureDescriptorsWithQuery:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForFeatureIdentifier:(id)a3;
+ (id)_propertySettersForAppleBalanceAccountFeatureDescriptor;
+ (id)_propertyValuesForAppleBalanceAccountFeatureDescriptor:(id)a3;
+ (id)appleBalanceAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (void)deleteAppleBalanceAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAppleBalanceAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (AppleBalanceAccountFeatureDescriptor)initWithAppleBalanceAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)appleBalanceAccountFeatureDescriptor;
- (void)updateWithAppleBalanceAccountFeatureDescriptor:(id)a3;
@end

@implementation AppleBalanceAccountFeatureDescriptor

+ (id)databaseTable
{
  return @"carrot";
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

- (AppleBalanceAccountFeatureDescriptor)initWithAppleBalanceAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForAppleBalanceAccountFeatureDescriptor:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

- (void)updateWithAppleBalanceAccountFeatureDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForAppleBalanceAccountFeatureDescriptor:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (void)insertOrUpdateAppleBalanceAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v26 = objc_alloc_init((Class)NSMutableSet);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v7;
  id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v27)
  {
    int64_t v23 = a4;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v11 = [v10 identifier];
        v12 = [a1 _predicateForAccountPID:a4];
        v33[0] = v12;
        v13 = [a1 _predicateForFeatureIdentifier:v11];
        v33[1] = v13;
        v14 = +[NSArray arrayWithObjects:v33 count:2];
        v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];
        v16 = [a1 anyInDatabase:v8 predicate:v15];

        if (v16)
        {
          [(AppleBalanceAccountFeatureDescriptor *)v16 updateWithAppleBalanceAccountFeatureDescriptor:v10];
          a4 = v23;
        }
        else
        {
          a4 = v23;
          v16 = [[AppleBalanceAccountFeatureDescriptor alloc] initWithAppleBalanceAccountFeatureDescriptor:v10 forAccountPID:v23 inDatabase:v8];
        }
        [v26 addObject:v11];
      }
      id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v27);
  }

  v17 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"b" values:v26];
  v32[0] = v17;
  v18 = [a1 _predicateForAccountPID:a4];
  v32[1] = v18;
  v19 = +[NSArray arrayWithObjects:v32 count:2];
  v20 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v19];

  v21 = [a1 queryWithDatabase:v8 predicate:v20];
  [v21 deleteAllEntities];
}

+ (void)deleteAppleBalanceAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)appleBalanceAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _appleBalanceAccountFeatureDescriptorsWithQuery:v8];

  return v9;
}

- (id)appleBalanceAccountFeatureDescriptor
{
  id v3 = objc_alloc_init((Class)PKAppleBalanceAccountFeatureDescriptor);
  id v4 = [(id)objc_opt_class() _propertySettersForAppleBalanceAccountFeatureDescriptor];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10048D4F8;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForFeatureIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_appleBalanceAccountFeatureDescriptorsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForAppleBalanceAccountFeatureDescriptor];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10048D71C;
  v12[3] = &unk_10072EAD8;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if ([v8 count]) {
    id v10 = [v8 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (id)_propertyValuesForAppleBalanceAccountFeatureDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 minimumAmount];
  id v7 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v7 forKey:@"c"];

  id v8 = [v3 maximumAmount];
  id v9 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v9 forKey:@"d"];

  id v10 = [v3 supportedNetworks];
  id v11 = [v10 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v11 forKey:@"e"];

  id v12 = [v3 merchantIdentifier];
  [v4 setObjectOrNull:v12 forKey:@"f"];

  id v13 = [v3 merchantCapabilities];
  id v14 = +[NSNumber numberWithUnsignedInteger:v13];
  [v4 setObjectOrNull:v14 forKey:@"g"];

  id v15 = [v4 copy];
  return v15;
}

+ (id)_propertySettersForAppleBalanceAccountFeatureDescriptor
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100754500;
  v5[1] = &stru_100754520;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100754540;
  v5[3] = &stru_100754560;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100754580;
  v5[5] = &stru_1007545A0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

@end