@interface PKPaymentWebServiceContext
+ (BOOL)supportsSecureCoding;
+ (PKPaymentWebServiceContext)contextWithArchive:(id)a3;
+ (void)_migrateContext:(id)a3;
+ (void)_migrateFrom0To1:(id)a3;
- (BOOL)contextMeetsDeviceUpgradeTasksEnablementThresholdForRegion:(id)a3;
- (BOOL)contextMeetsMarketGeoNotificationThresholdForRegion:(id)a3 paymentNetwork:(int64_t)a4;
- (BOOL)contextMeetsProvisioningEnablementPercentageThresholdForRegion:(id)a3;
- (BOOL)devSigned;
- (BOOL)hasPeerPaymentAccount;
- (BOOL)ignoreProvisioningEnablementPercentage;
- (BOOL)isRegistered;
- (BOOL)isRegisteredForBrokerURL:(id)a3;
- (BOOL)messageServiceDisabled;
- (BOOL)transactionServiceDisabled;
- (NSArray)certificates;
- (NSDate)archivedDate;
- (NSDate)configurationDate;
- (NSDate)registrationDate;
- (NSDictionary)regions;
- (NSString)companionSerialNumber;
- (NSString)deviceID;
- (NSString)lastUpdatedTag;
- (NSString)nextPushToken;
- (NSString)primaryRegionIdentifier;
- (NSString)pushToken;
- (NSString)secureElementID;
- (NSURL)peerPaymentServiceURL;
- (PKPaymentWebServiceConfiguration)configuration;
- (PKPaymentWebServiceContext)init;
- (PKPaymentWebServiceContext)initWithCoder:(id)a3;
- (PKPaymentWebServiceRegion)primaryRegion;
- (double)_contextProvisioningEnablementValue;
- (id)TSMPushTopics;
- (id)TSMURLStringByPushTopic;
- (id)_regionWithPeerPaymentServiceURL;
- (id)accountServicePushTopics;
- (id)applyServiceFeaturesForRegionMeetingEnablementThreshold:(id)a3;
- (id)applyServiceLocalizationBundleForFeatureIdentifier:(unint64_t)a3 mainLanguageBundle:(id)a4;
- (id)applyServicePreferredLanguageForFeatureIdentifier:(unint64_t)a3 mainLanguageBundle:(id)a4;
- (id)applyServicePushTopics;
- (id)betaPaymentNetworksForRegion:(id)a3;
- (id)debugDescription;
- (id)notificationPushTopics;
- (id)paymentOffersServicePushTopics;
- (id)regionForIdentifier:(id)a3;
- (id)verificationRequestRecordForUniqueID:(id)a3;
- (int64_t)consistencyCheckBackoffLevel;
- (int64_t)registrationType;
- (int64_t)version;
- (void)_localizationUpdated;
- (void)addVerificationRequestRecord:(id)a3 forUniqueID:(id)a4;
- (void)archiveAtPath:(id)a3;
- (void)atomicallyUpdateEveryRegion:(id)a3;
- (void)atomicallyUpdatePrimaryRegion:(id)a3;
- (void)atomicallyUpdateRegionWithIdentifier:(id)a3 updateBlock:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeVerificationRequestRecordForUniqueID:(id)a3;
- (void)setArchivedDate:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setCompanionSerialNumber:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfigurationDate:(id)a3;
- (void)setConsistencyCheckBackoffLevel:(int64_t)a3;
- (void)setDevSigned:(BOOL)a3;
- (void)setDeviceID:(id)a3;
- (void)setIgnoreProvisioningEnablementPercentage:(BOOL)a3;
- (void)setLastUpdatedTag:(id)a3;
- (void)setMessageServiceDisabled:(BOOL)a3;
- (void)setNextPushToken:(id)a3;
- (void)setPrimaryRegionIdentifier:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setRegions:(id)a3;
- (void)setRegistrationDate:(id)a3;
- (void)setRegistrationType:(int64_t)a3;
- (void)setSecureElementID:(id)a3;
- (void)setTransactionServiceDisabled:(BOOL)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation PKPaymentWebServiceContext

