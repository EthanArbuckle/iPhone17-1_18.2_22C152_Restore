@interface PKSecureElementPass
+ (BOOL)supportsSecureCoding;
+ (id)displayableErrorForAction:(id)a3 andReason:(unint64_t)a4;
+ (id)displayableErrorForTransitAction:(id)a3 andReason:(unint64_t)a4;
+ (id)displayableNoPaymentNetworkErrorMessageForAction:(id)a3 isTransit:(BOOL)a4;
+ (unint64_t)defaultSettings;
- (BOOL)areCredentialsStoredInKML;
- (BOOL)availableForAutomaticPresentationUsingBeaconContext;
- (BOOL)availableForAutomaticPresentationUsingInAppOrWebContext;
- (BOOL)availableForAutomaticPresentationUsingVASContext;
- (BOOL)canPerformAction:(id)a3 unableReason:(unint64_t *)a4 displayableError:(id *)a5;
- (BOOL)hadMerchantTokens;
- (BOOL)hasActiveVirtualCard;
- (BOOL)hasActiveVirtualCardAccordingToWebService:(id)a3;
- (BOOL)hasAssociatedPeerPaymentAccount;
- (BOOL)hasContactlessDevicePaymentApplicationsAvailable;
- (BOOL)hasCredentials;
- (BOOL)hasDeviceTransactionSourceIdentifier:(id)a3;
- (BOOL)hasImmediateAutomaticSelectionCriterion;
- (BOOL)hasLegacyBalanceModel;
- (BOOL)hasMerchantTokens;
- (BOOL)isAccessPass;
- (BOOL)isAppleBalancePass;
- (BOOL)isAppleCardPass;
- (BOOL)isAutoTopEnabled;
- (BOOL)isAutoTopUpBalance:(id)a3;
- (BOOL)isCarKeyPass;
- (BOOL)isChinaTransitCredential;
- (BOOL)isCobranded;
- (BOOL)isContactlessPaymentSupportedForTransitNetworks:(id)a3;
- (BOOL)isDevicePrimaryPaymentApplicationPersonalized;
- (BOOL)isEMoneyPass;
- (BOOL)isEqualToPassIncludingMetadata:(id)a3;
- (BOOL)isHomeKeyPass;
- (BOOL)isHybridIdentityPass;
- (BOOL)isIdentityPass;
- (BOOL)isOctopusPass;
- (BOOL)isPayLaterPass;
- (BOOL)isPaymentOptionSelectable;
- (BOOL)isPeerPaymentPass;
- (BOOL)isPrecursorPass:(id)a3;
- (BOOL)isPrepaidPass;
- (BOOL)isPrivateLabel;
- (BOOL)isShellPass;
- (BOOL)isStoredValuePass;
- (BOOL)isSuicaPass;
- (BOOL)isTransitPass;
- (BOOL)isUserDeletable;
- (BOOL)needsHardcodedReminderOptions;
- (BOOL)preventsWalletDeletion;
- (BOOL)requiresFelicaSecureElement;
- (BOOL)requiresTransferSerialNumberBasedProvisioning;
- (BOOL)shouldDisplayDeviceAssessmentEducationAccordingToService:(id)a3;
- (BOOL)shouldIgnoreTransactionUpdatesSwitch;
- (BOOL)shouldSuppressNoChargeAmount;
- (BOOL)supportsBarcodePayment;
- (BOOL)supportsDPANNotifications;
- (BOOL)supportsDefaultCardSelection;
- (BOOL)supportsDeviceAssessmentAccordingToService:(id)a3;
- (BOOL)supportsFPANNotifications;
- (BOOL)supportsFeatureForCurrentDevice:(unint64_t)a3;
- (BOOL)supportsOnlyTransit;
- (BOOL)supportsPeerPayment;
- (BOOL)supportsSerialNumberBasedProvisioning;
- (BOOL)supportsVirtualCardNumber;
- (BOOL)supportsVirtualCardNumberAccordingToWebService:(id)a3;
- (BOOL)supportsWebPaymentMode:(int64_t)a3 withExclusionList:(id)a4;
- (BOOL)supportsWebPaymentMode:(int64_t)a3 withExclusionList:(id)a4 clientOSVersion:(id)a5;
- (FKAccount)bankConnectAccount;
- (NSArray)availableActions;
- (NSArray)deviceUpgradeRequests;
- (NSArray)upgradeRequests;
- (NSDate)originalProvisioningDate;
- (NSSet)associatedApplicationIdentifiers;
- (NSSet)associatedWebDomains;
- (NSSet)deviceInAppPaymentApplications;
- (NSSet)devicePaymentApplications;
- (NSSet)paymentApplications;
- (NSString)appURLScheme;
- (NSString)associatedAccountServiceAccountIdentifier;
- (NSString)cobrandName;
- (NSString)customerServiceIdentifier;
- (NSString)deviceAccountIdentifier;
- (NSString)deviceAccountNumberSuffix;
- (NSString)devicePassIdentifier;
- (NSString)identityAccountKeyIdentifier;
- (NSString)issuerAdministrativeAreaCode;
- (NSString)issuerCountryCode;
- (NSString)localizedSuspendedReason;
- (NSString)messagePushTopic;
- (NSString)pairedTerminalIdentifier;
- (NSString)partnerAccountIdentifier;
- (NSString)primaryAccountIdentifier;
- (NSString)primaryAccountNumberSuffix;
- (NSString)sanitizedPrimaryAccountName;
- (NSString)sanitizedPrimaryAccountNumber;
- (NSString)shippingAddressSeed;
- (NSString)speakableMake;
- (NSString)speakableModel;
- (NSString)topLeftBackgroundTitle;
- (NSString)topRightBackgroundTitle;
- (NSString)transactionPushTopic;
- (NSString)transactionSourceIdentifier;
- (NSURL)messageServiceRegistrationURL;
- (NSURL)messageServiceURL;
- (NSURL)transactionServiceRegistrationURL;
- (NSURL)transactionServiceURL;
- (PKCurrencyAmount)peerPaymentBalance;
- (PKPassAuxiliaryRegistrationRequirements)auxiliaryRegistrationRequirements;
- (PKPassProvisioningMetadata)provisioningMetadata;
- (PKPaymentApplication)devicePrimaryBarcodePaymentApplication;
- (PKPaymentApplication)devicePrimaryContactlessPaymentApplication;
- (PKPaymentApplication)devicePrimaryInAppPaymentApplication;
- (PKPaymentApplication)devicePrimaryPaymentApplication;
- (PKSecureElementPass)initWithCoder:(id)a3;
- (PKSecureElementPass)initWithDictionary:(id)a3 bundle:(id)a4;
- (PKSecureElementPassActivationState)passActivationState;
- (PKSiriIntentsConfiguration)supportedSiriIntents;
- (PKTransitPassProperties)transitProperties;
- (id)_launchURLForPassAction:(id)a3;
- (id)_localizedSuspendedReasonForAID:(id)a3;
- (id)_passSubcredentialFilesWithPrefix:(id)a3 extension:(id)a4 forSecureElementIdentifiers:(id)a5;
- (id)_transactionServiceURLOverride;
- (id)actionGroups;
- (id)actionLocalizations;
- (id)addValueURL;
- (id)autoTopUpBalanceIdentifiers;
- (id)autoTopUpMerchantTokenIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deviceContactlessPaymentApplications;
- (id)devicePaymentApplicationForAID:(id)a3;
- (id)deviceTransactionSourceIdentifiers;
- (id)dynamicLayerConfiguration;
- (id)eligibleExpressUpgradeRequestsForDeviceClass:(id)a3 deviceSEIDs:(id)a4 deviceVersion:(id)a5 technologyTest:(id)a6;
- (id)iso18013BlobsForSecureElementIdentifiers:(id)a3;
- (id)iso18013BlobsMetdataForSecureElementIdentifiers:(id)a3;
- (id)longTermPrivacyKeyGroupIdentifier;
- (id)notificationCenterTitle;
- (id)paymentApplicationForAID:(id)a3;
- (id)paymentApplicationsForSecureElementIdentifiers:(id)a3;
- (id)precursorUpgradeRequestsForDeviceSEIDs:(id)a3 deviceClass:(id)a4 deviceVersion:(id)a5;
- (id)primaryPaymentApplicationForSecureElementIdentifiers:(id)a3;
- (id)sanitizedDeviceAccountNumber;
- (id)seBlobsForSecureElementIdentifiers:(id)a3;
- (id)sortedPaymentApplications:(id)a3 ascending:(BOOL)a4;
- (id)subcredentialConfigurationForSecureElementIdentifiers:(id)a3;
- (id)transitCommutePlans;
- (id)virtualCardSuffix;
- (int64_t)accessType;
- (int64_t)cardType;
- (int64_t)effectiveContactlessPaymentApplicationState;
- (int64_t)identityType;
- (int64_t)paymentType;
- (unint64_t)_activationStateForApplicationState:(int64_t)a3;
- (unint64_t)associatedAccountFeatureIdentifier;
- (unint64_t)contactlessActivationGroupingType;
- (unint64_t)contactlessActivationState;
- (unint64_t)supportedRadioTechnologies;
- (unint64_t)transitCommutePlanType;
- (void)encodeWithCoder:(id)a3;
- (void)sanitizePaymentApplications;
- (void)setAppURLScheme:(id)a3;
- (void)setAssociatedAccountFeatureIdentifier:(unint64_t)a3;
- (void)setAssociatedAccountServiceAccountIdentifier:(id)a3;
- (void)setAssociatedApplicationIdentifiers:(id)a3;
- (void)setAssociatedWebDomains:(id)a3;
- (void)setAuxiliaryRegistrationRequirements:(id)a3;
- (void)setAvailableActions:(id)a3;
- (void)setBankConnectAccount:(id)a3;
- (void)setCardType:(int64_t)a3;
- (void)setCobrandName:(id)a3;
- (void)setCobranded:(BOOL)a3;
- (void)setContactlessActivationGroupingType:(unint64_t)a3;
- (void)setCustomerServiceIdentifier:(id)a3;
- (void)setDeviceInAppPaymentApplications:(id)a3;
- (void)setDevicePaymentApplications:(id)a3;
- (void)setDevicePrimaryBarcodePaymentApplication:(id)a3;
- (void)setDevicePrimaryContactlessPaymentApplication:(id)a3;
- (void)setDevicePrimaryInAppPaymentApplication:(id)a3;
- (void)setDevicePrimaryPaymentApplication:(id)a3;
- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3;
- (void)setIdentityAccountKeyIdentifier:(id)a3;
- (void)setIssuerAdministrativeAreaCode:(id)a3;
- (void)setIssuerCountryCode:(id)a3;
- (void)setLocalizedSuspendedReason:(id)a3;
- (void)setMessagePushTopic:(id)a3;
- (void)setMessageServiceRegistrationURL:(id)a3;
- (void)setMessageServiceURL:(id)a3;
- (void)setOriginalProvisioningDate:(id)a3;
- (void)setPartnerAccountIdentifier:(id)a3;
- (void)setPaymentApplications:(id)a3;
- (void)setPeerPaymentBalance:(id)a3;
- (void)setPrimaryAccountIdentifier:(id)a3;
- (void)setPrimaryAccountNumberSuffix:(id)a3;
- (void)setProvisioningMetadata:(id)a3;
- (void)setRequiresTransferSerialNumberBasedProvisioning:(BOOL)a3;
- (void)setSanitizedPrimaryAccountName:(id)a3;
- (void)setSanitizedPrimaryAccountNumber:(id)a3;
- (void)setShellPass:(BOOL)a3;
- (void)setShippingAddressSeed:(id)a3;
- (void)setSpeakableMake:(id)a3;
- (void)setSpeakableModel:(id)a3;
- (void)setSupportedSiriIntents:(id)a3;
- (void)setSupportsDPANNotifications:(BOOL)a3;
- (void)setSupportsDefaultCardSelection:(BOOL)a3;
- (void)setSupportsFPANNotifications:(BOOL)a3;
- (void)setSupportsPeerPayment:(BOOL)a3;
- (void)setSupportsSerialNumberBasedProvisioning:(BOOL)a3;
- (void)setTopLeftBackgroundTitle:(id)a3;
- (void)setTopRightBackgroundTitle:(id)a3;
- (void)setTransactionPushTopic:(id)a3;
- (void)setTransactionServiceRegistrationURL:(id)a3;
- (void)setTransactionServiceURL:(id)a3;
- (void)setTransactionSourceIdentifier:(id)a3;
- (void)updateDevicePaymentApplicationsWithSecureElementIdentifiers:(id)a3;
@end

