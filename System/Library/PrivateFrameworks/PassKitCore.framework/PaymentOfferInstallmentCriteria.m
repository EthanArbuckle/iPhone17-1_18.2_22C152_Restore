@interface PaymentOfferInstallmentCriteria
+ (id)_commonDictionaryForInstallmentCriteria:(id)a3;
+ (id)_installmentCriteriaWithQuery:(id)a3;
+ (id)_predicateForCatalogPID:(int64_t)a3;
+ (id)_predicateForFpanIdentifier:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassSerialNumber:(id)a3;
+ (id)_predicateForPassTypeIdentifier:(id)a3;
+ (id)_propertySetters;
+ (id)criteriaIdentifierForFpanIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)installmentCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePaymentOfferInstallmentCriteriaForCatalogPID:(int64_t)a3 criteria:(id)a4 inDatabase:(id)a5;
+ (void)deletePaymentOfferInstallmentCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateInstallmentCriteria:(id)a3 forCatalogPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)criteriaIdentifier;
@end

@implementation PaymentOfferInstallmentCriteria

+ (id)databaseTable
{
  return @"cow";
}

+ (void)insertOrUpdateInstallmentCriteria:(id)a3 forCatalogPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePaymentOfferInstallmentCriteriaForCatalogPID:a4 criteria:v8 inDatabase:v9];
  v10 = [(id)objc_opt_class() _commonDictionaryForInstallmentCriteria:v8];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 safelySetObject:v11 forKey:@"c_pid"];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003D6D1C;
  v15[3] = &unk_100734FC8;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = a1;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  sub_10000817C((uint64_t)v13, v15);
}

+ (void)deletePaymentOfferInstallmentCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCatalogPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)deletePaymentOfferInstallmentCriteriaForCatalogPID:(int64_t)a3 criteria:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v19 = [v9 identifier];
  v10 = [a1 _predicateForIdentifier:v19];
  v20[0] = v10;
  v11 = [v9 passTypeIdentifier];
  id v12 = [a1 _predicateForPassTypeIdentifier:v11];
  v20[1] = v12;
  id v13 = [v9 passSerialNumber];

  id v14 = [a1 _predicateForPassSerialNumber:v13];
  v20[2] = v14;
  v15 = [a1 _predicateForCatalogPID:a3];
  v20[3] = v15;
  id v16 = +[NSArray arrayWithObjects:v20 count:4];
  id v17 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v16];
  id v18 = [a1 queryWithDatabase:v8 predicate:v17];

  [v18 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)v2 database];
  +[PaymentOfferCurrencyAmount deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:v3 inDatabase:v4];
  +[PaymentOfferDynamicContentIcon deleteIconForInstallmentCriteriaPID:v3 inDatabase:v4];
  +[PaymentOfferAssociatedStoreIdentifier deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:v3 inDatabase:v4];
  +[PaymentOfferAssociatedWebDomain deletePaymentOfferAssociatedWebDomainsForInstallmentCriteriaPID:v3 inDatabase:v4];
  +[ApplyFooterContent deleteFooterContentWithInstallmentCriteriaPID:v3 inDatabase:v4];
  v6.receiver = v2;
  v6.super_class = (Class)PaymentOfferInstallmentCriteria;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

+ (id)criteriaIdentifierForFpanIdentifier:(id)a3 inDatabase:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = [a1 _predicateForFpanIdentifier:a3];
    id v8 = [a1 anyInDatabase:v6 predicate:v7];

    id v9 = [v8 criteriaIdentifier];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

+ (id)installmentCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCatalogPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _installmentCriteriaWithQuery:v8];

  return v9;
}

+ (id)_installmentCriteriaWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySetters];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = [v4 database];
  id v8 = [v5 allKeys];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1003D7430;
  id v17 = &unk_10072DE00;
  id v21 = a1;
  id v18 = v5;
  id v19 = v7;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v11 = v5;
  [v4 enumeratePersistentIDsAndProperties:v8 usingBlock:&v14];

  if (objc_msgSend(v9, "count", v14, v15, v16, v17)) {
    id v12 = [v9 copy];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (id)criteriaIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"a"];
}

+ (id)_predicateForCatalogPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"c_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForFpanIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"t" equalToValue:a3];
}

+ (id)_predicateForPassTypeIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"e" equalToValue:a3];
}

+ (id)_predicateForPassSerialNumber:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:a3];
}

