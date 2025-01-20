@interface AppletStateDirty
+ (id)_predicateForAppletStateDirtyPID:(int64_t)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentApplication:(id)a3;
+ (id)_predicateForPaymentApplications:(id)a3;
+ (id)_predicateForSetOfAppletStateDirtyPIDs:(id)a3;
+ (id)_predicateForTransitAppletStateDirty:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForTransitAppletStatesDirty:(id)a3 inDatabase:(id)a4;
+ (id)_propertySettersForAppletStateDirty;
+ (id)anyInDatabase:(id)a3 forTransitAppletStateDirty:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)dirtyAppletStatesInDatabase:(id)a3;
+ (id)dirtyAppletStatesInDatabase:(id)a3 fromSetOfTransitAppletStatesDirty:(id)a4;
+ (id)insertAppletStateDirtyForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateAppletStateDirtyForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (int64_t)countInDatabase:(id)a3;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForAppletState:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForAppletStateDirtyPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForSetOfAppletStateDirtyPIDs:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForSetOfAppletStates:(id)a3 inDatabase:(id)a4;
- (AppletStateDirty)initWithTransitAppletStateDirty:(id)a3 inDatabase:(id)a4;
- (id)dirtyAppletState;
- (id)passUniqueIdentifier;
- (int64_t)paymentApplicationPID;
@end

@implementation AppletStateDirty

- (AppletStateDirty)initWithTransitAppletStateDirty:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = [v7 passUniqueIdentifier];
  v10 = [v7 secureElementIdentifier];
  v11 = [v7 applicationIdentifier];

  v12 = +[PaymentApplication anyInDatabase:v6 withPassUniqueIdentifier:v9 secureElementIdentifier:v10 paymentApplicationIdentifier:v11];

  v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 persistentID]);
  [v8 setObjectOrNull:v13 forKey:@"payment_application_pid"];

  v16.receiver = self;
  v16.super_class = (Class)AppletStateDirty;
  v14 = [(SQLiteEntity *)&v16 initWithPropertyValues:v8 inDatabase:v6];

  return v14;
}

+ (id)databaseTable
{
  return @"applet_state_dirty";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"payment_application_pid";
  }
  else {
    return 0;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if ([v6 isEqualToString:@"pass.unique_id"]) {
    [v5 addObject:@"JOIN pass ON pass.pid = payment_application.pass_pid"];
  }
  if (([v6 isEqualToString:@"payment_application.pid"] & 1) != 0
    || ([v6 isEqualToString:@"payment_application.aid"] & 1) != 0
    || ([v6 isEqualToString:@"payment_application.seid"] & 1) != 0
    || [v6 isEqualToString:@"payment_application.dpan_id"])
  {
    [v5 addObject:@"JOIN payment_application ON payment_application.pid = applet_state_dirty.payment_application_pid"];
  }
}

+ (id)insertAppletStateDirtyForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithTransitAppletStateDirty:v7 inDatabase:v6];

  return v8;
}

+ (id)insertOrUpdateAppletStateDirtyForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 anyInDatabase:v7 forTransitAppletStateDirty:v6];
  if (!v8) {
    id v8 = [objc_alloc((Class)a1) initWithTransitAppletStateDirty:v6 inDatabase:v7];
  }

  return v8;
}

+ (void)deleteEntitiesForAppletStateDirtyPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAppletStateDirtyPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForSetOfAppletStateDirtyPIDs:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForSetOfAppletStateDirtyPIDs:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForSetOfAppletStates:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForTransitAppletStatesDirty:a3 inDatabase:v6];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForAppletState:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForTransitAppletStateDirty:a3 inDatabase:v6];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (int64_t)countInDatabase:(id)a3
{
  return (int64_t)[a1 countInDatabase:a3 predicate:0];
}

+ (id)anyInDatabase:(id)a3 forTransitAppletStateDirty:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForTransitAppletStateDirty:a4 inDatabase:v6];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)dirtyAppletStatesInDatabase:(id)a3 fromSetOfTransitAppletStatesDirty:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForTransitAppletStatesDirty:a4 inDatabase:v6];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = objc_alloc_init((Class)NSMutableSet);
  v22[0] = @"pass.unique_id";
  v22[1] = @"payment_application.pid";
  v10 = +[NSArray arrayWithObjects:v22 count:2];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1003D384C;
  v18 = &unk_10072EAD8;
  id v20 = v9;
  id v21 = a1;
  id v19 = v6;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)dirtyAppletStatesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [a1 queryWithDatabase:v4 predicate:0];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  v19[0] = @"pass.unique_id";
  v19[1] = @"payment_application.pid";
  id v7 = +[NSArray arrayWithObjects:v19 count:2];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_1003D3A20;
  v15 = &unk_10072EAD8;
  id v17 = v6;
  id v18 = a1;
  id v16 = v4;
  id v8 = v6;
  id v9 = v4;
  [v5 enumeratePersistentIDsAndProperties:v7 usingBlock:&v12];

  id v10 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
  return v10;
}

- (id)passUniqueIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"pass.unique_id"];
}

- (int64_t)paymentApplicationPID
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"payment_application.pid"];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (id)dirtyAppletState
{
  id v3 = objc_alloc_init((Class)PKTransitAppletStateDirty);
  id v4 = +[AppletStateDirty _propertySettersForAppletStateDirty];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003D3BC8;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_propertySettersForAppletStateDirty
{
  v4[0] = @"pass.unique_id";
  v4[1] = @"payment_application.aid";
  v5[0] = &stru_10074F188;
  v5[1] = &stru_10074F1A8;
  v4[2] = @"payment_application.seid";
  v4[3] = @"payment_application.dpan_id";
  v5[2] = &stru_10074F1C8;
  v5[3] = &stru_10074F1E8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)_predicateForTransitAppletStateDirty:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 passUniqueIdentifier];
  id v9 = [v7 secureElementIdentifier];
  id v10 = [v7 applicationIdentifier];

  id v11 = +[PaymentApplication anyInDatabase:v6 withPassUniqueIdentifier:v8 secureElementIdentifier:v9 paymentApplicationIdentifier:v10];

  id v12 = [a1 _predicateForPaymentApplication:v11];

  return v12;
}

+ (id)_predicateForTransitAppletStatesDirty:(id)a3 inDatabase:(id)a4
{
  id v5 = +[PaymentApplication paymentApplicationsInDatabase:a4 forTransitAppletStatesDirty:a3];
  id v6 = [a1 _predicateForPaymentApplications:v5];

  return v6;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (id)_predicateForPaymentApplication:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForAppletStateDirtyPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForSetOfAppletStateDirtyPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"pid" values:a3];
}

+ (id)_predicateForPaymentApplications:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v3, "allObjects", 0);
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [*(id *)(*((void *)&v13 + 1) + 8 * i) persistentID]);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"payment_application.pid" values:v4];

  return v11;
}

@end