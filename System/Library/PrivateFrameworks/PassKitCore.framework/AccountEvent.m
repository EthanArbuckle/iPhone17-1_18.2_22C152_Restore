@interface AccountEvent
+ (BOOL)insertOrUpdateAccountEvent:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForAccountEventExcludingTypes:(id)a3;
+ (id)_predicateForAccountEventTypes:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForAltDSID:(id)a3;
+ (id)_predicateForBillPaymentSelectedSuggestedAmountEndDate:(id)a3;
+ (id)_predicateForBillPaymentSelectedSuggestedAmountStartDate:(id)a3;
+ (id)_predicateForBillPaymentSelectedSuggestedAmountStatementIdenfitier:(id)a3;
+ (id)_predicateForEndDate:(id)a3;
+ (id)_predicateForEventTypes:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPersistentPID:(int64_t)a3;
+ (id)_predicateForRedemptionToDestination:(unint64_t)a3;
+ (id)_predicateForRewardsAddedIdentifier:(id)a3;
+ (id)_predicateForServicingActivityIdentifier:(id)a3;
+ (id)_predicateForStartDate:(id)a3;
+ (id)_predicateForSuccessfulRedemption;
+ (id)_predicateForTransactionIdentifier:(id)a3;
+ (id)_propertySettersForAccountEvent;
+ (id)accountEventWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)accountEventsForAccountIdentifier:(id)a3 altDSID:(id)a4 types:(id)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(unint64_t)a9 inDatabase:(id)a10;
+ (id)accountEventsWithAccountIdentifier:(id)a3 excludingTypes:(id)a4 inDatabase:(id)a5;
+ (id)accountEventsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)anyInDatabase:(id)a3 withPersistentID:(unint64_t)a4;
+ (id)billPaymentSelectedSuggestedAmountsWithAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 inDatabase:(id)a6;
+ (id)billPaymentSelectedSuggestedAmountsWithStatementIdenfitier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)databaseTable;
+ (id)eventIdentifiersForEventsWithServicingStatus:(unint64_t)a3 inDatabase:(id)a4;
+ (id)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 inDatabase:(id)a6;
+ (id)redemptionAccountEventWithRewardsAddedIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)redemptionAccountEventWithTransactionIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)servicingAccountEventsWithTransactionIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (unint64_t)successfulRedemptionEventsToPeerPaymentForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAccountEventWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteAccountEventsForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteAccountEventsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountEvent)initWithAccountEvent:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)accountIdentifier;
- (id)event;
- (id)identifier;
- (void)insertItemsFromEvent:(id)a3 forPersistentID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6;
- (void)updateWithAccountEvent:(id)a3;
@end

@implementation AccountEvent

+ (id)accountEventsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = +[NSMutableSet set];
  CFStringRef v21 = @"pid";
  v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1003559D4;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)accountEventsWithAccountIdentifier:(id)a3 excludingTypes:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a1 _predicateForAccountIdentifier:a3];
  v29[0] = v10;
  id v11 = [v9 allObjects];

  id v12 = [a1 _predicateForAccountEventExcludingTypes:v11];
  v29[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v29 count:2];

  v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];
  v15 = [a1 queryWithDatabase:v8 predicate:v14];

  uint64_t v16 = +[NSMutableSet set];
  CFStringRef v28 = @"pid";
  v17 = +[NSArray arrayWithObjects:&v28 count:1];
  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = sub_100355C58;
  v25 = &unk_10072ED00;
  id v26 = v8;
  id v27 = v16;
  id v18 = v16;
  id v19 = v8;
  [v15 enumeratePersistentIDsAndProperties:v17 usingBlock:&v22];

  id v20 = objc_msgSend(v18, "copy", v22, v23, v24, v25);
  return v20;
}

