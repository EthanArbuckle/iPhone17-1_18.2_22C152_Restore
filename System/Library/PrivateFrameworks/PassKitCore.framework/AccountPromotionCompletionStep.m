@interface AccountPromotionCompletionStep
+ (id)_anyInDatabase:(id)a3 withPromotionPID:(int64_t)a4 index:(int64_t)a5;
+ (id)_insertAccountPromotionCompletionStep:(id)a3 forPromotionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForIndex:(int64_t)a3;
+ (id)_predicateForPromotionPID:(int64_t)a3;
+ (id)_predicateForPromotionPID:(int64_t)a3 index:(int64_t)a4;
+ (id)_promotionCompletionStepsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_propertySettersForAccountPromotionCompletionStep;
+ (id)_propertyValuesForCompletionStep:(id)a3 promotionPID:(int64_t)a4;
+ (id)accountPromotionCompletionStepsForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)accountPromotionCompletionStepsForPromotionPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deletePromotionCompletionStepsForPromotionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePromotionCompletionStep:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)insertOrUpdatePromotionCompletionSteps:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountPromotionCompletionStep)initWithAccountPromotionCompletionStep:(id)a3 forPromotionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)completionStep;
- (void)_updateWithPromotionCompletionStep:(id)a3 promotionPID:(int64_t)a4;
@end

@implementation AccountPromotionCompletionStep

+ (id)databaseTable
{
  return @"tomatillo";
}

- (AccountPromotionCompletionStep)initWithAccountPromotionCompletionStep:(id)a3 forPromotionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = +[AccountPromotionCompletionStep _propertyValuesForCompletionStep:a3 promotionPID:a4];
  v10 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

+ (id)accountPromotionCompletionStepsForPromotionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPromotionPID:a3];
  id v8 = [a1 _promotionCompletionStepsWithPredicate:v7 inDatabase:v6];

  return v8;
}

+ (id)accountPromotionCompletionStepsForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = +[AccountPromotion promotionPIDsForProgramIdentifier:a3 accountPID:a4 inDatabase:v8];
  v10 = v9;
  if (v9 && [v9 count])
  {
    id v11 = objc_alloc_init((Class)NSMutableSet);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(a1, "accountPromotionCompletionStepsForPromotionPID:inDatabase:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "longLongValue", (void)v21), v8);
          v18 = v17;
          if (v17 && [v17 count]) {
            [v11 addObjectsFromArray:v18];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    if ([v11 count]) {
      id v19 = [v11 copy];
    }
    else {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)_promotionCompletionStepsWithPredicate:(id)a3 inDatabase:(id)a4
{
  CFStringRef v26 = @"b";
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v26 count:1];
  CFStringRef v25 = @"ASC";
  v9 = +[NSArray arrayWithObjects:&v25 count:1];
  v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  id v11 = [a1 _propertySettersForAccountPromotionCompletionStep];
  id v12 = +[NSMutableArray array];
  id v13 = [v11 allKeys];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_1000E6FF4;
  long long v21 = &unk_10072EAD8;
  id v23 = v12;
  id v24 = a1;
  id v22 = v11;
  id v14 = v12;
  id v15 = v11;
  [v10 enumeratePersistentIDsAndProperties:v13 usingBlock:&v18];

  id v16 = objc_msgSend(v14, "copy", v18, v19, v20, v21);
  return v16;
}

+ (void)insertOrUpdatePromotionCompletionSteps:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePromotionCompletionStepsForPromotionPID:a4 inDatabase:v9];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(a1, "insertOrUpdatePromotionCompletionStep:promotionPID:inDatabase:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), a4, v9, (void)v15);
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

+ (void)insertOrUpdatePromotionCompletionStep:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = objc_msgSend(a1, "_anyInDatabase:withPromotionPID:index:", v8, a4, objc_msgSend(v12, "index"));
  id v10 = v9;
  if (v9) {
    [v9 _updateWithPromotionCompletionStep:v12 promotionPID:a4];
  }
  else {
    id v11 = [a1 _insertAccountPromotionCompletionStep:v12 forPromotionPID:a4 inDatabase:v8];
  }
}

+ (id)_anyInDatabase:(id)a3 withPromotionPID:(int64_t)a4 index:(int64_t)a5
{
  id v8 = a3;
  id v9 = [a1 _predicateForPromotionPID:a4 index:a5];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (id)_insertAccountPromotionCompletionStep:(id)a3 forPromotionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountPromotionCompletionStep:v9 forPromotionPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deletePromotionCompletionStepsForPromotionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPromotionPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (void)_updateWithPromotionCompletionStep:(id)a3 promotionPID:(int64_t)a4
{
  id v5 = +[AccountPromotionCompletionStep _propertyValuesForCompletionStep:a3 promotionPID:a4];
  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForPromotionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForIndex:(int64_t)a3
{
  v3 = +[NSNumber numberWithInteger:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPromotionPID:(int64_t)a3 index:(int64_t)a4
{
  id v6 = [a1 _predicateForPromotionPID:a3];
  uint64_t v7 = [a1 _predicateForIndex:a4];
  id v8 = (void *)v7;
  id v9 = 0;
  if (v6 && v7)
  {
    v12[0] = v6;
    v12[1] = v7;
    id v10 = +[NSArray arrayWithObjects:v12 count:2];
    id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];
  }
  return v9;
}

+ (id)_propertySettersForAccountPromotionCompletionStep
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100735F20;
  v5[1] = &stru_100735F40;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100735F60;
  v5[3] = &stru_100735F80;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100735FA0;
  v5[5] = &stru_100735FC0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

- (id)completionStep
{
  id v3 = objc_alloc_init((Class)PKAccountPromotionCompletionStep);
  v4 = [(id)objc_opt_class() _propertySettersForAccountPromotionCompletionStep];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E79CC;
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

+ (id)_propertyValuesForCompletionStep:(id)a3 promotionPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = +[NSNumber numberWithLongLong:a4];
  [v6 setObjectOrNull:v7 forKey:@"a"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "index"), @"b");
  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "progressType"), @"c");
  id v8 = [v5 currencyCode];
  [v6 setObjectOrNull:v8 forKey:@"d"];

  id v9 = [v5 endValue];
  id v10 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v10 forKey:@"e"];

  id v11 = [v5 currentValue];
  id v12 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v12 forKey:@"f"];

  id v13 = [v5 completed];
  [v6 setBool:v13 forKey:@"g"];
  id v14 = [v6 copy];

  return v14;
}

@end