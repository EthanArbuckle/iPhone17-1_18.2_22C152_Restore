@interface PayLaterAccountTermsDetails
+ (id)_commonDictionaryForAccountTermsDetails:(id)a3;
+ (id)_predicateForAccountDetailsPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAccountTermsDetails;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterAccountTermsDetails:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterAccountTermsDetailsForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAccountTermsDetailsForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
- (PayLaterAccountTermsDetails)initWithPayLaterAccountTermsDetails:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)termsDetails;
- (void)updateWithAccoumtTermsDetails:(id)a3;
@end

@implementation PayLaterAccountTermsDetails

+ (id)databaseTable
{
  return @"atemoya";
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

- (PayLaterAccountTermsDetails)initWithPayLaterAccountTermsDetails:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForAccountTermsDetails:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (id)insertOrUpdatePayLaterAccountTermsDetails:(id)a3 forPayLaterAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _predicateForAccountDetailsPID:a4];
  id v11 = [a1 anyInDatabase:v9 predicate:v10];

  if (v11) {
    [v11 updateWithAccoumtTermsDetails:v8];
  }
  else {
    id v11 = [objc_alloc((Class)objc_opt_class()) initWithPayLaterAccountTermsDetails:v8 forPayLaterAccountDetailsPID:a4 inDatabase:v9];
  }

  return v11;
}

+ (void)deletePayLaterAccountTermsDetailsForPayLaterAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (id)payLaterAccountTermsDetailsForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 termsDetails];

  return v9;
}

- (void)updateWithAccoumtTermsDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForAccountTermsDetails:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForAccountDetailsPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForPayLaterAccountTermsDetails
{
  v4[0] = @"terms_acceptance_required";
  v4[1] = @"terms_identifier";
  v5[0] = &stru_10073B450;
  v5[1] = &stru_10073B470;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (id)termsDetails
{
  id v3 = objc_alloc_init((Class)PKPayLaterAccountTermsDetails);
  id v4 = [(id)objc_opt_class() _propertySettersForPayLaterAccountTermsDetails];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018AA78;
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

+ (id)_commonDictionaryForAccountTermsDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 termsAcceptanceRequired]);
  [v4 setObjectOrNull:v5 forKey:@"terms_acceptance_required"];

  id v6 = [v3 termsIdentifier];

  [v4 setObjectOrNull:v6 forKey:@"terms_identifier"];
  return v4;
}

@end