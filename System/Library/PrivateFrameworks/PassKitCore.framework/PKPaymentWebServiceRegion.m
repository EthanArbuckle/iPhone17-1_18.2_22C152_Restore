@interface PKPaymentWebServiceRegion
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAccounts;
- (BOOL)hasApplications;
- (BOOL)hasPeerPaymentAccount;
- (NSArray)certificates;
- (NSString)accountServicePushTopic;
- (NSString)applyServicePushTopic;
- (NSString)auxiliaryRegistrationRequirementPushTopic;
- (NSString)deviceCheckInPushTopic;
- (NSString)lastDeviceCheckInBuildVersion;
- (NSString)lastDeviceUpgradeTaskBuildVersion;
- (NSString)lastUpdatedTag;
- (NSString)ownershipTokensPushTopic;
- (NSString)paymentOffersServicePushTopic;
- (NSString)productsPushTopic;
- (NSString)provisioningTargetsPushTopic;
- (NSString)regionCode;
- (NSString)transactionZonePushTopic;
- (NSString)trustedServiceManagerPushTopic;
- (NSString)userNotificationPushTopic;
- (NSURL)accountServiceURL;
- (NSURL)applyServiceURL;
- (NSURL)brokerURL;
- (NSURL)inAppPaymentServicesURL;
- (NSURL)partnerServiceURL;
- (NSURL)paymentOffersServiceURL;
- (NSURL)paymentServicesMerchantURL;
- (NSURL)paymentServicesURL;
- (NSURL)peerPaymentServiceURL;
- (NSURL)trustedServiceManagerURL;
- (PKPaymentWebServiceRegion)initWithCeritficates:(id)a3 brokerURL:(id)a4 trustedServiceManagerURL:(id)a5 trustedServiceManagerPushTopic:(id)a6 paymentServicesURL:(id)a7 inAppPaymentServicesURL:(id)a8 consistencyCheckBackoffLevel:(int64_t)a9 lastUpdatedTag:(id)a10;
- (PKPaymentWebServiceRegion)initWithCoder:(id)a3;
- (PKPaymentWebServiceRegion)initWithDictionary:(id)a3 hasPeerPaymentAccount:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)regionBySettingConsistencyCheckBackoffLevel:(int64_t)a3;
- (id)regionBySettingLastDeviceCheckInBuildVersion:(id)a3;
- (id)regionBySettingLastDeviceUpgradeTaskBuildVersion:(id)a3;
- (id)regionBySettingLastUpdatedTag:(id)a3;
- (id)regionBySettingOutstandingCheckInAction:(int64_t)a3 lastDeviceCheckInBuildVersion:(id)a4;
- (int64_t)consistencyCheckBackoffLevel;
- (int64_t)outstandingCheckInAction;
- (void)encodeWithCoder:(id)a3;
- (void)setHasPeerPaymentAccount:(BOOL)a3;
- (void)setPeerPaymentServiceURL:(id)a3;
@end

