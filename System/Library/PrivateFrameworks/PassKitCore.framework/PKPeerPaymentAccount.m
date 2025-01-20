@interface PKPeerPaymentAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)areAssociatedAccountsOutOfDate;
- (BOOL)areRecurringPaymentsOutOfDate;
- (BOOL)hasDisplayedAssociatedAccountActiveNotification;
- (BOOL)hasRecurringPayments;
- (BOOL)identityVerificationForDisbursementsRequired;
- (BOOL)identityVerificationRequired;
- (BOOL)isAccountOutOfDate;
- (BOOL)isAccountStateDirty;
- (BOOL)isEligibleForRecurringPaymentsForUser:(id)a3;
- (BOOL)isEligibleForThresholdTopUpForUser:(id)a3;
- (BOOL)isEligibleToAddMoneyForUser:(id)a3;
- (BOOL)isEligibleToWithdrawForUser:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPariticipantAccountEmbargoRecovery;
- (BOOL)isPariticipantAccountSecurityDowngraded;
- (BOOL)isParticipantAccountLockedByOwner;
- (BOOL)supportsAssociatedAccountStateAction;
- (BOOL)supportsCardBalancePromotion;
- (BOOL)supportsDeviceTap;
- (BOOL)supportsFamilySharing;
- (BOOL)supportsGraduationWhileAssociatedAccountLocked;
- (BOOL)supportsInstantWithdrawal;
- (BOOL)supportsLoadFromCard;
- (BOOL)supportsPendingRequestAction;
- (BOOL)supportsPreserveCurrentBalance;
- (BOOL)supportsRecurringPayments;
- (BOOL)supportsRequestFromUser;
- (BOOL)supportsRequestFromWallet;
- (BOOL)supportsSendFromWallet;
- (BOOL)supportsSendToUser;
- (BOOL)supportsThresholdTopUp;
- (BOOL)supportsTransferToBank;
- (BOOL)termsAcceptanceRequired;
- (BOOL)transactionAmountIsValid:(id)a3 feature:(id)a4;
- (BOOL)willTriggerIdentityVerificationForTransactionAmount:(id)a3;
- (NSArray)defaultSuggestions;
- (NSDate)createdDate;
- (NSDate)identifiedDate;
- (NSDate)lastUpdated;
- (NSDecimalNumber)amountRemainingUntilIdentityVerification;
- (NSDecimalNumber)maximumBalance;
- (NSDictionary)maximumTransferAmounts;
- (NSDictionary)minimumTransferAmounts;
- (NSSet)cloudStoreZoneNames;
- (NSSet)supportedFeatureDescriptors;
- (NSString)altDSID;
- (NSString)associatedPassSerialNumber;
- (NSString)associatedPassTypeIdentifier;
- (NSString)countryCode;
- (NSString)identifier;
- (NSString)termsIdentifier;
- (NSString)transactionSourceIdentifier;
- (NSURL)associatedPassURL;
- (NSURL)termsURL;
- (PKCurrencyAmount)currentBalance;
- (PKPeerPaymentAccount)initWithCoder:(id)a3;
- (PKPeerPaymentAccount)initWithDictionary:(id)a3;
- (PKPeerPaymentAccount)initWithDictionary:(id)a3 lastUpdated:(id)a4;
- (PKPeerPaymentAccount)peerPaymentAccountWithAltDSID:(id)a3;
- (PKPeerPaymentAccount)peerPaymentAccountWithIdentifier:(id)a3;
- (PKPeerPaymentAdditionalPushTopics)additionalPushTopics;
- (PKPeerPaymentAssociatedAccountInformation)associatedAccountInformation;
- (PKPeerPaymentEncryptionCertificatesVersions)encryptionCertificatesVersions;
- (PKPeerPaymentPaymentModeIdentifiers)paymentModeIdentifiers;
- (double)accountFetchAfterTransactionWaitPeriod;
- (double)accountFetchAfterTransactionWaitTolerance;
- (double)proactiveFetchPeriod;
- (id)_featureWithIdentifier:(id)a3;
- (id)accountInvitationWithAltDSID:(id)a3;
- (id)associatedAccountStateActionFeatureDescriptor;
- (id)associatedPassUniqueID;
- (id)cardBalancePromotionFeatureDescriptor;
- (id)description;
- (id)deviceTapFeatureDescriptor;
- (id)instantWithdrawalPromotionFeatureDescriptor;
- (id)loadFromCardFeatureDescriptor;
- (id)pendingRequestActionFeatureDescriptor;
- (id)preserveCurrentBalanceFeatureDescriptor;
- (id)recurringPaymentsFeatureDescriptor;
- (id)requestFromUserFeatureDescriptor;
- (id)requestFromWalletFeatureDescriptor;
- (id)sendFromWalletFeatureDescriptor;
- (id)sendToUserFeatureDescriptor;
- (id)supportsFamilySharingFeatureDescriptor;
- (id)supportsGraduationWhileAssociatedAccountLockedFeatureDescriptor;
- (id)thresholdTopUpFeatureDescriptor;
- (id)transferToBankFeatureDescriptor;
- (int64_t)pendingPaymentCount;
- (unint64_t)deviceScoreEncryptedPayloadVersion;
- (unint64_t)hash;
- (unint64_t)receiveRestrictionType;
- (unint64_t)role;
- (unint64_t)sendRestrictionType;
- (unint64_t)stage;
- (unint64_t)state;
- (unint64_t)stateReason;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountFetchAfterTransactionWaitPeriod:(double)a3;
- (void)setAccountFetchAfterTransactionWaitTolerance:(double)a3;
- (void)setAccountStateDirty:(BOOL)a3;
- (void)setAdditionalPushTopics:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAmountRemainingUntilIdentityVerification:(id)a3;
- (void)setAssociatedAccountInformation:(id)a3;
- (void)setAssociatedPassSerialNumber:(id)a3;
- (void)setAssociatedPassTypeIdentifier:(id)a3;
- (void)setAssociatedPassURL:(id)a3;
- (void)setCloudStoreZoneNames:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setDeviceScoreEncryptedPayloadVersion:(unint64_t)a3;
- (void)setEncryptionCertificatesVersions:(id)a3;
- (void)setHasDisplayedAssociatedAccountActiveNotification:(BOOL)a3;
- (void)setHasRecurringPayments:(BOOL)a3;
- (void)setIdentifiedDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentityVerificationForDisbursementsRequired:(BOOL)a3;
- (void)setIdentityVerificationRequired:(BOOL)a3;
- (void)setLastUpdated:(id)a3;
- (void)setMaximumBalance:(id)a3;
- (void)setPaymentModeIdentifiers:(id)a3;
- (void)setPendingPaymentCount:(int64_t)a3;
- (void)setProactiveFetchPeriod:(double)a3;
- (void)setReceiveRestrictionType:(unint64_t)a3;
- (void)setRole:(unint64_t)a3;
- (void)setSendRestrictionType:(unint64_t)a3;
- (void)setStage:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateReason:(unint64_t)a3;
- (void)setSupportedFeatureDescriptors:(id)a3;
- (void)setTermsAcceptanceRequired:(BOOL)a3;
- (void)setTermsIdentifier:(id)a3;
- (void)setTermsURL:(id)a3;
- (void)setTransactionSourceIdentifier:(id)a3;
@end

@implementation PKPeerPaymentAccount

