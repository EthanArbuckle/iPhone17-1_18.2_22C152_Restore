@interface PeerPaymentPendingRequest
+ (id)_peerPaymentPendingRequestsWithQuery:(id)a3;
+ (id)_pendingRequestsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_predicateForPeerPaymentPendingRequestWithAccountPID:(int64_t)a3;
+ (id)_predicateForPeerPaymentPendingRequestWithRequestToken:(id)a3;
+ (id)_propertySettersForPeerPaymentPendingRequestWithProperties:(id)a3 effectiveProperties:(id *)a4;
+ (id)anyInDatabase:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)peerPaymentPendingRequestsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)peerPaymentPendingRequestsForRequestTokens:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForRequestTokens:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PeerPaymentPendingRequest)initWithPeerPaymentPendingRequest:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (void)updateWithPeerPaymentPendingRequest:(id)a3;
@end

@implementation PeerPaymentPendingRequest

+ (id)databaseTable
{
  return @"peer_payment_requests";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"request_token";
  }
  else {
    return 0;
  }
}

- (PeerPaymentPendingRequest)initWithPeerPaymentPendingRequest:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = [v9 currencyAmount];
  v12 = [v11 amount];
  v13 = PKCurrencyDecimalToStorageNumber();

  v14 = [v9 requestToken];
  [v10 setObjectOrNull:v14 forKey:@"request_token"];

  v15 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v15 forKey:@"peer_payment_account_pid"];

  v16 = [v9 requesterAddress];
  [v10 setObjectOrNull:v16 forKey:@"requester_address"];

  v17 = [v9 requesteeAddress];
  [v10 setObjectOrNull:v17 forKey:@"requestee_address"];

  [v10 setObjectOrNull:v13 forKey:@"amount"];
  v18 = [v9 currencyAmount];
  v19 = [v18 currency];
  [v10 setObjectOrNull:v19 forKey:@"currency"];

  v20 = [v9 memo];
  [v10 setObjectOrNull:v20 forKey:@"memo"];

  v21 = [v9 sessionID];
  [v10 setObjectOrNull:v21 forKey:@"session_id"];

  v22 = [v9 expiryDate];
  v23 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v23 forKey:@"expiry_date"];

  v24 = [v9 actions];
  v25 = [v24 componentsJoinedByString:@"-"];
  [v10 setObjectOrNull:v25 forKey:@"actions"];

  v26 = [v9 requestDate];
  v27 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v27 forKey:@"request_date"];

  v28 = [v9 lastDismissedDate];
  v29 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v29 forKey:@"last_dismissed_date"];

  v30 = [v9 status];

  [v10 setObjectOrNull:v30 forKey:@"status"];
  v31 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v31;
}

+ (id)peerPaymentPendingRequestsForRequestTokens:(id)a3 inDatabase:(id)a4
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
        v14 = objc_msgSend(a1, "_predicateForPeerPaymentPendingRequestWithRequestToken:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        v15 = [a1 _pendingRequestsInDatabase:v7 matchingPredicate:v14];
        [v8 addObjectsFromArray:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v16 = [v8 copy];
  return v16;
}

+ (id)peerPaymentPendingRequestsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPeerPaymentPendingRequestWithAccountPID:a3];
  id v8 = [a1 _pendingRequestsInDatabase:v6 matchingPredicate:v7];

  return v8;
}

