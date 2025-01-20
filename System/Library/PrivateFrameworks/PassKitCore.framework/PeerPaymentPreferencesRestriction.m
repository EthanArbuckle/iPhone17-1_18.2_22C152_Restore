@interface PeerPaymentPreferencesRestriction
+ (id)_peerPaymentPreferencesRestrictionsWithQuery:(id)a3;
+ (id)_predicateForPeerPaymentPreferencesPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentPreferencesRestriction;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentPeferencesRestrictions:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)peerPaymentPeferencesRestrictionsForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePeerPaymentPreferencesRestrictionsForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4;
- (PeerPaymentPreferencesRestriction)initWithPeerPaymentPreferencesRestriction:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5;
- (id)peerPaymentPreferencesRestriction;
@end

@implementation PeerPaymentPreferencesRestriction

+ (id)databaseTable
{
  return @"peer_payment_preferences_restriction";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"peer_payment_preferences_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertPeerPaymentPeferencesRestrictions:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableSet);
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
        id v18 = objc_msgSend(v17, "initWithPeerPaymentPreferencesRestriction:forPeerPaymentPreferencesPID:inDatabase:", v16, a4, v9, (void)v21);
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

+ (void)deletePeerPaymentPreferencesRestrictionsForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPeerPaymentPreferencesPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)peerPaymentPeferencesRestrictionsForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPeerPaymentPreferencesPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _peerPaymentPreferencesRestrictionsWithQuery:v8];

  return v9;
}

- (PeerPaymentPreferencesRestriction)initWithPeerPaymentPreferencesRestriction:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"peer_payment_preferences_pid"];

  id v12 = [v9 altDSID];
  [v10 setObjectOrNull:v12 forKey:@"alt_dsid"];

  id v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 sendRestrictionType]);
  [v10 setObjectOrNull:v13 forKey:@"restriction_type"];

  id v14 = [v9 receiveRestrictionType];
  v15 = +[NSNumber numberWithUnsignedInteger:v14];
  [v10 setObjectOrNull:v15 forKey:@"a"];

  uint64_t v16 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v16;
}

+ (id)_predicateForPeerPaymentPreferencesPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"peer_payment_preferences_pid" equalToValue:v3];

  return v4;
}

- (id)peerPaymentPreferencesRestriction
{
  id v3 = objc_alloc_init((Class)PKPeerPaymentPreferencesRestriction);
  v4 = [(id)objc_opt_class() _propertySettersForPeerPaymentPreferencesRestriction];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003779D8;
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

+ (id)_peerPaymentPreferencesRestrictionsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForPeerPaymentPreferencesRestriction];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100377B60;
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

+ (id)_propertySettersForPeerPaymentPreferencesRestriction
{
  v4[0] = @"alt_dsid";
  v4[1] = @"restriction_type";
  v5[0] = &stru_10074BD58;
  v5[1] = &stru_10074BD78;
  v4[2] = @"a";
  v5[2] = &stru_10074BD98;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end