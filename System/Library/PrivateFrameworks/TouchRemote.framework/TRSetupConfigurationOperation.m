@interface TRSetupConfigurationOperation
- (void)_handleResponse:(id)a3;
- (void)execute;
@end

@implementation TRSetupConfigurationOperation

- (void)execute
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(TRSetupConfigurationOperation *)self isCancelled])
  {
    id v8 = [(id)objc_opt_class() userCancelledError];
    [(TROperation *)self finishWithError:v8];
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      v3 = TRLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[TRSetupConfigurationOperation execute]";
        _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Configuration Request", buf, 0xCu);
      }
    }
    v4 = (void *)MGCopyAnswer();
    if (_TRLogEnabled == 1)
    {
      v5 = TRLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[TRSetupConfigurationOperation execute]";
        __int16 v13 = 2112;
        v14 = v4;
        _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%s Using device name (%@)", buf, 0x16u);
      }
    }
    v6 = objc_alloc_init(TRSetupConfigurationRequest);
    [(TRSetupConfigurationRequest *)v6 setDeviceName:v4];
    objc_initWeak((id *)buf, self);
    v7 = [(TROperation *)self session];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __40__TRSetupConfigurationOperation_execute__block_invoke;
    v9[3] = &unk_264220930;
    objc_copyWeak(&v10, (id *)buf);
    [v7 sendRequest:v6 withResponseHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __40__TRSetupConfigurationOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isCancelled])
  {
    v7 = [(id)objc_opt_class() userCancelledError];
    [WeakRetained finishWithError:v7];
  }
  else if (v5)
  {
    [WeakRetained _handleResponse:v5];
  }
  else
  {
    [WeakRetained finishWithError:v8];
  }
}

- (void)_handleResponse:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_TRLogEnabled == 1)
  {
    id v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[TRSetupConfigurationOperation _handleResponse:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%s Handle Configuration Response: %@", buf, 0x16u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = NSNumber;
    id v7 = v4;
    id v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "needsNetwork", @"TRSetupConfigurationOperationNeedsNetworkKey"));
    v13[0] = v8;
    v12[1] = @"TRSetupConfigurationOperationUnauthenticatedServicesKey";
    v9 = [v7 unauthenticatedAccountServices];
    v13[1] = v9;
    v12[2] = @"TRSetupConfigurationOperationUseAIDAKey";
    id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "useAIDA"));
    v13[2] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

    [(TROperation *)self finishWithResult:v11];
  }
  else
  {
    v11 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-10000 userInfo:0];
    [(TROperation *)self finishWithError:v11];
  }
}

@end