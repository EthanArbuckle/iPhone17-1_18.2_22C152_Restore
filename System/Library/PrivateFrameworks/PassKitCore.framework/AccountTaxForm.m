@interface AccountTaxForm
+ (id)_accountTaxFormWithIdentifier:(id)a3 account:(id)a4 inDatabase:(id)a5;
+ (id)_commonDictionaryForAccountTaxForm:(id)a3;
+ (id)_predicateForAccount:(id)a3;
+ (id)_predicateForNonNullTaxFormIdentifierForAccount:(id)a3;
+ (id)_predicateForNullTaxFormIdentifierForAccount:(id)a3;
+ (id)_predicateForTaxForm:(id)a3 account:(id)a4;
+ (id)_propertySettersForAccountTaxForm;
+ (id)_taxFormsFromQuery:(id)a3;
+ (id)accountTaxFormsForAccount:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountTaxForm:(id)a3 forAccount:(id)a4 inDatabase:(id)a5;
+ (id)lastAccountTaxFormForAccount:(id)a3 inDatabase:(id)a4;
+ (void)deleteAccountTaxFormsWithoutPDFForAccount:(id)a3 inDatabase:(id)a4;
- (id)taxForm;
@end

@implementation AccountTaxForm

+ (id)databaseTable
{
  return @"potato";
}

+ (id)insertOrUpdateAccountTaxForm:(id)a3 forAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [a1 _commonDictionaryForAccountTaxForm:v10];
  v12 = [v10 identifier];

  v13 = [a1 _accountTaxFormWithIdentifier:v12 account:v8 inDatabase:v9];

  if (v13)
  {
    [v13 setValuesWithDictionary:v11];
    id v14 = v13;
  }
  else
  {
    [v11 setObjectOrNull:v8 forKey:@"f"];
    id v14 = [objc_alloc((Class)a1) initWithPropertyValues:v11 inDatabase:v9];
  }
  v15 = v14;

  return v15;
}

+ (id)lastAccountTaxFormForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForNonNullTaxFormIdentifierForAccount:a3];
  CFStringRef v15 = @"d";
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  CFStringRef v14 = @"DESC";
  id v9 = +[NSArray arrayWithObjects:&v14 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9 limit:1];

  v11 = [a1 _taxFormsFromQuery:v10];
  v12 = [v11 anyObject];

  return v12;
}

+ (id)accountTaxFormsForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccount:a3];
  CFStringRef v14 = @"d";
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  CFStringRef v13 = @"DESC";
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  v11 = [a1 _taxFormsFromQuery:v10];

  return v11;
}

+ (id)_taxFormsFromQuery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v16 = @"pid";
  v5 = +[NSArray arrayWithObjects:&v16 count:1];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_1002AC304;
  CFStringRef v13 = &unk_10072ED00;
  id v14 = v3;
  id v15 = v4;
  id v6 = v4;
  id v7 = v3;
  [v7 enumeratePersistentIDsAndProperties:v5 usingBlock:&v10];

  id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);
  return v8;
}

+ (id)_accountTaxFormWithIdentifier:(id)a3 account:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _predicateForTaxForm:a3 account:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (void)deleteAccountTaxFormsWithoutPDFForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForNullTaxFormIdentifierForAccount:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_predicateForTaxForm:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"f" equalToValue:a4];
  v11[0] = v6;
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v5];

  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)_predicateForAccount:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"f" equalToValue:a3];
}

+ (id)_predicateForNullTaxFormIdentifierForAccount:(id)a3
{
  id v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"f" equalToValue:a3];
  v8[0] = v3;
  id v4 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"b"];
  v8[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v5];

  return v6;
}

+ (id)_predicateForNonNullTaxFormIdentifierForAccount:(id)a3
{
  id v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"f" equalToValue:a3];
  v8[0] = v3;
  id v4 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"b"];
  v8[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v5];

  return v6;
}

+ (id)_propertySettersForAccountTaxForm
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_1007454D8;
  v5[1] = &stru_1007454F8;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100745518;
  v5[3] = &stru_100745538;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

- (id)taxForm
{
  id v3 = objc_alloc_init((Class)PKAccountTaxForm);
  id v4 = +[AccountTaxForm _propertySettersForAccountTaxForm];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_1002ACAA4;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_commonDictionaryForAccountTaxForm:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "type"), @"c");
  id v6 = [v3 openingDate];
  id v7 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v7 forKey:@"d"];

  id v8 = [v3 closingDate];

  id v9 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v9 forKey:@"e"];

  return v4;
}

@end