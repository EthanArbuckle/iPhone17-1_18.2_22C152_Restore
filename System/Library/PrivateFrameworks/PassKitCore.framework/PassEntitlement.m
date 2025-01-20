@interface PassEntitlement
+ (BOOL)hasShareablePassEntitlementsForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_passEntitlementsWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForPassEntitlementIdentifier:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForShareableEntitlement;
+ (id)_predicateForSubcredentialIdentifier:(id)a3;
+ (id)_propertySettersForPassEntitlement;
+ (id)_propertyValuesForPassEntitlement:(id)a3;
+ (id)databaseTable;
+ (id)passEntitlementForIdentifier:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)passEntitlementsForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)passEntitlementsForSubcredentialIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deletePassEntitlementForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassEntitlements:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (PassEntitlement)initWithPassEntitlement:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (id)passEntitlement;
- (void)updateWithEntitlement:(id)a3;
@end

@implementation PassEntitlement

+ (id)databaseTable
{
  return @"loquat";
}

- (PassEntitlement)initWithPassEntitlement:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPassEntitlement:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

- (void)updateWithEntitlement:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPassEntitlement:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (void)insertOrUpdatePassEntitlements:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v27 = objc_alloc_init((Class)NSMutableSet);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v7;
  id v28 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v28)
  {
    uint64_t v25 = *(void *)v31;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];
        v12 = [a1 _predicateForPassPID:a4];
        v35[0] = v12;
        v29 = (void *)v11;
        v13 = [a1 _predicateForPassEntitlementIdentifier:v11];
        v35[1] = v13;
        v14 = +[NSArray arrayWithObjects:v35 count:2];
        +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];
        v16 = int64_t v15 = a4;
        v17 = [a1 anyInDatabase:v8 predicate:v16];

        if (v17) {
          [(PassEntitlement *)v17 updateWithEntitlement:v10];
        }
        else {
          v17 = [[PassEntitlement alloc] initWithPassEntitlement:v10 forPassPID:v15 inDatabase:v8];
        }
        a4 = v15;
        v18 = [v10 timeConfiguration];
        +[PassShareTimeConfiguration insertOrUpdatePassShareTimeConfiguration:v18 forPassEntitlementPID:[(SQLiteEntity *)v17 persistentID] inDatabase:v8];

        [v27 addObject:v29];
      }
      id v28 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v28);
  }

  v19 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"b" values:v27];
  v34[0] = v19;
  v20 = [a1 _predicateForPassPID:a4];
  v34[1] = v20;
  v21 = +[NSArray arrayWithObjects:v34 count:2];
  v22 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v21];

  v23 = [a1 queryWithDatabase:v8 predicate:v22];
  [v23 deleteAllEntities];
}

+ (id)passEntitlementsForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _passEntitlementsWithQuery:v8 inDatabase:v6];

  return v9;
}

+ (id)passEntitlementsForSubcredentialIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForSubcredentialIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _passEntitlementsWithQuery:v8 inDatabase:v6];

  return v9;
}

+ (id)passEntitlementForIdentifier:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a1 _predicateForPassPID:a4];
  v17[0] = v10;
  uint64_t v11 = [a1 _predicateForPassEntitlementIdentifier:v9];

  v17[1] = v11;
  v12 = +[NSArray arrayWithObjects:v17 count:2];
  v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  v14 = [a1 anyInDatabase:v8 predicate:v13];

  int64_t v15 = [v14 passEntitlement];

  return v15;
}

+ (void)deletePassEntitlementForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  [v8 deleteAllEntities];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004A0BF8;
  v10[3] = &unk_100731020;
  id v11 = v6;
  id v9 = v6;
  [v8 enumeratePersistentIDsUsingBlock:v10];
}

+ (BOOL)hasShareablePassEntitlementsForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassPID:a3];
  v13[0] = v7;
  id v8 = [a1 _predicateForShareableEntitlement];
  v13[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v13 count:2];
  v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  id v11 = [a1 queryWithDatabase:v6 predicate:v10];

  LOBYTE(v6) = [v11 exists];
  return (char)v6;
}

