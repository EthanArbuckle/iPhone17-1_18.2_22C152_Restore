@interface TransitAppletStateCommutePlan
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentPassPID:(int64_t)a3;
+ (id)_predicateForTransitAppletStatePID:(int64_t)a3;
+ (id)_propertySettersForCommutePlanItem;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertTransitAppletCommutePlan:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
+ (id)insertTransitAppletCommutePlans:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
+ (id)transitAppletCommutePlansInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5;
+ (id)transitAppletStateCommutePlansInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentPassPID:(int64_t)a3 andTransitAppletStatePID:(int64_t)a4 inDatabase:(id)a5;
+ (void)updateWithTransitAppletCommutePlans:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
- (TransitAppletStateCommutePlan)initWithTransitAppletCommutePlan:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
- (id)_valuesDictionaryForTransitAppletCommutePlan:(id)a3 paymentPassPID:(int64_t)a4 transitAppletStatePID:(int64_t)a5;
- (id)commutePlan;
@end

@implementation TransitAppletStateCommutePlan

- (TransitAppletStateCommutePlan)initWithTransitAppletCommutePlan:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  v11 = [(TransitAppletStateCommutePlan *)self _valuesDictionaryForTransitAppletCommutePlan:a3 paymentPassPID:a4 transitAppletStatePID:a5];
  v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v10];

  return v12;
}

+ (id)databaseTable
{
  return @"transit_applet_state_commute_plan";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"transit_applet_state_pid";
  }
  return 0;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"transit_applet_state.pid"] & 1) != 0
    || [v6 isEqualToString:@"transit_applet_state_pid"])
  {
    [v5 addObject:@"JOIN transit_applet_state ON transit_applet_state_commute_plan.transit_applet_state_pid = transit_applet_state.pid"];
  }
  if (([v6 isEqualToString:@"pass.pid"] & 1) != 0
    || [v6 isEqualToString:@"pass.unique_id"])
  {
    [v5 addObject:@"JOIN pass ON pass.pid = transit_applet_state_commute_plan.pass_pid"];
  }
}

+ (id)insertTransitAppletCommutePlan:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [objc_alloc((Class)a1) initWithTransitAppletCommutePlan:v11 withPaymentPassPID:a4 withTransitAppletStatePID:a5 inDatabase:v10];

  return v12;
}

+ (id)insertTransitAppletCommutePlans:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v18 = [TransitAppletStateCommutePlan alloc];
        v19 = -[TransitAppletStateCommutePlan initWithTransitAppletCommutePlan:withPaymentPassPID:withTransitAppletStatePID:inDatabase:](v18, "initWithTransitAppletCommutePlan:withPaymentPassPID:withTransitAppletStatePID:inDatabase:", v17, a4, a5, v10, (void)v22);
        [v11 safelyAddObject:v19];
      }
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  id v20 = [v11 copy];
  return v20;
}

+ (void)updateWithTransitAppletCommutePlans:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v11 = a3;
  id v9 = a6;
  if (v11 && [v11 count])
  {
    +[TransitAppletStateCommutePlan deleteEntitiesForPaymentPassPID:a4 andTransitAppletStatePID:a5 inDatabase:v9];
    id v10 = +[TransitAppletStateCommutePlan insertTransitAppletCommutePlans:v11 withPaymentPassPID:a4 withTransitAppletStatePID:a5 inDatabase:v9];
  }
}

+ (void)deleteEntitiesForPaymentPassPID:(int64_t)a3 andTransitAppletStatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _predicateForPaymentPassPID:a3];
  id v10 = [a1 _predicateForTransitAppletStatePID:a4];
  v14[0] = v9;
  v14[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v14 count:2];
  id v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

  id v13 = [a1 queryWithDatabase:v8 predicate:v12];

  [v13 deleteAllEntities];
}

+ (id)transitAppletStateCommutePlansInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [a1 _predicateForPaymentPassPID:a4];
  id v11 = [a1 _predicateForTransitAppletStatePID:a5];
  v28[0] = v10;
  v28[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v28 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  id v14 = +[SQLiteEntity queryWithDatabase:v8 predicate:v13];
  v27[0] = @"transit_applet_state.pid";
  v27[1] = @"pass.pid";
  uint64_t v15 = +[NSArray arrayWithObjects:v27 count:2];
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  long long v22 = sub_100453A0C;
  long long v23 = &unk_10072EAD8;
  id v25 = v9;
  id v26 = a1;
  id v24 = v8;
  id v16 = v9;
  id v17 = v8;
  [v14 enumeratePersistentIDsAndProperties:v15 usingBlock:&v20];

  id v18 = objc_msgSend(v16, "copy", v20, v21, v22, v23);
  return v18;
}

+ (id)transitAppletCommutePlansInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5
{
  id v5 = [a1 transitAppletStateCommutePlansInDatabase:a3 forPaymentPassPID:a4 andTransitAppletStatePID:a5];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "commutePlan", (void)v15);
        if (v12) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [v6 copy];
  return v13;
}

- (id)commutePlan
{
  id v3 = objc_alloc_init((Class)PKTransitAppletCommutePlan);
  v4 = +[TransitAppletStateCommutePlan _propertySettersForCommutePlanItem];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100453CC0;
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

- (id)_valuesDictionaryForTransitAppletCommutePlan:(id)a3 paymentPassPID:(int64_t)a4 transitAppletStatePID:(int64_t)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = +[NSNumber numberWithLongLong:a5];
  [v8 setObject:v9 forKey:@"transit_applet_state_pid"];

  uint64_t v10 = +[NSNumber numberWithLongLong:a4];
  [v8 setObject:v10 forKey:@"pass_pid"];

  id v11 = [v7 identifier];
  [v8 setObjectOrNull:v11 forKey:@"identifier"];

  id v12 = [v7 uniqueIdentifier];
  [v8 setObjectOrNull:v12 forKey:@"unique_identifier"];

  [v7 status];
  id v13 = PKTransitAppletCommutePlanStatusToString();
  [v8 setObject:v13 forKey:@"status"];

  id v14 = [v7 startDate];
  long long v15 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v15 forKey:@"start_date"];

  long long v16 = [v7 expirationDate];

  long long v17 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v17 forKey:@"expiration_date"];

  id v18 = [v8 copy];
  return v18;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForPaymentPassPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForTransitAppletStatePID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"transit_applet_state_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (id)_propertySettersForCommutePlanItem
{
  v4[0] = @"identifier";
  v4[1] = @"unique_identifier";
  v5[0] = &stru_100752500;
  v5[1] = &stru_100752520;
  v4[2] = @"status";
  v4[3] = @"start_date";
  v5[2] = &stru_100752540;
  v5[3] = &stru_100752560;
  v4[4] = @"expiration_date";
  v5[4] = &stru_100752580;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

@end