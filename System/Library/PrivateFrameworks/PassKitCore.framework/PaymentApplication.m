@interface PaymentApplication
+ (id)_paymentApplicationForPass:(id)a3 applicationIdentifier:(id)a4 secureElementIdentifier:(id)a5 inDatabase:(id)a6;
+ (id)_paymentApplicationsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_paymentApplicationsInDatabase:(id)a3 matchingPredicate:(id)a4 withJoinKeys:(id)a5;
+ (id)_predicateForApplicationIdentifier:(id)a3 secureElementIdentifier:(id)a4;
+ (id)_predicateForApplicationIdentifier:(id)a3 secureElementIdentifiers:(id)a4;
+ (id)_predicateForApplicationIdentifier:(id)a3 subcredentialIdentifier:(id)a4 secureElementIdentifiers:(id)a5;
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForPassUniqueIdentifier:(id)a3 applicationIdentifier:(id)a4 secureElementIdentifier:(id)a5;
+ (id)_predicateForPersistentID:(int64_t)a3;
+ (id)_propertySettersForPaymentApplication;
+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifier:(id)a5;
+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifiers:(id)a5;
+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 subcredentialIdentifier:(id)a5 secureElementIdentifiers:(id)a6;
+ (id)anyInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6;
+ (id)anyInDatabase:(id)a3 withPersistentID:(unint64_t)a4;
+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(unint64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)paymentApplicationsInDatabase:(id)a3;
+ (id)paymentApplicationsInDatabase:(id)a3 forNotificationService:(id)a4;
+ (id)paymentApplicationsInDatabase:(id)a3 forPass:(id)a4;
+ (id)paymentApplicationsInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)paymentApplicationsInDatabase:(id)a3 forPassUniqueIdentifier:(id)a4 secureElementIdentifiers:(id)a5;
+ (id)paymentApplicationsInDatabase:(id)a3 forSecureElementIdentifier:(id)a4;
+ (id)paymentApplicationsInDatabase:(id)a3 forSecureElementIdentifiers:(id)a4;
+ (id)paymentApplicationsInDatabase:(id)a3 forTransitAppletStatesDirty:(id)a4;
+ (id)paymentApplicationsInDatabaseWithActiveVPAN:(id)a3;
+ (id)predicateForDPANIdentifier:(id)a3;
+ (id)predicateForHasMerchantTokens:(BOOL)a3;
+ (id)predicateForHasVPANID:(BOOL)a3;
+ (id)predicateForNetworks:(id)a3;
+ (id)predicateForNotificationService:(id)a3;
+ (id)predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)predicateForPaymentMethodTypes:(id)a3;
+ (id)predicateForPrimaryPaymentApplication:(BOOL)a3;
+ (id)predicateForSecureElementIdentifier:(id)a3;
+ (id)predicateForSecureElementIdentifiers:(id)a3;
+ (id)predicateForState:(int64_t)a3;
+ (id)predicateForStates:(id)a3;
+ (id)predicateForSupportBarcodePayment:(BOOL)a3;
+ (id)predicateForSupportsInAppPayment:(BOOL)a3;
+ (id)predicateForSupportsMerchantTokens:(BOOL)a3;
+ (id)predicateForTransactionSourceWithPID:(unint64_t)a3;
+ (id)predicateForVPANID:(id)a3 primaryOnly:(BOOL)a4;
+ (id)primaryPaymentApplicationsInDatabase:(id)a3 forSecureElementIdentifiers:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)updatePaymentApplications:(id)a3 forPass:(id)a4 inDatabase:(id)a5;
+ (void)updatePaymentApplications:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PaymentApplication)initWithPaymentApplication:(id)a3 pass:(id)a4 inDatabase:(id)a5;
- (id)applicationIdentifier;
- (id)paymentApplication;
- (id)transactionSourceIdentifier;
- (int64_t)passPID;
- (int64_t)paymentNetworkIdentifier;
- (void)_updateExpressModes:(id)a3;
- (void)updateAutomaticSelectionCriteria:(id)a3;
- (void)updateTransitNetworkIdentifiers:(id)a3;
- (void)updateWithPaymentApplication:(id)a3;
@end

