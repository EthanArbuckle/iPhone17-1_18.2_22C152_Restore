@interface PeerPaymentAccountAdditionalPushTopics
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentAccountAdditionalPushTopics;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentAccountAdditionalPushTopics:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)peerPaymentAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePeerPaymentAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePeerPaymentAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PeerPaymentAccountAdditionalPushTopics)initWithPeerPaymentAccountAdditionalPushTopics:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForPushTopics:(id)a3;
- (id)peerPaymentAccountAdditionalPushTopics;
- (void)updatePeerPaymentAccountAdditionalPushTopics:(id)a3;
@end

@implementation PeerPaymentAccountAdditionalPushTopics

+ (id)databaseTable
{
  return @"peer_payment_account_additional_push_topics";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"peer_payment_account_pid";
  }
  else {
    return 0;
  }
}

+ (id)peerPaymentAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  v9 = [v8 peerPaymentAccountAdditionalPushTopics];

  return v9;
}

- (PeerPaymentAccountAdditionalPushTopics)initWithPeerPaymentAccountAdditionalPushTopics:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [(PeerPaymentAccountAdditionalPushTopics *)self _commonDictionaryForPushTopics:a3];
  v10 = +[NSNumber numberWithLongLong:a4];
  [v9 setObjectOrNull:v10 forKey:@"peer_payment_account_pid"];

  v11 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];
  return v11;
}

+ (id)insertPeerPaymentAccountAdditionalPushTopics:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPeerPaymentAccountAdditionalPushTopics:v9 forPeerPaymentAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deletePeerPaymentAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (void)updatePeerPaymentAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForAccountPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updatePeerPaymentAccountAdditionalPushTopics:v12];
  }
  else {
    id v11 = +[PeerPaymentAccountAdditionalPushTopics insertPeerPaymentAccountAdditionalPushTopics:v12 forPeerPaymentAccountPID:a4 inDatabase:v8];
  }
}

- (void)updatePeerPaymentAccountAdditionalPushTopics:(id)a3
{
  id v4 = [(PeerPaymentAccountAdditionalPushTopics *)self _commonDictionaryForPushTopics:a3];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"peer_payment_account_pid" equalToValue:v3];

  return v4;
}

- (id)_commonDictionaryForPushTopics:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 preferences];
  [v4 setObjectOrNull:v5 forKey:@"preferences"];

  id v6 = [v3 associatedAccounts];
  [v4 setObjectOrNull:v6 forKey:@"associated_accounts"];

  v7 = [v3 requests];
  [v4 setObjectOrNull:v7 forKey:@"requests"];

  id v8 = [v3 endpoint];

  [v4 setObjectOrNull:v8 forKey:@"endpoint"];
  return v4;
}

+ (id)_propertySettersForPeerPaymentAccountAdditionalPushTopics
{
  v4[0] = @"preferences";
  v4[1] = @"associated_accounts";
  v5[0] = &stru_100747DB8;
  v5[1] = &stru_100747DD8;
  v4[2] = @"requests";
  v4[3] = @"endpoint";
  v5[2] = &stru_100747DF8;
  v5[3] = &stru_100747E18;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

- (id)peerPaymentAccountAdditionalPushTopics
{
  id v3 = objc_alloc_init((Class)PKPeerPaymentAdditionalPushTopics);
  id v4 = [(id)objc_opt_class() _propertySettersForPeerPaymentAccountAdditionalPushTopics];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002F481C;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

@end