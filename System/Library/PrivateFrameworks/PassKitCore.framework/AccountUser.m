@interface AccountUser
+ (id)_accountUsersWithQuery:(id)a3;
+ (id)_predicateForAccessLevel:(unint64_t)a3;
+ (id)_predicateForAccountPID:(id)a3;
+ (id)_predicateForAltDSID:(id)a3;
+ (id)_predicateForAltDSID:(id)a3 accountPID:(id)a4;
+ (id)_predicateForAppleID:(id)a3;
+ (id)_predicateForLikeAddressableHandle:(id)a3;
+ (id)_propertySettersForAccountUser;
+ (id)_propertyValuesForAccountUser:(id)a3;
+ (id)_transactionSourceIdentifiersForAccountUserPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)accountUserForAccountPID:(id)a3 handle:(id)a4 inDatabase:(id)a5;
+ (id)accountUsersByAccountIdentifierInDatabase:(id)a3;
+ (id)accountUsersForAccountPID:(id)a3 accessLevel:(unint64_t)a4 inDatabase:(id)a5;
+ (id)accountUsersForAccountPID:(id)a3 inDatabase:(id)a4;
+ (id)anyInDatabase:(id)a3 withAltDSID:(id)a4 accountPID:(int64_t)a5;
+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountUser:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateAccountUsers:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
+ (int64_t)countOfActivePrimaryUsersForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAccountUserWithAltDSID:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
+ (void)deleteAccountUsersForAccountPID:(id)a3 inDatabase:(id)a4;
- (AccountUser)initWithAccountUser:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (BOOL)isCurrentUser;
- (id)accountIdentifier;
- (id)accountUser;
- (id)altDSID;
- (id)transactionSourceIdentifier;
- (void)updateWithAccountUser:(id)a3;
@end

@implementation AccountUser

+ (id)databaseTable
{
  return @"gooseberry";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"transaction_source_pid";
  }
  return 0;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v13 = v7;
  if (v7 == @"transaction_source.identifier") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_6;
  }
  unsigned __int8 v8 = [@"transaction_source.identifier" isEqualToString:v7];

  if (v8)
  {
LABEL_4:
    CFStringRef v9 = @"LEFT OUTER JOIN transaction_source ON transaction_source.pid = gooseberry.transaction_source_pid";
LABEL_5:
    [v6 addObject:v9];
    goto LABEL_6;
  }
  v10 = v13;
  if (v10 == @"pears.a"
    || (v11 = v10, unsigned int v12 = [@"pears.a" isEqualToString:v10], v11, v12))
  {
    CFStringRef v9 = @"JOIN pears ON pears.pid = gooseberry.a";
    goto LABEL_5;
  }
LABEL_6:
}

- (AccountUser)initWithAccountUser:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(id)objc_opt_class() _propertyValuesForAccountUser:v8];
  id v12 = [v11 mutableCopy];

  [v12 setObjectOrNull:v9 forKey:@"a"];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100020BEC;
  v29 = sub_1000210E8;
  id v30 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10035F94C;
  v19[3] = &unk_1007466F0;
  v24 = &v25;
  v13 = self;
  v20 = v13;
  id v14 = v12;
  id v21 = v14;
  id v15 = v10;
  id v22 = v15;
  id v16 = v8;
  id v23 = v16;
  sub_10000817C((uint64_t)v15, v19);
  v17 = (AccountUser *)(id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v17;
}

+ (id)insertOrUpdateAccountUser:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 altDSID];
  id v12 = [a1 _predicateForAltDSID:v11 accountPID:v9];
  id v13 = [a1 anyInDatabase:v10 predicate:v12];

  if (v13) {
    [v13 updateWithAccountUser:v8];
  }
  else {
    id v13 = [objc_alloc((Class)a1) initWithAccountUser:v8 forAccountPID:v9 inDatabase:v10];
  }
  id v14 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v13 persistentID]);
  id v15 = [v8 supportedFeatures];
  +[CreditAccountFeatureDescriptor updateCreditAccountFeatureDescriptors:v15 forAccountUserPID:v14 inDatabase:v10];

  id v16 = [v8 preferences];
  id v17 = +[AccountUserPreferences insertOrUpdateAccountUserPreferences:v16 forAccountUserPID:v14 inDatabase:v10];

  v18 = [v8 notificationSettings];
  if (!v18)
  {
    v19 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v13 persistentID]);
    v20 = +[AccountUserNotificationSettings anyInDatabase:v10 forAccountUserPID:v19];
    id v21 = [v20 accountUserNotificationSettings];
    id v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = +[PKAccountUserNotificationSettings defaultNotificationSettings];
    }
    v18 = v23;
  }
  id v24 = +[AccountUserNotificationSettings insertOrUpdateAccountUserNotificationSettings:v18 forAccountUserPID:v14 inDatabase:v10];

  return v13;
}

