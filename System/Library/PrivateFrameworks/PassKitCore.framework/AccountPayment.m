@interface AccountPayment
+ (id)_commonInitWithPayment:(id)a3 accountIdentifier:(id)a4;
+ (id)_paymentsFromQuery:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_predicateForFailedRecurringPaymentsWithAccountIdentifier:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForScheduledPaymentsWithAccountIdentifier:(id)a3;
+ (id)_predicateForTransactionReferenceIdentifier:(id)a3;
+ (id)_predicateForTransactionServiceIdentifier:(id)a3;
+ (id)_propertySetterForFundingDetailsName;
+ (id)_propertySettersForAccountPayment;
+ (id)databaseTable;
+ (id)failedRecurringPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)insertPayment:(id)a3 forEventPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6;
+ (id)insertScheduledPayment:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)paymentsForTransactionReferenceIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)paymentsForTransactionServiceIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)paymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)paymentsWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)scheduledPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deletePaymentWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteScheduledPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
- (id)currencyAmount;
- (id)payment;
@end

@implementation AccountPayment

+ (id)paymentsForTransactionServiceIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForTransactionServiceIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _paymentsFromQuery:v8];
  v10 = +[NSSortDescriptor sortDescriptorWithKey:@"paymentDate" ascending:0];
  v15[0] = v10;
  v11 = +[NSSortDescriptor sortDescriptorWithKey:@"state" ascending:0];
  v15[1] = v11;
  v12 = +[NSArray arrayWithObjects:v15 count:2];

  v13 = [v9 sortedArrayUsingDescriptors:v12];

  return v13;
}

+ (id)paymentsForTransactionReferenceIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForTransactionReferenceIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _paymentsFromQuery:v8];
  v10 = +[NSSortDescriptor sortDescriptorWithKey:@"paymentDate" ascending:0];
  v15[0] = v10;
  v11 = +[NSSortDescriptor sortDescriptorWithKey:@"state" ascending:0];
  v15[1] = v11;
  v12 = +[NSArray arrayWithObjects:v15 count:2];

  v13 = [v9 sortedArrayUsingDescriptors:v12];

  return v13;
}

+ (id)paymentsWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEventPID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _paymentsFromQuery:v8];

  return v9;
}

+ (id)paymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _paymentsFromQuery:v8];

  return v9;
}

+ (id)scheduledPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForScheduledPaymentsWithAccountIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _paymentsFromQuery:v8];

  return v9;
}

+ (id)failedRecurringPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForFailedRecurringPaymentsWithAccountIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _paymentsFromQuery:v8];

  return v9;
}

+ (id)_paymentsFromQuery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v16 = @"pid";
  v5 = +[NSArray arrayWithObjects:&v16 count:1];
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_100147864;
  v13 = &unk_10072ED00;
  id v14 = v3;
  id v15 = v4;
  id v6 = v4;
  id v7 = v3;
  [v7 enumeratePersistentIDsAndProperties:v5 usingBlock:&v10];

  id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);
  return v8;
}

+ (id)insertPayment:(id)a3 forEventPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  uint64_t v11 = [a1 _commonInitWithPayment:a3 accountIdentifier:a5];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObject:v12 forKey:@"a"];

  id v13 = [objc_alloc((Class)a1) initWithPropertyValues:v11 inDatabase:v10];
  return v13;
}

+ (id)insertScheduledPayment:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [a1 _commonInitWithPayment:a3 accountIdentifier:a4];
  id v10 = [objc_alloc((Class)a1) initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

+ (id)_commonInitWithPayment:(id)a3 accountIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = [v5 identifier];
  [v7 setObjectOrNull:v8 forKey:@"b"];

  v9 = [v5 referenceIdentifier];
  [v7 setObjectOrNull:v9 forKey:@"e"];

  id v10 = [v5 clientReferenceIdentifier];
  [v7 setObjectOrNull:v10 forKey:@"p"];

  uint64_t v11 = [v5 currencyAmount];
  v12 = [v11 amount];
  id v13 = PKCurrencyDecimalToStorageNumber();

  [v7 setObjectOrNull:v13 forKey:@"c"];
  id v14 = [v5 currencyAmount];
  id v15 = [v14 currency];
  [v7 setObjectOrNull:v15 forKey:@"d"];

  CFStringRef v16 = [v5 paymentDate];
  v17 = (void *)_SQLValueForDate();
  [v7 setObjectOrNull:v17 forKey:@"f"];

  v18 = [v5 paymentStatusDate];
  v19 = (void *)_SQLValueForDate();
  [v7 setObjectOrNull:v19 forKey:@"q"];

  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "state"), @"h");
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "statusCode"), @"k");
  objc_msgSend(v7, "setBool:forKey:", objc_msgSend(v5, "cancellable"), @"cancellable");
  v20 = [v5 cancellationExpiryDate];
  v21 = (void *)_SQLValueForDate();
  [v7 setObjectOrNull:v21 forKey:@"cancellation_expiry_date"];

  v22 = [v5 expectedCreditReleaseDate];
  v23 = (void *)_SQLValueForDate();
  [v7 setObjectOrNull:v23 forKey:@"w"];

  v24 = [v5 fundingSource];
  v25 = [v24 identifier];
  [v7 setObjectOrNull:v25 forKey:@"l"];

  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v24, "type"), @"m");
  v26 = [v24 accountSuffix];
  [v7 setObjectOrNull:v26 forKey:@"n"];

  if ([v24 type] == (id)1)
  {
    v27 = [v24 fundingDetails];
    v28 = [v27 name];
    [v7 setObjectOrNull:v28 forKey:@"v"];
  }
  v29 = [v5 scheduleDetails];
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v29, "preset"), @"j");
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v29, "frequency"), @"i");
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v29, "scheduledDay"), @"u");
  v30 = [v29 scheduledDate];
  v31 = (void *)_SQLValueForDate();
  [v7 setObjectOrNull:v31 forKey:@"r"];

  v32 = [v29 paymentTermsIdentifier];
  [v7 setObjectOrNull:v32 forKey:@"s"];

  [v7 setObjectOrNull:v6 forKey:@"t"];
  return v7;
}