@implementation PaymentApplication

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFStringRef v15 = @"pass.unique_id";
  v7 = +[NSArray arrayWithObjects:&v15 count:1];
  CFStringRef v14 = @"transaction_source.identifier";
  v8 = +[NSArray arrayWithObjects:&v14 count:1];
  if ([v7 containsObject:v5]) {
    [v6 addObject:@"JOIN pass ON pass.pid = payment_application.pass_pid"];
  }
  CFStringRef v13 = @"notification_service.pid";
  v9 = +[NSArray arrayWithObjects:&v13 count:1];
  if ([v9 containsObject:v5])
  {
    [v6 addObject:@"JOIN pass ON pass.pid = payment_application.pass_pid"];
    [v6 addObject:@"JOIN pass_notification_service ON (pass_notification_service.pid = pass.pass_transaction_service_pid OR pass_notification_service.pid = pass.pass_message_service_pid)"];
    [v6 addObject:@"JOIN notification_service ON notification_service.pid = pass_notification_service.notification_service_pid"];
  }
  if ([v8 containsObject:v5]) {
    [v6 addObject:@"JOIN transaction_source ON transaction_source.pid = payment_application.transaction_source_pid"];
  }
  v10 = (__CFString *)v5;
  v11 = v10;
  if (v10 == @"whitney.b"
    || v10
    && (unsigned int v12 = [(__CFString *)v10 isEqualToString:@"whitney.b"],
        v11,
        v12))
  {
    [v6 addObject:@"JOIN whitney ON whitney.a = payment_application.pid"];
  }
}

+ (id)databaseTable
{
  return @"payment_application";
}

+ (id)paymentApplicationsInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPassPID:a4];
  v8 = [a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_paymentApplicationsInDatabase:(id)a3 matchingPredicate:(id)a4 withJoinKeys:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableSet);
  unsigned int v12 = [a1 _propertySettersForPaymentApplication];
  CFStringRef v13 = [v12 allKeys];
  id v14 = [v13 mutableCopy];

  if (([v14 containsObject:@"pass_pid"] & 1) == 0) {
    [v14 addObject:@"pass_pid"];
  }
  if (v10)
  {
    id v28 = v11;
    id v29 = v9;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v10;
    id v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          if ((objc_msgSend(v14, "containsObject:", v20, v28, v29) & 1) == 0) {
            [v14 addObject:v20];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v17);
    }

    id v11 = v28;
    id v9 = v29;
  }
  v21 = +[SQLiteEntity queryWithDatabase:predicate:](PaymentApplication, "queryWithDatabase:predicate:", v8, v9, v28, v29);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000180DC;
  v30[3] = &unk_10072DE00;
  id v34 = a1;
  id v31 = v12;
  id v32 = v8;
  id v22 = v11;
  id v33 = v22;
  id v23 = v8;
  id v24 = v12;
  [v21 enumeratePersistentIDsAndProperties:v14 usingBlock:v30];
  v25 = v33;
  id v26 = v22;

  return v26;
}

+ (id)_propertySettersForPaymentApplication
{
  v4[0] = @"aid";
  v4[1] = @"transaction_source.identifier";
  v5[0] = &stru_1007478B8;
  v5[1] = &stru_1007478D8;
  v4[2] = @"seid";
  v4[3] = @"dpan_id";
  v5[2] = &stru_1007478F8;
  v5[3] = &stru_100747918;
  v4[4] = @"dpan_suffix";
  v4[5] = @"sanitized_dpan";
  v5[4] = &stru_100747938;
  v5[5] = &stru_100747958;
  v4[6] = @"state";
  v4[7] = @"suspended_reason";
  v5[6] = &stru_100747978;
  v5[7] = &stru_100747998;
  v4[8] = @"supports_contactless_payment";
  v4[9] = @"supports_in_app_payment";
  v5[8] = &stru_1007479B8;
  v5[9] = &stru_1007479D8;
  v4[10] = @"c";
  v4[11] = @"f";
  v5[10] = &stru_1007479F8;
  v5[11] = &stru_100747A18;
  v4[12] = @"m";
  v4[13] = @"d";
  v5[12] = &stru_100747A38;
  v5[13] = &stru_100747A58;
  v4[14] = @"e";
  v4[15] = @"h";
  v5[14] = &stru_100747A78;
  v5[15] = &stru_100747A98;
  v4[16] = @"i";
  v4[17] = @"l";
  v5[16] = &stru_100747AB8;
  v5[17] = &stru_100747AD8;
  v4[18] = @"j";
  v4[19] = @"n";
  v5[18] = &stru_100747AF8;
  v5[19] = &stru_100747B18;
  v4[20] = @"b";
  v4[21] = @"supports_optional_authentication";
  v5[20] = &stru_100747B38;
  v5[21] = &stru_100747B58;
  v4[22] = @"applet_data_format";
  v4[23] = @"applet_currency_code";
  v5[22] = &stru_100747B78;
  v5[23] = &stru_100747B98;
  v4[24] = @"requires_deferred_authorization";
  v4[25] = @"payment_network_identifier";
  v5[24] = &stru_100747BB8;
  v5[25] = &stru_100747BD8;
  v4[26] = @"in_app_pin_required_amount";
  v4[27] = @"in_app_pin_required_currency";
  v5[26] = &stru_100747BF8;
  v5[27] = &stru_100747C18;
  v4[28] = @"auxiliary_application";
  v4[29] = @"payment_type";
  v5[28] = &stru_100747C38;
  v5[29] = &stru_100747C58;
  v4[30] = @"auxiliary_payment_type";
  v4[31] = @"contactless_priority";
  v5[30] = &stru_100747C78;
  v5[31] = &stru_100747C98;
  v4[32] = @"in_app_priority";
  v4[33] = @"supports_instant_funds_in";
  v5[32] = &stru_100747CB8;
  v5[33] = &stru_100747CD8;
  v4[34] = @"funding_source_payment_type";
  v4[35] = @"g";
  v5[34] = &stru_100747CF8;
  v5[35] = &stru_100747D18;
  v4[36] = @"display_name";
  v4[37] = @"supports_service_mode";
  v5[36] = &stru_100747D38;
  v5[37] = &stru_100747D58;
  v4[38] = @"k";
  v5[38] = &stru_100747D78;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:39];
  return v2;
}

