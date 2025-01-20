@interface PaymentOfferDynamicContentIcon
+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3;
+ (id)databaseTable;
+ (id)iconForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteIconForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateIcon:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)darkVariant;
- (id)defaultVariant;
- (id)icon;
- (id)lightVariant;
@end

@implementation PaymentOfferDynamicContentIcon

+ (id)databaseTable
{
  return @"giraffe";
}

+ (void)insertOrUpdateIcon:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  [a1 deleteIconForInstallmentCriteriaPID:a4 inDatabase:v8];
  if (v21)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    v10 = +[NSNumber numberWithLongLong:a4];
    [v9 safelySetObject:v10 forKey:@"i_pid"];

    id v11 = [objc_alloc((Class)a1) initWithPropertyValues:v9 inDatabase:v8];
    v12 = [v21 defaultVariant];
    if (v12)
    {
      v13 = +[PaymentOfferDynamicContentIconVariant insertIconVariant:v12 inDatabase:v8];
      v14 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v13 persistentID]);
      [v11 setValue:v14 forProperty:@"default_variant"];
    }
    v15 = [v21 lightVariant];
    if (v15)
    {
      v16 = +[PaymentOfferDynamicContentIconVariant insertIconVariant:v15 inDatabase:v8];
      v17 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v16 persistentID]);
      [v11 setValue:v17 forProperty:@"light_variant"];
    }
    v18 = [v21 darkVariant];
    if (v18)
    {
      v19 = +[PaymentOfferDynamicContentIconVariant insertIconVariant:v18 inDatabase:v8];
      v20 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v19 persistentID]);
      [v11 setValue:v20 forProperty:@"dark_variant"];
    }
  }
}

+ (void)deleteIconForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentCriteriaPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = [(SQLiteEntity *)self database];
  v4 = [(SQLiteEntity *)self valueForProperty:@"default_variant"];
  +[PaymentOfferDynamicContentIconVariant deleteIconVariantForPID:v4 inDatabase:v3];

  v5 = [(SQLiteEntity *)self valueForProperty:@"light_variant"];
  if (v5) {
    +[PaymentOfferDynamicContentIconVariant deleteIconVariantForPID:v5 inDatabase:v3];
  }
  id v6 = [(SQLiteEntity *)self valueForProperty:@"dark_variant"];
  if (v6) {
    +[PaymentOfferDynamicContentIconVariant deleteIconVariantForPID:v6 inDatabase:v3];
  }
  v9.receiver = self;
  v9.super_class = (Class)PaymentOfferDynamicContentIcon;
  BOOL v7 = [(SQLiteEntity *)&v9 deleteFromDatabase];

  return v7;
}

+ (id)iconForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  BOOL v7 = [a1 _predicateForInstallmentCriteriaPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  objc_super v9 = [v8 icon];

  return v9;
}

- (id)icon
{
  v3 = [(PaymentOfferDynamicContentIcon *)self defaultVariant];
  v4 = [v3 iconVariant];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)PKPaymentOfferDynamicContentIcon);
    [v5 setDefaultVariant:v4];
    id v6 = [(PaymentOfferDynamicContentIcon *)self lightVariant];
    BOOL v7 = [v6 iconVariant];
    [v5 setLightVariant:v7];

    id v8 = [(PaymentOfferDynamicContentIcon *)self darkVariant];
    objc_super v9 = [v8 iconVariant];
    [v5 setDarkVariant:v9];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)defaultVariant
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"default_variant"];
  if (v3)
  {
    v4 = [(SQLiteEntity *)self database];
    id v5 = +[PaymentOfferDynamicContentIconVariant iconVariantForPID:v3 inDatabase:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)lightVariant
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"light_variant"];
  if (v3)
  {
    v4 = [(SQLiteEntity *)self database];
    id v5 = +[PaymentOfferDynamicContentIconVariant iconVariantForPID:v3 inDatabase:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)darkVariant
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"dark_variant"];
  if (v3)
  {
    v4 = [(SQLiteEntity *)self database];
    id v5 = +[PaymentOfferDynamicContentIconVariant iconVariantForPID:v3 inDatabase:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"i_pid" equalToValue:v3];

  return v4;
}

@end