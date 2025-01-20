@interface PeerPaymentPaymentModeIdentifiers
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentPaymentModeIdentifiers;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentPaymentModeIdentifiers:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)peerPaymentPaymentModeIdentifiersForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePeerPaymentPaymentModeIdentifiersForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePeerPaymentPaymentModeIdentifiers:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PeerPaymentPaymentModeIdentifiers)initWithPeerPaymentPaymentModeIdentifiers:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForPaymentModeIdentifiers:(id)a3;
- (id)peerPaymentPaymentModeIdentifiers;
- (void)updatePeerPaymentPaymentModeIdentifiers:(id)a3;
@end

@implementation PeerPaymentPaymentModeIdentifiers

+ (id)databaseTable
{
  return @"nutmeg";
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

+ (id)peerPaymentPaymentModeIdentifiersForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  v9 = [v8 peerPaymentPaymentModeIdentifiers];

  return v9;
}

- (PeerPaymentPaymentModeIdentifiers)initWithPeerPaymentPaymentModeIdentifiers:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [(PeerPaymentPaymentModeIdentifiers *)self _commonDictionaryForPaymentModeIdentifiers:a3];
  v10 = +[NSNumber numberWithLongLong:a4];
  [v9 setObjectOrNull:v10 forKey:@"a"];

  v11 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];
  return v11;
}

+ (id)insertPeerPaymentPaymentModeIdentifiers:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPeerPaymentPaymentModeIdentifiers:v9 forPeerPaymentAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deletePeerPaymentPaymentModeIdentifiersForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (void)updatePeerPaymentPaymentModeIdentifiers:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForAccountPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updatePeerPaymentPaymentModeIdentifiers:v12];
  }
  else {
    id v11 = +[PeerPaymentPaymentModeIdentifiers insertPeerPaymentPaymentModeIdentifiers:v12 forPeerPaymentAccountPID:a4 inDatabase:v8];
  }
}

- (void)updatePeerPaymentPaymentModeIdentifiers:(id)a3
{
  id v4 = [(PeerPaymentPaymentModeIdentifiers *)self _commonDictionaryForPaymentModeIdentifiers:a3];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

- (id)_commonDictionaryForPaymentModeIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 deviceTap];

  [v4 setObjectOrNull:v5 forKey:@"b"];
  return v4;
}

+ (id)_propertySettersForPeerPaymentPaymentModeIdentifiers
{
  CFStringRef v4 = @"b";
  v5 = &stru_1007392C0;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (id)peerPaymentPaymentModeIdentifiers
{
  id v3 = objc_alloc_init((Class)PKPeerPaymentPaymentModeIdentifiers);
  CFStringRef v4 = [(id)objc_opt_class() _propertySettersForPeerPaymentPaymentModeIdentifiers];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012CB5C;
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