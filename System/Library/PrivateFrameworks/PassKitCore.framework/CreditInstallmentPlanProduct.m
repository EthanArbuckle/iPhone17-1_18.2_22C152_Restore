@interface CreditInstallmentPlanProduct
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForInstallmentPlanProduct:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateProduct:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
+ (id)productForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteProductForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (CreditInstallmentPlanProduct)initWithInstallmentPlanProduct:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (id)product;
- (void)updateWithProduct:(id)a3;
@end

@implementation CreditInstallmentPlanProduct

+ (id)databaseTable
{
  return @"peanut";
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

- (CreditInstallmentPlanProduct)initWithInstallmentPlanProduct:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _propertyValuesForInstallmentPlanProduct:v10];
  v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  [(SQLiteEntity *)v12 setValue:v9 forProperty:@"a"];

  v13 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)v12 persistentID]];
  v14 = [v10 features];

  id v15 = +[CreditInstallmentPlanProductFeature insertOrUpdateFeatures:v14 forProductPID:v13 inDatabase:v8];
  return v12;
}

+ (void)deleteProductForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentPlanPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)self persistentID]];
  v4 = [(SQLiteEntity *)v2 database];
  +[CreditInstallmentPlanProductFeature deleteFeatureForProductPID:v3 inDatabase:v4];
  v6.receiver = v2;
  v6.super_class = (Class)CreditInstallmentPlanProduct;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

+ (id)insertOrUpdateProduct:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 _predicateForInstallmentPlanPID:v9];
  id v12 = [a1 anyInDatabase:v10 predicate:v11];

  if (v12) {
    [v12 updateWithProduct:v8];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithInstallmentPlanProduct:v8 forInstallmentPlanPID:v9 inDatabase:v10];
  }

  return v12;
}

- (void)updateWithProduct:(id)a3
{
  id v4 = a3;
  id v9 = [(id)objc_opt_class() _propertyValuesForInstallmentPlanProduct:v4];
  [(SQLiteEntity *)self setValuesWithDictionary:v9];
  v5 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)self persistentID]];
  objc_super v6 = [(SQLiteEntity *)self database];
  v7 = [v4 features];

  id v8 = +[CreditInstallmentPlanProductFeature insertOrUpdateFeatures:v7 forProductPID:v5 inDatabase:v6];
}

+ (id)productForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentPlanPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 product];

  return v9;
}

- (id)product
{
  id v3 = objc_alloc_init((Class)PKCreditInstallmentPlanProduct);
  id v4 = [(id)objc_opt_class() _propertySetters];
  v5 = [v4 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10044D9CC;
  v13[3] = &unk_10072DDD8;
  v13[4] = self;
  id v14 = v4;
  id v6 = v3;
  id v15 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v13];

  id v8 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)self persistentID]];
  id v9 = [(SQLiteEntity *)self database];
  id v10 = +[CreditInstallmentPlanProductFeature featuresForProductPID:v8 inDatabase:v9];
  [v6 setFeatures:v10];
  id v11 = v6;

  return v11;
}

+ (id)_predicateForInstallmentPlanPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_propertyValuesForInstallmentPlanProduct:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 model];
  [v4 setObjectOrNull:v6 forKey:@"c"];

  id v7 = [v3 capacity];
  [v4 setObjectOrNull:v7 forKey:@"d"];

  id v8 = [v3 color];
  [v4 setObjectOrNull:v8 forKey:@"e"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "isUpgradeEligible"), @"f");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "warrantyYears"), @"g");
  id v9 = [v3 serialNumber];
  [v4 setObjectOrNull:v9 forKey:@"i"];

  id v10 = [v3 iconURLs];
  id v11 = _SQLValueForImageURLs(v10);
  [v4 setObjectOrNull:v11 forKey:@"l"];

  id v12 = [v3 splashImageURLs];

  v13 = _SQLValueForImageURLs(v12);
  [v4 setObjectOrNull:v13 forKey:@"m"];

  id v14 = [v4 copy];
  return v14;
}

+ (id)_propertySetters
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100752000;
  v5[1] = &stru_100752020;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100752040;
  v5[3] = &stru_100752060;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100752080;
  v5[5] = &stru_1007520A0;
  v4[6] = @"i";
  v4[7] = @"l";
  v5[6] = &stru_1007520C0;
  v5[7] = &stru_1007520E0;
  v4[8] = @"m";
  v5[8] = &stru_100752100;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  return v2;
}

@end