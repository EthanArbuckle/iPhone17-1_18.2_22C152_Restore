@interface PaymentTransactionQuestion
+ (id)_paymentTransactionQuestionsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_paymentTransactionQuestionsWithQuery:(id)a3;
+ (id)_predicateForPaymentTransaction:(id)a3;
+ (id)_predicateForPaymentTransactionIdentifier:(id)a3;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_predicateForQuestionWithType:(int64_t)a3;
+ (id)_propertySettersForPaymentTransactionQuestion;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)paymentTransactionQuestionsInDatabase:(id)a3 forPaymentTransaction:(id)a4;
+ (id)paymentTransactionQuestionsInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)associateQuestionsToPaymentTransactions:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePaymentTransactionQuestions:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5;
- (PaymentTransactionQuestion)initWithPaymentTransactionQuestion:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5;
- (void)updateWithPaymentTransactionQuestion:(id)a3;
@end

@implementation PaymentTransactionQuestion

- (PaymentTransactionQuestion)initWithPaymentTransactionQuestion:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[NSMutableDictionary dictionary];
  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "type"), @"b");
  objc_msgSend(v11, "setBool:forKey:", objc_msgSend(v10, "answered"), @"d");
  objc_msgSend(v11, "setBool:forKey:", objc_msgSend(v10, "answeredOnThisDevice"), @"e");
  v12 = [v10 expirationDate];

  v13 = (void *)_SQLValueForDate();
  [v11 setObjectOrNull:v13 forKey:@"c"];

  id v14 = [v9 persistentID];
  v15 = +[NSNumber numberWithLongLong:v14];
  [v11 setObject:v15 forKey:@"a"];

  v16 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v16;
}

+ (id)databaseTable
{
  return @"mangos";
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
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  id v9 = v7;
  if (v7 == @"payment_transaction.identifier"
    || v7
    && (unsigned int v8 = [@"payment_transaction.identifier" isEqualToString:v7],
        v9,
        v8))
  {
    [v6 addObject:@"JOIN payment_transaction ON payment_transaction.pid = mangos.a"];
  }
}

- (void)updateWithPaymentTransactionQuestion:(id)a3
{
  id v7 = a3;
  v4 = +[NSMutableDictionary dictionary];
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v7, "type"), @"b");
  id v5 = [v7 expirationDate];
  id v6 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v6 forKey:@"c"];

  if ([v7 answered]) {
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v7, "answered"), @"d");
  }
  if ([v7 answeredOnThisDevice]) {
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v7, "answeredOnThisDevice"), @"e");
  }
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (void)updatePaymentTransactionQuestions:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v30 = objc_alloc_init((Class)NSMutableArray);
  v27 = v9;
  v29 = [a1 _predicateForPaymentTransaction:v9];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v16 = objc_msgSend(a1, "_predicateForQuestionWithType:", objc_msgSend(v15, "type"));
        v38[0] = v16;
        v38[1] = v29;
        v17 = +[NSArray arrayWithObjects:v38 count:2];
        v18 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v17];
        id v19 = [a1 anyInDatabase:v10 predicate:v18];

        if (v19) {
          [v19 updateWithPaymentTransactionQuestion:v15];
        }
        else {
          id v19 = [objc_alloc((Class)a1) initWithPaymentTransactionQuestion:v15 paymentTransaction:v27 inDatabase:v10];
        }
        v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 type]);
        [v30 addObject:v20];
      }
      id v12 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v12);
  }

  v21 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"b" values:v30];
  v37[0] = v21;
  v37[1] = v29;
  v22 = +[NSArray arrayWithObjects:v37 count:2];
  v23 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v22];

  v24 = [a1 queryWithDatabase:v10 predicate:v23];
  if (([v24 deleteAllEntities] & 1) == 0)
  {
    v25 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v27 identifier];
      *(_DWORD *)buf = 138412290;
      v36 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to delete obsolete payment transaction questions for %@", buf, 0xCu);
    }
  }
}

+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentTransaction:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentTransactionPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)paymentTransactionQuestionsInDatabase:(id)a3 forPaymentTransaction:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPaymentTransaction:a4];
  id v8 = [a1 _paymentTransactionQuestionsInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (id)paymentTransactionQuestionsInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPaymentTransactionIdentifier:a4];
  id v8 = [a1 _paymentTransactionQuestionsInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (void)associateQuestionsToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 allKeys];
  id v9 = [a1 _predicateForPaymentTransactionPIDs:v8];
  v26 = v7;
  id v10 = +[SQLiteEntity queryWithDatabase:v7 predicate:v9];

  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = [a1 _propertySettersForPaymentTransactionQuestion];
  uint64_t v13 = [v12 allKeys];
  id v14 = [v13 arrayByAddingObject:@"a"];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10048AA1C;
  v31[3] = &unk_10072EAD8;
  id v34 = a1;
  id v15 = v12;
  id v32 = v15;
  id v16 = v11;
  id v33 = v16;
  [v10 enumeratePersistentIDsAndProperties:v14 usingBlock:v31];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v23 = [v6 objectForKey:v22];
        v24 = [v17 objectForKey:v22];
        if ([v24 count])
        {
          id v25 = [v24 copy];
          [v23 setQuestions:v25];
        }
        else
        {
          [v23 setQuestions:0];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }
}

+ (id)_paymentTransactionQuestionsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v5 = +[SQLiteEntity queryWithDatabase:a3 predicate:a4];
  id v6 = [a1 _paymentTransactionQuestionsWithQuery:v5];

  return v6;
}

+ (id)_paymentTransactionQuestionsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForPaymentTransactionQuestion];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10048AC98;
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

+ (id)_predicateForQuestionWithType:(int64_t)a3
{
  v3 = +[NSNumber numberWithInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPaymentTransactionIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction.identifier" equalToValue:a3];
}

+ (id)_predicateForPaymentTransaction:(id)a3
{
  id v4 = [a3 persistentID];
  return [a1 _predicateForPaymentTransactionPID:v4];
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"a" values:a3];
}

+ (id)_propertySettersForPaymentTransactionQuestion
{
  v4[0] = @"b";
  v4[1] = @"d";
  v5[0] = &stru_1007543A0;
  v5[1] = &stru_1007543C0;
  v4[2] = @"e";
  v4[3] = @"c";
  v5[2] = &stru_1007543E0;
  v5[3] = &stru_100754400;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end