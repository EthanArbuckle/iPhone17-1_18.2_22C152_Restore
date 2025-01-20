@interface PayLaterFinancingPlan
+ (id)_financingPlansWithQuery:(id)a3;
+ (id)_predicateForAccountEndpointMetadataPID:(int64_t)a3;
+ (id)_predicateForAccountEndpointMetadataPID:(int64_t)a3 planIdentifier:(id)a4;
+ (id)_predicateForInstallmentEndDueDate:(id)a3;
+ (id)_predicateForInstallmentEndPayoffDate:(id)a3;
+ (id)_predicateForInstallmentStartDueDate:(id)a3;
+ (id)_predicateForInstallmentStartPayoffDate:(id)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForPlanIdentifier:(id)a3;
+ (id)_predicateForState:(unint64_t)a3;
+ (id)_predicateForStateReason:(unint64_t)a3;
+ (id)_predicateForStateReasonList:(id)a3;
+ (id)_predicateForStates:(id)a3;
+ (id)_predicateForTransactionEndDate:(id)a3;
+ (id)_predicateForTransactionStartDate:(id)a3;
+ (id)_propertySettersForPayLaterFinancingPlan;
+ (id)_propertyValuesForPayLaterFinancingPlan:(id)a3;
+ (id)anyInDatabase:(id)a3 withPlanIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPlanPID:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)financingPlanIdentifiersForEndpointMetadataPID:(int64_t)a3 states:(id)a4 transactionStartDate:(id)a5 transactionEndDate:(id)a6 limit:(int64_t)a7 inDatabase:(id)a8;
+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 stateReasons:(id)a4 inDatabase:(id)a5;
+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 states:(id)a4 transactionStartDate:(id)a5 transactionEndDate:(id)a6 installmentDueOrPaidDateStart:(id)a7 installmentDueOrPaidDateEnd:(id)a8 limit:(int64_t)a9 inDatabase:(id)a10;
+ (id)financingPlansIdentifiersWithState:(unint64_t)a3 inDatabase:(id)a4;
+ (id)insertOrUpdatePayLaterFinancingPlan:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterFinancingPlans:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)totalPendingAmountForFinancingPlansForEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4;
+ (int64_t)countOfFinancingPlansForEndpointMetadataPID:(int64_t)a3 financingPlanStates:(id)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deletePayLaterFinancingPlanWithIdentifier:(id)a3 forAccountEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePayLaterFinancingPlansForAccountEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlan)initWithPayLaterFinancingPlan:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5;
- (id)financingPlan;
- (id)planIdentifier;
- (void)updateWithPayLaterFinancingPlan:(id)a3;
@end

@implementation PayLaterFinancingPlan

+ (id)databaseTable
{
  return @"huckleberry";
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
  v26 = v7;
  if (v7 == @"pears.a") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_14;
  }
  unsigned __int8 v8 = [@"pears.a" isEqualToString:v7];

  if (v8)
  {
LABEL_4:
    CFStringRef v9 = @"JOIN salmonberry ON salmonberry.pid = huckleberry.a";
    CFStringRef v10 = @"JOIN pears ON pears.pid = salmonberry.a";
LABEL_5:
    [v6 addObject:v10];
LABEL_13:
    [v6 addObject:v9];
    goto LABEL_14;
  }
  v11 = v26;
  if (v11 == @"marionberry.m") {
    goto LABEL_12;
  }
  v12 = v11;
  unsigned __int8 v13 = [@"marionberry.m" isEqualToString:v11];

  if (v13) {
    goto LABEL_12;
  }
  v14 = v12;
  if (v14 == @"marionberry.g"
    || (v15 = v14,
        unsigned __int8 v16 = [@"marionberry.g" isEqualToString:v14],
        v15,
        (v16 & 1) != 0)
    || (v17 = v15, v17 == @"marionberry.gc")
    || (v18 = v17,
        unsigned __int8 v19 = [@"marionberry.gc" isEqualToString:v17],
        v18,
        (v19 & 1) != 0))
  {
LABEL_12:
    CFStringRef v9 = @"JOIN marionberry ON marionberry.a = huckleberry.pid";
    goto LABEL_13;
  }
  v20 = v18;
  if (v20 == @"jostaberry.f"
    || (v21 = v20,
        unsigned __int8 v22 = [@"jostaberry.f" isEqualToString:v20],
        v21,
        (v22 & 1) != 0)
    || (v23 = v21, v23 == @"jostaberry.j")
    || (v24 = v23,
        unsigned int v25 = [@"jostaberry.j" isEqualToString:v23],
        v24,
        v25))
  {
    [v6 addObject:@"JOIN jostaberry ON jostaberry.a = asparagus.pid"];
    CFStringRef v9 = @"JOIN marionberry ON marionberry.a = huckleberry.pid";
    CFStringRef v10 = @"JOIN asparagus ON asparagus.a = huckleberry.pid";
    goto LABEL_5;
  }
