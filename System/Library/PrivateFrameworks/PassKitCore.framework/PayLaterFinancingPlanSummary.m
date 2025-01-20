@interface PayLaterFinancingPlanSummary
+ (id)_predicateForFinancingPlanPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterFinancingPlan;
+ (id)_propertyValuesForPayLaterFinancingPlanSummary:(id)a3;
+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterFinancingPlanSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePayLaterFinancingPlanSummaryForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlanSummary)initWithPayLaterFinancingPlan:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_currentBalance;
- (id)_initialAmount;
- (id)_installmentAmount;
- (id)_interestPaidToDate;
- (id)_pastDueAmount;
- (id)_paymentAmountToDate;
- (id)_payoffAmount;
- (id)_principalPaidToDate;
- (id)_totalAdjustments;
- (id)_totalAmount;
- (id)_totalInterest;
- (id)_totalPrincipal;
- (id)planSummary;
- (void)updateWithPayLaterFinancingPlanSummary:(id)a3;
@end

@implementation PayLaterFinancingPlanSummary

+ (id)databaseTable
{
  return @"marionberry";
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

- (PayLaterFinancingPlanSummary)initWithPayLaterFinancingPlan:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPayLaterFinancingPlanSummary:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

+ (id)insertOrUpdatePayLaterFinancingPlanSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _predicateForFinancingPlanPID:a4];
  id v11 = [a1 anyInDatabase:v9 predicate:v10];

  if (v11) {
    [v11 updateWithPayLaterFinancingPlanSummary:v8];
  }
  else {
    id v11 = [objc_alloc((Class)a1) initWithPayLaterFinancingPlan:v8 forFinancingPlanPID:a4 inDatabase:v9];
  }

  return v11;
}

- (void)updateWithPayLaterFinancingPlanSummary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPayLaterFinancingPlanSummary:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForFinancingPlanPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (void)deletePayLaterFinancingPlanSummaryForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForFinancingPlanPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PayLaterFinancingPlanSummary;
  return [(SQLiteEntity *)&v3 deleteFromDatabase];
}

- (id)planSummary
{
  id v3 = objc_alloc_init((Class)PKPayLaterFinancingPlanSummary);
  id v4 = [(id)objc_opt_class() _propertySettersForPayLaterFinancingPlan];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002C6374;
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

- (id)_totalAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"g"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"gc"];
  id v6 = (void *)v5;
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

- (id)_currentBalance
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"i"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"ic"];
  id v6 = (void *)v5;
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

- (id)_installmentAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"y"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"yc"];
  id v6 = (void *)v5;
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

- (id)_totalPrincipal
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"z"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"zc"];
  id v6 = (void *)v5;
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

- (id)_paymentAmountToDate
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"j"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"jc"];
  id v6 = (void *)v5;
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

- (id)_totalInterest
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"r"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"s"];
  id v6 = (void *)v5;
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

- (id)_interestPaidToDate
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"t"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"u"];
  id v6 = (void *)v5;
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

- (id)_principalPaidToDate
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"aa"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"aac"];
  id v6 = (void *)v5;
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

- (id)_payoffAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"w"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"x"];
  id v6 = (void *)v5;
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

- (id)_pastDueAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"cc"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"ccc"];
  id v6 = (void *)v5;
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

- (id)_initialAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"ee"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"eec"];
  id v6 = (void *)v5;
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

- (id)_totalAdjustments
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"ff"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"ffc"];
  id v6 = (void *)v5;
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

