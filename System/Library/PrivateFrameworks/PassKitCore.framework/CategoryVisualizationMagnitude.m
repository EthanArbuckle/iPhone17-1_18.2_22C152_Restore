@interface CategoryVisualizationMagnitude
+ (id)_magnitudesMatchingQuery:(id)a3;
+ (id)_predicateForBucket:(int64_t)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForPassUniqueID:(id)a3;
+ (id)_predicateForPassUniqueID:(id)a3 bucket:(int64_t)a4;
+ (id)_propertySetters;
+ (id)_propertyValuesForMagnitude:(id)a3;
+ (id)anyInDatabase:(id)a3 withPID:(id)a4;
+ (id)databaseTable;
+ (id)insertMagnitude:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateMagnitude:(id)a3 inDatabase:(id)a4;
+ (id)magnitudesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteAnyInDatabase:(id)a3 forPassUniqueID:(id)a4;
- (CategoryVisualizationMagnitude)initWithMagnitude:(id)a3 inDatabase:(id)a4;
- (id)magnitude;
- (void)updateWithMagnitude:(id)a3;
@end

@implementation CategoryVisualizationMagnitude

+ (id)magnitudesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPassUniqueID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _magnitudesMatchingQuery:v8];

  return v9;
}

+ (id)_magnitudesMatchingQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySetters];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100069E90;
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

+ (id)databaseTable
{
  return @"guavas";
}

+ (id)_propertySetters
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_1007314D0;
  v5[1] = &stru_1007314F0;
  v4[2] = @"c";
  v5[2] = &stru_100731510;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (id)_predicateForPassUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

- (CategoryVisualizationMagnitude)initWithMagnitude:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() _propertyValuesForMagnitude:v7];

  id v9 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v9;
}

+ (id)anyInDatabase:(id)a3 withPID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)insertMagnitude:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithMagnitude:v7 inDatabase:v6];

  return v8;
}

+ (id)insertOrUpdateMagnitude:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 passUniqueIdentifier];
  id v9 = objc_msgSend(a1, "_predicateForPassUniqueID:bucket:", v8, objc_msgSend(v7, "bucket"));

  id v10 = [a1 anyInDatabase:v6 predicate:v9];
  if (v10)
  {
    v11 = v10;
    [v10 updateWithMagnitude:v7];
  }
  else
  {
    v11 = [a1 insertMagnitude:v7 inDatabase:v6];
  }

  return v11;
}

+ (void)deleteAnyInDatabase:(id)a3 forPassUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPassUniqueID:a4];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

- (void)updateWithMagnitude:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForMagnitude:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

- (id)magnitude
{
  id v3 = objc_alloc_init((Class)PKCategoryVisualizationMagnitude);
  id v4 = [(id)objc_opt_class() _propertySetters];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100069E24;
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

+ (id)_predicateForPassUniqueID:(id)a3 bucket:(int64_t)a4
{
  id v6 = [a1 _predicateForPassUniqueID:a3];
  id v7 = [a1 _predicateForBucket:a4];
  v11[0] = v6;
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

+ (id)_predicateForBucket:(int64_t)a3
{
  id v3 = +[NSNumber numberWithInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesForMagnitude:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 passUniqueIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"a"];

  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 bucket]);
  [v4 setObjectOrNull:v6 forKey:@"b"];

  [v3 magnitude];
  double v8 = v7;

  id v9 = +[NSNumber numberWithDouble:v8];
  [v4 setObjectOrNull:v9 forKey:@"c"];

  id v10 = [v4 copy];
  return v10;
}

@end