- (void)updateWithPeerPaymentPendingRequest:(id)a3
{
  id v31 = a3;
  v4 = +[NSMutableDictionary dictionary];
  v5 = [v31 currencyAmount];
  id v6 = [v5 amount];
  id v7 = PKCurrencyDecimalToStorageNumber();

  id v8 = [v31 requestToken];
  [v4 setObjectOrNull:v8 forKey:@"request_token"];

  id v9 = [v31 requesterAddress];
  [v4 setObjectOrNull:v9 forKey:@"requester_address"];

  id v10 = [v31 requesteeAddress];
  [v4 setObjectOrNull:v10 forKey:@"requestee_address"];

  [v4 setObjectOrNull:v7 forKey:@"amount"];
  id v11 = [v31 currencyAmount];
  uint64_t v12 = [v11 currency];
  [v4 setObjectOrNull:v12 forKey:@"currency"];

  v13 = [v31 memo];

  if (v13)
  {
    v14 = [v31 memo];
    [v4 setObjectOrNull:v14 forKey:@"memo"];
  }
  v15 = [v31 sessionID];

  if (v15)
  {
    id v16 = [v31 sessionID];
    [v4 setObjectOrNull:v16 forKey:@"session_id"];
  }
  v17 = [v31 expiryDate];

  if (v17)
  {
    long long v18 = [v31 expiryDate];
    long long v19 = (void *)_SQLValueForDate();
    [v4 setObjectOrNull:v19 forKey:@"expiry_date"];
  }
  long long v20 = [v31 actions];

  if (v20)
  {
    long long v21 = [v31 actions];
    v22 = [v21 componentsJoinedByString:@"-"];
    [v4 setObjectOrNull:v22 forKey:@"actions"];
  }
  v23 = [v31 requestDate];

  if (v23)
  {
    v24 = [v31 requestDate];
    v25 = (void *)_SQLValueForDate();
    [v4 setObjectOrNull:v25 forKey:@"request_date"];
  }
  v26 = [v31 lastDismissedDate];

  if (v26)
  {
    v27 = [v31 lastDismissedDate];
    v28 = (void *)_SQLValueForDate();
    [v4 setObjectOrNull:v28 forKey:@"last_dismissed_date"];
  }
  v29 = [v31 status];

  if (v29)
  {
    v30 = [v31 status];
    [v4 setObjectOrNull:v30 forKey:@"status"];
  }
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = [v13 requestToken];
        v15 = [a1 _predicateForPeerPaymentPendingRequestWithRequestToken:v14];
        id v16 = [a1 anyInDatabase:v8 predicate:v15];

        if (v16) {
          [v16 updateWithPeerPaymentPendingRequest:v13];
        }
        else {
          id v16 = [objc_alloc((Class)a1) initWithPeerPaymentPendingRequest:v13 forPeerPaymentAccountPID:a4 inDatabase:v8];
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

+ (void)deleteEntitiesForRequestTokens:(id)a3 inDatabase:(id)a4
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
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [a1 _predicateForPeerPaymentPendingRequestWithRequestToken:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)];
        v13 = [a1 queryWithDatabase:v7 predicate:v12];
        [v13 deleteAllEntities];

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPeerPaymentPendingRequestWithAccountPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"peer_payment_account_pid"];
  id v6 = [a1 anyInDatabase:v4 predicate:v5];

  return v6;
}

+ (id)_predicateForPeerPaymentPendingRequestWithRequestToken:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"request_token" equalToValue:a3];
}

+ (id)_predicateForPeerPaymentPendingRequestWithAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"peer_payment_account_pid" equalToValue:v3];

  return v4;
}

+ (id)_pendingRequestsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  v5 = [a1 queryWithDatabase:a3 predicate:a4];
  id v6 = [a1 _peerPaymentPendingRequestsWithQuery:v5];

  return v6;
}

+ (id)_peerPaymentPendingRequestsWithQuery:(id)a3
{
  id v20 = 0;
  v21[0] = @"amount";
  v21[1] = @"currency";
  v21[2] = @"actions";
  id v4 = a3;
  v5 = +[NSArray arrayWithObjects:v21 count:3];
  id v6 = [a1 _propertySettersForPeerPaymentPendingRequestWithProperties:v5 effectiveProperties:&v20];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = v20;
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  long long v15 = sub_100354D78;
  long long v16 = &unk_10072EAD8;
  id v18 = v7;
  id v19 = a1;
  id v17 = v6;
  id v9 = v7;
  id v10 = v6;
  [v4 enumeratePersistentIDsAndProperties:v8 usingBlock:&v13];

  id v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)_propertySettersForPeerPaymentPendingRequestWithProperties:(id)a3 effectiveProperties:(id *)a4
{
  id v5 = a3;
  if (a4)
  {
    v23[0] = @"request_token";
    v23[1] = @"requester_address";
    v24[0] = &stru_10074AAE8;
    v24[1] = &stru_10074AB08;
    v23[2] = @"requestee_address";
    v23[3] = @"memo";
    v24[2] = &stru_10074AB28;
    v24[3] = &stru_10074AB48;
    v23[4] = @"session_id";
    v23[5] = @"expiry_date";
    v24[4] = &stru_10074AB68;
    v24[5] = &stru_10074AB88;
    v23[6] = @"request_date";
    v23[7] = @"last_dismissed_date";
    v24[6] = &stru_10074ABA8;
    v24[7] = &stru_10074ABC8;
    v23[8] = @"actions";
    v23[9] = @"status";
    v24[8] = &stru_10074ABE8;
    v24[9] = &stru_10074AC08;
    id v6 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:10];
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