+ (id)accountEventsForAccountIdentifier:(id)a3 altDSID:(id)a4 types:(id)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(unint64_t)a9 inDatabase:(id)a10
{
  id v16 = a10;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  CFStringRef v21 = [a1 _predicateForAccountIdentifier:a3];
  v47[0] = v21;
  v22 = [a1 _predicateForAltDSID:v20];

  v47[1] = v22;
  uint64_t v23 = [a1 _predicateForAccountEventTypes:v19];
  v47[2] = v23;
  v24 = [a1 _predicateForStartDate:v18];

  v47[3] = v24;
  v25 = [a1 _predicateForEndDate:v17];

  v47[4] = v25;
  id v26 = [a1 _predicateForEventTypes:v19];

  v47[5] = v26;
  uint64_t v27 = +[NSArray arrayWithObjects:v47 count:6];

  CFStringRef v28 = (void *)v27;
  v29 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v27];
  CFStringRef v46 = @"d";
  v30 = +[NSArray arrayWithObjects:&v46 count:1];
  v31 = SQLiteOrderAscending;
  if (a8 != -1) {
    v31 = &SQLiteOrderDescending;
  }
  v45 = *v31;
  v32 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1, a8);
  v33 = [a1 queryWithDatabase:v16 predicate:v29 orderingProperties:v30 orderingDirections:v32 limit:a9];

  id v34 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v44 = @"pid";
  v35 = +[NSArray arrayWithObjects:&v44 count:1];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100355FF4;
  v41[3] = &unk_10072ED00;
  id v42 = v16;
  id v43 = v34;
  id v36 = v34;
  id v37 = v16;
  [v33 enumeratePersistentIDsAndProperties:v35 usingBlock:v41];

  id v38 = [v36 copy];
  return v38;
}

+ (id)redemptionAccountEventWithTransactionIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [a1 _predicateForTransactionIdentifier:v6];
    v27[0] = v8;
    id v9 = [a1 _predicateForSuccessfulRedemption];
    v27[1] = v9;
    v10 = +[NSArray arrayWithObjects:v27 count:2];
    id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

    id v12 = [a1 queryWithDatabase:v7 predicate:v11 orderingProperties:0 orderingDirections:0 limit:1];
    uint64_t v20 = 0;
    CFStringRef v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = sub_100020BCC;
    v24 = sub_1000210D8;
    id v25 = 0;
    v26[0] = @"avocados.a";
    v26[1] = @"cantaloupes.a";
    id v13 = +[NSArray arrayWithObjects:v26 count:2];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1003562E0;
    v17[3] = &unk_1007388A8;
    id v19 = &v20;
    id v18 = v7;
    [v12 enumeratePersistentIDsAndProperties:v13 usingBlock:v17];

    v14 = (void *)v21[5];
    if (v14)
    {
      v15 = [v14 event];
    }
    else
    {
      v15 = 0;
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)redemptionAccountEventWithRewardsAddedIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _predicateForRewardsAddedIdentifier:v6];
  v28[0] = v8;
  id v9 = [a1 _predicateForSuccessfulRedemption];
  v28[1] = v9;
  v10 = +[NSArray arrayWithObjects:v28 count:2];
  id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  id v12 = [a1 queryWithDatabase:v7 predicate:v11 orderingProperties:0 orderingDirections:0 limit:1];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100020BCC;
  id v25 = sub_1000210D8;
  id v26 = 0;
  v27[0] = @"avocados.a";
  v27[1] = @"jackfruits.a";
  id v13 = +[NSArray arrayWithObjects:v27 count:2];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1003565AC;
  v18[3] = &unk_1007388A8;
  uint64_t v20 = &v21;
  id v14 = v7;
  id v19 = v14;
  [v12 enumeratePersistentIDsAndProperties:v13 usingBlock:v18];

  v15 = (void *)v22[5];
  if (v15)
  {
    id v16 = [v15 event];
  }
  else
  {
    id v16 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v16;
}