+ (id)insertOrUpdateAccountUsers:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  id v12 = [objc_alloc((Class)NSMutableSet) initWithCapacity:v11];
  id v28 = [objc_alloc((Class)NSMutableSet) initWithCapacity:v11];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v19 = [a1 insertOrUpdateAccountUser:v18 forAccountPID:v9 inDatabase:v10];
        if (v19)
        {
          [v28 addObject:v19];
          v20 = [v18 altDSID];
          objc_msgSend(v12, "pk_safelyAddObject:", v20);
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v15);
  }

  id v21 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"c" values:v12];
  v33[0] = v21;
  id v22 = [a1 _predicateForAccountPID:v9];
  v33[1] = v22;
  id v23 = +[NSArray arrayWithObjects:v33 count:2];
  id v24 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v23];

  uint64_t v25 = [a1 queryWithDatabase:v10 predicate:v24];
  [v25 deleteAllEntities];
  id v26 = [v28 copy];

  return v26;
}

+ (id)accountUsersForAccountPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _accountUsersWithQuery:v8];

  return v9;
}

+ (id)accountUsersForAccountPID:(id)a3 accessLevel:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _predicateForAccountPID:a3];
  v16[0] = v9;
  id v10 = [a1 _predicateForAccessLevel:a4];
  v16[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v16 count:2];
  id v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

  id v13 = [a1 queryWithDatabase:v8 predicate:v12];

  id v14 = [a1 _accountUsersWithQuery:v13];

  return v14;
}

+ (id)accountUserForAccountPID:(id)a3 handle:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [a1 _predicateForAppleID:v9];
  v23[0] = v11;
  id v12 = [a1 _predicateForLikeAddressableHandle:v9];

  v23[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v23 count:2];
  id v14 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v13];

  id v15 = [a1 _predicateForAccountPID:v10];

  v22[0] = v15;
  v22[1] = v14;
  uint64_t v16 = +[NSArray arrayWithObjects:v22 count:2];
  id v17 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v16];

  v18 = [a1 queryWithDatabase:v8 predicate:v17];

  v19 = [a1 _accountUsersWithQuery:v18];
  v20 = [v19 anyObject];

  return v20;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(int64_t)a4
{
  id v6 = a3;
  v7 = +[NSNumber numberWithLongLong:a4];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_source_pid" equalToValue:v7];
  id v9 = [a1 anyInDatabase:v6 predicate:v8];

  return v9;
}

+ (id)anyInDatabase:(id)a3 withAltDSID:(id)a4 accountPID:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSNumber numberWithLongLong:a5];
  id v11 = [a1 _predicateForAccountPID:v10];
  v17[0] = v11;
  id v12 = [a1 _predicateForAltDSID:v8];

  v17[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v17 count:2];
  id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];
  id v15 = [a1 anyInDatabase:v9 predicate:v14];

  return v15;
}

+ (id)accountUsersByAccountIdentifierInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[Account databaseTable];
  id v6 = [a1 databaseTable];
  v7 = +[Account databaseTable];
  id v8 = [a1 databaseTable];
  id v9 = +[Account databaseTable];
  id v10 = +[NSString stringWithFormat:@"SELECT DISTINCT %@.pid, %@ FROM %@, %@ WHERE %@.%@ = %@.pid", v5, @"pears.a", v6, v7, v8, @"a", v9];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003605F8;
  v15[3] = &unk_10073AA38;
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  id v18 = a1;
  id v16 = v4;
  id v11 = v17;
  id v12 = v4;
  sub_100012DC8((uint64_t)v12, v10, v15);
  id v13 = [v11 copy];

  return v13;
}

