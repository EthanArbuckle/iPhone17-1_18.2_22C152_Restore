@interface PayLaterFinancingOptionInstallment
+ (id)_installmentsForQuery:(id)a3;
+ (id)_predicateForFinancingOptionPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterFinancingOptionInstallment;
+ (id)_propertyValuesForPayLaterFinancingOptionInstallment:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterFinancingOptionInstallments:(id)a3 forFinancingOptionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterFinancingOptionInstallmentsForFinancingOptionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterFinancingOptionInstallmentsForFinancingOptionPID:(int64_t)a3 inDatabase:(id)a4;
- (PayLaterFinancingOptionInstallment)initWithPayLaterFinancingOptionInstallment:(id)a3 forFinancingOptionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_dueAmount;
@end

@implementation PayLaterFinancingOptionInstallment

+ (id)databaseTable
{
  return @"guanabana";
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

- (PayLaterFinancingOptionInstallment)initWithPayLaterFinancingOptionInstallment:(id)a3 forFinancingOptionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPayLaterFinancingOptionInstallment:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

+ (id)insertOrUpdatePayLaterFinancingOptionInstallments:(id)a3 forFinancingOptionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterFinancingOptionInstallmentsForFinancingOptionPID:a4 inDatabase:v9];
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v17 = objc_alloc((Class)a1);
        id v18 = objc_msgSend(v17, "initWithPayLaterFinancingOptionInstallment:forFinancingOptionPID:inDatabase:", v16, a4, v9, (void)v21);
        [v10 safelyAddObject:v18];
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  id v19 = [v10 copy];
  return v19;
}

+ (id)payLaterFinancingOptionInstallmentsForFinancingOptionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForFinancingOptionPID:a3];
  CFStringRef v14 = @"d";
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  CFStringRef v13 = @"ASC";
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  id v11 = [a1 _installmentsForQuery:v10];

  return v11;
}

+ (id)_installmentsForQuery:(id)a3
{
  id v4 = a3;
  v5 = [v4 database];
  id v6 = [a1 _propertySettersForPayLaterFinancingOptionInstallment];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [v6 allKeys];
  CFStringRef v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_100423D08;
  id v17 = &unk_10072DE00;
  id v18 = v5;
  id v19 = v6;
  id v20 = v7;
  id v21 = a1;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  [v4 enumeratePersistentIDsAndProperties:v8 usingBlock:&v14];

  id v12 = objc_msgSend(v9, "copy", v14, v15, v16, v17);
  return v12;
}

+ (void)deletePayLaterFinancingOptionInstallmentsForFinancingOptionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForFinancingOptionPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (id)_dueAmount
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"b"];
  id v4 = [(SQLiteEntity *)self valueForProperty:@"c"];
  v5 = [(SQLiteEntity *)self valueForProperty:@"bc"];
  id v6 = [(SQLiteEntity *)self valueForProperty:@"cc"];
  id v7 = PKCurrencyStorageNumberToCurrencyDecimal();
  id v8 = PKCurrencyStorageNumberToCurrencyDecimal();
  id v9 = 0;
  if (v7 && v5)
  {
    id v9 = PKCurrencyAmountMake();
  }
  id v10 = 0;
  if (v8 && v6)
  {
    id v10 = PKCurrencyAmountMake();
  }
  if (v9)
  {
    id v11 = [objc_alloc((Class)PKPayLaterFinancingAmount) initWithCurrencyAmount:v9];
    [v11 setMerchantCurrencyAmount:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)_predicateForFinancingOptionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesForPayLaterFinancingOptionInstallment:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 dueAmount];
  id v6 = [v5 currencyAmount];
  id v7 = [v6 amount];
  id v8 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v8 forKey:@"b"];

  id v9 = [v5 currencyAmount];
  id v10 = [v9 currency];
  [v4 setObjectOrNull:v10 forKey:@"bc"];

  id v11 = [v5 merchantCurrencyAmount];
  id v12 = [v11 amount];
  CFStringRef v13 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v13 forKey:@"c"];

  CFStringRef v14 = [v5 merchantCurrencyAmount];
  uint64_t v15 = [v14 currency];
  [v4 setObjectOrNull:v15 forKey:@"cc"];

  uint64_t v16 = [v3 dueDate];

  id v17 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v17 forKey:@"d"];

  id v18 = [v4 copy];
  return v18;
}

+ (id)_propertySettersForPayLaterFinancingOptionInstallment
{
  CFStringRef v4 = @"d";
  v5 = &stru_1007504B8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

@end