- (void)encodeWithCoder:(id)a3
{
  p_lock_context = &self->_lock_context;
  id v5 = a3;
  os_unfair_lock_lock(p_lock_context);
  objc_msgSend(v5, "encodeInteger:forKey:", -[PKPaymentWebServiceContext version](self, "version"), @"version");
  v6 = [(PKPaymentWebServiceContext *)self deviceID];
  [v5 encodeObject:v6 forKey:@"deviceID"];

  v7 = [(PKPaymentWebServiceContext *)self secureElementID];
  [v5 encodeObject:v7 forKey:@"secureElementID"];

  v8 = [(PKPaymentWebServiceContext *)self registrationDate];
  [v5 encodeObject:v8 forKey:@"registrationDate"];

  v9 = [(PKPaymentWebServiceContext *)self archivedDate];
  [v5 encodeObject:v9 forKey:@"archivedDate"];

  v10 = [(PKPaymentWebServiceContext *)self pushToken];
  [v5 encodeObject:v10 forKey:@"pushToken"];

  v11 = [(PKPaymentWebServiceContext *)self companionSerialNumber];
  [v5 encodeObject:v11 forKey:@"companionSerialNumber"];

  [v5 encodeObject:self->_verificationRequestsByPassUniqueID forKey:@"verificationRequestsByPassUniqueID"];
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentWebServiceContext devSigned](self, "devSigned"), @"devSigned");
  v12 = [(PKPaymentWebServiceContext *)self configurationDate];
  [v5 encodeObject:v12 forKey:@"configurationDate"];

  [v5 encodeObject:self->_configuration forKey:@"configuration"];
  v13 = [(PKPaymentWebServiceContext *)self primaryRegionIdentifier];
  [v5 encodeObject:v13 forKey:@"primaryRegionIdentifier"];

  [v5 encodeObject:self->_regions forKey:@"regions"];
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentWebServiceContext transactionServiceDisabled](self, "transactionServiceDisabled"), @"transactionServiceDisabled");
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentWebServiceContext messageServiceDisabled](self, "messageServiceDisabled"), @"messageServiceDisabled");
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentWebServiceContext ignoreProvisioningEnablementPercentage](self, "ignoreProvisioningEnablementPercentage"), @"ignoreProvisioningEnablementPercentage");
  objc_msgSend(v5, "encodeInteger:forKey:", -[PKPaymentWebServiceContext consistencyCheckBackoffLevel](self, "consistencyCheckBackoffLevel"), @"consistencyCheckBackoff");
  v14 = [(PKPaymentWebServiceContext *)self lastUpdatedTag];
  [v5 encodeObject:v14 forKey:@"lastUpdatedTag"];

  v15 = [(PKPaymentWebServiceContext *)self certificates];
  [v5 encodeObject:v15 forKey:@"certificates"];

  unint64_t registrationType = self->_registrationType;
  if (registrationType > 2) {
    v17 = 0;
  }
  else {
    v17 = off_1E56EB8A0[registrationType];
  }
  [v5 encodeObject:v17 forKey:@"registrationType"];

  os_unfair_lock_unlock(p_lock_context);
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)transactionServiceDisabled
{
  return self->_transactionServiceDisabled;
}

- (NSString)secureElementID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSDate)registrationDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)pushToken
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)primaryRegionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)messageServiceDisabled
{
  return self->_messageServiceDisabled;
}

- (NSString)lastUpdatedTag
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (int64_t)consistencyCheckBackoffLevel
{
  return self->_consistencyCheckBackoffLevel;
}

- (NSString)companionSerialNumber
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (NSDate)archivedDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)contextMeetsProvisioningEnablementPercentageThresholdForRegion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (-[PKPaymentWebServiceContext ignoreProvisioningEnablementPercentage](self, "ignoreProvisioningEnablementPercentage")|| (-[PKPaymentWebServiceContext configuration](self, "configuration"), id v5 = objc_claimAutoreleasedReturnValue(), v6 = [v5 regionHasProvisioningEnablementPercentage:v4], v5, !v6))
  {
    BOOL v12 = 1;
  }
  else
  {
    [(PKPaymentWebServiceContext *)self _contextProvisioningEnablementValue];
    double v8 = v7;
    v9 = [(PKPaymentWebServiceContext *)self configuration];
    [v9 provisioningEnablementPercentageForRegion:v4];
    double v11 = v10;

    BOOL v12 = v8 < v11;
    v13 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = @"does not meet";
      int v16 = 138413058;
      id v17 = v4;
      if (v8 < v11) {
        v14 = @"meets";
      }
      __int16 v18 = 2048;
      double v19 = v11;
      __int16 v20 = 2048;
      double v21 = v8;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Region: %@ has a defined ProvisioningEnablementPercentage threshold of %f. This device has context value %f. Context %@ the required threshold.", (uint8_t *)&v16, 0x2Au);
    }
  }
  return v12;
}

- (PKPaymentWebServiceConfiguration)configuration
{
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  id v4 = self->_configuration;
  os_unfair_lock_unlock(p_lock_context);
  return v4;
}

