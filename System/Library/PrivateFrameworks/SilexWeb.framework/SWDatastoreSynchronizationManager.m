@interface SWDatastoreSynchronizationManager
- (SWDatastoreFactory)settingsFactory;
- (SWDatastoreManager)datastoreManager;
- (SWDatastoreManager)localDatastoreManager;
- (SWDatastoreSynchronizationManager)initWithSettingsFactory:(id)a3 scriptsManager:(id)a4 messageHandlerManager:(id)a5 sessionManager:(id)a6 logger:(id)a7;
- (SWLogger)logger;
- (SWScriptsManager)scriptsManager;
- (SWSessionManager)sessionManager;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
- (void)setDatastoreManager:(id)a3;
- (void)setLocalDatastoreManager:(id)a3;
- (void)synchronizeDatastore:(id)a3 from:(id)a4 previousDatastore:(id)a5 originatingSession:(id)a6 completion:(id)a7;
@end

@implementation SWDatastoreSynchronizationManager

- (SWDatastoreSynchronizationManager)initWithSettingsFactory:(id)a3 scriptsManager:(id)a4 messageHandlerManager:(id)a5 sessionManager:(id)a6 logger:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SWDatastoreSynchronizationManager;
  v18 = [(SWDatastoreSynchronizationManager *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_settingsFactory, a3);
    objc_storeStrong((id *)&v19->_scriptsManager, a4);
    objc_storeStrong((id *)&v19->_sessionManager, a6);
    objc_storeStrong((id *)&v19->_logger, a7);
    [v15 addMessageHandler:v19 name:@"datastore"];
    [v15 addMessageHandler:v19 name:@"localDatastore"];
  }

  return v19;
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v5 = a3;
  v6 = [v5 name];
  int v7 = [v6 isEqualToString:@"localDatastore"];

  v8 = [(SWDatastoreSynchronizationManager *)self logger];
  v9 = NSString;
  uint64_t v10 = [v5 body];
  v11 = (void *)v10;
  if (v7)
  {
    v12 = [v9 stringWithFormat:@"Received local datastore update message: %@", v10];
    [v8 log:v12];

    id v13 = [(SWDatastoreSynchronizationManager *)self settingsFactory];
    id v19 = [v13 createDatastoreFromMessage:v5];

    [(SWDatastoreSynchronizationManager *)self localDatastoreManager];
  }
  else
  {
    id v14 = [v9 stringWithFormat:@"Received shared datastore update message: %@", v10];
    [v8 log:v14];

    id v15 = [(SWDatastoreSynchronizationManager *)self settingsFactory];
    id v19 = [v15 createDatastoreFromMessage:v5];

    [(SWDatastoreSynchronizationManager *)self datastoreManager];
  id v16 = };
  id v17 = [(SWDatastoreSynchronizationManager *)self sessionManager];
  v18 = [v17 session];
  [v16 updateDatastore:v19 originatingSession:v18 forceUpdate:0 completion:0];
}

- (void)synchronizeDatastore:(id)a3 from:(id)a4 previousDatastore:(id)a5 originatingSession:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(SWDatastoreSynchronizationManager *)self localDatastoreManager];

  v18 = [(SWDatastoreSynchronizationManager *)self logger];
  id v19 = NSString;
  uint64_t v20 = [v13 identifier];
  objc_super v21 = (void *)v20;
  if (v17 == v15)
  {
    v24 = [v19 stringWithFormat:@"Received local datastore change callback with originating session: %@", v20];
    [v18 log:v24];

    v23 = SWLocalDatastoreUpdateScript;
  }
  else
  {
    v22 = [v19 stringWithFormat:@"Received shared datastore change callback with originating session: %@", v20];
    [v18 log:v22];

    v23 = SWDatastoreUpdateScript;
  }
  id v29 = (id)[[v23 alloc] initWithDatastore:v16 oldDatastore:v14 originatingSession:v13];

  v25 = [(SWDatastoreSynchronizationManager *)self scriptsManager];
  v26 = [v29 identifier];
  [v25 removeScriptByIdentifier:v26];

  v27 = [(SWDatastoreSynchronizationManager *)self scriptsManager];
  [v27 executeScript:v29 completion:v12];

  v28 = [(SWDatastoreSynchronizationManager *)self scriptsManager];
  [v28 addScript:v29];
}

- (SWDatastoreManager)datastoreManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datastoreManager);
  return (SWDatastoreManager *)WeakRetained;
}

- (void)setDatastoreManager:(id)a3
{
}

- (SWDatastoreManager)localDatastoreManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDatastoreManager);
  return (SWDatastoreManager *)WeakRetained;
}

- (void)setLocalDatastoreManager:(id)a3
{
}

- (SWDatastoreFactory)settingsFactory
{
  return self->_settingsFactory;
}

- (SWScriptsManager)scriptsManager
{
  return self->_scriptsManager;
}

- (SWSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_scriptsManager, 0);
  objc_storeStrong((id *)&self->_settingsFactory, 0);
  objc_destroyWeak((id *)&self->_localDatastoreManager);
  objc_destroyWeak((id *)&self->_datastoreManager);
}

@end