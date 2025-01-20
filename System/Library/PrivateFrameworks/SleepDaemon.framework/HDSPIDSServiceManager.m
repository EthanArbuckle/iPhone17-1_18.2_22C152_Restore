@interface HDSPIDSServiceManager
+ (id)_allowedMessageClasses;
+ (void)_sendMessage:(id)a3 onService:(id)a4;
- (BOOL)_shouldHandleMessageFromService:(id)a3;
- (BOOL)_shouldSendCloudMessage:(id)a3;
- (BOOL)_shouldSyncAlarmMessageFromSource:(unint64_t)a3;
- (BOOL)_shouldSyncMessage;
- (BOOL)_shouldSyncSleepModeWithReason:(unint64_t)a3;
- (BOOL)dontSync;
- (HDSPEnvironment)environment;
- (HDSPIDSService)cloudService;
- (HDSPIDSService)localService;
- (HDSPIDSServiceManager)initWithEnvironment:(id)a3;
- (HDSPIDSServiceManager)initWithEnvironment:(id)a3 localService:(id)a4 cloudService:(id)a5;
- (NSString)sourceIdentifier;
- (id)eventIdentifiers;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (void)_handleConfirmWakeUpMessage:(id)a3;
- (void)_handleDismissGoodMorningMessage:(id)a3;
- (void)_handleNotifiedForEarlyWakeUpMessage:(id)a3;
- (void)_handleReceivedMessage:(id)a3;
- (void)_handleSetSleepModeMessage:(id)a3;
- (void)_handleSleepAlarmDismissedMessage:(id)a3;
- (void)_handleSleepAlarmSnoozedMessage:(id)a3;
- (void)_handleTestMessage:(id)a3;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)goodMorningWasDismissed;
- (void)sendMessage:(id)a3;
- (void)sendNotifiedForEarlyWakeUpMessage;
- (void)sendTestIDSMessage;
- (void)service:(id)a3 didReceiveMessage:(id)a4;
- (void)sleepEventIsDue:(id)a3;
- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5;
- (void)wakeUpAlarmWasDismissedFromSource:(unint64_t)a3;
- (void)wakeUpAlarmWasSnoozedFromSource:(unint64_t)a3;
- (void)wakeUpWasConfirmed:(BOOL)a3;
@end

@implementation HDSPIDSServiceManager

- (HDSPIDSServiceManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [v4 behavior];
  if ([v5 supportsNanoSync])
  {
    v6 = HKSPDispatchQueueName();
    v7 = HKSPSerialQueueBackedScheduler();
    v8 = +[HDSPIDSService localServiceWithScheduler:v7];
  }
  else
  {
    v8 = 0;
  }

  v9 = [v4 behavior];
  v10 = [v9 features];
  if ([v10 sleepCloudKitSync])
  {
    v11 = HKSPDispatchQueueName();
    v12 = HKSPSerialQueueBackedScheduler();
    v13 = +[HDSPIDSService cloudServiceWithScheduler:v12];
  }
  else
  {
    v13 = 0;
  }

  v14 = [(HDSPIDSServiceManager *)self initWithEnvironment:v4 localService:v8 cloudService:v13];
  return v14;
}

- (HDSPIDSServiceManager)initWithEnvironment:(id)a3 localService:(id)a4 cloudService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDSPIDSServiceManager;
  v11 = [(HDSPIDSServiceManager *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_environment, v8);
    objc_storeStrong((id *)&v12->_localService, a4);
    objc_storeStrong((id *)&v12->_cloudService, a5);
    v13 = v12;
  }

  return v12;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4 = a3;
  v5 = [v4 sleepModeManager];
  [v5 addObserver:self];

  v6 = [v4 actionManager];
  [v6 addObserver:self];

  v7 = [v4 sleepScheduler];
  [v7 addEventHandler:self];

  id v8 = [v4 notificationListener];

  [v8 addObserver:self];
}

- (void)environmentDidBecomeReady:(id)a3
{
  [(HDSPIDSService *)self->_localService setDelegate:self];
  cloudService = self->_cloudService;

  [(HDSPIDSService *)cloudService setDelegate:self];
}

