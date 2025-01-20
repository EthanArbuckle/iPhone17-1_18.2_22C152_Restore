@interface TRNetworkOperation
- (id)sendingWiFiInfoHandler;
- (void)_handleResponse:(id)a3;
- (void)_sendRequestWithSSID:(id)a3 password:(id)a4;
- (void)execute;
- (void)setSendingWiFiInfoHandler:(id)a3;
@end

@implementation TRNetworkOperation

- (void)execute
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(TRNetworkOperation *)self isCancelled])
  {
    id v9 = [(id)objc_opt_class() userCancelledError];
    -[TROperation finishWithError:](self, "finishWithError:");
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      v3 = TRLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "-[TRNetworkOperation execute]";
        _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Network Request", buf, 0xCu);
      }
    }
    buf[0] = 0;
    id v10 = 0;
    id v11 = 0;
    char Config = TRCanPerformSetupGetConfig((BOOL *)buf, &v11, &v10);
    id v5 = v11;
    id v6 = v10;
    if (Config)
    {
      [(TRNetworkOperation *)self _sendRequestWithSSID:v5 password:v6];
    }
    else
    {
      if (buf[0]) {
        uint64_t v7 = -11001;
      }
      else {
        uint64_t v7 = -11000;
      }
      v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:v7 userInfo:0];
      [(TROperation *)self finishWithError:v8];
    }
  }
}

- (void)_sendRequestWithSSID:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TRNetworkOperation *)self isCancelled])
  {
    v8 = [(id)objc_opt_class() userCancelledError];
    [(TROperation *)self finishWithError:v8];
  }
  else
  {
    id v9 = [(TRNetworkOperation *)self sendingWiFiInfoHandler];

    if (v9)
    {
      id v10 = [(TRNetworkOperation *)self sendingWiFiInfoHandler];
      ((void (**)(void, id))v10)[2](v10, v6);
    }
    v8 = objc_alloc_init(TRSetupNetworkRequest);
    [(TRSetupNetworkRequest *)v8 setNetworkSSID:v6];
    [(TRSetupNetworkRequest *)v8 setNetworkPassword:v7];
    objc_initWeak(&location, self);
    id v11 = [(TROperation *)self session];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__TRNetworkOperation__sendRequestWithSSID_password___block_invoke;
    v12[3] = &unk_264220930;
    objc_copyWeak(&v13, &location);
    [v11 sendRequest:v8 withResponseHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __52__TRNetworkOperation__sendRequestWithSSID_password___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isCancelled])
  {
    id v7 = [(id)objc_opt_class() userCancelledError];
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
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_TRLogEnabled == 1)
  {
    id v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[TRNetworkOperation _handleResponse:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%s Handle Network Response: %@", buf, 0x16u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = NSNumber;
    id v7 = v4;
    id v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "hasNetwork", @"TRNetworkOperationHasNetworkKey"));
    id v11 = v8;
    id v9 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

    [(TROperation *)self finishWithResult:v9];
  }
  else
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-10000 userInfo:0];
    [(TROperation *)self finishWithError:v9];
  }
}

- (id)sendingWiFiInfoHandler
{
  return self->_sendingWiFiInfoHandler;
}

- (void)setSendingWiFiInfoHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end