- (BOOL)ignoreProvisioningEnablementPercentage
{
  return self->_ignoreProvisioningEnablementPercentage;
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (NSDate)configurationDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentWebServiceContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentWebServiceContext *)self init];
  if (v5)
  {
    -[PKPaymentWebServiceContext setVersion:](v5, "setVersion:", [v4 decodeIntegerForKey:@"version"]);
    int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
    [(PKPaymentWebServiceContext *)v5 setDeviceID:v6];

    double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureElementID"];
    [(PKPaymentWebServiceContext *)v5 setSecureElementID:v7];

    double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registrationDate"];
    [(PKPaymentWebServiceContext *)v5 setRegistrationDate:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archivedDate"];
    [(PKPaymentWebServiceContext *)v5 setArchivedDate:v9];

    double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushToken"];
    [(PKPaymentWebServiceContext *)v5 setPushToken:v10];

    double v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionSerialNumber"];
    [(PKPaymentWebServiceContext *)v5 setCompanionSerialNumber:v11];

    BOOL v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    int v16 = [v4 decodeObjectOfClasses:v15 forKey:@"verificationRequestsByPassUniqueID"];
    uint64_t v17 = [v16 mutableCopy];
    verificationRequestsByPassUniqueID = v5->_verificationRequestsByPassUniqueID;
    v5->_verificationRequestsByPassUniqueID = (NSMutableDictionary *)v17;

    -[PKPaymentWebServiceContext setDevSigned:](v5, "setDevSigned:", [v4 decodeBoolForKey:@"devSigned"]);
    double v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationDate"];
    [(PKPaymentWebServiceContext *)v5 setConfigurationDate:v19];

    __int16 v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
    [(PKPaymentWebServiceContext *)v5 setConfiguration:v20];

    double v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"regions"];
    regions = v5->_regions;
    v5->_regions = (NSDictionary *)v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryRegionIdentifier"];
    [(PKPaymentWebServiceContext *)v5 setPrimaryRegionIdentifier:v27];

    -[PKPaymentWebServiceContext setTransactionServiceDisabled:](v5, "setTransactionServiceDisabled:", [v4 decodeBoolForKey:@"transactionServiceDisabled"]);
    -[PKPaymentWebServiceContext setMessageServiceDisabled:](v5, "setMessageServiceDisabled:", [v4 decodeBoolForKey:@"messageServiceDisabled"]);
    -[PKPaymentWebServiceContext setIgnoreProvisioningEnablementPercentage:](v5, "setIgnoreProvisioningEnablementPercentage:", [v4 decodeBoolForKey:@"ignoreProvisioningEnablementPercentage"]);
    v28 = [v4 decodePropertyListForKey:@"certificates"];
    [(PKPaymentWebServiceContext *)v5 setCertificates:v28];

    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedTag"];
    [(PKPaymentWebServiceContext *)v5 setLastUpdatedTag:v29];

    -[PKPaymentWebServiceContext setConsistencyCheckBackoffLevel:](v5, "setConsistencyCheckBackoffLevel:", [v4 decodeIntegerForKey:@"consistencyCheckBackoff"]);
    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registrationType"];
    v31 = v30;
    if (v30)
    {
      uint64_t v35 = 0;
      int v32 = PKPaymentWebServiceRegistrationTypeFromString(v30, &v35);
      uint64_t deviceID = v35;
      if (!v32) {
        uint64_t deviceID = 3;
      }
    }
    else
    {
      uint64_t deviceID = (uint64_t)v5->_deviceID;
      if (deviceID) {
        uint64_t deviceID = v5->_registrationDate != 0;
      }
    }
    v5->_unint64_t registrationType = deviceID;
  }
  return v5;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void)setTransactionServiceDisabled:(BOOL)a3
{
  self->_transactionServiceDisabled = a3;
}

- (void)setSecureElementID:(id)a3
{
}

- (void)setRegistrationDate:(id)a3
{
}

- (void)setPushToken:(id)a3
{
}

- (void)setPrimaryRegionIdentifier:(id)a3
{
}

- (void)setMessageServiceDisabled:(BOOL)a3
{
  self->_messageServiceDisabled = a3;
}

- (void)setLastUpdatedTag:(id)a3
{
}

- (void)setIgnoreProvisioningEnablementPercentage:(BOOL)a3
{
  self->_ignoreProvisioningEnablementPercentage = a3;
}

- (void)setDeviceID:(id)a3
{
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (void)setConsistencyCheckBackoffLevel:(int64_t)a3
{
  self->_consistencyCheckBackoffLevel = a3;
}

- (void)setConfigurationDate:(id)a3
{
}

- (void)setConfiguration:(id)a3
{
  id v4 = (PKPaymentWebServiceConfiguration *)a3;
  os_unfair_lock_lock(&self->_lock_context);
  configuration = self->_configuration;
  self->_configuration = v4;

  os_unfair_lock_unlock(&self->_lock_context);
}

- (void)setCompanionSerialNumber:(id)a3
{
}

- (void)setCertificates:(id)a3
{
}

- (void)setArchivedDate:(id)a3
{
}

- (PKPaymentWebServiceContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentWebServiceContext;
  v2 = [(PKPaymentWebServiceContext *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock_context._os_unfair_lock_opaque = 0;
    v2->_version = 1;
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    v2->_unint64_t registrationType = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    featureSupportedLanguageCache = v3->_featureSupportedLanguageCache;
    v3->_featureSupportedLanguageCache = v4;

    int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__localizationUpdated name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentWebServiceContext;
  [(PKPaymentWebServiceContext *)&v4 dealloc];
}

+ (PKPaymentWebServiceContext)contextWithArchive:(id)a3
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PKPaymentWebServiceContext;
  id v5 = objc_msgSendSuper2(&v8, sel_contextWithArchive_, v4);
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v6 = v5;
  }
  else
  {
    int v6 = objc_alloc_init(PKPaymentWebServiceContext);
    if (!v6) {
      goto LABEL_7;
    }
  }
  if ([(PKPaymentWebServiceContext *)v6 version] <= 0)
  {
    [(id)objc_opt_class() _migrateContext:v6];
    [v5 archiveAtPath:v4];
  }
LABEL_7:

  return v6;
}

- (void)archiveAtPath:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  int v6 = [v4 date];
  [(PKPaymentWebServiceContext *)self setArchivedDate:v6];

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentWebServiceContext;
  [(PKWebServiceContext *)&v7 archiveAtPath:v5];
}

