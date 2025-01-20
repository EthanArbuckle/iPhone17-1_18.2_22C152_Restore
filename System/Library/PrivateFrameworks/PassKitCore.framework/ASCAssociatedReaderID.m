@interface ASCAssociatedReaderID
+ (id)_associatedReaderIDsWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForAutomaticSelectionCriterionPID:(int64_t)a3;
+ (id)_predicateForReaderID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesFor:(id)a3;
+ (id)associatedReaderIDsForAutomaticSelectionCriterionPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deleteAssociatedReaderIDsForAutomaticSelectionCriterionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAssociatedReaderIDs:(id)a3 forAutomaticSelectionCriterionPID:(int64_t)a4 inDatabase:(id)a5;
- (ASCAssociatedReaderID)initWithObject:(id)a3 forAutomaticSelectionCriterionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)associatedReaderID;
- (void)updateWithObject:(id)a3;
@end

@implementation ASCAssociatedReaderID

- (ASCAssociatedReaderID)initWithObject:(id)a3 forAutomaticSelectionCriterionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesFor:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"automatic_selection_criterion_pid"];

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
  return @"associated_reader_id";
}

+ (id)associatedReaderIDsForAutomaticSelectionCriterionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAutomaticSelectionCriterionPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = [a1 _associatedReaderIDsWithQuery:v8 inDatabase:v6];

  return v9;
}

+ (void)deleteAssociatedReaderIDsForAutomaticSelectionCriterionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAutomaticSelectionCriterionPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A2780;
  v10[3] = &unk_100731020;
  id v11 = v6;
  id v9 = v6;
  [v8 enumeratePersistentIDsUsingBlock:v10];
  [v8 deleteAllEntities];
}

+ (void)insertOrUpdateAssociatedReaderIDs:(id)a3 forAutomaticSelectionCriterionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v27 = objc_alloc_init((Class)NSMutableSet);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v7;
  id v28 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v28)
  {
    uint64_t v25 = *(void *)v31;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v11 = [v10 readerID];
        v12 = [a1 _predicateForAutomaticSelectionCriterionPID:a4];
        v35[0] = v12;
        v29 = (void *)v11;
        v13 = [a1 _predicateForReaderID:v11];
        v35[1] = v13;
        v14 = +[NSArray arrayWithObjects:v35 count:2];
        +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v14];
        v16 = int64_t v15 = a4;
        v17 = [a1 anyInDatabase:v8 predicate:v16];

        if (v17) {
          [(ASCAssociatedReaderID *)v17 updateWithObject:v10];
        }
        else {
          v17 = [[ASCAssociatedReaderID alloc] initWithObject:v10 forAutomaticSelectionCriterionPID:v15 inDatabase:v8];
        }
        a4 = v15;
        v18 = [v10 readerCA];
        if (v18) {
          +[ASCAssociatedReaderIDReaderCA insertOrUpdateAssociatedReaderIDReaderCA:v18 associatedReaderIDPID:[(SQLiteEntity *)v17 persistentID] inDatabase:v8];
        }
        [v27 addObject:v29];
      }
      id v28 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v28);
  }

  v19 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"reader_id" values:v27];
  v34[0] = v19;
  v20 = [a1 _predicateForAutomaticSelectionCriterionPID:a4];
  v34[1] = v20;
  v21 = +[NSArray arrayWithObjects:v34 count:2];
  v22 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v21];

  v23 = [a1 queryWithDatabase:v8 predicate:v22];
  [v23 deleteAllEntities];
}

+ (id)_associatedReaderIDsWithQuery:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _propertySetters];
  id v9 = objc_alloc_init((Class)NSMutableSet);
  v10 = [v8 allKeys];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_1001A2C0C;
  v19 = &unk_10072DE00;
  id v23 = a1;
  id v20 = v8;
  id v21 = v6;
  id v11 = v9;
  id v22 = v11;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  if (objc_msgSend(v11, "count", v16, v17, v18, v19)) {
    id v14 = [v11 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (id)associatedReaderID
{
  id v3 = objc_alloc_init((Class)PKASCAssociatedReaderID);
  id v4 = [(id)objc_opt_class() _propertySetters];
  id v5 = [v4 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001A2E28;
  v14[3] = &unk_10072DDD8;
  v14[4] = self;
  id v15 = v4;
  id v6 = v3;
  id v16 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  v10 = +[ASCAssociatedReaderIDReaderCA associatedReaderIDReaderCAForAssociatedReaderIDPID:v8 inDatabase:v9];
  [v6 setReaderCA:v10];

  id v11 = v16;
  id v12 = v6;

  return v12;
}

+ (id)_predicateForAutomaticSelectionCriterionPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"automatic_selection_criterion_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForReaderID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"reader_id" equalToValue:a3];
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 readerID];
  [v4 setObjectOrNull:v5 forKey:@"reader_id"];

  id v6 = [v3 priority];
  id v7 = +[NSNumber numberWithUnsignedInteger:v6];
  [v4 setObjectOrNull:v7 forKey:@"priority"];

  return v4;
}

+ (id)_propertySetters
{
  v4[0] = @"reader_id";
  v4[1] = @"priority";
  v5[0] = &stru_10073C448;
  v5[1] = &stru_10073C468;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end