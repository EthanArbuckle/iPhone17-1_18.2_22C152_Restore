@interface PKAccount
+ (BOOL)supportsSecureCoding;
+ (id)accountIdentifierFromRecordName:(id)a3;
+ (id)analyticsAccountTypeForAccount:(id)a3;
+ (id)recordNameForAccountIdentifier:(id)a3;
+ (id)recordNamePrefix;
- (BOOL)FDICBehaviorHideCreditRewardsHubSignage;
- (BOOL)FDICBehaviorShowCreditDashboardBalance;
- (BOOL)FDICBehaviorShowCreditRewardsHubBalance;
- (BOOL)FDICBehaviorShowSettingsBalance;
- (BOOL)accountStateDirty;
- (BOOL)accountUserInvitationAllowed;
- (BOOL)blockAllAccountAccess;
- (BOOL)blockNotifications;
- (BOOL)hideBillPaymentHoldTime;
- (BOOL)hideDisputeDetails;
- (BOOL)hideEnhancedDisputeDetails;
- (BOOL)hideInterestChargeClarity;
- (BOOL)hidePayLaterInPaymentSheet;
- (BOOL)hidePayLaterSetupInWallet;
- (BOOL)hideSpendingInsights;
- (BOOL)isClosedAndChargedOff;
- (BOOL)isCloudAccount;
- (BOOL)isCoOwner;
- (BOOL)isContentEqualToAccount:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSharedAccount;
- (BOOL)provisioningAllowed;
- (BOOL)showBillPaymentInterest;
- (BOOL)showBillPaymentInterestSummary;
- (BOOL)showCardPromotions;
- (BOOL)showEnhancedMerchants;
- (BOOL)showPaymentSheetRewards;
- (BOOL)showPhysicalCardExpiringSoonMessaging;
- (BOOL)showRewardsGraph;
- (BOOL)supportsAMPRedeemGiftcard;
- (BOOL)supportsAMPTopUp;
- (BOOL)supportsAddBeneficiaries;
- (BOOL)supportsAddFundingSource;
- (BOOL)supportsDynamicReportIssueTopics;
- (BOOL)supportsDynamicSecurityCodes;
- (BOOL)supportsExportSavingsTransactionData;
- (BOOL)supportsExportTransactionData;
- (BOOL)supportsExtendedFetch;
- (BOOL)supportsInStorePayment;
- (BOOL)supportsInStoreTopUp;
- (BOOL)supportsMoneyMovement;
- (BOOL)supportsOneTimeDeposit;
- (BOOL)supportsOneTimeDepositWithAppleCash;
- (BOOL)supportsOneTimeWithdrawal;
- (BOOL)supportsOneTimeWithdrawalWithAppleCash;
- (BOOL)supportsPhysicalCardActivation;
- (BOOL)supportsRedeemRewards;
- (BOOL)supportsRequestPhysicalCard;
- (BOOL)supportsRequestStatement;
- (BOOL)supportsSchedulePayment;
- (BOOL)supportsScheduleRecurringPayments;
- (BOOL)supportsShowAccountSummary;
- (BOOL)supportsShowNotifications;
- (BOOL)supportsShowSavingsAccountSummary;
- (BOOL)supportsShowVirtualCard;
- (BOOL)supportsStandaloneTransactions;
- (BOOL)supportsStatementMetadata;
- (BOOL)supportsTopUp;
- (BOOL)supportsTransactionSyncReporting;
- (BOOL)supportsViewSavingsStatement;
- (BOOL)supportsViewStatement;
- (BOOL)supportsViewTaxDocuments;
- (NSArray)cloudStoreZoneNames;
- (NSDate)lastUpdated;
- (NSSet)allAccountIdentifiers;
- (NSSet)previousAccountIdentifiers;
- (NSSet)supportedFeatures;
- (NSString)accountIdentifier;
- (NSString)altDSID;
- (NSString)transactionSourceIdentifier;
- (NSURL)accountBaseURL;
- (NSURL)applyServiceURL;
- (NSURL)paymentServicesBaseURL;
- (PKAccount)initWithCloudStoreCoder:(id)a3;
- (PKAccount)initWithCoder:(id)a3;
- (PKAccount)initWithDictionary:(id)a3;
- (PKAccount)initWithDictionary:(id)a3 isCloudAccount:(BOOL)a4;
- (PKAccountAdditionalPushTopics)additionalPushTopics;
- (PKAccountDetails)details;
- (PKAccountFetchPeriods)fetchPeriods;
- (PKAppleBalanceAccountDetails)appleBalanceDetails;
- (PKCreditAccountDetails)creditDetails;
- (PKPayLaterAccountDetails)payLaterDetails;
- (PKSavingsAccountDetails)savingsDetails;
- (id)FDICBehaviorsFeatureDescriptor;
- (id)_appleBalanceFeatureWithIdentifier:(id)a3;
- (id)_creditFeatureWithIdentifier:(id)a3;
- (id)_featureDescriptorsForFeature:(unint64_t)a3 inCloudRecord:(id)a4;
- (id)_featureWithIdentifier:(id)a3;
- (id)_payLaterFeatureWithIdentifier:(id)a3;
- (id)_savingsFeatureWithIdentifier:(id)a3;
- (id)accountUserInvitationAllowedFeatureDescriptor;
- (id)addBeneficiariesFeatureDescriptor;
- (id)addFundingSourceFeatureDescriptor;
- (id)analyticsEventAccountType;
- (id)associatedPassUniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createdDate;
- (id)description;
- (id)dynamicSecurityCodesFeatureDescriptor;
- (id)exportSavingsTransactionDataFeatureDescriptor;
- (id)exportTransactionDataFeatureDescriptor;
- (id)hideBillPaymentHoldTimeFeatureDescriptor;
- (id)hideDisputeDetailsFeatureDescriptor;
- (id)hideEnhancedDisputeDetailsFeatureDescriptor;
- (id)hideInterestChargeClarityFeatureDescriptor;
- (id)hidePayLaterInPaymentSheetFeatureDescriptor;
- (id)hidePayLaterSetupInWalletFeatureDescriptor;
- (id)hideSpendingInsightsFeatureDescriptor;
- (id)oneTimeDepositFeatureDescriptor;
- (id)oneTimeDepositWithAppleCashFeatureDescriptor;
- (id)oneTimeWithdrawalFeatureDescriptor;
- (id)oneTimeWithdrawalWithAppleCashFeatureDescriptor;
- (id)physicalCardActivationFeatureDescriptor;
- (id)primaryIdentifier;
- (id)productTimeZone;
- (id)provisioningAllowedFeatureDescriptor;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (id)redeemRewardsFeatureDescriptor;
- (id)requestPhysicalCardFeatureDescriptor;
- (id)requestStatementFeatureDescriptor;
- (id)schedulePaymentFeatureDescriptor;
- (id)scheduleRecurringPaymentsFeatureDescriptor;
- (id)showAccountSummaryFeatureDescriptor;
- (id)showBillPaymentInterestFeatureDescriptor;
- (id)showBillPaymentInterestSummaryFeatureDescriptor;
- (id)showCardPromotionsFeatureDescriptor;
- (id)showEnhancedMerchantsFeatureDescriptor;
- (id)showNotificationsFeatureDescriptor;
- (id)showPaymentSheetRewardsFeatureDescriptor;
- (id)showPhysicalCardExpiringSoonMessagingDescriptor;
- (id)showRewardsGraphFeatureDescriptor;
- (id)showSavingsAccountSummaryFeatureDescriptor;
- (id)showVirtualCardFeatureDescriptor;
- (id)statementMetadataFeatureDescriptor;
- (id)supportsAMPRedeemGiftcardFeatureDescriptor;
- (id)supportsAMPTopUpFeatureDescriptor;
- (id)supportsDynamicReportIssueTopicsFeatureDescriptor;
- (id)supportsInStorePaymentFeatureDescriptor;
- (id)supportsInStoreTopUpFeatureDescriptor;
- (id)supportsTopUpFeatureDescriptor;
- (id)transactionSyncReportingFeatureDescriptor;
- (id)updateUserInfoBaseURL;
- (id)viewSavingsStatementFeatureDescriptor;
- (id)viewStatementFeatureDescriptor;
- (id)viewTaxDocumentsFeatureDescriptor;
- (unint64_t)accessLevel;
- (unint64_t)feature;
- (unint64_t)hash;
- (unint64_t)itemType;
- (unint64_t)oneTimeDepositFundingSourceTypes;
- (unint64_t)oneTimeWithdrawalFundingSourceTypes;
- (unint64_t)state;
- (unint64_t)stateReason;
- (unint64_t)supportedContactMethodForAddingBeneficiaries;
- (unint64_t)type;
- (void)_addSupportedFeaturesToEncryptedCloudRecord:(id)a3;
- (void)_insertSupportedFeature:(id)a3;
- (void)_removeSupportedFeatureWithIdentifier:(id)a3;
- (void)applyPropertiesFromCloudStoreRecord:(id)a3;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessLevel:(unint64_t)a3;
- (void)setAccountBaseURL:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountStateDirty:(BOOL)a3;
- (void)setAdditionalPushTopics:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setApplyServiceURL:(id)a3;
- (void)setBlockAllAccountAccess:(BOOL)a3;
- (void)setBlockNotifications:(BOOL)a3;
- (void)setCloudStoreZoneNames:(id)a3;
- (void)setCoOwner:(BOOL)a3;
- (void)setDetails:(id)a3;
- (void)setFeature:(unint64_t)a3;
- (void)setFetchPeriods:(id)a3;
- (void)setIsCloudAccount:(BOOL)a3;
- (void)setLastUpdated:(id)a3;
- (void)setPaymentServicesBaseURL:(id)a3;
- (void)setPreviousAccountIdentifiers:(id)a3;
- (void)setSharedAccount:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateReason:(unint64_t)a3;
- (void)setSupportedFeatures:(id)a3;
- (void)setTransactionSourceIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)updateWithCloudStoreRecord:(id)a3;
@end

