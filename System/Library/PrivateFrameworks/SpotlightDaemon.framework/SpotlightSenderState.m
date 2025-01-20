@interface SpotlightSenderState
- (BOOL)clientDisabled:(int64_t)a3;
- (CSReceiverServerPreferences)serverPreferences;
- (SpotlightSenderState)init;
- (void)_updateFromPreferences;
@end

@implementation SpotlightSenderState

- (BOOL)clientDisabled:(int64_t)a3
{
  char v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  int check = 0;
  notify_check([(CSReceiverServerPreferences *)v4->_serverPreferences notifyToken], &check);
  if (check == 1) {
    [(SpotlightSenderState *)v4 _updateFromPreferences];
  }
  unsigned int v5 = sClintServiceDisabledBitMap >> v3;
  objc_sync_exit(v4);

  return v5 & 1;
}

- (SpotlightSenderState)init
{
  v7.receiver = self;
  v7.super_class = (Class)SpotlightSenderState;
  v2 = [(SpotlightSenderState *)&v7 init];
  if (v2)
  {
    char v3 = (CSReceiverServerPreferences *)objc_alloc_init(MEMORY[0x263F02AB8]);
    serverPreferences = v2->_serverPreferences;
    v2->_serverPreferences = v3;

    if ([(CSReceiverServerPreferences *)v2->_serverPreferences notifyStart])
    {
      int check = 0;
      notify_check([(CSReceiverServerPreferences *)v2->_serverPreferences notifyToken], &check);
      [(SpotlightSenderState *)v2 _updateFromPreferences];
    }
  }
  return v2;
}

- (void)_updateFromPreferences
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v2 = [(CSReceiverServerPreferences *)self->_serverPreferences disabledServices];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__SpotlightSenderState__updateFromPreferences__block_invoke;
  v5[3] = &unk_2645064F8;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  if (*((_DWORD *)v7 + 6) != sClintServiceDisabledBitMap)
  {
    char v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = *((_DWORD *)v7 + 6);
      *(_DWORD *)buf = 67109376;
      int v11 = sClintServiceDisabledBitMap;
      __int16 v12 = 1024;
      int v13 = v4;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_INFO, "Enabled client state changed from 0x%x to 0x%x", buf, 0xEu);
    }

    sClintServiceDisabledBitMap = *((_DWORD *)v7 + 6);
  }
  _Block_object_dispose(&v6, 8);
}

void __46__SpotlightSenderState__updateFromPreferences__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 length];
  if (v3 == [@"com.apple.corespotlight.receiver.coreduet" length]
    && ([v5 isEqualToString:@"com.apple.corespotlight.receiver.coreduet"] & 1) != 0)
  {
    char v4 = 1;
LABEL_10:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 1 << v4;
    goto LABEL_11;
  }
  if (v3 == [@"com.apple.corespotlight.receiver.suggestions" length]
    && ([v5 isEqualToString:@"com.apple.corespotlight.receiver.suggestions"] & 1) != 0)
  {
    char v4 = 2;
    goto LABEL_10;
  }
  if (v3 == [@"com.apple.corespotlight.receiver.corespotlight" length]
    && [v5 isEqualToString:@"com.apple.corespotlight.receiver.corespotlight"])
  {
    char v4 = 0;
    goto LABEL_10;
  }
LABEL_11:
}

- (CSReceiverServerPreferences)serverPreferences
{
  return self->_serverPreferences;
}

- (void).cxx_destruct
{
}

@end