+ (id)_paymentApplicationsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  return [a1 _paymentApplicationsInDatabase:a3 matchingPredicate:a4 withJoinKeys:0];
}

- (PaymentApplication)initWithPaymentApplication:(id)a3 pass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSMutableDictionary dictionary];
  unsigned int v12 = [v10 inAppPINRequiredAmount];
  CFStringRef v13 = PKCurrencyDecimalToStorageNumber();

  id v14 = [v10 applicationIdentifier];
  [v11 setObjectOrNull:v14 forKey:@"aid"];

  id v15 = [v10 secureElementIdentifier];
  [v11 setObjectOrNull:v15 forKey:@"seid"];

  id v16 = [v10 dpanIdentifier];
  [v11 setObjectOrNull:v16 forKey:@"dpan_id"];

  id v17 = [v10 dpanSuffix];
  [v11 setObjectOrNull:v17 forKey:@"dpan_suffix"];

  uint64_t v18 = [v10 sanitizedDPAN];
  [v11 setObjectOrNull:v18 forKey:@"sanitized_dpan"];

  v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 state]);
  [v11 setObjectOrNull:v19 forKey:@"state"];

  uint64_t v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 supportsContactlessPayment]);
  [v11 setObjectOrNull:v20 forKey:@"supports_contactless_payment"];

  v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 supportsInAppPayment]);
  [v11 setObjectOrNull:v21 forKey:@"supports_in_app_payment"];

  id v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 supportsMerchantTokens]);
  [v11 setObjectOrNull:v22 forKey:@"c"];

  id v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 hasMerchantTokens]);
  [v11 setObjectOrNull:v23 forKey:@"f"];

  id v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 hadMerchantTokens]);
  [v11 setObjectOrNull:v24 forKey:@"m"];

  v25 = [v10 apanIdentifier];
  [v11 setObjectOrNull:v25 forKey:@"d"];

  id v26 = [v10 apanSuffix];
  [v11 setObjectOrNull:v26 forKey:@"e"];

  v27 = [v10 supportsMultiTokens];
  [v11 setObjectOrNull:v27 forKey:@"h"];

  id v28 = [v10 virtualCardIdentifier];
  [v11 setObjectOrNull:v28 forKey:@"i"];

  id v29 = [v10 virtualCardSuffix];
  [v11 setObjectOrNull:v29 forKey:@"l"];

  v30 = [v10 supportsVirtualCardNumber];
  [v11 setObjectOrNull:v30 forKey:@"j"];

  id v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 virtualCardVPANOrigin]);
  [v11 setObjectOrNull:v31 forKey:@"n"];

  id v32 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 supportsBarcodePayment]);
  [v11 setObjectOrNull:v32 forKey:@"b"];

  id v33 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 supportsServiceMode]);
  [v11 setObjectOrNull:v33 forKey:@"supports_service_mode"];

  id v34 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 supportsOptionalAuthentication]);
  [v11 setObject:v34 forKey:@"supports_optional_authentication"];

  long long v35 = [v10 appletDataFormat];
  [v11 setObjectOrNull:v35 forKey:@"applet_data_format"];

  long long v36 = [v10 appletCurrencyCode];
  [v11 setObjectOrNull:v36 forKey:@"applet_currency_code"];

  long long v37 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 requiresDeferredAuthorization]);
  [v11 setObjectOrNull:v37 forKey:@"requires_deferred_authorization"];

  long long v38 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 paymentNetworkIdentifier]);
  [v11 setObjectOrNull:v38 forKey:@"payment_network_identifier"];

  [v11 setObjectOrNull:v13 forKey:@"in_app_pin_required_amount"];
  v39 = [v10 inAppPINRequiredCurrency];
  [v11 setObjectOrNull:v39 forKey:@"in_app_pin_required_currency"];

  v40 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 paymentType]);
  [v11 setObjectOrNull:v40 forKey:@"payment_type"];

  v41 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 auxiliaryPaymentType]);
  [v11 setObjectOrNull:v41 forKey:@"auxiliary_payment_type"];

  v42 = [v10 displayName];
  [v11 setObjectOrNull:v42 forKey:@"display_name"];

  v43 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 isAuxiliary]);
  [v11 setObjectOrNull:v43 forKey:@"auxiliary_application"];

  v44 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 contactlessPriority]);
  [v11 setObjectOrNull:v44 forKey:@"contactless_priority"];

  v45 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 inAppPriority]);
  [v11 setObjectOrNull:v45 forKey:@"in_app_priority"];

  v46 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 supportsInstantFundsIn]);
  [v11 setObjectOrNull:v46 forKey:@"supports_instant_funds_in"];

  v47 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 fundingSourcePaymentType]);
  [v11 setObjectOrNull:v47 forKey:@"funding_source_payment_type"];

  v48 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 requiresConsentForDataRelease]);
  [v11 setObjectOrNull:v48 forKey:@"g"];

  id v49 = [v9 persistentID];
  v50 = +[NSNumber numberWithLongLong:v49];
  [v11 setObject:v50 forKey:@"pass_pid"];

  id v51 = [v10 isShareable];
  v52 = +[NSNumber numberWithBool:v51];
  [v11 setObject:v52 forKey:@"k"];

  v53 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v53;
}

