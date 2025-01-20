@interface PaymentSetupFeature
+ (id)_predicateForProductIdentifier:(id)a3;
+ (id)_propertySettersForPaymentSetupFeature;
+ (id)databaseTable;
+ (id)insertOrUpdatePaymentSetupFeature:(id)a3 inDatabase:(id)a4;
+ (id)paymentSetupFeatureWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)paymentSetupFeaturesInDatabase:(id)a3;
+ (void)deleteAllPaymentSetupFeaturesInDatabase:(id)a3;
+ (void)deletePaymentSetupFeatureWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deletePaymentSetupFeaturesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (PaymentSetupFeature)initWithPaymentSetupFeature:(id)a3 inDatabase:(id)a4;
- (id)paymentSetupFeature;
- (void)updateWithPaymentSetupFeature:(id)a3;
@end

@implementation PaymentSetupFeature

+ (id)paymentSetupFeaturesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  v6 = [a1 queryWithDatabase:v4 predicate:v5];

  id v7 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v19 = @"pid";
  v8 = +[NSArray arrayWithObjects:&v19 count:1];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1001BEF04;
  v16 = &unk_10072ED00;
  id v17 = v4;
  id v18 = v7;
  id v9 = v7;
  id v10 = v4;
  [v6 enumeratePersistentIDsAndProperties:v8 usingBlock:&v13];

  id v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (id)paymentSetupFeatureWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForProductIdentifier:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)insertOrUpdatePaymentSetupFeature:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 productIdentifier];
  id v9 = [a1 paymentSetupFeatureWithIdentifier:v8 inDatabase:v7];

  if (v9) {
    [v9 updateWithPaymentSetupFeature:v6];
  }
  else {
    id v9 = [objc_alloc((Class)a1) initWithPaymentSetupFeature:v6 inDatabase:v7];
  }

  return v9;
}

- (PaymentSetupFeature)initWithPaymentSetupFeature:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = [v7 identifiers];
  id v10 = _SQLValueForIdentifiers(v9);
  [v8 setObjectOrNull:v10 forKey:@"identifiers"];

  id v11 = [v7 localizedDisplayName];
  [v8 setObjectOrNull:v11 forKey:@"localized_display_name"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "type"), @"feature_type");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "state"), @"feature_state");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "supportedOptions"), @"supported_options");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "supportedDevices"), @"supported_devices");
  v12 = [v7 productIdentifier];
  [v8 setObjectOrNull:v12 forKey:@"product_identifier"];

  v13 = [v7 partnerIdentifier];
  [v8 setObjectOrNull:v13 forKey:@"partner_identifier"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "featureIdentifier"), @"feature_identifier");
  uint64_t v14 = [v7 dirtyStateIdentifier];
  [v8 setObjectOrNull:v14 forKey:@"dirty_state_identifier"];

  v15 = [v7 lastUpdated];
  v16 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v16 forKey:@"last_updated_date"];

  id v17 = [v7 expiry];
  id v18 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v18 forKey:@"expiry_date"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "productType"), @"product_type");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "productState"), @"product_state");
  CFStringRef v19 = [v7 notificationTitle];
  [v8 setObjectOrNull:v19 forKey:@"notification_title"];

  v20 = [v7 notificationMessage];
  [v8 setObjectOrNull:v20 forKey:@"notification_message"];

  v21 = [v7 discoveryCardIdentifier];

  [v8 setObjectOrNull:v21 forKey:@"discovery_card_identitifer"];
  v22 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];

  v23 = v22;
  return v23;
}