@implementation PKSecureElementPass

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUpgradeRequests, 0);
  objc_storeStrong((id *)&self->_availableActions, 0);
  objc_storeStrong((id *)&self->_auxiliaryRegistrationRequirements, 0);
  objc_storeStrong((id *)&self->_supportedSiriIntents, 0);
  objc_storeStrong((id *)&self->_speakableModel, 0);
  objc_storeStrong((id *)&self->_speakableMake, 0);
  objc_storeStrong((id *)&self->_shippingAddressSeed, 0);
  objc_storeStrong((id *)&self->_localizedSuspendedReason, 0);
  objc_storeStrong((id *)&self->_customerServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_appURLScheme, 0);
  objc_storeStrong((id *)&self->_messagePushTopic, 0);
  objc_storeStrong((id *)&self->_messageServiceRegistrationURL, 0);
  objc_storeStrong((id *)&self->_messageServiceURL, 0);
  objc_storeStrong((id *)&self->_transactionPushTopic, 0);
  objc_storeStrong((id *)&self->_transactionServiceRegistrationURL, 0);
  objc_storeStrong((id *)&self->_transactionServiceURL, 0);
  objc_storeStrong((id *)&self->_cobrandName, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceInAppPaymentApplications, 0);
  objc_storeStrong((id *)&self->_devicePrimaryBarcodePaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryInAppPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryContactlessPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePaymentApplications, 0);
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_topRightBackgroundTitle, 0);
  objc_storeStrong((id *)&self->_topLeftBackgroundTitle, 0);
  objc_storeStrong((id *)&self->_provisioningMetadata, 0);
  objc_storeStrong((id *)&self->_originalProvisioningDate, 0);
  objc_storeStrong((id *)&self->_identityAccountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_issuerAdministrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_issuerCountryCode, 0);
  objc_storeStrong((id *)&self->_associatedAccountServiceAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountName, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_associatedWebDomains, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
}

- (unint64_t)_activationStateForApplicationState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE) {
    return 4;
  }
  else {
    return qword_191674940[a3 - 1];
  }
}

- (id)dynamicLayerConfiguration
{
  v2 = [(PKObject *)self contentLoadedIfNeeded];
  v3 = [v2 dynamicLayerConfiguration];

  return v3;
}

uint64_t __83__PKSecureElementPass_updateDevicePaymentApplicationsWithSecureElementIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 supportsBarcodePayment];
}

- (NSString)customerServiceIdentifier
{
  v2 = [(PKObject *)self contentLoadedIfNeeded];
  v3 = [v2 customerServiceIdentifier];

  return (NSString *)v3;
}

- (NSString)sanitizedPrimaryAccountName
{
  return self->_sanitizedPrimaryAccountName;
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

+ (unint64_t)defaultSettings
{
  return 72;
}

- (unint64_t)associatedAccountFeatureIdentifier
{
  return self->_associatedAccountFeatureIdentifier;
}

- (BOOL)isPeerPaymentPass
{
  return self->_associatedAccountFeatureIdentifier == 1;
}

- (PKSecureElementPass)initWithDictionary:(id)a3 bundle:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v74.receiver = self;
  v74.super_class = (Class)PKSecureElementPass;
  v7 = [(PKPass *)&v74 initWithDictionary:v6 bundle:a4];
  v8 = v7;
  if (v6 && v7)
  {
    v9 = [v6 PKStringForKey:@"cardType"];
    [(PKSecureElementPass *)v8 setCardType:PKPaymentCardTypeFromString(v9)];

    id v73 = v6;
    id v10 = v6;
    v11 = [v10 PKArrayContaining:objc_opt_class() forKey:@"paymentApplications"];
    v12 = [v10 PKArrayContaining:objc_opt_class() forKey:@"auxiliaryPaymentApplications"];
    if (v11)
    {
      v71 = v12;
      v13 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v12, "count") + objc_msgSend(v11, "count"));
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      v69 = v11;
      id v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v79 objects:v84 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v80;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v80 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v79 + 1) + 8 * i);
            v20 = PKValidatePaymentApplicationDict(v19);

            if (!v20)
            {
              v21 = [[PKPaymentApplication alloc] initWithPaymentApplicationDictionary:v19 auxiliaryApplication:0];
              [v13 addObject:v21];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v79 objects:v84 count:16];
        }
        while (v16);
      }

      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v22 = v71;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v75 objects:v83 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v76;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v76 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v75 + 1) + 8 * j);
            v28 = PKValidatePaymentApplicationDict(v27);

            if (!v28)
            {
              v29 = [[PKPaymentApplication alloc] initWithPaymentApplicationDictionary:v27 auxiliaryApplication:1];
              [v13 addObject:v29];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v75 objects:v83 count:16];
        }
        while (v24);
      }

      v11 = v69;
      v12 = v71;
    }
    else
    {
      v13 = 0;
    }
    if ([v13 count]) {
      v30 = v13;
    }
    else {
      v30 = 0;
    }
    id v31 = v30;

    [(PKSecureElementPass *)v8 setPaymentApplications:v31];
    v32 = (void *)MEMORY[0x1E4F1CAD0];
    v33 = [v10 PKArrayForKey:@"associatedApplicationIdentifiers"];
    v34 = [v32 setWithArray:v33];
    [(PKSecureElementPass *)v8 setAssociatedApplicationIdentifiers:v34];

    v35 = (void *)MEMORY[0x1E4F1CAD0];
    v36 = [v10 PKArrayForKey:@"associatedWebDomains"];
    v37 = [v35 setWithArray:v36];
    [(PKSecureElementPass *)v8 setAssociatedWebDomains:v37];

    v38 = [v10 PKStringForKey:@"primaryAccountIdentifier"];
    [(PKSecureElementPass *)v8 setPrimaryAccountIdentifier:v38];

    v39 = [v10 PKStringForKey:@"primaryAccountSuffix"];
    [(PKSecureElementPass *)v8 setPrimaryAccountNumberSuffix:v39];

    v40 = [v10 PKStringForKey:@"sanitizedPrimaryAccountNumber"];
    [(PKSecureElementPass *)v8 setSanitizedPrimaryAccountNumber:v40];

    v41 = [v10 PKStringForKey:@"sanitizedPrimaryAccountName"];
    [(PKSecureElementPass *)v8 setSanitizedPrimaryAccountName:v41];

    v42 = [v10 PKStringForKey:@"topLeftBackgroundTitle"];
    [(PKSecureElementPass *)v8 setTopLeftBackgroundTitle:v42];

    v43 = [v10 PKStringForKey:@"topRightBackgroundTitle"];
    [(PKSecureElementPass *)v8 setTopRightBackgroundTitle:v43];

    v44 = [v10 PKStringForKey:@"transactionServiceURL"];
    if ([v44 length])
    {
      v45 = [v10 PKStringForKey:@"transactionPushTopic"];
      uint64_t v46 = [v45 length] != 0;
    }
    else
    {
      uint64_t v46 = 0;
    }

    v47 = [v10 objectForKey:@"supportsDPANNotifications"];
    uint64_t v48 = v46;
    if (v47) {
      uint64_t v48 = [v10 PKBoolForKey:@"supportsDPANNotifications"];
    }

    [(PKSecureElementPass *)v8 setSupportsDPANNotifications:v48];
    v49 = [v10 objectForKey:@"supportsFPANNotifications"];
    if (v49) {
      uint64_t v46 = [v10 PKBoolForKey:@"supportsFPANNotifications"];
    }

    [(PKSecureElementPass *)v8 setSupportsFPANNotifications:v46];
    v50 = [v10 objectForKey:@"supportsDefaultCardSelection"];
    if (v50) {
      uint64_t v51 = [v10 PKBoolForKey:@"supportsDefaultCardSelection"];
    }
    else {
      uint64_t v51 = 1;
    }

    [(PKSecureElementPass *)v8 setSupportsDefaultCardSelection:v51];
    v52 = [v10 objectForKey:@"supportsSerialNumberBasedProvisioning"];
    if (v52) {
      uint64_t v53 = [v10 PKBoolForKey:@"supportsSerialNumberBasedProvisioning"];
    }
    else {
      uint64_t v53 = 1;
    }

    [(PKSecureElementPass *)v8 setSupportsSerialNumberBasedProvisioning:v53];
    v54 = [v10 objectForKey:@"requiresTransferSerialNumberBasedProvisioning"];
    if (v54) {
      uint64_t v55 = [v10 PKBoolForKey:@"requiresTransferSerialNumberBasedProvisioning"];
    }
    else {
      uint64_t v55 = 0;
    }

    [(PKSecureElementPass *)v8 setRequiresTransferSerialNumberBasedProvisioning:v55];
    v56 = [v10 PKStringForKey:@"contactlessActivationGroupingType"];
    v72 = v56;
    if (v56)
    {
      uint64_t v57 = PKContactlessActivationGroupingTypeFromString(v56);
    }
    else
    {
      v58 = [v10 objectForKey:@"isPaymentOptionSelectable"];
      if (v58)
      {
        if ([v10 PKBoolForKey:@"isPaymentOptionSelectable"]) {
          uint64_t v57 = 2;
        }
        else {
          uint64_t v57 = 1;
        }
      }
      else
      {
        uint64_t v57 = 2;
      }
    }
    [(PKSecureElementPass *)v8 setContactlessActivationGroupingType:v57];
    -[PKSecureElementPass setCobranded:](v8, "setCobranded:", [v10 PKBoolForKey:@"isCobranded"]);
    v70 = [v10 PKStringForKey:@"cobrandName"];
    [(PKSecureElementPass *)v8 setCobrandName:v70];
    v59 = [v10 PKStringForKey:@"issuerCountryCode"];
    [(PKSecureElementPass *)v8 setIssuerCountryCode:v59];
    v60 = [v10 PKStringForKey:@"issuerAdministrativeAreaCode"];
    [(PKSecureElementPass *)v8 setIssuerAdministrativeAreaCode:v60];
    v61 = [v10 PKStringForKey:@"identityAccountKeyIdentifier"];
    [(PKSecureElementPass *)v8 setIdentityAccountKeyIdentifier:v61];
    -[PKSecureElementPass setHasAssociatedPeerPaymentAccount:](v8, "setHasAssociatedPeerPaymentAccount:", [v10 PKBoolForKey:@"hasAssociatedPeerPaymentAccount"]);
    -[PKSecureElementPass setShellPass:](v8, "setShellPass:", [v10 PKBoolForKey:@"isShellPass"]);
    v62 = [v10 PKDateForKey:@"originalProvisioningDate"];
    [(PKSecureElementPass *)v8 setOriginalProvisioningDate:v62];
    v63 = [v10 PKStringForKey:@"associatedAccountServiceAccountIdentifier"];
    [(PKSecureElementPass *)v8 setAssociatedAccountServiceAccountIdentifier:v63];
    v64 = [v10 PKStringForKey:@"partnerAccountIdentifier"];
    [(PKSecureElementPass *)v8 setPartnerAccountIdentifier:v64];
    v65 = [v10 PKStringForKey:@"shippingAddressSeed"];
    [(PKSecureElementPass *)v8 setShippingAddressSeed:v65];
    v66 = [v10 PKStringForKey:@"speakableCarMake"];
    [(PKSecureElementPass *)v8 setSpeakableMake:v66];
    v67 = [v10 PKStringForKey:@"speakableCarModel"];
    [(PKSecureElementPass *)v8 setSpeakableModel:v67];

    id v6 = v73;
  }

  return v8;
}

- (void)setContactlessActivationGroupingType:(unint64_t)a3
{
  self->_contactlessActivationGroupingType = a3;
}

