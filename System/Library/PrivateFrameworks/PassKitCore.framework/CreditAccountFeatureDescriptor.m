@interface CreditAccountFeatureDescriptor
+ (id)_creditAccountFeatureDescriptorsWithQuery:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForAccountUserPID:(id)a3;
+ (id)_predicateForFeatureIdentifier:(id)a3;
+ (id)_propertySettersForCreditAccountFeatureDescriptor;
+ (id)_propertyValuesForCreditAccountFeatureDescriptor:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)creditAccountFeatureDescriptorsForAccountUserPID:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deleteCreditAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteCreditAccountFeatureDescriptorsForAccountUserPID:(id)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)updateCreditAccountFeatureDescriptors:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5;
- (CreditAccountFeatureDescriptor)initWithCreditAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (CreditAccountFeatureDescriptor)initWithCreditAccountFeatureDescriptor:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5;
- (id)creditAccountFeatureDescriptor;
- (void)updateWithCreditFeatureDescriptor:(id)a3;
@end

@implementation CreditAccountFeatureDescriptor

+ (id)databaseTable
{
  return @"strawberries";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"n";
  }
  return 0;
}

+ (void)deleteCreditAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteCreditAccountFeatureDescriptorsForAccountUserPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountUserPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)creditAccountFeatureDescriptorsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _creditAccountFeatureDescriptorsWithQuery:v8];

  return v9;
}

+ (id)creditAccountFeatureDescriptorsForAccountUserPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountUserPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _creditAccountFeatureDescriptorsWithQuery:v8];

  return v9;
}

- (CreditAccountFeatureDescriptor)initWithCreditAccountFeatureDescriptor:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForCreditAccountFeatureDescriptor:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

- (CreditAccountFeatureDescriptor)initWithCreditAccountFeatureDescriptor:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() _propertyValuesForCreditAccountFeatureDescriptor:v10];

  id v12 = [v11 mutableCopy];
  [v12 setObjectOrNull:v9 forKey:@"n"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v8];
  return v13;
}

+ (void)updateCreditAccountFeatureDescriptors:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
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
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v11 = [v10 identifier];
        id v12 = [a1 _predicateForAccountPID:a4];
        v33[0] = v12;
        v13 = [a1 _predicateForFeatureIdentifier:v11];
        v33[1] = v13;
        v14 = +[NSArray arrayWithObjects:v33 count:2];
        v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];
        v16 = [a1 anyInDatabase:v8 predicate:v15];

        if (v16)
        {
          [(CreditAccountFeatureDescriptor *)v16 updateWithCreditFeatureDescriptor:v10];
          a4 = v23;
        }
        else
        {
          a4 = v23;
          v16 = [[CreditAccountFeatureDescriptor alloc] initWithCreditAccountFeatureDescriptor:v10 forAccountPID:v23 inDatabase:v8];
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

+ (void)updateCreditAccountFeatureDescriptors:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v26 = objc_alloc_init((Class)NSMutableSet);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v7;
  id v28 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v28)
  {
    id v24 = v8;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v12 = [v11 identifier];
        v13 = [a1 _predicateForAccountUserPID:v8];
        v34[0] = v13;
        v14 = [a1 _predicateForFeatureIdentifier:v12];
        v34[1] = v14;
        v15 = +[NSArray arrayWithObjects:v34 count:2];
        v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];
        v17 = [a1 anyInDatabase:v9 predicate:v16];

        if (v17)
        {
          [(CreditAccountFeatureDescriptor *)v17 updateWithCreditFeatureDescriptor:v11];
          id v8 = v24;
        }
        else
        {
          id v8 = v24;
          v17 = [[CreditAccountFeatureDescriptor alloc] initWithCreditAccountFeatureDescriptor:v11 forAccountUserPID:v24 inDatabase:v9];
        }
        [v26 addObject:v12];
      }
      id v28 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v28);
  }

  v18 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"b" values:v26];
  v33[0] = v18;
  v19 = [a1 _predicateForAccountUserPID:v8];
  v33[1] = v19;
  v20 = +[NSArray arrayWithObjects:v33 count:2];
  v21 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v20];

  v22 = [a1 queryWithDatabase:v9 predicate:v21];
  [v22 deleteAllEntities];
}

