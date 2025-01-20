@interface PKPaymentWebServiceProxyTargetDeviceDebugHelper
+ (id)webServiceWithProxiedTargetDevice:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PKPaymentWebServiceProxyTargetDeviceDebugHelper)initWithWebService:(id)a3;
- (id)localProxyTargetDevice;
- (void)dealloc;
@end

@implementation PKPaymentWebServiceProxyTargetDeviceDebugHelper

+ (id)webServiceWithProxiedTargetDevice:(id)a3
{
  id v3 = a3;
  v4 = [[PKPaymentWebServiceProxyTargetDeviceDebugHelper alloc] initWithWebService:v3];
  v5 = [(PKPaymentWebServiceProxyTargetDeviceDebugHelper *)v4 localProxyTargetDevice];
  v6 = [PKPaymentWebService alloc];
  v7 = [v5 context];
  v8 = v7;
  if (!v7)
  {
    v8 = [v3 context];
  }
  v9 = objc_alloc_init(PKPaymentService);
  v10 = [(PKPaymentWebService *)v6 initWithContext:v8 targetDevice:v5 archiver:v5 tapToRadarDelegate:v9];

  if (!v7) {
  objc_setAssociatedObject(v10, &PKPaymentWebServiceProxyTargetDeviceDebugHelperKey, v4, (void *)0x301);
  }

  return v10;
}

- (PKPaymentWebServiceProxyTargetDeviceDebugHelper)initWithWebService:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentWebServiceProxyTargetDeviceDebugHelper;
  v6 = [(PKPaymentWebServiceProxyTargetDeviceDebugHelper *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webService, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    remoteTargets = v7->_remoteTargets;
    v7->_remoteTargets = v8;

    uint64_t v10 = [MEMORY[0x1E4F29290] anonymousListener];
    remoteListener = v7->_remoteListener;
    v7->_remoteListener = (NSXPCListener *)v10;

    [(NSXPCListener *)v7->_remoteListener setDelegate:v7];
    [(NSXPCListener *)v7->_remoteListener resume];
    id v12 = objc_alloc(MEMORY[0x1E4F29268]);
    v13 = [(NSXPCListener *)v7->_remoteListener endpoint];
    v14 = (void *)[v12 initWithListenerEndpoint:v13];

    v15 = [[PKPaymentWebServiceLocalProxyTargetDevice alloc] initWithConnection:v14];
    localTarget = v7->_localTarget;
    v7->_localTarget = v15;
  }
  return v7;
}

- (id)localProxyTargetDevice
{
  return self->_localTarget;
}

- (void)dealloc
{
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceProxyTargetDeviceDebugHelper dealloc'd.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentWebServiceProxyTargetDeviceDebugHelper;
  [(PKPaymentWebServiceProxyTargetDeviceDebugHelper *)&v4 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [[PKPaymentWebServiceRemoteProxyTargetDevice alloc] initWithWebService:self->_webService connection:v5];
  v7 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_INFO, "PKPaymentWebServiceRemoteProxyTargetDevice connection added %@.", (uint8_t *)&v9, 0xCu);
  }

  [(NSMutableArray *)self->_remoteTargets addObject:v6];
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTargets, 0);
  objc_storeStrong((id *)&self->_localTarget, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end