+ (int64_t)countOfActivePrimaryUsersForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v5 = a4;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003607D4;
  v8[3] = &unk_10073AEC0;
  v8[4] = &v9;
  v8[5] = a3;
  sub_1000128B8((uint64_t)v5, @"SELECT d FROM gooseberry WHERE a = ? AND b = ?", 1, v8);
  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (void)deleteAccountUsersForAccountPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteAccountUserWithAltDSID:(id)a3 forAccountPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = [a1 _predicateForAltDSID:a3 accountPID:a4];
  uint64_t v9 = [a1 queryWithDatabase:v8 predicate:v10];

  [v9 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = [(SQLiteEntity *)self database];
  id v4 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)v2 persistentID]];
  +[CreditAccountFeatureDescriptor deleteCreditAccountFeatureDescriptorsForAccountUserPID:v4 inDatabase:v3];
  id v5 = +[AccountUserPreferences anyInDatabase:v3 forAccountUserPID:v4];
  [v5 deleteFromDatabase];

  +[TransactionSource deleteEntitiesInDatabase:v3 forAccountUser:v2];
  id v6 = +[AccountUserNotificationSettings anyInDatabase:v3 forAccountUserPID:v4];
  [v6 deleteFromDatabase];

  v8.receiver = v2;
  v8.super_class = (Class)AccountUser;
  LOBYTE(v2) = [(SQLiteEntity *)&v8 deleteFromDatabase];

  return (char)v2;
}

- (id)accountUser
{
  id v3 = objc_alloc_init((Class)PKAccountUser);
  id v4 = [(id)objc_opt_class() _propertySettersForAccountUser];
  id v5 = [v4 allKeys];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100360D0C;
  v21[3] = &unk_10072DDD8;
  v21[4] = self;
  id v6 = v4;
  id v22 = v6;
  id v7 = v3;
  id v23 = v7;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v21];

  objc_super v8 = [(SQLiteEntity *)self database];
  uint64_t v9 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)self persistentID]];
  id v10 = +[CreditAccountFeatureDescriptor creditAccountFeatureDescriptorsForAccountUserPID:v9 inDatabase:v8];
  [v7 setSupportedFeatures:v10];
  uint64_t v11 = +[AccountUserPreferences anyInDatabase:v8 forAccountUserPID:v9];
  uint64_t v12 = [v11 accountUserPreferences];

  [v7 setPreferences:v12];
  objc_msgSend(v7, "setCurrentUser:", -[AccountUser isCurrentUser](self, "isCurrentUser"));
  id v13 = +[AccountUserNotificationSettings anyInDatabase:v8 forAccountUserPID:v9];
  id v14 = [v13 accountUserNotificationSettings];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[PKAccountUserNotificationSettings defaultNotificationSettings];
  }
  id v17 = v16;

  [v7 setNotificationSettings:v17];
  id v18 = objc_msgSend((id)objc_opt_class(), "_transactionSourceIdentifiersForAccountUserPID:inDatabase:", -[SQLiteEntity persistentID](self, "persistentID"), v8);
  [v7 setTransactionSourceIdentifiers:v18];
  id v19 = v7;

  return v19;
}

- (id)transactionSourceIdentifier
{
  id v3 = [(SQLiteEntity *)self database];
  id v4 = [(SQLiteEntity *)self valueForProperty:@"transaction_source_pid"];
  id v5 = +[TransactionSource anyInDatabase:withPersistentID:](TransactionSource, "anyInDatabase:withPersistentID:", v3, [v4 longLongValue]);
  id v6 = [v5 identifier];

  return v6;
}

- (id)accountIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"pears.a"];
}

- (id)altDSID
{
  return [(SQLiteEntity *)self valueForProperty:@"c"];
}

- (BOOL)isCurrentUser
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"c"];
  char v3 = PKAltDSIDIsCurrentUser();

  return v3;
}

