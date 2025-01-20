@interface _HDSPIDSService
- (BOOL)isCloudService;
- (HDSPIDSServiceDelegate)delegate;
- (_HDSPIDSService)initWithIsCloudService:(BOOL)a3 scheduler:(id)a4;
- (id)_cloudDestinations;
- (id)_localDestinations;
- (id)_loggingDescription;
- (void)_sendSerializedMessage:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDelegate:(id)a3;
@end

@implementation _HDSPIDSService

- (_HDSPIDSService)initWithIsCloudService:(BOOL)a3 scheduler:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_HDSPIDSService;
  v8 = [(_HDSPIDSService *)&v15 init];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F4A0C0]);
    if (v5) {
      v10 = @"com.apple.private.alloy.avconference.avctester";
    }
    else {
      v10 = @"com.apple.private.alloy.sleep.classd";
    }
    uint64_t v11 = [v9 initWithService:v10];
    service = v8->_service;
    v8->_service = (IDSService *)v11;

    v8->_isCloudService = v5;
    objc_storeStrong((id *)&v8->_scheduler, a4);
    v13 = v8;
  }

  return v8;
}

- (id)_loggingDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_isCloudService) {
    BOOL v5 = @"cloud";
  }
  else {
    BOOL v5 = @"local";
  }
  return (id)[v3 stringWithFormat:@"%@ (%@)", v4, v5];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  service = self->_service;
  id v5 = [(HKSPQueueBackedScheduler *)self->_scheduler queue];
  [(IDSService *)service addDelegate:self queue:v5];
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(_HDSPIDSService *)self _loggingDescription];
    *(_DWORD *)buf = 138543618;
    v19 = v9;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sending message %{public}@", buf, 0x16u);
  }
  id v10 = objc_alloc_init(MEMORY[0x263F75DD8]);
  id v17 = 0;
  int v11 = [v10 serialize:v6 error:&v17];
  id v12 = v17;
  if (v11)
  {
    v13 = [v10 serializedDictionary];
    v14 = [v6 identifier];
    [(_HDSPIDSService *)self _sendSerializedMessage:v13 identifier:v14 completion:v7];
  }
  else
  {
    objc_super v15 = HKSPLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [(_HDSPIDSService *)self _loggingDescription];
      *(_DWORD *)buf = 138543874;
      v19 = v16;
      __int16 v20 = 2114;
      id v21 = v6;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_error_impl(&dword_221A52000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] failed to serialize message %{public}@ with error %{public}@", buf, 0x20u);
    }
    v7[2](v7, 0, v12);
  }
}

- (void)_sendSerializedMessage:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  scheduler = self->_scheduler;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64___HDSPIDSService__sendSerializedMessage_identifier_completion___block_invoke;
  v15[3] = &unk_2645DAEA0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [(HKSPQueueBackedScheduler *)scheduler performBlock:v15];
}

- (id)_localDestinations
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
}

- (id)_cloudDestinations
{
  v2 = [(IDSService *)self->_service devices];
  v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_29);
  uint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_308_0);

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }
  id v6 = [MEMORY[0x263EFFA08] setWithArray:v5];

  return v6;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(_HDSPIDSService *)self _loggingDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v22 = v10;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] received incoming message %{public}@", buf, 0x16u);
  }
  id v11 = objc_alloc(MEMORY[0x263F75DD0]);
  id v12 = +[HDSPIDSServiceManager _allowedMessageClasses];
  id v13 = (void *)[v11 initWithAllowedClasses:v12 serializedDictionary:v8];

  objc_msgSend(v8, "hksp_serializedClassName");
  id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  Class v15 = NSClassFromString(v14);

  id v20 = 0;
  id v16 = [v13 deserializeObjectOfClass:v15 error:&v20];
  id v17 = v20;
  if (v16)
  {
    id v18 = [(_HDSPIDSService *)self delegate];
    [v18 service:self didReceiveMessage:v16];
  }
  else
  {
    id v18 = HKSPLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [(_HDSPIDSService *)self _loggingDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v19;
      __int16 v23 = 2114;
      id v24 = v17;
      _os_log_error_impl(&dword_221A52000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] failed to deserialize incoming message with error %{public}@", buf, 0x16u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v9 = a6;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a7;
  id v13 = HKSPLogForCategory();
  id v14 = v13;
  if (!v9)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    Class v15 = [(_HDSPIDSService *)self _loggingDescription];
    int v16 = 138543874;
    id v17 = v15;
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 2114;
    id v21 = v12;
    _os_log_error_impl(&dword_221A52000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] failed to send message %{public}@ with error %{public}@", (uint8_t *)&v16, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    Class v15 = [(_HDSPIDSService *)self _loggingDescription];
    int v16 = 138543618;
    id v17 = v15;
    __int16 v18 = 2114;
    id v19 = v11;
    _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully sent message %{public}@", (uint8_t *)&v16, 0x16u);
LABEL_4:
  }
LABEL_6:
}

- (BOOL)isCloudService
{
  return self->_isCloudService;
}

- (HDSPIDSServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSPIDSServiceDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end