- (PKSecureElementPass)initWithCoder:(id)a3
{
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)PKSecureElementPass;
  v5 = [(PKPass *)&v65 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x192FDC630]();
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardType"];
    [(PKSecureElementPass *)v5 setCardType:PKPaymentCardTypeFromString(v7)];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionSourceIdentifier"];
    [(PKSecureElementPass *)v5 setTransactionSourceIdentifier:v8];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = (void *)MEMORY[0x192FDC630]();
    v13 = [v4 decodeObjectOfClasses:v11 forKey:@"paymentApplications"];
    [(PKSecureElementPass *)v5 setPaymentApplications:v13];

    id v14 = (void *)MEMORY[0x192FDC630]();
    uint64_t v15 = [v4 decodeObjectOfClasses:v11 forKey:@"devicePaymentApplications"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"devicePaymentApplication"];
    uint64_t v17 = (void *)v16;
    v64 = (void *)v6;
    if (v15)
    {
      [(PKSecureElementPass *)v5 setDevicePaymentApplications:v15];
    }
    else if (v16)
    {
      v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
      [(PKSecureElementPass *)v5 setDevicePaymentApplications:v18];
    }
    v19 = [v4 decodeObjectOfClasses:v11 forKey:@"inAppPaymentApplications"];
    [(PKSecureElementPass *)v5 setDeviceInAppPaymentApplications:v19];

    v20 = (void *)MEMORY[0x192FDC630]();
    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"devicePrimaryPaymentApplication"];
    [(PKSecureElementPass *)v5 setDevicePrimaryPaymentApplication:v21];

    id v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"devicePrimaryContactlessPaymentApplication"];
    [(PKSecureElementPass *)v5 setDevicePrimaryContactlessPaymentApplication:v22];

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"devicePrimaryInAppPaymentApplication"];
    [(PKSecureElementPass *)v5 setDevicePrimaryInAppPaymentApplication:v23];

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"devicePrimaryBarcodePaymentApplication"];
    [(PKSecureElementPass *)v5 setDevicePrimaryBarcodePaymentApplication:v24];

    uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v28 = [v4 decodeObjectOfClasses:v27 forKey:@"associatedApplicationIdentifiers"];
    [(PKSecureElementPass *)v5 setAssociatedApplicationIdentifiers:v28];

    v29 = [v4 decodeObjectOfClasses:v27 forKey:@"associatedWebDomains"];
    [(PKSecureElementPass *)v5 setAssociatedWebDomains:v29];

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAccountIdentifier"];
    [(PKSecureElementPass *)v5 setPrimaryAccountIdentifier:v30];

    id v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAccountSuffix"];
    [(PKSecureElementPass *)v5 setPrimaryAccountNumberSuffix:v31];

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sanitizedPrimaryAccountNumber"];
    [(PKSecureElementPass *)v5 setSanitizedPrimaryAccountNumber:v32];

    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sanitizedPrimaryAccountName"];
    [(PKSecureElementPass *)v5 setSanitizedPrimaryAccountName:v33];

    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsDPANNotifications"];
    -[PKSecureElementPass setSupportsDPANNotifications:](v5, "setSupportsDPANNotifications:", [v34 BOOLValue]);

    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsFPANNotifications"];
    -[PKSecureElementPass setSupportsFPANNotifications:](v5, "setSupportsFPANNotifications:", [v35 BOOLValue]);

    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsDefaultCardSelection"];
    -[PKSecureElementPass setSupportsDefaultCardSelection:](v5, "setSupportsDefaultCardSelection:", [v36 BOOLValue]);

    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isShellPass"];
    -[PKSecureElementPass setShellPass:](v5, "setShellPass:", [v37 BOOLValue]);

    v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalProvisioningDate"];
    [(PKSecureElementPass *)v5 setOriginalProvisioningDate:v38];

    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningMetadata"];
    [(PKSecureElementPass *)v5 setProvisioningMetadata:v39];

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsSerialNumberBasedProvisioning"];
    v41 = (void *)v40;
    v42 = (void *)MEMORY[0x1E4F1CC38];
    if (v40) {
      v42 = (void *)v40;
    }
    id v43 = v42;

    uint64_t v44 = [v43 BOOLValue];
    [(PKSecureElementPass *)v5 setSupportsSerialNumberBasedProvisioning:v44];
    -[PKSecureElementPass setRequiresTransferSerialNumberBasedProvisioning:](v5, "setRequiresTransferSerialNumberBasedProvisioning:", [v4 decodeBoolForKey:@"requiresTransferSerialNumberBasedProvisioning"]);
    v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactlessActivationGroupingType"];
    uint64_t v46 = v45;
    if (v45)
    {
      uint64_t v47 = PKContactlessActivationGroupingTypeFromString(v45);
    }
    else
    {
      uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isPaymentOptionSelectable"];
      int v49 = [v48 BOOLValue];

      if (v49) {
        uint64_t v47 = 2;
      }
      else {
        uint64_t v47 = 1;
      }
    }
    v5->_contactlessActivationGroupingType = v47;
    v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isCobranded"];
    -[PKSecureElementPass setCobranded:](v5, "setCobranded:", [v50 BOOLValue]);

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cobrandName"];
    [(PKSecureElementPass *)v5 setCobrandName:v51];

    v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuerCountryCode"];
    [(PKSecureElementPass *)v5 setIssuerCountryCode:v52];

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuerAdministrativeAreaCode"];
    [(PKSecureElementPass *)v5 setIssuerAdministrativeAreaCode:v53];

    v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identityAccountKeyIdentifier"];
    [(PKSecureElementPass *)v5 setIdentityAccountKeyIdentifier:v54];

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasAssociatedPeerPaymentAccount"];
    -[PKSecureElementPass setHasAssociatedPeerPaymentAccount:](v5, "setHasAssociatedPeerPaymentAccount:", [v55 BOOLValue]);

    v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedAccountServiceAccountIdentifier"];
    [(PKSecureElementPass *)v5 setAssociatedAccountServiceAccountIdentifier:v56];

    -[PKSecureElementPass setAssociatedAccountFeatureIdentifier:](v5, "setAssociatedAccountFeatureIdentifier:", [v4 decodeIntegerForKey:@"associatedAccountFeatureIdentifier"]);
    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topLeftBackgroundTitle"];
    [(PKSecureElementPass *)v5 setTopLeftBackgroundTitle:v57];

    v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topRightBackgroundTitle"];
    [(PKSecureElementPass *)v5 setTopRightBackgroundTitle:v58];

    v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerAccountIdentifier"];
    [(PKSecureElementPass *)v5 setPartnerAccountIdentifier:v59];

    v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingAddressSeed"];
    [(PKSecureElementPass *)v5 setShippingAddressSeed:v60];

    v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speakableCarMake"];
    [(PKSecureElementPass *)v5 setSpeakableMake:v61];

    v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speakableCarModel"];
    [(PKSecureElementPass *)v5 setSpeakableModel:v62];
  }

  return v5;
}

- (void)setSupportsSerialNumberBasedProvisioning:(BOOL)a3
{
  self->_supportsSerialNumberBasedProvisioning = a3;
}

- (void)setSupportsFPANNotifications:(BOOL)a3
{
  self->_supportsFPANNotifications = a3;
}

- (void)setSupportsDefaultCardSelection:(BOOL)a3
{
  self->_supportsDefaultCardSelection = a3;
}

- (void)setSupportsDPANNotifications:(BOOL)a3
{
  self->_supportsDPANNotifications = a3;
}

- (void)setShippingAddressSeed:(id)a3
{
}

- (void)setShellPass:(BOOL)a3
{
  self->_shellPass = a3;
}

- (void)setSanitizedPrimaryAccountNumber:(id)a3
{
}

- (void)setSanitizedPrimaryAccountName:(id)a3
{
}

- (void)setRequiresTransferSerialNumberBasedProvisioning:(BOOL)a3
{
  self->_requiresTransferSerialNumberBasedProvisioning = a3;
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
}

- (void)setPaymentApplications:(id)a3
{
}

- (void)setPartnerAccountIdentifier:(id)a3
{
}

- (void)setOriginalProvisioningDate:(id)a3
{
}

- (void)setIssuerCountryCode:(id)a3
{
}

- (void)setIssuerAdministrativeAreaCode:(id)a3
{
}

- (void)setIdentityAccountKeyIdentifier:(id)a3
{
}

- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3
{
  self->_hasAssociatedPeerPaymentAccount = a3;
}

- (void)setCobranded:(BOOL)a3
{
  self->_cobranded = a3;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (void)setAssociatedWebDomains:(id)a3
{
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
}

- (void)setAssociatedAccountServiceAccountIdentifier:(id)a3
{
}

- (void)setTransactionSourceIdentifier:(id)a3
{
}

- (void)setProvisioningMetadata:(id)a3
{
}

- (void)setAssociatedAccountFeatureIdentifier:(unint64_t)a3
{
  self->_associatedAccountFeatureIdentifier = a3;
}

- (void)setTopRightBackgroundTitle:(id)a3
{
}

- (void)setTopLeftBackgroundTitle:(id)a3
{
}

- (void)setSpeakableModel:(id)a3
{
}

- (void)setSpeakableMake:(id)a3
{
}

- (void)setCobrandName:(id)a3
{
}

- (void)setDevicePrimaryPaymentApplication:(id)a3
{
}

- (void)setDevicePrimaryInAppPaymentApplication:(id)a3
{
}

- (void)setDevicePrimaryContactlessPaymentApplication:(id)a3
{
}

- (void)setDevicePrimaryBarcodePaymentApplication:(id)a3
{
}

- (void)setDevicePaymentApplications:(id)a3
{
}

- (void)setDeviceInAppPaymentApplications:(id)a3
{
}

- (unint64_t)contactlessActivationState
{
  int64_t v3 = [(PKSecureElementPass *)self effectiveContactlessPaymentApplicationState];
  return [(PKSecureElementPass *)self _activationStateForApplicationState:v3];
}

- (int64_t)effectiveContactlessPaymentApplicationState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  int64_t v4 = [v3 state];

  if (v4 == 15 || v4 == 1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = [(PKSecureElementPass *)self devicePaymentApplications];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) state];
          if (v4 != v10)
          {
            int64_t v4 = v10;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v4;
}

- (PKSecureElementPassActivationState)passActivationState
{
  int64_t v3 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  PKSecureElementPassActivationState v4 = -[PKSecureElementPass _activationStateForApplicationState:](self, "_activationStateForApplicationState:", [v3 state]);

  return v4;
}

- (BOOL)isEMoneyPass
{
  if (self->_cardType == 1 && [(PKSecureElementPass *)self paymentType] == 1) {
    return 1;
  }
  PKSecureElementPassActivationState v4 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  BOOL v3 = [v4 paymentType] == 5;

  return v3;
}

- (PKPaymentApplication)devicePrimaryPaymentApplication
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_devicePaymentApplications)
  {
    BOOL v3 = NSString;
    PKSecureElementPassActivationState v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    BOOL v6 = [(PKObject *)self initializedViaInitWithCoder];
    uint64_t v7 = @"was not";
    if (v6) {
      uint64_t v7 = @"was";
    }
    uint64_t v8 = [v3 stringWithFormat:@"updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePrimaryPaymentApplication. (%@ %@ initialized via initWithCoder:)", v5, v7];

    v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v13 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }
  }
  devicePrimaryPaymentApplication = self->_devicePrimaryPaymentApplication;
  return devicePrimaryPaymentApplication;
}

- (unint64_t)contactlessActivationGroupingType
{
  return self->_contactlessActivationGroupingType;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (BOOL)isIdentityPass
{
  return self->_cardType == 4;
}

- (BOOL)isAppleCardPass
{
  return self->_associatedAccountFeatureIdentifier == 2;
}

- (BOOL)isAccessPass
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t cardType = self->_cardType;
  if (cardType == 3) {
    return 1;
  }
  if (cardType) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_paymentApplications;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "paymentType", (void)v12) - 1001;
        if (v8 <= 3 && v8 != 1)
        {
          BOOL v10 = 1;
          goto LABEL_19;
        }
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
    }
    while (v5);
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_19:

  return v10;
}

- (BOOL)isTransitPass
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t cardType = self->_cardType;
  if (cardType == 2)
  {
    LOBYTE(v4) = 1;
  }
  else if (cardType)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    BOOL v3 = self->_paymentApplications;
    uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (objc_msgSend(v7, "paymentType", (void)v9) == 1000 && (objc_msgSend(v7, "supportsTransit") & 1) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_16;
          }
        }
        uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  return v4;
}

- (BOOL)supportsDeviceAssessmentAccordingToService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKSecureElementPass *)self devicePaymentApplications];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PKSecureElementPass_supportsDeviceAssessmentAccordingToService___block_invoke;
  v9[3] = &unk_1E56E3308;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "pk_hasObjectPassingTest:", v9);

  return v7;
}

- (NSSet)devicePaymentApplications
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  devicePaymentApplications = self->_devicePaymentApplications;
  if (!devicePaymentApplications)
  {
    id v4 = NSString;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    BOOL v7 = [(PKObject *)self initializedViaInitWithCoder];
    unint64_t v8 = @"was not";
    if (v7) {
      unint64_t v8 = @"was";
    }
    long long v9 = [v4 stringWithFormat:@"updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePaymentApplications. (%@ %@ initialized via initWithCoder:)", v6, v8];

    id v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v13 = v9;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }

    devicePaymentApplications = self->_devicePaymentApplications;
  }
  return devicePaymentApplications;
}

