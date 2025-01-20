@interface TRIPushServiceConnectionMultiplexer
- (BOOL)_isTestingIdentifier:(id)a3;
- (TRIPushServiceChannelSubscribing)currentConnection;
- (TRIPushServiceConnectionCreating)connectionCreator;
- (TRIPushServiceConnectionDelegate)delegate;
- (TRIPushServiceConnectionMultiplexer)initWithConnectionCreator:(id)a3 connectionDelegate:(id)a4 serverContext:(id)a5;
- (TRIPushServiceConnectionMultiplexer)initWithServerContext:(id)a3 taskQueue:(id)a4;
- (id)_channelIdFromExperimentId:(id)a3;
- (id)_channelIdFromRolloutDeployment:(id)a3;
- (id)_expectedChannelIdsForRolloutDeployments:(id)a3 experimentIds:(id)a4 maxChannelsAllowed:(unint64_t)a5;
- (void)_logFaultIfNotTestingIdentifier:(id)a3;
- (void)ensureSubscriptionsExistOnlyForRolloutDeployments:(id)a3 experimentIds:(id)a4 maxChannelsAllowed:(unint64_t)a5;
- (void)subscribeForExperimentId:(id)a3;
- (void)subscribeForRolloutDeployment:(id)a3;
- (void)switchToEnvironment:(unsigned __int8)a3;
- (void)unsubscribeForExperimentId:(id)a3;
@end

@implementation TRIPushServiceConnectionMultiplexer

- (TRIPushServiceConnectionMultiplexer)initWithServerContext:(id)a3 taskQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 keyValueStore];
  v9 = +[TRIFetchDateManager managerWithKeyValueStore:v8];

  v10 = [TRINotificationReactionChecker alloc];
  v11 = [v7 rolloutDatabase];
  v12 = [v7 experimentDatabase];
  v13 = [(TRINotificationReactionChecker *)v10 initWithDateProvider:v9 rolloutDatabase:v11 experimentDatabase:v12];

  v14 = [[TRIHotfixRolloutTargetingScheduler alloc] initWithTaskQueue:v6];
  v15 = [TRIUrgentRollbackScheduler alloc];
  v16 = [v7 experimentDatabase];
  v17 = [(TRIUrgentRollbackScheduler *)v15 initWithExperimentDatabase:v16 taskQueue:v6];

  v18 = [[TRIPushNotificationHandler alloc] initWithNotificationChecker:v13 hotfixScheduler:v14 rollbackScheduler:v17];
  v19 = objc_opt_new();
  v20 = [(TRIPushServiceConnectionMultiplexer *)self initWithConnectionCreator:v19 connectionDelegate:v18 serverContext:v7];

  return v20;
}

- (TRIPushServiceConnectionMultiplexer)initWithConnectionCreator:(id)a3 connectionDelegate:(id)a4 serverContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TRIPushServiceConnectionMultiplexer;
  v12 = [(TRIPushServiceConnectionMultiplexer *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connectionCreator, a3);
    objc_storeStrong((id *)&v13->_delegate, a4);
    uint64_t v14 = [v9 connectionWithDelegate:v10 environment:0];
    currentConnection = v13->_currentConnection;
    v13->_currentConnection = (TRIPushServiceChannelSubscribing *)v14;

    objc_storeStrong((id *)&v13->_context, a5);
  }

  return v13;
}

- (BOOL)_isTestingIdentifier:(id)a3
{
  return [a3 hasPrefix:@"TRI-TEST-"];
}