@implementation PKPaymentWebServiceRegion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentWebServiceRegion)initWithDictionary:(id)a3 hasPeerPaymentAccount:(BOOL)a4
{
  id v6 = a3;
  v59.receiver = self;
  v59.super_class = (Class)PKPaymentWebServiceRegion;
  v7 = [(PKPaymentWebServiceRegion *)&v59 init];
  if (v7)
  {
    v8 = [v6 PKArrayContaining:objc_opt_class() forKey:@"certificates"];
    uint64_t v9 = objc_msgSend(v8, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_129);
    certificates = v7->_certificates;
    v7->_certificates = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [v6 PKStringForKey:@"brokerURL"];
    uint64_t v13 = [v11 URLWithString:v12];
    brokerURL = v7->_brokerURL;
    v7->_brokerURL = (NSURL *)v13;

    uint64_t v15 = [v6 PKStringForKey:@"region"];
    regionCode = v7->_regionCode;
    v7->_regionCode = (NSString *)v15;

    uint64_t v17 = [v6 PKURLForKey:@"paymentServicesURL"];
    paymentServicesURL = v7->_paymentServicesURL;
    v7->_paymentServicesURL = (NSURL *)v17;

    uint64_t v19 = [v6 PKURLForKey:@"inAppPaymentServicesURL"];
    inAppPaymentServicesURL = v7->_inAppPaymentServicesURL;
    v7->_inAppPaymentServicesURL = (NSURL *)v19;

    uint64_t v21 = [v6 PKURLForKey:@"paymentServicesMerchantURL"];
    paymentServicesMerchantURL = v7->_paymentServicesMerchantURL;
    v7->_paymentServicesMerchantURL = (NSURL *)v21;

    uint64_t v23 = [v6 PKURLForKey:@"partnerServiceURL"];
    partnerServiceURL = v7->_partnerServiceURL;
    v7->_partnerServiceURL = (NSURL *)v23;

    uint64_t v25 = [v6 PKURLForKey:@"trustedServiceManagerURL"];
    trustedServiceManagerURL = v7->_trustedServiceManagerURL;
    v7->_trustedServiceManagerURL = (NSURL *)v25;

    uint64_t v27 = [v6 PKStringForKey:@"trustedServiceManagerPushTopic"];
    trustedServiceManagerPushTopic = v7->_trustedServiceManagerPushTopic;
    v7->_trustedServiceManagerPushTopic = (NSString *)v27;

    uint64_t v29 = [v6 PKStringForKey:@"userNotificationPushTopic"];
    userNotificationPushTopic = v7->_userNotificationPushTopic;
    v7->_userNotificationPushTopic = (NSString *)v29;

    uint64_t v31 = [v6 PKStringForKey:@"deviceCheckInPushTopic"];
    deviceCheckInPushTopic = v7->_deviceCheckInPushTopic;
    v7->_deviceCheckInPushTopic = (NSString *)v31;

    uint64_t v33 = [v6 PKURLForKey:@"peerPaymentServiceURL"];
    peerPaymentServiceURL = v7->_peerPaymentServiceURL;
    v7->_peerPaymentServiceURL = (NSURL *)v33;

    v35 = [v6 objectForKey:@"hasPeerPaymentAccount"];
    if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7->_hasPeerPaymentAccount = [v35 BOOLValue];
    }
    else if ([(NSString *)v7->_regionCode isEqualToString:@"US"])
    {
      v7->_hasPeerPaymentAccount = a4;
    }
    uint64_t v36 = [v6 PKURLForKey:@"accountServiceURL"];
    accountServiceURL = v7->_accountServiceURL;
    v7->_accountServiceURL = (NSURL *)v36;

    uint64_t v38 = [v6 PKStringForKey:@"accountServicePushTopic"];
    accountServicePushTopic = v7->_accountServicePushTopic;
    v7->_accountServicePushTopic = (NSString *)v38;

    v7->_hasAccounts = [v6 PKBoolForKey:@"hasAccounts"];
    uint64_t v40 = [v6 PKURLForKey:@"applyServiceURL"];
    applyServiceURL = v7->_applyServiceURL;
    v7->_applyServiceURL = (NSURL *)v40;

    uint64_t v42 = [v6 PKStringForKey:@"applyServicePushTopic"];
    applyServicePushTopic = v7->_applyServicePushTopic;
    v7->_applyServicePushTopic = (NSString *)v42;

    v7->_hasApplications = [v6 PKBoolForKey:@"hasApplications"];
    uint64_t v44 = [v6 PKStringForKey:@"productsPushTopic"];
    productsPushTopic = v7->_productsPushTopic;
    v7->_productsPushTopic = (NSString *)v44;

    uint64_t v46 = [v6 PKStringForKey:@"transactionZonePushTopic"];
    transactionZonePushTopic = v7->_transactionZonePushTopic;
    v7->_transactionZonePushTopic = (NSString *)v46;

    uint64_t v48 = [v6 PKStringForKey:@"provisioningTargetsPushTopic"];
    provisioningTargetsPushTopic = v7->_provisioningTargetsPushTopic;
    v7->_provisioningTargetsPushTopic = (NSString *)v48;

    uint64_t v50 = [v6 PKStringForKey:@"ownershipTokensPushTopic"];
    ownershipTokensPushTopic = v7->_ownershipTokensPushTopic;
    v7->_ownershipTokensPushTopic = (NSString *)v50;

    uint64_t v52 = [v6 PKStringForKey:@"auxiliaryRegistrationRequirementPushTopic"];
    auxiliaryRegistrationRequirementPushTopic = v7->_auxiliaryRegistrationRequirementPushTopic;
    v7->_auxiliaryRegistrationRequirementPushTopic = (NSString *)v52;

    uint64_t v54 = [v6 PKURLForKey:@"paymentOffersServiceURL"];
    paymentOffersServiceURL = v7->_paymentOffersServiceURL;
    v7->_paymentOffersServiceURL = (NSURL *)v54;

    uint64_t v56 = [v6 PKStringForKey:@"paymentOffersServicePushTopic"];
    paymentOffersServicePushTopic = v7->_paymentOffersServicePushTopic;
    v7->_paymentOffersServicePushTopic = (NSString *)v56;
  }
  return v7;
}

