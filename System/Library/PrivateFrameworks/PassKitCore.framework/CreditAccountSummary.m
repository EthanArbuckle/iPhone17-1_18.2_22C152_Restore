@interface CreditAccountSummary
+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3;
+ (id)_propertySettersForCreditAccountSummary;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountSummaryForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteCreditAccountSummaryForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (CreditAccountSummary)initWithCreditAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)creditAccountSummary;
- (void)updateWithCreditAccountSummary:(id)a3;
@end

@implementation CreditAccountSummary

+ (id)databaseTable
{
  return @"oranges";
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

- (CreditAccountSummary)initWithCreditAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [v9 creditLimit];
  v13 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v13 forKey:@"b"];

  v14 = [v9 availableCredit];
  v15 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v15 forKey:@"c"];

  v16 = [v9 currentBalance];
  v17 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v17 forKey:@"d"];

  v18 = [v9 adjustedBalance];
  v19 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v19 forKey:@"t"];

  v20 = [v9 rewardsBalance];
  v21 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v21 forKey:@"e"];

  v22 = [v9 remainingMinimumPayment];
  v23 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v23 forKey:@"j"];

  v24 = [v9 remainingStatementBalance];
  v25 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v25 forKey:@"k"];

  v26 = [v9 remainingStatementBalanceForInterestCalculation];
  v27 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v27 forKey:@"remaining_statement_balance_for_interest_calculation"];

  v28 = [v9 pastDueAmount];
  v29 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v29 forKey:@"p"];

  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "autoPayEnabled"), @"f");
  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "requiresDebtCollectionNotices"), @"l");
  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "inGrace"), @"o");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "balanceStatus"), @"g");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "cyclesPastDue"), @"h");
  v30 = [v9 lastPaymentDate];
  v31 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v31 forKey:@"i"];

  v32 = [v9 paymentDueDate];
  v33 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v33 forKey:@"q"];

  v34 = [v9 unpostedInterest];
  v35 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v35 forKey:@"m"];

  v36 = [v9 unpostedInterestTimestamp];
  v37 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v37 forKey:@"n"];

  v38 = [v9 chargeOffPreventionAmount];
  v39 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v39 forKey:@"r"];

  v40 = [v9 pastDueAmount];
  v41 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v41 forKey:@"p"];

  v42 = [v9 installmentBalance];
  v43 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v43 forKey:@"s"];

  v44 = [v9 remainingMinimumPaymentExcludedFromInterestCalculation];
  v45 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v45 forKey:@"u"];

  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "recoveryPaymentPlansSupported"), @"recovery_payment_plans_supported");
  v46 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  id v47 = [(SQLiteEntity *)v46 persistentID];
  v48 = [v9 balanceSummary];
  id v49 = +[CreditAccountBalanceSummary insertAccountBalanceSummary:v48 forCreditAccountSummaryPID:v47 inDatabase:v8];

  v50 = [v9 currentStatement];
  id v51 = +[CreditAccountStatement insertCreditAccountStatement:v50 forCreditAccountSummaryPID:v47 inDatabase:v8];

  v52 = [v9 accountUserActivity];
  v53 = +[NSNumber numberWithUnsignedLongLong:v47];
  id v54 = +[CreditAccountUserActivity insertOrUpdateCreditAccountUserActivity:v52 forCreditAccountSummaryPID:v53 inDatabase:v8];

  v55 = [v9 mergeSummary];

  v56 = +[NSNumber numberWithUnsignedLongLong:v47];
  id v57 = +[CreditAccountMergeSummary insertOrUpdateCreditAccountMergeSummary:v55 forCreditAccountSummaryPID:v56 inDatabase:v8];

  return v46;
}

