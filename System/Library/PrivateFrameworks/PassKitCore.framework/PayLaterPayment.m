@interface PayLaterPayment
+ (id)_paymentsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForAssociatedTransactionPaymentHash:(id)a3;
+ (id)_predicateForPaymentIdentifier:(id)a3;
+ (id)_predicateForPaymentIdentifiers:(id)a3;
+ (id)_predicateForScheduleSummaryPID:(int64_t)a3;
+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 paymentIdentifier:(id)a4;
+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 paymentIdentifiers:(id)a4;
+ (id)_propertySettersForPayLaterPayment;
+ (id)_propertyValuesForPayLaterPayment:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterPayment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterPayments:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterFinancingPlanIdentifierForPaymentWithPaymentAssociatedTransactionPaymentHash:(id)a3 inDatabase:(id)a4;
+ (id)payLaterPaymentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)payLaterPaymentsForScheduleSummaryPID:(int64_t)a3 paymentIdentifiers:(id)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deletePayLaterPaymentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterPayment)initWithPayLaterPayment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_amount;
- (id)_interestPaid;
- (id)_principalPaid;
- (id)planIdentifier;
- (void)updateWithPayLaterPayment:(id)a3;
@end

@implementation PayLaterPayment

+ (id)databaseTable
{
  return @"pineberry";
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
  v9 = v7;
  if (v7 == @"huckleberry.b"
    || v7 && (unsigned int v8 = [@"huckleberry.b" isEqualToString:v7], v9, v8))
  {
    [v6 addObject:@"JOIN huckleberry ON huckleberry.pid = asparagus.a"];
    [v6 addObject:@"JOIN asparagus ON asparagus.pid = pineberry.a"];
  }
}

- (PayLaterPayment)initWithPayLaterPayment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPayLaterPayment:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

+ (id)insertOrUpdatePayLaterPayment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 paymentIdentifier];
  id v11 = [a1 _predicateForScheduleSummaryPID:a4 paymentIdentifier:v10];
  id v12 = [a1 anyInDatabase:v9 predicate:v11];

  if (v12) {
    [v12 updateWithPayLaterPayment:v8];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithPayLaterPayment:v8 forScheduleSummaryPID:a4 inDatabase:v9];
  }
  id v13 = [v12 persistentID];
  v14 = [v8 fundingSources];
  id v15 = [v14 count];

  if (v15)
  {
    v16 = [v8 fundingSources];
    +[PayLaterPaymentFundingSource insertOrUpdateInstallmentPaymentFundingSources:v16 forInstallmentPaymentPID:v13 inDatabase:v9];
  }
  else
  {
    +[PayLaterPaymentFundingSource deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:v13 inDatabase:v9];
  }

  return v12;
}

+ (id)insertOrUpdatePayLaterPayments:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterPaymentsForScheduleSummaryPID:a4 inDatabase:v9];
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(a1, "insertOrUpdatePayLaterPayment:forScheduleSummaryPID:inDatabase:", *(void *)(*((void *)&v19 + 1) + 8 * i), a4, v9, (void)v19);
        [v10 safelyAddObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = [v10 copy];
  return v17;
}

- (void)updateWithPayLaterPayment:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPayLaterPayment:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)payLaterPaymentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForScheduleSummaryPID:a3];
  id v8 = [a1 _paymentsWithPredicate:v7 inDatabase:v6];

  return v8;
}

+ (id)payLaterPaymentsForScheduleSummaryPID:(int64_t)a3 paymentIdentifiers:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _predicateForScheduleSummaryPID:a3 paymentIdentifiers:a4];
  id v10 = [a1 _paymentsWithPredicate:v9 inDatabase:v8];

  return v10;
}

+ (id)payLaterFinancingPlanIdentifierForPaymentWithPaymentAssociatedTransactionPaymentHash:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAssociatedTransactionPaymentHash:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 planIdentifier];

  return v9;
}

