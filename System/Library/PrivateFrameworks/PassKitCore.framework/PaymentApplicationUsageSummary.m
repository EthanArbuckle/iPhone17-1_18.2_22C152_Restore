@interface PaymentApplicationUsageSummary
+ (id)_predicateForPassUniqueIdentifier:(id)a3;
+ (id)_predicateForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4;
+ (id)_predicateForPaymentApplicationIdentifier:(id)a3;
+ (id)_propertySettersForObject;
+ (id)_propertyValuesFor:(id)a3;
+ (id)_usageSummariesWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)allUsageSummariesInDatabase:(id)a3;
+ (id)databaseTable;
+ (id)usageSummariesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteUsageSummariesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteUsageSummariesForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)insertOrUpdateUsageSummary:(id)a3 inDatabase:(id)a4;
- (PaymentApplicationUsageSummary)initWithObject:(id)a3 inDatabase:(id)a4;
- (id)usageSummary;
- (void)updateWithObject:(id)a3;
@end

@implementation PaymentApplicationUsageSummary

- (PaymentApplicationUsageSummary)initWithObject:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() _propertyValuesFor:v7];

  v9 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v9;
}

- (void)updateWithObject:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesFor:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)databaseTable
{
  return @"payment_application_usage_summary";
}

+ (id)usageSummariesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassUniqueIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];
  v9 = [a1 _usageSummariesWithQuery:v8 inDatabase:v6];

  return v9;
}

+ (id)allUsageSummariesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [a1 queryWithDatabase:v4 predicate:0];
  id v6 = [a1 _usageSummariesWithQuery:v5 inDatabase:v4];

  return v6;
}

+ (id)_usageSummariesWithQuery:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = [a1 _propertySettersForObject];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = [v6 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10035EE24;
  v13[3] = &unk_100741C48;
  id v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v15 = v9;
  id v10 = v6;
  [v5 enumerateProperties:v8 usingBlock:v13];

  if ([v9 count]) {
    id v11 = [v9 copy];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

+ (void)insertOrUpdateUsageSummary:(id)a3 inDatabase:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [v13 passUniqueIdentifier];
  v8 = [v13 paymentApplicationIdentifier];
  id v9 = [a1 _predicateForPassUniqueIdentifier:v7 paymentApplicationIdentifier:v8];

  id v10 = [a1 anyInDatabase:v6 predicate:v9];
  if (v10)
  {
    id v11 = v10;
    v12 = [(PaymentApplicationUsageSummary *)v10 usageSummary];
    [v12 updateWithSummary:v13];
    [(PaymentApplicationUsageSummary *)v11 updateWithObject:v12];
  }
  else
  {
    id v11 = [[PaymentApplicationUsageSummary alloc] initWithObject:v13 inDatabase:v6];
  }
}

+ (void)deleteUsageSummariesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassUniqueIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)deleteUsageSummariesForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v10 = [a1 _predicateForPassUniqueIdentifier:a3 paymentApplicationIdentifier:a4];
  id v9 = [a1 queryWithDatabase:v8 predicate:v10];

  [v9 deleteAllEntities];
}

- (id)usageSummary
{
  id v3 = objc_alloc((Class)PKPaymentApplicationUsageSummary);
  id v4 = [v3 _databaseInit];

  id v5 = [(id)objc_opt_class() _propertySettersForObject];
  id v6 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10035F1F4;
  v12[3] = &unk_10072DDD8;
  v12[4] = self;
  id v13 = v5;
  id v7 = v4;
  id v14 = v7;
  id v8 = v5;
  [(SQLiteEntity *)self getValuesForProperties:v6 withApplier:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

+ (id)_predicateForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassUniqueIdentifier:a3];
  v12[0] = v7;
  id v8 = [a1 _predicateForPaymentApplicationIdentifier:v6];

  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForPassUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass_unique_identifier" equalToValue:a3];
}

+ (id)_predicateForPaymentApplicationIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application_identifier" equalToValue:a3];
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 passUniqueIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"pass_unique_identifier"];

  id v6 = [v3 paymentApplicationIdentifier];
  [v4 setObjectOrNull:v6 forKey:@"payment_application_identifier"];

  id v7 = [v3 lastUsed];
  id v8 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v8 forKey:@"last_used"];

  id v9 = [v3 lastUsedTransaction];

  id v10 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v10 forKey:@"last_used_transaction"];

  return v4;
}

+ (id)_propertySettersForObject
{
  v4[0] = @"pass_unique_identifier";
  v4[1] = @"payment_application_identifier";
  v5[0] = &stru_10074AE58;
  v5[1] = &stru_10074AE78;
  v4[2] = @"last_used";
  v4[3] = @"last_used_transaction";
  v5[2] = &stru_10074AE98;
  v5[3] = &stru_10074AEB8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end