+ (id)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 inDatabase:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a1 _predicateForAccountIdentifier:v10];
  v41[0] = v13;
  id v14 = [a1 _predicateForRedemptionToDestination:a3];
  v41[1] = v14;
  v15 = [a1 _predicateForAltDSID:v11];
  v41[2] = v15;
  id v16 = +[NSArray arrayWithObjects:v41 count:3];
  id v17 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v16];

  CFStringRef v40 = @"d";
  id v18 = +[NSArray arrayWithObjects:&v40 count:1];
  CFStringRef v39 = @"DESC";
  id v19 = +[NSArray arrayWithObjects:&v39 count:1];
  uint64_t v20 = [a1 queryWithDatabase:v12 predicate:v17 orderingProperties:v18 orderingDirections:v19 limit:1];

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100020BCC;
  id v36 = sub_1000210D8;
  id v37 = 0;
  CFStringRef v38 = @"avocados.a";
  uint64_t v21 = +[NSArray arrayWithObjects:&v38 count:1];
  id v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  CFStringRef v28 = sub_100356908;
  v29 = &unk_1007388A8;
  v31 = &v32;
  id v22 = v12;
  id v30 = v22;
  [v20 enumeratePersistentIDsAndProperties:v21 usingBlock:&v26];

  uint64_t v23 = (void *)v33[5];
  if (v23)
  {
    v24 = objc_msgSend(v23, "event", v26, v27, v28, v29);
  }
  else
  {
    v24 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v24;
}

+ (unint64_t)successfulRedemptionEventsToPeerPaymentForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountIdentifier:a3];
  id v8 = objc_msgSend(a1, "_predicateForRedemptionToDestination:", 1, v7);
  v14[1] = v8;
  id v9 = [a1 _predicateForSuccessfulRedemption];
  v14[2] = v9;
  id v10 = +[NSArray arrayWithObjects:v14 count:3];
  id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  unint64_t v12 = +[SQLiteEntity countInDatabase:v6 predicate:v11];
  return v12;
}

+ (id)servicingAccountEventsWithTransactionIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _predicateForAccountIdentifier:a4];
  v32[0] = v10;
  id v11 = [a1 _predicateForServicingActivityIdentifier:v9];

  v32[1] = v11;
  unint64_t v12 = +[NSArray arrayWithObjects:v32 count:2];

  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];
  CFStringRef v31 = @"tomatoes.j";
  id v14 = +[NSArray arrayWithObjects:&v31 count:1];
  CFStringRef v30 = @"DESC";
  v15 = +[NSArray arrayWithObjects:&v30 count:1];
  id v16 = [a1 queryWithDatabase:v8 predicate:v13 orderingProperties:v14 orderingDirections:v15];

  id v17 = objc_alloc_init((Class)NSMutableOrderedSet);
  CFStringRef v29 = @"pid";
  id v18 = +[NSArray arrayWithObjects:&v29 count:1];
  uint64_t v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_100356CF0;
  id v26 = &unk_10072ED00;
  id v27 = v8;
  id v19 = v17;
  id v28 = v19;
  id v20 = v8;
  [v16 enumeratePersistentIDsAndProperties:v18 usingBlock:&v23];

  if (objc_msgSend(v19, "count", v23, v24, v25, v26)) {
    id v21 = [v19 copy];
  }
  else {
    id v21 = 0;
  }

  return v21;
}

+ (id)eventIdentifiersForEventsWithServicingStatus:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithUnsignedInteger:a3];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"tomatoes.g" equalToValue:v7];

  id v9 = [a1 queryWithDatabase:v6 predicate:v8];
  id v10 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v22 = @"pid";
  id v11 = +[NSArray arrayWithObjects:&v22 count:1];
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_100356F18;
  id v19 = &unk_10072ED00;
  id v20 = v6;
  id v21 = v10;
  id v12 = v10;
  id v13 = v6;
  [v9 enumeratePersistentIDsAndProperties:v11 usingBlock:&v16];

  id v14 = objc_msgSend(v12, "copy", v16, v17, v18, v19);
  return v14;
}

+ (id)billPaymentSelectedSuggestedAmountsWithStatementIdenfitier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _predicateForAccountIdentifier:a4];
  v26[0] = v10;
  id v11 = [a1 _predicateForAccountEventTypes:&off_10078C4F8];
  v26[1] = v11;
  id v12 = [a1 _predicateForBillPaymentSelectedSuggestedAmountStatementIdenfitier:v9];

  void v26[2] = v12;
  id v13 = +[NSArray arrayWithObjects:v26 count:3];

  id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];
  v15 = [a1 queryWithDatabase:v8 predicate:v14];

  id v16 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v25 = @"pid";
  uint64_t v17 = +[NSArray arrayWithObjects:&v25 count:1];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1003571D4;
  v22[3] = &unk_10072ED00;
  id v23 = v8;
  id v18 = v16;
  id v24 = v18;
  id v19 = v8;
  [v15 enumeratePersistentIDsAndProperties:v17 usingBlock:v22];

  if ([v18 count]) {
    id v20 = [v18 copy];
  }
  else {
    id v20 = 0;
  }

  return v20;
}

