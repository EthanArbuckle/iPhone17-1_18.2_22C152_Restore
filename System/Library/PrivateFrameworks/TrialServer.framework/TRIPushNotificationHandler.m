@interface TRIPushNotificationHandler
- (BOOL)_isMissingNotificationFields:(id)a3;
- (TRIHotfixRolloutTargetingSchedulerProtocol)hotfixScheduler;
- (TRINotificationReactionCheckerProtocol)notificationChecker;
- (TRIPushNotificationHandler)initWithNotificationChecker:(id)a3 hotfixScheduler:(id)a4 rollbackScheduler:(id)a5;
- (TRIUrgentRollbackSchedulerProtocol)rollbackScheduler;
- (void)_handleDeploymentNotification:(id)a3;
- (void)_handleRollbackNotification:(id)a3;
- (void)didReceivePushNotification:(id)a3;
@end

@implementation TRIPushNotificationHandler

- (TRIPushNotificationHandler)initWithNotificationChecker:(id)a3 hotfixScheduler:(id)a4 rollbackScheduler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIPushNotificationHandler;
  v12 = [(TRIPushNotificationHandler *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_notificationChecker, a3);
    objc_storeStrong((id *)&v13->_hotfixScheduler, a4);
    objc_storeStrong((id *)&v13->_rollbackScheduler, a5);
  }

  return v13;
}

- (void)didReceivePushNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRIPushNotificationHandler.m", 47, @"Invalid parameter not satisfying: %@", @"notification" object file lineNumber description];
  }
  int v6 = [v5 notificationOneOfCase];
  switch(v6)
  {
    case 2:
      v8 = [v5 experimentNotification];
      [(TRIPushNotificationHandler *)self _handleRollbackNotification:v8];
LABEL_11:

      break;
    case 1:
      v8 = [v5 rolloutNotification];
      [(TRIPushNotificationHandler *)self _handleDeploymentNotification:v8];
      goto LABEL_11;
    case 0:
      v7 = TRILogCategory_Server();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v5;
        _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Got push notification without content: %@", buf, 0xCu);
      }

      break;
  }
}

- (void)_handleDeploymentNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(TRIPushNotificationHandler *)self _isMissingNotificationFields:v4])
  {
    id v5 = (void *)MEMORY[0x1E4FB0228];
    int v6 = [v4 rolloutId];
    v7 = objc_msgSend(v5, "deploymentWithRolloutId:deploymentId:", v6, objc_msgSend(v4, "deploymentId"));

    v8 = [v4 deploymentDate];
    id v9 = [v8 date];

    id v10 = [(TRIPushNotificationHandler *)self notificationChecker];
    int v11 = [v10 reactionForHotfixDeployment:v7 hotfixDeploymentDate:v9];

    if (v11)
    {
      uint64_t v12 = [v4 notificationProcessingPolicy];
      int v13 = [v12 assetDownloadPolicy];
      v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543618;
        v16 = v7;
        __int16 v17 = 1026;
        BOOL v18 = v13 == 2;
        _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Scheduling Hotfix for deployment %{public}@ (any network + battery allowed: %{public}d)", (uint8_t *)&v15, 0x12u);
      }

      -[TRIHotfixRolloutTargetingSchedulerProtocol scheduleHotfixForDeployment:allowingAnyNetworkingAndBatteryUsage:runDelay:](self->_hotfixScheduler, "scheduleHotfixForDeployment:allowingAnyNetworkingAndBatteryUsage:runDelay:", v7, v13 == 2, (double)arc4random_uniform([v12 delaySeconds]));
    }
  }
}

- (BOOL)_isMissingNotificationFields:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 hasNotificationProcessingPolicy] & 1) == 0)
  {
    int v13 = TRILogCategory_Server();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      char v12 = 1;
      goto LABEL_28;
    }
    v14 = (objc_class *)objc_opt_class();
    int v15 = NSStringFromClass(v14);
    int v31 = 138412290;
    v32 = v15;
    v16 = "Cannot decode message of type %@ with missing field: notificationProcessingPolicy";