+ (id)insertAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountSummary:v9 forCreditAccountDetailsPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteCreditAccountSummaryForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCreditAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)v2 database];
  +[CreditAccountBalanceSummary deleteCreditAccountBalanceSummaryForCreditAccountSummaryPID:v3 inDatabase:v4];
  +[CreditAccountStatement deleteCreditAccountStatementForCreditAccountSummaryPID:v3 inDatabase:v4];
  v5 = +[NSNumber numberWithUnsignedLongLong:v3];
  +[CreditAccountUserActivity deleteCreditAccountUserActivityForCreditAccountSummaryPID:v5 inDatabase:v4];

  id v6 = +[NSNumber numberWithUnsignedLongLong:v3];
  +[CreditAccountMergeSummary deleteCreditAccountMergeSummaryForCreditAccountSummaryPID:v6 inDatabase:v4];

  v8.receiver = v2;
  v8.super_class = (Class)CreditAccountSummary;
  LOBYTE(v2) = [(SQLiteEntity *)&v8 deleteFromDatabase];

  return (char)v2;
}

+ (id)creditAccountSummaryForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCreditAccountDetailsPID:a3];
  objc_super v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 creditAccountSummary];

  return v9;
}

+ (void)updateCreditAccountSummary:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForCreditAccountDetailsPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updateWithCreditAccountSummary:v12];
  }
  else {
    id v11 = +[CreditAccountSummary insertAccountSummary:v12 forCreditAccountDetailsPID:a4 inDatabase:v8];
  }
}

- (void)updateWithCreditAccountSummary:(id)a3
{
  id v4 = a3;
  id v49 = +[NSMutableDictionary dictionary];
  v5 = [v4 creditLimit];
  id v6 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v6 forKey:@"b"];

  v7 = [v4 availableCredit];
  id v8 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v4 currentBalance];
  id v10 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v10 forKey:@"d"];

  id v11 = [v4 adjustedBalance];
  id v12 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v12 forKey:@"t"];

  v13 = [v4 rewardsBalance];
  v14 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v14 forKey:@"e"];

  v15 = [v4 remainingMinimumPayment];
  v16 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v16 forKey:@"j"];

  v17 = [v4 remainingStatementBalance];
  v18 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v18 forKey:@"k"];

  v19 = [v4 remainingStatementBalanceForInterestCalculation];
  v20 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v20 forKey:@"remaining_statement_balance_for_interest_calculation"];

  v21 = [v4 pastDueAmount];
  v22 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v22 forKey:@"p"];

  objc_msgSend(v49, "setBool:forKey:", objc_msgSend(v4, "autoPayEnabled"), @"f");
  objc_msgSend(v49, "setBool:forKey:", objc_msgSend(v4, "requiresDebtCollectionNotices"), @"l");
  objc_msgSend(v49, "setBool:forKey:", objc_msgSend(v4, "inGrace"), @"o");
  objc_msgSend(v49, "setInteger:forKey:", objc_msgSend(v4, "balanceStatus"), @"g");
  objc_msgSend(v49, "setInteger:forKey:", objc_msgSend(v4, "cyclesPastDue"), @"h");
  v23 = [v4 lastPaymentDate];
  v24 = (void *)_SQLValueForDate();
  [v49 setObjectOrNull:v24 forKey:@"i"];

  v25 = [v4 paymentDueDate];
  v26 = (void *)_SQLValueForDate();
  [v49 setObjectOrNull:v26 forKey:@"q"];

  v27 = [v4 unpostedInterest];
  v28 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v28 forKey:@"m"];

  v29 = [v4 unpostedInterestTimestamp];
  v30 = (void *)_SQLValueForDate();
  [v49 setObjectOrNull:v30 forKey:@"n"];

  v31 = [v4 chargeOffPreventionAmount];
  v32 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v32 forKey:@"r"];

  v33 = [v4 pastDueAmount];
  v34 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v34 forKey:@"p"];

  v35 = [v4 installmentBalance];
  v36 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v36 forKey:@"s"];

  v37 = [v4 remainingMinimumPaymentExcludedFromInterestCalculation];
  v38 = PKCurrencyDecimalToStorageNumber();
  [v49 setObjectOrNull:v38 forKey:@"u"];

  objc_msgSend(v49, "setBool:forKey:", objc_msgSend(v4, "recoveryPaymentPlansSupported"), @"recovery_payment_plans_supported");
  [(SQLiteEntity *)self setValuesWithDictionary:v49];
  int64_t v39 = [(SQLiteEntity *)self persistentID];
  v40 = [(SQLiteEntity *)self database];
  v41 = [v4 balanceSummary];
  +[CreditAccountBalanceSummary updateCreditAccountBalanceSummary:v41 forCreditAccountSummaryPID:v39 inDatabase:v40];

  v42 = [v4 currentStatement];
  +[CreditAccountStatement updateCreditAccountStatement:v42 forCreditAccountSummaryPID:v39 inDatabase:v40];

  v43 = [v4 accountUserActivity];
  v44 = +[NSNumber numberWithUnsignedLongLong:v39];
  id v45 = +[CreditAccountUserActivity insertOrUpdateCreditAccountUserActivity:v43 forCreditAccountSummaryPID:v44 inDatabase:v40];

  v46 = [v4 mergeSummary];

  id v47 = +[NSNumber numberWithUnsignedLongLong:v39];
  id v48 = +[CreditAccountMergeSummary insertOrUpdateCreditAccountMergeSummary:v46 forCreditAccountSummaryPID:v47 inDatabase:v40];
}

