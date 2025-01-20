@interface PeerPaymentAccountInvitation
+ (id)_peerPaymentAccountInvitationsWithQuery:(id)a3;
+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentAccountInvitation;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertInvitations:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)invitationsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteInvitationsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (PeerPaymentAccountInvitation)initWithInvitation:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)peerPaymentAccountInvitation;
@end

@implementation PeerPaymentAccountInvitation

+ (id)databaseTable
{
  return @"peer_payment_account_invitation";
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

+ (id)insertInvitations:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[NSMutableSet set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v17 = objc_alloc((Class)a1);
        id v18 = objc_msgSend(v17, "initWithInvitation:forPeerPaymentAccountPID:inDatabase:", v16, a4, v9, (void)v21);
        if (v18) {
          [v10 addObject:v18];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  id v19 = [v10 copy];
  return v19;
}

+ (void)deleteInvitationsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPeerPaymentAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)invitationsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPeerPaymentAccountPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _peerPaymentAccountInvitationsWithQuery:v8];

  return v9;
}

- (PeerPaymentAccountInvitation)initWithInvitation:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"peer_payment_account_pid"];

  id v12 = [v9 altDSID];
  [v10 setObjectOrNull:v12 forKey:@"alt_dsid"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "status"), @"status");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "registrationResult"), @"registration_result");
  id v13 = [v9 remoteRegistrationRequestLevel];

  [v10 setInteger:v13 forKey:@"remote_registration_request_level"];
  uint64_t v14 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v14;
}

+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"peer_payment_account_pid" equalToValue:v3];

  return v4;
}

- (id)peerPaymentAccountInvitation
{
  id v3 = objc_alloc_init((Class)PKPeerPaymentAccountInvitation);
  v4 = [(id)objc_opt_class() _propertySettersForPeerPaymentAccountInvitation];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006501C;
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

+ (id)_peerPaymentAccountInvitationsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForPeerPaymentAccountInvitation];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000651A4;
  v12[3] = &unk_10072EAD8;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = [v8 copy];
  return v10;
}

+ (id)_propertySettersForPeerPaymentAccountInvitation
{
  v4[0] = @"alt_dsid";
  v4[1] = @"status";
  v5[0] = &stru_100731160;
  v5[1] = &stru_100731180;
  v4[2] = @"registration_result";
  v4[3] = @"remote_registration_request_level";
  v5[2] = &stru_1007311A0;
  v5[3] = &stru_1007311C0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end