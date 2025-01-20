@interface PeerPaymentPreferences
+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentPreferences;
+ (id)anyInDatabase:(id)a3 forPeerPaymentAccount:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentPeferences:(id)a3 forPeerPaymentAccount:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PeerPaymentPreferences)initWithPeerPaymentPreferences:(id)a3 forPeerPaymentAccount:(id)a4 inDatabase:(id)a5;
- (id)_dictionaryForPeerPaymentPreferences:(id)a3 forPeerPaymentAccountPID:(int64_t)a4;
- (id)peerPaymentPreferences;
- (void)updatePeerPaymentPreferences:(id)a3 forPeerPaymentAccount:(id)a4;
@end

@implementation PeerPaymentPreferences

+ (id)databaseTable
{
  return @"peer_payment_preferences";
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

+ (id)insertPeerPaymentPeferences:(id)a3 forPeerPaymentAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPeerPaymentPreferences:v10 forPeerPaymentAccount:v9 inDatabase:v8];

  return v11;
}

- (PeerPaymentPreferences)initWithPeerPaymentPreferences:(id)a3 forPeerPaymentAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = -[PeerPaymentPreferences _dictionaryForPeerPaymentPreferences:forPeerPaymentAccountPID:](self, "_dictionaryForPeerPaymentPreferences:forPeerPaymentAccountPID:", v9, [a4 persistentID]);
  id v11 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  id v12 = [(SQLiteEntity *)v11 persistentID];
  v13 = [v9 restrictions];
  id v14 = +[PeerPaymentPreferencesRestriction insertPeerPaymentPeferencesRestrictions:v13 forPeerPaymentPreferencesPID:v12 inDatabase:v8];

  v15 = [v9 notifications];
  id v16 = +[PeerPaymentPreferencesNotification insertPeerPaymentPeferencesNotifications:v15 forPeerPaymentPreferencesPID:v12 inDatabase:v8];

  v17 = [v9 profileAppearance];

  id v18 = +[PeerPaymentPreferencesProfileAppearance insertPeerPaymentPreferencesProfileAppearance:v17 forPeerPaymentPreferencesPID:v12 inDatabase:v8];
  return v11;
}

- (void)updatePeerPaymentPreferences:(id)a3 forPeerPaymentAccount:(id)a4
{
  id v6 = a3;
  -[PeerPaymentPreferences _dictionaryForPeerPaymentPreferences:forPeerPaymentAccountPID:](self, "_dictionaryForPeerPaymentPreferences:forPeerPaymentAccountPID:", v6, [a4 persistentID]);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  [(SQLiteEntity *)self setValuesWithDictionary:v25];
  int64_t v7 = [(SQLiteEntity *)self persistentID];
  id v8 = [(SQLiteEntity *)self database];
  +[PeerPaymentPreferencesRestriction deletePeerPaymentPreferencesRestrictionsForPeerPaymentPreferencesPID:v7 inDatabase:v8];

  id v9 = [v6 restrictions];
  int64_t v10 = [(SQLiteEntity *)self persistentID];
  id v11 = [(SQLiteEntity *)self database];
  id v12 = +[PeerPaymentPreferencesRestriction insertPeerPaymentPeferencesRestrictions:v9 forPeerPaymentPreferencesPID:v10 inDatabase:v11];

  int64_t v13 = [(SQLiteEntity *)self persistentID];
  id v14 = [(SQLiteEntity *)self database];
  +[PeerPaymentPreferencesNotification deletePeerPaymentPreferencesNotificationsForPeerPaymentPreferencesPID:v13 inDatabase:v14];

  v15 = [v6 notifications];
  int64_t v16 = [(SQLiteEntity *)self persistentID];
  v17 = [(SQLiteEntity *)self database];
  id v18 = +[PeerPaymentPreferencesNotification insertPeerPaymentPeferencesNotifications:v15 forPeerPaymentPreferencesPID:v16 inDatabase:v17];

  int64_t v19 = [(SQLiteEntity *)self persistentID];
  v20 = [(SQLiteEntity *)self database];
  +[PeerPaymentPreferencesProfileAppearance deletePeerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:v19 inDatabase:v20];

  v21 = [v6 profileAppearance];

  int64_t v22 = [(SQLiteEntity *)self persistentID];
  v23 = [(SQLiteEntity *)self database];
  id v24 = +[PeerPaymentPreferencesProfileAppearance insertPeerPaymentPreferencesProfileAppearance:v21 forPeerPaymentPreferencesPID:v22 inDatabase:v23];
}

