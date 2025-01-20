@interface SBBulletinSpokenObserverGateway
+ (id)sharedInstance;
- (SBBulletinSpokenObserverGateway)init;
- (void)availableAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7;
@end

@implementation SBBulletinSpokenObserverGateway

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SBBulletinSpokenObserverGateway_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __49__SBBulletinSpokenObserverGateway_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
}

- (SBBulletinSpokenObserverGateway)init
{
  v13.receiver = self;
  v13.super_class = (Class)SBBulletinSpokenObserverGateway;
  v2 = [(SBBulletinSpokenObserverGateway *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F4E580]) initWithPlatform:1];
    announcementRequestCapabilityManager = v2->_announcementRequestCapabilityManager;
    v2->_announcementRequestCapabilityManager = (AFSiriAnnouncementRequestCapabilityManager *)v3;

    [(AFSiriAnnouncementRequestCapabilityManager *)v2->_announcementRequestCapabilityManager addObserver:v2];
    v5 = v2->_announcementRequestCapabilityManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__SBBulletinSpokenObserverGateway_init__block_invoke;
    v11[3] = &unk_1E6AF9638;
    v6 = v2;
    v12 = v6;
    [(AFSiriAnnouncementRequestCapabilityManager *)v5 fetchAvailableAnnouncementRequestTypesWithCompletion:v11];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.springboard.SBBulletinSpokenObserverGateway", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

uint64_t __39__SBBulletinSpokenObserverGateway_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) availableAnnouncementRequestTypesChanged:a2 onPlatform:1];
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  objc_super v13 = (void (**)(id, void))a7;
  v14 = (os_log_t *)MEMORY[0x1E4FB3760];
  v15 = (void *)*MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v19 = [v12 publisherMatchID];
    objc_msgSend(v19, "un_logDigest");
    v21 = id v20 = v11;
    v22 = [v12 sectionID];
    *(_DWORD *)buf = 138413314;
    v49 = v18;
    __int16 v50 = 2114;
    *(void *)v51 = v21;
    *(_WORD *)&v51[8] = 2048;
    unint64_t v52 = a5;
    *(_WORD *)v53 = 2114;
    *(void *)&v53[2] = v22;
    __int16 v54 = 1024;
    BOOL v55 = v8;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "%@ adding bulletin %{public}@ for feed %lu in section %{public}@ playLightsAndSirens: %{BOOL}u", buf, 0x30u);

    v14 = (os_log_t *)MEMORY[0x1E4FB3760];
    id v11 = v20;
  }
  if (!v8)
  {
    if (!v13) {
      goto LABEL_16;
    }
    os_log_t v36 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v36;
      v38 = [v12 publisherMatchID];
      v39 = objc_msgSend(v38, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      v49 = v39;
      _os_log_impl(&dword_1D85BA000, v37, OS_LOG_TYPE_DEFAULT, "Notification %{public}@ cannot be spoken because BulletinBoard suppressed it", buf, 0xCu);
    }
LABEL_15:
    v13[2](v13, 0);
    goto LABEL_16;
  }
  v23 = +[SBLockScreenManager sharedInstance];
  int v24 = [v23 isUILocked];

  v25 = +[SBTelephonyManager sharedTelephonyManager];
  int v26 = [v25 inCall];

  v27 = +[SBConferenceManager sharedInstance];
  int v28 = [v27 inFaceTime];

  BOOL canAnnounceNotifications = 0;
  if (v24 && (v26 & 1) == 0 && (v28 & 1) == 0) {
    BOOL canAnnounceNotifications = self->_canAnnounceNotifications;
  }
  v30 = *v14;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    v32 = [v12 publisherMatchID];
    objc_msgSend(v32, "un_logDigest");
    v33 = id v40 = v11;
    BOOL v34 = self->_canAnnounceNotifications;
    *(_DWORD *)buf = 138544642;
    v49 = v33;
    __int16 v50 = 1024;
    *(_DWORD *)v51 = canAnnounceNotifications;
    *(_WORD *)&v51[4] = 1024;
    *(_DWORD *)&v51[6] = v24;
    LOWORD(v52) = 1024;
    *(_DWORD *)((char *)&v52 + 2) = v26;
    HIWORD(v52) = 1024;
    *(_DWORD *)v53 = v28;
    *(_WORD *)&v53[4] = 1024;
    *(_DWORD *)&v53[6] = v34;
    _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_DEFAULT, "Notification %{public}@ should be spoken: %{BOOL}u [ isUILocked: %{BOOL}u inCall: %{BOOL}u inFaceTime: %{BOOL}u canAnnounce: %{BOOL}u ]", buf, 0x2Au);

    id v11 = v40;
  }
  if (!canAnnounceNotifications) {
    goto LABEL_15;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke;
  block[3] = &unk_1E6AF6260;
  id v43 = v12;
  unint64_t v47 = a5;
  id v44 = v11;
  v45 = self;
  v46 = v13;
  dispatch_async(queue, block);

LABEL_16:
}

