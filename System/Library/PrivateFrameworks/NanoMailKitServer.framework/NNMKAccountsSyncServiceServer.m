@interface NNMKAccountsSyncServiceServer
- (NNMKAccountsSyncServiceServer)initWithQueue:(id)a3;
- (NNMKAccountsSyncServiceServerDelegate)delegate;
- (id)addOrUpdateAccount:(id)a3;
- (id)deleteAccount:(id)a3;
- (id)requestWatchAccountsStatus:(id)a3;
- (id)sendInitialAccountsSync:(id)a3;
- (id)sendStandaloneAccountIdentity:(id)a3;
- (id)syncVIPList:(id)a3;
- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4;
- (void)readProtobufData:(id)a3 type:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)successfullySentProtobufWithIDSIdentifier:(id)a3;
@end

@implementation NNMKAccountsSyncServiceServer

- (NNMKAccountsSyncServiceServer)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NNMKAccountsSyncServiceServer;
  return [(NNMKSyncServiceEndpoint *)&v4 initWithIDSServiceName:@"com.apple.private.alloy.mail.sync.accounts" queue:a3];
}

- (id)addOrUpdateAccount:(id)a3
{
  objc_super v4 = [a3 data];
  v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:1 priority:200 timeoutCategory:1 allowCloudDelivery:1];

  return v5;
}

- (id)deleteAccount:(id)a3
{
  objc_super v4 = [a3 data];
  v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:2 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (id)sendInitialAccountsSync:(id)a3
{
  objc_super v4 = [a3 data];
  v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:3 priority:200 timeoutCategory:0 allowCloudDelivery:1];

  return v5;
}

- (id)sendStandaloneAccountIdentity:(id)a3
{
  objc_super v4 = [a3 data];
  v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:4 priority:200 timeout:1 allowCloudDelivery:60.0];

  return v5;
}

- (id)requestWatchAccountsStatus:(id)a3
{
  objc_super v4 = [a3 data];
  v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:5 priority:200 timeout:1 allowCloudDelivery:60.0];

  return v5;
}

- (id)syncVIPList:(id)a3
{
  objc_super v4 = [a3 data];
  v5 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v4 type:6 priority:200 timeoutCategory:1 allowCloudDelivery:1];

  return v5;
}

- (void)successfullySentProtobufWithIDSIdentifier:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained accountsSyncServiceServer:self didSendProtobufSuccessfullyWithIDSIdentifier:v5];
}

- (void)failedSendingProtobufWithIDSIdentifier:(id)a3 errorCode:(int64_t)a4
{
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained accountsSyncServiceServer:self didFailSendingProtobufWithIDSIdentifier:v7 errorCode:a4];
}

- (void)readProtobufData:(id)a3 type:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 == 2)
  {
    v21 = self;
    v9 = [[NNMKProtoAccountAuthenticationStatus alloc] initWithData:v6];
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v20 = (NNMKProtoAccountSourceType *)v9;
    v10 = [(NNMKProtoAccountAuthenticationStatus *)v9 accountsStatus];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v16 = [v15 accountId];

          if (v16)
          {
            v17 = [v15 accountId];
            [v8 setObject:v15 forKeyedSubscript:v17];
          }
          else
          {
            v18 = qword_26AC21850;
            if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
              -[NNMKAccountsSyncServiceServer readProtobufData:type:](&buf, v23, v18);
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&v21->_delegate);
    id v7 = v20;
    [(NNMKProtoAccountSourceType *)v20 requestTime];
    objc_msgSend(WeakRetained, "accountsSyncServiceServer:didReceivedAccountAuthenticationStatus:requestTime:", v21, v8);

    goto LABEL_16;
  }
  if (a4 == 1)
  {
    id v7 = [[NNMKProtoAccountSourceType alloc] initWithData:v6];
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 accountsSyncServiceServer:self didChangeAccountSourceType:v7];
LABEL_16:
  }
}

- (NNMKAccountsSyncServiceServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKAccountsSyncServiceServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)readProtobufData:(os_log_t)log type:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "NNMKProtoAccountAuthenticationStatus account does not have account id!", buf, 2u);
}

@end