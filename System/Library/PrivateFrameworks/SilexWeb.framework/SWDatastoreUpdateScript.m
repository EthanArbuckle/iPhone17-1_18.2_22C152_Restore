@interface SWDatastoreUpdateScript
+ (id)executableSource;
+ (id)userScriptSource;
- (BOOL)queueable;
- (NSString)executableScript;
- (NSString)identifier;
- (SWDatastore)datastore;
- (SWDatastore)oldDatastore;
- (SWDatastoreUpdateScript)initWithDatastore:(id)a3 oldDatastore:(id)a4 originatingSession:(id)a5;
- (SWSession)originatingSession;
- (WKUserScript)userScript;
@end

@implementation SWDatastoreUpdateScript

- (SWDatastoreUpdateScript)initWithDatastore:(id)a3 oldDatastore:(id)a4 originatingSession:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SWDatastoreUpdateScript;
  v12 = [(SWDatastoreUpdateScript *)&v15 init];
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
  return (NSString *)@"datastore.update";
}

- (BOOL)queueable
{
  return 0;
}

- (WKUserScript)userScript
{
  v3 = NSString;
  v4 = [(id)objc_opt_class() userScriptSource];
  v5 = [(SWDatastoreUpdateScript *)self datastore];
  v6 = [v5 JSONString];
  v7 = objc_msgSend(v3, "stringWithFormat:", v4, v6);

  v8 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v7 injectionTime:0 forMainFrameOnly:1];
  return (WKUserScript *)v8;
}

+ (id)userScriptSource
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SWDatastoreUpdateScript_userScriptSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userScriptSource_onceToken_0 != -1) {
    dispatch_once(&userScriptSource_onceToken_0, block);
  }
  v2 = (void *)userScriptSource_source_0;
  return v2;
}

void __43__SWDatastoreUpdateScript_userScriptSource__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v0 URLForResource:@"datastore-init" withExtension:@"js"];

  uint64_t v1 = [NSString stringWithContentsOfURL:v3 encoding:4 error:0];
  v2 = (void *)userScriptSource_source_0;
  userScriptSource_source_0 = v1;
}

- (NSString)executableScript
{
  id v3 = NSString;
  v4 = [(id)objc_opt_class() executableSource];
  v5 = [(SWDatastoreUpdateScript *)self datastore];
  v6 = [v5 JSONString];
  v7 = [(SWDatastoreUpdateScript *)self oldDatastore];
  v8 = [v7 JSONString];
  id v9 = [(SWDatastoreUpdateScript *)self originatingSession];
  id v10 = [v9 identifier];
  id v11 = objc_msgSend(v3, "stringWithFormat:", v4, v6, v8, v10);

  return (NSString *)v11;
}

+ (id)executableSource
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SWDatastoreUpdateScript_executableSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (executableSource_onceToken_0 != -1) {
    dispatch_once(&executableSource_onceToken_0, block);
  }
  v2 = (void *)executableSource_source_0;
  return v2;
}

void __43__SWDatastoreUpdateScript_executableSource__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v0 URLForResource:@"datastore-update" withExtension:@"js"];

  uint64_t v1 = [NSString stringWithContentsOfURL:v3 encoding:4 error:0];
  v2 = (void *)executableSource_source_0;
  executableSource_source_0 = v1;
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