- (void)sendNotifiedForEarlyWakeUpMessage
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(HDSPNotifiedForEarlyWakeUpIDSMessage);
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2114;
    id v9 = v3;
    id v5 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing notifiedForEarlyWakeUpMessage %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(HDSPIDSServiceManager *)self sendMessage:v3];
}

- (void)sendTestIDSMessage
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(HDSPTestIDSMessage);
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2114;
    id v9 = v3;
    id v5 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing testIDSMessage %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(HDSPIDSServiceManager *)self sendMessage:v3];
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (-[HDSPIDSServiceManager _shouldSyncSleepModeWithReason:](self, "_shouldSyncSleepModeWithReason:", a5, a4))
  {
    id v7 = [[HDSPSetSleepModeIDSMessage alloc] initWithSleepModeOn:a3 == 2];
    __int16 v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = (id)objc_opt_class();
      __int16 v12 = 2114;
      v13 = v7;
      id v9 = v11;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing setSleepModeMessage %{public}@", (uint8_t *)&v10, 0x16u);
    }
    [(HDSPIDSServiceManager *)self sendMessage:v7];
  }
}

- (BOOL)_shouldSyncSleepModeWithReason:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v4 = [(HDSPIDSServiceManager *)self _shouldSyncMessage];
  if (v4)
  {
    int v4 = HKSPSleepModeChangeReasonTreatedAsUserRequested();
    if (v4)
    {
      id v5 = HKSPLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = (id)objc_opt_class();
        id v6 = v15;
        _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] checking if paired device supports focus mode", (uint8_t *)&v14, 0xCu);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
      __int16 v8 = [WeakRetained behavior];
      int v9 = objc_msgSend(v8, "hksp_activePairedDeviceSupportsFocusMode");

      if (v9)
      {
        int v10 = HKSPLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = objc_opt_class();
          int v14 = 138543362;
          id v15 = v11;
          id v12 = v11;
          _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] not syncing because paired device supports focus mode", (uint8_t *)&v14, 0xCu);
        }
        LOBYTE(v4) = 0;
      }
      else
      {
        LOBYTE(v4) = 1;
      }
    }
  }
  return v4;
}

- (BOOL)_shouldSyncMessage
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(HDSPIDSServiceManager *)self environment];
  v3 = [v2 currentContext];

  int v4 = [v3 source];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  id v5 = [v3 source];
  int v6 = [v5 dontSync];

  if (!v6)
  {
LABEL_7:
    BOOL v11 = 1;
    goto LABEL_8;
  }
  id v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = objc_opt_class();
    id v9 = v8;
    int v10 = [v3 source];
    int v13 = 138543618;
    int v14 = v8;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] not syncing message for source %{public}@", (uint8_t *)&v13, 0x16u);
  }
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

- (void)wakeUpWasConfirmed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(HDSPIDSServiceManager *)self _shouldSyncMessage])
  {
    id v5 = [(HDSPIDSServiceManager *)self environment];
    int v6 = [v5 sleepScheduleModelManager];
    id v7 = [v6 sleepEventRecord];

    __int16 v8 = [HDSPConfirmWakeUpIDSMessage alloc];
    id v9 = [v7 wakeUpEarlyNotificationConfirmedDate];
    int v10 = [v7 wakeUpConfirmedUntilDate];
    BOOL v11 = [(HDSPConfirmWakeUpIDSMessage *)v8 initWithWasExplicitConfirmation:v3 wakeUpConfirmedDate:v9 wakeUpConfirmedUntilDate:v10];

    id v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      id v13 = v15;
      _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing confirmWakeUpMessage %{public}@", (uint8_t *)&v14, 0x16u);
    }
    [(HDSPIDSServiceManager *)self sendMessage:v11];
  }
}