+ (id)_predicateForFinancingPlanPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesForPayLaterFinancingPlanSummary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [v3 apr];
  [v4 setInteger:PKPercentageDecimalToStorageInteger() forKey:@"b"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "hasAPR"), @"c");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "daysPastDue"), @"dd");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "installmentCount"), @"q");
  id v6 = [v3 totalAmount];
  BOOL v7 = [v6 amount];
  id v8 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v8 forKey:@"g"];

  id v9 = [v3 totalAmount];
  v10 = [v9 currency];
  [v4 setObjectOrNull:v10 forKey:@"gc"];

  id v11 = [v3 currentBalance];
  id v12 = [v11 amount];
  id v13 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v13 forKey:@"i"];

  v14 = [v3 currentBalance];
  v15 = [v14 currency];
  [v4 setObjectOrNull:v15 forKey:@"ic"];

  v16 = [v3 installmentAmount];
  v17 = [v16 amount];
  v18 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v18 forKey:@"y"];

  v19 = [v3 installmentAmount];
  v20 = [v19 currency];
  [v4 setObjectOrNull:v20 forKey:@"yc"];

  v21 = [v3 totalPrincipal];
  v22 = [v21 amount];
  v23 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v23 forKey:@"z"];

  v24 = [v3 totalPrincipal];
  v25 = [v24 currency];
  [v4 setObjectOrNull:v25 forKey:@"zc"];

  v26 = [v3 paymentAmountToDate];
  v27 = [v26 amount];
  v28 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v28 forKey:@"j"];

  v29 = [v3 paymentAmountToDate];
  v30 = [v29 currency];
  [v4 setObjectOrNull:v30 forKey:@"jc"];

  v31 = [v3 totalInterest];
  v32 = [v31 amount];
  v33 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v33 forKey:@"r"];

  v34 = [v3 totalInterest];
  v35 = [v34 currency];
  [v4 setObjectOrNull:v35 forKey:@"s"];

  v36 = [v3 interestPaidToDate];
  v37 = [v36 amount];
  v38 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v38 forKey:@"t"];

  v39 = [v3 interestPaidToDate];
  v40 = [v39 currency];
  [v4 setObjectOrNull:v40 forKey:@"u"];

  v41 = [v3 principalPaidToDate];
  v42 = [v41 amount];
  v43 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v43 forKey:@"aa"];

  v44 = [v3 principalPaidToDate];
  v45 = [v44 currency];
  [v4 setObjectOrNull:v45 forKey:@"aac"];

  v46 = [v3 payoffAmount];
  v47 = [v46 amount];
  v48 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v48 forKey:@"w"];

  v49 = [v3 payoffAmount];
  v50 = [v49 currency];
  [v4 setObjectOrNull:v50 forKey:@"x"];

  v51 = [v3 pastDueAmount];
  v52 = [v51 amount];
  v53 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v53 forKey:@"cc"];

  v54 = [v3 pastDueAmount];
  v55 = [v54 currency];
  [v4 setObjectOrNull:v55 forKey:@"ccc"];

  v56 = [v3 transactionDate];
  v57 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v57 forKey:@"m"];

  v58 = [v3 startInstallmentDate];
  v59 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v59 forKey:@"n"];

  v60 = [v3 endInstallmentDate];
  v61 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v61 forKey:@"o"];

  v62 = [v3 cancellationDate];
  v63 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v63 forKey:@"bb"];

  v64 = [v3 nextInstallmentDueDate];
  v65 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v65 forKey:@"p"];

  v66 = [v3 panSuffix];
  [v4 setObjectOrNull:v66 forKey:@"v"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "cancellationReason"), @"cr");
  v67 = [v3 initialAmount];
  v68 = [v67 amount];
  v69 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v69 forKey:@"ee"];

  v70 = [v3 initialAmount];
  v71 = [v70 currency];
  [v4 setObjectOrNull:v71 forKey:@"eec"];

  v72 = [v3 totalAdjustments];
  v73 = [v72 amount];
  v74 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v74 forKey:@"ff"];

  v75 = [v3 totalAdjustments];

  v76 = [v75 currency];
  [v4 setObjectOrNull:v76 forKey:@"ffc"];

  id v77 = [v4 copy];
  return v77;
}

+ (id)_propertySettersForPayLaterFinancingPlan
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100746138;
  v5[1] = &stru_100746158;
  v4[2] = @"dd";
  v4[3] = @"q";
  v5[2] = &stru_100746178;
  v5[3] = &stru_100746198;
  v4[4] = @"m";
  v4[5] = @"n";
  v5[4] = &stru_1007461B8;
  v5[5] = &stru_1007461D8;
  v4[6] = @"p";
  v4[7] = @"o";
  v5[6] = &stru_1007461F8;
  v5[7] = &stru_100746218;
  v4[8] = @"bb";
  v4[9] = @"v";
  v5[8] = &stru_100746238;
  v5[9] = &stru_100746258;
  v4[10] = @"cr";
  v5[10] = &stru_100746278;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:11];
  return v2;
}

@end