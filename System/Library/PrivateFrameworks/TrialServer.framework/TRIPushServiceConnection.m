@interface TRIPushServiceConnection
- (APSConnection)connection;
- (OS_dispatch_queue)pushServiceQueue;
- (OS_dispatch_queue)subscriptionRequestQueue;
- (TRIPushServiceConnection)initWithDelegate:(id)a3;
- (TRIPushServiceConnectionDelegate)triDelegate;
- (id)_publicChannelForChannelId:(id)a3;
- (id)subscribedChannelIds;
- (unint64_t)_subscribedChannelCount;
- (void)_subscribeToChannel:(id)a3;
- (void)_unsubscribeFromChannel:(id)a3;
- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)dealloc;
- (void)subscribeToChannel:(id)a3;
- (void)unsubscribeFromChannel:(id)a3;
@end

@implementation TRIPushServiceConnection

- (TRIPushServiceConnection)initWithDelegate:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TRIPushServiceConnection;
  v6 = [(TRIPushServiceConnection *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_triDelegate, a3);
    uint64_t v8 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.triald.pushServiceQueue" qosClass:17];
    pushServiceQueue = v7->_pushServiceQueue;
    v7->_pushServiceQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.triald.subscriptionRequestQueue" qosClass:17];
    subscriptionRequestQueue = v7->_subscriptionRequestQueue;
    v7->_subscriptionRequestQueue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F4E1E8]);
    uint64_t v13 = *MEMORY[0x1E4F4E1D0];
    v14 = [(TRIPushServiceConnection *)v7 pushServiceQueue];
    uint64_t v15 = [v12 initWithEnvironmentName:v13 namedDelegatePort:@"com.apple.aps.triald" queue:v14];
    connection = v7->_connection;
    v7->_connection = (APSConnection *)v15;

    v17 = [(TRIPushServiceConnection *)v7 connection];

    if (v17)
    {
      v24[0] = @"com.apple.triald";
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      v19 = [(TRIPushServiceConnection *)v7 connection];
      [v19 _setOpportunisticTopics:v18];

      v20 = [(TRIPushServiceConnection *)v7 connection];
      [v20 setDelegate:v7];
    }
    else
    {
      v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Failed to create an APSConnection", v22, 2u);
      }
    }
  }
  return v7;
}

- (void)subscribeToChannel:(id)a3
{
  id v4 = a3;
  id v5 = [(TRIPushServiceConnection *)self subscriptionRequestQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__TRIPushServiceConnection_subscribeToChannel___block_invoke;
  v7[3] = &unk_1E6BB82A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __47__TRIPushServiceConnection_subscribeToChannel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _subscribeToChannel:*(void *)(a1 + 40)];
}

- (void)_subscribeToChannel:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(TRIPushServiceConnection *)self _subscribedChannelCount];
  if (v5 < 0x64)
  {
    v7 = [(TRIPushServiceConnection *)self _publicChannelForChannelId:v4];
    id v8 = TRILogCategory_Server();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        unint64_t v11 = (unint64_t)v4;
        _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "Subscribing to channel %@", (uint8_t *)&v10, 0xCu);
      }

      v9 = [(TRIPushServiceConnection *)self connection];
      [v9 subscribeToChannel:v7 forTopic:@"com.apple.triald"];
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      unint64_t v11 = (unint64_t)v4;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Could not subscribe to channel %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    unint64_t v6 = v5;
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134218240;
      unint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = 100;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "New subscription denied since we reached the channel limit (%tu >= %tu)", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)unsubscribeFromChannel:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TRIPushServiceConnection *)self subscriptionRequestQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__TRIPushServiceConnection_unsubscribeFromChannel___block_invoke;
  v7[3] = &unk_1E6BB82A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __51__TRIPushServiceConnection_unsubscribeFromChannel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unsubscribeFromChannel:*(void *)(a1 + 40)];
}

- (void)_unsubscribeFromChannel:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(TRIPushServiceConnection *)self _publicChannelForChannelId:v4];
  id v6 = TRILogCategory_Server();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Unsubscribing from channel %@", (uint8_t *)&v8, 0xCu);
    }

    v7 = [(TRIPushServiceConnection *)self connection];
    [v7 unsubscribeFromChannel:v5 forTopic:@"com.apple.triald"];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Could not unsubscribe from channel %@", (uint8_t *)&v8, 0xCu);
  }
}

