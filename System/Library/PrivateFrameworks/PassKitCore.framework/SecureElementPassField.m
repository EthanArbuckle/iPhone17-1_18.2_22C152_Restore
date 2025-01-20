@interface SecureElementPassField
+ (id)_paymentPassFieldsQueryWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForPassPID:(int64_t)a3 source:(int64_t)a4;
+ (id)databaseTable;
+ (id)insertBalanceFieldUnit:(id)a3 forPass:(id)a4 passDictionaryKey:(id)a5 order:(int64_t)a6 inDatabase:(id)a7;
+ (id)joinClauseForProperty:(id)a3;
+ (id)paymentPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4 source:(int64_t)a5;
+ (id)paymentPassFieldsInDatabase:(id)a3 forQuery:(id)a4;
+ (id)secureElementPassFieldsFromDatabaseSecureElementFields:(id)a3;
+ (id)secureElementPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4;
+ (void)deleteSecureElementPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4;
- (SecureElementPassField)initWithBalanceFieldUnit:(id)a3 forPass:(id)a4 passDictionaryKey:(id)a5 order:(int64_t)a6 inDatabase:(id)a7;
@end

@implementation SecureElementPassField

+ (id)databaseTable
{
  return @"secure_element_pass_field";
}

+ (id)joinClauseForProperty:(id)a3
{
  if ([a3 isEqualToString:@"pass.pid"]) {
    return @"JOIN pass ON secure_element_pass_field.pass_pid = pass.pid";
  }
  else {
    return 0;
  }
}

- (SecureElementPassField)initWithBalanceFieldUnit:(id)a3 forPass:(id)a4 passDictionaryKey:(id)a5 order:(int64_t)a6 inDatabase:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_100020AFC;
  v37 = sub_100021070;
  id v38 = 0;
  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  [v16 setEntityPIDOrNull:v13 forKey:@"pass_pid"];
  v17 = [v12 key];
  [v16 setObjectOrNull:v17 forKey:@"key"];

  uint64_t v18 = SecureElementPassFieldSourceFromString(v14);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
  }
  else
  {
    v19 = +[NSNumber numberWithInteger:v18];
  }
  [v16 setObjectOrNull:v19 forKey:@"source"];
  [v16 setInteger:a6 forKey:@"field_order"];
  [v12 unitType];
  v20 = _PKEnumValueToString();
  objc_msgSend(v16, "setObjectOrNull:forKey:", v20, @"unit_type", -1, 0, 1, 2, 3);

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1002CEB34;
  v27[3] = &unk_1007466F0;
  v32 = &v33;
  v21 = self;
  v28 = v21;
  id v22 = v16;
  id v29 = v22;
  id v23 = v15;
  id v30 = v23;
  id v24 = v12;
  id v31 = v24;
  sub_10000817C((uint64_t)v23, v27);
  v25 = (SecureElementPassField *)(id)v34[5];

  _Block_object_dispose(&v33, 8);
  return v25;
}

+ (id)insertBalanceFieldUnit:(id)a3 forPass:(id)a4 passDictionaryKey:(id)a5 order:(int64_t)a6 inDatabase:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[SecureElementPassField alloc] initWithBalanceFieldUnit:v14 forPass:v13 passDictionaryKey:v12 order:a6 inDatabase:v11];

  return v15;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassPID:(int64_t)a3 source:(int64_t)a4
{
  v5 = [a1 _predicateForPassPID:a3];
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[NSNumber numberWithInteger:a4];
  }
  v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"source" equalToValue:v6];
  v11[0] = v5;
  v11[1] = v7;
  v8 = +[NSArray arrayWithObjects:v11 count:2];
  v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)paymentPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4 source:(int64_t)a5
{
  id v8 = a3;
  v9 = [a1 _predicateForPassPID:a4 source:a5];
  v10 = [a1 _paymentPassFieldsQueryWithPredicate:v9 inDatabase:v8];

  id v11 = [a1 paymentPassFieldsInDatabase:v8 forQuery:v10];

  return v11;
}

+ (id)paymentPassFieldsInDatabase:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002CEFA4;
  v13[3] = &unk_1007396C8;
  id v16 = a1;
  id v14 = v6;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v15 = v8;
  id v9 = v6;
  [v7 enumeratePersistentIDsUsingBlock:v13];

  v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)secureElementPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPassPID:a4];
  id v8 = [a1 _paymentPassFieldsQueryWithPredicate:v7 inDatabase:v6];

  id v9 = [a1 paymentPassFieldsInDatabase:v6 forQuery:v8];

  v10 = [a1 secureElementPassFieldsFromDatabaseSecureElementFields:v9];

  return v10;
}

+ (id)secureElementPassFieldsFromDatabaseSecureElementFields:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v21 = *(void *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v21) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v9 = objc_alloc_init((Class)PKSecureElementPassField);
        v10 = [v8 valueForProperty:@"key"];
        [v9 setKey:v10];
        id v11 = [v8 database];
        id v12 = +[SecureElementPassFieldForeignReferenceIdentifier identifiersForSecureElementPassField:v8 inDatabase:v11];

        [v9 setForeignReferenceIdentifiers:v12];
        id v13 = [v8 valueForProperty:@"unit_type"];
        if (v13) {
          objc_msgSend(v9, "setUnitType:", (int)_PKEnumValueFromString(), -1, 0, 1, 2, 3);
        }
        id v14 = [v8 valueForProperty:@"source"];
        uint64_t v15 = NSStringFromSecureElementPassFieldSource((uint64_t)[v14 integerValue]);
        id v16 = (void *)v15;
        if (v14 && v15)
        {
          id v17 = [v4 objectForKeyedSubscript:v15];
          if (!v17) {
            id v17 = objc_alloc_init((Class)NSMutableArray);
          }
          [v17 safelyAddObject:v9];
          [v4 setObject:v17 forKeyedSubscript:v16];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  id v18 = [objc_alloc((Class)PKSecureElementPassFieldCollection) initWithFieldsDictionary:v4];
  return v18;
}

+ (void)deleteSecureElementPassFieldsInDatabase:(id)a3 forPassPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPassPID:a4];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002CF44C;
  v10[3] = &unk_100731020;
  id v11 = v6;
  id v9 = v6;
  [v8 enumeratePersistentIDsUsingBlock:v10];
  [v8 deleteAllEntities];
}

+ (id)_paymentPassFieldsQueryWithPredicate:(id)a3 inDatabase:(id)a4
{
  CFStringRef v13 = @"field_order";
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v13 count:1];
  CFStringRef v12 = @"ASC";
  id v9 = +[NSArray arrayWithObjects:&v12 count:1];
  v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9 limit:0 groupingProperties:0];

  return v10;
}

@end