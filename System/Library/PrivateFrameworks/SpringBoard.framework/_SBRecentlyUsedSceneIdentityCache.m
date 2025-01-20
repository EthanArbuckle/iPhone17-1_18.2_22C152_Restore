@interface _SBRecentlyUsedSceneIdentityCache
- (BOOL)isEqual:(id)a3;
- (BOOL)promoteContainedSceneIdentityToken:(id)a3 forPID:(int)a4;
- (NSString)description;
- (_SBRecentlyUsedSceneIdentityCache)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mostRecentFocusTargetForAnyProcess;
- (id)mostRecentFocusTargetForPID:(uint64_t)a1;
- (void)addSceneIdentityToken:(id)a3 forPID:(int)a4;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)removeSceneIdentityToken:(id)a3 forPID:(int)a4;
@end

@implementation _SBRecentlyUsedSceneIdentityCache

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)addSceneIdentityToken:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = NSNumber;
  id v7 = a3;
  id v10 = [v6 numberWithInt:v4];
  v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_recentSceneIdentityTokensByPID, "objectForKeyedSubscript:");
  if (v8)
  {
    id v9 = v8;
    [v8 removeObject:v7];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    [(NSMutableDictionary *)self->_recentSceneIdentityTokensByPID setObject:v9 forKeyedSubscript:v10];
  }
  [v9 addObject:v7];

  [(NSMutableOrderedSet *)self->_recentPIDs removeObject:v10];
  [(NSMutableOrderedSet *)self->_recentPIDs addObject:v10];
}

- (id)mostRecentFocusTargetForAnyProcess
{
  v1 = a1;
  if (a1)
  {
    v2 = [a1[2] lastObject];
    if (v2)
    {
      v3 = [v1[1] objectForKey:v2];
      uint64_t v4 = [v3 lastObject];

      +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", v4, [v2 intValue]);
      v1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66___SBRecentlyUsedSceneIdentityCache_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E6AF5290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

- (_SBRecentlyUsedSceneIdentityCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)_SBRecentlyUsedSceneIdentityCache;
  v2 = [(_SBRecentlyUsedSceneIdentityCache *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recentSceneIdentityTokensByPID = v2->_recentSceneIdentityTokensByPID;
    v2->_recentSceneIdentityTokensByPID = v3;

    id v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    recentPIDs = v2->_recentPIDs;
    v2->_recentPIDs = v5;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(_SBRecentlyUsedSceneIdentityCache);
  uint64_t v5 = [(NSMutableOrderedSet *)self->_recentPIDs mutableCopy];
  recentPIDs = v4->_recentPIDs;
  v4->_recentPIDs = (NSMutableOrderedSet *)v5;

  id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  recentSceneIdentityTokensByPID = v4->_recentSceneIdentityTokensByPID;
  v4->_recentSceneIdentityTokensByPID = v7;

  id v9 = self->_recentSceneIdentityTokensByPID;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50___SBRecentlyUsedSceneIdentityCache_copyWithZone___block_invoke;
  v12[3] = &unk_1E6B07320;
  id v10 = v4;
  v13 = v10;
  [(NSMutableDictionary *)v9 enumerateKeysAndObjectsUsingBlock:v12];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (BSEqualObjects()) {
      char v5 = BSEqualObjects();
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)promoteContainedSceneIdentityToken:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [NSNumber numberWithInt:v4];
  objc_super v8 = [(NSMutableDictionary *)self->_recentSceneIdentityTokensByPID objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8 && [v8 containsObject:v6])
  {
    [v9 removeObject:v6];
    [v9 addObject:v6];
    [(NSMutableOrderedSet *)self->_recentPIDs removeObject:v7];
    [(NSMutableOrderedSet *)self->_recentPIDs addObject:v7];
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)removeSceneIdentityToken:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = NSNumber;
  id v7 = a3;
  id v9 = [v6 numberWithInt:v4];
  objc_super v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_recentSceneIdentityTokensByPID, "objectForKeyedSubscript:");
  [v8 removeObject:v7];

  if (![v8 count])
  {
    [(NSMutableDictionary *)self->_recentSceneIdentityTokensByPID removeObjectForKey:v9];

    [(NSMutableOrderedSet *)self->_recentPIDs removeObject:v9];
    objc_super v8 = 0;
  }
}

- (id)mostRecentFocusTargetForPID:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(void **)(a1 + 8);
    uint64_t v4 = [NSNumber numberWithInt:a2];
    char v5 = [v3 objectForKeyedSubscript:v4];
    id v6 = [v5 lastObject];

    if (v6)
    {
      id v7 = +[SBKeyboardFocusTarget targetForSceneIdentityToken:v6 pid:a2];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentPIDs, 0);
  objc_storeStrong((id *)&self->_recentSceneIdentityTokensByPID, 0);
}

@end