+ (id)billPaymentSelectedSuggestedAmountsWithAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a1 _predicateForAccountIdentifier:a3];
  v33[0] = v13;
  id v14 = [a1 _predicateForAccountEventTypes:&off_10078C510];
  v33[1] = v14;
  v15 = [a1 _predicateForBillPaymentSelectedSuggestedAmountStartDate:v12];

  v33[2] = v15;
  id v16 = [a1 _predicateForBillPaymentSelectedSuggestedAmountEndDate:v11];

  v33[3] = v16;
  uint64_t v17 = +[NSArray arrayWithObjects:v33 count:4];

  id v18 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v17];
  id v19 = [a1 queryWithDatabase:v10 predicate:v18];

  id v20 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v32 = @"pid";
  id v21 = +[NSArray arrayWithObjects:&v32 count:1];
  id v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  id v28 = sub_1003574A4;
  CFStringRef v29 = &unk_10072ED00;
  id v30 = v10;
  id v22 = v20;
  id v31 = v22;
  id v23 = v10;
  [v19 enumeratePersistentIDsAndProperties:v21 usingBlock:&v26];

  if (objc_msgSend(v22, "count", v26, v27, v28, v29)) {
    id v24 = [v22 copy];
  }
  else {
    id v24 = 0;
  }

  return v24;
}

+ (id)accountEventWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (BOOL)insertOrUpdateAccountEvent:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [a1 accountEventWithIdentifier:v8 inDatabase:v7];

  if (v9) {
    [v9 updateWithAccountEvent:v6];
  }
  else {

  }
  return v9 == 0;
}

- (AccountEvent)initWithAccountEvent:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  id v9 = +[Account accountWithIdentifier:v8 inDatabase:v7];
  if (v9)
  {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v6, "type"), @"c");
    id v11 = [v6 altDSID];
    [v10 setObjectOrNull:v11 forKey:@"alt_dsid"];

    id v12 = [v6 identifier];
    [v10 setObjectOrNull:v12 forKey:@"b"];

    objc_msgSend(v10, "setLongLong:forKey:", objc_msgSend(v9, "persistentID"), @"a");
    id v13 = [v6 date];
    id v14 = (void *)_SQLValueForDate();
    [v10 setObjectOrNull:v14 forKey:@"d"];

    v15 = [v6 expirationDate];
    id v16 = (void *)_SQLValueForDate();
    [v10 setObjectOrNull:v16 forKey:@"e"];

    self = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v7];
    [(AccountEvent *)self insertItemsFromEvent:v6 forPersistentID:[(SQLiteEntity *)self persistentID] accountIdentifier:v8 inDatabase:v7];

    uint64_t v17 = self;
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No account found when trying to insert event with id %@", (uint8_t *)&v20, 0xCu);
    }

    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPersistentPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

