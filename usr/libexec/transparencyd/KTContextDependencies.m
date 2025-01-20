@interface KTContextDependencies
- (KTAccountKeyProtocol)accountKeyServer;
- (KTApplicationPublicKeyStore)applicationKeyStore;
- (KTCloudRecordsProtocol)cloudRecords;
- (KTContextDependencies)initWithOperationDependencies:(id)a3 application:(id)a4;
- (KTContextStore)contextStore;
- (KTKVSProtocol)kvs;
- (KTLogClientProtocol)logClient;
- (KTSMDataStore)smDataStore;
- (KTSMManager)stateMachine;
- (KTTapToRadarProtocol)tapToRadar;
- (TransparencyAnalytics)analyticsLogger;
- (TransparencyFollowUpProtocol)followup;
- (TransparencyManagedDataStore)dataStore;
- (TransparencySettingsProtocol)settings;
- (TransparencyStaticKeyStore)staticKeyStore;
- (_TtC13transparencyd28KTEligibilityStatusReporting)eligibilityStatusReporter;
- (void)setAccountKeyServer:(id)a3;
- (void)setAnalyticsLogger:(id)a3;
- (void)setApplicationKeyStore:(id)a3;
- (void)setCloudRecords:(id)a3;
- (void)setContextStore:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setEligibilityStatusReporter:(id)a3;
- (void)setFollowup:(id)a3;
- (void)setKvs:(id)a3;
- (void)setLogClient:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSmDataStore:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStaticKeyStore:(id)a3;
- (void)setTapToRadar:(id)a3;
@end

@implementation KTContextDependencies

- (KTContextDependencies)initWithOperationDependencies:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)KTContextDependencies;
  v8 = [(KTContextDependencies *)&v22 init];
  if (v8)
  {
    v9 = [v6 publicKeyStore];
    v10 = [v9 applicationPublicKeyStore:v7];
    [(KTContextDependencies *)v8 setApplicationKeyStore:v10];

    v11 = [v6 dataStore];
    [(KTContextDependencies *)v8 setDataStore:v11];

    v12 = [v6 staticKeyStore];
    [(KTContextDependencies *)v8 setStaticKeyStore:v12];

    v13 = [v6 logClient];
    [(KTContextDependencies *)v8 setLogClient:v13];

    v14 = [v6 contextStore];
    [(KTContextDependencies *)v8 setContextStore:v14];

    v15 = [v6 accountKeyService];
    v16 = [v15 accountKeyService:v7];
    [(KTContextDependencies *)v8 setAccountKeyServer:v16];

    v17 = [v6 kvs];
    [(KTContextDependencies *)v8 setKvs:v17];

    v18 = [v6 followup];
    [(KTContextDependencies *)v8 setFollowup:v18];

    v19 = [v6 cloudRecords];
    [(KTContextDependencies *)v8 setCloudRecords:v19];

    v20 = [v6 settings];
    [(KTContextDependencies *)v8 setSettings:v20];
  }
  return v8;
}

- (KTApplicationPublicKeyStore)applicationKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApplicationKeyStore:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataStore:(id)a3
{
}

- (KTSMDataStore)smDataStore
{
  return (KTSMDataStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSmDataStore:(id)a3
{
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStaticKeyStore:(id)a3
{
}

- (KTLogClientProtocol)logClient
{
  return (KTLogClientProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogClient:(id)a3
{
}

- (KTContextStore)contextStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextStore);

  return (KTContextStore *)WeakRetained;
}

- (void)setContextStore:(id)a3
{
}

- (KTSMManager)stateMachine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMachine);

  return (KTSMManager *)WeakRetained;
}

- (void)setStateMachine:(id)a3
{
}

- (KTAccountKeyProtocol)accountKeyServer
{
  return (KTAccountKeyProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAccountKeyServer:(id)a3
{
}

- (KTKVSProtocol)kvs
{
  return (KTKVSProtocol *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKvs:(id)a3
{
}

- (TransparencyFollowUpProtocol)followup
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFollowup:(id)a3
{
}

- (KTCloudRecordsProtocol)cloudRecords
{
  return (KTCloudRecordsProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCloudRecords:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSettings:(id)a3
{
}

- (TransparencyAnalytics)analyticsLogger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAnalyticsLogger:(id)a3
{
}

- (KTTapToRadarProtocol)tapToRadar
{
  return (KTTapToRadarProtocol *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTapToRadar:(id)a3
{
}

- (_TtC13transparencyd28KTEligibilityStatusReporting)eligibilityStatusReporter
{
  return (_TtC13transparencyd28KTEligibilityStatusReporting *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEligibilityStatusReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibilityStatusReporter, 0);
  objc_storeStrong((id *)&self->_tapToRadar, 0);
  objc_storeStrong((id *)&self->_analyticsLogger, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_cloudRecords, 0);
  objc_storeStrong((id *)&self->_followup, 0);
  objc_storeStrong((id *)&self->_kvs, 0);
  objc_storeStrong((id *)&self->_accountKeyServer, 0);
  objc_destroyWeak((id *)&self->_stateMachine);
  objc_destroyWeak((id *)&self->_contextStore);
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_storeStrong((id *)&self->_staticKeyStore, 0);
  objc_storeStrong((id *)&self->_smDataStore, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);

  objc_storeStrong((id *)&self->_applicationKeyStore, 0);
}

@end