- (int64_t)paymentNetworkIdentifier
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"payment_network_identifier"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (int64_t)passPID
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"pass_pid"];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (id)transactionSourceIdentifier
{
  id v3 = [(SQLiteEntity *)self database];
  v4 = [(SQLiteEntity *)self valueForProperty:@"transaction_source_pid"];
  id v5 = +[TransactionSource anyInDatabase:withPersistentID:](TransactionSource, "anyInDatabase:withPersistentID:", v3, [v4 longLongValue]);
  id v6 = [v5 identifier];

  return v6;
}

- (id)applicationIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"aid"];
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"transaction_source_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"pid";
  }
  return 0;
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(unint64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPersistentID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourcePID:(unint64_t)a4
{
  id v6 = a3;
  v7 = [a1 predicateForTransactionSourceWithPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = [a1 _predicateForApplicationIdentifier:a4 secureElementIdentifier:a5];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 secureElementIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = [a1 _predicateForApplicationIdentifier:a4 secureElementIdentifiers:a5];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (id)anyInDatabase:(id)a3 withApplicationIdentifier:(id)a4 subcredentialIdentifier:(id)a5 secureElementIdentifiers:(id)a6
{
  id v10 = a3;
  id v11 = [a1 _predicateForApplicationIdentifier:a4 subcredentialIdentifier:a5 secureElementIdentifiers:a6];
  unsigned int v12 = [a1 anyInDatabase:v10 predicate:v11];

  return v12;
}

+ (id)anyInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = objc_alloc_init((Class)NSMutableSet);
  id v15 = [a1 _predicateForPassUniqueIdentifier:v13 applicationIdentifier:v11 secureElementIdentifier:v12];

  id v16 = +[SQLiteEntity queryWithDatabase:v10 predicate:v15];

  CFStringRef v26 = @"pass.unique_id";
  id v17 = +[NSArray arrayWithObjects:&v26 count:1];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1002F11BC;
  v22[3] = &unk_10072EAD8;
  id v24 = v14;
  id v25 = a1;
  id v23 = v10;
  id v18 = v14;
  id v19 = v10;
  [v16 enumeratePersistentIDsAndProperties:v17 usingBlock:v22];

  uint64_t v20 = [v18 anyObject];

  return v20;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPass:a4];
  id v8 = [a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forSecureElementIdentifiers:(id)a4
{
  id v6 = a3;
  v7 = [a1 predicateForSecureElementIdentifiers:a4];
  id v8 = [a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forSecureElementIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 predicateForSecureElementIdentifier:a4];
  id v8 = [a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (id)primaryPaymentApplicationsInDatabase:(id)a3 forSecureElementIdentifiers:(id)a4
{
  id v6 = a3;
  v7 = +[PaymentApplication predicateForSecureElementIdentifiers:a4];
  id v8 = +[PaymentApplication predicateForPrimaryPaymentApplication:1];
  v13[0] = v7;
  v13[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v13 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];
  id v11 = [a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v10];

  return v11;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forPassUniqueIdentifier:(id)a4 secureElementIdentifiers:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 predicateForPassWithUniqueIdentifier:a4];
  v18[0] = v10;
  id v11 = [a1 predicateForSecureElementIdentifiers:v8];

  v18[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v18 count:2];

  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];
  CFStringRef v17 = @"pass.unique_id";
  id v14 = +[NSArray arrayWithObjects:&v17 count:1];
  id v15 = [a1 _paymentApplicationsInDatabase:v9 matchingPredicate:v13 withJoinKeys:v14];

  return v15;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forTransitAppletStatesDirty:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v22 = v6;
  id v8 = [v6 allObjects];
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v14 = [v13 passUniqueIdentifier];
        id v15 = [v13 applicationIdentifier];
        id v16 = [v13 secureElementIdentifier];
        CFStringRef v17 = [a1 _predicateForPassUniqueIdentifier:v14 applicationIdentifier:v15 secureElementIdentifier:v16];

        [v7 addObject:v17];
      }
      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  id v18 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v7];
  CFStringRef v28 = @"pass.unique_id";
  id v19 = +[NSArray arrayWithObjects:&v28 count:1];
  uint64_t v20 = [a1 _paymentApplicationsInDatabase:v23 matchingPredicate:v18 withJoinKeys:v19];

  return v20;
}

+ (id)paymentApplicationsInDatabase:(id)a3 forNotificationService:(id)a4
{
  id v6 = a3;
  id v7 = [a1 predicateForNotificationService:a4];
  id v8 = [a1 _paymentApplicationsInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (id)paymentApplicationsInDatabase:(id)a3
{
  return [a1 _paymentApplicationsInDatabase:a3 matchingPredicate:0];
}

+ (void)updatePaymentApplications:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v6;
  id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v13 = [v12 secureElementIdentifier];
        if (v13)
        {
          id v14 = [v12 applicationIdentifier];
          id v15 = [a1 _predicateForApplicationIdentifier:v14 secureElementIdentifier:v13];
          id v16 = [a1 anyInDatabase:v7 predicate:v15];
          CFStringRef v17 = v16;
          if (v16) {
            [v16 updateWithPaymentApplication:v12];
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

+ (void)updatePaymentApplications:(id)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002F1B0C;
  v12[3] = &unk_100734FC8;
  id v13 = a4;
  id v14 = a5;
  id v15 = v8;
  id v16 = a1;
  id v9 = v8;
  id v10 = v14;
  id v11 = v13;
  sub_10000817C((uint64_t)v10, v12);
}

+ (id)_paymentApplicationForPass:(id)a3 applicationIdentifier:(id)a4 secureElementIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a1 _predicateForPass:a3];
  id v14 = [a1 _predicateForApplicationIdentifier:v12 secureElementIdentifier:v11];

  v19[0] = v13;
  v19[1] = v14;
  id v15 = +[NSArray arrayWithObjects:v19 count:2];
  id v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

  CFStringRef v17 = [a1 anyInDatabase:v10 predicate:v16];

  return v17;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPass:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  id v3 = [(SQLiteEntity *)self database];
  +[PaymentExpressMode deleteEntitiesInDatabase:v3 forPaymentApplication:v2];
  +[PaymentAutomaticSelectionCriterion deleteEntitiesInDatabase:v3 forPaymentApplication:v2];
  +[PaymentTransitNetworkIdentifier deleteEntitiesInDatabase:v3 forPaymentApplication:v2];
  +[AppletSubcredential deleteEntitiesInDatabase:v3 forPaymentApplication:v2];
  +[FelicaTransitAppletState deleteEntitiesForPaymentApplicationPID:[(SQLiteEntity *)v2 persistentID] inDatabase:v3];
  v4 = [(SQLiteEntity *)v2 database];
  +[TransactionSource deleteEntitiesInDatabase:v4 forPaymentApplication:v2];

  +[PaymentApplicationMerchantSupport deleteEntitiesForPaymentApplication:v2 inDatabase:v3];
  v6.receiver = v2;
  v6.super_class = (Class)PaymentApplication;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

+ (id)predicateForDPANIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"dpan_id" equalToValue:a3];
}

+ (id)predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (id)predicateForTransactionSourceWithPID:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_source_pid" equalToValue:v3];

  return v4;
}