uint64_t __45__PKSecureElementPass_supportsBarcodePayment__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 supportsBarcodePayment];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)updateDevicePaymentApplicationsWithSecureElementIdentifiers:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    *(void *)buf = 0;
    v58 = buf;
    uint64_t v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__22;
    v61 = __Block_byref_object_dispose__22;
    id v62 = 0;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    paymentApplications = self->_paymentApplications;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __83__PKSecureElementPass_updateDevicePaymentApplicationsWithSecureElementIdentifiers___block_invoke;
    v54[3] = &unk_1E56E32C0;
    v56 = buf;
    id v8 = v6;
    id v55 = v8;
    EnumerateApplicationsForSEIDs(paymentApplications, v5, v54);
    long long v9 = (NSSet *)[v8 copy];
    devicePaymentApplications = self->_devicePaymentApplications;
    self->_devicePaymentApplications = v9;

    p_devicePrimaryPaymentApplication = &self->_devicePrimaryPaymentApplication;
    objc_storeStrong((id *)&self->_devicePrimaryPaymentApplication, *((id *)v58 + 5));
    if ([(PKPaymentApplication *)self->_devicePrimaryPaymentApplication supportsContactlessPayment])
    {
      long long v12 = *p_devicePrimaryPaymentApplication;
      devicePrimaryContactlessPaymentApplication = self->_devicePrimaryContactlessPaymentApplication;
      self->_devicePrimaryContactlessPaymentApplication = v12;
    }
    else
    {
      devicePrimaryContactlessPaymentApplication = [(NSSet *)self->_devicePaymentApplications objectsPassingTest:&__block_literal_global_104_0];
      long long v15 = [devicePrimaryContactlessPaymentApplication allObjects];
      uint64_t v16 = [(PKSecureElementPass *)self sortedPaymentApplications:v15 ascending:1];
      uint64_t v17 = [v16 firstObject];
      v18 = self->_devicePrimaryContactlessPaymentApplication;
      self->_devicePrimaryContactlessPaymentApplication = v17;
    }
    if ([(PKPaymentApplication *)self->_devicePrimaryBarcodePaymentApplication supportsBarcodePayment])
    {
      v19 = *p_devicePrimaryPaymentApplication;
      devicePrimaryBarcodePaymentApplication = self->_devicePrimaryBarcodePaymentApplication;
      self->_devicePrimaryBarcodePaymentApplication = v19;
    }
    else
    {
      devicePrimaryBarcodePaymentApplication = [(NSSet *)self->_devicePaymentApplications objectsPassingTest:&__block_literal_global_106];
      v21 = [devicePrimaryBarcodePaymentApplication allObjects];
      id v22 = [(PKSecureElementPass *)self sortedPaymentApplications:v21 ascending:1];
      uint64_t v23 = [v22 firstObject];
      uint64_t v24 = self->_devicePrimaryBarcodePaymentApplication;
      self->_devicePrimaryBarcodePaymentApplication = v23;
    }
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v26 = self->_devicePaymentApplications;
    uint64_t v27 = [(NSSet *)v26 countByEnumeratingWithState:&v50 objects:v67 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v51 != v28) {
            objc_enumerationMutation(v26);
          }
          v30 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if ([v30 supportsInAppPayment])
          {
            if ([v30 supportsComboCard])
            {
              id v31 = [v30 paymentApplicationsIncludingAuxiliaryPaymentTypes];
              [v25 addObjectsFromArray:v31];
            }
            else
            {
              [v25 addObject:v30];
            }
          }
        }
        uint64_t v27 = [(NSSet *)v26 countByEnumeratingWithState:&v50 objects:v67 count:16];
      }
      while (v27);
    }

    v32 = (NSSet *)[v25 copy];
    deviceInAppPaymentApplications = self->_deviceInAppPaymentApplications;
    self->_deviceInAppPaymentApplications = v32;

    if ([(PKPaymentApplication *)*p_devicePrimaryPaymentApplication supportsInAppPayment])
    {
      v34 = *p_devicePrimaryPaymentApplication;
      devicePrimaryInAppPaymentApplication = self->_devicePrimaryInAppPaymentApplication;
      self->_devicePrimaryInAppPaymentApplication = v34;
    }
    else
    {
      devicePrimaryInAppPaymentApplication = [(NSSet *)self->_deviceInAppPaymentApplications allObjects];
      v36 = [(PKSecureElementPass *)self sortedPaymentApplications:devicePrimaryInAppPaymentApplication ascending:1];
      v37 = [v36 firstObject];
      v38 = self->_devicePrimaryInAppPaymentApplication;
      self->_devicePrimaryInAppPaymentApplication = v37;
    }
    v39 = self->_devicePrimaryInAppPaymentApplication;
    if (v39 && [(PKPaymentApplication *)v39 supportsComboCard])
    {
      uint64_t v40 = [(PKPaymentApplication *)self->_devicePrimaryInAppPaymentApplication paymentApplicationsIncludingAuxiliaryPaymentTypes];
      v41 = [v40 firstObject];
      v42 = self->_devicePrimaryInAppPaymentApplication;
      self->_devicePrimaryInAppPaymentApplication = v41;
    }
    if (*p_devicePrimaryPaymentApplication) {
      goto LABEL_39;
    }
    if ([(PKSecureElementPass *)self hasAssociatedPeerPaymentAccount])
    {
      id v43 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v63 = 0;
        uint64_t v44 = "PeerPayment pass found without devicePrimaryPaymentApplication. This could be the ghost pass.";
LABEL_36:
        uint64_t v47 = v43;
        uint32_t v48 = 2;
LABEL_37:
        _os_log_impl(&dword_190E10000, v47, OS_LOG_TYPE_DEFAULT, v44, v63, v48);
      }
    }
    else
    {
      v45 = [(PKSecureElementPass *)self associatedAccountServiceAccountIdentifier];

      id v43 = PKLogFacilityTypeGetObject(6uLL);
      BOOL v46 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
      if (!v45)
      {
        if (!v46) {
          goto LABEL_38;
        }
        int v49 = self->_paymentApplications;
        *(_DWORD *)v63 = 138412546;
        v64 = v5;
        __int16 v65 = 2112;
        v66 = v49;
        uint64_t v44 = "Failed to find devicePrimaryPaymentApplication for seids: %@ in payment applications: %@";
        uint64_t v47 = v43;
        uint32_t v48 = 22;
        goto LABEL_37;
      }
      if (v46)
      {
        *(_WORD *)v63 = 0;
        uint64_t v44 = "Pass with associatedAccountServiceAccountIdentifier found without devicePrimaryPaymentApplication. This co"
              "uld be the ghost pass.";
        goto LABEL_36;
      }
    }
LABEL_38:

LABEL_39:
    _Block_object_dispose(buf, 8);

    goto LABEL_40;
  }
  uint64_t v14 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Error: PKPaymentPass updateDevicePaymentApplicationsWithSecureElementIdentifiers: called with no identifiers. Here be dragons!", buf, 2u);
  }

LABEL_40:
}

- (id)sortedPaymentApplications:(id)a3 ascending:(BOOL)a4
{
  return PKSortedPaymentApplicationsByAID(a3, self->_devicePrimaryPaymentApplication, a4);
}

- (BOOL)hasAssociatedPeerPaymentAccount
{
  return self->_hasAssociatedPeerPaymentAccount;
}

- (NSString)associatedAccountServiceAccountIdentifier
{
  return self->_associatedAccountServiceAccountIdentifier;
}

void __83__PKSecureElementPass_updateDevicePaymentApplicationsWithSecureElementIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  id v7 = v4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    char v6 = [v4 isAuxiliary];
    id v5 = v7;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      id v5 = v7;
    }
  }
  [*(id *)(a1 + 32) addObject:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsBarcodePayment
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = [(PKSecureElementPass *)self paymentApplications];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PKSecureElementPass_supportsBarcodePayment__block_invoke;
  v4[3] = &unk_1E56E3250;
  v4[4] = &v5;
  [v2 enumerateObjectsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (NSSet)paymentApplications
{
  return self->_paymentApplications;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKSecureElementPass;
  id v5 = [(PKPass *)&v17 encodeWithCoder:v4];
  char v6 = (void *)MEMORY[0x192FDC630](v5);
  uint64_t v7 = PKPaymentCardTypeToString(self->_cardType);
  [v4 encodeObject:v7 forKey:@"cardType"];

  [v4 encodeObject:self->_paymentApplications forKey:@"paymentApplications"];
  [v4 encodeObject:self->_devicePaymentApplications forKey:@"devicePaymentApplications"];
  [v4 encodeObject:self->_deviceInAppPaymentApplications forKey:@"inAppPaymentApplications"];
  [v4 encodeObject:self->_devicePrimaryPaymentApplication forKey:@"devicePrimaryPaymentApplication"];
  [v4 encodeObject:self->_devicePrimaryContactlessPaymentApplication forKey:@"devicePrimaryContactlessPaymentApplication"];
  [v4 encodeObject:self->_devicePrimaryInAppPaymentApplication forKey:@"devicePrimaryInAppPaymentApplication"];
  [v4 encodeObject:self->_devicePrimaryBarcodePaymentApplication forKey:@"devicePrimaryBarcodePaymentApplication"];
  [v4 encodeObject:self->_associatedApplicationIdentifiers forKey:@"associatedApplicationIdentifiers"];
  [v4 encodeObject:self->_associatedWebDomains forKey:@"associatedWebDomains"];
  [v4 encodeObject:self->_primaryAccountIdentifier forKey:@"primaryAccountIdentifier"];
  [v4 encodeObject:self->_primaryAccountNumberSuffix forKey:@"primaryAccountSuffix"];
  [v4 encodeObject:self->_sanitizedPrimaryAccountNumber forKey:@"sanitizedPrimaryAccountNumber"];
  [v4 encodeObject:self->_sanitizedPrimaryAccountName forKey:@"sanitizedPrimaryAccountName"];
  char v8 = [NSNumber numberWithBool:self->_supportsDPANNotifications];
  [v4 encodeObject:v8 forKey:@"supportsDPANNotifications"];

  long long v9 = [NSNumber numberWithBool:self->_supportsFPANNotifications];
  [v4 encodeObject:v9 forKey:@"supportsFPANNotifications"];

  id v10 = [NSNumber numberWithBool:self->_supportsDefaultCardSelection];
  [v4 encodeObject:v10 forKey:@"supportsDefaultCardSelection"];

  long long v11 = [NSNumber numberWithBool:self->_shellPass];
  [v4 encodeObject:v11 forKey:@"isShellPass"];

  [v4 encodeObject:self->_originalProvisioningDate forKey:@"originalProvisioningDate"];
  [v4 encodeObject:self->_provisioningMetadata forKey:@"provisioningMetadata"];
  long long v12 = [NSNumber numberWithBool:self->_supportsSerialNumberBasedProvisioning];
  [v4 encodeObject:v12 forKey:@"supportsSerialNumberBasedProvisioning"];

  [v4 encodeBool:self->_requiresTransferSerialNumberBasedProvisioning forKey:@"requiresTransferSerialNumberBasedProvisioning"];
  long long v13 = [NSNumber numberWithBool:self->_contactlessActivationGroupingType == 2];
  [v4 encodeObject:v13 forKey:@"isPaymentOptionSelectable"];

  uint64_t v14 = PKContactlessActivationGroupingTypeToString(self->_contactlessActivationGroupingType);
  [v4 encodeObject:v14 forKey:@"contactlessActivationGroupingType"];

  long long v15 = [NSNumber numberWithBool:self->_cobranded];
  [v4 encodeObject:v15 forKey:@"isCobranded"];

  [v4 encodeObject:self->_cobrandName forKey:@"cobrandName"];
  [v4 encodeObject:self->_issuerCountryCode forKey:@"issuerCountryCode"];
  [v4 encodeObject:self->_issuerAdministrativeAreaCode forKey:@"issuerAdministrativeAreaCode"];
  [v4 encodeObject:self->_identityAccountKeyIdentifier forKey:@"identityAccountKeyIdentifier"];
  uint64_t v16 = [NSNumber numberWithBool:self->_hasAssociatedPeerPaymentAccount];
  [v4 encodeObject:v16 forKey:@"hasAssociatedPeerPaymentAccount"];

  [v4 encodeObject:self->_associatedAccountServiceAccountIdentifier forKey:@"associatedAccountServiceAccountIdentifier"];
  [v4 encodeInteger:self->_associatedAccountFeatureIdentifier forKey:@"associatedAccountFeatureIdentifier"];
  [v4 encodeObject:self->_topLeftBackgroundTitle forKey:@"topLeftBackgroundTitle"];
  [v4 encodeObject:self->_topRightBackgroundTitle forKey:@"topRightBackgroundTitle"];
  [v4 encodeObject:self->_transactionSourceIdentifier forKey:@"transactionSourceIdentifier"];
  [v4 encodeObject:self->_partnerAccountIdentifier forKey:@"partnerAccountIdentifier"];
  [v4 encodeObject:self->_shippingAddressSeed forKey:@"shippingAddressSeed"];
  [v4 encodeObject:self->_speakableMake forKey:@"speakableCarMake"];
  [v4 encodeObject:self->_speakableModel forKey:@"speakableCarModel"];
}

- (BOOL)isAppleBalancePass
{
  return self->_associatedAccountFeatureIdentifier == 4
      || [(PKPaymentApplication *)self->_devicePrimaryPaymentApplication paymentNetworkIdentifier] == 135;
}

- (PKCurrencyAmount)peerPaymentBalance
{
  if ([(PKSecureElementPass *)self hasAssociatedPeerPaymentAccount])
  {
    BOOL v3 = objc_getAssociatedObject(self, sel_peerPaymentBalance);
  }
  else
  {
    BOOL v3 = 0;
  }
  return (PKCurrencyAmount *)v3;
}

- (void)setPeerPaymentBalance:(id)a3
{
}

- (FKAccount)bankConnectAccount
{
  return (FKAccount *)objc_getAssociatedObject(self, sel_bankConnectAccount);
}

- (void)setBankConnectAccount:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v59.receiver = self;
  v59.super_class = (Class)PKSecureElementPass;
  id v5 = -[PKPass copyWithZone:](&v59, sel_copyWithZone_);
  *((void *)v5 + 77) = self->_cardType;
  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:self->_paymentApplications copyItems:1];
  uint64_t v7 = (void *)*((void *)v5 + 92);
  *((void *)v5 + 92) = v6;

  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:self->_devicePaymentApplications copyItems:1];
  long long v9 = (void *)*((void *)v5 + 93);
  *((void *)v5 + 93) = v8;

  uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:self->_deviceInAppPaymentApplications copyItems:1];
  long long v11 = (void *)*((void *)v5 + 98);
  *((void *)v5 + 98) = v10;

  id v12 = [(PKPaymentApplication *)self->_devicePrimaryPaymentApplication copyWithZone:a3];
  long long v13 = (void *)*((void *)v5 + 94);
  *((void *)v5 + 94) = v12;

  id v14 = [(PKPaymentApplication *)self->_devicePrimaryContactlessPaymentApplication copyWithZone:a3];
  long long v15 = (void *)*((void *)v5 + 95);
  *((void *)v5 + 95) = v14;

  id v16 = [(PKPaymentApplication *)self->_devicePrimaryInAppPaymentApplication copyWithZone:a3];
  objc_super v17 = (void *)*((void *)v5 + 96);
  *((void *)v5 + 96) = v16;

  id v18 = [(PKPaymentApplication *)self->_devicePrimaryBarcodePaymentApplication copyWithZone:a3];
  v19 = (void *)*((void *)v5 + 97);
  *((void *)v5 + 97) = v18;

  uint64_t v20 = [(NSSet *)self->_associatedApplicationIdentifiers copyWithZone:a3];
  v21 = (void *)*((void *)v5 + 78);
  *((void *)v5 + 78) = v20;

  uint64_t v22 = [(NSSet *)self->_associatedWebDomains copyWithZone:a3];
  uint64_t v23 = (void *)*((void *)v5 + 79);
  *((void *)v5 + 79) = v22;

  uint64_t v24 = [(NSString *)self->_primaryAccountIdentifier copyWithZone:a3];
  id v25 = (void *)*((void *)v5 + 75);
  *((void *)v5 + 75) = v24;

  uint64_t v26 = [(NSString *)self->_primaryAccountNumberSuffix copyWithZone:a3];
  uint64_t v27 = (void *)*((void *)v5 + 76);
  *((void *)v5 + 76) = v26;

  uint64_t v28 = [(NSString *)self->_sanitizedPrimaryAccountNumber copyWithZone:a3];
  v29 = (void *)*((void *)v5 + 80);
  *((void *)v5 + 80) = v28;

  uint64_t v30 = [(NSString *)self->_sanitizedPrimaryAccountName copyWithZone:a3];
  id v31 = (void *)*((void *)v5 + 81);
  *((void *)v5 + 81) = v30;

  *((unsigned char *)v5 + 584) = self->_supportsDPANNotifications;
  *((unsigned char *)v5 + 585) = self->_supportsFPANNotifications;
  *((unsigned char *)v5 + 586) = self->_supportsDefaultCardSelection;
  *((unsigned char *)v5 + 590) = self->_shellPass;
  uint64_t v32 = [(NSDate *)self->_originalProvisioningDate copyWithZone:a3];
  v33 = (void *)*((void *)v5 + 88);
  *((void *)v5 + 88) = v32;

  uint64_t v34 = [(PKPassProvisioningMetadata *)self->_provisioningMetadata copy];
  v35 = (void *)*((void *)v5 + 89);
  *((void *)v5 + 89) = v34;

  *((unsigned char *)v5 + 589) = self->_supportsSerialNumberBasedProvisioning;
  *((unsigned char *)v5 + 592) = self->_requiresTransferSerialNumberBasedProvisioning;
  *((void *)v5 + 87) = self->_contactlessActivationGroupingType;
  *((unsigned char *)v5 + 591) = self->_cobranded;
  uint64_t v36 = [(NSString *)self->_cobrandName copyWithZone:a3];
  v37 = (void *)*((void *)v5 + 101);
  *((void *)v5 + 101) = v36;

  uint64_t v38 = [(NSString *)self->_issuerCountryCode copyWithZone:a3];
  v39 = (void *)*((void *)v5 + 84);
  *((void *)v5 + 84) = v38;

  uint64_t v40 = [(NSString *)self->_issuerAdministrativeAreaCode copyWithZone:a3];
  v41 = (void *)*((void *)v5 + 85);
  *((void *)v5 + 85) = v40;

  uint64_t v42 = [(NSString *)self->_identityAccountKeyIdentifier copyWithZone:a3];
  id v43 = (void *)*((void *)v5 + 86);
  *((void *)v5 + 86) = v42;

  *((unsigned char *)v5 + 587) = self->_hasAssociatedPeerPaymentAccount;
  objc_storeStrong((id *)v5 + 82, self->_associatedAccountServiceAccountIdentifier);
  *((void *)v5 + 83) = self->_associatedAccountFeatureIdentifier;
  uint64_t v44 = [(NSString *)self->_topLeftBackgroundTitle copyWithZone:a3];
  v45 = (void *)*((void *)v5 + 90);
  *((void *)v5 + 90) = v44;

  uint64_t v46 = [(NSString *)self->_topRightBackgroundTitle copyWithZone:a3];
  uint64_t v47 = (void *)*((void *)v5 + 91);
  *((void *)v5 + 91) = v46;

  uint64_t v48 = [(NSString *)self->_transactionSourceIdentifier copyWithZone:a3];
  int v49 = (void *)*((void *)v5 + 100);
  *((void *)v5 + 100) = v48;

  uint64_t v50 = [(NSString *)self->_partnerAccountIdentifier copyWithZone:a3];
  long long v51 = (void *)*((void *)v5 + 99);
  *((void *)v5 + 99) = v50;

  uint64_t v52 = [(NSString *)self->_shippingAddressSeed copyWithZone:a3];
  long long v53 = (void *)*((void *)v5 + 111);
  *((void *)v5 + 111) = v52;

  uint64_t v54 = [(NSString *)self->_speakableMake copyWithZone:a3];
  id v55 = (void *)*((void *)v5 + 112);
  *((void *)v5 + 112) = v54;

  uint64_t v56 = [(NSString *)self->_speakableModel copyWithZone:a3];
  uint64_t v57 = (void *)*((void *)v5 + 113);
  *((void *)v5 + 113) = v56;

  return v5;
}

