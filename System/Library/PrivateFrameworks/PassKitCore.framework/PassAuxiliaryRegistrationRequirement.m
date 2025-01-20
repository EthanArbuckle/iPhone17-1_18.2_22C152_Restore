@interface PassAuxiliaryRegistrationRequirement
+ (BOOL)updateAuxiliaryRegistrationRequirement:(id)a3 passPID:(int64_t)a4 isRegistered:(BOOL)a5 inDatabase:(id)a6;
+ (BOOL)updateAuxiliaryRegistrationRequirementsForPassPID:(int64_t)a3 isRegistered:(BOOL)a4 inDatabase:(id)a5;
+ (BOOL)updateRegistrationStatusTo:(BOOL)a3 role:(unint64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForRole:(unint64_t)a3 type:(unint64_t)a4;
+ (id)_predicateForUnregistered;
+ (id)_propertyValuesFor:(id)a3;
+ (id)auxiliaryRegistrationRequirementStatusForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)unregisteredAuxiliaryRegistrationRequirementIdentifiersForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteAuxiliaryRegistrationRequirementsForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAuxiliaryRegistrationRequirements:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5;
- (PassAuxiliaryRegistrationRequirement)initWithObject:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (void)updateWithObject:(id)a3;
@end

@implementation PassAuxiliaryRegistrationRequirement

- (PassAuxiliaryRegistrationRequirement)initWithObject:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesFor:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  [v10 setObjectOrNull:&__kCFBooleanFalse forKey:@"e"];
  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v12;
}

- (void)updateWithObject:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesFor:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)databaseTable
{
  return @"waffle";
}

+ (id)unregisteredAuxiliaryRegistrationRequirementIdentifiersForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPassPID:a3];
  v23[0] = v7;
  id v8 = [a1 _predicateForUnregistered];
  v23[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v23 count:2];
  v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  v11 = [a1 queryWithDatabase:v6 predicate:v10];

  id v12 = objc_alloc_init((Class)NSMutableArray);
  v22[0] = @"d";
  v22[1] = @"f";
  v13 = +[NSArray arrayWithObjects:v22 count:2];
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_1001AF64C;
  v20 = &unk_1007329C0;
  id v14 = v12;
  id v21 = v14;
  [v11 enumerateProperties:v13 usingBlock:&v17];

  if (objc_msgSend(v14, "count", v17, v18, v19, v20)) {
    id v15 = [v14 copy];
  }
  else {
    id v15 = 0;
  }

  return v15;
}

+ (id)auxiliaryRegistrationRequirementStatusForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPassPID:a3];
  v22 = v7;
  id v8 = +[NSArray arrayWithObjects:&v22 count:1];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  v10 = [a1 queryWithDatabase:v6 predicate:v9];

  id v11 = objc_alloc_init((Class)NSMutableArray);
  v21[0] = @"d";
  v21[1] = @"e";
  v21[2] = @"f";
  id v12 = +[NSArray arrayWithObjects:v21 count:3];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_1001AF8B0;
  v19 = &unk_1007329C0;
  id v13 = v11;
  id v20 = v13;
  [v10 enumerateProperties:v12 usingBlock:&v16];

  if (objc_msgSend(v13, "count", v16, v17, v18, v19)) {
    id v14 = [v13 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

+ (void)insertOrUpdateAuxiliaryRegistrationRequirements:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5
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
        id v12 = [a1 _predicateForPassPID:a4];
        v33[0] = v12;
        id v13 = [a1 _predicateForIdentifier:v11];
        v33[1] = v13;
        id v14 = +[NSArray arrayWithObjects:v33 count:2];
        id v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];
        v16 = [a1 anyInDatabase:v8 predicate:v15];

        if (v16)
        {
          [(PassAuxiliaryRegistrationRequirement *)v16 updateWithObject:v10];
          a4 = v23;
        }
        else
        {
          a4 = v23;
          v16 = [[PassAuxiliaryRegistrationRequirement alloc] initWithObject:v10 forPassPID:v23 inDatabase:v8];
        }
        [v26 addObject:v11];
      }
      id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v27);
  }

  uint64_t v17 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"d" values:v26];
  v32[0] = v17;
  uint64_t v18 = [a1 _predicateForPassPID:a4];
  v32[1] = v18;
  v19 = +[NSArray arrayWithObjects:v32 count:2];
  id v20 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v19];

  id v21 = [a1 queryWithDatabase:v8 predicate:v20];
  [v21 deleteAllEntities];
}