LABEL_14:
}

- (PayLaterFinancingPlan)initWithPayLaterFinancingPlan:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  CFStringRef v10 = [(id)objc_opt_class() _propertyValuesForPayLaterFinancingPlan:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  unsigned __int8 v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

+ (id)insertOrUpdatePayLaterFinancingPlan:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  CFStringRef v10 = [v8 planIdentifier];
  id v11 = [a1 _predicateForAccountEndpointMetadataPID:a4 planIdentifier:v10];
  id v12 = [a1 anyInDatabase:v9 predicate:v11];

  if (v12) {
    [v12 updateWithPayLaterFinancingPlan:v8];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithPayLaterFinancingPlan:v8 forEndpointMetadataPID:a4 inDatabase:v9];
  }
  id v13 = [v12 persistentID];
  v14 = [v8 planSummary];

  if (v14)
  {
    v15 = [v8 planSummary];
    id v16 = +[PayLaterFinancingPlanSummary insertOrUpdatePayLaterFinancingPlanSummary:v15 forFinancingPlanPID:v13 inDatabase:v9];
  }
  v17 = [v8 merchant];

  if (v17)
  {
    v18 = [v8 merchant];
    id v19 = +[PayLaterMerchant insertOrUpdatePayLaterMerchant:v18 forFinancingPlanPID:v13 inDatabase:v9];
  }
  v20 = [v8 scheduleSummary];

  if (v20)
  {
    v21 = [v8 scheduleSummary];
    id v22 = +[PayLaterFinancingPlanScheduleSummary insertOrUpdatePayLaterFinancingPlanScheduleSummary:v21 forFinancingPlanPID:v13 inDatabase:v9];
  }
  v23 = [v8 fundingSource];

  if (v23)
  {
    v24 = [v8 fundingSource];
    +[PayLaterFinancingPlanFundingSource insertOrUpdateFinancingPlanFundingSource:v24 forPlanPID:v13 inDatabase:v9];
  }
  unsigned int v25 = [v8 termsDetails];

  if (v25)
  {
    v26 = [v8 termsDetails];
    id v27 = +[PayLaterFinancingPlanTermsDetails insertOrUpdatePayLaterFinancingPlanTermsDetails:v26 forFinancingPlanPID:v13 inDatabase:v9];
  }
  v28 = [v8 disputes];
  id v29 = +[PayLaterFinancingPlanDispute insertOrUpdateFinancingPlanDisputes:v28 forFinancingPlanPID:v13 inDatabase:v9];

  return v12;
}

+ (id)insertOrUpdatePayLaterFinancingPlans:(id)a3 forEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
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
        id v16 = objc_msgSend(a1, "insertOrUpdatePayLaterFinancingPlan:forEndpointMetadataPID:inDatabase:", *(void *)(*((void *)&v19 + 1) + 8 * i), a4, v9, (void)v19);
        if (v16) {
          [v10 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = [v10 copy];
  return v17;
}

- (void)updateWithPayLaterFinancingPlan:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPayLaterFinancingPlan:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountEndpointMetadataPID:a3];
  CFStringRef v14 = @"d";
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  CFStringRef v13 = @"DESC";
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  id v11 = [a1 _financingPlansWithQuery:v10];

  return v11;
}

