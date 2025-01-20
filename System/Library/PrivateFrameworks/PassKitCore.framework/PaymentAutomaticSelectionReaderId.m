@interface PaymentAutomaticSelectionReaderId
+ (id)_predicateForPaymentAutomaticSelectionCriterionPID:(int64_t)a3;
+ (id)_readerIDsInDatabase:(id)a3 withPredicate:(id)a4;
+ (id)databaseTable;
+ (id)insertReaderIds:(id)a3 withPaymentAutomaticSelectionCriterion:(id)a4 inDatabase:(id)a5;
+ (id)readerIDsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4;
- (PaymentAutomaticSelectionReaderId)initWithReaderId:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4 database:(id)a5;
@end

@implementation PaymentAutomaticSelectionReaderId

+ (id)databaseTable
{
  return @"payment_automatic_selection_criterion_reader_id";
}

+ (id)readerIDsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPaymentAutomaticSelectionCriterionPID:a4];
  v8 = [a1 _readerIDsInDatabase:v6 withPredicate:v7];

  return v8;
}

+ (id)_readerIDsInDatabase:(id)a3 withPredicate:(id)a4
{
  if (a4)
  {
    v4 = objc_msgSend(a1, "queryWithDatabase:predicate:", a3);
    id v5 = objc_alloc_init((Class)NSMutableSet);
    CFStringRef v13 = @"reader_id";
    id v6 = +[NSArray arrayWithObjects:&v13 count:1];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100185828;
    v11[3] = &unk_100731258;
    id v12 = v5;
    id v7 = v5;
    [v4 enumeratePersistentIDsAndProperties:v6 usingBlock:v11];

    if ([v7 count]) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4
{
  id v6 = a3;
  id v8 = [a1 _predicateForPaymentAutomaticSelectionCriterionPID:a4];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)insertReaderIds:(id)a3 withPaymentAutomaticSelectionCriterion:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v8 count])
  {
    id v11 = [v9 persistentID];
    id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v8;
    id v13 = v8;
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [objc_alloc((Class)a1) initWithReaderId:*(void *)(*((void *)&v23 + 1) + 8 * i) forPaymentAutomaticSelectionCriterionPID:v11 database:v10];
          [v12 safelyAddObject:v18];
        }
        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    if ([v12 count]) {
      v19 = v12;
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    id v8 = v22;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (PaymentAutomaticSelectionReaderId)initWithReaderId:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4 database:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = +[NSNull null];
  id v12 = +[NSNumber numberWithLongLong:a4];
  [v10 setObject:v12 forKeyedSubscript:@"payment_automatic_selection_criterion_pid"];

  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = v11;
  }
  [v10 setObject:v13 forKeyedSubscript:@"reader_id"];

  id v14 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v14;
}

+ (id)_predicateForPaymentAutomaticSelectionCriterionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_automatic_selection_criterion_pid" equalToValue:v3];

  return v4;
}

@end