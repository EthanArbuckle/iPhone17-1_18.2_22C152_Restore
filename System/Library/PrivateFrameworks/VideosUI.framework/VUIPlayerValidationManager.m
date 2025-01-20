@interface VUIPlayerValidationManager
+ (id)sharedInstance;
- (NSMapTable)playerCounts;
- (VUIPlayerValidationManager)init;
- (id)_init;
- (void)addReferenceForPlayer:(id)a3;
- (void)removeReferenceForPlayer:(id)a3;
- (void)removeReferenceForPlayer:(id)a3 stoppingIfNeeded:(BOOL)a4;
- (void)setPlayerCounts:(id)a3;
@end

@implementation VUIPlayerValidationManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_6 != -1) {
    dispatch_once(&sharedInstance___onceToken_6, &__block_literal_global_55);
  }
  v2 = (void *)sharedInstance___sharedInstance_2;
  return v2;
}

void __44__VUIPlayerValidationManager_sharedInstance__block_invoke()
{
  id v0 = [[VUIPlayerValidationManager alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v0;
}

- (VUIPlayerValidationManager)init
{
  return 0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIPlayerValidationManager;
  v2 = [(VUIPlayerValidationManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    playerCounts = v2->_playerCounts;
    v2->_playerCounts = (NSMapTable *)v3;
  }
  return v2;
}

- (void)addReferenceForPlayer:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(VUIPlayerValidationManager *)self playerCounts];
    uint64_t v6 = [v5 objectForKey:v4];
    v7 = (void *)v6;
    v8 = &unk_1F3F3C938;
    if (v6) {
      v8 = (void *)v6;
    }
    id v9 = v8;

    v10 = (void *)MEMORY[0x1E4F28ED0];
    int v11 = [v9 intValue];

    id v13 = [v10 numberWithInt:(v11 + 1)];
    v12 = [(VUIPlayerValidationManager *)self playerCounts];
    [v12 setObject:v13 forKey:v4];
  }
}

- (void)removeReferenceForPlayer:(id)a3 stoppingIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v20 = v6;
    v7 = [(VUIPlayerValidationManager *)self playerCounts];
    uint64_t v8 = [v7 objectForKey:v20];
    id v9 = (void *)v8;
    v10 = &unk_1F3F3C938;
    if (v8) {
      v10 = (void *)v8;
    }
    id v11 = v10;

    v12 = (void *)MEMORY[0x1E4F28ED0];
    int v13 = [v11 intValue];

    v14 = [v12 numberWithInt:(v13 - 1)];
    int v15 = [v14 intValue];
    v16 = [(VUIPlayerValidationManager *)self playerCounts];
    v17 = v16;
    if (v15 <= 0)
    {
      [v16 removeObjectForKey:v20];

      if (v4)
      {
        v18 = [v20 state];
        v19 = [MEMORY[0x1E4FA9D88] stopped];

        if (v18 != v19) {
          [v20 stop];
        }
        [v20 invalidate];
      }
    }
    else
    {
      [v16 setObject:v14 forKey:v20];
    }
    id v6 = v20;
  }
}

- (void)removeReferenceForPlayer:(id)a3
{
}

- (NSMapTable)playerCounts
{
  return self->_playerCounts;
}

- (void)setPlayerCounts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end