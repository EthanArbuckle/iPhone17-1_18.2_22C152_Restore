@interface InstallmentPlanMerchant
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForInstallmentPlanMerchant:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateMerchant:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
+ (id)merchantForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteMerchantForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
- (InstallmentPlanMerchant)initWithInstallmentPlanMerchant:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (id)merchant;
- (void)updateWithMerchant:(id)a3;
@end

@implementation InstallmentPlanMerchant

+ (id)databaseTable
{
  return @"acorn";
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

- (InstallmentPlanMerchant)initWithInstallmentPlanMerchant:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _propertyValuesForInstallmentPlanMerchant:v10];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  v13 = v12;
  [(SQLiteEntity *)v13 setValue:v9 forProperty:@"a"];

  return v13;
}

+ (void)deleteMerchantForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentPlanPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (id)insertOrUpdateMerchant:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 _predicateForInstallmentPlanPID:v9];
  id v12 = [a1 anyInDatabase:v10 predicate:v11];

  if (v12) {
    [v12 updateWithMerchant:v8];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithInstallmentPlanMerchant:v8 forInstallmentPlanPID:v9 inDatabase:v10];
  }

  return v12;
}

- (void)updateWithMerchant:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForInstallmentPlanMerchant:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)merchantForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentPlanPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 merchant];

  return v9;
}

- (id)merchant
{
  id v3 = objc_alloc_init((Class)PKInstallmentPlanMerchant);
  id v4 = [(id)objc_opt_class() _propertySetters];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10027B150;
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

+ (id)_predicateForInstallmentPlanPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_propertyValuesForInstallmentPlanMerchant:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 name];
  [v4 setObjectOrNull:v6 forKey:@"c"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "categoryCode"), @"d");
  id v7 = [v3 city];
  [v4 setObjectOrNull:v7 forKey:@"e"];

  id v8 = [v3 state];
  [v4 setObjectOrNull:v8 forKey:@"f"];

  id v9 = [v3 postalCode];
  [v4 setObjectOrNull:v9 forKey:@"g"];

  id v10 = [v3 country];

  [v4 setObjectOrNull:v10 forKey:@"h"];
  id v11 = [v4 copy];

  return v11;
}

+ (id)_propertySetters
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100743F70;
  v5[1] = &stru_100743F90;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100743FB0;
  v5[3] = &stru_100743FD0;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100743FF0;
  v5[5] = &stru_100744010;
  v4[6] = @"h";
  v5[6] = &stru_100744030;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end