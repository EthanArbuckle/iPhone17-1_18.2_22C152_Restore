@interface KTOperationDependencies
- (CKDatabase)ckdatabase;
- (Class)pcsOperationsClass;
- (DewConfigurationObjectiveCProtocol)dew;
- (EligibilitySupportProtocol)eligibilitySupport;
- (IDSReportingProtocol)idsReporting;
- (KTAccountDependency)accountOperations;
- (KTAccountKeyServerProtocol)accountKeyService;
- (KTAccountStateHolderProtocol)accountStateHolder;
- (KTBAAOperationProtocol)certFetcher;
- (KTCloudKitAccountStateTrackingProvider)cloudKitAccountTracker;
- (KTCloudRecordsProtocol)cloudRecords;
- (KTContextStoreProtocol)contextStore;
- (KTDeviceInformationProtocol)deviceInformation;
- (KTFetchCloudStorageProtocol)fetchCloudStorage;
- (KTIDMSOperationProtocol)idmsOperations;
- (KTIDSAccountTracker)idsAccountTracker;
- (KTIDSOperations)idsOperations;
- (KTKVSProtocol)kvs;
- (KTLockStateTracker)lockStateTracker;
- (KTLogClientProtocol)logClient;
- (KTNearFutureScheduler)cloudKitOutgoingNFS;
- (KTNetworkTimeoutBucketProtocol)networkTimeout;
- (KTOctagonOperations)octagonOperations;
- (KTPublicKeyStoreProtocol)publicKeyStore;
- (KTReachabilityTracker)reachabilityTracker;
- (KTRebootTrackerProtocol)rebootTracker;
- (KTSMDataStore)smDataStore;
- (KTStateFlagHandler)flagHandler;
- (KTSystemStateProtocol)stateMonitor;
- (KTTapToRadarProtocol)tapToRadar;
- (TransparencyAnalytics)logger;
- (TransparencyFollowUpProtocol)followup;
- (TransparencyIDSConfigBagProtocol)idsConfigBag;
- (TransparencyManagedDataStore)dataStore;
- (TransparencySettingsProtocol)settings;
- (TransparencyStaticKeyStore)staticKeyStore;
- (void)setAccountKeyService:(id)a3;
- (void)setAccountOperations:(id)a3;
- (void)setAccountStateHolder:(id)a3;
- (void)setCertFetcher:(id)a3;
- (void)setCkdatabase:(id)a3;
- (void)setCloudKitAccountTracker:(id)a3;
- (void)setCloudKitOutgoingNFS:(id)a3;
- (void)setCloudRecords:(id)a3;
- (void)setContextStore:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setDeviceInformation:(id)a3;
- (void)setDew:(id)a3;
- (void)setEligibilitySupport:(id)a3;
- (void)setFetchCloudStorage:(id)a3;
- (void)setFlagHandler:(id)a3;
- (void)setFollowup:(id)a3;
- (void)setIdmsOperations:(id)a3;
- (void)setIdsAccountTracker:(id)a3;
- (void)setIdsConfigBag:(id)a3;
- (void)setIdsOperations:(id)a3;
- (void)setIdsReporting:(id)a3;
- (void)setKvs:(id)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setLogClient:(id)a3;
- (void)setLogger:(id)a3;
- (void)setNetworkTimeout:(id)a3;
- (void)setOctagonOperations:(id)a3;
- (void)setPcsOperationsClass:(Class)a3;
- (void)setPublicKeyStore:(id)a3;
- (void)setReachabilityTracker:(id)a3;
- (void)setRebootTracker:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSmDataStore:(id)a3;
- (void)setStateMonitor:(id)a3;
- (void)setStaticKeyStore:(id)a3;
- (void)setTapToRadar:(id)a3;
@end

@implementation KTOperationDependencies

- (Class)pcsOperationsClass
{
  return (Class)objc_getProperty(self, a2, 8, 1);
}

- (void)setPcsOperationsClass:(Class)a3
{
}

