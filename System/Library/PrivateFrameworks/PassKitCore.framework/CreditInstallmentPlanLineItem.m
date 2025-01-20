@interface CreditInstallmentPlanLineItem
+ (id)_lineItemsWithQuery:(id)a3;
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_predicateForInstallmentPlanPaymentPID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForInstallmentPlanLineItem:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateLineItems:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateLineItems:(id)a3 forInstallmentPlanPaymentPID:(id)a4 inDatabase:(id)a5;
+ (id)lineItemForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (id)lineItemsForInstallmentPlanPaymentPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteLineItemsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteLineItemsForInstallmentPlanPaymentPID:(id)a3 inDatabase:(id)a4;
- (CreditInstallmentPlanLineItem)initWithInstallmentPlanLineItem:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (CreditInstallmentPlanLineItem)initWithInstallmentPlanLineItem:(id)a3 forInstallmentPlanPaymentPID:(id)a4 inDatabase:(id)a5;
@end

@implementation CreditInstallmentPlanLineItem

+ (id)databaseTable
{
  return @"currant";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"b";
  }
  return 0;
}

- (CreditInstallmentPlanLineItem)initWithInstallmentPlanLineItem:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _propertyValuesForInstallmentPlanLineItem:v10];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  v13 = v12;
  [(SQLiteEntity *)v13 setValue:v9 forProperty:@"a"];

  return v13;
}

- (CreditInstallmentPlanLineItem)initWithInstallmentPlanLineItem:(id)a3 forInstallmentPlanPaymentPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _propertyValuesForInstallmentPlanLineItem:v10];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  v13 = v12;
  [(SQLiteEntity *)v13 setValue:v9 forProperty:@"b"];

  return v13;
}

+ (id)lineItemForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentPlanPID:a3];
  CFStringRef v14 = @"order_index";
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  CFStringRef v13 = @"ASC";
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  v11 = [a1 _lineItemsWithQuery:v10];

  return v11;
}

+ (id)lineItemsForInstallmentPlanPaymentPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentPlanPaymentPID:a3];
  CFStringRef v14 = @"order_index";
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  CFStringRef v13 = @"ASC";
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  v11 = [a1 _lineItemsWithQuery:v10];

  return v11;
}

+ (id)insertOrUpdateLineItems:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  [a1 deleteLineItemsForInstallmentPlanPID:v8 inDatabase:v9];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10034E020;
  v16[3] = &unk_10074A3C0;
  id v17 = v8;
  id v18 = v9;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  [v10 enumerateObjectsUsingBlock:v16];

  if ([v11 count]) {
    id v14 = [v11 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

+ (id)insertOrUpdateLineItems:(id)a3 forInstallmentPlanPaymentPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  [a1 deleteLineItemsForInstallmentPlanPaymentPID:v8 inDatabase:v9];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10034E218;
  v16[3] = &unk_10074A3C0;
  id v17 = v8;
  id v18 = v9;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  [v10 enumerateObjectsUsingBlock:v16];

  if ([v11 count]) {
    id v14 = [v11 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

+ (void)deleteLineItemsForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForInstallmentPlanPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteLineItemsForInstallmentPlanPaymentPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForInstallmentPlanPaymentPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_predicateForInstallmentPlanPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForInstallmentPlanPaymentPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_lineItemsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySetters];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10034E54C;
  v12[3] = &unk_10072EAD8;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if ([v8 count]) {
    id v10 = [v8 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (id)_propertyValuesForInstallmentPlanLineItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "type"), @"c");
  v5 = [v3 amount];
  id v6 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v6 forKey:@"d"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "duration"), @"e");
  v7 = [v3 itemDescription];
  [v4 setObjectOrNull:v7 forKey:@"f"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "state"), @"g");
  id v8 = [v3 identifier];
  [v4 setObjectOrNull:v8 forKey:@"h"];

  id v9 = [v3 paymentsToDateAmount];

  id v10 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v10 forKey:@"i"];

  id v11 = [v4 copy];
  return v11;
}

+ (id)_propertySetters
{
  v4[0] = @"c";
  v4[1] = @"d";
  v5[0] = &stru_10074A400;
  v5[1] = &stru_10074A420;
  v4[2] = @"e";
  v4[3] = @"f";
  v5[2] = &stru_10074A440;
  v5[3] = &stru_10074A460;
  v4[4] = @"g";
  v4[5] = @"h";
  v5[4] = &stru_10074A480;
  v5[5] = &stru_10074A4A0;
  v4[6] = @"i";
  v5[6] = &stru_10074A4C0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end