- (BOOL)isRegistered
{
  return (unint64_t)(self->_registrationType - 1) < 3;
}

- (BOOL)isRegisteredForBrokerURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PKPaymentWebServiceContext *)self isRegistered])
  {
    if (v4)
    {
      p_lock_context = &self->_lock_context;
      os_unfair_lock_lock(&self->_lock_context);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      int v6 = self->_regions;
      uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v17 = &self->_lock_context;
        uint64_t v9 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v6);
            }
            double v11 = [(NSDictionary *)self->_regions objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i)];
            uint64_t v12 = [v11 brokerURL];
            if (v12)
            {
              uint64_t v13 = (void *)v12;
              char v14 = [v4 isEqual:v12];

              if (v14)
              {
                BOOL v15 = 1;
                goto LABEL_17;
              }
            }
            else
            {
            }
          }
          uint64_t v8 = [(NSDictionary *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v8);
        BOOL v15 = 0;
LABEL_17:
        p_lock_context = v17;
      }
      else
      {
        BOOL v15 = 0;
      }

      os_unfair_lock_unlock(p_lock_context);
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (NSDictionary)regions
{
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  id v4 = self->_regions;
  os_unfair_lock_unlock(p_lock_context);
  return v4;
}

- (void)setRegions:(id)a3
{
  id v4 = (NSDictionary *)[a3 copy];
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  self->_regions = v4;

  os_unfair_lock_unlock(&self->_lock_context);
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; \n", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"version: '%ld';\n", self->_version);
  [v3 appendFormat:@"DeviceID: '%@';\n", self->_deviceID];
  [v3 appendFormat:@"secureElementID: '%@';\n", self->_secureElementID];
  [v3 appendFormat:@"registrationDate: '%@';\n", self->_registrationDate];
  [v3 appendFormat:@"archivedDate: '%@';\n", self->_archivedDate];
  [v3 appendFormat:@"pushToken: '%@';\n", self->_pushToken];
  [v3 appendFormat:@"nextPushToken: '%@';\n", self->_nextPushToken];
  [v3 appendFormat:@"companionSerialNumber: '%@';\n", self->_companionSerialNumber];
  objc_msgSend(v3, "appendFormat:", @"verificationRequestsByPassUniqueID: '%@';\n",
    self->_verificationRequestsByPassUniqueID);
  if (self->_devSigned) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"devSigned: '%@';\n", v4];
  [v3 appendFormat:@"configurationDate: '%@';\n", self->_configurationDate];
  id v5 = [(PKPaymentWebServiceContext *)self configuration];
  int v6 = [v5 description];
  [v3 appendFormat:@"configuration: '%@';\n", v6];

  [v3 appendFormat:@"primaryRegionIdentifier: '%@';\n", self->_primaryRegionIdentifier];
  uint64_t v7 = [(NSDictionary *)self->_regions description];
  [v3 appendFormat:@"regions: '%@';\n", v7];

  if (self->_transactionServiceDisabled) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  [v3 appendFormat:@"transactionServiceDisabled: '%@';\n", v8];
  if (self->_messageServiceDisabled) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  [v3 appendFormat:@"messageServiceDisabled: '%@';\n", v9];
  if (self->_ignoreProvisioningEnablementPercentage) {
    double v10 = @"YES";
  }
  else {
    double v10 = @"NO";
  }
  [v3 appendFormat:@"ignoreProvisioningEnablementPercentage: '%@';\n", v10];
  objc_msgSend(v3, "appendFormat:", @"consistencyCheckBackoff: '%ld';\n", self->_consistencyCheckBackoffLevel);
  [v3 appendFormat:@"lastUpdatedTag: '%@';\n", self->_lastUpdatedTag];
  [v3 appendFormat:@"certificates: '%@';\n", self->_certificates];
  return v3;
}

- (void)_localizationUpdated
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  [(NSMutableDictionary *)self->_featureSupportedLanguageCache removeAllObjects];
  os_unfair_lock_unlock(p_cacheLock);
}

- (void)addVerificationRequestRecord:(id)a3 forUniqueID:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject(0x25uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Adding verification request record for %@", (uint8_t *)&v12, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock_context);
  verificationRequestsByPassUniqueID = self->_verificationRequestsByPassUniqueID;
  if (!verificationRequestsByPassUniqueID)
  {
    double v10 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    double v11 = self->_verificationRequestsByPassUniqueID;
    self->_verificationRequestsByPassUniqueID = v10;

    verificationRequestsByPassUniqueID = self->_verificationRequestsByPassUniqueID;
  }
  [(NSMutableDictionary *)verificationRequestsByPassUniqueID setObject:v6 forKey:v7];
  os_unfair_lock_unlock(&self->_lock_context);
}