+ (void)deleteAuxiliaryRegistrationRequirementsForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (BOOL)updateAuxiliaryRegistrationRequirement:(id)a3 passPID:(int64_t)a4 isRegistered:(BOOL)a5 inDatabase:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = [a1 _predicateForPassPID:a4];
  v22[0] = v12;
  id v13 = [v10 identifier];
  id v14 = [a1 _predicateForIdentifier:v13];
  v22[1] = v14;
  id v15 = +[NSArray arrayWithObjects:v22 count:2];
  v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

  uint64_t v17 = [a1 anyInDatabase:v11 predicate:v16];
  if (!v17) {
    uint64_t v17 = [[PassAuxiliaryRegistrationRequirement alloc] initWithObject:v10 forPassPID:a4 inDatabase:v11];
  }
  uint64_t v18 = +[NSNumber numberWithBool:v7];
  if ([(SQLiteEntity *)v17 setValue:v18 forProperty:@"e"])
  {
    v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 registrationBackoffCounter]);
    unsigned __int8 v20 = [(SQLiteEntity *)v17 setValue:v19 forProperty:@"f"];
  }
  else
  {
    unsigned __int8 v20 = 0;
  }

  return v20;
}

+ (BOOL)updateAuxiliaryRegistrationRequirementsForPassPID:(int64_t)a3 isRegistered:(BOOL)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _predicateForPassPID:a3];
  uint64_t v24 = v9;
  id v10 = +[NSArray arrayWithObjects:&v24 count:1];
  id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  id v12 = [a1 queryWithDatabase:v8 predicate:v11];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001B0038;
  v16[3] = &unk_10073CAD0;
  id v13 = v8;
  id v17 = v13;
  uint64_t v18 = &v20;
  BOOL v19 = a4;
  [v12 enumeratePersistentIDsUsingBlock:v16];
  BOOL v14 = *((unsigned char *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  return v14;
}

+ (BOOL)updateRegistrationStatusTo:(BOOL)a3 role:(unint64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = [a1 _predicateForRole:a4 type:a5];
  if (v11)
  {
    id v12 = [a1 queryWithDatabase:v10 predicate:v11];
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001B0234;
    v15[3] = &unk_10073CAD0;
    id v16 = v10;
    id v17 = &v19;
    BOOL v18 = a3;
    [v12 enumeratePersistentIDsUsingBlock:v15];
    BOOL v13 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:a3];
}

+ (id)_predicateForUnregistered
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"e" equalToValue:&__kCFBooleanFalse];
}

+ (id)_predicateForRole:(unint64_t)a3 type:(unint64_t)a4
{
  if (a3 != 2)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    id v4 = PKDeviceDecryptionTypeToString();
    id v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"c" equalToValue:v4];
  }
  id v6 = PKDeviceSignatureTypeToString();
  BOOL v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"c" equalToValue:v6];

  if (v7)
  {
    id v8 = PKAuxiliaryCapabilityRoleToString();
    id v9 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v8];
    v13[0] = v9;
    v13[1] = v7;
    id v10 = +[NSArray arrayWithObjects:v13 count:2];
    id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

    goto LABEL_7;
  }
LABEL_6:
  id v11 = 0;
LABEL_7:
  return v11;
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 role];
  id v5 = PKAuxiliaryCapabilityRoleToString();
  [v4 setObjectOrNull:v5 forKey:@"b"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 type];
    uint64_t v6 = PKDeviceSignatureTypeToString();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    [v3 type];
    uint64_t v6 = PKDeviceDecryptionTypeToString();
  }
  BOOL v7 = (void *)v6;
  [v4 setObjectOrNull:v6 forKey:@"c"];

LABEL_6:
  id v8 = [v3 identifier];
  [v4 setObjectOrNull:v8 forKey:@"d"];

  id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 registrationBackoffCounter]);
  [v4 setObjectOrNull:v9 forKey:@"f"];

  return v4;
}

@end