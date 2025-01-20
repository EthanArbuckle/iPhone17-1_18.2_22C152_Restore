@interface ASCAssociatedReaderIDReaderCA
+ (id)_objectsWithQuery:(id)a3;
+ (id)_predicateForAssociatedReaderIDPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesFor:(id)a3;
+ (id)associatedReaderIDReaderCAForAssociatedReaderIDPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deleteAssociatedReaderIDReaderCAForAssociatedReaderIDPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAssociatedReaderIDReaderCA:(id)a3 associatedReaderIDPID:(int64_t)a4 inDatabase:(id)a5;
- (ASCAssociatedReaderIDReaderCA)initWithObject:(id)a3 forAssociatedReaderIDPID:(int64_t)a4 inDatabase:(id)a5;
- (id)associatedReaderID;
- (void)updateWithObject:(id)a3;
@end

@implementation ASCAssociatedReaderIDReaderCA

- (ASCAssociatedReaderIDReaderCA)initWithObject:(id)a3 forAssociatedReaderIDPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesFor:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"associated_reader_id_pid"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

- (void)updateWithObject:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesFor:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)databaseTable
{
  return @"associated_reader_id_reader_ca";
}

+ (id)associatedReaderIDReaderCAForAssociatedReaderIDPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAssociatedReaderIDPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _objectsWithQuery:v8];
  v10 = [v9 anyObject];

  return v10;
}

+ (void)deleteAssociatedReaderIDReaderCAForAssociatedReaderIDPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAssociatedReaderIDPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)insertOrUpdateAssociatedReaderIDReaderCA:(id)a3 associatedReaderIDPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _predicateForAssociatedReaderIDPID:a4];
  v14 = v10;
  v11 = +[NSArray arrayWithObjects:&v14 count:1];
  v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];
  v13 = [a1 anyInDatabase:v9 predicate:v12];

  if (v13) {
    [(ASCAssociatedReaderIDReaderCA *)v13 updateWithObject:v8];
  }
  else {
    v13 = [[ASCAssociatedReaderIDReaderCA alloc] initWithObject:v8 forAssociatedReaderIDPID:a4 inDatabase:v9];
  }
}

+ (id)_objectsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySetters];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001B25C4;
  v12[3] = &unk_10072EAD8;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if ([v8 count]) {
    id v10 = [v8 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)associatedReaderID
{
  id v3 = objc_alloc_init((Class)PKASCAssociatedReaderIDReaderCA);
  id v4 = [(id)objc_opt_class() _propertySetters];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B2748;
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

+ (id)_predicateForAssociatedReaderIDPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"associated_reader_id_pid" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 publicKey];
  [v4 setObjectOrNull:v5 forKey:@"public_key"];

  id v6 = [v3 attestation];

  [v4 setObjectOrNull:v6 forKey:@"attestation"];
  return v4;
}

+ (id)_propertySetters
{
  v4[0] = @"public_key";
  v4[1] = @"attestation";
  v5[0] = &stru_10073CB78;
  v5[1] = &stru_10073CB98;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end