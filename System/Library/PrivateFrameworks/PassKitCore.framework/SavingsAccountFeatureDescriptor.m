@interface SavingsAccountFeatureDescriptor
+ (id)_commonDictionaryForSavingsAccountFeatureDescriptor:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForFeatureIdentifier:(id)a3;
+ (id)_propertySettersForSavingsAccountFeatureDescriptor;
+ (id)_savingsAccountFeatureDescriptorsWithQuery:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)savingsAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteSavingsAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateSavingsAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (SavingsAccountFeatureDescriptor)initWithSavingsAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)savingsAccountFeatureDescriptor;
- (void)updateWithSavingsFeatureDescriptor:(id)a3;
@end

@implementation SavingsAccountFeatureDescriptor

+ (id)databaseTable
{
  return @"rhubarb";
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

+ (id)savingsAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _savingsAccountFeatureDescriptorsWithQuery:v8];

  return v9;
}

- (SavingsAccountFeatureDescriptor)initWithSavingsAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForSavingsAccountFeatureDescriptor:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

+ (void)deleteSavingsAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)updateSavingsAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v26 = +[NSMutableSet set];
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
          [(SavingsAccountFeatureDescriptor *)v16 updateWithSavingsFeatureDescriptor:v10];
          a4 = v23;
        }
        else
        {
          a4 = v23;
          v16 = [[SavingsAccountFeatureDescriptor alloc] initWithSavingsAccountFeatureDescriptor:v10 forAccountPID:v23 inDatabase:v8];
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

- (void)updateWithSavingsFeatureDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForSavingsAccountFeatureDescriptor:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForFeatureIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

- (id)savingsAccountFeatureDescriptor
{
  id v3 = objc_alloc_init((Class)PKSavingsAccountFeatureDescriptor);
  id v4 = [(id)objc_opt_class() _propertySettersForSavingsAccountFeatureDescriptor];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002FE208;
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

+ (id)_savingsAccountFeatureDescriptorsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForSavingsAccountFeatureDescriptor];
  id v6 = +[NSMutableSet set];
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002FE394;
  v12[3] = &unk_10072EAD8;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = [v8 copy];
  return v10;
}

+ (id)_commonDictionaryForSavingsAccountFeatureDescriptor:(id)a3
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

  id v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 merchantCapabilities]);
  [v4 setObjectOrNull:v13 forKey:@"g"];

  id v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 fundingSourceTypes]);
  [v4 setObjectOrNull:v14 forKey:@"h"];

  id v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 transferFrequencies]);
  [v4 setObjectOrNull:v15 forKey:@"i"];

  v16 = [v3 transferTermsIdentifier];
  [v4 setObjectOrNull:v16 forKey:@"j"];

  v17 = [v3 fundingSourceTermsIdentifier];
  [v4 setObjectOrNull:v17 forKey:@"k"];

  v18 = [v3 supportedFileFormatsForTransactionData];
  v19 = [v18 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v19 forKey:@"l"];

  v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 contactMethod]);
  [v4 setObjectOrNull:v20 forKey:@"m"];

  v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 showCreditRewardsHubBalance]);
  [v4 setObjectOrNull:v21 forKey:@"n"];

  v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 showCreditDashboardBalance]);
  [v4 setObjectOrNull:v22 forKey:@"q"];

  int64_t v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 showSettingsBalance]);
  [v4 setObjectOrNull:v23 forKey:@"r"];

  id v24 = [v3 hideCreditRewardsHubSignage];
  v25 = +[NSNumber numberWithBool:v24];
  [v4 setObjectOrNull:v25 forKey:@"s"];

  id v26 = [v4 copy];
  return v26;
}

+ (id)_propertySettersForSavingsAccountFeatureDescriptor
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100748260;
  v5[1] = &stru_100748280;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_1007482A0;
  v5[3] = &stru_1007482C0;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_1007482E0;
  v5[5] = &stru_100748300;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100748320;
  v5[7] = &stru_100748340;
  v4[8] = @"j";
  v4[9] = @"k";
  v5[8] = &stru_100748360;
  v5[9] = &stru_100748380;
  v4[10] = @"l";
  v4[11] = @"m";
  v5[10] = &stru_1007483A0;
  v5[11] = &stru_1007483C0;
  v4[12] = @"n";
  v4[13] = @"q";
  v5[12] = &stru_1007483E0;
  v5[13] = &stru_100748400;
  v4[14] = @"r";
  v4[15] = @"s";
  v5[14] = &stru_100748420;
  v5[15] = &stru_100748440;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:16];
  return v2;
}

@end