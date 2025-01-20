@interface PayLaterInstallment
+ (id)_installmentsForQuery:(id)a3;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForEndDueDate:(id)a3;
+ (id)_predicateForFinancingPlanStates:(id)a3;
+ (id)_predicateForInstallmentIdentifier:(id)a3;
+ (id)_predicateForInstallmentStatus:(unint64_t)a3;
+ (id)_predicateForInstallmentStatuses:(id)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForScheduleSummaryPID:(int64_t)a3;
+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 installmentIdentifier:(id)a4;
+ (id)_predicateForStartDueDate:(id)a3;
+ (id)_propertySettersForPayLaterInstallment;
+ (id)_propertyValuesForPayLaterInstallment:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)financingPlanIdentifiersThatContainInstallmentWithStatus:(unint64_t)a3 inDatabase:(id)a4;
+ (id)financingPlanInstallmentsTotalDueForAccountIdentifier:(id)a3 fromDaysInFuture:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterInstallment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterInstallments:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterInstallmentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)payoffDateQueryWithInstallmentPID:(int64_t)a3 bindings:(id)a4;
+ (id)upcomingInstallmentsForAccountIdentifier:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deletePayLaterInstallmentWithIdentifier:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePayLaterInstallmentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 startDate:(id *)a5 endDate:(id *)a6 inDatabase:(id)a7;
+ (void)updatePayoffDateForInstallmentPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterInstallment)initWithPayLaterInstallment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_currentBalance;
- (id)_totalAmount;
- (id)planIdentifier;
- (void)updateWithPayLaterInstallment:(id)a3;
@end

@implementation PayLaterInstallment

+ (id)databaseTable
{
  return @"jostaberry";
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
  v15 = v7;
  if (v7 == @"pears.a") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_6;
  }
  unsigned int v8 = [@"pears.a" isEqualToString:v7];

  if (v8)
  {
LABEL_4:
    [v6 addObject:@"JOIN pears ON pears.pid = salmonberry.a"];
    [v6 addObject:@"JOIN salmonberry ON salmonberry.pid = huckleberry.a"];
LABEL_5:
    [v6 addObject:@"JOIN huckleberry ON huckleberry.pid = asparagus.a"];
    [v6 addObject:@"JOIN asparagus ON asparagus.pid = jostaberry.a"];
    goto LABEL_6;
  }
  v9 = v15;
  if (v9 == @"huckleberry.e") {
    goto LABEL_5;
  }
  v10 = v9;
  unsigned __int8 v11 = [@"huckleberry.e" isEqualToString:v9];

  if (v11) {
    goto LABEL_5;
  }
  v12 = v10;
  if (v12 == @"huckleberry.b") {
    goto LABEL_5;
  }
  v13 = v12;
  unsigned int v14 = [@"huckleberry.b" isEqualToString:v12];

  if (v14) {
    goto LABEL_5;
  }
LABEL_6:
}

- (PayLaterInstallment)initWithPayLaterInstallment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPayLaterInstallment:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

+ (id)insertOrUpdatePayLaterInstallment:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 installmentIdentifier];
  id v11 = [a1 _predicateForScheduleSummaryPID:a4 installmentIdentifier:v10];
  id v12 = [a1 anyInDatabase:v8 predicate:v11];

  if (v12) {
    [v12 updateWithPayLaterInstallment:v9];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithPayLaterInstallment:v9 forScheduleSummaryPID:a4 inDatabase:v8];
  }
  v13 = [v9 appliedPayments];

  id v14 = +[PayLaterAppliedPayment insertOrUpdatePayLaterAppliedPayments:forInstallmentPID:inDatabase:](PayLaterAppliedPayment, "insertOrUpdatePayLaterAppliedPayments:forInstallmentPID:inDatabase:", v13, [v12 persistentID], v8);
  objc_msgSend(a1, "updatePayoffDateForInstallmentPID:inDatabase:", objc_msgSend(v12, "persistentID"), v8);

  return v12;
}