- (BOOL)_shouldSyncAlarmMessageFromSource:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    BOOL v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = (id)objc_opt_class();
      id v4 = v8;
      id v5 = "[%{public}@] not syncing alarm message from Cloud";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if (a3 == 1)
  {
    BOOL v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = (id)objc_opt_class();
      id v4 = v8;
      id v5 = "[%{public}@] not syncing alarm message from NanoSync";
LABEL_7:
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (void)wakeUpAlarmWasDismissedFromSource:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(HDSPIDSServiceManager *)self _shouldSyncMessage]
    && [(HDSPIDSServiceManager *)self _shouldSyncAlarmMessageFromSource:a3])
  {
    id v5 = [(HDSPIDSServiceManager *)self environment];
    int v6 = [v5 sleepScheduleModelManager];
    int v7 = [v6 sleepEventRecord];

    id v8 = [HDSPSleepAlarmDismissedIDSMessage alloc];
    uint64_t v9 = [v7 wakeUpAlarmDismissedDate];
    int v10 = [(HDSPSleepAlarmDismissedIDSMessage *)v8 initWithDismissedDate:v9];

    BOOL v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      __int16 v16 = v10;
      id v12 = v14;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing wakeUpAlarmWasDismissed %{public}@", (uint8_t *)&v13, 0x16u);
    }
    [(HDSPIDSServiceManager *)self sendMessage:v10];
  }
}

- (void)wakeUpAlarmWasSnoozedFromSource:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(HDSPIDSServiceManager *)self _shouldSyncMessage]
    && [(HDSPIDSServiceManager *)self _shouldSyncAlarmMessageFromSource:a3])
  {
    id v5 = [(HDSPIDSServiceManager *)self environment];
    int v6 = [v5 sleepScheduleModelManager];
    int v7 = [v6 sleepEventRecord];

    id v8 = [HDSPSleepAlarmSnoozedIDSMessage alloc];
    uint64_t v9 = [v7 wakeUpAlarmSnoozedUntilDate];
    int v10 = [(HDSPSleepAlarmSnoozedIDSMessage *)v8 initWithSnoozedUntilDate:v9];

    BOOL v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      __int16 v16 = v10;
      id v12 = v14;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing wakeUpAlarmWasSnoozed %{public}@", (uint8_t *)&v13, 0x16u);
    }
    [(HDSPIDSServiceManager *)self sendMessage:v10];
  }
}

- (void)goodMorningWasDismissed
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(HDSPIDSServiceManager *)self _shouldSyncMessage])
  {
    BOOL v3 = [(HDSPIDSServiceManager *)self environment];
    id v4 = [v3 sleepScheduleModelManager];
    id v5 = [v4 sleepEventRecord];

    int v6 = [HDSPDismissGoodMorningIDSMessage alloc];
    int v7 = [v5 goodMorningDismissedDate];
    id v8 = [(HDSPDismissGoodMorningIDSMessage *)v6 initWithGoodMorningDismissedDate:v7];

    uint64_t v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2114;
      id v14 = v8;
      id v10 = v12;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing dismissGoodMorningMessage %{public}@", (uint8_t *)&v11, 0x16u);
    }
    [(HDSPIDSServiceManager *)self sendMessage:v8];
  }
}

- (id)eventIdentifiers
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F75C38]];
}

- (void)sleepEventIsDue:(id)a3
{
  id v5 = [a3 identifier];
  char v6 = [v5 isEqualToString:*MEMORY[0x263F75C38]];

  if ((v6 & 1) == 0)
  {
    int v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HDSPIDSServiceManager.m" lineNumber:196 description:@"Unexpected event received"];
  }

  [(HDSPIDSServiceManager *)self sendNotifiedForEarlyWakeUpMessage];
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_localService && ([v4 destinations] & 1) != 0) {
    [(id)objc_opt_class() _sendMessage:v5 onService:self->_localService];
  }
  if (self->_cloudService && [(HDSPIDSServiceManager *)self _shouldSendCloudMessage:v5]) {
    [(id)objc_opt_class() _sendMessage:v5 onService:self->_cloudService];
  }

  MEMORY[0x270F9A758]();
}

- (BOOL)_shouldSendCloudMessage:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HDSPIDSServiceManager *)self environment];
  char v6 = [v5 sleepScheduleModelManager];
  int v7 = [v6 sleepSettings];

  if ([v7 shareAcrossDevices])
  {
    unint64_t v8 = ((unint64_t)[v4 destinations] >> 1) & 1;
  }
  else
  {
    uint64_t v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = (id)objc_opt_class();
      id v10 = v13;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] not sending cloud message because share across devices is disabled", (uint8_t *)&v12, 0xCu);
    }
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (void)_sendMessage:(id)a3 onService:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    id v9 = v17;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sending message %{public}@ on service %{public}@", buf, 0x20u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__HDSPIDSServiceManager__sendMessage_onService___block_invoke;
  v12[3] = &unk_2645DA680;
  id v14 = v7;
  id v15 = a1;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  [v10 sendMessage:v11 completion:v12];
}