- (PKPeerPaymentAccount)initWithDictionary:(id)a3 lastUpdated:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v86.receiver = self;
  v86.super_class = (Class)PKPeerPaymentAccount;
  v8 = [(PKPeerPaymentAccount *)&v86 init];
  if (!v8) {
    goto LABEL_34;
  }
  v9 = [v6 PKStringForKey:@"state"];
  v8->_state = PKPeerPaymentAccountStateFromString(v9);

  v10 = [v6 PKStringForKey:@"stage"];
  v8->_stage = PKPeerPaymentAccountStageFromString(v10);

  v11 = [v6 PKStringForKey:@"stateReason"];
  v8->_stateReason = PKPeerPaymentAccountStateReasonFromString(v11);

  v12 = [v6 PKStringForKey:@"personToPersonRestrictionType"];
  v8->_sendRestrictionType = PKPeerPaymentAccountSendRestrictionTypeFromString(v12);

  v13 = [v6 PKStringForKey:@"receiveRestrictionType"];
  v8->_receiveRestrictionType = PKPeerPaymentAccountReceiveRestrictionTypeFromString(v13);

  uint64_t v14 = [v6 PKStringForKey:@"countryCode"];
  countryCode = v8->_countryCode;
  v8->_countryCode = (NSString *)v14;

  v16 = [v6 PKStringForKey:@"role"];
  v8->_role = PKPeerPaymentAccountRoleFromString(v16);

  uint64_t v17 = [v6 PKStringForKey:@"identifier"];
  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v17;

  uint64_t v19 = [v6 PKDateForKey:@"createdDate"];
  createdDate = v8->_createdDate;
  v8->_createdDate = (NSDate *)v19;

  uint64_t v21 = [v6 PKDateForKey:@"identifiedDate"];
  identifiedDate = v8->_identifiedDate;
  v8->_identifiedDate = (NSDate *)v21;

  uint64_t v23 = [v6 PKDecimalNumberFromStringForKey:@"currentBalance"];
  uint64_t v24 = [v6 PKStringForKey:@"currency"];
  v79 = (void *)v24;
  v80 = (void *)v23;
  if (v23 && v24)
  {
    v25 = [[PKCurrencyAmount alloc] initWithAmount:v23 currency:v24 exponent:0];
    currentBalance = v8->_currentBalance;
    v8->_currentBalance = v25;
  }
  else
  {
    currentBalance = v8->_currentBalance;
    v8->_currentBalance = 0;
  }

  uint64_t v27 = [v6 PKDecimalNumberFromStringForKey:@"maximumBalance"];
  maximumBalance = v8->_maximumBalance;
  v8->_maximumBalance = (NSDecimalNumber *)v27;

  v29 = v8->_maximumBalance;
  v30 = [MEMORY[0x1E4F28C28] zero];
  if ([(NSDecimalNumber *)v29 compare:v30] == NSOrderedSame)
  {

LABEL_10:
    v34 = v8->_maximumBalance;
    v8->_maximumBalance = 0;

    goto LABEL_11;
  }
  v31 = v8->_maximumBalance;
  v32 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v33 = [(NSDecimalNumber *)v31 compare:v32];

  if (v33 == -1) {
    goto LABEL_10;
  }
LABEL_11:
  id v81 = v7;
  v8->_identityVerificationRequired = [v6 PKBoolForKey:@"identityVerificationRequired"];
  v35 = [v6 PKDecimalNumberFromStringForKey:@"amountRemainingUntilIdentityVerification"];
  v36 = v35;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    v37 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"500"];
  }
  amountRemainingUntilIdentityVerification = v8->_amountRemainingUntilIdentityVerification;
  v8->_amountRemainingUntilIdentityVerification = v37;

  objc_storeStrong((id *)&v8->_lastUpdated, a4);
  [v6 PKDoubleForKey:@"proactiveFetchPeriod"];
  v8->_proactiveFetchPeriod = v39;
  [v6 PKDoubleForKey:@"accountFetchAfterTransactionWaitPeriod"];
  v8->_accountFetchAfterTransactionWaitPeriod = v40;
  [v6 PKDoubleForKey:@"accountFetchAfterTransactionWaitTolerance"];
  v8->_accountFetchAfterTransactionWaitTolerance = v41;
  v8->_termsAcceptanceRequired = [v6 PKBoolForKey:@"termsAcceptanceRequired"];
  uint64_t v42 = [v6 PKStringForKey:@"termsIdentifier"];
  termsIdentifier = v8->_termsIdentifier;
  v8->_termsIdentifier = (NSString *)v42;

  uint64_t v44 = [v6 PKURLForKey:@"termsURL"];
  termsURL = v8->_termsURL;
  v8->_termsURL = (NSURL *)v44;

  uint64_t v46 = [v6 PKURLForKey:@"associatedPassURL"];
  associatedPassURL = v8->_associatedPassURL;
  v8->_associatedPassURL = (NSURL *)v46;

  uint64_t v48 = [v6 PKStringForKey:@"associatedPassSerialNumber"];
  associatedPassSerialNumber = v8->_associatedPassSerialNumber;
  v8->_associatedPassSerialNumber = (NSString *)v48;

  uint64_t v50 = [v6 PKStringForKey:@"associatedPassTypeIdentifier"];
  associatedPassTypeIdentifier = v8->_associatedPassTypeIdentifier;
  v8->_associatedPassTypeIdentifier = (NSString *)v50;

  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v53 = [v6 PKArrayContaining:objc_opt_class() forKey:@"supportedFeatures"];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v82 objects:v87 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v83 != v56) {
          objc_enumerationMutation(v53);
        }
        v58 = [[PKPeerPaymentAccountFeatureDescriptor alloc] initWithDictionary:*(void *)(*((void *)&v82 + 1) + 8 * i)];
        if (v58) {
          [v52 addObject:v58];
        }
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v82 objects:v87 count:16];
    }
    while (v55);
  }

  uint64_t v59 = [v52 copy];
  supportedFeatureDescriptors = v8->_supportedFeatureDescriptors;
  v8->_supportedFeatureDescriptors = (NSSet *)v59;

  id v7 = v81;
  v61 = [[PKPeerPaymentAssociatedAccountInformation alloc] initWithDictionary:v6 lastUpdated:v81];
  associatedAccountInformation = v8->_associatedAccountInformation;
  v8->_associatedAccountInformation = v61;

  v8->_pendingPaymentCount = [v6 PKIntegerForKey:@"pendingPaymentCount"];
  v8->_identityVerificationForDisbursementsRequired = [v6 PKBoolForKey:@"identityVerificationForDisbursementsRequired"];
  uint64_t v63 = [v6 PKStringForKey:@"altDSID"];
  altDSID = v8->_altDSID;
  v8->_altDSID = (NSString *)v63;

  uint64_t v65 = [v6 PKSetContaining:objc_opt_class() forKey:@"cloudStoreZoneNames"];
  cloudStoreZoneNames = v8->_cloudStoreZoneNames;
  v8->_cloudStoreZoneNames = (NSSet *)v65;

  v67 = [v6 PKDictionaryForKey:@"additionalPushTopics"];
  if (v67)
  {
    v68 = [[PKPeerPaymentAdditionalPushTopics alloc] initWithDictionary:v67];
    additionalPushTopics = v8->_additionalPushTopics;
    v8->_additionalPushTopics = v68;
  }
  uint64_t v70 = [v6 PKIntegerForKey:@"deviceScoreEncryptedPayloadVersion"];
  uint64_t v71 = 1;
  if (v70 != 1) {
    uint64_t v71 = 2;
  }
  if (!v70) {
    uint64_t v71 = 0;
  }
  v8->_deviceScoreEncryptedPayloadVersion = v71;
  v8->_hasRecurringPayments = [v6 PKBoolForKey:@"hasRecurringPayments"];
  v72 = [v6 PKDictionaryForKey:@"paymentModeIdentifiers"];
  if (v72)
  {
    v73 = [[PKPeerPaymentPaymentModeIdentifiers alloc] initWithDictionary:v72];
    paymentModeIdentifiers = v8->_paymentModeIdentifiers;
    v8->_paymentModeIdentifiers = v73;
  }
  v75 = [v6 PKDictionaryForKey:@"encryptionCertificatesVersions"];
  if (v75)
  {
    v76 = [[PKPeerPaymentEncryptionCertificatesVersions alloc] initWithDictionary:v75];
    encryptionCertificatesVersions = v8->_encryptionCertificatesVersions;
    v8->_encryptionCertificatesVersions = v76;
  }
LABEL_34:

  return v8;
}

