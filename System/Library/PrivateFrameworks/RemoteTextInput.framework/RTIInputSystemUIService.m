@interface RTIInputSystemUIService
+ (id)sharedServiceWithDomainName:(id)a3 serviceName:(id)a4;
- (BOOL)_canResumeConnection;
- (RTIInputSystemUIService)initWithDomainName:(id)a3 serviceName:(id)a4;
- (id)listenerEndpoint;
- (void)_createListenerIfNecessary;
- (void)_destroyListenerIfNecessary;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation RTIInputSystemUIService

+ (id)sharedServiceWithDomainName:(id)a3 serviceName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (sharedServiceWithDomainName_serviceName__onceToken != -1) {
    dispatch_once(&sharedServiceWithDomainName_serviceName__onceToken, &__block_literal_global_5);
  }
  v7 = [(id)sharedServiceWithDomainName_serviceName___services objectForKey:v6];
  if (!v7)
  {
    v7 = [[RTIInputSystemUIService alloc] initWithDomainName:v5 serviceName:v6];
    [(id)sharedServiceWithDomainName_serviceName___services setObject:v7 forKey:v6];
  }

  return v7;
}

uint64_t __67__RTIInputSystemUIService_sharedServiceWithDomainName_serviceName___block_invoke()
{
  sharedServiceWithDomainName_serviceName___services = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  return MEMORY[0x1F41817F8]();
}

- (RTIInputSystemUIService)initWithDomainName:(id)a3 serviceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTIInputSystemUIService;
  v8 = [(RTIInputSystemService *)&v14 initWithMachName:0];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    domainName = v8->_domainName;
    v8->_domainName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v11;

    [(RTIInputSystemUIService *)v8 _createListenerIfNecessary];
  }

  return v8;
}

- (void)_createListenerIfNecessary
{
  if (!self->_bsConnectionListener && self->_domainName)
  {
    if (self->_serviceName)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __53__RTIInputSystemUIService__createListenerIfNecessary__block_invoke;
      v5[3] = &unk_1E583CCD0;
      v5[4] = self;
      v3 = [MEMORY[0x1E4F50BC8] listenerWithConfigurator:v5];
      bsConnectionListener = self->_bsConnectionListener;
      self->_bsConnectionListener = v3;

      [(BSServiceConnectionListener *)self->_bsConnectionListener activate];
    }
  }
}

void __53__RTIInputSystemUIService__createListenerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
  id v4 = a2;
  [v4 setDomain:v3];
  [v4 setService:*(void *)(*(void *)(a1 + 32) + 88)];
  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)_destroyListenerIfNecessary
{
  bsConnectionListener = self->_bsConnectionListener;
  if (bsConnectionListener)
  {
    [(BSServiceConnectionListener *)bsConnectionListener invalidate];
    id v4 = self->_bsConnectionListener;
    self->_bsConnectionListener = 0;
  }
}

- (id)listenerEndpoint
{
  return 0;
}

- (BOOL)_canResumeConnection
{
  return 0;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = RTILogFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTIInputSystemUIService listener:didReceiveConnection:withContext:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_19AFFA000, v7, OS_LOG_TYPE_DEFAULT, "%s  didReceiveConnection: %@", buf, 0x16u);
  }

  v8 = [v6 remoteProcess];
  uint64_t v9 = [v6 extractNSXPCConnectionWithConfigurator:&__block_literal_global_6];
  v10 = [(RTIInputSystemService *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__RTIInputSystemUIService_listener_didReceiveConnection_withContext___block_invoke_2;
  block[3] = &unk_1E583C508;
  id v14 = v9;
  id v15 = v8;
  v16 = self;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, block);
}

void __69__RTIInputSystemUIService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  id v2 = +[RTIInputSystemServiceUISession sessionWithConnection:*(void *)(a1 + 32) remoteProcess:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) inputSession:v2 didReceiveConnection:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) activate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_bsConnectionListener, 0);
}

@end