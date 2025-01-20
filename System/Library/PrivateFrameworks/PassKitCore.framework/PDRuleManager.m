@interface PDRuleManager
- (PDDiscoveryManager)discoveryManager;
- (PDRuleManager)init;
- (PDRuleManager)initWithDatabaseManager:(id)a3 accountManager:(id)a4 applyManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 paymentWebServiceCoordinator:(id)a7 transitNotificationService:(id)a8 familyCircleManager:(id)a9 expressPassManager:(id)a10;
- (id)evaluateUserProperty:(id)a3 withParameter:(id)a4 usingEnvironment:(id)a5;
- (void)deleteRuleWithIdentifier:(id)a3;
- (void)evaluateRulesWithIdentifiers:(id)a3 completion:(id)a4;
- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5;
- (void)getCurrentEnvironmentForKeys:(id)a3 withCompletion:(id)a4;
- (void)insertRule:(id)a3;
- (void)overrideValues:(id)a3 forUserProperties:(id)a4 withParameters:(id)a5;
- (void)rulesWithCompletion:(id)a3;
- (void)setDiscoveryManager:(id)a3;
- (void)updateWithRules:(id)a3;
@end

@implementation PDRuleManager

- (PDRuleManager)init
{
  return 0;
}

- (PDRuleManager)initWithDatabaseManager:(id)a3 accountManager:(id)a4 applyManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 paymentWebServiceCoordinator:(id)a7 transitNotificationService:(id)a8 familyCircleManager:(id)a9 expressPassManager:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)PDRuleManager;
  v18 = [(PDRuleManager *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_accountManager, a4);
    objc_storeStrong((id *)&v19->_applyManager, a5);
    objc_storeStrong((id *)&v19->_peerPaymentWebServiceCoordinator, a6);
    objc_storeStrong((id *)&v19->_paymentWebServiceCoordinator, a7);
    objc_storeStrong((id *)&v19->_transitNotificationService, a8);
    objc_storeStrong((id *)&v19->_familyCircleManager, a9);
    objc_storeStrong((id *)&v19->_expressPassManager, a10);
    v19->_isUserPropertyOverrideEnabled = PKIsUserPropertyOverrideEnabled();
  }

  return v19;
}

- (void)updateWithRules:(id)a3
{
  id v3 = [(PDDatabaseManager *)self->_databaseManager updateRules:a3];
}

- (void)evaluateRulesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v25 = a4;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_100020CAC;
  v49 = sub_100021148;
  id v50 = objc_alloc_init((Class)NSMutableDictionary);
  id v28 = objc_alloc_init((Class)NSMutableSet);
  id v29 = objc_alloc_init((Class)NSMutableSet);
  oslog = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    sub_100517600(v58, (uint64_t)[v5 count], oslog);
  }

  id v33 = objc_alloc_init((Class)NSMutableString);
  id v26 = [(PDDatabaseManager *)self->_databaseManager rulesWithIdentifiers:v5];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100388914;
  v43[3] = &unk_10074CA60;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v44 = v6;
  [v26 enumerateObjectsUsingBlock:v43];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v39 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v40;
    uint64_t v30 = PKRulesErrorDomain;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        v11 = [v6 objectForKey:v10];
        v12 = v11;
        if (!v11)
        {
          id v16 = [objc_alloc((Class)NSError) initWithDomain:v30 code:3 userInfo:0];
          if (v16) {
            goto LABEL_12;
          }
          goto LABEL_16;
        }
        v13 = [v11 predicate];
        v14 = +[PDUserEvaluationEnvironment availableKeysAndOperators];
        id v38 = 0;
        v15 = +[PDPredicateValidator validatePredicate:v13 allowedKeysAndOperators:v14 error:&v38];
        id v16 = v38;

        if (v16)
        {

LABEL_12:
          id v17 = (objc_class *)objc_opt_class();
          v18 = NSStringFromClass(v17);
          [v33 appendFormat:@"%@: Validating predicate failed for ruleIdentifier: %@ rule: %@ with error: %@\n", v18, v10, v12, v16, v25];

          CFStringRef v55 = @"rule";
          uint64_t v56 = v10;
          v19 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          PKAnalyticsSendEvent();

          [(id)v46[5] setObject:&__kCFBooleanFalse forKeyedSubscript:v10];
          goto LABEL_18;
        }
        if (([v15 isValid] & 1) == 0)
        {

LABEL_16:
          [v33 appendFormat:@"%@: Invalid predicate for ruleIdentifier: %@ rule: %@\n", objc_opt_class(), v10, v12];
          CFStringRef v53 = @"rule";
          uint64_t v54 = v10;
          id v21 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          PKAnalyticsSendEvent();

          [(id)v46[5] setObject:&__kCFBooleanFalse forKeyedSubscript:v10];
          goto LABEL_17;
        }
        [v28 addObject:v12];
        v20 = [v15 usedKeys];
        [v29 unionSet:v20];

