@interface PKPaymentTransaction
+ (BOOL)isPositiveBalanceAdjustmentForCurrencyAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6 isBankConnectTransaction:(BOOL)a7 bankConnectCreditDebitIndicator:(int64_t)a8 featureIdentifier:(unint64_t)a9;
+ (BOOL)supportsSecureCoding;
+ (BOOL)updateReasonIsInitialDownload:(unint64_t)a3;
+ (PKPaymentTransaction)paymentTransactionWithSource:(unint64_t)a3;
+ (PKPaymentTransaction)paymentTransactionWithSource:(unint64_t)a3 dictionary:(id)a4 unitDictionary:(id)a5 balanceLabelDictionary:(id)a6 planLabelDictionary:(id)a7 hasNotificationServiceData:(BOOL)a8;
+ (id)formattedBalanceAdjustmentForAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6;
+ (id)formattedBalanceAdjustmentForCurrencyAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6 featureIdentifier:(unint64_t)a7 isBankConnectTransaction:(BOOL)a8 bankConnectCreditDebitIndicator:(int64_t)a9 pending:(BOOL)a10;
+ (id)formattedBalanceAdjustmentForTransactionAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6 isBankConnectTransaction:(BOOL)a7 bankConnectCreditDebitIndicator:(int64_t)a8 featureIdentifier:(unint64_t)a9;
+ (id)recordNamePrefix;
+ (id)recordTypesAndNamesForCodingType:(unint64_t)a3 serviceIdentifier:(id)a4;
+ (id)transactionNotificationStatusStringForTransaction:(id)a3 personContact:(id)a4;
+ (void)augmentTransactionsIfNeeded:(id)a3 transactionSourceIdentifiers:(id)a4 passUniqueID:(id)a5 usingDataProvider:(id)a6 completion:(id)a7;
- (BOOL)_supportsServerFundingDescription;
- (BOOL)bankConnectRoundTransactionDate;
- (BOOL)bankConnectTransactionWasClassifiedByMaps;
- (BOOL)deviceScoreIdentifiersRequired;
- (BOOL)deviceScoreIdentifiersSubmitted;
- (BOOL)enRoute;
- (BOOL)fullyProcessed;
- (BOOL)hasAdditionalOffers;
- (BOOL)hasAssociatedPaymentApplication;
- (BOOL)hasBackingData;
- (BOOL)hasCloudArchivableDeviceData;
- (BOOL)hasEffectiveTransactionSource;
- (BOOL)hasNotificationServiceData;
- (BOOL)hasPendingAmounts;
- (BOOL)hasTransactionSource;
- (BOOL)impactsPromotionProgress;
- (BOOL)interestReassessment;
- (BOOL)isBankConnectTransaction;
- (BOOL)isCloudArchivableDeviceDataEqual:(id)a3;
- (BOOL)isCloudKitArchived;
- (BOOL)isCoarseLocation;
- (BOOL)isDeletable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPaymentTransaction:(id)a3;
- (BOOL)isFuzzyMatched;
- (BOOL)isIssuerInstallmentTransaction;
- (BOOL)isRecurring;
- (BOOL)isUnknownNearbyPeerPayment;
- (BOOL)isZeroTransaction;
- (BOOL)needsSyncWithFinance;
- (BOOL)originatedByDevice;
- (BOOL)processedForLocation;
- (BOOL)processedForMerchantCleanup;
- (BOOL)processedForStations;
- (BOOL)requiresLocation;
- (BOOL)requiresMerchantReprocessing;
- (BOOL)reviewed;
- (BOOL)shouldSuppressDate;
- (BOOL)supportsFuzzyMatching;
- (BOOL)suppressNotifications;
- (BOOL)updateReasonIsInitialDownload;
- (CLLocation)endStationLocation;
- (CLLocation)location;
- (CLLocation)preferredLocation;
- (CLLocation)startStationLocation;
- (FKPaymentTransaction)fkPaymentTransaction;
- (NSArray)amountModifiers;
- (NSArray)amounts;
- (NSArray)associatedStatementIdentifiers;
- (NSArray)awards;
- (NSArray)payments;
- (NSArray)plans;
- (NSArray)transfers;
- (NSData)endStationCode;
- (NSData)startStationCode;
- (NSDate)disputeLastUpdatedDate;
- (NSDate)disputeOpenDate;
- (NSDate)expirationDate;
- (NSDate)lastMerchantReprocessingDate;
- (NSDate)locationDate;
- (NSDate)peerPaymentMessageReceivedDate;
- (NSDate)transactionDate;
- (NSDate)transactionStatusChangedDate;
- (NSDecimalNumber)amount;
- (NSDecimalNumber)amountAddedToAuth;
- (NSDecimalNumber)nominalAmount;
- (NSDecimalNumber)primaryFundingSourceAmount;
- (NSDecimalNumber)rewardsTotalAmount;
- (NSDecimalNumber)secondaryFundingSourceAmount;
- (NSDecimalNumber)subtotalAmount;
- (NSDictionary)metadata;
- (NSNumber)cityCode;
- (NSNumber)isMerchantTokenTransaction;
- (NSOrderedSet)servicingEvents;
- (NSSet)answeredQuestionsOnThisDevice;
- (NSSet)questions;
- (NSSet)unansweredQuestions;
- (NSString)accountIdentifier;
- (NSString)administrativeArea;
- (NSString)altDSID;
- (NSString)associatedReceiptUniqueID;
- (NSString)authNetworkData;
- (NSString)barcodeIdentifier;
- (NSString)cardIdentifier;
- (NSString)cardNumberSuffix;
- (NSString)clearingNetworkData;
- (NSString)currencyCode;
- (NSString)displayLocation;
- (NSString)dpanIdentifier;
- (NSString)endStation;
- (NSString)formattedBalanceAdjustmentAbsoluteAmount;
- (NSString)formattedBalanceAdjustmentAmount;
- (NSString)formattedBalanceAdjustmentSubtotalAmount;
- (NSString)identifier;
- (NSString)issueReportIdentifier;
- (NSString)lifecycleIdentifier;
- (NSString)locality;
- (NSString)localizedTypeDescription;
- (NSString)merchantProvidedDescription;
- (NSString)merchantProvidedTitle;
- (NSString)panIdentifier;
- (NSString)paymentHash;
- (NSString)peerPaymentCounterpartHandle;
- (NSString)peerPaymentCounterpartImageRecordIdentifier;
- (NSString)peerPaymentMemo;
- (NSString)primaryFundingSourceCurrencyCode;
- (NSString)primaryFundingSourceDescription;
- (NSString)receiptIdentifier;
- (NSString)receiptProviderIdentifier;
- (NSString)referenceIdentifier;
- (NSString)rewardsTotalCurrencyCode;
- (NSString)secondaryFundingSourceCurrencyCode;
- (NSString)secondaryFundingSourceDPANSuffix;
- (NSString)secondaryFundingSourceDescription;
- (NSString)secondaryFundingSourceFPANIdentifier;
- (NSString)serviceIdentifier;
- (NSString)startStation;
- (NSString)stationCodeProvider;
- (NSString)transactionSourceIdentifier;
- (NSTimeZone)timeZone;
- (NSURL)bankConnectDigitalServicingURL;
- (NSURL)bankConnectPayNowURL;
- (NSURL)bankConnectPostInstallmentURL;
- (NSURL)bankConnectRedeemRewardsURL;
- (NSURL)bankConnectTransferFundsURL;
- (NSURL)issuerInstallmentManagementURL;
- (NSURL)receiptProviderURL;
- (NSUUID)requestDeviceScoreIdentifier;
- (NSUUID)sendDeviceScoreIdentifier;
- (PKAccountEvent)redemptionEvent;
- (PKAccountServicingEvent)latestDisputeEvent;
- (PKAccountServicingEventStatusDetails)disputeStatusDetails;
- (PKCreditInstallmentPlan)installmentPlan;
- (PKCreditInstallmentPlanPayment)installmentPayment;
- (PKCurrencyAmount)currencyAmount;
- (PKCurrencyAmount)nominalCurrencyAmount;
- (PKCurrencyAmount)primaryFundingSourceCurrencyAmount;
- (PKCurrencyAmount)rewardsTotalCurrencyAmount;
- (PKCurrencyAmount)secondaryFundingSourceCurrencyAmount;
- (PKCurrencyAmount)subtotalCurrencyAmount;
- (PKMerchant)merchant;
- (PKPayLaterFinancingPlan)associatedFinancingPlan;
- (PKPaymentRewardsRedemption)paymentRewardsRedemption;
- (PKPaymentTransaction)init;
- (PKPaymentTransaction)initWithCloudStoreCoder:(id)a3;
- (PKPaymentTransaction)initWithCoder:(id)a3;
- (PKPaymentTransactionBankConnectMetadata)bankConnectMetadata;
- (PKPaymentTransactionFees)fees;
- (PKPaymentTransactionForeignExchangeInformation)foreignExchangeInformation;
- (PKPaymentTransactionRewards)rewards;
- (PKPaymentTransactionRewards)rewardsInProgress;
- (PKPeerPaymentRecurringPayment)recurringPeerPayment;
- (PKTransactionAuthenticationContext)authenticationContext;
- (PKTransactionReleasedData)releasedData;
- (double)endStationLatitude;
- (double)endStationLongitude;
- (double)locationAltitude;
- (double)locationHorizontalAccuracy;
- (double)locationLatitude;
- (double)locationLongitude;
- (double)locationVerticalAccuracy;
- (double)startStationLatitude;
- (double)startStationLongitude;
- (id)_commutePlanInformationForPass:(id)a3;
- (id)_fkActions;
- (id)_fkAmount;
- (id)_fkApplePayTransactionInsight;
- (id)_fkContactTransactionInsight;
- (id)_fkMapsTransactionInsight;
- (id)_fkTransactionInsights;
- (id)_formatBalanceAdjustmentAmount:(id)a3;
- (id)_formatBalanceAdjustmentTransactionAmount:(id)a3;
- (id)_preformattedStringForMultipleAmounts;
- (id)_preformattedStringForMultiplePlans;
- (id)_transactionSourceString;
- (id)_transactionTypeString;
- (id)_transitSubtypeString;
- (id)description;
- (id)dictionaryOfFormattedMultipleAmountTotalsByRealCurrency;
- (id)dictionaryRepresentation;
- (id)formattedAwards;
- (id)formattedStringForMultipleAmountsForPass:(id)a3;
- (id)formattedTransitTransactionMessageForPass:(id)a3 suppressNoChargeAmount:(BOOL)a4;
- (id)primaryIdentifier;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (id)transactionAmountsForMultipleAmounts;
- (id)updateReasonsDescription;
- (int64_t)_fkPaymentTransactionStatus;
- (int64_t)accountType;
- (int64_t)adjustmentType;
- (int64_t)adjustmentTypeReason;
- (int64_t)bankConnectCreditDebitIndicator;
- (int64_t)paymentNetworkIdentifier;
- (int64_t)peerPaymentType;
- (int64_t)secondaryFundingSourceNetwork;
- (int64_t)secondaryFundingSourceType;
- (int64_t)technologyType;
- (int64_t)topUpType;
- (int64_t)transactionDeclinedReason;
- (int64_t)transactionStatus;
- (int64_t)transactionType;
- (int64_t)transitType;
- (int64_t)updateSequenceNumber;
- (unint64_t)_fkCreditDebitIndicator;
- (unint64_t)_fkMerchantCategoryFromPKMerchantCategory:(int64_t)a3;
- (unint64_t)_fkPaymentTransactionType;
- (unint64_t)associatedFeatureIdentifier;
- (unint64_t)cardType;
- (unint64_t)disputeStatus;
- (unint64_t)disputeType;
- (unint64_t)effectiveTransactionSource;
- (unint64_t)featureIdentifier;
- (unint64_t)hash;
- (unint64_t)itemType;
- (unint64_t)peerPaymentPaymentMode;
- (unint64_t)redemptionType;
- (unint64_t)rewardsEligibilityReason;
- (unint64_t)suppressBehavior;
- (unint64_t)transactionSource;
- (unint64_t)transitModifiers;
- (unint64_t)updateReasons;
- (void)_encodeDeviceDataWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)_encodeServerDataWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)addUpdateReasons:(unint64_t)a3;
- (void)answeredQuestion:(unint64_t)a3;
- (void)applyPropertiesFromCloudStoreRecord:(id)a3;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountType:(int64_t)a3;
- (void)setAdjustmentType:(int64_t)a3;
- (void)setAdjustmentTypeReason:(int64_t)a3;
- (void)setAdministrativeArea:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAmount:(id)a3;
- (void)setAmountAddedToAuth:(id)a3;
- (void)setAmountModifiers:(id)a3;
- (void)setAmounts:(id)a3;
- (void)setAssociatedFeatureIdentifier:(unint64_t)a3;
- (void)setAssociatedFinancingPlan:(id)a3;
- (void)setAssociatedStatementIdentifiers:(id)a3;
- (void)setAuthNetworkData:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setAwards:(id)a3;
- (void)setBankConnectCreditDebitIndicator:(int64_t)a3;
- (void)setBankConnectDigitalServicingURL:(id)a3;
- (void)setBankConnectMetadata:(id)a3;
- (void)setBankConnectPayNowURL:(id)a3;
- (void)setBankConnectPostInstallmentURL:(id)a3;
- (void)setBankConnectRedeemRewardsURL:(id)a3;
- (void)setBankConnectRoundTransactionDate:(BOOL)a3;
- (void)setBankConnectTransactionWasClassifiedByMaps:(BOOL)a3;
- (void)setBankConnectTransferFundsURL:(id)a3;
- (void)setBarcodeIdentifier:(id)a3;
- (void)setCardIdentifier:(id)a3;
- (void)setCardNumberSuffix:(id)a3;
- (void)setCardType:(unint64_t)a3;
- (void)setCityCode:(id)a3;
- (void)setClearingNetworkData:(id)a3;
- (void)setCoarseLocation:(BOOL)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDPANIdentifier:(id)a3;
- (void)setDeviceScoreIdentifiersRequired:(BOOL)a3;
- (void)setDeviceScoreIdentifiersSubmitted:(BOOL)a3;
- (void)setEnRoute:(BOOL)a3;
- (void)setEndStation:(id)a3;
- (void)setEndStationCode:(id)a3;
- (void)setEndStationLatitude:(double)a3;
- (void)setEndStationLocation:(id)a3;
- (void)setEndStationLongitude:(double)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFees:(id)a3;
- (void)setForeignExchangeInformation:(id)a3;
- (void)setFuzzyMatched:(BOOL)a3;
- (void)setHasAdditionalOffers:(BOOL)a3;
- (void)setHasAssociatedPaymentApplication:(BOOL)a3;
- (void)setHasNotificationServiceData:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstallmentPayment:(id)a3;
- (void)setInstallmentPlan:(id)a3;
- (void)setInterestReassessment:(BOOL)a3;
- (void)setIsBankConnectTransaction:(BOOL)a3;
- (void)setIsCloudKitArchived:(BOOL)a3;
- (void)setIsIssuerInstallmentTransaction:(BOOL)a3;
- (void)setIsMerchantTokenTransaction:(id)a3;
- (void)setIssueReportIdentifier:(id)a3;
- (void)setIssuerInstallmentManagementURL:(id)a3;
- (void)setLastMerchantReprocessingDate:(id)a3;
- (void)setLifecycleIdentifier:(id)a3;
- (void)setLocality:(id)a3;
- (void)setLocalizedTypeDescription:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationAltitude:(double)a3;
- (void)setLocationDate:(id)a3;
- (void)setLocationHorizontalAccuracy:(double)a3;
- (void)setLocationLatitude:(double)a3;
- (void)setLocationLongitude:(double)a3;
- (void)setLocationVerticalAccuracy:(double)a3;
- (void)setMerchant:(id)a3;
- (void)setMerchantProvidedDescription:(id)a3;
- (void)setMerchantProvidedTitle:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNeedsSyncWithFinance:(BOOL)a3;
- (void)setNominalAmount:(id)a3;
- (void)setOriginatedByDevice:(BOOL)a3;
- (void)setPANIdentifier:(id)a3;
- (void)setPaymentHash:(id)a3;
- (void)setPaymentNetworkIdentifier:(int64_t)a3;
- (void)setPaymentRewardsRedemption:(id)a3;
- (void)setPayments:(id)a3;
- (void)setPeerPaymentCounterpartHandle:(id)a3;
- (void)setPeerPaymentCounterpartImageRecordIdentifier:(id)a3;
- (void)setPeerPaymentMemo:(id)a3;
- (void)setPeerPaymentMessageReceivedDate:(id)a3;
- (void)setPeerPaymentPaymentMode:(unint64_t)a3;
- (void)setPeerPaymentType:(int64_t)a3;
- (void)setPlans:(id)a3;
- (void)setPrimaryFundingSourceAmount:(id)a3;
- (void)setPrimaryFundingSourceCurrencyCode:(id)a3;
- (void)setPrimaryFundingSourceDescription:(id)a3;
- (void)setProcessedForLocation:(BOOL)a3;
- (void)setProcessedForMerchantCleanup:(BOOL)a3;
- (void)setProcessedForStations:(BOOL)a3;
- (void)setQuestions:(id)a3;
- (void)setReceiptIdentifier:(id)a3;
- (void)setReceiptProviderIdentifier:(id)a3;
- (void)setReceiptProviderURL:(id)a3;
- (void)setRecurring:(BOOL)a3;
- (void)setRecurringPeerPayment:(id)a3;
- (void)setRedemptionEvent:(id)a3;
- (void)setRedemptionType:(unint64_t)a3;
- (void)setReferenceIdentifier:(id)a3;
- (void)setReleasedData:(id)a3;
- (void)setRequestDeviceScoreIdentifier:(id)a3;
- (void)setRequiresLocation:(BOOL)a3;
- (void)setRequiresMerchantReprocessing:(BOOL)a3;
- (void)setRewards:(id)a3;
- (void)setRewardsEligibilityReason:(unint64_t)a3;
- (void)setRewardsInProgress:(id)a3;
- (void)setRewardsTotalAmount:(id)a3;
- (void)setRewardsTotalCurrencyCode:(id)a3;
- (void)setSecondaryFundingSourceAmount:(id)a3;
- (void)setSecondaryFundingSourceCurrencyCode:(id)a3;
- (void)setSecondaryFundingSourceDPANSuffix:(id)a3;
- (void)setSecondaryFundingSourceDescription:(id)a3;
- (void)setSecondaryFundingSourceFPANIdentifier:(id)a3;
- (void)setSecondaryFundingSourceNetwork:(int64_t)a3;
- (void)setSecondaryFundingSourceType:(int64_t)a3;
- (void)setSendDeviceScoreIdentifier:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setServicingEvents:(id)a3;
- (void)setShouldSuppressDate:(BOOL)a3;
- (void)setStartStation:(id)a3;
- (void)setStartStationCode:(id)a3;
- (void)setStartStationLatitude:(double)a3;
- (void)setStartStationLocation:(id)a3;
- (void)setStartStationLongitude:(double)a3;
- (void)setStationCodeProvider:(id)a3;
- (void)setSubtotalAmount:(id)a3;
- (void)setSuppressBehavior:(unint64_t)a3;
- (void)setSuppressNotifications:(BOOL)a3;
- (void)setTechnologyType:(int64_t)a3;
- (void)setTimeZone:(id)a3;
- (void)setTopUpType:(int64_t)a3;
- (void)setTransactionDate:(id)a3;
- (void)setTransactionDeclinedReason:(int64_t)a3;
- (void)setTransactionSource:(unint64_t)a3;
- (void)setTransactionSourceIdentifier:(id)a3;
- (void)setTransactionStatus:(int64_t)a3;
- (void)setTransactionStatusChangedDate:(id)a3;
- (void)setTransactionType:(int64_t)a3;
- (void)setTransfers:(id)a3;
- (void)setTransitModifiers:(unint64_t)a3;
- (void)setTransitType:(int64_t)a3;
- (void)setUpdateSequenceNumber:(int64_t)a3;
@end

@implementation PKPaymentTransaction

+ (PKPaymentTransaction)paymentTransactionWithSource:(unint64_t)a3
{
  v4 = objc_alloc_init(PKPaymentTransaction);
  [(PKPaymentTransaction *)v4 setTransactionSource:a3];
  return v4;
}

+ (PKPaymentTransaction)paymentTransactionWithSource:(unint64_t)a3 dictionary:(id)a4 unitDictionary:(id)a5 balanceLabelDictionary:(id)a6 planLabelDictionary:(id)a7 hasNotificationServiceData:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v123 = a5;
  id v120 = a6;
  id v122 = a7;
  id v118 = [a1 paymentTransactionWithSource:a3];
  id v15 = v14;
  v16 = (void *)[v15 mutableCopy];
  v17 = [v15 valueForKey:@"identifier"];
  v18 = [v15 valueForKey:@"transactionIdentifier"];
  if (v17)
  {
    [v16 removeObjectForKey:@"identifier"];
    [v16 setObject:v17 forKey:@"serviceIdentifier"];
    v19 = v118;
  }
  else
  {
    v20 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_190E10000, v20, OS_LOG_TYPE_ERROR, "Transaction payload received from a provider without an 'identifier'. Please file a Radar.", buf, 2u);
    }

    v19 = v118;
    if (PKTransactionDebugDetailsEnabled())
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v142 = v15;
        _os_log_error_impl(&dword_190E10000, v20, OS_LOG_TYPE_ERROR, "Invalid Transaction Payload: %{public}@", buf, 0xCu);
      }
    }
  }
  if (v18)
  {
    [v16 removeObjectForKey:@"transactionIdentifier"];
    [v16 setObject:v18 forKey:@"paymentHash"];
  }
  v21 = (void *)[v16 copy];

  v22 = [v21 PKStringForKey:@"serviceIdentifier"];
  uint64_t v23 = [v21 PKStringForKey:@"paymentHash"];
  v113 = v22;
  v24 = [v22 uppercaseString];
  [v19 setServiceIdentifier:v24];

  v112 = (void *)v23;
  [v19 setPaymentHash:v23];
  v25 = [v21 PKStringForKey:@"currencyCode"];
  [v19 setCurrencyCode:v25];

  v26 = [v21 PKDateForKey:@"transactionDate"];
  [v19 setTransactionDate:v26];

  v27 = [v21 PKDateForKey:@"transactionStatusChangedDate"];
  [v19 setTransactionStatusChangedDate:v27];

  [v19 setHasNotificationServiceData:v8];
  v28 = [v21 PKStringForKey:@"panIdentifier"];
  [v19 setPANIdentifier:v28];

  uint64_t v29 = [v21 PKStringForKey:@"merchantName"];
  uint64_t v30 = [v21 PKStringForKey:@"rawMerchantName"];
  v114 = [v21 PKStringForKey:@"industryCategory"];
  v119 = v21;
  v31 = [v21 PKNumberForKey:@"industryCode"];
  v115 = (void *)v30;
  if (v29 | v30)
  {
    v32 = objc_alloc_init(PKMerchant);
    [(PKMerchant *)v32 setName:v29];
    [(PKMerchant *)v32 setRawName:v115];
    [(PKMerchant *)v32 setIndustryCategory:v114];
    if (v31) {
      -[PKMerchant setIndustryCode:](v32, "setIndustryCode:", [v31 integerValue]);
    }
    [v19 setMerchant:v32];
  }
  v33 = [v21 PKStringForKey:@"transactionType"];
  v117 = [v21 PKStringForKey:@"transactionStatus"];
  if (v33) {
    [v19 setTransactionType:PKPaymentTransactionTypeFromString(v33)];
  }
  v109 = v33;
  if (v117) {
    [v19 setTransactionStatus:PKPaymentTransactionStatusFromString(v117)];
  }
  v110 = v31;
  if ([v19 transactionType] == 2)
  {
    v34 = [v21 PKStringForKey:@"transitSubtype"];
    [v19 setTransitType:PKPaymentTransactionTransitSubtypeFromString(v34)];

    v35 = [v21 PKStringForKey:@"stationCodeProvider"];
    [v19 setStationCodeProvider:v35];

    v36 = [v21 PKNumberForKey:@"cityCode"];
    [v19 setCityCode:v36];

    v37 = [v21 PKStringForKey:@"startStationCode"];
    v38 = objc_msgSend(v37, "pk_decodeHexadecimal");
    [v19 setStartStationCode:v38];

    v39 = [v21 PKStringForKey:@"endStationCode"];
    v40 = objc_msgSend(v39, "pk_decodeHexadecimal");
    [v19 setEndStationCode:v40];

    v41 = [v21 PKStringForKey:@"startStation"];
    [v19 setStartStation:v41];

    v42 = [v21 PKStringForKey:@"endStation"];
    [v19 setEndStation:v42];

    v43 = [v19 startStation];
    if (v43)
    {
      v44 = [v19 endStation];
      if (v44) {
        goto LABEL_26;
      }
      v40 = [v19 endStationCode];
      if (!v40) {
        goto LABEL_26;
      }
    }
    uint64_t v45 = [v19 endStation];
    if (!v45)
    {
      if (v43)
      {
      }
      goto LABEL_29;
    }
    v46 = (void *)v45;
    v47 = [v19 startStation];
    if (!v47)
    {
      v107 = [v19 startStationCode];

      if (v43)
      {
      }
      if (v107) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }

    v44 = v40;
    if (v43) {
LABEL_26:
    }

LABEL_28:
    [v19 setProcessedForStations:1];
LABEL_29:
    objc_msgSend(v19, "setEnRoute:", objc_msgSend(v21, "PKBoolForKey:", @"isInStation"));
    v48 = [v21 PKArrayContaining:objc_opt_class() forKey:@"transitModifiers"];
    v49 = v48;
    if (v48)
    {
      if ([v48 containsObject:@"TransferDiscount"]) {
        uint64_t v50 = 2;
      }
      else {
        uint64_t v50 = 0;
      }
      uint64_t v51 = v50 | [v49 containsObject:@"CommuteDiscount"];
      if ([v49 containsObject:@"FareCapped"]) {
        v51 |= 4uLL;
      }
      if ([v49 containsObject:@"FareAdjustment"]) {
        v51 |= 8uLL;
      }
      if ([v49 containsObject:@"FareRebate"]) {
        uint64_t v52 = v51 | 0x10;
      }
      else {
        uint64_t v52 = v51;
      }
    }
    else
    {
      uint64_t v52 = 0;
    }
    [v19 setTransitModifiers:v52];
  }
  v53 = [v21 PKDecimalNumberForKey:@"amount"];
  v116 = [v21 PKDecimalNumberForKey:@"amountAddedToAuth"];
  if (v53)
  {
    v54 = PKCurrencyDecimalAmountRound(v53);
    [v19 setAmount:v54];
  }
  v108 = v53;
  v111 = (void *)v29;
  if (v116)
  {
    v55 = PKCurrencyDecimalAmountRound(v116);
    [v19 setAmountAddedToAuth:v55];
  }
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v21 PKArrayForKey:@"amounts"];
  v121 = v56;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    uint64_t v57 = [obj countByEnumeratingWithState:&v135 objects:v140 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v136;
      uint64_t v125 = *(void *)v136;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v136 != v59) {
            objc_enumerationMutation(obj);
          }
          v61 = *(void **)(*((void *)&v135 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v62 = [v61 PKDecimalNumberForKey:@"amount"];
            if (!v62)
            {
              v62 = [v61 PKDecimalNumberForKey:@"value"];
            }
            v63 = [v61 PKStringForKey:@"currency"];
            if (!v63)
            {
              v63 = [v61 PKStringForKey:@"currencyCode"];
              if (!v63) {
                v63 = @"XXX";
              }
            }
            uint64_t v64 = [v61 PKIntegerForKey:@"exponent"];
            v65 = [v61 PKStringForKey:@"identifier"];
            uint64_t v66 = [v61 PKStringForKey:@"label"];
            if (v66)
            {
              v67 = (void *)v66;
              goto LABEL_60;
            }
            v67 = [v61 PKStringForKey:@"localizedTitle"];
            if (v67 || !v65)
            {
LABEL_60:
              if (v65) {
                goto LABEL_61;
              }
            }
            else
            {
              v67 = [v120 objectForKeyedSubscript:v65];
              if (!v67)
              {
                v67 = [v122 objectForKeyedSubscript:v65];
              }
LABEL_61:
              v68 = [v123 objectForKeyedSubscript:v65];
              if (v68)
              {
                v69 = v68;
                PKLocalizedPaymentUnitKeyForType([v68 integerValue]);
                uint64_t v124 = v64;
                v70 = (NSString *)objc_claimAutoreleasedReturnValue();
                [(NSDecimalNumber *)v62 pk_absoluteValue];
                v72 = uint64_t v71 = v58;
                v73 = PKLocalizedPaymentString(v70, &cfstr_Lu.isa, [v72 unsignedLongValue]);

                uint64_t v58 = v71;
                v74 = [[PKCurrencyAmount alloc] initWithAmount:v62 exponent:v124 preformattedString:v73];

                id v56 = v121;
                if (!v74)
                {
LABEL_72:
                  v75 = 0;
                  goto LABEL_73;
                }
LABEL_66:
                v75 = [[PKTransactionAmount alloc] initWithCurrencyAmount:v74 label:v67];
LABEL_73:
                [v56 safelyAddObject:v75];

                uint64_t v59 = v125;
                continue;
              }
            }
            if (!v62)
            {
              v74 = 0;
              v69 = 0;
              goto LABEL_72;
            }
            PKCurrencyAmountCreate(v62, &v63->isa, v64);
            v74 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
            v69 = 0;
            if (!v74) {
              goto LABEL_72;
            }
            goto LABEL_66;
          }
        }
        uint64_t v58 = [obj countByEnumeratingWithState:&v135 objects:v140 count:16];
      }
      while (v58);
    }
  }
  v76 = (void *)[v56 copy];
  [v118 setAmounts:v76];

  id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v78 = [v119 PKArrayForKey:@"plans"];
  v79 = v78;
  if (v78)
  {
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    uint64_t v80 = [v78 countByEnumeratingWithState:&v131 objects:v139 count:16];
    if (v80)
    {
      uint64_t v81 = v80;
      uint64_t v82 = *(void *)v132;
      do
      {
        for (uint64_t j = 0; j != v81; ++j)
        {
          if (*(void *)v132 != v82) {
            objc_enumerationMutation(v79);
          }
          uint64_t v84 = *(void *)(*((void *)&v131 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v85 = [[PKTransactionCommutePlanUnit alloc] initWithDictionary:v84];
            v86 = [(PKTransactionCommutePlanUnit *)v85 label];

            if (!v86)
            {
              v87 = [(PKTransactionCommutePlanUnit *)v85 identifier];
              v88 = [v122 objectForKeyedSubscript:v87];

              if (v88) {
                [(PKTransactionCommutePlanUnit *)v85 setLabel:v88];
              }
            }
            [v77 safelyAddObject:v85];
          }
        }
        uint64_t v81 = [v79 countByEnumeratingWithState:&v131 objects:v139 count:16];
      }
      while (v81);
    }
  }
  v89 = (void *)[v77 copy];
  [v118 setPlans:v89];

  v90 = [v119 PKStringForKey:@"barcodeIdentifier"];
  [v118 setBarcodeIdentifier:v90];

  v91 = [PKTransactionAuthenticationContext alloc];
  v92 = [v119 PKDictionaryForKey:@"authenticationDetails"];
  v93 = [(PKTransactionAuthenticationContext *)v91 initWithDictionary:v92];
  [v118 setAuthenticationContext:v93];

  v94 = [v119 PKStringForKey:@"primaryFundingSourceDescription"];
  [v118 setPrimaryFundingSourceDescription:v94];

  v95 = [v119 PKDecimalNumberForKey:@"nominalAmount"];
  v96 = v95;
  if (v95)
  {
    v97 = PKCurrencyDecimalAmountRound(v95);
    [v118 setNominalAmount:v97];
  }
  objc_msgSend(v118, "setHasAdditionalOffers:", objc_msgSend(v119, "PKBoolForKey:", @"hasAdditionalOffers"));
  id v98 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v99 = [v119 PKArrayForKey:@"awards"];
  if (v99)
  {
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __149__PKPaymentTransaction_paymentTransactionWithSource_dictionary_unitDictionary_balanceLabelDictionary_planLabelDictionary_hasNotificationServiceData___block_invoke;
    v129[3] = &unk_1E56EEAA0;
    id v100 = v98;
    id v130 = v100;
    [v99 enumerateObjectsUsingBlock:v129];
    v101 = (void *)[v100 copy];
    [v118 setAwards:v101];
  }
  id v102 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v103 = [v119 PKArrayForKey:@"amountModifiers"];
  if (v103)
  {
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __149__PKPaymentTransaction_paymentTransactionWithSource_dictionary_unitDictionary_balanceLabelDictionary_planLabelDictionary_hasNotificationServiceData___block_invoke_2;
    v127[3] = &unk_1E56EEAA0;
    id v104 = v102;
    id v128 = v104;
    [v103 enumerateObjectsUsingBlock:v127];
    v105 = (void *)[v104 copy];
    [v118 setAmountModifiers:v105];
  }
  return (PKPaymentTransaction *)v118;
}

void __149__PKPaymentTransaction_paymentTransactionWithSource_dictionary_unitDictionary_balanceLabelDictionary_planLabelDictionary_hasNotificationServiceData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[PKPaymentTransactionAward alloc] initWithDictionary:v3];

  [*(id *)(a1 + 32) safelyAddObject:v4];
}

void __149__PKPaymentTransaction_paymentTransactionWithSource_dictionary_unitDictionary_balanceLabelDictionary_planLabelDictionary_hasNotificationServiceData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[PKPaymentTransactionAmountModifier alloc] initWithDictionary:v3];

  [*(id *)(a1 + 32) safelyAddObject:v4];
}