+ (id)_propertySetters
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_10074F300;
  v5[1] = &stru_10074F320;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_10074F340;
  v5[3] = &stru_10074F360;
  v4[4] = @"e";
  v4[5] = @"t";
  v5[4] = &stru_10074F380;
  v5[5] = &stru_10074F3A0;
  v4[6] = @"h";
  v4[7] = @"u";
  v5[6] = &stru_10074F3C0;
  v5[7] = &stru_10074F3E0;
  v4[8] = @"v";
  v4[9] = @"j";
  v5[8] = &stru_10074F400;
  v5[9] = &stru_10074F420;
  v4[10] = @"k";
  v4[11] = @"l";
  v5[10] = &stru_10074F440;
  v5[11] = &stru_10074F460;
  v4[12] = @"m";
  v4[13] = @"x";
  v5[12] = &stru_10074F480;
  v5[13] = &stru_10074F4A0;
  v4[14] = @"r";
  v4[15] = @"s";
  v5[14] = &stru_10074F4C0;
  v5[15] = &stru_10074F4E0;
  v4[16] = @"w";
  v4[17] = @"y";
  v5[16] = &stru_10074F500;
  v5[17] = &stru_10074F520;
  v4[18] = @"has_preconfigured_offers";
  v4[19] = @"z";
  v5[18] = &stru_10074F540;
  v5[19] = &stru_10074F560;
  v4[20] = @"aa";
  v4[21] = @"ab";
  v5[20] = &stru_10074F580;
  v5[21] = &stru_10074F5A0;
  v4[22] = @"localized_pay_in_full_subtitle_override";
  v5[22] = &stru_10074F5C0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:23];
  return v2;
}

+ (id)_commonDictionaryForInstallmentCriteria:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"a"];

  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 eligibility]);
  [v4 setObjectOrNull:v6 forKey:@"b"];

  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 type]);
  [v4 setObjectOrNull:v7 forKey:@"c"];

  id v8 = [v3 passSerialNumber];
  [v4 setObjectOrNull:v8 forKey:@"d"];

  id v9 = [v3 passTypeIdentifier];
  [v4 setObjectOrNull:v9 forKey:@"e"];

  id v10 = [v3 fpanIdentifier];
  [v4 setObjectOrNull:v10 forKey:@"t"];

  id v11 = [v3 supportedCurrencyCodes];
  id v12 = [v11 allObjects];
  id v13 = [v12 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v13 forKey:@"h"];

  id v14 = [v3 supportedMerchantCountryCodes];
  uint64_t v15 = [v14 allObjects];
  id v16 = [v15 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v16 forKey:@"u"];

  id v17 = [v3 supportedDeviceRegionCountryCodes];
  id v18 = [v17 allObjects];
  id v19 = [v18 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v19 forKey:@"v"];

  id v20 = [v3 supportedLanguages];
  id v21 = [v20 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v21 forKey:@"j"];

  v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 paymentNetworkIdentifier]);
  [v4 setObjectOrNull:v22 forKey:@"k"];

  v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 paymentMethodType]);
  [v4 setObjectOrNull:v23 forKey:@"l"];

  v24 = [v3 programName];
  [v4 setObjectOrNull:v24 forKey:@"m"];

  v25 = [v3 issuerName];
  [v4 setObjectOrNull:v25 forKey:@"x"];

  v26 = [v3 associatedApplicationIdentifiers];
  v27 = [v26 allObjects];
  v28 = [v27 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v28 forKey:@"r"];

  v29 = [v3 appLaunchURL];
  v30 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v30 forKey:@"s"];

  v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 requiresChallenge]);
  [v4 setObjectOrNull:v31 forKey:@"w"];

  v32 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 suppressPayInFull]);
  [v4 setObjectOrNull:v32 forKey:@"y"];

  v33 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 hasPreconfiguredOffers]);
  [v4 setObjectOrNull:v33 forKey:@"has_preconfigured_offers"];

  v34 = [v3 localizedPayInFullTitleOverride];
  [v4 setObjectOrNull:v34 forKey:@"z"];

  v35 = [v3 localizedTitleOverride];
  [v4 setObjectOrNull:v35 forKey:@"aa"];

  v36 = [v3 localizedSubtitleOverride];
  [v4 setObjectOrNull:v36 forKey:@"ab"];

  v37 = [v3 localizedPayInFullSubtitleOverride];

  [v4 setObjectOrNull:v37 forKey:@"localized_pay_in_full_subtitle_override"];
  return v4;
}

@end