- (void)updateWithAccountUser:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForAccountUser:v4];
  id v6 = [v4 appleID];

  id v7 = [v6 length];
  if (!v7)
  {
    objc_super v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error: there is no appleID defined on the account user. Using the last cached value", v11, 2u);
    }

    id v9 = [v5 mutableCopy];
    [v9 removeObjectForKey:@"i"];
    [v9 removeObjectForKey:@"j"];
    id v10 = [v9 copy];

    id v5 = v10;
  }
  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForAltDSID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"c" equalToValue:a3];
}

+ (id)_predicateForAccountPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForAccessLevel:(unint64_t)a3
{
  char v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)_predicateForAppleID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"i" equalToValue:a3];
}

+ (id)_predicateForLikeAddressableHandle:(id)a3
{
  return +[SQLiteStringLikePredicate predicateWithProperty:@"j" matchingPattern:a3];
}

+ (id)_predicateForAltDSID:(id)a3 accountPID:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAltDSID:a3];
  objc_super v8 = [a1 _predicateForAccountPID:v6];

  v12[0] = v7;
  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_accountUsersWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForAccountUser];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [v5 allKeys];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_100361264;
  id v16 = &unk_10072DE00;
  id v17 = v5;
  id v18 = v4;
  id v19 = v6;
  id v20 = a1;
  id v8 = v6;
  id v9 = v4;
  id v10 = v5;
  [v9 enumeratePersistentIDsAndProperties:v7 usingBlock:&v13];

  id v11 = objc_msgSend(v8, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)_transactionSourceIdentifiersForAccountUserPID:(int64_t)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [(SQLiteEntity *)[AccountUser alloc] initWithPersistentID:a3 inDatabase:v5];
  uint64_t v8 = [(SQLiteEntity *)v7 valueForProperty:@"transaction_source.identifier"];
  if (v8) {
    [v6 addObject:v8];
  }
  id v23 = (void *)v8;
  id v9 = [(SQLiteEntity *)v7 valueForProperty:@"pears.a"];
  id v10 = +[Account anyInDatabase:v5 withIdentifier:v9];

  id v22 = v10;
  id v11 = [v10 previousAccountIdentifiers];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = +[Account anyInDatabase:v5 withIdentifier:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        id v17 = [(AccountUser *)v7 altDSID];
        id v18 = +[AccountUser anyInDatabase:withAltDSID:accountPID:](AccountUser, "anyInDatabase:withAltDSID:accountPID:", v5, v17, [v16 persistentID]);

        id v19 = [v18 transactionSourceIdentifier];
        if (v19) {
          [v6 addObject:v19];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
  if ([v6 count]) {
    id v20 = [v6 copy];
  }
  else {
    id v20 = 0;
  }

  return v20;
}

+ (id)_propertyValuesForAccountUser:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "accessLevel"), @"b");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "identityStatus"), @"k");
  id v5 = [v3 altDSID];
  [v4 setObjectOrNull:v5 forKey:@"c"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "accountState"), @"d");
  id v6 = [v3 firstName];
  [v4 setObjectOrNull:v6 forKey:@"e"];

  id v7 = [v3 lastName];
  [v4 setObjectOrNull:v7 forKey:@"f"];

  uint64_t v8 = [v3 appleID];
  [v4 setObjectOrNull:v8 forKey:@"i"];

  id v9 = [v3 addressableHandles];
  id v10 = [v9 allObjects];
  id v11 = [v10 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v11 forKey:@"j"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "isDirty"), @"g");
  id v12 = [v3 lastUpdated];

  id v13 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v13 forKey:@"h"];

  id v14 = [v4 copy];
  return v14;
}

+ (id)_propertySettersForAccountUser
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10074AEF8;
  v5[1] = &stru_10074AF18;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_10074AF38;
  v5[3] = &stru_10074AF58;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_10074AF78;
  v5[5] = &stru_10074AF98;
  v4[6] = @"h";
  v4[7] = @"pears.a";
  v5[6] = &stru_10074AFB8;
  v5[7] = &stru_10074AFD8;
  v4[8] = @"i";
  v4[9] = @"k";
  v5[8] = &stru_10074AFF8;
  v5[9] = &stru_10074B018;
  v4[10] = @"j";
  v5[10] = &stru_10074B038;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:11];
  return v2;
}

@end