- (NSArray)defaultSuggestions
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"10"];
  v3 = objc_msgSend(MEMORY[0x1E4F28C28], "decimalNumberWithString:", @"20", v2);
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"50"];
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return (NSArray *)v5;
}

- (NSString)associatedPassTypeIdentifier
{
  if ((PKUseMockSURFServer() & 1) != 0 || PKStoreDemoModeEnabled())
  {
    PKMockPeerPaymentPassPassTypeID();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_associatedPassTypeIdentifier;
  }
  return v3;
}

- (NSString)associatedPassSerialNumber
{
  if ((PKUseMockSURFServer() & 1) != 0 || PKStoreDemoModeEnabled())
  {
    PKMockPeerPaymentPassSerialNumber();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_associatedPassSerialNumber;
  }
  return v3;
}

- (id)associatedPassUniqueID
{
  v3 = [(PKPeerPaymentAccount *)self associatedPassTypeIdentifier];
  v4 = [(PKPeerPaymentAccount *)self associatedPassSerialNumber];
  v5 = PKGeneratePassUniqueID(v3, v4);

  return v5;
}

- (PKPeerPaymentAccount)peerPaymentAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self->_identifier;
  id v6 = (NSString *)v4;
  id v7 = v6;
  if (v5 == v6)
  {

    goto LABEL_7;
  }
  if (v6 && v5)
  {
    BOOL v8 = [(NSString *)v5 isEqualToString:v6];

    if (!v8) {
      goto LABEL_9;
    }
LABEL_7:
    v9 = self;
    goto LABEL_10;
  }

LABEL_9:
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__37;
  uint64_t v19 = __Block_byref_object_dispose__37;
  id v20 = 0;
  associatedAccountInformation = self->_associatedAccountInformation;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PKPeerPaymentAccount_peerPaymentAccountWithIdentifier___block_invoke;
  v12[3] = &unk_1E56E9568;
  v13 = v7;
  uint64_t v14 = &v15;
  [(PKPeerPaymentAssociatedAccountInformation *)associatedAccountInformation enumerateAssociatedAccountsUsingBlock:v12];
  v9 = (PKPeerPaymentAccount *)(id)v16[5];

  _Block_object_dispose(&v15, 8);
LABEL_10:

  return v9;
}

void __57__PKPeerPaymentAccount_peerPaymentAccountWithIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v12 = a2;
  id v6 = [v12 identifier];
  id v7 = *(void **)(a1 + 32);
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_9;
  }
  int v11 = [v8 isEqualToString:v9];

  if (v11)
  {
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
LABEL_9:
}

- (PKPeerPaymentAccount)peerPaymentAccountWithAltDSID:(id)a3
{
  id v4 = a3;
  v5 = self->_altDSID;
  id v6 = (NSString *)v4;
  id v7 = v6;
  if (v5 == v6)
  {

    goto LABEL_7;
  }
  if (v6 && v5)
  {
    BOOL v8 = [(NSString *)v5 isEqualToString:v6];

    if (!v8) {
      goto LABEL_9;
    }
LABEL_7:
    id v9 = self;
    goto LABEL_10;
  }

LABEL_9:
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__37;
  uint64_t v19 = __Block_byref_object_dispose__37;
  id v20 = 0;
  associatedAccountInformation = self->_associatedAccountInformation;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__PKPeerPaymentAccount_peerPaymentAccountWithAltDSID___block_invoke;
  v12[3] = &unk_1E56E9568;
  v13 = v7;
  uint64_t v14 = &v15;
  [(PKPeerPaymentAssociatedAccountInformation *)associatedAccountInformation enumerateAssociatedAccountsUsingBlock:v12];
  id v9 = (PKPeerPaymentAccount *)(id)v16[5];

  _Block_object_dispose(&v15, 8);
LABEL_10:

  return v9;
}

void __54__PKPeerPaymentAccount_peerPaymentAccountWithAltDSID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v12 = a2;
  id v6 = [v12 altDSID];
  id v7 = *(void **)(a1 + 32);
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_9;
  }
  int v11 = [v8 isEqualToString:v9];

  if (v11)
  {
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
LABEL_9:
}

- (id)accountInvitationWithAltDSID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__37;
    v16 = __Block_byref_object_dispose__37;
    id v17 = 0;
    associatedAccountInformation = self->_associatedAccountInformation;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__PKPeerPaymentAccount_accountInvitationWithAltDSID___block_invoke;
    v9[3] = &unk_1E56E9590;
    id v10 = v4;
    int v11 = &v12;
    [(PKPeerPaymentAssociatedAccountInformation *)associatedAccountInformation enumerateAccountInvitationsUsingBlock:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __53__PKPeerPaymentAccount_accountInvitationWithAltDSID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v14 = v6;
  id v8 = [v6 altDSID];
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

LABEL_10:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
    goto LABEL_11;
  }
  int v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {

    goto LABEL_11;
  }
  int v13 = [v9 isEqualToString:v10];

  if (v13) {
    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)isAccountOutOfDate
{
  if (!self->_lastUpdated) {
    return 1;
  }
  if (self->_proactiveFetchPeriod <= 0.0) {
    double proactiveFetchPeriod = *(double *)&PKPeerPaymentAccountDefaultProactiveFetchPeriod;
  }
  else {
    double proactiveFetchPeriod = self->_proactiveFetchPeriod;
  }
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:self->_lastUpdated];
  BOOL v6 = v5 >= proactiveFetchPeriod;

  return v6;
}

- (BOOL)areAssociatedAccountsOutOfDate
{
  if (![(PKPeerPaymentAccount *)self supportsFamilySharing]) {
    return 0;
  }
  [(PKPeerPaymentAssociatedAccountInformation *)self->_associatedAccountInformation proactiveAssociatedAccountFetchPeriod];
  double v4 = v3;
  double v5 = [(PKPeerPaymentAssociatedAccountInformation *)self->_associatedAccountInformation lastUpdated];
  if (v5)
  {
    if (v4 <= 0.0) {
      double v4 = *(double *)&PKPeerPaymentAssociatedAccountDefaultProactiveFetchPeriod;
    }
    BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:v5];
    BOOL v8 = v7 >= v4;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)areRecurringPaymentsOutOfDate
{
  if (![(PKPeerPaymentAccount *)self supportsRecurringPayments]) {
    return 0;
  }
  double v3 = [(PKPeerPaymentAccount *)self recurringPaymentsFeatureDescriptor];
  [v3 proactiveFetchPeriod];
  double v5 = v4;

  BOOL v6 = PKPeerPaymentRecurringPaymentsLastUpdated();
  if (v6)
  {
    if (v5 <= 0.0) {
      double v5 = *(double *)&PKPeerPaymentRecurringPaymentsDefaultProactiveFetchPeriod;
    }
    double v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:v6];
    BOOL v9 = v8 >= v5;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)isParticipantAccountLockedByOwner
{
  return self->_role == 1 && self->_state == 3 && self->_stateReason - 1 < 3;
}

- (BOOL)isPariticipantAccountSecurityDowngraded
{
  return self->_role == 1 && self->_state == 3 && self->_stateReason == 2;
}

- (BOOL)isPariticipantAccountEmbargoRecovery
{
  return self->_role == 1 && self->_state == 3 && self->_stateReason == 3;
}

- (BOOL)isEligibleToAddMoneyForUser:(id)a3
{
  BOOL v4 = 0;
  if (a3 && self->_role == 1) {
    BOOL v4 = [a3 memberType] == 2;
  }
  BOOL v5 = !v4;
  return self->_state == 1 && v5;
}

- (BOOL)isEligibleToWithdrawForUser:(id)a3
{
  return self->_state - 1 < 2;
}

- (BOOL)isEligibleForRecurringPaymentsForUser:(id)a3
{
  BOOL v4 = 0;
  if (a3 && self->_role == 1) {
    BOOL v4 = [a3 memberType] == 2;
  }
  BOOL v5 = !v4;
  return self->_state - 3 > 0xFFFFFFFFFFFFFFFDLL && v5;
}

