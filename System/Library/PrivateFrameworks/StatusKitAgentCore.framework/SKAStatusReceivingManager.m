@interface SKAStatusReceivingManager
+ (id)logger;
- (OS_dispatch_queue)backgroundCleanupQueue;
- (SKADatabaseManaging)databaseManager;
- (SKAStatusEncryptionManaging)encryptionManager;
- (SKAStatusReceivingManager)initWithDatabaseManager:(id)a3 encryptionManager:(id)a4 delegate:(id)a5;
- (SKAStatusReceivingManagingDelegate)delegate;
- (void)handleIncomingStatusData:(id)a3 onChannelIdentifier:(id)a4 dateReceived:(id)a5 dateExpired:(id)a6 serverTime:(id)a7;
- (void)setBackgroundCleanupQueue:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncryptionManager:(id)a3;
@end

@implementation SKAStatusReceivingManager

- (SKAStatusReceivingManager)initWithDatabaseManager:(id)a3 encryptionManager:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SKAStatusReceivingManager;
  v12 = [(SKAStatusReceivingManager *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v13->_encryptionManager, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.StatusKit.StatusReceivingManager.cleanup", v15);
    backgroundCleanupQueue = v13->_backgroundCleanupQueue;
    v13->_backgroundCleanupQueue = (OS_dispatch_queue *)v16;
  }
  return v13;
}

- (void)handleIncomingStatusData:(id)a3 onChannelIdentifier:(id)a4 dateReceived:(id)a5 dateExpired:(id)a6 serverTime:(id)a7
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v11 = a3;
  v12 = (__CFString *)a4;
  id v13 = a6;
  id v14 = a7;
  v15 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  dispatch_queue_t v16 = [(SKADatabaseManaging *)self->_databaseManager existingChannelForSubscriptionIdentifier:v12 databaseContext:v15];
  v17 = v16;
  if (v16)
  {
    id v48 = v11;
    v18 = [v16 statusType];
    BOOL v19 = +[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v18];

    v20 = +[SKAStatusReceivingManager logger];
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v12;
        _os_log_impl(&dword_22480C000, v21, OS_LOG_TYPE_DEFAULT, "Found channel matching channel identifier: %@.", buf, 0xCu);
      }

      id v11 = v48;
      v22 = [(SKAStatusEncryptionManaging *)self->_encryptionManager extractEnvelopeFromStatusEnvelopeData:v48];
      v21 = v22;
      if (v22)
      {
        id v46 = v14;
        v44 = [v22 statusUniqueIdentifier];
        v47 = [v21 datePublished];
        v23 = [v21 dateCreated];
        v24 = [v17 statusType];
        int v25 = [v24 isEqualToString:@"com.apple.offgrid.status"];

        if (v25)
        {
          v26 = +[SKAStatusReceivingManager logger];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v54 = @"com.apple.offgrid.status";
            _os_log_impl(&dword_22480C000, v26, OS_LOG_TYPE_DEFAULT, "Status type is %@, overriding creation date to make it most recent", buf, 0xCu);
          }

          uint64_t v27 = [MEMORY[0x263EFF910] now];

          +[SKAServerBag statusValidityForOffGridPayload];
          uint64_t v28 = objc_msgSend(v47, "dateByAddingTimeInterval:");

          v29 = (void *)v27;
          id v13 = (id)v28;
        }
        else
        {
          v29 = v23;
        }
        v45 = v29;
        id v14 = v46;
        [v29 timeIntervalSinceDate:v46];
        double v32 = v31;
        v30 = v44;
        id v11 = v48;
        if ([v44 length])
        {
          if (v47)
          {
            if (v32 <= 300.0)
            {
              v33 = [(SKADatabaseManaging *)self->_databaseManager existingStatusForUniqueIdentifier:v44 databaseContext:v15];
              log = +[SKAStatusReceivingManager logger];
              BOOL v34 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
              if (v33)
              {
                if (v34)
                {
                  *(_DWORD *)buf = 138412546;
                  v54 = (__CFString *)v44;
                  __int16 v55 = 2112;
                  v56 = v33;
                  _os_log_impl(&dword_22480C000, log, OS_LOG_TYPE_DEFAULT, "We've already received a status with this unique identifier (%@), ignoring. Existing status: %@", buf, 0x16u);
                }
              }
              else
              {
                if (v34)
                {
                  *(_DWORD *)buf = 138412546;
                  v54 = (__CFString *)v44;
                  __int16 v55 = 2112;
                  v56 = v12;
                  _os_log_impl(&dword_22480C000, log, OS_LOG_TYPE_DEFAULT, "Received new status %@ for channel %@", buf, 0x16u);
                }

                log = [(SKADatabaseManaging *)self->_databaseManager createStatusWithUniqueIdentifier:v44 dateCreated:v45 datePublished:v47 dateReceived:v46 dateExpired:v13 rawData:v48 channelIdentifier:v12 databaseContext:v15];
                v35 = +[SKAStatusReceivingManager logger];
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v54 = (__CFString *)v44;
                  _os_log_impl(&dword_22480C000, v35, OS_LOG_TYPE_DEFAULT, "Saved incoming status update to database with unique identifier: %@", buf, 0xCu);
                }

                if (v13
                  && ([MEMORY[0x263EFF910] now],
                      v36 = objc_claimAutoreleasedReturnValue(),
                      [v36 timeIntervalSince1970],
                      double v38 = v37,
                      [v13 timeIntervalSince1970],
                      double v40 = v39,
                      v36,
                      v38 > v40))
                {
                  WeakRetained = +[SKAStatusReceivingManager logger];
                  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_22480C000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Not informing delegate of status because it has expired", buf, 2u);
                  }
                }
                else
                {
                  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                  [WeakRetained statusReceivingManager:self didReceiveStatusUpdate:log onChannel:v17];
                }

                objc_initWeak((id *)buf, self);
                backgroundCleanupQueue = self->_backgroundCleanupQueue;
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __110__SKAStatusReceivingManager_handleIncomingStatusData_onChannelIdentifier_dateReceived_dateExpired_serverTime___block_invoke;
                block[3] = &unk_2646E1970;
                objc_copyWeak(&v52, (id *)buf);
                v50 = v12;
                v51 = v44;
                dispatch_async(backgroundCleanupQueue, block);

                objc_destroyWeak(&v52);
                objc_destroyWeak((id *)buf);
                id v11 = v48;
                id v14 = v46;
              }
            }
            else
            {
              v33 = +[SKAStatusReceivingManager logger];
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:].cold.5();
              }
            }
          }
          else
          {
            v33 = +[SKAStatusReceivingManager logger];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:].cold.4();
            }
          }
        }
        else
        {
          v33 = +[SKAStatusReceivingManager logger];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:]();
          }
        }
      }
      else
      {
        v30 = +[SKAStatusReceivingManager logger];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:]();
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:].cold.6(v17, v21);
      }
      id v11 = v48;
    }
  }
  else
  {
    v21 = +[SKAStatusReceivingManager logger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:]();
    }
  }
}