- (void)insertItemsFromEvent:(id)a3 forPersistentID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v12 = [v9 items];
  id v13 = [v12 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v53;
    *(void *)&long long v14 = 138412290;
    long long v51 = v14;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        switch((unint64_t)objc_msgSend(v9, "type", v51))
        {
          case 1uLL:
          case 2uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v41 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v41;
              id v24 = v41;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKAccountRewards item: %@";
              goto LABEL_63;
            }
            id v29 = +[AccountRewards insertRewards:v18 forEventPID:a4 inDatabase:v11];
            break;
          case 3uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              id v43 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v43;
              id v24 = v43;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKCreditAccountStatement item: %@";
              goto LABEL_63;
            }
            id v32 = +[CreditAccountStatement insertCreditAccountStatement:v18 forEventPID:a4 withAccountIdentifier:v10 inDatabase:v11];
            break;
          case 4uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              CFStringRef v44 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v44;
              id v24 = v44;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKAccountServicingEvent item: %@";
              goto LABEL_63;
            }
            id v33 = +[AccountServicingEvent insertServicingEvent:v18 forEventPID:a4 inDatabase:v11];
            break;
          case 5uLL:
          case 6uLL:
          case 7uLL:
          case 8uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              id v28 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v28;
              id v24 = v28;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKAccountPayment item: %@";
              goto LABEL_63;
            }
            id v20 = +[AccountPayment insertPayment:v18 forEventPID:a4 accountIdentifier:v10 inDatabase:v11];
            break;
          case 9uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v45 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v45;
              id v24 = v45;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKAccountPaymentReminder item: %@";
              goto LABEL_63;
            }
            id v34 = +[AccountPaymentReminder insertPaymentReminder:v18 forEventPID:a4 inDatabase:v11];
            break;
          case 0xAuLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              CFStringRef v46 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v46;
              id v24 = v46;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKAccountCreditTerms item: %@";
              goto LABEL_63;
            }
            id v35 = +[AccountCreditTermsUpdate insertCreditTermsUpdate:v18 forEventPID:a4 inDatabase:v11];
            break;
          case 0xBuLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v47 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v47;
              id v24 = v47;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKAccountPhysicalCardStatusUpdate item: %@";
              goto LABEL_63;
            }
            id v36 = +[AccountPhysicalCardStatusUpdate insertPhysicalCardStatusUpdate:v18 forEventPID:a4 inDatabase:v11];
            break;
          case 0xCuLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v48 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v48;
              id v24 = v48;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKAccountPhysicalCardShippingUpdate item: %@";
              goto LABEL_63;
            }
            id v37 = +[AccountPhysicalCardShippingUpdate insertPhysicalCardShippingUpdate:v18 forEventPID:a4 inDatabase:v11];
            break;
          case 0xDuLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v49 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v49;
              id v24 = v49;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKAccountVirtualCardStatusUpdate item: %@";
              goto LABEL_63;
            }
            id v38 = +[AccountVirtualCardStatusUpdate insertVirtualCardStatusUpdate:v18 forEventPID:a4 inDatabase:v11];
            break;
          case 0xEuLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              v50 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v50;
              id v24 = v50;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKBillPaymentSelectedSuggestedAmountData item: %@";
              goto LABEL_63;
            }
            id v39 = +[AccountBillPaymentSelectedSuggestedAmountData insertBillPaymentSelectedSuggestedAmountData:v18 forEventPID:a4 inDatabase:v11];
            break;
          case 0xFuLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              id v42 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v42;
              id v24 = v42;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for AccountUserInfoUpdate item: %@";
              goto LABEL_63;
            }
            id v31 = +[AccountUserInfoUpdate insertUserInfoUpdate:v18 forEventPID:a4 inDatabase:v11];
            break;
          case 0x10uLL:
          case 0x11uLL:
          case 0x12uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              id v30 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v30;
              id v24 = v30;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKAccountAssistanceProgramMessage item: %@";
              goto LABEL_63;
            }
            id v21 = +[AccountAssistanceProgramMessage insertAssistanceProgramMessage:v18 forEventPID:a4 inDatabase:v11];
            break;
          case 0x13uLL:
          case 0x14uLL:
          case 0x15uLL:
          case 0x16uLL:
          case 0x17uLL:
          case 0x18uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              id v23 = objc_opt_class();
              *(_DWORD *)buf = v51;
              v57 = v23;
              id v24 = v23;
              CFStringRef v25 = v22;
              id v26 = "Wrong class for PKAccountTransfer item: %@";
              goto LABEL_63;
            }
            id v19 = +[AccountTransfer insertTransfer:v18 forEventPID:a4 accountIdentifier:v10 inDatabase:v11];
            break;
          case 0x19uLL:
          case 0x1AuLL:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v27 = +[AccountHold insertOrUpdateHold:v18 forEventPID:a4 accountIdentifier:v10 inDatabase:v11];
            }
            else
            {
              id v22 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                CFStringRef v40 = objc_opt_class();
                *(_DWORD *)buf = v51;
                v57 = v40;
                id v24 = v40;
                CFStringRef v25 = v22;
                id v26 = "Wrong class for PKAccountHold item: %@";
LABEL_63:
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
              }
