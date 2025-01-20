@interface CloudStoreRecord
+ (id)_predicateForCloudStoreZonePID:(id)a3;
+ (id)_predicateForCloudStoreZonePID:(int64_t)a3 recordName:(id)a4 recordType:(id)a5;
+ (id)_predicateForRecord:(id)a3 cloudStoreZonePID:(id)a4;
+ (id)_predicateForRecordName:(id)a3;
+ (id)_predicateForRecordType:(id)a3;
+ (id)anyInDatabase:(id)a3 cloudStoreRecord:(id)a4 cloudStoreZone:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateCloudStoreRecord:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5;
+ (id)recordInDatabase:(id)a3 withRecordName:(id)a4 recordType:(id)a5 cloudStoreZone:(id)a6;
+ (void)deleteEntitiesForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)removeCloudStoreRecordID:(id)a3 recordType:(id)a4 cloudStoreZone:(id)a5 inDatabase:(id)a6;
+ (void)removeCloudStoreRecordsWithName:(id)a3 recordType:(id)a4 inDatabase:(id)a5;
- (CloudStoreRecord)initWithCloudStoreRecord:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForCloudStoreRecord:(id)a3;
- (id)record;
- (unint64_t)hash;
- (void)updateWithCloudStoreRecord:(id)a3;
@end

@implementation CloudStoreRecord

+ (id)databaseTable
{
  return @"cloud_store_record";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"zone_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdateCloudStoreRecord:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 anyInDatabase:v10 cloudStoreRecord:v8 cloudStoreZone:v9];
  if (v11)
  {
    id v12 = v11;
    [v11 updateWithCloudStoreRecord:v8];
  }
  else
  {
    id v12 = [objc_alloc((Class)a1) initWithCloudStoreRecord:v8 forCloudStoreZone:v9 inDatabase:v10];
  }

  return v12;
}

- (CloudStoreRecord)initWithCloudStoreRecord:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(CloudStoreRecord *)self _commonDictionaryForCloudStoreRecord:a3];
  v11 = +[CloudStoreZone anyInDatabase:v8 forCloudStoreZone:v9];

  id v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 persistentID]);
  [v10 setObjectOrNull:v12 forKey:@"zone_pid"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v13;
}

- (void)updateWithCloudStoreRecord:(id)a3
{
  id v4 = [(CloudStoreRecord *)self _commonDictionaryForCloudStoreRecord:a3];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (id)anyInDatabase:(id)a3 cloudStoreRecord:(id)a4 cloudStoreZone:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[CloudStoreZone anyInDatabase:v9 forCloudStoreZone:a5];
  v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v10 persistentID]);
  id v12 = [a1 _predicateForRecord:v8 cloudStoreZonePID:v11];

  v13 = [a1 anyInDatabase:v9 predicate:v12];

  return v13;
}

+ (id)recordInDatabase:(id)a3 withRecordName:(id)a4 recordType:(id)a5 cloudStoreZone:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = +[CloudStoreZone anyInDatabase:v10 forCloudStoreZone:a6];
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(a1, "_predicateForCloudStoreZonePID:recordName:recordType:", objc_msgSend(v13, "persistentID"), v11, v12);
    v16 = [a1 anyInDatabase:v10 predicate:v15];
    v17 = [v16 record];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (void)deleteEntitiesForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v9 = +[NSNumber numberWithLongLong:a3];
  v7 = [a1 _predicateForCloudStoreZonePID:v9];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)removeCloudStoreRecordID:(id)a3 recordType:(id)a4 cloudStoreZone:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v17 = +[CloudStoreZone anyInDatabase:v10 forCloudStoreZone:a5];
  id v13 = [v17 persistentID];
  v14 = [v12 recordName];

  v15 = [a1 _predicateForCloudStoreZonePID:v13 recordName:v14 recordType:v11];

  v16 = [a1 queryWithDatabase:v10 predicate:v15];

  [v16 deleteAllEntities];
}

+ (void)removeCloudStoreRecordsWithName:(id)a3 recordType:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _predicateForRecordName:a3];
  v15[0] = v10;
  id v11 = [a1 _predicateForRecordType:v9];

  v15[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v15 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  v14 = [a1 queryWithDatabase:v8 predicate:v13];

  [v14 deleteAllEntities];
}

- (unint64_t)hash
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"hash"];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)record
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"record_data"];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v2 error:0];
    if (v3)
    {
      id v4 = [v3 decodeTopLevelObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey error:0];
      [v3 finishDecoding];
    }
    else
    {
      v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Could not initialize unarchiver with cloud store record data.", v7, 2u);
      }

      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_predicateForRecord:(id)a3 cloudStoreZonePID:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForCloudStoreZonePID:a4];
  id v8 = objc_msgSend(v6, "recordID", v7);
  id v9 = [v8 recordName];
  id v10 = [a1 _predicateForRecordName:v9];
  v16[1] = v10;
  id v11 = [v6 recordType];

  id v12 = [a1 _predicateForRecordType:v11];
  v16[2] = v12;
  id v13 = +[NSArray arrayWithObjects:v16 count:3];
  v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  return v14;
}

+ (id)_predicateForRecordName:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"record_name" equalToValue:a3];
}

+ (id)_predicateForCloudStoreZonePID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"zone_pid" equalToValue:a3];
}

+ (id)_predicateForRecordType:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"record_type" equalToValue:a3];
}

+ (id)_predicateForCloudStoreZonePID:(int64_t)a3 recordName:(id)a4 recordType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSNumber numberWithLongLong:a3];
  id v11 = [a1 _predicateForCloudStoreZonePID:v10];
  id v12 = objc_msgSend(a1, "_predicateForRecordName:", v9, v11);

  v17[1] = v12;
  id v13 = [a1 _predicateForRecordType:v8];

  v17[2] = v13;
  v14 = +[NSArray arrayWithObjects:v17 count:3];
  v15 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];

  return v15;
}

- (id)_commonDictionaryForCloudStoreRecord:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 recordID];
  id v6 = [v5 recordName];
  [v4 setObjectOrNull:v6 forKey:@"record_name"];

  v7 = [v3 recordType];
  [v4 setObjectOrNull:v7 forKey:@"record_type"];

  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "pk_hash"));
  [v4 setObjectOrNull:v8 forKey:@"hash"];

  id v9 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];

  [v4 setObjectOrNull:v9 forKey:@"record_data"];
  return v4;
}

@end