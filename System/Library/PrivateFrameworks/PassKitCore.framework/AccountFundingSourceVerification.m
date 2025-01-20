@interface AccountFundingSourceVerification
+ (BOOL)deleteVerificationForAccountFundingDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_optionsFromString:(id)a3;
+ (id)_optionsToString:(id)a3;
+ (id)_predicateForAccountFundingDetailsPID:(int64_t)a3;
+ (id)_predicateForPersistentID:(int64_t)a3;
+ (id)_propertyValuesForVerification:(id)a3 pendingAttemptPID:(id)a4 failedAttemptPID:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateVerification:(id)a3 forAccountFundingDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)verificationForAccountFundingDetailsPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountFundingSourceVerification)initWithVerification:(id)a3 forFundingDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_failedAttemptPID;
- (id)_pendingAttemptPID;
- (id)_propertySetters;
- (id)_setVerificationAttempt:(id)a3 forPID:(id)a4 inDatabase:(id)a5;
- (id)_verification;
- (void)updateVerification:(id)a3;
@end

@implementation AccountFundingSourceVerification

+ (id)databaseTable
{
  return @"account_funding_source_verification";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"account_funding_details_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdateVerification:(id)a3 forAccountFundingDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = [a1 _predicateForAccountFundingDetailsPID:a4];
    id v11 = [a1 anyInDatabase:v9 predicate:v10];

    if (v11) {
      [v11 updateVerification:v8];
    }
    else {
      id v11 = [objc_alloc((Class)objc_opt_class()) initWithVerification:v8 forFundingDetailsPID:a4 inDatabase:v9];
    }
    v12 = [v11 _verification];
  }
  else
  {
    [a1 deleteVerificationForAccountFundingDetailsPID:a4 inDatabase:v9];
    v12 = 0;
  }

  return v12;
}

- (AccountFundingSourceVerification)initWithVerification:(id)a3 forFundingDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 pendingAttempt];
  id v11 = [(AccountFundingSourceVerification *)self _setVerificationAttempt:v10 forPID:0 inDatabase:v9];

  v12 = [v8 failedAttempt];
  v13 = [(AccountFundingSourceVerification *)self _setVerificationAttempt:v12 forPID:0 inDatabase:v9];

  if (!v11)
  {
    v14 = 0;
    if (v13) {
      goto LABEL_3;
    }
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v14 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 persistentID]);
  if (!v13) {
    goto LABEL_5;
  }
LABEL_3:
  v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v13 persistentID]);
LABEL_6:
  v16 = [(id)objc_opt_class() _propertyValuesForVerification:v8 pendingAttemptPID:v14 failedAttemptPID:v15];
  v17 = +[NSNumber numberWithLongLong:a4];
  [v16 setObjectOrNull:v17 forKey:@"account_funding_details_pid"];

  v18 = [(SQLiteEntity *)self initWithPropertyValues:v16 inDatabase:v9];
  v19 = [v8 recoveryActions];
  id v20 = +[AccountFundingSourceVerificationAction insertOrUpdateVerificationActions:v19 forAccountFundingSourceVerificationPID:[(SQLiteEntity *)v18 persistentID] inDatabase:v9];

  return v18;
}

- (void)updateVerification:(id)a3
{
  id v19 = a3;
  v4 = [v19 pendingAttempt];
  v5 = [(AccountFundingSourceVerification *)self _pendingAttemptPID];
  v6 = [(SQLiteEntity *)self database];
  v7 = [(AccountFundingSourceVerification *)self _setVerificationAttempt:v4 forPID:v5 inDatabase:v6];

  id v8 = [v19 failedAttempt];
  id v9 = [(AccountFundingSourceVerification *)self _failedAttemptPID];
  v10 = [(SQLiteEntity *)self database];
  id v11 = [(AccountFundingSourceVerification *)self _setVerificationAttempt:v8 forPID:v9 inDatabase:v10];

  if (v7)
  {
    v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v7 persistentID]);
    if (v11)
    {
LABEL_3:
      v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 persistentID]);
      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
    if (v11) {
      goto LABEL_3;
    }
  }
  v13 = 0;
LABEL_6:
  v14 = [(id)objc_opt_class() _propertyValuesForVerification:v19 pendingAttemptPID:v12 failedAttemptPID:v13];
  [(SQLiteEntity *)self setValuesWithDictionary:v14];
  v15 = [v19 recoveryActions];
  int64_t v16 = [(SQLiteEntity *)self persistentID];
  v17 = [(SQLiteEntity *)self database];
  id v18 = +[AccountFundingSourceVerificationAction insertOrUpdateVerificationActions:v15 forAccountFundingSourceVerificationPID:v16 inDatabase:v17];
}