@implementation PKAccount

- (PKAccount)initWithDictionary:(id)a3
{
  return [(PKAccount *)self initWithDictionary:a3 isCloudAccount:0];
}

- (PKAccount)initWithDictionary:(id)a3 isCloudAccount:(BOOL)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v65.receiver = self;
  v65.super_class = (Class)PKAccount;
  v7 = [(PKAccount *)&v65 init];
  if (!v7) {
    goto LABEL_61;
  }
  uint64_t v8 = [v6 PKStringForKey:@"accountIdentifier"];
  accountIdentifier = v7->_accountIdentifier;
  v7->_accountIdentifier = (NSString *)v8;

  if ([(NSString *)v7->_accountIdentifier length])
  {
    uint64_t v10 = [v6 PKURLForKey:@"accountBaseURL"];
    accountBaseURL = v7->_accountBaseURL;
    v7->_accountBaseURL = (NSURL *)v10;

    v7->_isCloudAccount = a4;
    if (!v7->_accountBaseURL && !a4)
    {
      v12 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Error: Account baseURL missing for non-cloud account";
LABEL_9:
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    v12 = [v6 PKStringForKey:@"featureIdentifier"];
    uint64_t v14 = PKFeatureIdentifierFromString(v12);
    v7->_feature = v14;
    if (!v14)
    {
      v28 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v7->_accountIdentifier;
        *(_DWORD *)buf = 138412546;
        v68 = v29;
        __int16 v69 = 2112;
        v70 = v12;
        _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "Error: Unknown feature identifier for account: %@ feature:%@", buf, 0x16u);
      }

      goto LABEL_19;
    }
    uint64_t v15 = [v6 PKURLForKey:@"applyServiceURL"];
    applyServiceURL = v7->_applyServiceURL;
    v7->_applyServiceURL = (NSURL *)v15;

    uint64_t v17 = [v6 PKURLForKey:@"paymentServicesBaseURL"];
    paymentServicesBaseURL = v7->_paymentServicesBaseURL;
    v7->_paymentServicesBaseURL = (NSURL *)v17;

    v19 = [v6 PKStringForKey:@"accountType"];
    v7->_unint64_t type = PKAccountTypeFromString(v19);

    v20 = [PKAccountDetails alloc];
    v21 = [v6 PKDictionaryForKey:@"accountDetails"];
    if (v7->_type - 1 >= 4) {
      unint64_t type = 0;
    }
    else {
      unint64_t type = v7->_type;
    }
    uint64_t v23 = [(PKAccountDetails *)v20 initWithDictionary:v21 type:type];
    details = v7->_details;
    v7->_details = (PKAccountDetails *)v23;

    v25 = [v6 PKStringForKey:@"state"];
    v7->_state = PKAccountStateFromString(v25);

    id v26 = [v6 PKStringForKey:@"stateReason"];
    if ([v26 isEqualToString:@"delinquent"])
    {
      uint64_t v27 = 1;
    }
    else if ([v26 isEqualToString:@"hardship"])
    {
      uint64_t v27 = 3;
    }
    else if ([v26 isEqualToString:@"disasterRecovery"])
    {
      uint64_t v27 = 2;
    }
    else if ([v26 isEqualToString:@"termsOfUseViolation"])
    {
      uint64_t v27 = 4;
    }
    else if ([v26 isEqualToString:@"fraudSuspected"])
    {
      uint64_t v27 = 5;
    }
    else if ([v26 isEqualToString:@"fraudConfirmed"])
    {
      uint64_t v27 = 6;
    }
    else if ([v26 isEqualToString:@"fraudConfirmedCustomer"])
    {
      uint64_t v27 = 7;
    }
    else if ([v26 isEqualToString:@"chargedOff"])
    {
      uint64_t v27 = 8;
    }
    else if ([v26 isEqualToString:@"securityDowngrade"])
    {
      uint64_t v27 = 9;
    }
    else if ([v26 isEqualToString:@"embargoRecovery"])
    {
      uint64_t v27 = 10;
    }
    else if ([v26 isEqualToString:@"mergeComplete"])
    {
      uint64_t v27 = 12;
    }
    else if ([v26 isEqualToString:@"merging"])
    {
      uint64_t v27 = 11;
    }
    else if ([v26 isEqualToString:@"removed"])
    {
      uint64_t v27 = 13;
    }
    else if ([v26 isEqualToString:@"mergeInitiated"])
    {
      uint64_t v27 = 14;
    }
    else if ([v26 isEqualToString:@"bankruptcy"])
    {
      uint64_t v27 = 15;
    }
    else
    {
      uint64_t v27 = 0;
    }

    v7->_stateReason = v27;
    v31 = [v6 PKStringForKey:@"accessLevel"];
    v7->_accessLevel = PKAccountAccessLevelFromString(v31);

    v7->_blockAllAccountAccess = [v6 PKBoolForKey:@"blockAllAccountAccess"];
    v7->_blockNotifications = [v6 PKBoolForKey:@"blockNotifications"];
    uint64_t v32 = [v6 PKStringForKey:@"altDSID"];
    altDSID = v7->_altDSID;
    v7->_altDSID = (NSString *)v32;

    v7->_sharedAccount = [v6 PKBoolForKey:@"isSharedAccount"];
    uint64_t v34 = [v6 PKSetContaining:objc_opt_class() forKey:@"previousAccountIdentifiers"];
    previousAccountIdentifiers = v7->_previousAccountIdentifiers;
    v7->_previousAccountIdentifiers = (NSSet *)v34;

    v36 = [v6 PKSetForKey:@"supportedFeatures"];
    v37 = [MEMORY[0x1E4F1CA80] set];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v38 = v36;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v62 != v41) {
            objc_enumerationMutation(v38);
          }
          unint64_t v43 = v7->_type - 1;
          if (v43 <= 3)
          {
            uint64_t v44 = *(void *)(*((void *)&v61 + 1) + 8 * i);
            id v45 = objc_alloc(*off_1E56DEE08[v43]);
            v46 = objc_msgSend(v45, "initWithDictionary:", v44, (void)v61);
            [v37 addObject:v46];
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v40);
    }

    uint64_t v47 = [v37 copy];
    supportedFeatures = v7->_supportedFeatures;
    v7->_supportedFeatures = (NSSet *)v47;

    v49 = [PKAccountAdditionalPushTopics alloc];
    v50 = [v6 PKDictionaryForKey:@"additionalPushTopics"];
    uint64_t v51 = [(PKAccountAdditionalPushTopics *)v49 initWithDictionary:v50];
    additionalPushTopics = v7->_additionalPushTopics;
    v7->_additionalPushTopics = (PKAccountAdditionalPushTopics *)v51;

    v53 = [PKAccountFetchPeriods alloc];
    v54 = [v6 PKDictionaryForKey:@"proactiveFetchPeriods"];
    uint64_t v55 = [(PKAccountFetchPeriods *)v53 initWithDictionary:v54];
    fetchPeriods = v7->_fetchPeriods;
    v7->_fetchPeriods = (PKAccountFetchPeriods *)v55;

    v57 = [v6 PKDictionaryForKey:@"extendedAccountDetails"];
    if (v57) {
      [(PKAccountDetails *)v7->_details ingestExtendedAccountDetails:v57];
    }
    uint64_t v58 = [v6 PKArrayContaining:objc_opt_class() forKey:@"cloudStoreZoneNames"];
    cloudStoreZoneNames = v7->_cloudStoreZoneNames;
    v7->_cloudStoreZoneNames = (NSArray *)v58;