LABEL_64:
            }
            break;
          default:
            continue;
        }
      }
      id v15 = [v12 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v15);
  }
}

- (void)updateWithAccountEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 accountIdentifier];
  id v6 = +[Account accountWithIdentifier:v5 inDatabase:self->super._database];
  if (v6)
  {
    id v7 = +[NSMutableDictionary dictionary];
    -[NSObject setInteger:forKey:](v7, "setInteger:forKey:", [v4 type], @"c");
    id v8 = [v4 altDSID];
    [v7 setObjectOrNull:v8 forKey:@"alt_dsid"];

    id v9 = [v4 date];
    id v10 = (void *)_SQLValueForDate();
    [v7 setObjectOrNull:v10 forKey:@"d"];

    id v11 = [v4 expirationDate];
    id v12 = (void *)_SQLValueForDate();
    [v7 setObjectOrNull:v12 forKey:@"e"];

    [(SQLiteEntity *)self setValuesWithDictionary:v7];
    int64_t v13 = [(SQLiteEntity *)self persistentID];
    [(SQLiteEntity *)self database];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003585EC;
    v15[3] = &unk_1007361E8;
    int64_t v20 = v13;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = self;
    id v18 = v4;
    id v19 = v5;
    id v14 = v16;
    sub_10000817C((uint64_t)v14, v15);
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No account found when trying to insert event with id %@", buf, 0xCu);
    }
  }
}

- (id)identifier
{
  return [(SQLiteEntity *)self valueForProperty:@"b"];
}