+ (id)anyInDatabase:(id)a3 forPeerPaymentAccount:(id)a4
{
  id v6 = a3;
  int64_t v7 = objc_msgSend(a1, "_predicateForPeerPaymentAccountPID:", objc_msgSend(a4, "persistentID"));
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"peer_payment_account_pid" equalToValue:v3];

  return v4;
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)self database];
  +[PeerPaymentPreferencesRestriction deletePeerPaymentPreferencesRestrictionsForPeerPaymentPreferencesPID:v3 inDatabase:v4];

  int64_t v5 = [(SQLiteEntity *)self persistentID];
  id v6 = [(SQLiteEntity *)self database];
  +[PeerPaymentPreferencesNotification deletePeerPaymentPreferencesNotificationsForPeerPaymentPreferencesPID:v5 inDatabase:v6];

  v8.receiver = self;
  v8.super_class = (Class)PeerPaymentPreferences;
  return [(SQLiteEntity *)&v8 deleteFromDatabase];
}

- (id)peerPaymentPreferences
{
  id v3 = objc_alloc_init((Class)PKPeerPaymentPreferences);
  v4 = [(id)objc_opt_class() _propertySettersForPeerPaymentPreferences];
  int64_t v5 = [v4 allKeys];
  int64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_100350884;
  int64_t v22 = &unk_10072EDD0;
  id v23 = v4;
  id v6 = v3;
  id v24 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v19];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  int64_t v10 = +[PeerPaymentPreferencesNotification peerPaymentPeferencesNotificationsForPeerPaymentPreferencesPID:v8 inDatabase:v9];

  [v6 setNotifications:v10];
  int64_t v11 = [(SQLiteEntity *)self persistentID];
  id v12 = [(SQLiteEntity *)self database];
  int64_t v13 = +[PeerPaymentPreferencesRestriction peerPaymentPeferencesRestrictionsForPeerPaymentPreferencesPID:v11 inDatabase:v12];

  [v6 setRestrictions:v13];
  int64_t v14 = [(SQLiteEntity *)self persistentID];
  v15 = [(SQLiteEntity *)self database];
  int64_t v16 = +[PeerPaymentPreferencesProfileAppearance peerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:v14 inDatabase:v15];

  [v6 setProfileAppearance:v16];
  id v17 = v6;

  return v17;
}

- (id)_dictionaryForPeerPaymentPreferences:(id)a3 forPeerPaymentAccountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = +[NSNumber numberWithLongLong:a4];
  [v6 setObjectOrNull:v7 forKey:@"peer_payment_account_pid"];

  objc_msgSend(v6, "setBool:forKey:", objc_msgSend(v5, "requiresConfirmation"), @"requires_confirmation");
  objc_msgSend(v6, "setBool:forKey:", objc_msgSend(v5, "canReceiveFormalPaymentRequests"), @"can_receive_formal_payment_requests");
  objc_msgSend(v6, "setBool:forKey:", objc_msgSend(v5, "isDirty"), @"dirty");
  int64_t v8 = [v5 lastUpdated];

  id v9 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v9 forKey:@"last_updated_date"];

  return v6;
}

+ (id)_propertySettersForPeerPaymentPreferences
{
  v4[0] = @"requires_confirmation";
  v4[1] = @"can_receive_formal_payment_requests";
  v5[0] = &stru_10074A628;
  v5[1] = &stru_10074A648;
  v4[2] = @"dirty";
  v4[3] = @"last_updated_date";
  v5[2] = &stru_10074A668;
  v5[3] = &stru_10074A688;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end