LABEL_17:
        id v16 = 0;
LABEL_18:
      }
      id v7 = [obj countByEnumeratingWithState:&v39 objects:v57 count:16];
    }
    while (v7);
  }

  if ([v33 length])
  {
    id v22 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v33;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  else
  {
    id v22 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      sub_1005175BC(oslog);
      id v22 = oslog;
    }
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100388978;
  v34[3] = &unk_10074CA88;
  v34[4] = self;
  v37 = &v45;
  id v23 = v28;
  id v35 = v23;
  id v24 = v25;
  id v36 = v24;
  [(PDRuleManager *)self getCurrentEnvironmentForKeys:v29 withCompletion:v34];

  _Block_object_dispose(&v45, 8);
}

- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [objc_alloc((Class)NSSet) initWithArray:v8];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100388EC4;
    v12[3] = &unk_10074CAB0;
    v12[4] = self;
    id v15 = v10;
    id v13 = v8;
    id v14 = v9;
    [(PDRuleManager *)self getCurrentEnvironmentForKeys:v11 withCompletion:v12];
  }
}

- (id)evaluateUserProperty:(id)a3 withParameter:(id)a4 usingEnvironment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  PKLogFacilityTypeGetObject();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      int v35 = 138543362;
      id v36 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "discovery:evaluateUserProperty", "%{public}@", (uint8_t *)&v35, 0xCu);
    }
  }

  id v14 = objc_alloc_init((Class)NSArray);
  switch(PDUEEKeyFromString(v8))
  {
    case 1:
      uint64_t v18 = [v10 currentRegion];
      goto LABEL_170;
    case 2:
      id v15 = [v10 isApplePayActive];
      goto LABEL_167;
    case 3:
      id v16 = [v10 defaultCreditAccountSetupFeatureState];
      goto LABEL_169;
    case 4:
      id v15 = [v10 hasDefaultCreditAccount];
      goto LABEL_167;
    case 5:
      id v16 = [v10 defaultCreditAccountState];
      goto LABEL_169;
    case 6:
      uint64_t v18 = [v10 defaultCreditAccountLifetimeRewards];
      goto LABEL_170;
    case 7:
      id v15 = [v10 defaultCreditAccountHasPhysicalCard];
      goto LABEL_167;
    case 8:
      id v15 = [v10 defaultCreditAccountHasVirtualCard];
      goto LABEL_167;
    case 9:
      id v15 = [v10 defaultCreditAccountHasDynamicSecurityCode];
      goto LABEL_167;
    case 10:
      id v15 = [v10 defaultCreditAccountRequiresDebtCollectionNotices];
      goto LABEL_167;
    case 11:
      id v16 = [v10 defaultCreditAccountBalanceStatus];
      goto LABEL_169;
    case 12:
      id v16 = [v10 defaultCreditAccountCyclesPastDue];
      goto LABEL_169;
    case 13:
      id v15 = [v10 defaultCreditAccountInGrace];
      goto LABEL_167;
    case 14:
      id v15 = [v10 defaultCreditAccountInDisasterRecovery];
      goto LABEL_167;
    case 15:
      id v15 = [v10 defaultCreditAccountHasDisputeOpen];
      goto LABEL_167;
    case 16:
      id v16 = [v10 defaultCreditAccountDaysSinceDisputeOpened];
      goto LABEL_169;
    case 17:
      uint64_t v18 = [v10 defaultCreditAccountAvailableCredit];
      goto LABEL_170;
    case 18:
      id v15 = [v10 defaultCreditAccountSupportsShowNotifications];
      goto LABEL_167;
    case 19:
      id v15 = [v10 defaultCreditAccountPassIsDefault];
      goto LABEL_167;
    case 20:
      id v16 = [v10 defaultCreditAccountDaysSinceLastTransaction];
      goto LABEL_169;
    case 21:
      id v15 = [v10 defaultCreditAccountHasInStoreTransaction];
      goto LABEL_167;
    case 22:
      id v15 = [v10 defaultCreditAccountHasInAppTransaction];
      goto LABEL_167;
    case 23:
      id v15 = [v10 defaultCreditAccountHasWebTransaction];
      goto LABEL_167;
    case 24:
      id v15 = [v10 defaultCreditAccountHasVirtualCardTransaction];
      goto LABEL_167;
    case 25:
      id v15 = [v10 defaultCreditAccountHasPhysicalCardTransaction];
      goto LABEL_167;
    case 26:
      id v16 = [v10 defaultCreditAccountDaysSinceCreatedDate];
      goto LABEL_169;
    case 27:
    case 28:
      id v15 = [v10 defaultCreditAccountHasActiveInstallment];
      goto LABEL_167;
    case 29:
      v19 = [v10 defaultCreditAccountSupportedDestinations];
      goto LABEL_155;
    case 30:
      uint64_t v18 = [v10 defaultCreditAccountRewardsDestination];
      goto LABEL_170;
    case 31:
      id v15 = [v10 defaultCreditAccountHasMerchantIdentifier:v9];
      goto LABEL_167;
    case 32:
      id v15 = [v10 defaultCreditAccountHasMerchantIdentifier30Days:v9];
      goto LABEL_167;
    case 33:
      id v15 = [v10 defaultCreditAccountHasMapsIdentifier:v9];
      goto LABEL_167;
    case 34:
      id v15 = [v10 defaultCreditAccountHasMapsIdentifierLast30Days:v9];
      goto LABEL_167;
    case 35:
      id v15 = [v10 defaultCreditAccountHasMapsBrandIdentifier:v9];
      goto LABEL_167;
    case 36:
      id v15 = [v10 defaultCreditAccountHasMapsBrandIdentifierLast30Days:v9];
      goto LABEL_167;
    case 37:
      id v16 = [v10 defaultCreditApplicationCount];
      goto LABEL_169;
    case 38:
      id v16 = [v10 currentDefaultCreditApplictionDaysSinceLastUpdated];
      goto LABEL_169;
    case 39:
      uint64_t v18 = [v10 currentDefaultCreditApplicationState];
      goto LABEL_170;
    case 40:
      id v15 = [v10 defaultCreditAccountIsShared];
      goto LABEL_167;
    case 41:
      id v16 = [v10 defaultCreditAccountAccessLevel];
      goto LABEL_169;
    case 42:
      id v15 = [v10 defaultCreditAccountIsCoOwner];
      goto LABEL_167;
    case 43:
      id v16 = [v10 defaultCreditAccountParticipantUsersCount];
      goto LABEL_169;
    case 44:
      id v15 = [v10 defaultCreditAccountHasUnderageParticipant];
      goto LABEL_167;
    case 45:
      uint64_t v18 = [v10 defaultCreditAccountPhysicalAppleCardStatus];
      goto LABEL_170;
    case 46:
      id v16 = [v10 daysSincePhysicalAppleCardShipmentUpdate];
      goto LABEL_169;
    case 47:
      id v15 = [v10 hasActivePromotionIdentifier:v9];
      goto LABEL_167;
    case 48:
      id v15 = [v10 hasActivePromotionIdentifierExpiringSoon:v9];
      goto LABEL_167;
    case 49:
      id v16 = [v10 defaultCreditAccountDaysUntilActivePromotionExpires:v9];
      goto LABEL_169;
    case 50:
      id v15 = [v10 defaultCreditAccountHasAutopaySetup];
      goto LABEL_167;
    case 51:
      id v15 = [v10 anyCreditAccountStateIsClosed];
      goto LABEL_167;
    case 52:
      id v15 = [v10 anyCreditAccountStateIsRemoved];
      goto LABEL_167;
    case 53:
      v19 = [v10 passStyles];
      goto LABEL_155;
    case 54:
      v19 = [v10 unexpiredPassStyles];
      goto LABEL_155;
    case 55:
      v19 = [v10 secureElementCardTypes];
      goto LABEL_155;
    case 56:
      v19 = [v10 unexpiredSecureElementCardTypes];
      goto LABEL_155;
    case 57:
      v19 = [v10 transitNetworksPresent];
      goto LABEL_155;
    case 58:
      v19 = [v10 transitNetworksPresentAndUnexpired];
      goto LABEL_155;
    case 59:
      id v15 = [v10 hasMerchantIdentifier:v9];
      goto LABEL_167;
    case 60:
      id v15 = [v10 hasMapsIdentifier:v9];
      goto LABEL_167;
    case 61:
      id v15 = [v10 hasMapsBrandIdentifier:v9];
      goto LABEL_167;
    case 62:
      id v15 = [v10 hasPaymentTransaction];
      goto LABEL_167;
    case 63:
      id v15 = [v10 hasTransitTransaction];
      goto LABEL_167;
    case 64:
      id v15 = [v10 hasPeerPaymentAccount];
      goto LABEL_167;
    case 65:
      id v15 = [v10 hasPeerPaymentPassProvisioned];
      goto LABEL_167;
    case 66:
      id v16 = [v10 peerPaymentAccountState];
      goto LABEL_169;
    case 67:
      id v16 = [v10 peerPaymentAccountStateReason];
      goto LABEL_169;
    case 68:
      id v16 = [v10 peerPaymentAccountStage];
      goto LABEL_169;
    case 69:
      id v15 = [v10 peerPaymentAccountHasTransaction];
      goto LABEL_167;
    case 70:
      id v15 = [v10 peerPaymentHasOnlinePurchaseTransaction];
      goto LABEL_167;
    case 71:
      id v15 = [v10 peerPaymentAccountHasContactlessTransaction];
      goto LABEL_167;
    case 72:
      id v16 = [v10 daysSinceLastPeerPaymentTransaction];
      goto LABEL_169;
    case 73:
    case 87:
      id v16 = [v10 peerPaymentDaysSinceLastP2PTransaction];
      goto LABEL_169;
    case 74:
      id v16 = [v10 peerPaymentDaysSinceLastP2PTransactionToAnyParticipant];
      goto LABEL_169;
    case 75:
      id v15 = [v10 peerPaymentAccountHasBalance];
      goto LABEL_167;
    case 76:
      id v16 = [v10 peerPaymentAccountBalanceBase];
      goto LABEL_169;
    case 77:
      uint64_t v18 = [v10 deviceLanguage];
      goto LABEL_170;
    case 78:
      uint64_t v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 peerPaymentAccountRole]);
      goto LABEL_170;
    case 79:
      id v16 = [v10 peerPaymentAccountDaysSinceCreatedDate];
      goto LABEL_169;
    case 80:
      id v16 = [v10 peerPaymentAccountDaysSinceIdentifiedDate];
      goto LABEL_169;
    case 81:
      id v16 = [v10 daysSinceParticipantPeerPaymentAccountIdentifiedDate];
      goto LABEL_169;
    case 82:
      id v15 = [v10 peerPaymentAccountHasSentMoneyToAnyParticipant];
      goto LABEL_167;
    case 83:
      id v15 = [v10 peerPaymentHasP2PTransaction];
      goto LABEL_167;
    case 84:
      id v15 = [v10 peerPaymentHasAutoReloadEnabled];
      goto LABEL_167;
    case 85:
      id v15 = [v10 peerPaymentHasSetupRecurringP2PPayment];
      goto LABEL_167;
    case 86:
      id v15 = [v10 peerPaymentHasSetupRecurringP2PPaymentForAnyParticipant];
      goto LABEL_167;
    case 88:
      id v15 = [v10 peerPaymentHasSentP2PPayment];
      goto LABEL_167;
    case 89:
      id v15 = [v10 peerPaymentHasReceivedP2PPayment];
      goto LABEL_167;
    case 90:
      id v15 = [v10 peerPaymentHasSentDeviceTapTransaction];
      goto LABEL_167;
    case 91:
      id v15 = [v10 peerPaymentHasReceivedDeviceTapTransactions];
      goto LABEL_167;
    case 92:
      id v16 = [v10 peerPaymentNumberOfDeviceTapTransactions];
      goto LABEL_169;
    case 93:
      id v16 = [v10 daysSinceLastDeviceTapSendTransaction];
      goto LABEL_169;
    case 94:
      id v16 = [v10 peerPaymentFamilyParticipantAccounts];
      goto LABEL_169;
    case 95:
      id v15 = [v10 familyCircleFamilyOrganizer];
      goto LABEL_167;
    case 96:
      id v15 = [v10 familyCircleParent];
      goto LABEL_167;
    case 97:
      id v15 = [v10 familyCircleHasFamily];
      goto LABEL_167;
    case 98:
      id v16 = [v10 familyCircleCurrentUserAge];
      goto LABEL_169;
    case 99:
      id v16 = [v10 familyCircleMembersUnderAge];
      goto LABEL_169;
    case 100:
      id v16 = [v10 familyCircleMembersCount];
      goto LABEL_169;
    case 101:
      id v16 = [v10 familyCircleDaysSinceNewestJoinedDate];
      goto LABEL_169;
    case 102:
      id v16 = [v10 familyCircleMinimumMemberAge];
      goto LABEL_169;
    case 103:
      id v16 = [v10 familyCircleAgeCategory];
      goto LABEL_169;
    case 104:
      id v15 = [v10 isApplePaySetupAvailable];
      goto LABEL_167;
    case 105:
      id v15 = [v10 isPrimaryAppleAccountVerified];
      goto LABEL_167;
    case 106:
      id v15 = [v10 isDeviceRegisteredWithBroker];
      goto LABEL_167;
    case 107:
      id v15 = [v10 hasPaymentCard];
      goto LABEL_167;
    case 108:
      id v15 = [v10 hasDebitCard];
      goto LABEL_167;
    case 109:
      id v15 = [v10 hasApplePayTransaction];
      goto LABEL_167;
    case 110:
      id v16 = [v10 daysSinceLastTransaction];
      goto LABEL_169;
    case 111:
      id v16 = [v10 daysSinceOldestPaymentPassIngestDate];
      goto LABEL_169;
    case 112:
      id v16 = [v10 daysSinceOldestCreditCardIngestDate];
      goto LABEL_169;
    case 113:
      v19 = [v10 discoveryItemsWithActiveStatus];
      goto LABEL_155;
    case 114:
      v19 = [v10 discoveryItemsWithActionedStatus];
      goto LABEL_155;
    case 115:
      v19 = [v10 discoveryItemsWithDismissedStatus];
      goto LABEL_155;
    case 116:
      v19 = [v10 discoveryItemsWithWaitingForTriggerStatus];
      goto LABEL_155;
    case 117:
      v19 = [v10 discoveryItemsExpanded];
      goto LABEL_155;
    case 118:
      v19 = [v10 discoveryItemsDismissed];
      goto LABEL_155;
    case 119:
      v19 = [v10 discoveryCTAsTapped];
      goto LABEL_155;
    case 120:
      v19 = [v10 discoveryCTAsCompleted];
      goto LABEL_155;
    case 121:
      v19 = [v10 sentTransitDCINotifications];
      goto LABEL_155;
    case 122:
      v19 = [v10 sentTransitOpenLoopUpgradeNotifications];
      goto LABEL_155;
    case 123:
      v19 = [v10 sentTransitOpenLoopRenotifiedInMarketNotifications];
      goto LABEL_155;
    case 124:
      v19 = [v10 cardTypesWithExpressEnabled];
      goto LABEL_155;
    case 125:
      v19 = [v10 supportedMarketsForCurrentLocation];
      goto LABEL_155;
    case 126:
      v19 = [v10 supportedTransitMarketsForCurrentLocation];
      goto LABEL_155;
    case 127:
      v19 = [v10 supportedTransitNetworksForCurrentLocation];
      goto LABEL_155;
    case 128:
      v19 = [v10 expressTransitNetworksForCurrentLocation];
      goto LABEL_155;
    case 129:
      id v15 = [v10 hasTransitPassForCurrentLocation];
      goto LABEL_167;
    case 130:
      id v15 = [v10 hasUnexpiredTransitPassForCurrentLocation];
      goto LABEL_167;
    case 131:
      v20 = [v10 currentPlacemark];
      id v21 = objc_alloc_init((Class)NSMutableDictionary);
      id v22 = [v20 ISOcountryCode];
      [v21 setObject:v22 forKeyedSubscript:@"ISOcountryCode"];

      id v23 = [v20 postalCode];
      [v21 setObject:v23 forKeyedSubscript:@"postalCode"];

      id v24 = [v20 administrativeArea];
      [v21 setObject:v24 forKeyedSubscript:@"administrativeArea"];

      id v25 = [v20 subAdministrativeArea];
      [v21 setObject:v25 forKeyedSubscript:@"subAdministrativeArea"];

      id v26 = [v20 locality];
      [v21 setObject:v26 forKeyedSubscript:@"locality"];

      id v27 = [v20 subLocality];
      [v21 setObject:v27 forKeyedSubscript:@"subLocality"];

      id v28 = [v21 copy];
      goto LABEL_159;
    case 132:
      id v15 = [v10 hasPayLaterAccount];
      goto LABEL_167;
    case 133:
      id v15 = [v10 isPayLaterHidden];
      goto LABEL_167;
    case 134:
      id v15 = [v10 hasEverProvisionedPayLaterPass];
      goto LABEL_167;
    case 135:
      id v15 = [v10 hasPayLaterPass];
      goto LABEL_167;
    case 136:
      id v16 = [v10 payLaterNumberOfLoans];
      goto LABEL_169;
    case 137:
      id v16 = [v10 payLaterDaysSinceFirstActiveLoan];
      goto LABEL_169;
    case 138:
      id v16 = [v10 payLaterNumberOfActiveLoans];
      goto LABEL_169;
    case 139:
      id v16 = [v10 payLaterNumberOfPendingLoans];
      goto LABEL_169;
    case 140:
      id v16 = [v10 payLaterNumberOfDelinquentLoans];
      goto LABEL_169;
    case 141:
      id v16 = [v10 payLaterNumberOfCanceledLoans];
      goto LABEL_169;
    case 142:
      id v16 = [v10 payLaterNumberOfCompleteLoans];
      goto LABEL_169;
    case 143:
      id v15 = [v10 hasSavingsAccount];
      goto LABEL_167;
    case 144:
      id v16 = [v10 savingsAccountDaysSinceCreatedDate];
      goto LABEL_169;
    case 145:
      id v15 = [v10 savingsAccountHasExternalTransferIn];
      goto LABEL_167;
    case 146:
      id v15 = [v10 savingsAccountHasExternalTransferOut];
      goto LABEL_167;
    case 147:
      id v15 = [v10 savingsAccountHasCashTransferIn];
      goto LABEL_167;
    case 148:
      id v16 = [v10 savingsAccountBinnedBalance];
      goto LABEL_169;
    case 149:
      id v15 = [v10 hasInstalledApp:v9];
      goto LABEL_167;
    case 150:
      id v15 = [v10 hasPairedWatch];
      goto LABEL_167;
    case 151:
      v19 = [v10 enrolledAuthenticationMechanisms];