- (id)_publicChannelForChannelId:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 type] == 1)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    unint64_t v5 = [v3 identifier];
    id v6 = (void *)[v4 initWithBase64EncodedString:v5 options:0];

    if ((unint64_t)[v6 length] >= 0x11)
    {
      v7 = TRILogCategory_Server();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412802;
        id v13 = v3;
        __int16 v14 = 2048;
        uint64_t v15 = [v6 length];
        __int16 v16 = 2048;
        uint64_t v17 = 16;
        _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Received channel id %@ with length %tu > %tu", (uint8_t *)&v12, 0x20u);
      }
    }
  }
  id v8 = objc_alloc(MEMORY[0x1E4F39AA8]);
  id v9 = [v3 identifier];
  uint64_t v10 = (void *)[v8 initWithChannelID:v9];

  return v10;
}

- (id)subscribedChannelIds
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(TRIPushServiceConnection *)self connection];
  id v8 = 0;
  id v3 = [v2 registeredChannelsForTopic:@"com.apple.triald" error:&v8];
  id v4 = v8;

  if (v3)
  {
    unint64_t v5 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_13);
  }
  else
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Couldn't get registered channels: %{public}@", buf, 0xCu);
    }

    unint64_t v5 = 0;
  }

  return v5;
}

uint64_t __48__TRIPushServiceConnection_subscribedChannelIds__block_invoke(uint64_t a1, void *a2)
{
  return [a2 channelID];
}

- (unint64_t)_subscribedChannelCount
{
  v2 = [(TRIPushServiceConnection *)self subscribedChannelIds];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 count];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  id v3 = [(TRIPushServiceConnection *)self connection];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)TRIPushServiceConnection;
  [(TRIPushServiceConnection *)&v4 dealloc];
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  unint64_t v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Failed to subscribe to some channels: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = v5;
  if (v5)
  {
    id v7 = [v5 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"notification-content"];

    if (v8)
    {
      id v9 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
      if (v9)
      {
        id v19 = 0;
        id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB0610]) initWithData:v9 error:&v19];
        uint64_t v11 = v19;
        int v12 = TRILogCategory_Server();
        id v13 = v12;
        if (v10)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v14 = [v10 description];
            *(_DWORD *)buf = 138412290;
            v21 = v14;
            _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Received notification: %@", buf, 0xCu);
          }
          id v13 = [(TRIPushServiceConnection *)self triDelegate];
          [v13 didReceivePushNotification:v10];
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = [v6 userInfo];
          uint64_t v18 = [v6 channelID];
          *(_DWORD *)buf = 138412802;
          v21 = v11;
          __int16 v22 = 2112;
          objc_super v23 = v17;
          __int16 v24 = 2112;
          v25 = v18;
          _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unable to deserialize push notification with decode error %@. Received %@ on channel %@", buf, 0x20u);
        }
        goto LABEL_18;
      }
      uint64_t v11 = TRILogCategory_Server();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        goto LABEL_20;
      }
      id v10 = [v6 channelID];
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      __int16 v22 = 2112;
      objc_super v23 = v10;
      uint64_t v15 = "Received invalid base 64 notification content. Received %@ on channel %@";
      __int16 v16 = v11;
    }
    else
    {
      id v9 = TRILogCategory_Server();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v11 = [v6 userInfo];
      id v10 = [v6 channelID];
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      __int16 v22 = 2114;
      objc_super v23 = v10;
      uint64_t v15 = "Expected notification content not found. Received %{public}@ on channel %{public}@";
      __int16 v16 = v9;
    }
    _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, v15, buf, 0x16u);
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "-connection:didReceiveIncomingMessage: called without a message", buf, 2u);
  }
LABEL_21:
}

- (OS_dispatch_queue)pushServiceQueue
{
  return self->_pushServiceQueue;
}

- (OS_dispatch_queue)subscriptionRequestQueue
{
  return self->_subscriptionRequestQueue;
}

- (TRIPushServiceConnectionDelegate)triDelegate
{
  return self->_triDelegate;
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_triDelegate, 0);
  objc_storeStrong((id *)&self->_subscriptionRequestQueue, 0);
  objc_storeStrong((id *)&self->_pushServiceQueue, 0);
}

@end