- (id)verificationRequestRecordForUniqueID:(id)a3
{
  p_lock_context = &self->_lock_context;
  id v5 = a3;
  os_unfair_lock_lock(p_lock_context);
  id v6 = [(NSMutableDictionary *)self->_verificationRequestsByPassUniqueID objectForKey:v5];

  os_unfair_lock_unlock(p_lock_context);
  return v6;
}

- (void)removeVerificationRequestRecordForUniqueID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject(0x25uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Removing verification request record for %@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock_context);
  [(NSMutableDictionary *)self->_verificationRequestsByPassUniqueID removeObjectForKey:v4];
  if (![(NSMutableDictionary *)self->_verificationRequestsByPassUniqueID count])
  {
    verificationRequestsByPassUniqueID = self->_verificationRequestsByPassUniqueID;
    self->_verificationRequestsByPassUniqueID = 0;
  }
  os_unfair_lock_unlock(&self->_lock_context);
}

- (id)regionForIdentifier:(id)a3
{
  p_lock_context = &self->_lock_context;
  id v5 = a3;
  os_unfair_lock_lock(p_lock_context);
  id v6 = [(NSDictionary *)self->_regions objectForKey:v5];

  os_unfair_lock_unlock(p_lock_context);
  return v6;
}

- (PKPaymentWebServiceRegion)primaryRegion
{
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  id v4 = [(NSDictionary *)self->_regions objectForKey:self->_primaryRegionIdentifier];
  os_unfair_lock_unlock(p_lock_context);
  return (PKPaymentWebServiceRegion *)v4;
}

- (void)atomicallyUpdatePrimaryRegion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    double v10 = v4;
    os_unfair_lock_lock(&self->_lock_context);
    if (self->_primaryRegionIdentifier)
    {
      id v5 = (void *)[(NSDictionary *)self->_regions mutableCopy];
      id v6 = [(NSDictionary *)self->_regions objectForKeyedSubscript:self->_primaryRegionIdentifier];
      int v7 = v10[2](v10, v6);
      [v5 setObject:v7 forKeyedSubscript:self->_primaryRegionIdentifier];

      id v8 = (NSDictionary *)[v5 copy];
      regions = self->_regions;
      self->_regions = v8;
    }
    os_unfair_lock_unlock(&self->_lock_context);
    id v4 = v10;
  }
}

- (void)atomicallyUpdateRegionWithIdentifier:(id)a3 updateBlock:(id)a4
{
  if (a3 && a4)
  {
    p_lock_context = &self->_lock_context;
    int v7 = (void (**)(id, void *))a4;
    id v8 = a3;
    os_unfair_lock_lock(p_lock_context);
    id v13 = (id)[(NSDictionary *)self->_regions mutableCopy];
    uint64_t v9 = [(NSDictionary *)self->_regions objectForKeyedSubscript:v8];
    double v10 = v7[2](v7, v9);

    [v13 setObject:v10 forKeyedSubscript:v8];
    double v11 = (NSDictionary *)[v13 copy];
    regions = self->_regions;
    self->_regions = v11;

    os_unfair_lock_unlock(p_lock_context);
  }
}

- (void)atomicallyUpdateEveryRegion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock_context);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    obj = self->_regions;
    uint64_t v5 = [(NSDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          double v10 = [(NSDictionary *)self->_regions objectForKeyedSubscript:v9];
          double v11 = v4[2](v4, v10);
          [v15 setObject:v11 forKeyedSubscript:v9];
        }
        uint64_t v6 = [(NSDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    int v12 = (NSDictionary *)[v15 copy];
    regions = self->_regions;
    self->_regions = v12;

    os_unfair_lock_unlock(&self->_lock_context);
  }
}

- (id)TSMPushTopics
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__PKPaymentWebServiceContext_TSMPushTopics__block_invoke;
  v9[3] = &unk_1E56EB838;
  id v10 = v3;
  id v6 = v3;
  [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v9];
  os_unfair_lock_unlock(p_lock_context);
  uint64_t v7 = (void *)[v6 copy];

  return v7;
}

void __43__PKPaymentWebServiceContext_TSMPushTopics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 trustedServiceManagerPushTopic];
  if (v4)
  {
    uint64_t v5 = v4;
    [*(id *)(a1 + 32) addObject:v4];
    id v4 = v5;
  }
}

- (id)TSMURLStringByPushTopic
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__PKPaymentWebServiceContext_TSMURLStringByPushTopic__block_invoke;
  v9[3] = &unk_1E56EB838;
  id v10 = v3;
  id v6 = v3;
  [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v9];
  os_unfair_lock_unlock(p_lock_context);
  uint64_t v7 = (void *)[v6 copy];

  return v7;
}

void __53__PKPaymentWebServiceContext_TSMURLStringByPushTopic__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 trustedServiceManagerURL];
  id v7 = [v5 absoluteString];

  id v6 = [v4 trustedServiceManagerPushTopic];

  if (v7 && v6) {
    [*(id *)(a1 + 32) setObject:v7 forKey:v6];
  }
}