- (void)updateWithCreditFeatureDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForCreditAccountFeatureDescriptor:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForAccountUserPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"n" equalToValue:a3];
}

+ (id)_predicateForFeatureIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

- (id)creditAccountFeatureDescriptor
{
  id v3 = objc_alloc_init((Class)PKCreditAccountFeatureDescriptor);
  id v4 = [(id)objc_opt_class() _propertySettersForCreditAccountFeatureDescriptor];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100456CBC;
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

+ (id)_creditAccountFeatureDescriptorsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForCreditAccountFeatureDescriptor];
  id v6 = +[NSMutableSet set];
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100456E48;
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

+ (id)_propertyValuesForCreditAccountFeatureDescriptor:(id)a3
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

  id v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 paymentFundingSourceTypes]);
  [v4 setObjectOrNull:v14 forKey:@"h"];

  id v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 paymentFrequencies]);
  [v4 setObjectOrNull:v15 forKey:@"i"];

  v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 paymentPresets]);
  [v4 setObjectOrNull:v16 forKey:@"j"];

  v17 = [v3 paymentTermsIdentifier];
  [v4 setObjectOrNull:v17 forKey:@"k"];

  v18 = [v3 fundingSourceTermsIdentifier];
  [v4 setObjectOrNull:v18 forKey:@"l"];

  v19 = [v3 supportedFileFormatsForTransactionData];
  v20 = [v19 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v20 forKey:@"m"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "maximumAccountUsers"), @"o");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "minimumOwnerAge"), @"p");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "minimumParticipantAge"), @"q");
  v21 = [v3 osVersionRange];
  v22 = (void *)_SQLValueForOSVersionRequirementRange();
  [v4 setObjectOrNull:v22 forKey:@"os_version_requirement_range"];

  int64_t v23 = [v3 supportedDestinations];
  id v24 = [v23 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v24 forKey:@"r"];

  uint64_t v25 = [v3 savingsAPY];
  id v26 = +[NSNumber numberWithInteger:PKPercentageDecimalToStorageInteger()];
  [v4 setObjectOrNull:v26 forKey:@"s"];

  id v27 = [v3 savingsInterestRate];

  id v28 = +[NSNumber numberWithInteger:PKPercentageDecimalToStorageInteger()];
  [v4 setObjectOrNull:v28 forKey:@"savings_interest_rate"];

  id v29 = [v4 copy];
  return v29;
}

+ (id)_propertySettersForCreditAccountFeatureDescriptor
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_1007527B0;
  v5[1] = &stru_1007527D0;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_1007527F0;
  v5[3] = &stru_100752810;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100752830;
  v5[5] = &stru_100752850;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100752870;
  v5[7] = &stru_100752890;
  v4[8] = @"j";
  v4[9] = @"k";
  v5[8] = &stru_1007528B0;
  v5[9] = &stru_1007528D0;
  v4[10] = @"l";
  v4[11] = @"m";
  v5[10] = &stru_1007528F0;
  v5[11] = &stru_100752910;
  v4[12] = @"o";
  v4[13] = @"p";
  v5[12] = &stru_100752930;
  v5[13] = &stru_100752950;
  v4[14] = @"q";
  v4[15] = @"os_version_requirement_range";
  v5[14] = &stru_100752970;
  v5[15] = &stru_100752990;
  v4[16] = @"r";
  v4[17] = @"s";
  v5[16] = &stru_1007529B0;
  v5[17] = &stru_1007529D0;
  v4[18] = @"savings_interest_rate";
  v5[18] = &stru_1007529F0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:19];
  return v2;
}

@end