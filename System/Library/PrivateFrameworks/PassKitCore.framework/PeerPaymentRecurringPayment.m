@interface PeerPaymentRecurringPayment
+ (id)_peerPaymentRecurringPaymentsWithQuery:(id)a3 database:(id)a4;
+ (id)_predicateForHasMemo;
+ (id)_predicateForMPANIdentifier:(id)a3;
+ (id)_predicateForPeerPaymentRecurringPaymentWithIdentifier:(id)a3;
+ (id)_predicateForPeerPaymentRecurringPaymentsWithAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentRecurringPaymentWithProperties:(id)a3 effectiveProperties:(id *)a4;
+ (id)_recurringPaymentsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)anyInDatabase:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)peerPaymentRecurringPaymentForIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)peerPaymentRecurringPaymentForMPANIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)peerPaymentRecurringPaymentsForIdentifiers:(id)a3 inDatabase:(id)a4;
+ (id)peerPaymentRecurringPaymentsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)peerPaymentRecurringPaymentsForPeerPaymentType:(unint64_t)a3 withAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)recurringPaymentIdentifiersWithMemoInDatabase:(id)a3;
+ (id)recurringPaymentWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPeerPaymentRecurringPaymentIdentifiers:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPeerPaymentRecurringPaymentNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePeerPaymentRecurringPayments:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PeerPaymentRecurringPayment)initWithPeerPaymentRecurringPayment:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (void)updateWithPeerPaymentRecurringPayment:(id)a3;
@end

@implementation PeerPaymentRecurringPayment

+ (id)databaseTable
{
  return @"bokchoy";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  else {
    return 0;
  }
}

- (PeerPaymentRecurringPayment)initWithPeerPaymentRecurringPayment:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = [v9 fundingSource];
  v12 = [v9 memo];
  v13 = [v9 lastExecutedTransaction];
  v14 = [v9 identifier];
  [v10 setObjectOrNull:v14 forKey:@"a"];

  v15 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v15 forKey:@"b"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "type"), @"c");
  v16 = [v9 senderAddress];
  [v10 setObjectOrNull:v16 forKey:@"d"];

  v17 = [v9 recipientAddress];
  [v10 setObjectOrNull:v17 forKey:@"e"];

  v18 = [v9 recipientAltDSID];
  [v10 setObjectOrNull:v18 forKey:@"f"];

  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "sentByMe"), @"z");
  v19 = [v9 amount];
  v20 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v20 forKey:@"g"];

  v21 = [v9 threshold];
  v22 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v22 forKey:@"u"];

  v23 = [v9 currency];
  [v10 setObjectOrNull:v23 forKey:@"h"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "frequency"), @"o");
  v24 = [v11 dpanIdentifier];
  [v10 setObjectOrNull:v24 forKey:@"i"];

  v25 = [v11 fpanIdentifier];
  [v10 setObjectOrNull:v25 forKey:@"j"];

  v26 = [v11 mpanIdentifier];
  [v10 setObjectOrNull:v26 forKey:@"v"];

  v27 = [v11 name];
  [v10 setObjectOrNull:v27 forKey:@"k"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v11, "type"), @"l");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v11, "network"), @"m");
  v28 = [v11 suffix];
  [v10 setObjectOrNull:v28 forKey:@"n"];

  v29 = [v9 startDate];
  v30 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v30 forKey:@"p"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "status"), @"r");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "actions"), @"s");
  v31 = [v12 text];
  [v10 setObjectOrNull:v31 forKey:@"w"];

  [v12 color];
  v32 = PKSemanticColorToString();
  [v10 setObjectOrNull:v32 forKey:@"y"];

  v33 = [v12 emoji];
  [v10 setObjectOrNull:v33 forKey:@"x"];

  v34 = [v13 identifier];
  [v10 setObjectOrNull:v34 forKey:@"aa"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v13, "status"), @"ab");
  v35 = [v13 executionDate];
  v36 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v36 forKey:@"ac"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v13, "errorCode"), @"ad");
  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "usesAppleCashBalance"), @"ae");
  v37 = [v9 createdDate];
  v38 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v38 forKey:@"af"];

  v39 = [v9 upcomingPaymentDates];

  if (v39)
  {
    v40 = +[NSKeyedArchiver archivedDataWithRootObject:v39 requiringSecureCoding:1 error:0];
  }
  else
  {
    v40 = 0;
  }
  [v10 setObjectOrNull:v40 forKey:@"t"];
  v41 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v41;
}