- (id)event
{
  id v3 = objc_alloc_init((Class)PKAccountEvent);
  id v4 = +[AccountEvent _propertySettersForAccountEvent];
  v5 = [v4 allKeys];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100358A90;
  uint64_t v17 = &unk_10072EDD0;
  id v6 = v4;
  id v18 = v6;
  id v7 = v3;
  id v19 = v7;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v14];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  switch((unint64_t)[v7 type])
  {
    case 1uLL:
    case 2uLL:
      uint64_t v10 = +[AccountRewards rewardsWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 3uLL:
      uint64_t v10 = +[CreditAccountStatement creditAccountStatementsWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 4uLL:
      uint64_t v10 = +[AccountServicingEvent servicingEventsWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      uint64_t v10 = +[AccountPayment paymentsWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 9uLL:
      uint64_t v10 = +[AccountPaymentReminder paymentRemindersWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 0xAuLL:
      uint64_t v10 = +[AccountCreditTermsUpdate creditTermsUpdatesWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 0xBuLL:
      uint64_t v10 = +[AccountPhysicalCardStatusUpdate physicalCardStatusUpdatesWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 0xCuLL:
      uint64_t v10 = +[AccountPhysicalCardShippingUpdate physicalCardShippingUpdatesWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 0xDuLL:
      uint64_t v10 = +[AccountVirtualCardStatusUpdate virtualCardStatusUpdatesWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 0xEuLL:
      uint64_t v10 = +[AccountBillPaymentSelectedSuggestedAmountData billPaymentSelectedSuggestedAmountDataWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 0xFuLL:
      uint64_t v10 = +[AccountUserInfoUpdate userInfoUpdatesWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      uint64_t v10 = +[AccountAssistanceProgramMessage assistanceProgramMessagesWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
      uint64_t v10 = +[AccountTransfer transfersWithEventPID:v8 inDatabase:v9];
      goto LABEL_16;
    case 0x19uLL:
    case 0x1AuLL:
      uint64_t v10 = +[AccountHold holdsWithEventPID:v8 inDatabase:v9];
LABEL_16:
      id v11 = (void *)v10;
      [v7 setItems:v10];

      break;
    default:
      break;
  }
  id v12 = v7;

  return v12;
}

- (id)accountIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"pears.a"];
}

+ (id)databaseTable
{
  return @"grapes";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (__CFString *)v5;
  CFStringRef v40 = v7;
  if (v7 == @"pears.a") {
    goto LABEL_4;
  }
  if (v7)
  {
    unsigned __int8 v8 = [(__CFString *)v7 isEqualToString:@"pears.a"];

    if (v8)
    {
LABEL_4:
      CFStringRef v9 = @"JOIN pears ON pears.pid = grapes.a";
LABEL_32:
      [v6 addObject:v9];
      goto LABEL_33;
    }
    uint64_t v10 = v40;
    if (v10 == @"jackfruits.a"
      || (id v11 = v10,
          unsigned __int8 v12 = [(__CFString *)v10 isEqualToString:@"jackfruits.a"],
          v11,
          (v12 & 1) != 0)
      || (int64_t v13 = v11, v13 == @"jackfruits.b")
      || (id v14 = v13,
          unsigned __int8 v15 = [(__CFString *)v13 isEqualToString:@"jackfruits.b"],
          v14,
          (v15 & 1) != 0))
    {
      CFStringRef v9 = @"JOIN jackfruits ON jackfruits.a = avocados.pid";
      goto LABEL_32;
    }
    id v16 = v14;
    if (v16 == @"cantaloupes.a"
      || (uint64_t v17 = v16,
          unsigned __int8 v18 = [(__CFString *)v16 isEqualToString:@"cantaloupes.a"],
          v17,
          (v18 & 1) != 0)
      || (id v19 = v17, v19 == @"cantaloupes.b")
      || (int64_t v20 = v19,
          unsigned __int8 v21 = [(__CFString *)v19 isEqualToString:@"cantaloupes.b"],
          v20,
          (v21 & 1) != 0))
    {
      CFStringRef v9 = @"JOIN cantaloupes ON cantaloupes.a = avocados.pid";
      goto LABEL_32;
    }
    id v22 = v20;
    if (v22 == @"avocados.a") {
      goto LABEL_21;
    }
    id v23 = v22;
    unsigned __int8 v24 = [(__CFString *)v22 isEqualToString:@"avocados.a"];

    if (v24) {
      goto LABEL_21;
    }
    CFStringRef v25 = v23;
    if (v25 == @"avocados.e"
      || (id v26 = v25,
          unsigned __int8 v27 = [(__CFString *)v25 isEqualToString:@"avocados.e"],
          v26,
          (v27 & 1) != 0)
      || (id v28 = v26, v28 == @"avocados.f")
      || (id v29 = v28,
          unsigned __int8 v30 = [(__CFString *)v28 isEqualToString:@"avocados.f"],
          v29,
          (v30 & 1) != 0))
    {
LABEL_21:
      CFStringRef v9 = @"JOIN avocados ON avocados.a = grapes.pid";
      goto LABEL_32;
    }
    id v31 = v29;
    if (v31 == @"tomatoes.f") {
      goto LABEL_28;
    }
    id v32 = v31;
    unsigned __int8 v33 = [(__CFString *)v31 isEqualToString:@"tomatoes.f"];

    if (v33) {
      goto LABEL_28;
    }
    id v34 = v32;
    if (v34 == @"tomatoes.j"
      || (id v35 = v34,
          unsigned __int8 v36 = [(__CFString *)v34 isEqualToString:@"tomatoes.j"],
          v35,
          (v36 & 1) != 0)
      || (id v37 = v35, v37 == @"tomatoes.g")
      || (id v38 = v37,
          unsigned __int8 v39 = [(__CFString *)v37 isEqualToString:@"tomatoes.g"],
          v38,
          (v39 & 1) != 0))
    {
LABEL_28:
      CFStringRef v9 = @"JOIN tomatoes ON tomatoes.a = grapes.pid";
      goto LABEL_32;
    }
  }
  if ((PKEqualObjects() & 1) != 0 || PKEqualObjects())
  {
    CFStringRef v9 = @"JOIN starfruits ON starfruits.a = grapes.pid";
    goto LABEL_32;
  }
LABEL_33:
}

+ (void)deleteAccountEventWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = [a1 accountEventWithIdentifier:a3 inDatabase:a4];
  if (v4)
  {
    id v5 = v4;
    [v4 deleteFromDatabase];
    id v4 = v5;
  }
}

+ (void)deleteAccountEventsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)deleteAccountEventsForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)v2 database];
  +[AccountRewards deleteRewardsWithEventPID:v3 inDatabase:v4];
  +[CreditAccountStatement deleteCreditAccountStatementForEventPID:v3 inDatabase:v4];
  +[AccountServicingEvent deleteServicingEventWithEventPID:v3 inDatabase:v4];
  +[AccountPayment deletePaymentWithEventPID:v3 inDatabase:v4];
  +[AccountPaymentReminder deletePaymentReminderWithEventPID:v3 inDatabase:v4];
  +[AccountCreditTermsUpdate deleteCreditTermsUpdatesWithEventPID:v3 inDatabase:v4];
  +[AccountPhysicalCardStatusUpdate deletePhysicalCardStatusUpdatesWithEventPID:v3 inDatabase:v4];
  +[AccountPhysicalCardShippingUpdate deletePhysicalCardShippingUpdatesWithEventPID:v3 inDatabase:v4];
  +[AccountVirtualCardStatusUpdate deleteVirtualCardStatusUpdatesWithEventPID:v3 inDatabase:v4];
  +[AccountBillPaymentSelectedSuggestedAmountData deleteBillPaymentSelectedSuggestedAmountDataPID:v3 inDatabase:v4];
  +[AccountUserInfoUpdate deleteUserInfoUpdatePID:v3 inDatabase:v4];
  +[AccountAssistanceProgramMessage deleteAssistanceProgramMessagePID:v3 inDatabase:v4];
  +[AccountTransfer deleteTransferWithEventPID:v3 inDatabase:v4];
  +[AccountHold deleteHoldWithEventPID:v3 inDatabase:v4];
  v6.receiver = v2;
  v6.super_class = (Class)AccountEvent;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

+ (id)_predicateForBillPaymentSelectedSuggestedAmountStatementIdenfitier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"starfruits.b" equalToValue:a3];
}

+ (id)_predicateForBillPaymentSelectedSuggestedAmountStartDate:(id)a3
{
  if (a3)
  {
    int64_t v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"starfruits.c" greaterThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForBillPaymentSelectedSuggestedAmountEndDate:(id)a3
{
  if (a3)
  {
    int64_t v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"starfruits.c" lessThanValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pears.a" equalToValue:a3];
}

+ (id)_predicateForAltDSID:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    +[SQLiteComparisonPredicate predicateWithProperty:@"alt_dsid" equalToValue:v3];
  }
  else {
  id v4 = +[SQLiteBooleanPredicate truePredicate];
  }

  return v4;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPersistentPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForAccountEventTypes:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"c" values:a3];
}

+ (id)_predicateForAccountEventExcludingTypes:(id)a3
{
  return +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"c" values:a3];
}

+ (id)_predicateForTransactionIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"cantaloupes.b" equalToValue:a3];
}

+ (id)_predicateForSuccessfulRedemption
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"avocados.f" equalToValue:@"success"];
}

+ (id)_predicateForRedemptionToDestination:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"avocados.e" equalToValue:v3];

  return v4;
}

+ (id)_predicateForRewardsAddedIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"jackfruits.b" equalToValue:a3];
}

+ (id)_predicateForServicingActivityIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"tomatoes.f" equalToValue:a3];
}

+ (id)_predicateForStartDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" greaterThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForEndDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" lessThanValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForEventTypes:(id)a3
{
  if (a3) {
    +[SQLiteContainsPredicate containsPredicateWithProperty:@"c" values:a3];
  }
  else {
  id v3 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v3;
}

+ (id)_propertySettersForAccountEvent
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10074ACE8;
  v5[1] = &stru_10074AD08;
  v4[2] = @"pears.a";
  v4[3] = @"d";
  v5[2] = &stru_10074AD28;
  v5[3] = &stru_10074AD48;
  v4[4] = @"e";
  v4[5] = @"f";
  v5[4] = &stru_10074AD68;
  v5[5] = &stru_10074AD88;
  v4[6] = @"alt_dsid";
  v5[6] = &stru_10074ADA8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end