@interface PassProvisioningMetadata
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_propertySettersForObject;
+ (id)_propertyValuesFor:(id)a3;
+ (id)_provisioningMetadatasWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)provisioningMetadataForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteProvisioningMetadataForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateProvisioningMetadata:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (PassProvisioningMetadata)initWithObject:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5;
- (id)provisioningMetadata;
- (void)updateWithObject:(id)a3;
@end

@implementation PassProvisioningMetadata

+ (id)databaseTable
{
  return @"pass_provisioning_metadata";
}

+ (id)provisioningMetadataForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPassPID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];
  v9 = [a1 _provisioningMetadatasWithQuery:v8 inDatabase:v6];

  v10 = [v9 firstObject];

  return v10;
}

+ (id)_provisioningMetadatasWithQuery:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = [a1 _propertySettersForObject];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = [v6 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100236B5C;
  v13[3] = &unk_100741C48;
  id v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v15 = v9;
  id v10 = v6;
  [v5 enumerateProperties:v8 usingBlock:v13];

  if ([v9 count]) {
    id v11 = [v9 copy];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

+ (id)_propertySettersForObject
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100741C88;
  v5[1] = &stru_100741CA8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

- (PassProvisioningMetadata)initWithObject:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() _propertyValuesFor:v9];

  [v10 setUnsignedLongLong:a4 forKey:@"a"];
  id v11 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v11;
}

- (void)updateWithObject:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesFor:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (void)insertOrUpdateProvisioningMetadata:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForPassPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];
  if (v10)
  {
    id v11 = v10;
    [(PassProvisioningMetadata *)v10 updateWithObject:v12];
  }
  else
  {
    id v11 = [[PassProvisioningMetadata alloc] initWithObject:v12 passPID:a4 inDatabase:v8];
  }
}

+ (void)deleteProvisioningMetadataForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

- (id)provisioningMetadata
{
  id v3 = objc_alloc_init((Class)PKPassProvisioningMetadata);
  id v4 = [(id)objc_opt_class() _propertySettersForObject];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100236E30;
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

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 sourceDeviceType];
  id v5 = PKPassProvisioningMetadataSourceDeviceTypeToString();
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 localizedSourceDeviceDescription];

  [v4 setObjectOrNull:v6 forKey:@"c"];
  return v4;
}

@end