+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 states:(id)a4 transactionStartDate:(id)a5 transactionEndDate:(id)a6 installmentDueOrPaidDateStart:(id)a7 installmentDueOrPaidDateEnd:(id)a8 limit:(int64_t)a9 inDatabase:(id)a10
{
  id v42 = a10;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v40 = a4;
  long long v20 = [a1 _predicateForInstallmentStartDueDate:v17];
  v47[0] = v20;
  long long v21 = [a1 _predicateForInstallmentStartPayoffDate:v17];

  v47[1] = v21;
  long long v22 = +[NSArray arrayWithObjects:v47 count:2];
  v39 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v22];

  v23 = [a1 _predicateForInstallmentEndDueDate:v16];
  v46[0] = v23;
  v24 = [a1 _predicateForInstallmentEndPayoffDate:v16];

  v46[1] = v24;
  unsigned int v25 = +[NSArray arrayWithObjects:v46 count:2];
  v26 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v25];

  id v27 = [a1 _predicateForAccountEndpointMetadataPID:a3];
  v45[0] = v27;
  v28 = [a1 _predicateForTransactionStartDate:v19];

  v45[1] = v28;
  id v29 = [a1 _predicateForTransactionEndDate:v18];

  v45[2] = v29;
  v45[3] = v39;
  v45[4] = v26;
  v30 = [a1 _predicateForStates:v40];

  v45[5] = v30;
  v31 = +[NSArray arrayWithObjects:v45 count:6];
  v32 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v31];

  CFStringRef v44 = @"marionberry.m";
  v33 = +[NSArray arrayWithObjects:&v44 count:1];
  CFStringRef v43 = @"DESC";
  v34 = +[NSArray arrayWithObjects:&v43 count:1];
  LOBYTE(v38) = 1;
  v35 = [a1 queryWithDatabase:v42 predicate:v32 orderingProperties:v33 orderingDirections:v34 limit:a9 groupingProperties:0 returnsDistinctEntities:v38];

  v36 = [a1 _financingPlansWithQuery:v35];

  return v36;
}

+ (id)financingPlansForEndpointMetadataPID:(int64_t)a3 stateReasons:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _predicateForAccountEndpointMetadataPID:a3];
  v21[0] = v10;
  id v11 = [a1 _predicateForStateReasonList:v9];

  v21[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v21 count:2];
  CFStringRef v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  CFStringRef v20 = @"marionberry.m";
  CFStringRef v14 = +[NSArray arrayWithObjects:&v20 count:1];
  CFStringRef v19 = @"DESC";
  v15 = +[NSArray arrayWithObjects:&v19 count:1];
  id v16 = [a1 queryWithDatabase:v8 predicate:v13 orderingProperties:v14 orderingDirections:v15];

  id v17 = [a1 _financingPlansWithQuery:v16];

  return v17;
}

+ (id)financingPlanIdentifiersForEndpointMetadataPID:(int64_t)a3 states:(id)a4 transactionStartDate:(id)a5 transactionEndDate:(id)a6 limit:(int64_t)a7 inDatabase:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = [a1 _predicateForAccountEndpointMetadataPID:a3];
  v33[0] = v18;
  CFStringRef v19 = [a1 _predicateForTransactionStartDate:v16];

  v33[1] = v19;
  CFStringRef v20 = [a1 _predicateForTransactionEndDate:v15];

  v33[2] = v20;
  long long v21 = [a1 _predicateForStates:v17];

  v33[3] = v21;
  long long v22 = +[NSArray arrayWithObjects:v33 count:4];
  v23 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v22];

  id v24 = objc_alloc_init((Class)NSMutableSet);
  unsigned int v25 = [a1 queryWithDatabase:v14 predicate:v23 orderingProperties:&__NSArray0__struct orderingDirections:&__NSArray0__struct limit:a7];

  CFStringRef v32 = @"b";
  v26 = +[NSArray arrayWithObjects:&v32 count:1];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000675B8;
  v30[3] = &unk_100731258;
  id v27 = v24;
  id v31 = v27;
  [v25 enumeratePersistentIDsAndProperties:v26 usingBlock:v30];

  if ([v27 count]) {
    id v28 = [v27 copy];
  }
  else {
    id v28 = 0;
  }

  return v28;
}