void __48__HDSPIDSServiceManager__sendMessage_onService___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = HKSPLogForCategory();
  id v7 = v6;
  if (!a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    int v12 = objc_opt_class();
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138544130;
    __int16 v16 = v12;
    __int16 v17 = 2114;
    uint64_t v18 = v13;
    __int16 v19 = 2114;
    id v20 = v5;
    __int16 v21 = 2114;
    uint64_t v22 = v14;
    id v11 = v12;
    _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to send message %{public}@ with error %{public}@ on service %{public}@", (uint8_t *)&v15, 0x2Au);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    int v15 = 138543874;
    __int16 v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    id v20 = v10;
    id v11 = v8;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent message %{public}@ on service %{public}@", (uint8_t *)&v15, 0x20u);
LABEL_4:
  }
LABEL_6:
}

+ (id)_allowedMessageClasses
{
  if (qword_26AB790F0 != -1) {
    dispatch_once(&qword_26AB790F0, &__block_literal_global_15);
  }
  v2 = (void *)_MergedGlobals_17;

  return v2;
}

void __47__HDSPIDSServiceManager__allowedMessageClasses__block_invoke()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  BOOL v3 = (void *)_MergedGlobals_17;
  _MergedGlobals_17 = v2;
}

- (void)service:(id)a3 didReceiveMessage:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543874;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v6;
    id v9 = v11;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] received message %{public}@ from service %{public}@", (uint8_t *)&v10, 0x20u);
  }
  if ([(HDSPIDSServiceManager *)self _shouldHandleMessageFromService:v6]) {
    [(HDSPIDSServiceManager *)self _handleReceivedMessage:v7];
  }
}

- (BOOL)_shouldHandleMessageFromService:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = (HDSPIDSService *)a3;
  uint64_t v5 = [(HDSPIDSServiceManager *)self environment];
  id v6 = [v5 sleepScheduleModelManager];
  id v7 = [v6 sleepSettings];

  uint64_t v8 = [(HDSPIDSServiceManager *)self environment];
  id v9 = [v8 behavior];
  if ([v9 isAppleWatch])
  {
    char v10 = [v7 watchSleepFeaturesEnabled];

    if ((v10 & 1) == 0)
    {
      id v11 = HKSPLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543362;
        id v17 = (id)objc_opt_class();
        id v12 = v17;
        id v13 = "[%{public}@] ignoring message because watch sleep features are disabled";
LABEL_11:
        _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0xCu);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (self->_cloudService == v4 && ([v7 shareAcrossDevices] & 1) == 0)
  {
    id v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = (id)objc_opt_class();
      id v12 = v17;
      id v13 = "[%{public}@] ignoring cloud message because share across devices is disabled";
      goto LABEL_11;
    }
LABEL_12:

    BOOL v14 = 0;
    goto LABEL_13;
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)_handleReceivedMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HDSPIDSServiceManager *)self environment];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HDSPIDSServiceManager__handleReceivedMessage___block_invoke;
  v7[3] = &unk_2645D9288;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 perform:v7 withSource:self];
}