- (void)updateWithPaymentSetupFeature:(id)a3
{
  id v4 = a3;
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v4 identifiers];
  id v6 = _SQLValueForIdentifiers(v5);
  [v18 setObjectOrNull:v6 forKey:@"identifiers"];

  id v7 = [v4 localizedDisplayName];
  [v18 setObjectOrNull:v7 forKey:@"localized_display_name"];

  objc_msgSend(v18, "setInteger:forKey:", objc_msgSend(v4, "type"), @"feature_type");
  objc_msgSend(v18, "setInteger:forKey:", objc_msgSend(v4, "state"), @"feature_state");
  objc_msgSend(v18, "setInteger:forKey:", objc_msgSend(v4, "supportedOptions"), @"supported_options");
  objc_msgSend(v18, "setInteger:forKey:", objc_msgSend(v4, "supportedDevices"), @"supported_devices");
  id v8 = [v4 productIdentifier];
  [v18 setObjectOrNull:v8 forKey:@"product_identifier"];

  id v9 = [v4 partnerIdentifier];
  [v18 setObjectOrNull:v9 forKey:@"partner_identifier"];

  objc_msgSend(v18, "setInteger:forKey:", objc_msgSend(v4, "featureIdentifier"), @"feature_identifier");
  id v10 = [v4 dirtyStateIdentifier];
  [v18 setObjectOrNull:v10 forKey:@"dirty_state_identifier"];

  id v11 = [v4 lastUpdated];
  v12 = (void *)_SQLValueForDate();
  [v18 setObjectOrNull:v12 forKey:@"last_updated_date"];

  v13 = [v4 expiry];
  uint64_t v14 = (void *)_SQLValueForDate();
  [v18 setObjectOrNull:v14 forKey:@"expiry_date"];

  objc_msgSend(v18, "setInteger:forKey:", objc_msgSend(v4, "productType"), @"product_type");
  objc_msgSend(v18, "setInteger:forKey:", objc_msgSend(v4, "productState"), @"product_state");
  v15 = [v4 notificationTitle];
  [v18 setObjectOrNull:v15 forKey:@"notification_title"];

  v16 = [v4 notificationMessage];
  [v18 setObjectOrNull:v16 forKey:@"notification_message"];

  id v17 = [v4 discoveryCardIdentifier];

  [v18 setObjectOrNull:v17 forKey:@"discovery_card_identitifer"];
  [(SQLiteEntity *)self setValuesWithDictionary:v18];
}

- (id)paymentSetupFeature
{
  id v3 = objc_alloc_init((Class)PKPaymentSetupFeature);
  id v4 = +[PaymentSetupFeature _propertySettersForPaymentSetupFeature];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001BF79C;
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

+ (id)databaseTable
{
  return @"payment_setup_features";
}

+ (void)deletePaymentSetupFeaturesNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"product_identifier" values:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteAllPaymentSetupFeaturesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  [v6 deleteAllEntities];
}

+ (void)deletePaymentSetupFeatureWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(id)objc_opt_class() _predicateForProductIdentifier:v7];

  id v8 = [a1 queryWithDatabase:v6 predicate:v9];

  [v8 deleteAllEntities];
}

+ (id)_predicateForProductIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"product_identifier" equalToValue:a3];
}

+ (id)_propertySettersForPaymentSetupFeature
{
  v4[0] = @"identifiers";
  v4[1] = @"localized_display_name";
  v5[0] = &stru_10073D6E8;
  v5[1] = &stru_10073D708;
  v4[2] = @"feature_type";
  v4[3] = @"feature_state";
  v5[2] = &stru_10073D728;
  v5[3] = &stru_10073D748;
  v4[4] = @"supported_options";
  v4[5] = @"supported_devices";
  v5[4] = &stru_10073D768;
  v5[5] = &stru_10073D788;
  v4[6] = @"product_identifier";
  v4[7] = @"partner_identifier";
  v5[6] = &stru_10073D7A8;
  v5[7] = &stru_10073D7C8;
  v4[8] = @"feature_identifier";
  v4[9] = @"dirty_state_identifier";
  v5[8] = &stru_10073D7E8;
  v5[9] = &stru_10073D808;
  v4[10] = @"last_updated_date";
  v4[11] = @"expiry_date";
  v5[10] = &stru_10073D828;
  v5[11] = &stru_10073D848;
  v4[12] = @"product_type";
  v4[13] = @"product_state";
  v5[12] = &stru_10073D868;
  v5[13] = &stru_10073D888;
  v4[14] = @"notification_title";
  v4[15] = @"notification_message";
  v5[14] = &stru_10073D8A8;
  v5[15] = &stru_10073D8C8;
  v4[16] = @"discovery_card_identitifer";
  v5[16] = &stru_10073D8E8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:17];
  return v2;
}

@end