LABEL_61:
    v30 = v7;
    goto LABEL_62;
  }
  v12 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v13 = "Error: Account identifier missing";
    goto LABEL_9;
  }
LABEL_19:

  v30 = 0;
LABEL_62:

  return v30;
}

- (id)associatedPassUniqueID
{
  v3 = 0;
  unint64_t type = self->_type;
  if (type != 3)
  {
    if (type != 2)
    {
      if (type != 1) {
        goto LABEL_15;
      }
      v5 = [(PKAccount *)self creditDetails];
      id v6 = v5;
      if (v5)
      {
        v7 = [v5 associatedPassTypeIdentifier];
        uint64_t v8 = [v6 associatedPassSerialNumber];
        v3 = PKGeneratePassUniqueID(v7, v8);
LABEL_13:

        goto LABEL_14;
      }
      v3 = 0;
      goto LABEL_14;
    }
    v9 = [(PKAccount *)self payLaterDetails];
    uint64_t v10 = v9;
    if (v9)
    {
      v11 = [v9 associatedPassTypeIdentifier];
      v12 = [v10 associatedPassSerialNumber];
      v3 = PKGeneratePassUniqueID(v11, v12);
    }
    else
    {
      v3 = 0;
    }
  }
  v13 = [(PKAccount *)self appleBalanceDetails];
  id v6 = v13;
  if (v13)
  {
    v7 = [v13 associatedPassTypeIdentifier];
    uint64_t v8 = [v6 associatedPassSerialNumber];
    uint64_t v14 = PKGeneratePassUniqueID(v7, v8);

    v3 = (void *)v14;
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:
  return v3;
}

- (id)createdDate
{
  switch(self->_type)
  {
    case 1uLL:
      v2 = [(PKAccount *)self creditDetails];
      goto LABEL_7;
    case 2uLL:
      v2 = [(PKAccount *)self payLaterDetails];
      goto LABEL_7;
    case 3uLL:
      v2 = [(PKAccount *)self appleBalanceDetails];
      goto LABEL_7;
    case 4uLL:
      v2 = [(PKAccount *)self savingsDetails];
LABEL_7:
      v4 = v2;
      v3 = [v2 createdDate];

      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (id)productTimeZone
{
  unint64_t type = self->_type;
  if (type == 4)
  {
    v3 = [(PKAccount *)self savingsDetails];
    goto LABEL_5;
  }
  if (type == 1)
  {
    v3 = [(PKAccount *)self creditDetails];
LABEL_5:
    v4 = v3;
    v5 = [v3 productTimeZone];

    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  return v5;
}

- (PKCreditAccountDetails)creditDetails
{
  return [(PKAccountDetails *)self->_details creditDetails];
}

- (PKPayLaterAccountDetails)payLaterDetails
{
  return [(PKAccountDetails *)self->_details payLaterDetails];
}

- (PKAppleBalanceAccountDetails)appleBalanceDetails
{
  return [(PKAccountDetails *)self->_details appleBalanceDetails];
}

- (PKSavingsAccountDetails)savingsDetails
{
  return [(PKAccountDetails *)self->_details savingsDetails];
}

- (id)analyticsEventAccountType
{
  if (self->_coOwner)
  {
    v2 = PKAnalyticsReportEventTypeAccountTypeCoOwner;
LABEL_3:
    v3 = *v2;
    goto LABEL_4;
  }
  unint64_t accessLevel = self->_accessLevel;
  if (accessLevel == 1)
  {
    v2 = PKAnalyticsReportEventTypeAccountTypePrimary;
    goto LABEL_3;
  }
  if (accessLevel == 2)
  {
    v2 = PKAnalyticsReportEventTypeAccountTypeParticipant;
    goto LABEL_3;
  }
  v3 = 0;
LABEL_4:
  return v3;
}

+ (id)analyticsAccountTypeForAccount:(id)a3
{
  if (a3)
  {
    v3 = [a3 analyticsEventAccountType];
  }
  else
  {
    v3 = @"new";
  }
  return v3;
}

- (NSSet)allAccountIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = v3;
  if (self->_accountIdentifier) {
    objc_msgSend(v3, "addObject:");
  }
  if ([(NSSet *)self->_previousAccountIdentifiers count]) {
    [v4 unionSet:self->_previousAccountIdentifiers];
  }
  v5 = (void *)[v4 copy];

  return (NSSet *)v5;
}

- (id)updateUserInfoBaseURL
{
  applyServiceURL = self->_applyServiceURL;
  if (applyServiceURL)
  {
    applyServiceURL = [applyServiceURL URLByAppendingPathComponent:@"updateUserInfo"];
  }
  return applyServiceURL;
}

- (BOOL)supportsStandaloneTransactions
{
  return self->_type == 4 && self->_state - 1 < 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccount)initWithCoder:(id)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PKAccount;
  v5 = [(PKAccount *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountBaseURL"];
    accountBaseURL = v5->_accountBaseURL;
    v5->_accountBaseURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applyServiceURL"];
    applyServiceURL = v5->_applyServiceURL;
    v5->_applyServiceURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentServicesBaseURL"];
    paymentServicesBaseURL = v5->_paymentServicesBaseURL;
    v5->_paymentServicesBaseURL = (NSURL *)v12;

    v5->_feature = [v4 decodeIntegerForKey:@"feature"];
    v5->_unint64_t type = [v4 decodeIntegerForKey:@"accountType"];
    v5->_state = [v4 decodeIntegerForKey:@"state"];
    v5->_stateReason = [v4 decodeIntegerForKey:@"stateReason"];
    v5->_unint64_t accessLevel = [v4 decodeIntegerForKey:@"accessLevel"];
    v5->_blockAllAccountAccess = [v4 decodeBoolForKey:@"blockAllAccountAccess"];
    v5->_blockNotifications = [v4 decodeBoolForKey:@"blockNotifications"];
    v5->_isCloudAccount = [v4 decodeBoolForKey:@"isCloudAccount"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v14;

    v5->_coOwner = [v4 decodeBoolForKey:@"coOwner"];
    v5->_sharedAccount = [v4 decodeBoolForKey:@"isSharedAccount"];
    id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"previousAccountIdentifiers"];
    previousAccountIdentifiers = v5->_previousAccountIdentifiers;
    v5->_previousAccountIdentifiers = (NSSet *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v21;

    switch(v5->_type)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
        uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountDetails"];
        details = v5->_details;
        v5->_details = (PKAccountDetails *)v23;

        v25 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v26 = objc_opt_class();
        uint64_t v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
        uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"supportedFeatures"];
        supportedFeatures = v5->_supportedFeatures;
        v5->_supportedFeatures = (NSSet *)v28;

        break;
      default:
        break;
    }
    v5->_accountStateDirty = [v4 decodeBoolForKey:@"accountStateDirty"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"additionalPushTopics"];
    additionalPushTopics = v5->_additionalPushTopics;
    v5->_additionalPushTopics = (PKAccountAdditionalPushTopics *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proactiveFetchPeriods"];
    fetchPeriods = v5->_fetchPeriods;
    v5->_fetchPeriods = (PKAccountFetchPeriods *)v32;

    uint64_t v34 = (void *)MEMORY[0x1E4F1CAD0];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    v36 = [v34 setWithArray:v35];
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"cloudStoreZoneNames"];
    cloudStoreZoneNames = v5->_cloudStoreZoneNames;
    v5->_cloudStoreZoneNames = (NSArray *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionSourceIdentifier"];
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v39;
  }
  return v5;
}

- (NSArray)cloudStoreZoneNames
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_cloudStoreZoneNames count])
  {
    id v3 = self->_cloudStoreZoneNames;
  }
  else
  {
    v5[0] = @"transactions";
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  accountIdentifier = self->_accountIdentifier;
  id v5 = a3;
  [v5 encodeObject:accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_accountBaseURL forKey:@"accountBaseURL"];
  [v5 encodeObject:self->_applyServiceURL forKey:@"applyServiceURL"];
  [v5 encodeObject:self->_paymentServicesBaseURL forKey:@"paymentServicesBaseURL"];
  [v5 encodeInteger:self->_feature forKey:@"feature"];
  [v5 encodeInteger:self->_type forKey:@"accountType"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeInteger:self->_stateReason forKey:@"stateReason"];
  [v5 encodeBool:self->_blockAllAccountAccess forKey:@"blockAllAccountAccess"];
  [v5 encodeBool:self->_blockNotifications forKey:@"blockNotifications"];
  [v5 encodeBool:self->_isCloudAccount forKey:@"isCloudAccount"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
  [v5 encodeBool:self->_coOwner forKey:@"coOwner"];
  [v5 encodeBool:self->_sharedAccount forKey:@"isSharedAccount"];
  [v5 encodeObject:self->_previousAccountIdentifiers forKey:@"previousAccountIdentifiers"];
  [v5 encodeInteger:self->_accessLevel forKey:@"accessLevel"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdated"];
  [v5 encodeObject:self->_details forKey:@"accountDetails"];
  [v5 encodeObject:self->_supportedFeatures forKey:@"supportedFeatures"];
  [v5 encodeBool:self->_accountStateDirty forKey:@"accountStateDirty"];
  [v5 encodeObject:self->_additionalPushTopics forKey:@"additionalPushTopics"];
  [v5 encodeObject:self->_fetchPeriods forKey:@"proactiveFetchPeriods"];
  [v5 encodeObject:self->_cloudStoreZoneNames forKey:@"cloudStoreZoneNames"];
  [v5 encodeObject:self->_transactionSourceIdentifier forKey:@"transactionSourceIdentifier"];
}

- (BOOL)isContentEqualToAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_63;
  }
  accountIdentifier = self->_accountIdentifier;
  uint64_t v6 = (NSString *)v4[2];
  if (accountIdentifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (accountIdentifier != v6) {
      goto LABEL_63;
    }
  }
  else if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_63;
  }
  accountBaseURL = self->_accountBaseURL;
  v9 = (NSURL *)v4[3];
  if (accountBaseURL && v9)
  {
    if ((-[NSURL isEqual:](accountBaseURL, "isEqual:") & 1) == 0) {
      goto LABEL_63;
    }
  }
  else if (accountBaseURL != v9)
  {
    goto LABEL_63;
  }
  applyServiceURL = self->_applyServiceURL;
  v11 = (NSURL *)v4[5];
  if (applyServiceURL && v11)
  {
    if ((-[NSURL isEqual:](applyServiceURL, "isEqual:") & 1) == 0) {
      goto LABEL_63;
    }
  }
  else if (applyServiceURL != v11)
  {
    goto LABEL_63;
  }
  paymentServicesBaseURL = self->_paymentServicesBaseURL;
  v13 = (NSURL *)v4[4];
  if (paymentServicesBaseURL && v13)
  {
    if ((-[NSURL isEqual:](paymentServicesBaseURL, "isEqual:") & 1) == 0) {
      goto LABEL_63;
    }
  }
  else if (paymentServicesBaseURL != v13)
  {
    goto LABEL_63;
  }
  details = self->_details;
  uint64_t v15 = (PKAccountDetails *)v4[8];
  if (details && v15)
  {
    if (!-[PKAccountDetails isEqual:](details, "isEqual:")) {
      goto LABEL_63;
    }
  }
  else if (details != v15)
  {
    goto LABEL_63;
  }
  if (self->_feature != v4[6]
    || self->_type != v4[7]
    || self->_state != v4[9]
    || self->_stateReason != v4[10]
    || self->_accessLevel != v4[11]
    || self->_blockAllAccountAccess != *((unsigned __int8 *)v4 + 9)
    || self->_blockNotifications != *((unsigned __int8 *)v4 + 8)
    || self->_isCloudAccount != *((unsigned __int8 *)v4 + 10))
  {
    goto LABEL_63;
  }
  altDSID = self->_altDSID;
  uint64_t v17 = (NSString *)v4[12];
  if (altDSID && v17)
  {
    if ((-[NSString isEqual:](altDSID, "isEqual:") & 1) == 0) {
      goto LABEL_63;
    }
  }
  else if (altDSID != v17)
  {
    goto LABEL_63;
  }
  if (self->_coOwner != *((unsigned __int8 *)v4 + 11) || self->_sharedAccount != *((unsigned __int8 *)v4 + 12)) {
    goto LABEL_63;
  }
  previousAccountIdentifiers = self->_previousAccountIdentifiers;
  uint64_t v19 = (NSSet *)v4[13];
  if (previousAccountIdentifiers && v19)
  {
    if ((-[NSSet isEqual:](previousAccountIdentifiers, "isEqual:") & 1) == 0) {
      goto LABEL_63;
    }
  }
  else if (previousAccountIdentifiers != v19)
  {
    goto LABEL_63;
  }
  if (self->_accountStateDirty != *((unsigned __int8 *)v4 + 13)) {
    goto LABEL_63;
  }
  supportedFeatures = self->_supportedFeatures;
  uint64_t v21 = (NSSet *)v4[14];
  if (supportedFeatures && v21)
  {
    if ((-[NSSet isEqual:](supportedFeatures, "isEqual:") & 1) == 0) {
      goto LABEL_63;
    }
  }
  else if (supportedFeatures != v21)
  {
    goto LABEL_63;
  }
  additionalPushTopics = self->_additionalPushTopics;
  uint64_t v23 = (PKAccountAdditionalPushTopics *)v4[15];
  if (!additionalPushTopics || !v23)
  {
    if (additionalPushTopics == v23) {
      goto LABEL_59;
    }
LABEL_63:
    BOOL v26 = 0;
    goto LABEL_64;
  }
  if (!-[PKAccountAdditionalPushTopics isEqual:](additionalPushTopics, "isEqual:")) {
    goto LABEL_63;
  }
LABEL_59:
  fetchPeriods = self->_fetchPeriods;
  v25 = (PKAccountFetchPeriods *)v4[16];
  if (fetchPeriods && v25) {
    BOOL v26 = -[PKAccountFetchPeriods isEqual:](fetchPeriods, "isEqual:");
  }
  else {
    BOOL v26 = fetchPeriods == v25;
  }
LABEL_64:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_68;
  }
  accountIdentifier = self->_accountIdentifier;
  uint64_t v6 = (NSString *)v4[2];
  if (accountIdentifier && v6)
  {
    if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (accountIdentifier != v6)
  {
    goto LABEL_68;
  }
  accountBaseURL = self->_accountBaseURL;
  uint64_t v8 = (NSURL *)v4[3];
  if (accountBaseURL && v8)
  {
    if ((-[NSURL isEqual:](accountBaseURL, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (accountBaseURL != v8)
  {
    goto LABEL_68;
  }
  applyServiceURL = self->_applyServiceURL;
  uint64_t v10 = (NSURL *)v4[5];
  if (applyServiceURL && v10)
  {
    if ((-[NSURL isEqual:](applyServiceURL, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (applyServiceURL != v10)
  {
    goto LABEL_68;
  }
  paymentServicesBaseURL = self->_paymentServicesBaseURL;
  uint64_t v12 = (NSURL *)v4[4];
  if (paymentServicesBaseURL && v12)
  {
    if ((-[NSURL isEqual:](paymentServicesBaseURL, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (paymentServicesBaseURL != v12)
  {
    goto LABEL_68;
  }
  details = self->_details;
  uint64_t v14 = (PKAccountDetails *)v4[8];
  if (details && v14)
  {
    if (!-[PKAccountDetails isEqual:](details, "isEqual:")) {
      goto LABEL_68;
    }
  }
  else if (details != v14)
  {
    goto LABEL_68;
  }
  if (self->_feature == v4[6])
  {
    lastUpdated = self->_lastUpdated;
    id v16 = (NSDate *)v4[17];
    if (lastUpdated && v16)
    {
      if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0) {
        goto LABEL_68;
      }
    }
    else if (lastUpdated != v16)
    {
      goto LABEL_68;
    }
    if (self->_type != v4[7]
      || self->_state != v4[9]
      || self->_stateReason != v4[10]
      || self->_accessLevel != v4[11]
      || self->_blockAllAccountAccess != *((unsigned __int8 *)v4 + 9)
      || self->_blockNotifications != *((unsigned __int8 *)v4 + 8)
      || self->_isCloudAccount != *((unsigned __int8 *)v4 + 10))
    {
      goto LABEL_68;
    }
    altDSID = self->_altDSID;
    v18 = (NSString *)v4[12];
    if (altDSID && v18)
    {
      if ((-[NSString isEqual:](altDSID, "isEqual:") & 1) == 0) {
        goto LABEL_68;
      }
    }
    else if (altDSID != v18)
    {
      goto LABEL_68;
    }
    if (self->_coOwner != *((unsigned __int8 *)v4 + 11) || self->_sharedAccount != *((unsigned __int8 *)v4 + 12)) {
      goto LABEL_68;
    }
    previousAccountIdentifiers = self->_previousAccountIdentifiers;
    v20 = (NSSet *)v4[13];
    if (previousAccountIdentifiers && v20)
    {
      if ((-[NSSet isEqual:](previousAccountIdentifiers, "isEqual:") & 1) == 0) {
        goto LABEL_68;
      }
    }
    else if (previousAccountIdentifiers != v20)
    {
      goto LABEL_68;
    }
    if (self->_accountStateDirty == *((unsigned __int8 *)v4 + 13))
    {
      supportedFeatures = self->_supportedFeatures;
      v22 = (NSSet *)v4[14];
      if (supportedFeatures && v22)
      {
        if ((-[NSSet isEqual:](supportedFeatures, "isEqual:") & 1) == 0) {
          goto LABEL_68;
        }
      }
      else if (supportedFeatures != v22)
      {
        goto LABEL_68;
      }
      additionalPushTopics = self->_additionalPushTopics;
      v24 = (PKAccountAdditionalPushTopics *)v4[15];
      if (additionalPushTopics && v24)
      {
        if (-[PKAccountAdditionalPushTopics isEqual:](additionalPushTopics, "isEqual:"))
        {
LABEL_61:
          v25 = [(PKAccount *)self cloudStoreZoneNames];
          uint64_t v26 = [v4 cloudStoreZoneNames];
          uint64_t v27 = (void *)v26;
          if (v25 && v26)
          {
            if ([v25 isEqual:v26])
            {
LABEL_64:
              fetchPeriods = self->_fetchPeriods;
              v29 = (PKAccountFetchPeriods *)v4[16];
              if (fetchPeriods && v29) {
                BOOL v30 = -[PKAccountFetchPeriods isEqual:](fetchPeriods, "isEqual:");
              }
              else {
                BOOL v30 = fetchPeriods == v29;
              }
              goto LABEL_73;
            }
          }
          else if (v25 == (void *)v26)
          {
            goto LABEL_64;
          }
          BOOL v30 = 0;
LABEL_73:

          goto LABEL_69;
        }
      }
      else if (additionalPushTopics == v24)
      {
        goto LABEL_61;
      }
    }
  }
LABEL_68:
  BOOL v30 = 0;
LABEL_69:

  return v30;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_details];
  [v3 safelyAddObject:self->_supportedFeatures];
  [v3 safelyAddObject:self->_lastUpdated];
  [v3 safelyAddObject:self->_accountBaseURL];
  [v3 safelyAddObject:self->_altDSID];
  [v3 safelyAddObject:self->_applyServiceURL];
  [v3 safelyAddObject:self->_previousAccountIdentifiers];
  [v3 safelyAddObject:self->_paymentServicesBaseURL];
  [v3 safelyAddObject:self->_additionalPushTopics];
  id v4 = [(PKAccount *)self cloudStoreZoneNames];
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_fetchPeriods];
  uint64_t v5 = PKCombinedHash(17, v3);
  unint64_t v6 = self->_type - v5 + 32 * v5;
  unint64_t v7 = self->_feature - v6 + 32 * v6;
  unint64_t v8 = self->_state - v7 + 32 * v7;
  unint64_t v9 = self->_stateReason - v8 + 32 * v8;
  unint64_t v10 = self->_accessLevel - v9 + 32 * v9;
  uint64_t v11 = self->_accountStateDirty - v10 + 32 * v10;
  uint64_t v12 = self->_blockAllAccountAccess - v11 + 32 * v11;
  uint64_t v13 = self->_blockNotifications - v12 + 32 * v12;
  uint64_t v14 = self->_isCloudAccount - v13 + 32 * v13;
  uint64_t v15 = self->_coOwner - v14 + 32 * v14;
  unint64_t v16 = self->_sharedAccount - v15 + 32 * v15;

  return v16;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@"accountBaseURL: '%@'; ", self->_accountBaseURL];
  [v3 appendFormat:@"applyServiceURL: '%@'; ", self->_applyServiceURL];
  [v3 appendFormat:@"paymentServicesBaseURL: '%@'; ", self->_paymentServicesBaseURL];
  id v4 = PKFeatureIdentifierToString(self->_feature);
  [v3 appendFormat:@"feature: '%@'; ", v4];

  unint64_t type = self->_type;
  if (type > 4) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = off_1E56DEE40[type];
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  unint64_t state = self->_state;
  if (state > 5) {
    unint64_t v8 = @"unknown";
  }
  else {
    unint64_t v8 = off_1E56DEE68[state];
  }
  [v3 appendFormat:@"state: '%@'; ", v8];
  unint64_t v9 = PKAccountStateReasonToString(self->_stateReason);
  [v3 appendFormat:@"stateReason: '%@'; ", v9];

  unint64_t accessLevel = self->_accessLevel;
  if (accessLevel > 2) {
    uint64_t v11 = @"unknown";
  }
  else {
    uint64_t v11 = off_1E56DEE28[accessLevel];
  }
  [v3 appendFormat:@"accessLevel: '%@'; ", v11];
  uint64_t v12 = [(PKAccountDetails *)self->_details description];
  [v3 appendFormat:@"details: '%@'; ", v12];

  if ([(NSSet *)self->_supportedFeatures count])
  {
    uint64_t v13 = [(NSSet *)self->_supportedFeatures description];
    [v3 appendFormat:@"supported features: '%@'; ", v13];
  }
  if (self->_accountStateDirty) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  [v3 appendFormat:@"dirty: '%@'; ", v14];
  if (self->_isCloudAccount) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  [v3 appendFormat:@"is cloud account: '%@'; ", v15];
  if (self->_type == 1)
  {
    if (self->_blockAllAccountAccess) {
      unint64_t v16 = @"YES";
    }
    else {
      unint64_t v16 = @"NO";
    }
    [v3 appendFormat:@"block all account access: '%@'; ", v16];
    if (self->_blockNotifications) {
      uint64_t v17 = @"YES";
    }
    else {
      uint64_t v17 = @"NO";
    }
    [v3 appendFormat:@"block notifications: '%@'; ", v17];
    [v3 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
    if (self->_sharedAccount) {
      v18 = @"YES";
    }
    else {
      v18 = @"NO";
    }
    [v3 appendFormat:@"shared account: '%@'; ", v18];
    [v3 appendFormat:@"previousAccountIdentifiers: '%@'; ", self->_previousAccountIdentifiers];
    if (self->_coOwner) {
      uint64_t v19 = @"YES";
    }
    else {
      uint64_t v19 = @"NO";
    }
    [v3 appendFormat:@"coOwner: '%@'; ", v19];
  }
  [v3 appendFormat:@"cloudStoreZoneNames: '%@'; ", self->_cloudStoreZoneNames];
  v20 = [(NSDate *)self->_lastUpdated description];
  [v3 appendFormat:@"last update: '%@'; ", v20];

  uint64_t v21 = [(PKAccountAdditionalPushTopics *)self->_additionalPushTopics description];
  [v3 appendFormat:@"additional push topics: '%@'; ", v21];

  v22 = [(PKAccountFetchPeriods *)self->_fetchPeriods description];
  [v3 appendFormat:@"fetch periods: '%@'; ", v22];

  [v3 appendFormat:@"source identifier: '%@'; ", self->_transactionSourceIdentifier];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [+[PKAccount allocWithZone:](PKAccount, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSURL *)self->_accountBaseURL copyWithZone:a3];
  accountBaseURL = v5->_accountBaseURL;
  v5->_accountBaseURL = (NSURL *)v8;

  uint64_t v10 = [(NSURL *)self->_applyServiceURL copyWithZone:a3];
  applyServiceURL = v5->_applyServiceURL;
  v5->_applyServiceURL = (NSURL *)v10;

  uint64_t v12 = [(NSURL *)self->_paymentServicesBaseURL copyWithZone:a3];
  paymentServicesBaseURL = v5->_paymentServicesBaseURL;
  v5->_paymentServicesBaseURL = (NSURL *)v12;

  v5->_feature = self->_feature;
  v5->_unint64_t type = self->_type;
  v5->_unint64_t state = self->_state;
  v5->_stateReason = self->_stateReason;
  v5->_unint64_t accessLevel = self->_accessLevel;
  v5->_blockAllAccountAccess = self->_blockAllAccountAccess;
  v5->_blockNotifications = self->_blockNotifications;
  v5->_isCloudAccount = self->_isCloudAccount;
  v5->_coOwner = self->_coOwner;
  uint64_t v14 = [(NSString *)self->_altDSID copyWithZone:a3];
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v14;

  v5->_sharedAccount = self->_sharedAccount;
  uint64_t v16 = [(NSSet *)self->_previousAccountIdentifiers copyWithZone:a3];
  previousAccountIdentifiers = v5->_previousAccountIdentifiers;
  v5->_previousAccountIdentifiers = (NSSet *)v16;

  v18 = [(PKAccountDetails *)self->_details copyWithZone:a3];
  details = v5->_details;
  v5->_details = v18;

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v21 = self->_supportedFeatures;
  uint64_t v22 = [(NSSet *)v21 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v41;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * v25), "copy", (void)v40);
        [v20 addObject:v26];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSSet *)v21 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v23);
  }

  uint64_t v27 = [MEMORY[0x1E4F1CAD0] setWithSet:v20];
  supportedFeatures = v5->_supportedFeatures;
  v5->_supportedFeatures = (NSSet *)v27;

  v5->_accountStateDirty = self->_accountStateDirty;
  uint64_t v29 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v29;

  v31 = [(PKAccountAdditionalPushTopics *)self->_additionalPushTopics copyWithZone:a3];
  additionalPushTopics = v5->_additionalPushTopics;
  v5->_additionalPushTopics = v31;

  v33 = [(PKAccountFetchPeriods *)self->_fetchPeriods copyWithZone:a3];
  fetchPeriods = v5->_fetchPeriods;
  v5->_fetchPeriods = v33;

  uint64_t v35 = [(NSArray *)self->_cloudStoreZoneNames copyWithZone:a3];
  cloudStoreZoneNames = v5->_cloudStoreZoneNames;
  v5->_cloudStoreZoneNames = (NSArray *)v35;

  uint64_t v37 = [(NSString *)self->_transactionSourceIdentifier copyWithZone:a3];
  transactionSourceIdentifier = v5->_transactionSourceIdentifier;
  v5->_transactionSourceIdentifier = (NSString *)v37;

  return v5;
}

- (BOOL)supportsExtendedFetch
{
  return self->_additionalPushTopics != 0;
}

- (BOOL)isClosedAndChargedOff
{
  return self->_state == 4 && self->_stateReason == 8;
}

- (void)updateWithCloudStoreRecord:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"Account"];
  uint64_t v5 = [v4 firstObject];

  if (v5)
  {
    uint64_t v6 = objc_msgSend(v5, "pk_stringForKey:", @"featureIdentifier");
    uint64_t v7 = PKFeatureIdentifierFromString(v6);

    if (v7 == 4)
    {
      uint64_t v8 = objc_msgSend(v5, "pk_encryptedObjectForKey:ofClass:", @"balanceAmount", objc_opt_class());
      unint64_t v9 = v8;
      uint64_t v10 = (void *)MEMORY[0x1E4F28C28];
      if (v8)
      {
        [v8 decimalValue];
      }
      else
      {
        v14[0] = 0;
        v14[1] = 0;
        int v15 = 0;
      }
      uint64_t v11 = [v10 decimalNumberWithDecimal:v14];
      if (v11)
      {
        uint64_t v12 = [(PKAccount *)self appleBalanceDetails];
        uint64_t v13 = [v12 accountSummary];

        [v13 setCurrentBalance:v11];
      }
    }
  }
}

- (PKAccount)initWithCloudStoreCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAccount;
  uint64_t v5 = [(PKAccount *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(PKAccount *)v5 applyPropertiesFromCloudStoreRecord:v4];
  }

  return v6;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"Account"];
  id v18 = [v4 firstObject];

  if (v18)
  {
    objc_msgSend(v18, "pk_encryptedStringForKey:", @"accountIdentifier");
    uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v5;

    uint64_t v7 = objc_msgSend(v18, "pk_stringForKey:", @"featureIdentifier");
    self->_feature = PKFeatureIdentifierFromString(v7);

    objc_super v8 = objc_msgSend(v18, "pk_stringForKey:", @"accountType");
    self->_unint64_t type = PKAccountTypeFromString(v8);

    unint64_t v9 = [PKAccountDetails alloc];
    if (self->_type - 1 >= 4) {
      unint64_t type = 0;
    }
    else {
      unint64_t type = self->_type;
    }
    uint64_t v11 = [(PKAccountDetails *)v9 initWithCloudRecord:v18 type:type];
    details = self->_details;
    self->_details = v11;

    uint64_t v13 = objc_msgSend(v18, "pk_encryptedStringForKey:", @"state");
    self->_unint64_t state = PKAccountStateFromString(v13);

    *(_OWORD *)&self->_stateReason = xmmword_191656DD0;
    self->_isCloudAccount = 1;
    self->_sharedAccount = 0;
    objc_msgSend(v18, "pk_arrayForKey:", @"cloudStoreZoneNames");
    uint64_t v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cloudStoreZoneNames = self->_cloudStoreZoneNames;
    self->_cloudStoreZoneNames = v14;

    uint64_t v16 = [(PKAccount *)self _featureDescriptorsForFeature:self->_feature inCloudRecord:v18];
    supportedFeatures = self->_supportedFeatures;
    self->_supportedFeatures = v16;
  }
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  uint64_t v6 = [a3 recordsWithRecordType:@"Account"];
  id v16 = [v6 firstObject];

  uint64_t v7 = PKFeatureIdentifierToString(self->_feature);
  [v16 setObject:v7 forKey:@"featureIdentifier"];

  unint64_t type = self->_type;
  if (type > 4) {
    unint64_t v9 = @"unknown";
  }
  else {
    unint64_t v9 = off_1E56DEE40[type];
  }
  [v16 setObject:v9 forKey:@"accountType"];
  cloudStoreZoneNames = self->_cloudStoreZoneNames;
  if (cloudStoreZoneNames)
  {
    uint64_t v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:cloudStoreZoneNames options:0 error:0];
    uint64_t v12 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
    [v16 setObject:v12 forKey:@"cloudStoreZoneNames"];
  }
  uint64_t v13 = [v16 encryptedValues];
  [v13 setObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  unint64_t state = self->_state;
  if (state > 5) {
    int v15 = @"unknown";
  }
  else {
    int v15 = off_1E56DEE68[state];
  }
  [v13 setObject:v15 forKey:@"state"];
  [(PKAccountDetails *)self->_details encodeWithCloudRecord:v16 codingType:a4];
  [(PKAccount *)self _addSupportedFeaturesToEncryptedCloudRecord:v16];
}

- (unint64_t)itemType
{
  return 7;
}

+ (id)recordNamePrefix
{
  return @"account-";
}

- (id)primaryIdentifier
{
  return self->_accountIdentifier;
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"Account";
  id v3 = objc_msgSend((id)objc_opt_class(), "recordNameForAccountIdentifier:", self->_accountIdentifier, @"Account");
  objc_super v8 = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v5;
}

+ (id)recordNameForAccountIdentifier:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [a1 recordNamePrefix];
  objc_super v8 = (void *)[v6 initWithFormat:@"%@%@", v7, v5];

  return v8;
}