+ (id)peerPaymentRecurringPaymentsForIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(a1, "_predicateForPeerPaymentRecurringPaymentWithIdentifier:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        v15 = [a1 _recurringPaymentsInDatabase:v7 matchingPredicate:v14];
        [v8 addObjectsFromArray:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v16 = [v8 copy];
  return v16;
}

+ (id)peerPaymentRecurringPaymentForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPeerPaymentRecurringPaymentWithIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _peerPaymentRecurringPaymentsWithQuery:v8 database:v6];

  id v10 = [v9 firstObject];

  return v10;
}

+ (id)peerPaymentRecurringPaymentForMPANIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForMPANIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _peerPaymentRecurringPaymentsWithQuery:v8 database:v6];

  id v10 = [v9 firstObject];

  return v10;
}

+ (id)recurringPaymentWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPeerPaymentRecurringPaymentWithIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)peerPaymentRecurringPaymentsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPeerPaymentRecurringPaymentsWithAccountPID:a3];
  id v8 = [a1 _recurringPaymentsInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (id)peerPaymentRecurringPaymentsForPeerPaymentType:(unint64_t)a3 withAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _predicateForPeerPaymentRecurringPaymentsWithAccountPID:a4];
  v16[0] = v9;
  id v10 = +[NSNumber numberWithUnsignedInteger:a3];
  id v11 = +[SQLiteComparisonPredicate predicateWithProperty:@"c" equalToValue:v10];
  v16[1] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v16 count:2];
  v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  v14 = [a1 _recurringPaymentsInDatabase:v8 matchingPredicate:v13];

  return v14;
}

