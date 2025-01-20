@interface CSRecieverState
+ (id)sharedInstance;
- (BOOL)checkBundleIdentifier:(id)a3;
- (CSReceiverPreferences)receiverPreferences;
- (CSRecieverState)init;
- (NSSet)disabledBundleIdentifiers;
- (NSSet)enabledBundleIdentifiers;
- (int)notifyToken;
- (void)_updateFromPreferences;
@end

@implementation CSRecieverState

- (BOOL)checkBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  int check = 0;
  notify_check(v5->_notifyToken, &check);
  if (check == 1) {
    [(CSRecieverState *)v5 _updateFromPreferences];
  }
  BOOL v6 = [(NSSet *)v5->_disabledBundleIdentifiers containsObject:v4];
  if (!v6 && ![(NSSet *)v5->_enabledBundleIdentifiers containsObject:v4]) {
    [(CSReceiverPreferences *)v5->_receiverPreferences enableBundleIdentifier:v4];
  }
  objc_sync_exit(v5);

  return !v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_11);
  }
  v2 = (void *)sCSRecieverState;
  return v2;
}

- (CSRecieverState)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSRecieverState;
  v2 = [(CSRecieverState *)&v8 init];
  if (v2)
  {
    v3 = (CSReceiverPreferences *)objc_alloc_init(MEMORY[0x263F02AB0]);
    receiverPreferences = v2->_receiverPreferences;
    v2->_receiverPreferences = v3;

    if ([(CSReceiverPreferences *)v2->_receiverPreferences notifyStart])
    {
      int v5 = [(CSReceiverPreferences *)v2->_receiverPreferences notifyToken];
      v2->_notifyToken = v5;
      int check = 0;
      notify_check(v5, &check);
      [(CSRecieverState *)v2 _updateFromPreferences];
    }
  }
  return v2;
}

uint64_t __33__CSRecieverState_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CSRecieverState);
  uint64_t v1 = sCSRecieverState;
  sCSRecieverState = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)_updateFromPreferences
{
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  int v5 = [(CSReceiverPreferences *)self->_receiverPreferences dictionary];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __41__CSRecieverState__updateFromPreferences__block_invoke;
  v15 = &unk_2645094A8;
  id v16 = v3;
  id v17 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:&v12];

  objc_super v8 = (NSSet *)objc_msgSend(v7, "copy", v12, v13, v14, v15);
  enabledBundleIdentifiers = self->_enabledBundleIdentifiers;
  self->_enabledBundleIdentifiers = v8;

  v10 = (NSSet *)[v6 copy];
  disabledBundleIdentifiers = self->_disabledBundleIdentifiers;
  self->_disabledBundleIdentifiers = v10;
}

void __41__CSRecieverState__updateFromPreferences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v6 = [v5 BOOLValue];
      uint64_t v7 = 40;
      if (v6) {
        uint64_t v7 = 32;
      }
      [*(id *)(a1 + v7) addObject:v8];
    }
  }
}

- (CSReceiverPreferences)receiverPreferences
{
  return self->_receiverPreferences;
}

- (NSSet)enabledBundleIdentifiers
{
  return self->_enabledBundleIdentifiers;
}

- (NSSet)disabledBundleIdentifiers
{
  return self->_disabledBundleIdentifiers;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_enabledBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_receiverPreferences, 0);
}

@end