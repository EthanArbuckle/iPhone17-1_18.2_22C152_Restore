@interface CreditAccountStatement
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForAccountIdentifiers:(id)a3;
+ (id)_predicateForCreditAccountSummaryPID:(int64_t)a3;
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_propertySettersForCreditAccountStatement;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountStatementForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)creditAccountStatementWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)creditAccountStatementsForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)creditAccountStatementsWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)creditAccountStatementsWithIdentifier:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)creditAccountStatementsWithIdentifier:(id)a3 withAccountIdentifiers:(id)a4 inDatabase:(id)a5;
+ (id)databaseTable;
+ (id)insertCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertCreditAccountStatement:(id)a3 forEventPID:(int64_t)a4 withAccountIdentifier:(id)a5 inDatabase:(id)a6;
+ (id)insertCreditAccountStatement:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)deleteCreditAccountStatementForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteCreditAccountStatementForEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteCreditAccountStatementsForAccount:(id)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 forEventPID:(int64_t)a4 withAccountIdentifier:(id)a5 inDatabase:(id)a6;
- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5;
- (id)closingDate;
- (id)creditAccountStatement;
- (id)openingDate;
- (void)populateDictionary:(id)a3 forStatement:(id)a4;
- (void)updateWithCreditAccountStatement:(id)a3;
@end

@implementation CreditAccountStatement

+ (id)databaseTable
{
  return @"pineapples";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"t";
  }
  return 0;
}

- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  [(CreditAccountStatement *)self populateDictionary:v10 forStatement:v9];
  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v12;
}

- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 forEventPID:(int64_t)a4 withAccountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = +[NSMutableDictionary dictionary];
  v14 = +[NSNumber numberWithLongLong:a4];
  [v13 setObjectOrNull:v14 forKey:@"s"];

  [v13 setObjectOrNull:v11 forKey:@"t"];
  [(CreditAccountStatement *)self populateDictionary:v13 forStatement:v12];

  v15 = [(SQLiteEntity *)self initWithPropertyValues:v13 inDatabase:v10];
  return v15;
}

- (CreditAccountStatement)initWithCreditAccountStatement:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSMutableDictionary dictionary];
  [v11 setObjectOrNull:v9 forKey:@"t"];

  [(CreditAccountStatement *)self populateDictionary:v11 forStatement:v10];
  id v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];

  return v12;
}

- (void)populateDictionary:(id)a3 forStatement:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 identifier];
  id v8 = (void *)_SQLValueForString();
  [v6 setObject:v8 forKey:@"b"];

  id v9 = [v5 openingDate];
  id v10 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v10 forKey:@"c"];

  id v11 = [v5 closingDate];
  id v12 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v12 forKey:@"d"];

  v13 = [v5 paymentDueDate];
  v14 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v14 forKey:@"e"];

  v15 = [v5 currencyCode];
  v16 = (void *)_SQLValueForString();
  [v6 setObjectOrNull:v16 forKey:@"f"];

  v17 = [v5 statementBalance];
  v18 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v18 forKey:@"g"];

  v19 = [v5 totalBalance];
  v20 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v20 forKey:@"total_balance"];

  v21 = [v5 minimumDue];
  v22 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v22 forKey:@"h"];

  v23 = [v5 purchases];
  v24 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v24 forKey:@"i"];

  v25 = [v5 feesCharged];
  v26 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v26 forKey:@"j"];

  v27 = [v5 interestCharged];
  v28 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v28 forKey:@"k"];

  v29 = [v5 balanceTransfers];
  v30 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v30 forKey:@"l"];

  v31 = [v5 paymentsAndCredits];
  v32 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v32 forKey:@"m"];

  v33 = [v5 payments];
  v34 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v34 forKey:@"u"];

  v35 = [v5 credits];
  v36 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v36 forKey:@"v"];

  v37 = [v5 rewardsBalance];
  v38 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v38 forKey:@"n"];

  v39 = [v5 rewardsEarned];
  v40 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v40 forKey:@"o"];

  v41 = [v5 rewardsRedeemed];
  v42 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v42 forKey:@"p"];

  v43 = [v5 rewardsYTD];
  v44 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v44 forKey:@"q"];

  id v46 = [v5 rewardsLifetime];

  v45 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v45 forKey:@"r"];
}

+ (id)insertCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountStatement:v9 forCreditAccountSummaryPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteCreditAccountStatementForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForCreditAccountSummaryPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)creditAccountStatementForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCreditAccountSummaryPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 creditAccountStatement];

  return v9;
}

