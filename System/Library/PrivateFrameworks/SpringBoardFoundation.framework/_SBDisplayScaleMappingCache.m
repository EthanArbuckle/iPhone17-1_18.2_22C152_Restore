@interface _SBDisplayScaleMappingCache
+ (id)sharedInstance;
- (_SBDisplayScaleMappingCache)init;
- (id)mappingForDisplayIdentifier:(id)a3;
- (void)cacheMapping:(id)a3;
- (void)dealloc;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
@end

@implementation _SBDisplayScaleMappingCache

- (_SBDisplayScaleMappingCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)_SBDisplayScaleMappingCache;
  v2 = [(_SBDisplayScaleMappingCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    hardwareIdentifierToMappings = v2->_hardwareIdentifierToMappings;
    v2->_hardwareIdentifierToMappings = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F62420] sharedInstance];
    displayManager = v2->_displayManager;
    v2->_displayManager = (FBDisplayManager *)v5;

    [(FBDisplayManager *)v2->_displayManager addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(FBDisplayManager *)self->_displayManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)_SBDisplayScaleMappingCache;
  [(_SBDisplayScaleMappingCache *)&v3 dealloc];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___SBDisplayScaleMappingCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, block);
  }
  v2 = (void *)sharedInstance___result;
  return v2;
}

- (id)mappingForDisplayIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_hardwareIdentifierToMappings objectForKey:a3];
}

- (void)cacheMapping:(id)a3
{
  id v5 = a3;
  v6 = [v5 displayHardwareIdentifier];

  if (!v6)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBDisplayScaleMapping.m", 152, @"Invalid parameter not satisfying: %@", @"[mapping displayHardwareIdentifier] != nil" object file lineNumber description];
  }
  hardwareIdentifierToMappings = self->_hardwareIdentifierToMappings;
  id v9 = [v5 displayHardwareIdentifier];
  [(NSMutableDictionary *)hardwareIdentifierToMappings setObject:v5 forKey:v9];
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v8 = [a3 configurationForIdentity:a4];
  id v5 = [v8 hardwareIdentifier];

  if (v5)
  {
    hardwareIdentifierToMappings = self->_hardwareIdentifierToMappings;
    v7 = [v8 hardwareIdentifier];
    [(NSMutableDictionary *)hardwareIdentifierToMappings removeObjectForKey:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayManager, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifierToMappings, 0);
}

@end