- (BOOL)isEqualToPassIncludingMetadata:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKSecureElementPass;
  if ([(PKPass *)&v10 isEqualToPassIncludingMetadata:v4])
  {
    id v5 = [(PKPass *)self paymentPass];
    uint64_t v6 = [v5 associatedAccountFeatureIdentifier];
    uint64_t v7 = [v4 paymentPass];
    BOOL v8 = v6 == [v7 associatedAccountFeatureIdentifier];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)primaryPaymentApplicationForSecureElementIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  objc_super v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__22;
  long long v13 = __Block_byref_object_dispose__22;
  id v14 = 0;
  paymentApplications = self->_paymentApplications;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__PKSecureElementPass_primaryPaymentApplicationForSecureElementIdentifiers___block_invoke;
  v8[3] = &unk_1E56E3250;
  v8[4] = &v9;
  EnumerateApplicationsForSEIDs(paymentApplications, v4, v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __76__PKSecureElementPass_primaryPaymentApplicationForSecureElementIdentifiers___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (([v6 isAuxiliary] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)paymentApplicationsForSecureElementIdentifiers:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  paymentApplications = self->_paymentApplications;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__PKSecureElementPass_paymentApplicationsForSecureElementIdentifiers___block_invoke;
  v11[3] = &unk_1E56E3278;
  id v12 = v6;
  id v8 = v6;
  EnumerateApplicationsForSEIDs(paymentApplications, v5, v11);

  uint64_t v9 = (void *)[v8 copy];
  return v9;
}

uint64_t __70__PKSecureElementPass_paymentApplicationsForSecureElementIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)paymentApplicationForAID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__22;
  id v16 = __Block_byref_object_dispose__22;
  id v17 = 0;
  paymentApplications = self->_paymentApplications;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__PKSecureElementPass_paymentApplicationForAID___block_invoke;
  v9[3] = &unk_1E56E32C0;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(NSSet *)paymentApplications enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__PKSecureElementPass_paymentApplicationForAID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 applicationIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)devicePaymentApplicationForAID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__22;
  id v16 = __Block_byref_object_dispose__22;
  id v17 = 0;
  id v5 = [(PKSecureElementPass *)self devicePaymentApplications];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__PKSecureElementPass_devicePaymentApplicationForAID___block_invoke;
  v9[3] = &unk_1E56E32C0;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __54__PKSecureElementPass_devicePaymentApplicationForAID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 applicationIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (BOOL)isDevicePrimaryPaymentApplicationPersonalized
{
  v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  uint64_t v3 = [v2 state];
  BOOL v5 = v3 == 1 || v3 == 15;

  return v5;
}

- (BOOL)isPrivateLabel
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_paymentApplications;
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
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "paymentNetworkIdentifier", (void)v7) == 100)
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

- (BOOL)isPrecursorPass:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = [(PKSecureElementPass *)self upgradeRequests];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 type] == 2)
        {
          long long v10 = [v9 secureElementIdentifier];
          if (!v10 || ([v4 containsObject:v10] & 1) != 0)
          {

            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v6;
}

- (BOOL)isSuicaPass
{
  v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  BOOL v3 = [v2 paymentNetworkIdentifier] == 103;

  return v3;
}

- (BOOL)hasLegacyBalanceModel
{
  v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  uint64_t v3 = [v2 paymentNetworkIdentifier];

  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EE22BB40, &unk_1EE22BB58, &unk_1EE22BB70, &unk_1EE22BB88, &unk_1EE22BBA0, &unk_1EE22BBB8, 0);
  BOOL v5 = [NSNumber numberWithInteger:v3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (BOOL)isPrepaidPass
{
  v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  BOOL v3 = [v2 paymentType] == 3;

  return v3;
}

- (BOOL)isStoredValuePass
{
  if ([(PKSecureElementPass *)self isTransitPass]) {
    return 1;
  }
  return [(PKSecureElementPass *)self isEMoneyPass];
}

- (BOOL)isChinaTransitCredential
{
  BOOL v3 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  uint64_t v4 = [v3 paymentNetworkIdentifier];

  if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 0x6C) {
    return 0;
  }
  return [(PKSecureElementPass *)self isTransitPass];
}

- (BOOL)needsHardcodedReminderOptions
{
  if ([(PKSecureElementPass *)self isSuicaPass]) {
    return 1;
  }
  return [(PKSecureElementPass *)self isChinaTransitCredential];
}

- (BOOL)isOctopusPass
{
  v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  BOOL v3 = [v2 appletDataFormat];
  uint64_t v4 = v3;
  if (v3 && @"transit.apple.octopus") {
    char v5 = [(__CFString *)v3 isEqual:@"transit.apple.octopus"];
  }
  else {
    char v5 = v3 == @"transit.apple.octopus";
  }

  return v5;
}

- (BOOL)isHybridIdentityPass
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(PKSecureElementPass *)self paymentApplications];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    char v4 = 0;
    char v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) paymentType];
        v4 |= v8 != 1002;
        v5 |= v8 == 1002;
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
    LOBYTE(v3) = v5 & v4;
  }

  return v3 & 1;
}

- (BOOL)isPayLaterPass
{
  return self->_associatedAccountFeatureIdentifier == 3;
}

- (BOOL)hasImmediateAutomaticSelectionCriterion
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v2 = [(PKSecureElementPass *)self devicePaymentApplications];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v8 = objc_msgSend(v7, "automaticSelectionCriteria", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v16;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              if ([*(id *)(*((void *)&v15 + 1) + 8 * j) technologyType] == 7)
              {

                BOOL v13 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
      BOOL v13 = 0;
    }
    while (v4);
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_19:

  return v13;
}

- (BOOL)hasCredentials
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_paymentApplications;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "subcredentials", (void)v9);
        uint64_t v7 = [v6 count];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isAutoTopEnabled
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [(PKPass *)self autoTopUpFields];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = [v7 key];
        char v9 = [v8 isEqualToString:@"auto_top_up_field_value"];

        if (v9)
        {
          [v7 threshold];
          double v12 = v11;
          [v7 amount];
          BOOL v10 = v13 != 0.0 || v12 != 0.0;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)hasMerchantTokens
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (PKMerchantTokensDemoModeEnabled())
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v4 = [(PKSecureElementPass *)self paymentApplications];
    uint64_t v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v8 + 1) + 8 * i) hasMerchantTokens])
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

- (BOOL)hadMerchantTokens
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (PKMerchantTokensDemoModeEnabled())
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v4 = [(PKSecureElementPass *)self paymentApplications];
    uint64_t v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v8 + 1) + 8 * i) hadMerchantTokens])
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

- (BOOL)isCarKeyPass
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(PKSecureElementPass *)self devicePaymentApplications];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) paymentNetworkIdentifier] == 301;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

- (BOOL)isHomeKeyPass
{
  v2 = [(PKSecureElementPass *)self devicePaymentApplications];
  char v3 = objc_msgSend(v2, "pk_hasObjectPassingTest:", &__block_literal_global_68);

  return v3;
}

BOOL __36__PKSecureElementPass_isHomeKeyPass__block_invoke(uint64_t a1, void *a2)
{
  return [a2 paymentNetworkIdentifier] == 133;
}

- (BOOL)areCredentialsStoredInKML
{
  BOOL v3 = [(PKSecureElementPass *)self hasCredentials];
  if (v3) {
    LOBYTE(v3) = ![(PKSecureElementPass *)self isIdentityPass];
  }
  return v3;
}

- (NSString)devicePassIdentifier
{
  v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  BOOL v3 = [v2 subcredentials];
  uint64_t v4 = [v3 anyObject];
  char v5 = [v4 identifier];

  return (NSString *)v5;
}

- (NSString)pairedTerminalIdentifier
{
  v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  BOOL v3 = [v2 subcredentials];
  uint64_t v4 = [v3 anyObject];
  char v5 = [v4 pairedReaderIdentifier];

  return (NSString *)v5;
}

- (BOOL)requiresFelicaSecureElement
{
  v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  BOOL v3 = [v2 appletDataFormat];

  if (v3 && @"transit.felica.suica")
  {
    if ([(__CFString *)v3 isEqual:@"transit.felica.suica"])
    {
LABEL_4:
      char v4 = 1;
      goto LABEL_10;
    }
  }
  else if (v3 == @"transit.felica.suica")
  {
    goto LABEL_4;
  }
  if (v3 && @"transit.apple.octopus") {
    char v4 = [(__CFString *)v3 isEqual:@"transit.apple.octopus"];
  }
  else {
    char v4 = v3 == @"transit.apple.octopus";
  }
LABEL_10:

  return v4;
}

