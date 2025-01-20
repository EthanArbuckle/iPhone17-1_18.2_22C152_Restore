@interface NFC
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_propertySettersForNFC;
+ (id)_propertyValuesForNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5;
+ (id)anyInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateNFCPayload:(id)a3 forPass:(id)a4 computedPayloadState:(unint64_t)a5 inDatabase:(id)a6;
- (NFC)initWithNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5 inDatabase:(id)a6;
- (id)nfcPayload;
- (void)updateNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5;
@end

@implementation NFC

+ (id)databaseTable
{
  return @"nfc";
}

+ (id)anyInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPassPID:a4];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  else {
    return 0;
  }
}

- (NFC)initWithNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [(id)objc_opt_class() _propertyValuesForNFCPayload:v12 pass:v11 computedPayloadState:a5];

  v14 = [(SQLiteEntity *)self initWithPropertyValues:v13 inDatabase:v10];
  return v14;
}

+ (void)insertOrUpdateNFCPayload:(id)a3 forPass:(id)a4 computedPayloadState:(unint64_t)a5 inDatabase:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = objc_msgSend(a1, "anyInDatabase:forPassPID:", v11, objc_msgSend(v10, "persistentID"));
  v13 = v12;
  if (v12) {
    [v12 updateNFCPayload:v14 pass:v10 computedPayloadState:a5];
  }
  else {
}
  }

+ (id)_predicateForPass:(id)a3
{
  id v4 = [a3 persistentID];
  return [a1 _predicateForPassPID:v4];
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPass:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (id)nfcPayload
{
  id v3 = objc_alloc_init((Class)PKNFCPayload);
  id v4 = +[NFC _propertySettersForNFC];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100368154;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (void)updateNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() _propertyValuesForNFCPayload:v9 pass:v8 computedPayloadState:a5];

  [(SQLiteEntity *)self setValuesWithDictionary:v10];
}

+ (id)_propertyValuesForNFCPayload:(id)a3 pass:(id)a4 computedPayloadState:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSMutableDictionary dictionary];
  id v10 = [v7 message];
  [v9 setObjectOrNull:v10 forKey:@"message"];

  id v11 = [v8 persistentID];
  id v12 = +[NSNumber numberWithLongLong:v11];
  [v9 setObject:v12 forKey:@"pass_pid"];

  id v13 = [v7 encryptionPublicKeyData];

  if (v13)
  {
    id v14 = [v7 encryptionPublicKeyData];
    v15 = [v14 hexEncoding];
    [v9 setObject:v15 forKey:@"encryption_public_key"];
  }
  objc_msgSend(v9, "setBool:forKey:", objc_msgSend(v7, "requiresAuthentication"), @"requires_authentication");
  v16 = +[NSNumber numberWithUnsignedInteger:a5];
  [v9 setObject:v16 forKey:@"a"];

  id v17 = [v9 copy];
  return v17;
}

+ (id)_propertySettersForNFC
{
  v4[0] = @"message";
  v4[1] = @"encryption_public_key";
  v5[0] = &stru_10074B570;
  v5[1] = &stru_10074B590;
  v4[2] = @"requires_authentication";
  v4[3] = @"a";
  v5[2] = &stru_10074B5B0;
  v5[3] = &stru_10074B5D0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end