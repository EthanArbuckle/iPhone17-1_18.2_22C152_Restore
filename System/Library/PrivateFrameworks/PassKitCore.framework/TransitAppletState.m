@interface TransitAppletState
+ (id)_predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)allStatesInDatabase:(id)a3;
+ (id)anyInDatabase:(id)a3 withPaymentApplicationPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertTransitAppletState:(id)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)transitAppletStateInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4;
- (TransitAppletState)initWithTransitAppletState:(id)a3 forPaymentApplicationPID:(unint64_t)a4 inDatabase:(id)a5;
- (id)_valuesDictionaryForAppletState:(id)a3;
- (id)paymentTransactionIdentifier;
- (id)transitAppletState;
- (int64_t)paymentPassPid;
- (void)setPaymentTransactionIdentifier:(id)a3;
- (void)updateWithAppletState:(id)a3;
@end

@implementation TransitAppletState

+ (id)databaseTable
{
  return @"transit_applet_state";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"payment_application.aid"] & 1) != 0
    || ([v6 isEqualToString:@"payment_application.seid"] & 1) != 0
    || ([v6 isEqualToString:@"payment_application.pass_pid"] & 1) != 0
    || [v6 isEqualToString:@"payment_application.pid"])
  {
    [v5 addObject:@"JOIN payment_application ON transit_applet_state.payment_application_pid = payment_application.pid"];
  }
  if ([v6 isEqualToString:@"pass.pid"]) {
    [v5 addObject:@"JOIN pass ON pass.pid = payment_application.pass_pid"];
  }
}

+ (id)anyInDatabase:(id)a3 withPaymentApplicationPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPaymentApplicationPID:a4];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)_predicateForPaymentApplicationPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application_pid" equalToValue:v3];

  return v4;
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

+ (id)insertTransitAppletState:(id)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [objc_alloc((Class)a1) initWithTransitAppletState:v8 forPaymentApplicationPID:a4 inDatabase:v9];
  id v11 = [v10 persistentID];
  id v12 = [v10 paymentPassPid];
  v13 = [v8 balances];
  v14 = v13;
  if (v13 && [v13 count]) {
    id v15 = +[TransitAppletStateBalance insertTransitAppletBalances:v14 withPaymentPassPID:v12 withTransitAppletStatePID:v11 inDatabase:v9];
  }
  v16 = [v8 commutePlans];
  v17 = v16;
  if (v16 && [v16 count]) {
    id v18 = +[TransitAppletStateCommutePlan insertTransitAppletCommutePlans:v17 withPaymentPassPID:v12 withTransitAppletStatePID:v11 inDatabase:v9];
  }

  return v10;
}

+ (void)deleteEntitiesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v16 = a4;
  id v6 = [a1 _predicateForPaymentApplicationPID:a3];
  v7 = [a1 queryWithDatabase:v16 predicate:v6];
  [v7 deleteAllEntities];
  id v8 = [a1 anyInDatabase:v16 predicate:v6];
  id v9 = [v8 transitAppletState];
  id v10 = [v8 persistentID];
  id v11 = [v8 paymentPassPid];
  id v12 = [v9 balances];
  v13 = v12;
  if (v12 && [v12 count]) {
    +[TransitAppletStateBalance deleteEntitiesForPaymentPassPID:v11 andTransitAppletStatePID:v10 inDatabase:v16];
  }
  v14 = [v9 commutePlans];
  id v15 = v14;
  if (v14 && [v14 count]) {
    +[TransitAppletStateCommutePlan deleteEntitiesForPaymentPassPID:v11 andTransitAppletStatePID:v10 inDatabase:v16];
  }
}

+ (id)allStatesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v6 = +[SQLiteEntity queryWithDatabase:v4 predicate:0];
  v17[0] = @"payment_application.pid";
  v17[1] = @"pass.pid";
  v7 = +[NSArray arrayWithObjects:v17 count:2];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10036F9B8;
  v13[3] = &unk_10072EAD8;
  id v16 = a1;
  id v14 = v4;
  id v8 = v5;
  id v15 = v8;
  id v9 = v4;
  [v6 enumeratePersistentIDsAndProperties:v7 usingBlock:v13];

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)transitAppletStateInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = objc_alloc_init((Class)NSMutableSet);
  id v15 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:v13];

  id v16 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.seid" equalToValue:v12];

  v17 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.aid" equalToValue:v11];

  v32[0] = v15;
  v32[1] = v16;
  v32[2] = v17;
  id v18 = +[NSArray arrayWithObjects:v32 count:3];
  v19 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v18];
  v20 = +[SQLiteEntity queryWithDatabase:v10 predicate:v19];

  v31[0] = @"payment_application.pid";
  v31[1] = @"pass.pid";
  v21 = +[NSArray arrayWithObjects:v31 count:2];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10036FC74;
  v27[3] = &unk_10072EAD8;
  id v30 = a1;
  id v28 = v10;
  id v22 = v14;
  id v29 = v22;
  id v23 = v10;
  [v20 enumeratePersistentIDsAndProperties:v21 usingBlock:v27];

  v24 = v29;
  id v25 = v22;

  return v25;
}

