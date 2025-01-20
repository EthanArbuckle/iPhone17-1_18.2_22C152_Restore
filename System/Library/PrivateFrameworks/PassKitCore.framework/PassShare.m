@interface PassShare
+ (BOOL)_passSharesExistWithQuery:(id)a3 inDatabase:(id)a4;
+ (BOOL)activeExternalPassSharesInDatabase:(id)a3;
+ (BOOL)addPassShare:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
+ (BOOL)externalPassSharesForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (BOOL)passSharesExistForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_passSharesWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForActiveExternalShares;
+ (id)_predicateForCredentialShareIdentifier:(id)a3;
+ (id)_predicateForCredentialShareIdentifiers:(id)a3;
+ (id)_predicateForExternalCredentialShare;
+ (id)_predicateForExternalSharesForPassPID:(int64_t)a3;
+ (id)_predicateForGroupIdentifier:(id)a3;
+ (id)_predicateForHasCredentialShares;
+ (id)_predicateForHasGroupIdentifier;
+ (id)_predicateForNoCredentialShares;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForShareIdentifier:(id)a3;
+ (id)_predicateForSubcredentialIdentifier:(id)a3;
+ (id)_propertySettersForPassShare;
+ (id)_propertyValuesForPassShare:(id)a3;
+ (id)databaseTable;
+ (id)passShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passShareForForPassPID:(int64_t)a3 shareIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)passShareForIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passSharesForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)passSharesForSubcredentialIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passSharesPIDsForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (int64_t)passPIDForShareIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)_deleteForQuery:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deletePassShareForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassShareWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassShares:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)mergeInShares:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (PassShare)initWithPassShare:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (id)passShare;
- (void)updateWithPassShare:(id)a3;
- (void)updateWithPassShare:(id)a3 keepingNonnilValuesFrom:(id)a4;
@end

@implementation PassShare

+ (id)databaseTable
{
  return @"cherimoya";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"kohlrabi.a"] & 1) != 0
    || ([v6 isEqualToString:@"kohlrabi.d"] & 1) != 0
    || [v6 isEqualToString:@"kohlrabi.e"])
  {
    [v5 addObject:@"LEFT JOIN kohlrabi ON cherimoya.pid = kohlrabi.b"];
  }
}

- (PassShare)initWithPassShare:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPassShare:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"g"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

- (void)updateWithPassShare:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPassShare:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

- (void)updateWithPassShare:(id)a3 keepingNonnilValuesFrom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24 = v6;
  id v8 = [(id)objc_opt_class() _propertyValuesForPassShare:v6];
  id v9 = [v8 mutableCopy];

  v25 = [(id)objc_opt_class() _propertyValuesForPassShare:v7];
  v23 = v7;
  v10 = [v7 identifier];

  if (v10)
  {
    v11 = +[NSNull null];
    [v9 setObject:v11 forKey:@"a"];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v12 = objc_msgSend(v25, "allKeys", self);
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v18 = [v9 objectForKeyedSubscript:v17];
        if (!v18
          || (+[NSNull null],
              v19 = objc_claimAutoreleasedReturnValue(),
              int v20 = PKEqualObjects(),
              v19,
              v20))
        {
          v21 = [v25 objectForKeyedSubscript:v17];
          [v9 setObject:v21 forKeyedSubscript:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  [v22 setValuesWithDictionary:v9];
}

+ (void)insertOrUpdatePassShares:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v23 = objc_alloc_init((Class)NSMutableSet);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([(id)objc_opt_class() addPassShare:v15 forPassPID:a4 inDatabase:v9])
        {
          v16 = [v15 identifier];
          if (v16)
          {
            [v23 addObject:v16];
          }
          else
          {
            uint64_t v17 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v15;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "ERROR: Unable to save share because missing identifier: %@", buf, 0xCu);
            }
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v12);
  }

  v18 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"a" values:v23];
  v28[0] = v18;
  v19 = [a1 _predicateForPassPID:a4];
  v28[1] = v19;
  int v20 = +[NSArray arrayWithObjects:v28 count:2];
  v21 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v20];

  v22 = [a1 queryWithDatabase:v9 predicate:v21];
  [v22 deleteAllEntities];
}

