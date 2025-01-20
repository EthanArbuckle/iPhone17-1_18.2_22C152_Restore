@interface TRActivationOperation
- (void)_handleResponse:(id)a3;
- (void)execute;
@end

@implementation TRActivationOperation

- (void)execute
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(TRActivationOperation *)self isCancelled])
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
        v10 = "-[TRActivationOperation execute]";
        _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Activation Request", buf, 0xCu);
      }
    }
    v4 = objc_alloc_init(TRSetupActivationRequest);
    objc_initWeak((id *)buf, self);
    v5 = [(TROperation *)self session];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__TRActivationOperation_execute__block_invoke;
    v7[3] = &unk_264220930;
    objc_copyWeak(&v8, (id *)buf);
    [v5 sendRequest:v4 withResponseHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __32__TRActivationOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_TRLogEnabled == 1)
  {
    id v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[TRActivationOperation _handleResponse:]";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%s Handle Activation Response: %@", buf, 0x16u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "activated", @"TRActivationOperationIsActivatedKey"));
    v14 = v7;
    id v8 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v9 = (void *)[v8 mutableCopy];

    v10 = [v6 error];

    if (v10)
    {
      uint64_t v11 = [v6 error];
      [v9 setObject:v11 forKeyedSubscript:@"TRActivationOperationErrorKey"];
    }
    v12 = (void *)[v9 copy];
    [(TROperation *)self finishWithResult:v12];
  }
  else
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-10000 userInfo:0];
    [(TROperation *)self finishWithError:v6];
  }
}

@end