- (void)updateWithPeerPaymentRecurringPayment:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  id v6 = [v4 fundingSource];
  id v7 = [v4 memo];
  id v8 = [v4 lastExecutedTransaction];
  id v9 = [v4 identifier];
  [v5 setObjectOrNull:v9 forKey:@"a"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "type"), @"c");
  id v10 = [v4 senderAddress];
  [v5 setObjectOrNull:v10 forKey:@"d"];

  id v11 = [v4 recipientAddress];
  [v5 setObjectOrNull:v11 forKey:@"e"];

  uint64_t v12 = [v4 recipientAltDSID];
  [v5 setObjectOrNull:v12 forKey:@"f"];

  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "sentByMe"), @"z");
  v13 = [v4 amount];
  v14 = PKCurrencyDecimalToStorageNumber();
  [v5 setObjectOrNull:v14 forKey:@"g"];

  v15 = [v4 threshold];
  id v16 = PKCurrencyDecimalToStorageNumber();
  [v5 setObjectOrNull:v16 forKey:@"u"];

  v17 = [v4 currency];
  [v5 setObjectOrNull:v17 forKey:@"h"];

  long long v18 = [v6 dpanIdentifier];
  [v5 setObjectOrNull:v18 forKey:@"i"];

  long long v19 = [v6 fpanIdentifier];
  [v5 setObjectOrNull:v19 forKey:@"j"];

  long long v20 = [v6 mpanIdentifier];
  [v5 setObjectOrNull:v20 forKey:@"v"];

  long long v21 = [v6 name];
  [v5 setObjectOrNull:v21 forKey:@"k"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v6, "type"), @"l");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v6, "network"), @"m");
  v22 = [v6 suffix];
  [v5 setObjectOrNull:v22 forKey:@"n"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "frequency"), @"o");
  v23 = [v4 startDate];
  v24 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v24 forKey:@"p"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "status"), @"r");
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v4, "actions"), @"s");
  v25 = [v8 identifier];
  [v5 setObjectOrNull:v25 forKey:@"aa"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v8, "status"), @"ab");
  v26 = [v8 executionDate];
  v27 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v27 forKey:@"ac"];

  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v8, "errorCode"), @"ad");
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v4, "usesAppleCashBalance"), @"ae");
  v28 = [v4 createdDate];
  v29 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v29 forKey:@"af"];

  if (!v7) {
    goto LABEL_14;
  }
  v30 = [(SQLiteEntity *)self valueForProperty:@"w"];
  v45 = [(SQLiteEntity *)self valueForProperty:@"x"];
  v46 = self;
  v44 = [(SQLiteEntity *)self valueForProperty:@"y"];
  v31 = [v7 text];
  [v5 setObjectOrNull:v31 forKey:@"w"];

  [v7 color];
  v32 = PKSemanticColorToString();
  [v5 setObjectOrNull:v32 forKey:@"y"];
  v33 = [v7 emoji];
  [v5 setObjectOrNull:v33 forKey:@"x"];

  v34 = [v7 text];
  if (!PKEqualObjects()) {
    goto LABEL_7;
  }
  v35 = [v7 emoji];
  if ((PKEqualObjects() & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  char v36 = PKEqualObjects();

  if ((v36 & 1) == 0)
  {
LABEL_8:
    database = v46->super._database;
    v38 = [v4 identifier];
    v39 = +[PaymentTransactionArchive anyInDatabase:database forRecurringPaymentIdentifier:v38];

    if (v39)
    {
      v40 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Memo has changed, marking as unarchived", buf, 2u);
      }

      v41 = [v39 transactionArchive];
      [v41 updateArchiveLocationsWithType:0 isArchived:0];
      [v39 updateWithTransactionArchive:v41];
    }
  }

  self = v46;
LABEL_14:
  v42 = [v4 upcomingPaymentDates];
  if (v42)
  {
    v43 = +[NSKeyedArchiver archivedDataWithRootObject:v42 requiringSecureCoding:1 error:0];
  }
  else
  {
    v43 = 0;
  }
  [v5 setObjectOrNull:v43 forKey:@"t"];
  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (void)insertOrUpdatePeerPaymentRecurringPayments:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v21;
    *(void *)&long long v10 = 138412290;
    long long v18 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "identifier", v18);
        if ([v15 length])
        {
          id v16 = [a1 _predicateForPeerPaymentRecurringPaymentWithIdentifier:v15];
          v17 = [a1 anyInDatabase:v8 predicate:v16];

          if (v17) {
            [v17 updateWithPeerPaymentRecurringPayment:v14];
          }
          else {
            v17 = [objc_alloc((Class)a1) initWithPeerPaymentRecurringPayment:v14 forPeerPaymentAccountPID:a4 inDatabase:v8];
          }
        }
        else
        {
          v17 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v25 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Attempting to insert invalid recurring payment %@", buf, 0xCu);
          }
        }
      }
      id v11 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v11);
  }
}

+ (id)recurringPaymentIdentifiersWithMemoInDatabase:(id)a3
{
  id v4 = a3;
  v5 = [a1 _predicateForHasMemo];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  id v7 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v14 = @"a";
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100485BFC;
  v12[3] = &unk_100731258;
  id v13 = v7;
  id v9 = v7;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:v12];

  id v10 = [v9 copy];
  return v10;
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)self database];
  +[PaymentTransactionArchive deleteArchiveForRecurringPaymentPID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)PeerPaymentRecurringPayment;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (void)deleteEntitiesForPeerPaymentRecurringPaymentIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [a1 _predicateForPeerPaymentRecurringPaymentWithIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)];
        id v13 = [a1 queryWithDatabase:v7 predicate:v12];
        [v13 deleteAllEntities];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

