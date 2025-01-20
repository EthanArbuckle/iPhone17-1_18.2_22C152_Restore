@interface RTPersistenceRemoteStoreServer
- (NSDictionary)serverOptions;
- (NSURL)modelURL;
- (NSURL)storeURL;
- (NSXPCStoreServer)xpcStoreServer;
- (RTPersistenceRemoteStoreServer)init;
- (RTPersistenceRemoteStoreServer)initWithStoreURL:(id)a3 modelURL:(id)a4 options:(id)a5;
- (void)setModelURL:(id)a3;
- (void)setServerOptions:(id)a3;
- (void)setStoreURL:(id)a3;
- (void)setXpcStoreServer:(id)a3;
- (void)startListening;
@end

@implementation RTPersistenceRemoteStoreServer

- (RTPersistenceRemoteStoreServer)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStoreURL_modelURL_options_);
}

- (RTPersistenceRemoteStoreServer)initWithStoreURL:(id)a3 modelURL:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: storeURL";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_17;
  }
  if (!v10)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: modelURL";
    goto LABEL_16;
  }
  v13 = [v11 objectForKey:*MEMORY[0x1E4F1BFE8]];

  if (!v13)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: [options objectForKey:NSXPCStoreServiceNameKey]";
    goto LABEL_16;
  }
  v14 = [v12 objectForKey:*MEMORY[0x1E4F1BFC8]];

  if (!v14)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: [options objectForKey:NSXPCStoreDaemonizeKey]";
      goto LABEL_16;
    }
LABEL_17:

    v17 = 0;
    goto LABEL_18;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTPersistenceRemoteStoreServer;
  v15 = [(RTPersistenceRemoteStoreServer *)&v21 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_storeURL, a3);
    objc_storeStrong(p_isa + 3, a4);
    objc_storeStrong(p_isa + 4, a5);
  }
  self = p_isa;
  v17 = self;
LABEL_18:

  return v17;
}

- (void)startListening
{
  v3 = (void *)MEMORY[0x1E016D870](self, a2);
  id v4 = objc_alloc(MEMORY[0x1E4F1C1B8]);
  v5 = [(RTPersistenceRemoteStoreServer *)self storeURL];
  v6 = [(RTPersistenceRemoteStoreServer *)self modelURL];
  v7 = [(RTPersistenceRemoteStoreServer *)self serverOptions];
  v8 = (void *)[v4 initForStoreWithURL:v5 usingModelAtURL:v6 options:v7 policy:0];
  [(RTPersistenceRemoteStoreServer *)self setXpcStoreServer:v8];

  id v9 = [(RTPersistenceRemoteStoreServer *)self xpcStoreServer];
  [v9 startListening];
}

- (NSXPCStoreServer)xpcStoreServer
{
  return (NSXPCStoreServer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcStoreServer:(id)a3
{
}

- (NSURL)storeURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStoreURL:(id)a3
{
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModelURL:(id)a3
{
}

- (NSDictionary)serverOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
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