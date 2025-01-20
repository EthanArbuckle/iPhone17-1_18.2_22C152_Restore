@interface PendingProvisioning
+ (BOOL)deletePendingProvisioningInDatabase:(id)a3 ofType:(id)a4 withUniqueIdentifier:(id)a5;
+ (BOOL)hasPendingProvisioningsInDatabase:(id)a3 ofTypes:(id)a4;
+ (id)_pendingProvisioningsInDatabase:(id)a3 forQuery:(id)a4;
+ (id)_predicateForNoReceipt;
+ (id)_predicateForStatus:(int64_t)a3;
+ (id)_predicateForType:(id)a3;
+ (id)_predicateForTypes:(id)a3;
+ (id)_predicateForUniqueIdentifier:(id)a3 type:(id)a4;
+ (id)_propertySetters;
+ (id)allPendingProvisioningsInDatabase:(id)a3;
+ (id)databaseTable;
+ (id)insertPendingProvisioning:(id)a3 inDatabase:(id)a4;
+ (id)pendingProvisioningInDatabase:(id)a3 ofType:(id)a4 withUniqueIdentifier:(id)a5;
+ (id)pendingProvisioningsInDatabase:(id)a3 ofType:(id)a4;
+ (id)pendingProvisioningsInDatabase:(id)a3 ofTypes:(id)a4;
+ (id)pendingProvisioningsInDatabase:(id)a3 withStatus:(int64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)markInProgressPendingProvisioningsAsAvailableInDatabase:(id)a3;
- (BOOL)deleteFromDatabase;
- (PendingProvisioning)initWithPendingProvisioning:(id)a3 inDatabase:(id)a4;
- (id)pendingProvisioning;
@end

@implementation PendingProvisioning

+ (BOOL)hasPendingProvisioningsInDatabase:(id)a3 ofTypes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[PendingProvisioning _predicateForNoReceipt];
  v13[0] = v8;
  v9 = [a1 _predicateForTypes:v6];

  v13[1] = v9;
  v10 = +[NSArray arrayWithObjects:v13 count:2];
  v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  LOBYTE(a1) = [a1 existsInDatabase:v7 predicate:v11];
  return (char)a1;
}

+ (id)_predicateForTypes:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020648;
  v6[3] = &unk_10074B618;
  v6[4] = a1;
  v3 = objc_msgSend(a3, "pk_arrayByApplyingBlock:", v6);
  v4 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v3];

  return v4;
}

+ (id)_predicateForNoReceipt
{
  return +[SQLiteNullPredicate isNullPredicateWithProperty:@"pending_provisioning_receipt.f"];
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"pending_provisioning_receipt.f"]) {
    [v5 addObject:@"LEFT JOIN pending_provisioning_receipt ON onion.pid = pending_provisioning_receipt.f"];
  }
}

+ (id)databaseTable
{
  return @"onion";
}

+ (id)_predicateForType:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:a3];
}

- (PendingProvisioning)initWithPendingProvisioning:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = [v7 type];
  [v8 setObjectOrNull:v9 forKey:@"type"];

  v10 = [v7 uniqueIdentifier];
  [v8 setObjectOrNull:v10 forKey:@"uniqueIdentifier"];

  [v7 status];
  v11 = PKPendingProvisioningStatusToString();
  [v8 setObjectOrNull:v11 forKey:@"status"];

  v12 = [v7 createdAt];
  v13 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v13 forKey:@"created_at"];

  v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 shouldAutoProvision]);
  [v8 setObjectOrNull:v14 forKey:@"should_auto_provision"];

  v15 = [v7 provisioningState];
  v16 = +[NSKeyedArchiver archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];
  [v8 setObjectOrNull:v16 forKey:@"provisioning_state"];

  id v17 = [v7 provisioningAttemptCounter];
  v18 = +[NSNumber numberWithUnsignedInteger:v17];
  [v8 setObjectOrNull:v18 forKey:@"provisioning_attempt_counter"];

  v19 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v19;
}

+ (id)insertPendingProvisioning:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uniqueIdentifier];
  if ([v8 length])
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = sub_100020C1C;
    v21 = sub_100021100;
    id v22 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100368904;
    v11[3] = &unk_10072E090;
    id v12 = v6;
    id v16 = a1;
    id v13 = v7;
    id v14 = v8;
    v15 = &v17;
    sub_10000817C((uint64_t)v13, v11);
    id v9 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)allPendingProvisioningsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[PendingProvisioning _predicateForNoReceipt];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  id v7 = [a1 _pendingProvisioningsInDatabase:v4 forQuery:v6];

  return v7;
}

+ (id)pendingProvisioningsInDatabase:(id)a3 ofType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PendingProvisioning _predicateForNoReceipt];
  v15[0] = v8;
  id v9 = [a1 _predicateForType:v6];

  v15[1] = v9;
  v10 = +[NSArray arrayWithObjects:v15 count:2];
  v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  id v12 = [a1 queryWithDatabase:v7 predicate:v11];
  id v13 = [a1 _pendingProvisioningsInDatabase:v7 forQuery:v12];

  return v13;
}

+ (id)pendingProvisioningsInDatabase:(id)a3 ofTypes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PendingProvisioning _predicateForNoReceipt];
  v15[0] = v8;
  id v9 = [a1 _predicateForTypes:v6];

  v15[1] = v9;
  v10 = +[NSArray arrayWithObjects:v15 count:2];
  v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  id v12 = [a1 queryWithDatabase:v7 predicate:v11];
  id v13 = [a1 _pendingProvisioningsInDatabase:v7 forQuery:v12];

  return v13;
}