LABEL_155:
      v20 = v19;
      uint64_t v29 = [v19 allObjects];
      id v21 = (id)v29;
      if (v29) {
        uint64_t v30 = (void *)v29;
      }
      else {
        uint64_t v30 = v14;
      }
      id v28 = v30;
LABEL_159:
      id v17 = v28;

      break;
    case 152:
      id v15 = [v10 hasIssuerInstallmentCard];
      goto LABEL_167;
    case 153:
      id v15 = [v10 hasEverMadeIssuerInstallmentTransaction];
      goto LABEL_167;
    case 154:
      id v15 = [v10 hasBankConnectEligibleCard];
      goto LABEL_167;
    case 155:
      id v15 = [v10 hasAnyConnectedCardWithBankConnect];
      goto LABEL_167;
    case 156:
      id v15 = [v10 hasPayWithRewardsCard];
      goto LABEL_167;
    case 157:
      id v15 = [v10 hasEverMadePayWithRewardsTransaction];
      goto LABEL_167;
    case 158:
      id v15 = [v10 hasAppleAccountCardProvisioned];
LABEL_167:
      uint64_t v18 = +[NSNumber numberWithBool:v15];
      goto LABEL_170;
    case 159:
      id v16 = [v10 daysSinceAppleAccountInStoreTopUp];