+ (id)_paymentsWithPredicate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  CFStringRef v30 = @"f";
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v30 count:1];
  CFStringRef v29 = @"ASC";
  id v9 = +[NSArray arrayWithObjects:&v29 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  id v11 = [a1 _propertySettersForPayLaterPayment];
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v13 = [v11 allKeys];
  long long v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  long long v22 = sub_1001A460C;
  v23 = &unk_10073C4A8;
  id v27 = v12;
  id v28 = a1;
  id v24 = v10;
  id v25 = v11;
  id v26 = v6;
  id v14 = v12;
  id v15 = v6;
  id v16 = v11;
  id v17 = v10;
  [v17 enumeratePersistentIDsAndProperties:v13 usingBlock:&v20];

  id v18 = objc_msgSend(v14, "copy", v20, v21, v22, v23);
  return v18;
}

+ (void)deletePayLaterPaymentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForScheduleSummaryPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)self database];
  +[PayLaterPaymentFundingSource deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)PayLaterPayment;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

- (id)_amount
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"g"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"gc"];
  objc_super v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
  }

  return v8;
}

- (id)_interestPaid
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"h"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"hc"];
  objc_super v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
  }

  return v8;
}

- (id)_principalPaid
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"i"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"ic"];
  objc_super v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
  }

  return v8;
}

- (id)planIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"huckleberry.b"];
}

+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 paymentIdentifier:(id)a4
{
  id v6 = a4;
  BOOL v7 = [a1 _predicateForScheduleSummaryPID:a3];
  id v8 = [a1 _predicateForPaymentIdentifier:v6];

  v12[0] = v7;
  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 paymentIdentifiers:(id)a4
{
  id v6 = a4;
  BOOL v7 = [a1 _predicateForScheduleSummaryPID:a3];
  id v8 = [a1 _predicateForPaymentIdentifiers:v6];

  v12[0] = v7;
  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForScheduleSummaryPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPaymentIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForPaymentIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SQLiteBooleanPredicate falsePredicate];
  if ([v4 count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(a1, "_predicateForPaymentIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          [v6 addObject:v12];
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    uint64_t v13 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v6];

    uint64_t v5 = (void *)v13;
  }

  return v5;
}

+ (id)_predicateForAssociatedTransactionPaymentHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"l" equalToValue:a3];
}

+ (id)_propertyValuesForPayLaterPayment:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [v3 paymentIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "type"), @"d");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "subtype"), @"subtype");
  id v6 = [v3 postedDate];
  id v7 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v7 forKey:@"f"];

  id v8 = [v3 amount];
  id v9 = [v8 amount];
  uint64_t v10 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v10 forKey:@"g"];

  id v11 = [v3 amount];
  id v12 = [v11 currency];
  [v4 setObjectOrNull:v12 forKey:@"gc"];

  uint64_t v13 = [v3 interestPaid];
  id v14 = [v13 amount];
  long long v15 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v15 forKey:@"h"];

  long long v16 = [v3 interestPaid];
  long long v17 = [v16 currency];
  [v4 setObjectOrNull:v17 forKey:@"hc"];

  long long v18 = [v3 principalPaid];
  long long v19 = [v18 amount];
  long long v20 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v20 forKey:@"i"];

  uint64_t v21 = [v3 principalPaid];
  long long v22 = [v21 currency];
  [v4 setObjectOrNull:v22 forKey:@"ic"];

  v23 = [v3 associatedTransactionPaymentHash];

  [v4 setObjectOrNull:v23 forKey:@"l"];
  id v24 = [v4 copy];

  return v24;
}

+ (id)_propertySettersForPayLaterPayment
{
  v4[0] = @"b";
  v4[1] = @"d";
  v5[0] = &stru_10073C4E8;
  v5[1] = &stru_10073C508;
  v4[2] = @"subtype";
  v4[3] = @"f";
  v5[2] = &stru_10073C528;
  v5[3] = &stru_10073C548;
  v4[4] = @"l";
  v5[4] = &stru_10073C568;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

@end