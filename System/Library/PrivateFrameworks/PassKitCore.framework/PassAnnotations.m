@interface PassAnnotations
+ (id)_passAnnotationsIDPredicate:(id)a3;
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_propertySettersForPassAnnotations;
+ (id)anyInDatabase:(id)a3 withPassID:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPassAnnotationsForSortingState:(int64_t)a3 forPass:(id)a4 inDatabase:(id)a5;
+ (id)insertPassAnnotationsForSortingState:(int64_t)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)queryWithDatabase:(id)a3 passAnnotationsPID:(unint64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)updateAnnotationsOfExpiredIrrelevantOrVoidedPassesWithState:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PassAnnotations)initWithPassAnnotationsForSortingState:(int64_t)a3 forPass:(id)a4 inDatabase:(id)a5;
- (PassAnnotations)initWithPassAnnotationsForSortingState:(int64_t)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (id)archivedTimestamp;
- (id)passAnnotations;
- (int64_t)sortingState;
- (void)updateArchivedTimestamp:(id)a3;
- (void)updateSortingState:(int64_t)a3;
@end

@implementation PassAnnotations

+ (id)databaseTable
{
  return @"pass_annotations";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"pass.unique_id"]) {
    [v5 addObject:@"JOIN pass ON pass.pid = pass_annotations.pass_pid"];
  }
}

- (id)passAnnotations
{
  id v3 = objc_alloc_init((Class)PKPassAnnotations);
  v4 = +[PassAnnotations _propertySettersForPassAnnotations];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001A6F4;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)anyInDatabase:(id)a3 withPassID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _passAnnotationsIDPredicate:a4];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)_propertySettersForPassAnnotations
{
  v4[0] = @"sorting_state";
  v4[1] = @"archived_timestamp";
  v5[0] = &stru_100748728;
  v5[1] = &stru_100748748;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

+ (id)_passAnnotationsIDPredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (void)updateAnnotationsOfExpiredIrrelevantOrVoidedPassesWithState:(int64_t)a3 inDatabase:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[Pass predicateForInMainStack];
  id v7 = (void *)v6;
  if (a3 == 1)
  {
    v18[0] = v6;
    v8 = +[Pass predicateForStagedForExpiration];
    v18[1] = v8;
    id v9 = +[NSArray arrayWithObjects:v18 count:2];
    v10 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v9];
  }
  else
  {
    v17[0] = v6;
    v8 = +[Pass predicateForExpired];
    v17[1] = v8;
    id v9 = +[Pass predicateForManuallyRecovered];
    v17[2] = v9;
    v11 = +[NSArray arrayWithObjects:v17 count:3];
    v10 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v11];
  }
  id v12 = +[SQLiteEntity queryWithDatabase:v5 predicate:v10];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100017938;
  v14[3] = &unk_1007486E8;
  id v15 = v5;
  int64_t v16 = a3;
  id v13 = v5;
  +[Pass enumeratePassesForQuery:v12 withHandler:v14];
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

- (PassAnnotations)initWithPassAnnotationsForSortingState:(int64_t)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = +[NSMutableDictionary dictionary];
  id v11 = [v9 persistentID];

  id v12 = +[NSNumber numberWithLongLong:v11];
  [v10 setObject:v12 forKey:@"pass_pid"];

  id v13 = +[NSNumber numberWithInteger:a3];
  [v10 setObject:v13 forKey:@"sorting_state"];

  if (a3 == 1)
  {
    v14 = +[NSDate now];
    id v15 = (void *)_SQLValueForDate();
    [v10 setObjectOrNull:v15 forKey:@"archived_timestamp"];
  }
  else
  {
    [v10 setObjectOrNull:0 forKey:@"archived_timestamp"];
  }
  int64_t v16 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v16;
}

- (PassAnnotations)initWithPassAnnotationsForSortingState:(int64_t)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = +[NSMutableDictionary dictionary];
  v10 = +[NSNumber numberWithLongLong:a4];
  [v9 setObject:v10 forKey:@"pass_pid"];

  id v11 = +[NSNumber numberWithInteger:a3];
  [v9 setObject:v11 forKey:@"sorting_state"];

  if (a3 == 1)
  {
    id v12 = +[NSDate now];
    id v13 = (void *)_SQLValueForDate();
    [v9 setObjectOrNull:v13 forKey:@"archived_timestamp"];
  }
  else
  {
    [v9 setObjectOrNull:0 forKey:@"archived_timestamp"];
  }
  v14 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];

  return v14;
}

+ (id)insertPassAnnotationsForSortingState:(int64_t)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)a1) initWithPassAnnotationsForSortingState:a3 forPass:v9 inDatabase:v8];

  return v10;
}

+ (id)insertPassAnnotationsForSortingState:(int64_t)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [objc_alloc((Class)a1) initWithPassAnnotationsForSortingState:a3 forPassPID:a4 inDatabase:v8];

  return v9;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
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
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)queryWithDatabase:(id)a3 passAnnotationsPID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPassPID:a4];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  return v8;
}

- (int64_t)sortingState
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"sorting_state"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)archivedTimestamp
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"archived_timestamp"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

- (void)updateSortingState:(int64_t)a3
{
  if ([(PassAnnotations *)self sortingState] != a3)
  {
    if (a3 == 1)
    {
      id v5 = +[NSDate now];
      id v6 = (void *)_SQLValueForDate();
      [(SQLiteEntity *)self setValue:v6 forProperty:@"archived_timestamp"];
    }
    id v7 = +[NSNumber numberWithInteger:a3];
    [(SQLiteEntity *)self setValue:v7 forProperty:@"sorting_state"];
  }
}

- (void)updateArchivedTimestamp:(id)a3
{
  id v4 = (id)_SQLValueForDate();
  [(SQLiteEntity *)self setValue:v4 forProperty:@"archived_timestamp"];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PassAnnotations;
  return [(SQLiteEntity *)&v3 deleteFromDatabase];
}

@end