LABEL_169:
      uint64_t v18 = +[NSNumber numberWithInteger:v16];
LABEL_170:
      id v17 = (void *)v18;
      break;
    default:
      id v17 = 0;
      break;
  }
  v31 = v11;
  os_signpost_id_t v32 = os_signpost_id_make_with_pointer(v31, self);
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v33 = v32;
    if (os_signpost_enabled(v31))
    {
      LOWORD(v35) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, v33, "discovery:evaluateUserProperty", "", (uint8_t *)&v35, 2u);
    }
  }

  return v17;
}

- (void)getCurrentEnvironmentForKeys:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  PKLogFacilityTypeGetObject();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "discovery:preflightEnvironment", "", buf, 2u);
    }
  }

  *(void *)buf = 0;
  id v17 = buf;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100020CAC;
  v20 = sub_100021148;
  id v21 = [[PDUserEvaluationEnvironment alloc] initWithAccountManager:self->_accountManager applyManager:self->_applyManager databaseManager:self->_databaseManager peerPaymentWebServiceCoordinator:self->_peerPaymentWebServiceCoordinator paymentWebServiceCoordinator:self->_paymentWebServiceCoordinator transitNotificationService:self->_transitNotificationService familyCircleManager:self->_familyCircleManager expressPassManager:self->_expressPassManager discoveryManager:self->_discoveryManager];
  id v11 = (void *)*((void *)v17 + 5);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10038A570;
  v13[3] = &unk_10074CAD8;
  v13[4] = self;
  id v12 = v7;
  id v14 = v12;
  id v15 = buf;
  [v11 preflightForKeys:v6 completion:v13];

  _Block_object_dispose(buf, 8);
}

