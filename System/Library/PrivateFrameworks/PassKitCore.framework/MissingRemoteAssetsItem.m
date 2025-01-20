@interface MissingRemoteAssetsItem
+ (id)_predicateForMaximumRetriesCount:(unint64_t)a3;
+ (id)_predicateForUniqueID:(id)a3;
+ (id)_propertySettersForItem;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrReplaceMissingRemoteAssetsItemForUniqueID:(id)a3 inDataBase:(id)a4;
+ (id)itemsInDataBase:(id)a3 withMaximumDownloadRetriesCount:(unint64_t)a4;
+ (unint64_t)itemsCountInDataBase:(id)a3 withMaximumDownloadRetriesCount:(unint64_t)a4;
+ (void)incrementDownloadRetriesCountForUniqueID:(id)a3 inDataBase:(id)a4;
+ (void)removeMissingRemoteAssetsItemForUniqueID:(id)a3 inDataBase:(id)a4;
- (id)initMissingRemoteAssetsItemWithUniqueID:(id)a3 inDatabase:(id)a4;
@end

@implementation MissingRemoteAssetsItem

+ (id)insertOrReplaceMissingRemoteAssetsItemForUniqueID:(id)a3 inDataBase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class()) initMissingRemoteAssetsItemWithUniqueID:v6 inDatabase:v5];

  return v7;
}

+ (unint64_t)itemsCountInDataBase:(id)a3 withMaximumDownloadRetriesCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForMaximumRetriesCount:a4];
  unint64_t v8 = +[SQLiteEntity countInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)itemsInDataBase:(id)a3 withMaximumDownloadRetriesCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[NSMutableSet set];
  unint64_t v8 = [a1 _predicateForMaximumRetriesCount:a4];
  v9 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];

  v10 = [a1 _propertySettersForItem];
  v11 = [v10 allKeys];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000843D4;
  v17[3] = &unk_10072EAD8;
  id v20 = a1;
  id v18 = v10;
  id v12 = v7;
  id v19 = v12;
  id v13 = v10;
  [v9 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];

  v14 = v19;
  id v15 = v12;

  return v15;
}

+ (void)incrementDownloadRetriesCountForUniqueID:(id)a3 inDataBase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [a1 databaseTable];
  +[NSString stringWithFormat:@"UPDATE %@ SET %@ = %@ + 1 WHERE %@ = '%@'", v8, @"download_retries_count", @"download_retries_count", @"unique_id", v7];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  sub_10000C100((BOOL)v6, v9);
}

+ (void)removeMissingRemoteAssetsItemForUniqueID:(id)a3 inDataBase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForUniqueID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (id)initMissingRemoteAssetsItemWithUniqueID:(id)a3 inDatabase:(id)a4
{
  CFStringRef v11 = @"unique_id";
  id v12 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  id v9 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v9;
}

+ (id)databaseTable
{
  return @"missing_remote_assets";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pid";
  }
  else {
    return 0;
  }
}

+ (id)_predicateForMaximumRetriesCount:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"download_retries_count" lessThanOrEqualToValue:v3];

  return v4;
}

+ (id)_predicateForUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"unique_id" equalToValue:a3];
}

+ (id)_propertySettersForItem
{
  v4[0] = @"unique_id";
  v4[1] = @"download_retries_count";
  v5[0] = &stru_100732440;
  v5[1] = &stru_100732460;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end