+ (id)accountIdentifierFromRecordName:(id)a3
{
  id v4 = a3;
  id v5 = [a1 recordNamePrefix];
  int v6 = [v4 hasPrefix:v5];

  if (v6)
  {
    uint64_t v7 = [a1 recordNamePrefix];
    objc_super v8 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v7, "length"));
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (id)_featureDescriptorsForFeature:(unint64_t)a3 inCloudRecord:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (a3 == 4)
  {
    if (objc_msgSend(v5, "pk_BOOLForKey:", @"ampTopUpSupported"))
    {
      uint64_t v7 = [[PKAppleBalanceAccountFeatureDescriptor alloc] initWithIdentifier:@"ampTopUpSupported"];
      [v6 addObject:v7];
    }
    if (objc_msgSend(v5, "pk_BOOLForKey:", @"ampRedemptionSupported"))
    {
      objc_super v8 = [[PKAppleBalanceAccountFeatureDescriptor alloc] initWithIdentifier:@"ampRedemptionSupported"];
      [v6 addObject:v8];
    }
  }

  return v6;
}

- (void)_addSupportedFeaturesToEncryptedCloudRecord:(id)a3
{
  if (self->_feature == 4)
  {
    id v4 = NSNumber;
    id v5 = a3;
    id v6 = objc_msgSend(v4, "numberWithBool:", -[PKAccount supportsAMPTopUp](self, "supportsAMPTopUp"));
    [v5 setObject:v6 forKey:@"ampTopUpSupported"];

    objc_msgSend(NSNumber, "numberWithBool:", -[PKAccount supportsAMPRedeemGiftcard](self, "supportsAMPRedeemGiftcard"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v7 forKey:@"ampRedemptionSupported"];
  }
}

- (id)_featureWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(PKAccount *)self supportedFeatures];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_insertSupportedFeature:(id)a3
{
  id v8 = a3;
  id v4 = [v8 identifier];
  id v5 = [(PKAccount *)self _featureWithIdentifier:v4];

  if (!v5)
  {
    id v6 = [(NSSet *)self->_supportedFeatures setByAddingObject:v8];
    supportedFeatures = self->_supportedFeatures;
    self->_supportedFeatures = v6;
  }
}

