@interface PassCredentialShare
+ (BOOL)deletePassCredentialShareForIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_passCredentialSharesWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForCredentialShareIdentifier:(id)a3;
+ (id)_predicateForSharePID:(int64_t)a3;
+ (id)_predicateForSharePIDs:(id)a3;
+ (id)_predicateForTransportIdentifier:(id)a3;
+ (id)_propertySettersForPassCredentialShare;
+ (id)_propertyValuesForPassCredentialShare:(id)a3;
+ (id)databaseTable;
+ (id)dbPassCredentialShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passCredentialShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passCredentialShareForIdentifier:(id)a3 sharePIDs:(id)a4 inDatabase:(id)a5;
+ (id)passCredentialShareForTransportIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passCredentialSharesForSharePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassCredentialShareForSharePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassCredentialShares:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5;
+ (void)mergeInCredentialShares:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5;
- (PassCredentialShare)initWithPassCredentialShare:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5;
- (id)passCredentialShare;
- (void)setIdentifier:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)updateWithPassCredentialShare:(id)a3;
- (void)updateWithPassCredentialShare:(id)a3 mergingInCredentialShare:(id)a4;
@end

@implementation PassCredentialShare

+ (id)databaseTable
{
  return @"kohlrabi";
}

- (PassCredentialShare)initWithPassCredentialShare:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPassCredentialShare:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"b"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

- (void)updateWithPassCredentialShare:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPassCredentialShare:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

- (void)updateWithPassCredentialShare:(id)a3 mergingInCredentialShare:(id)a4
{
  id v6 = a4;
  id v9 = [a3 copy];
  unint64_t v7 = (unint64_t)[v6 targetDevice];

  if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    [v9 setTargetDevice:v7];
  }
  id v8 = [(id)objc_opt_class() _propertyValuesForPassCredentialShare:v9];
  [(SQLiteEntity *)self setValuesWithDictionary:v8];
}

+ (void)insertOrUpdatePassCredentialShares:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5
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
        v11 = [v10 identifier];
        v12 = [a1 _predicateForCredentialShareIdentifier:v11];
        v33[0] = v12;
        v13 = [a1 _predicateForSharePID:a4];
        v33[1] = v13;
        v14 = +[NSArray arrayWithObjects:v33 count:2];
        v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];
        v16 = [a1 anyInDatabase:v8 predicate:v15];

        if (v16)
        {
          [(PassCredentialShare *)v16 updateWithPassCredentialShare:v10];
          a4 = v23;
        }
        else
        {
          a4 = v23;
          v16 = [[PassCredentialShare alloc] initWithPassCredentialShare:v10 sharePID:v23 inDatabase:v8];
        }
        [v26 addObject:v11];
      }
      id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v27);
  }

  v17 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"a" values:v26];
  v32[0] = v17;
  v18 = [a1 _predicateForSharePID:a4];
  v32[1] = v18;
  v19 = +[NSArray arrayWithObjects:v32 count:2];
  v20 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v19];

  v21 = [a1 queryWithDatabase:v8 predicate:v20];
  [v21 deleteAllEntities];
}

+ (void)mergeInCredentialShares:(id)a3 sharePID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  id v20 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v21 = [v10 identifier];
        v11 = objc_msgSend(a1, "_predicateForCredentialShareIdentifier:");
        v26[0] = v11;
        v12 = [a1 _predicateForSharePID:a4];
        v26[1] = v12;
        v13 = +[NSArray arrayWithObjects:v26 count:2];
        v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];
        v15 = [a1 anyInDatabase:v8 predicate:v14];

        if (v15)
        {
          v16 = [(PassCredentialShare *)v15 passCredentialShare];
          [(PassCredentialShare *)v15 updateWithPassCredentialShare:v10 mergingInCredentialShare:v16];
        }
        else
        {
          v15 = [[PassCredentialShare alloc] initWithPassCredentialShare:v10 sharePID:a4 inDatabase:v8];
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v20);
  }
}

+ (id)passCredentialSharesForSharePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForSharePID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _passCredentialSharesWithQuery:v8 inDatabase:v6];

  return v9;
}

+ (id)passCredentialShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = [a1 dbPassCredentialShareForCredentialShareIdentifier:a3 inDatabase:a4];
  id v5 = [v4 passCredentialShare];

  return v5;
}

+ (id)passCredentialShareForTransportIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForTransportIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 passCredentialShare];

  return v9;
}

+ (id)dbPassCredentialShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForCredentialShareIdentifier:a3];
  v12 = v7;
  id v8 = +[NSArray arrayWithObjects:&v12 count:1];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];
  v10 = [a1 anyInDatabase:v6 predicate:v9];

  return v10;
}

+ (id)passCredentialShareForIdentifier:(id)a3 sharePIDs:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a1 _predicateForCredentialShareIdentifier:a3];
  v17[0] = v10;
  v11 = [a1 _predicateForSharePIDs:v9];

  v17[1] = v11;
  v12 = +[NSArray arrayWithObjects:v17 count:2];
  v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  v14 = [a1 anyInDatabase:v8 predicate:v13];

  v15 = [v14 passCredentialShare];

  return v15;
}

+ (void)deletePassCredentialShareForSharePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForSharePID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (BOOL)deletePassCredentialShareForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForCredentialShareIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  LOBYTE(v6) = [v8 deleteAllEntities];
  return (char)v6;
}

+ (id)_passCredentialSharesWithQuery:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = [a1 _propertySettersForPassCredentialShare];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [v6 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000E65A8;
  v13[3] = &unk_10072EAD8;
  id v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v15 = v9;
  id v10 = v6;
  [v5 enumeratePersistentIDsAndProperties:v8 usingBlock:v13];

  if ([v9 count]) {
    id v11 = [v9 copy];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (id)passCredentialShare
{
  id v3 = objc_alloc_init((Class)PKPassCredentialShare);
  id v4 = [(id)objc_opt_class() _propertySettersForPassCredentialShare];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E672C;
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

- (void)setIdentifier:(id)a3
{
}

- (void)setStatus:(unint64_t)a3
{
  PKShareStatusToString();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SQLiteEntity *)self setValue:v4 forProperty:@"e"];
}

+ (id)_predicateForSharePID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)_predicateForSharePIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"b" values:a3];
}

+ (id)_predicateForCredentialShareIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForTransportIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"c" equalToValue:a3];
}

+ (id)_propertyValuesForPassCredentialShare:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"a"];

  id v6 = [v3 channelTransportIdentifier];
  [v4 setObjectOrNull:v6 forKey:@"c"];

  [v3 targetDevice];
  id v7 = PKPassCredentialShareTargetDeviceToString();
  [v4 setObjectOrNull:v7 forKey:@"d"];

  [v3 status];
  id v8 = PKShareStatusToString();
  [v4 setObjectOrNull:v8 forKey:@"e"];

  return v4;
}

+ (id)_propertySettersForPassCredentialShare
{
  v4[0] = @"a";
  v4[1] = @"c";
  v5[0] = &stru_100735E80;
  v5[1] = &stru_100735EA0;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100735EC0;
  v5[3] = &stru_100735EE0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end