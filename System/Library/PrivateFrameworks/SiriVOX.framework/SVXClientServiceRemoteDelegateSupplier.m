@interface SVXClientServiceRemoteDelegateSupplier
- (id)remoteServiceDelegateWithConnection:(id)a3 errorHandler:(id)a4;
@end

@implementation SVXClientServiceRemoteDelegateSupplier

- (id)remoteServiceDelegateWithConnection:(id)a3 errorHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v6)
  {
    v8 = [v6 remoteObjectProxyWithErrorHandler:v7];
    goto LABEL_7;
  }
  v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315394;
    v13 = "-[SVXClientServiceRemoteDelegateSupplier remoteServiceDelegateWithConnection:errorHandler:]";
    __int16 v14 = 2112;
    v15 = self;
    _os_log_error_impl(&dword_220062000, v9, OS_LOG_TYPE_ERROR, "%s %@ is already invalidated.", (uint8_t *)&v12, 0x16u);
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v7)
  {
LABEL_5:
    v10 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
    v7[2](v7, v10);
  }
LABEL_6:
  v8 = 0;
LABEL_7:

  return v8;
}

@end