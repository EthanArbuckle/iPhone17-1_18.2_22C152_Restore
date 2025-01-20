@interface PayLaterFinancingPlanDispute
+ (id)_diputesForQuery:(id)a3;
+ (id)_predicateForDisputeIdentifier:(id)a3;
+ (id)_predicateForDisputeState:(unint64_t)a3;
+ (id)_predicateForFinancingPlanPID:(int64_t)a3;
+ (id)_predicateForFinancingPlanPID:(int64_t)a3 disputeIdentifier:(id)a4;
+ (id)_propertySettersForFinancingPlanDispute;
+ (id)_propertyValuesForFinancingPlanDispute:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)disputeIdentifiersWithState:(unint64_t)a3 inDatabase:(id)a4;
+ (id)financingPlanDisputesForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateFinancingPlanDispute:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateFinancingPlanDisputes:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteFinancingPlanDisputesForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlanDispute)initWithFinancingPlanDispute:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)disputeIdentifier;
- (id)planIdentifier;
- (void)updateWithFinancingPlanDispute:(id)a3;
@end

@implementation PayLaterFinancingPlanDispute

+ (id)databaseTable
{
  return @"chickpeas";
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

- (PayLaterFinancingPlanDispute)initWithFinancingPlanDispute:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForFinancingPlanDispute:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

+ (id)insertOrUpdateFinancingPlanDispute:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 identifier];
  id v11 = [a1 _predicateForFinancingPlanPID:a4 disputeIdentifier:v10];
  id v12 = [a1 anyInDatabase:v8 predicate:v11];

  if (v12) {
    [v12 updateWithFinancingPlanDispute:v9];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithFinancingPlanDispute:v9 forFinancingPlanPID:a4 inDatabase:v8];
  }
  v13 = [v9 appliedPayments];

  id v14 = +[PayLaterAppliedPayment insertOrUpdatePayLaterAppliedPayments:forDisputePID:inDatabase:](PayLaterAppliedPayment, "insertOrUpdatePayLaterAppliedPayments:forDisputePID:inDatabase:", v13, [v12 persistentID], v8);
  return v12;
}

+ (id)insertOrUpdateFinancingPlanDisputes:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deleteFinancingPlanDisputesForFinancingPlanPID:a4 inDatabase:v9];
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
        v16 = objc_msgSend(a1, "insertOrUpdateFinancingPlanDispute:forFinancingPlanPID:inDatabase:", *(void *)(*((void *)&v19 + 1) + 8 * i), a4, v9, (void)v19);
        [v10 safelyAddObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = [v10 copy];
  return v17;
}

- (void)updateWithFinancingPlanDispute:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForFinancingPlanDispute:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)disputeIdentifiersWithState:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForDisputeState:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100427640;
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

+ (id)financingPlanDisputesForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForFinancingPlanPID:a3];
  CFStringRef v14 = @"d";
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  CFStringRef v13 = @"DESC";
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  id v11 = [a1 _diputesForQuery:v10];

  return v11;
}

+ (id)_diputesForQuery:(id)a3
{
  id v4 = a3;
  id v5 = [v4 database];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = [a1 _propertySettersForFinancingPlanDispute];
  id v8 = [v7 allKeys];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100427938;
  v15[3] = &unk_10073C4A8;
  id v19 = v6;
  id v20 = a1;
  id v16 = v5;
  id v17 = v7;
  id v18 = v4;
  id v9 = v6;
  id v10 = v4;
  id v11 = v7;
  id v12 = v5;
  [v10 enumeratePersistentIDsAndProperties:v8 usingBlock:v15];

  id v13 = [v9 copy];
  return v13;
}

+ (void)deleteFinancingPlanDisputesForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForFinancingPlanPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)self database];
  +[PayLaterAppliedPayment deletePayLaterAppliedPaymentsForDisputePID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)PayLaterFinancingPlanDispute;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (id)_predicateForFinancingPlanPID:(int64_t)a3 disputeIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForFinancingPlanPID:a3];
  id v8 = [a1 _predicateForDisputeIdentifier:v6];

  v12[0] = v7;
  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForFinancingPlanPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForDisputeIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForDisputeState:(unint64_t)a3
{
  int64_t v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"c" equalToValue:v3];

  return v4;
}

- (id)planIdentifier
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"a"];
  id v4 = +[PayLaterFinancingPlan anyInDatabase:self->super._database withPlanPID:v3];
  if ([v4 existsInDatabase])
  {
    id v5 = [v4 planIdentifier];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)disputeIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"b"];
}

+ (id)_propertyValuesForFinancingPlanDispute:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 emailAddress];
  [v4 setObjectOrNull:v6 forKey:@"h"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "state"), @"c");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "requiredDocuments"), @"i");
  v7 = [v3 openDate];
  id v8 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v8 forKey:@"d"];

  id v9 = [v3 lastUpdated];
  id v10 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v10 forKey:@"e"];

  id v11 = [v3 deadlineDate];

  id v12 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v12 forKey:@"f"];

  id v13 = [v4 copy];
  return v13;
}

+ (id)_propertySettersForFinancingPlanDispute
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100750820;
  v5[1] = &stru_100750840;
  v4[2] = @"i";
  v4[3] = @"d";
  v5[2] = &stru_100750860;
  v5[3] = &stru_100750880;
  v4[4] = @"e";
  v4[5] = @"f";
  v5[4] = &stru_1007508A0;
  v5[5] = &stru_1007508C0;
  v4[6] = @"h";
  v5[6] = &stru_1007508E0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end