- (id)notificationPushTopics
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PKPaymentWebServiceContext_notificationPushTopics__block_invoke;
  v9[3] = &unk_1E56EB838;
  id v10 = v3;
  id v6 = v3;
  [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v9];
  os_unfair_lock_unlock(p_lock_context);
  id v7 = (void *)[v6 copy];

  return v7;
}

void __52__PKPaymentWebServiceContext_notificationPushTopics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  objc_msgSend(v5, "pk_safelyAddObject:", a2);
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 userNotificationPushTopic];
  objc_msgSend(v7, "pk_safelyAddObject:", v8);

  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [v6 deviceCheckInPushTopic];
  objc_msgSend(v9, "pk_safelyAddObject:", v10);

  double v11 = *(void **)(a1 + 32);
  int v12 = [v6 productsPushTopic];
  objc_msgSend(v11, "pk_safelyAddObject:", v12);

  id v13 = *(void **)(a1 + 32);
  uint64_t v14 = [v6 transactionZonePushTopic];
  objc_msgSend(v13, "pk_safelyAddObject:", v14);

  id v15 = *(void **)(a1 + 32);
  long long v16 = [v6 provisioningTargetsPushTopic];
  objc_msgSend(v15, "pk_safelyAddObject:", v16);

  objc_msgSend(*(id *)(a1 + 32), "pk_safelyAddObject:", @"com.apple.pay.provision");
  long long v17 = *(void **)(a1 + 32);
  long long v18 = [v6 ownershipTokensPushTopic];
  objc_msgSend(v17, "pk_safelyAddObject:", v18);

  long long v19 = *(void **)(a1 + 32);
  id v20 = [v6 auxiliaryRegistrationRequirementPushTopic];

  objc_msgSend(v19, "pk_safelyAddObject:", v20);
}

- (id)applyServicePushTopics
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PKPaymentWebServiceContext_applyServicePushTopics__block_invoke;
  v9[3] = &unk_1E56EB838;
  id v10 = v3;
  id v6 = v3;
  [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v9];
  os_unfair_lock_unlock(p_lock_context);
  id v7 = (void *)[v6 copy];

  return v7;
}

void __52__PKPaymentWebServiceContext_applyServicePushTopics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 applyServicePushTopic];
  objc_msgSend(v3, "pk_safelyAddObject:", v4);
}

- (id)accountServicePushTopics
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__PKPaymentWebServiceContext_accountServicePushTopics__block_invoke;
  v9[3] = &unk_1E56EB838;
  id v10 = v3;
  id v6 = v3;
  [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v9];
  os_unfair_lock_unlock(p_lock_context);
  id v7 = (void *)[v6 copy];

  return v7;
}

void __54__PKPaymentWebServiceContext_accountServicePushTopics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 accountServicePushTopic];
  objc_msgSend(v3, "pk_safelyAddObject:", v4);
}

- (id)paymentOffersServicePushTopics
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PKPaymentWebServiceContext_paymentOffersServicePushTopics__block_invoke;
  v9[3] = &unk_1E56EB838;
  id v10 = v3;
  id v6 = v3;
  [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v9];
  os_unfair_lock_unlock(p_lock_context);
  id v7 = (void *)[v6 copy];

  return v7;
}

void __60__PKPaymentWebServiceContext_paymentOffersServicePushTopics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 paymentOffersServicePushTopic];
  objc_msgSend(v3, "pk_safelyAddObject:", v4);
}

- (NSURL)peerPaymentServiceURL
{
  v2 = [(PKPaymentWebServiceContext *)self _regionWithPeerPaymentServiceURL];
  id v3 = [v2 peerPaymentServiceURL];

  return (NSURL *)v3;
}

- (BOOL)hasPeerPaymentAccount
{
  v2 = [(PKPaymentWebServiceContext *)self _regionWithPeerPaymentServiceURL];
  char v3 = [v2 hasPeerPaymentAccount];

  return v3;
}

- (id)_regionWithPeerPaymentServiceURL
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [(PKPaymentWebServiceContext *)self primaryRegion];
  uint64_t v4 = [v3 peerPaymentServiceURL];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(PKPaymentWebServiceContext *)self regions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        uint64_t v10 = 0;
        double v11 = v3;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          char v3 = [(PKPaymentWebServiceContext *)self regionForIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * v10)];

          uint64_t v12 = [v3 peerPaymentServiceURL];
          if (v12)
          {
            uint64_t v5 = (void *)v12;
            goto LABEL_13;
          }
          ++v10;
          double v11 = v3;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    uint64_t v5 = 0;
    id v6 = v3;
    char v3 = 0;
LABEL_13:
  }
  return v3;
}