- (BOOL)shouldIgnoreTransactionUpdatesSwitch
{
  if ([(PKSecureElementPass *)self isTransitPass]) {
    return 1;
  }
  return [(PKSecureElementPass *)self supportsBarcodePayment];
}

- (BOOL)availableForAutomaticPresentationUsingVASContext
{
  if (![(PKSecureElementPass *)self isPrivateLabel]
    && ![(PKSecureElementPass *)self isCobranded])
  {
    return 0;
  }
  BOOL v3 = [(PKPass *)self associatedPassTypeIdentifiers];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)availableForAutomaticPresentationUsingBeaconContext
{
  if ([(PKSecureElementPass *)self isPrivateLabel]
    || (BOOL v3 = [(PKSecureElementPass *)self isCobranded]))
  {
    v5.receiver = self;
    v5.super_class = (Class)PKSecureElementPass;
    LOBYTE(v3) = [(PKPass *)&v5 availableForAutomaticPresentationUsingBeaconContext];
  }
  return v3;
}

- (BOOL)availableForAutomaticPresentationUsingInAppOrWebContext
{
  if (![(PKSecureElementPass *)self isPrivateLabel]
    && ![(PKSecureElementPass *)self isCobranded])
  {
    return 0;
  }
  BOOL v3 = [(PKSecureElementPass *)self associatedWebDomains];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    objc_super v5 = [(PKSecureElementPass *)self associatedApplicationIdentifiers];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (NSString)deviceAccountIdentifier
{
  v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  BOOL v3 = [v2 dpanIdentifier];

  return (NSString *)v3;
}

- (NSString)deviceAccountNumberSuffix
{
  v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  BOOL v3 = [v2 dpanSuffix];

  return (NSString *)v3;
}

- (id)sanitizedDeviceAccountNumber
{
  v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  BOOL v3 = [v2 sanitizedDPAN];

  return v3;
}

- (PKPaymentApplication)devicePrimaryContactlessPaymentApplication
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_devicePaymentApplications)
  {
    BOOL v3 = NSString;
    BOOL v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    BOOL v6 = [(PKObject *)self initializedViaInitWithCoder];
    uint64_t v7 = @"was not";
    if (v6) {
      uint64_t v7 = @"was";
    }
    long long v8 = [v3 stringWithFormat:@"updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePrimaryContactlessPaymentApplication. (%@ %@ initialized via initWithCoder:)", v5, v7];

    long long v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }
  }
  devicePrimaryContactlessPaymentApplication = self->_devicePrimaryContactlessPaymentApplication;
  return devicePrimaryContactlessPaymentApplication;
}

- (PKPaymentApplication)devicePrimaryInAppPaymentApplication
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_devicePaymentApplications)
  {
    BOOL v3 = NSString;
    BOOL v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    BOOL v6 = [(PKObject *)self initializedViaInitWithCoder];
    uint64_t v7 = @"was not";
    if (v6) {
      uint64_t v7 = @"was";
    }
    long long v8 = [v3 stringWithFormat:@"updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePrimaryInAppPaymentApplication. (%@ %@ initialized via initWithCoder:)", v5, v7];

    long long v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }
  }
  devicePrimaryInAppPaymentApplication = self->_devicePrimaryInAppPaymentApplication;
  return devicePrimaryInAppPaymentApplication;
}

- (PKPaymentApplication)devicePrimaryBarcodePaymentApplication
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_devicePaymentApplications)
  {
    BOOL v3 = NSString;
    BOOL v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    BOOL v6 = [(PKObject *)self initializedViaInitWithCoder];
    uint64_t v7 = @"was not";
    if (v6) {
      uint64_t v7 = @"was";
    }
    long long v8 = [v3 stringWithFormat:@"updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePrimaryInAppPaymentApplication. (%@ %@ initialized via initWithCoder:)", v5, v7];

    long long v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }
  }
  devicePrimaryBarcodePaymentApplication = self->_devicePrimaryBarcodePaymentApplication;
  return devicePrimaryBarcodePaymentApplication;
}

- (NSSet)deviceInAppPaymentApplications
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_devicePaymentApplications)
  {
    BOOL v3 = NSString;
    BOOL v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    BOOL v6 = [(PKObject *)self initializedViaInitWithCoder];
    uint64_t v7 = @"was not";
    if (v6) {
      uint64_t v7 = @"was";
    }
    long long v8 = [v3 stringWithFormat:@"updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePrimaryInAppPaymentApplication. (%@ %@ initialized via initWithCoder:)", v5, v7];

    long long v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Error: %@. Returning nil.", buf, 0xCu);
    }
  }
  deviceInAppPaymentApplications = self->_deviceInAppPaymentApplications;
  return deviceInAppPaymentApplications;
}

- (id)deviceContactlessPaymentApplications
{
  v2 = [(PKSecureElementPass *)self devicePaymentApplications];
  BOOL v3 = [v2 objectsPassingTest:&__block_literal_global_101];

  return v3;
}

uint64_t __59__PKSecureElementPass_deviceContactlessPaymentApplications__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  if (v3 == 15 || v3 == 1) {
    uint64_t v5 = [v2 supportsContactlessPayment];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasContactlessDevicePaymentApplicationsAvailable
{
  id v2 = [(PKSecureElementPass *)self deviceContactlessPaymentApplications];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

uint64_t __83__PKSecureElementPass_updateDevicePaymentApplicationsWithSecureElementIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 supportsContactlessPayment];
}

- (void)sanitizePaymentApplications
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  BOOL v4 = self->_paymentApplications;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v27 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v9 = self->_devicePaymentApplications;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [v3 addObject:*(void *)(*((void *)&v23 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "setSecureElementIdentifier:", 0, (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v16);
  }
}

- (BOOL)supportsWebPaymentMode:(int64_t)a3 withExclusionList:(id)a4
{
  return [(PKSecureElementPass *)self supportsWebPaymentMode:a3 withExclusionList:a4 clientOSVersion:0];
}

- (BOOL)supportsWebPaymentMode:(int64_t)a3 withExclusionList:(id)a4 clientOSVersion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v9 = self->_deviceInAppPaymentApplications;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "supportsWebPaymentMode:withExclusionList:clientOSVersion:", 2, v7, v8, (void)v14))
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (NSString)cobrandName
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  id v3 = [v2 cobrandName];

  return (NSString *)v3;
}

- (NSString)shippingAddressSeed
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  id v3 = [v2 shippingAddressSeed];

  return (NSString *)v3;
}

- (NSString)speakableMake
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  id v3 = [v2 speakableMake];

  return (NSString *)v3;
}

- (NSString)speakableModel
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  id v3 = [v2 speakableModel];

  return (NSString *)v3;
}

- (PKSiriIntentsConfiguration)supportedSiriIntents
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  id v3 = [v2 supportedSiriIntents];

  return (PKSiriIntentsConfiguration *)v3;
}

- (NSURL)transactionServiceURL
{
  id v3 = [(PKSecureElementPass *)self _transactionServiceURLOverride];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(PKObject *)self contentLoadedIfNeeded];
    id v5 = [v6 transactionServiceURL];
  }
  return (NSURL *)v5;
}

- (NSURL)transactionServiceRegistrationURL
{
  id v3 = [(PKSecureElementPass *)self _transactionServiceURLOverride];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(PKObject *)self contentLoadedIfNeeded];
    id v5 = [v6 transactionServiceRegistrationURL];
  }
  return (NSURL *)v5;
}

- (NSString)transactionPushTopic
{
  id v3 = [(PKObject *)self uniqueID];
  BOOL v4 = PKTransactionServicePushTopicOverrideForPassUniqueIdentifier(v3);

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = [(PKObject *)self contentLoadedIfNeeded];
    id v5 = [v6 transactionPushTopic];
  }
  return (NSString *)v5;
}

- (NSURL)messageServiceURL
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  id v3 = [v2 messageServiceURL];

  return (NSURL *)v3;
}

- (NSURL)messageServiceRegistrationURL
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  id v3 = [v2 messageServiceRegistrationURL];

  return (NSURL *)v3;
}

- (NSString)messagePushTopic
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  id v3 = [v2 messagePushTopic];

  return (NSString *)v3;
}

- (NSString)appURLScheme
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  id v3 = [v2 appURLScheme];

  return (NSString *)v3;
}

- (NSString)localizedSuspendedReason
{
  id v3 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  BOOL v4 = [v3 applicationIdentifier];
  id v5 = [(PKSecureElementPass *)self _localizedSuspendedReasonForAID:v4];

  return (NSString *)v5;
}

- (id)_localizedSuspendedReasonForAID:(id)a3
{
  id v4 = a3;
  id v5 = [(PKObject *)self contentLoadedIfNeeded];
  uint64_t v6 = [v5 localizedSuspendedReasonsByAID];
  id v7 = [v6 objectForKey:v4];

  return v7;
}

- (BOOL)supportsOnlyTransit
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  char v3 = [v2 supportsTransitOnly];

  return v3;
}

- (unint64_t)transitCommutePlanType
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  unint64_t v3 = [v2 transitCommutePlanType];

  return v3;
}

- (id)transitCommutePlans
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  unint64_t v3 = [v2 transitCommutePlans];

  return v3;
}

- (id)notificationCenterTitle
{
  if ([(PKSecureElementPass *)self isStoredValuePass]
    || [(PKSecureElementPass *)self hasAssociatedPeerPaymentAccount]
    || [(PKSecureElementPass *)self associatedAccountFeatureIdentifier] == 4)
  {
    unint64_t v3 = [(PKPass *)self localizedDescription];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKSecureElementPass;
    unint64_t v3 = [(PKPass *)&v5 notificationCenterTitle];
  }
  return v3;
}

- (NSArray)availableActions
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  unint64_t v3 = [v2 availableActions];

  return (NSArray *)v3;
}

- (id)actionLocalizations
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  unint64_t v3 = [v2 actionLocalizations];

  return v3;
}

- (id)actionGroups
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  unint64_t v3 = [v2 actionGroups];

  return v3;
}

- (NSArray)upgradeRequests
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  unint64_t v3 = [v2 upgradeRequests];

  return (NSArray *)v3;
}

- (id)eligibleExpressUpgradeRequestsForDeviceClass:(id)a3 deviceSEIDs:(id)a4 deviceVersion:(id)a5 technologyTest:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (unsigned int (**)(void, uint64_t))a6;
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  int v49 = self;
  long long v14 = [(PKSecureElementPass *)self upgradeRequests];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v62;
    id v47 = v11;
    id v48 = v10;
    v45 = v13;
    id v46 = v12;
    uint64_t v43 = *(void *)v62;
    uint64_t v44 = v14;
    do
    {
      uint64_t v18 = 0;
      uint64_t v50 = v16;
      do
      {
        if (*(void *)v62 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v61 + 1) + 8 * v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v52 = [v19 osVersionRange];
          if ((!v52 || [v52 versionMeetsRequirements:v12 deviceClass:v10])
            && [v19 type] == 1)
          {
            long long v51 = [v19 secureElementIdentifier];
            if (objc_msgSend(v11, "containsObject:"))
            {
              long long v20 = [v19 paymentApplicationIdentifiers];
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              long long v21 = [(PKSecureElementPass *)v49 devicePaymentApplications];
              uint64_t v22 = [v21 countByEnumeratingWithState:&v57 objects:v68 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = 0;
                uint64_t v25 = *(void *)v58;
                do
                {
                  for (uint64_t i = 0; i != v23; ++i)
                  {
                    if (*(void *)v58 != v25) {
                      objc_enumerationMutation(v21);
                    }
                    long long v27 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                    long long v28 = [v27 applicationIdentifier];
                    if ([v20 containsObject:v28])
                    {
                      uint64_t v29 = [v27 state];
                      if ((unint64_t)(v29 - 1) > 0xE) {
                        uint64_t v30 = 0;
                      }
                      else {
                        uint64_t v30 = qword_1916749B8[v29 - 1];
                      }

                      v24 += v30;
                    }
                    else
                    {
                    }
                  }
                  id v31 = v19;
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v57 objects:v68 count:16];
                }
                while (v23);
              }
              else
              {
                id v31 = v19;
                uint64_t v24 = 0;
              }

              uint64_t v13 = v45;
              if (v24 == [v20 count])
              {
                long long v55 = 0u;
                long long v56 = 0u;
                long long v53 = 0u;
                long long v54 = 0u;
                uint64_t v32 = [v31 technologyTypes];
                uint64_t v33 = [v32 countByEnumeratingWithState:&v53 objects:v65 count:16];
                id v11 = v47;
                long long v14 = v44;
                if (v33)
                {
                  uint64_t v34 = v33;
                  uint64_t v35 = *(void *)v54;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v34; ++j)
                    {
                      if (*(void *)v54 != v35) {
                        objc_enumerationMutation(v32);
                      }
                      uint64_t v37 = PKPassAutomaticSelectionTechnologyTypeFromType(*(void **)(*((void *)&v53 + 1) + 8 * j));
                      if (!v45[2](v45, v37))
                      {

                        goto LABEL_40;
                      }
                    }
                    uint64_t v34 = [v32 countByEnumeratingWithState:&v53 objects:v65 count:16];
                    if (v34) {
                      continue;
                    }
                    break;
                  }
                }

                [v42 addObject:v19];
LABEL_40:
                id v10 = v48;
                id v12 = v46;
              }
              else
              {
                uint64_t v38 = PKLogFacilityTypeGetObject(6uLL);
                id v11 = v47;
                id v10 = v48;
                id v12 = v46;
                long long v14 = v44;
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v67 = v20;
                  _os_log_impl(&dword_190E10000, v38, OS_LOG_TYPE_DEFAULT, "Discarding upgrade request. One or more invalid payment applications: %@", buf, 0xCu);
                }
              }
              uint64_t v17 = v43;
              uint64_t v16 = v50;
            }
          }
        }
        ++v18;
      }
      while (v18 != v16);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v16);
  }

  if ([v42 count]) {
    v39 = v42;
  }
  else {
    v39 = 0;
  }
  id v40 = v39;

  return v40;
}

