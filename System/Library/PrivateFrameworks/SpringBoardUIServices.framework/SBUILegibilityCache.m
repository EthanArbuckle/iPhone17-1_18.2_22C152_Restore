@interface SBUILegibilityCache
- (BOOL)containsTemplateForSettings:(id)a3;
- (BOOL)isCachedTemplateImage:(id)a3;
- (SBUILegibilityCache)initWithEngine:(id)a3;
- (SBUILegibilityEngine)engine;
- (id)cachedStrengthForImage:(id)a3 strength:(double)a4 generator:(id)a5;
- (id)memoryPoolForGraphicsContextType:(int64_t)a3 matchingSize:(CGSize)a4 scale:(double)a5;
- (id)templateImageForSettings:(id)a3 matchingSize:(CGSize)a4;
- (void)_teardownMemoryPools;
- (void)cacheTemplateShadowImage:(id)a3 settings:(id)a4 maxSize:(CGSize)a5;
- (void)removeAllObjects;
@end

@implementation SBUILegibilityCache

- (id)memoryPoolForGraphicsContextType:(int64_t)a3 matchingSize:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  p_memoryPoolLock = &self->_memoryPoolLock;
  os_unfair_lock_lock(&self->_memoryPoolLock);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F42A80], "sbf_bytesNeededForSize:scale:withContextType:", a3, width, height, a5);
  v12 = [(NSMutableDictionary *)self->_memoryPoolLock_memoryPoolsBySlotSize allKeys];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__SBUILegibilityCache_memoryPoolForGraphicsContextType_matchingSize_scale___block_invoke;
  v19[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
  v19[4] = v11;
  v13 = objc_msgSend(v12, "bs_firstObjectPassingTest:", v19);

  if (v13)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_memoryPoolLock_memoryPoolsBySlotSize objectForKey:v13];
LABEL_4:
    v15 = (void *)v14;
    goto LABEL_5;
  }
  v13 = [NSNumber numberWithUnsignedLong:v11];
  uint64_t v14 = [(NSMutableDictionary *)self->_memoryPoolLock_memoryPoolsBySlotSize objectForKey:v13];
  if (v14) {
    goto LABEL_4;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F4BE60]);
  objc_msgSend(NSString, "stringWithFormat:", @"LegibilityMemoryPool-%zu", v11);
  id v18 = objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v17, "initWithLabel:slotLength:", objc_msgSend(v18, "UTF8String"), v11);

  [(NSMutableDictionary *)self->_memoryPoolLock_memoryPoolsBySlotSize setObject:v15 forKey:v13];
LABEL_5:
  os_unfair_lock_unlock(p_memoryPoolLock);

  return v15;
}

- (id)cachedStrengthForImage:(id)a3 strength:(double)a4 generator:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, id, double))a5;
  v10 = [(SBUILegibilityCache *)self engine];
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  v12 = [(NSMapTable *)self->_strengthForImageLookupMap objectForKey:v8];
  v13 = [NSNumber numberWithDouble:a4];
  uint64_t v14 = [v12 objectForKey:v13];

  if (v14)
  {
    v15 = SBLogLegibility();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    int v19 = 138412802;
    v20 = v10;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2048;
    double v24 = a4;
    v16 = "(%@) Skipped drawing strength for image %@ / %f";
    goto LABEL_13;
  }
  uint64_t v14 = v9[2](v9, v8, a4);
  if (v14)
  {
    if (!v12)
    {
      v12 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      [(NSMapTable *)self->_strengthForImageLookupMap setObject:v12 forKey:v8];
    }
    id v17 = [NSNumber numberWithDouble:a4];
    [v12 setObject:v14 forKey:v17];
  }
  v15 = SBLogLegibility();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412802;
    v20 = v10;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2048;
    double v24 = a4;
    v16 = "(%@) Drawing strength for image %@ / %f";
LABEL_13:
    _os_log_debug_impl(&dword_1A7607000, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v19, 0x20u);
  }
LABEL_9:

  os_unfair_lock_unlock(p_unfairLock);
  return v14;
}

- (SBUILegibilityEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  return (SBUILegibilityEngine *)WeakRetained;
}

- (id)templateImageForSettings:(id)a3 matchingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  v9 = [(NSMapTable *)self->_templateImagesBySizeForSettings objectForKey:v7];
  v10 = [(NSMapTable *)self->_sortedTemplateImageKeysBySizeForSettings objectForKey:v7];
  if (!v10)
  {
    uint64_t v11 = [v9 allKeys];
    v10 = [v11 sortedArrayUsingComparator:&__block_literal_global_36];

    [(NSMapTable *)self->_sortedTemplateImageKeysBySizeForSettings setObject:v10 forKey:v7];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v13)
  {

LABEL_22:
    uint64_t v25 = objc_msgSend(v12, "lastObject", (void)v27);
    v15 = [v9 objectForKey:v25];

    goto LABEL_23;
  }
  uint64_t v14 = v13;
  v15 = 0;
  uint64_t v16 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v28 != v16) {
        objc_enumerationMutation(v12);
      }
      id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      objc_msgSend(v18, "CGSizeValue", (void)v27);
      double v21 = vabdd_f64(v19, width);
      if ((vabdd_f64(v20, height) >= 5.0 || v21 >= 5.0) && (v20 < height || v19 < width)) {
        continue;
      }
      uint64_t v24 = [v9 objectForKey:v18];

      v15 = (void *)v24;
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v14);

  if (!v15) {
    goto LABEL_22;
  }