- (BOOL)contextMeetsMarketGeoNotificationThresholdForRegion:(id)a3 paymentNetwork:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PKPaymentWebServiceContext *)self configuration];
  uint64_t v8 = [v7 marketGeoRegionNotificationNetworkThresholdsForRegion:v6];

  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a4);
  uint64_t v10 = [v8 objectForKey:v9];

  if (v10)
  {
    [v10 doubleValue];
    double v12 = v11;
    [(PKPaymentWebServiceContext *)self _contextProvisioningEnablementValue];
    double v14 = v13;
    BOOL v15 = v13 < v12;
    long long v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = @"does not meet";
      *(_DWORD *)buf = 138413314;
      id v20 = v6;
      if (v14 < v12) {
        long long v17 = @"meets";
      }
      __int16 v21 = 2048;
      double v22 = v12;
      __int16 v23 = 2048;
      int64_t v24 = a4;
      __int16 v25 = 2048;
      double v26 = v14;
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Region: %@ has a defined GeoRegionNotificationNetwork threshold of %f for network %ld. This device has context value %f. Context %@ the required threshold.", buf, 0x34u);
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)contextMeetsDeviceUpgradeTasksEnablementThresholdForRegion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPaymentWebServiceContext *)self _contextProvisioningEnablementValue];
  double v6 = v5;
  uint64_t v7 = [(PKPaymentWebServiceContext *)self configuration];
  [v7 deviceUpgradeTaskEnablementPercentageForRegion:v4];
  double v9 = v8;

  if (v9 < 1.0)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = @"does not meet";
      int v13 = 138413058;
      id v14 = v4;
      if (v6 < v9) {
        double v11 = @"meets";
      }
      __int16 v15 = 2048;
      double v16 = v9;
      __int16 v17 = 2048;
      double v18 = v6;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Region: %@ has a defined deviceUpgradeTasksEnablementPercentage threshold of %f. This device has context value %f. Context %@ meets the required threshold.", (uint8_t *)&v13, 0x2Au);
    }
  }
  return v6 < v9;
}

- (id)betaPaymentNetworksForRegion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(PKPaymentWebServiceContext *)self configuration];
  id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v7 = [v5 betaPaymentNetworksForRegion:v4];
  __int16 v25 = (void *)[v6 initWithArray:v7];

  id v20 = v5;
  uint64_t v21 = v4;
  double v8 = [v5 betaPaymentNetworkVersionsForRegion:v4];
  int64_t v24 = +[PKOSVersionRequirement fromDeviceVersion];
  __int16 v23 = PKDeviceClass();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "PKIntegerForKey:", @"cardType"));
        __int16 v15 = [PKOSVersionRequirementRange alloc];
        double v16 = [v13 PKDictionaryForKey:@"version"];
        __int16 v17 = [(PKOSVersionRequirementRange *)v15 initWithDictionary:v16];

        if (v17)
        {
          if ([(PKOSVersionRequirementRange *)v17 versionMeetsRequirements:v24 deviceClass:v23])
          {
            [v25 addObject:v14];
          }
          else
          {
            [v25 removeObject:v14];
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  double v18 = (void *)[v25 copy];
  return v18;
}

- (double)_contextProvisioningEnablementValue
{
  id v2 = [(PKPaymentWebServiceContext *)self secureElementID];
  char v3 = (const char *)[v2 UTF8String];

  if (!v3) {
    return 0.0;
  }
  size_t v4 = strlen(v3);
  if (v4)
  {
    unsigned int v5 = 0;
    do
    {
      int v6 = *v3++;
      unsigned int v5 = 33 * v5 + v6;
      --v4;
    }
    while (v4);
    double v7 = (double)(v5 % 0x64);
  }
  else
  {
    double v7 = 0.0;
  }
  return v7 / 100.0;
}

- (id)applyServiceFeaturesForRegionMeetingEnablementThreshold:(id)a3
{
  size_t v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  double v7 = [(PKPaymentWebServiceContext *)self configuration];
  [(PKPaymentWebServiceContext *)self _contextProvisioningEnablementValue];
  uint64_t v9 = v8;
  uint64_t v10 = [v7 applyServiceFeaturesForRegion:v5];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__PKPaymentWebServiceContext_applyServiceFeaturesForRegionMeetingEnablementThreshold___block_invoke;
  v15[3] = &unk_1E56EB860;
  double v16 = @"enablementThreshold";
  uint64_t v18 = v9;
  id v11 = v6;
  id v17 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:v15];
  double v12 = v17;
  id v13 = v11;

  return v13;
}

void __86__PKPaymentWebServiceContext_applyServiceFeaturesForRegionMeetingEnablementThreshold___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = [v6 PKNumberForKey:*(void *)(a1 + 32)];
  [v7 doubleValue];
  double v9 = v8;
  if (v7 && *(double *)(a1 + 48) < v8) {
    [*(id *)(a1 + 40) setObject:v6 forKey:v5];
  }
  uint64_t v10 = PKLogFacilityTypeGetObject(0xDuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    int v12 = 138412802;
    id v13 = v5;
    __int16 v14 = 2048;
    double v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "%@ has a defined threshold of %f. This device has context value %f.", (uint8_t *)&v12, 0x20u);
  }
}

