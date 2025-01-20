@interface PKEngagementEventTrigger
+ (BOOL)fireEngagementEventNamed:(id)a3;
+ (id)eventWithType:(id)a3;
+ (id)metrics;
+ (void)_fireEventType:(id)a3;
+ (void)fireAccountAddedEvent;
+ (void)fireAccountRemovedEvent;
+ (void)fireAccountUpdatedEvent;
+ (void)fireAppleAccountInStoreTopUpEvent;
+ (void)fireApplePayContextChangedEvent;
+ (void)fireCurrentLocaleChangedEvent;
+ (void)fireDCINotificationForMarketAddedEvent;
+ (void)fireDayChangedEvent;
+ (void)fireDefaultCreditAccountBalancePaidInFullEvent;
+ (void)fireDefaultCreditAccountCreditLimitIncreasedEvent;
+ (void)fireDefaultCreditAccountPurchaseMissedApplePayMerchantRewardsEvent;
+ (void)fireDefaultCreditAccountReceivedBonusDailyCashEvent;
+ (void)fireExpressPassInfoChangedEvent;
+ (void)fireFamilyCircleChangedEvent;
+ (void)fireFeatureApplicationAddedEvent;
+ (void)fireFeatureApplicationRemovedEvent;
+ (void)fireFeatureApplicationUpdatedEvent;
+ (void)fireLocationChangedEvent;
+ (void)fireOpenLoopUpgradeNotificationForMarketAddedEvent;
+ (void)firePassAddedEvent;
+ (void)firePassRemovedEvent;
+ (void)firePeerPaymentAccountUpdatedEvent;
+ (void)firePeerPaymentDeviceTapTransactionAddedEvent;
+ (void)fireRenotifyNotificationForMarketAddedEvent;
+ (void)fireScheduledPaymentsChangedEvent;
+ (void)fireTransactionsUpdatedEvent;
@end

@implementation PKEngagementEventTrigger

