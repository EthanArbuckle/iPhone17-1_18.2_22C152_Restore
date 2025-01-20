@interface SWLocalDatastoreSetupScript
+ (id)source;
- (BOOL)queueable;
- (NSString)identifier;
- (SWDatastore)datastore;
- (SWLocalDatastoreSetupScript)initWithDatastore:(id)a3;
- (WKUserScript)userScript;
@end

@implementation SWLocalDatastoreSetupScript

- (SWLocalDatastoreSetupScript)initWithDatastore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWLocalDatastoreSetupScript;
  v6 = [(SWLocalDatastoreSetupScript *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_datastore, a3);
  }

  return v7;
}

- (NSString)identifier
{
  return (NSString *)@"localDatastore.setup";
}

- (BOOL)queueable
{
  return 0;
}

- (WKUserScript)userScript
{
  v3 = NSString;
  v4 = [(id)objc_opt_class() source];
  id v5 = [(SWLocalDatastoreSetupScript *)self datastore];
  v6 = [v5 JSONString];
  v7 = objc_msgSend(v3, "stringWithFormat:", v4, v6);

  v8 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v7 injectionTime:0 forMainFrameOnly:1];
  return (WKUserScript *)v8;
}

+ (id)source
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SWLocalDatastoreSetupScript_source__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (source_onceToken != -1) {
    dispatch_once(&source_onceToken, block);
  }
  v2 = (void *)source_source;
  return v2;
}

void __37__SWLocalDatastoreSetupScript_source__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v0 URLForResource:@"local-datastore-setup" withExtension:@"js"];

  uint64_t v1 = [NSString stringWithContentsOfURL:v3 encoding:4 error:0];
  v2 = (void *)source_source;
  source_source = v1;
}

- (SWDatastore)datastore
{
  return self->_datastore;
}

- (void).cxx_destruct
{
}

@end