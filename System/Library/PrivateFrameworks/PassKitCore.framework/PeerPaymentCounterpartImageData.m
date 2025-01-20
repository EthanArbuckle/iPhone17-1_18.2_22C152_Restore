@interface PeerPaymentCounterpartImageData
+ (id)_commonDictionaryForPeerPaymentCounterpartImageData:(id)a3;
+ (id)_peerPaymentCounterpartImageDataWithQuery:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_propertySettersForPeerPaymentCounterpartImageData;
+ (id)counterpartImageDataWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)peerPaymentCounterpartImageDataForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)peerPaymentCounterpartImageDataWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntityForCounterpartImageDataIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePeerPaymentCounterpartImageData:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PeerPaymentCounterpartImageData)initWithPeerPaymentCounterpartImageData:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)counterpartImageData;
- (void)updateWithPeerPaymentCounterpartImageData:(id)a3;
@end

@implementation PeerPaymentCounterpartImageData

+ (id)databaseTable
{
  return @"cumin";
}

- (PeerPaymentCounterpartImageData)initWithPeerPaymentCounterpartImageData:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForPeerPaymentCounterpartImageData:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (void)insertOrUpdatePeerPaymentCounterpartImageData:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _predicateForAccountPID:a4];
  v17[0] = v10;
  v11 = [v8 identifier];
  v12 = [a1 _predicateForIdentifier:v11];
  v17[1] = v12;
  v13 = +[NSArray arrayWithObjects:v17 count:2];
  v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  v15 = [a1 anyInDatabase:v9 predicate:v14];
  if (v15)
  {
    id v16 = v15;
    [v15 updateWithPeerPaymentCounterpartImageData:v8];
  }
  else
  {
    id v16 = [objc_alloc((Class)a1) initWithPeerPaymentCounterpartImageData:v8 forPeerPaymentAccountPID:a4 inDatabase:v9];
  }
}

- (void)updateWithPeerPaymentCounterpartImageData:(id)a3
{
  id v4 = a3;
  v5 = [(SQLiteEntity *)self valueForProperty:@"c"];
  v6 = [v4 imageData];
  char v7 = PKEqualObjects();

  if ((v7 & 1) == 0)
  {
    database = self->super._database;
    id v9 = [v4 identifier];
    v10 = +[PaymentTransactionArchive anyInDatabase:database forCounterpartImageDataIdentifier:v9];

    if (v10)
    {
      v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Counterpart image data has changed, marking as unarchived", v14, 2u);
      }

      v12 = [v10 transactionArchive];
      [v12 updateArchiveLocationsWithType:0 isArchived:0];
      [v10 updateWithTransactionArchive:v12];
    }
  }
  v13 = [(id)objc_opt_class() _commonDictionaryForPeerPaymentCounterpartImageData:v4];
  [(SQLiteEntity *)self setValuesWithDictionary:v13];
}

- (BOOL)deleteFromDatabase
{
  +[PaymentTransactionArchive deleteArchiveForCounterpartImageDataPID:[(SQLiteEntity *)self persistentID] inDatabase:self->super._database];
  v4.receiver = self;
  v4.super_class = (Class)PeerPaymentCounterpartImageData;
  return [(SQLiteEntity *)&v4 deleteFromDatabase];
}

+ (void)deleteEntityForCounterpartImageDataIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForIdentifier:a3];
  char v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  char v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)counterpartImageDataWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  char v7 = [a1 _predicateForIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)peerPaymentCounterpartImageDataWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  char v7 = [a1 _predicateForIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 counterpartImageData];

  return v9;
}

+ (id)peerPaymentCounterpartImageDataForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  char v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _peerPaymentCounterpartImageDataWithQuery:v8];

  return v9;
}

+ (id)_peerPaymentCounterpartImageDataWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForPeerPaymentCounterpartImageData];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  char v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10039CDAC;
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

- (id)counterpartImageData
{
  id v3 = objc_alloc_init((Class)PKPeerPaymentCounterpartImageData);
  id v4 = [(id)objc_opt_class() _propertySettersForPeerPaymentCounterpartImageData];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10039CF30;
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

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_propertySettersForPeerPaymentCounterpartImageData
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10074D628;
  v5[1] = &stru_10074D648;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

+ (id)_commonDictionaryForPeerPaymentCounterpartImageData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 imageData];

  [v4 setObjectOrNull:v6 forKey:@"c"];
  return v4;
}

@end