- (id)applyServiceLocalizationBundleForFeatureIdentifier:(unint64_t)a3 mainLanguageBundle:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    PKPassKitBundle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v7 = NSString;
  double v8 = [NSNumber numberWithUnsignedInteger:a3];
  double v9 = [v6 bundleIdentifier];
  uint64_t v10 = [v7 stringWithFormat:@"%@-%@", v8, v9];

  os_unfair_lock_lock(&self->_cacheLock);
  uint64_t v11 = [(NSMutableDictionary *)self->_featureSupportedLanguageCache objectForKey:v10];
  os_unfair_lock_unlock(&self->_cacheLock);
  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    id v12 = v6;
    os_unfair_lock_lock(&self->_cacheLock);
    [(NSMutableDictionary *)self->_featureSupportedLanguageCache setObject:v12 forKey:v10];
    os_unfair_lock_unlock(&self->_cacheLock);
  }

  return v12;
}

- (id)applyServicePreferredLanguageForFeatureIdentifier:(unint64_t)a3 mainLanguageBundle:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    PKPassKitBundle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v7 = [(PKPaymentWebServiceContext *)self configuration];
  double v8 = [(PKPaymentWebServiceContext *)self primaryRegionIdentifier];
  double v9 = [v7 applyServiceFeaturesForRegion:v8];

  uint64_t v10 = PKFeatureIdentifierToString(a3);
  uint64_t v11 = [v9 objectForKey:v10];

  id v12 = [v11 PKArrayForKey:@"applySupportedLanguages"];
  if (v12)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v13 = [v6 preferredLocalizations];
    uint64_t v27 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v27)
    {
      uint64_t v14 = *(void *)v34;
      uint64_t v25 = *(void *)v34;
      long long v26 = v9;
      long long v28 = v13;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v13);
          }
          __int16 v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v17 = v12;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v30;
            while (2)
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v30 != v20) {
                  objc_enumerationMutation(v17);
                }
                if (objc_msgSend(v16, "isEqualToString:", *(void *)(*((void *)&v29 + 1) + 8 * j), v25))
                {
                  __int16 v23 = v16;

                  double v9 = v26;
                  goto LABEL_27;
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }

          id v13 = v28;
          uint64_t v14 = v25;
        }
        double v9 = v26;
        uint64_t v27 = [v28 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v27);
    }
  }
  if (a3 == 2 || a3 == 5) {
    __int16 v23 = @"en";
  }
  else {
    __int16 v23 = 0;
  }
LABEL_27:

  return v23;
}

+ (void)_migrateContext:(id)a3
{
  id v4 = a3;
  if (![v4 version]) {
    [a1 _migrateFrom0To1:v4];
  }
}

+ (void)_migrateFrom0To1:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Migrating PKPaymentWebServiceContext from 0 to 1… ", buf, 2u);
  }

  id v5 = objc_alloc_init(PKSecureElement);
  id v6 = [PKPaymentWebServiceRegion alloc];
  double v7 = [v3 certificates];
  double v8 = PKLocalBrokerURL([v3 devSigned]);
  double v9 = PKTrustedServiceManagerURL();
  uint64_t v10 = PKPaymentServicesURL();
  uint64_t v11 = PKPaymentServicesURL();
  uint64_t v12 = [v3 consistencyCheckBackoffLevel];
  id v13 = [v3 lastUpdatedTag];
  uint64_t v14 = [(PKPaymentWebServiceRegion *)v6 initWithCeritficates:v7 brokerURL:v8 trustedServiceManagerURL:v9 trustedServiceManagerPushTopic:@"com.apple.seld" paymentServicesURL:v10 inAppPaymentServicesURL:v11 consistencyCheckBackoffLevel:v12 lastUpdatedTag:v13];

  BOOL v15 = [(PKSecureElement *)v5 isProductionSigned];
  __int16 v16 = @"paymentpass.com.apple.dev1";
  if (v15) {
    __int16 v16 = @"paymentpass.com.apple";
  }
  uint64_t v21 = v16;
  v22[0] = v14;
  id v17 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v18 = v16;
  uint64_t v19 = [v17 dictionaryWithObjects:v22 forKeys:&v21 count:1];
  [v3 setRegions:v19];
  [v3 setPrimaryRegionIdentifier:v18];

  [v3 setCertificates:0];
  [v3 setLastUpdatedTag:0];
  [v3 setConsistencyCheckBackoffLevel:0];
  [v3 setVersion:1];
}

- (NSString)nextPushToken
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNextPushToken:(id)a3
{
}

- (int64_t)registrationType
{
  return self->_registrationType;
}

- (void)setRegistrationType:(int64_t)a3
{
  self->_unint64_t registrationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedTag, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_primaryRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationDate, 0);
  objc_storeStrong((id *)&self->_archivedDate, 0);
  objc_storeStrong((id *)&self->_registrationDate, 0);
  objc_storeStrong((id *)&self->_companionSerialNumber, 0);
  objc_storeStrong((id *)&self->_nextPushToken, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_secureElementID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_featureSupportedLanguageCache, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_verificationRequestsByPassUniqueID, 0);
}

@end