+ (BOOL)fireEngagementEventNamed:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject(0x10uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v83 = 138543362;
    id v84 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "will fire %{public}@ engagement event via command line", (uint8_t *)&v83, 0xCu);
  }

  v6 = (__CFString *)v4;
  v7 = v6;
  if (v6 == @"wallet:passAdded") {
    goto LABEL_6;
  }
  if (!v6)
  {
LABEL_80:
    BOOL v9 = 0;
    goto LABEL_81;
  }
  int v8 = [(__CFString *)v6 isEqualToString:@"wallet:passAdded"];

  if (!v8)
  {
    v10 = v7;
    if (v10 == @"wallet:passRemoved"
      || (v11 = v10,
          int v12 = [(__CFString *)v10 isEqualToString:@"wallet:passRemoved"],
          v11,
          v12))
    {
      [a1 firePassRemovedEvent];
      goto LABEL_7;
    }
    v13 = v11;
    if (v13 == @"wallet:expressPassInfoChanged"
      || (v14 = v13,
          int v15 = [(__CFString *)v13 isEqualToString:@"wallet:expressPassInfoChanged"],
          v14,
          v15))
    {
      [a1 fireExpressPassInfoChangedEvent];
      goto LABEL_7;
    }
    v16 = v14;
    if (v16 == @"wallet:locationChanged"
      || (v17 = v16,
          int v18 = [(__CFString *)v16 isEqualToString:@"wallet:locationChanged"],
          v17,
          v18))
    {
      [a1 fireLocationChangedEvent];
      goto LABEL_7;
    }
    v19 = v17;
    if (v19 == @"wallet:accountAdded"
      || (v20 = v19,
          int v21 = [(__CFString *)v19 isEqualToString:@"wallet:accountAdded"],
          v20,
          v21))
    {
      [a1 fireAccountAddedEvent];
      goto LABEL_7;
    }
    v22 = v20;
    if (v22 == @"wallet:accountUpdated"
      || (v23 = v22,
          int v24 = [(__CFString *)v22 isEqualToString:@"wallet:accountUpdated"],
          v23,
          v24))
    {
      [a1 fireAccountUpdatedEvent];
      goto LABEL_7;
    }
    v25 = v23;
    if (v25 == @"wallet:accountRemoved"
      || (v26 = v25,
          int v27 = [(__CFString *)v25 isEqualToString:@"wallet:accountRemoved"],
          v26,
          v27))
    {
      [a1 fireAccountRemovedEvent];
      goto LABEL_7;
    }
    v28 = v26;
    if (v28 == @"wallet:peerPaymentAccountUpdated"
      || (v29 = v28,
          int v30 = [(__CFString *)v28 isEqualToString:@"wallet:peerPaymentAccountUpdated"],
          v29,
          v30))
    {
      [a1 firePeerPaymentAccountUpdatedEvent];
      goto LABEL_7;
    }
    v31 = v29;
    if (v31 == @"wallet:featureApplicationAdded"
      || (v32 = v31,
          int v33 = [(__CFString *)v31 isEqualToString:@"wallet:featureApplicationAdded"],
          v32,
          v33))
    {
      [a1 fireFeatureApplicationAddedEvent];
      goto LABEL_7;
    }
    v34 = v32;
    if (v34 == @"wallet:featureApplicationRemoved"
      || (v35 = v34,
          int v36 = [(__CFString *)v34 isEqualToString:@"wallet:featureApplicationRemoved"],
          v35,
          v36))
    {
      [a1 fireFeatureApplicationRemovedEvent];
      goto LABEL_7;
    }
    v37 = v35;
    if (v37 == @"wallet:featureApplicationUpdated"
      || (v38 = v37,
          int v39 = [(__CFString *)v37 isEqualToString:@"wallet:featureApplicationUpdated"],
          v38,
          v39))
    {
      [a1 fireFeatureApplicationUpdatedEvent];
      goto LABEL_7;
    }
    v40 = v38;
    if (v40 == @"wallet:DCINotificationForMarketAdded"
      || (v41 = v40,
          int v42 = [(__CFString *)v40 isEqualToString:@"wallet:DCINotificationForMarketAdded"],
          v41,
          v42))
    {
      [a1 fireDCINotificationForMarketAddedEvent];
      goto LABEL_7;
    }
    v43 = v41;
    if (v43 == @"wallet:openLoopUpgradeNotificationForMarketAdded"
      || (v44 = v43,
          int v45 = [(__CFString *)v43 isEqualToString:@"wallet:openLoopUpgradeNotificationForMarketAdded"], v44, v45))
    {
      [a1 fireOpenLoopUpgradeNotificationForMarketAddedEvent];
      goto LABEL_7;
    }
    v46 = v44;
    if (v46 == @"wallet:renotifyNotificationForMaketAdded"
      || (v47 = v46,
          int v48 = [(__CFString *)v46 isEqualToString:@"wallet:renotifyNotificationForMaketAdded"], v47, v48))
    {
      [a1 fireRenotifyNotificationForMarketAddedEvent];
      goto LABEL_7;
    }
    v49 = v47;
    if (v49 == @"wallet:transactionsUpdated"
      || (v50 = v49,
          int v51 = [(__CFString *)v49 isEqualToString:@"wallet:transactionsUpdated"],
          v50,
          v51))
    {
      [a1 fireTransactionsUpdatedEvent];
      goto LABEL_7;
    }
    v52 = v50;
    if (v52 == @"wallet:familyCircleChanged"
      || (v53 = v52,
          int v54 = [(__CFString *)v52 isEqualToString:@"wallet:familyCircleChanged"],
          v53,
          v54))
    {
      [a1 fireFamilyCircleChangedEvent];
      goto LABEL_7;
    }
    v55 = v53;
    if (v55 == @"wallet:currentLocaleChanged"
      || (v56 = v55,
          int v57 = [(__CFString *)v55 isEqualToString:@"wallet:currentLocaleChanged"],
          v56,
          v57))
    {
      [a1 fireCurrentLocaleChangedEvent];
      goto LABEL_7;
    }
    v58 = v56;
    if (v58 == @"wallet:applePayContextChanged"
      || (v59 = v58,
          int v60 = [(__CFString *)v58 isEqualToString:@"wallet:applePayContextChanged"],
          v59,
          v60))
    {
      [a1 fireApplePayContextChangedEvent];
      goto LABEL_7;
    }
    v61 = v59;
    if (v61 == @"wallet:dayChanged"
      || (v62 = v61,
          int v63 = [(__CFString *)v61 isEqualToString:@"wallet:dayChanged"],
          v62,
          v63))
    {
      [a1 fireDayChangedEvent];
      goto LABEL_7;
    }
    v64 = v62;
    if (v64 == @"wallet:scheduledPaymentsChanged"
      || (v65 = v64,
          int v66 = [(__CFString *)v64 isEqualToString:@"wallet:scheduledPaymentsChanged"],
          v65,
          v66))
    {
      [a1 fireScheduledPaymentsChangedEvent];
      goto LABEL_7;
    }
    v67 = v65;
    if (v67 == @"wallet:defaultCreditAccountCreditLimitIncreased"
      || (v68 = v67,
          int v69 = [(__CFString *)v67 isEqualToString:@"wallet:defaultCreditAccountCreditLimitIncreased"], v68, v69))
    {
      [a1 fireDefaultCreditAccountCreditLimitIncreasedEvent];
      goto LABEL_7;
    }
    v70 = v68;
    if (v70 == @"wallet:defaultCreditAccountBalancePaidInFull"
      || (v71 = v70,
          int v72 = [(__CFString *)v70 isEqualToString:@"wallet:defaultCreditAccountBalancePaidInFull"], v71, v72))
    {
      [a1 fireDefaultCreditAccountBalancePaidInFullEvent];
      goto LABEL_7;
    }
    v73 = v71;
    if (v73 == @"wallet:defaultCreditAccountBonusDailyCashReceived"
      || (v74 = v73,
          int v75 = [(__CFString *)v73 isEqualToString:@"wallet:defaultCreditAccountBonusDailyCashReceived"], v74, v75))
    {
      [a1 fireDefaultCreditAccountReceivedBonusDailyCashEvent];
      goto LABEL_7;
    }
    v76 = v74;
    if (v76 == @"wallet:defaultCreditAccountPurchaseMissedApplePayMerchantRewards"
      || (v77 = v76,
          int v78 = [(__CFString *)v76 isEqualToString:@"wallet:defaultCreditAccountPurchaseMissedApplePayMerchantRewards"], v77, v78))
    {
      [a1 fireDefaultCreditAccountPurchaseMissedApplePayMerchantRewardsEvent];
      goto LABEL_7;
    }
    v79 = v77;
    if (v79 == @"wallet:appleAccountInStoreTopUp"
      || (v80 = v79,
          int v81 = [(__CFString *)v79 isEqualToString:@"wallet:appleAccountInStoreTopUp"],
          v80,
          v81))
    {
      [a1 fireAppleAccountInStoreTopUpEvent];
      goto LABEL_7;
    }
    goto LABEL_80;
  }