LABEL_23:
  os_unfair_lock_unlock(p_unfairLock);

  return v15;
}

BOOL __75__SBUILegibilityCache_memoryPoolForGraphicsContextType_matchingSize_scale___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 unsignedIntegerValue] >= *(void *)(a1 + 32);
}

- (BOOL)containsTemplateForSettings:(id)a3
{
  p_unfairLock = &self->_unfairLock;
  id v5 = a3;
  os_unfair_lock_lock(p_unfairLock);
  v6 = [(NSMapTable *)self->_templateImagesBySizeForSettings objectForKey:v5];

  os_unfair_lock_unlock(p_unfairLock);
  return v6 != 0;
}

- (SBUILegibilityCache)initWithEngine:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBUILegibilityCache.m", 29, @"Invalid parameter not satisfying: %@", @"engine" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)SBUILegibilityCache;
  v6 = [(SBUILegibilityCache *)&v20 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_engine, v5);
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    templateImagesBySizeForSettings = v7->_templateImagesBySizeForSettings;
    v7->_templateImagesBySizeForSettings = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    cachedTemplatedImages = v7->_cachedTemplatedImages;
    v7->_cachedTemplatedImages = (NSHashTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    strengthForImageLookupMap = v7->_strengthForImageLookupMap;
    v7->_strengthForImageLookupMap = (NSMapTable *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    sortedTemplateImageKeysBySizeForSettings = v7->_sortedTemplateImageKeysBySizeForSettings;
    v7->_sortedTemplateImageKeysBySizeForSettings = (NSMapTable *)v14;

    v7->_unfairLock._os_unfair_lock_opaque = 0;
    v7->_memoryPoolLock._os_unfair_lock_opaque = 0;
    uint64_t v16 = objc_opt_new();
    memoryPoolLock_memoryPoolsBySlotSize = v7->_memoryPoolLock_memoryPoolsBySlotSize;
    v7->_memoryPoolLock_memoryPoolsBySlotSize = (NSMutableDictionary *)v16;
  }
  return v7;
}

- (BOOL)isCachedTemplateImage:(id)a3
{
  v3 = self;
  p_unfairLock = &self->_unfairLock;
  id v5 = a3;
  os_unfair_lock_lock(p_unfairLock);
  LOBYTE(v3) = [(NSHashTable *)v3->_cachedTemplatedImages containsObject:v5];

  os_unfair_lock_unlock(p_unfairLock);
  return (char)v3;
}

uint64_t __61__SBUILegibilityCache_templateImageForSettings_matchingSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 CGSizeValue];
  double v6 = v5;
  double v8 = v7;
  [v4 CGSizeValue];
  double v10 = v9;
  double v12 = v11;

  if (v6 * v8 >= v10 * v12) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = -1;
  }
  if (v6 * v8 > v10 * v12) {
    return 1;
  }
  else {
    return v13;
  }
}

- (void)cacheTemplateShadowImage:(id)a3 settings:(id)a4 maxSize:(CGSize)a5
{
  id v11 = a4;
  id v7 = a3;
  os_unfair_lock_lock(&self->_unfairLock);
  double v8 = [(NSMapTable *)self->_templateImagesBySizeForSettings objectForKey:v11];
  if (!v8)
  {
    double v8 = objc_opt_new();
    [(NSMapTable *)self->_templateImagesBySizeForSettings setObject:v8 forKey:v11];
  }
  double v9 = (void *)MEMORY[0x1E4F29238];
  [v7 size];
  double v10 = objc_msgSend(v9, "valueWithCGSize:");
  [v8 setObject:v7 forKey:v10];
  [(NSHashTable *)self->_cachedTemplatedImages addObject:v7];

  [(NSMapTable *)self->_sortedTemplateImageKeysBySizeForSettings removeObjectForKey:v11];
  os_unfair_lock_unlock(&self->_unfairLock);
}

- (void)removeAllObjects
{
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  [(NSMapTable *)self->_strengthForImageLookupMap removeAllObjects];
  [(NSMapTable *)self->_templateImagesBySizeForSettings removeAllObjects];
  [(NSHashTable *)self->_cachedTemplatedImages removeAllObjects];
  [(NSMapTable *)self->_sortedTemplateImageKeysBySizeForSettings removeAllObjects];
  os_unfair_lock_unlock(p_unfairLock);
  [(SBUILegibilityCache *)self _teardownMemoryPools];
}

- (void)_teardownMemoryPools
{
  p_memoryPoolLock = &self->_memoryPoolLock;
  os_unfair_lock_lock(&self->_memoryPoolLock);
  [(NSMutableDictionary *)self->_memoryPoolLock_memoryPoolsBySlotSize removeAllObjects];
  os_unfair_lock_unlock(p_memoryPoolLock);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_memoryPoolLock_memoryPoolsBySlotSize, 0);
  objc_storeStrong((id *)&self->_cachedTemplatedImages, 0);
  objc_storeStrong((id *)&self->_strengthForImageLookupMap, 0);
  objc_storeStrong((id *)&self->_sortedTemplateImageKeysBySizeForSettings, 0);
  objc_storeStrong((id *)&self->_templateImagesBySizeForSettings, 0);
}

@end