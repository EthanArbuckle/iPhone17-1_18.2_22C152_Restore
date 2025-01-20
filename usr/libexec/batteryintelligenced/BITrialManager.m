@interface BITrialManager
- (BITrialManager)initWithNamespaceId:(unsigned int)a3;
- (NSString)trialNamespaceName;
- (OS_os_log)log;
- (TRIClient)trialClient;
- (TRIExperimentIdentifiers)experimentIdentifiers;
- (TRITrackingId)trialTrackingID;
- (id)loadCompiledModelFromPath:(id)a3 withConfiguration:(id)a4;
- (id)loadTrialMLModelForModelName:(id)a3 withConfiguration:(id)a4;
- (id)trialFactorLevel:(id)a3;
- (void)setExperimentIdentifiers:(id)a3;
- (void)setLog:(id)a3;
- (void)setTrialClient:(id)a3;
- (void)setTrialNamespaceName:(id)a3;
- (void)setTrialTrackingID:(id)a3;
@end

@implementation BITrialManager

- (BITrialManager)initWithNamespaceId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v20.receiver = self;
  v20.super_class = (Class)BITrialManager;
  v4 = [(BITrialManager *)&v20 init];
  if (!v4) {
    goto LABEL_5;
  }
  os_log_t v5 = os_log_create("com.apple.batteryintelligence", "trialmanager");
  log = v4->_log;
  v4->_log = (OS_os_log *)v5;

  uint64_t v7 = +[TRIClient clientWithIdentifier:349];
  trialClient = v4->_trialClient;
  v4->_trialClient = (TRIClient *)v7;

  v9 = v4->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v4->_trialClient;
    *(_DWORD *)buf = 138412290;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trial Client %@", buf, 0xCu);
  }
  uint64_t v11 = [(TRIClient *)v4->_trialClient trackingId];
  trialTrackingID = v4->_trialTrackingID;
  v4->_trialTrackingID = (TRITrackingId *)v11;

  uint64_t v13 = +[TRINamespace namespaceNameFromId:v3];
  trialNamespaceName = v4->_trialNamespaceName;
  v4->_trialNamespaceName = (NSString *)v13;

  uint64_t v15 = [(TRIClient *)v4->_trialClient experimentIdentifiersWithNamespaceName:v4->_trialNamespaceName];
  experimentIdentifiers = v4->_experimentIdentifiers;
  v4->_experimentIdentifiers = (TRIExperimentIdentifiers *)v15;

  if (!v4->_experimentIdentifiers)
  {
    v18 = v4->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10001F678(v18);
    }
    v17 = 0;
  }
  else
  {
LABEL_5:
    v17 = v4;
  }

  return v17;
}

- (id)trialFactorLevel:(id)a3
{
  return [(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:self->_trialNamespaceName];
}

- (id)loadCompiledModelFromPath:(id)a3 withConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)os_transaction_create();
  log = self->_log;
  if (v6)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_10001F800((uint64_t)v6, log);
    }
    v10 = +[NSURL fileURLWithPath:v6];
    uint64_t v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10001F788((uint64_t)v10, v11);
    }
    if (v7)
    {
      uint64_t v20 = 0;
      v12 = (id *)&v20;
      uint64_t v13 = +[MLModel modelWithContentsOfURL:v10 configuration:v7 error:&v20];
    }
    else
    {
      uint64_t v21 = 0;
      v12 = (id *)&v21;
      uint64_t v13 = +[MLModel modelWithContentsOfURL:v10 error:&v21];
    }
    uint64_t v15 = (void *)v13;
    id v16 = *v12;
    v17 = self->_log;
    if (v16 || !v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10001F700((uint64_t)v10, (uint64_t)v16, v17);
      }
      id v14 = 0;
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Successfully loaded compiled model.", v19, 2u);
      }
      id v14 = v15;
    }
  }
  else
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_10001F6BC(log);
    }
    id v14 = 0;
  }

  return v14;
}

- (id)loadTrialMLModelForModelName:(id)a3 withConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Loading ML model with factor name: %@ from trial.", (uint8_t *)&v14, 0xCu);
  }
  v9 = [(BITrialManager *)self trialFactorLevel:v6];
  v10 = [v9 directoryValue];
  uint64_t v11 = [v10 path];
  v12 = [(BITrialManager *)self loadCompiledModelFromPath:v11 withConfiguration:v7];

  return v12;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (NSString)trialNamespaceName
{
  return self->_trialNamespaceName;
}

- (void)setTrialNamespaceName:(id)a3
{
}

- (TRIExperimentIdentifiers)experimentIdentifiers
{
  return (TRIExperimentIdentifiers *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExperimentIdentifiers:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (TRITrackingId)trialTrackingID
{
  return (TRITrackingId *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTrialTrackingID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_trialNamespaceName, 0);

  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end