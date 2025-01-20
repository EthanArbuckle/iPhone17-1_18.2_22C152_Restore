@interface PeerPaymentPreferencesProfileAppearance
+ (id)_peerPaymentProfileAppearanceWithQuery:(id)a3;
+ (id)_predicateForPeerPaymentPreferencesPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentPreferencesProfileAppearance;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentPreferencesProfileAppearance:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)peerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePeerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4;
- (PeerPaymentPreferencesProfileAppearance)initWithPeerPaymentPreferencesProfileAppearance:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5;
- (id)peerPaymentPreferencesProfileAppearance;
@end

@implementation PeerPaymentPreferencesProfileAppearance

+ (id)databaseTable
{
  return @"paprika";
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

+ (id)insertPeerPaymentPreferencesProfileAppearance:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPeerPaymentPreferencesProfileAppearance:v9 forPeerPaymentPreferencesPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deletePeerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPeerPaymentPreferencesPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)peerPaymentPreferencesProfileAppearanceForPeerPaymentPreferencesPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPeerPaymentPreferencesPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _peerPaymentProfileAppearanceWithQuery:v8];

  return v9;
}

- (PeerPaymentPreferencesProfileAppearance)initWithPeerPaymentPreferencesProfileAppearance:(id)a3 forPeerPaymentPreferencesPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "shareLastName"), @"b");
  id v12 = [v9 shareProfilePicture];

  [v10 setBool:v12 forKey:@"c"];
  v13 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v13;
}

+ (id)_predicateForPeerPaymentPreferencesPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

- (id)peerPaymentPreferencesProfileAppearance
{
  id v3 = objc_alloc_init((Class)PKPeerPaymentPreferencesProfileAppearance);
  v4 = [(id)objc_opt_class() _propertySettersForPeerPaymentPreferencesProfileAppearance];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10043DCD8;
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

+ (id)_peerPaymentProfileAppearanceWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForPeerPaymentPreferencesProfileAppearance];
  id v6 = objc_alloc_init((Class)PKPeerPaymentPreferencesProfileAppearance);
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10043DE60;
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

+ (id)_propertySettersForPeerPaymentPreferencesProfileAppearance
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100751460;
  v5[1] = &stru_100751480;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end