- (void)_logFaultIfNotTestingIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(TRIPushServiceConnectionMultiplexer *)self _isTestingIdentifier:v4])
  {
    v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Failed to create channel id for identifier %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)subscribeForRolloutDeployment:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4FB0090] currentEnvironment];
  int v6 = [MEMORY[0x1E4FB0258] sharedInstance];
  int v7 = [v6 populationType];

  if (v7 == 3 && v5 == 3)
  {
    id v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Skipping subscribing to cloud channel for rollout deployment: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id v9 = [(TRIPushServiceConnectionMultiplexer *)self _channelIdFromRolloutDeployment:v4];
    if (v9)
    {
      id v10 = [(TRIPushServiceConnectionMultiplexer *)self currentConnection];
      [v10 subscribeToChannel:v9];
    }
    else
    {
      id v10 = [v4 rolloutId];
      [(TRIPushServiceConnectionMultiplexer *)self _logFaultIfNotTestingIdentifier:v10];
    }
  }
}

- (void)subscribeForExperimentId:(id)a3
{
  id v6 = a3;
  id v4 = -[TRIPushServiceConnectionMultiplexer _channelIdFromExperimentId:](self, "_channelIdFromExperimentId:");
  if (v4)
  {
    uint64_t v5 = [(TRIPushServiceConnectionMultiplexer *)self currentConnection];
    [v5 subscribeToChannel:v4];
  }
  else
  {
    [(TRIPushServiceConnectionMultiplexer *)self _logFaultIfNotTestingIdentifier:v6];
  }
}

- (void)unsubscribeForExperimentId:(id)a3
{
  id v6 = a3;
  id v4 = -[TRIPushServiceConnectionMultiplexer _channelIdFromExperimentId:](self, "_channelIdFromExperimentId:");
  if (v4)
  {
    uint64_t v5 = [(TRIPushServiceConnectionMultiplexer *)self currentConnection];
    [v5 unsubscribeFromChannel:v4];
  }
  else
  {
    [(TRIPushServiceConnectionMultiplexer *)self _logFaultIfNotTestingIdentifier:v6];
  }
}

- (id)_channelIdFromRolloutDeployment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TRIServerContext *)self->_context rolloutDatabase];
  id v6 = [v5 recordWithDeployment:v4 usingTransaction:0];

  int v7 = [v6 artifact];
  uint64_t v8 = [v7 rollout];
  int v9 = [v8 hasChannelId];

  id v10 = [TRIPushChannelId alloc];
  id v11 = v10;
  if (v9)
  {
    int v12 = [v6 artifact];
    id v13 = [v12 rollout];
    uint64_t v14 = [v13 channelId];
    v15 = [(TRIPushChannelId *)v11 initWithPushChannelId:v14];

    if (v15) {
      goto LABEL_6;
    }
  }
  else
  {
    v15 = [(TRIPushChannelId *)v10 initWithRolloutDeployment:v4];
    if (v15) {
      goto LABEL_6;
    }
  }
  v16 = [v4 rolloutId];
  [(TRIPushServiceConnectionMultiplexer *)self _logFaultIfNotTestingIdentifier:v16];

LABEL_6:
  return v15;
}

- (id)_channelIdFromExperimentId:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__48;
  v21 = __Block_byref_object_dispose__48;
  id v22 = 0;
  uint64_t v5 = [(TRIServerContext *)self->_context experimentDatabase];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__TRIPushServiceConnectionMultiplexer__channelIdFromExperimentId___block_invoke;
  v16[3] = &unk_1E6BBB310;
  v16[4] = &v17;
  [v5 enumerateExperimentRecordsMatchingExperimentId:v4 block:v16];

  id v6 = (void *)v18[5];
  if (v6
    && ([v6 artifact],
        int v7 = objc_claimAutoreleasedReturnValue(),
        [v7 experiment],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 hasChannelId],
        v8,
        v7,
        v9))
  {
    id v10 = [TRIPushChannelId alloc];
    id v11 = [(id)v18[5] artifact];
    int v12 = [v11 experiment];
    id v13 = [v12 channelId];
    uint64_t v14 = [(TRIPushChannelId *)v10 initWithPushChannelId:v13];

    if (v14) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v14 = [[TRIPushChannelId alloc] initWithExperimentId:v4];
    if (v14) {
      goto LABEL_7;
    }
  }
  [(TRIPushServiceConnectionMultiplexer *)self _logFaultIfNotTestingIdentifier:v4];
