@interface PLPhotoAnalysisServiceRemoteServiceProxy
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (PLPhotoAnalysisServiceRemoteServiceProxy)initWithServiceProvider:(id)a3 remoteInterface:(id)a4 synchronous:(BOOL)a5 errorHandler:(id)a6;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation PLPhotoAnalysisServiceRemoteServiceProxy

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_destroyWeak((id *)&self->_service);
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_synchronous)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    v7 = [WeakRetained synchronousRemoteServiceProxyWithErrorHandler:self->_errorHandler];

    if (v7) {
      [v5 invokeWithTarget:v7];
    }
  }
  else
  {
    [v4 retainArguments];
    id v8 = objc_loadWeakRetained((id *)&self->_service);
    id errorHandler = self->_errorHandler;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__PLPhotoAnalysisServiceRemoteServiceProxy_forwardInvocation___block_invoke;
    v10[3] = &unk_1E5870818;
    id v11 = v5;
    [v8 remoteServiceProxyWithErrorHandler:errorHandler reply:v10];
  }
}

uint64_t __62__PLPhotoAnalysisServiceRemoteServiceProxy_forwardInvocation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithTarget:a2];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)PLPhotoAnalysisServiceRemoteServiceProxy;
  return [(PLPhotoAnalysisServiceRemoteServiceProxy *)&v6 respondsToSelector:a3];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v5 = [(NSXPCInterface *)self->_remoteInterface protocol];
  objc_method_description MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);
  types = MethodDescription.types;
  if (!MethodDescription.name && (objc_method_description v8 = protocol_getMethodDescription(v5, a3, 0, 1), types = v8.types, !v8.name)
    || ([MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types],
        (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)PLPhotoAnalysisServiceRemoteServiceProxy;
    v9 = [(PLPhotoAnalysisServiceRemoteServiceProxy *)&v11 methodSignatureForSelector:a3];
  }

  return v9;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = (Protocol *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PLPhotoAnalysisServiceRemoteServiceProxy;
  if ([(PLPhotoAnalysisServiceRemoteServiceProxy *)&v8 conformsToProtocol:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_super v6 = [(NSXPCInterface *)self->_remoteInterface protocol];
    BOOL v5 = protocol_conformsToProtocol(v6, v4);
  }
  return v5;
}

- (PLPhotoAnalysisServiceRemoteServiceProxy)initWithServiceProvider:(id)a3 remoteInterface:(id)a4 synchronous:(BOOL)a5 errorHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PLPhotoAnalysisServiceRemoteServiceProxy;
  v13 = [(PLPhotoAnalysisServiceRemoteServiceProxy *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_service, v10);
    objc_storeStrong((id *)&v14->_remoteInterface, a4);
    v14->_synchronous = a5;
    uint64_t v15 = MEMORY[0x19F38D650](v12);
    id errorHandler = v14->_errorHandler;
    v14->_id errorHandler = (id)v15;
  }
  return v14;
}

@end