+ (int64_t)countOfFinancingPlansForEndpointMetadataPID:(int64_t)a3 financingPlanStates:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _predicateForAccountEndpointMetadataPID:a3];
  v17[0] = v10;
  id v11 = [a1 _predicateForStates:v9];

  v17[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v17 count:2];
  CFStringRef v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  id v14 = [a1 queryWithDatabase:v8 predicate:v13];

  id v15 = [v14 countOfEntities];
  return (int64_t)v15;
}

+ (id)financingPlansIdentifiersWithState:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForState:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  CFStringRef v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_10006782C;
  id v16 = &unk_100730E38;
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

+ (id)totalPendingAmountForFinancingPlansForEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountEndpointMetadataPID:a3];
  v23[0] = v7;
  id v8 = [a1 _predicateForStates:&off_10078C1B0];
  v23[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v23 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  CFStringRef v19 = sub_10002078C;
  CFStringRef v20 = sub_100020EB8;
  id v21 = 0;
  id v11 = [a1 queryWithDatabase:v6 predicate:v10];
  v22[0] = @"marionberry.g";
  v22[1] = @"marionberry.gc";
  id v12 = +[NSArray arrayWithObjects:v22 count:2];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100067AE0;
  v15[3] = &unk_100731280;
  v15[4] = &v16;
  [v11 enumerateProperties:v12 usingBlock:v15];

  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

+ (id)_financingPlansWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForPayLaterFinancingPlan];
  id v6 = [v5 allKeys];
  v7 = [v6 arrayByAddingObject:@"marionberry.m"];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  [v4 database];
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_100067D04;
  id v17 = &unk_10072DE00;
  id v18 = v5;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v8;
  id v21 = a1;
  id v9 = v8;
  id v10 = v19;
  id v11 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:&v14];

  id v12 = objc_msgSend(v9, "copy", v14, v15, v16, v17);
  return v12;
}

+ (id)anyInDatabase:(id)a3 withPlanIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPlanIdentifier:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPlanPID:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (void)deletePayLaterFinancingPlansForAccountEndpointMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountEndpointMetadataPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deletePayLaterFinancingPlanWithIdentifier:(id)a3 forAccountEndpointMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = [a1 _predicateForAccountEndpointMetadataPID:a4 planIdentifier:a3];
  id v9 = [a1 queryWithDatabase:v8 predicate:v10];

  [v9 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = [(SQLiteEntity *)self database];
  id v4 = [(SQLiteEntity *)v2 persistentID];
  +[PayLaterFinancingPlanSummary deletePayLaterFinancingPlanSummaryForFinancingPlanPID:v4 inDatabase:v3];
  +[PayLaterMerchant deletePayLaterMerchantForFinancingPlanPID:v4 inDatabase:v3];
  +[PayLaterFinancingPlanScheduleSummary deletePayLaterFinancingPlanScheduleSummaryForFinancingPlanPID:v4 inDatabase:v3];
  +[PayLaterFinancingPlanFundingSource deleteFinancingPlanFundingSourceForPlanPID:v4 inDatabase:v3];
  +[PayLaterFinancingPlanDispute deleteFinancingPlanDisputesForFinancingPlanPID:v4 inDatabase:v3];
  +[PayLaterFinancingPlanTermsDetails deletePayLaterFinancingPlanTermsDetailsForFinancingPlanPID:v4 inDatabase:v3];
  v6.receiver = v2;
  v6.super_class = (Class)PayLaterFinancingPlan;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

- (id)financingPlan
{
  id v3 = objc_alloc_init((Class)PKPayLaterFinancingPlan);
  id v4 = [(id)objc_opt_class() _propertySettersForPayLaterFinancingPlan];
  id v5 = [v4 allKeys];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  void v23[2] = sub_10006848C;
  v23[3] = &unk_10072DDD8;
  v23[4] = self;
  id v24 = v4;
  id v6 = v3;
  id v25 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v23];

  id v8 = [(SQLiteEntity *)self database];
  int64_t v9 = [(SQLiteEntity *)self persistentID];
  id v10 = +[PayLaterFinancingPlanSummary anyInDatabase:v8 forFinancingPlanPID:v9];
  id v11 = [v10 planSummary];

  [v6 setPlanSummary:v11];
  id v12 = +[PayLaterMerchant anyInDatabase:v8 forFinancingPlanPID:v9];
  id v13 = [v12 payLaterMerchant];

  [v6 setMerchant:v13];
  uint64_t v14 = +[PayLaterFinancingPlanScheduleSummary anyInDatabase:v8 forFinancingPlanPID:v9];
  uint64_t v15 = [v14 scheduleSummary];

  [v6 setScheduleSummary:v15];
  uint64_t v16 = +[PayLaterFinancingPlanFundingSource anyInDatabase:v8 forPlanPID:v9];
  id v17 = [v16 fundingSource];
  [v6 setFundingSource:v17];

  id v18 = +[PayLaterFinancingPlanDispute financingPlanDisputesForFinancingPlanPID:v9 inDatabase:v8];
  [v6 setDisputes:v18];
  id v19 = +[PayLaterFinancingPlanTermsDetails anyInDatabase:v8 forFinancingPlanPID:v9];
  id v20 = [v19 termsDetails];

  [v6 setTermsDetails:v20];
  id v21 = v6;

  return v21;
}

