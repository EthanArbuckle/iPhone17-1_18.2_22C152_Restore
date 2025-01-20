@interface SVAudioSession
+ (id)sharedSession;
+ (id)sharedSessionForMode:(int)a3;
+ (id)sharedSilentSession;
- (AVAudioSession)audioSession;
- (BOOL)canDeactivateAudioSession;
- (BOOL)isAudioSessionActive;
- (BOOL)needsToSetupAudioSessionCategory;
- (BOOL)shouldActivateAudioSession;
- (NSMapTable)players;
- (OS_dispatch_semaphore)semaphore;
- (SVAudioSession)initWithAudioSession:(id)a3;
- (SVMediaPlaybackController)playbackController;
- (id)desiredAudioSessionConfiguration;
- (void)activateAudioSessionCategory;
- (void)addInterestForPlayer:(id)a3 withMode:(int)a4;
- (void)deactivateAudioSessionCategory;
- (void)registerPlaybackControlForPlayer:(id)a3 withMode:(int)a4;
- (void)removeInterestForPlayer:(id)a3;
- (void)setAudioSessionActive:(BOOL)a3;
- (void)setupAudioSessionCategory;
@end

@implementation SVAudioSession

+ (id)sharedSessionForMode:(int)a3
{
  if (a3 == 2) {
    [a1 sharedSilentSession];
  }
  else {
  v3 = [a1 sharedSession];
  }

  return v3;
}

+ (id)sharedSession
{
  if (sharedSession_onceToken != -1) {
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedSession___sharedSession;

  return v2;
}

void __31__SVAudioSession_sharedSession__block_invoke()
{
  v0 = [SVAudioSession alloc];
  id v3 = [MEMORY[0x263EF93E0] sharedInstance];
  uint64_t v1 = [(SVAudioSession *)v0 initWithAudioSession:v3];
  v2 = (void *)sharedSession___sharedSession;
  sharedSession___sharedSession = v1;
}

+ (id)sharedSilentSession
{
  if (sharedSilentSession_onceToken != -1) {
    dispatch_once(&sharedSilentSession_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedSilentSession___sharedSilentSession;

  return v2;
}

void __37__SVAudioSession_sharedSilentSession__block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263EF93E0]) initAuxiliarySession];
  uint64_t v1 = *MEMORY[0x263EF9048];
  uint64_t v2 = *MEMORY[0x263EF9108];
  id v13 = 0;
  char v3 = [v0 setCategory:v1 mode:v2 routeSharingPolicy:0 options:0 error:&v13];
  id v4 = v13;
  id v12 = v4;
  [v0 setParticipatesInNowPlayingAppPolicy:0 error:&v12];
  id v5 = v12;

  v6 = [SVAudioSession alloc];
  v7 = v6;
  if (v3)
  {
    uint64_t v8 = [(SVAudioSession *)v6 initWithAudioSession:v0];
    v9 = (void *)sharedSilentSession___sharedSilentSession;
    sharedSilentSession___sharedSilentSession = v8;
  }
  else
  {
    v9 = [MEMORY[0x263EF93E0] sharedInstance];
    uint64_t v10 = [(SVAudioSession *)v7 initWithAudioSession:v9];
    v11 = (void *)sharedSilentSession___sharedSilentSession;
    sharedSilentSession___sharedSilentSession = v10;
  }
}

- (SVAudioSession)initWithAudioSession:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SVAudioSession;
  v6 = [(SVAudioSession *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_audioSession, a3);
    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    semaphore = v7->_semaphore;
    v7->_semaphore = (OS_dispatch_semaphore *)v8;

    uint64_t v10 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    players = v7->_players;
    v7->_players = (NSMapTable *)v10;

    id v12 = objc_alloc_init(SVMediaPlaybackController);
    playbackController = v7->_playbackController;
    v7->_playbackController = v12;
  }
  return v7;
}

- (void)registerPlaybackControlForPlayer:(id)a3 withMode:(int)a4
{
  if (a4 != 2)
  {
    id v6 = a3;
    id v7 = [(SVAudioSession *)self playbackController];
    [v7 registerPlayer:v6];
  }
}

- (void)addInterestForPlayer:(id)a3 withMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(SVAudioSession *)self semaphore];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  dispatch_semaphore_t v8 = [(SVAudioSession *)self players];
  v9 = [NSNumber numberWithInt:v4];
  [v8 setObject:v9 forKey:v6];

  [(SVAudioSession *)self registerPlaybackControlForPlayer:v6 withMode:v4];
  [(SVAudioSession *)self setupAudioSessionCategory];
  uint64_t v10 = [(SVAudioSession *)self audioSession];
  [v6 setAudioSession:v10];

  [(SVAudioSession *)self activateAudioSessionCategory];
  v11 = [(SVAudioSession *)self semaphore];
  dispatch_semaphore_signal(v11);
}

