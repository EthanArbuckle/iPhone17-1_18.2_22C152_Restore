@interface PendingCarKeyProvisioning
+ (id)_predicateForBasePendingProvisioningPID:(int64_t)a3;
+ (id)_properties;
+ (id)_propertySetters;
+ (id)databaseTable;
+ (id)insertPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBasePendingProvisioningPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)inflatePendingProvisioning:(id)a3 forBasePendingProvisioningPID:(int64_t)a4 inDatabase:(id)a5;
- (PendingCarKeyProvisioning)initWithPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5;
@end

@implementation PendingCarKeyProvisioning

- (PendingCarKeyProvisioning)initWithPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setEntityPIDOrNull:v9 forKey:@"base_pid"];

  v12 = [v10 configuration];

  v13 = [v12 manufacturerIdentifier];
  [v11 setObjectOrNull:v13 forKey:@"a"];

  v14 = [v12 issuerIdentifier];
  [v11 setObjectOrNull:v14 forKey:@"b"];

  v15 = [v12 provisioningTemplateIdentifier];
  [v11 setObjectOrNull:v15 forKey:@"c"];

  v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 supportedRadioTechnologies]);
  [v11 setObjectOrNull:v16 forKey:@"d"];

  v17 = [v12 productPlanIdentifier];
  [v11 setObjectOrNull:v17 forKey:@"e"];

  v18 = [v12 vehicleName];
  [v11 setObjectOrNull:v18 forKey:@"f"];

  v19 = [v12 pairedReaderIdentifier];
  [v11 setObjectOrNull:v19 forKey:@"g"];

  v20 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v20;
}

+ (id)insertPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = 0;
  if (v8 && v9)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_1000207BC;
    v23 = sub_100020ED0;
    id v24 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008A8A8;
    v13[3] = &unk_1007313E8;
    v17 = &v19;
    id v18 = a1;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    sub_10000817C((uint64_t)v16, v13);
    id v11 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }

  return v11;
}

+ (void)inflatePendingProvisioning:(id)a3 forBasePendingProvisioningPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    id v10 = [a1 _predicateForBasePendingProvisioningPID:a4];
    id v11 = +[SQLiteEntity queryWithDatabase:v9 predicate:v10 orderingProperties:0 orderingDirections:0 limit:1];

    v12 = [a1 _properties];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008AA24;
    v13[3] = &unk_100731410;
    id v15 = a1;
    id v14 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBasePendingProvisioningPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForBasePendingProvisioningPID:a3];
  v7 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_predicateForBasePendingProvisioningPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"base_pid" equalToValue:v3];

  return v4;
}

+ (id)databaseTable
{
  return @"leek";
}

+ (id)_properties
{
  v4[0] = @"a";
  v4[1] = @"b";
  v4[2] = @"c";
  v4[3] = @"d";
  v4[4] = @"e";
  v4[5] = @"f";
  v4[6] = @"g";
  v2 = +[NSArray arrayWithObjects:v4 count:7];
  return v2;
}

+ (id)_propertySetters
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_100732A00;
  v5[1] = &stru_100732A20;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_100732A40;
  v5[3] = &stru_100732A60;
  v4[4] = @"e";
  v4[5] = @"f";
  v5[4] = &stru_100732A80;
  v5[5] = &stru_100732AA0;
  v4[6] = @"g";
  v5[6] = &stru_100732AC0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end