+ (void)mergeInShares:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v58 = objc_alloc_init((Class)NSMutableSet);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v7;
  id v59 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v59)
  {
    uint64_t v56 = *(void *)v62;
    id v57 = a1;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v62 != v56) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v9);
        id v11 = objc_alloc((Class)NSMutableArray);
        id v12 = [v10 identifier];
        uint64_t v13 = [a1 _predicateForShareIdentifier:v12];
        v69 = v13;
        id v14 = +[NSArray arrayWithObjects:&v69 count:1];
        id v15 = [v11 initWithArray:v14];

        v16 = [v10 groupIdentifier];
        if (v16)
        {
          uint64_t v17 = [a1 _predicateForGroupIdentifier:v16];
          [v15 addObject:v17];
        }
        v18 = [v10 credentialShares];

        if (v18)
        {
          v19 = [v10 credentialShares];
          int v20 = objc_msgSend(v19, "pk_arrayByApplyingBlock:", &stru_100743D90);
          v21 = [a1 _predicateForCredentialShareIdentifiers:v20];
          [v15 addObject:v21];
        }
        v22 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v15];
        v68[0] = v22;
        id v23 = [a1 _predicateForPassPID:a4];
        v68[1] = v23;
        +[NSArray arrayWithObjects:v68 count:2];
        v25 = id v24 = a1;
        long long v26 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v25];
        long long v27 = [v24 anyInDatabase:v8 predicate:v26];

        if (!v27) {
          goto LABEL_14;
        }
        long long v28 = [v10 credentialShares];

        if (!v28) {
          goto LABEL_13;
        }
        long long v29 = [v27 passShare];
        v30 = [v29 sharedEntitlements];
        id v31 = objc_msgSend(v30, "pk_createSetByApplyingBlock:", &stru_100743DD0);

        v32 = [v10 sharedEntitlements];
        id v33 = objc_msgSend(v32, "pk_createSetByApplyingBlock:", &stru_100743DF0);

        LODWORD(v32) = [v31 isEqualToSet:v33];
        if (v32)
        {
LABEL_13:
          v34 = [v27 passShare];
          [v27 updateWithPassShare:v10 keepingNonnilValuesFrom:v34];

          v35 = [v27 valueForProperty:@"a"];
        }
        else
        {
LABEL_14:
          v36 = [[PassShare alloc] initWithPassShare:v10 forPassPID:a4 inDatabase:v8];

          v35 = [v10 identifier];
          long long v27 = v36;
        }
        id v37 = [v27 persistentID];
        v38 = [v10 sharedEntitlements];
        +[PassSharedEntitlement insertOrUpdatePassSharedEntitlements:v38 forPassSharePID:v37 inDatabase:v8];

        v39 = [v10 credentialShares];
        +[PassCredentialShare mergeInCredentialShares:v39 sharePID:v37 inDatabase:v8];

        v40 = [v10 activationOptions];
        v41 = [v40 options];
        +[PassShareActivationOption mergeInPassShareActivationOption:v41 forPassSharePID:v37 inDatabase:v8];

        [v58 addObject:v35];
        id v9 = (char *)v9 + 1;
        a1 = v57;
      }
      while (v59 != v9);
      id v59 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v59);
  }

  v42 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"a" values:v58];
  v43 = [a1 _predicateForHasCredentialShares];
  v67[0] = v43;
  [a1 _predicateForHasGroupIdentifier];
  v45 = id v44 = a1;
  v67[1] = v45;
  v46 = +[NSArray arrayWithObjects:v67 count:2];
  v47 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v46];

  v66[0] = v47;
  v48 = [v44 _predicateForNoCredentialShares];
  v66[1] = v48;
  v49 = +[NSArray arrayWithObjects:v66 count:2];
  v50 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v49];

  v65[0] = v42;
  v51 = [v44 _predicateForPassPID:a4];
  v65[1] = v51;
  v65[2] = v50;
  v52 = +[NSArray arrayWithObjects:v65 count:3];
  v53 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v52];

  v54 = [v44 queryWithDatabase:v8 predicate:v53];
  [v54 deleteAllEntities];
}