- (id)precursorUpgradeRequestsForDeviceSEIDs:(id)a3 deviceClass:(id)a4 deviceVersion:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v28 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = [(PKSecureElementPass *)self upgradeRequests];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v30;
    *(void *)&long long v13 = 138412290;
    long long v25 = v13;
    id v26 = v8;
    id v27 = v10;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v17, "type", v25) == 2)
        {
          id v18 = v17;
          uint64_t v19 = [v18 secureElementIdentifier];
          if ([v8 containsObject:v19])
          {
            long long v20 = [v18 osVersionRange];
            long long v21 = v20;
            if (v20 && ([v20 versionMeetsRequirements:v9 deviceClass:v28] & 1) == 0)
            {
              uint64_t v22 = PKLogFacilityTypeGetObject(0x26uLL);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v25;
                id v34 = v18;
                _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Precursor request does not meet os version requirements: %@", buf, 0xCu);
              }

              id v8 = v26;
              id v10 = v27;
            }
            else
            {
              [v10 addObject:v18];
            }
          }
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v14);
  }

  if ([v10 count]) {
    id v23 = v10;
  }
  else {
    id v23 = 0;
  }

  return v23;
}

- (int64_t)identityType
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 identityType];

  return v3;
}

- (int64_t)accessType
{
  if ([(PKSecureElementPass *)self isCarKeyPass]) {
    return 4;
  }
  id v4 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v5 = [v4 accessType];

  return v5;
}

- (int64_t)paymentType
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 paymentType];

  return v3;
}

- (unint64_t)supportedRadioTechnologies
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(PKSecureElementPass *)self paymentApplications];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) supportedRadioTechnologies];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (PKPassAuxiliaryRegistrationRequirements)auxiliaryRegistrationRequirements
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  uint64_t v3 = [v2 auxiliaryRegistrationRequirements];

  return (PKPassAuxiliaryRegistrationRequirements *)v3;
}

- (id)longTermPrivacyKeyGroupIdentifier
{
  id v2 = [(PKObject *)self contentLoadedIfNeeded];
  uint64_t v3 = [v2 auxiliaryRegistrationRequirements];
  uint64_t v4 = [v3 deviceDecryptionRequirements];
  unint64_t v5 = objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_118);

  uint64_t v6 = [v5 groupIdentifier];

  return v6;
}

BOOL __56__PKSecureElementPass_longTermPrivacyKeyGroupIdentifier__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

- (PKTransitPassProperties)transitProperties
{
  id v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  uint64_t v3 = [v2 transitProperties];

  return (PKTransitPassProperties *)v3;
}

- (id)addValueURL
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(PKSecureElementPass *)self availableActions];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      if ([v8 type] == 1) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = v8;

    uint64_t v13 = 0;
    if (v9
      && ([(PKSecureElementPass *)self canPerformAction:v9 unableReason:&v13 displayableError:0]|| v13 == 7|| v13 == 2))
    {
      long long v10 = [(PKSecureElementPass *)self _launchURLForPassAction:v9];
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:

    id v9 = 0;
  }
  long long v10 = 0;
LABEL_16:
  id v11 = v10;

  return v11;
}

- (id)_launchURLForPassAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKObject *)self uniqueID];
  if (v5
    && ![(PKPass *)self isRemotePass]
    && (+[PKStoredValuePassProperties passPropertiesForPass:self], uint64_t v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v7 setScheme:@"shoebox"];
    [v7 setHost:@"card"];
    id v8 = PKPaymentPassActionTypeToString([v4 type]);
    id v9 = [NSString stringWithFormat:@"/%@/%@", v5, v8];
    [v7 setPath:v9];

    long long v10 = [v7 URL];
    id v11 = (void *)[v10 copy];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)shouldSuppressNoChargeAmount
{
  id v2 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
  uint64_t v3 = [v2 paymentNetworkIdentifier];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 108;
}

- (BOOL)isContactlessPaymentSupportedForTransitNetworks:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(PKSecureElementPass *)self deviceContactlessPaymentApplications];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__PKSecureElementPass_isContactlessPaymentSupportedForTransitNetworks___block_invoke;
  v8[3] = &unk_1E56E32C0;
  id v6 = v4;
  id v9 = v6;
  long long v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __71__PKSecureElementPass_isContactlessPaymentSupportedForTransitNetworks___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 supportedTransitNetworkIdentifiers];
  if (![v6 count])
  {
    uint64_t v7 = PKLegacyTransitNetworkIdentifierForCredentialType([v5 paymentNetworkIdentifier]);
    id v8 = (void *)v7;
    if (v7)
    {
      v20[0] = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

      id v6 = (void *)v9;
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          *a3 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (id)deviceTransactionSourceIdentifiers
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_devicePaymentApplications)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = self->_devicePaymentApplications;
    uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) transactionSourceIdentifier];
          if (v9) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    id v10 = [(PKSecureElementPass *)self transactionSourceIdentifier];
    if (v10) {
      [v3 addObject:v10];
    }
    uint64_t v11 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v12 = NSString;
    uint64_t v13 = (objc_class *)objc_opt_class();
    char v14 = NSStringFromClass(v13);
    BOOL v15 = [(PKObject *)self initializedViaInitWithCoder];
    long long v16 = @"was not";
    if (v15) {
      long long v16 = @"was";
    }
    id v3 = [v12 stringWithFormat:@"updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePaymentApplications. (%@ %@ initialized via initWithCoder:)", v14, v16];

    id v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v3;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)hasDeviceTransactionSourceIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_devicePaymentApplications)
  {
    uint64_t v9 = NSString;
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    BOOL v12 = [(PKObject *)self initializedViaInitWithCoder];
    uint64_t v13 = @"was not";
    if (v12) {
      uint64_t v13 = @"was";
    }
    char v14 = [v9 stringWithFormat:@"updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePaymentApplications. (%@ %@ initialized via initWithCoder:)", v11, v13];

    BOOL v15 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v14;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning NO.", buf, 0xCu);
    }

    BOOL v16 = 0;
    goto LABEL_32;
  }
  id v5 = [(PKSecureElementPass *)self transactionSourceIdentifier];
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {

    goto LABEL_13;
  }
  if (v6 && v5)
  {
    char v8 = [v5 isEqualToString:v6];

    if ((v8 & 1) == 0) {
      goto LABEL_15;
    }
LABEL_13:
    BOOL v16 = 1;
    goto LABEL_32;
  }

LABEL_15:
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v17 = self->_devicePaymentApplications;
  uint64_t v18 = [(NSSet *)v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v27 + 1) + 8 * i) transactionSourceIdentifier];
        id v23 = v7;
        id v24 = v23;
        if (v22 == v23)
        {

LABEL_30:
          BOOL v16 = 1;
          goto LABEL_31;
        }
        if (v7 && v22)
        {
          char v25 = [v22 isEqualToString:v23];

          if (v25) {
            goto LABEL_30;
          }
        }
        else
        {
        }
      }
      uint64_t v19 = [(NSSet *)v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_31:

LABEL_32:
  return v16;
}

- (id)_transactionServiceURLOverride
{
  id v2 = [(PKObject *)self uniqueID];
  id v3 = PKTransactionServiceURLOverrideForPassUniqueIdentifier(v2);

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_passSubcredentialFilesWithPrefix:(id)a3 extension:(id)a4 forSecureElementIdentifiers:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v30 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = self;
  id v24 = v8;
  obuint64_t j = [(PKSecureElementPass *)self paymentApplicationsForSecureElementIdentifiers:v8];
  uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v11;
        BOOL v12 = *(void **)(*((void *)&v36 + 1) + 8 * v11);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v29 = [v12 subcredentials];
        uint64_t v13 = [v29 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v33 != v15) {
                objc_enumerationMutation(v29);
              }
              long long v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              uint64_t v18 = [v17 identifier];
              uint64_t v19 = [v31 stringByAppendingString:v18];
              uint64_t v20 = [(PKObject *)v10 dataAccessor];
              long long v21 = [v20 dataForBundleResourceNamed:v19 withExtension:v30];

              if (v9) {
                [v9 setObject:v21 forKey:v17];
              }
            }
            uint64_t v14 = [v29 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v14);
        }

        uint64_t v11 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v27);
  }

  id v22 = (void *)[v9 copy];
  return v22;
}

- (id)iso18013BlobsForSecureElementIdentifiers:(id)a3
{
  return [(PKSecureElementPass *)self _passSubcredentialFilesWithPrefix:@"ISO18013-" extension:&stru_1EE0F5368 forSecureElementIdentifiers:a3];
}

- (id)iso18013BlobsMetdataForSecureElementIdentifiers:(id)a3
{
  return [(PKSecureElementPass *)self _passSubcredentialFilesWithPrefix:@"ISO18013Metadata-" extension:@"json" forSecureElementIdentifiers:a3];
}

- (id)seBlobsForSecureElementIdentifiers:(id)a3
{
  return [(PKSecureElementPass *)self _passSubcredentialFilesWithPrefix:@"TerminalUpdateReaderData-" extension:&stru_1EE0F5368 forSecureElementIdentifiers:a3];
}

- (id)subcredentialConfigurationForSecureElementIdentifiers:(id)a3
{
  return [(PKSecureElementPass *)self _passSubcredentialFilesWithPrefix:@"carKeyCredentialConfiguration-" extension:@"json" forSecureElementIdentifiers:a3];
}

- (BOOL)preventsWalletDeletion
{
  PKSecureElementPassActivationState v3 = [(PKSecureElementPass *)self passActivationState];
  if ([(PKSecureElementPass *)self hasAssociatedPeerPaymentAccount]) {
    return (v3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  else {
    return [(PKSecureElementPass *)self accessType] != 3;
  }
}

- (BOOL)isUserDeletable
{
  return ![(PKSecureElementPass *)self isHomeKeyPass];
}

- (BOOL)supportsVirtualCardNumber
{
  PKSecureElementPassActivationState v3 = +[PKPaymentWebService sharedService];
  LOBYTE(self) = [(PKSecureElementPass *)self supportsVirtualCardNumberAccordingToWebService:v3];

  return (char)self;
}

- (BOOL)supportsVirtualCardNumberAccordingToWebService:(id)a3
{
  id v4 = a3;
  if ([(PKSecureElementPass *)self passActivationState])
  {
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = 0;
      id v6 = "Not offering VPAN (pass not activated)";
      uint64_t v7 = (uint8_t *)&v20;
LABEL_11:
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  char v8 = _os_feature_enabled_impl();
  unint64_t associatedAccountFeatureIdentifier = self->_associatedAccountFeatureIdentifier;
  if (associatedAccountFeatureIdentifier == 1) {
    char v10 = v8;
  }
  else {
    char v10 = 0;
  }
  if (!associatedAccountFeatureIdentifier || (v10 & 1) != 0)
  {
    id v5 = [(PKSecureElementPass *)self devicePrimaryPaymentApplication];
    if (v5)
    {
      uint64_t v13 = +[PKWebServiceVirtualCardFeature virtualCardFeatureWithWebService:v4];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = [v4 targetDevice];
        char v11 = [v14 doesPaymentApplication:v5 supportVPANOnDevice:v15 associatedAccountFeatureIdentifier:self->_associatedAccountFeatureIdentifier];

LABEL_23:
        goto LABEL_13;
      }
      BOOL v16 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v17 = 0;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Not offering VPAN (not enabled)", v17, 2u);
      }

      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Not offering VPAN (no payment application)", v18, 2u);
      }
    }
    char v11 = 0;
    goto LABEL_23;
  }
  id v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v6 = "Not offering VPAN (unsupported feature)";
    uint64_t v7 = buf;
    goto LABEL_11;
  }
LABEL_12:
  char v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)hasActiveVirtualCard
{
  PKSecureElementPassActivationState v3 = +[PKPaymentWebService sharedService];
  LOBYTE(self) = [(PKSecureElementPass *)self hasActiveVirtualCardAccordingToWebService:v3];

  return (char)self;
}

- (BOOL)hasActiveVirtualCardAccordingToWebService:(id)a3
{
  id v4 = a3;
  if ([(PKSecureElementPass *)self passActivationState])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = +[PKVirtualCard cardsForPaymentPass:self accordingToWebService:v4];
    BOOL v5 = [v6 count] != 0;
  }
  return v5;
}

- (id)virtualCardSuffix
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(PKSecureElementPass *)self paymentApplications];
  PKSecureElementPassActivationState v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v7 = [v6 virtualCardSuffix];

        if (v7)
        {
          PKSecureElementPassActivationState v3 = [v6 virtualCardSuffix];
          goto LABEL_11;
        }
      }
      PKSecureElementPassActivationState v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

