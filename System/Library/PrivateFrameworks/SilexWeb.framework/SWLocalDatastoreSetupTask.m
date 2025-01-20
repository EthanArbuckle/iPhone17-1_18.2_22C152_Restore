@interface SWLocalDatastoreSetupTask
- (NSString)identifier;
- (SWDatastoreManager)datastoreManager;
- (SWLocalDatastoreSetupTask)initWithDatastoreManager:(id)a3 scriptsManager:(id)a4;
- (SWScriptsManager)scriptsManager;
- (void)performSetup;
@end

@implementation SWLocalDatastoreSetupTask

- (SWLocalDatastoreSetupTask)initWithDatastoreManager:(id)a3 scriptsManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWLocalDatastoreSetupTask;
  v9 = [(SWLocalDatastoreSetupTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_datastoreManager, a3);
    objc_storeStrong((id *)&v10->_scriptsManager, a4);
  }

  return v10;
}

- (NSString)identifier
{
  return (NSString *)@"localDatastore";
}

- (void)performSetup
{
  v3 = [SWLocalDatastoreSetupScript alloc];
  v4 = [(SWLocalDatastoreSetupTask *)self datastoreManager];
  v5 = [v4 datastore];
  id v7 = [(SWLocalDatastoreSetupScript *)v3 initWithDatastore:v5];

  v6 = [(SWLocalDatastoreSetupTask *)self scriptsManager];
  [v6 addScript:v7];
}

- (SWDatastoreManager)datastoreManager
{
  return self->_datastoreManager;
}

- (SWScriptsManager)scriptsManager
{
  return self->_scriptsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptsManager, 0);
  objc_storeStrong((id *)&self->_datastoreManager, 0);
}

@end