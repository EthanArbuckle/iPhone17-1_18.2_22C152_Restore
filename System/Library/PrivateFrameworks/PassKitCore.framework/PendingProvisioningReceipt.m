@interface PendingProvisioningReceipt
+ (id)_allProperties;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_propertySettersForObject;
+ (id)_propertyValuesFor:(id)a3;
+ (id)databaseTable;
+ (id)pendingProvisioningReceiptsInDatabase:(id)a3;
+ (void)deleteAllPendingProvisioningReceptsInDatabase:(id)a3;
+ (void)insertOrUpdateReceipt:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PendingProvisioningReceipt)initWithObject:(id)a3 inDatabase:(id)a4;
- (id)receipt;
- (void)updateWithObject:(id)a3;
@end

@implementation PendingProvisioningReceipt

- (PendingProvisioningReceipt)initWithObject:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() _propertyValuesFor:v7];

  v9 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v9;
}

- (void)updateWithObject:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesFor:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)databaseTable
{
  return @"pending_provisioning_receipt";
}

+ (id)pendingProvisioningReceiptsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForObject];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [a1 queryWithDatabase:v4 predicate:0];
  v8 = [(id)objc_opt_class() _allProperties];
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1002371FC;
  v17 = &unk_100741CD0;
  id v21 = a1;
  id v18 = v5;
  id v19 = v4;
  id v9 = v6;
  id v20 = v9;
  id v10 = v4;
  id v11 = v5;
  [v7 enumerateProperties:v8 usingBlock:&v14];

  if (objc_msgSend(v9, "count", v14, v15, v16, v17)) {
    id v12 = [v9 copy];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

+ (void)insertOrUpdateReceipt:(id)a3 inDatabase:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  id v7 = [v6 identifier];
  v8 = [a1 _predicateForIdentifier:v7];

  id v9 = [a1 anyInDatabase:v14 predicate:v8];
  if (v9)
  {
    id v10 = v9;
    [(PendingProvisioningReceipt *)v9 updateWithObject:v6];
  }
  else
  {
    id v10 = [[PendingProvisioningReceipt alloc] initWithObject:v6 inDatabase:v14];
  }
  id v11 = [v6 pendingProvisioning];

  id v12 = +[PendingProvisioning insertPendingProvisioning:v11 inDatabase:v14];

  v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 persistentID]);
  [(SQLiteEntity *)v10 setValue:v13 forProperty:@"f"];
}

+ (void)deleteAllPendingProvisioningReceptsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [a1 queryWithDatabase:v4 predicate:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002374E4;
  v7[3] = &unk_100731020;
  id v8 = v4;
  id v6 = v4;
  [v5 enumeratePersistentIDsUsingBlock:v7];
}

- (id)receipt
{
  id v3 = [objc_alloc((Class)PKPendingProvisioningReceipt) initForDatabase];
  id v4 = [(id)objc_opt_class() _propertySettersForObject];
  id v5 = [(id)objc_opt_class() _allProperties];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100237648;
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

- (BOOL)deleteFromDatabase
{
  v2 = self;
  id v3 = [(SQLiteEntity *)self valueForProperty:@"f"];
  id v4 = [v3 longLongValue];

  id v5 = [PendingProvisioning alloc];
  id v6 = [(SQLiteEntity *)v2 database];
  id v7 = [(SQLiteEntity *)v5 initWithPersistentID:v4 inDatabase:v6];

  [(PendingProvisioning *)v7 deleteFromDatabase];
  v9.receiver = v2;
  v9.super_class = (Class)PendingProvisioningReceipt;
  LOBYTE(v2) = [(SQLiteEntity *)&v9 deleteFromDatabase];

  return (char)v2;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"a"];

  [v3 type];
  id v6 = PKPendingProvisioningReceiptTypeToString();
  [v4 setObjectOrNull:v6 forKey:@"b"];

  [v3 createdAt];
  id v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObjectOrNull:v7 forKey:@"c"];

  id v8 = [v3 passUniqueID];
  [v4 setObjectOrNull:v8 forKey:@"d"];

  objc_super v9 = [v3 error];

  if (v9)
  {
    id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
    [v4 setObjectOrNull:v10 forKey:@"e"];
  }
  else
  {
    [v4 setObjectOrNull:0 forKey:@"e"];
  }

  return v4;
}

+ (id)_allProperties
{
  v4[0] = @"a";
  v4[1] = @"b";
  v4[2] = @"c";
  v4[3] = @"d";
  v4[4] = @"e";
  v4[5] = @"f";
  v2 = +[NSArray arrayWithObjects:v4 count:6];
  return v2;
}

+ (id)_propertySettersForObject
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_100741D10;
  v5[1] = &stru_100741D30;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_100741D50;
  v5[3] = &stru_100741D70;
  v4[4] = @"e";
  v5[4] = &stru_100741D90;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

@end