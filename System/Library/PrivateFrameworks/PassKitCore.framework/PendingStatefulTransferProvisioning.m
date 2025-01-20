@interface PendingStatefulTransferProvisioning
+ (id)_predicateForBasePendingProvisioningPID:(int64_t)a3;
+ (id)_properties;
+ (id)_propertySetters;
+ (id)databaseTable;
+ (id)insertPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBasePendingProvisioningPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)inflatePendingProvisioning:(id)a3 forBasePendingProvisioningPID:(int64_t)a4 inDatabase:(id)a5;
- (PendingStatefulTransferProvisioning)initWithPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5;
@end

@implementation PendingStatefulTransferProvisioning

- (PendingStatefulTransferProvisioning)initWithPendingProvisioning:(id)a3 forBasePendingProvisioning:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setEntityPIDOrNull:v9 forKey:@"base_pid"];

  v12 = [v10 transportIdentifier];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [v10 invitation];
  v14 = [v13 identifier];
  [v11 setObjectOrNull:v14 forKey:@"b"];

  v15 = [v10 share];
  v16 = [v15 identifier];
  [v11 setObjectOrNull:v16 forKey:@"c"];

  v17 = [v10 originalShareURL];
  [v11 setObjectOrNull:v17 forKey:@"d"];

  v18 = [v10 accountAttestationAnonymizationSalt];

  [v11 setObjectOrNull:v18 forKey:@"e"];
  v19 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];

  return v19;
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
    v22 = sub_100020A2C;
    v23 = sub_100021008;
    id v24 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10021D374;
    v13[3] = &unk_100741048;
    id v14 = v8;
    v17 = &v19;
    id v18 = a1;
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
  id v9 = a5;
  if (v8)
  {
    id v10 = [a1 _predicateForBasePendingProvisioningPID:a4];
    id v11 = +[SQLiteEntity queryWithDatabase:v9 predicate:v10 orderingProperties:0 orderingDirections:0 limit:1];

    v12 = [a1 _properties];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10021D608;
    v13[3] = &unk_10072EAD8;
    id v16 = a1;
    id v14 = v8;
    id v15 = v9;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBasePendingProvisioningPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v10 = [a1 _predicateForBasePendingProvisioningPID:a3];
  v7 = +[SQLiteEntity anyInDatabase:v6 predicate:v10];
  id v8 = [v7 valueForProperty:@"b"];
  +[SharingMessage deleteSharingMessageForIdentifier:v8 inDatabase:v6];
  id v9 = [v7 valueForProperty:@"c"];
  +[PassShare deletePassShareWithIdentifier:v9 inDatabase:v6];

  [v7 deleteFromDatabase];
}

+ (id)_predicateForBasePendingProvisioningPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"base_pid" equalToValue:v3];

  return v4;
}

+ (id)databaseTable
{
  return @"pending_provisioning_stateful_transfer";
}

+ (id)_properties
{
  v4[0] = @"a";
  v4[1] = @"b";
  v4[2] = @"c";
  v4[3] = @"d";
  v4[4] = @"e";
  v2 = +[NSArray arrayWithObjects:v4 count:5];
  return v2;
}

+ (id)_propertySetters
{
  v4[0] = @"a";
  v4[1] = @"d";
  v5[0] = &stru_100741088;
  v5[1] = &stru_1007410A8;
  v4[2] = @"e";
  v5[2] = &stru_1007410C8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end