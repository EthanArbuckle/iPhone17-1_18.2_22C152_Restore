@interface PaymentAutomaticSelectionTCI
+ (id)TCIsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4;
+ (id)_TCIsInDatabase:(id)a3 withPredicate:(id)a4;
+ (id)_predicateForIsPrimary:(BOOL)a3;
+ (id)_predicateForPaymentAutomaticSelectionCriterionPID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertPrimaryTCIs:(id)a3 TCIs:(id)a4 withPaymentAutomaticSelectionCriterion:(id)a5 inDatabase:(id)a6;
+ (id)primaryTCIsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4;
- (PaymentAutomaticSelectionTCI)initWithTCI:(id)a3 primary:(BOOL)a4 forPaymentAutomaticSelectionCriterionPID:(int64_t)a5 database:(id)a6;
@end

@implementation PaymentAutomaticSelectionTCI

+ (id)databaseTable
{
  return @"payment_automatic_selection_criterion_tci";
}

+ (id)primaryTCIsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPaymentAutomaticSelectionCriterionPID:a4];
  v13[0] = v7;
  v8 = [a1 _predicateForIsPrimary:1];
  v13[1] = v8;
  v9 = +[NSArray arrayWithObjects:v13 count:2];
  v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];
  v11 = [a1 _TCIsInDatabase:v6 withPredicate:v10];

  return v11;
}

+ (id)TCIsInDatabase:(id)a3 forPaymentAutomaticSelectionCriterionPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPaymentAutomaticSelectionCriterionPID:a4];
  v13[0] = v7;
  v8 = [a1 _predicateForIsPrimary:0];
  v13[1] = v8;
  v9 = +[NSArray arrayWithObjects:v13 count:2];
  v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];
  v11 = [a1 _TCIsInDatabase:v6 withPredicate:v10];

  return v11;
}

+ (id)_TCIsInDatabase:(id)a3 withPredicate:(id)a4
{
  if (a4)
  {
    v4 = objc_msgSend(a1, "queryWithDatabase:predicate:", a3);
    id v5 = objc_alloc_init((Class)NSMutableSet);
    CFStringRef v13 = @"tci";
    id v6 = +[NSArray arrayWithObjects:&v13 count:1];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001C5740;
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

+ (id)insertPrimaryTCIs:(id)a3 TCIs:(id)a4 withPaymentAutomaticSelectionCriterion:(id)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12 && ([v10 count] || objc_msgSend(v11, "count")))
  {
    id v32 = v12;
    id v14 = [v12 persistentID];
    id v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v10, "count") + (void)objc_msgSend(v11, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v34 = v10;
    id v16 = v10;
    id v17 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v40;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [objc_alloc((Class)a1) initWithTCI:*(void *)(*((void *)&v39 + 1) + 8 * i) primary:1 forPaymentAutomaticSelectionCriterionPID:v14 database:v13];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v18);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v33 = v11;
    id v22 = v11;
    id v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v36;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8 * (void)j);
          if (!v16
            || ([v16 containsObject:*(void *)(*((void *)&v35 + 1) + 8 * (void)j)] & 1) == 0)
          {
            id v28 = [objc_alloc((Class)a1) initWithTCI:v27 primary:0 forPaymentAutomaticSelectionCriterionPID:v14 database:v13];
            if (v28) {
              [v15 addObject:v28];
            }
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v24);
    }

    if ([v15 count]) {
      v29 = v15;
    }
    else {
      v29 = 0;
    }
    id v30 = v29;

    id v11 = v33;
    id v10 = v34;
    id v12 = v32;
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

- (PaymentAutomaticSelectionTCI)initWithTCI:(id)a3 primary:(BOOL)a4 forPaymentAutomaticSelectionCriterionPID:(int64_t)a5 database:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = +[NSNull null];
  id v14 = +[NSNumber numberWithLongLong:a5];
  [v12 setObject:v14 forKeyedSubscript:@"payment_automatic_selection_criterion_pid"];

  id v15 = +[NSNumber numberWithBool:v7];
  [v12 setObject:v15 forKeyedSubscript:@"is_primary"];

  if (v11) {
    id v16 = v11;
  }
  else {
    id v16 = v13;
  }
  [v12 setObject:v16 forKeyedSubscript:@"tci"];

  id v17 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v10];
  return v17;
}

+ (id)_predicateForPaymentAutomaticSelectionCriterionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_automatic_selection_criterion_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForIsPrimary:(BOOL)a3
{
  v3 = +[NSNumber numberWithBool:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"is_primary" equalToValue:v3];

  return v4;
}

@end