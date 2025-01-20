@interface SCDAArbitrationParticipationController
- (AFSettingsConnection)settingsConnection;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)xpcConnectionQueue;
- (SCDAArbitrationParticipationController)init;
- (void)_publishFeedbackArbitrationRecordForNearMiss;
- (void)_resetSettingsConnection;
- (void)dealloc;
- (void)publishArbitrationParticipationContext:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSettingsConnection:(id)a3;
- (void)setXpcConnectionQueue:(id)a3;
@end

@implementation SCDAArbitrationParticipationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setXpcConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setSettingsConnection:(id)a3
{
}

- (void)_resetSettingsConnection
{
  if (self->_settingsConnection)
  {
    self->_settingsConnection = 0;
    MEMORY[0x270F9A758]();
  }
}

- (AFSettingsConnection)settingsConnection
{
  if (self->_settingsConnection)
  {
    if (objc_opt_respondsToSelector()) {
      goto LABEL_6;
    }
    settingsConnection = self->_settingsConnection;
  }
  else
  {
    settingsConnection = 0;
  }
  self->_settingsConnection = 0;

  v4 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x263F285E0]);
  v5 = self->_settingsConnection;
  self->_settingsConnection = v4;

  [(AFSettingsConnection *)self->_settingsConnection setXPCConnectionManagementQueue:self->_xpcConnectionQueue];
LABEL_6:
  v6 = self->_settingsConnection;
  return v6;
}

- (void)publishArbitrationParticipationContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__SCDAArbitrationParticipationController_publishArbitrationParticipationContext___block_invoke;
  v7[3] = &unk_2654B7BB8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __81__SCDAArbitrationParticipationController_publishArbitrationParticipationContext___block_invoke(uint64_t a1)
{
  id v16 = objc_alloc(MEMORY[0x263F6CF98]);
  v2 = [*(id *)(a1 + 32) myAdvertisement];
  v3 = [*(id *)(a1 + 32) boosts];
  id v4 = [*(id *)(a1 + 32) cdaId];
  double v5 = (double)[*(id *)(a1 + 32) rawGoodnessScore];
  v15 = [*(id *)(a1 + 32) requestStartDate];
  uint64_t v14 = [*(id *)(a1 + 32) result];
  v13 = [*(id *)(a1 + 32) seenAdvertisements];
  v12 = [*(id *)(a1 + 32) msSinceTrigger];
  v11 = [*(id *)(a1 + 32) msSinceLastWin];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "triggerType"));
  v7 = [*(id *)(a1 + 32) trumpReasons];
  id v8 = [*(id *)(a1 + 32) voiceTriggerDate];
  v9 = [*(id *)(a1 + 32) winnerAdvertisement];
  id v17 = (id)[v16 initWithAdvertisement:v2 boosts:v3 cdaId:v4 rawGoodnessScore:v15 requestStartDate:v14 result:v13 seenAdvertisements:v5 timeSinceLastTriggerInMilliseconds:v12 timeSinceLastWinInMilliseconds:v11 triggerType:v6 trumpReasons:v7 voiceTriggerDate:v8 winnerAdvertisement:v9];

  v10 = [*(id *)(a1 + 40) settingsConnection];
  [v10 publishFeedbackArbitrationParticipation:v17];

  [*(id *)(a1 + 40) _resetSettingsConnection];
}

- (void)_publishFeedbackArbitrationRecordForNearMiss
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__SCDAArbitrationParticipationController__publishFeedbackArbitrationRecordForNearMiss__block_invoke;
  block[3] = &unk_2654B81C8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __86__SCDAArbitrationParticipationController__publishFeedbackArbitrationRecordForNearMiss__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F6CF98]) initNearMiss];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[SCDAArbitrationParticipationController _publishFeedbackArbitrationRecordForNearMiss]_block_invoke";
    _os_log_debug_impl(&dword_25C707000, v3, OS_LOG_TYPE_DEBUG, "%s #scda #feedback", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) settingsConnection];
  [v4 publishFeedbackArbitrationParticipation:v2];

  [*(id *)(a1 + 32) _resetSettingsConnection];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.voicetrigger.NearTrigger", 0);
  v4.receiver = self;
  v4.super_class = (Class)SCDAArbitrationParticipationController;
  [(SCDAArbitrationParticipationController *)&v4 dealloc];
}

- (SCDAArbitrationParticipationController)init
{
  v11.receiver = self;
  v11.super_class = (Class)SCDAArbitrationParticipationController;
  v2 = [(SCDAArbitrationParticipationController *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_super v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v5 = dispatch_queue_create("AFArbitrationParticipationXPCConnectionQueue", v4);
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("AFArbitrationParticipationQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)notificationNearMissCallback, @"com.apple.voicetrigger.NearTrigger", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

@end