+ (id)predicateForSecureElementIdentifiers:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:@"seid" equalToValues:a3];
}

+ (id)predicateForSecureElementIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"seid" equalToValue:a3];
}

+ (id)predicateForNotificationService:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"notification_service.pid" equalToValue:v3];

  return v4;
}

+ (id)predicateForPrimaryPaymentApplication:(BOOL)a3
{
  id v3 = +[NSNumber numberWithInt:!a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"auxiliary_application" equalToValue:v3];

  return v4;
}

+ (id)predicateForState:(int64_t)a3
{
  id v3 = +[NSNumber numberWithInteger:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"state" equalToValue:v3];

  return v4;
}

+ (id)predicateForStates:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[PaymentApplication predicateForState:](PaymentApplication, "predicateForState:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "integerValue", (void)v13));
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v4];

  return v11;
}

+ (id)predicateForSupportsInAppPayment:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"supports_in_app_payment" equalToValue:v3];

  return v4;
}

+ (id)predicateForSupportsMerchantTokens:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"c" equalToValue:v3];

  return v4;
}

+ (id)predicateForHasMerchantTokens:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"f" equalToValue:v3];

  return v4;
}

+ (id)paymentApplicationsInDatabaseWithActiveVPAN:(id)a3
{
  id v4 = a3;
  id v5 = +[PaymentApplication predicateForHasVPANID:1];
  id v6 = [a1 _paymentApplicationsInDatabase:v4 matchingPredicate:v5];

  return v6;
}

