@interface TRISandboxedPushServiceConnection
- (NSMutableArray)channels;
- (TRISandboxedPushServiceConnection)init;
- (id)_readPersistedSubscriptions;
- (void)_persistSubscriptions;
- (void)_validateChannelForChannelId:(id)a3;
- (void)subscribeToChannel:(id)a3;
- (void)unsubscribeFromChannel:(id)a3;
@end

@implementation TRISandboxedPushServiceConnection

- (TRISandboxedPushServiceConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)TRISandboxedPushServiceConnection;
  v2 = [(TRISandboxedPushServiceConnection *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(TRISandboxedPushServiceConnection *)v2 _readPersistedSubscriptions];
    uint64_t v5 = [v4 mutableCopy];
    channels = v3->_channels;
    v3->_channels = (NSMutableArray *)v5;
  }
  return v3;
}

- (void)subscribeToChannel:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TRISandboxedPushServiceConnection *)self channels];
  unint64_t v6 = [v5 count];

  if (v6 >= 0x64)
  {
    v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [(TRISandboxedPushServiceConnection *)self channels];
      int v12 = 134218240;
      uint64_t v13 = [v11 count];
      __int16 v14 = 2048;
      uint64_t v15 = 100;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "[Sandbox] New subscription denied since we reached the channel limit (%tu >= %tu)", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    [(TRISandboxedPushServiceConnection *)self _validateChannelForChannelId:v4];
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v4;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "[Sandbox] Subscribing to channel %@", (uint8_t *)&v12, 0xCu);
    }

    objc_super v8 = [(TRISandboxedPushServiceConnection *)self channels];
    v9 = [v4 identifier];
    [v8 addObject:v9];

    [(TRISandboxedPushServiceConnection *)self _persistSubscriptions];
  }
}

- (void)unsubscribeFromChannel:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TRISandboxedPushServiceConnection *)self _validateChannelForChannelId:v4];
  uint64_t v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "[Sandbox] Unsubscribing from channel %@", (uint8_t *)&v8, 0xCu);
  }

  unint64_t v6 = [(TRISandboxedPushServiceConnection *)self channels];
  v7 = [v4 identifier];
  [v6 removeObject:v7];

  [(TRISandboxedPushServiceConnection *)self _persistSubscriptions];
}

- (void)_validateChannelForChannelId:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 type] == 1)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v5 = [v3 identifier];
    unint64_t v6 = (void *)[v4 initWithBase64EncodedString:v5 options:0];

    if ((unint64_t)[v6 length] >= 0x11)
    {
      v7 = TRILogCategory_Server();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412802;
        id v9 = v3;
        __int16 v10 = 2048;
        uint64_t v11 = [v6 length];
        __int16 v12 = 2048;
        uint64_t v13 = 16;
        _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "[Sandbox] Received channel id %@ with length %tu > %tu", (uint8_t *)&v8, 0x20u);
      }
    }
  }
}

- (id)_readPersistedSubscriptions
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 arrayForKey:@"com.apple.triald.aps.subscriptions"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    unint64_t v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "[Sandbox] Unable to unarchive persisted subscriptions", v8, 2u);
    }

    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void)_persistSubscriptions
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(TRISandboxedPushServiceConnection *)self channels];
  [v3 setObject:v4 forKey:@"com.apple.triald.aps.subscriptions"];

  id v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [v3 objectForKey:@"com.apple.triald.aps.subscriptions"];
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "[Sandbox] Just persisted subscriptions. Now persisted: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (NSMutableArray)channels
{
  return self->_channels;
}

- (void).cxx_destruct
{
}

@end