- (PKPaymentTransaction)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentTransaction;
  v2 = [(PKPaymentTransaction *)&v7 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  [v3 setObject:self->_serviceIdentifier forKeyedSubscript:@"serviceIdentifier"];
  [v3 setObject:self->_paymentHash forKeyedSubscript:@"paymentHash"];
  uint64_t v4 = [(NSDecimalNumber *)self->_amount stringValue];
  [v3 setObject:v4 forKeyedSubscript:@"amount"];

  v5 = [(NSDecimalNumber *)self->_subtotalAmount stringValue];
  [v3 setObject:v5 forKeyedSubscript:@"subtotalAmount"];

  v6 = [(NSDecimalNumber *)self->_amountAddedToAuth stringValue];
  [v3 setObject:v6 forKeyedSubscript:@"amountAddedToAuth"];

  [v3 setObject:self->_currencyCode forKeyedSubscript:@"currencyCode"];
  objc_super v7 = [(NSArray *)self->_amounts pk_arrayByApplyingBlock:&__block_literal_global_206];
  [v3 setObject:v7 forKeyedSubscript:@"amounts"];

  BOOL v8 = [(NSArray *)self->_plans pk_arrayByApplyingBlock:&__block_literal_global_971];
  [v3 setObject:v8 forKeyedSubscript:@"plans"];

  transactionDate = self->_transactionDate;
  if (transactionDate)
  {
    v10 = PKW3CDateStringFromDate(transactionDate);
    [v3 setObject:v10 forKeyedSubscript:@"transactionDate"];
  }
  transactionStatusChangedDate = self->_transactionStatusChangedDate;
  if (transactionStatusChangedDate)
  {
    v12 = PKW3CDateStringFromDate(transactionStatusChangedDate);
    [v3 setObject:v12 forKeyedSubscript:@"transactionStatusChangedDate"];
  }
  v13 = PKW3CDateStringFromDate(self->_expirationDate);
  [v3 setObject:v13 forKeyedSubscript:@"expirationDate"];

  id v14 = [(PKMerchant *)self->_merchant jsonDictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"merchant"];

  if (self->_transitType)
  {
    id v15 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v15 forKeyedSubscript:@"transitType"];
  }
  if (self->_transitModifiers)
  {
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v16 forKeyedSubscript:@"transitModifiers"];
  }
  if (self->_enRoute)
  {
    v17 = [NSNumber numberWithBool:1];
    [v3 setObject:v17 forKeyedSubscript:@"enRoute"];
  }
  if (self->_shouldSuppressDate)
  {
    v18 = [NSNumber numberWithBool:1];
    [v3 setObject:v18 forKeyedSubscript:@"shouldSuppressDate"];
  }
  [v3 setObject:self->_stationCodeProvider forKeyedSubscript:@"stationCodeProvider"];
  v19 = [(NSData *)self->_startStationCode hexEncoding];
  [v3 setObject:v19 forKeyedSubscript:@"startStationCode"];

  [v3 setObject:self->_startStation forKeyedSubscript:@"startStation"];
  v20 = [NSNumber numberWithDouble:self->_startStationLatitude];
  [v3 setObject:v20 forKeyedSubscript:@"startStationLatitude"];

  v21 = [NSNumber numberWithDouble:self->_startStationLongitude];
  [v3 setObject:v21 forKeyedSubscript:@"startStationLongitude"];

  v22 = [(NSData *)self->_endStationCode hexEncoding];
  [v3 setObject:v22 forKeyedSubscript:@"endStationCode"];

  [v3 setObject:self->_endStation forKeyedSubscript:@"endStation"];
  uint64_t v23 = [NSNumber numberWithDouble:self->_endStationLatitude];
  [v3 setObject:v23 forKeyedSubscript:@"endStationLatitude"];

  v24 = [NSNumber numberWithDouble:self->_endStationLongitude];
  [v3 setObject:v24 forKeyedSubscript:@"endStationLongitude"];

  [v3 setObject:self->_cityCode forKeyedSubscript:@"cityCode"];
  switch(self->_adjustmentType)
  {
    case 0:
      v25 = v3;
      v26 = 0;
      goto LABEL_37;
    case 1:
      v26 = @"provisionalDispute";
      goto LABEL_36;
    case 2:
      v26 = @"provisionalDisputeReversal";
      goto LABEL_36;
    case 3:
      v26 = @"disputeFinal";
      goto LABEL_36;
    case 4:
      v26 = @"chargebackCredit";
      goto LABEL_36;
    case 5:
      v26 = @"merchantAdjustment";
      goto LABEL_36;
    case 6:
      v26 = @"balanceWriteoff";
      goto LABEL_36;
    case 7:
      v26 = @"courtesy";
      goto LABEL_36;
    case 8:
      v26 = @"forfeiture";
      goto LABEL_36;
    case 9:
      v26 = @"withdrawalReversal";
      goto LABEL_36;
    case 0xALL:
      v26 = @"checkIssued";
      goto LABEL_36;
    case 0xBLL:
      v26 = @"feeReversal";
      goto LABEL_36;
    case 0xCLL:
      v26 = @"interestReversal";
      goto LABEL_36;
    case 0xDLL:
      v26 = @"credit";
      goto LABEL_36;
    case 0xELL:
      v26 = @"creditReversal";
      goto LABEL_36;
    case 0xFLL:
      v26 = @"refund";
      goto LABEL_36;
    case 0x10:
      v26 = @"refundReversal";
      goto LABEL_36;
    case 0x11:
      v26 = @"other";
      goto LABEL_36;
    case 0x12:
      v26 = @"debitReversal";
      goto LABEL_36;
    case 0x13:
      v26 = @"redemptionReversal";
      goto LABEL_36;
    case 0x14:
      v26 = @"debit";
      goto LABEL_36;
    default:
      v26 = @"unknown";
LABEL_36:
      v25 = v3;
LABEL_37:
      [v25 setObject:v26 forKeyedSubscript:@"adjustmentType"];
      unint64_t accountType = self->_accountType;
      v28 = @"unknown";
      if (accountType <= 4) {
        v28 = off_1E56F4418[accountType];
      }
      [v3 setObject:v28 forKeyedSubscript:@"accountType"];
      uint64_t v29 = @"send";
      switch(self->_peerPaymentType)
      {
        case 0:
          uint64_t v30 = v3;
          uint64_t v29 = 0;
          goto LABEL_48;
        case 1:
          goto LABEL_47;
        case 2:
          uint64_t v29 = @"receive";
          goto LABEL_47;
        case 3:
          uint64_t v29 = @"request";
          goto LABEL_47;
        case 4:
          uint64_t v29 = @"upcomingPayment";
          goto LABEL_47;
        case 5:
          uint64_t v29 = @"recurringPayment";
          goto LABEL_47;
        case 6:
          uint64_t v29 = @"thresholdTopUp";
          goto LABEL_47;
        default:
          uint64_t v29 = @"unknown";
LABEL_47:
          uint64_t v30 = v3;
LABEL_48:
          [v30 setObject:v29 forKeyedSubscript:@"peerPaymentType"];
          [v3 setObject:self->_peerPaymentCounterpartHandle forKeyedSubscript:@"peerPaymentCounterpartHandle"];
          [v3 setObject:self->_peerPaymentMemo forKeyedSubscript:@"peerPaymentMemo"];
          v31 = PKW3CDateStringFromDate(self->_peerPaymentMessageReceivedDate);
          [v3 setObject:v31 forKeyedSubscript:@"peerPaymentMessageReceivedDate"];

          v32 = [(PKPaymentTransactionForeignExchangeInformation *)self->_foreignExchangeInformation jsonDictionaryRepresentation];
          [v3 setObject:v32 forKeyedSubscript:@"foreignExchangeInformation"];

          v33 = [(PKPaymentTransactionFees *)self->_fees jsonArrayRepresentation];
          [v3 setObject:v33 forKeyedSubscript:@"fees"];

          v34 = [(NSDecimalNumber *)self->_primaryFundingSourceAmount stringValue];
          [v3 setObject:v34 forKeyedSubscript:@"primaryFundingSourceAmount"];

          [v3 setObject:self->_primaryFundingSourceCurrencyCode forKeyedSubscript:@"primaryFundingSourceCurrencyCode"];
          v35 = [(NSDecimalNumber *)self->_secondaryFundingSourceAmount stringValue];
          [v3 setObject:v35 forKeyedSubscript:@"secondaryFundingSourceAmount"];

          [v3 setObject:self->_secondaryFundingSourceCurrencyCode forKeyedSubscript:@"secondaryFundingSourceCurrencyCode"];
          v36 = PKPaymentNetworkNameForPaymentCredentialType(self->_secondaryFundingSourceNetwork);
          [v3 setObject:v36 forKeyedSubscript:@"secondaryFundingSourceNetwork"];

          [v3 setObject:self->_secondaryFundingSourceDPANSuffix forKeyedSubscript:@"secondaryFundingSourceDPANSuffix"];
          [v3 setObject:self->_secondaryFundingSourceFPANIdentifier forKeyedSubscript:@"secondaryFundingSourceFPANIdentifier"];
          [v3 setObject:self->_secondaryFundingSourceDescription forKeyedSubscript:@"secondaryFundingSourceDescription"];
          int64_t secondaryFundingSourceType = self->_secondaryFundingSourceType;
          v38 = @"bankAccount";
          if (secondaryFundingSourceType == 2) {
            v38 = @"debit";
          }
          if (secondaryFundingSourceType) {
            v39 = v38;
          }
          else {
            v39 = @"unknown";
          }
          v40 = v39;
          [v3 setObject:v40 forKeyedSubscript:@"secondaryFundingSourceType"];

          v41 = [(NSUUID *)self->_requestDeviceScoreIdentifier UUIDString];
          [v3 setObject:v41 forKeyedSubscript:@"requestDeviceScoreIdentifier"];

          v42 = [(NSUUID *)self->_sendDeviceScoreIdentifier UUIDString];
          [v3 setObject:v42 forKeyedSubscript:@"sendDeviceScoreIdentifier"];

          if (self->_deviceScoreIdentifiersRequired)
          {
            v43 = [NSNumber numberWithBool:1];
            [v3 setObject:v43 forKeyedSubscript:@"deviceScoreIdentifiersRequired"];
          }
          if (self->_deviceScoreIdentifiersSubmitted)
          {
            v44 = [NSNumber numberWithBool:1];
            [v3 setObject:v44 forKeyedSubscript:@"deviceScoreIdentifiersSubmitted"];
          }
          [v3 setObject:self->_merchantProvidedDescription forKeyedSubscript:@"merchantProvidedDescription"];
          [v3 setObject:self->_merchantProvidedTitle forKeyedSubscript:@"merchantProvidedTitle"];
          [v3 setObject:self->_metadata forKeyedSubscript:@"metadata"];
          uint64_t v45 = [NSNumber numberWithBool:self->_processedForLocation];
          [v3 setObject:v45 forKeyedSubscript:@"processedForLocation"];

          v46 = [NSNumber numberWithBool:self->_processedForMerchantCleanup];
          [v3 setObject:v46 forKeyedSubscript:@"processedForMerchantCleanup"];

          v47 = [NSNumber numberWithBool:self->_requiresMerchantReprocessing];
          [v3 setObject:v47 forKeyedSubscript:@"requiresMerchantReprocessing"];

          v48 = PKW3CDateStringFromDate(self->_lastMerchantReprocessingDate);
          [v3 setObject:v48 forKeyedSubscript:@"lastMerchantReprocessingDate"];

          v49 = [NSNumber numberWithBool:self->_processedForStations];
          [v3 setObject:v49 forKeyedSubscript:@"processedForStations"];

          uint64_t v50 = [NSNumber numberWithBool:self->_hasAssociatedPaymentApplication];
          [v3 setObject:v50 forKeyedSubscript:@"hasAssociatedPaymentApplication"];

          uint64_t v51 = [NSNumber numberWithBool:self->_hasNotificationServiceData];
          [v3 setObject:v51 forKeyedSubscript:@"hasNotificationServiceData"];

          uint64_t v52 = objc_msgSend(NSNumber, "numberWithBool:", -[PKPaymentTransaction hasBackingData](self, "hasBackingData"));
          [v3 setObject:v52 forKeyedSubscript:@"hasBackingData"];

          v53 = PKPaymentTransactionStatusToString(self->_transactionStatus);
          [v3 setObject:v53 forKeyedSubscript:@"transactionStatus"];

          v54 = PKPaymentTransactionDeclinedReasonToString(self->_transactionDeclinedReason);
          [v3 setObject:v54 forKeyedSubscript:@"transactionDeclinedReason"];

          v55 = PKPaymentTransactionTypeToString(self->_transactionType);
          [v3 setObject:v55 forKeyedSubscript:@"transactionType"];

          if (self->_technologyType)
          {
            id v56 = objc_msgSend(NSNumber, "numberWithInteger:");
            [v3 setObject:v56 forKeyedSubscript:@"technologyType"];
          }
          if (self->_transactionSource)
          {
            uint64_t v57 = [(PKPaymentTransaction *)self _transactionSourceString];
            [v3 setObject:v57 forKeyedSubscript:@"transactionSource"];
          }
          uint64_t v58 = [NSNumber numberWithUnsignedInteger:self->_updateReasons];
          [v3 setObject:v58 forKeyedSubscript:@"updateReasons"];

          [v3 setObject:self->_localizedTypeDescription forKeyedSubscript:@"localizedTypeDescription"];
          uint64_t v59 = [(NSURL *)self->_bankConnectDigitalServicingURL absoluteString];
          [v3 setObject:v59 forKeyedSubscript:@"bankConnectDigitalServicingURL"];

          v60 = [(NSURL *)self->_bankConnectPayNowURL absoluteString];
          [v3 setObject:v60 forKeyedSubscript:@"bankConnectPayNowURL"];

          v61 = [(NSURL *)self->_bankConnectTransferFundsURL absoluteString];
          [v3 setObject:v61 forKeyedSubscript:@"bankConnectTransferFundsURL"];

          v62 = [(NSURL *)self->_bankConnectPostInstallmentURL absoluteString];
          [v3 setObject:v62 forKeyedSubscript:@"bankConnectPostInstallmentURL"];

          v63 = [(NSURL *)self->_bankConnectRedeemRewardsURL absoluteString];
          [v3 setObject:v63 forKeyedSubscript:@"bankConnectRedeemRewardsURL"];

          uint64_t v64 = [NSNumber numberWithBool:self->_isBankConnectTransaction];
          [v3 setObject:v64 forKeyedSubscript:@"isBankConnectTransaction"];

          v65 = [NSNumber numberWithBool:self->_bankConnectTransactionWasClassifiedByMaps];
          [v3 setObject:v65 forKeyedSubscript:@"bankConnectTransactionWasClassifiedByMaps"];

          uint64_t v66 = [NSNumber numberWithInteger:self->_bankConnectCreditDebitIndicator];
          [v3 setObject:v66 forKeyedSubscript:@"bankConnectCreditDebitIndicator"];

          v67 = [NSNumber numberWithBool:self->_bankConnectRoundTransactionDate];
          [v3 setObject:v67 forKeyedSubscript:@"bankConnectRoundTransactionDate"];

          if (self->_locationLatitude != 0.0
            || self->_locationLongitude != 0.0
            || self->_locationDate
            || self->_administrativeArea
            || self->_locality
            || self->_locationHorizontalAccuracy != 0.0
            || self->_locationVerticalAccuracy != 0.0
            || self->_timeZone)
          {
            id v68 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            locationDate = self->_locationDate;
            if (locationDate)
            {
              v70 = PKW3CDateStringFromDate(locationDate);
              [v68 setObject:v70 forKeyedSubscript:@"locationDate"];
            }
            uint64_t v71 = [NSNumber numberWithDouble:self->_locationLatitude];
            [v68 setObject:v71 forKeyedSubscript:@"locationLatitude"];

            v72 = [NSNumber numberWithDouble:self->_locationLongitude];
            [v68 setObject:v72 forKeyedSubscript:@"locationLongitude"];

            v73 = [NSNumber numberWithDouble:self->_locationAltitude];
            [v68 setObject:v73 forKeyedSubscript:@"locationAltitude"];

            v74 = [NSNumber numberWithDouble:self->_locationHorizontalAccuracy];
            [v68 setObject:v74 forKeyedSubscript:@"locationHorizontalAccuracy"];

            v75 = [NSNumber numberWithDouble:self->_locationVerticalAccuracy];
            [v68 setObject:v75 forKeyedSubscript:@"locationVerticalAccuracy"];

            [v68 setObject:self->_administrativeArea forKeyedSubscript:@"administrativeArea"];
            [v68 setObject:self->_locality forKeyedSubscript:@"locality"];
            v76 = [(NSTimeZone *)self->_timeZone name];
            [v68 setObject:v76 forKeyedSubscript:@"timeZone"];

            id v77 = [NSNumber numberWithBool:self->_coarseLocation];
            [v68 setObject:v77 forKeyedSubscript:@"isCoarseLocation"];

            v78 = (void *)[v68 copy];
            [v3 setObject:v78 forKeyedSubscript:@"location"];
          }
          if (self->_requiresLocation) {
            v79 = @"YES";
          }
          else {
            v79 = @"NO";
          }
          [v3 setObject:v79 forKeyedSubscript:@"requiresLocation"];
          uint64_t v80 = [(PKPaymentTransactionRewards *)self->_rewards jsonArrayRepresentation];
          [v3 setObject:v80 forKeyedSubscript:@"rewards"];

          uint64_t v81 = [(NSDecimalNumber *)self->_rewardsTotalAmount stringValue];
          [v3 setObject:v81 forKeyedSubscript:@"rewardsTotalAmount"];

          [v3 setObject:self->_rewardsTotalCurrencyCode forKeyedSubscript:@"rewardsTotalCurrencyCode"];
          unint64_t rewardsEligibilityReason = self->_rewardsEligibilityReason;
          if (rewardsEligibilityReason > 2) {
            v83 = @"unknown";
          }
          else {
            v83 = off_1E56F42F8[rewardsEligibilityReason];
          }
          [v3 setObject:v83 forKeyedSubscript:@"rewardsEligibilityReason"];
          uint64_t v84 = PKAccountRewardRedemptionTypeToString(self->_redemptionType);
          [v3 setObject:v84 forKeyedSubscript:@"redemptionType"];

          uint64_t v85 = [(PKPaymentTransactionRewards *)self->_rewardsInProgress jsonArrayRepresentation];
          v86 = (void *)v85;
          if (v85) {
            uint64_t v87 = v85;
          }
          else {
            uint64_t v87 = MEMORY[0x1E4F1CBF0];
          }
          [v3 setObject:v87 forKeyedSubscript:@"rewardsInProgress"];

          v88 = [NSNumber numberWithUnsignedInteger:self->_cardType];
          [v3 setObject:v88 forKeyedSubscript:@"cardType"];

          [v3 setObject:self->_accountIdentifier forKeyedSubscript:@"accountIdentifier"];
          [v3 setObject:self->_altDSID forKeyedSubscript:@"altDSID"];
          v89 = [NSNumber numberWithBool:self->_originatedByDevice];
          [v3 setObject:v89 forKeyedSubscript:@"originatedByDevice"];

          v90 = [NSNumber numberWithBool:self->_fuzzyMatched];
          [v3 setObject:v90 forKeyedSubscript:@"isFuzzyMatched"];

          [v3 setObject:self->_receiptProviderIdentifier forKeyedSubscript:@"receiptProviderIdentifier"];
          [v3 setObject:self->_receiptIdentifier forKeyedSubscript:@"receiptIdentifier"];
          v91 = [(NSURL *)self->_receiptProviderURL absoluteString];
          [v3 setObject:v91 forKeyedSubscript:@"receiptProviderURL"];

          [v3 setObject:self->_issueReportIdentifier forKeyedSubscript:@"issueReportIdentifier"];
          [v3 setObject:self->_lifecycleIdentifier forKeyedSubscript:@"lifecycleIdentifier"];
          [v3 setObject:self->_authNetworkData forKeyedSubscript:@"authNetworkData"];
          [v3 setObject:self->_clearingNetworkData forKeyedSubscript:@"clearingNetworkData"];
          v92 = [(NSSet *)self->_questions pk_setByApplyingBlock:&__block_literal_global_1002_0];
          v93 = [v92 allObjects];
          [v3 setObject:v93 forKeyedSubscript:@"questions"];

          [v3 setObject:self->_cardIdentifier forKeyedSubscript:@"cardIdentifier"];
          [v3 setObject:self->_dpanIdentifier forKeyedSubscript:@"dpanIdentifier"];
          [v3 setObject:self->_panIdentifier forKeyedSubscript:@"panIdentifier"];
          [v3 setObject:self->_isMerchantTokenTransaction forKeyedSubscript:@"isMerchantTokenTransaction"];
          [v3 setObject:self->_cardNumberSuffix forKeyedSubscript:@"cardNumberSuffix"];
          unint64_t v94 = self->_adjustmentTypeReason - 1;
          if (v94 > 9) {
            v95 = @"unknown";
          }
          else {
            v95 = off_1E56F4380[v94];
          }
          [v3 setObject:v95 forKeyedSubscript:@"adjustmentTypeReason"];
          unint64_t topUpType = self->_topUpType;
          if (topUpType > 8) {
            v97 = 0;
          }
          else {
            v97 = off_1E56F43D0[topUpType];
          }
          [v3 setObject:v97 forKeyedSubscript:@"topUpType"];
          [v3 setObject:self->_referenceIdentifier forKeyedSubscript:@"referenceIdentifier"];
          id v98 = PKFeatureIdentifierToString(self->_associatedFeatureIdentifier);
          [v3 setObject:v98 forKeyedSubscript:@"associatedFeatureIdentifier"];

          v99 = [NSNumber numberWithUnsignedInteger:self->_suppressBehavior];
          [v3 setObject:v99 forKeyedSubscript:@"suppressBehavior"];

          if (self->_suppressNotifications) {
            id v100 = @"YES";
          }
          else {
            id v100 = @"NO";
          }
          [v3 setObject:v100 forKeyedSubscript:@"suppressNotifications"];
          if (self->_recurring) {
            v101 = @"YES";
          }
          else {
            v101 = @"NO";
          }
          [v3 setObject:v101 forKeyedSubscript:@"recurring"];
          [v3 setObject:self->_transactionSourceIdentifier forKeyedSubscript:@"transactionSourceIdentifier"];
          [v3 setObject:self->_barcodeIdentifier forKeyedSubscript:@"barcodeIdentifier"];
          id v102 = [(PKTransactionAuthenticationContext *)self->_authenticationContext dictionaryRepresentation];
          [v3 setObject:v102 forKeyedSubscript:@"authenticationContext"];

          [v3 setObject:self->_primaryFundingSourceDescription forKeyedSubscript:@"primaryFundingSourceDescription"];
          v103 = [(NSDecimalNumber *)self->_nominalAmount stringValue];
          [v3 setObject:v103 forKeyedSubscript:@"nominalAmount"];

          id v104 = [NSNumber numberWithBool:self->_hasAdditionalOffers];
          [v3 setObject:v104 forKeyedSubscript:@"hasAdditionalOffers"];

          v105 = [(NSArray *)self->_awards pk_arrayByApplyingBlock:&__block_literal_global_1023];
          [v3 setObject:v105 forKeyedSubscript:@"awards"];

          v106 = [(NSArray *)self->_amountModifiers pk_arrayByApplyingBlock:&__block_literal_global_1026];
          [v3 setObject:v106 forKeyedSubscript:@"amountModifiers"];

          switch(self->_topUpType)
          {
            case 0:
              goto LABEL_104;
            case 1:
              v107 = @"directDeposit";
              goto LABEL_103;
            case 2:
              v107 = @"atm";
              goto LABEL_103;
            case 3:
              v107 = @"transfer";
              goto LABEL_103;
            case 4:
              v107 = @"check";
              goto LABEL_103;
            case 5:
              v107 = @"inWallet";
              goto LABEL_103;
            case 6:
              v107 = @"inStore";
              goto LABEL_103;
            case 7:
              v107 = @"amp";
              goto LABEL_103;
            case 8:
              v107 = @"redemption";
              goto LABEL_103;
            default:
              v107 = 0;
LABEL_103:
              [v3 setObject:v107 forKeyedSubscript:@"topUpType"];
LABEL_104:
              v108 = [(PKTransactionReleasedData *)self->_releasedData dictionaryRepresentation];
              [v3 setObject:v108 forKeyedSubscript:@"releasedData"];

              v109 = [(NSArray *)self->_transfers pk_arrayByApplyingBlock:&__block_literal_global_1029];
              [v3 setObject:v109 forKeyedSubscript:@"transfers"];

              v110 = [(PKPeerPaymentRecurringPayment *)self->_recurringPeerPayment description];
              [v3 setObject:v110 forKeyedSubscript:@"recurringPeerPayment"];

              associatedFinancingPlan = self->_associatedFinancingPlan;
              if (associatedFinancingPlan)
              {
                v112 = [(PKPayLaterFinancingPlan *)associatedFinancingPlan dictionaryRepresentation];
                [v3 setObject:v112 forKeyedSubscript:@"associatedFinancingPlan"];
              }
              v113 = [NSNumber numberWithBool:self->_isIssuerInstallmentTransaction];
              [v3 setObject:v113 forKeyedSubscript:@"isIssuerInstallmentTransaction"];

              issuerInstallmentManagementURL = self->_issuerInstallmentManagementURL;
              if (issuerInstallmentManagementURL)
              {
                v115 = [(NSURL *)issuerInstallmentManagementURL absoluteString];
                [v3 setObject:v115 forKeyedSubscript:@"issuerInstallmentManagementURL"];
              }
              paymentRewardsRedemption = self->_paymentRewardsRedemption;
              if (paymentRewardsRedemption)
              {
                v117 = [(PKPaymentRewardsRedemption *)paymentRewardsRedemption dictionaryRepresentation];
                [v3 setObject:v117 forKeyedSubscript:@"paymentRewardsRedemption"];
              }
              id v118 = [NSNumber numberWithBool:self->_interestReassessment];
              [v3 setObject:v118 forKeyedSubscript:@"interestReassessment"];

              associatedStatementIdentifiers = self->_associatedStatementIdentifiers;
              if (associatedStatementIdentifiers)
              {
                id v120 = [(NSArray *)associatedStatementIdentifiers componentsJoinedByString:@","];
                [v3 setObject:v120 forKeyedSubscript:@"associatedStatementIdentifiers"];
              }
              int64_t paymentNetworkIdentifier = self->_paymentNetworkIdentifier;
              if (paymentNetworkIdentifier)
              {
                id v122 = PKPaymentNetworkNameForPaymentCredentialType(paymentNetworkIdentifier);
                [v3 setObject:v122 forKeyedSubscript:@"paymentNetworkIdentifier"];
              }
              else
              {
                [v3 setObject:0 forKeyedSubscript:@"paymentNetworkIdentifier"];
              }
              id v123 = [NSNumber numberWithUnsignedInteger:self->_peerPaymentPaymentMode];
              [v3 setObject:v123 forKeyedSubscript:@"peerPaymentPaymentMode"];

              [v3 setObject:self->_peerPaymentCounterpartImageRecordIdentifier forKeyedSubscript:@"peerPaymentCounterpartImageRecordIdentifier"];
              uint64_t v124 = (void *)[v3 copy];

              return v124;
          }
      }
  }
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_serviceIdentifier];
  [v3 safelyAddObject:self->_paymentHash];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_subtotalAmount];
  [v3 safelyAddObject:self->_amountAddedToAuth];
  [v3 safelyAddObject:self->_amounts];
  [v3 safelyAddObject:self->_plans];
  [v3 safelyAddObject:self->_transactionDate];
  [v3 safelyAddObject:self->_transactionStatusChangedDate];
  [v3 safelyAddObject:self->_expirationDate];
  [v3 safelyAddObject:self->_locationDate];
  [v3 safelyAddObject:self->_merchant];
  [v3 safelyAddObject:self->_locality];
  [v3 safelyAddObject:self->_administrativeArea];
  [v3 safelyAddObject:self->_timeZone];
  [v3 safelyAddObject:self->_startStationCode];
  [v3 safelyAddObject:self->_endStationCode];
  [v3 safelyAddObject:self->_startStation];
  [v3 safelyAddObject:self->_endStation];
  [v3 safelyAddObject:self->_cityCode];
  [v3 safelyAddObject:self->_peerPaymentCounterpartHandle];
  [v3 safelyAddObject:self->_peerPaymentMemo];
  [v3 safelyAddObject:self->_peerPaymentMessageReceivedDate];
  [v3 safelyAddObject:self->_fees];
  [v3 safelyAddObject:self->_foreignExchangeInformation];
  [v3 safelyAddObject:self->_primaryFundingSourceAmount];
  [v3 safelyAddObject:self->_primaryFundingSourceCurrencyCode];
  [v3 safelyAddObject:self->_secondaryFundingSourceAmount];
  [v3 safelyAddObject:self->_secondaryFundingSourceCurrencyCode];
  [v3 safelyAddObject:self->_secondaryFundingSourceDPANSuffix];
  [v3 safelyAddObject:self->_secondaryFundingSourceFPANIdentifier];
  [v3 safelyAddObject:self->_secondaryFundingSourceDescription];
  [v3 safelyAddObject:self->_requestDeviceScoreIdentifier];
  [v3 safelyAddObject:self->_sendDeviceScoreIdentifier];
  [v3 safelyAddObject:self->_merchantProvidedDescription];
  [v3 safelyAddObject:self->_merchantProvidedTitle];
  [v3 safelyAddObject:self->_metadata];
  [v3 safelyAddObject:self->_lastMerchantReprocessingDate];
  [v3 safelyAddObject:self->_issueReportIdentifier];
  [v3 safelyAddObject:self->_rewards];
  [v3 safelyAddObject:self->_rewardsTotalAmount];
  [v3 safelyAddObject:self->_rewardsTotalCurrencyCode];
  [v3 safelyAddObject:self->_rewardsInProgress];
  [v3 safelyAddObject:self->_localizedTypeDescription];
  [v3 safelyAddObject:self->_bankConnectDigitalServicingURL];
  [v3 safelyAddObject:self->_bankConnectPayNowURL];
  [v3 safelyAddObject:self->_bankConnectTransferFundsURL];
  [v3 safelyAddObject:self->_bankConnectPostInstallmentURL];
  [v3 safelyAddObject:self->_bankConnectRedeemRewardsURL];
  [v3 safelyAddObject:self->_bankConnectMetadata];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_altDSID];
  [v3 safelyAddObject:self->_lifecycleIdentifier];
  [v3 safelyAddObject:self->_transactionSourceIdentifier];
  [v3 safelyAddObject:self->_authNetworkData];
  [v3 safelyAddObject:self->_clearingNetworkData];
  [v3 safelyAddObject:self->_questions];
  [v3 safelyAddObject:self->_cardIdentifier];
  [v3 safelyAddObject:self->_dpanIdentifier];
  [v3 safelyAddObject:self->_panIdentifier];
  [v3 safelyAddObject:self->_isMerchantTokenTransaction];
  [v3 safelyAddObject:self->_cardNumberSuffix];
  [v3 safelyAddObject:self->_referenceIdentifier];
  [v3 safelyAddObject:self->_receiptProviderURL];
  [v3 safelyAddObject:self->_receiptProviderIdentifier];
  [v3 safelyAddObject:self->_receiptIdentifier];
  [v3 safelyAddObject:self->_barcodeIdentifier];
  [v3 safelyAddObject:self->_authenticationContext];
  [v3 safelyAddObject:self->_primaryFundingSourceDescription];
  [v3 safelyAddObject:self->_nominalAmount];
  [v3 safelyAddObject:self->_awards];
  [v3 safelyAddObject:self->_amountModifiers];
  [v3 safelyAddObject:self->_releasedData];
  [v3 safelyAddObject:self->_associatedFinancingPlan];
  [v3 safelyAddObject:self->_issuerInstallmentManagementURL];
  [v3 safelyAddObject:self->_paymentRewardsRedemption];
  [v3 safelyAddObject:self->_associatedStatementIdentifiers];
  [v3 safelyAddObject:self->_peerPaymentCounterpartImageRecordIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_transactionType - v4 + 32 * v4;
  unint64_t v6 = self->_transactionSource - v5 + 32 * v5;
  int64_t v7 = self->_transactionStatus - v6 + 32 * v6;
  int64_t v8 = self->_transactionDeclinedReason - v7 + 32 * v7;
  int64_t v9 = self->_technologyType - v8 + 32 * v8;
  uint64_t v10 = self->_hasAssociatedPaymentApplication - v9 + 32 * v9;
  uint64_t v11 = self->_processedForLocation - v10 + 32 * v10;
  uint64_t v12 = self->_processedForStations - v11 + 32 * v11;
  uint64_t v13 = self->_processedForMerchantCleanup - v12 + 32 * v12;
  uint64_t v14 = self->_requiresMerchantReprocessing - v13 + 32 * v13;
  unint64_t v15 = (unint64_t)self->_locationLatitude - v14 + 32 * v14;
  unint64_t v16 = (unint64_t)self->_locationLongitude - v15 + 32 * v15;
  unint64_t v17 = (unint64_t)self->_locationAltitude - v16 + 32 * v16;
  unint64_t v18 = (unint64_t)self->_locationHorizontalAccuracy - v17 + 32 * v17;
  unint64_t v19 = (unint64_t)self->_locationVerticalAccuracy - v18 + 32 * v18;
  uint64_t v20 = self->_coarseLocation - v19 + 32 * v19;
  int64_t v21 = self->_transitType - v20 + 32 * v20;
  unint64_t v22 = self->_transitModifiers - v21 + 32 * v21;
  uint64_t v23 = self->_enRoute - v22 + 32 * v22;
  int64_t v24 = self->_peerPaymentType - v23 + 32 * v23;
  int64_t v25 = self->_secondaryFundingSourceNetwork - v24 + 32 * v24;
  uint64_t v26 = self->_deviceScoreIdentifiersRequired - v25 + 32 * v25;
  uint64_t v27 = self->_deviceScoreIdentifiersSubmitted - v26 + 32 * v26;
  uint64_t v28 = self->_originatedByDevice - v27 + 32 * v27;
  uint64_t v29 = self->_fuzzyMatched - v28 + 32 * v28;
  int64_t v30 = self->_secondaryFundingSourceType - v29 + 32 * v29;
  unint64_t v31 = self->_cardType - v30 + 32 * v30;
  unint64_t v32 = self->_rewardsEligibilityReason - v31 + 32 * v31;
  int64_t v33 = self->_adjustmentTypeReason - v32 + 32 * v32;
  int64_t v34 = self->_topUpType - v33 + 32 * v33;
  unint64_t v35 = self->_suppressBehavior - v34 + 32 * v34;
  int64_t v36 = self->_accountType - v35 + 32 * v35;
  unint64_t v37 = self->_associatedFeatureIdentifier - v36 + 32 * v36;
  uint64_t v38 = self->_hasAdditionalOffers - v37 + 32 * v37;
  uint64_t v39 = self->_recurring - v38 + 32 * v38;
  uint64_t v40 = self->_isBankConnectTransaction - v39 + 32 * v39;
  uint64_t v41 = self->_bankConnectTransactionWasClassifiedByMaps - v40 + 32 * v40;
  int64_t v42 = self->_bankConnectCreditDebitIndicator - v41 + 32 * v41;
  uint64_t v43 = self->_bankConnectRoundTransactionDate - v42 + 32 * v42;
  uint64_t v44 = self->_interestReassessment - v43 + 32 * v43;
  int64_t v45 = self->_paymentNetworkIdentifier - v44 + 32 * v44;
  uint64_t v46 = self->_isIssuerInstallmentTransaction - v45 + 32 * v45;
  unint64_t v47 = self->_peerPaymentPaymentMode - v46 + 32 * v46;

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPaymentTransaction *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentTransaction *)self isEqualToPaymentTransaction:v5];

  return v6;
}

