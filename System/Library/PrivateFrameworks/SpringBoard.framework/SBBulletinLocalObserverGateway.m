@interface SBBulletinLocalObserverGateway
+ (id)sharedInstance;
- (SBBulletinLocalObserverGateway)init;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7;
@end

@implementation SBBulletinLocalObserverGateway

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SBBulletinLocalObserverGateway_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_30 != -1) {
    dispatch_once(&sharedInstance_onceToken_30, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_5;
  return v2;
}

void __48__SBBulletinLocalObserverGateway_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = (uint64_t)v1;
}

- (SBBulletinLocalObserverGateway)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBBulletinLocalObserverGateway;
  v2 = [(SBBulletinLocalObserverGateway *)&v7 init];
  if (v2)
  {
    SBGuidedAccessPrepare();
    Serial = (void *)BSDispatchQueueCreateSerial();
    uint64_t v4 = [MEMORY[0x1E4F50CC8] gatewayWithQueue:Serial calloutQueue:MEMORY[0x1E4F14428] name:*MEMORY[0x1E4F50CA0] priority:3];
    bbObserver = v2->_bbObserver;
    v2->_bbObserver = (BBObserver *)v4;

    [(BBObserver *)v2->_bbObserver setDelegate:v2];
    [(BBObserver *)v2->_bbObserver setObserverFeed:65023];
  }
  return v2;
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void))a7;
  v13 = (os_log_t *)MEMORY[0x1E4FB3760];
  v14 = (void *)*MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = [v11 publisherMatchID];
    v19 = objc_msgSend(v18, "un_logDigest");
    v20 = [v11 sectionID];
    *(_DWORD *)buf = 138413314;
    v40 = v17;
    __int16 v41 = 2114;
    *(void *)v42 = v19;
    *(_WORD *)&v42[8] = 2048;
    unint64_t v43 = a5;
    *(_WORD *)v44 = 2114;
    *(void *)&v44[2] = v20;
    __int16 v45 = 1024;
    BOOL v46 = v8;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "%@ adding bulletin %{public}@ for feed %lu in section %{public}@ playLightsAndSirens: %{BOOL}u", buf, 0x30u);
  }
  v21 = +[SBBacklightController sharedInstance];
  int v22 = [v21 screenIsOn];

  v23 = +[SBLockScreenManager sharedInstance];
  int v24 = [v23 isUILocked];

  int v25 = v22 & (v24 ^ 1);
  uint64_t v26 = +[SBConferenceManager sharedInstance];
  char v27 = [(id)v26 inFaceTime];

  LOBYTE(v26) = SBGuidedAccessIsActive();
  v28 = [MEMORY[0x1E4F42D90] mainScreen];
  int v29 = [v28 isCaptured];

  int v30 = v29 & ([MEMORY[0x1E4F42D90] _isProbablyBeingRecorded] ^ 1);
  if (v26) {
    int v30 = 1;
  }
  if (v27) {
    int v31 = 1;
  }
  else {
    int v31 = v30;
  }
  v32 = [(id)SBApp notificationDispatcher];
  unsigned int v33 = [v32 isCarDestinationActive];

  os_log_t v34 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    v35 = v34;
    v36 = [v11 publisherMatchID];
    v37 = objc_msgSend(v36, "un_logDigest");
    *(_DWORD *)buf = 138544386;
    v40 = v37;
    __int16 v41 = 1024;
    *(_DWORD *)v42 = v25 & (v31 ^ 1) | v33;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v25;
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = v31;
    HIWORD(v43) = 1024;
    *(_DWORD *)v44 = v33;
    _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEFAULT, "Notification %{public}@ should alert: %{BOOL}u [ isDeviceInUse = %{BOOL}u isDeviceBusy = %{BOOL}u isCarPlayActive = %{BOOL}u ]", buf, 0x24u);
  }
  v12[2](v12, v25 & (v31 ^ 1) | v33);
}

- (void).cxx_destruct
{
}

@end