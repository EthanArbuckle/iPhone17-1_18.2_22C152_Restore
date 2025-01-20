@interface PushProvisioningSharingMetadata
+ (id)_predicateForProvisioningSharingIdentifier:(id)a3;
+ (id)_predicateForProvisioningSharingStatus:(unint64_t)a3;
+ (id)_propertySettersForProvisioningSharingMetadata;
+ (id)databaseTable;
+ (id)insertOrUpdateSharingMetadata:(id)a3 inDatabase:(id)a4;
+ (id)pushProvisioningSharingMetadataForProvisioningSharingIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)pushProvisioningSharingMetadataForStatus:(unint64_t)a3 inDatabase:(id)a4;
+ (id)pushProvisioningSharingMetadataInDatabase:(id)a3;
+ (void)deleteAllProvisioningTargetsInDatabase:(id)a3;
+ (void)deleteSharingMetadata:(id)a3 inDatabase:(id)a4;
- (PushProvisioningSharingMetadata)initWithSharingMetadata:(id)a3 inDatabase:(id)a4;
- (id)sharingMetaData;
- (void)_updateProvisioningSharingMetadata:(id)a3;
@end

@implementation PushProvisioningSharingMetadata

- (PushProvisioningSharingMetadata)initWithSharingMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "sharingStatus"), @"b");
  v9 = [v7 sharingInstanceIdentifier];
  [v8 setObjectOrNull:v9 forKey:@"a"];

  v10 = [v7 provisioningCredentialHash];
  [v8 setObjectOrNull:v10 forKey:@"c"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "source"), @"e");
  v11 = [v7 credentialAuthorityIdentifier];
  [v8 setObjectOrNull:v11 forKey:@"f"];

  v12 = [v7 createdAt];
  v13 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v13 forKey:@"g"];

  id v14 = [v7 securityOptions];
  [v8 setInteger:v14 forKey:@"h"];
  v15 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];

  return v15;
}

+ (id)pushProvisioningSharingMetadataInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_1001C5F40;
  id v14 = &unk_100730E38;
  id v15 = v4;
  id v16 = objc_alloc_init((Class)NSMutableSet);
  id v7 = v16;
  id v8 = v4;
  [v6 enumeratePersistentIDsUsingBlock:&v11];
  id v9 = objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

+ (id)pushProvisioningSharingMetadataForStatus:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForProvisioningSharingStatus:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1001C60D4;
  id v16 = &unk_100730E38;
  id v17 = v6;
  id v18 = objc_alloc_init((Class)NSMutableSet);
  id v9 = v18;
  id v10 = v6;
  [v8 enumeratePersistentIDsUsingBlock:&v13];
  id v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);

  return v11;
}

+ (id)pushProvisioningSharingMetadataForProvisioningSharingIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForProvisioningSharingIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)insertOrUpdateSharingMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10002099C;
  v21 = sub_100020FC0;
  id v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001C631C;
  v12[3] = &unk_10073DB78;
  id v15 = &v17;
  id v16 = a1;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  sub_10000817C((uint64_t)v9, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

+ (void)deleteSharingMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001C6488;
  v9[3] = &unk_10073DBA0;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  sub_10000817C((uint64_t)v7, v9);
}

+ (void)deleteAllProvisioningTargetsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  [v6 deleteAllEntities];
}

- (void)_updateProvisioningSharingMetadata:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v4, "sharingStatus"), @"b");
  v5 = [v4 sharingInstanceIdentifier];
  [v8 setObjectOrNull:v5 forKey:@"a"];

  id v6 = [v4 provisioningCredentialHash];
  [v8 setObjectOrNull:v6 forKey:@"c"];

  id v7 = [v4 source];
  [v8 setInteger:v7 forKey:@"e"];
  [(SQLiteEntity *)self setValuesWithDictionary:v8];
}

- (id)sharingMetaData
{
  id v3 = objc_alloc_init((Class)PKPushProvisioningSharingMetadata);
  id v4 = +[PushProvisioningSharingMetadata _propertySettersForProvisioningSharingMetadata];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001C6780;
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

+ (id)_predicateForProvisioningSharingIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForProvisioningSharingStatus:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)databaseTable
{
  return @"rincon";
}

+ (id)_propertySettersForProvisioningSharingMetadata
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_10073DBE0;
  v5[1] = &stru_10073DC00;
  v4[2] = @"c";
  v4[3] = @"e";
  v5[2] = &stru_10073DC20;
  v5[3] = &stru_10073DC40;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_10073DC60;
  v5[5] = &stru_10073DC80;
  v4[6] = @"h";
  v5[6] = &stru_10073DCA0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end