- (id)planIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"b"];
}

+ (id)_predicateForAccountEndpointMetadataPID:(int64_t)a3 planIdentifier:(id)a4
{
  id v6 = [a1 _predicateForPlanIdentifier:a4];
  id v7 = [a1 _predicateForAccountEndpointMetadataPID:a3];
  v11[0] = v6;
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  int64_t v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)_predicateForAccountEndpointMetadataPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPlanIdentifier:(id)a3
{
  return +[SQLiteStringLikePredicate predicateWithProperty:@"b" matchingPattern:a3];
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

+ (id)_predicateForStates:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(a1, "_predicateForState:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15));
          [v5 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    id v12 = [v5 copy];
    id v13 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v12];
  }
  else
  {
    id v13 = +[SQLiteBooleanPredicate truePredicate];
  }

  return v13;
}

+ (id)_predicateForStateReasonList:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(a1, "_predicateForStateReason:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15));
          [v5 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    id v12 = [v5 copy];
    id v13 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v12];
  }
  else
  {
    id v13 = +[SQLiteBooleanPredicate truePredicate];
  }

  return v13;
}

+ (id)_predicateForState:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"e" equalToValue:v3];

  return v4;
}

+ (id)_predicateForStateReason:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"h" equalToValue:v3];

  return v4;
}

+ (id)_predicateForTransactionStartDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"marionberry.m" greaterThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForTransactionEndDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"marionberry.m" lessThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForInstallmentStartDueDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"jostaberry.f" greaterThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForInstallmentEndDueDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"jostaberry.f" lessThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForInstallmentStartPayoffDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"jostaberry.j" greaterThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForInstallmentEndPayoffDate:(id)a3
{
  if (a3)
  {
    id v3 = (void *)_SQLValueForDate();
    id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"jostaberry.j" lessThanOrEqualToValue:v3];
  }
  else
  {
    id v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_propertyValuesForPayLaterFinancingPlan:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 planIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "productType"), @"c");
  id v6 = [v3 lastUpdated];
  id v7 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v7 forKey:@"d"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "state"), @"e");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "planChannel"), @"f");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "stateReason"), @"h");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "requiresGenericMessaging"), @"i");
  id v8 = [v3 isCancellable];

  [v4 setBool:v8 forKey:@"j"];
  id v9 = [v4 copy];

  return v9;
}

+ (id)_propertySettersForPayLaterFinancingPlan
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_1007312C0;
  v5[1] = &stru_1007312E0;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100731300;
  v5[3] = &stru_100731320;
  v4[4] = @"f";
  v4[5] = @"h";
  v5[4] = &stru_100731340;
  v5[5] = &stru_100731360;
  v4[6] = @"i";
  v4[7] = @"j";
  v5[6] = &stru_100731380;
  v5[7] = &stru_1007313A0;
  v4[8] = @"pears.a";
  v5[8] = &stru_1007313C0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  return v2;
}

@end