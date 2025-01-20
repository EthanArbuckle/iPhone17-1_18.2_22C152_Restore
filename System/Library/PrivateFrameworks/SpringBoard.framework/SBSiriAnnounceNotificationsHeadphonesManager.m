@interface SBSiriAnnounceNotificationsHeadphonesManager
+ (id)sharedInstance;
- (BOOL)canAnnounce;
- (BOOL)headphonesNotificationAnnouncementsAvailable;
- (SBSiriAnnounceNotificationsHeadphonesManager)init;
- (void)availableAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4;
- (void)dealloc;
- (void)setHeadphonesNotificationAnnouncementsAvailable:(BOOL)a3;
@end

@implementation SBSiriAnnounceNotificationsHeadphonesManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBSiriAnnounceNotificationsHeadphonesManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

void __62__SBSiriAnnounceNotificationsHeadphonesManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v1;
}

- (SBSiriAnnounceNotificationsHeadphonesManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBSiriAnnounceNotificationsHeadphonesManager;
  v2 = [(SBSiriAnnounceNotificationsHeadphonesManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F4E580]) initWithPlatform:1];
    capabilityManager = v2->_capabilityManager;
    v2->_capabilityManager = (AFSiriAnnouncementRequestCapabilityManager *)v3;

    [(AFSiriAnnouncementRequestCapabilityManager *)v2->_capabilityManager addObserver:v2];
    v5 = v2->_capabilityManager;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__SBSiriAnnounceNotificationsHeadphonesManager_init__block_invoke;
    v7[3] = &unk_1E6AF9638;
    v8 = v2;
    [(AFSiriAnnouncementRequestCapabilityManager *)v5 fetchAvailableAnnouncementRequestTypesWithCompletion:v7];
  }
  return v2;
}

uint64_t __52__SBSiriAnnounceNotificationsHeadphonesManager_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) availableAnnouncementRequestTypesChanged:a2 onPlatform:1];
}

- (void)dealloc
{
  [(AFSiriAnnouncementRequestCapabilityManager *)self->_capabilityManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBSiriAnnounceNotificationsHeadphonesManager;
  [(SBSiriAnnounceNotificationsHeadphonesManager *)&v3 dealloc];
}

- (BOOL)canAnnounce
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[SBLockScreenManager sharedInstance];
  int v4 = [v3 isUILocked];

  v5 = +[SBTelephonyManager sharedTelephonyManager];
  int v6 = [v5 inCall];

  v7 = +[SBConferenceManager sharedInstance];
  int v8 = [v7 inFaceTime];

  BOOL v9 = [(SBSiriAnnounceNotificationsHeadphonesManager *)self headphonesNotificationAnnouncementsAvailable];
  v10 = SBLogSiri();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67110144;
    v12[1] = v4 & ~v6 & ~v8 & v9;
    __int16 v13 = 1024;
    int v14 = v4;
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 1024;
    int v18 = v8;
    __int16 v19 = 1024;
    BOOL v20 = v9;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Notification/LiveActivityAlert can be spoken: %{BOOL}u [ isUILocked: %{BOOL}u inCall: %{BOOL}u inFaceTime: %{BOOL}u headphonesNotificationAnnouncementsAvailable: %{BOOL}u ]", (uint8_t *)v12, 0x20u);
  }

  return v4 & ~(_BYTE)v6 & ~(_BYTE)v8 & v9;
}

- (void)availableAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    unint64_t v5 = a3 & 1;
    if ([(SBSiriAnnounceNotificationsHeadphonesManager *)self headphonesNotificationAnnouncementsAvailable] != (a3 & 1))
    {
      int v6 = SBLogSiri();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = AFSiriAnnouncementPlatformGetName();
        int v8 = 138412546;
        BOOL v9 = v7;
        __int16 v10 = 1024;
        int v11 = v5;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Available announcements on %@ changed to %{BOOL}u", (uint8_t *)&v8, 0x12u);
      }
      [(SBSiriAnnounceNotificationsHeadphonesManager *)self setHeadphonesNotificationAnnouncementsAvailable:v5];
    }
  }
}

- (BOOL)headphonesNotificationAnnouncementsAvailable
{
  return self->_headphonesNotificationAnnouncementsAvailable;
}

- (void)setHeadphonesNotificationAnnouncementsAvailable:(BOOL)a3
{
  self->_headphonesNotificationAnnouncementsAvailable = a3;
}

- (void).cxx_destruct
{
}

@end