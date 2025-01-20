@interface PeerPaymentEncryptionCertificatesVersions
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForEncryptionCertificatesVersions;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPeerPaymentEncryptionCertificatesVersions:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)peerPaymentEncryptionCertificatesVersionsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePeerPaymentEncryptionCertificatesVersionsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePeerPaymentEncryptionCertificatesVersions:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PeerPaymentEncryptionCertificatesVersions)initWithPeerPaymentEncryptionCertificatesVersions:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForEncryptionCertificatesVersions:(id)a3;
- (id)peerPaymentEncryptionCertificatesVersions;
- (void)updatePeerPaymentEncryptionCertificatesVersions:(id)a3;
@end

@implementation PeerPaymentEncryptionCertificatesVersions

+ (id)databaseTable
{
  return @"allspice";
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

+ (id)peerPaymentEncryptionCertificatesVersionsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  v9 = [v8 peerPaymentEncryptionCertificatesVersions];

  return v9;
}

- (PeerPaymentEncryptionCertificatesVersions)initWithPeerPaymentEncryptionCertificatesVersions:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [(PeerPaymentEncryptionCertificatesVersions *)self _commonDictionaryForEncryptionCertificatesVersions:a3];
  v10 = +[NSNumber numberWithLongLong:a4];
  [v9 setObjectOrNull:v10 forKey:@"a"];

  v11 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];
  return v11;
}

+ (id)insertPeerPaymentEncryptionCertificatesVersions:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPeerPaymentEncryptionCertificatesVersions:v9 forPeerPaymentAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deletePeerPaymentEncryptionCertificatesVersionsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (void)updatePeerPaymentEncryptionCertificatesVersions:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForAccountPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updatePeerPaymentEncryptionCertificatesVersions:v12];
  }
  else {
    id v11 = +[PeerPaymentEncryptionCertificatesVersions insertPeerPaymentEncryptionCertificatesVersions:v12 forPeerPaymentAccountPID:a4 inDatabase:v8];
  }
}

- (void)updatePeerPaymentEncryptionCertificatesVersions:(id)a3
{
  id v4 = [(PeerPaymentEncryptionCertificatesVersions *)self _commonDictionaryForEncryptionCertificatesVersions:a3];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

- (id)_commonDictionaryForEncryptionCertificatesVersions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 recipientData];

  id v6 = +[NSNumber numberWithInteger:v5];
  [v4 setObjectOrNull:v6 forKey:@"b"];

  return v4;
}

+ (id)_propertySettersForEncryptionCertificatesVersions
{
  CFStringRef v4 = @"b";
  id v5 = &stru_1007373F0;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (id)peerPaymentEncryptionCertificatesVersions
{
  id v3 = objc_alloc_init((Class)PKPeerPaymentEncryptionCertificatesVersions);
  CFStringRef v4 = [(id)objc_opt_class() _propertySettersForEncryptionCertificatesVersions];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10010849C;
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