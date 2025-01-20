@interface PeerPaymentEncryptionCertificate
+ (id)_commonDictionaryForPeerPaymentEncryptionCertificate:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForDestination:(unint64_t)a3;
+ (id)_propertySettersForPeerPaymentEncryptionCertificate;
+ (id)databaseTable;
+ (id)peerPaymentEncryptionCertificateForDestination:(unint64_t)a3 inDatabase:(id)a4;
+ (void)deleteEncryptionCertificatesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePeerPaymentEncryptionCertificate:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PeerPaymentEncryptionCertificate)initWithPeerPaymentEncryptionCertificate:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)peerPaymentEncryptionCertificate;
- (void)updateWithPeerPaymentEncryptionCertificate:(id)a3;
@end

@implementation PeerPaymentEncryptionCertificate

+ (id)databaseTable
{
  return @"cinnamon";
}

- (PeerPaymentEncryptionCertificate)initWithPeerPaymentEncryptionCertificate:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForPeerPaymentEncryptionCertificate:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (void)insertOrUpdatePeerPaymentEncryptionCertificate:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _predicateForAccountPID:a4];
  v16[0] = v10;
  v11 = objc_msgSend(a1, "_predicateForDestination:", objc_msgSend(v8, "destination"));
  v16[1] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:2];
  v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  v14 = [a1 anyInDatabase:v9 predicate:v13];
  if (v14)
  {
    id v15 = v14;
    [v14 updateWithPeerPaymentEncryptionCertificate:v8];
  }
  else
  {
    id v15 = [objc_alloc((Class)a1) initWithPeerPaymentEncryptionCertificate:v8 forPeerPaymentAccountPID:a4 inDatabase:v9];
  }
}

- (void)updateWithPeerPaymentEncryptionCertificate:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForPeerPaymentEncryptionCertificate:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (void)deleteEncryptionCertificatesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)peerPaymentEncryptionCertificateForDestination:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForDestination:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 peerPaymentEncryptionCertificate];

  return v9;
}

- (id)peerPaymentEncryptionCertificate
{
  id v3 = objc_alloc_init((Class)PKPeerPaymentEncryptionCertificate);
  id v4 = [(id)objc_opt_class() _propertySettersForPeerPaymentEncryptionCertificate];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001CEEDC;
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

+ (id)_predicateForAccountPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForDestination:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForPeerPaymentEncryptionCertificate
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10073DE58;
  v5[1] = &stru_10073DE78;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_10073DE98;
  v5[3] = &stru_10073DEB8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)_commonDictionaryForPeerPaymentEncryptionCertificate:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 destination]);
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 encryptionScheme]);
  [v4 setObjectOrNull:v6 forKey:@"c"];

  id v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 certificatesVersion]);
  [v4 setObjectOrNull:v7 forKey:@"d"];

  id v8 = [v3 encryptionCertificates];

  id v9 = _SQLValueForEncryptionCertificates(v8);
  [v4 setObjectOrNull:v9 forKey:@"e"];

  return v4;
}

@end