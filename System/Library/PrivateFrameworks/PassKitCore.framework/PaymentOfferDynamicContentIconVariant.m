@interface PaymentOfferDynamicContentIconVariant
+ (id)_commonDictionaryForIconVariant:(id)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)databaseTable;
+ (id)iconVariantForPID:(id)a3 inDatabase:(id)a4;
+ (id)insertIconVariant:(id)a3 inDatabase:(id)a4;
+ (void)deleteIconVariantForPID:(id)a3 inDatabase:(id)a4;
- (id)iconVariant;
@end

@implementation PaymentOfferDynamicContentIconVariant

+ (id)databaseTable
{
  return @"payment_offer_dynamic_content_icon_variant";
}

+ (id)insertIconVariant:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() _commonDictionaryForIconVariant:v7];

  id v9 = [objc_alloc((Class)a1) initWithPropertyValues:v8 inDatabase:v6];
  return v9;
}

+ (void)deleteIconVariantForPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPID:a3];
  id v7 = [a1 anyInDatabase:v6 predicate:v8];

  [v7 deleteFromDatabase];
}

+ (id)iconVariantForPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

- (id)iconVariant
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"two_x"];
  v4 = (void *)_URLForSQLValue();

  v5 = [(SQLiteEntity *)self valueForProperty:@"three_x"];
  id v6 = (void *)_URLForSQLValue();

  id v7 = 0;
  if (v4 && v6)
  {
    id v7 = objc_alloc_init((Class)PKPaymentOfferDynamicContentIconVariant);
    [v7 setUrl2x:v4];
    [v7 setUrl3x:v6];
  }

  return v7;
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

+ (id)_commonDictionaryForIconVariant:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 url2x];
  id v6 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v6 forKey:@"two_x"];

  id v7 = [v3 url3x];

  id v8 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v8 forKey:@"three_x"];

  return v4;
}

@end