void __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FB37F0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v4 = (void **)(a1 + 32);
  id v6 = objc_alloc_init(MEMORY[0x1E4F50CD8]);
  v7 = [v2 notificationRequestForBulletin:v3 observer:v5 sectionInfo:v6 feed:v4[4]];

  if (objc_msgSend(*((id *)v4[2] + 2), "nc_shouldSuppressNotificationRequest:", v7))
  {
    BOOL v8 = (void *)*MEMORY[0x1E4FB3760];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *v4;
      v10 = v8;
      id v11 = [v9 publisherMatchID];
      id v12 = objc_msgSend(v11, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Notification %{public}@ cannot be spoken because DND suppressed it", buf, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 56);
    if (v13) {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F445C8] notificationForBulletin:*v4];
    v15 = (void *)*MEMORY[0x1E4FB3760];
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
      {
        v16 = *v4;
        v17 = v15;
        v18 = [v16 publisherMatchID];
        v19 = objc_msgSend(v18, "un_logDigest");
        *(_DWORD *)buf = 138543362;
        v29 = v19;
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Speak notification %{public}@", buf, 0xCu);
      }
      id v20 = [*(id *)(a1 + 32) sectionID];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_10;
      v23[3] = &unk_1E6AF4DD8;
      id v24 = *(id *)(a1 + 32);
      id v25 = v14;
      id v26 = v20;
      id v27 = *(id *)(a1 + 56);
      id v21 = v20;
      dispatch_async(MEMORY[0x1E4F14428], v23);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_ERROR)) {
        __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_cold_1(v4, v15);
      }
      uint64_t v22 = *(void *)(a1 + 56);
      if (v22) {
        (*(void (**)(uint64_t, void))(v22 + 16))(v22, 0);
      }
    }
  }
}

void __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_10(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) summary];
  uint64_t v3 = [v2 string];

  if ([v3 length]) {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F4E5D0]) initWithSummary:v3 summaryType:2 error:0];
  }
  else {
    v4 = 0;
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F4E5C8]) initWithUserNotification:*(void *)(a1 + 40) sourceAppId:*(void *)(a1 + 48) platform:1 summaryDecision:1 summary:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_2;
  v6[3] = &unk_1E6AF5AA0;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 56);
  [v5 performRequestWithCompletion:v6];
}

uint64_t __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = (void *)*MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 publisherMatchID];
    id v8 = objc_msgSend(v7, "un_logDigest");
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Did speak notification %{public}@: %{BOOL}u", (uint8_t *)&v10, 0x12u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)availableAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    unint64_t v5 = a3 & 1;
    if (self->_canAnnounceNotifications != (a3 & 1))
    {
      id v6 = (void *)*MEMORY[0x1E4FB3760];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v6;
        id v8 = AFSiriAnnouncementPlatformGetName();
        int v16 = 138412546;
        v17 = v8;
        __int16 v18 = 1024;
        int v19 = v5;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Notification announcements on %@ changed to %{BOOL}d", (uint8_t *)&v16, 0x12u);
      }
      self->_BOOL canAnnounceNotifications = v5;
      bbObserver = self->_bbObserver;
      if (v5)
      {
        if (!bbObserver)
        {
          __int16 v12 = (void *)MEMORY[0x1E4F14428];
          int v13 = [MEMORY[0x1E4F50CC8] gatewayWithQueue:MEMORY[0x1E4F14428] calloutQueue:MEMORY[0x1E4F14428] name:@"SpokenGateway" priority:1];
          uint64_t v14 = self->_bbObserver;
          self->_bbObserver = v13;

          [(BBObserver *)self->_bbObserver setDelegate:self];
          [(BBObserver *)self->_bbObserver setObserverFeed:256];
        }
        if (!self->_dndEventBehaviorResolutionService)
        {
          v15 = [MEMORY[0x1E4F5F5D8] serviceForClientIdentifier:@"com.apple.springboard.SBBulletinSpokenObserverGateway"];
          dndEventBehaviorResolutionService = self->_dndEventBehaviorResolutionService;
          self->_dndEventBehaviorResolutionService = v15;
          goto LABEL_14;
        }
      }
      else
      {
        if (bbObserver)
        {
          [(BBObserver *)bbObserver invalidate];
          int v10 = self->_bbObserver;
          self->_bbObserver = 0;
        }
        dndEventBehaviorResolutionService = self->_dndEventBehaviorResolutionService;
        if (dndEventBehaviorResolutionService)
        {
          self->_dndEventBehaviorResolutionService = 0;
LABEL_14:
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_announcementRequestCapabilityManager, 0);
  objc_storeStrong((id *)&self->_dndEventBehaviorResolutionService, 0);
  objc_storeStrong((id *)&self->_bbObserver, 0);
}

void __94__SBBulletinSpokenObserverGateway_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = *a1;
  uint64_t v3 = a2;
  v4 = [v2 publisherMatchID];
  unint64_t v5 = objc_msgSend(v4, "un_logDigest");
  int v6 = 138543362;
  id v7 = v5;
  _os_log_error_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_ERROR, "Notification %{public}@ cannot be spoken because notification is nil", (uint8_t *)&v6, 0xCu);
}

@end