+ (id)predicateForVPANID:(id)a3 primaryOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"i" equalToValue:a3];
  id v6 = v5;
  if (v4)
  {
    id v7 = +[PaymentApplication predicateForPrimaryPaymentApplication:1];
    v11[0] = v6;
    v11[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v11 count:2];
    id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

+ (id)predicateForHasVPANID:(BOOL)a3
{
  if (a3) {
    +[SQLiteNullPredicate isNullPredicateWithProperty:@"i"];
  }
  else {
  id v3 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"i"];
  }
  return v3;
}

+ (id)predicateForSupportBarcodePayment:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  BOOL v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)predicateForNetworks:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:@"payment_network_identifier" equalToValues:a3];
}

+ (id)predicateForPaymentMethodTypes:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:@"payment_type" equalToValues:a3];
}

+ (id)_predicateForApplicationIdentifier:(id)a3 secureElementIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"aid" equalToValue:a3];
  v12[0] = v7;
  uint64_t v8 = [a1 predicateForSecureElementIdentifier:v6];

  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];

  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForPassUniqueIdentifier:(id)a3 applicationIdentifier:(id)a4 secureElementIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 predicateForPassWithUniqueIdentifier:a3];
  v15[0] = v10;
  id v11 = [a1 _predicateForApplicationIdentifier:v9 secureElementIdentifier:v8];

  v15[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v15 count:2];

  long long v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  return v13;
}

+ (id)_predicateForApplicationIdentifier:(id)a3 secureElementIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"aid" equalToValue:a3];
  v12[0] = v7;
  id v8 = [a1 predicateForSecureElementIdentifiers:v6];

  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForApplicationIdentifier:(id)a3 subcredentialIdentifier:(id)a4 secureElementIdentifiers:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"aid" equalToValue:a3];
    id v11 = +[SQLiteComparisonPredicate predicateWithProperty:@"whitney.b", v8, v10 equalToValue];
    v16[1] = v11;
    id v12 = [a1 predicateForSecureElementIdentifiers:v9];

    v16[2] = v12;
    long long v13 = +[NSArray arrayWithObjects:v16 count:3];
    long long v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];
  }
  else
  {
    long long v14 = [a1 _predicateForApplicationIdentifier:a3 secureElementIdentifiers:v9];
  }
  return v14;
}