id __70__PKPaymentWebServiceRegion_initWithDictionary_hasPeerPaymentAccount___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithBase64EncodedString:v3 options:0];

  return v4;
}

- (PKPaymentWebServiceRegion)initWithCeritficates:(id)a3 brokerURL:(id)a4 trustedServiceManagerURL:(id)a5 trustedServiceManagerPushTopic:(id)a6 paymentServicesURL:(id)a7 inAppPaymentServicesURL:(id)a8 consistencyCheckBackoffLevel:(int64_t)a9 lastUpdatedTag:(id)a10
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v17 = a8;
  id v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentWebServiceRegion;
  uint64_t v19 = [(PKPaymentWebServiceRegion *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_certificates, a3);
    objc_storeStrong((id *)&v20->_brokerURL, a4);
    objc_storeStrong((id *)&v20->_paymentServicesURL, a7);
    objc_storeStrong((id *)&v20->_inAppPaymentServicesURL, a8);
    objc_storeStrong((id *)&v20->_trustedServiceManagerURL, a5);
    objc_storeStrong((id *)&v20->_trustedServiceManagerPushTopic, a6);
    objc_storeStrong((id *)&v20->_lastUpdatedTag, a10);
    v20->_consistencyCheckBackoffLevel = a9;
  }

  return v20;
}