+ (id)insertCreditAccountStatement:(id)a3 forEventPID:(int64_t)a4 withAccountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 identifier];
  v14 = [a1 creditAccountStatementsWithIdentifier:v13 withAccountIdentifier:v11 inDatabase:v12];

  if ([v14 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      id v17 = v16;
      id v18 = 0;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (v18) {
            objc_msgSend(v21, "deleteFromDatabase", (void)v24);
          }
          else {
            id v18 = v21;
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }
    else
    {
      id v18 = 0;
    }

    v22 = +[NSNumber numberWithLongLong:a4];
    [v18 setValue:v22 forProperty:@"s"];

    [v18 updateWithCreditAccountStatement:v10];
  }
  else
  {
    id v18 = [objc_alloc((Class)a1) initWithCreditAccountStatement:v10 forEventPID:a4 withAccountIdentifier:v11 inDatabase:v12];
  }

  return v18;
}

+ (void)deleteCreditAccountStatementForEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForEventPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = [(SQLiteEntity *)self valueForProperty:@"b"];
  v4 = [(SQLiteEntity *)v2 valueForProperty:@"t"];
  id v5 = [(SQLiteEntity *)v2 database];
  +[AccountStatementMetadata deleteAccountStatementMetadataForStatementIdentifier:v3 accountIdentifier:v4 inDatabase:v5];

  v7.receiver = v2;
  v7.super_class = (Class)CreditAccountStatement;
  LOBYTE(v2) = [(SQLiteEntity *)&v7 deleteFromDatabase];

  return (char)v2;
}

+ (id)creditAccountStatementsWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a1 _predicateForEventPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = +[NSMutableSet set];
  CFStringRef v21 = @"pid";
  id v10 = +[NSArray arrayWithObjects:&v21 count:1];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1001A0424;
  id v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)creditAccountStatementsForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a1 _predicateForAccountIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = +[NSMutableSet set];
  CFStringRef v21 = @"pid";
  id v10 = +[NSArray arrayWithObjects:&v21 count:1];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1001A0624;
  id v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertCreditAccountStatement:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 identifier];
  id v12 = [a1 creditAccountStatementsWithIdentifier:v11 withAccountIdentifier:v9 inDatabase:v10];

  if ([v12 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      id v16 = 0;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (v16) {
            objc_msgSend(v19, "deleteFromDatabase", (void)v21);
          }
          else {
            id v16 = v19;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }
    else
    {
      id v16 = 0;
    }

    [v16 updateWithCreditAccountStatement:v8];
  }
  else
  {
    id v16 = [objc_alloc((Class)a1) initWithCreditAccountStatement:v8 withAccountIdentifier:v9 inDatabase:v10];
  }

  return v16;
}

+ (id)creditAccountStatementsWithIdentifier:(id)a3 withAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[NSSet setWithObject:a4];
  id v11 = [a1 creditAccountStatementsWithIdentifier:v9 withAccountIdentifiers:v10 inDatabase:v8];

  return v11;
}

+ (id)creditAccountStatementsWithIdentifier:(id)a3 withAccountIdentifiers:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _predicateForIdentifier:a3];
  v28[0] = v10;
  id v11 = [a1 _predicateForAccountIdentifiers:v9];

  v28[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v28 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  id v14 = [a1 queryWithDatabase:v8 predicate:v13];
  id v15 = +[NSMutableSet set];
  CFStringRef v27 = @"pid";
  id v16 = +[NSArray arrayWithObjects:&v27 count:1];
  long long v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  long long v23 = sub_1001A0AFC;
  long long v24 = &unk_10072ED00;
  id v25 = v8;
  id v26 = v15;
  id v17 = v15;
  id v18 = v8;
  [v14 enumeratePersistentIDsAndProperties:v16 usingBlock:&v21];

  id v19 = objc_msgSend(v17, "copy", v21, v22, v23, v24);
  return v19;
}

+ (id)creditAccountStatementWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a1 _predicateForIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (void)deleteCreditAccountStatementsForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountIdentifier:a3];
  objc_super v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)updateCreditAccountStatement:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForCreditAccountSummaryPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updateWithCreditAccountStatement:v12];
  }
  else {
    id v11 = +[CreditAccountStatement insertCreditAccountStatement:v12 forCreditAccountSummaryPID:a4 inDatabase:v8];
  }
}