- (void)removeInterestForPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(SVAudioSession *)self semaphore];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = [(SVAudioSession *)self playbackController];
  [v6 unregisterPlayer:v4];

  id v7 = [(SVAudioSession *)self players];
  [v7 removeObjectForKey:v4];

  [(SVAudioSession *)self setupAudioSessionCategory];
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  v9 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SVAudioSession_removeInterestForPlayer___block_invoke;
  block[3] = &unk_264771008;
  block[4] = self;
  dispatch_after(v8, v9, block);

  uint64_t v10 = [(SVAudioSession *)self semaphore];
  dispatch_semaphore_signal(v10);
}

uint64_t __42__SVAudioSession_removeInterestForPlayer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateAudioSessionCategory];
}

- (BOOL)shouldActivateAudioSession
{
  uint64_t v2 = [(SVAudioSession *)self players];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)canDeactivateAudioSession
{
  uint64_t v2 = [(SVAudioSession *)self players];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)needsToSetupAudioSessionCategory
{
  BOOL v3 = [(SVAudioSession *)self desiredAudioSessionConfiguration];
  id v4 = [SVAudioSessionConfiguration alloc];
  id v5 = [(SVAudioSession *)self audioSession];
  id v6 = [v5 category];
  id v7 = [(SVAudioSession *)self audioSession];
  dispatch_time_t v8 = [v7 mode];
  v9 = [(SVAudioSession *)self audioSession];
  uint64_t v10 = -[SVAudioSessionConfiguration initWithCategory:mode:policy:](v4, "initWithCategory:mode:policy:", v6, v8, [v9 routeSharingPolicy]);

  LOBYTE(v9) = [v3 isEqualToConfiguration:v10] ^ 1;
  return (char)v9;
}

- (void)setupAudioSessionCategory
{
  if ([(SVAudioSession *)self needsToSetupAudioSessionCategory])
  {
    BOOL v3 = [(SVAudioSession *)self desiredAudioSessionConfiguration];
    id v4 = [(SVAudioSession *)self audioSession];
    id v5 = [v3 category];
    id v6 = [v3 mode];
    uint64_t v7 = 0;
    objc_msgSend(v4, "setCategory:mode:routeSharingPolicy:options:error:", v5, v6, objc_msgSend(v3, "routeSharingPolicy"), 0, &v7);
  }
}

- (void)activateAudioSessionCategory
{
  if (![(SVAudioSession *)self isAudioSessionActive])
  {
    if ([(SVAudioSession *)self shouldActivateAudioSession])
    {
      BOOL v3 = [(SVAudioSession *)self audioSession];
      uint64_t v5 = 0;
      uint64_t v4 = [v3 setActive:1 error:&v5];

      [(SVAudioSession *)self setAudioSessionActive:v4];
    }
  }
}

- (void)deactivateAudioSessionCategory
{
  BOOL v3 = [(SVAudioSession *)self semaphore];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if ([(SVAudioSession *)self isAudioSessionActive]
    && [(SVAudioSession *)self canDeactivateAudioSession])
  {
    uint64_t v4 = [(SVAudioSession *)self audioSession];
    uint64_t v7 = 0;
    int v5 = [v4 setActive:0 error:&v7];

    [(SVAudioSession *)self setAudioSessionActive:v5 ^ 1u];
  }
  id v6 = [(SVAudioSession *)self semaphore];
  dispatch_semaphore_signal(v6);
}

- (id)desiredAudioSessionConfiguration
{
  id v3 = (id)*MEMORY[0x263EF9048];
  id v4 = (id)*MEMORY[0x263EF9108];
  int v5 = (void *)MEMORY[0x263F08760];
  id v6 = [(SVAudioSession *)self players];
  uint64_t v7 = [v6 objectEnumerator];
  dispatch_time_t v8 = [v7 allObjects];
  v9 = [v5 setWithArray:v8];

  if ([v9 countForObject:&unk_26D96E700])
  {
    id v10 = (id)*MEMORY[0x263EF9060];

    v11 = (void *)*MEMORY[0x263EF9148];
    uint64_t v12 = 1;
    id v3 = v4;
    id v4 = (id)*MEMORY[0x263EF9148];
  }
  else
  {
    uint64_t v12 = 0;
    if (![v9 countForObject:&unk_26D96E718]) {
      goto LABEL_6;
    }
    v11 = (void *)*MEMORY[0x263EF9060];
    id v10 = (id)*MEMORY[0x263EF9060];
  }
  id v13 = v11;

  id v3 = v10;
LABEL_6:
  v14 = [[SVAudioSessionConfiguration alloc] initWithCategory:v3 mode:v4 policy:v12];

  return v14;
}

- (BOOL)isAudioSessionActive
{
  return self->_audioSessionActive;
}

- (void)setAudioSessionActive:(BOOL)a3
{
  self->_audioSessionActive = a3;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (NSMapTable)players
{
  return self->_players;
}

- (SVMediaPlaybackController)playbackController
{
  return self->_playbackController;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_playbackController, 0);
  objc_storeStrong((id *)&self->_players, 0);

  objc_storeStrong((id *)&self->_semaphore, 0);
}

@end