void __110__SKAStatusReceivingManager_handleIncomingStatusData_onChannelIdentifier_dateReceived_dateExpired_serverTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained databaseManager];
  v3 = (void *)[v2 newBackgroundContext];

  v4 = [WeakRetained databaseManager];
  [v4 cleanupOldStatusUpdatesForChannelIdentifier:*(void *)(a1 + 32) excludingStatusUniqueIdentifier:*(void *)(a1 + 40) databaseContext:v3];
}

+ (id)logger
{
  if (logger_onceToken_11 != -1) {
    dispatch_once(&logger_onceToken_11, &__block_literal_global_11);
  }
  v2 = (void *)logger__logger_11;
  return v2;
}

uint64_t __35__SKAStatusReceivingManager_logger__block_invoke()
{
  logger__logger_11 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAStatusReceivingManager");
  return MEMORY[0x270F9A758]();
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (SKAStatusEncryptionManaging)encryptionManager
{
  return self->_encryptionManager;
}

- (void)setEncryptionManager:(id)a3
{
}

- (SKAStatusReceivingManagingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKAStatusReceivingManagingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)backgroundCleanupQueue
{
  return self->_backgroundCleanupQueue;
}

- (void)setBackgroundCleanupQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundCleanupQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

- (void)handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find channel matching incoming status update, ignoring.", v2, v3, v4, v5, v6);
}

- (void)handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not extract unencrypted envelope from incoming status update, ignoring.", v2, v3, v4, v5, v6);
}

- (void)handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not determine status unique identifier for incoming status update, ignoring.", v2, v3, v4, v5, v6);
}

- (void)handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not determine date published for incoming status update, ignoring.", v2, v3, v4, v5, v6);
}

- (void)handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Date created is too far in the future, ignoring.", v2, v3, v4, v5, v6);
}

- (void)handleIncomingStatusData:(void *)a1 onChannelIdentifier:(NSObject *)a2 dateReceived:dateExpired:serverTime:.cold.6(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 statusType];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_22480C000, a2, OS_LOG_TYPE_ERROR, "Status type %@ disabled by server. Dropping incoming status update", (uint8_t *)&v4, 0xCu);
}

@end