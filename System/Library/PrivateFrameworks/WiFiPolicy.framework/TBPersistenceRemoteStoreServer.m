@interface TBPersistenceRemoteStoreServer
- (NSDictionary)serverOptions;
- (NSURL)modelURL;
- (NSURL)storeURL;
- (NSXPCStoreServer)xpcStoreServer;
- (TBPersistenceRemoteStoreServer)initWithStoreURL:(id)a3 modelURL:(id)a4 options:(id)a5;
- (void)setModelURL:(id)a3;
- (void)setServerOptions:(id)a3;
- (void)setStoreURL:(id)a3;
- (void)setXpcStoreServer:(id)a3;
- (void)startListening;
@end

@implementation TBPersistenceRemoteStoreServer

- (TBPersistenceRemoteStoreServer)initWithStoreURL:(id)a3 modelURL:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TBPersistenceRemoteStoreServer;
  v12 = [(TBPersistenceRemoteStoreServer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storeURL, a3);
    objc_storeStrong((id *)&v13->_modelURL, a4);
    objc_storeStrong((id *)&v13->_serverOptions, a5);
  }

  return v13;
}

- (void)startListening
{
  v3 = (void *)MEMORY[0x1D9440170](self, a2);
  v4 = objc_opt_new();
  id v5 = objc_alloc(MEMORY[0x1E4F1C1B8]);
  v6 = [(TBPersistenceRemoteStoreServer *)self storeURL];
  v7 = [(TBPersistenceRemoteStoreServer *)self modelURL];
  v8 = [(TBPersistenceRemoteStoreServer *)self serverOptions];
  id v9 = (void *)[v5 initForStoreWithURL:v6 usingModelAtURL:v7 options:v8 policy:v4];
  [(TBPersistenceRemoteStoreServer *)self setXpcStoreServer:v9];

  id v10 = [(TBPersistenceRemoteStoreServer *)self serverOptions];
  NSLog(&cfstr_SStartedListen.isa, "-[TBPersistenceRemoteStoreServer startListening]", v10);

  id v11 = [(TBPersistenceRemoteStoreServer *)self xpcStoreServer];
  [v11 startListening];
}

- (NSXPCStoreServer)xpcStoreServer
{
  return self->_xpcStoreServer;
}

- (void)setXpcStoreServer:(id)a3
{
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (NSDictionary)serverOptions
{
  return self->_serverOptions;
}

- (void)setServerOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverOptions, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);

  objc_storeStrong((id *)&self->_xpcStoreServer, 0);
}

@end