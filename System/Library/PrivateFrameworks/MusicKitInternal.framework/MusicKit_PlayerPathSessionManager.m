@interface MusicKit_PlayerPathSessionManager
+ (MusicKit_PlayerPathSessionManager)sharedSessionManager;
- (MusicKit_PlayerPathSessionManager)init;
- (id)sessionIDForPlayerPath:(id)a3;
@end

@implementation MusicKit_PlayerPathSessionManager

- (MusicKit_PlayerPathSessionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MusicKit_PlayerPathSessionManager;
  v2 = [(MusicKit_PlayerPathSessionManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessionIDsByPlayerPath = v2->_sessionIDsByPlayerPath;
    v2->_sessionIDsByPlayerPath = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (MusicKit_PlayerPathSessionManager)sharedSessionManager
{
  if (sharedSessionManager_sOnceToken != -1) {
    dispatch_once(&sharedSessionManager_sOnceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedSessionManager_sSharedSessionManager;
  return (MusicKit_PlayerPathSessionManager *)v2;
}

- (id)sessionIDForPlayerPath:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = v4;
  objc_super v6 = [(NSMutableDictionary *)self->_sessionIDsByPlayerPath objectForKey:v5];
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F29128] UUID];
    objc_super v6 = [v7 UUIDString];

    [(NSMutableDictionary *)self->_sessionIDsByPlayerPath setObject:v6 forKey:v5];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

- (void).cxx_destruct
{
}

@end