- (id)payment
{
  id v3 = objc_alloc_init((Class)PKAccountPayment);
  id v4 = objc_alloc_init((Class)PKAccountPaymentFundingSource);
  id v5 = objc_alloc_init((Class)PKAccountPaymentScheduleDetails);
  [v3 setFundingSource:v4];
  [v3 setScheduleDetails:v5];
  id v6 = +[AccountPayment _propertySettersForAccountPayment];
  id v7 = [v6 allKeys];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001480B4;
  v22[3] = &unk_10072DDD8;
  id v8 = v6;
  id v23 = v8;
  id v9 = v3;
  id v24 = v9;
  v25 = self;
  [(SQLiteEntity *)self getValuesForProperties:v7 withApplier:v22];

  id v10 = [v9 fundingSource];
  id v11 = [v10 type];

  if (v11 == (id)1)
  {
    id v12 = objc_alloc_init((Class)PKAccountPaymentFundingDetailsBankAccount);
    id v13 = [v9 fundingSource];
    [v13 setFundingDetails:v12];

    id v14 = +[AccountPayment _propertySetterForFundingDetailsName];
    id v15 = [v14 allKeys];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100148124;
    v19[3] = &unk_10072EDD0;
    id v20 = v14;
    id v21 = v9;
    id v16 = v14;
    [(SQLiteEntity *)self getValuesForProperties:v15 withApplier:v19];
  }
  id v17 = v9;

  return v17;
}

- (id)currencyAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"c"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  id v5 = [(SQLiteEntity *)self valueForProperty:@"d"];
  if (v4)
  {
    id v6 = +[NSDecimalNumber notANumber];
    unsigned __int8 v7 = [v4 isEqualToNumber:v6];

    id v8 = 0;
    if ((v7 & 1) == 0 && v5) {
      id v8 = [objc_alloc((Class)PKCurrencyAmount) initWithAmount:v4 currency:v5 exponent:0];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (void)deletePaymentWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = [a1 _predicateForEventPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)deleteScheduledPaymentsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _predicateForScheduledPaymentsWithAccountIdentifier:v7];
  id v9 = [a1 _predicateForFailedRecurringPaymentsWithAccountIdentifier:v7];

  v13[0] = v8;
  v13[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v13 count:2];
  id v11 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v10];

  id v12 = [a1 queryWithDatabase:v6 predicate:v11];

  [v12 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"lychees";
}

+ (id)_predicateForTransactionServiceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];
  v9[0] = v4;
  id v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"e" equalToValue:v3];

  v9[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v9 count:2];
  id v7 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v6];

  return v7;
}

+ (id)_predicateForTransactionReferenceIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"p" equalToValue:a3];
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"t" equalToValue:a3];
}

+ (id)_predicateForScheduledPaymentsWithAccountIdentifier:(id)a3
{
  id v3 = [a1 _predicateForAccountIdentifier:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"h" equalToValue:&off_10078ADB8];
  id v5 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"a"];
  v9[0] = v3;
  v9[1] = v4;
  void v9[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v9 count:3];
  id v7 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v6];

  return v7;
}

+ (id)_predicateForFailedRecurringPaymentsWithAccountIdentifier:(id)a3
{
  id v3 = [a1 _predicateForAccountIdentifier:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"h" equalToValue:&off_10078ADD0];
  id v5 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"i" values:&off_10078C258];
  v13[0] = v4;
  v13[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v13 count:2];
  id v7 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v6];

  id v8 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"a"];
  v12[0] = v3;
  v12[1] = v7;
  v12[2] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:3];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_propertySettersForAccountPayment
{
  v4[0] = @"b";
  v4[1] = @"e";
  v5[0] = &stru_100739E78;
  v5[1] = &stru_100739E98;
  v4[2] = @"p";
  v4[3] = @"f";
  v5[2] = &stru_100739EB8;
  v5[3] = &stru_100739ED8;
  v4[4] = @"q";
  v4[5] = @"h";
  v5[4] = &stru_100739EF8;
  v5[5] = &stru_100739F18;
  v4[6] = @"k";
  v4[7] = @"cancellable";
  v5[6] = &stru_100739F38;
  v5[7] = &stru_100739F58;
  v4[8] = @"cancellation_expiry_date";
  v4[9] = @"w";
  v5[8] = &stru_100739F78;
  v5[9] = &stru_100739F98;
  v4[10] = @"l";
  v4[11] = @"m";
  v5[10] = &stru_100739FB8;
  v5[11] = &stru_100739FD8;
  v4[12] = @"n";
  v4[13] = @"i";
  v5[12] = &stru_100739FF8;
  v5[13] = &stru_10073A018;
  v4[14] = @"u";
  v4[15] = @"j";
  v5[14] = &stru_10073A038;
  v5[15] = &stru_10073A058;
  v4[16] = @"r";
  v4[17] = @"s";
  v5[16] = &stru_10073A078;
  v5[17] = &stru_10073A098;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:18];
  return v2;
}

+ (id)_propertySetterForFundingDetailsName
{
  CFStringRef v4 = @"v";
  id v5 = &stru_10073A0B8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

@end