+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForCreditAccountSummary
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10073B118;
  v5[1] = &stru_10073B138;
  v4[2] = @"d";
  v4[3] = @"t";
  v5[2] = &stru_10073B158;
  v5[3] = &stru_10073B178;
  v4[4] = @"e";
  v4[5] = @"k";
  v5[4] = &stru_10073B198;
  v5[5] = &stru_10073B1B8;
  v4[6] = @"remaining_statement_balance_for_interest_calculation";
  v4[7] = @"j";
  v5[6] = &stru_10073B1D8;
  v5[7] = &stru_10073B1F8;
  v4[8] = @"p";
  v4[9] = @"f";
  v5[8] = &stru_10073B218;
  v5[9] = &stru_10073B238;
  v4[10] = @"l";
  v4[11] = @"g";
  v5[10] = &stru_10073B258;
  v5[11] = &stru_10073B278;
  v4[12] = @"h";
  v4[13] = @"i";
  v5[12] = &stru_10073B298;
  v5[13] = &stru_10073B2B8;
  v4[14] = @"q";
  v4[15] = @"m";
  v5[14] = &stru_10073B2D8;
  v5[15] = &stru_10073B2F8;
  v4[16] = @"n";
  v4[17] = @"o";
  v5[16] = &stru_10073B318;
  v5[17] = &stru_10073B338;
  v4[18] = @"r";
  v4[19] = @"p";
  v5[18] = &stru_10073B358;
  v5[19] = &stru_10073B378;
  v4[20] = @"s";
  v4[21] = @"u";
  v5[20] = &stru_10073B398;
  v5[21] = &stru_10073B3B8;
  v4[22] = @"recovery_payment_plans_supported";
  v5[22] = &stru_10073B3D8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:23];
  return v2;
}

- (id)creditAccountSummary
{
  id v3 = objc_alloc_init((Class)PKCreditAccountSummary);
  id v4 = [(id)objc_opt_class() _propertySettersForCreditAccountSummary];
  v5 = [v4 allKeys];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100189C5C;
  v18[3] = &unk_10072DDD8;
  v18[4] = self;
  id v19 = v4;
  id v6 = v3;
  id v20 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v18];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  id v10 = +[CreditAccountBalanceSummary creditAccountBalanceSummaryForCreditAccountSummaryPID:v8 inDatabase:v9];
  [v6 setBalanceSummary:v10];

  id v11 = +[CreditAccountStatement creditAccountStatementForCreditAccountSummaryPID:v8 inDatabase:v9];
  [v6 setCurrentStatement:v11];

  id v12 = +[NSNumber numberWithUnsignedLongLong:v8];
  v13 = +[CreditAccountUserActivity creditAccountUserActivityForCreditAccountSummaryPID:v12 inDatabase:v9];
  [v6 setAccountUserActivity:v13];

  v14 = +[NSNumber numberWithUnsignedLongLong:v8];
  v15 = +[CreditAccountMergeSummary creditAccountMergeSummaryForCreditAccountSummaryPID:v14 inDatabase:v9];
  [v6 setMergeSummary:v15];

  id v16 = v6;
  return v16;
}

@end