- (PKPaymentWebServiceRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)PKPaymentWebServiceRegion;
  v5 = [(PKPaymentWebServiceRegion *)&v59 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedTag"];
    lastUpdatedTag = v5->_lastUpdatedTag;
    v5->_lastUpdatedTag = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brokerURL"];
    brokerURL = v5->_brokerURL;
    v5->_brokerURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"regionCode"];
    regionCode = v5->_regionCode;
    v5->_regionCode = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentServicesURL"];
    paymentServicesURL = v5->_paymentServicesURL;
    v5->_paymentServicesURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inAppPaymentServicesURL"];
    inAppPaymentServicesURL = v5->_inAppPaymentServicesURL;
    v5->_inAppPaymentServicesURL = (NSURL *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentServicesMerchantURL"];
    paymentServicesMerchantURL = v5->_paymentServicesMerchantURL;
    v5->_paymentServicesMerchantURL = (NSURL *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerServiceURL"];
    partnerServiceURL = v5->_partnerServiceURL;
    v5->_partnerServiceURL = (NSURL *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trustedServiceManagerURL"];
    trustedServiceManagerURL = v5->_trustedServiceManagerURL;
    v5->_trustedServiceManagerURL = (NSURL *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trustedServiceManagerPushTopic"];
    trustedServiceManagerPushTopic = v5->_trustedServiceManagerPushTopic;
    v5->_trustedServiceManagerPushTopic = (NSString *)v22;

    uint64_t v24 = [v4 decodePropertyListForKey:@"certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v24;

    v5->_consistencyCheckBackoffLevel = [v4 decodeIntegerForKey:@"consistencyCheckBackoff"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userNotificationPushTopic"];
    userNotificationPushTopic = v5->_userNotificationPushTopic;
    v5->_userNotificationPushTopic = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentServiceURL"];
    peerPaymentServiceURL = v5->_peerPaymentServiceURL;
    v5->_peerPaymentServiceURL = (NSURL *)v28;

    v5->_hasPeerPaymentAccount = [v4 decodeBoolForKey:@"hasPeerPaymentAccount"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceCheckInPushTopic"];
    deviceCheckInPushTopic = v5->_deviceCheckInPushTopic;
    v5->_deviceCheckInPushTopic = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastDeviceCheckInBuildVersion"];
    lastDeviceCheckInBuildVersion = v5->_lastDeviceCheckInBuildVersion;
    v5->_lastDeviceCheckInBuildVersion = (NSString *)v32;

    v5->_outstandingCheckInAction = [v4 decodeIntegerForKey:@"outstandingCheckInAction"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceUpgradeTasksBuildVersion"];
    lastDeviceUpgradeTaskBuildVersion = v5->_lastDeviceUpgradeTaskBuildVersion;
    v5->_lastDeviceUpgradeTaskBuildVersion = (NSString *)v34;

    v5->_hasApplications = [v4 decodeBoolForKey:@"hasApplications"];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applyServiceURL"];
    applyServiceURL = v5->_applyServiceURL;
    v5->_applyServiceURL = (NSURL *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applyServicePushTopic"];
    applyServicePushTopic = v5->_applyServicePushTopic;
    v5->_applyServicePushTopic = (NSString *)v38;

    v5->_hasAccounts = [v4 decodeBoolForKey:@"hasAccounts"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountServiceURL"];
    accountServiceURL = v5->_accountServiceURL;
    v5->_accountServiceURL = (NSURL *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountServicePushTopic"];
    accountServicePushTopic = v5->_accountServicePushTopic;
    v5->_accountServicePushTopic = (NSString *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productsPushTopic"];
    productsPushTopic = v5->_productsPushTopic;
    v5->_productsPushTopic = (NSString *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionZonePushTopic"];
    transactionZonePushTopic = v5->_transactionZonePushTopic;
    v5->_transactionZonePushTopic = (NSString *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningTargetsPushTopic"];
    provisioningTargetsPushTopic = v5->_provisioningTargetsPushTopic;
    v5->_provisioningTargetsPushTopic = (NSString *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownershipTokensPushTopic"];
    ownershipTokensPushTopic = v5->_ownershipTokensPushTopic;
    v5->_ownershipTokensPushTopic = (NSString *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auxiliaryRegistrationRequirementPushTopic"];
    auxiliaryRegistrationRequirementPushTopic = v5->_auxiliaryRegistrationRequirementPushTopic;
    v5->_auxiliaryRegistrationRequirementPushTopic = (NSString *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentOffersServiceURL"];
    paymentOffersServiceURL = v5->_paymentOffersServiceURL;
    v5->_paymentOffersServiceURL = (NSURL *)v54;

    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentOffersServicePushTopic"];
    paymentOffersServicePushTopic = v5->_paymentOffersServicePushTopic;
    v5->_paymentOffersServicePushTopic = (NSString *)v56;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  certificates = self->_certificates;
  id v5 = a3;
  [v5 encodeObject:certificates forKey:@"certificates"];
  [v5 encodeObject:self->_lastUpdatedTag forKey:@"lastUpdatedTag"];
  [v5 encodeObject:self->_brokerURL forKey:@"brokerURL"];
  [v5 encodeObject:self->_regionCode forKey:@"regionCode"];
  [v5 encodeObject:self->_paymentServicesURL forKey:@"paymentServicesURL"];
  [v5 encodeObject:self->_inAppPaymentServicesURL forKey:@"inAppPaymentServicesURL"];
  [v5 encodeObject:self->_paymentServicesMerchantURL forKey:@"paymentServicesMerchantURL"];
  [v5 encodeObject:self->_partnerServiceURL forKey:@"partnerServiceURL"];
  [v5 encodeObject:self->_trustedServiceManagerURL forKey:@"trustedServiceManagerURL"];
  [v5 encodeObject:self->_trustedServiceManagerPushTopic forKey:@"trustedServiceManagerPushTopic"];
  [v5 encodeInteger:self->_consistencyCheckBackoffLevel forKey:@"consistencyCheckBackoff"];
  [v5 encodeObject:self->_userNotificationPushTopic forKey:@"userNotificationPushTopic"];
  [v5 encodeObject:self->_peerPaymentServiceURL forKey:@"peerPaymentServiceURL"];
  [v5 encodeBool:self->_hasPeerPaymentAccount forKey:@"hasPeerPaymentAccount"];
  [v5 encodeObject:self->_deviceCheckInPushTopic forKey:@"deviceCheckInPushTopic"];
  [v5 encodeObject:self->_lastDeviceCheckInBuildVersion forKey:@"lastDeviceCheckInBuildVersion"];
  [v5 encodeInteger:self->_outstandingCheckInAction forKey:@"outstandingCheckInAction"];
  [v5 encodeObject:self->_lastDeviceUpgradeTaskBuildVersion forKey:@"deviceUpgradeTasksBuildVersion"];
  [v5 encodeBool:self->_hasApplications forKey:@"hasApplications"];
  [v5 encodeObject:self->_applyServiceURL forKey:@"applyServiceURL"];
  [v5 encodeObject:self->_applyServicePushTopic forKey:@"applyServicePushTopic"];
  [v5 encodeBool:self->_hasAccounts forKey:@"hasAccounts"];
  [v5 encodeObject:self->_accountServiceURL forKey:@"accountServiceURL"];
  [v5 encodeObject:self->_accountServicePushTopic forKey:@"accountServicePushTopic"];
  [v5 encodeObject:self->_productsPushTopic forKey:@"productsPushTopic"];
  [v5 encodeObject:self->_transactionZonePushTopic forKey:@"transactionZonePushTopic"];
  [v5 encodeObject:self->_provisioningTargetsPushTopic forKey:@"provisioningTargetsPushTopic"];
  [v5 encodeObject:self->_ownershipTokensPushTopic forKey:@"ownershipTokensPushTopic"];
  [v5 encodeObject:self->_auxiliaryRegistrationRequirementPushTopic forKey:@"auxiliaryRegistrationRequirementPushTopic"];
  [v5 encodeObject:self->_paymentOffersServiceURL forKey:@"paymentOffersServiceURL"];
  [v5 encodeObject:self->_paymentOffersServicePushTopic forKey:@"paymentOffersServicePushTopic"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PKPaymentWebServiceRegion);
  objc_storeStrong((id *)&v4->_certificates, self->_certificates);
  objc_storeStrong((id *)&v4->_brokerURL, self->_brokerURL);
  objc_storeStrong((id *)&v4->_regionCode, self->_regionCode);
  objc_storeStrong((id *)&v4->_paymentServicesURL, self->_paymentServicesURL);
  objc_storeStrong((id *)&v4->_inAppPaymentServicesURL, self->_inAppPaymentServicesURL);
  objc_storeStrong((id *)&v4->_paymentServicesMerchantURL, self->_paymentServicesMerchantURL);
  objc_storeStrong((id *)&v4->_partnerServiceURL, self->_partnerServiceURL);
  objc_storeStrong((id *)&v4->_trustedServiceManagerURL, self->_trustedServiceManagerURL);
  objc_storeStrong((id *)&v4->_trustedServiceManagerPushTopic, self->_trustedServiceManagerPushTopic);
  objc_storeStrong((id *)&v4->_userNotificationPushTopic, self->_userNotificationPushTopic);
  objc_storeStrong((id *)&v4->_deviceCheckInPushTopic, self->_deviceCheckInPushTopic);
  objc_storeStrong((id *)&v4->_peerPaymentServiceURL, self->_peerPaymentServiceURL);
  v4->_hasPeerPaymentAccount = self->_hasPeerPaymentAccount;
  objc_storeStrong((id *)&v4->_accountServiceURL, self->_accountServiceURL);
  objc_storeStrong((id *)&v4->_accountServicePushTopic, self->_accountServicePushTopic);
  v4->_hasAccounts = self->_hasAccounts;
  objc_storeStrong((id *)&v4->_applyServiceURL, self->_applyServiceURL);
  objc_storeStrong((id *)&v4->_applyServicePushTopic, self->_applyServicePushTopic);
  v4->_hasApplications = self->_hasApplications;
  objc_storeStrong((id *)&v4->_productsPushTopic, self->_productsPushTopic);
  objc_storeStrong((id *)&v4->_transactionZonePushTopic, self->_transactionZonePushTopic);
  objc_storeStrong((id *)&v4->_provisioningTargetsPushTopic, self->_provisioningTargetsPushTopic);
  objc_storeStrong((id *)&v4->_ownershipTokensPushTopic, self->_ownershipTokensPushTopic);
  objc_storeStrong((id *)&v4->_auxiliaryRegistrationRequirementPushTopic, self->_auxiliaryRegistrationRequirementPushTopic);
  objc_storeStrong((id *)&v4->_lastUpdatedTag, self->_lastUpdatedTag);
  objc_storeStrong((id *)&v4->_lastDeviceCheckInBuildVersion, self->_lastDeviceCheckInBuildVersion);
  objc_storeStrong((id *)&v4->_lastDeviceUpgradeTaskBuildVersion, self->_lastDeviceUpgradeTaskBuildVersion);
  v4->_outstandingCheckInAction = self->_outstandingCheckInAction;
  v4->_consistencyCheckBackoffLevel = self->_consistencyCheckBackoffLevel;
  objc_storeStrong((id *)&v4->_paymentOffersServiceURL, self->_paymentOffersServiceURL);
  objc_storeStrong((id *)&v4->_paymentOffersServicePushTopic, self->_paymentOffersServicePushTopic);
  return v4;
}

- (NSURL)inAppPaymentServicesURL
{
  PKOverrideInAppPaymentServicesURL();
  id v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  inAppPaymentServicesURL = v3;
  if (!v3)
  {
    inAppPaymentServicesURL = self->_inAppPaymentServicesURL;
    if (!inAppPaymentServicesURL) {
      inAppPaymentServicesURL = self->_paymentServicesURL;
    }
  }
  id v5 = inAppPaymentServicesURL;

  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"certificates: '%@'; ", self->_certificates];
  [v3 appendFormat:@"lastUpdatedTag: '%@'; ", self->_lastUpdatedTag];
  [v3 appendFormat:@"brokerURL: '%@'; ", self->_brokerURL];
  [v3 appendFormat:@"regionCode: '%@'; ", self->_regionCode];
  [v3 appendFormat:@"paymentServicesURL: '%@'; ", self->_paymentServicesURL];
  inAppPaymentServicesURL = self->_inAppPaymentServicesURL;
  id v5 = [(PKPaymentWebServiceRegion *)self inAppPaymentServicesURL];
  objc_msgSend(v3, "appendFormat:", @"inAppPaymentServicesURL: '%@' (resolved '%@'); ",
    inAppPaymentServicesURL,
    v5);

  [v3 appendFormat:@"paymentServicesMerchantURL: '%@'; ", self->_paymentServicesMerchantURL];
  [v3 appendFormat:@"trustedServiceManagerURL: '%@'; ", self->_trustedServiceManagerURL];
  objc_msgSend(v3, "appendFormat:", @"trustedServiceManagerPushTopic: '%@'; ",
    self->_trustedServiceManagerPushTopic);
  uint64_t v6 = [NSNumber numberWithInteger:self->_consistencyCheckBackoffLevel];
  [v3 appendFormat:@"consistencyCheckBackoffLevel: '%@'; ", v6];

  [v3 appendFormat:@"userNotificationPushTopic: '%@'; ", self->_userNotificationPushTopic];
  [v3 appendFormat:@"peerPaymentServiceURL: '%@'; ", self->_peerPaymentServiceURL];
  if (self->_hasPeerPaymentAccount) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"hasPeerPaymentAccount: '%@'; ", v7];
  [v3 appendFormat:@"deviceCheckInPushTopic: '%@'; ", self->_deviceCheckInPushTopic];
  objc_msgSend(v3, "appendFormat:", @"lastDeviceCheckInBuildVersion: '%@'; ",
    self->_lastDeviceCheckInBuildVersion);
  objc_msgSend(v3, "appendFormat:", @"outstandingCheckInAction: '%ld'; ", self->_outstandingCheckInAction);
  objc_msgSend(v3, "appendFormat:", @"deviceUpgradeTasksBuildVersion: '%@'; ",
    self->_lastDeviceUpgradeTaskBuildVersion);
  [v3 appendFormat:@"applyServiceURL: '%@'; ", self->_applyServiceURL];
  [v3 appendFormat:@"applyServicePushTopic: '%@'; ", self->_applyServicePushTopic];
  if (self->_hasApplications) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  [v3 appendFormat:@"hasApplications: '%@'; ", v8];
  [v3 appendFormat:@"accountServiceURL: '%@'; ", self->_accountServiceURL];
  [v3 appendFormat:@"accountServicePushTopic: '%@'; ", self->_accountServicePushTopic];
  if (self->_hasAccounts) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  [v3 appendFormat:@"hasAccounts: '%@'; ", v9];
  [v3 appendFormat:@"productsPushTopic: %@; ", self->_productsPushTopic];
  [v3 appendFormat:@"transactionZonePushTopic: %@; ", self->_transactionZonePushTopic];
  [v3 appendFormat:@"provisioningTargetsPushTopic: %@; ", self->_provisioningTargetsPushTopic];
  [v3 appendFormat:@"ownershipTokensPushTopic: %@; ", self->_ownershipTokensPushTopic];
  objc_msgSend(v3, "appendFormat:", @"auxiliaryRegistrationRequirementPushTopic: '%@'; ",
    self->_auxiliaryRegistrationRequirementPushTopic);
  [v3 appendFormat:@"paymentOffersServiceURL: '%@'; ", self->_paymentOffersServiceURL];
  objc_msgSend(v3, "appendFormat:", @"paymentOffersServicePushTopic: '%@'; ",
    self->_paymentOffersServicePushTopic);
  [v3 appendFormat:@">"];
  return v3;
}

- (NSURL)applyServiceURL
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  PKApplyServiceOverrideURL();
  id v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Using overridden Apply service URL: %@ ", (uint8_t *)&v8, 0xCu);
    }

    applyServiceURL = v3;
  }
  else
  {
    applyServiceURL = self->_applyServiceURL;
  }
  uint64_t v6 = applyServiceURL;

  return v6;
}

- (NSURL)accountServiceURL
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  PKAccountServiceOverrideURL();
  id v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Using overridden Account service URL: %@ ", (uint8_t *)&v8, 0xCu);
    }

    accountServiceURL = v3;
  }
  else
  {
    accountServiceURL = self->_accountServiceURL;
  }
  uint64_t v6 = accountServiceURL;

  return v6;
}

- (NSURL)paymentOffersServiceURL
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  PKOverridePaymentOffersServiceURL();
  id v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Using overridden Payment Offers Service URL: %@ ", (uint8_t *)&v8, 0xCu);
    }

    paymentOffersServiceURL = v3;
  }
  else
  {
    paymentOffersServiceURL = self->_paymentOffersServiceURL;
  }
  uint64_t v6 = paymentOffersServiceURL;

  return v6;
}

- (id)regionBySettingLastUpdatedTag:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(PKPaymentWebServiceRegion *)self copy];
  uint64_t v6 = (void *)v5[23];
  v5[23] = v4;

  return v5;
}

- (id)regionBySettingOutstandingCheckInAction:(int64_t)a3 lastDeviceCheckInBuildVersion:(id)a4
{
  id v6 = a4;
  v7 = (void *)[(PKPaymentWebServiceRegion *)self copy];
  v7[26] = a3;
  int v8 = (void *)v7[24];
  v7[24] = v6;

  return v7;
}

- (id)regionBySettingLastDeviceCheckInBuildVersion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(PKPaymentWebServiceRegion *)self copy];
  id v6 = (void *)v5[24];
  v5[24] = v4;

  return v5;
}

- (id)regionBySettingLastDeviceUpgradeTaskBuildVersion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(PKPaymentWebServiceRegion *)self copy];
  id v6 = (void *)v5[25];
  v5[25] = v4;

  return v5;
}