- (void)overrideValues:(id)a3 forUserProperties:(id)a4 withParameters:(id)a5
{
  id v31 = a3;
  id v7 = a4;
  id v30 = a5;
  id v36 = 0;
  id v8 = PKDiscoveryDirectoryPath();
  os_signpost_id_t v9 = [v8 stringByAppendingPathComponent:@"Test"];

  os_signpost_id_t v10 = [v9 stringByAppendingPathComponent:@"engagement"];

  id v11 = [v10 stringByAppendingPathExtension:@"json"];

  id v12 = +[NSData dataWithContentsOfFile:v11];
  if (v12)
  {
    id v13 = +[NSJSONSerialization JSONObjectWithData:v12 options:0 error:&v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v13;
      id v14 = v13;
    }
    else
    {
      NSErrorUserInfoKey v39 = NSUnderlyingErrorKey;
      *(void *)buf = @"dictionary required";
      id v15 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v39 count:1];
      id v36 = +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:v15];

      id v14 = 0;
    }
  }
  else
  {
    NSErrorUserInfoKey v39 = NSUnderlyingErrorKey;
    *(void *)buf = v11;
    id v13 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v39 count:1];
    +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:v13];
    id v14 = 0;
    id v36 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v16 = v36;
  id v17 = PKLogFacilityTypeGetObject();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "user property overrides found: %{public}@", buf, 0xCu);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v7;
    id v19 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v19)
    {
      id v20 = v19;
      id v28 = v16;
      id v29 = v7;
      uint64_t v21 = *(void *)v33;
      id v22 = v30;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v17);
          }
          uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v25 = objc_msgSend(v14, "objectForKeyedSubscript:", v24, v28, v29);
          if (v25)
          {
            id v26 = [v22 objectForKeyedSubscript:v24];
            if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v25 containsObject:v26]);
              [v31 setObject:v27 forKeyedSubscript:v24];

              id v22 = v30;
            }
            else
            {
              [v31 setObject:v25 forKeyedSubscript:v24];
            }
          }
        }
        id v20 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v20);
      id v16 = v28;
      id v7 = v29;
    }
  }
  else if (v18)
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "couldn't read test properties: %{public}@", buf, 0xCu);
  }
}

- (void)rulesWithCompletion:(id)a3
{
  databaseManager = self->_databaseManager;
  v4 = (void (**)(id, id))a3;
  id v5 = [(PDDatabaseManager *)databaseManager rules];
  v4[2](v4, v5);
}

- (void)insertRule:(id)a3
{
  id v3 = [(PDDatabaseManager *)self->_databaseManager insertOrUpdateRule:a3];
}

- (void)deleteRuleWithIdentifier:(id)a3
{
}

- (PDDiscoveryManager)discoveryManager
{
  return self->_discoveryManager;
}

- (void)setDiscoveryManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryManager, 0);
  objc_storeStrong((id *)&self->_expressPassManager, 0);
  objc_storeStrong((id *)&self->_familyCircleManager, 0);
  objc_storeStrong((id *)&self->_transitNotificationService, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_applyManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end