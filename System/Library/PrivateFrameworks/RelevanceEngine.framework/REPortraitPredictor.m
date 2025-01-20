@interface REPortraitPredictor
+ (double)updateInterval;
- (NSDictionary)namedEntityScores;
- (float)userAffinityToContent:(id)a3;
- (id)_init;
- (void)_loadStoreIfNeeded;
- (void)dealloc;
- (void)update;
@end

@implementation REPortraitPredictor

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)REPortraitPredictor;
  v2 = [(REPredictor *)&v7 _init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    v4 = (void *)v2[9];
    v2[9] = v3;

    [v2 _loadStoreIfNeeded];
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__loadStoreIfNeeded name:@"REDeviceLockStateChangedNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"REDeviceLockStateChangedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)REPortraitPredictor;
  [(REPredictor *)&v4 dealloc];
}

+ (double)updateInterval
{
  return 10800.0;
}

- (void)_loadStoreIfNeeded
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__REPortraitPredictor__loadStoreIfNeeded__block_invoke;
  v2[3] = &unk_2644BC660;
  v2[4] = self;
  [(REPredictor *)self onQueue:v2];
}

uint64_t __41__REPortraitPredictor__loadStoreIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = REDeviceUnlockedSinceBoot();
  if (result)
  {
    if (!*(void *)(*(void *)(a1 + 32) + 64))
    {
      uint64_t result = PersonalizationPortraitLibraryCore();
      if (result)
      {
        uint64_t v9 = 0;
        v10 = &v9;
        uint64_t v11 = 0x2050000000;
        uint64_t v3 = (void *)getPPNamedEntityStoreClass_softClass;
        uint64_t v12 = getPPNamedEntityStoreClass_softClass;
        if (!getPPNamedEntityStoreClass_softClass)
        {
          v8[0] = MEMORY[0x263EF8330];
          v8[1] = 3221225472;
          v8[2] = __getPPNamedEntityStoreClass_block_invoke;
          v8[3] = &unk_2644BC768;
          v8[4] = &v9;
          __getPPNamedEntityStoreClass_block_invoke((uint64_t)v8);
          uint64_t v3 = (void *)v10[3];
        }
        id v4 = v3;
        _Block_object_dispose(&v9, 8);
        uint64_t v5 = [v4 defaultStore];
        uint64_t v6 = *(void *)(a1 + 32);
        objc_super v7 = *(void **)(v6 + 64);
        *(void *)(v6 + 64) = v5;

        return [*(id *)(a1 + 32) invalidate];
      }
    }
  }
  return result;
}

- (void)update
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to load named entities: %@", (uint8_t *)&v2, 0xCu);
}

void __29__REPortraitPredictor_update__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 item];
  id v14 = [v4 name];

  uint64_t v5 = NSNumber;
  [v3 score];
  double v7 = v6;

  v8 = [v5 numberWithDouble:v7];
  [*(id *)(*(void *)(a1 + 32) + 72) setObject:v8 forKeyedSubscript:v14];
  uint64_t v9 = [*(id *)(a1 + 40) objectForKey:v14];
  v10 = v9;
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v11 + 24)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v9 == 0;
  }
  if (v12)
  {
    char v13 = 1;
  }
  else
  {
    char v13 = [v9 isEqualToNumber:v8] ^ 1;
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v11 + 24) = v13;
}

- (float)userAffinityToContent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v9 = 0;
    v10 = (float *)&v9;
    uint64_t v11 = 0x2020000000;
    int v12 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__REPortraitPredictor_userAffinityToContent___block_invoke;
    v8[3] = &unk_2644C09C0;
    void v8[5] = &v9;
    v8[6] = v5;
    v8[4] = self;
    [v4 enumerateObjectsUsingBlock:v8];
    float v6 = v10[6];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    float v6 = 0.0;
  }

  return v6;
}

void __45__REPortraitPredictor_userAffinityToContent___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  float v4 = (float)(unint64_t)(a1[6] - a3);
  id v6 = [*(id *)(a1[4] + 72) objectForKeyedSubscript:a2];
  [v6 floatValue];
  *(float *)(*(void *)(a1[5] + 8) + 24) = (float)((float)(v5 * v4) / (float)(unint64_t)a1[6])
                                              + *(float *)(*(void *)(a1[5] + 8) + 24);
}

- (NSDictionary)namedEntityScores
{
  return (NSDictionary *)self->_namedEntityScores;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityScores, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
}

@end