+ (id)insertOrUpdatePayLaterInstallments:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterInstallmentsForScheduleSummaryPID:a4 inDatabase:v9];
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
        v16 = objc_msgSend(a1, "insertOrUpdatePayLaterInstallment:forScheduleSummaryPID:inDatabase:", *(void *)(*((void *)&v19 + 1) + 8 * i), a4, v9, (void)v19);
        [v10 safelyAddObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = [v10 copy];
  return v17;
}

- (void)updateWithPayLaterInstallment:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPayLaterInstallment:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)financingPlanIdentifiersThatContainInstallmentWithStatus:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentStatus:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1002D0B34;
  v16 = &unk_100730E38;
  id v17 = v6;
  id v9 = objc_alloc_init((Class)NSMutableSet);
  id v18 = v9;
  id v10 = v6;
  [v8 enumeratePersistentIDsUsingBlock:&v13];
  if (objc_msgSend(v9, "count", v13, v14, v15, v16)) {
    id v11 = [v9 copy];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

+ (id)payLaterInstallmentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForScheduleSummaryPID:a3];
  CFStringRef v14 = @"f";
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  CFStringRef v13 = @"ASC";
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  id v11 = [a1 _installmentsForQuery:v10];

  return v11;
}

+ (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 startDate:(id *)a5 endDate:(id *)a6 inDatabase:(id)a7
{
  id v11 = a3;
  id v26 = a4;
  id v12 = a7;
  CFStringRef v13 = [a1 _predicateForAccountIdentifier:v11];
  v47[0] = v13;
  CFStringRef v14 = [a1 _predicateForFinancingPlanStates:v26];
  v47[1] = v14;
  v15 = +[NSArray arrayWithObjects:v47 count:2];
  v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_100020B0C;
  v39 = sub_100021078;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100020B0C;
  v33 = sub_100021078;
  id v34 = 0;
  CFStringRef v46 = @"f";
  id v17 = +[NSArray arrayWithObjects:&v46 count:1];
  CFStringRef v45 = @"DESC";
  id v18 = +[NSArray arrayWithObjects:&v45 count:1];
  long long v19 = [a1 queryWithDatabase:v12 predicate:v16 orderingProperties:v17 orderingDirections:v18 limit:1];

  CFStringRef v44 = @"f";
  long long v20 = +[NSArray arrayWithObjects:&v44 count:1];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1002D10E8;
  v28[3] = &unk_1007339F8;
  v28[4] = &v29;
  [v19 enumeratePersistentIDsAndProperties:v20 usingBlock:v28];

  CFStringRef v43 = @"f";
  long long v21 = +[NSArray arrayWithObjects:&v43 count:1];
  CFStringRef v42 = @"ASC";
  long long v22 = +[NSArray arrayWithObjects:&v42 count:1];
  v23 = [a1 queryWithDatabase:v12 predicate:v16 orderingProperties:v21 orderingDirections:v22 limit:1];

  CFStringRef v41 = @"f";
  v24 = +[NSArray arrayWithObjects:&v41 count:1];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1002D117C;
  v27[3] = &unk_1007339F8;
  v27[4] = &v35;
  [v23 enumeratePersistentIDsAndProperties:v24 usingBlock:v27];

  if (a5) {
    *a5 = (id) v36[5];
  }
  if (a6) {
    *a6 = (id) v30[5];
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
}

+ (id)financingPlanInstallmentsTotalDueForAccountIdentifier:(id)a3 fromDaysInFuture:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    id v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:0.0];
    id v10 = +[NSDate dateWithTimeIntervalSince1970:0.0];
    [v9 timeIntervalSinceDate:v10];
    uint64_t v12 = (uint64_t)v11;

    CFStringRef v13 = +[NSDate date];
    [v13 timeIntervalSinceReferenceDate];
    uint64_t v15 = (uint64_t)v14;

    v16 = +[NSString stringWithFormat:@"SELECT jostaberry.d, jostaberry.dc FROM jostaberry JOIN pears ON pears.pid = salmonberry.a JOIN salmonberry ON salmonberry.pid = huckleberry.a JOIN huckleberry ON huckleberry.pid = asparagus.a JOIN asparagus ON asparagus.pid = jostaberry.a WHERE pears.a=\"%@\" AND (huckleberry.e=%ld OR huckleberry.e=%ld) AND jostaberry.d > 0 AND (jostaberry.h=%ld OR jostaberry.h=%ld) AND jostaberry.f < (STRFTIME('%%s', DATETIME(%ld + %ld, 'unixepoch', 'localtime', '%ld Day')) - %ld)", v7, 1, 4, 1, 4, v15, v12, a4, v12];
    uint64_t v20 = 0;
    long long v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_100020B0C;
    v24 = sub_100021078;
    id v25 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002D13F8;
    v19[3] = &unk_10073AE78;
    v19[4] = &v20;
    sub_100012DC8((uint64_t)v8, v16, v19);
    id v17 = (id)v21[5];
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)upcomingInstallmentsForAccountIdentifier:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = [a1 _predicateForAccountIdentifier:a3];
  v43[0] = v8;
  id v9 = [a1 _predicateForInstallmentStatuses:&off_10078C498];
  v43[1] = v9;
  id v10 = [a1 _predicateForFinancingPlanStates:&off_10078C4B0];
  v43[2] = v10;
  double v11 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" greaterThanValue:&off_10078B658];
  v43[3] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v43 count:4];
  uint64_t v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  CFStringRef v42 = @"f";
  double v14 = +[NSArray arrayWithObjects:&v42 count:1];
  CFStringRef v41 = @"ASC";
  uint64_t v15 = +[NSArray arrayWithObjects:&v41 count:1];
  id v34 = (void *)v13;
  uint64_t v35 = v7;
  uint64_t v16 = [a1 queryWithDatabase:v7 predicate:v13 orderingProperties:v14 orderingDirections:v15 limit:a4];

  v33 = (void *)v16;
  id v17 = [a1 _installmentsForQuery:v16];
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v20 = v17;
  id v21 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v26 = [v25 planIdentifier];
        v27 = [v18 objectForKeyedSubscript:v26];
        if (!v27)
        {
          v28 = +[PayLaterFinancingPlan anyInDatabase:v35 withPlanIdentifier:v26];
          v27 = [v28 financingPlan];

          [v18 setObject:v27 forKeyedSubscript:v26];
        }
        uint64_t v29 = [v25 installmentIdentifier];
        [v19 setObject:v27 forKeyedSubscript:v29];
      }
      id v22 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v22);
  }

  if ([v20 count] && objc_msgSend(v19, "count")) {
    id v30 = [objc_alloc((Class)PKAccountServicePayLaterFinancingPlanQueryInstallments) initWithInstallment:v20 installmentIdentifierToFinancingPlan:v19];
  }
  else {
    id v30 = 0;
  }

  return v30;
}