- (void)_removeSupportedFeatureWithIdentifier:(id)a3
{
  id v4 = [(PKAccount *)self _featureWithIdentifier:a3];
  if (v4)
  {
    uint64_t v7 = v4;
    id v5 = [(NSSet *)self->_supportedFeatures pk_setByRemovingObject:v4];
    supportedFeatures = self->_supportedFeatures;
    self->_supportedFeatures = v5;

    id v4 = v7;
  }
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSURL)accountBaseURL
{
  return self->_accountBaseURL;
}

- (void)setAccountBaseURL:(id)a3
{
}

- (NSURL)paymentServicesBaseURL
{
  return self->_paymentServicesBaseURL;
}

- (void)setPaymentServicesBaseURL:(id)a3
{
}

- (NSURL)applyServiceURL
{
  return self->_applyServiceURL;
}

- (void)setApplyServiceURL:(id)a3
{
}

- (unint64_t)feature
{
  return self->_feature;
}

- (void)setFeature:(unint64_t)a3
{
  self->_feature = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (PKAccountDetails)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (unint64_t)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(unint64_t)a3
{
  self->_stateReason = a3;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(unint64_t)a3
{
  self->_unint64_t accessLevel = a3;
}

- (BOOL)blockNotifications
{
  return self->_blockNotifications;
}

- (void)setBlockNotifications:(BOOL)a3
{
  self->_blockNotifications = a3;
}

- (BOOL)blockAllAccountAccess
{
  return self->_blockAllAccountAccess;
}

- (void)setBlockAllAccountAccess:(BOOL)a3
{
  self->_blockAllAccountAccess = a3;
}

- (BOOL)isCloudAccount
{
  return self->_isCloudAccount;
}

- (void)setIsCloudAccount:(BOOL)a3
{
  self->_isCloudAccount = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (BOOL)isCoOwner
{
  return self->_coOwner;
}

- (void)setCoOwner:(BOOL)a3
{
  self->_coOwner = a3;
}

- (BOOL)isSharedAccount
{
  return self->_sharedAccount;
}

- (void)setSharedAccount:(BOOL)a3
{
  self->_sharedAccount = a3;
}

- (NSSet)previousAccountIdentifiers
{
  return self->_previousAccountIdentifiers;
}

- (void)setPreviousAccountIdentifiers:(id)a3
{
}

- (NSSet)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void)setSupportedFeatures:(id)a3
{
}

- (PKAccountAdditionalPushTopics)additionalPushTopics
{
  return self->_additionalPushTopics;
}

- (void)setAdditionalPushTopics:(id)a3
{
}

- (PKAccountFetchPeriods)fetchPeriods
{
  return self->_fetchPeriods;
}

- (void)setFetchPeriods:(id)a3
{
}

- (BOOL)accountStateDirty
{
  return self->_accountStateDirty;
}

- (void)setAccountStateDirty:(BOOL)a3
{
  self->_accountStateDirty = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (void)setCloudStoreZoneNames:(id)a3
{
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudStoreZoneNames, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_fetchPeriods, 0);
  objc_storeStrong((id *)&self->_additionalPushTopics, 0);
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
  objc_storeStrong((id *)&self->_previousAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_applyServiceURL, 0);
  objc_storeStrong((id *)&self->_paymentServicesBaseURL, 0);
  objc_storeStrong((id *)&self->_accountBaseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (BOOL)supportsSchedulePayment
{
  v2 = [(PKAccount *)self schedulePaymentFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)schedulePaymentFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"schedulePayment"];
}

- (BOOL)supportsScheduleRecurringPayments
{
  v2 = [(PKAccount *)self scheduleRecurringPaymentsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)scheduleRecurringPaymentsFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"scheduleRecurringPayments"];
}

- (BOOL)supportsViewStatement
{
  v2 = [(PKAccount *)self viewStatementFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)viewStatementFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"viewStatement"];
}

- (BOOL)supportsRequestStatement
{
  v2 = [(PKAccount *)self requestStatementFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)requestStatementFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"requestStatement"];
}