- (KTAccountDependency)accountOperations
{
  return (KTAccountDependency *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountOperations:(id)a3
{
}

- (KTLockStateTracker)lockStateTracker
{
  return (KTLockStateTracker *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (KTReachabilityTracker)reachabilityTracker
{
  return (KTReachabilityTracker *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReachabilityTracker:(id)a3
{
}

- (KTNetworkTimeoutBucketProtocol)networkTimeout
{
  return (KTNetworkTimeoutBucketProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNetworkTimeout:(id)a3
{
}

- (KTCloudKitAccountStateTrackingProvider)cloudKitAccountTracker
{
  return (KTCloudKitAccountStateTrackingProvider *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCloudKitAccountTracker:(id)a3
{
}

- (KTIDSOperations)idsOperations
{
  return (KTIDSOperations *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdsOperations:(id)a3
{
}

- (KTIDSAccountTracker)idsAccountTracker
{
  return (KTIDSAccountTracker *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIdsAccountTracker:(id)a3
{
}

- (KTOctagonOperations)octagonOperations
{
  return (KTOctagonOperations *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOctagonOperations:(id)a3
{
}

- (KTLogClientProtocol)logClient
{
  return (KTLogClientProtocol *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLogClient:(id)a3
{
}

- (KTIDMSOperationProtocol)idmsOperations
{
  return (KTIDMSOperationProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIdmsOperations:(id)a3
{
}

- (KTSMDataStore)smDataStore
{
  return (KTSMDataStore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSmDataStore:(id)a3
{
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLogger:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDataStore:(id)a3
{
}

- (KTContextStoreProtocol)contextStore
{
  return (KTContextStoreProtocol *)objc_getProperty(self, a2, 120, 1);
}

- (void)setContextStore:(id)a3
{
}

- (KTAccountKeyServerProtocol)accountKeyService
{
  return (KTAccountKeyServerProtocol *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAccountKeyService:(id)a3
{
}

- (KTKVSProtocol)kvs
{
  return (KTKVSProtocol *)objc_getProperty(self, a2, 136, 1);
}

- (void)setKvs:(id)a3
{
}

- (KTPublicKeyStoreProtocol)publicKeyStore
{
  return (KTPublicKeyStoreProtocol *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPublicKeyStore:(id)a3
{
}

- (KTAccountStateHolderProtocol)accountStateHolder
{
  return (KTAccountStateHolderProtocol *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAccountStateHolder:(id)a3
{
}

- (KTBAAOperationProtocol)certFetcher
{
  return (KTBAAOperationProtocol *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCertFetcher:(id)a3
{
}

- (KTStateFlagHandler)flagHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flagHandler);

  return (KTStateFlagHandler *)WeakRetained;
}

- (void)setFlagHandler:(id)a3
{
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_getProperty(self, a2, 176, 1);
}

- (void)setStaticKeyStore:(id)a3
{
}

- (CKDatabase)ckdatabase
{
  return (CKDatabase *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCkdatabase:(id)a3
{
}

- (KTCloudRecordsProtocol)cloudRecords
{
  return (KTCloudRecordsProtocol *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCloudRecords:(id)a3
{
}

- (KTFetchCloudStorageProtocol)fetchCloudStorage
{
  return (KTFetchCloudStorageProtocol *)objc_getProperty(self, a2, 200, 1);
}

- (void)setFetchCloudStorage:(id)a3
{
}

- (KTDeviceInformationProtocol)deviceInformation
{
  return (KTDeviceInformationProtocol *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDeviceInformation:(id)a3
{
}

- (TransparencyFollowUpProtocol)followup
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 216, 1);
}

- (void)setFollowup:(id)a3
{
}

- (KTSystemStateProtocol)stateMonitor
{
  return (KTSystemStateProtocol *)objc_getProperty(self, a2, 224, 1);
}

- (void)setStateMonitor:(id)a3
{
}

- (TransparencyIDSConfigBagProtocol)idsConfigBag
{
  return (TransparencyIDSConfigBagProtocol *)objc_getProperty(self, a2, 232, 1);
}

- (void)setIdsConfigBag:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSettings:(id)a3
{
}

- (DewConfigurationObjectiveCProtocol)dew
{
  return (DewConfigurationObjectiveCProtocol *)objc_getProperty(self, a2, 248, 1);
}

- (void)setDew:(id)a3
{
}

- (KTRebootTrackerProtocol)rebootTracker
{
  return (KTRebootTrackerProtocol *)objc_getProperty(self, a2, 256, 1);
}

- (void)setRebootTracker:(id)a3
{
}

- (IDSReportingProtocol)idsReporting
{
  return (IDSReportingProtocol *)objc_getProperty(self, a2, 264, 1);
}

- (void)setIdsReporting:(id)a3
{
}

- (EligibilitySupportProtocol)eligibilitySupport
{
  return (EligibilitySupportProtocol *)objc_getProperty(self, a2, 272, 1);
}

- (void)setEligibilitySupport:(id)a3
{
}

- (KTTapToRadarProtocol)tapToRadar
{
  return (KTTapToRadarProtocol *)objc_getProperty(self, a2, 280, 1);
}

- (void)setTapToRadar:(id)a3
{
}

- (KTNearFutureScheduler)cloudKitOutgoingNFS
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 288, 1);
}

- (void)setCloudKitOutgoingNFS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitOutgoingNFS, 0);
  objc_storeStrong((id *)&self->_tapToRadar, 0);
  objc_storeStrong((id *)&self->_eligibilitySupport, 0);
  objc_storeStrong((id *)&self->_idsReporting, 0);
  objc_storeStrong((id *)&self->_rebootTracker, 0);
  objc_storeStrong((id *)&self->_dew, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_idsConfigBag, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_followup, 0);
  objc_storeStrong((id *)&self->_deviceInformation, 0);
  objc_storeStrong((id *)&self->_fetchCloudStorage, 0);
  objc_storeStrong((id *)&self->_cloudRecords, 0);
  objc_storeStrong((id *)&self->_ckdatabase, 0);
  objc_storeStrong((id *)&self->_staticKeyStore, 0);
  objc_destroyWeak((id *)&self->_flagHandler);
  objc_storeStrong((id *)&self->_certFetcher, 0);
  objc_storeStrong((id *)&self->_accountStateHolder, 0);
  objc_storeStrong((id *)&self->_publicKeyStore, 0);
  objc_storeStrong((id *)&self->_kvs, 0);
  objc_storeStrong((id *)&self->_accountKeyService, 0);
  objc_storeStrong((id *)&self->_contextStore, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_smDataStore, 0);
  objc_storeStrong((id *)&self->_idmsOperations, 0);
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_storeStrong((id *)&self->_octagonOperations, 0);
  objc_storeStrong((id *)&self->_idsAccountTracker, 0);
  objc_storeStrong((id *)&self->_idsOperations, 0);
  objc_storeStrong((id *)&self->_cloudKitAccountTracker, 0);
  objc_storeStrong((id *)&self->_networkTimeout, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_accountOperations, 0);

  objc_storeStrong((id *)&self->_pcsOperationsClass, 0);
}

@end