- (void)updateWithCreditAccountStatement:(id)a3
{
  id v4 = a3;
  id v45 = +[NSMutableDictionary dictionary];
  id v5 = [v4 identifier];
  id v6 = (void *)_SQLValueForString();
  [v45 setObject:v6 forKey:@"b"];

  objc_super v7 = [v4 openingDate];
  id v8 = (void *)_SQLValueForDate();
  [v45 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v4 closingDate];
  id v10 = (void *)_SQLValueForDate();
  [v45 setObjectOrNull:v10 forKey:@"d"];

  id v11 = [v4 paymentDueDate];
  id v12 = (void *)_SQLValueForDate();
  [v45 setObjectOrNull:v12 forKey:@"e"];

  id v13 = [v4 currencyCode];
  id v14 = (void *)_SQLValueForString();
  [v45 setObjectOrNull:v14 forKey:@"f"];

  id v15 = [v4 statementBalance];
  id v16 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v16 forKey:@"g"];

  id v17 = [v4 totalBalance];
  id v18 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v18 forKey:@"total_balance"];

  id v19 = [v4 minimumDue];
  id v20 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v20 forKey:@"h"];

  long long v21 = [v4 purchases];
  uint64_t v22 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v22 forKey:@"i"];

  long long v23 = [v4 feesCharged];
  long long v24 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v24 forKey:@"j"];

  id v25 = [v4 interestCharged];
  id v26 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v26 forKey:@"k"];

  CFStringRef v27 = [v4 balanceTransfers];
  v28 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v28 forKey:@"l"];

  v29 = [v4 paymentsAndCredits];
  v30 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v30 forKey:@"m"];

  v31 = [v4 payments];
  v32 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v32 forKey:@"u"];

  v33 = [v4 credits];
  v34 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v34 forKey:@"v"];

  v35 = [v4 rewardsBalance];
  v36 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v36 forKey:@"n"];

  v37 = [v4 rewardsEarned];
  v38 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v38 forKey:@"o"];

  v39 = [v4 rewardsRedeemed];
  v40 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v40 forKey:@"p"];

  v41 = [v4 rewardsYTD];
  v42 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v42 forKey:@"q"];

  v43 = [v4 rewardsLifetime];

  v44 = +[NSNumber numberWithLongLong:PKCurrencyDecimalToStorageInteger()];
  [v45 setObjectOrNull:v44 forKey:@"r"];

  [(SQLiteEntity *)self setValuesWithDictionary:v45];
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForCreditAccountSummaryPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"s" equalToValue:v3];

  return v4;
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"t" equalToValue:a3];
}

+ (id)_predicateForAccountIdentifiers:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"t" values:a3];
}

+ (id)_propertySettersForCreditAccountStatement
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10073C108;
  v5[1] = &stru_10073C128;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_10073C148;
  v5[3] = &stru_10073C168;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_10073C188;
  v5[5] = &stru_10073C1A8;
  v4[6] = @"total_balance";
  v4[7] = @"h";
  v5[6] = &stru_10073C1C8;
  v5[7] = &stru_10073C1E8;
  v4[8] = @"i";
  v4[9] = @"j";
  v5[8] = &stru_10073C208;
  v5[9] = &stru_10073C228;
  v4[10] = @"k";
  v4[11] = @"l";
  v5[10] = &stru_10073C248;
  v5[11] = &stru_10073C268;
  v4[12] = @"m";
  v4[13] = @"u";
  v5[12] = &stru_10073C288;
  v5[13] = &stru_10073C2A8;
  v4[14] = @"v";
  v4[15] = @"n";
  v5[14] = &stru_10073C2C8;
  v5[15] = &stru_10073C2E8;
  v4[16] = @"o";
  v4[17] = @"p";
  v5[16] = &stru_10073C308;
  v5[17] = &stru_10073C328;
  v4[18] = @"q";
  v4[19] = @"r";
  v5[18] = &stru_10073C348;
  v5[19] = &stru_10073C368;
  v4[20] = @"t";
  v5[20] = &stru_10073C388;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:21];
  return v2;
}

- (id)creditAccountStatement
{
  id v3 = objc_alloc_init((Class)PKCreditAccountStatement);
  id v4 = [(id)objc_opt_class() _propertySettersForCreditAccountStatement];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A1E5C;
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

- (id)openingDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"c"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

- (id)closingDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"d"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

@end