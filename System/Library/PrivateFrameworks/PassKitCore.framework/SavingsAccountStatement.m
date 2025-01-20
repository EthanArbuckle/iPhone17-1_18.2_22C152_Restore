@interface SavingsAccountStatement
+ (id)_commonDictionaryForSavingsAccountStatement:(id)a3;
+ (id)_predicateForAccount:(id)a3;
+ (id)_predicateForNonNullStatementIdentifierForAccount:(id)a3;
+ (id)_predicateForNullStatementIdentifierForAccount:(id)a3;
+ (id)_predicateForStatement:(id)a3 account:(id)a4;
+ (id)_propertySettersForSavingsAccountStatement;
+ (id)_savingsAccountStatementWithIdentifier:(id)a3 account:(id)a4 inDatabase:(id)a5;
+ (id)_savingsAccountStatementsFromQuery:(id)a3;
+ (id)anyInDatabase:(id)a3 withStatementIdentifier:(id)a4 accountIdentifier:(id)a5;
+ (id)databaseTable;
+ (id)insertOrUpdateSavingsAccountStatement:(id)a3 forAccount:(id)a4 inDatabase:(id)a5;
+ (id)lastSavingsAccountStatementForAccount:(id)a3 inDatabase:(id)a4;
+ (id)savingsAccountStatementsForAccount:(id)a3 inDatabase:(id)a4;
+ (id)savingsStatementWithIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)deleteSavingsAccountStatementsForAccount:(id)a3 inDatabase:(id)a4;
+ (void)deleteSavingsAccountStatementsWithoutPDFForAccount:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)closingDate;
- (id)openingDate;
- (id)savingsAccountStatement;
@end

@implementation SavingsAccountStatement

+ (id)databaseTable
{
  return @"eggplant";
}

+ (id)insertOrUpdateSavingsAccountStatement:(id)a3 forAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _commonDictionaryForSavingsAccountStatement:v10];
  v12 = [v10 identifier];

  v13 = [a1 _savingsAccountStatementWithIdentifier:v12 account:v8 inDatabase:v9];

  if (v13)
  {
    [v13 setValuesWithDictionary:v11];
    id v14 = v13;
  }
  else
  {
    [v11 setObjectOrNull:v8 forKey:@"n"];
    id v14 = [objc_alloc((Class)a1) initWithPropertyValues:v11 inDatabase:v9];
  }
  v15 = v14;

  return v15;
}

+ (id)lastSavingsAccountStatementForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForNonNullStatementIdentifierForAccount:a3];
  CFStringRef v15 = @"d";
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  CFStringRef v14 = @"DESC";
  id v9 = +[NSArray arrayWithObjects:&v14 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9 limit:1];

  v11 = [a1 _savingsAccountStatementsFromQuery:v10];
  v12 = [v11 firstObject];

  return v12;
}

+ (id)savingsAccountStatementsForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccount:a3];
  CFStringRef v14 = @"d";
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  CFStringRef v13 = @"DESC";
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  v11 = [a1 _savingsAccountStatementsFromQuery:v10];

  return v11;
}

+ (id)_savingsAccountStatementsFromQuery:(id)a3
{
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100216428;
  id v10 = &unk_100730E38;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v12;
  id v4 = v11;
  [v4 enumeratePersistentIDsUsingBlock:&v7];
  id v5 = objc_msgSend(v3, "copy", v7, v8, v9, v10);

  return v5;
}

+ (id)_savingsAccountStatementWithIdentifier:(id)a3 account:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _predicateForStatement:a3 account:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (id)savingsStatementWithIdentifier:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v5 = [a1 _savingsAccountStatementWithIdentifier:a3 account:a4 inDatabase:a5];
  id v6 = [v5 savingsAccountStatement];

  return v6;
}

+ (id)anyInDatabase:(id)a3 withStatementIdentifier:(id)a4 accountIdentifier:(id)a5
{
  return [a1 _savingsAccountStatementWithIdentifier:a4 account:a5 inDatabase:a3];
}