- (id)regionBySettingConsistencyCheckBackoffLevel:(int64_t)a3
{
  id v4 = (void *)[(PKPaymentWebServiceRegion *)self copy];
  v4[27] = a3;
  return v4;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (NSURL)brokerURL
{
  return self->_brokerURL;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (NSURL)paymentServicesURL
{
  return self->_paymentServicesURL;
}

- (NSURL)paymentServicesMerchantURL
{
  return self->_paymentServicesMerchantURL;
}

- (NSURL)partnerServiceURL
{
  return self->_partnerServiceURL;
}

- (NSURL)trustedServiceManagerURL
{
  return self->_trustedServiceManagerURL;
}

- (NSString)trustedServiceManagerPushTopic
{
  return self->_trustedServiceManagerPushTopic;
}

- (NSString)userNotificationPushTopic
{
  return self->_userNotificationPushTopic;
}

- (NSString)deviceCheckInPushTopic
{
  return self->_deviceCheckInPushTopic;
}

- (NSString)accountServicePushTopic
{
  return self->_accountServicePushTopic;
}

- (BOOL)hasAccounts
{
  return self->_hasAccounts;
}

- (NSString)applyServicePushTopic
{
  return self->_applyServicePushTopic;
}

- (BOOL)hasApplications
{
  return self->_hasApplications;
}

- (NSString)productsPushTopic
{
  return self->_productsPushTopic;
}

- (NSString)transactionZonePushTopic
{
  return self->_transactionZonePushTopic;
}

- (NSString)provisioningTargetsPushTopic
{
  return self->_provisioningTargetsPushTopic;
}

- (NSString)ownershipTokensPushTopic
{
  return self->_ownershipTokensPushTopic;
}

- (NSString)auxiliaryRegistrationRequirementPushTopic
{
  return self->_auxiliaryRegistrationRequirementPushTopic;
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (NSString)lastDeviceCheckInBuildVersion
{
  return self->_lastDeviceCheckInBuildVersion;
}

- (NSString)lastDeviceUpgradeTaskBuildVersion
{
  return self->_lastDeviceUpgradeTaskBuildVersion;
}

- (int64_t)outstandingCheckInAction
{
  return self->_outstandingCheckInAction;
}

- (int64_t)consistencyCheckBackoffLevel
{
  return self->_consistencyCheckBackoffLevel;
}

- (NSString)paymentOffersServicePushTopic
{
  return self->_paymentOffersServicePushTopic;
}

- (NSURL)peerPaymentServiceURL
{
  return self->_peerPaymentServiceURL;
}

- (void)setPeerPaymentServiceURL:(id)a3
{
}

- (BOOL)hasPeerPaymentAccount
{
  return self->_hasPeerPaymentAccount;
}

- (void)setHasPeerPaymentAccount:(BOOL)a3
{
  self->_hasPeerPaymentAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentServiceURL, 0);
  objc_storeStrong((id *)&self->_paymentOffersServicePushTopic, 0);
  objc_storeStrong((id *)&self->_lastDeviceUpgradeTaskBuildVersion, 0);
  objc_storeStrong((id *)&self->_lastDeviceCheckInBuildVersion, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTag, 0);
  objc_storeStrong((id *)&self->_auxiliaryRegistrationRequirementPushTopic, 0);
  objc_storeStrong((id *)&self->_ownershipTokensPushTopic, 0);
  objc_storeStrong((id *)&self->_provisioningTargetsPushTopic, 0);
  objc_storeStrong((id *)&self->_transactionZonePushTopic, 0);
  objc_storeStrong((id *)&self->_productsPushTopic, 0);
  objc_storeStrong((id *)&self->_applyServicePushTopic, 0);
  objc_storeStrong((id *)&self->_accountServicePushTopic, 0);
  objc_storeStrong((id *)&self->_deviceCheckInPushTopic, 0);
  objc_storeStrong((id *)&self->_userNotificationPushTopic, 0);
  objc_storeStrong((id *)&self->_trustedServiceManagerPushTopic, 0);
  objc_storeStrong((id *)&self->_trustedServiceManagerURL, 0);
  objc_storeStrong((id *)&self->_partnerServiceURL, 0);
  objc_storeStrong((id *)&self->_paymentServicesMerchantURL, 0);
  objc_storeStrong((id *)&self->_paymentServicesURL, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_brokerURL, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_paymentOffersServiceURL, 0);
  objc_storeStrong((id *)&self->_applyServiceURL, 0);
  objc_storeStrong((id *)&self->_accountServiceURL, 0);
  objc_storeStrong((id *)&self->_inAppPaymentServicesURL, 0);
}

@end