+ (id)pendingProvisioningsInDatabase:(id)a3 withStatus:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[PendingProvisioning _predicateForNoReceipt];
  v14[0] = v7;
  id v8 = [a1 _predicateForStatus:a4];
  v14[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v14 count:2];
  v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  v11 = [a1 queryWithDatabase:v6 predicate:v10];
  id v12 = [a1 _pendingProvisioningsInDatabase:v6 forQuery:v11];

  return v12;
}

+ (id)pendingProvisioningInDatabase:(id)a3 ofType:(id)a4 withUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = [a1 _predicateForUniqueIdentifier:a5 type:a4];
  v10 = [a1 queryWithDatabase:v8 predicate:v9];

  v11 = [a1 _pendingProvisioningsInDatabase:v8 forQuery:v10];

  id v12 = [v11 firstObject];

  return v12;
}

+ (void)markInProgressPendingProvisioningsAsAvailableInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _predicateForStatus:2];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100369084;
  v8[3] = &unk_100731020;
  id v9 = v4;
  id v7 = v4;
  [v6 enumeratePersistentIDsUsingBlock:v8];
}

+ (BOOL)deletePendingProvisioningInDatabase:(id)a3 ofType:(id)a4 withUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 _predicateForUniqueIdentifier:v10 type:v9];
  id v12 = [a1 queryWithDatabase:v8 predicate:v11 orderingProperties:0 orderingDirections:0 limit:1];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_10036925C;
  v15[3] = &unk_100749300;
  id v13 = v8;
  id v16 = v13;
  uint64_t v17 = &v18;
  [v12 enumeratePersistentIDsUsingBlock:v15];
  LOBYTE(v11) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v11;
}

+ (id)_pendingProvisioningsInDatabase:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _propertySetters];
  id v9 = [v8 allKeys];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10036940C;
  v16[3] = &unk_10074B5F8;
  id v20 = [v9 indexOfObject:@"type"];
  id v21 = a1;
  id v17 = v6;
  id v18 = v8;
  id v19 = objc_alloc_init((Class)NSMutableArray);
  id v10 = v19;
  id v11 = v8;
  id v12 = v6;
  [v7 enumeratePersistentIDsAndProperties:v9 usingBlock:v16];

  if ([v10 count]) {
    id v13 = v10;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (id)pendingProvisioning
{
  v3 = objc_opt_class();
  id v4 = [(SQLiteEntity *)self database];
  id v5 = [(SQLiteEntity *)self valueForProperty:@"type"];
  id v6 = [(SQLiteEntity *)self valueForProperty:@"uniqueIdentifier"];
  id v7 = [v3 pendingProvisioningInDatabase:v4 ofType:v5 withUniqueIdentifier:v6];

  return v7;
}

+ (id)_predicateForUniqueIdentifier:(id)a3 type:(id)a4
{
  id v6 = a4;
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"uniqueIdentifier" equalToValue:a3];
  id v8 = [a1 _predicateForType:v6];

  v12[0] = v8;
  v12[1] = v7;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForStatus:(int64_t)a3
{
  v3 = PKPendingProvisioningStatusToString();
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"status" equalToValue:v3];

  return v4;
}

- (BOOL)deleteFromDatabase
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"type"];
  int64_t v4 = [(SQLiteEntity *)self persistentID];
  if ([v3 isEqualToString:PKPendingProvisioningTypeCarKey])
  {
    id v5 = off_10072C2C8;
LABEL_15:
    [(__objc2_class *)*v5 deleteEntitiesForBasePendingProvisioningPID:v4 inDatabase:self->super._database];
    goto LABEL_16;
  }
  if ([v3 isEqualToString:PKPendingProvisioningTypePaymentRemoteCredential])
  {
    id v5 = off_10072C2D8;
    goto LABEL_15;
  }
  if ([v3 isEqualToString:PKPendingProvisioningTypeShareableCredential])
  {
    id v5 = off_10072C2E8;
    goto LABEL_15;
  }
  if ([v3 isEqualToString:PKPendingProvisioningTypeAccountCredential])
  {
    id v5 = off_10072C2C0;
    goto LABEL_15;
  }
  if ([v3 isEqualToString:PKPendingProvisioningTypeStatefulTransfer])
  {
    id v5 = &off_10072C2F0;
    goto LABEL_15;
  }
  if ([v3 isEqualToString:PKPendingProvisioningTypePrecursorPass])
  {
    id v5 = off_10072C2E0;
    goto LABEL_15;
  }
  if ([v3 isEqualToString:PKPendingProvisioningTypeIdentityCredential])
  {
    id v5 = off_10072C2D0;
    goto LABEL_15;
  }
LABEL_16:
  v8.receiver = self;
  v8.super_class = (Class)PendingProvisioning;
  BOOL v6 = [(SQLiteEntity *)&v8 deleteFromDatabase];

  return v6;
}

+ (id)_propertySetters
{
  v4[0] = @"type";
  v4[1] = @"uniqueIdentifier";
  v5[0] = &stru_10074B658;
  v5[1] = &stru_10074B678;
  v4[2] = @"status";
  v4[3] = @"created_at";
  v5[2] = &stru_10074B698;
  v5[3] = &stru_10074B6B8;
  v4[4] = @"should_auto_provision";
  v4[5] = @"provisioning_state";
  v5[4] = &stru_10074B6D8;
  v5[5] = &stru_10074B6F8;
  v4[6] = @"provisioning_attempt_counter";
  v5[6] = &stru_10074B718;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end