uint64_t __66__PKSecureElementPass_supportsDeviceAssessmentAccordingToService___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsDeviceAssessmentAccordingToService:*(void *)(a1 + 32)];
}

- (BOOL)shouldDisplayDeviceAssessmentEducationAccordingToService:(id)a3
{
  id v4 = a3;
  BOOL v5 = !PKHasSeenDeviceAssessmentEducation()
    && [(PKSecureElementPass *)self supportsDeviceAssessmentAccordingToService:v4];

  return v5;
}

- (BOOL)supportsFeatureForCurrentDevice:(unint64_t)a3
{
  if ([(PKPaymentApplication *)self->_devicePrimaryPaymentApplication isShareable]) {
    return 1;
  }
  if ([(PKSecureElementPass *)self isCarKeyPass])
  {
    BOOL v5 = [(PKPaymentApplication *)self->_devicePrimaryPaymentApplication subcredentials];
    id v6 = [v5 anyObject];
    char v7 = [v6 isShareable];

    if (v7) {
      return 1;
    }
  }
  long long v9 = PKDeviceClass();
  long long v10 = +[PKOSVersionRequirement fromDeviceVersion];
  v12.receiver = self;
  v12.super_class = (Class)PKSecureElementPass;
  BOOL v8 = [(PKPass *)&v12 supportsFeature:a3 forDevice:v9 version:v10];

  return v8;
}

- (BOOL)isAutoTopUpBalance:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 identifiers];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v5 = [(PKPass *)self autoTopUpFields];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v11 = [v10 key];
        if ([v11 isEqualToString:@"auto_top_up_field_value"])
        {
          objc_super v12 = [v10 foreignReferenceIdentifiers];
          char v13 = [v12 intersectsSet:v4];

          if (v13)
          {
            BOOL v14 = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (id)autoTopUpBalanceIdentifiers
{
  id v2 = self;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  PKSecureElementPassActivationState v3 = [(PKPass *)self balanceFields];
  uint64_t v19 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v4 = *(void *)v26;
    __int16 v20 = v3;
    uint64_t v17 = *(void *)v26;
    long long v18 = v2;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(v3);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v5), "foreignReferenceIdentifiers", v17, v18);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v7 = [(PKPass *)v2 autoTopUpFields];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              objc_super v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              char v13 = [v12 key];
              if ([v13 isEqualToString:@"auto_top_up_field_value"])
              {
                BOOL v14 = [v12 foreignReferenceIdentifiers];
                char v15 = [v14 intersectsSet:v6];

                if (v15)
                {

                  PKSecureElementPassActivationState v3 = v20;
                  goto LABEL_21;
                }
              }
              else
              {
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v9);
        }

        ++v5;
        PKSecureElementPassActivationState v3 = v20;
        uint64_t v4 = v17;
        id v2 = v18;
      }
      while (v5 != v19);
      uint64_t v6 = 0;
      uint64_t v19 = [v20 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_21:

  return v6;
}

- (id)autoTopUpMerchantTokenIdentifier
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(PKPass *)self balances];
  PKSecureElementPassActivationState v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v8 + 1) + 8 * i) paymentMethod];
        if (![v6 type])
        {
          PKSecureElementPassActivationState v3 = [v6 merchantTokenIdentifier];

          goto LABEL_11;
        }
      }
      PKSecureElementPassActivationState v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isPaymentOptionSelectable
{
  return self->_contactlessActivationGroupingType == 2;
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (NSSet)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (NSSet)associatedWebDomains
{
  return self->_associatedWebDomains;
}

- (NSString)sanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber;
}

- (BOOL)supportsDPANNotifications
{
  return self->_supportsDPANNotifications;
}

- (BOOL)supportsFPANNotifications
{
  return self->_supportsFPANNotifications;
}

- (BOOL)supportsDefaultCardSelection
{
  return self->_supportsDefaultCardSelection;
}

- (BOOL)supportsPeerPayment
{
  return self->_supportsPeerPayment;
}

- (void)setSupportsPeerPayment:(BOOL)a3
{
  self->_supportsPeerPayment = a3;
}

- (NSString)issuerCountryCode
{
  return self->_issuerCountryCode;
}

- (NSString)issuerAdministrativeAreaCode
{
  return self->_issuerAdministrativeAreaCode;
}

- (NSString)identityAccountKeyIdentifier
{
  return self->_identityAccountKeyIdentifier;
}

- (BOOL)supportsSerialNumberBasedProvisioning
{
  return self->_supportsSerialNumberBasedProvisioning;
}

- (BOOL)isShellPass
{
  return self->_shellPass;
}

- (NSDate)originalProvisioningDate
{
  return self->_originalProvisioningDate;
}

- (PKPassProvisioningMetadata)provisioningMetadata
{
  return self->_provisioningMetadata;
}

- (NSString)topLeftBackgroundTitle
{
  return self->_topLeftBackgroundTitle;
}

- (NSString)topRightBackgroundTitle
{
  return self->_topRightBackgroundTitle;
}

- (NSString)partnerAccountIdentifier
{
  return self->_partnerAccountIdentifier;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (BOOL)isCobranded
{
  return self->_cobranded;
}

- (void)setTransactionServiceURL:(id)a3
{
}

- (void)setTransactionServiceRegistrationURL:(id)a3
{
}

- (void)setTransactionPushTopic:(id)a3
{
}

- (void)setMessageServiceURL:(id)a3
{
}

- (void)setMessageServiceRegistrationURL:(id)a3
{
}

- (void)setMessagePushTopic:(id)a3
{
}

- (void)setAppURLScheme:(id)a3
{
}

- (void)setCustomerServiceIdentifier:(id)a3
{
}

- (void)setLocalizedSuspendedReason:(id)a3
{
}

- (void)setSupportedSiriIntents:(id)a3
{
}

- (void)setAuxiliaryRegistrationRequirements:(id)a3
{
}

- (BOOL)requiresTransferSerialNumberBasedProvisioning
{
  return self->_requiresTransferSerialNumberBasedProvisioning;
}

- (void)setAvailableActions:(id)a3
{
}

- (NSArray)deviceUpgradeRequests
{
  return self->_deviceUpgradeRequests;
}

- (BOOL)canPerformAction:(id)a3 unableReason:(unint64_t *)a4 displayableError:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (PKRunningInPassd())
  {
    long long v10 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v27 = (objc_class *)objc_opt_class();
      long long v28 = NSStringFromClass(v27);
      id v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v28;
      __int16 v32 = 2114;
      long long v33 = v29;
      _os_log_error_impl(&dword_190E10000, v10, OS_LOG_TYPE_ERROR, "Calling [%{public}@ %{public}@] is unsupported from passd. Use [PDDatabaseManager canPerformAction:forPassWithUniqueIdentifier:] instead.", buf, 0x16u);
    }
  }
  if ([v9 type] == 2)
  {
    long long v11 = [v9 associatedPlanIdentifier];
    if (v11)
    {
      objc_super v12 = [v9 associatedPlan];

      if (!v12)
      {
        uint64_t v13 = [(PKPass *)self paymentPass];
        BOOL v14 = PKTransitCommutePlanInPassForIdentifier(v13, v11);

        [v9 setAssociatedPlan:v14];
      }
    }
  }
  char v15 = [v9 availableFrom];
  long long v16 = [v9 availableUntil];
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
  if ((unint64_t)PKCurrentPassbookState() > 1)
  {
    LOBYTE(PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType) = 0;
    unint64_t v21 = 6;
    if (a4) {
      goto LABEL_33;
    }
  }
  else
  {
    int64_t v18 = [(PKSecureElementPass *)self effectiveContactlessPaymentApplicationState];
    if (v18 == 15 || v18 == 1)
    {
      uint64_t v19 = [v9 unavailableActionReason];

      BOOL v20 = v19 == 0;
      if (v19) {
        unint64_t v21 = 7;
      }
      else {
        unint64_t v21 = 0;
      }
      if (!v19)
      {
        if (v15)
        {
          uint64_t v22 = [v17 compare:v15];
          BOOL v20 = v22 != -1;
          if (v22 == -1) {
            unint64_t v21 = 3;
          }
        }
      }
      if (v20 && v16)
      {
        if ([v17 compare:v16] == 1)
        {
          LOBYTE(PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType) = 0;
          unint64_t v21 = 4;
          if (!a4) {
            goto LABEL_34;
          }
LABEL_33:
          *a4 = v21;
          goto LABEL_34;
        }
        goto LABEL_30;
      }
      if (v20)
      {
LABEL_30:
        long long v24 = [v9 serviceProviderAcceptedNetworks];
        long long v25 = [v9 serviceProviderSupportedCountries];
        int PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType = PKCanMakePaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType(v24, v25, [v9 serviceProviderCapabilities], 0, 0);

        if (!PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType) {
          unint64_t v21 = 2;
        }
        if (a4) {
          goto LABEL_33;
        }
        goto LABEL_34;
      }
      LOBYTE(PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType) = 0;
      if (a4) {
        goto LABEL_33;
      }
    }
    else
    {
      LOBYTE(PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType) = 0;
      unint64_t v21 = 1;
      if (a4) {
        goto LABEL_33;
      }
    }
  }
LABEL_34:
  if (a5)
  {
    *a5 = [(id)objc_opt_class() displayableErrorForAction:v9 andReason:v21];
  }

  return PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType;
}

+ (id)displayableNoPaymentNetworkErrorMessageForAction:(id)a3 isTransit:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 serviceProviderAcceptedNetworks];
  char v7 = [v5 serviceProviderCapabilities];
  long long v8 = [v5 serviceProviderSupportedCountries];

  if ([v6 count] == 1 && !objc_msgSend(v8, "count"))
  {
    long long v10 = @"PASS_ACTION_UNAVAILABLE_REASON_NO_SPECIFIC_PAYMENT_CARD_AVAILABLE";
    long long v11 = @"PASS_ACTION_UNAVAILABLE_REASON_NO_SPECIFIC_PAYMENT_CARD_AVAILABLE_TRANSIT";
    if ((v7 & 0xC) == 8)
    {
      long long v10 = @"PASS_ACTION_UNAVAILABLE_REASON_NO_SPECIFIC_DEBIT_CARD_AVAILABLE";
      long long v11 = @"PASS_ACTION_UNAVAILABLE_REASON_NO_SPECIFIC_DEBIT_CARD_AVAILABLE_TRANSIT";
    }
    if (v4) {
      long long v10 = v11;
    }
    objc_super v12 = v10;
    uint64_t v13 = [v6 objectAtIndexedSubscript:0];
    uint64_t v14 = PKPaymentCredentialTypeForPaymentNetworkName(v13);

    char v15 = PKDisplayablePaymentNetworkNameForPaymentCredentialType(v14);
    id v9 = PKLocalizedPaymentString(v12, &stru_1EE0F6808.isa, v15);
  }
  else
  {
    id v9 = PKLocalizedPaymentString(&cfstr_PassActionUnav_3.isa, 0);
  }

  return v9;
}

+ (id)displayableErrorForTransitAction:(id)a3 andReason:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    char v7 = PKLocalizedString(&cfstr_PassActionUnav_4.isa, 0);
    long long v8 = +[PKSecureElementPass displayableNoPaymentNetworkErrorMessageForAction:v6 isTransit:1];

    id v9 = PKDisplayableErrorCustomWithType(-1, v7, v8, 0, 0);

    id v6 = v7;
  }
  else
  {
    id v9 = [a1 displayableErrorForAction:v6 andReason:a4];
  }

  return v9;
}

+ (id)displayableErrorForAction:(id)a3 andReason:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  switch(a4)
  {
    case 2uLL:
      char v7 = PKLocalizedPaymentString(&cfstr_PassActionUnav_4.isa, 0);
      long long v8 = +[PKSecureElementPass displayableNoPaymentNetworkErrorMessageForAction:v6 isTransit:0];
      if (!v7) {
        break;
      }
      goto LABEL_16;
    case 3uLL:
      id v9 = [v5 unavailableBeforeReason];
      if (v9) {
        goto LABEL_10;
      }
      long long v10 = @"PASS_ACTION_UNAVAILABLE_REASON_GENERIC_BEFORE_REASON";
      goto LABEL_12;
    case 4uLL:
      id v9 = [v5 unavailableAfterReason];
      if (v9) {
        goto LABEL_10;
      }
      long long v11 = [v6 title];
      long long v8 = PKLocalizedPaymentString(&cfstr_PassActionUnav_6.isa, &stru_1EE0F6808.isa, v11);

      goto LABEL_14;
    case 7uLL:
      id v9 = [v5 unavailableActionReason];
      if (v9)
      {
LABEL_10:
        id v12 = v9;
      }
      else
      {
        long long v10 = @"PASS_ACTION_UNAVAILABLE_GENERIC_REASON";
LABEL_12:
        PKLocalizedPaymentString(&v10->isa, 0);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      long long v8 = v12;
LABEL_14:

      break;
    default:
      long long v8 = PKLocalizedPaymentString(&cfstr_PassActionUnav_7.isa, 0);
      break;
  }
  char v7 = PKLocalizedPaymentString(&cfstr_PassActionUnav_8.isa, 0);
LABEL_16:
  uint64_t v13 = PKDisplayableErrorCustomWithType(-1, v7, v8, 0, 0);

  return v13;
}

@end