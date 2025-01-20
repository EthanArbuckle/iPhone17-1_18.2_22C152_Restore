@interface AccountPromotion
+ (id)_anyInDatabase:(id)a3 withProgramIdentifier:(id)a4 accountPID:(int64_t)a5;
+ (id)_insertAccountPromotion:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForProgramIdentifier:(id)a3;
+ (id)_predicateForProgramIdentifier:(id)a3 accountPID:(int64_t)a4;
+ (id)_promotionsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_propertySettersForAccountPromotion;
+ (id)_propertyValuesForPromotion:(id)a3 accountPID:(int64_t)a4;
+ (id)_queryForPredicate:(id)a3 database:(id)a4;
+ (id)accountPromotionForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)accountPromotionsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)promotionPIDsForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountPromotion:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountPromotionsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAccountPromotion:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)insertOrUpdateAccountPromotions:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)populateAssociatedCompletionStepsForPromotion:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountPID:(int64_t)a5 inDatabase:(id)a6;
+ (void)updateImpressionCountsForPromotions:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountPromotion)initWithAccountPromotion:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)accountPromotion;
- (void)_updateWithAccountPromotion:(id)a3 accountPID:(int64_t)a4;
- (void)updateWithPromotionCompletionSteps:(id)a3;
@end

@implementation AccountPromotion

+ (id)databaseTable
{
  return @"yuzu";
}

- (AccountPromotion)initWithAccountPromotion:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[AccountPromotion _propertyValuesForPromotion:v9 accountPID:a4];
  v11 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  v12 = v11;
  v13 = [v9 completionSteps];

  if (v13 && [v13 count]) {
    [(AccountPromotion *)v12 updateWithPromotionCompletionSteps:v13];
  }

  return v12;
}

+ (id)accountPromotionsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  if (v7)
  {
    id v8 = [a1 _promotionsWithPredicate:v7 inDatabase:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)promotionPIDsForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _predicateForProgramIdentifier:a3 accountPID:a4];
  if (v9)
  {
    v10 = [a1 _queryForPredicate:v9 database:v8];
    +[NSMutableArray array];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000636B0;
    v14[3] = &unk_100731020;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v11;
    [v10 enumeratePersistentIDsUsingBlock:v14];
    if ([v11 count]) {
      id v12 = [v11 copy];
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)_promotionsWithPredicate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _queryForPredicate:a3 database:v6];
  id v8 = [a1 _propertySettersForAccountPromotion];
  id v9 = +[NSMutableArray array];
  v10 = [v8 allKeys];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100063860;
  v19 = &unk_10072DE00;
  id v20 = v8;
  id v21 = v6;
  id v22 = v9;
  id v23 = a1;
  id v11 = v9;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  id v14 = objc_msgSend(v11, "copy", v16, v17, v18, v19);
  return v14;
}

+ (id)_anyInDatabase:(id)a3 withProgramIdentifier:(id)a4 accountPID:(int64_t)a5
{
  id v8 = a3;
  id v9 = [a1 _predicateForProgramIdentifier:a4 accountPID:a5];
  if (v9)
  {
    v10 = [a1 anyInDatabase:v8 predicate:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)accountPromotionForProgramIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  v5 = [a1 _anyInDatabase:a5 withProgramIdentifier:a3 accountPID:a4];
  id v6 = [v5 accountPromotion];

  return v6;
}

+ (void)insertOrUpdateAccountPromotions:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deleteAccountPromotionsForAccountPID:a4 inDatabase:v9];
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
        objc_msgSend(a1, "insertOrUpdateAccountPromotion:accountPID:inDatabase:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), a4, v9, (void)v15);
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

+ (void)insertOrUpdateAccountPromotion:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [v12 programIdentifier];
  id v10 = [a1 _anyInDatabase:v8 withProgramIdentifier:v9 accountPID:a4];

  if (v10) {
    [v10 _updateWithAccountPromotion:v12 accountPID:a4];
  }
  else {
    id v11 = [a1 _insertAccountPromotion:v12 forAccountPID:a4 inDatabase:v8];
  }
}

+ (id)_insertAccountPromotion:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountPromotion:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAccountPromotionsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteAccountPromotion:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a3 programIdentifier];
  id v10 = [a1 _anyInDatabase:v8 withProgramIdentifier:v9 accountPID:a4];

  [v10 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)self database];
  +[AccountPromotionCompletionStep deletePromotionCompletionStepsForPromotionPID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)AccountPromotion;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (void)updateImpressionCountsForPromotions:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v15 = [v14 impressionCount];
        long long v16 = [v14 programIdentifier];
        [a1 updateImpressionCount:v15 promotionProgramIdentifier:v16 accountPID:a4 inDatabase:v9];
      }
      id v11 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