- (id)_setVerificationAttempt:(id)a3 forPID:(id)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    v10 = +[AccountFundingSourceVerificationAttempt insertOrUpdateVerificationAttempt:v7 forPID:v8 inDatabase:v9];
  }
  else
  {
    if (v8) {
      +[AccountFundingSourceVerificationAttempt deleteVerificationAttemptForPID:v8 inDatabase:v9];
    }
    v10 = 0;
  }

  return v10;
}

+ (id)verificationForAccountFundingDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountFundingDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 _verification];

  return v9;
}

+ (BOOL)deleteVerificationForAccountFundingDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountFundingDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 _pendingAttemptPID];
  uint64_t v10 = [v8 _failedAttemptPID];
  id v11 = (void *)v10;
  if (!v9)
  {
    unsigned int v12 = 1;
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unsigned int v12 = +[AccountFundingSourceVerificationAttempt deleteVerificationAttemptForPID:v9 inDatabase:v6];
  if (v11) {
LABEL_3:
  }
    v12 &= +[AccountFundingSourceVerificationAttempt deleteVerificationAttemptForPID:v11 inDatabase:v6];
LABEL_4:
  unsigned int v13 = +[AccountFundingSourceVerificationAction deleteVerificationActionsForAccountFundingSourceVerificationPID:inDatabase:](AccountFundingSourceVerificationAction, "deleteVerificationActionsForAccountFundingSourceVerificationPID:inDatabase:", [v8 persistentID], v6);
  unsigned __int8 v14 = 0;
  if (v12 && v13) {
    unsigned __int8 v14 = [v8 deleteFromDatabase];
  }

  return v14;
}

+ (id)_predicateForAccountFundingDetailsPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_funding_details_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPersistentID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

- (id)_verification
{
  id v3 = objc_alloc_init((Class)PKAccountFundingSourceVerification);
  v4 = [(AccountFundingSourceVerification *)self _propertySetters];
  v5 = [v4 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100379808;
  v14[3] = &unk_10072DDD8;
  v14[4] = self;
  id v15 = v4;
  id v6 = v3;
  id v16 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  uint64_t v10 = +[AccountFundingSourceVerificationAction verificationActionsForFundingSourceVerificationPID:v8 inDatabase:v9];
  [v6 setRecoveryActions:v10];

  id v11 = v16;
  id v12 = v6;

  return v12;
}

- (id)_pendingAttemptPID
{
  return [(SQLiteEntity *)self valueForProperty:@"pending_attempt_pid"];
}

- (id)_failedAttemptPID
{
  return [(SQLiteEntity *)self valueForProperty:@"failed_attempt_pid"];
}

+ (id)_propertyValuesForVerification:(id)a3 pendingAttemptPID:(id)a4 failedAttemptPID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 status]);
  [v11 setObjectOrNull:v12 forKey:@"status"];

  unsigned int v13 = [v10 options];

  unsigned __int8 v14 = [a1 _optionsToString:v13];
  [v11 setObjectOrNull:v14 forKey:@"options"];

  [v11 setObjectOrNull:v9 forKey:@"pending_attempt_pid"];
  [v11 setObjectOrNull:v8 forKey:@"failed_attempt_pid"];

  return v11;
}

+ (id)_optionsToString:(id)a3
{
  id v3 = objc_msgSend(a3, "pk_arrayByApplyingBlock:", &stru_10074BE38);
  v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

+ (id)_optionsFromString:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@","];
  v4 = objc_msgSend(v3, "pk_arrayByApplyingBlock:", &stru_10074BE58);

  return v4;
}

- (id)_propertySetters
{
  v12[0] = &stru_10074BE98;
  v11[0] = @"status";
  v11[1] = @"options";
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100379CE4;
  v10[3] = &unk_10074BEC0;
  v10[4] = self;
  id v3 = objc_retainBlock(v10);
  v12[1] = v3;
  v11[2] = @"pending_attempt_pid";
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100379D68;
  v9[3] = &unk_10074BEC0;
  v9[4] = self;
  v4 = objc_retainBlock(v9);
  v12[2] = v4;
  v11[3] = @"failed_attempt_pid";
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100379E08;
  v8[3] = &unk_10074BEC0;
  v8[4] = self;
  v5 = objc_retainBlock(v8);
  v12[3] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v6;
}

@end