+ (BOOL)addPassShare:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 identifier];
  id v11 = [a1 _predicateForPassPID:a4];
  v22[0] = v11;
  id v12 = [a1 _predicateForShareIdentifier:v10];
  v22[1] = v12;
  uint64_t v13 = +[NSArray arrayWithObjects:v22 count:2];
  id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];
  id v15 = [a1 anyInDatabase:v9 predicate:v14];

  if (v15) {
    [(PassShare *)v15 updateWithPassShare:v8];
  }
  else {
    id v15 = [[PassShare alloc] initWithPassShare:v8 forPassPID:a4 inDatabase:v9];
  }
  id v16 = [(SQLiteEntity *)v15 persistentID];
  uint64_t v17 = [v8 sharedEntitlements];
  +[PassSharedEntitlement insertOrUpdatePassSharedEntitlements:v17 forPassSharePID:v16 inDatabase:v9];

  v18 = [v8 credentialShares];
  +[PassCredentialShare insertOrUpdatePassCredentialShares:v18 sharePID:v16 inDatabase:v9];

  v19 = [v8 activationOptions];
  int v20 = [v19 options];
  +[PassShareActivationOption insertOrUpdatePassShareActivationOption:v20 forPassSharePID:v16 inDatabase:v9];

  return v15 != 0;
}

+ (BOOL)activeExternalPassSharesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _predicateForActiveExternalShares];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];
  LOBYTE(a1) = [a1 _passSharesExistWithQuery:v6 inDatabase:v4];

  return (char)a1;
}

+ (BOOL)externalPassSharesForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForExternalSharesForPassPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  LOBYTE(a1) = [a1 _passSharesExistWithQuery:v8 inDatabase:v6];

  return (char)a1;
}

+ (id)passSharesForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _passSharesWithQuery:v8 inDatabase:v6];

  return v9;
}

+ (BOOL)passSharesExistForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  LOBYTE(a1) = [a1 _passSharesExistWithQuery:v8 inDatabase:v6];

  return (char)a1;
}

+ (id)passSharesForSubcredentialIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForSubcredentialIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _passSharesWithQuery:v8 inDatabase:v6];

  return v9;
}

+ (id)passSharesPIDsForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [a1 _predicateForPassPID:a3];
  id v9 = [a1 queryWithDatabase:v6 predicate:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002798EC;
  v12[3] = &unk_100731020;
  id v10 = v7;
  id v13 = v10;
  [v9 enumeratePersistentIDsUsingBlock:v12];

  return v10;
}

+ (id)passShareForForPassPID:(int64_t)a3 shareIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _predicateForPassPID:a3];
  v17[0] = v10;
  id v11 = [a1 _predicateForShareIdentifier:v9];

  v17[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v17 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];
  id v14 = [a1 anyInDatabase:v8 predicate:v13];

  id v15 = [v14 passShare];

  return v15;
}

+ (id)passShareForCredentialShareIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForCredentialShareIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 passShare];

  return v9;
}

+ (id)passShareForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForShareIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 passShare];

  return v9;
}

+ (int64_t)passPIDForShareIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForShareIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 valueForProperty:@"g"];
  id v10 = [v9 longLongValue];

  return (int64_t)v10;
}

+ (void)deletePassShareForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPassPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];
  [a1 _deleteForQuery:v7 inDatabase:v6];
}

+ (void)deletePassShareWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForShareIdentifier:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];
  [a1 _deleteForQuery:v7 inDatabase:v6];
}

+ (void)_deleteForQuery:(id)a3 inDatabase:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100279E0C;
  v7[3] = &unk_100731020;
  id v8 = a4;
  id v5 = v8;
  id v6 = a3;
  [v6 enumeratePersistentIDsUsingBlock:v7];
  [v6 deleteAllEntities];
}

+ (id)_passSharesWithQuery:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _propertySettersForPassShare];
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [v8 allKeys];
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100279FCC;
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

+ (BOOL)_passSharesExistWithQuery:(id)a3 inDatabase:(id)a4
{
  return [a3 exists];
}

- (id)passShare
{
  id v3 = objc_alloc_init((Class)PKPassShare);
  id v4 = [(id)objc_opt_class() _propertySettersForPassShare];
  id v5 = [v4 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10027A2C4;
  v14[3] = &unk_10072DDD8;
  v14[4] = self;
  id v15 = v4;
  id v6 = v3;
  id v16 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  id v8 = +[PassSharedEntitlement passSharedEntitlementsForPassSharePID:self->super._persistentID inDatabase:self->super._database];
  [v6 setSharedEntitlements:v8];

  id v9 = +[PassCredentialShare passCredentialSharesForSharePID:self->super._persistentID inDatabase:self->super._database];
  [v6 setCredentialShares:v9];

  id v10 = +[PassShareActivationOption passShareActivationOptionForPassSharePID:self->super._persistentID inDatabase:self->super._database];
  id v11 = [objc_alloc((Class)PKPassShareActivationOptions) initWithOptions:v10];
  [v6 setActivationOptions:v11];

  id v12 = v6;
  return v12;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"g" equalToValue:v3];

  return v4;
}