LABEL_6:
  [a1 firePassAddedEvent];
LABEL_7:
  BOOL v9 = 1;
LABEL_81:

  return v9;
}

+ (void)firePassAddedEvent
{
}

+ (void)firePassRemovedEvent
{
}

+ (void)fireExpressPassInfoChangedEvent
{
}

+ (void)fireLocationChangedEvent
{
}

+ (void)fireAccountAddedEvent
{
}

+ (void)fireAccountUpdatedEvent
{
}

+ (void)fireAccountRemovedEvent
{
}

+ (void)firePeerPaymentAccountUpdatedEvent
{
}

+ (void)fireFeatureApplicationAddedEvent
{
}

+ (void)fireFeatureApplicationRemovedEvent
{
}

+ (void)fireFeatureApplicationUpdatedEvent
{
}

+ (void)fireDCINotificationForMarketAddedEvent
{
}

+ (void)fireOpenLoopUpgradeNotificationForMarketAddedEvent
{
}

+ (void)fireRenotifyNotificationForMarketAddedEvent
{
}

+ (void)fireTransactionsUpdatedEvent
{
}

+ (void)fireFamilyCircleChangedEvent
{
}

+ (void)fireCurrentLocaleChangedEvent
{
}

+ (void)fireApplePayContextChangedEvent
{
}

+ (void)fireDayChangedEvent
{
}

+ (void)fireScheduledPaymentsChangedEvent
{
}

+ (void)fireDefaultCreditAccountCreditLimitIncreasedEvent
{
}

+ (void)fireDefaultCreditAccountBalancePaidInFullEvent
{
}

+ (void)fireDefaultCreditAccountReceivedBonusDailyCashEvent
{
}

+ (void)fireDefaultCreditAccountPurchaseMissedApplePayMerchantRewardsEvent
{
}

+ (void)fireAppleAccountInStoreTopUpEvent
{
}

+ (void)firePeerPaymentDeviceTapTransactionAddedEvent
{
}

+ (void)_fireEventType:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject(0x10uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "firing %@ engagement event", (uint8_t *)&v8, 0xCu);
  }

  v6 = [a1 metrics];
  v7 = [a1 eventWithType:v4];
  [v6 enqueueEvent:v7];
}

+ (id)eventWithType:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F4DD60];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initForEngagement];
  [v5 setEventType:v4];

  return v5;
}

+ (id)metrics
{
  v2 = (void *)MEMORY[0x1E4F4DBD8];
  v3 = [MEMORY[0x1E4F4DD40] bagSubProfile];
  id v4 = [MEMORY[0x1E4F4DD40] bagSubProfileVersion];
  v5 = [v2 bagForProfile:v3 profileVersion:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F4DD58]) initWithContainerID:@"com.apple.passbook" bag:v5];
  return v6;
}

@end