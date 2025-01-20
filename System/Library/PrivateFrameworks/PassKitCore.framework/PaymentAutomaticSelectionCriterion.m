@interface PaymentAutomaticSelectionCriterion
+ (id)_criteriaInDatabase:(id)a3 forPredicate:(id)a4;
+ (id)_predicateForPaymentApplication:(id)a3;
+ (id)_predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)_propertySettersForCriterion;
+ (id)criteriaInDatabase:(id)a3 forPaymentApplication:(id)a4;
+ (id)criteriaInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4;
+ (id)databaseTable;
+ (id)insertCriteria:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4;
- (BOOL)deleteFromDatabase;
- (PaymentAutomaticSelectionCriterion)initWithCriterion:(id)a3 forPaymentApplication:(id)a4 database:(id)a5;
@end

@implementation PaymentAutomaticSelectionCriterion

+ (id)databaseTable
{
  return @"payment_automatic_selection_criterion";
}

+ (id)criteriaInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPaymentApplicationPID:a4];
  v8 = [a1 _criteriaInDatabase:v6 forPredicate:v7];

  return v8;
}

+ (id)_predicateForPaymentApplicationPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application_pid" equalToValue:v3];

  return v4;
}

+ (id)_criteriaInDatabase:(id)a3 forPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableSet);
  v9 = [a1 _propertySettersForCriterion];
  v10 = [v9 allKeys];
  v11 = [a1 queryWithDatabase:v6 predicate:v7];

  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_10044F97C;
  v20 = &unk_10072DE00;
  id v24 = a1;
  id v21 = v9;
  id v22 = v6;
  id v12 = v8;
  id v23 = v12;
  id v13 = v6;
  id v14 = v9;
  [v11 enumeratePersistentIDsAndProperties:v10 usingBlock:&v17];
  if (objc_msgSend(v12, "count", v17, v18, v19, v20)) {
    id v15 = [v12 copy];
  }
  else {
    id v15 = 0;
  }

  return v15;
}

+ (id)_propertySettersForCriterion
{
  v4[0] = @"type";
  v4[1] = @"mask";
  v5[0] = &stru_100752200;
  v5[1] = &stru_100752220;
  v4[2] = @"supports_express";
  v4[3] = @"supports_in_session_express";
  v5[2] = &stru_100752240;
  v5[3] = &stru_100752260;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)criteriaInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPaymentApplication:a4];
  id v8 = [a1 _criteriaInDatabase:v6 forPredicate:v7];

  return v8;
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  id v8 = [a1 _predicateForPaymentApplication:a4];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)insertCriteria:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10044FCD8;
    v16[3] = &unk_1007361E8;
    id v17 = v8;
    id v21 = a1;
    id v18 = v9;
    id v19 = v10;
    id v20 = v11;
    id v12 = v11;
    sub_10000817C((uint64_t)v19, v16);
    if ([v12 count]) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (PaymentAutomaticSelectionCriterion)initWithCriterion:(id)a3 forPaymentApplication:(id)a4 database:(id)a5
{
  if (a4)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    id v12 = +[NSNull null];
    id v13 = [v9 persistentID];

    id v14 = +[NSNumber numberWithLongLong:v13];
    [v11 setObject:v14 forKeyedSubscript:@"payment_application_pid"];

    uint64_t v15 = [v10 type];
    v16 = (void *)v15;
    if (v15) {
      id v17 = (void *)v15;
    }
    else {
      id v17 = v12;
    }
    [v11 setObject:v17 forKeyedSubscript:@"type"];

    uint64_t v18 = [v10 mask];
    id v19 = (void *)v18;
    if (v18) {
      id v20 = (void *)v18;
    }
    else {
      id v20 = v12;
    }
    [v11 setObject:v20 forKeyedSubscript:@"mask"];

    id v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 supportsExpress]);
    [v11 setObject:v21 forKeyedSubscript:@"supports_express"];

    id v22 = [v10 supportsInSessionExpress];
    id v23 = +[NSNumber numberWithBool:v22];
    [v11 setObject:v23 forKeyedSubscript:@"supports_in_session_express"];

    id v24 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
    self = v24;

    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = [(SQLiteEntity *)self database];
  id v4 = [(SQLiteEntity *)v2 persistentID];
  +[PaymentAutomaticSelectionTCI deleteEntitiesInDatabase:v3 forPaymentAutomaticSelectionCriterionPID:v4];
  +[PaymentAutomaticSelectionReaderId deleteEntitiesInDatabase:v3 forPaymentAutomaticSelectionCriterionPID:v4];
  +[ASCAssociatedReaderID deleteAssociatedReaderIDsForAutomaticSelectionCriterionPID:v4 inDatabase:v3];
  v6.receiver = v2;
  v6.super_class = (Class)PaymentAutomaticSelectionCriterion;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

+ (id)_predicateForPaymentApplication:(id)a3
{
  if (a3) {
    objc_msgSend(a1, "_predicateForPaymentApplicationPID:", objc_msgSend(a3, "persistentID"));
  }
  else {
  v3 = +[SQLiteBooleanPredicate falsePredicate];
  }
  return v3;
}

@end