LABEL_14:
    _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v31, 0xCu);

    goto LABEL_27;
  }
  id v4 = [v3 notificationProcessingPolicy];
  char v5 = [v4 hasDelaySeconds];

  if ((v5 & 1) == 0)
  {
    int v13 = TRILogCategory_Server();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    __int16 v17 = [v3 notificationProcessingPolicy];
    BOOL v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    int v31 = 138412290;
    v32 = v19;
    v20 = "Cannot decode message of type %@ with missing field: delaySeconds";
LABEL_19:
    _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v31, 0xCu);

    goto LABEL_27;
  }
  int v6 = [v3 notificationProcessingPolicy];
  char v7 = [v6 hasAssetDownloadPolicy];

  if ((v7 & 1) == 0)
  {
    int v13 = TRILogCategory_Server();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    __int16 v17 = [v3 notificationProcessingPolicy];
    v21 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v21);
    int v31 = 138412290;
    v32 = v19;
    v20 = "Cannot decode message of type %@ with missing field: assetDownloadPolicy";
    goto LABEL_19;
  }
  if (([v3 hasRolloutId] & 1) == 0)
  {
    v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      int v31 = 138412290;
      v32 = v27;
      _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", (uint8_t *)&v31, 0xCu);
    }
    int v13 = TRILogCategory_Server();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    v23 = (objc_class *)objc_opt_class();
    int v15 = NSStringFromClass(v23);
    int v31 = 138412290;
    v32 = v15;
    v16 = "Cannot decode message of type %@ with missing field: rolloutId";
    goto LABEL_14;
  }
  v8 = [v3 rolloutId];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    int v13 = TRILogCategory_Server();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    v24 = (objc_class *)objc_opt_class();
    int v15 = NSStringFromClass(v24);
    int v31 = 138412290;
    v32 = v15;
    v16 = "Cannot decode message of type %@ with field of length 0: rolloutId";
    goto LABEL_14;
  }
  if (([v3 hasDeploymentId] & 1) == 0)
  {
    int v13 = TRILogCategory_Server();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    v28 = (objc_class *)objc_opt_class();
    int v15 = NSStringFromClass(v28);
    int v31 = 138412290;
    v32 = v15;
    v16 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_14;
  }
  char v10 = [v3 hasDeploymentDate];
  if ((v10 & 1) == 0)
  {
    int v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      int v31 = 138412290;
      v32 = v30;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: deploymentDate", (uint8_t *)&v31, 0xCu);
    }
  }
  char v12 = v10 ^ 1;
LABEL_28:

  return v12;
}

- (void)_handleRollbackNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasExperimentId])
  {
    char v5 = [v4 experimentId];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      char v7 = [v4 experimentId];
      v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "deploymentIdArray_Count"));
      if ([(TRINotificationReactionCheckerProtocol *)self->_notificationChecker reactionForRollbackExperimentId:v7])
      {
        uint64_t v9 = [v4 deploymentIdArray];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __58__TRIPushNotificationHandler__handleRollbackNotification___block_invoke;
        v19[3] = &unk_1E6BB8EF0;
        id v10 = v8;
        id v20 = v10;
        [v9 enumerateValuesWithBlock:v19];

        int v11 = TRILogCategory_Server();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v22 = v7;
          __int16 v23 = 2114;
          id v24 = v10;
          _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Scheduling Urgent Rollback for experiment: %{public}@ deployments: %{public}@", buf, 0x16u);
        }

        [(TRIUrgentRollbackSchedulerProtocol *)self->_rollbackScheduler scheduleUrgentRollbackForExperiment:v7 deploymentIds:v10];
      }

      goto LABEL_13;
    }
    char v7 = TRILogCategory_Server();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    BOOL v18 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    int v15 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_15:
    _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_13;
  }
  char v12 = TRILogCategory_Server();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v16 = (objc_class *)objc_opt_class();
    __int16 v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138412290;
    v22 = v17;
    _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);
  }
  char v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    int v15 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_15;
  }
LABEL_13:
}

void __58__TRIPushNotificationHandler__handleRollbackNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:a2];
  [v2 addObject:v3];
}

- (TRINotificationReactionCheckerProtocol)notificationChecker
{
  return self->_notificationChecker;
}

- (TRIHotfixRolloutTargetingSchedulerProtocol)hotfixScheduler
{
  return self->_hotfixScheduler;
}

- (TRIUrgentRollbackSchedulerProtocol)rollbackScheduler
{
  return self->_rollbackScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollbackScheduler, 0);
  objc_storeStrong((id *)&self->_hotfixScheduler, 0);
  objc_storeStrong((id *)&self->_notificationChecker, 0);
}

@end