+ (id)_predicateForPass:(id)a3
{
  id v4 = [a3 persistentID];
  return [a1 _predicateForPassPID:v4];
}

+ (id)_predicateForPersistentID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

- (id)paymentApplication
{
  id v3 = objc_alloc_init((Class)PKPaymentApplication);
  id v4 = +[PaymentApplication _propertySettersForPaymentApplication];
  id v5 = [v4 allKeys];
  long long v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  long long v27 = sub_1002F37A4;
  CFStringRef v28 = &unk_10072EDD0;
  id v6 = v4;
  id v29 = v6;
  id v7 = v3;
  id v30 = v7;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v25];

  id v8 = [(SQLiteEntity *)self database];
  int64_t v9 = [(SQLiteEntity *)self persistentID];
  id v10 = +[PaymentExpressMode expressModesInDatabase:v8 forPaymentApplicationPID:v9];
  id v11 = [v10 allObjects];
  [v7 setSupportedExpressModes:v11];

  id v12 = +[PaymentAutomaticSelectionCriterion criteriaInDatabase:v8 forPaymentApplicationPID:v9];
  long long v13 = [v12 allObjects];
  [v7 setAutomaticSelectionCriteria:v13];

  long long v14 = +[PaymentTransitNetworkIdentifier transitNetworkIdentifiersInDatabase:v8 forPaymentApplicationPID:v9];
  [v7 setSupportedTransitNetworkIdentifiers:v14];

  long long v15 = +[AppletSubcredential appletSubcredentialsInDatabase:v8 forPaymentApplicationPID:v9];
  [v7 setSubcredentials:v15];
  long long v16 = +[FelicaTransitAppletState anyInDatabase:v8 withPaymentApplicationPID:v9];
  CFStringRef v17 = [v16 transitAppletState];

  if (!v17)
  {
    id v18 = +[TransitAppletState anyInDatabase:v8 withPaymentApplicationPID:v9];
    CFStringRef v17 = [v18 transitAppletState];
  }
  long long v19 = +[SecureElementPassField secureElementPassFieldsInDatabase:v8 forPassPID:[(PaymentApplication *)self passPID]];
  long long v20 = [v17 transitPassPropertiesWithPaymentApplication:v7 fieldCollection:v19];
  [v7 setTransitProperties:v20];
  long long v21 = +[PaymentApplicationMerchantSupport supportedCountryCodesForPaymentApplication:self inDatabase:v8];
  [v7 setSupportedInAppMerchantCountryCodes:v21];

  long long v22 = +[PaymentApplicationMerchantSupport unsupportedCountryCodesForPaymentApplication:self inDatabase:v8];
  [v7 setUnsupportedInAppMerchantCountryCodes:v22];

  id v23 = v7;
  return v23;
}