+ (void)deleteSavingsAccountStatementsWithoutPDFForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForNullStatementIdentifierForAccount:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteSavingsAccountStatementsForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccount:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  id v3 = [(SQLiteEntity *)self valueForProperty:@"b"];
  id v4 = [(SQLiteEntity *)v2 valueForProperty:@"n"];
  id v5 = [(SQLiteEntity *)v2 database];
  +[AccountStatementMetadata deleteAccountStatementMetadataForStatementIdentifier:v3 accountIdentifier:v4 inDatabase:v5];

  v7.receiver = v2;
  v7.super_class = (Class)SavingsAccountStatement;
  LOBYTE(v2) = [(SQLiteEntity *)&v7 deleteFromDatabase];

  return (char)v2;
}

+ (id)_predicateForStatement:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"n" equalToValue:a4];
  v11[0] = v6;
  objc_super v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v5];

  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)_predicateForAccount:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"n" equalToValue:a3];
}

+ (id)_predicateForNullStatementIdentifierForAccount:(id)a3
{
  id v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"n" equalToValue:a3];
  v8[0] = v3;
  id v4 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"b"];
  v8[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v5];

  return v6;
}

+ (id)_predicateForNonNullStatementIdentifierForAccount:(id)a3
{
  id v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"n" equalToValue:a3];
  v8[0] = v3;
  id v4 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"b"];
  v8[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v5];

  return v6;
}

+ (id)_propertySettersForSavingsAccountStatement
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100740A18;
  v5[1] = &stru_100740A38;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100740A58;
  v5[3] = &stru_100740A78;
  v4[4] = @"o";
  v4[5] = @"f";
  v5[4] = &stru_100740A98;
  v5[5] = &stru_100740AB8;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100740AD8;
  v5[7] = &stru_100740AF8;
  v4[8] = @"j";
  v4[9] = @"k";
  v5[8] = &stru_100740B18;
  v5[9] = &stru_100740B38;
  v4[10] = @"l";
  v4[11] = @"p";
  v5[10] = &stru_100740B58;
  v5[11] = &stru_100740B78;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:12];
  return v2;
}

- (id)savingsAccountStatement
{
  id v3 = objc_alloc_init((Class)PKSavingsAccountStatement);
  id v4 = [(id)objc_opt_class() _propertySettersForSavingsAccountStatement];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_1002170D8;
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
  v2 = [(SQLiteEntity *)self valueForProperty:@"d"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

- (id)closingDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"e"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

+ (id)_commonDictionaryForSavingsAccountStatement:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  id v6 = (void *)_SQLValueForString();
  [v4 setObjectOrNull:v6 forKey:@"b"];

  id v7 = [v3 currencyCode];
  id v8 = (void *)_SQLValueForString();
  [v4 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v3 openingDate];
  id v10 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v10 forKey:@"d"];

  id v11 = [v3 closingDate];
  id v12 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v12 forKey:@"e"];

  id v13 = [v3 openingBalance];
  CFStringRef v14 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v14 forKey:@"o"];

  CFStringRef v15 = [v3 closingBalance];
  v16 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v16 forKey:@"f"];

  v17 = [v3 interestEarned];
  v18 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v18 forKey:@"h"];

  v19 = [v3 totalDeposits];
  v20 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v20 forKey:@"i"];

  v21 = [v3 totalDailyCashDeposits];
  v22 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v22 forKey:@"j"];

  v23 = [v3 totalWithdrawn];
  v24 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v24 forKey:@"k"];

  v25 = [v3 apy];
  v26 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v26 forKey:@"l"];

  id v27 = [v3 statementPeriodDays];
  v28 = +[NSNumber numberWithInteger:v27];
  [v4 setObjectOrNull:v28 forKey:@"p"];

  return v4;
}

@end