@interface SWLocalDatastoreUpdateScript
+ (id)executableSource;
+ (id)userScriptSource;
- (BOOL)queueable;
- (NSString)executableScript;
- (NSString)identifier;
- (SWDatastore)datastore;
- (SWDatastore)oldDatastore;
- (SWLocalDatastoreUpdateScript)initWithDatastore:(id)a3 oldDatastore:(id)a4 originatingSession:(id)a5;
- (SWSession)originatingSession;
- (WKUserScript)userScript;
@end

@implementation SWLocalDatastoreUpdateScript

- (SWLocalDatastoreUpdateScript)initWithDatastore:(id)a3 oldDatastore:(id)a4 originatingSession:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SWLocalDatastoreUpdateScript;
  v12 = [(SWLocalDatastoreUpdateScript *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_datastore, a3);
    objc_storeStrong((id *)&v13->_oldDatastore, a4);
    objc_storeStrong((id *)&v13->_originatingSession, a5);
  }

  return v13;
}

- (NSString)identifier
{
  return (NSString *)@"localDatastore.update";
}

- (BOOL)queueable
{
  return 0;
}

- (WKUserScript)userScript
{
  v3 = NSString;
  v4 = [(id)objc_opt_class() userScriptSource];
  v5 = [(SWLocalDatastoreUpdateScript *)self datastore];
  v6 = [v5 JSONString];
  v7 = objc_msgSend(v3, "stringWithFormat:", v4, v6);

  v8 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v7 injectionTime:0 forMainFrameOnly:1];
  return (WKUserScript *)v8;
}

+ (id)userScriptSource
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SWLocalDatastoreUpdateScript_userScriptSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userScriptSource_onceToken != -1) {
    dispatch_once(&userScriptSource_onceToken, block);
  }
  v2 = (void *)userScriptSource_source;
  return v2;
}

void __48__SWLocalDatastoreUpdateScript_userScriptSource__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v0 URLForResource:@"local-datastore-init" withExtension:@"js"];

  uint64_t v1 = [NSString stringWithContentsOfURL:v3 encoding:4 error:0];
  v2 = (void *)userScriptSource_source;
  userScriptSource_source = v1;
}

- (NSString)executableScript
{
  id v3 = NSString;
  v4 = [(id)objc_opt_class() executableSource];
  v5 = [(SWLocalDatastoreUpdateScript *)self datastore];
  v6 = [v5 JSONString];
  v7 = [(SWLocalDatastoreUpdateScript *)self oldDatastore];
  v8 = [v7 JSONString];
  id v9 = NSString;
  id v10 = [(SWLocalDatastoreUpdateScript *)self originatingSession];
  id v11 = [v10 identifier];
  v12 = [v9 stringWithFormat:@"{'session': '%@'}", v11];
  v13 = objc_msgSend(v3, "stringWithFormat:", v4, v6, v8, v12);

  return (NSString *)v13;
}

+ (id)executableSource
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SWLocalDatastoreUpdateScript_executableSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (executableSource_onceToken != -1) {
    dispatch_once(&executableSource_onceToken, block);
  }
  v2 = (void *)executableSource_source;
  return v2;
}

void __48__SWLocalDatastoreUpdateScript_executableSource__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v0 URLForResource:@"local-datastore-update" withExtension:@"js"];

  uint64_t v1 = [NSString stringWithContentsOfURL:v3 encoding:4 error:0];
  v2 = (void *)executableSource_source;
  executableSource_source = v1;
}

- (SWDatastore)datastore
{
  return self->_datastore;
}

- (SWDatastore)oldDatastore
{
  return self->_oldDatastore;
}

- (SWSession)originatingSession
{
  return self->_originatingSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingSession, 0);
  objc_storeStrong((id *)&self->_oldDatastore, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
}

@end