- (TransitAppletState)initWithTransitAppletState:(id)a3 forPaymentApplicationPID:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [(TransitAppletState *)self _valuesDictionaryForAppletState:a3];
  id v10 = +[NSNumber numberWithUnsignedLongLong:a4];
  [v9 setObject:v10 forKeyedSubscript:@"payment_application_pid"];

  id v11 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];
  return v11;
}

- (void)updateWithAppletState:(id)a3
{
  id v4 = a3;
  id v5 = [(TransitAppletState *)self _valuesDictionaryForAppletState:v4];
  [(SQLiteEntity *)self setValuesWithDictionary:v5];

  id v10 = [(SQLiteEntity *)self database];
  id v6 = [v4 balances];
  v7 = [v4 commutePlans];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  int64_t v9 = [(TransitAppletState *)self paymentPassPid];
  +[TransitAppletStateBalance updateWithTransitAppletBalances:v6 forPaymentPassPID:v9 andTransitAppletStatePID:v8 inDatabase:v10];
  +[TransitAppletStateCommutePlan updateWithTransitAppletCommutePlans:v7 forPaymentPassPID:v9 andTransitAppletStatePID:v8 inDatabase:v10];
}

- (id)_valuesDictionaryForAppletState:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSNull null];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isBlacklisted]);
  [v4 setObject:v6 forKeyedSubscript:@"blacklisted"];

  v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 appletStateDirty]);
  [v4 setObject:v7 forKeyedSubscript:@"applet_state_dirty"];

  uint64_t v8 = [v3 historySequenceNumber];
  int64_t v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = v5;
  }
  [v4 setObject:v10 forKeyedSubscript:@"history_sequence_number"];

  id v11 = [v3 balance];
  id v12 = PKCurrencyDecimalToStorageNumber();
  [v4 setObject:v12 forKeyedSubscript:@"balance"];

  uint64_t v13 = [v3 loyaltyBalance];
  id v14 = (void *)v13;
  if (v13) {
    id v15 = (void *)v13;
  }
  else {
    id v15 = v5;
  }
  [v4 setObject:v15 forKeyedSubscript:@"loyalty_balance"];

  uint64_t v16 = [v3 currency];
  v17 = (void *)v16;
  if (v16) {
    id v18 = (void *)v16;
  }
  else {
    id v18 = v5;
  }
  [v4 setObject:v18 forKeyedSubscript:@"currency"];

  v19 = [v3 expirationDate];
  uint64_t v20 = PKDateToStorageValue();
  v21 = (void *)v20;
  if (v20) {
    id v22 = (void *)v20;
  }
  else {
    id v22 = v5;
  }
  [v4 setObject:v22 forKeyedSubscript:@"expiration_date"];

  id v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 needsStationProcessing]);
  [v4 setObject:v23 forKeyedSubscript:@"needs_station_processing"];

  uint64_t v24 = [v3 serverRefreshIdentifier];
  id v25 = (void *)v24;
  if (v24) {
    v26 = (void *)v24;
  }
  else {
    v26 = v5;
  }
  [v4 setObject:v26 forKeyedSubscript:@"last_refresh_sequence_number"];

  v27 = [v3 enrouteTransitTypes];

  if (v27)
  {
    id v28 = +[NSKeyedArchiver archivedDataWithRootObject:v27 requiringSecureCoding:1 error:0];
  }
  else
  {
    id v28 = 0;
  }
  if (v28) {
    id v29 = v28;
  }
  else {
    id v29 = v5;
  }
  [v4 setObject:v29 forKeyedSubscript:@"en_route_flags"];

  return v4;
}

- (id)paymentTransactionIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"payment_transaction_identifier"];
}

- (void)setPaymentTransactionIdentifier:(id)a3
{
  if (a3)
  {
    -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:");
  }
  else
  {
    id v4 = +[NSNull null];
    [(SQLiteEntity *)self setValue:v4 forProperty:@"payment_transaction_identifier"];
  }
}