+ (id)_predicateForShareIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForGroupIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"f" equalToValue:a3];
}

+ (id)_predicateForSubcredentialIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"i" equalToValue:a3];
}

+ (id)_predicateForCredentialShareIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"kohlrabi.a" equalToValue:a3];
}

+ (id)_predicateForCredentialShareIdentifiers:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"kohlrabi.a" values:a3];
}

+ (id)_predicateForNoCredentialShares
{
  return +[SQLiteNullPredicate isNullPredicateWithProperty:@"kohlrabi.a"];
}

+ (id)_predicateForHasCredentialShares
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"kohlrabi.a"];
}

+ (id)_predicateForHasGroupIdentifier
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"f"];
}

+ (id)_predicateForExternalCredentialShare
{
  v2 = PKPassCredentialShareTargetDeviceToString();
  id v8 = v2;
  id v3 = PKPassCredentialShareTargetDeviceToString();
  id v9 = v3;
  id v4 = PKPassCredentialShareTargetDeviceToString();
  id v10 = v4;
  id v5 = +[NSArray arrayWithObjects:&v8 count:3];

  id v6 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"kohlrabi.d", v5, v8, v9 values];

  return v6;
}

+ (id)_predicateForActiveExternalShares
{
  v19 = [a1 _predicateForNoCredentialShares];
  id v3 = [a1 _predicateForExternalCredentialShare];
  id v4 = PKShareStatusToString();
  v23[0] = v4;
  id v5 = PKShareStatusToString();
  v23[1] = v5;
  id v6 = PKShareStatusToString();
  v23[2] = v6;
  id v7 = PKShareStatusToString();
  v23[3] = v7;
  id v8 = PKShareStatusToString();
  v23[4] = v8;
  id v9 = +[NSArray arrayWithObjects:v23 count:5];

  id v10 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"h" values:v9];
  id v11 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"kohlrabi.e" values:v9];
  v22[0] = v19;
  v22[1] = v10;
  id v12 = +[NSArray arrayWithObjects:v22 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  v21[0] = v3;
  v21[1] = v11;
  id v14 = +[NSArray arrayWithObjects:v21 count:2];
  id v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];

  v20[0] = v13;
  v20[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v20 count:2];
  uint64_t v17 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v16];

  return v17;
}

+ (id)_predicateForExternalSharesForPassPID:(int64_t)a3
{
  id v5 = [a1 _predicateForNoCredentialShares];
  id v6 = [a1 _predicateForExternalCredentialShare];
  v14[0] = v5;
  v14[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v14 count:2];
  id v8 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v7];

  id v9 = [a1 _predicateForPassPID:a3];
  v13[0] = v9;
  v13[1] = v8;
  id v10 = +[NSArray arrayWithObjects:v13 count:2];
  id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  return v11;
}

+ (id)_propertyValuesForPassShare:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"a"];

  id v6 = [v3 recipientNickname];
  [v4 setObjectOrNull:v6 forKey:@"b"];

  id v7 = [v3 senderShareIdentifier];
  [v4 setObjectOrNull:v7 forKey:@"c"];

  id v8 = [v3 creationDate];
  id v9 = PKW3CDateStringFromDate();
  [v4 setObjectOrNull:v9 forKey:@"d"];

  [v3 manageability];
  id v10 = PKPassShareManageabilityToString();
  [v4 setObjectOrNull:v10 forKey:@"k"];

  id v11 = [v3 groupIdentifier];
  [v4 setObjectOrNull:v11 forKey:@"f"];

  [v3 status];
  id v12 = PKShareStatusToString();
  [v4 setObjectOrNull:v12 forKey:@"h"];

  id v13 = [v3 subcredentialIdentifier];
  [v4 setObjectOrNull:v13 forKey:@"i"];

  id v14 = [v3 recipientHandle];

  [v4 setObjectOrNull:v14 forKey:@"j"];
  return v4;
}

+ (id)_propertySettersForPassShare
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_100743E30;
  v5[1] = &stru_100743E50;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_100743E70;
  v5[3] = &stru_100743E90;
  v4[4] = @"k";
  v4[5] = @"f";
  v5[4] = &stru_100743EB0;
  v5[5] = &stru_100743ED0;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100743EF0;
  v5[7] = &stru_100743F10;
  v4[8] = @"j";
  v5[8] = &stru_100743F30;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  return v2;
}

@end