void __48__HDSPIDSServiceManager__handleReceivedMessage___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
    [v2 _handleSetSleepModeMessage:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v4 = *(void **)(a1 + 40);
      [v4 _handleConfirmWakeUpMessage:v5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = *(void *)(a1 + 32);
        id v6 = *(void **)(a1 + 40);
        [v6 _handleDismissGoodMorningMessage:v7];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = *(void *)(a1 + 32);
          id v8 = *(void **)(a1 + 40);
          [v8 _handleNotifiedForEarlyWakeUpMessage:v9];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = *(void *)(a1 + 32);
            char v10 = *(void **)(a1 + 40);
            [v10 _handleSleepAlarmDismissedMessage:v11];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v13 = *(void *)(a1 + 32);
              id v12 = *(void **)(a1 + 40);
              [v12 _handleSleepAlarmSnoozedMessage:v13];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v15 = *(void *)(a1 + 32);
                BOOL v14 = *(void **)(a1 + 40);
                [v14 _handleTestMessage:v15];
              }
              else
              {
                int v16 = HKSPLogForCategory();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  id v17 = objc_opt_class();
                  uint64_t v18 = *(void *)(a1 + 32);
                  int v20 = 138543618;
                  __int16 v21 = v17;
                  __int16 v22 = 2114;
                  uint64_t v23 = v18;
                  id v19 = v17;
                  _os_log_error_impl(&dword_221A52000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] unexpected message received %{public}@", (uint8_t *)&v20, 0x16u);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_handleSetSleepModeMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)char v10 = 138543618;
    *(void *)&v10[4] = objc_opt_class();
    *(_WORD *)&v10[12] = 2114;
    *(void *)&v10[14] = v4;
    id v6 = *(id *)&v10[4];
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleSetSleepModeMessage: %{public}@", v10, 0x16u);
  }
  uint64_t v7 = [(HDSPIDSServiceManager *)self environment];
  id v8 = [v7 sleepModeManager];
  if ([v4 sleepModeOn]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  objc_msgSend(v8, "setSleepMode:reason:", v9, 5, *(_OWORD *)v10, *(void *)&v10[16], v11);
}

- (void)_handleConfirmWakeUpMessage:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v4;
    id v6 = v13;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleConfirmWakeUpMessage: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v7 = [(HDSPIDSServiceManager *)self environment];
  id v8 = [v7 actionManager];
  uint64_t v9 = [v4 wasExplicitConfirmation];
  char v10 = [v4 wakeUpConfirmedDate];
  uint64_t v11 = [v4 wakeUpConfirmedUntilDate];
  [v8 confirmWakeUp:v9 date:v10 confirmUntilDate:v11];
}

- (void)_handleDismissGoodMorningMessage:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v4;
    id v6 = v11;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleDismissGoodMorningMessage: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v7 = [(HDSPIDSServiceManager *)self environment];
  id v8 = [v7 actionManager];
  uint64_t v9 = [v4 goodMorningDismissed];
  [v8 dismissGoodMorningOnDate:v9];
}

- (void)_handleNotifiedForEarlyWakeUpMessage:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v4;
    id v6 = v10;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleNotifiedForEarlyWakeUpMessage: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = [(HDSPIDSServiceManager *)self environment];
  id v8 = [v7 wakeDetectionManager];
  [v8 earlyWakeUpWasNotifiedRemotely];
}

- (void)_handleSleepAlarmDismissedMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HDSPIDSServiceManager *)self environment];
  id v6 = [v5 behavior];
  char v7 = objc_msgSend(v6, "hksp_supportsSleepAlarms");

  if ((v7 & 1) == 0)
  {
    id v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v4;
      id v9 = v14;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleSleepAlarmDismissedMessage: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    id v10 = [(HDSPIDSServiceManager *)self environment];
    __int16 v11 = [v10 actionManager];
    id v12 = [v4 dismissedDate];
    [v11 sleepAlarmDismissedOnDate:v12 source:2];
  }
}

- (void)_handleSleepAlarmSnoozedMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HDSPIDSServiceManager *)self environment];
  id v6 = [v5 behavior];
  char v7 = objc_msgSend(v6, "hksp_supportsSleepAlarms");

  if ((v7 & 1) == 0)
  {
    id v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v4;
      id v9 = v14;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleSleepAlarmSnoozedMessage: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    id v10 = [(HDSPIDSServiceManager *)self environment];
    __int16 v11 = [v10 actionManager];
    id v12 = [v4 snoozedUntilDate];
    [v11 sleepAlarmSnoozedUntilDate:v12 source:2];
  }
}

- (void)_handleTestMessage:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2114;
    id v9 = v3;
    id v5 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleTestMessage: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (NSString)sourceIdentifier
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)dontSync
{
  return 1;
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 isEqualToString:@"com.apple.sleepd.ids.test"])
  {
    int v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v10 = 138543618;
      *(void *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(void *)&v10[14] = v5;
      id v7 = *(id *)&v10[4];
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v10, 0x16u);
    }
    [(HDSPIDSServiceManager *)self sendTestIDSMessage];
  }
  __int16 v8 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", *(_OWORD *)v10, *(void *)&v10[16], v11);

  return v8;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HDSPIDSService)localService
{
  return self->_localService;
}

- (HDSPIDSService)cloudService
{
  return self->_cloudService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudService, 0);
  objc_storeStrong((id *)&self->_localService, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end