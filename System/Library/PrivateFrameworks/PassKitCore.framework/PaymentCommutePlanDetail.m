@interface PaymentCommutePlanDetail
+ (id)_postProcessValue:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentPass:(id)a3;
+ (id)_propertySettersForPaymentPlan;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPaymentPlan:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5;
+ (id)paymentPlansInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4;
+ (id)updateWitPaymentPlans:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5;
+ (int64_t)countInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5;
- (PaymentCommutePlanDetail)initWithPaymentPlan:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5;
- (id)identifier;
- (id)passUniqueIdentifier;
- (id)paymentPlan;
@end

@implementation PaymentCommutePlanDetail

- (PaymentCommutePlanDetail)initWithPaymentPlan:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = [v9 persistentID];

  v13 = +[NSNumber numberWithLongLong:v12];
  [v11 setObjectOrNull:v13 forKey:@"a"];

  v14 = [v10 identifier];
  [v11 setObjectOrNull:v14 forKey:@"b"];

  v15 = [v10 uniqueIdentifier];
  [v11 setObjectOrNull:v15 forKey:@"i"];

  v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 value]);
  [v11 setObjectOrNull:v16 forKey:@"e"];

  v17 = [v10 startDate];
  v18 = (void *)_SQLValueForDate();
  [v11 setObjectOrNull:v18 forKey:@"f"];

  v19 = [v10 expiryDate];
  v20 = (void *)_SQLValueForDate();
  [v11 setObjectOrNull:v20 forKey:@"g"];

  v21 = [v10 lastUpdateDate];
  v22 = (void *)_SQLValueForDate();
  [v11 setObjectOrNull:v22 forKey:@"h"];

  v23 = [v10 localizedTitle];
  [v11 setObjectOrNull:v23 forKey:@"c"];

  v24 = [v10 localizedDescription];

  [v11 setObjectOrNull:v24 forKey:@"d"];
  v27.receiver = self;
  v27.super_class = (Class)PaymentCommutePlanDetail;
  v25 = [(SQLiteEntity *)&v27 initWithPropertyValues:v11 inDatabase:v8];

  return v25;
}

+ (id)databaseTable
{
  return @"carambola";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  else {
    return 0;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  CFStringRef v9 = @"pass.unique_id";
  id v6 = a3;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];
  unsigned int v8 = objc_msgSend(v7, "containsObject:", v6, v9);

  if (v8) {
    [v5 addObject:@"JOIN pass ON pass.pid = carambola.a"];
  }
}

+ (id)insertPaymentPlan:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPaymentPlan:v10 paymentPass:v9 inDatabase:v8];

  return v11;
}

+ (id)updateWitPaymentPlans:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  [a1 deleteEntitiesForPass:v9 inDatabase:v10];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v8;
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
        v17 = objc_msgSend(a1, "insertPaymentPlan:withPaymentPass:inDatabase:", *(void *)(*((void *)&v21 + 1) + 8 * i), v9, v10, (void)v21);
        v18 = [v17 paymentPlan];
        [v11 safelyAddObject:v18];
      }
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  id v19 = [v11 copy];
  return v19;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentPass:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5
{
  id v8 = a4;
  id v9 = [a1 _predicateForPaymentPass:a3];
  CFStringRef v18 = @"h";
  id v10 = +[NSArray arrayWithObjects:&v18 count:1];
  CFStringRef v17 = @"ASC";
  id v11 = +[NSArray arrayWithObjects:&v17 count:1];
  id v12 = [a1 queryWithDatabase:v8 predicate:v9 orderingProperties:v10 orderingDirections:v11];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10038C324;
  v14[3] = &unk_100748F08;
  id v15 = v8;
  int64_t v16 = a5;
  id v13 = v8;
  [v12 enumeratePersistentIDsUsingBlock:v14];
}

+ (int64_t)countInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPassWithUniqueIdentifier:a4];
  id v8 = [a1 countInDatabase:v6 predicate:v7];

  return (int64_t)v8;
}

+ (id)paymentPlansInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPassWithUniqueIdentifier:a4];
  CFStringRef v26 = @"h";
  id v8 = +[NSArray arrayWithObjects:&v26 count:1];
  CFStringRef v25 = @"DESC";
  id v9 = +[NSArray arrayWithObjects:&v25 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  id v11 = [a1 _propertySettersForPaymentPlan];
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v13 = [v11 allKeys];
  CFStringRef v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_10038C5E8;
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

- (id)paymentPlan
{
  id v3 = objc_alloc_init((Class)PKPaymentCommutePlanDetail);
  v4 = +[PaymentCommutePlanDetail _propertySettersForPaymentPlan];
  id v5 = [v4 allKeys];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10038C7A8;
  id v13 = &unk_10072EDD0;
  id v14 = v4;
  id v15 = v3;
  id v6 = v3;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v10];

  id v8 = +[PaymentCommutePlanDetail _postProcessValue:](PaymentCommutePlanDetail, "_postProcessValue:", v6, v10, v11, v12, v13);

  return v8;
}

- (id)identifier
{
  return [(SQLiteEntity *)self valueForProperty:@"b"];
}

- (id)passUniqueIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"pass.unique_id"];
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForPaymentPass:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (id)_propertySettersForPaymentPlan
{
  v4[0] = @"b";
  v4[1] = @"i";
  v5[0] = &stru_10074CB58;
  v5[1] = &stru_10074CB78;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_10074CB98;
  v5[3] = &stru_10074CBB8;
  v4[4] = @"e";
  v4[5] = @"f";
  v5[4] = &stru_10074CBD8;
  v5[5] = &stru_10074CBF8;
  v4[6] = @"g";
  v4[7] = @"h";
  v5[6] = &stru_10074CC18;
  v5[7] = &stru_10074CC38;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
  return v2;
}

+ (id)_postProcessValue:(id)a3
{
  id v3 = a3;
  v4 = [v3 startDate];
  if (v4)
  {

    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v3 expiryDate];
    BOOL v5 = v6 == 0;
  }
  [v3 setPlanType:v5];
  return v3;
}

@end