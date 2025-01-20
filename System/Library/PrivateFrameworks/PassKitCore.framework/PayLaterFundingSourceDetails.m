@interface PayLaterFundingSourceDetails
+ (id)_detailsForType:(unint64_t)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_propertySettersForAccountSourceDetails;
+ (id)_propertySettersForBankSourceDetails;
+ (id)_propertySettersForFundingSourceType:(unint64_t)a3;
+ (id)_propertySettersForPaymentPassSourceDetails;
+ (id)_propertyValuesForFundingSourceDetails:(id)a3;
+ (id)anyInDatabase:(id)a3 forPID:(id)a4;
+ (id)databaseTable;
+ (id)insertFundingSourceDetails:(id)a3 inDatabase:(id)a4;
- (PayLaterFundingSourceDetails)initWithFundingSourceDetails:(id)a3 inDatabase:(id)a4;
- (id)fundingSourceDetails;
- (unint64_t)type;
- (void)updateFundingSourceDetails:(id)a3;
@end

@implementation PayLaterFundingSourceDetails

+ (id)databaseTable
{
  return @"chikoo";
}

- (PayLaterFundingSourceDetails)initWithFundingSourceDetails:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() _propertyValuesForFundingSourceDetails:v7];

  id v9 = [v8 mutableCopy];
  v10 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v6];

  return v10;
}

+ (id)insertFundingSourceDetails:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithFundingSourceDetails:v7 inDatabase:v6];

  return v8;
}

- (void)updateFundingSourceDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForFundingSourceDetails:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)anyInDatabase:(id)a3 forPID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

- (id)fundingSourceDetails
{
  unint64_t v3 = [(PayLaterFundingSourceDetails *)self type];
  id v4 = [(id)objc_opt_class() _detailsForType:v3];
  id v5 = [(id)objc_opt_class() _propertySettersForFundingSourceType:v3];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [v5 allKeys];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10038CEA8;
    v9[3] = &unk_10072DDD8;
    v9[4] = self;
    id v10 = v6;
    id v11 = v4;
    [(SQLiteEntity *)self getValuesForProperties:v7 withApplier:v9];
  }
  return v4;
}

- (unint64_t)type
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"a"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

+ (id)_detailsForType:(unint64_t)a3
{
  if (a3 - 1 > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_alloc_init((Class)*(&off_10074CE58)[a3 - 1]);
  }
  return v4;
}

+ (id)_propertyValuesForFundingSourceDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "type"), @"a");
  id v5 = [v3 type];
  if (v5 == (id)3)
  {
LABEL_4:
    id v6 = v3;
    id v7 = [v6 dpanIdentifier];
    [v4 setObjectOrNull:v7 forKey:@"b"];

    id v8 = [v6 fpanIdentifier];
    [v4 setObjectOrNull:v8 forKey:@"c"];

    id v9 = [v6 cardName];
    [v4 setObjectOrNull:v9 forKey:@"d"];

    id v10 = [v6 cardSuffix];
    [v4 setObjectOrNull:v10 forKey:@"e"];

    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v6, "cardType"), @"f");
    id v11 = [v6 cardNetwork];

    [v4 setInteger:v11 forKey:@"g"];
    goto LABEL_6;
  }
  if (v5 != (id)2)
  {
    if (v5 != (id)1) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  id v12 = v3;
  v13 = [v12 accountNumberSuffix];
  [v4 setObjectOrNull:v13 forKey:@"h"];

  v14 = [v12 bankName];
  [v4 setObjectOrNull:v14 forKey:@"i"];

  v15 = [v12 identifier];

  [v4 setObjectOrNull:v15 forKey:@"k"];
LABEL_6:
  id v16 = [v4 copy];

  return v16;
}

+ (id)_propertySettersForFundingSourceType:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      goto LABEL_4;
    case 2uLL:
      id v3 = [a1 _propertySettersForBankSourceDetails];
      break;
    case 1uLL:
LABEL_4:
      id v3 = [a1 _propertySettersForPaymentPassSourceDetails];
      break;
    default:
      id v3 = 0;
      break;
  }
  return v3;
}

+ (id)_propertySettersForPaymentPassSourceDetails
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_10074CC78;
  v5[1] = &stru_10074CC98;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_10074CCB8;
  v5[3] = &stru_10074CCD8;
  v4[4] = @"e";
  v4[5] = @"f";
  v5[4] = &stru_10074CCF8;
  v5[5] = &stru_10074CD18;
  v4[6] = @"g";
  v5[6] = &stru_10074CD38;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

+ (id)_propertySettersForBankSourceDetails
{
  v4[0] = @"a";
  v4[1] = @"h";
  v5[0] = &stru_10074CD78;
  v5[1] = &stru_10074CD98;
  v4[2] = @"i";
  v4[3] = @"k";
  v5[2] = &stru_10074CDB8;
  v5[3] = &stru_10074CDD8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)_propertySettersForAccountSourceDetails
{
  v4[0] = @"a";
  v4[1] = @"j";
  v5[0] = &stru_10074CE18;
  v5[1] = &stru_10074CE38;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end