- (void)updateWithPaymentApplication:(id)a3
{
  id v4 = a3;
  id v29 = +[NSMutableDictionary dictionary];
  id v5 = [v4 inAppPINRequiredAmount];
  id v6 = PKCurrencyDecimalToStorageNumber();

  id v7 = [v4 dpanIdentifier];
  [v29 setObjectOrNull:v7 forKey:@"dpan_id"];

  id v8 = [v4 dpanSuffix];
  [v29 setObjectOrNull:v8 forKey:@"dpan_suffix"];

  int64_t v9 = [v4 sanitizedDPAN];
  [v29 setObjectOrNull:v9 forKey:@"sanitized_dpan"];

  objc_msgSend(v29, "setInteger:forKey:", objc_msgSend(v4, "state"), @"state");
  id v10 = [v4 suspendedReason];
  [v29 setObjectOrNull:v10 forKey:@"suspended_reason"];

  objc_msgSend(v29, "setInteger:forKey:", objc_msgSend(v4, "paymentNetworkIdentifier"), @"payment_network_identifier");
  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "supportsContactlessPayment"), @"supports_contactless_payment");
  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "supportsInAppPayment"), @"supports_in_app_payment");
  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "supportsMerchantTokens"), @"c");
  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "hasMerchantTokens"), @"f");
  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "hadMerchantTokens"), @"m");
  id v11 = [v4 apanIdentifier];
  [v29 setObjectOrNull:v11 forKey:@"d"];

  id v12 = [v4 apanSuffix];
  [v29 setObjectOrNull:v12 forKey:@"e"];

  long long v13 = [v4 virtualCardIdentifier];
  [v29 setObjectOrNull:v13 forKey:@"i"];

  long long v14 = [v4 virtualCardSuffix];
  [v29 setObjectOrNull:v14 forKey:@"l"];

  long long v15 = [v4 supportsVirtualCardNumber];
  [v29 setObjectOrNull:v15 forKey:@"j"];

  long long v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 virtualCardVPANOrigin]);
  [v29 setObjectOrNull:v16 forKey:@"n"];

  CFStringRef v17 = [v4 supportsMultiTokens];
  [v29 setObjectOrNull:v17 forKey:@"h"];

  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "supportsBarcodePayment"), @"b");
  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "supportsOptionalAuthentication"), @"supports_optional_authentication");
  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "supportsServiceMode"), @"supports_service_mode");
  id v18 = [v4 appletDataFormat];
  [v29 setObjectOrNull:v18 forKey:@"applet_data_format"];

  long long v19 = [v4 appletCurrencyCode];
  [v29 setObjectOrNull:v19 forKey:@"applet_currency_code"];

  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "requiresDeferredAuthorization"), @"requires_deferred_authorization");
  [v29 setObjectOrNull:v6 forKey:@"in_app_pin_required_amount"];
  long long v20 = [v4 inAppPINRequiredCurrency];
  [v29 setObjectOrNull:v20 forKey:@"in_app_pin_required_currency"];

  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "isAuxiliary"), @"auxiliary_application");
  objc_msgSend(v29, "setInteger:forKey:", objc_msgSend(v4, "paymentType"), @"payment_type");
  objc_msgSend(v29, "setInteger:forKey:", objc_msgSend(v4, "auxiliaryPaymentType"), @"auxiliary_payment_type");
  objc_msgSend(v29, "setInteger:forKey:", objc_msgSend(v4, "contactlessPriority"), @"contactless_priority");
  objc_msgSend(v29, "setInteger:forKey:", objc_msgSend(v4, "inAppPriority"), @"in_app_priority");
  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "supportsInstantFundsIn"), @"supports_instant_funds_in");
  objc_msgSend(v29, "setInteger:forKey:", objc_msgSend(v4, "fundingSourcePaymentType"), @"funding_source_payment_type");
  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "requiresConsentForDataRelease"), @"g");
  long long v21 = [v4 displayName];
  [v29 setObjectOrNull:v21 forKey:@"display_name"];

  objc_msgSend(v29, "setBool:forKey:", objc_msgSend(v4, "isShareable"), @"k");
  long long v22 = [v4 supportedExpressModes];
  [(PaymentApplication *)self _updateExpressModes:v22];

  id v23 = [v4 automaticSelectionCriteria];
  [(PaymentApplication *)self updateAutomaticSelectionCriteria:v23];

  long long v24 = [v4 supportedTransitNetworkIdentifiers];
  [(PaymentApplication *)self updateTransitNetworkIdentifiers:v24];

  long long v25 = [v4 subcredentials];
  id v26 = +[AppletSubcredential setAppletSubcredentials:v25 forPaymentApplication:self inDatabase:self->super._database];

  long long v27 = [v4 supportedInAppMerchantCountryCodes];
  +[PaymentApplicationMerchantSupport updateSupportedCountryCodes:v27 forPaymentApplication:self inDatabase:self->super._database];

  CFStringRef v28 = [v4 unsupportedInAppMerchantCountryCodes];

  +[PaymentApplicationMerchantSupport updateUnsupportedCountryCodes:v28 forPaymentApplication:self inDatabase:self->super._database];
  [(SQLiteEntity *)self setValuesWithDictionary:v29];
}

- (void)_updateExpressModes:(id)a3
{
  id v4 = a3;
  [(SQLiteEntity *)self database];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F3EDC;
  v7[3] = &unk_100733610;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  sub_10000817C((uint64_t)v6, v7);
}

- (void)updateAutomaticSelectionCriteria:(id)a3
{
  id v4 = a3;
  [(SQLiteEntity *)self database];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F3FEC;
  v7[3] = &unk_100733610;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  sub_10000817C((uint64_t)v6, v7);
}

- (void)updateTransitNetworkIdentifiers:(id)a3
{
  id v4 = a3;
  [(SQLiteEntity *)self database];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F40FC;
  v7[3] = &unk_100733610;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  sub_10000817C((uint64_t)v6, v7);
}

@end