+ (id)_installmentsForQuery:(id)a3
{
  id v4 = a3;
  id v5 = [v4 database];
  id v6 = [a1 _propertySettersForPayLaterInstallment];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [v6 allKeys];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002D19E8;
  v15[3] = &unk_10073C4A8;
  id v19 = v7;
  id v20 = a1;
  id v16 = v5;
  id v17 = v6;
  id v18 = v4;
  id v9 = v7;
  id v10 = v4;
  id v11 = v6;
  id v12 = v5;
  [v10 enumeratePersistentIDsAndProperties:v8 usingBlock:v15];

  id v13 = [v9 copy];
  return v13;
}

+ (void)deletePayLaterInstallmentsForScheduleSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForScheduleSummaryPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deletePayLaterInstallmentWithIdentifier:(id)a3 forScheduleSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = [a1 _predicateForScheduleSummaryPID:a4 installmentIdentifier:a3];
  id v9 = [a1 queryWithDatabase:v8 predicate:v10];

  [v9 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)self database];
  +[PayLaterAppliedPayment deletePayLaterAppliedPaymentsForInstallmentPID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)PayLaterInstallment;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

- (id)_totalAmount
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"c"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"cc"];
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

- (id)_currentBalance
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"d"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"dc"];
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

+ (id)payoffDateQueryWithInstallmentPID:(int64_t)a3 bindings:(id)a4
{
  id v5 = a4;
  [v5 addIntBinding:3];
  if (a3)
  {
    [v5 addIntBinding:a3];
    CFStringRef v6 = @"AND jostaberry.pid = ?";
  }
  else
  {
    CFStringRef v6 = &stru_10075AAD8;
  }
  [v5 addIntBinding:1];
  [v5 addIntBinding:2];
  [v5 addIntBinding:3];
  BOOL v7 = +[NSString stringWithFormat:@"     SELECT       MAX(pineberry.f) AS payoff_date, jostaberry.pid AS installment_pid    FROM       jostaberry       JOIN          oregano          ON oregano.a = jostaberry.pid       JOIN          pineberry          ON pineberry.b = oregano.c    WHERE       %@       %@       %@    GROUP BY       pineberry.a    ", @"jostaberry.h = ?", v6, @"AND pineberry.d IN (?, ?, ?)"];

  return v7;
}

+ (void)updatePayoffDateForInstallmentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  BOOL v7 = objc_alloc_init(PDSQLiteDatabaseBinding);
  id v8 = [a1 _predicateForPID:a3];
  id v9 = +[SQLiteEntity anyInDatabase:v6 predicate:v8];

  if (v9)
  {
    id v10 = [(id)objc_opt_class() payoffDateQueryWithInstallmentPID:a3 bindings:v7];
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = sub_100020B0C;
    v18[4] = sub_100021078;
    id v19 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002D2170;
    v12[3] = &unk_100746778;
    id v13 = v6;
    id v11 = v10;
    id v14 = v11;
    uint64_t v15 = v7;
    id v17 = v18;
    id v16 = v9;
    sub_10000817C((uint64_t)v13, v12);

    _Block_object_dispose(v18, 8);
  }
}

+ (id)_predicateForScheduleSummaryPID:(int64_t)a3 installmentIdentifier:(id)a4
{
  id v6 = a4;
  BOOL v7 = [a1 _predicateForScheduleSummaryPID:a3];
  id v8 = [a1 _predicateForInstallmentIdentifier:v6];

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

+ (id)_predicateForInstallmentStatus:(unint64_t)a3
{
  int64_t v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"h" equalToValue:v3];

  return v4;
}

+ (id)_predicateForInstallmentStatuses:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"h", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13 equalToValue];
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    id v11 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v4];
  }
  else
  {
    id v11 = +[SQLiteBooleanPredicate truePredicate];
  }

  return v11;
}

+ (id)_predicateForInstallmentIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pears.a" equalToValue:a3];
}

+ (id)_predicateForFinancingPlanStates:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"huckleberry.e", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13 equalToValue];
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    id v11 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v4];
  }
  else
  {
    id v11 = +[SQLiteBooleanPredicate truePredicate];
  }

  return v11;
}

+ (id)_predicateForStartDueDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"f" greaterThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForEndDueDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"f" lessThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesForPayLaterInstallment:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 installmentIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 totalAmount];
  id v7 = [v6 amount];
  uint64_t v8 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v3 totalAmount];
  id v10 = [v9 currency];
  [v4 setObjectOrNull:v10 forKey:@"cc"];

  id v11 = [v3 currentBalance];
  id v12 = [v11 amount];
  long long v13 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v13 forKey:@"d"];

  long long v14 = [v3 currentBalance];
  long long v15 = [v14 currency];
  [v4 setObjectOrNull:v15 forKey:@"dc"];

  long long v16 = [v3 dueDate];
  id v17 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v17 forKey:@"f"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "status"), @"h");
  id v18 = [v3 interval];

  [v4 setInteger:v18 forKey:@"i"];
  id v19 = [v4 copy];

  return v19;
}

+ (id)_propertySettersForPayLaterInstallment
{
  v4[0] = @"b";
  v4[1] = @"h";
  v5[0] = &stru_1007467B8;
  v5[1] = &stru_1007467D8;
  v4[2] = @"f";
  v4[3] = @"i";
  v5[2] = &stru_1007467F8;
  v5[3] = &stru_100746818;
  v4[4] = @"j";
  v4[5] = @"huckleberry.b";
  v5[4] = &stru_100746838;
  v5[5] = &stru_100746858;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

@end