- (BOOL)isEligibleForThresholdTopUpForUser:(id)a3
{
  BOOL v4 = 0;
  if (a3 && self->_role == 1) {
    BOOL v4 = [a3 memberType] == 2;
  }
  BOOL v5 = !v4;
  return self->_state - 3 > 0xFFFFFFFFFFFFFFFDLL && v5;
}

- (BOOL)willTriggerIdentityVerificationForTransactionAmount:(id)a3
{
  if (self->_stage == 3) {
    return 0;
  }
  BOOL v4 = [(NSDecimalNumber *)self->_amountRemainingUntilIdentityVerification decimalNumberBySubtracting:a3];
  BOOL v5 = [MEMORY[0x1E4F28C28] zero];
  BOOL v3 = [v4 compare:v5] == -1;

  return v3;
}

- (BOOL)transactionAmountIsValid:(id)a3 feature:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v5 = a4;
  id v6 = a3;
  double v7 = [v5 minimumAmount];
  uint64_t v8 = [v6 compare:v7];

  BOOL v9 = [v5 maximumAmount];

  uint64_t v10 = [v6 compare:v9];
  return v8 != -1 && v10 != 1;
}

- (BOOL)identityVerificationRequired
{
  return (PKUseMockSURFServer() & 1) == 0 && (PKStoreDemoModeEnabled() & 1) == 0 && self->_identityVerificationRequired;
}

- (BOOL)termsAcceptanceRequired
{
  if (PKUseMockSURFServer() & 1) != 0 || (PKStoreDemoModeEnabled()) {
    return 0;
  }
  BOOL v4 = PKPeerPaymentServiceForceTermsURL();

  return v4 || self->_termsAcceptanceRequired;
}

- (NSURL)termsURL
{
  BOOL v3 = PKPeerPaymentServiceForceTermsURL();

  if (v3)
  {
    PKPeerPaymentServiceForceTermsURL();
    BOOL v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v4 = self->_termsURL;
  }
  return v4;
}

- (NSString)termsIdentifier
{
  BOOL v3 = PKPeerPaymentServiceForceTermsURL();

  if (v3) {
    BOOL v4 = @"clientForcedTerms";
  }
  else {
    BOOL v4 = self->_termsIdentifier;
  }
  return (NSString *)v4;
}

- (NSSet)cloudStoreZoneNames
{
  if ([(NSSet *)self->_cloudStoreZoneNames count])
  {
    BOOL v3 = self->_cloudStoreZoneNames;
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"transactions"];
  }
  return v3;
}

