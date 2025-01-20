@interface SUAudioPlayerSessionManager
+ (id)sessionManager;
- (NSArray)allSessionURLs;
- (SUAudioPlayerSessionManager)init;
- (id)audioPlayerForURL:(id)a3;
- (id)endSessionForURL:(id)a3;
- (id)startSessionWithURL:(id)a3;
- (id)stopAllAudioPlayerSessions;
- (void)_audioPlayerStatusChangeNotification:(id)a3;
- (void)dealloc;
@end

@implementation SUAudioPlayerSessionManager

- (SUAudioPlayerSessionManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUAudioPlayerSessionManager;
  v2 = [(SUAudioPlayerSessionManager *)&v4 init];
  if (v2) {
    v2->_sessions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"SUAudioPlayerStatusChangeNotification", 0);

  v3.receiver = self;
  v3.super_class = (Class)SUAudioPlayerSessionManager;
  [(SUAudioPlayerSessionManager *)&v3 dealloc];
}

+ (id)sessionManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUAudioPlayerSessionManager_sessionManager__block_invoke;
  block[3] = &unk_264812130;
  block[4] = a1;
  if (sessionManager_sOnce != -1) {
    dispatch_once(&sessionManager_sOnce, block);
  }
  return (id)sessionManager_sManager;
}

id __45__SUAudioPlayerSessionManager_sessionManager__block_invoke()
{
  id result = objc_alloc_init((Class)objc_opt_class());
  sessionManager_sManager = (uint64_t)result;
  return result;
}

- (NSArray)allSessionURLs
{
  return (NSArray *)[(NSMutableDictionary *)self->_sessions allKeys];
}

- (id)audioPlayerForURL:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_sessions objectForKey:a3];

  return v3;
}

- (id)endSessionForURL:(id)a3
{
  id v5 = (id)-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:");
  if (v5)
  {
    v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self name:@"SUAudioPlayerStatusChangeNotification" object:v5];
    [(NSMutableDictionary *)self->_sessions removeObjectForKey:a3];
    [v6 postNotificationName:@"SUAudioPlayerSessionsChangedNotification" object:self];
    if (![(NSMutableDictionary *)self->_sessions count]) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "endReceivingRemoteControlEvents");
    }
  }

  return v5;
}

- (id)startSessionWithURL:(id)a3
{
  id v5 = (SUAudioPlayer *)(id)-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:");
  if (!v5)
  {
    id v5 = [[SUAudioPlayer alloc] initWithURL:a3];
    v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel__audioPlayerStatusChangeNotification_ name:@"SUAudioPlayerStatusChangeNotification" object:v5];
    if (![(NSMutableDictionary *)self->_sessions count]) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginReceivingRemoteControlEvents");
    }
    [(NSMutableDictionary *)self->_sessions setObject:v5 forKey:a3];
    [v6 postNotificationName:@"SUAudioPlayerSessionsChangedNotification" object:self];
  }

  return v5;
}

- (id)stopAllAudioPlayerSessions
{
  id v3 = (void *)[MEMORY[0x263EFF980] array];
  if ([(NSMutableDictionary *)self->_sessions count])
  {
    objc_super v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    sessions = self->_sessions;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__SUAudioPlayerSessionManager_stopAllAudioPlayerSessions__block_invoke;
    v7[3] = &unk_264814DC0;
    v7[4] = v4;
    v7[5] = self;
    v7[6] = v3;
    [(NSMutableDictionary *)sessions enumerateKeysAndObjectsUsingBlock:v7];
    [(NSMutableDictionary *)self->_sessions removeAllObjects];
    [v4 postNotificationName:@"SUAudioPlayerSessionsChangedNotification" object:self];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "endReceivingRemoteControlEvents");
  }
  return v3;
}

uint64_t __57__SUAudioPlayerSessionManager_stopAllAudioPlayerSessions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) name:@"SUAudioPlayerStatusChangeNotification" object:a3];
  [*(id *)(a1 + 48) addObject:a3];

  return [a3 stop];
}

- (void)_audioPlayerStatusChangeNotification:(id)a3
{
  objc_super v4 = (void *)[a3 object];
  if ((objc_msgSend((id)objc_msgSend(v4, "playerStatus"), "playerState") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v5 = [v4 URL];
    [(SUAudioPlayerSessionManager *)self endSessionForURL:v5];
  }
}

@end