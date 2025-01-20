@interface PassShareActivationOption
+ (id)_passShareActivationOptionsWithQuery:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassSharePID:(int64_t)a3;
+ (id)_propertySettersForPassShareActivationOption;
+ (id)_propertyValuesForPassShareActivationOption:(id)a3;
+ (id)databaseTable;
+ (id)passShareActivationOptionForPassSharePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassShareActivationOptionForPassSharePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5;
+ (void)mergeInPassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5;
- (PassShareActivationOption)initWithPassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5;
- (id)passShareActivationOption;
- (void)updateWithPassShareActivationOption:(id)a3;
@end

@implementation PassShareActivationOption

+ (id)databaseTable
{
  return @"muffin";
}

- (PassShareActivationOption)initWithPassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPassShareActivationOption:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

- (void)updateWithPassShareActivationOption:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPassShareActivationOption:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (void)mergeInPassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v14 = [a1 passShareActivationOptionForPassSharePID:a4 inDatabase:v8];
  id v10 = [objc_alloc((Class)PKPassShareActivationOptions) initWithOptions:v9];

  id v11 = [objc_alloc((Class)PKPassShareActivationOptions) initWithOptions:v14];
  v12 = +[PKPassShareActivationOptions optionsFromRemoteOptions:v10 localOptions:v11];

  v13 = [v12 options];
  [a1 insertOrUpdatePassShareActivationOption:v13 forPassSharePID:a4 inDatabase:v8];
}

+ (void)insertOrUpdatePassShareActivationOption:(id)a3 forPassSharePID:(int64_t)a4 inDatabase:(id)a5
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
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v11 = [v10 identifier];
        v12 = [a1 _predicateForPassSharePID:a4];
        v33[0] = v12;
        v13 = [a1 _predicateForIdentifier:v11];
        v33[1] = v13;
        id v14 = +[NSArray arrayWithObjects:v33 count:2];
        v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];
        v16 = [a1 anyInDatabase:v8 predicate:v15];

        if (v16)
        {
          [(PassShareActivationOption *)v16 updateWithPassShareActivationOption:v10];
          a4 = v23;
        }
        else
        {
          a4 = v23;
          v16 = [[PassShareActivationOption alloc] initWithPassShareActivationOption:v10 forPassSharePID:v23 inDatabase:v8];
        }
        [v26 addObject:v11];
      }
      id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v27);
  }

  v17 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"b" values:v26];
  v32[0] = v17;
  v18 = [a1 _predicateForPassSharePID:a4];
  v32[1] = v18;
  v19 = +[NSArray arrayWithObjects:v32 count:2];
  v20 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v19];

  v21 = [a1 queryWithDatabase:v8 predicate:v20];
  [v21 deleteAllEntities];
}

+ (id)passShareActivationOptionForPassSharePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassSharePID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _passShareActivationOptionsWithQuery:v8];

  return v9;
}

+ (void)deletePassShareActivationOptionForPassSharePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPassSharePID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_passShareActivationOptionsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForPassShareActivationOption];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003D8B60;
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

- (id)passShareActivationOption
{
  id v3 = objc_alloc_init((Class)PKPassShareActivationOption);
  id v4 = [(id)objc_opt_class() _propertySettersForPassShareActivationOption];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003D8CE4;
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

+ (id)_predicateForPassSharePID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_propertyValuesForPassShareActivationOption:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  [v3 type];
  id v6 = PKPassShareActivationOptionTypeToString();
  [v4 setObjectOrNull:v6 forKey:@"c"];

  id v7 = [v3 value];
  [v4 setObjectOrNull:v7 forKey:@"d"];

  id v8 = [v3 valueLength];
  id v9 = +[NSNumber numberWithInteger:v8];
  [v4 setObjectOrNull:v9 forKey:@"e"];

  return v4;
}

+ (id)_propertySettersForPassShareActivationOption
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10074F600;
  v5[1] = &stru_10074F620;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_10074F640;
  v5[3] = &stru_10074F660;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end