- (BOOL)supportsExportTransactionData
{
  v2 = [(PKAccount *)self exportTransactionDataFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)exportTransactionDataFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"exportTransactionData"];
}

- (BOOL)supportsRequestPhysicalCard
{
  v2 = [(PKAccount *)self requestPhysicalCardFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)requestPhysicalCardFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"requestPhysicalCard"];
}

- (BOOL)supportsRedeemRewards
{
  v2 = [(PKAccount *)self redeemRewardsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)redeemRewardsFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"redeemRewards"];
}

- (BOOL)supportsShowNotifications
{
  v2 = [(PKAccount *)self showNotificationsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showNotificationsFeatureDescriptor
{
  return [(PKAccount *)self _featureWithIdentifier:@"showNotifications"];
}

- (BOOL)supportsTransactionSyncReporting
{
  v2 = [(PKAccount *)self transactionSyncReportingFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)transactionSyncReportingFeatureDescriptor
{
  return [(PKAccount *)self _featureWithIdentifier:@"supportsTransactionSyncReporting"];
}

- (BOOL)supportsStatementMetadata
{
  v2 = [(PKAccount *)self statementMetadataFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)statementMetadataFeatureDescriptor
{
  return [(PKAccount *)self _featureWithIdentifier:@"supportsStatementMetadata"];
}

- (BOOL)supportsShowAccountSummary
{
  v2 = [(PKAccount *)self showAccountSummaryFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showAccountSummaryFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"showAccountSummary"];
}

- (BOOL)supportsAddFundingSource
{
  v2 = [(PKAccount *)self addFundingSourceFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)addFundingSourceFeatureDescriptor
{
  return [(PKAccount *)self _featureWithIdentifier:@"addFundingSource"];
}

- (BOOL)supportsShowVirtualCard
{
  v2 = [(PKAccount *)self showVirtualCardFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showVirtualCardFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"showVirtualCard"];
}

- (BOOL)supportsDynamicSecurityCodes
{
  v2 = [(PKAccount *)self dynamicSecurityCodesFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)dynamicSecurityCodesFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"dynamicSecurityCodes"];
}

- (BOOL)provisioningAllowed
{
  v2 = [(PKAccount *)self provisioningAllowedFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)provisioningAllowedFeatureDescriptor
{
  return [(PKAccount *)self _featureWithIdentifier:@"provisioningAllowed"];
}

- (BOOL)accountUserInvitationAllowed
{
  v2 = [(PKAccount *)self accountUserInvitationAllowedFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)accountUserInvitationAllowedFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"accountUserInvitationAllowed"];
}

- (BOOL)showPhysicalCardExpiringSoonMessaging
{
  v2 = [(PKAccount *)self showPhysicalCardExpiringSoonMessagingDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showPhysicalCardExpiringSoonMessagingDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"showPhysicalCardExpiringSoonMessaging"];
}

- (BOOL)supportsPhysicalCardActivation
{
  v2 = [(PKAccount *)self physicalCardActivationFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)physicalCardActivationFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"physicalCardActivation"];
}

- (BOOL)showBillPaymentInterest
{
  v2 = [(PKAccount *)self showBillPaymentInterestFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showBillPaymentInterestFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"showBillPaymentInterest"];
}

- (BOOL)showBillPaymentInterestSummary
{
  v2 = [(PKAccount *)self showBillPaymentInterestSummaryFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showBillPaymentInterestSummaryFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"showBillPaymentInterestSummary"];
}

- (BOOL)hideInterestChargeClarity
{
  v2 = [(PKAccount *)self hideInterestChargeClarityFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)hideInterestChargeClarityFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"hideInterestChargeClarity"];
}

- (BOOL)hideBillPaymentHoldTime
{
  v2 = [(PKAccount *)self hideBillPaymentHoldTimeFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)hideBillPaymentHoldTimeFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"hideBillPaymentHoldTime"];
}

- (BOOL)hideEnhancedDisputeDetails
{
  v2 = [(PKAccount *)self hideEnhancedDisputeDetailsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)hideEnhancedDisputeDetailsFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"hideEnhancedDisputeDetails"];
}