+ (void)deleteEntitiesForPeerPaymentRecurringPaymentNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"a" values:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPeerPaymentRecurringPaymentsWithAccountPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"b"];
  id v6 = [a1 anyInDatabase:v4 predicate:v5];

  return v6;
}

+ (id)_predicateForPeerPaymentRecurringPaymentWithIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForMPANIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"v" equalToValue:a3];
}

+ (id)_predicateForPeerPaymentRecurringPaymentsWithAccountPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)_predicateForHasMemo
{
  v2 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"w"];
  v7[0] = v2;
  int64_t v3 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"x"];
  v7[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v7 count:2];
  v5 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v4];

  return v5;
}

+ (id)_recurringPaymentsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = [a1 queryWithDatabase:v6 predicate:a4];
  id v8 = [a1 _peerPaymentRecurringPaymentsWithQuery:v7 database:v6];

  return v8;
}

+ (id)_peerPaymentRecurringPaymentsWithQuery:(id)a3 database:(id)a4
{
  id v18 = 0;
  v19[0] = @"i";
  v19[1] = @"j";
  v19[2] = @"v";
  v19[3] = @"k";
  v19[4] = @"l";
  v19[5] = @"m";
  v19[6] = @"n";
  v19[7] = @"w";
  v19[8] = @"y";
  v19[9] = @"x";
  v19[10] = @"aa";
  v19[11] = @"ab";
  v19[12] = @"ac";
  v19[13] = @"ad";
  id v5 = a3;
  id v6 = +[NSArray arrayWithObjects:v19 count:14];
  id v7 = [a1 _propertySettersForPeerPaymentRecurringPaymentWithProperties:v6 effectiveProperties:&v18];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = v18;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1004863F4;
  v14[3] = &unk_10072EAD8;
  id v16 = v8;
  id v17 = a1;
  id v15 = v7;
  id v10 = v8;
  id v11 = v7;
  [v5 enumeratePersistentIDsAndProperties:v9 usingBlock:v14];

  id v12 = [v10 copy];
  return v12;
}

+ (id)_propertySettersForPeerPaymentRecurringPaymentWithProperties:(id)a3 effectiveProperties:(id *)a4
{
  id v5 = a3;
  if (a4)
  {
    v23[0] = @"a";
    v23[1] = @"c";
    v24[0] = &stru_100753E40;
    v24[1] = &stru_100753E60;
    v23[2] = @"d";
    v23[3] = @"e";
    v24[2] = &stru_100753E80;
    v24[3] = &stru_100753EA0;
    v23[4] = @"f";
    v23[5] = @"z";
    v24[4] = &stru_100753EC0;
    v24[5] = &stru_100753EE0;
    v23[6] = @"g";
    v23[7] = @"u";
    v24[6] = &stru_100753F00;
    v24[7] = &stru_100753F20;
    v23[8] = @"h";
    v23[9] = @"o";
    v24[8] = &stru_100753F40;
    v24[9] = &stru_100753F60;
    v23[10] = @"p";
    v23[11] = @"r";
    v24[10] = &stru_100753F80;
    v24[11] = &stru_100753FA0;
    v23[12] = @"s";
    v23[13] = @"t";
    v24[12] = &stru_100753FC0;
    v24[13] = &stru_100753FE0;
    v23[14] = @"ae";
    v23[15] = @"af";
    v24[14] = &stru_100754000;
    v24[15] = &stru_100754020;
    id v6 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:16];
    id v7 = [v6 allKeys];
    id v8 = [v7 mutableCopy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v8, "indexOfObject:", v14, (void)v18) == (id)0x7FFFFFFFFFFFFFFFLL) {
            [v8 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v15 = [v8 copy];
    id v16 = *a4;
    *a4 = v15;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end