+ (id)_passEntitlementsWithQuery:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _propertySettersForPassEntitlement];
  id v9 = objc_alloc_init((Class)NSMutableArray);
  v10 = [v8 allKeys];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_1004A0E78;
  v19 = &unk_10072DE00;
  id v23 = a1;
  id v20 = v8;
  id v21 = v6;
  id v11 = v9;
  id v22 = v11;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  if (objc_msgSend(v11, "count", v16, v17, v18, v19)) {
    id v14 = [v11 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (id)passEntitlement
{
  id v3 = objc_alloc_init((Class)PKPassEntitlement);
  id v4 = [(id)objc_opt_class() _propertySettersForPassEntitlement];
  id v5 = [v4 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1004A10A0;
  v12[3] = &unk_10072DDD8;
  v12[4] = self;
  id v13 = v4;
  id v6 = v3;
  id v14 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v12];

  id v8 = +[PassShareTimeConfiguration passShareTimeConfigurationsForPassEntitlementPID:[(SQLiteEntity *)self persistentID] inDatabase:self->super._database];
  id v9 = [v8 firstObject];

  [v6 setTimeConfiguration:v9];
  id v10 = v6;

  return v10;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassEntitlementIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForSubcredentialIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"l" equalToValue:a3];
}

+ (id)_predicateForShareableEntitlement
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"h"];
}

+ (id)_propertyValuesForPassEntitlement:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 entitlementTemplate];
  [v4 setObjectOrNull:v6 forKey:@"e"];

  id v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 active]);
  [v4 setObjectOrNull:v7 forKey:@"f"];

  id v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 hasRemainingShares]);
  [v4 setObjectOrNull:v8 forKey:@"m"];

  id v9 = [v3 value];
  [v4 setObjectOrNull:v9 forKey:@"g"];

  id v10 = [v3 shareability];
  id v11 = PKSharingCapabilityShareabilitiesToStringArray();
  id v12 = [v11 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v12 forKey:@"h"];

  id v13 = [v3 visibility];
  id v14 = PKSharingCapabilityVisibilitiesToStringArray();
  int64_t v15 = [v14 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v15 forKey:@"i"];

  v16 = [v3 manageability];
  uint64_t v17 = PKSharingCapabilityManageabilitiesToStringArray();
  v18 = [v17 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v18 forKey:@"j"];

  v19 = [v3 templateFields];
  id v20 = +[NSKeyedArchiver archivedDataWithRootObject:v19 requiringSecureCoding:1 error:0];
  [v4 setObjectOrNull:v20 forKey:@"k"];

  id v21 = [v3 subcredentialIdentifier];
  [v4 setObjectOrNull:v21 forKey:@"l"];

  id v22 = [v3 activeCapabilityRole];
  [v4 setObjectOrNull:v22 forKey:@"q"];

  id v23 = [v3 activeShareability];
  v24 = v23;
  if (v23)
  {
    [v23 unsignedIntegerValue];
    uint64_t v25 = PKSharingCapabilityShareabilityToString();
    [v4 setObjectOrNull:v25 forKey:@"n"];
  }
  else
  {
    [v4 setObjectOrNull:0 forKey:@"n"];
  }
  v26 = [v3 activeManageability];

  if (v26)
  {
    [v26 unsignedIntegerValue];
    id v27 = PKSharingCapabilityManageabilityToString();
    [v4 setObjectOrNull:v27 forKey:@"o"];
  }
  else
  {
    [v4 setObjectOrNull:0 forKey:@"o"];
  }
  id v28 = [v3 activeVisibility];

  if (v28)
  {
    [v28 unsignedIntegerValue];
    v29 = PKSharingCapabilityVisibilityToString();
    [v4 setObjectOrNull:v29 forKey:@"p"];
  }
  else
  {
    [v4 setObjectOrNull:0 forKey:@"p"];
  }

  return v4;
}

+ (id)_propertySettersForPassEntitlement
{
  v4[0] = @"b";
  v4[1] = @"e";
  v5[0] = &stru_100754D10;
  v5[1] = &stru_100754D30;
  v4[2] = @"f";
  v4[3] = @"m";
  v5[2] = &stru_100754D50;
  v5[3] = &stru_100754D70;
  v4[4] = @"g";
  v4[5] = @"h";
  v5[4] = &stru_100754D90;
  v5[5] = &stru_100754DB0;
  v4[6] = @"i";
  v4[7] = @"j";
  v5[6] = &stru_100754DD0;
  v5[7] = &stru_100754DF0;
  v4[8] = @"k";
  v4[9] = @"l";
  v5[8] = &stru_100754E10;
  v5[9] = &stru_100754E30;
  v4[10] = @"n";
  v4[11] = @"o";
  v5[10] = &stru_100754E50;
  v5[11] = &stru_100754E70;
  v4[12] = @"p";
  v4[13] = @"q";
  v5[12] = &stru_100754E90;
  v5[13] = &stru_100754EB0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:14];
  return v2;
}

@end