+ (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountPID:(int64_t)a5 inDatabase:(id)a6
{
  id v8 = [a1 _anyInDatabase:a6 withProgramIdentifier:a4 accountPID:a5];
  v7 = +[NSNumber numberWithInteger:a3];
  [v8 setValue:v7 forProperty:@"j"];
}

- (void)_updateWithAccountPromotion:(id)a3 accountPID:(int64_t)a4
{
  id v6 = a3;
  id v8 = +[AccountPromotion _propertyValuesForPromotion:v6 accountPID:a4];
  [(SQLiteEntity *)self setValuesWithDictionary:v8];
  v7 = [v6 completionSteps];

  [(AccountPromotion *)self updateWithPromotionCompletionSteps:v7];
}

+ (id)_predicateForProgramIdentifier:(id)a3
{
  if (a3)
  {
    v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  uint64_t v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForProgramIdentifier:(id)a3 accountPID:(int64_t)a4
{
  id v6 = [a1 _predicateForProgramIdentifier:a3];
  uint64_t v7 = [a1 _predicateForAccountPID:a4];
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

+ (id)_queryForPredicate:(id)a3 database:(id)a4
{
  CFStringRef v13 = @"d";
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v13 count:1];
  CFStringRef v12 = @"DESC";
  id v9 = +[NSArray arrayWithObjects:&v12 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  return v10;
}

+ (id)_propertySettersForAccountPromotion
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100731060;
  v5[1] = &stru_100731080;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_1007310A0;
  v5[3] = &stru_1007310C0;
  v4[4] = @"f";
  v4[5] = @"i";
  v5[4] = &stru_1007310E0;
  v5[5] = &stru_100731100;
  v4[6] = @"j";
  v5[6] = &stru_100731120;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

- (id)accountPromotion
{
  id v3 = objc_alloc_init((Class)PKAccountPromotion);
  v4 = [(id)objc_opt_class() _propertySettersForAccountPromotion];
  v5 = [v4 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000646F8;
  v14[3] = &unk_10072DDD8;
  void v14[4] = self;
  id v15 = v4;
  id v6 = v3;
  id v16 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  id v8 = objc_opt_class();
  int64_t v9 = [(SQLiteEntity *)self persistentID];
  id v10 = [(SQLiteEntity *)self database];
  [v8 populateAssociatedCompletionStepsForPromotion:v6 promotionPID:v9 inDatabase:v10];

  id v11 = v16;
  id v12 = v6;

  return v12;
}

- (void)updateWithPromotionCompletionSteps:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SQLiteEntity *)self persistentID];
  id v6 = [(SQLiteEntity *)self database];
  +[AccountPromotionCompletionStep insertOrUpdatePromotionCompletionSteps:v4 promotionPID:v5 inDatabase:v6];
}

+ (void)populateAssociatedCompletionStepsForPromotion:(id)a3 promotionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v10 = a3;
  id v7 = +[AccountPromotionCompletionStep accountPromotionCompletionStepsForPromotionPID:a4 inDatabase:a5];
  if ([v7 count]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  [v10 setCompletionSteps:v9];
}

+ (id)_propertyValuesForPromotion:(id)a3 accountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = +[NSNumber numberWithLongLong:a4];
  [v6 setObjectOrNull:v7 forKey:@"a"];

  id v8 = [v5 programIdentifier];
  [v6 setObjectOrNull:v8 forKey:@"b"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "type"), @"c");
  id v9 = [v5 startDate];
  id v10 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v10 forKey:@"d"];

  id v11 = [v5 endDate];
  id v12 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v12 forKey:@"e"];

  CFStringRef v13 = [v5 name];
  [v6 setObjectOrNull:v13 forKey:@"f"];

  id v14 = [v5 termsURL];
  id v15 = [v14 absoluteString];
  [v6 setObjectOrNull:v15 forKey:@"h"];

  id v16 = [v5 templateIdentifier];
  [v6 setObjectOrNull:v16 forKey:@"g"];

  long long v17 = [v5 layoutData];
  [v6 setObjectOrNull:v17 forKey:@"i"];

  id v18 = [v5 impressionCount];
  [v6 setInteger:v18 forKey:@"j"];
  id v19 = [v6 copy];

  return v19;
}

@end