- (int64_t)paymentPassPid
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100020C3C;
  id v11 = sub_100021110;
  id v12 = 0;
  v13[0] = @"pass.pid";
  v13[1] = @"payment_application.pid";
  id v3 = +[NSArray arrayWithObjects:v13 count:2];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100370320;
  v6[3] = &unk_100744CF8;
  v6[4] = &v7;
  [(SQLiteEntity *)self getValuesForProperties:v3 withApplier:v6];

  id v4 = [(id)v8[5] longLongValue];
  _Block_object_dispose(&v7, 8);

  return (int64_t)v4;
}

+ (id)_propertySetters
{
  v4[0] = @"history_sequence_number";
  v4[1] = @"balance";
  v5[0] = &stru_10074B868;
  v5[1] = &stru_10074B888;
  v4[2] = @"loyalty_balance";
  v4[3] = @"blacklisted";
  v5[2] = &stru_10074B8A8;
  v5[3] = &stru_10074B8C8;
  v4[4] = @"currency";
  v4[5] = @"applet_state_dirty";
  v5[4] = &stru_10074B8E8;
  v5[5] = &stru_10074B908;
  v4[6] = @"expiration_date";
  v4[7] = @"needs_station_processing";
  v5[6] = &stru_10074B928;
  v5[7] = &stru_10074B948;
  v4[8] = @"last_refresh_sequence_number";
  v4[9] = @"en_route_flags";
  v5[8] = &stru_10074B968;
  v5[9] = &stru_10074B988;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:10];
  return v2;
}

- (id)transitAppletState
{
  id v3 = objc_alloc_init((Class)PKTransitAppletState);
  id v4 = +[TransitAppletState _propertySetters];
  id v5 = [v4 allKeys];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100370BC8;
  v56[3] = &unk_10072EDD0;
  id v6 = v4;
  id v57 = v6;
  id v7 = v3;
  id v58 = v7;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v56];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  int64_t v9 = [(TransitAppletState *)self paymentPassPid];
  id v10 = [(SQLiteEntity *)self database];
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = +[TransitAppletStateBalance transitAppletBalancesInDatabase:v10 forPaymentPassPID:v9 andTransitAppletStatePID:v8];
  objc_msgSend(v11, "pk_safelyAddObjectsFromArray:", v12);
  if (![v11 count])
  {
    v37 = v12;
    int64_t v38 = v8;
    id v40 = v7;
    id v41 = v6;
    v39 = v10;
    int64_t v36 = v9;
    uint64_t v13 = +[PaymentBalance paymentBalancesInDatabase:v10 forPassPID:v9];
    id v14 = +[NSCalendar currentCalendar];
    id v15 = +[NSDate distantFuture];
    v35 = v14;
    v47 = [v14 components:252 fromDate:v15];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v13;
    id v44 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v44)
    {
      uint64_t v43 = *(void *)v53;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v53 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v46 = v16;
          v17 = *(void **)(*((void *)&v52 + 1) + 8 * v16);
          id v18 = [v17 identifiers];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          v45 = v18;
          v19 = [v18 allObjects];
          id v20 = [v19 countByEnumeratingWithState:&v48 objects:v59 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v49;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                uint64_t v24 = v11;
                if (*(void *)v49 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v25 = *(void *)(*((void *)&v48 + 1) + 8 * i);
                id v26 = objc_alloc((Class)PKTransitAppletBalance);
                v27 = [v17 value];
                id v28 = [v17 currencyCode];
                id v29 = objc_msgSend(v26, "initWithIdentifier:balance:currency:exponent:expirationDate:", v25, v27, v28, objc_msgSend(v17, "exponent"), v47);

                id v11 = v24;
                [v24 addObject:v29];
              }
              id v21 = [v19 countByEnumeratingWithState:&v48 objects:v59 count:16];
            }
            while (v21);
          }

          uint64_t v16 = v46 + 1;
        }
        while ((id)(v46 + 1) != v44);
        id v44 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v44);
    }

    id v7 = v40;
    id v6 = v41;
    int64_t v8 = v38;
    id v10 = v39;
    int64_t v9 = v36;
    id v12 = v37;
  }
  id v30 = [v11 copy];
  [v7 setBalances:v30];

  v31 = +[TransitAppletStateCommutePlan transitAppletCommutePlansInDatabase:v10 forPaymentPassPID:v9 andTransitAppletStatePID:v8];
  id v32 = [v31 copy];
  [v7 setCommutePlans:v32];

  id v33 = v7;
  return v33;
}

@end