- (BOOL)hideDisputeDetails
{
  v2 = [(PKAccount *)self hideDisputeDetailsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)hideDisputeDetailsFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"hideDisputeDetails"];
}

- (BOOL)hideSpendingInsights
{
  v2 = [(PKAccount *)self hideSpendingInsightsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)hideSpendingInsightsFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"hideSpendingInsights"];
}

- (BOOL)showRewardsGraph
{
  v2 = [(PKAccount *)self showRewardsGraphFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showRewardsGraphFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"showRewardsGraph"];
}

- (BOOL)showPaymentSheetRewards
{
  v2 = [(PKAccount *)self showPaymentSheetRewardsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showPaymentSheetRewardsFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"showPaymentSheetRewards"];
}

- (BOOL)showCardPromotions
{
  v2 = [(PKAccount *)self showCardPromotionsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showCardPromotionsFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"showCardOffers"];
}

- (BOOL)showEnhancedMerchants
{
  v2 = [(PKAccount *)self showEnhancedMerchantsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showEnhancedMerchantsFeatureDescriptor
{
  return [(PKAccount *)self _creditFeatureWithIdentifier:@"showEnhancedMerchants"];
}

- (id)_creditFeatureWithIdentifier:(id)a3
{
  BOOL v3 = [(PKAccount *)self _featureWithIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)supportsTopUp
{
  if (PKAppleBalanceNativeTopUpEnabled()) {
    return 1;
  }
  id v4 = [(PKAccount *)self supportsTopUpFeatureDescriptor];
  BOOL v3 = v4 != 0;

  return v3;
}

- (id)supportsTopUpFeatureDescriptor
{
  return [(PKAccount *)self _appleBalanceFeatureWithIdentifier:@"directTopUp"];
}

- (BOOL)supportsAMPTopUp
{
  v2 = [(PKAccount *)self supportsAMPTopUpFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)supportsAMPTopUpFeatureDescriptor
{
  return [(PKAccount *)self _appleBalanceFeatureWithIdentifier:@"ampTopUpSupported"];
}

- (BOOL)supportsAMPRedeemGiftcard
{
  v2 = [(PKAccount *)self supportsAMPRedeemGiftcardFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)supportsAMPRedeemGiftcardFeatureDescriptor
{
  return [(PKAccount *)self _appleBalanceFeatureWithIdentifier:@"ampRedemptionSupported"];
}

- (BOOL)supportsInStoreTopUp
{
  v2 = [(PKAccount *)self supportsInStoreTopUpFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)supportsInStoreTopUpFeatureDescriptor
{
  return [(PKAccount *)self _appleBalanceFeatureWithIdentifier:@"inStoreTopUp"];
}

- (BOOL)supportsInStorePayment
{
  v2 = [(PKAccount *)self supportsInStorePaymentFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)supportsInStorePaymentFeatureDescriptor
{
  return [(PKAccount *)self _appleBalanceFeatureWithIdentifier:@"inStorePayment"];
}

- (id)_appleBalanceFeatureWithIdentifier:(id)a3
{
  BOOL v3 = [(PKAccount *)self _featureWithIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)supportsMoneyMovement
{
  if ([(PKAccount *)self supportsOneTimeDeposit]
    || [(PKAccount *)self supportsOneTimeWithdrawal]
    || [(PKAccount *)self supportsOneTimeDepositWithAppleCash])
  {
    return 1;
  }
  return [(PKAccount *)self supportsOneTimeWithdrawalWithAppleCash];
}

- (BOOL)supportsOneTimeDeposit
{
  v2 = [(PKAccount *)self oneTimeDepositFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)oneTimeDepositFeatureDescriptor
{
  return [(PKAccount *)self _savingsFeatureWithIdentifier:@"scheduleOneTimeDeposit"];
}

- (BOOL)supportsOneTimeWithdrawal
{
  v2 = [(PKAccount *)self oneTimeWithdrawalFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)oneTimeWithdrawalFeatureDescriptor
{
  return [(PKAccount *)self _savingsFeatureWithIdentifier:@"scheduleOneTimeWithdrawal"];
}

- (unint64_t)oneTimeDepositFundingSourceTypes
{
  BOOL v3 = [(PKAccount *)self oneTimeDepositFeatureDescriptor];
  uint64_t v4 = [v3 fundingSourceTypes];

  id v5 = [(PKAccount *)self oneTimeDepositWithAppleCashFeatureDescriptor];
  unint64_t v6 = [v5 fundingSourceTypes] | v4 & 0xFFFFFFFFFFFFFFFDLL;

  return v6;
}

- (unint64_t)oneTimeWithdrawalFundingSourceTypes
{
  BOOL v3 = [(PKAccount *)self oneTimeWithdrawalFeatureDescriptor];
  uint64_t v4 = [v3 fundingSourceTypes];

  id v5 = [(PKAccount *)self oneTimeWithdrawalWithAppleCashFeatureDescriptor];
  unint64_t v6 = [v5 fundingSourceTypes] | v4 & 0xFFFFFFFFFFFFFFFDLL;

  return v6;
}

- (BOOL)supportsOneTimeDepositWithAppleCash
{
  v2 = [(PKAccount *)self oneTimeDepositWithAppleCashFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)oneTimeDepositWithAppleCashFeatureDescriptor
{
  return [(PKAccount *)self _savingsFeatureWithIdentifier:@"scheduleOneTimeDepositWithAppleCash"];
}

- (BOOL)supportsOneTimeWithdrawalWithAppleCash
{
  v2 = [(PKAccount *)self oneTimeWithdrawalWithAppleCashFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)oneTimeWithdrawalWithAppleCashFeatureDescriptor
{
  return [(PKAccount *)self _savingsFeatureWithIdentifier:@"scheduleOneTimeWithdrawalWithAppleCash"];
}

- (BOOL)supportsViewSavingsStatement
{
  v2 = [(PKAccount *)self viewSavingsStatementFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)viewSavingsStatementFeatureDescriptor
{
  return [(PKAccount *)self _savingsFeatureWithIdentifier:@"viewStatement"];
}

- (BOOL)supportsExportSavingsTransactionData
{
  v2 = [(PKAccount *)self exportSavingsTransactionDataFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)exportSavingsTransactionDataFeatureDescriptor
{
  return [(PKAccount *)self _savingsFeatureWithIdentifier:@"exportTransactionData"];
}

- (BOOL)supportsShowSavingsAccountSummary
{
  v2 = [(PKAccount *)self showSavingsAccountSummaryFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showSavingsAccountSummaryFeatureDescriptor
{
  return [(PKAccount *)self _savingsFeatureWithIdentifier:@"showAccountSummary"];
}

- (BOOL)supportsAddBeneficiaries
{
  v2 = [(PKAccount *)self addBeneficiariesFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)addBeneficiariesFeatureDescriptor
{
  return [(PKAccount *)self _savingsFeatureWithIdentifier:@"addBeneficiaries"];
}

- (unint64_t)supportedContactMethodForAddingBeneficiaries
{
  v2 = [(PKAccount *)self addBeneficiariesFeatureDescriptor];
  unint64_t v3 = [v2 contactMethod];
  if (v3 <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = v3;
  }

  return v4;
}

- (id)FDICBehaviorsFeatureDescriptor
{
  return [(PKAccount *)self _savingsFeatureWithIdentifier:@"FDICBehaviors"];
}

- (BOOL)FDICBehaviorShowCreditRewardsHubBalance
{
  v2 = [(PKAccount *)self FDICBehaviorsFeatureDescriptor];
  char v3 = [v2 showCreditRewardsHubBalance];

  return v3;
}

- (BOOL)FDICBehaviorShowCreditDashboardBalance
{
  v2 = [(PKAccount *)self FDICBehaviorsFeatureDescriptor];
  char v3 = [v2 showCreditDashboardBalance];

  return v3;
}

- (BOOL)FDICBehaviorShowSettingsBalance
{
  v2 = [(PKAccount *)self FDICBehaviorsFeatureDescriptor];
  char v3 = [v2 showSettingsBalance];

  return v3;
}

- (BOOL)FDICBehaviorHideCreditRewardsHubSignage
{
  v2 = [(PKAccount *)self FDICBehaviorsFeatureDescriptor];
  char v3 = [v2 hideCreditRewardsHubSignage];

  return v3;
}

- (BOOL)supportsViewTaxDocuments
{
  v2 = [(PKAccount *)self viewTaxDocumentsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)viewTaxDocumentsFeatureDescriptor
{
  return [(PKAccount *)self _savingsFeatureWithIdentifier:@"viewTaxForms"];
}

- (id)_savingsFeatureWithIdentifier:(id)a3
{
  BOOL v3 = [(PKAccount *)self _featureWithIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)hidePayLaterInPaymentSheet
{
  v2 = [(PKAccount *)self hidePayLaterInPaymentSheetFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)hidePayLaterInPaymentSheetFeatureDescriptor
{
  return [(PKAccount *)self _payLaterFeatureWithIdentifier:@"hidePayLaterInPaymentSheet"];
}

- (BOOL)hidePayLaterSetupInWallet
{
  v2 = [(PKAccount *)self hidePayLaterSetupInWalletFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)hidePayLaterSetupInWalletFeatureDescriptor
{
  return [(PKAccount *)self _payLaterFeatureWithIdentifier:@"hidePayLaterSetupInWallet"];
}

- (BOOL)supportsDynamicReportIssueTopics
{
  v2 = [(PKAccount *)self supportsDynamicReportIssueTopicsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)supportsDynamicReportIssueTopicsFeatureDescriptor
{
  return [(PKAccount *)self _payLaterFeatureWithIdentifier:@"supportsDynamicReportIssueTopics"];
}

- (id)_payLaterFeatureWithIdentifier:(id)a3
{
  BOOL v3 = [(PKAccount *)self _featureWithIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

@end