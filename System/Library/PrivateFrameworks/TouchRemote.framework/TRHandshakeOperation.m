@interface TRHandshakeOperation
- (int64_t)protocolVersion;
- (void)_handleResponse:(id)a3;
- (void)execute;
- (void)setProtocolVersion:(int64_t)a3;
@end

@implementation TRHandshakeOperation

- (void)execute
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(TRHandshakeOperation *)self isCancelled])
  {
    id v6 = [(id)objc_opt_class() userCancelledError];
    [(TROperation *)self finishWithError:v6];
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      v3 = TRLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v10 = "-[TRHandshakeOperation execute]";
        _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Handshake Request", buf, 0xCu);
      }
    }
    v4 = objc_alloc_init(TRHandshakeRequest);
    [(TRHandshakeRequest *)v4 setProtocolVersion:[(TRHandshakeOperation *)self protocolVersion]];
    objc_initWeak((id *)buf, self);
    v5 = [(TROperation *)self session];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__TRHandshakeOperation_execute__block_invoke;
    v7[3] = &unk_264220930;
    objc_copyWeak(&v8, (id *)buf);
    [v5 sendRequest:v4 withResponseHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __31__TRHandshakeOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_TRLogEnabled == 1)
  {
    id v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[TRHandshakeOperation _handleResponse:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%s Handle Handshake Response: %@", buf, 0x16u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    uint64_t v7 = [v6 protocolVersion];
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", v7, @"TRHandshakeOperationProtocolVersionKey");
    uint64_t v11 = v8;
    v9 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

    [(TROperation *)self finishWithResult:v9];
  }
  else
  {
    v9 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-10000 userInfo:0];
    [(TROperation *)self finishWithError:v9];
  }
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

@end