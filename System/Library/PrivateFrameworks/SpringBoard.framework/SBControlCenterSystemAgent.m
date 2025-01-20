@interface SBControlCenterSystemAgent
- (BOOL)hasApplicationForDisplayID:(id)a3;
- (BOOL)hasApplicationPlaceholderForDisplayID:(id)a3;
- (BOOL)isOrientationLocked;
- (BOOL)isPasscodeLocked;
- (BOOL)isRestoring;
- (BOOL)isRingerMuted;
- (BOOL)isUILocked;
- (SBWindowScene)windowScene;
- (id)observeRingerMutedWithBlock:(id)a3;
- (id)reasonToDisallowEditing;
- (void)lockOrientation;
- (void)setRingerMuted:(BOOL)a3 reason:(id)a4;
- (void)setWindowScene:(id)a3;
- (void)unlockOrientation;
@end

@implementation SBControlCenterSystemAgent

- (BOOL)isRingerMuted
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent isRingerMuted]"];
    [v5 handleFailureInFunction:v6 file:@"SBControlCenterSystemAgent.m" lineNumber:29 description:@"this call must be made on the main thread"];
  }
  v2 = [(id)SBApp ringerControl];
  char v3 = -[SBRingerControl isRingerMuted]((uint64_t)v2);

  return v3;
}

- (void)setRingerMuted:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a4;
  if (([v5 isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent setRingerMuted:reason:]"];
    [v7 handleFailureInFunction:v8 file:@"SBControlCenterSystemAgent.m" lineNumber:34 description:@"this call must be made on the main thread"];
  }
  id v9 = [(id)SBApp ringerControl];
  [v9 setRingerMuted:v4 withFeedback:1 reason:v6 clientType:2];
}

- (id)observeRingerMutedWithBlock:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F29060];
  id v4 = a3;
  if (([v3 isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent observeRingerMutedWithBlock:]"];
    [v8 handleFailureInFunction:v9 file:@"SBControlCenterSystemAgent.m" lineNumber:39 description:@"this call must be made on the main thread"];
  }
  v5 = [(id)SBApp ringerControl];
  id v6 = [v5 observeRingerMutedWithBlock:v4];

  return v6;
}

- (void)lockOrientation
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    char v3 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent lockOrientation]"];
    [v2 handleFailureInFunction:v3 file:@"SBControlCenterSystemAgent.m" lineNumber:46 description:@"this call must be made on the main thread"];
  }
  id v4 = +[SBOrientationLockManager sharedInstance];
  [v4 lock];
}

- (void)unlockOrientation
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    char v3 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent unlockOrientation]"];
    [v2 handleFailureInFunction:v3 file:@"SBControlCenterSystemAgent.m" lineNumber:51 description:@"this call must be made on the main thread"];
  }
  id v4 = +[SBOrientationLockManager sharedInstance];
  [v4 unlock];
}

- (BOOL)isOrientationLocked
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent isOrientationLocked]"];
    [v5 handleFailureInFunction:v6 file:@"SBControlCenterSystemAgent.m" lineNumber:56 description:@"this call must be made on the main thread"];
  }
  v2 = +[SBOrientationLockManager sharedInstance];
  char v3 = [v2 isUserLocked];

  return v3;
}

- (BOOL)isUILocked
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent isUILocked]"];
    [v5 handleFailureInFunction:v6 file:@"SBControlCenterSystemAgent.m" lineNumber:62 description:@"this call must be made on the main thread"];
  }
  v2 = +[SBLockScreenManager sharedInstance];
  char v3 = [v2 isUILocked];

  return v3;
}

- (BOOL)isPasscodeLocked
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent isPasscodeLocked]"];
    [v7 handleFailureInFunction:v8 file:@"SBControlCenterSystemAgent.m" lineNumber:68 description:@"this call must be made on the main thread"];
  }
  char v3 = [(SBControlCenterSystemAgent *)self windowScene];
  id v4 = [v3 authenticationStatusProvider];
  char v5 = [v4 isAuthenticated] ^ 1;

  return v5;
}

- (BOOL)isRestoring
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    char v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent isRestoring]"];
    [v5 handleFailureInFunction:v6 file:@"SBControlCenterSystemAgent.m" lineNumber:75 description:@"this call must be made on the main thread"];
  }
  v2 = +[SBSyncController sharedInstance];
  char v3 = [v2 isRestoring];

  return v3;
}

- (BOOL)hasApplicationPlaceholderForDisplayID:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F29060];
  id v4 = a3;
  if (([v3 isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent hasApplicationPlaceholderForDisplayID:]"];
    [v8 handleFailureInFunction:v9 file:@"SBControlCenterSystemAgent.m" lineNumber:80 description:@"this call must be made on the main thread"];
  }
  char v5 = +[SBApplicationPlaceholderController sharedInstance];
  id v6 = [v5 placeholderForDisplayID:v4];

  return v6 != 0;
}

- (BOOL)hasApplicationForDisplayID:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F29060];
  id v4 = a3;
  if (([v3 isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent hasApplicationForDisplayID:]"];
    [v8 handleFailureInFunction:v9 file:@"SBControlCenterSystemAgent.m" lineNumber:86 description:@"this call must be made on the main thread"];
  }
  char v5 = +[SBApplicationController sharedInstance];
  id v6 = [v5 applicationWithBundleIdentifier:v4];

  return v6 != 0;
}

- (id)reasonToDisallowEditing
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [NSString stringWithUTF8String:"-[SBControlCenterSystemAgent reasonToDisallowEditing]"];
    [v8 handleFailureInFunction:v9 file:@"SBControlCenterSystemAgent.m" lineNumber:94 description:@"this call must be made on the main thread"];
  }
  char v3 = [(SBControlCenterSystemAgent *)self windowScene];
  id v4 = [v3 sceneManager];
  char v5 = [v4 policyAggregator];

  id v10 = 0;
  [v5 allowsCapability:29 explanation:&v10];
  id v6 = v10;

  return v6;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
}

@end