- (BOOL)isEqualToPaymentTransaction:(id)a3
{
  uint64_t v4 = a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[4];
  if (identifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (identifier != v6) {
      goto LABEL_339;
    }
  }
  else
  {
    char v8 = -[NSString isEqual:](identifier, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_339;
    }
  }
  serviceIdentifier = self->_serviceIdentifier;
  uint64_t v10 = (NSString *)v4[5];
  if (serviceIdentifier && v10)
  {
    if ((-[NSString isEqual:](serviceIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (serviceIdentifier != v10)
  {
    goto LABEL_339;
  }
  paymentHash = self->_paymentHash;
  uint64_t v12 = (NSString *)v4[6];
  if (paymentHash && v12)
  {
    if ((-[NSString isEqual:](paymentHash, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (paymentHash != v12)
  {
    goto LABEL_339;
  }
  amount = self->_amount;
  uint64_t v14 = (NSDecimalNumber *)v4[7];
  if (amount && v14)
  {
    if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (amount != v14)
  {
    goto LABEL_339;
  }
  subtotalAmount = self->_subtotalAmount;
  unint64_t v16 = (NSDecimalNumber *)v4[8];
  if (subtotalAmount && v16)
  {
    if ((-[NSDecimalNumber isEqual:](subtotalAmount, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (subtotalAmount != v16)
  {
    goto LABEL_339;
  }
  amountAddedToAuth = self->_amountAddedToAuth;
  unint64_t v18 = (NSDecimalNumber *)v4[10];
  if (amountAddedToAuth && v18)
  {
    if ((-[NSDecimalNumber isEqual:](amountAddedToAuth, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (amountAddedToAuth != v18)
  {
    goto LABEL_339;
  }
  amounts = self->_amounts;
  uint64_t v20 = (NSArray *)v4[11];
  if (amounts && v20)
  {
    if ((-[NSArray isEqual:](amounts, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (amounts != v20)
  {
    goto LABEL_339;
  }
  plans = self->_plans;
  unint64_t v22 = (NSArray *)v4[12];
  if (plans && v22)
  {
    if ((-[NSArray isEqual:](plans, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (plans != v22)
  {
    goto LABEL_339;
  }
  currencyCode = self->_currencyCode;
  int64_t v24 = (NSString *)v4[9];
  if (currencyCode && v24)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (currencyCode != v24)
  {
    goto LABEL_339;
  }
  transactionDate = self->_transactionDate;
  uint64_t v26 = (NSDate *)v4[13];
  if (transactionDate && v26)
  {
    if ((-[NSDate isEqual:](transactionDate, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (transactionDate != v26)
  {
    goto LABEL_339;
  }
  transactionStatusChangedDate = self->_transactionStatusChangedDate;
  uint64_t v28 = (NSDate *)v4[14];
  if (transactionStatusChangedDate && v28)
  {
    if ((-[NSDate isEqual:](transactionStatusChangedDate, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (transactionStatusChangedDate != v28)
  {
    goto LABEL_339;
  }
  expirationDate = self->_expirationDate;
  int64_t v30 = (NSDate *)v4[15];
  if (expirationDate && v30)
  {
    if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (expirationDate != v30)
  {
    goto LABEL_339;
  }
  merchant = self->_merchant;
  unint64_t v32 = (PKMerchant *)v4[16];
  if (merchant && v32)
  {
    if (!-[PKMerchant isEqual:](merchant, "isEqual:")) {
      goto LABEL_339;
    }
  }
  else if (merchant != v32)
  {
    goto LABEL_339;
  }
  if (self->_transactionStatus != v4[113]
    || self->_transactionDeclinedReason != v4[117]
    || self->_transactionType != v4[114]
    || self->_hasNotificationServiceData != *((unsigned __int8 *)v4 + 22)
    || self->_processedForStations != *((unsigned __int8 *)v4 + 20)
    || self->_transitType != v4[26]
    || self->_transitModifiers != v4[27]
    || self->_enRoute == (*((unsigned char *)v4 + 9) == 0)
    || self->_shouldSuppressDate == (*((unsigned char *)v4 + 10) == 0))
  {
    goto LABEL_339;
  }
  startStationCode = self->_startStationCode;
  int64_t v34 = (NSData *)v4[30];
  if (startStationCode && v34)
  {
    if ((-[NSData isEqual:](startStationCode, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (startStationCode != v34)
  {
    goto LABEL_339;
  }
  endStationCode = self->_endStationCode;
  int64_t v36 = (NSData *)v4[34];
  if (endStationCode && v36)
  {
    if ((-[NSData isEqual:](endStationCode, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (endStationCode != v36)
  {
    goto LABEL_339;
  }
  startStation = self->_startStation;
  uint64_t v38 = (NSString *)v4[31];
  if (startStation && v38)
  {
    if ((-[NSString isEqual:](startStation, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (startStation != v38)
  {
    goto LABEL_339;
  }
  endStation = self->_endStation;
  uint64_t v40 = (NSString *)v4[35];
  if (endStation && v40)
  {
    if ((-[NSString isEqual:](endStation, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (endStation != v40)
  {
    goto LABEL_339;
  }
  cityCode = self->_cityCode;
  int64_t v42 = (NSNumber *)v4[29];
  if (cityCode && v42)
  {
    if ((-[NSNumber isEqual:](cityCode, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (cityCode != v42)
  {
    goto LABEL_339;
  }
  if (self->_peerPaymentType != v4[41]) {
    goto LABEL_339;
  }
  peerPaymentCounterpartHandle = self->_peerPaymentCounterpartHandle;
  uint64_t v44 = (NSString *)v4[43];
  if (peerPaymentCounterpartHandle && v44)
  {
    if ((-[NSString isEqual:](peerPaymentCounterpartHandle, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (peerPaymentCounterpartHandle != v44)
  {
    goto LABEL_339;
  }
  peerPaymentMessageReceivedDate = self->_peerPaymentMessageReceivedDate;
  uint64_t v46 = (NSDate *)v4[45];
  if (peerPaymentMessageReceivedDate && v46)
  {
    if ((-[NSDate isEqual:](peerPaymentMessageReceivedDate, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (peerPaymentMessageReceivedDate != v46)
  {
    goto LABEL_339;
  }
  foreignExchangeInformation = self->_foreignExchangeInformation;
  v48 = (PKPaymentTransactionForeignExchangeInformation *)v4[46];
  if (foreignExchangeInformation && v48)
  {
    if (!-[PKPaymentTransactionForeignExchangeInformation isEqual:](foreignExchangeInformation, "isEqual:")) {
      goto LABEL_339;
    }
  }
  else if (foreignExchangeInformation != v48)
  {
    goto LABEL_339;
  }
  fees = self->_fees;
  uint64_t v50 = (PKPaymentTransactionFees *)v4[47];
  if (fees && v50)
  {
    if (!-[PKPaymentTransactionFees isEqual:](fees, "isEqual:")) {
      goto LABEL_339;
    }
  }
  else if (fees != v50)
  {
    goto LABEL_339;
  }
  primaryFundingSourceAmount = self->_primaryFundingSourceAmount;
  uint64_t v52 = (NSDecimalNumber *)v4[56];
  if (primaryFundingSourceAmount && v52)
  {
    if ((-[NSDecimalNumber isEqual:](primaryFundingSourceAmount, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (primaryFundingSourceAmount != v52)
  {
    goto LABEL_339;
  }
  primaryFundingSourceCurrencyCode = self->_primaryFundingSourceCurrencyCode;
  v54 = (NSString *)v4[57];
  if (primaryFundingSourceCurrencyCode && v54)
  {
    if ((-[NSString isEqual:](primaryFundingSourceCurrencyCode, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (primaryFundingSourceCurrencyCode != v54)
  {
    goto LABEL_339;
  }
  secondaryFundingSourceAmount = self->_secondaryFundingSourceAmount;
  id v56 = (NSDecimalNumber *)v4[58];
  if (secondaryFundingSourceAmount && v56)
  {
    if ((-[NSDecimalNumber isEqual:](secondaryFundingSourceAmount, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (secondaryFundingSourceAmount != v56)
  {
    goto LABEL_339;
  }
  secondaryFundingSourceCurrencyCode = self->_secondaryFundingSourceCurrencyCode;
  uint64_t v58 = (NSString *)v4[59];
  if (secondaryFundingSourceCurrencyCode && v58)
  {
    if ((-[NSString isEqual:](secondaryFundingSourceCurrencyCode, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (secondaryFundingSourceCurrencyCode != v58)
  {
    goto LABEL_339;
  }
  if (self->_secondaryFundingSourceNetwork != v4[60]) {
    goto LABEL_339;
  }
  secondaryFundingSourceDPANSuffix = self->_secondaryFundingSourceDPANSuffix;
  v60 = (NSString *)v4[61];
  if (secondaryFundingSourceDPANSuffix && v60)
  {
    if ((-[NSString isEqual:](secondaryFundingSourceDPANSuffix, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (secondaryFundingSourceDPANSuffix != v60)
  {
    goto LABEL_339;
  }
  merchantProvidedDescription = self->_merchantProvidedDescription;
  v62 = (NSString *)v4[68];
  if (merchantProvidedDescription && v62)
  {
    if ((-[NSString isEqual:](merchantProvidedDescription, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (merchantProvidedDescription != v62)
  {
    goto LABEL_339;
  }
  merchantProvidedTitle = self->_merchantProvidedTitle;
  uint64_t v64 = (NSString *)v4[67];
  if (merchantProvidedTitle && v64)
  {
    if ((-[NSString isEqual:](merchantProvidedTitle, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (merchantProvidedTitle != v64)
  {
    goto LABEL_339;
  }
  if (self->_originatedByDevice != *((unsigned __int8 *)v4 + 23)
    || self->_fuzzyMatched != *((unsigned __int8 *)v4 + 24))
  {
    goto LABEL_339;
  }
  v65 = (void *)v4[103];
  uint64_t v66 = self->_receiptProviderIdentifier;
  v67 = v65;
  if (v66 == v67)
  {
  }
  else
  {
    id v68 = v67;
    if (!v66 || !v67) {
      goto LABEL_338;
    }
    BOOL v69 = [(NSString *)v66 isEqualToString:v67];

    if (!v69) {
      goto LABEL_339;
    }
  }
  v70 = (void *)v4[104];
  uint64_t v66 = self->_receiptIdentifier;
  uint64_t v71 = v70;
  if (v66 == v71)
  {
  }
  else
  {
    id v68 = v71;
    if (!v66 || !v71) {
      goto LABEL_338;
    }
    BOOL v72 = [(NSString *)v66 isEqualToString:v71];

    if (!v72) {
      goto LABEL_339;
    }
  }
  receiptProviderURL = self->_receiptProviderURL;
  v74 = (NSURL *)v4[105];
  if (receiptProviderURL && v74)
  {
    if ((-[NSURL isEqual:](receiptProviderURL, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (receiptProviderURL != v74)
  {
    goto LABEL_339;
  }
  localizedTypeDescription = self->_localizedTypeDescription;
  v76 = (NSString *)v4[48];
  if (localizedTypeDescription && v76)
  {
    if ((-[NSString isEqual:](localizedTypeDescription, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (localizedTypeDescription != v76)
  {
    goto LABEL_339;
  }
  bankConnectDigitalServicingURL = self->_bankConnectDigitalServicingURL;
  v78 = (NSURL *)v4[49];
  if (bankConnectDigitalServicingURL && v78)
  {
    if ((-[NSURL isEqual:](bankConnectDigitalServicingURL, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (bankConnectDigitalServicingURL != v78)
  {
    goto LABEL_339;
  }
  bankConnectPayNowURL = self->_bankConnectPayNowURL;
  uint64_t v80 = (NSURL *)v4[50];
  if (bankConnectPayNowURL && v80)
  {
    if ((-[NSURL isEqual:](bankConnectPayNowURL, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (bankConnectPayNowURL != v80)
  {
    goto LABEL_339;
  }
  bankConnectTransferFundsURL = self->_bankConnectTransferFundsURL;
  uint64_t v82 = (NSURL *)v4[51];
  if (bankConnectTransferFundsURL && v82)
  {
    if ((-[NSURL isEqual:](bankConnectTransferFundsURL, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (bankConnectTransferFundsURL != v82)
  {
    goto LABEL_339;
  }
  bankConnectPostInstallmentURL = self->_bankConnectPostInstallmentURL;
  uint64_t v84 = (NSURL *)v4[52];
  if (bankConnectPostInstallmentURL && v84)
  {
    if ((-[NSURL isEqual:](bankConnectPostInstallmentURL, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (bankConnectPostInstallmentURL != v84)
  {
    goto LABEL_339;
  }
  bankConnectRedeemRewardsURL = self->_bankConnectRedeemRewardsURL;
  v86 = (NSURL *)v4[53];
  if (bankConnectRedeemRewardsURL && v86)
  {
    if ((-[NSURL isEqual:](bankConnectRedeemRewardsURL, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (bankConnectRedeemRewardsURL != v86)
  {
    goto LABEL_339;
  }
  if (self->_isBankConnectTransaction != *((unsigned __int8 *)v4 + 12)
    || self->_bankConnectTransactionWasClassifiedByMaps != *((unsigned __int8 *)v4 + 13)
    || self->_bankConnectCreditDebitIndicator != v4[54]
    || self->_bankConnectRoundTransactionDate != *((unsigned __int8 *)v4 + 14))
  {
    goto LABEL_339;
  }
  bankConnectMetadata = self->_bankConnectMetadata;
  v88 = (PKPaymentTransactionBankConnectMetadata *)v4[55];
  if (bankConnectMetadata && v88)
  {
    if (!-[PKPaymentTransactionBankConnectMetadata isEqual:](bankConnectMetadata, "isEqual:")) {
      goto LABEL_339;
    }
  }
  else if (bankConnectMetadata != v88)
  {
    goto LABEL_339;
  }
  issueReportIdentifier = self->_issueReportIdentifier;
  v90 = (NSString *)v4[112];
  if (issueReportIdentifier && v90)
  {
    if ((-[NSString isEqual:](issueReportIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (issueReportIdentifier != v90)
  {
    goto LABEL_339;
  }
  rewards = self->_rewards;
  v92 = (PKPaymentTransactionRewards *)v4[72];
  if (rewards && v92)
  {
    if (!-[PKPaymentTransactionRewards isEqual:](rewards, "isEqual:")) {
      goto LABEL_339;
    }
  }
  else if (rewards != v92)
  {
    goto LABEL_339;
  }
  rewardsTotalAmount = self->_rewardsTotalAmount;
  unint64_t v94 = (NSDecimalNumber *)v4[69];
  if (rewardsTotalAmount && v94)
  {
    if ((-[NSDecimalNumber isEqual:](rewardsTotalAmount, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (rewardsTotalAmount != v94)
  {
    goto LABEL_339;
  }
  rewardsTotalCurrencyCode = self->_rewardsTotalCurrencyCode;
  v96 = (NSString *)v4[70];
  if (rewardsTotalCurrencyCode && v96)
  {
    if ((-[NSString isEqual:](rewardsTotalCurrencyCode, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (rewardsTotalCurrencyCode != v96)
  {
    goto LABEL_339;
  }
  if (self->_rewardsEligibilityReason != v4[71]) {
    goto LABEL_339;
  }
  rewardsInProgress = self->_rewardsInProgress;
  id v98 = (PKPaymentTransactionRewards *)v4[73];
  if (rewardsInProgress && v98)
  {
    if (!-[PKPaymentTransactionRewards isEqual:](rewardsInProgress, "isEqual:")) {
      goto LABEL_339;
    }
  }
  else if (rewardsInProgress != v98)
  {
    goto LABEL_339;
  }
  if (self->_cardType != v4[74]) {
    goto LABEL_339;
  }
  accountIdentifier = self->_accountIdentifier;
  id v100 = (NSString *)v4[75];
  if (accountIdentifier && v100)
  {
    if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (accountIdentifier != v100)
  {
    goto LABEL_339;
  }
  altDSID = self->_altDSID;
  id v102 = (NSString *)v4[76];
  if (altDSID && v102)
  {
    if ((-[NSString isEqual:](altDSID, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (altDSID != v102)
  {
    goto LABEL_339;
  }
  lifecycleIdentifier = self->_lifecycleIdentifier;
  id v104 = (NSString *)v4[77];
  if (lifecycleIdentifier && v104)
  {
    if ((-[NSString isEqual:](lifecycleIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (lifecycleIdentifier != v104)
  {
    goto LABEL_339;
  }
  authNetworkData = self->_authNetworkData;
  v106 = (NSString *)v4[78];
  if (authNetworkData && v106)
  {
    if ((-[NSString isEqual:](authNetworkData, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (authNetworkData != v106)
  {
    goto LABEL_339;
  }
  transactionSourceIdentifier = self->_transactionSourceIdentifier;
  v108 = (NSString *)v4[119];
  if (transactionSourceIdentifier && v108)
  {
    if ((-[NSString isEqual:](transactionSourceIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (transactionSourceIdentifier != v108)
  {
    goto LABEL_339;
  }
  clearingNetworkData = self->_clearingNetworkData;
  v110 = (NSString *)v4[79];
  if (clearingNetworkData && v110)
  {
    if ((-[NSString isEqual:](clearingNetworkData, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (clearingNetworkData != v110)
  {
    goto LABEL_339;
  }
  questions = self->_questions;
  v112 = (NSSet *)v4[90];
  if (questions && v112)
  {
    if ((-[NSSet isEqual:](questions, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (questions != v112)
  {
    goto LABEL_339;
  }
  cardIdentifier = self->_cardIdentifier;
  v114 = (NSString *)v4[80];
  if (cardIdentifier && v114)
  {
    if ((-[NSString isEqual:](cardIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (cardIdentifier != v114)
  {
    goto LABEL_339;
  }
  dpanIdentifier = self->_dpanIdentifier;
  v116 = (NSString *)v4[81];
  if (dpanIdentifier && v116)
  {
    if ((-[NSString isEqual:](dpanIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (dpanIdentifier != v116)
  {
    goto LABEL_339;
  }
  panIdentifier = self->_panIdentifier;
  id v118 = (NSString *)v4[83];
  if (panIdentifier && v118)
  {
    if ((-[NSString isEqual:](panIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (panIdentifier != v118)
  {
    goto LABEL_339;
  }
  isMerchantTokenTransaction = self->_isMerchantTokenTransaction;
  id v120 = (NSNumber *)v4[84];
  if (isMerchantTokenTransaction && v120)
  {
    if ((-[NSNumber isEqual:](isMerchantTokenTransaction, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (isMerchantTokenTransaction != v120)
  {
    goto LABEL_339;
  }
  cardNumberSuffix = self->_cardNumberSuffix;
  id v122 = (NSString *)v4[85];
  if (cardNumberSuffix && v122)
  {
    if ((-[NSString isEqual:](cardNumberSuffix, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (cardNumberSuffix != v122)
  {
    goto LABEL_339;
  }
  if (self->_adjustmentTypeReason != v4[39] || self->_topUpType != v4[40]) {
    goto LABEL_339;
  }
  referenceIdentifier = self->_referenceIdentifier;
  uint64_t v124 = (NSString *)v4[86];
  if (referenceIdentifier && v124)
  {
    if ((-[NSString isEqual:](referenceIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (referenceIdentifier != v124)
  {
    goto LABEL_339;
  }
  if (self->_associatedFeatureIdentifier != v4[89]
    || self->_suppressBehavior != v4[87]
    || self->_accountType != v4[42]
    || ![(PKPaymentTransaction *)self isCloudArchivableDeviceDataEqual:v4])
  {
    goto LABEL_339;
  }
  if ([(PKPaymentTransaction *)self _supportsServerFundingDescription])
  {
    secondaryFundingSourceDescription = self->_secondaryFundingSourceDescription;
    v126 = (NSString *)v4[63];
    if (secondaryFundingSourceDescription && v126)
    {
      if ((-[NSString isEqual:](secondaryFundingSourceDescription, "isEqual:") & 1) == 0) {
        goto LABEL_339;
      }
    }
    else if (secondaryFundingSourceDescription != v126)
    {
      goto LABEL_339;
    }
  }
  v127 = (void *)v4[106];
  uint64_t v66 = self->_barcodeIdentifier;
  id v128 = v127;
  if (v66 == v128)
  {
  }
  else
  {
    id v68 = v128;
    if (!v66 || !v128) {
      goto LABEL_338;
    }
    BOOL v129 = [(NSString *)v66 isEqualToString:v128];

    if (!v129) {
      goto LABEL_339;
    }
  }
  authenticationContext = self->_authenticationContext;
  long long v131 = (PKTransactionAuthenticationContext *)v4[107];
  if (authenticationContext && v131)
  {
    if (!-[PKTransactionAuthenticationContext isEqual:](authenticationContext, "isEqual:")) {
      goto LABEL_339;
    }
  }
  else if (authenticationContext != v131)
  {
    goto LABEL_339;
  }
  long long v132 = (void *)v4[108];
  uint64_t v66 = self->_primaryFundingSourceDescription;
  long long v133 = v132;
  if (v66 != v133)
  {
    id v68 = v133;
    if (v66 && v133)
    {
      BOOL v134 = [(NSString *)v66 isEqualToString:v133];

      if (!v134) {
        goto LABEL_339;
      }
      goto LABEL_342;
    }
LABEL_338:

    goto LABEL_339;
  }

LABEL_342:
  nominalAmount = self->_nominalAmount;
  long long v138 = (NSDecimalNumber *)v4[109];
  if (nominalAmount && v138)
  {
    if ((-[NSDecimalNumber isEqual:](nominalAmount, "isEqual:") & 1) == 0) {
      goto LABEL_339;
    }
  }
  else if (nominalAmount != v138)
  {
    goto LABEL_339;
  }
  if (self->_hasAdditionalOffers == *((unsigned __int8 *)v4 + 26))
  {
    awards = self->_awards;
    v140 = (NSArray *)v4[110];
    if (awards && v140)
    {
      if ((-[NSArray isEqual:](awards, "isEqual:") & 1) == 0) {
        goto LABEL_339;
      }
    }
    else if (awards != v140)
    {
      goto LABEL_339;
    }
    amountModifiers = self->_amountModifiers;
    id v142 = (NSArray *)v4[111];
    if (amountModifiers && v142)
    {
      if ((-[NSArray isEqual:](amountModifiers, "isEqual:") & 1) == 0) {
        goto LABEL_339;
      }
    }
    else if (amountModifiers != v142)
    {
      goto LABEL_339;
    }
    releasedData = self->_releasedData;
    v144 = (PKTransactionReleasedData *)v4[120];
    if (releasedData && v144)
    {
      if (!-[PKTransactionReleasedData isEqual:](releasedData, "isEqual:")) {
        goto LABEL_339;
      }
    }
    else if (releasedData != v144)
    {
      goto LABEL_339;
    }
    associatedFinancingPlan = self->_associatedFinancingPlan;
    v146 = (PKPayLaterFinancingPlan *)v4[121];
    if (associatedFinancingPlan && v146)
    {
      if (!-[PKPayLaterFinancingPlan isEqual:](associatedFinancingPlan, "isEqual:")) {
        goto LABEL_339;
      }
    }
    else if (associatedFinancingPlan != v146)
    {
      goto LABEL_339;
    }
    issuerInstallmentManagementURL = self->_issuerInstallmentManagementURL;
    v148 = (NSURL *)v4[123];
    if (issuerInstallmentManagementURL && v148)
    {
      if ((-[NSURL isEqual:](issuerInstallmentManagementURL, "isEqual:") & 1) == 0) {
        goto LABEL_339;
      }
    }
    else if (issuerInstallmentManagementURL != v148)
    {
      goto LABEL_339;
    }
    if (self->_isIssuerInstallmentTransaction == *((unsigned __int8 *)v4 + 31))
    {
      paymentRewardsRedemption = self->_paymentRewardsRedemption;
      v150 = (PKPaymentRewardsRedemption *)v4[124];
      if (paymentRewardsRedemption && v150)
      {
        if (!-[PKPaymentRewardsRedemption isEqual:](paymentRewardsRedemption, "isEqual:")) {
          goto LABEL_339;
        }
      }
      else if (paymentRewardsRedemption != v150)
      {
        goto LABEL_339;
      }
      if (self->_recurring == *((unsigned __int8 *)v4 + 29))
      {
        associatedStatementIdentifiers = self->_associatedStatementIdentifiers;
        v152 = (NSArray *)v4[102];
        if (associatedStatementIdentifiers && v152)
        {
          if ((-[NSArray isEqual:](associatedStatementIdentifiers, "isEqual:") & 1) == 0) {
            goto LABEL_339;
          }
        }
        else if (associatedStatementIdentifiers != v152)
        {
          goto LABEL_339;
        }
        if (self->_interestReassessment == *((unsigned __int8 *)v4 + 25))
        {
          BOOL v135 = self->_paymentNetworkIdentifier == v4[82];
          goto LABEL_340;
        }
      }
    }
  }
LABEL_339:
  BOOL v135 = 0;
LABEL_340:

  return v135;
}

- (BOOL)isCloudArchivableDeviceDataEqual:(id)a3
{
  uint64_t v4 = (double *)a3;
  locationDate = self->_locationDate;
  BOOL v6 = (NSDate *)*((void *)v4 + 20);
  if (locationDate) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (locationDate != v6) {
      goto LABEL_69;
    }
  }
  else
  {
    char v8 = -[NSDate isEqual:](locationDate, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_69;
    }
  }
  if (self->_locationLatitude != v4[21]
    || self->_locationLongitude != v4[22]
    || self->_locationAltitude != v4[23]
    || self->_locationHorizontalAccuracy != v4[24]
    || self->_locationVerticalAccuracy != v4[25]
    || self->_coarseLocation != *((unsigned __int8 *)v4 + 8))
  {
    goto LABEL_69;
  }
  locality = self->_locality;
  uint64_t v10 = (NSString *)*((void *)v4 + 17);
  if (locality && v10)
  {
    if ((-[NSString isEqual:](locality, "isEqual:") & 1) == 0) {
      goto LABEL_69;
    }
  }
  else if (locality != v10)
  {
    goto LABEL_69;
  }
  administrativeArea = self->_administrativeArea;
  uint64_t v12 = (NSString *)*((void *)v4 + 18);
  if (administrativeArea && v12)
  {
    if ((-[NSString isEqual:](administrativeArea, "isEqual:") & 1) == 0) {
      goto LABEL_69;
    }
  }
  else if (administrativeArea != v12)
  {
    goto LABEL_69;
  }
  timeZone = self->_timeZone;
  uint64_t v14 = (NSTimeZone *)*((void *)v4 + 19);
  if (timeZone && v14)
  {
    if ((-[NSTimeZone isEqual:](timeZone, "isEqual:") & 1) == 0) {
      goto LABEL_69;
    }
  }
  else if (timeZone != v14)
  {
    goto LABEL_69;
  }
  if (self->_technologyType == *((void *)v4 + 115))
  {
    secondaryFundingSourceFPANIdentifier = self->_secondaryFundingSourceFPANIdentifier;
    unint64_t v16 = (NSString *)*((void *)v4 + 62);
    if (secondaryFundingSourceFPANIdentifier && v16)
    {
      if ((-[NSString isEqual:](secondaryFundingSourceFPANIdentifier, "isEqual:") & 1) == 0) {
        goto LABEL_69;
      }
    }
    else if (secondaryFundingSourceFPANIdentifier != v16)
    {
      goto LABEL_69;
    }
    if (![(PKPaymentTransaction *)self _supportsServerFundingDescription])
    {
      secondaryFundingSourceDescription = self->_secondaryFundingSourceDescription;
      uint64_t v20 = (NSString *)*((void *)v4 + 63);
      if (secondaryFundingSourceDescription && v20)
      {
        if ((-[NSString isEqual:](secondaryFundingSourceDescription, "isEqual:") & 1) == 0) {
          goto LABEL_69;
        }
      }
      else if (secondaryFundingSourceDescription != v20)
      {
        goto LABEL_69;
      }
    }
    if (self->_transactionSource == *((void *)v4 + 116))
    {
      peerPaymentMemo = self->_peerPaymentMemo;
      unint64_t v18 = (NSString *)*((void *)v4 + 44);
      if (peerPaymentMemo && v18)
      {
        if ((-[NSString isEqual:](peerPaymentMemo, "isEqual:") & 1) == 0) {
          goto LABEL_69;
        }
      }
      else if (peerPaymentMemo != v18)
      {
        goto LABEL_69;
      }
      requestDeviceScoreIdentifier = self->_requestDeviceScoreIdentifier;
      unint64_t v22 = (NSUUID *)*((void *)v4 + 65);
      if (requestDeviceScoreIdentifier && v22)
      {
        if ((-[NSUUID isEqual:](requestDeviceScoreIdentifier, "isEqual:") & 1) == 0) {
          goto LABEL_69;
        }
      }
      else if (requestDeviceScoreIdentifier != v22)
      {
        goto LABEL_69;
      }
      sendDeviceScoreIdentifier = self->_sendDeviceScoreIdentifier;
      int64_t v24 = (NSUUID *)*((void *)v4 + 66);
      if (sendDeviceScoreIdentifier && v24)
      {
        if ((-[NSUUID isEqual:](sendDeviceScoreIdentifier, "isEqual:") & 1) == 0) {
          goto LABEL_69;
        }
      }
      else if (sendDeviceScoreIdentifier != v24)
      {
        goto LABEL_69;
      }
      if (self->_deviceScoreIdentifiersRequired != *((unsigned __int8 *)v4 + 15)
        || self->_deviceScoreIdentifiersSubmitted != *((unsigned __int8 *)v4 + 16))
      {
        goto LABEL_69;
      }
      metadata = self->_metadata;
      uint64_t v26 = (NSDictionary *)*((void *)v4 + 100);
      if (metadata && v26)
      {
        if (-[NSDictionary isEqual:](metadata, "isEqual:"))
        {
LABEL_64:
          uint64_t v27 = [(PKPaymentTransaction *)self answeredQuestionsOnThisDevice];
          uint64_t v28 = [v4 answeredQuestionsOnThisDevice];
          uint64_t v29 = (void *)v28;
          if (v27 && v28)
          {
            if (([v27 isEqual:v28] & 1) == 0) {
              goto LABEL_81;
            }
          }
          else if (v27 != (void *)v28)
          {
            goto LABEL_81;
          }
          merchant = self->_merchant;
          int64_t v33 = (PKMerchant *)*((void *)v4 + 16);
          if (merchant && v33)
          {
            if (!-[PKMerchant isEqual:](merchant, "isEqual:"))
            {
              merchant = self->_merchant;
              int64_t v33 = (PKMerchant *)*((void *)v4 + 16);
              goto LABEL_77;
            }
          }
          else if (merchant != v33)
          {
LABEL_77:
            if ([(PKMerchant *)merchant isCloudArchivableDeviceDataEqual:v33]) {
              goto LABEL_78;
            }
LABEL_81:
            char v30 = 0;
LABEL_82:

            goto LABEL_70;
          }
LABEL_78:
          peerPaymentCounterpartImageRecordIdentifier = self->_peerPaymentCounterpartImageRecordIdentifier;
          unint64_t v35 = (NSString *)*((void *)v4 + 96);
          if (peerPaymentCounterpartImageRecordIdentifier && v35) {
            char v30 = -[NSString isEqual:](peerPaymentCounterpartImageRecordIdentifier, "isEqual:");
          }
          else {
            char v30 = peerPaymentCounterpartImageRecordIdentifier == v35;
          }
          goto LABEL_82;
        }
      }
      else if (metadata == v26)
      {
        goto LABEL_64;
      }
    }
  }
LABEL_69:
  char v30 = 0;
LABEL_70:

  return v30;
}

- (BOOL)hasCloudArchivableDeviceData
{
  if (self->_locationDate
    || self->_locationLatitude != 0.0
    || self->_locationLongitude != 0.0
    || self->_locationAltitude != 0.0
    || self->_locationHorizontalAccuracy != 0.0
    || self->_locationVerticalAccuracy != 0.0
    || self->_coarseLocation
    || self->_locality
    || self->_administrativeArea
    || self->_timeZone
    || self->_technologyType
    || self->_secondaryFundingSourceFPANIdentifier
    || ![(PKPaymentTransaction *)self _supportsServerFundingDescription]
    && self->_secondaryFundingSourceDescription
    || self->_transactionSource
    || self->_peerPaymentMemo
    || self->_requestDeviceScoreIdentifier
    || self->_sendDeviceScoreIdentifier
    || self->_deviceScoreIdentifiersSubmitted
    || self->_metadata)
  {
    return 1;
  }
  id v3 = [(PKPaymentTransaction *)self answeredQuestionsOnThisDevice];
  BOOL v4 = [v3 count]
    || [(PKMerchant *)self->_merchant hasCloudArchivableDeviceData]
    || self->_peerPaymentCounterpartImageRecordIdentifier != 0;
  BOOL v6 = v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v224.receiver = self;
  v224.super_class = (Class)PKPaymentTransaction;
  int64_t v5 = [(PKPaymentTransaction *)&v224 init];
  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x192FDC630]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtotalAmount"];
    subtotalAmount = v5->_subtotalAmount;
    v5->_subtotalAmount = (NSDecimalNumber *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amountAddedToAuth"];
    amountAddedToAuth = v5->_amountAddedToAuth;
    v5->_amountAddedToAuth = (NSDecimalNumber *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceIdentifier"];
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentHash"];
    paymentHash = v5->_paymentHash;
    v5->_paymentHash = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionDate"];
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionStatusChangedDate"];
    transactionStatusChangedDate = v5->_transactionStatusChangedDate;
    v5->_transactionStatusChangedDate = (NSDate *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationDate"];
    locationDate = v5->_locationDate;
    v5->_locationDate = (NSDate *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchant"];
    merchant = v5->_merchant;
    v5->_merchant = (PKMerchant *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locality"];
    locality = v5->_locality;
    v5->_locality = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"administrativeArea"];
    administrativeArea = v5->_administrativeArea;
    v5->_administrativeArea = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v35;

    unint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"amounts"];
    amounts = v5->_amounts;
    v5->_amounts = (NSArray *)v40;

    int64_t v42 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"plans"];
    plans = v5->_plans;
    v5->_plans = (NSArray *)v45;

    v5->_suppressNotifications = [v4 decodeBoolForKey:@"blockNotification"];
    v5->_recurring = [v4 decodeBoolForKey:@"recurring"];
    v5->_transactionStatus = [v4 decodeIntegerForKey:@"transactionStatus"];
    v5->_transactionDeclinedReason = [v4 decodeIntegerForKey:@"transactionDeclinedReason"];
    v5->_transactionType = [v4 decodeIntegerForKey:@"transactionType"];
    v5->_technologyType = [v4 decodeIntegerForKey:@"technologyType"];
    v5->_transactionSource = [v4 decodeIntegerForKey:@"transactionSource"];
    v5->_hasNotificationServiceData = [v4 decodeBoolForKey:@"hasNotificationServiceData"];
    v5->_hasAssociatedPaymentApplication = [v4 decodeBoolForKey:@"hasAssociatedPaymentApplication"];
    v5->_processedForLocation = [v4 decodeBoolForKey:@"processedForLocation"];
    v5->_processedForMerchantCleanup = [v4 decodeBoolForKey:@"processedForMerchantCleanup"];
    v5->_requiresMerchantReprocessing = [v4 decodeBoolForKey:@"requiresClearingMerchantCleanup"];
    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastMerchantReprocessingDate"];
    lastMerchantReprocessingDate = v5->_lastMerchantReprocessingDate;
    v5->_lastMerchantReprocessingDate = (NSDate *)v47;

    v5->_processedForStations = [v4 decodeBoolForKey:@"processedForStations"];
    [v4 decodeDoubleForKey:@"locationLatitude"];
    v5->_locationLatitude = v49;
    [v4 decodeDoubleForKey:@"locationLongitude"];
    v5->_locationLongitude = v50;
    [v4 decodeDoubleForKey:@"locationAltitude"];
    v5->_locationAltitude = v51;
    [v4 decodeDoubleForKey:@"locationHorizontalAccuracy"];
    v5->_locationHorizontalAccuracy = v52;
    [v4 decodeDoubleForKey:@"locationVerticalAccuracy"];
    v5->_locationVerticalAccuracy = v53;
    v5->_coarseLocation = [v4 decodeBoolForKey:@"isCoarseLocation"];
    v5->_transitType = [v4 decodeIntegerForKey:@"transitType"];
    v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transitModifiers"];
    v5->_transitModifiers = [v54 unsignedIntegerValue];

    v5->_enRoute = [v4 decodeBoolForKey:@"enRoute"];
    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stationCodeProvider"];
    stationCodeProvider = v5->_stationCodeProvider;
    v5->_stationCodeProvider = (NSString *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cityCode"];
    cityCode = v5->_cityCode;
    v5->_cityCode = (NSNumber *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startStationCode"];
    startStationCode = v5->_startStationCode;
    v5->_startStationCode = (NSData *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startStation"];
    startStation = v5->_startStation;
    v5->_startStation = (NSString *)v61;

    [v4 decodeDoubleForKey:@"startStationLatitude"];
    v5->_startStationLatitude = v63;
    [v4 decodeDoubleForKey:@"startStationLongitude"];
    v5->_startStationLongitude = v64;
    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endStationCode"];
    endStationCode = v5->_endStationCode;
    v5->_endStationCode = (NSData *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endStation"];
    endStation = v5->_endStation;
    v5->_endStation = (NSString *)v67;

    [v4 decodeDoubleForKey:@"endStationLatitude"];
    v5->_endStationLatitude = v69;
    [v4 decodeDoubleForKey:@"ednStationLongitude"];
    v5->_endStationLongitude = v70;
    v5->_shouldSuppressDate = [v4 decodeBoolForKey:@"shouldSuppressDate"];
    v5->_adjustmentType = [v4 decodeIntegerForKey:@"adjustmentType"];
    v5->_peerPaymentType = [v4 decodeIntegerForKey:@"peerPaymentType"];
    uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentCounterpartHandle"];
    peerPaymentCounterpartHandle = v5->_peerPaymentCounterpartHandle;
    v5->_peerPaymentCounterpartHandle = (NSString *)v71;

    uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentMemo"];
    peerPaymentMemo = v5->_peerPaymentMemo;
    v5->_peerPaymentMemo = (NSString *)v73;

    uint64_t v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentMessageReceivedDate"];
    peerPaymentMessageReceivedDate = v5->_peerPaymentMessageReceivedDate;
    v5->_peerPaymentMessageReceivedDate = (NSDate *)v75;

    v5->_unint64_t accountType = [v4 decodeIntegerForKey:@"feature"];
    uint64_t v77 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fees"];
    fees = v5->_fees;
    v5->_fees = (PKPaymentTransactionFees *)v77;

    uint64_t v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foreignExchangeInformation"];
    foreignExchangeInformation = v5->_foreignExchangeInformation;
    v5->_foreignExchangeInformation = (PKPaymentTransactionForeignExchangeInformation *)v79;

    uint64_t v81 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryFundingSourceAmount"];
    primaryFundingSourceAmount = v5->_primaryFundingSourceAmount;
    v5->_primaryFundingSourceAmount = (NSDecimalNumber *)v81;

    uint64_t v83 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryFundingSourceCurrencyCode"];
    primaryFundingSourceCurrencyCode = v5->_primaryFundingSourceCurrencyCode;
    v5->_primaryFundingSourceCurrencyCode = (NSString *)v83;

    uint64_t v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryFundingSourceAmount"];
    secondaryFundingSourceAmount = v5->_secondaryFundingSourceAmount;
    v5->_secondaryFundingSourceAmount = (NSDecimalNumber *)v85;

    uint64_t v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryFundingSourceCurrencyCode"];
    secondaryFundingSourceCurrencyCode = v5->_secondaryFundingSourceCurrencyCode;
    v5->_secondaryFundingSourceCurrencyCode = (NSString *)v87;

    v5->_secondaryFundingSourceNetwork = [v4 decodeIntegerForKey:@"secondaryFundingSourceNetwork"];
    uint64_t v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryFundingSourceDPANSuffix"];
    secondaryFundingSourceDPANSuffix = v5->_secondaryFundingSourceDPANSuffix;
    v5->_secondaryFundingSourceDPANSuffix = (NSString *)v89;

    uint64_t v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryFundingSourceFPANIdentifier"];
    secondaryFundingSourceFPANIdentifier = v5->_secondaryFundingSourceFPANIdentifier;
    v5->_secondaryFundingSourceFPANIdentifier = (NSString *)v91;

    uint64_t v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryFundingSourceDescription"];
    secondaryFundingSourceDescription = v5->_secondaryFundingSourceDescription;
    v5->_secondaryFundingSourceDescription = (NSString *)v93;

    int v95 = [v4 containsValueForKey:@"secondaryFundingSourceType"];
    if (v5->_transactionType != 5 || v95) {
      uint64_t v96 = [v4 decodeIntegerForKey:@"secondaryFundingSourceType"];
    }
    else {
      uint64_t v96 = 1;
    }
    v5->_int64_t secondaryFundingSourceType = v96;
    uint64_t v97 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestDeviceScoreIdentifier"];
    requestDeviceScoreIdentifier = v5->_requestDeviceScoreIdentifier;
    v5->_requestDeviceScoreIdentifier = (NSUUID *)v97;

    uint64_t v99 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sendDeviceScoreIdentifier"];
    sendDeviceScoreIdentifier = v5->_sendDeviceScoreIdentifier;
    v5->_sendDeviceScoreIdentifier = (NSUUID *)v99;

    v5->_deviceScoreIdentifiersRequired = [v4 decodeBoolForKey:@"deviceScoreIdentifiersRequired"];
    v5->_deviceScoreIdentifiersSubmitted = [v4 decodeBoolForKey:@"deviceScoreIdentifiersSubmitted"];
    uint64_t v101 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantProvidedDescription"];
    merchantProvidedDescription = v5->_merchantProvidedDescription;
    v5->_merchantProvidedDescription = (NSString *)v101;

    uint64_t v103 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantProvidedTitle"];
    merchantProvidedTitle = v5->_merchantProvidedTitle;
    v5->_merchantProvidedTitle = (NSString *)v103;

    uint64_t v105 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewards"];
    rewards = v5->_rewards;
    v5->_rewards = (PKPaymentTransactionRewards *)v105;

    uint64_t v107 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsTotalAmount"];
    rewardsTotalAmount = v5->_rewardsTotalAmount;
    v5->_rewardsTotalAmount = (NSDecimalNumber *)v107;

    uint64_t v109 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsTotalCurrencyCode"];
    rewardsTotalCurrencyCode = v5->_rewardsTotalCurrencyCode;
    v5->_rewardsTotalCurrencyCode = (NSString *)v109;

    v5->_redemptionType = [v4 decodeIntegerForKey:@"redemptionType"];
    uint64_t v111 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsInProgress"];
    rewardsInProgress = v5->_rewardsInProgress;
    v5->_rewardsInProgress = (PKPaymentTransactionRewards *)v111;

    v5->_cardType = [v4 decodeIntegerForKey:@"cardType"];
    v5->_unint64_t rewardsEligibilityReason = [v4 decodeIntegerForKey:@"rewardsEligibilityReason"];
    uint64_t v113 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v113;

    uint64_t v115 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v115;

    uint64_t v117 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lifecycleIdentifier"];
    lifecycleIdentifier = v5->_lifecycleIdentifier;
    v5->_lifecycleIdentifier = (NSString *)v117;

    uint64_t v119 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authNetworkData"];
    authNetworkData = v5->_authNetworkData;
    v5->_authNetworkData = (NSString *)v119;

    uint64_t v121 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clearingNetworkData"];
    clearingNetworkData = v5->_clearingNetworkData;
    v5->_clearingNetworkData = (NSString *)v121;

    uint64_t v123 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardIdentifier"];
    cardIdentifier = v5->_cardIdentifier;
    v5->_cardIdentifier = (NSString *)v123;

    uint64_t v125 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpanIdentifier"];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v125;

    uint64_t v127 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"panIdentifier"];
    panIdentifier = v5->_panIdentifier;
    v5->_panIdentifier = (NSString *)v127;

    uint64_t v129 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isMerchantTokenTransaction"];
    isMerchantTokenTransaction = v5->_isMerchantTokenTransaction;
    v5->_isMerchantTokenTransaction = (NSNumber *)v129;

    uint64_t v131 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"last4Digits"];
    cardNumberSuffix = v5->_cardNumberSuffix;
    v5->_cardNumberSuffix = (NSString *)v131;

    v5->_adjustmentTypeReason = [v4 decodeIntegerForKey:@"adjustmentTypeReason"];
    v5->_unint64_t topUpType = [v4 decodeIntegerForKey:@"topUpType"];
    long long v133 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v134 = objc_opt_class();
    BOOL v135 = objc_msgSend(v133, "setWithObjects:", v134, objc_opt_class(), 0);
    uint64_t v136 = [v4 decodeObjectOfClasses:v135 forKey:@"issuerQuestions"];
    questions = v5->_questions;
    v5->_questions = (NSSet *)v136;

    v5->_associatedFeatureIdentifier = [v4 decodeIntegerForKey:@"associatedFeatureIdentifier"];
    uint64_t v138 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceIdentifier"];
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v138;

    v5->_suppressBehavior = [v4 decodeIntegerForKey:@"supressBehavior"];
    v140 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v141 = objc_opt_class();
    id v142 = objc_msgSend(v140, "setWithObjects:", v141, objc_opt_class(), 0);
    uint64_t v143 = [v4 decodeObjectOfClasses:v142 forKey:@"servicingEvents"];
    servicingEvents = v5->_servicingEvents;
    v5->_servicingEvents = (NSOrderedSet *)v143;

    v145 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v146 = objc_opt_class();
    v147 = objc_msgSend(v145, "setWithObjects:", v146, objc_opt_class(), 0);
    uint64_t v148 = [v4 decodeObjectOfClasses:v147 forKey:@"payments"];
    payments = v5->_payments;
    v5->_payments = (NSArray *)v148;

    v150 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v151 = objc_opt_class();
    v152 = objc_msgSend(v150, "setWithObjects:", v151, objc_opt_class(), 0);
    uint64_t v153 = [v4 decodeObjectOfClasses:v152 forKey:@"transfers"];
    transfers = v5->_transfers;
    v5->_transfers = (NSArray *)v153;

    uint64_t v155 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recurringPeerPayment"];
    recurringPeerPayment = v5->_recurringPeerPayment;
    v5->_recurringPeerPayment = (PKPeerPaymentRecurringPayment *)v155;

    v157 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v158 = [v4 decodeObjectOfClasses:v157 forKey:@"redemptionEvent"];
    redemptionEvent = v5->_redemptionEvent;
    v5->_redemptionEvent = (PKAccountEvent *)v158;

    uint64_t v160 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentPayment"];
    installmentPayment = v5->_installmentPayment;
    v5->_installmentPayment = (PKCreditInstallmentPlanPayment *)v160;

    uint64_t v162 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installment"];
    installmentPlan = v5->_installmentPlan;
    v5->_installmentPlan = (PKCreditInstallmentPlan *)v162;

    uint64_t v164 = [v4 decodePropertyListForKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v164;

    v5->_updateReasons = [v4 decodeIntegerForKey:@"updateReasons"];
    uint64_t v166 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionSourceIdentifier"];
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v166;

    v5->_originatedByDevice = [v4 decodeBoolForKey:@"originatedByDevice"];
    v5->_fuzzyMatched = [v4 decodeBoolForKey:@"fuzzyMatched"];
    uint64_t v168 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiptProviderURL"];
    receiptProviderURL = v5->_receiptProviderURL;
    v5->_receiptProviderURL = (NSURL *)v168;

    uint64_t v170 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiptProviderIdentifier"];
    receiptProviderIdentifier = v5->_receiptProviderIdentifier;
    v5->_receiptProviderIdentifier = (NSString *)v170;

    uint64_t v172 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiptIdentifier"];
    receiptIdentifier = v5->_receiptIdentifier;
    v5->_receiptIdentifier = (NSString *)v172;

    uint64_t v174 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issueReportIdentifier"];
    issueReportIdentifier = v5->_issueReportIdentifier;
    v5->_issueReportIdentifier = (NSString *)v174;

    v5->_requiresLocation = [v4 decodeBoolForKey:@"requiresLocation"];
    uint64_t v176 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTypeDescription"];
    localizedTypeDescription = v5->_localizedTypeDescription;
    v5->_localizedTypeDescription = (NSString *)v176;

    uint64_t v178 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankConnectDigitalServicingURL"];
    bankConnectDigitalServicingURL = v5->_bankConnectDigitalServicingURL;
    v5->_bankConnectDigitalServicingURL = (NSURL *)v178;

    uint64_t v180 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankConnectPayNowURL"];
    bankConnectPayNowURL = v5->_bankConnectPayNowURL;
    v5->_bankConnectPayNowURL = (NSURL *)v180;

    uint64_t v182 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankConnectTransferFundsURL"];
    bankConnectTransferFundsURL = v5->_bankConnectTransferFundsURL;
    v5->_bankConnectTransferFundsURL = (NSURL *)v182;

    uint64_t v184 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankConnectPostInstallmentURL"];
    bankConnectPostInstallmentURL = v5->_bankConnectPostInstallmentURL;
    v5->_bankConnectPostInstallmentURL = (NSURL *)v184;

    uint64_t v186 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankConnectRedeemRewardsURL"];
    bankConnectRedeemRewardsURL = v5->_bankConnectRedeemRewardsURL;
    v5->_bankConnectRedeemRewardsURL = (NSURL *)v186;

    v5->_isBankConnectTransaction = [v4 decodeBoolForKey:@"isBankConnectTransaction"];
    v5->_bankConnectTransactionWasClassifiedByMaps = [v4 decodeBoolForKey:@"bankConnectTransactionWasClassifiedByMaps"];
    v5->_bankConnectCreditDebitIndicator = [v4 decodeIntegerForKey:@"bankConnectCreditDebitIndicator"];
    v5->_bankConnectRoundTransactionDate = [v4 decodeBoolForKey:@"bankConnectRoundTransactionDate"];
    uint64_t v188 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankConnectMetadata"];
    bankConnectMetadata = v5->_bankConnectMetadata;
    v5->_bankConnectMetadata = (PKPaymentTransactionBankConnectMetadata *)v188;

    uint64_t v190 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"barcodeIdentifier"];
    barcodeIdentifier = v5->_barcodeIdentifier;
    v5->_barcodeIdentifier = (NSString *)v190;

    uint64_t v192 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationDetails"];
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (PKTransactionAuthenticationContext *)v192;

    uint64_t v194 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryFundingSourceDescription"];
    primaryFundingSourceDescription = v5->_primaryFundingSourceDescription;
    v5->_primaryFundingSourceDescription = (NSString *)v194;

    uint64_t v196 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nominalAmount"];
    nominalAmount = v5->_nominalAmount;
    v5->_nominalAmount = (NSDecimalNumber *)v196;

    v5->_hasAdditionalOffers = [v4 decodeBoolForKey:@"hasAdditionalOffers"];
    v198 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v199 = objc_opt_class();
    v200 = objc_msgSend(v198, "setWithObjects:", v199, objc_opt_class(), 0);
    uint64_t v201 = [v4 decodeObjectOfClasses:v200 forKey:@"awards"];
    awards = v5->_awards;
    v5->_awards = (NSArray *)v201;

    v203 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v204 = objc_opt_class();
    v205 = objc_msgSend(v203, "setWithObjects:", v204, objc_opt_class(), 0);
    uint64_t v206 = [v4 decodeObjectOfClasses:v205 forKey:@"amountModifiers"];
    amountModifiers = v5->_amountModifiers;
    v5->_amountModifiers = (NSArray *)v206;

    uint64_t v208 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releasedData"];
    releasedData = v5->_releasedData;
    v5->_releasedData = (PKTransactionReleasedData *)v208;

    uint64_t v210 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedFinancingPlan"];
    associatedFinancingPlan = v5->_associatedFinancingPlan;
    v5->_associatedFinancingPlan = (PKPayLaterFinancingPlan *)v210;

    v5->_isIssuerInstallmentTransaction = [v4 decodeBoolForKey:@"isIssuerInstallmentTransaction"];
    uint64_t v212 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuerInstallmentManagementURL"];
    issuerInstallmentManagementURL = v5->_issuerInstallmentManagementURL;
    v5->_issuerInstallmentManagementURL = (NSURL *)v212;

    uint64_t v214 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentRewardsRedemption"];
    paymentRewardsRedemption = v5->_paymentRewardsRedemption;
    v5->_paymentRewardsRedemption = (PKPaymentRewardsRedemption *)v214;

    v216 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v217 = objc_opt_class();
    v218 = objc_msgSend(v216, "setWithObjects:", v217, objc_opt_class(), 0);
    uint64_t v219 = [v4 decodeObjectOfClasses:v218 forKey:@"associatedStatementIdentifiers"];
    associatedStatementIdentifiers = v5->_associatedStatementIdentifiers;
    v5->_associatedStatementIdentifiers = (NSArray *)v219;

    v5->_interestReassessment = [v4 decodeBoolForKey:@"interestReassessment"];
    v5->_int64_t paymentNetworkIdentifier = [v4 decodeIntegerForKey:@"paymentNetworkIdentifier"];
    v5->_peerPaymentPaymentMode = [v4 decodeIntegerForKey:@"peerPaymentPaymentMode"];
    uint64_t v221 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentCounterpartImageRecordIdentifier"];
    peerPaymentCounterpartImageRecordIdentifier = v5->_peerPaymentCounterpartImageRecordIdentifier;
    v5->_peerPaymentCounterpartImageRecordIdentifier = (NSString *)v221;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v6 = a3;
  [v6 encodeObject:amount forKey:@"amount"];
  [v6 encodeObject:self->_subtotalAmount forKey:@"subtotalAmount"];
  [v6 encodeObject:self->_amountAddedToAuth forKey:@"amountAddedToAuth"];
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
  [v6 encodeObject:self->_serviceIdentifier forKey:@"serviceIdentifier"];
  [v6 encodeObject:self->_paymentHash forKey:@"paymentHash"];
  [v6 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v6 encodeObject:self->_amounts forKey:@"amounts"];
  [v6 encodeObject:self->_plans forKey:@"plans"];
  [v6 encodeObject:self->_transactionDate forKey:@"transactionDate"];
  [v6 encodeObject:self->_transactionStatusChangedDate forKey:@"transactionStatusChangedDate"];
  [v6 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v6 encodeObject:self->_locationDate forKey:@"locationDate"];
  [v6 encodeObject:self->_merchant forKey:@"merchant"];
  [v6 encodeObject:self->_locality forKey:@"locality"];
  [v6 encodeObject:self->_administrativeArea forKey:@"administrativeArea"];
  [v6 encodeObject:self->_timeZone forKey:@"timeZone"];
  [v6 encodeBool:self->_suppressNotifications forKey:@"blockNotification"];
  [v6 encodeBool:self->_recurring forKey:@"recurring"];
  [v6 encodeInteger:self->_transactionStatus forKey:@"transactionStatus"];
  [v6 encodeInteger:self->_transactionDeclinedReason forKey:@"transactionDeclinedReason"];
  [v6 encodeInteger:self->_transactionType forKey:@"transactionType"];
  [v6 encodeInteger:self->_technologyType forKey:@"technologyType"];
  [v6 encodeInteger:self->_transactionSource forKey:@"transactionSource"];
  [v6 encodeBool:self->_hasNotificationServiceData forKey:@"hasNotificationServiceData"];
  [v6 encodeBool:self->_hasAssociatedPaymentApplication forKey:@"hasAssociatedPaymentApplication"];
  [v6 encodeBool:self->_processedForLocation forKey:@"processedForLocation"];
  [v6 encodeBool:self->_processedForMerchantCleanup forKey:@"processedForMerchantCleanup"];
  [v6 encodeBool:self->_requiresMerchantReprocessing forKey:@"requiresClearingMerchantCleanup"];
  [v6 encodeObject:self->_lastMerchantReprocessingDate forKey:@"lastMerchantReprocessingDate"];
  [v6 encodeBool:self->_processedForStations forKey:@"processedForStations"];
  [v6 encodeDouble:@"locationLatitude" forKey:self->_locationLatitude];
  [v6 encodeDouble:@"locationLongitude" forKey:self->_locationLongitude];
  [v6 encodeDouble:@"locationAltitude" forKey:self->_locationAltitude];
  [v6 encodeDouble:@"locationHorizontalAccuracy" forKey:self->_locationHorizontalAccuracy];
  [v6 encodeDouble:@"locationVerticalAccuracy" forKey:self->_locationVerticalAccuracy];
  [v6 encodeBool:self->_coarseLocation forKey:@"isCoarseLocation"];
  [v6 encodeInteger:self->_transitType forKey:@"transitType"];
  int64_t v5 = [NSNumber numberWithUnsignedInteger:self->_transitModifiers];
  [v6 encodeObject:v5 forKey:@"transitModifiers"];

  [v6 encodeBool:self->_enRoute forKey:@"enRoute"];
  [v6 encodeObject:self->_stationCodeProvider forKey:@"stationCodeProvider"];
  [v6 encodeObject:self->_cityCode forKey:@"cityCode"];
  [v6 encodeObject:self->_startStationCode forKey:@"startStationCode"];
  [v6 encodeObject:self->_startStation forKey:@"startStation"];
  [v6 encodeDouble:@"startStationLatitude" forKey:self->_startStationLatitude];
  [v6 encodeDouble:@"startStationLongitude" forKey:self->_startStationLongitude];
  [v6 encodeObject:self->_endStationCode forKey:@"endStationCode"];
  [v6 encodeObject:self->_endStation forKey:@"endStation"];
  [v6 encodeDouble:@"endStationLatitude" forKey:self->_endStationLatitude];
  [v6 encodeDouble:@"ednStationLongitude" forKey:self->_endStationLongitude];
  [v6 encodeBool:self->_shouldSuppressDate forKey:@"shouldSuppressDate"];
  [v6 encodeInteger:self->_adjustmentType forKey:@"adjustmentType"];
  [v6 encodeInteger:self->_accountType forKey:@"feature"];
  [v6 encodeInteger:self->_peerPaymentType forKey:@"peerPaymentType"];
  [v6 encodeObject:self->_peerPaymentCounterpartHandle forKey:@"peerPaymentCounterpartHandle"];
  [v6 encodeObject:self->_peerPaymentMemo forKey:@"peerPaymentMemo"];
  [v6 encodeObject:self->_peerPaymentMessageReceivedDate forKey:@"peerPaymentMessageReceivedDate"];
  [v6 encodeObject:self->_fees forKey:@"fees"];
  [v6 encodeObject:self->_foreignExchangeInformation forKey:@"foreignExchangeInformation"];
  [v6 encodeObject:self->_primaryFundingSourceAmount forKey:@"primaryFundingSourceAmount"];
  [v6 encodeObject:self->_primaryFundingSourceCurrencyCode forKey:@"primaryFundingSourceCurrencyCode"];
  [v6 encodeObject:self->_secondaryFundingSourceAmount forKey:@"secondaryFundingSourceAmount"];
  [v6 encodeObject:self->_secondaryFundingSourceCurrencyCode forKey:@"secondaryFundingSourceCurrencyCode"];
  [v6 encodeInteger:self->_secondaryFundingSourceNetwork forKey:@"secondaryFundingSourceNetwork"];
  [v6 encodeObject:self->_secondaryFundingSourceDPANSuffix forKey:@"secondaryFundingSourceDPANSuffix"];
  [v6 encodeObject:self->_secondaryFundingSourceFPANIdentifier forKey:@"secondaryFundingSourceFPANIdentifier"];
  [v6 encodeObject:self->_secondaryFundingSourceDescription forKey:@"secondaryFundingSourceDescription"];
  [v6 encodeInteger:self->_secondaryFundingSourceType forKey:@"secondaryFundingSourceType"];
  [v6 encodeObject:self->_requestDeviceScoreIdentifier forKey:@"requestDeviceScoreIdentifier"];
  [v6 encodeObject:self->_sendDeviceScoreIdentifier forKey:@"sendDeviceScoreIdentifier"];
  [v6 encodeBool:self->_deviceScoreIdentifiersRequired forKey:@"deviceScoreIdentifiersRequired"];
  [v6 encodeBool:self->_deviceScoreIdentifiersSubmitted forKey:@"deviceScoreIdentifiersSubmitted"];
  [v6 encodeObject:self->_merchantProvidedDescription forKey:@"merchantProvidedDescription"];
  [v6 encodeObject:self->_merchantProvidedTitle forKey:@"merchantProvidedTitle"];
  [v6 encodeObject:self->_rewards forKey:@"rewards"];
  [v6 encodeObject:self->_rewardsTotalAmount forKey:@"rewardsTotalAmount"];
  [v6 encodeObject:self->_rewardsTotalCurrencyCode forKey:@"rewardsTotalCurrencyCode"];
  [v6 encodeInteger:self->_rewardsEligibilityReason forKey:@"rewardsEligibilityReason"];
  [v6 encodeInteger:self->_redemptionType forKey:@"redemptionType"];
  [v6 encodeObject:self->_rewardsInProgress forKey:@"rewardsInProgress"];
  [v6 encodeInteger:self->_cardType forKey:@"cardType"];
  [v6 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v6 encodeObject:self->_altDSID forKey:@"altDSID"];
  [v6 encodeObject:self->_lifecycleIdentifier forKey:@"lifecycleIdentifier"];
  [v6 encodeObject:self->_authNetworkData forKey:@"authNetworkData"];
  [v6 encodeObject:self->_clearingNetworkData forKey:@"clearingNetworkData"];
  [v6 encodeObject:self->_cardIdentifier forKey:@"cardIdentifier"];
  [v6 encodeObject:self->_dpanIdentifier forKey:@"dpanIdentifier"];
  [v6 encodeObject:self->_panIdentifier forKey:@"panIdentifier"];
  [v6 encodeObject:self->_isMerchantTokenTransaction forKey:@"isMerchantTokenTransaction"];
  [v6 encodeObject:self->_cardNumberSuffix forKey:@"last4Digits"];
  [v6 encodeInteger:self->_adjustmentTypeReason forKey:@"adjustmentTypeReason"];
  [v6 encodeInteger:self->_topUpType forKey:@"topUpType"];
  [v6 encodeObject:self->_questions forKey:@"issuerQuestions"];
  [v6 encodeObject:self->_referenceIdentifier forKey:@"referenceIdentifier"];
  [v6 encodeInteger:self->_associatedFeatureIdentifier forKey:@"associatedFeatureIdentifier"];
  [v6 encodeInteger:self->_suppressBehavior forKey:@"supressBehavior"];
  [v6 encodeObject:self->_servicingEvents forKey:@"servicingEvents"];
  [v6 encodeObject:self->_redemptionEvent forKey:@"redemptionEvent"];
  [v6 encodeObject:self->_payments forKey:@"payments"];
  [v6 encodeObject:self->_transfers forKey:@"transfers"];
  [v6 encodeObject:self->_recurringPeerPayment forKey:@"recurringPeerPayment"];
  [v6 encodeObject:self->_installmentPayment forKey:@"installmentPayment"];
  [v6 encodeObject:self->_installmentPlan forKey:@"installment"];
  [v6 encodeObject:self->_metadata forKey:@"metadata"];
  [v6 encodeInteger:self->_updateReasons forKey:@"updateReasons"];
  [v6 encodeBool:self->_originatedByDevice forKey:@"originatedByDevice"];
  [v6 encodeBool:self->_fuzzyMatched forKey:@"fuzzyMatched"];
  [v6 encodeObject:self->_issueReportIdentifier forKey:@"issueReportIdentifier"];
  [v6 encodeObject:self->_receiptProviderURL forKey:@"receiptProviderURL"];
  [v6 encodeObject:self->_receiptIdentifier forKey:@"receiptIdentifier"];
  [v6 encodeObject:self->_receiptProviderIdentifier forKey:@"receiptProviderIdentifier"];
  [v6 encodeObject:self->_transactionSourceIdentifier forKey:@"transactionSourceIdentifier"];
  [v6 encodeBool:self->_requiresLocation forKey:@"requiresLocation"];
  [v6 encodeObject:self->_localizedTypeDescription forKey:@"localizedTypeDescription"];
  [v6 encodeObject:self->_bankConnectDigitalServicingURL forKey:@"bankConnectDigitalServicingURL"];
  [v6 encodeObject:self->_bankConnectPayNowURL forKey:@"bankConnectPayNowURL"];
  [v6 encodeObject:self->_bankConnectTransferFundsURL forKey:@"bankConnectTransferFundsURL"];
  [v6 encodeObject:self->_bankConnectPostInstallmentURL forKey:@"bankConnectPostInstallmentURL"];
  [v6 encodeObject:self->_bankConnectRedeemRewardsURL forKey:@"bankConnectRedeemRewardsURL"];
  [v6 encodeBool:self->_isBankConnectTransaction forKey:@"isBankConnectTransaction"];
  [v6 encodeBool:self->_bankConnectTransactionWasClassifiedByMaps forKey:@"bankConnectTransactionWasClassifiedByMaps"];
  [v6 encodeInteger:self->_bankConnectCreditDebitIndicator forKey:@"bankConnectCreditDebitIndicator"];
  [v6 encodeBool:self->_bankConnectRoundTransactionDate forKey:@"bankConnectRoundTransactionDate"];
  [v6 encodeObject:self->_bankConnectMetadata forKey:@"bankConnectMetadata"];
  [v6 encodeObject:self->_barcodeIdentifier forKey:@"barcodeIdentifier"];
  [v6 encodeObject:self->_authenticationContext forKey:@"authenticationDetails"];
  [v6 encodeObject:self->_primaryFundingSourceDescription forKey:@"primaryFundingSourceDescription"];
  [v6 encodeObject:self->_nominalAmount forKey:@"nominalAmount"];
  [v6 encodeBool:self->_hasAdditionalOffers forKey:@"hasAdditionalOffers"];
  [v6 encodeObject:self->_awards forKey:@"awards"];
  [v6 encodeObject:self->_amountModifiers forKey:@"amountModifiers"];
  [v6 encodeObject:self->_releasedData forKey:@"releasedData"];
  [v6 encodeObject:self->_associatedFinancingPlan forKey:@"associatedFinancingPlan"];
  [v6 encodeObject:self->_issuerInstallmentManagementURL forKey:@"issuerInstallmentManagementURL"];
  [v6 encodeBool:self->_isIssuerInstallmentTransaction forKey:@"isIssuerInstallmentTransaction"];
  [v6 encodeObject:self->_paymentRewardsRedemption forKey:@"paymentRewardsRedemption"];
  [v6 encodeObject:self->_associatedStatementIdentifiers forKey:@"associatedStatementIdentifiers"];
  [v6 encodeBool:self->_interestReassessment forKey:@"interestReassessment"];
  [v6 encodeInteger:self->_paymentNetworkIdentifier forKey:@"paymentNetworkIdentifier"];
  [v6 encodeInteger:self->_peerPaymentPaymentMode forKey:@"peerPaymentPaymentMode"];
  [v6 encodeObject:self->_peerPaymentCounterpartImageRecordIdentifier forKey:@"peerPaymentCounterpartImageRecordIdentifier"];
}

- (PKPaymentTransaction)initWithCloudStoreCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PKPaymentTransaction *)self init];
  if (v5)
  {
    id v6 = [[PKMerchant alloc] initWithCloudStoreCoder:v4];
    merchant = v5->_merchant;
    v5->_merchant = v6;

    char v8 = [[PKPaymentTransactionFees alloc] initWithCloudStoreCoder:v4];
    fees = v5->_fees;
    v5->_fees = v8;

    uint64_t v10 = [[PKPaymentTransactionForeignExchangeInformation alloc] initWithCloudStoreCoder:v4];
    foreignExchangeInformation = v5->_foreignExchangeInformation;
    v5->_foreignExchangeInformation = v10;

    uint64_t v12 = [[PKPaymentTransactionRewards alloc] initWithCloudStoreCoder:v4 property:0];
    rewards = v5->_rewards;
    v5->_rewards = v12;

    uint64_t v14 = [[PKPaymentTransactionRewards alloc] initWithCloudStoreCoder:v4 property:1];
    rewardsInProgress = v5->_rewardsInProgress;
    v5->_rewardsInProgress = v14;

    [(PKPaymentTransaction *)v5 applyPropertiesFromCloudStoreRecord:v4];
  }

  return v5;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  merchant = self->_merchant;
  if (merchant)
  {
    [(PKMerchant *)merchant applyPropertiesFromCloudStoreRecord:v4];
  }
  else
  {
    id v6 = [[PKMerchant alloc] initWithCloudStoreCoder:v4];
    uint64_t v7 = self->_merchant;
    self->_merchant = v6;
  }
  fees = self->_fees;
  if (fees)
  {
    [(PKPaymentTransactionFees *)fees applyPropertiesFromCloudStoreRecord:v4];
  }
  else
  {
    uint64_t v9 = [[PKPaymentTransactionFees alloc] initWithCloudStoreCoder:v4];
    uint64_t v10 = self->_fees;
    self->_fees = v9;
  }
  foreignExchangeInformation = self->_foreignExchangeInformation;
  if (foreignExchangeInformation)
  {
    [(PKPaymentTransactionForeignExchangeInformation *)foreignExchangeInformation applyPropertiesFromCloudStoreRecord:v4];
  }
  else
  {
    uint64_t v12 = [[PKPaymentTransactionForeignExchangeInformation alloc] initWithCloudStoreCoder:v4];
    uint64_t v13 = self->_foreignExchangeInformation;
    self->_foreignExchangeInformation = v12;
  }
  rewards = self->_rewards;
  if (rewards)
  {
    [(PKPaymentTransactionRewards *)rewards applyPropertiesFromCloudStoreRecord:v4 property:0];
  }
  else
  {
    uint64_t v15 = [[PKPaymentTransactionRewards alloc] initWithCloudStoreCoder:v4 property:0];
    unint64_t v16 = self->_rewards;
    self->_rewards = v15;
  }
  rewardsInProgress = self->_rewardsInProgress;
  if (rewardsInProgress)
  {
    [(PKPaymentTransactionRewards *)rewardsInProgress applyPropertiesFromCloudStoreRecord:v4 property:1];
  }
  else
  {
    unint64_t v18 = [[PKPaymentTransactionRewards alloc] initWithCloudStoreCoder:v4 property:1];
    uint64_t v19 = self->_rewardsInProgress;
    self->_rewardsInProgress = v18;
  }
  uint64_t v20 = [v4 recordsWithRecordType:@"Transaction"];
  uint64_t v21 = [v20 firstObject];

  if (!v21)
  {
    v60 = 0;
    uint64_t v61 = 0;
    goto LABEL_58;
  }
  objc_msgSend(v21, "pk_encryptedStringForKey:", @"identifier");
  unint64_t v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceIdentifier = self->_serviceIdentifier;
  self->_serviceIdentifier = v22;

  int64_t v24 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"paymentHash");
  uint64_t v25 = [v24 uppercaseString];
  paymentHash = self->_paymentHash;
  self->_paymentHash = v25;

  objc_msgSend(v21, "pk_encryptedDecimalNumberForKey:", @"amount");
  uint64_t v27 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  amount = self->_amount;
  self->_amount = v27;

  objc_msgSend(v21, "pk_encryptedDecimalNumberForKey:", @"subtotalAmount");
  uint64_t v29 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  subtotalAmount = self->_subtotalAmount;
  self->_subtotalAmount = v29;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"currencyCode");
  uint64_t v31 = (NSString *)objc_claimAutoreleasedReturnValue();
  currencyCode = self->_currencyCode;
  self->_currencyCode = v31;

  objc_msgSend(v21, "pk_encryptedDateForKey:", @"transactionDate");
  uint64_t v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
  transactionDate = self->_transactionDate;
  self->_transactionDate = v33;

  objc_msgSend(v21, "pk_encryptedDateForKey:", @"transactionStatusChangedDate");
  uint64_t v35 = (NSDate *)objc_claimAutoreleasedReturnValue();
  transactionStatusChangedDate = self->_transactionStatusChangedDate;
  self->_transactionStatusChangedDate = v35;

  objc_msgSend(v21, "pk_encryptedDateForKey:", @"expirationDate");
  unint64_t v37 = (NSDate *)objc_claimAutoreleasedReturnValue();
  expirationDate = self->_expirationDate;
  self->_expirationDate = v37;

  uint64_t v39 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"transactionStatus");
  self->_transactionStatus = PKPaymentTransactionStatusFromString(v39);

  uint64_t v40 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"transactionDeclinedReason");
  self->_transactionDeclinedReason = PKPaymentTransactionDeclinedReasonFromString(v40);

  uint64_t v41 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"transactionType");
  self->_int64_t transactionType = PKPaymentTransactionTypeFromString(v41);

  int64_t v42 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"adjustmentType");
  self->_adjustmentType = PKPaymentTransactionAdjustmentSubtypeFromString(v42);

  self->_suppressNotifications = objc_msgSend(v21, "pk_encryptedBoolForKey:", @"blockNotification");
  self->_recurring = objc_msgSend(v21, "pk_encryptedBoolForKey:", @"recurring");
  uint64_t v43 = objc_msgSend(v21, "pk_stringForKey:", @"feature");
  self->_unint64_t accountType = PKPaymentTransactionAccountTypeFromString(v43);

  uint64_t v44 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"peerPaymentType");
  self->_peerPaymentType = PKPaymentTransactionPeerPaymentSubtypeFromString(v44);

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"peerPaymentCounterpartHandle");
  uint64_t v45 = (NSString *)objc_claimAutoreleasedReturnValue();
  peerPaymentCounterpartHandle = self->_peerPaymentCounterpartHandle;
  self->_peerPaymentCounterpartHandle = v45;

  objc_msgSend(v21, "pk_encryptedDecimalNumberForKey:", @"primaryFundingSourceAmount");
  uint64_t v47 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  primaryFundingSourceAmount = self->_primaryFundingSourceAmount;
  self->_primaryFundingSourceAmount = v47;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"primaryFundingSourceCurrencyCode");
  double v49 = (NSString *)objc_claimAutoreleasedReturnValue();
  primaryFundingSourceCurrencyCode = self->_primaryFundingSourceCurrencyCode;
  self->_primaryFundingSourceCurrencyCode = v49;

  objc_msgSend(v21, "pk_encryptedDecimalNumberForKey:", @"secondaryFundingSourceAmount");
  double v51 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  secondaryFundingSourceAmount = self->_secondaryFundingSourceAmount;
  self->_secondaryFundingSourceAmount = v51;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"secondaryFundingSourceCurrencyCode");
  double v53 = (NSString *)objc_claimAutoreleasedReturnValue();
  secondaryFundingSourceCurrencyCode = self->_secondaryFundingSourceCurrencyCode;
  self->_secondaryFundingSourceCurrencyCode = v53;

  uint64_t v55 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"secondaryFundingSourceNetwork");
  self->_secondaryFundingSourceNetwork = PKPaymentCredentialTypeForPaymentNetworkName(v55);

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"secondaryFundingSourceDPANSuffix");
  id v56 = (NSString *)objc_claimAutoreleasedReturnValue();
  secondaryFundingSourceDPANSuffix = self->_secondaryFundingSourceDPANSuffix;
  self->_secondaryFundingSourceDPANSuffix = v56;

  self->_deviceScoreIdentifiersRequired = objc_msgSend(v21, "pk_BOOLForKey:", @"deviceScoreIdentifiersRequired");
  uint64_t v58 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"secondaryFundingSourceType");
  if ([@"bankAccount" isEqualToString:v58])
  {
    int64_t v59 = 1;
  }
  else
  {
    int v62 = [@"debit" isEqualToString:v58];
    int64_t v59 = 2;
    if (!v62) {
      int64_t v59 = 0;
    }
  }
  self->_int64_t secondaryFundingSourceType = v59;
  if (self->_transactionType == 5 && !v58 && !v59) {
    self->_int64_t secondaryFundingSourceType = 1;
  }
  if ([(PKPaymentTransaction *)self _supportsServerFundingDescription])
  {
    v60 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"secondaryFundingSourceDescription");
  }
  else
  {
    v60 = 0;
  }
  objc_msgSend(v21, "pk_encryptedDecimalNumberForKey:", @"rewardsTotalAmount");
  double v63 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  rewardsTotalAmount = self->_rewardsTotalAmount;
  self->_rewardsTotalAmount = v63;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"rewardsTotalCurrencyCode");
  uint64_t v65 = (NSString *)objc_claimAutoreleasedReturnValue();
  rewardsTotalCurrencyCode = self->_rewardsTotalCurrencyCode;
  self->_rewardsTotalCurrencyCode = v65;

  uint64_t v67 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"cardType");
  self->_cardType = PKPaymentTransactionSourceFromString(v67);

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"merchantProvidedDescription");
  id v68 = (NSString *)objc_claimAutoreleasedReturnValue();
  merchantProvidedDescription = self->_merchantProvidedDescription;
  self->_merchantProvidedDescription = v68;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"merchantProvidedTitle");
  double v70 = (NSString *)objc_claimAutoreleasedReturnValue();
  merchantProvidedTitle = self->_merchantProvidedTitle;
  self->_merchantProvidedTitle = v70;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"altDSID");
  BOOL v72 = (NSString *)objc_claimAutoreleasedReturnValue();
  altDSID = self->_altDSID;
  self->_altDSID = v72;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"accountIdentifier");
  v74 = (NSString *)objc_claimAutoreleasedReturnValue();
  accountIdentifier = self->_accountIdentifier;
  self->_accountIdentifier = v74;

  if (!self->_accountIdentifier)
  {
    objc_msgSend(v21, "pk_encryptedStringForKey:", @"peerPaymentAccountIdentifier");
    v76 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v77 = self->_accountIdentifier;
    self->_accountIdentifier = v76;
  }
  objc_msgSend(v21, "pk_encryptedStringForKey:", @"lifecycleIdentifier");
  v78 = (NSString *)objc_claimAutoreleasedReturnValue();
  lifecycleIdentifier = self->_lifecycleIdentifier;
  self->_lifecycleIdentifier = v78;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"authNetworkData");
  uint64_t v80 = (NSString *)objc_claimAutoreleasedReturnValue();
  authNetworkData = self->_authNetworkData;
  self->_authNetworkData = v80;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"clearingNetworkData");
  uint64_t v82 = (NSString *)objc_claimAutoreleasedReturnValue();
  clearingNetworkData = self->_clearingNetworkData;
  self->_clearingNetworkData = v82;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"cardIdentifier");
  uint64_t v84 = (NSString *)objc_claimAutoreleasedReturnValue();
  cardIdentifier = self->_cardIdentifier;
  self->_cardIdentifier = v84;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"dpanIdentifier");
  v86 = (NSString *)objc_claimAutoreleasedReturnValue();
  dpanIdentifier = self->_dpanIdentifier;
  self->_dpanIdentifier = v86;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"panIdentifier");
  v88 = (NSString *)objc_claimAutoreleasedReturnValue();
  panIdentifier = self->_panIdentifier;
  self->_panIdentifier = v88;

  objc_msgSend(v21, "pk_encryptedObjectForKey:ofClass:", @"isMerchantTokenTransaction", objc_opt_class());
  v90 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  isMerchantTokenTransaction = self->_isMerchantTokenTransaction;
  self->_isMerchantTokenTransaction = v90;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"last4Digits");
  v92 = (NSString *)objc_claimAutoreleasedReturnValue();
  cardNumberSuffix = self->_cardNumberSuffix;
  self->_cardNumberSuffix = v92;

  unint64_t v94 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"adjustmentTypeReason");
  self->_adjustmentTypeReason = PKPaymentTransactionAdjustmentSubtypeReasonFromString(v94);

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"topUpType");
  int v95 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  uint64_t v96 = v95;
  if (v95 == @"directDeposit") {
    goto LABEL_34;
  }
  if (!v95)
  {
LABEL_56:
    int64_t v98 = 0;
    goto LABEL_57;
  }
  char v97 = [(__CFString *)v95 isEqualToString:@"directDeposit"];

  if ((v97 & 1) == 0)
  {
    uint64_t v99 = v96;
    if (v99 == @"atm"
      || (id v100 = v99,
          char v101 = [(__CFString *)v99 isEqualToString:@"atm"],
          v100,
          (v101 & 1) != 0))
    {
      int64_t v98 = 2;
      goto LABEL_57;
    }
    id v102 = v100;
    if (v102 == @"transfer"
      || (uint64_t v103 = v102,
          char v104 = [(__CFString *)v102 isEqualToString:@"transfer"],
          v103,
          (v104 & 1) != 0))
    {
      int64_t v98 = 3;
      goto LABEL_57;
    }
    uint64_t v105 = v103;
    if (v105 == @"check"
      || (v106 = v105,
          char v107 = [(__CFString *)v105 isEqualToString:@"check"],
          v106,
          (v107 & 1) != 0))
    {
      int64_t v98 = 4;
      goto LABEL_57;
    }
    v108 = v106;
    if (v108 == @"inWallet"
      || (uint64_t v109 = v108,
          char v110 = [(__CFString *)v108 isEqualToString:@"inWallet"],
          v109,
          (v110 & 1) != 0))
    {
      int64_t v98 = 5;
      goto LABEL_57;
    }
    uint64_t v111 = v109;
    if (v111 == @"inStore"
      || (v112 = v111,
          char v113 = [(__CFString *)v111 isEqualToString:@"inStore"],
          v112,
          (v113 & 1) != 0))
    {
      int64_t v98 = 6;
      goto LABEL_57;
    }
    v114 = v112;
    if (v114 == @"amp"
      || (uint64_t v115 = v114,
          char v116 = [(__CFString *)v114 isEqualToString:@"amp"],
          v115,
          (v116 & 1) != 0))
    {
      int64_t v98 = 7;
      goto LABEL_57;
    }
    uint64_t v117 = v115;
    if (v117 == @"redemption"
      || (id v118 = v117,
          int v119 = [(__CFString *)v117 isEqualToString:@"redemption"],
          v118,
          v119))
    {
      int64_t v98 = 8;
      goto LABEL_57;
    }
    goto LABEL_56;
  }
LABEL_34:
  int64_t v98 = 1;
LABEL_57:

  self->_unint64_t topUpType = v98;
  id v120 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  uint64_t v61 = objc_msgSend(v21, "pk_encryptedArrayOfClasses:forKey:", v120, @"issuerQuestions");

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"referenceIdentifier");
  uint64_t v121 = (NSString *)objc_claimAutoreleasedReturnValue();
  referenceIdentifier = self->_referenceIdentifier;
  self->_referenceIdentifier = v121;

  uint64_t v123 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"associatedFeatureIdentifier");
  self->_associatedFeatureIdentifier = PKFeatureIdentifierFromString(v123);

  objc_msgSend(v21, "pk_encryptedUrlForKey:", @"receiptProviderURL");
  uint64_t v124 = (NSURL *)objc_claimAutoreleasedReturnValue();
  receiptProviderURL = self->_receiptProviderURL;
  self->_receiptProviderURL = v124;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"receiptProviderIdentifier");
  v126 = (NSString *)objc_claimAutoreleasedReturnValue();
  receiptProviderIdentifier = self->_receiptProviderIdentifier;
  self->_receiptProviderIdentifier = v126;

  objc_msgSend(v21, "pk_encryptedStringForKey:", @"receiptIdentifier");
  id v128 = (NSString *)objc_claimAutoreleasedReturnValue();
  receiptIdentifier = self->_receiptIdentifier;
  self->_receiptIdentifier = v128;

  id v130 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  objc_msgSend(v21, "pk_encryptedArrayOfClasses:forKey:", v130, @"associatedStatementIdentifiers");
  uint64_t v131 = (NSArray *)objc_claimAutoreleasedReturnValue();
  associatedStatementIdentifiers = self->_associatedStatementIdentifiers;
  self->_associatedStatementIdentifiers = v131;

  self->_interestReassessment = objc_msgSend(v21, "pk_encryptedBoolForKey:", @"interestReassessment");
  long long v133 = objc_msgSend(v21, "pk_encryptedStringForKey:", @"peerPaymentPaymentMode");
  self->_peerPaymentPaymentMode = PKPeerPaymentPaymentModeFromString(v133);

LABEL_58:
  uint64_t v134 = [v4 recordsWithRecordType:@"TransactionDeviceData"];
  BOOL v135 = [v134 firstObject];

  v198 = self;
  if (v135)
  {
    objc_msgSend(v135, "pk_encryptedDecimalNumberForKey:", @"amountAddedToAuth");
    uint64_t v136 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    amountAddedToAuth = self->_amountAddedToAuth;
    self->_amountAddedToAuth = v136;

    uint64_t v138 = objc_msgSend(v135, "pk_encryptedLocationForKey:", @"location");
    [v138 coordinate];
    self->_locationLatitude = v139;
    [v138 coordinate];
    self->_locationLongitude = v140;
    [v138 altitude];
    self->_locationAltitude = v141;
    [v138 horizontalAccuracy];
    self->_locationHorizontalAccuracy = v142;
    [v138 verticalAccuracy];
    self->_locationVerticalAccuracy = v143;
    v144 = [v138 timestamp];
    locationDate = self->_locationDate;
    self->_locationDate = v144;

    self->_coarseLocation = objc_msgSend(v135, "pk_encryptedBoolForKey:", @"isCoarseLocation");
    objc_msgSend(v135, "pk_encryptedStringForKey:", @"placemarkLocality");
    uint64_t v146 = (NSString *)objc_claimAutoreleasedReturnValue();
    locality = self->_locality;
    self->_locality = v146;

    objc_msgSend(v135, "pk_encryptedStringForKey:", @"placemarkAdministrativeArea");
    uint64_t v148 = (NSString *)objc_claimAutoreleasedReturnValue();
    administrativeArea = self->_administrativeArea;
    self->_administrativeArea = v148;

    objc_msgSend(v135, "pk_encryptedStringForKey:", @"timeZone");
    uint64_t v151 = v150 = self;
    if (v151)
    {
      uint64_t v152 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v151];
      timeZone = v150->_timeZone;
      v150->_timeZone = (NSTimeZone *)v152;
    }
    v150->_processedForLocation = objc_msgSend(v135, "pk_encryptedBoolForKey:", @"processedForLocation");
    v150->_processedForMerchantCleanup = objc_msgSend(v135, "pk_encryptedBoolForKey:", @"processedForMerchantCleanup");
    v150->_technologyType = objc_msgSend(v135, "pk_encryptedUnsignedIntegerForKey:", @"technologyType");
    uint64_t v154 = objc_msgSend(v135, "pk_encryptedStringForKey:", @"secondaryFundingSourceFPANIdentifier");
    secondaryFundingSourceFPANIdentifier = v150->_secondaryFundingSourceFPANIdentifier;
    v150->_secondaryFundingSourceFPANIdentifier = (NSString *)v154;

    if (![v60 length])
    {
      uint64_t v156 = objc_msgSend(v135, "pk_encryptedStringForKey:", @"secondaryFundingSourceDescription");

      v60 = (void *)v156;
    }
    uint64_t v157 = objc_msgSend(v135, "pk_encryptedUnsignedIntegerForKey:", @"transactionSource");
    v198->_transactionSource = v157;
    if (!v157)
    {
      int64_t transactionType = v198->_transactionType;
      if (transactionType == 8 || transactionType == 1) {
        v198->_transactionSource = 4;
      }
    }
    uint64_t v159 = objc_msgSend(v135, "pk_encryptedStringForKey:", @"peerPaymentMemo");
    peerPaymentMemo = v198->_peerPaymentMemo;
    v198->_peerPaymentMemo = (NSString *)v159;

    uint64_t v161 = objc_msgSend(v135, "pk_encryptedUUIDForKey:", @"requestDeviceScoreIdentifier");
    requestDeviceScoreIdentifier = v198->_requestDeviceScoreIdentifier;
    v198->_requestDeviceScoreIdentifier = (NSUUID *)v161;

    uint64_t v163 = objc_msgSend(v135, "pk_encryptedUUIDForKey:", @"sendDeviceScoreIdentifier");
    sendDeviceScoreIdentifier = v198->_sendDeviceScoreIdentifier;
    v198->_sendDeviceScoreIdentifier = (NSUUID *)v163;

    v198->_deviceScoreIdentifiersSubmitted = objc_msgSend(v135, "pk_encryptedBoolForKey:", @"deviceScoreIdentifiersSubmitted");
    uint64_t v165 = objc_msgSend(v135, "pk_encryptedDictionaryForKey:", @"metadata");
    metadata = v198->_metadata;
    v198->_metadata = (NSDictionary *)v165;

    v167 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    uint64_t v168 = objc_msgSend(v135, "pk_encryptedArrayOfClasses:forKey:", v167, @"issuerQuestionsAnswered");

    uint64_t v169 = objc_msgSend(v135, "pk_encryptedStringForKey:", @"peerPaymentCounterpartImageRecordIdentifier");
    peerPaymentCounterpartImageRecordIdentifier = v198->_peerPaymentCounterpartImageRecordIdentifier;
    v198->_peerPaymentCounterpartImageRecordIdentifier = (NSString *)v169;
  }
  else
  {
    uint64_t v168 = 0;
  }
  if ([v60 length]) {
    objc_storeStrong((id *)&v198->_secondaryFundingSourceDescription, v60);
  }
  uint64_t v194 = v135;
  v195 = v60;
  uint64_t v196 = v4;
  id v171 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v207 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  id v172 = v61;
  uint64_t v173 = [v172 countByEnumeratingWithState:&v207 objects:v213 count:16];
  if (v173)
  {
    uint64_t v174 = v173;
    uint64_t v175 = *(void *)v208;
    do
    {
      for (uint64_t i = 0; i != v174; ++i)
      {
        if (*(void *)v208 != v175) {
          objc_enumerationMutation(v172);
        }
        v177 = [[PKPaymentTransactionQuestion alloc] initWithDictionary:*(void *)(*((void *)&v207 + 1) + 8 * i)];
        [v171 addObject:v177];
      }
      uint64_t v174 = [v172 countByEnumeratingWithState:&v207 objects:v213 count:16];
    }
    while (v174);
  }
  v193 = v172;

  uint64_t v178 = v198;
  if ([v171 count])
  {
    uint64_t v179 = objc_msgSend(v171, "copy", v172, v194, v60, v196);
    questions = v198->_questions;
    v198->_questions = (NSSet *)v179;
  }
  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  obuint64_t j = v168;
  uint64_t v181 = [obj countByEnumeratingWithState:&v203 objects:v212 count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = *(void *)v204;
    do
    {
      for (uint64_t j = 0; j != v182; ++j)
      {
        if (*(void *)v204 != v183) {
          objc_enumerationMutation(obj);
        }
        uint64_t v185 = PKPaymentTransactionQuestionTypeFromString(*(void **)(*((void *)&v203 + 1) + 8 * j));
        long long v199 = 0u;
        long long v200 = 0u;
        long long v201 = 0u;
        long long v202 = 0u;
        uint64_t v186 = v178->_questions;
        uint64_t v187 = [(NSSet *)v186 countByEnumeratingWithState:&v199 objects:v211 count:16];
        if (v187)
        {
          uint64_t v188 = v187;
          uint64_t v189 = *(void *)v200;
LABEL_87:
          uint64_t v190 = 0;
          while (1)
          {
            if (*(void *)v200 != v189) {
              objc_enumerationMutation(v186);
            }
            v191 = *(void **)(*((void *)&v199 + 1) + 8 * v190);
            if (objc_msgSend(v191, "type", v193) == v185) {
              break;
            }
            if (v188 == ++v190)
            {
              uint64_t v188 = [(NSSet *)v186 countByEnumeratingWithState:&v199 objects:v211 count:16];
              if (v188) {
                goto LABEL_87;
              }
              uint64_t v178 = v198;
              goto LABEL_96;
            }
          }
          uint64_t v192 = v191;

          uint64_t v178 = v198;
          if (!v192) {
            continue;
          }
          [(NSSet *)v192 setAnswered:1];
          uint64_t v186 = v192;
        }
LABEL_96:
      }
      uint64_t v182 = [obj countByEnumeratingWithState:&v203 objects:v212 count:16];
    }
    while (v182);
  }
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  id v6 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    id v7 = v6;
    [(PKPaymentTransaction *)self _encodeDeviceDataWithCloudStoreCoder:v6 codingType:a4];
    id v6 = v7;
  }
  if (a4 - 1 <= 1)
  {
    id v8 = v6;
    [(PKPaymentTransaction *)self _encodeServerDataWithCloudStoreCoder:v6 codingType:a4];
    id v6 = v8;
  }
}

- (void)_encodeDeviceDataWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(PKMerchant *)self->_merchant encodeWithCloudStoreCoder:v6 codingType:a4];
  [(PKPaymentTransactionFees *)self->_fees encodeWithCloudStoreCoder:v6 codingType:a4];
  [(PKPaymentTransactionRewards *)self->_rewards encodeWithCloudStoreCoder:v6 codingType:a4 property:0];
  [(PKPaymentTransactionRewards *)self->_rewardsInProgress encodeWithCloudStoreCoder:v6 codingType:a4 property:1];
  [(PKPaymentTransactionForeignExchangeInformation *)self->_foreignExchangeInformation encodeWithCloudStoreCoder:v6 codingType:a4];
  id v7 = [v6 recordsWithRecordType:@"TransactionDeviceData"];
  id v8 = [v7 firstObject];

  uint64_t v9 = [v8 encryptedValues];
  id v10 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  serviceIdentifier = self->_serviceIdentifier;
  uint64_t v12 = [v8 recordID];
  uint64_t v13 = [v12 zoneID];
  uint64_t v14 = [v10 initWithRecordName:serviceIdentifier zoneID:v13];

  uint64_t v44 = (void *)v14;
  uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"Transaction" recordID:v14];
  int64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecord:v43 action:0];
  [v8 setObject:v42 forKey:@"transactionRecord"];
  uint64_t v15 = [(NSDecimalNumber *)self->_amountAddedToAuth description];
  [v9 setObject:v15 forKey:@"amountAddedToAuth"];

  unint64_t v16 = [(PKPaymentTransaction *)self location];
  [v9 setObject:v16 forKey:@"location"];

  [v9 setObject:self->_locality forKey:@"placemarkLocality"];
  [v9 setObject:self->_administrativeArea forKey:@"placemarkAdministrativeArea"];
  uint64_t v17 = [NSNumber numberWithBool:self->_processedForLocation];
  [v9 setObject:v17 forKey:@"processedForLocation"];

  unint64_t v18 = [NSNumber numberWithBool:self->_processedForMerchantCleanup];
  [v9 setObject:v18 forKey:@"processedForMerchantCleanup"];

  uint64_t v19 = [(NSTimeZone *)self->_timeZone name];
  [v9 setObject:v19 forKey:@"timeZone"];

  uint64_t v20 = [NSNumber numberWithInteger:self->_technologyType];
  [v9 setObject:v20 forKey:@"technologyType"];

  [v9 setObject:self->_secondaryFundingSourceFPANIdentifier forKey:@"secondaryFundingSourceFPANIdentifier"];
  if (![(PKPaymentTransaction *)self _supportsServerFundingDescription]) {
    [v9 setObject:self->_secondaryFundingSourceDescription forKey:@"secondaryFundingSourceDescription"];
  }
  uint64_t v21 = [NSNumber numberWithUnsignedInteger:self->_transactionSource];
  [v9 setObject:v21 forKey:@"transactionSource"];

  [v9 setObject:self->_peerPaymentMemo forKey:@"peerPaymentMemo"];
  unint64_t v22 = [(NSUUID *)self->_requestDeviceScoreIdentifier UUIDString];
  [v9 setObject:v22 forKey:@"requestDeviceScoreIdentifier"];

  uint64_t v23 = [(NSUUID *)self->_sendDeviceScoreIdentifier UUIDString];
  [v9 setObject:v23 forKey:@"sendDeviceScoreIdentifier"];

  int64_t v24 = [NSNumber numberWithBool:self->_deviceScoreIdentifiersSubmitted];
  [v9 setObject:v24 forKey:@"deviceScoreIdentifiersSubmitted"];

  uint64_t v25 = [(NSTimeZone *)self->_timeZone name];
  [v9 setObject:v25 forKey:@"timeZone"];

  uint64_t v26 = [NSNumber numberWithBool:self->_coarseLocation];
  [v9 setObject:v26 forKey:@"isCoarseLocation"];

  [v9 setObject:self->_peerPaymentCounterpartImageRecordIdentifier forKey:@"peerPaymentCounterpartImageRecordIdentifier"];
  uint64_t v27 = [v6 cloudStoreSpecificKeys];
  uint64_t v28 = [v27 objectForKey:@"originDeviceID"];
  [v9 setObject:v28 forKey:@"originDeviceID"];

  metadata = self->_metadata;
  if (metadata)
  {
    char v30 = [MEMORY[0x1E4F28D90] dataWithJSONObject:metadata options:0 error:0];
    uint64_t v31 = (void *)[[NSString alloc] initWithData:v30 encoding:4];
  }
  else
  {
    uint64_t v31 = 0;
  }
  [v9 setObject:v31 forKey:@"metadata"];
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v33 = self->_questions;
  uint64_t v34 = [(NSSet *)v33 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if ([v38 answered])
        {
          uint64_t v39 = PKPaymentTransactionQuestionTypeToString([v38 type]);
          [v32 addObject:v39];
        }
      }
      uint64_t v35 = [(NSSet *)v33 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v35);
  }

  if ([v32 count])
  {
    uint64_t v40 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v32 options:0 error:0];
    uint64_t v41 = (void *)[[NSString alloc] initWithData:v40 encoding:4];
    [v9 setObject:v41 forKey:@"issuerQuestionsAnswered"];
  }
}

- (void)_encodeServerDataWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(PKMerchant *)self->_merchant encodeWithCloudStoreCoder:v6 codingType:a4];
  [(PKPaymentTransactionFees *)self->_fees encodeWithCloudStoreCoder:v6 codingType:a4];
  [(PKPaymentTransactionForeignExchangeInformation *)self->_foreignExchangeInformation encodeWithCloudStoreCoder:v6 codingType:a4];
  [(PKPaymentTransactionRewards *)self->_rewards encodeWithCloudStoreCoder:v6 codingType:a4 property:0];
  [(PKPaymentTransactionRewards *)self->_rewardsInProgress encodeWithCloudStoreCoder:v6 codingType:a4 property:1];
  id v7 = [v6 recordsWithRecordType:@"Transaction"];
  id v8 = [v7 firstObject];

  uint64_t v9 = [v8 encryptedValues];
  [v9 setObject:self->_serviceIdentifier forKey:@"identifier"];
  id v10 = [(NSString *)self->_paymentHash uppercaseString];
  [v9 setObject:v10 forKey:@"paymentHash"];

  uint64_t v11 = PKPaymentTransactionTypeToString(self->_transactionType);
  [v9 setObject:v11 forKey:@"transactionType"];

  uint64_t v12 = [(NSDecimalNumber *)self->_amount description];
  [v9 setObject:v12 forKey:@"amount"];

  uint64_t v13 = [(NSDecimalNumber *)self->_subtotalAmount description];
  [v9 setObject:v13 forKey:@"subtotalAmount"];

  [v9 setObject:self->_currencyCode forKey:@"currencyCode"];
  [v9 setObject:self->_transactionDate forKey:@"transactionDate"];
  [v9 setObject:self->_transactionStatusChangedDate forKey:@"transactionStatusChangedDate"];
  [v9 setObject:self->_expirationDate forKey:@"expirationDate"];
  uint64_t v14 = PKPaymentTransactionStatusToString(self->_transactionStatus);
  [v9 setObject:v14 forKey:@"transactionStatus"];

  uint64_t v15 = PKPaymentTransactionTypeToString(self->_transactionType);
  [v9 setObject:v15 forKey:@"transactionType"];

  unint64_t v16 = self->_peerPaymentType - 1;
  uint64_t v17 = @"unknown";
  unint64_t v18 = @"unknown";
  if (v16 <= 5) {
    unint64_t v18 = off_1E56F4310[v16];
  }
  [v9 setObject:v18 forKey:@"peerPaymentType"];
  [v9 setObject:self->_peerPaymentCounterpartHandle forKey:@"peerPaymentCounterpartHandle"];
  uint64_t v19 = [(NSDecimalNumber *)self->_primaryFundingSourceAmount description];
  [v9 setObject:v19 forKey:@"primaryFundingSourceAmount"];

  [v9 setObject:self->_primaryFundingSourceCurrencyCode forKey:@"primaryFundingSourceCurrencyCode"];
  uint64_t v20 = [(NSDecimalNumber *)self->_secondaryFundingSourceAmount description];
  [v9 setObject:v20 forKey:@"secondaryFundingSourceAmount"];

  [v9 setObject:self->_secondaryFundingSourceCurrencyCode forKey:@"secondaryFundingSourceCurrencyCode"];
  uint64_t v21 = PKPaymentNetworkNameForPaymentCredentialType(self->_secondaryFundingSourceNetwork);
  [v9 setObject:v21 forKey:@"secondaryFundingSourceNetwork"];

  [v9 setObject:self->_secondaryFundingSourceDPANSuffix forKey:@"secondaryFundingSourceDPANSuffix"];
  [v9 setObject:self->_merchantProvidedDescription forKey:@"merchantProvidedDescription"];
  [v9 setObject:self->_merchantProvidedTitle forKey:@"merchantProvidedTitle"];
  unint64_t v22 = [NSNumber numberWithBool:self->_suppressNotifications];
  [v9 setObject:v22 forKey:@"blockNotification"];

  int64_t secondaryFundingSourceType = self->_secondaryFundingSourceType;
  int64_t v24 = @"bankAccount";
  if (secondaryFundingSourceType == 2) {
    int64_t v24 = @"debit";
  }
  if (secondaryFundingSourceType) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = @"unknown";
  }
  [v9 setObject:v25 forKey:@"secondaryFundingSourceType"];
  uint64_t v26 = [(NSDecimalNumber *)self->_rewardsTotalAmount description];
  [v9 setObject:v26 forKey:@"rewardsTotalAmount"];

  [v9 setObject:self->_rewardsTotalCurrencyCode forKey:@"rewardsTotalCurrencyCode"];
  unint64_t v27 = self->_cardType - 1;
  if (v27 <= 7) {
    uint64_t v17 = off_1E56F4340[v27];
  }
  [v9 setObject:v17 forKey:@"cardType"];
  [v9 setObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v9 setObject:self->_altDSID forKey:@"altDSID"];
  [v9 setObject:self->_lifecycleIdentifier forKey:@"lifecycleIdentifier"];
  [v9 setObject:self->_authNetworkData forKey:@"authNetworkData"];
  [v9 setObject:self->_clearingNetworkData forKey:@"clearingNetworkData"];
  [v9 setObject:self->_cardIdentifier forKey:@"cardIdentifier"];
  [v9 setObject:self->_cardNumberSuffix forKey:@"last4Digits"];
  unint64_t v28 = self->_adjustmentTypeReason - 1;
  if (v28 > 9) {
    uint64_t v29 = @"unknown";
  }
  else {
    uint64_t v29 = off_1E56F4380[v28];
  }
  [v9 setObject:v29 forKey:@"adjustmentTypeReason"];
  unint64_t topUpType = self->_topUpType;
  if (topUpType > 8) {
    uint64_t v31 = 0;
  }
  else {
    uint64_t v31 = off_1E56F43D0[topUpType];
  }
  [v9 setObject:v31 forKey:@"topUpType"];
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v33 = self->_questions;
  uint64_t v34 = [(NSSet *)v33 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v66;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v66 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * v37), "dictionaryRepresentation", (void)v65);
        [v32 addObject:v38];

        ++v37;
      }
      while (v35 != v37);
      uint64_t v35 = [(NSSet *)v33 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v35);
  }

  if ([v32 count])
  {
    uint64_t v39 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v32 options:0 error:0];
    uint64_t v40 = (void *)[[NSString alloc] initWithData:v39 encoding:4];
    [v9 setObject:v40 forKey:@"issuerQuestions"];
  }
  objc_msgSend(v9, "setObject:forKey:", self->_referenceIdentifier, @"referenceIdentifier", (void)v65);
  uint64_t v41 = PKFeatureIdentifierToString(self->_associatedFeatureIdentifier);
  [v9 setObject:v41 forKey:@"associatedFeatureIdentifier"];

  int64_t v42 = [(NSURL *)self->_receiptProviderURL absoluteString];
  [v9 setObject:v42 forKey:@"receiptProviderURL"];

  [v9 setObject:self->_receiptIdentifier forKey:@"receiptIdentifier"];
  [v9 setObject:self->_receiptProviderIdentifier forKey:@"receiptProviderIdentifier"];
  uint64_t v43 = [NSNumber numberWithBool:self->_deviceScoreIdentifiersRequired];
  [v8 setObject:v43 forKey:@"deviceScoreIdentifiersRequired"];

  unint64_t accountType = self->_accountType;
  if (accountType > 4) {
    long long v45 = @"unknown";
  }
  else {
    long long v45 = off_1E56F4418[accountType];
  }
  [v8 setObject:v45 forKey:@"feature"];
  long long v46 = [v6 cloudStoreSpecificKeys];
  long long v47 = [v46 objectForKey:@"cloudVersion"];
  [v9 setObject:v47 forKey:@"cloudVersion"];

  long long v48 = [v6 cloudStoreSpecificKeys];
  double v49 = [v48 objectForKey:@"dpanIdentifier"];
  [v9 setObject:v49 forKey:@"dpanIdentifier"];

  uint64_t v50 = [v6 cloudStoreSpecificKeys];
  double v51 = [v50 objectForKey:@"panIdentifier"];
  [v9 setObject:v51 forKey:@"panIdentifier"];

  double v52 = [v6 cloudStoreSpecificKeys];
  double v53 = [v52 objectForKey:@"isMerchantTokenTransaction"];
  [v9 setObject:v53 forKey:@"isMerchantTokenTransaction"];

  v54 = [v6 cloudStoreSpecificKeys];
  uint64_t v55 = [v54 objectForKey:@"fpanIdentifier"];
  [v9 setObject:v55 forKey:@"fpanIdentifier"];

  id v56 = [v6 cloudStoreSpecificKeys];
  uint64_t v57 = [v56 objectForKey:@"passSerialNumber"];
  [v9 setObject:v57 forKey:@"passSerialNumber"];

  uint64_t v58 = [v6 cloudStoreSpecificKeys];
  int64_t v59 = [v58 objectForKey:@"passTypeIdentifier"];
  [v9 setObject:v59 forKey:@"passTypeIdentifier"];

  if (PKApplePayContainerEnvironment() == 2)
  {
    v60 = [NSNumber numberWithBool:self->_recurring];
    [v9 setObject:v60 forKey:@"recurring"];
  }
  if (self->_associatedStatementIdentifiers)
  {
    id v61 = [NSString alloc];
    int v62 = [MEMORY[0x1E4F28D90] dataWithJSONObject:self->_associatedStatementIdentifiers options:0 error:0];
    double v63 = (void *)[v61 initWithData:v62 encoding:4];

    [v9 setObject:v63 forKey:@"associatedStatementIdentifiers"];
  }
  double v64 = [NSNumber numberWithBool:self->_interestReassessment];
  [v9 setObject:v64 forKey:@"interestReassessment"];
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  int64_t v5 = objc_opt_class();
  serviceIdentifier = self->_serviceIdentifier;
  return (id)[v5 recordTypesAndNamesForCodingType:a3 serviceIdentifier:serviceIdentifier];
}

+ (id)recordTypesAndNamesForCodingType:(unint64_t)a3 serviceIdentifier:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 length])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = v6;
    if (a3 - 1 <= 1) {
      [v6 setObject:v5 forKeyedSubscript:@"Transaction"];
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      id v8 = NSString;
      uint64_t v9 = [(id)objc_opt_class() recordNamePrefix];
      id v10 = [v8 stringWithFormat:@"%@%@", v9, v5];
      [v7 setObject:v10 forKeyedSubscript:@"TransactionDeviceData"];
    }
    v13[0] = v7;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)itemType
{
  return 1;
}

+ (id)recordNamePrefix
{
  return @"device-";
}

- (id)primaryIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)hasPendingAmounts
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(PKPaymentTransaction *)self amounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isPending])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)transactionAmountsForMultipleAmounts
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v49 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = [(PKPaymentTransaction *)self amounts];
  uint64_t v50 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v50)
  {
    uint64_t v4 = *(void *)v59;
    uint64_t v47 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v59 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        long long v7 = objc_msgSend(v6, "amount", v45);
        long long v8 = [v7 currency];
        double v51 = [v7 amount];
        uint64_t v9 = [v7 exponent];
        int v10 = [v6 isPending];
        uint64_t v11 = v8;
        uint64_t v12 = v11;
        if (v11 == @"XXX")
        {
        }
        else
        {
          char v13 = 0;
          if (@"XXX" && v11) {
            char v13 = [(__CFString *)v11 isEqualToString:@"XXX"];
          }

          if ((v13 & 1) == 0 && v12)
          {
            if ([v49 containsObject:v12])
            {
              uint64_t v14 = [v46 objectForKeyedSubscript:v12];
              uint64_t v15 = [v14 amount];
              unint64_t v16 = [v15 amount];

              uint64_t v17 = [v16 decimalNumberByAdding:v51];
              unint64_t v18 = PKCurrencyAmountCreate(v17, &v12->isa, 0);
              uint64_t v19 = [[PKTransactionAmount alloc] initWithCurrencyAmount:v18];
              [v46 setObject:v19 forKeyedSubscript:v12];

              uint64_t v4 = v47;
            }
            else
            {
              uint64_t v14 = (void *)[v6 copy];
              [v46 setObject:v14 forKeyedSubscript:v12];
            }

            [v49 addObject:v12];
            goto LABEL_21;
          }
        }
        uint64_t v20 = [PKCurrencyAmount alloc];
        if (v10)
        {
          uint64_t v21 = [v7 preformattedString];
          unint64_t v22 = [(PKCurrencyAmount *)v20 initWithAmount:v51 exponent:v9 preformattedString:v21];

          uint64_t v23 = [PKTransactionAmount alloc];
          int64_t v24 = [v6 unitIdentifier];
          uint64_t v25 = [(PKTransactionAmount *)v23 initWithPendingCurrencyAmount:v22 unitIdentifier:v24];
        }
        else
        {
          uint64_t v26 = [v6 amount];
          unint64_t v27 = [v26 absoluteValue];
          [v27 formattedStringValue];
          uint64_t v29 = v28 = v3;
          unint64_t v22 = [(PKCurrencyAmount *)v20 initWithAmount:v51 exponent:v9 preformattedString:v29];

          id v3 = v28;
          char v30 = [PKTransactionAmount alloc];
          int64_t v24 = [v6 label];
          uint64_t v31 = [v6 unitIdentifier];
          id v32 = v30;
          uint64_t v4 = v47;
          uint64_t v25 = [(PKTransactionAmount *)v32 initWithCurrencyAmount:v22 label:v24 unitIdentifier:v31];
        }
        [v3 addObject:v25];

LABEL_21:
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v50);
  }

  uint64_t v33 = [v49 allObjects];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __60__PKPaymentTransaction_transactionAmountsForMultipleAmounts__block_invoke;
  v56[3] = &unk_1E56E9330;
  id v34 = v49;
  id v57 = v34;
  uint64_t v35 = [v33 sortedArrayUsingComparator:v56];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v36 = v35;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v52 objects:v62 count:16];
  uint64_t v38 = v45;
  if (v37)
  {
    uint64_t v39 = v37;
    uint64_t v40 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(v36);
        }
        int64_t v42 = objc_msgSend(v46, "objectForKeyedSubscript:", *(void *)(*((void *)&v52 + 1) + 8 * j), v45);
        if (v42) {
          [v38 addObject:v42];
        }
      }
      uint64_t v39 = [v36 countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v39);
  }

  if ([v3 count]) {
    [v38 addObjectsFromArray:v3];
  }
  uint64_t v43 = objc_msgSend(v38, "copy", v45);

  return v43;
}

uint64_t __60__PKPaymentTransaction_transactionAmountsForMultipleAmounts__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 countForObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  if (v7 > v8) {
    return -1;
  }
  else {
    return v7 < v8;
  }
}

- (id)dictionaryOfFormattedMultipleAmountTotalsByRealCurrency
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v4 = [(PKPaymentTransaction *)self transactionAmountsForMultipleAmounts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        int v10 = [v9 amount];
        uint64_t v11 = [v10 currency];

        if (([v11 isEqualToString:@"XXX"] & 1) == 0)
        {
          uint64_t v12 = [v9 amount];
          char v13 = [v12 amount];
          [v3 setObject:v13 forKeyedSubscript:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v6);
  }

  if (self->_amount && self->_currencyCode)
  {
    uint64_t v14 = objc_msgSend(v3, "objectForKeyedSubscript:");
    uint64_t v15 = v14;
    amount = self->_amount;
    if (v14)
    {
      uint64_t v17 = [v14 decimalNumberByAdding:amount];
      [v3 setObject:v17 forKeyedSubscript:self->_currencyCode];
    }
    else
    {
      [v3 setObject:amount forKeyedSubscript:self->_currencyCode];
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v18 = [v3 keyEnumerator];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(NSString **)(*((void *)&v34 + 1) + 8 * j);
        int64_t v24 = [v3 objectForKeyedSubscript:v23];
        uint64_t v25 = PKCurrencyAmountCreate(v24, v23, 0);

        uint64_t v26 = [v25 absoluteValue];
        unint64_t v27 = [v26 formattedStringValue];

        id v28 = [v25 amount];
        int v29 = objc_msgSend(v28, "pk_isNegativeNumber");

        if (v29)
        {
          uint64_t v30 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EE0F6808.isa, v27);

          unint64_t v27 = (void *)v30;
        }
        [v33 setObject:v27 forKeyedSubscript:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v20);
  }

  uint64_t v31 = (void *)[v33 copy];
  return v31;
}

- (id)formattedStringForMultipleAmountsForPass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentTransaction *)self transactionAmountsForMultipleAmounts];
  unint64_t v6 = [v5 count];
  NSUInteger v7 = [(NSArray *)self->_plans count];
  if (v6 | v7)
  {
    unint64_t v13 = v7;
    if (v6 >= 2)
    {
      uint64_t v14 = [(PKPaymentTransaction *)self _preformattedStringForMultipleAmounts];
      uint64_t v20 = PKPassLocalizedStringWithFormat(@"TRANSACTION_MULTIPLE_AMOUNTS_JOIN_STRING", v4, 0, v15, v16, v17, v18, v19, 0);
      uint64_t v21 = [v14 componentsJoinedByString:v20];

      if (v14 && (unint64_t)[v14 count] >= 2)
      {
        id v27 = v21;
      }
      else
      {
        if (v13)
        {
          id v33 = 0;
LABEL_15:

LABEL_19:
          goto LABEL_24;
        }
        PKPassLocalizedStringWithFormat(@"TRANSACTION_MULTIPLE_AMOUNTS_PLUS_OTHER", v4, @"%@", v22, v23, v24, v25, v26, (uint64_t)v21);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v33 = v27;
      goto LABEL_15;
    }
    if (v6 == 1)
    {
      uint64_t v14 = [v5 firstObject];
      id v33 = [(PKPaymentTransaction *)self _formatBalanceAdjustmentTransactionAmount:v14];
      if (v13 <= 1)
      {
        if (v13 != 1) {
          goto LABEL_19;
        }
        long long v34 = @"TRANSACTION_MULTIPLE_AMOUNTS_PLUS_COMMUTE_PLAN";
      }
      else
      {
        long long v34 = @"TRANSACTION_MULTIPLE_AMOUNTS_PLUS_COMMUTE_PLANS";
      }
      uint64_t v35 = PKPassLocalizedStringWithFormat(v34, v4, @"%@", v28, v29, v30, v31, v32, (uint64_t)v33);

      id v33 = (void *)v35;
      goto LABEL_19;
    }
    if (v7 >= 2)
    {
      PKPassLocalizedStringWithFormat(@"TRANSACTION_COMMUTE_PLANS_USED", v4, 0, v8, v9, v10, v11, v12, 0);
      id v33 = LABEL_22:;
      goto LABEL_24;
    }
    if (v7 == 1)
    {
      PKPassLocalizedStringWithFormat(@"TRANSACTION_COMMUTE_PLAN_USED", v4, 0, v8, v9, v10, v11, v12, 0);
      goto LABEL_22;
    }
  }
  id v33 = 0;
LABEL_24:

  return v33;
}

- (id)_preformattedStringForMultiplePlans
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PKPaymentTransaction *)self plans];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) label];
        [v3 safelyAddObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

- (id)_preformattedStringForMultipleAmounts
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PKPaymentTransaction *)self transactionAmountsForMultipleAmounts];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) amount];
        uint64_t v10 = [v9 formattedStringValue];

        if (v10)
        {
          uint64_t v11 = v10;
          if (v11 != &stru_1EE0F5368)
          {
            long long v12 = v11;
            char v13 = [(__CFString *)v11 isEqualToString:&stru_1EE0F5368];

            if ((v13 & 1) == 0) {
              [v3 addObject:v12];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  long long v14 = (void *)[v3 copy];

  return v14;
}

- (BOOL)isZeroTransaction
{
  id v3 = [(PKPaymentTransaction *)self amount];
  id v4 = v3;
  if (v3 && !objc_msgSend(v3, "pk_isZeroNumber"))
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v5 = [(PKPaymentTransaction *)self amounts];
    BOOL v6 = [v5 count] == 0;
  }
  return v6;
}

- (NSString)displayLocation
{
  unint64_t v3 = [(PKPaymentTransaction *)self effectiveTransactionSource];
  if (v3 <= 8 && (((1 << v3) & 0x1D8) != 0 || v3 == 2 && (!self->_releasedData || !self->_requiresLocation)))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = PKMerchantFormattedLocationForTransaction(self->_merchant, self);
  }
  return (NSString *)v4;
}

- (CLLocation)location
{
  [(PKPaymentTransaction *)self locationLatitude];
  CLLocationDegrees v4 = v3;
  [(PKPaymentTransaction *)self locationLongitude];
  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(v4, v5);
  [(PKPaymentTransaction *)self locationAltitude];
  double v8 = v7;
  [(PKPaymentTransaction *)self locationHorizontalAccuracy];
  double v10 = v9;
  [(PKPaymentTransaction *)self locationVerticalAccuracy];
  double v12 = v11;
  char v13 = [(PKPaymentTransaction *)self locationDate];
  if (v6.latitude == 0.0 && v6.longitude == 0.0)
  {
    long long v14 = 0;
  }
  else
  {
    long long v14 = 0;
    if (CLLocationCoordinate2DIsValid(v6) && v10 > 0.0 && v13) {
      long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5F0]), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v13, v6.latitude, v6.longitude, v8, v10, v12);
    }
  }

  return (CLLocation *)v14;
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  -[PKPaymentTransaction setLocationLatitude:](self, "setLocationLatitude:");
  [(PKPaymentTransaction *)self setLocationLongitude:v6];
  [v4 altitude];
  -[PKPaymentTransaction setLocationAltitude:](self, "setLocationAltitude:");
  [v4 horizontalAccuracy];
  -[PKPaymentTransaction setLocationHorizontalAccuracy:](self, "setLocationHorizontalAccuracy:");
  [v4 verticalAccuracy];
  -[PKPaymentTransaction setLocationVerticalAccuracy:](self, "setLocationVerticalAccuracy:");
  id v7 = [v4 timestamp];

  [(PKPaymentTransaction *)self setLocationDate:v7];
}

- (NSDecimalNumber)rewardsTotalAmount
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v3 = self->_rewardsTotalAmount;
  id v4 = [(PKPaymentTransactionRewards *)self->_rewards rewardsItems];
  int v5 = [v4 count] != 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v6 = [(PKPaymentTransactionRewards *)self->_rewards rewardsItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        int v5 = ([*(id *)(*((void *)&v15 + 1) + 8 * i) state] == 3) & v5;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if (v5)
  {
    double v11 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v12 = [(NSDecimalNumber *)v3 compare:v11];

    if (v12 == 1)
    {
      uint64_t v13 = [(NSDecimalNumber *)v3 pk_negativeValue];

      double v3 = (NSDecimalNumber *)v13;
    }
  }
  return v3;
}

- (CLLocation)preferredLocation
{
  if ([(PKMerchant *)self->_merchant useRawMerchantData])
  {
    unint64_t v3 = [(PKPaymentTransaction *)self effectiveTransactionSource];
  }
  else
  {
    id v4 = [(PKMerchant *)self->_merchant mapsMerchant];
    int v5 = [v4 location];

    unint64_t v3 = [(PKPaymentTransaction *)self effectiveTransactionSource];
    if (v5) {
      goto LABEL_7;
    }
  }
  if (v3 == 5)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(PKPaymentTransaction *)self location];
  }
LABEL_7:
  return (CLLocation *)v5;
}

- (void)setPaymentHash:(id)a3
{
  id v4 = [a3 uppercaseString];
  paymentHash = self->_paymentHash;
  self->_paymentHash = v4;
}

- (BOOL)hasTransactionSource
{
  return [(PKPaymentTransaction *)self transactionSource] != 0;
}

- (unint64_t)effectiveTransactionSource
{
  unint64_t result = self->_transactionSource;
  if (!result) {
    return self->_cardType;
  }
  return result;
}

- (BOOL)hasEffectiveTransactionSource
{
  return [(PKPaymentTransaction *)self effectiveTransactionSource] != 0;
}

- (BOOL)hasBackingData
{
  unint64_t transactionType = self->_transactionType;
  if (transactionType > 0xF) {
    return 0;
  }
  if (((1 << transactionType) & 0x1FFB) != 0) {
    return self->_hasNotificationServiceData;
  }
  return 1;
}

- (BOOL)supportsFuzzyMatching
{
  unint64_t v3 = [(PKPaymentTransaction *)self effectiveTransactionSource];
  BOOL result = (v3 == 7 || !v3)
        && (unint64_t transactionType = self->_transactionType, transactionType - 3 >= 0x14)
        && (transactionType >= 3 ? (v6 = v3 == 7) : (v6 = 1), !v6 ? (BOOL v7 = v3 == 0) : (BOOL v7 = 1), v7)
        && self->_hasNotificationServiceData;
  return result;
}

- (BOOL)fullyProcessed
{
  return self->_processedForLocation && self->_processedForStations && self->_processedForMerchantCleanup;
}

- (NSString)associatedReceiptUniqueID
{
  receiptIdentifier = self->_receiptIdentifier;
  if (receiptIdentifier)
  {
    receiptProviderIdentifier = self->_receiptProviderIdentifier;
    if (receiptProviderIdentifier)
    {
      receiptProviderIdentifier = PKGenerateTransactionReceiptUniqueID(receiptProviderIdentifier, receiptIdentifier);
    }
  }
  else
  {
    receiptProviderIdentifier = 0;
  }
  return (NSString *)receiptProviderIdentifier;
}

- (BOOL)updateReasonIsInitialDownload
{
  unint64_t v3 = objc_opt_class();
  unint64_t updateReasons = self->_updateReasons;
  return [v3 updateReasonIsInitialDownload:updateReasons];
}

+ (BOOL)updateReasonIsInitialDownload:(unint64_t)a3
{
  return (a3 & 0x10024) != 0;
}

- (void)addUpdateReasons:(unint64_t)a3
{
  self->_updateReasons |= a3;
}

- (id)updateReasonsDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t updateReasons = self->_updateReasons;
  if (updateReasons)
  {
    int v5 = 1;
    for (uint64_t i = 1; i <= updateReasons; uint64_t i = 1 << v5++)
    {
      if ((i & updateReasons) != 0)
      {
        if (i > 511)
        {
          if (i < 0x2000)
          {
            if (i > 2047)
            {
              if (i == 2048)
              {
                BOOL v7 = @"TransitAppletState";
                goto LABEL_42;
              }
              if (i == 4096)
              {
                BOOL v7 = @"InitialNotificationServiceUpdate";
                goto LABEL_42;
              }
            }
            else
            {
              if (i == 512)
              {
                BOOL v7 = @"PeerPaymentMessageReceivedDate";
                goto LABEL_42;
              }
              if (i == 1024)
              {
                BOOL v7 = @"FelicaAppletState";
                goto LABEL_42;
              }
            }
          }
          else if (i < 0x8000)
          {
            if (i == 0x2000)
            {
              BOOL v7 = @"AnsweredQuestion";
              goto LABEL_42;
            }
            if (i == 0x4000)
            {
              BOOL v7 = @"MapsReprocessing";
              goto LABEL_42;
            }
          }
          else
          {
            switch(i)
            {
              case 0x8000:
                BOOL v7 = @"TransactionAuthentication";
                goto LABEL_42;
              case 0x10000:
                goto LABEL_14;
              case 0x20000:
                [v3 addObject:@"BarcodeDisplay"];
LABEL_14:
                BOOL v7 = @"UploadAfterReset";
LABEL_42:
                [v3 addObject:v7];
                unint64_t updateReasons = self->_updateReasons;
                break;
            }
          }
        }
        else
        {
          if (i <= 31)
          {
            BOOL v7 = @"ContactlessInterfaceData";
            switch(i)
            {
              case 1:
                goto LABEL_42;
              case 2:
                BOOL v7 = @"InAppAuthorizationData";
                goto LABEL_42;
              case 3:
              case 5:
              case 6:
              case 7:
                continue;
              case 4:
                BOOL v7 = @"InitialCloudKitSync";
                goto LABEL_42;
              case 8:
                BOOL v7 = @"CloudKitDeviceDataRecordChange";
                goto LABEL_42;
              default:
                if (i != 16) {
                  continue;
                }
                BOOL v7 = @"CloudKitTransactionRecordChange";
                break;
            }
            goto LABEL_42;
          }
          if (i > 127)
          {
            if (i == 128)
            {
              BOOL v7 = @"TransactionProcessor";
              goto LABEL_42;
            }
            if (i == 256)
            {
              BOOL v7 = @"PeerPaymentMemo";
              goto LABEL_42;
            }
          }
          else
          {
            if (i == 32)
            {
              BOOL v7 = @"CloudKitFetchAllRecords";
              goto LABEL_42;
            }
            if (i == 64)
            {
              BOOL v7 = @"NotificationServiceUpdate";
              goto LABEL_42;
            }
          }
        }
      }
    }
  }
  uint64_t v8 = [v3 description];

  return v8;
}

- (id)description
{
  if (PKTransactionDetailedLoggingEnabled())
  {
    id v3 = [(PKPaymentTransaction *)self dictionaryRepresentation];
    id v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:2 error:0];
    if (v4) {
      int v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    }
    else {
      int v5 = 0;
    }
    long long v15 = NSString;
    long long v16 = (objc_class *)objc_opt_class();
    long long v17 = NSStringFromClass(v16);
    long long v14 = [v15 stringWithFormat:@"<%@: %p; %@>", v17, self, v5];
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    BOOL v6 = (void *)MEMORY[0x192FDC630]();
    BOOL v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    objc_msgSend(v3, "appendFormat:", @"<%@: %p; Identifier: %@, Service Identifier: %@, Payment Hash: %@",
      v8,
      self,
      self->_identifier,
      self->_serviceIdentifier,
      self->_paymentHash);

    uint64_t v9 = [(PKPaymentTransaction *)self _transactionTypeString];
    double v10 = (void *)v9;
    if (v9) {
      [v3 appendFormat:@", Type: %@", v9];
    }
    double v11 = [(PKPaymentTransaction *)self _transitSubtypeString];

    if (v11) {
      [v3 appendFormat:@", Subtype: %@", v11];
    }
    uint64_t v12 = PKPaymentTransactionStatusToString([(PKPaymentTransaction *)self transactionStatus]);

    if (v12) {
      [v3 appendFormat:@", Status: %@", v12];
    }
    uint64_t v13 = [(PKPaymentTransaction *)self _transactionSourceString];

    if (v13) {
      [v3 appendFormat:@", Source: %@", v13];
    }
    if (self->_currencyCode) {
      [v3 appendFormat:@", Currency: %@", self->_currencyCode];
    }
    if (self->_requestDeviceScoreIdentifier) {
      [v3 appendFormat:@", Request Device Score Identifier: %@", self->_requestDeviceScoreIdentifier];
    }
    if (self->_sendDeviceScoreIdentifier) {
      [v3 appendFormat:@", Send Device Score Identifier: %@", self->_sendDeviceScoreIdentifier];
    }
    [v3 appendString:@">"];

    long long v14 = (void *)[v3 copy];
  }

  return v14;
}

- (id)_transactionSourceString
{
  unint64_t transactionSource = self->_transactionSource;
  if (transactionSource > 8) {
    return 0;
  }
  else {
    return off_1E56F4440[transactionSource];
  }
}

- (id)_transactionTypeString
{
  unint64_t v2 = [(PKPaymentTransaction *)self transactionType];
  if (v2 > 0x16) {
    return 0;
  }
  else {
    return off_1E56F4488[v2];
  }
}

- (id)_transitSubtypeString
{
  if ([(PKPaymentTransaction *)self transactionType] != 2) {
    return 0;
  }
  uint64_t v3 = [(PKPaymentTransaction *)self transitType];
  if (v3 <= 512)
  {
    switch(v3)
    {
      case 0:
        id result = @"unknown";
        break;
      case 1:
        id result = @"transit";
        break;
      case 2:
        id result = @"metro";
        break;
      case 3:
        id result = @"bus";
        break;
      case 4:
        id result = @"train";
        break;
      case 5:
        id result = @"other";
        break;
      case 6:
        id result = @"special";
        break;
      case 7:
        id result = @"lightrail";
        break;
      case 8:
        id result = @"cableCar";
        break;
      default:
        switch(v3)
        {
          case 257:
            id result = @"shinkansen";
            break;
          case 258:
            id result = @"maglev";
            break;
          case 259:
            id result = @"taxi";
            break;
          case 260:
            id result = @"ferry";
            break;
          case 261:
            id result = @"bike";
            break;
          default:
            return 0;
        }
        break;
    }
  }
  else
  {
    switch(v3)
    {
      case 513:
        id result = @"deposit";
        break;
      case 514:
        id result = @"refund";
        break;
      case 515:
        id result = @"purchase";
        break;
      case 516:
        id result = @"withdrawal";
        break;
      case 517:
        id result = @"cardRead";
        break;
      case 518:
        id result = @"renewal";
        break;
      default:
        int v5 = @"metroUpgrade";
        if (v3 != 1026) {
          int v5 = 0;
        }
        if (v3 == 1025) {
          id result = @"greenCar";
        }
        else {
          id result = v5;
        }
        break;
    }
  }
  return result;
}

+ (id)transactionNotificationStatusStringForTransaction:(id)a3 personContact:(id)a4
{
  id v5 = a3;
  BOOL v6 = [a4 givenName];
  uint64_t v7 = [v5 transactionStatus];
  if ((unint64_t)(v7 + 1) <= 9)
  {
    if (((1 << (v7 + 1)) & 0x3E7) != 0)
    {
      uint64_t v8 = [v5 transactionType];
      uint64_t v9 = 0;
      BOOL v10 = v8 == 13 || v8 == 0;
      if (!v10 || !v6) {
        goto LABEL_12;
      }
      PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentTra_7.isa, &stru_1EE0F6808.isa, v6);
      goto LABEL_10;
    }
    if (v7 == 2)
    {
      if (v6)
      {
        PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentTra_8.isa, &stru_1EE0F6808.isa, v6);
        uint64_t v11 = LABEL_10:;
LABEL_11:
        uint64_t v9 = (void *)v11;
        goto LABEL_12;
      }
      uint64_t v13 = @"PAYMENT_TRANSACTION_DECLINED";
    }
    else
    {
      if (v6)
      {
        PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentTra_9.isa, &stru_1EE0F6808.isa, v6);
        goto LABEL_10;
      }
      uint64_t v13 = @"PAYMENT_TRANSACTION_REFUND";
    }
    uint64_t v11 = PKLocalizedPaymentString(&v13->isa, 0);
    goto LABEL_11;
  }
  uint64_t v9 = 0;
LABEL_12:

  return v9;
}

- (PKCurrencyAmount)currencyAmount
{
  if (!self->_amount) {
    goto LABEL_4;
  }
  uint64_t v3 = [(NSString *)self->_currencyCode length];
  if (!v3) {
    goto LABEL_6;
  }
  amount = self->_amount;
  id v5 = [MEMORY[0x1E4F28C28] notANumber];
  LOBYTE(amount) = [(NSDecimalNumber *)amount isEqualToNumber:v5];

  if ((amount & 1) == 0) {
    uint64_t v3 = [[PKCurrencyAmount alloc] initWithAmount:self->_amount currency:self->_currencyCode exponent:0];
  }
  else {
LABEL_4:
  }
    uint64_t v3 = 0;
LABEL_6:
  return v3;
}

- (PKCurrencyAmount)nominalCurrencyAmount
{
  if (!self->_nominalAmount) {
    goto LABEL_4;
  }
  uint64_t v3 = [(NSString *)self->_currencyCode length];
  if (!v3) {
    goto LABEL_6;
  }
  nominalAmount = self->_nominalAmount;
  id v5 = [MEMORY[0x1E4F28C28] notANumber];
  LOBYTE(nominalAmount) = [(NSDecimalNumber *)nominalAmount isEqualToNumber:v5];

  if ((nominalAmount & 1) == 0) {
    uint64_t v3 = [[PKCurrencyAmount alloc] initWithAmount:self->_nominalAmount currency:self->_currencyCode exponent:0];
  }
  else {
LABEL_4:
  }
    uint64_t v3 = 0;
LABEL_6:
  return v3;
}

- (PKCurrencyAmount)subtotalCurrencyAmount
{
  if (!self->_subtotalAmount) {
    goto LABEL_4;
  }
  uint64_t v3 = [(NSString *)self->_currencyCode length];
  if (!v3) {
    goto LABEL_6;
  }
  subtotalAmount = self->_subtotalAmount;
  id v5 = [MEMORY[0x1E4F28C28] notANumber];
  LOBYTE(subtotalAmount) = [(NSDecimalNumber *)subtotalAmount isEqualToNumber:v5];

  if ((subtotalAmount & 1) == 0) {
    uint64_t v3 = [[PKCurrencyAmount alloc] initWithAmount:self->_subtotalAmount currency:self->_currencyCode exponent:0];
  }
  else {
LABEL_4:
  }
    uint64_t v3 = 0;
LABEL_6:
  return v3;
}

- (PKCurrencyAmount)primaryFundingSourceCurrencyAmount
{
  if (!self->_primaryFundingSourceAmount) {
    goto LABEL_4;
  }
  uint64_t v3 = [(NSString *)self->_primaryFundingSourceCurrencyCode length];
  if (!v3) {
    goto LABEL_6;
  }
  primaryFundingSourceAmount = self->_primaryFundingSourceAmount;
  id v5 = [MEMORY[0x1E4F28C28] notANumber];
  LOBYTE(primaryFundingSourceAmount) = [(NSDecimalNumber *)primaryFundingSourceAmount isEqualToNumber:v5];

  if ((primaryFundingSourceAmount & 1) == 0) {
    uint64_t v3 = [[PKCurrencyAmount alloc] initWithAmount:self->_primaryFundingSourceAmount currency:self->_primaryFundingSourceCurrencyCode exponent:0];
  }
  else {
LABEL_4:
  }
    uint64_t v3 = 0;
LABEL_6:
  return v3;
}

- (PKCurrencyAmount)secondaryFundingSourceCurrencyAmount
{
  if (!self->_secondaryFundingSourceAmount) {
    goto LABEL_4;
  }
  uint64_t v3 = [(NSString *)self->_secondaryFundingSourceCurrencyCode length];
  if (!v3) {
    goto LABEL_6;
  }
  secondaryFundingSourceAmount = self->_secondaryFundingSourceAmount;
  id v5 = [MEMORY[0x1E4F28C28] notANumber];
  LOBYTE(secondaryFundingSourceAmount) = [(NSDecimalNumber *)secondaryFundingSourceAmount isEqualToNumber:v5];

  if ((secondaryFundingSourceAmount & 1) == 0) {
    uint64_t v3 = [[PKCurrencyAmount alloc] initWithAmount:self->_secondaryFundingSourceAmount currency:self->_secondaryFundingSourceCurrencyCode exponent:0];
  }
  else {
LABEL_4:
  }
    uint64_t v3 = 0;
LABEL_6:
  return v3;
}

- (PKCurrencyAmount)rewardsTotalCurrencyAmount
{
  if (!self->_rewardsTotalAmount) {
    goto LABEL_4;
  }
  uint64_t v3 = [(NSString *)self->_rewardsTotalCurrencyCode length];
  if (!v3) {
    goto LABEL_6;
  }
  rewardsTotalAmount = self->_rewardsTotalAmount;
  id v5 = [MEMORY[0x1E4F28C28] notANumber];
  LOBYTE(rewardsTotalAmount) = [(NSDecimalNumber *)rewardsTotalAmount isEqualToNumber:v5];

  if ((rewardsTotalAmount & 1) == 0) {
    uint64_t v3 = [[PKCurrencyAmount alloc] initWithAmount:self->_rewardsTotalAmount currency:self->_rewardsTotalCurrencyCode exponent:0];
  }
  else {
LABEL_4:
  }
    uint64_t v3 = 0;
LABEL_6:
  return v3;
}

- (id)formattedAwards
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_barcodeIdentifier && [(NSArray *)self->_awards count])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = self->_awards;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v3, "length", (void)v13)) {
            [v3 appendString:@"\n"];
          }
          BOOL v10 = [v9 formattedStringValue];
          [v3 appendString:v10];
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    uint64_t v11 = (void *)[v3 copy];
  }
  else if (self->_paymentRewardsRedemption)
  {
    uint64_t v11 = PKLocalizedPayWithPointsString(&cfstr_TransactionNot.isa, 0);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (NSString)formattedBalanceAdjustmentAmount
{
  id v3 = [(PKPaymentTransaction *)self currencyAmount];
  id v4 = [(PKPaymentTransaction *)self _formatBalanceAdjustmentAmount:v3];

  return (NSString *)v4;
}

- (NSString)formattedBalanceAdjustmentSubtotalAmount
{
  id v3 = [(PKPaymentTransaction *)self subtotalCurrencyAmount];
  id v4 = [(PKPaymentTransaction *)self _formatBalanceAdjustmentAmount:v3];

  return (NSString *)v4;
}

- (NSString)formattedBalanceAdjustmentAbsoluteAmount
{
  id v3 = [(PKPaymentTransaction *)self currencyAmount];
  id v4 = [v3 amount];
  objc_msgSend(v4, "pk_absoluteValue");
  uint64_t v5 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v3 currency];
  uint64_t v7 = PKCurrencyAmountCreate(v5, v6, 0);

  uint64_t v8 = [(PKPaymentTransaction *)self _formatBalanceAdjustmentAmount:v7];

  return (NSString *)v8;
}

+ (id)formattedBalanceAdjustmentForAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6
{
  LOBYTE(v7) = 0;
  return (id)[a1 formattedBalanceAdjustmentForCurrencyAmount:a3 transactionType:a4 adjustmentType:a5 peerPaymentType:a6 featureIdentifier:0 isBankConnectTransaction:0 bankConnectCreditDebitIndicator:1 pending:v7];
}

+ (id)formattedBalanceAdjustmentForTransactionAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6 isBankConnectTransaction:(BOOL)a7 bankConnectCreditDebitIndicator:(int64_t)a8 featureIdentifier:(unint64_t)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  long long v16 = [v15 amount];
  char v17 = [v15 isPending];

  LOBYTE(v20) = v17;
  uint64_t v18 = [a1 formattedBalanceAdjustmentForCurrencyAmount:v16 transactionType:a4 adjustmentType:a5 peerPaymentType:a6 featureIdentifier:a9 isBankConnectTransaction:v10 bankConnectCreditDebitIndicator:a8 pending:v20];

  return v18;
}

+ (BOOL)isPositiveBalanceAdjustmentForCurrencyAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6 isBankConnectTransaction:(BOOL)a7 bankConnectCreditDebitIndicator:(int64_t)a8 featureIdentifier:(unint64_t)a9
{
  BOOL v10 = a7;
  id v14 = a3;
  id v15 = v14;
  if (v10)
  {
    BOOL v16 = a8 == 1;
LABEL_3:
    LOBYTE(a4) = v16;
  }
  else
  {
    char v17 = [v14 amount];
    uint64_t v18 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v19 = [v17 compare:v18];

    if (v19 == -1 || a4 == 3 && a6 == 2)
    {
      LOBYTE(a4) = 1;
    }
    else
    {
      int64_t v20 = a4 - 6;
      LOBYTE(a4) = 1;
      switch(v20)
      {
        case 0:
        case 2:
        case 3:
        case 4:
          break;
        case 1:
          if ((unint64_t)a5 >= 0x13) {
            LOBYTE(a4) = 0;
          }
          else {
            LODWORD(a4) = (0x43A9Au >> a5) & 1;
          }
          break;
        case 5:
          BOOL v16 = a9 == 5;
          goto LABEL_3;
        default:
          LOBYTE(a4) = 0;
          break;
      }
    }
  }

  return a4;
}

+ (id)formattedBalanceAdjustmentForCurrencyAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6 featureIdentifier:(unint64_t)a7 isBankConnectTransaction:(BOOL)a8 bankConnectCreditDebitIndicator:(int64_t)a9 pending:(BOOL)a10
{
  BOOL v10 = a8;
  id v15 = a3;
  if (!v15)
  {
    uint64_t v23 = 0;
    goto LABEL_13;
  }
  BOOL v16 = v15;
  BOOL v17 = +[PKPaymentTransaction isPositiveBalanceAdjustmentForCurrencyAmount:v15 transactionType:a4 adjustmentType:a5 peerPaymentType:a6 isBankConnectTransaction:v10 bankConnectCreditDebitIndicator:a9 featureIdentifier:a7];
  uint64_t v18 = [v16 amount];
  uint64_t v19 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v20 = [v18 compare:v19];

  if (v20 == -1)
  {
    uint64_t v21 = [v16 negativeValue];

    BOOL v16 = (void *)v21;
  }
  uint64_t v22 = [v16 formattedStringValue];
  uint64_t v23 = (void *)v22;
  if (!a10)
  {
    if (v17)
    {
      if (a7 != 5)
      {
        uint64_t v24 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EE0F6808.isa, v22);
LABEL_11:

        uint64_t v23 = (void *)v24;
      }
    }
    else if (a7 == 5)
    {
      uint64_t v25 = [v16 negativeValue];
      uint64_t v24 = [v25 formattedStringValue];

      uint64_t v23 = v25;
      goto LABEL_11;
    }
  }

LABEL_13:
  return v23;
}

- (id)_formatBalanceAdjustmentTransactionAmount:(id)a3
{
  int64_t transactionType = self->_transactionType;
  int64_t adjustmentType = self->_adjustmentType;
  int64_t peerPaymentType = self->_peerPaymentType;
  BOOL isBankConnectTransaction = self->_isBankConnectTransaction;
  int64_t bankConnectCreditDebitIndicator = self->_bankConnectCreditDebitIndicator;
  id v9 = a3;
  BOOL v10 = +[PKPaymentTransaction formattedBalanceAdjustmentForTransactionAmount:v9 transactionType:transactionType adjustmentType:adjustmentType peerPaymentType:peerPaymentType isBankConnectTransaction:isBankConnectTransaction bankConnectCreditDebitIndicator:bankConnectCreditDebitIndicator featureIdentifier:[(PKPaymentTransaction *)self featureIdentifier]];

  return v10;
}

- (id)_formatBalanceAdjustmentAmount:(id)a3
{
  int64_t transactionType = self->_transactionType;
  int64_t adjustmentType = self->_adjustmentType;
  int64_t peerPaymentType = self->_peerPaymentType;
  id v7 = a3;
  LOBYTE(v10) = 0;
  uint64_t v8 = +[PKPaymentTransaction formattedBalanceAdjustmentForCurrencyAmount:v7 transactionType:transactionType adjustmentType:adjustmentType peerPaymentType:peerPaymentType featureIdentifier:[(PKPaymentTransaction *)self featureIdentifier] isBankConnectTransaction:self->_isBankConnectTransaction bankConnectCreditDebitIndicator:self->_bankConnectCreditDebitIndicator pending:v10];

  return v8;
}

- (CLLocation)startStationLocation
{
  if (!self->_startStationCode || self->_startStationLatitude == 0.0 || self->_startStationLongitude == 0.0) {
    unint64_t v2 = 0;
  }
  else {
    unint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:self->_startStationLatitude longitude:self->_startStationLongitude];
  }
  return (CLLocation *)v2;
}

- (void)setStartStationLocation:(id)a3
{
  [a3 coordinate];
  self->_startStationLatitude = v4;
  self->_startStationLongitude = v5;
}

- (CLLocation)endStationLocation
{
  if (!self->_endStationCode || self->_endStationLatitude == 0.0 || self->_endStationLongitude == 0.0) {
    unint64_t v2 = 0;
  }
  else {
    unint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:self->_endStationLatitude longitude:self->_endStationLongitude];
  }
  return (CLLocation *)v2;
}

- (void)setEndStationLocation:(id)a3
{
  [a3 coordinate];
  self->_endStationLatitude = v4;
  self->_endStationLongitude = v5;
}

- (id)_commutePlanInformationForPass:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_plans)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v6 = self->_plans;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v34 + 1) + 8 * i) label];
          [v5 safelyAddObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v8);
    }

    if ([v5 count] == 1) {
      BOOL v17 = @"TRANSACTION_COMMUTE_NAMED_PLAN_USED";
    }
    else {
      BOOL v17 = @"TRANSACTION_COMMUTE_NAMED_PLANS_USED";
    }
    uint64_t v18 = PKPassLocalizedStringWithFormat(v17, v4, 0, v12, v13, v14, v15, v16, 0);
    uint64_t v24 = PKPassLocalizedStringWithFormat(@"TRANSACTION_COMMUTE_PLAN_LOCALIZED_JOINING_CHARACTER", v4, 0, v19, v20, v21, v22, v23, 0);
    uint64_t v25 = [v5 componentsJoinedByString:v24];

    uint64_t v32 = PKStringWithValidatedFormat(v18, @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v25);
  }
  else
  {
    uint64_t v32 = 0;
  }

  return v32;
}

- (id)formattedTransitTransactionMessageForPass:(id)a3 suppressNoChargeAmount:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(PKPaymentTransaction *)self isZeroTransaction];
  uint64_t v8 = [(PKPaymentTransaction *)self transitType];
  uint64_t v9 = [(PKPaymentTransaction *)self startStation];
  uint64_t v10 = [(PKPaymentTransaction *)self endStation];
  uint64_t v11 = (void *)v10;
  if (v9 && v10)
  {
    PKLocalizedPaymentString(&cfstr_TransitTransac_28.isa, &cfstr_12_0.isa, v9, v10);
LABEL_4:
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    uint64_t v14 = v12;
    goto LABEL_11;
  }
  if (v9 | v10)
  {
    if (v9) {
      uint64_t v13 = (void *)v9;
    }
    else {
      uint64_t v13 = (void *)v10;
    }
    id v12 = v13;
    goto LABEL_10;
  }
  if (!v7) {
    goto LABEL_27;
  }
  uint64_t v14 = 0;
  if (v8 <= 256)
  {
    if ((unint64_t)(v8 - 1) >= 8) {
      goto LABEL_11;
    }
LABEL_17:
    BOOL v17 = [(PKPaymentTransaction *)self _commutePlanInformationForPass:v6];
    if ([(PKPaymentTransaction *)self enRoute] || !v17)
    {
      if (self->_transactionStatus)
      {
        uint64_t v14 = 0;
        if ([(PKPaymentTransaction *)self enRoute] || a4) {
          goto LABEL_31;
        }
        uint64_t v19 = @"TRANSIT_NOTIFICATION_NO_CHARGE";
      }
      else
      {
        uint64_t v19 = @"TRANSIT_NOTIFICATION_PENDING";
      }
      PKLocalizedPaymentString(&v19->isa, 0);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v18 = v17;
    }
    uint64_t v14 = v18;
LABEL_31:

    goto LABEL_11;
  }
  if ((unint64_t)(v8 - 257) < 5) {
    goto LABEL_17;
  }
  if (v8 != 515)
  {
    if (v8 != 517) {
      goto LABEL_11;
    }
    if (a4)
    {
LABEL_27:
      uint64_t v14 = 0;
      goto LABEL_11;
    }
  }
  if (!self->_transactionStatus)
  {
    uint64_t v20 = @"TRANSIT_NOTIFICATION_PENDING";
    goto LABEL_37;
  }
  uint64_t v14 = 0;
  if (![(PKPaymentTransaction *)self enRoute] && !a4)
  {
    uint64_t v20 = @"TRANSIT_NOTIFICATION_NO_CHARGE";
LABEL_37:
    PKLocalizedPaymentString(&v20->isa, 0);
    goto LABEL_4;
  }
LABEL_11:
  id v15 = v14;

  return v15;
}

- (NSSet)answeredQuestionsOnThisDevice
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_questions;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "answered", (void)v12)
          && [v9 answeredOnThisDevice])
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    uint64_t v10 = (void *)[v3 copy];
  }
  else {
    uint64_t v10 = 0;
  }

  return (NSSet *)v10;
}

- (NSSet)unansweredQuestions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = self->_questions;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      if ((objc_msgSend(v10, "answered", (void)v16) & 1) == 0)
      {
        expirationDate = self->_expirationDate;
        if (expirationDate)
        {
          [(NSDate *)expirationDate timeIntervalSinceDate:v4];
          if (v12 >= 0.0) {
            continue;
          }
          if (self->_expirationDate) {
            goto LABEL_11;
          }
        }
        [v4 timeIntervalSinceDate:self->_transactionDate];
        if (v13 <= 259200.0) {
LABEL_11:
        }
          [v3 addObject:v10];
      }
    }
    uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v7);
LABEL_14:

  if ([v3 count]) {
    long long v14 = (void *)[v3 copy];
  }
  else {
    long long v14 = 0;
  }

  return (NSSet *)v14;
}

- (void)answeredQuestion:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_questions;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v11) == a3)
        {
          [v10 setAnswered:1];
          [v10 setAnsweredOnThisDevice:1];
        }
      }
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(PKPaymentTransaction *)self addUpdateReasons:0x2000];
}

- (BOOL)reviewed
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unint64_t v2 = self->_questions;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "answered", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)disputeStatus
{
  unint64_t v2 = [(PKPaymentTransaction *)self latestDisputeEvent];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 status];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (PKAccountServicingEventStatusDetails)disputeStatusDetails
{
  unint64_t v2 = [(PKPaymentTransaction *)self latestDisputeEvent];
  uint64_t v3 = [v2 statusDetails];

  return (PKAccountServicingEventStatusDetails *)v3;
}

- (unint64_t)disputeType
{
  unint64_t v2 = [(PKPaymentTransaction *)self latestDisputeEvent];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 activityType];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (NSDate)disputeOpenDate
{
  unint64_t v2 = [(PKPaymentTransaction *)self latestDisputeEvent];
  uint64_t v3 = [v2 openDate];

  return (NSDate *)v3;
}

- (NSDate)disputeLastUpdatedDate
{
  unint64_t v2 = [(PKPaymentTransaction *)self latestDisputeEvent];
  uint64_t v3 = [v2 lastUpdatedDate];

  return (NSDate *)v3;
}

- (PKAccountServicingEvent)latestDisputeEvent
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v2 = self->_servicingEvents;
  uint64_t v3 = (void *)[(NSOrderedSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v6, "type", (void)v9) == 4)
        {
          long long v7 = [v6 items];
          uint64_t v3 = [v7 anyObject];

          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[(NSOrderedSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (PKAccountServicingEvent *)v3;
}

- (NSNumber)isMerchantTokenTransaction
{
  return self->_isMerchantTokenTransaction;
}

- (BOOL)impactsPromotionProgress
{
  unint64_t transactionType = self->_transactionType;
  BOOL v4 = transactionType > 0xE;
  uint64_t v5 = (1 << transactionType) & 0x4003;
  BOOL v7 = !v4 && v5 != 0 && (self->_transactionStatus & 0xFFFFFFFFFFFFFFFDLL) == 1;
  long long v8 = [(PKPaymentTransactionRewards *)self->_rewards promotionalRewardsItems];
  uint64_t v9 = [v8 count];

  long long v10 = [(PKPaymentTransactionRewards *)self->_rewards rewardsItems];
  char v11 = objc_msgSend(v10, "pk_containsObjectPassingTest:", &__block_literal_global_1249);

  long long v12 = [(PKPaymentTransactionRewards *)self->_rewardsInProgress rewardsItems];
  uint64_t v13 = [v12 count];

  if (!v7) {
    return 0;
  }
  if (v9) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v11;
  }
  return v13 || v14;
}

BOOL __48__PKPaymentTransaction_impactsPromotionProgress__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 4;
}

- (unint64_t)featureIdentifier
{
  unint64_t v2 = self->_accountType - 1;
  if (v2 > 3) {
    return 0;
  }
  else {
    return qword_191675718[v2];
  }
}

- (BOOL)isDeletable
{
  return self->_transactionType == 15;
}

- (BOOL)_supportsServerFundingDescription
{
  return self->_recurring;
}

- (BOOL)isUnknownNearbyPeerPayment
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSDecimalNumber)subtotalAmount
{
  return self->_subtotalAmount;
}

- (void)setSubtotalAmount:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSDecimalNumber)amountAddedToAuth
{
  return self->_amountAddedToAuth;
}

- (void)setAmountAddedToAuth:(id)a3
{
}

- (NSArray)amounts
{
  return self->_amounts;
}

- (void)setAmounts:(id)a3
{
}

- (NSArray)plans
{
  return self->_plans;
}

- (void)setPlans:(id)a3
{
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (NSDate)transactionStatusChangedDate
{
  return self->_transactionStatusChangedDate;
}

- (void)setTransactionStatusChangedDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSDate)locationDate
{
  return self->_locationDate;
}

- (void)setLocationDate:(id)a3
{
}

- (double)locationLatitude
{
  return self->_locationLatitude;
}

- (void)setLocationLatitude:(double)a3
{
  self->_locationLatitude = a3;
}

- (double)locationLongitude
{
  return self->_locationLongitude;
}

- (void)setLocationLongitude:(double)a3
{
  self->_locationLongitude = a3;
}

- (double)locationAltitude
{
  return self->_locationAltitude;
}

- (void)setLocationAltitude:(double)a3
{
  self->_locationAltitude = a3;
}

- (double)locationHorizontalAccuracy
{
  return self->_locationHorizontalAccuracy;
}

- (void)setLocationHorizontalAccuracy:(double)a3
{
  self->_locationHorizontalAccuracy = a3;
}

- (double)locationVerticalAccuracy
{
  return self->_locationVerticalAccuracy;
}

- (void)setLocationVerticalAccuracy:(double)a3
{
  self->_locationVerticalAccuracy = a3;
}

- (BOOL)isCoarseLocation
{
  return self->_coarseLocation;
}

- (void)setCoarseLocation:(BOOL)a3
{
  self->_coarseLocation = a3;
}

- (int64_t)transitType
{
  return self->_transitType;
}

- (void)setTransitType:(int64_t)a3
{
  self->_transitType = a3;
}

- (unint64_t)transitModifiers
{
  return self->_transitModifiers;
}

- (void)setTransitModifiers:(unint64_t)a3
{
  self->_transitModifiers = a3;
}

- (BOOL)enRoute
{
  return self->_enRoute;
}

- (void)setEnRoute:(BOOL)a3
{
  self->_enRoute = a3;
}

- (NSString)stationCodeProvider
{
  return self->_stationCodeProvider;
}

- (void)setStationCodeProvider:(id)a3
{
}

- (NSNumber)cityCode
{
  return self->_cityCode;
}

- (void)setCityCode:(id)a3
{
}

- (NSData)startStationCode
{
  return self->_startStationCode;
}

- (void)setStartStationCode:(id)a3
{
}

- (NSString)startStation
{
  return self->_startStation;
}

- (void)setStartStation:(id)a3
{
}

- (double)startStationLatitude
{
  return self->_startStationLatitude;
}

- (void)setStartStationLatitude:(double)a3
{
  self->_startStationLatitude = a3;
}

- (double)startStationLongitude
{
  return self->_startStationLongitude;
}

- (void)setStartStationLongitude:(double)a3
{
  self->_startStationLongitude = a3;
}

- (NSData)endStationCode
{
  return self->_endStationCode;
}

- (void)setEndStationCode:(id)a3
{
}

- (NSString)endStation
{
  return self->_endStation;
}

- (void)setEndStation:(id)a3
{
}

- (double)endStationLatitude
{
  return self->_endStationLatitude;
}

- (void)setEndStationLatitude:(double)a3
{
  self->_endStationLatitude = a3;
}

- (double)endStationLongitude
{
  return self->_endStationLongitude;
}

- (void)setEndStationLongitude:(double)a3
{
  self->_endStationLongitude = a3;
}

- (BOOL)shouldSuppressDate
{
  return self->_shouldSuppressDate;
}

- (void)setShouldSuppressDate:(BOOL)a3
{
  self->_shouldSuppressDate = a3;
}

- (BOOL)suppressNotifications
{
  return self->_suppressNotifications;
}

- (void)setSuppressNotifications:(BOOL)a3
{
  self->_suppressNotifications = a3;
}

- (int64_t)adjustmentType
{
  return self->_adjustmentType;
}

- (void)setAdjustmentType:(int64_t)a3
{
  self->_int64_t adjustmentType = a3;
}

- (int64_t)adjustmentTypeReason
{
  return self->_adjustmentTypeReason;
}

- (void)setAdjustmentTypeReason:(int64_t)a3
{
  self->_adjustmentTypeReason = a3;
}

- (int64_t)topUpType
{
  return self->_topUpType;
}

- (void)setTopUpType:(int64_t)a3
{
  self->_unint64_t topUpType = a3;
}

- (int64_t)peerPaymentType
{
  return self->_peerPaymentType;
}

- (void)setPeerPaymentType:(int64_t)a3
{
  self->_int64_t peerPaymentType = a3;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_unint64_t accountType = a3;
}

- (NSString)peerPaymentCounterpartHandle
{
  return self->_peerPaymentCounterpartHandle;
}

- (void)setPeerPaymentCounterpartHandle:(id)a3
{
}

- (NSString)peerPaymentMemo
{
  return self->_peerPaymentMemo;
}

- (void)setPeerPaymentMemo:(id)a3
{
}

- (NSDate)peerPaymentMessageReceivedDate
{
  return self->_peerPaymentMessageReceivedDate;
}

- (void)setPeerPaymentMessageReceivedDate:(id)a3
{
}

- (PKPaymentTransactionForeignExchangeInformation)foreignExchangeInformation
{
  return self->_foreignExchangeInformation;
}

- (void)setForeignExchangeInformation:(id)a3
{
}

- (PKPaymentTransactionFees)fees
{
  return self->_fees;
}

- (void)setFees:(id)a3
{
}

- (NSString)localizedTypeDescription
{
  return self->_localizedTypeDescription;
}

- (void)setLocalizedTypeDescription:(id)a3
{
}

- (NSURL)bankConnectDigitalServicingURL
{
  return self->_bankConnectDigitalServicingURL;
}

- (void)setBankConnectDigitalServicingURL:(id)a3
{
}

- (NSURL)bankConnectPayNowURL
{
  return self->_bankConnectPayNowURL;
}

- (void)setBankConnectPayNowURL:(id)a3
{
}

- (NSURL)bankConnectTransferFundsURL
{
  return self->_bankConnectTransferFundsURL;
}

- (void)setBankConnectTransferFundsURL:(id)a3
{
}

- (NSURL)bankConnectPostInstallmentURL
{
  return self->_bankConnectPostInstallmentURL;
}

- (void)setBankConnectPostInstallmentURL:(id)a3
{
}

- (NSURL)bankConnectRedeemRewardsURL
{
  return self->_bankConnectRedeemRewardsURL;
}

- (void)setBankConnectRedeemRewardsURL:(id)a3
{
}

- (BOOL)isBankConnectTransaction
{
  return self->_isBankConnectTransaction;
}

- (void)setIsBankConnectTransaction:(BOOL)a3
{
  self->_BOOL isBankConnectTransaction = a3;
}

- (BOOL)bankConnectTransactionWasClassifiedByMaps
{
  return self->_bankConnectTransactionWasClassifiedByMaps;
}

- (void)setBankConnectTransactionWasClassifiedByMaps:(BOOL)a3
{
  self->_bankConnectTransactionWasClassifiedByMaps = a3;
}

- (int64_t)bankConnectCreditDebitIndicator
{
  return self->_bankConnectCreditDebitIndicator;
}

- (void)setBankConnectCreditDebitIndicator:(int64_t)a3
{
  self->_int64_t bankConnectCreditDebitIndicator = a3;
}

- (BOOL)bankConnectRoundTransactionDate
{
  return self->_bankConnectRoundTransactionDate;
}

- (void)setBankConnectRoundTransactionDate:(BOOL)a3
{
  self->_bankConnectRoundTransactionDate = a3;
}

- (PKPaymentTransactionBankConnectMetadata)bankConnectMetadata
{
  return self->_bankConnectMetadata;
}

- (void)setBankConnectMetadata:(id)a3
{
}

- (NSDecimalNumber)primaryFundingSourceAmount
{
  return self->_primaryFundingSourceAmount;
}

- (void)setPrimaryFundingSourceAmount:(id)a3
{
}

- (NSString)primaryFundingSourceCurrencyCode
{
  return self->_primaryFundingSourceCurrencyCode;
}

- (void)setPrimaryFundingSourceCurrencyCode:(id)a3
{
}

- (NSDecimalNumber)secondaryFundingSourceAmount
{
  return self->_secondaryFundingSourceAmount;
}

- (void)setSecondaryFundingSourceAmount:(id)a3
{
}

- (NSString)secondaryFundingSourceCurrencyCode
{
  return self->_secondaryFundingSourceCurrencyCode;
}

- (void)setSecondaryFundingSourceCurrencyCode:(id)a3
{
}

- (int64_t)secondaryFundingSourceNetwork
{
  return self->_secondaryFundingSourceNetwork;
}

- (void)setSecondaryFundingSourceNetwork:(int64_t)a3
{
  self->_secondaryFundingSourceNetwork = a3;
}

- (NSString)secondaryFundingSourceDPANSuffix
{
  return self->_secondaryFundingSourceDPANSuffix;
}

- (void)setSecondaryFundingSourceDPANSuffix:(id)a3
{
}

- (NSString)secondaryFundingSourceFPANIdentifier
{
  return self->_secondaryFundingSourceFPANIdentifier;
}

- (void)setSecondaryFundingSourceFPANIdentifier:(id)a3
{
}

- (NSString)secondaryFundingSourceDescription
{
  return self->_secondaryFundingSourceDescription;
}

- (void)setSecondaryFundingSourceDescription:(id)a3
{
}

- (int64_t)secondaryFundingSourceType
{
  return self->_secondaryFundingSourceType;
}

- (void)setSecondaryFundingSourceType:(int64_t)a3
{
  self->_int64_t secondaryFundingSourceType = a3;
}

- (NSUUID)requestDeviceScoreIdentifier
{
  return self->_requestDeviceScoreIdentifier;
}

- (void)setRequestDeviceScoreIdentifier:(id)a3
{
}

- (NSUUID)sendDeviceScoreIdentifier
{
  return self->_sendDeviceScoreIdentifier;
}

- (void)setSendDeviceScoreIdentifier:(id)a3
{
}

- (BOOL)deviceScoreIdentifiersRequired
{
  return self->_deviceScoreIdentifiersRequired;
}

- (void)setDeviceScoreIdentifiersRequired:(BOOL)a3
{
  self->_deviceScoreIdentifiersRequired = a3;
}

- (BOOL)deviceScoreIdentifiersSubmitted
{
  return self->_deviceScoreIdentifiersSubmitted;
}

- (void)setDeviceScoreIdentifiersSubmitted:(BOOL)a3
{
  self->_deviceScoreIdentifiersSubmitted = a3;
}

- (NSString)merchantProvidedTitle
{
  return self->_merchantProvidedTitle;
}

- (void)setMerchantProvidedTitle:(id)a3
{
}

- (NSString)merchantProvidedDescription
{
  return self->_merchantProvidedDescription;
}

- (void)setMerchantProvidedDescription:(id)a3
{
}

- (void)setRewardsTotalAmount:(id)a3
{
}

- (NSString)rewardsTotalCurrencyCode
{
  return self->_rewardsTotalCurrencyCode;
}

- (void)setRewardsTotalCurrencyCode:(id)a3
{
}

- (unint64_t)rewardsEligibilityReason
{
  return self->_rewardsEligibilityReason;
}

- (void)setRewardsEligibilityReason:(unint64_t)a3
{
  self->_unint64_t rewardsEligibilityReason = a3;
}

- (PKPaymentTransactionRewards)rewards
{
  return self->_rewards;
}

- (void)setRewards:(id)a3
{
}

- (PKPaymentTransactionRewards)rewardsInProgress
{
  return self->_rewardsInProgress;
}

- (void)setRewardsInProgress:(id)a3
{
}

- (unint64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(unint64_t)a3
{
  self->_cardType = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)lifecycleIdentifier
{
  return self->_lifecycleIdentifier;
}

- (void)setLifecycleIdentifier:(id)a3
{
}

- (NSString)authNetworkData
{
  return self->_authNetworkData;
}

- (void)setAuthNetworkData:(id)a3
{
}

- (NSString)clearingNetworkData
{
  return self->_clearingNetworkData;
}

- (void)setClearingNetworkData:(id)a3
{
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (void)setCardIdentifier:(id)a3
{
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDPANIdentifier:(id)a3
{
}

- (int64_t)paymentNetworkIdentifier
{
  return self->_paymentNetworkIdentifier;
}

- (void)setPaymentNetworkIdentifier:(int64_t)a3
{
  self->_int64_t paymentNetworkIdentifier = a3;
}

- (NSString)panIdentifier
{
  return self->_panIdentifier;
}

- (void)setPANIdentifier:(id)a3
{
}

- (void)setIsMerchantTokenTransaction:(id)a3
{
}

- (NSString)cardNumberSuffix
{
  return self->_cardNumberSuffix;
}

- (void)setCardNumberSuffix:(id)a3
{
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
}

- (unint64_t)suppressBehavior
{
  return self->_suppressBehavior;
}

- (void)setSuppressBehavior:(unint64_t)a3
{
  self->_suppressBehavior = a3;
}

- (unint64_t)redemptionType
{
  return self->_redemptionType;
}

- (void)setRedemptionType:(unint64_t)a3
{
  self->_redemptionType = a3;
}

- (unint64_t)associatedFeatureIdentifier
{
  return self->_associatedFeatureIdentifier;
}

- (void)setAssociatedFeatureIdentifier:(unint64_t)a3
{
  self->_associatedFeatureIdentifier = a3;
}

- (NSSet)questions
{
  return self->_questions;
}

- (void)setQuestions:(id)a3
{
}

- (NSOrderedSet)servicingEvents
{
  return self->_servicingEvents;
}

- (void)setServicingEvents:(id)a3
{
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
}

- (NSArray)transfers
{
  return self->_transfers;
}

- (void)setTransfers:(id)a3
{
}

- (PKPeerPaymentRecurringPayment)recurringPeerPayment
{
  return self->_recurringPeerPayment;
}

- (void)setRecurringPeerPayment:(id)a3
{
}

- (unint64_t)peerPaymentPaymentMode
{
  return self->_peerPaymentPaymentMode;
}

- (void)setPeerPaymentPaymentMode:(unint64_t)a3
{
  self->_peerPaymentPaymentMode = a3;
}

- (NSString)peerPaymentCounterpartImageRecordIdentifier
{
  return self->_peerPaymentCounterpartImageRecordIdentifier;
}

- (void)setPeerPaymentCounterpartImageRecordIdentifier:(id)a3
{
}

- (PKAccountEvent)redemptionEvent
{
  return self->_redemptionEvent;
}

- (void)setRedemptionEvent:(id)a3
{
}

- (PKCreditInstallmentPlanPayment)installmentPayment
{
  return self->_installmentPayment;
}

- (void)setInstallmentPayment:(id)a3
{
}

- (PKCreditInstallmentPlan)installmentPlan
{
  return self->_installmentPlan;
}

- (void)setInstallmentPlan:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)processedForLocation
{
  return self->_processedForLocation;
}

- (void)setProcessedForLocation:(BOOL)a3
{
  self->_processedForLocation = a3;
}

- (BOOL)processedForMerchantCleanup
{
  return self->_processedForMerchantCleanup;
}

- (void)setProcessedForMerchantCleanup:(BOOL)a3
{
  self->_processedForMerchantCleanup = a3;
}

- (BOOL)requiresMerchantReprocessing
{
  return self->_requiresMerchantReprocessing;
}

- (void)setRequiresMerchantReprocessing:(BOOL)a3
{
  self->_requiresMerchantReprocessing = a3;
}

- (NSDate)lastMerchantReprocessingDate
{
  return self->_lastMerchantReprocessingDate;
}

- (void)setLastMerchantReprocessingDate:(id)a3
{
}

- (BOOL)processedForStations
{
  return self->_processedForStations;
}

- (void)setProcessedForStations:(BOOL)a3
{
  self->_processedForStations = a3;
}

- (BOOL)hasAssociatedPaymentApplication
{
  return self->_hasAssociatedPaymentApplication;
}

- (void)setHasAssociatedPaymentApplication:(BOOL)a3
{
  self->_hasAssociatedPaymentApplication = a3;
}

- (BOOL)hasNotificationServiceData
{
  return self->_hasNotificationServiceData;
}

- (void)setHasNotificationServiceData:(BOOL)a3
{
  self->_hasNotificationServiceData = a3;
}

- (BOOL)originatedByDevice
{
  return self->_originatedByDevice;
}

- (void)setOriginatedByDevice:(BOOL)a3
{
  self->_originatedByDevice = a3;
}

- (BOOL)isFuzzyMatched
{
  return self->_fuzzyMatched;
}

- (void)setFuzzyMatched:(BOOL)a3
{
  self->_fuzzyMatched = a3;
}

- (NSArray)associatedStatementIdentifiers
{
  return self->_associatedStatementIdentifiers;
}

- (void)setAssociatedStatementIdentifiers:(id)a3
{
}

- (BOOL)interestReassessment
{
  return self->_interestReassessment;
}

- (void)setInterestReassessment:(BOOL)a3
{
  self->_interestReassessment = a3;
}

- (NSString)receiptProviderIdentifier
{
  return self->_receiptProviderIdentifier;
}

- (void)setReceiptProviderIdentifier:(id)a3
{
}

- (NSString)receiptIdentifier
{
  return self->_receiptIdentifier;
}

- (void)setReceiptIdentifier:(id)a3
{
}

- (NSURL)receiptProviderURL
{
  return self->_receiptProviderURL;
}

- (void)setReceiptProviderURL:(id)a3
{
}

- (NSString)barcodeIdentifier
{
  return self->_barcodeIdentifier;
}

- (void)setBarcodeIdentifier:(id)a3
{
}

- (PKTransactionAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (NSString)primaryFundingSourceDescription
{
  return self->_primaryFundingSourceDescription;
}

- (void)setPrimaryFundingSourceDescription:(id)a3
{
}

- (NSDecimalNumber)nominalAmount
{
  return self->_nominalAmount;
}

- (void)setNominalAmount:(id)a3
{
}

- (BOOL)hasAdditionalOffers
{
  return self->_hasAdditionalOffers;
}

- (void)setHasAdditionalOffers:(BOOL)a3
{
  self->_hasAdditionalOffers = a3;
}

- (NSArray)awards
{
  return self->_awards;
}

- (void)setAwards:(id)a3
{
}

- (NSArray)amountModifiers
{
  return self->_amountModifiers;
}

- (void)setAmountModifiers:(id)a3
{
}

- (NSString)issueReportIdentifier
{
  return self->_issueReportIdentifier;
}

- (void)setIssueReportIdentifier:(id)a3
{
}

- (int64_t)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(int64_t)a3
{
  self->_transactionStatus = a3;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(int64_t)a3
{
  self->_unint64_t transactionType = a3;
}

- (int64_t)technologyType
{
  return self->_technologyType;
}

- (void)setTechnologyType:(int64_t)a3
{
  self->_technologyType = a3;
}

- (unint64_t)transactionSource
{
  return self->_transactionSource;
}

- (void)setTransactionSource:(unint64_t)a3
{
  self->_unint64_t transactionSource = a3;
}

- (int64_t)transactionDeclinedReason
{
  return self->_transactionDeclinedReason;
}

- (void)setTransactionDeclinedReason:(int64_t)a3
{
  self->_transactionDeclinedReason = a3;
}

- (unint64_t)updateReasons
{
  return self->_updateReasons;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
}

- (BOOL)isCloudKitArchived
{
  return self->_isCloudKitArchived;
}

- (void)setIsCloudKitArchived:(BOOL)a3
{
  self->_isCloudKitArchived = a3;
}

- (PKTransactionReleasedData)releasedData
{
  return self->_releasedData;
}

- (void)setReleasedData:(id)a3
{
}

- (BOOL)requiresLocation
{
  return self->_requiresLocation;
}

- (void)setRequiresLocation:(BOOL)a3
{
  self->_requiresLocation = a3;
}

- (PKPayLaterFinancingPlan)associatedFinancingPlan
{
  return self->_associatedFinancingPlan;
}

- (void)setAssociatedFinancingPlan:(id)a3
{
}

- (BOOL)isRecurring
{
  return self->_recurring;
}

- (void)setRecurring:(BOOL)a3
{
  self->_recurring = a3;
}

- (int64_t)updateSequenceNumber
{
  return self->_updateSequenceNumber;
}

- (void)setUpdateSequenceNumber:(int64_t)a3
{
  self->_updateSequenceNumber = a3;
}

- (BOOL)needsSyncWithFinance
{
  return self->_needsSyncWithFinance;
}

- (void)setNeedsSyncWithFinance:(BOOL)a3
{
  self->_needsSyncWithFinance = a3;
}

- (BOOL)isIssuerInstallmentTransaction
{
  return self->_isIssuerInstallmentTransaction;
}

- (void)setIsIssuerInstallmentTransaction:(BOOL)a3
{
  self->_isIssuerInstallmentTransaction = a3;
}

- (NSURL)issuerInstallmentManagementURL
{
  return self->_issuerInstallmentManagementURL;
}

- (void)setIssuerInstallmentManagementURL:(id)a3
{
}

- (PKPaymentRewardsRedemption)paymentRewardsRedemption
{
  return self->_paymentRewardsRedemption;
}

- (void)setPaymentRewardsRedemption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentRewardsRedemption, 0);
  objc_storeStrong((id *)&self->_issuerInstallmentManagementURL, 0);
  objc_storeStrong((id *)&self->_associatedFinancingPlan, 0);
  objc_storeStrong((id *)&self->_releasedData, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_issueReportIdentifier, 0);
  objc_storeStrong((id *)&self->_amountModifiers, 0);
  objc_storeStrong((id *)&self->_awards, 0);
  objc_storeStrong((id *)&self->_nominalAmount, 0);
  objc_storeStrong((id *)&self->_primaryFundingSourceDescription, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_barcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_receiptProviderURL, 0);
  objc_storeStrong((id *)&self->_receiptIdentifier, 0);
  objc_storeStrong((id *)&self->_receiptProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedStatementIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastMerchantReprocessingDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_installmentPlan, 0);
  objc_storeStrong((id *)&self->_installmentPayment, 0);
  objc_storeStrong((id *)&self->_redemptionEvent, 0);
  objc_storeStrong((id *)&self->_peerPaymentCounterpartImageRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_recurringPeerPayment, 0);
  objc_storeStrong((id *)&self->_transfers, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_servicingEvents, 0);
  objc_storeStrong((id *)&self->_questions, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_cardNumberSuffix, 0);
  objc_storeStrong((id *)&self->_isMerchantTokenTransaction, 0);
  objc_storeStrong((id *)&self->_panIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
  objc_storeStrong((id *)&self->_clearingNetworkData, 0);
  objc_storeStrong((id *)&self->_authNetworkData, 0);
  objc_storeStrong((id *)&self->_lifecycleIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_rewardsInProgress, 0);
  objc_storeStrong((id *)&self->_rewards, 0);
  objc_storeStrong((id *)&self->_rewardsTotalCurrencyCode, 0);
  objc_storeStrong((id *)&self->_rewardsTotalAmount, 0);
  objc_storeStrong((id *)&self->_merchantProvidedDescription, 0);
  objc_storeStrong((id *)&self->_merchantProvidedTitle, 0);
  objc_storeStrong((id *)&self->_sendDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_requestDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryFundingSourceDescription, 0);
  objc_storeStrong((id *)&self->_secondaryFundingSourceFPANIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryFundingSourceDPANSuffix, 0);
  objc_storeStrong((id *)&self->_secondaryFundingSourceCurrencyCode, 0);
  objc_storeStrong((id *)&self->_secondaryFundingSourceAmount, 0);
  objc_storeStrong((id *)&self->_primaryFundingSourceCurrencyCode, 0);
  objc_storeStrong((id *)&self->_primaryFundingSourceAmount, 0);
  objc_storeStrong((id *)&self->_bankConnectMetadata, 0);
  objc_storeStrong((id *)&self->_bankConnectRedeemRewardsURL, 0);
  objc_storeStrong((id *)&self->_bankConnectPostInstallmentURL, 0);
  objc_storeStrong((id *)&self->_bankConnectTransferFundsURL, 0);
  objc_storeStrong((id *)&self->_bankConnectPayNowURL, 0);
  objc_storeStrong((id *)&self->_bankConnectDigitalServicingURL, 0);
  objc_storeStrong((id *)&self->_localizedTypeDescription, 0);
  objc_storeStrong((id *)&self->_fees, 0);
  objc_storeStrong((id *)&self->_foreignExchangeInformation, 0);
  objc_storeStrong((id *)&self->_peerPaymentMessageReceivedDate, 0);
  objc_storeStrong((id *)&self->_peerPaymentMemo, 0);
  objc_storeStrong((id *)&self->_peerPaymentCounterpartHandle, 0);
  objc_storeStrong((id *)&self->_endStation, 0);
  objc_storeStrong((id *)&self->_endStationCode, 0);
  objc_storeStrong((id *)&self->_startStation, 0);
  objc_storeStrong((id *)&self->_startStationCode, 0);
  objc_storeStrong((id *)&self->_cityCode, 0);
  objc_storeStrong((id *)&self->_stationCodeProvider, 0);
  objc_storeStrong((id *)&self->_locationDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_transactionStatusChangedDate, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_plans, 0);
  objc_storeStrong((id *)&self->_amounts, 0);
  objc_storeStrong((id *)&self->_amountAddedToAuth, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_subtotalAmount, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_paymentHash, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (FKPaymentTransaction)fkPaymentTransaction
{
  id v25 = objc_alloc((Class)getFKPaymentTransactionClass[0]());
  uint64_t v30 = [(PKPaymentTransaction *)self identifier];
  uint64_t v31 = [(PKPaymentTransaction *)self _fkAmount];
  uint64_t v29 = [(PKPaymentTransaction *)self foreignExchangeInformation];
  uint64_t v24 = [v29 fkForeignAmount];
  uint64_t v28 = [(PKPaymentTransaction *)self foreignExchangeInformation];
  uint64_t v23 = [v28 exchangeRate];
  uint64_t v21 = [(PKPaymentTransaction *)self transactionDate];
  uint64_t v20 = [(PKPaymentTransaction *)self transactionStatusChangedDate];
  unint64_t v19 = [(PKPaymentTransaction *)self _fkPaymentTransactionType];
  int64_t v18 = [(PKPaymentTransaction *)self _fkPaymentTransactionStatus];
  uint64_t v27 = [(PKPaymentTransaction *)self merchant];
  long long v15 = [v27 displayName];
  uint64_t v22 = [(PKPaymentTransaction *)self merchant];
  BOOL v14 = [v22 displayName];
  long long v17 = [(PKPaymentTransaction *)self localizedTypeDescription];
  unint64_t v16 = [(PKPaymentTransaction *)self _fkCreditDebitIndicator];
  uint64_t v3 = [(PKPaymentTransaction *)self _fkActions];
  BOOL v4 = [(PKPaymentTransaction *)self isBankConnectTransaction];
  uint64_t v5 = [(PKPaymentTransaction *)self merchant];
  uint64_t v6 = [v5 industryCode];
  BOOL v7 = [(PKPaymentTransaction *)self hasNotificationServiceData];
  long long v8 = [(PKPaymentTransaction *)self paymentHash];
  uint64_t v9 = [(PKPaymentTransaction *)self _fkTransactionInsights];
  long long v10 = [(PKPaymentTransaction *)self serviceIdentifier];
  LOBYTE(v13) = v7;
  LOBYTE(v12) = v4;
  uint64_t v26 = objc_msgSend(v25, "initWithTransactionIdentifier:amount:foreignAmount:foreignCurrencyExchangeRate:transactionDate:transactionStatusChangedDate:type:status:transactionDescription:originalTransactionDescription:localizedTypeDescription:creditDebitIndicator:actions:isBankConnectTransaction:merchantCategoryCode:hasNotificationServiceData:paymentHash:altDSID:insights:serviceIdentifier:", v30, v31, v24, v23, v21, v20, v19, v18, v15, v14, v17, v16, v3, v12,
                  v6,
                  v13,
                  v8,
                  0,
                  v9,
                  v10);

  return (FKPaymentTransaction *)v26;
}

- (id)_fkAmount
{
  id v3 = objc_alloc((Class)getFKAmountClass_0[0]());
  BOOL v4 = [(PKPaymentTransaction *)self amount];
  uint64_t v5 = objc_msgSend(v4, "pk_absoluteValue");
  uint64_t v6 = [(PKPaymentTransaction *)self currencyCode];
  BOOL v7 = (void *)[v3 initWithDecimalNumber:v5 currency:v6];

  return v7;
}

- (id)_fkActions
{
  id v3 = objc_alloc((Class)getFKActionsClass[0]());
  BOOL v4 = [(PKPaymentTransaction *)self bankConnectDigitalServicingURL];
  uint64_t v5 = [(PKPaymentTransaction *)self bankConnectPayNowURL];
  uint64_t v6 = [(PKPaymentTransaction *)self bankConnectTransferFundsURL];
  BOOL v7 = [(PKPaymentTransaction *)self bankConnectPostInstallmentURL];
  long long v8 = [(PKPaymentTransaction *)self bankConnectRedeemRewardsURL];
  uint64_t v9 = (void *)[v3 initWithDigitalServicingURL:v4 payNowURL:v5 transferFundsURL:v6 postInstallmentURL:v7 redeemRewardsURL:v8];

  return v9;
}

- (unint64_t)_fkCreditDebitIndicator
{
  int64_t v3 = [(PKPaymentTransaction *)self bankConnectCreditDebitIndicator];
  if (v3) {
    return v3 == 2;
  }
  uint64_t v5 = [(PKPaymentTransaction *)self currencyAmount];
  BOOL v6 = +[PKPaymentTransaction isPositiveBalanceAdjustmentForCurrencyAmount:v5 transactionType:[(PKPaymentTransaction *)self transactionType] adjustmentType:[(PKPaymentTransaction *)self adjustmentType] peerPaymentType:[(PKPaymentTransaction *)self peerPaymentType] isBankConnectTransaction:[(PKPaymentTransaction *)self isBankConnectTransaction] bankConnectCreditDebitIndicator:[(PKPaymentTransaction *)self bankConnectCreditDebitIndicator] featureIdentifier:[(PKPaymentTransaction *)self featureIdentifier]];

  return !v6;
}

- (unint64_t)_fkMerchantCategoryFromPKMerchantCategory:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 8) {
    return 0;
  }
  else {
    return a3;
  }
}

- (id)_fkMapsTransactionInsight
{
  unint64_t v2 = self;
  int64_t v3 = [(PKPaymentTransaction *)self merchant];
  BOOL v4 = [v3 mapsMerchant];

  if (v4)
  {
    id v38 = objc_alloc(_MergedGlobals_185());
    uint64_t v36 = [v4 identifier];
    unsigned int v49 = [v4 resultProviderIdentifier];
    uint64_t v47 = [v4 name];
    uint64_t v44 = [v4 phoneNumber];
    int64_t v42 = [v4 url];
    long long v40 = [v4 heroImageURL];
    long long v34 = [v4 heroImageAttributionName];
    uint64_t v5 = v2;
    uint64_t v6 = -[PKPaymentTransaction _fkMerchantCategoryFromPKMerchantCategory:](v2, "_fkMerchantCategoryFromPKMerchantCategory:", [v4 category]);
    BOOL v7 = [v4 detailedCategory];
    uint64_t v32 = [v4 stylingInfoData];
    uint64_t v30 = [v4 businessChatURL];
    long long v8 = [v4 lastProcessedDate];
    id v9 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v4 locationLatitude];
    double v11 = v10;
    [v4 locationLongitude];
    uint64_t v13 = (void *)[v9 initWithLatitude:v11 longitude:v12];
    BOOL v14 = [v4 postalAddress];
    uint64_t v29 = v6;
    unint64_t v2 = v5;
    uint64_t v50 = (void *)[v38 initWithMUID:v36 resultProviderIdentifier:v49 name:v47 phoneNumber:v44 url:v42 heroImageURL:v40 heroImageAttributionName:v34 category:v29 mapsCategoryIdentifier:v7 encodedStylingInfo:v32 businessChatURL:v30 lastProcessedDate:v8 location:v13 postalAddress:v14];
  }
  else
  {
    uint64_t v50 = 0;
  }
  long long v15 = [(PKPaymentTransaction *)v2 merchant];
  unint64_t v16 = [v15 mapsBrand];

  if (v16)
  {
    id v37 = objc_alloc(off_1EB402528());
    uint64_t v17 = [v16 identifier];
    unsigned int v45 = [v16 resultProviderIdentifier];
    uint64_t v43 = [v16 name];
    long long v41 = [v16 phoneNumber];
    uint64_t v39 = [v16 url];
    long long v35 = [v16 heroImageURL];
    id v33 = [v16 heroImageAttributionName];
    uint64_t v18 = -[PKPaymentTransaction _fkMerchantCategoryFromPKMerchantCategory:](v2, "_fkMerchantCategoryFromPKMerchantCategory:", [v16 category]);
    uint64_t v31 = [v16 detailedCategory];
    [v16 stylingInfoData];
    unint64_t v19 = v48 = v2;
    uint64_t v20 = [v16 businessChatURL];
    uint64_t v21 = [v16 lastProcessedDate];
    uint64_t v22 = [v16 logoURL];
    uint64_t v46 = [v37 initWithMUID:v17 resultProviderIdentifier:v45 name:v43 phoneNumber:v41 url:v39 heroImageURL:v35 heroImageAttributionName:v33 category:v18 mapsCategoryIdentifier:v31 encodedStylingInfo:v19 businessChatURL:v20 lastProcessedDate:v21 logoURL:v22];

    unint64_t v2 = v48;
    uint64_t v23 = (void *)v46;
  }
  else
  {
    uint64_t v23 = 0;
  }
  uint64_t v24 = [(PKPaymentTransaction *)v2 merchant];
  uint64_t v25 = [v24 fallbackcategory];

  if (v50 || v23 || v25)
  {
    uint64_t v27 = [(PKPaymentTransaction *)v2 _fkMerchantCategoryFromPKMerchantCategory:v25];
    uint64_t v26 = (void *)[objc_alloc(off_1EB402530()) initWithUpdatedAt:0 fallbackCategory:v27 merchant:v50 brand:v23];
  }
  else
  {
    uint64_t v26 = 0;
  }

  return v26;
}

- (id)_fkTransactionInsights
{
  id v3 = objc_alloc((Class)getFKPaymentTransactionInsightsClass[0]());
  BOOL v4 = [(PKPaymentTransaction *)self _fkApplePayTransactionInsight];
  uint64_t v5 = [(PKPaymentTransaction *)self _fkMapsTransactionInsight];
  uint64_t v6 = [(PKPaymentTransaction *)self _fkContactTransactionInsight];
  BOOL v7 = (void *)[v3 initWithApplePayInsight:v4 bankMerchantInformationInsight:0 mapsInsight:v5 contactInsight:v6];

  return v7;
}

- (id)_fkApplePayTransactionInsight
{
  id v3 = [(PKPaymentTransaction *)self merchant];
  BOOL v4 = [(PKPaymentTransaction *)self clearingNetworkData];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28D90];
    uint64_t v6 = [(PKPaymentTransaction *)self clearingNetworkData];
  }
  else
  {
    BOOL v7 = [(PKPaymentTransaction *)self authNetworkData];

    if (!v7)
    {
      double v10 = 0;
      goto LABEL_6;
    }
    uint64_t v5 = (void *)MEMORY[0x1E4F28D90];
    uint64_t v6 = [(PKPaymentTransaction *)self authNetworkData];
  }
  long long v8 = v6;
  id v9 = [v6 dataUsingEncoding:4];
  double v10 = [v5 JSONObjectWithData:v9 options:0 error:0];

LABEL_6:
  double v11 = [v10 objectForKeyedSubscript:@"DE048"];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v11 options:0 error:0];
    uint64_t v30 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
  }
  else
  {
    uint64_t v30 = 0;
  }
  if ([(PKPaymentTransaction *)self paymentNetworkIdentifier])
  {
    uint64_t v39 = PKPaymentNetworkNameForPaymentCredentialType([(PKPaymentTransaction *)self paymentNetworkIdentifier]);
  }
  else
  {
    uint64_t v39 = 0;
  }
  id v28 = objc_alloc((Class)getFKApplePayTransactionInsightClass[0]());
  long long v41 = [(PKPaymentTransaction *)self paymentHash];
  long long v40 = [v3 name];
  id v38 = [v3 rawName];
  id v37 = [v3 industryCategory];
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "industryCode"));
  uint64_t v26 = [v10 objectForKeyedSubscript:@"DE018"];
  uint64_t v36 = [v10 objectForKeyedSubscript:@"DE019"];
  long long v35 = [v10 objectForKeyedSubscript:@"DE041"];
  long long v34 = objc_msgSend(NSNumber, "numberWithBool:", -[PKPaymentTransaction isCoarseLocation](self, "isCoarseLocation"));
  id v33 = [(PKPaymentTransaction *)self location];
  uint64_t v32 = [v3 merchantIdentifier];
  uint64_t v31 = [v3 rawCANL];
  uint64_t v23 = [v3 rawCity];
  uint64_t v24 = [v3 rawState];
  uint64_t v22 = [v3 rawCountry];
  uint64_t v20 = [v3 city];
  uint64_t v21 = [v3 zip];
  unint64_t v19 = [v3 state];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "cleanConfidenceLevel"));
  BOOL v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "adamIdentifier"));
  long long v15 = [v3 originURL];
  unint64_t v16 = [v3 webMerchantIdentifier];
  [v3 webMerchantName];
  uint64_t v17 = v25 = v10;
  uint64_t v29 = objc_msgSend(v28, "initWithPaymentHash:merchantName:merchantRawName:industryCategory:industryCode:merchantType:merchantCountryCode:terminalIdentifier:merchantAdditionalData:paymentNetwork:isCoarseLocation:location:merchantIdentifier:merchantRawCANL:merchantRawCity:merchantRawState:merchantRawCountry:merchantCity:merchantZip:merchantState:merchantCleanConfidenceLevel:adamIdentifier:webURL:webMerchantIdentifier:webMerchantName:", v41, v40, v38, v37, v27, v26, v36, v35, v30, v39, v34, v33, v32, v31,
                  v23,
                  v24,
                  v22,
                  v20,
                  v21,
                  v19,
                  v13,
                  v14,
                  v15,
                  v16,
                  v17);

  return v29;
}

- (unint64_t)_fkPaymentTransactionType
{
  unint64_t result = [(PKPaymentTransaction *)self transactionType];
  if (result - 1 >= 0x16) {
    return 0;
  }
  return result;
}

- (int64_t)_fkPaymentTransactionStatus
{
  int64_t result = [(PKPaymentTransaction *)self transactionStatus];
  if ((unint64_t)result >= 9) {
    return -1;
  }
  return result;
}

- (id)_fkContactTransactionInsight
{
  id v3 = objc_alloc(getFKContactTransactionInsightClass());
  BOOL v4 = [(PKPaymentTransaction *)self peerPaymentCounterpartHandle];
  uint64_t v5 = (void *)[v3 initWithPeerPaymentCounterpartHandle:v4];

  return v5;
}

+ (void)augmentTransactionsIfNeeded:(id)a3 transactionSourceIdentifiers:(id)a4 passUniqueID:(id)a5 usingDataProvider:(id)a6 completion:(id)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  BOOL v14 = (PKPaymentDefaultDataProvider *)a6;
  id v15 = a7;
  if (v15)
  {
    id v33 = v13;
    long long v35 = v12;
    if (!v14) {
      BOOL v14 = objc_alloc_init(PKPaymentDefaultDataProvider);
    }
    uint64_t v36 = v14;
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v34 = v11;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v55 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v24 = objc_msgSend(v23, "paymentHash", v33);
          if ([v23 transactionType]) {
            BOOL v25 = [v23 transactionType] == 16;
          }
          else {
            BOOL v25 = 1;
          }
          if (![v23 transactionStatus]
            || [v23 transactionStatus] == 1
            || [v23 transactionStatus] == -1)
          {
            BOOL v26 = 1;
            if (!v24) {
              goto LABEL_21;
            }
          }
          else
          {
            BOOL v26 = [v23 transactionStatus] == 8;
            if (!v24) {
              goto LABEL_21;
            }
          }
          if (v25 && v26)
          {
            [v16 addObject:v24];
            [v17 addObject:v23];
          }
LABEL_21:
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v20);
    }

    if ([v16 count])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke;
      aBlock[3] = &unk_1E56E37E0;
      id v27 = v17;
      id v53 = v27;
      id v28 = _Block_copy(aBlock);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_2;
      v50[3] = &unk_1E56E37E0;
      id v51 = v27;
      uint64_t v29 = _Block_copy(v50);
      uint64_t v30 = objc_alloc_init(PKAsyncUnaryOperationComposer);
      id v13 = v33;
      if (!PKHideCardBenefitPayLater())
      {
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_3;
        v45[3] = &unk_1E56F6FE0;
        uint64_t v46 = v36;
        id v47 = v35;
        id v48 = v16;
        id v49 = v28;
        [(PKAsyncUnaryOperationComposer *)v30 addOperation:v45];
      }
      if (!PKHideCardBenefitRewards())
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_2_31;
        v40[3] = &unk_1E56F6FE0;
        long long v41 = v36;
        id v42 = v33;
        id v43 = v16;
        id v44 = v29;
        [(PKAsyncUnaryOperationComposer *)v30 addOperation:v40];
      }
      uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v33);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_2_39;
      v37[3] = &unk_1E56F6E20;
      id v39 = v15;
      id v38 = v18;
      id v32 = [(PKAsyncUnaryOperationComposer *)v30 evaluateWithInput:v31 completion:v37];
    }
    else
    {
      (*((void (**)(id, id))v15 + 2))(v15, v18);
      id v13 = v33;
    }

    id v11 = v34;
    id v12 = v35;
    BOOL v14 = v36;
  }
}

void __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v10 = objc_msgSend(v9, "paymentHash", (void)v14);
        if (v10)
        {
          id v11 = [v3 objectForKeyedSubscript:v10];
          id v12 = v11;
          if (v11)
          {
            objc_msgSend(v9, "setIsIssuerInstallmentTransaction:", objc_msgSend(v11, "isIssuerInstallmentTransaction"));
            id v13 = [v12 issuerInstallmentManagementURL];
            [v9 setIssuerInstallmentManagementURL:v13];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

void __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v10 = objc_msgSend(v9, "paymentHash", (void)v13);
        if (v10)
        {
          id v11 = [v3 objectForKeyedSubscript:v10];
          id v12 = v11;
          if (v11 && [v11 isInGoodStanding]) {
            [v9 setPaymentRewardsRedemption:v12];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

void __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  double v10 = *(void **)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_4;
  v13[3] = &unk_1E56F6FB8;
  id v14 = v10;
  id v16 = *(id *)(a1 + 56);
  id v17 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 issuerInstallmentTransactionsForTransactionSourceIdentifiers:v9 paymentHashes:v14 completion:v13];
}

void __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_5;
  v9[3] = &unk_1E56F6F90;
  id v10 = v6;
  id v11 = a1[4];
  id v12 = v5;
  id v14 = a1[6];
  id v15 = a1[7];
  id v13 = a1[5];
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    unint64_t v2 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 40) count];
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 134218242;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Could not load issuer installment transactions for paymentHashes (%ld): error %@.", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    unint64_t v2 = objc_msgSend(*(id *)(a1 + 48), "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_232);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

uint64_t __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_26(uint64_t a1, void *a2)
{
  return [a2 paymentHash];
}

void __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_2_31(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_3_32;
  v13[3] = &unk_1E56F6FB8;
  id v14 = v10;
  id v16 = *(id *)(a1 + 56);
  id v17 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 paymentRewardsRedemptionsForPassUniqueIdentifier:v9 paymentHashes:v14 completion:v13];
}

void __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_3_32(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_4_33;
  v9[3] = &unk_1E56F6F90;
  id v10 = v6;
  id v11 = a1[4];
  id v12 = v5;
  id v14 = a1[6];
  id v15 = a1[7];
  id v13 = a1[5];
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_4_33(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    unint64_t v2 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 40) count];
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 134218242;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Could not load payment rewards redemptions for paymentHashes (%ld): error %@.", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    unint64_t v2 = objc_msgSend(*(id *)(a1 + 48), "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_37_2);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

id __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_34(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 paymentHash];
  uint64_t v3 = [v2 uppercaseString];

  return v3;
}

void __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_2_39(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_3_40;
  v2[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __135__PKPaymentTransaction_FinanceKit__augmentTransactionsIfNeeded_transactionSourceIdentifiers_passUniqueID_usingDataProvider_completion___block_invoke_3_40(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end