- (void)setAssociatedAccountInformation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  associatedAccountInformation = self->_associatedAccountInformation;
  p_associatedAccountInformation = (id *)&self->_associatedAccountInformation;
  id v7 = associatedAccountInformation;
  if (v5 && v7)
  {
    if (objc_msgSend(v5, "isEqual:")) {
      goto LABEL_14;
    }
    id v7 = *p_associatedAccountInformation;
  }
  else if (v7 == v5)
  {
    goto LABEL_14;
  }
  id v10 = v7;
  objc_storeStrong(p_associatedAccountInformation, a3);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v11 = objc_msgSend(v10, "associatedAccountRemovalRecords", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v17 = *p_associatedAccountInformation;
        v18 = [v16 altDSID];
        objc_msgSend(v17, "markAssociatedAccountRemovalRecordWithAltDSID:hasPresentedNotification:", v18, objc_msgSend(v16, "hasPresentedNotification"));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

LABEL_14:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAccount)initWithCoder:(id)a3
{
  v62[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PKPeerPaymentAccount;
  id v5 = [(PKPeerPaymentAccount *)&v60 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_role = [v4 decodeIntegerForKey:@"role"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdDate"];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifiedDate"];
    identifiedDate = v5->_identifiedDate;
    v5->_identifiedDate = (NSDate *)v10;

    v5->_state = [v4 decodeIntegerForKey:@"state"];
    v5->_stage = [v4 decodeIntegerForKey:@"stage"];
    v5->_stateReason = [v4 decodeIntegerForKey:@"stateReason"];
    v5->_sendRestrictionType = [v4 decodeIntegerForKey:@"personToPersonRestrictionType"];
    v5->_receiveRestrictionType = [v4 decodeIntegerForKey:@"receiveRestrictionType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumBalance"];
    maximumBalance = v5->_maximumBalance;
    v5->_maximumBalance = (NSDecimalNumber *)v16;

    v5->_identityVerificationRequired = [v4 decodeBoolForKey:@"identityVerificationRequired"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amountRemainingUntilIdentityVerification"];
    amountRemainingUntilIdentityVerification = v5->_amountRemainingUntilIdentityVerification;
    v5->_amountRemainingUntilIdentityVerification = (NSDecimalNumber *)v18;

    v5->_accountStateDirty = [v4 decodeBoolForKey:@"accountStateDirty"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v20;

    [v4 decodeDoubleForKey:@"proactiveFetchPeriod"];
    v5->_double proactiveFetchPeriod = v22;
    [v4 decodeDoubleForKey:@"accountFetchAfterTransactionWaitPeriod"];
    v5->_accountFetchAfterTransactionWaitPeriod = v23;
    [v4 decodeDoubleForKey:@"accountFetchAfterTransactionWaitTolerance"];
    v5->_accountFetchAfterTransactionWaitTolerance = v24;
    v5->_termsAcceptanceRequired = [v4 decodeBoolForKey:@"termsAcceptanceRequired"];
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsURL"];
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPassURL"];
    associatedPassURL = v5->_associatedPassURL;
    v5->_associatedPassURL = (NSURL *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPassSerialNumber"];
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPassTypeIdentifier"];
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v33;

    v35 = (void *)MEMORY[0x1E4F1CAD0];
    v62[0] = objc_opt_class();
    v62[1] = objc_opt_class();
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
    v37 = [v35 setWithArray:v36];
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"supportedFeatureDescriptors"];
    supportedFeatureDescriptors = v5->_supportedFeatureDescriptors;
    v5->_supportedFeatureDescriptors = (NSSet *)v38;

    v5->_pendingPaymentCount = [v4 decodeIntegerForKey:@"pendingPaymentCount"];
    v5->_identityVerificationForDisbursementsRequired = [v4 decodeBoolForKey:@"identityVerificationForDisbursementsRequired"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v40;

    uint64_t v42 = (void *)MEMORY[0x1E4F1CAD0];
    v61[0] = objc_opt_class();
    v61[1] = objc_opt_class();
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    uint64_t v44 = [v42 setWithArray:v43];
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"cloudStoreZoneNames"];
    cloudStoreZoneNames = v5->_cloudStoreZoneNames;
    v5->_cloudStoreZoneNames = (NSSet *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"additionalPushTopics"];
    additionalPushTopics = v5->_additionalPushTopics;
    v5->_additionalPushTopics = (PKPeerPaymentAdditionalPushTopics *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionSourceIdentifier"];
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedAccountInformation"];
    associatedAccountInformation = v5->_associatedAccountInformation;
    v5->_associatedAccountInformation = (PKPeerPaymentAssociatedAccountInformation *)v51;

    v5->_hasDisplayedAssociatedAccountActiveNotification = [v4 decodeBoolForKey:@"hasDisplayedAssociatedAccountActiveNotification"];
    uint64_t v53 = [v4 decodeIntegerForKey:@"deviceScoreEncryptedPayloadVersion"];
    uint64_t v54 = 1;
    if (v53 != 1) {
      uint64_t v54 = 2;
    }
    if (!v53) {
      uint64_t v54 = 0;
    }
    v5->_deviceScoreEncryptedPayloadVersion = v54;
    v5->_hasRecurringPayments = [v4 decodeBoolForKey:@"hasRecurringPayments"];
    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentModeIdentifiers"];
    paymentModeIdentifiers = v5->_paymentModeIdentifiers;
    v5->_paymentModeIdentifiers = (PKPeerPaymentPaymentModeIdentifiers *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionCertificatesVersions"];
    encryptionCertificatesVersions = v5->_encryptionCertificatesVersions;
    v5->_encryptionCertificatesVersions = (PKPeerPaymentEncryptionCertificatesVersions *)v57;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_role forKey:@"role"];
  [v5 encodeObject:self->_createdDate forKey:@"createdDate"];
  [v5 encodeObject:self->_identifiedDate forKey:@"identifiedDate"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeInteger:self->_stage forKey:@"stage"];
  [v5 encodeInteger:self->_stateReason forKey:@"stateReason"];
  [v5 encodeInteger:self->_sendRestrictionType forKey:@"personToPersonRestrictionType"];
  [v5 encodeInteger:self->_receiveRestrictionType forKey:@"receiveRestrictionType"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_currentBalance forKey:@"currentBalance"];
  [v5 encodeObject:self->_maximumBalance forKey:@"maximumBalance"];
  [v5 encodeBool:self->_identityVerificationRequired forKey:@"identityVerificationRequired"];
  [v5 encodeObject:self->_amountRemainingUntilIdentityVerification forKey:@"amountRemainingUntilIdentityVerification"];
  [v5 encodeBool:self->_accountStateDirty forKey:@"accountStateDirty"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdated"];
  [v5 encodeDouble:@"proactiveFetchPeriod" forKey:self->_proactiveFetchPeriod];
  [v5 encodeDouble:@"accountFetchAfterTransactionWaitPeriod" forKey:self->_accountFetchAfterTransactionWaitPeriod];
  [v5 encodeDouble:@"accountFetchAfterTransactionWaitTolerance" forKey:self->_accountFetchAfterTransactionWaitTolerance];
  [v5 encodeBool:self->_termsAcceptanceRequired forKey:@"termsAcceptanceRequired"];
  [v5 encodeObject:self->_termsIdentifier forKey:@"termsIdentifier"];
  [v5 encodeObject:self->_termsURL forKey:@"termsURL"];
  [v5 encodeObject:self->_associatedPassURL forKey:@"associatedPassURL"];
  [v5 encodeObject:self->_associatedPassSerialNumber forKey:@"associatedPassSerialNumber"];
  [v5 encodeObject:self->_associatedPassTypeIdentifier forKey:@"associatedPassTypeIdentifier"];
  [v5 encodeObject:self->_supportedFeatureDescriptors forKey:@"supportedFeatureDescriptors"];
  [v5 encodeInteger:self->_pendingPaymentCount forKey:@"pendingPaymentCount"];
  [v5 encodeBool:self->_identityVerificationForDisbursementsRequired forKey:@"identityVerificationForDisbursementsRequired"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
  [v5 encodeObject:self->_cloudStoreZoneNames forKey:@"cloudStoreZoneNames"];
  [v5 encodeObject:self->_additionalPushTopics forKey:@"additionalPushTopics"];
  [v5 encodeObject:self->_transactionSourceIdentifier forKey:@"transactionSourceIdentifier"];
  [v5 encodeObject:self->_associatedAccountInformation forKey:@"associatedAccountInformation"];
  [v5 encodeBool:self->_hasDisplayedAssociatedAccountActiveNotification forKey:@"hasDisplayedAssociatedAccountActiveNotification"];
  [v5 encodeInteger:self->_deviceScoreEncryptedPayloadVersion forKey:@"deviceScoreEncryptedPayloadVersion"];
  [v5 encodeBool:self->_hasRecurringPayments forKey:@"hasRecurringPayments"];
  [v5 encodeObject:self->_paymentModeIdentifiers forKey:@"paymentModeIdentifiers"];
  [v5 encodeObject:self->_encryptionCertificatesVersions forKey:@"encryptionCertificatesVersions"];
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  unint64_t role = self->_role;
  id v5 = @"unknown";
  uint64_t v6 = @"participant";
  if (role != 1) {
    uint64_t v6 = @"unknown";
  }
  if (role) {
    id v7 = v6;
  }
  else {
    id v7 = @"owner";
  }
  [v3 appendFormat:@"role: '%@'; ", v7];
  [v3 appendFormat:@"createdDate: '%@'; ", self->_createdDate];
  [v3 appendFormat:@"identifiedDate: '%@'; ", self->_identifiedDate];
  unint64_t v8 = self->_state - 1;
  if (v8 <= 3) {
    id v5 = off_1E56E95B0[v8];
  }
  [v3 appendFormat:@"state: '%@'; ", v5];
  unint64_t v9 = self->_stage - 1;
  if (v9 > 2) {
    uint64_t v10 = @"unknown";
  }
  else {
    uint64_t v10 = off_1E56E95D0[v9];
  }
  [v3 appendFormat:@"stage: '%@'; ", v10];
  unint64_t stateReason = self->_stateReason;
  if (stateReason > 7) {
    uint64_t v12 = @"unknown";
  }
  else {
    uint64_t v12 = off_1E56E95E8[stateReason];
  }
  [v3 appendFormat:@"stateReason: '%@'; ", v12];
  unint64_t sendRestrictionType = self->_sendRestrictionType;
  uint64_t v14 = @"unknown";
  if (sendRestrictionType <= 2) {
    uint64_t v14 = off_1E56E9628[sendRestrictionType];
  }
  [v3 appendFormat:@"sendRestrictionType: '%@'; ", v14];
  unint64_t receiveRestrictionType = self->_receiveRestrictionType;
  uint64_t v16 = @"none";
  if (receiveRestrictionType) {
    uint64_t v16 = @"unknown";
  }
  if (receiveRestrictionType == 1) {
    id v17 = @"family";
  }
  else {
    id v17 = v16;
  }
  [v3 appendFormat:@"receiveRestrictionType: '%@'; ", v17];
  [v3 appendFormat:@"countryCode: '%@'; ", self->_countryCode];
  [v3 appendFormat:@"currentBalance: '%@'; ", self->_currentBalance];
  [v3 appendFormat:@"maximumBalance: '%@'; ", self->_maximumBalance];
  if (self->_identityVerificationRequired) {
    uint64_t v18 = @"YES";
  }
  else {
    uint64_t v18 = @"NO";
  }
  [v3 appendFormat:@"identityVerificationRequired: '%@'; ", v18];
  objc_msgSend(v3, "appendFormat:", @"amountRemainingUntilIdentityVerification: '%@'; ",
    self->_amountRemainingUntilIdentityVerification);
  if (self->_accountStateDirty) {
    long long v19 = @"YES";
  }
  else {
    long long v19 = @"NO";
  }
  [v3 appendFormat:@"accountStateDirty: '%@'; ", v19];
  [v3 appendFormat:@"lastUpdated: '%@'; ", self->_lastUpdated];
  double accountFetchAfterTransactionWaitPeriod = self->_accountFetchAfterTransactionWaitPeriod;
  if (accountFetchAfterTransactionWaitPeriod > 0.0) {
    objc_msgSend(v3, "appendFormat:", @"accountFetchAfterTransactionWaitPeriod: '%ld'; ",
  }
      (uint64_t)accountFetchAfterTransactionWaitPeriod);
  double accountFetchAfterTransactionWaitTolerance = self->_accountFetchAfterTransactionWaitTolerance;
  if (accountFetchAfterTransactionWaitTolerance > 0.0) {
    objc_msgSend(v3, "appendFormat:", @"accountFetchAfterTransactionWaitTolerance: '%ld'; ",
  }
      (uint64_t)accountFetchAfterTransactionWaitTolerance);
  if (self->_termsAcceptanceRequired) {
    double v22 = @"YES";
  }
  else {
    double v22 = @"NO";
  }
  [v3 appendFormat:@"termsAcceptanceRequired: '%@'; ", v22];
  if (self->_termsAcceptanceRequired)
  {
    [v3 appendFormat:@"termsIdentifier: '%@'; ", self->_termsIdentifier];
    [v3 appendFormat:@"termsURL: '%@'; ", self->_termsURL];
  }
  [v3 appendFormat:@"associatedPassURL: '%@'; ", self->_associatedPassURL];
  [v3 appendFormat:@"associatedPassSerialNumber: '%@'; ", self->_associatedPassSerialNumber];
  [v3 appendFormat:@"associatedPassTypeIdentifier: '%@'; ", self->_associatedPassTypeIdentifier];
  [v3 appendFormat:@"supportedFeatureDescriptors: '%@'; ", self->_supportedFeatureDescriptors];
  objc_msgSend(v3, "appendFormat:", @"pendingPaymentCount: '%ld'; ", self->_pendingPaymentCount);
  if (self->_identityVerificationForDisbursementsRequired) {
    double v23 = @"YES";
  }
  else {
    double v23 = @"NO";
  }
  [v3 appendFormat:@"identityVerificationForDisbursementsRequired: '%@'; ", v23];
  [v3 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
  [v3 appendFormat:@"cloudStoreZoneNames: '%@'; ", self->_cloudStoreZoneNames];
  [v3 appendFormat:@"additionalPushTopics: '%@'; ", self->_additionalPushTopics];
  [v3 appendFormat:@"transactionSourceIdentifier: '%@'; ", self->_transactionSourceIdentifier];
  if (self->_associatedAccountInformation) {
    objc_msgSend(v3, "appendFormat:", @"associatedAccountInformation: '%@'; ",
  }
      self->_associatedAccountInformation);
  if (self->_hasDisplayedAssociatedAccountActiveNotification) {
    double v24 = @"YES";
  }
  else {
    double v24 = @"NO";
  }
  [v3 appendFormat:@"hasDisplayedAssociatedAccountActiveNotification: '%@'; ", v24];
  unint64_t deviceScoreEncryptedPayloadVersion = self->_deviceScoreEncryptedPayloadVersion;
  if (deviceScoreEncryptedPayloadVersion > 2) {
    v26 = @"unknown";
  }
  else {
    v26 = off_1E56E9640[deviceScoreEncryptedPayloadVersion];
  }
  [v3 appendFormat:@"deviceScoreEncryptedPayloadVersion: '%@'; ", v26];
  if (self->_hasRecurringPayments) {
    uint64_t v27 = @"YES";
  }
  else {
    uint64_t v27 = @"NO";
  }
  [v3 appendFormat:@"hasRecurringPayments: '%@'; ", v27];
  [v3 appendFormat:@"paymentModeIdentifiers: '%@'; ", self->_paymentModeIdentifiers];
  objc_msgSend(v3, "appendFormat:", @"encryptionCertificatesVersions: '%@'; ",
    self->_encryptionCertificatesVersions);
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_89;
  }
  identifier = self->_identifier;
  uint64_t v6 = (NSString *)*((void *)v4 + 2);
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_89;
  }
  createdDate = self->_createdDate;
  unint64_t v8 = (NSDate *)*((void *)v4 + 4);
  if (createdDate && v8)
  {
    if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (createdDate != v8)
  {
    goto LABEL_89;
  }
  identifiedDate = self->_identifiedDate;
  uint64_t v10 = (NSDate *)*((void *)v4 + 5);
  if (identifiedDate && v10)
  {
    if ((-[NSDate isEqual:](identifiedDate, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (identifiedDate != v10)
  {
    goto LABEL_89;
  }
  countryCode = self->_countryCode;
  uint64_t v12 = (NSString *)*((void *)v4 + 11);
  if (countryCode && v12)
  {
    if ((-[NSString isEqual:](countryCode, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (countryCode != v12)
  {
    goto LABEL_89;
  }
  currentBalance = self->_currentBalance;
  uint64_t v14 = (PKCurrencyAmount *)*((void *)v4 + 12);
  if (currentBalance && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](currentBalance, "isEqual:")) {
      goto LABEL_89;
    }
  }
  else if (currentBalance != v14)
  {
    goto LABEL_89;
  }
  maximumBalance = self->_maximumBalance;
  uint64_t v16 = (NSDecimalNumber *)*((void *)v4 + 13);
  if (maximumBalance && v16)
  {
    if ((-[NSDecimalNumber isEqual:](maximumBalance, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (maximumBalance != v16)
  {
    goto LABEL_89;
  }
  termsIdentifier = self->_termsIdentifier;
  uint64_t v18 = (NSString *)*((void *)v4 + 19);
  if (termsIdentifier && v18)
  {
    if ((-[NSString isEqual:](termsIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (termsIdentifier != v18)
  {
    goto LABEL_89;
  }
  termsURL = self->_termsURL;
  uint64_t v20 = (NSURL *)*((void *)v4 + 20);
  if (termsURL && v20)
  {
    if ((-[NSURL isEqual:](termsURL, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (termsURL != v20)
  {
    goto LABEL_89;
  }
  associatedPassURL = self->_associatedPassURL;
  double v22 = (NSURL *)*((void *)v4 + 21);
  if (associatedPassURL && v22)
  {
    if ((-[NSURL isEqual:](associatedPassURL, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (associatedPassURL != v22)
  {
    goto LABEL_89;
  }
  associatedPassSerialNumber = self->_associatedPassSerialNumber;
  double v24 = (NSString *)*((void *)v4 + 22);
  if (associatedPassSerialNumber && v24)
  {
    if ((-[NSString isEqual:](associatedPassSerialNumber, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (associatedPassSerialNumber != v24)
  {
    goto LABEL_89;
  }
  associatedPassTypeIdentifier = self->_associatedPassTypeIdentifier;
  v26 = (NSString *)*((void *)v4 + 23);
  if (associatedPassTypeIdentifier && v26)
  {
    if ((-[NSString isEqual:](associatedPassTypeIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (associatedPassTypeIdentifier != v26)
  {
    goto LABEL_89;
  }
  supportedFeatureDescriptors = self->_supportedFeatureDescriptors;
  v28 = (NSSet *)*((void *)v4 + 33);
  if (supportedFeatureDescriptors && v28)
  {
    if ((-[NSSet isEqual:](supportedFeatureDescriptors, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (supportedFeatureDescriptors != v28)
  {
    goto LABEL_89;
  }
  uint64_t v29 = (void *)*((void *)v4 + 25);
  v30 = self->_altDSID;
  uint64_t v31 = v29;
  if (v30 == v31)
  {
  }
  else
  {
    v32 = v31;
    if (!v30 || !v31) {
      goto LABEL_88;
    }
    BOOL v33 = [(NSString *)v30 isEqualToString:v31];

    if (!v33) {
      goto LABEL_89;
    }
  }
  cloudStoreZoneNames = self->_cloudStoreZoneNames;
  v35 = (NSSet *)*((void *)v4 + 26);
  if (cloudStoreZoneNames && v35)
  {
    if ((-[NSSet isEqual:](cloudStoreZoneNames, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (cloudStoreZoneNames != v35)
  {
    goto LABEL_89;
  }
  additionalPushTopics = self->_additionalPushTopics;
  v37 = (PKPeerPaymentAdditionalPushTopics *)*((void *)v4 + 27);
  if (additionalPushTopics && v37)
  {
    if (!-[PKPeerPaymentAdditionalPushTopics isEqual:](additionalPushTopics, "isEqual:")) {
      goto LABEL_89;
    }
  }
  else if (additionalPushTopics != v37)
  {
    goto LABEL_89;
  }
  associatedAccountInformation = self->_associatedAccountInformation;
  double v39 = (PKPeerPaymentAssociatedAccountInformation *)*((void *)v4 + 28);
  if (associatedAccountInformation && v39)
  {
    if (!-[PKPeerPaymentAssociatedAccountInformation isEqual:](associatedAccountInformation, "isEqual:")) {
      goto LABEL_89;
    }
  }
  else if (associatedAccountInformation != v39)
  {
    goto LABEL_89;
  }
  uint64_t v40 = (void *)*((void *)v4 + 29);
  v30 = self->_transactionSourceIdentifier;
  double v41 = v40;
  if (v30 != v41)
  {
    v32 = v41;
    if (v30 && v41)
    {
      BOOL v42 = [(NSString *)v30 isEqualToString:v41];

      if (!v42) {
        goto LABEL_89;
      }
      goto LABEL_92;
    }
LABEL_88:

    goto LABEL_89;
  }

LABEL_92:
  paymentModeIdentifiers = self->_paymentModeIdentifiers;
  uint64_t v46 = (PKPeerPaymentPaymentModeIdentifiers *)*((void *)v4 + 31);
  if (paymentModeIdentifiers && v46)
  {
    if (!-[PKPeerPaymentPaymentModeIdentifiers isEqual:](paymentModeIdentifiers, "isEqual:")) {
      goto LABEL_89;
    }
  }
  else if (paymentModeIdentifiers != v46)
  {
    goto LABEL_89;
  }
  encryptionCertificatesVersions = self->_encryptionCertificatesVersions;
  uint64_t v48 = (PKPeerPaymentEncryptionCertificatesVersions *)*((void *)v4 + 32);
  if (encryptionCertificatesVersions && v48)
  {
    if (!-[PKPeerPaymentEncryptionCertificatesVersions isEqual:](encryptionCertificatesVersions, "isEqual:")) {
      goto LABEL_89;
    }
  }
  else if (encryptionCertificatesVersions != v48)
  {
    goto LABEL_89;
  }
  if (self->_identityVerificationRequired == *((unsigned __int8 *)v4 + 8))
  {
    amountRemainingUntilIdentityVerification = self->_amountRemainingUntilIdentityVerification;
    uint64_t v50 = (NSDecimalNumber *)*((void *)v4 + 14);
    if (amountRemainingUntilIdentityVerification && v50)
    {
      if ((-[NSDecimalNumber isEqual:](amountRemainingUntilIdentityVerification, "isEqual:") & 1) == 0) {
        goto LABEL_89;
      }
    }
    else if (amountRemainingUntilIdentityVerification != v50)
    {
      goto LABEL_89;
    }
    if (self->_termsAcceptanceRequired == *((unsigned __int8 *)v4 + 10)
      && self->_proactiveFetchPeriod == v4[16]
      && self->_accountFetchAfterTransactionWaitPeriod == v4[17]
      && self->_accountFetchAfterTransactionWaitTolerance == v4[18]
      && self->_role == *((void *)v4 + 3)
      && self->_state == *((void *)v4 + 6)
      && self->_stateReason == *((void *)v4 + 8)
      && self->_sendRestrictionType == *((void *)v4 + 9)
      && self->_receiveRestrictionType == *((void *)v4 + 10)
      && self->_stage == *((void *)v4 + 7)
      && self->_pendingPaymentCount == *((void *)v4 + 24)
      && self->_identityVerificationForDisbursementsRequired == *((unsigned __int8 *)v4 + 11)
      && self->_hasDisplayedAssociatedAccountActiveNotification == *((unsigned __int8 *)v4 + 12)
      && self->_deviceScoreEncryptedPayloadVersion == *((void *)v4 + 30))
    {
      BOOL v43 = self->_hasRecurringPayments == *((unsigned __int8 *)v4 + 13);
      goto LABEL_90;
    }
  }
LABEL_89:
  BOOL v43 = 0;
LABEL_90:

  return v43;
}

- (unint64_t)hash
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_createdDate];
  [v3 safelyAddObject:self->_identifiedDate];
  [v3 safelyAddObject:self->_countryCode];
  [v3 safelyAddObject:self->_currentBalance];
  [v3 safelyAddObject:self->_maximumBalance];
  [v3 safelyAddObject:self->_amountRemainingUntilIdentityVerification];
  [v3 safelyAddObject:self->_termsIdentifier];
  [v3 safelyAddObject:self->_termsURL];
  [v3 safelyAddObject:self->_associatedPassURL];
  [v3 safelyAddObject:self->_associatedPassSerialNumber];
  [v3 safelyAddObject:self->_associatedPassTypeIdentifier];
  [v3 safelyAddObject:self->_supportedFeatureDescriptors];
  [v3 safelyAddObject:self->_altDSID];
  [v3 safelyAddObject:self->_cloudStoreZoneNames];
  [v3 safelyAddObject:self->_additionalPushTopics];
  [v3 safelyAddObject:self->_transactionSourceIdentifier];
  [v3 safelyAddObject:self->_associatedAccountInformation];
  [v3 safelyAddObject:self->_paymentModeIdentifiers];
  [v3 safelyAddObject:self->_encryptionCertificatesVersions];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_identityVerificationRequired - v4 + 32 * v4;
  uint64_t v6 = self->_termsAcceptanceRequired - v5 + 32 * v5;
  unint64_t v7 = (unint64_t)self->_proactiveFetchPeriod - v6 + 32 * v6;
  unint64_t v8 = (unint64_t)self->_accountFetchAfterTransactionWaitPeriod - v7 + 32 * v7;
  unint64_t v9 = (unint64_t)self->_accountFetchAfterTransactionWaitTolerance - v8 + 32 * v8;
  unint64_t v10 = self->_role - v9 + 32 * v9;
  unint64_t v11 = self->_state - v10 + 32 * v10;
  unint64_t v12 = self->_stateReason - v11 + 32 * v11;
  unint64_t v13 = self->_stage - v12 + 32 * v12;
  unint64_t v14 = self->_sendRestrictionType - v13 + 32 * v13;
  unint64_t v15 = self->_receiveRestrictionType - v14 + 32 * v14;
  int64_t v16 = self->_pendingPaymentCount - v15 + 32 * v15;
  uint64_t v17 = self->_identityVerificationForDisbursementsRequired - v16 + 32 * v16;
  uint64_t v18 = self->_hasDisplayedAssociatedAccountActiveNotification - v17 + 32 * v17;
  unint64_t v19 = self->_deviceScoreEncryptedPayloadVersion - v18 + 32 * v18;
  unint64_t v20 = self->_hasRecurringPayments - v19 + 32 * v19;

  return v20;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_unint64_t role = a3;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
}

- (NSDate)identifiedDate
{
  return self->_identifiedDate;
}

- (void)setIdentifiedDate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)stage
{
  return self->_stage;
}

- (void)setStage:(unint64_t)a3
{
  self->_stage = a3;
}

- (unint64_t)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(unint64_t)a3
{
  self->_unint64_t stateReason = a3;
}

- (unint64_t)sendRestrictionType
{
  return self->_sendRestrictionType;
}

- (void)setSendRestrictionType:(unint64_t)a3
{
  self->_unint64_t sendRestrictionType = a3;
}

- (unint64_t)receiveRestrictionType
{
  return self->_receiveRestrictionType;
}

- (void)setReceiveRestrictionType:(unint64_t)a3
{
  self->_unint64_t receiveRestrictionType = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (NSDecimalNumber)maximumBalance
{
  return self->_maximumBalance;
}

- (void)setMaximumBalance:(id)a3
{
}

- (void)setIdentityVerificationRequired:(BOOL)a3
{
  self->_identityVerificationRequired = a3;
}

- (NSDecimalNumber)amountRemainingUntilIdentityVerification
{
  return self->_amountRemainingUntilIdentityVerification;
}

- (void)setAmountRemainingUntilIdentityVerification:(id)a3
{
}

- (BOOL)isAccountStateDirty
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

- (double)proactiveFetchPeriod
{
  return self->_proactiveFetchPeriod;
}

- (void)setProactiveFetchPeriod:(double)a3
{
  self->_double proactiveFetchPeriod = a3;
}

- (double)accountFetchAfterTransactionWaitPeriod
{
  return self->_accountFetchAfterTransactionWaitPeriod;
}

- (void)setAccountFetchAfterTransactionWaitPeriod:(double)a3
{
  self->_double accountFetchAfterTransactionWaitPeriod = a3;
}

- (double)accountFetchAfterTransactionWaitTolerance
{
  return self->_accountFetchAfterTransactionWaitTolerance;
}

- (void)setAccountFetchAfterTransactionWaitTolerance:(double)a3
{
  self->_double accountFetchAfterTransactionWaitTolerance = a3;
}

- (void)setTermsAcceptanceRequired:(BOOL)a3
{
  self->_termsAcceptanceRequired = a3;
}

- (void)setTermsIdentifier:(id)a3
{
}

- (void)setTermsURL:(id)a3
{
}

- (NSURL)associatedPassURL
{
  return self->_associatedPassURL;
}

- (void)setAssociatedPassURL:(id)a3
{
}

- (void)setAssociatedPassSerialNumber:(id)a3
{
}

- (void)setAssociatedPassTypeIdentifier:(id)a3
{
}

- (int64_t)pendingPaymentCount
{
  return self->_pendingPaymentCount;
}

- (void)setPendingPaymentCount:(int64_t)a3
{
  self->_pendingPaymentCount = a3;
}

- (BOOL)identityVerificationForDisbursementsRequired
{
  return self->_identityVerificationForDisbursementsRequired;
}

- (void)setIdentityVerificationForDisbursementsRequired:(BOOL)a3
{
  self->_identityVerificationForDisbursementsRequired = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void)setCloudStoreZoneNames:(id)a3
{
}

- (PKPeerPaymentAdditionalPushTopics)additionalPushTopics
{
  return self->_additionalPushTopics;
}

- (void)setAdditionalPushTopics:(id)a3
{
}

- (PKPeerPaymentAssociatedAccountInformation)associatedAccountInformation
{
  return self->_associatedAccountInformation;
}

- (BOOL)hasDisplayedAssociatedAccountActiveNotification
{
  return self->_hasDisplayedAssociatedAccountActiveNotification;
}

- (void)setHasDisplayedAssociatedAccountActiveNotification:(BOOL)a3
{
  self->_hasDisplayedAssociatedAccountActiveNotification = a3;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
}

- (unint64_t)deviceScoreEncryptedPayloadVersion
{
  return self->_deviceScoreEncryptedPayloadVersion;
}

- (void)setDeviceScoreEncryptedPayloadVersion:(unint64_t)a3
{
  self->_unint64_t deviceScoreEncryptedPayloadVersion = a3;
}

- (PKPeerPaymentPaymentModeIdentifiers)paymentModeIdentifiers
{
  return self->_paymentModeIdentifiers;
}

- (void)setPaymentModeIdentifiers:(id)a3
{
}

- (PKPeerPaymentEncryptionCertificatesVersions)encryptionCertificatesVersions
{
  return self->_encryptionCertificatesVersions;
}

- (void)setEncryptionCertificatesVersions:(id)a3
{
}

- (BOOL)hasRecurringPayments
{
  return self->_hasRecurringPayments;
}

- (void)setHasRecurringPayments:(BOOL)a3
{
  self->_hasRecurringPayments = a3;
}

- (NSSet)supportedFeatureDescriptors
{
  return self->_supportedFeatureDescriptors;
}

- (void)setSupportedFeatureDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFeatureDescriptors, 0);
  objc_storeStrong((id *)&self->_encryptionCertificatesVersions, 0);
  objc_storeStrong((id *)&self->_paymentModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedAccountInformation, 0);
  objc_storeStrong((id *)&self->_additionalPushTopics, 0);
  objc_storeStrong((id *)&self->_cloudStoreZoneNames, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_associatedPassTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedPassSerialNumber, 0);
  objc_storeStrong((id *)&self->_associatedPassURL, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_amountRemainingUntilIdentityVerification, 0);
  objc_storeStrong((id *)&self->_maximumBalance, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_identifiedDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)supportsLoadFromCard
{
  v2 = [(PKPeerPaymentAccount *)self loadFromCardFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)loadFromCardFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"loadFromCard"];
}

- (BOOL)supportsTransferToBank
{
  v2 = [(PKPeerPaymentAccount *)self transferToBankFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)transferToBankFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"transferToBank"];
}

- (BOOL)supportsSendToUser
{
  v2 = [(PKPeerPaymentAccount *)self sendToUserFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)sendToUserFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"sendToUser"];
}

- (BOOL)supportsRequestFromUser
{
  v2 = [(PKPeerPaymentAccount *)self requestFromUserFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)requestFromUserFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"requestFromUser"];
}

- (BOOL)supportsSendFromWallet
{
  v2 = [(PKPeerPaymentAccount *)self sendFromWalletFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)sendFromWalletFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"sendFromWallet"];
}

- (BOOL)supportsRequestFromWallet
{
  v2 = [(PKPeerPaymentAccount *)self requestFromWalletFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)requestFromWalletFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"requestFromWallet"];
}

- (BOOL)supportsPendingRequestAction
{
  v2 = [(PKPeerPaymentAccount *)self pendingRequestActionFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)pendingRequestActionFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"pendingRequestAction"];
}

- (BOOL)supportsRecurringPayments
{
  v2 = [(PKPeerPaymentAccount *)self recurringPaymentsFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)recurringPaymentsFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"recurringPayments"];
}

- (BOOL)supportsThresholdTopUp
{
  v2 = [(PKPeerPaymentAccount *)self thresholdTopUpFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)thresholdTopUpFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"thresholdTopUp"];
}

- (BOOL)supportsCardBalancePromotion
{
  v2 = [(PKPeerPaymentAccount *)self cardBalancePromotionFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)cardBalancePromotionFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"cardBalancePromotion"];
}

- (BOOL)supportsInstantWithdrawal
{
  v2 = [(PKPeerPaymentAccount *)self instantWithdrawalPromotionFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)instantWithdrawalPromotionFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"instantWithdrawal"];
}

- (BOOL)supportsAssociatedAccountStateAction
{
  v2 = [(PKPeerPaymentAccount *)self associatedAccountStateActionFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)associatedAccountStateActionFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"associatedAccountStateAction"];
}

- (BOOL)supportsPreserveCurrentBalance
{
  v2 = [(PKPeerPaymentAccount *)self preserveCurrentBalanceFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)preserveCurrentBalanceFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"preserveCurrentBalance"];
}

- (BOOL)supportsFamilySharing
{
  v2 = [(PKPeerPaymentAccount *)self supportsFamilySharingFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)supportsFamilySharingFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"familySharing"];
}

- (BOOL)supportsGraduationWhileAssociatedAccountLocked
{
  v2 = [(PKPeerPaymentAccount *)self supportsGraduationWhileAssociatedAccountLockedFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)supportsGraduationWhileAssociatedAccountLockedFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"graduationWhenAssociatedAccountLocked"];
}

- (BOOL)supportsDeviceTap
{
  v2 = [(PKPeerPaymentAccount *)self deviceTapFeatureDescriptor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)deviceTapFeatureDescriptor
{
  return [(PKPeerPaymentAccount *)self _featureWithIdentifier:@"deviceTap"];
}

- (id)_featureWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(PKPeerPaymentAccount *)self supportedFeatureDescriptors];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v10 = [v9 identifier];
        if ([v10 isEqualToString:v4])
        {
          int v11 = [v9 isSupported];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
LABEL_12:

  return v6;
}

- (PKPeerPaymentAccount)initWithDictionary:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  uint64_t v7 = [(PKPeerPaymentAccount *)self initWithDictionary:v5 lastUpdated:v6];

  return v7;
}

- (NSDictionary)minimumTransferAmounts
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPeerPaymentAccount *)self currentBalance];
  id v4 = [v3 currency];

  id v5 = [(PKPeerPaymentAccount *)self sendToUserFeatureDescriptor];
  id v6 = [v5 minimumAmount];

  uint64_t v7 = 0;
  if (v4 && v6)
  {
    unint64_t v9 = v4;
    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }

  return (NSDictionary *)v7;
}

- (NSDictionary)maximumTransferAmounts
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPeerPaymentAccount *)self currentBalance];
  id v4 = [v3 currency];

  id v5 = [(PKPeerPaymentAccount *)self sendToUserFeatureDescriptor];
  id v6 = [v5 maximumAmount];

  uint64_t v7 = 0;
  if (v4 && v6)
  {
    unint64_t v9 = v4;
    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }

  return (NSDictionary *)v7;
}

@end