LABEL_7:
  _Block_object_dispose(&v17, 8);

  return v14;
}

void __66__TRIPushServiceConnectionMultiplexer__channelIdFromExperimentId___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 status] == 1) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)_expectedChannelIdsForRolloutDeployments:(id)a3 experimentIds:(id)a4 maxChannelsAllowed:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__TRIPushServiceConnectionMultiplexer__expectedChannelIdsForRolloutDeployments_experimentIds_maxChannelsAllowed___block_invoke;
  v18[3] = &unk_1E6BBDCC8;
  v18[4] = self;
  id v8 = a4;
  int v9 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v18);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __113__TRIPushServiceConnectionMultiplexer__expectedChannelIdsForRolloutDeployments_experimentIds_maxChannelsAllowed___block_invoke_2;
  v17[3] = &unk_1E6BBDCF0;
  v17[4] = self;
  id v10 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v17);

  id v11 = [v9 arrayByAddingObjectsFromArray:v10];
  if ([v11 count] > a5)
  {
    int v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v11 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      unint64_t v22 = a5;
      _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Number of expected channels (%tu) exceeded the max channels allowed (%tu)", buf, 0x16u);
    }

    uint64_t v14 = objc_msgSend(v11, "subarrayWithRange:", 0, a5);

    id v11 = (void *)v14;
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];

  return v15;
}

id __113__TRIPushServiceConnectionMultiplexer__expectedChannelIdsForRolloutDeployments_experimentIds_maxChannelsAllowed___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _channelIdFromRolloutDeployment:a2];
  v3 = [v2 identifier];

  return v3;
}

id __113__TRIPushServiceConnectionMultiplexer__expectedChannelIdsForRolloutDeployments_experimentIds_maxChannelsAllowed___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _channelIdFromExperimentId:a2];
  v3 = [v2 identifier];

  return v3;
}

- (void)ensureSubscriptionsExistOnlyForRolloutDeployments:(id)a3 experimentIds:(id)a4 maxChannelsAllowed:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(TRIPushServiceConnectionMultiplexer *)self currentConnection];
  id v11 = [v10 subscribedChannelIds];

  if (v11)
  {
    int v12 = [(TRIPushServiceConnectionMultiplexer *)self _expectedChannelIdsForRolloutDeployments:v8 experimentIds:v9 maxChannelsAllowed:a5];
    uint64_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v33 = [v8 count];
      __int16 v34 = 2048;
      uint64_t v35 = [v9 count];
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Keeping channels for %tu rollouts + %tu experiments", buf, 0x16u);
    }
    id v25 = v9;
    id v26 = v8;

    uint64_t v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v11 count];
      uint64_t v16 = [v12 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v33 = v15;
      __int16 v34 = 2048;
      uint64_t v35 = v16;
      _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Reconciling %tu actual subscriptions with %tu expected subscriptions", buf, 0x16u);
    }

    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v11];
    [v17 minusSet:v12];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [[TRIPushChannelId alloc] initWithPushChannelId:*(void *)(*((void *)&v27 + 1) + 8 * v22)];
          if (v23)
          {
            v24 = [(TRIPushServiceConnectionMultiplexer *)self currentConnection];
            [v24 unsubscribeFromChannel:v23];
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v20);
    }

    id v9 = v25;
    id v8 = v26;
  }
  else
  {
    int v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Couldn't resolve subscriptions since channel list is nil", buf, 2u);
    }
  }
}

- (void)switchToEnvironment:(unsigned __int8)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"TRIPushServiceConnectionMultiplexer.m" lineNumber:189 description:@"Not implemented yet"];
}

- (TRIPushServiceConnectionCreating)connectionCreator
{
  return self->_connectionCreator;
}

- (TRIPushServiceChannelSubscribing)currentConnection
{
  return self->_currentConnection;
}

- (TRIPushServiceConnectionDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong((id *)&self->_connectionCreator, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end