@interface SBConferenceManager
+ (SBConferenceManager)sharedInstance;
+ (void)initialize;
- (BOOL)activeFaceTimeCallExists;
- (BOOL)canStartFaceTime;
- (BOOL)faceTimeInvitationExists;
- (BOOL)faceTimeIsAvailable;
- (BOOL)hasFaceTimeCapability;
- (BOOL)inFaceTime;
- (BOOL)inFaceTimeVideo;
- (SBConferenceManager)init;
- (id)activeFaceTimeCall;
- (id)currentFaceTimeCall;
- (id)incomingFaceTimeCall;
- (void)_faceTimeStateChanged:(id)a3;
- (void)dealloc;
- (void)endFaceTime;
@end

@implementation SBConferenceManager

- (BOOL)activeFaceTimeCallExists
{
  v2 = [(SBConferenceManager *)self activeFaceTimeCall];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)activeFaceTimeCall
{
  return (id)[(TUCallCenter *)self->_sharedCallCenter activeVideoCall];
}

+ (SBConferenceManager)sharedInstance
{
  v2 = (void *)__conferenceManager;
  if (!__conferenceManager)
  {
    kdebug_trace();
    BOOL v3 = objc_alloc_init(SBConferenceManager);
    v4 = (void *)__conferenceManager;
    __conferenceManager = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)__conferenceManager;
  }
  return (SBConferenceManager *)v2;
}

+ (void)initialize
{
  id v2 = (id)[a1 sharedInstance];
}

- (SBConferenceManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBConferenceManager;
  id v2 = [(SBConferenceManager *)&v12 init];
  if (v2)
  {
    v2->_hasFaceTimeCapability = MGGetBoolAnswer();
    objc_initWeak(&location, v2);
    [MEMORY[0x1E4F1C978] arrayWithObject:@"venice"];
    id v3 = MEMORY[0x1E4F14428];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v10, &location);
    v2->_faceTimeCapabilityUpdateToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

    v4 = objc_msgSend(MEMORY[0x1E4F61730], "sharedInstance", v9, 3221225472, __27__SBConferenceManager_init__block_invoke, &unk_1E6B010D8);
    [v4 addListenerID:@"com.apple.springboard" forService:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__faceTimeStateChanged_ name:*MEMORY[0x1E4FADDD8] object:0];
    uint64_t v6 = [MEMORY[0x1E4FADA90] sharedInstance];
    sharedCallCenter = v2->_sharedCallCenter;
    v2->_sharedCallCenter = (TUCallCenter *)v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__SBConferenceManager_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    WeakRetained[8] = MGGetBoolAnswer();
    WeakRetained = v2;
  }
}

- (BOOL)hasFaceTimeCapability
{
  return self->_hasFaceTimeCapability;
}

- (BOOL)faceTimeIsAvailable
{
  id v2 = [MEMORY[0x1E4F61730] sharedInstance];
  BOOL v3 = [v2 availabilityForListenerID:@"com.apple.springboard" forService:0] == 1;

  return v3;
}

- (BOOL)faceTimeInvitationExists
{
  id v2 = [(SBConferenceManager *)self incomingFaceTimeCall];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)inFaceTime
{
  id v2 = [(SBConferenceManager *)self currentFaceTimeCall];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)inFaceTimeVideo
{
  id v2 = [(SBConferenceManager *)self currentFaceTimeCall];
  char v3 = [v2 isVideo];

  return v3;
}

- (id)incomingFaceTimeCall
{
  return (id)[(TUCallCenter *)self->_sharedCallCenter incomingVideoCall];
}

- (id)currentFaceTimeCall
{
  char v3 = [(SBConferenceManager *)self activeFaceTimeCall];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SBConferenceManager *)self incomingFaceTimeCall];
  }
  uint64_t v6 = v5;

  return v6;
}

- (BOOL)canStartFaceTime
{
  return ![(SBConferenceManager *)self inFaceTime];
}

- (void)dealloc
{
  if (self->_faceTimeCapabilityUpdateToken != (MGNotificationTokenStruct *)-1) {
    MGCancelNotifications();
  }
  char v3 = [MEMORY[0x1E4F61730] sharedInstance];
  [v3 removeListenerID:@"com.apple.springboard" forService:0];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  v4.receiver = self;
  v4.super_class = (Class)SBConferenceManager;
  [(SBConferenceManager *)&v4 dealloc];
}

- (void)_faceTimeStateChanged:(id)a3
{
  id v16 = a3;
  objc_super v4 = [(SBConferenceManager *)self currentFaceTimeCall];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v16 object];
  }
  v7 = v6;

  if ([v7 isVideo])
  {
    int v8 = [v7 status];
    if (v8 == 6 || !v8)
    {
      uint64_t v9 = +[SBTelephonyManager sharedTelephonyManager];
      char v10 = [v9 inCall];

      if ((v10 & 1) == 0)
      {
        v11 = +[SBLockScreenManager sharedInstance];
        int v12 = [v11 isUILocked];

        if (v12)
        {
          v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v13 postNotificationName:@"SBLockScreenFacetimeCallUINeedsUpdateNotification" object:self];
        }
      }
    }
    SBUpdateCallState();
    v14 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    [v14 resetIdleTimerForReason:@"SBConference:FaceTimeChanged"];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"SBFaceTimeStateChangedNotification" object:self];
  }
}

- (void)endFaceTime
{
  char v3 = [(SBConferenceManager *)self currentFaceTimeCall];
  if (v3)
  {
    objc_super v4 = v3;
    [(TUCallCenter *)self->_sharedCallCenter disconnectCall:v3];
    char v3 = v4;
  }
}

- (void).cxx_destruct
{
}

@end