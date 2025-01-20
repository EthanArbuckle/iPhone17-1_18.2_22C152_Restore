@interface _UIFocusMapSnapshot
- (BOOL)hasOnlyStaticContent;
- (CGRect)snapshotFrameForRegion:(id)a3;
- (NSArray)originalRegions;
- (NSArray)regions;
- (UICoordinateSpace)coordinateSpace;
- (UIFocusSystem)focusSystem;
- (_UIFocusMapRect)_searchArea;
- (_UIFocusMapRect)mapArea;
- (_UIFocusMapSnapshot)init;
- (_UIFocusMapSnapshotDebugInfo)_debugInfo;
- (_UIFocusMovementInfo)movementInfo;
- (_UIFocusRegion)focusedRegion;
- (_UIFocusRegionContainer)regionsContainer;
- (_UIFocusRegionContainer)rootContainer;
- (_UIFocusSearchInfo)searchInfo;
- (id)_cachedNextFocusedItemForRegion:(id)a3 withFocusMovementRequest:(id)a4 inMap:(id)a5;
- (id)_debugInfoWithFocusMapSearchInfo:(id)a3;
- (id)_initWithSnapshotter:(id)a3 mapArea:(id)a4 searchArea:(id)a5;
- (id)debugQuickLookObject;
- (id)occludingRegionsForRegion:(id)a3;
- (id)originalRegionForRegion:(id)a3;
- (id)regionsForOriginalRegion:(id)a3;
- (void)_capture;
- (void)_trackOccludingRegion:(id)a3 forRegion:(id)a4;
- (void)_trackSubregion:(id)a3 forRegion:(id)a4;
- (void)addRegion:(id)a3;
- (void)addRegions:(id)a3;
- (void)addRegionsInContainer:(id)a3;
- (void)addRegionsInContainers:(id)a3;
- (void)consumeRegionInformationForRegions:(id)a3 fromSnapshot:(id)a4;
- (void)dealloc;
- (void)markContainerAsProvidingDynamicContent;
- (void)setMovementInfo:(id)a3;
- (void)setSearchInfo:(id)a3;
@end

@implementation _UIFocusMapSnapshot

- (id)debugQuickLookObject
{
  v2 = [(_UIFocusMapSnapshot *)self _debugInfo];
  v3 = [v2 image];

  return v3;
}

- (_UIFocusMapSnapshotDebugInfo)_debugInfo
{
  objc_getAssociatedObject(self, sel__debugInfo);
  v3 = (_UIFocusMapSnapshotDebugInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = [[_UIFocusMapSnapshotDebugInfo alloc] initWithSnapshot:self focusMapSearchInfo:0];
    objc_setAssociatedObject(self, sel__debugInfo, v3, (void *)1);
  }
  return v3;
}

- (id)_debugInfoWithFocusMapSearchInfo:(id)a3
{
  id v4 = a3;
  v5 = [[_UIFocusMapSnapshotDebugInfo alloc] initWithSnapshot:self focusMapSearchInfo:v4];

  return v5;
}

- (_UIFocusMapSnapshot)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIFocusMapSnapshot.m" lineNumber:149 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (id)_initWithSnapshotter:(id)a3 mapArea:(id)a4 searchArea:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_16:
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 156, @"Invalid parameter not satisfying: %@", @"mapArea" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_17;
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 155, @"Invalid parameter not satisfying: %@", @"snapshotter" object file lineNumber description];

  if (!v10) {
    goto LABEL_16;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_17:
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 157, @"Invalid parameter not satisfying: %@", @"searchArea" object file lineNumber description];

LABEL_4:
  v12 = [v10 coordinateSpace];
  v13 = [v11 coordinateSpace];

  if (v12 != v13)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"_UIFocusMapSnapshot.m" lineNumber:158 description:@"The focus map snapshot's map area and search area must be expressed in the same coordinate space."];
  }
  v33.receiver = self;
  v33.super_class = (Class)_UIFocusMapSnapshot;
  v14 = [(_UIFocusMapSnapshot *)&v33 init];
  if (v14)
  {
    v15 = [v9 focusSystem];
    objc_storeWeak((id *)&v14->_focusSystem, v15);

    v16 = [v9 rootContainer];
    objc_storeWeak((id *)&v14->_rootContainer, v16);

    uint64_t v17 = [v9 focusedRegion];
    focusedRegion = v14->_focusedRegion;
    v14->_focusedRegion = (_UIFocusRegion *)v17;

    v19 = [v9 regionsContainer];
    objc_storeWeak((id *)&v14->_regionsContainer, v19);

    if ([v9 clipToSnapshotRect]) {
      char v20 = 4;
    }
    else {
      char v20 = 0;
    }
    *(unsigned char *)&v14->_flags = *(unsigned char *)&v14->_flags & 0xFB | v20;
    if ([v9 ignoresRootContainerClippingRect]) {
      char v21 = 8;
    }
    else {
      char v21 = 0;
    }
    *(unsigned char *)&v14->_flags = *(unsigned char *)&v14->_flags & 0xF7 | v21;
    uint64_t v22 = [v9 searchInfo];
    searchInfo = v14->_searchInfo;
    v14->_searchInfo = (_UIFocusSearchInfo *)v22;

    uint64_t v24 = [v9 movementInfo];
    movementInfo = v14->_movementInfo;
    v14->_movementInfo = (_UIFocusMovementInfo *)v24;

    objc_storeStrong((id *)&v14->_mapArea, a4);
    objc_storeStrong((id *)&v14->_searchArea, a5);
    uint64_t v26 = [MEMORY[0x1E4F28D30] hashTableWithOptions:514];
    visitedRegionContainers = v14->_visitedRegionContainers;
    v14->_visitedRegionContainers = (NSHashTable *)v26;

    [(_UIFocusMapSnapshot *)v14 _capture];
  }

  return v14;
}

- (void)dealloc
{
  subregionToRegionMap = self->_subregionToRegionMap;
  if (subregionToRegionMap)
  {
    CFRelease(subregionToRegionMap);
    self->_subregionToRegionMap = 0;
  }
  regionToOccludingRegionsMap = self->_regionToOccludingRegionsMap;
  if (regionToOccludingRegionsMap)
  {
    CFRelease(regionToOccludingRegionsMap);
    self->_regionToOccludingRegionsMap = 0;
  }
  regionToFocusItemCache = self->_regionToFocusItemCache;
  if (regionToFocusItemCache)
  {
    CFRelease(regionToFocusItemCache);
    self->_regionToFocusItemCache = 0;
  }
  regionFrameCache = self->_regionFrameCache;
  if (regionFrameCache)
  {
    CFRelease(regionFrameCache);
    self->_regionFrameCache = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIFocusMapSnapshot;
  [(_UIFocusMapSnapshot *)&v7 dealloc];
}

- (NSArray)regions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)&self->_flags)
  {
    regions = self->_regions;
    if (!regions)
    {
      mutableUnoccludedRegions = self->_mutableUnoccludedRegions;
      filteredOriginalRegions = self->_filteredOriginalRegions;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_regionsContainer);
      v8 = filteredOriginalRegions;
      id v9 = self;
      id v10 = +[_UIFocusRegionEvaluator regionsByEvaluatingOcclusionsForRegions:mutableUnoccludedRegions inSnapshot:v9];
      id v11 = v10;
      if (WeakRetained)
      {
        id v23 = WeakRetained;
        v12 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v22 = v11;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              v19 = -[_UIFocusMapSnapshot originalRegionForRegion:](v9, "originalRegionForRegion:", v18, v22);
              if ([(NSHashTable *)v8 containsObject:v19]) {
                [(NSArray *)v12 addObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v15);
        }

        id v11 = v22;
        id WeakRetained = v23;
      }
      else
      {
        v12 = v10;
      }

      char v20 = self->_regions;
      self->_regions = v12;

      regions = self->_regions;
    }
    v2 = regions;
  }
  else
  {
    v2 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (NSArray)originalRegions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)&self->_flags)
  {
    id v4 = [(_UIFocusMapSnapshot *)self regionsContainer];

    if (v4)
    {
      v2 = [(NSHashTable *)self->_filteredOriginalRegions allObjects];
    }
    else
    {
      v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v6 = self->_mutableUnoccludedRegions;
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = -[_UIFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
            [v5 addObject:v11];
          }
          uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v8);
      }

      v2 = [v5 allObjects];
    }
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v2;
}

- (id)regionsForOriginalRegion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 257, @"Invalid parameter not satisfying: %@", @"originalRegion" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [(_UIFocusMapSnapshot *)self regions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [(_UIFocusMapSnapshot *)self originalRegionForRegion:v12];

        if (v13 == v5) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  long long v14 = (void *)[v6 copy];
  return v14;
}

- (void)_trackSubregion:(id)a3 forRegion:(id)a4
{
  id key = a3;
  id v7 = a4;
  uint64_t v8 = key;
  uint64_t v9 = v7;
  if (key)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 275, @"Invalid parameter not satisfying: %@", @"subregion" object file lineNumber description];

    uint64_t v8 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 276, @"Invalid parameter not satisfying: %@", @"originalRegion" object file lineNumber description];

  uint64_t v8 = key;
LABEL_3:
  if (v8 == v9)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 277, @"Invalid parameter not satisfying: %@", @"subregion != originalRegion" object file lineNumber description];

    uint64_t v8 = key;
  }
  CFDictionarySetValue(self->_subregionToRegionMap, v8, v9);
}

- (id)originalRegionForRegion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 284, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];
  }
  id v6 = v5;
  id v7 = CFDictionaryGetValue(self->_subregionToRegionMap, v6);
  id v8 = v6;
  if (v7)
  {
    uint64_t v9 = v6;
    do
    {
      id v8 = v7;

      id v7 = CFDictionaryGetValue(self->_subregionToRegionMap, v8);

      uint64_t v9 = v8;
    }
    while (v7);
  }

  return v8;
}

- (void)_trackOccludingRegion:(id)a3 forRegion:(id)a4
{
  id v9 = a3;
  id v6 = [(_UIFocusMapSnapshot *)self originalRegionForRegion:a4];
  id v7 = CFDictionaryGetValue(self->_regionToOccludingRegionsMap, v6);
  if (v7)
  {
    id v8 = v7;
    [v7 addObject:v9];
  }
  else
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v9, 0);
    CFDictionarySetValue(self->_regionToOccludingRegionsMap, v6, v8);
  }
}

- (id)occludingRegionsForRegion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 310, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];
  }
  id v6 = [(_UIFocusMapSnapshot *)self originalRegionForRegion:v5];
  id v7 = CFDictionaryGetValue(self->_regionToOccludingRegionsMap, v6);
  id v8 = v7;
  if (v7) {
    id v9 = (void *)[v7 copy];
  }
  else {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (void)consumeRegionInformationForRegions:(id)a3 fromSnapshot:(id)a4
{
  id v16 = a3;
  id v7 = (CFDictionaryRef *)a4;
  id v8 = [(CFDictionaryRef *)v7 coordinateSpace];
  id v9 = [(_UIFocusMapSnapshot *)self coordinateSpace];

  if (v8 != v9)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UIFocusMapSnapshot.m" lineNumber:320 description:@"Unable to consume regions from a snapshot with a different coordinate system."];
  }
  uint64_t v10 = (void *)[v16 mutableCopy];
  if ([v10 count])
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = [v10 objectAtIndexedSubscript:v11];
      id v13 = CFDictionaryGetValue(v7[3], v12);
      if (v13)
      {
        CFDictionarySetValue(self->_subregionToRegionMap, v12, v13);
        [v10 addObject:v13];
      }
      long long v14 = CFDictionaryGetValue(v7[4], v12);
      if (v14) {
        CFDictionarySetValue(self->_regionToOccludingRegionsMap, v12, v14);
      }

      ++v11;
    }
    while (v11 < [v10 count]);
  }
}

- (id)_cachedNextFocusedItemForRegion:(id)a3 withFocusMovementRequest:(id)a4 inMap:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%p_%p_%p", v8, v9, v10);
  uint64_t v12 = CFDictionaryGetValue(self->_regionToFocusItemCache, v11);
  if (v12)
  {
    id v13 = (void *)v12;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &_cachedNextFocusedItemForRegion_withFocusMovementRequest_inMap____s_category);
    long long v15 = *(id *)(CategoryCachedImpl + 8);
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v15, OS_SIGNPOST_EVENT, v17, "FocusRegionCacheHit", "Found cached focus region.", buf, 2u);
      }
    }
  }
  else
  {
    long long v18 = [v8 _nextFocusedItemForFocusMovementRequest:v9 inMap:v10 withSnapshot:self];
    long long v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [MEMORY[0x1E4F1CA98] null];
    }
    id v13 = v20;

    CFDictionarySetValue(self->_regionToFocusItemCache, v11, v13);
  }
  char v21 = [MEMORY[0x1E4F1CA98] null];
  if (v13 == v21) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = v13;
  }
  id v23 = v22;

  return v23;
}

- (CGRect)snapshotFrameForRegion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 358, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];
  }
  Value = (double *)CFDictionaryGetValue(self->_regionFrameCache, v5);
  if (Value)
  {
    double v7 = *Value;
    double v8 = Value[1];
    double v9 = Value[2];
    double v10 = Value[3];
  }
  else
  {
    unint64_t v11 = [(_UIFocusMapSnapshot *)self coordinateSpace];
    +[_UIFocusRegionEvaluator frameForRegion:v5 inCoordinateSpace:v11];
    double v7 = v12;
    double v8 = v13;
    double v9 = v14;
    double v10 = v15;

    os_signpost_id_t v16 = (double *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    double *v16 = v7;
    v16[1] = v8;
    v16[2] = v9;
    v16[3] = v10;
    CFDictionarySetValue(self->_regionFrameCache, v5, v16);
  }

  double v17 = v7;
  double v18 = v8;
  double v19 = v9;
  double v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)markContainerAsProvidingDynamicContent
{
  uncachableEnvironments = self->_uncachableEnvironments;
  id v4 = [(NSMutableArray *)self->_stateStack lastObject];
  v3 = [v4 regionContainer];
  [(NSHashTable *)uncachableEnvironments addObject:v3];
}

- (BOOL)hasOnlyStaticContent
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSHashTable *)self->_uncachableEnvironments count];
  if (*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &_MergedGlobals_1044))
  {
    if (v3)
    {
      if (!_AXSFullKeyboardAccessEnabled())
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2605A0);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          id v6 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            uncachableEnvironments = self->_uncachableEnvironments;
            int v8 = 138412290;
            double v9 = uncachableEnvironments;
            _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Found uncachable environments during linear focus lookup: %@", (uint8_t *)&v8, 0xCu);
          }
        }
      }
    }
  }
  return v3 == 0;
}

- (void)_capture
{
  *(unsigned char *)&self->_flags &= ~1u;
  regions = self->_regions;
  self->_regions = 0;

  id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  mutableUnoccludedRegions = self->_mutableUnoccludedRegions;
  self->_mutableUnoccludedRegions = v5;

  double v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
  filteredOriginalRegions = self->_filteredOriginalRegions;
  self->_filteredOriginalRegions = v7;

  if (*(_OWORD *)&self->_subregionToRegionMap != 0 || self->_regionToFocusItemCache || self->_regionFrameCache)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 399, @"Invalid parameter not satisfying: %@", @"_subregionToRegionMap == NULL && _regionToOccludingRegionsMap == NULL && _regionToFocusItemCache == NULL && _regionFrameCache == NULL" object file lineNumber description];
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  self->_subregionToRegionMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &pointerKeyCallbacks, &pointerValueCallbacks);
  self->_regionToOccludingRegionsMap = CFDictionaryCreateMutable(v9, 0, &pointerKeyCallbacks, &equalValueCallbacks);
  self->_regionToFocusItemCache = CFDictionaryCreateMutable(v9, 0, &equalKeyCallbacks, &pointerValueCallbacks);
  self->_regionFrameCache = CFDictionaryCreateMutable(v9, 0, &pointerKeyCallbacks, &rectValueCallbacks);
  uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  stateStack = self->_stateStack;
  self->_stateStack = v10;

  double v12 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  eligibleEnvironments = self->_eligibleEnvironments;
  self->_eligibleEnvironments = v12;

  double v14 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  ineligibleEnvironments = self->_ineligibleEnvironments;
  self->_ineligibleEnvironments = v14;

  os_signpost_id_t v16 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  uncachableEnvironments = self->_uncachableEnvironments;
  self->_uncachableEnvironments = v16;

  *(unsigned char *)&self->_flags &= ~2u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootContainer);
  [(_UIFocusMapSnapshot *)self addRegionsInContainer:WeakRetained];

  *(unsigned char *)&self->_flags |= 1u;
}

- (UICoordinateSpace)coordinateSpace
{
  v2 = [(_UIFocusMapSnapshot *)self _searchArea];
  NSUInteger v3 = [v2 coordinateSpace];

  return (UICoordinateSpace *)v3;
}

- (void)addRegion:(id)a3
{
  id v38 = a3;
  if (!v38)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 431, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];
  }
  id v5 = [(NSMutableArray *)self->_stateStack lastObject];
  id v6 = [v5 regionContainerFocusSystem];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (v6 == WeakRetained)
  {
    int v8 = [(_UIFocusMapSnapshot *)self mapArea];
    [(_UIFocusMapSnapshot *)self snapshotFrameForRegion:v38];
    CGFloat x = v41.origin.x;
    CGFloat y = v41.origin.y;
    CGFloat width = v41.size.width;
    CGFloat height = v41.size.height;
    if (fabs(CGRectGetWidth(v41)) < 0.0001) {
      goto LABEL_31;
    }
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    if (fabs(CGRectGetHeight(v42)) < 0.0001) {
      goto LABEL_31;
    }
    id v13 = v38;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
      if (![v8 intersectsRegion:v38 inSnapshot:self])
      {
LABEL_31:

        goto LABEL_32;
      }
      if ((*(unsigned char *)&self->_flags & 4) != 0 && [v38 _shouldCropRegionToSearchArea])
      {
        id regions = [v8 intersectionWithRegion:v38 inSnapshot:self];
        double v15 = v38;
        if (regions != v38)
        {
          if (regions)
          {
            [(_UIFocusMapSnapshot *)self snapshotFrameForRegion:regions];
            double v15 = v38;
            CGFloat x = v16;
            CGFloat y = v17;
            CGFloat width = v18;
            CGFloat height = v19;
          }
          else
          {
            CGFloat x = *MEMORY[0x1E4F1DB20];
            CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
            CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
            CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
          }
        }
      }
      else
      {
        id regions = v38;
      }
    }
    else
    {
      id regions = v38;
    }
    if (regions)
    {
      if (objc_msgSend(regions, "_isUnclippable", v13)) {
        goto LABEL_22;
      }
      double v20 = [v6 behavior];
      int v21 = [v20 supportsClipToBounds];

      if (!v21) {
        goto LABEL_22;
      }
      uint64_t v22 = [(NSMutableArray *)self->_stateStack lastObject];
      [v22 clippingRect];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;

      v43.origin.CGFloat x = v24;
      v43.origin.CGFloat y = v26;
      v43.size.CGFloat width = v28;
      v43.size.CGFloat height = v30;
      if (CGRectIsNull(v43)) {
        goto LABEL_22;
      }
      v44.origin.CGFloat x = x;
      v44.origin.CGFloat y = y;
      v44.size.CGFloat width = width;
      v44.size.CGFloat height = height;
      v47.origin.CGFloat x = v24;
      v47.origin.CGFloat y = v26;
      v47.size.CGFloat width = v28;
      v47.size.CGFloat height = v30;
      CGRect v45 = CGRectIntersection(v44, v47);
      double v31 = v45.origin.x;
      double v32 = v45.origin.y;
      double v33 = v45.size.width;
      double v34 = v45.size.height;
      v48.origin.CGFloat x = x;
      v48.origin.CGFloat y = y;
      v48.size.CGFloat width = width;
      v48.size.CGFloat height = height;
      if (CGRectEqualToRect(v45, v48))
      {
LABEL_22:
        id v35 = regions;
        goto LABEL_23;
      }
      v46.origin.CGFloat x = v31;
      v46.origin.CGFloat y = v32;
      v46.size.CGFloat width = v33;
      v46.size.CGFloat height = v34;
      if (CGRectIsEmpty(v46))
      {
        id v38 = 0;
LABEL_26:

        goto LABEL_31;
      }
      +[_UIFocusRegionEvaluator subregionFromRegion:withSnapshotFrame:inSnapshot:](_UIFocusRegionEvaluator, "subregionFromRegion:withSnapshotFrame:inSnapshot:", regions, self, v31, v32, v33, v34);
      id v39 = (id)objc_claimAutoreleasedReturnValue();

      id v35 = v39;
      if (v39)
      {
LABEL_23:
        id v38 = v35;
        -[NSMutableArray addObject:](self->_mutableUnoccludedRegions, "addObject:");
        if ((*(unsigned char *)&self->_flags & 2) != 0)
        {
          v36 = [(_UIFocusMapSnapshot *)self originalRegionForRegion:v38];
          [(NSHashTable *)self->_filteredOriginalRegions addObject:v36];
        }
        id regions = self->_regions;
        self->_id regions = 0;
        goto LABEL_26;
      }
    }
    id v38 = 0;
    goto LABEL_31;
  }
LABEL_32:
}

- (void)addRegions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 482, @"Invalid parameter not satisfying: %@", @"regions" object file lineNumber description];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(_UIFocusMapSnapshot *)self addRegion:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)addRegionsInContainer:(id)a3
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v137 = self;
  if (!v5)
  {
    v117 = [MEMORY[0x1E4F28B00] currentHandler];
    [v117 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 490, @"Invalid parameter not satisfying: %@", @"container" object file lineNumber description];
  }
  NSUInteger v6 = [(NSHashTable *)self->_visitedRegionContainers count];
  id v7 = v5;
  uint64_t v8 = v7;
  if (objc_msgSend(v7, "_ui_isUIFocusRegionContainerProxy"))
  {
    uint64_t v8 = [v7 owningEnvironment];
  }
  [(NSHashTable *)self->_visitedRegionContainers addObject:v8];
  if (v6 != [(NSHashTable *)self->_visitedRegionContainers count])
  {
    eligibleEnvironments = self->_eligibleEnvironments;
    ineligibleEnvironments = self->_ineligibleEnvironments;
    stateStack = self->_stateStack;
    id v136 = v7;
    double v16 = eligibleEnvironments;
    uint64_t v17 = ineligibleEnvironments;
    double v18 = stateStack;
    if (v5)
    {
      if (v16) {
        goto LABEL_13;
      }
    }
    else
    {
      v118 = [MEMORY[0x1E4F28B00] currentHandler];
      v119 = objc_msgSend(NSString, "stringWithUTF8String:", "UIFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_UIFocusRegionContainer>, NSHashTable<id<UIFocusEnvironment>> *__strong, NSHashTable<id<UIFocusEnvironment>> *__strong, NSArray<_UIFocusRegionSearchContextState *> *__strong)");
      [v118 handleFailureInFunction:v119, @"_UIFocusMapSnapshot.m", 34, @"Invalid parameter not satisfying: %@", @"container" file lineNumber description];

      if (v16)
      {
LABEL_13:
        if (v17) {
          goto LABEL_14;
        }
LABEL_86:
        v122 = [MEMORY[0x1E4F28B00] currentHandler];
        v123 = objc_msgSend(NSString, "stringWithUTF8String:", "UIFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_UIFocusRegionContainer>, NSHashTable<id<UIFocusEnvironment>> *__strong, NSHashTable<id<UIFocusEnvironment>> *__strong, NSArray<_UIFocusRegionSearchContextState *> *__strong)");
        [v122 handleFailureInFunction:v123, @"_UIFocusMapSnapshot.m", 36, @"Invalid parameter not satisfying: %@", @"ineligibleEnvironments" file lineNumber description];

LABEL_14:
        uint64_t v152 = 0;
        v153 = &v152;
        uint64_t v154 = 0x2020000000;
        char IsEligibleForFocusOcclusion = 0;
        char IsEligibleForFocusOcclusion = _UIFocusEnvironmentIsEligibleForFocusOcclusion(v136, 0);
        if (*((unsigned char *)v153 + 24)) {
          double v19 = v16;
        }
        else {
          double v19 = v17;
        }
        [(NSHashTable *)v19 addObject:v136];
        if (*((unsigned char *)v153 + 24))
        {
          double v20 = [(NSMutableArray *)v18 lastObject];
          int v21 = [v20 regionContainer];

          v134 = v18;
          if (objc_msgSend(v21, "_ui_isUIFocusRegionContainerProxy"))
          {
            uint64_t v22 = [v21 owningEnvironment];

            id v23 = v7;
            CGFloat v24 = a2;
            double v25 = v8;
            int v21 = (void *)v22;
          }
          else
          {
            id v23 = v7;
            CGFloat v24 = a2;
            double v25 = v8;
          }
          uint64_t v146 = 0;
          v147 = &v146;
          uint64_t v148 = 0x3032000000;
          v149 = __Block_byref_object_copy__90;
          v150 = __Block_byref_object_dispose__90;
          id v151 = 0;
          uint64_t v142 = 0;
          v143 = &v142;
          uint64_t v144 = 0x2020000000;
          char v145 = 0;
          v140[0] = 0;
          v140[1] = v140;
          v140[2] = 0x2020000000;
          char v141 = 1;
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v157 = ____UIFocusMapRecurseSearchForFocusSystemInEligibleContainer_block_invoke;
          v158 = &unk_1E52EE520;
          v163 = &v146;
          id v26 = v136;
          id v159 = v26;
          id v27 = v21;
          id v160 = v27;
          v164 = &v142;
          v165 = v140;
          v161 = v16;
          v162 = v17;
          v166 = &v152;
          _UIFocusEnvironmentEnumerateAncestorEnvironments(v26, &buf);
          uint64_t v8 = v25;
          double v18 = v134;
          a2 = v24;
          id v7 = v23;
          if (*((unsigned char *)v153 + 24))
          {
            if (*((unsigned char *)v143 + 24))
            {
              CGFloat v28 = [(NSMutableArray *)v134 lastObject];
              id v11 = [v28 regionContainerFocusSystem];
            }
            else
            {
              id v11 = +[UIFocusSystem focusSystemForEnvironment:v147[5]];
            }
          }
          else
          {
            id v11 = 0;
          }

          _Block_object_dispose(v140, 8);
          _Block_object_dispose(&v142, 8);
          _Block_object_dispose(&v146, 8);
        }
        else
        {
          id v11 = 0;
        }
        _Block_object_dispose(&v152, 8);

        if (!v11) {
          goto LABEL_83;
        }
        v135 = [(_UIFocusMapSnapshot *)v137 regionsContainer];
        int v133 = [v136 isEqual:v135];
        if (v133 && (*(unsigned char *)&v137->_flags & 2) == 0) {
          *(unsigned char *)&v137->_flags |= 2u;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&v137->_rootContainer);
        if ([v136 isEqual:WeakRetained])
        {
          BOOL v30 = (*(unsigned char *)&v137->_flags & 8) == 0;

          if (!v30)
          {
            double v31 = *MEMORY[0x1E4F1DB20];
            double v32 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
            double v33 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
            double v34 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_75:
            v188.origin.double x = v31;
            v188.origin.double y = v32;
            v188.size.double width = v33;
            v188.size.double height = v34;
            if (CGRectIsNull(v188))
            {
              if ([(NSMutableArray *)v137->_stateStack count])
              {
                v113 = [(NSMutableArray *)v137->_stateStack lastObject];
                [v113 clippingRect];
                BOOL IsNull = CGRectIsNull(v189);

                if (!IsNull)
                {
                  v115 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v115 handleFailureInMethod:a2, v137, @"_UIFocusMapSnapshot.m", 534, @"Encountered a NULL clipping rect, which is invalid when previous containers are clipping." object file lineNumber description];
                }
              }
            }
            v116 = +[_UIFocusRegionSearchContextState stateWithRegionContainer:focusSystem:clippingRect:](_UIFocusRegionSearchContextState, "stateWithRegionContainer:focusSystem:clippingRect:", v136, v11, v31, v32, v33, v34);
            [(NSMutableArray *)v137->_stateStack addObject:v116];
            [v136 _searchForFocusRegionsInContext:v137];
            [(NSMutableArray *)v137->_stateStack removeLastObject];
            if (v133 && (*(unsigned char *)&v137->_flags & 2) != 0) {
              *(unsigned char *)&v137->_flags &= ~2u;
            }

            goto LABEL_83;
          }
        }
        else
        {
        }
        id v35 = objc_loadWeakRetained((id *)&v137->_focusSystem);
        v36 = v137->_stateStack;
        v37 = [(_UIFocusMapSnapshot *)v137 coordinateSpace];
        id v132 = v35;
        id v38 = v36;
        id v39 = v136;
        id v40 = v37;
        char v41 = objc_opt_respondsToSelector();
        double v31 = *MEMORY[0x1E4F1DB20];
        double v32 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v33 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v34 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        double height = v34;
        double width = v33;
        double y = v32;
        double x = *MEMORY[0x1E4F1DB20];
        if (v41)
        {
          [v39 _clippingRectInCoordinateSpace:v40];
          double x = v46;
          double y = v47;
          double width = v48;
          double height = v49;
        }
        v168.origin.double x = x;
        v168.origin.double y = y;
        v168.size.double width = width;
        v168.size.double height = height;
        if (!CGRectIsNull(v168) || [(NSMutableArray *)v38 count])
        {
          v50 = [v39 focusItemContainer];
          int IsScrollableContainer = _UIFocusItemContainerIsScrollableContainer(v50);
          long long buf = *MEMORY[0x1E4F1DAD8];
          if (IsScrollableContainer
            && [v132 _isScrollingScrollableContainer:v50 targetContentOffset:&buf])
          {
            id v52 = v50;
            [v52 contentOffset];
            double v54 = v53;
            double v56 = v55;
            [v52 visibleSize];
            double v58 = v57;
            double v60 = v59;
            v61 = [v52 coordinateSpace];
            objc_msgSend(v61, "convertRect:toCoordinateSpace:", v40, v54, v56, v58, v60);
            CGFloat v130 = v63;
            CGFloat v131 = v62;
            CGFloat v128 = v65;
            CGFloat v129 = v64;

            v169.origin.double x = x;
            v169.origin.double y = y;
            v169.size.double width = width;
            v169.size.double height = height;
            if (CGRectIsNull(v169))
            {
              double x = v131;
              double y = v130;
              double width = v129;
              double height = v128;
            }
            if ([(NSMutableArray *)v38 count])
            {
              v66 = [(NSMutableArray *)v38 lastObject];
              [v66 clippingRect];
              CGFloat v68 = v67;
              CGFloat v70 = v69;
              CGFloat v72 = v71;
              CGFloat v74 = v73;

              v170.origin.double x = v68;
              v170.origin.double y = v70;
              v170.size.double width = v72;
              v170.size.double height = v74;
              if (!CGRectIsNull(v170))
              {
                v171.origin.double x = x;
                v171.origin.double y = y;
                v171.size.double width = width;
                v171.size.double height = height;
                v190.origin.double x = v68;
                v190.origin.double y = v70;
                v190.size.double width = v72;
                v190.size.double height = v74;
                CGRect v172 = CGRectIntersection(v171, v190);
                double x = v172.origin.x;
                double y = v172.origin.y;
                double width = v172.size.width;
                double height = v172.size.height;
              }
            }
            v173.origin.double x = x;
            v173.origin.double y = y;
            v173.size.double width = width;
            v173.size.double height = height;
            double MinY = CGRectGetMinY(v173);
            v174.origin.double y = v130;
            v174.origin.double x = v131;
            v174.size.double height = v128;
            v174.size.double width = v129;
            double v126 = CGRectGetMinY(v174);
            v175.origin.double x = x;
            v175.origin.double y = y;
            v175.size.double width = width;
            v175.size.double height = height;
            double MinX = CGRectGetMinX(v175);
            v176.origin.double y = v130;
            v176.origin.double x = v131;
            v176.size.double height = v128;
            v176.size.double width = v129;
            double v75 = CGRectGetMinX(v176);
            v177.origin.double y = v130;
            v177.origin.double x = v131;
            v177.size.double height = v128;
            v177.size.double width = v129;
            double MaxY = CGRectGetMaxY(v177);
            v178.origin.double x = x;
            v178.origin.double y = y;
            v178.size.double width = width;
            v178.size.double height = height;
            double v77 = CGRectGetMaxY(v178);
            v179.origin.double y = v130;
            v179.origin.double x = v131;
            v179.size.double height = v128;
            v179.size.double width = v129;
            double MaxX = CGRectGetMaxX(v179);
            v180.origin.double x = x;
            v180.origin.double y = y;
            v180.size.double width = width;
            v180.size.double height = height;
            double v79 = MaxX - CGRectGetMaxX(v180);
            if (MinY - v126 >= 0.0) {
              double v80 = MinY - v126;
            }
            else {
              double v80 = 0.0;
            }
            if (MinX - v75 >= 0.0) {
              double v81 = MinX - v75;
            }
            else {
              double v81 = 0.0;
            }
            if (MaxY - v77 >= 0.0) {
              double v82 = MaxY - v77;
            }
            else {
              double v82 = 0.0;
            }
            if (v79 >= 0.0) {
              double v83 = v79;
            }
            else {
              double v83 = 0.0;
            }
            double v85 = *((double *)&buf + 1);
            double v84 = *(double *)&buf;
            [v52 visibleSize];
            double v87 = v86;
            double v89 = v88;
            v90 = [v52 coordinateSpace];
            objc_msgSend(v90, "convertRect:toCoordinateSpace:", v40, v84, v85, v87, v89);
            CGFloat v92 = v91;
            CGFloat v94 = v93;
            CGFloat v96 = v95;
            CGFloat v98 = v97;

            v181.origin.double y = v130;
            v181.origin.double x = v131;
            v181.size.double height = v128;
            v181.size.double width = v129;
            v191.origin.double x = v92;
            v191.origin.double y = v94;
            v191.size.double width = v96;
            v191.size.double height = v98;
            CGRect v182 = CGRectUnion(v181, v191);
            double v31 = v81 + v182.origin.x;
            double v32 = v80 + v182.origin.y;
            double v33 = v182.size.width - (v81 + v83);
            double v34 = v182.size.height - (v80 + v82);
            v182.origin.double x = v81 + v182.origin.x;
            v182.origin.double y = v80 + v182.origin.y;
            v182.size.double width = v33;
            v182.size.double height = v34;
            if (CGRectIsNull(v182))
            {
              double v31 = *MEMORY[0x1E4F1DB28];
              double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
              double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
              double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
            }
          }
          else
          {
            v183.origin.double x = x;
            v183.origin.double y = y;
            v183.size.double width = width;
            v183.size.double height = height;
            if (CGRectIsNull(v183))
            {
              v99 = [(NSMutableArray *)v38 lastObject];
              [v99 clippingRect];
              double v31 = v100;
              double v32 = v101;
              double v33 = v102;
              double v34 = v103;
            }
            else
            {
              if ([(NSMutableArray *)v38 count])
              {
                v104 = [(NSMutableArray *)v38 lastObject];
                [v104 clippingRect];
                CGFloat v106 = v105;
                CGFloat v108 = v107;
                CGFloat v110 = v109;
                CGFloat v112 = v111;

                v184.origin.double x = v106;
                v184.origin.double y = v108;
                v184.size.double width = v110;
                v184.size.double height = v112;
                if (!CGRectIsNull(v184))
                {
                  v185.origin.double x = x;
                  v185.origin.double y = y;
                  v185.size.double width = width;
                  v185.size.double height = height;
                  v192.origin.double x = v106;
                  v192.origin.double y = v108;
                  v192.size.double width = v110;
                  v192.size.double height = v112;
                  CGRect v186 = CGRectIntersection(v185, v192);
                  double x = v186.origin.x;
                  double y = v186.origin.y;
                  double width = v186.size.width;
                  double height = v186.size.height;
                }
              }
              double v31 = x;
              double v32 = y;
              double v33 = width;
              double v34 = height;
              v187.origin.double x = x;
              v187.origin.double y = y;
              v187.size.double width = width;
              v187.size.double height = height;
              if (CGRectIsNull(v187))
              {
                double v31 = *MEMORY[0x1E4F1DB28];
                double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
                double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
                double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
              }
            }
          }
        }
        goto LABEL_75;
      }
    }
    v120 = [MEMORY[0x1E4F28B00] currentHandler];
    v121 = objc_msgSend(NSString, "stringWithUTF8String:", "UIFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_UIFocusRegionContainer>, NSHashTable<id<UIFocusEnvironment>> *__strong, NSHashTable<id<UIFocusEnvironment>> *__strong, NSArray<_UIFocusRegionSearchContextState *> *__strong)");
    [v120 handleFailureInFunction:v121, @"_UIFocusMapSnapshot.m", 35, @"Invalid parameter not satisfying: %@", @"eligibleEnvironments" file lineNumber description];

    if (v17) {
      goto LABEL_14;
    }
    goto LABEL_86;
  }
  uint64_t v9 = NSString;
  uint64_t v10 = [v7 debugDescription];
  id v11 = [v9 stringWithFormat:@"Ignoring attempt to add focus items in already-visited container. This can potentially cause infinite recursion.\nContainer: %@", v10];

  if (dyld_program_sdk_at_least())
  {
    if (os_variant_has_internal_diagnostics())
    {
      v124 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_fault_impl(&dword_1853B0000, v124, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      long long v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2605A8) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
LABEL_10:
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    if (*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2605B0))
    {
      long long v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2605B8) + 8);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_83;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      goto LABEL_10;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45___UIFocusMapSnapshot_addRegionsInContainer___block_invoke;
    block[3] = &unk_1E52D9F70;
    id v11 = v11;
    id v139 = v11;
    if (qword_1EB2605C0 != -1) {
      dispatch_once(&qword_1EB2605C0, block);
    }
  }
LABEL_83:
}

- (void)addRegionsInContainers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshot.m", 551, @"Invalid parameter not satisfying: %@", @"containers" object file lineNumber description];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(_UIFocusMapSnapshot *)self addRegionsInContainer:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (UIFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (UIFocusSystem *)WeakRetained;
}

- (_UIFocusRegionContainer)rootContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootContainer);
  return (_UIFocusRegionContainer *)WeakRetained;
}

- (_UIFocusMapRect)mapArea
{
  return self->_mapArea;
}

- (_UIFocusRegion)focusedRegion
{
  return self->_focusedRegion;
}

- (_UIFocusRegionContainer)regionsContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_regionsContainer);
  return (_UIFocusRegionContainer *)WeakRetained;
}

- (_UIFocusSearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
}

- (_UIFocusMovementInfo)movementInfo
{
  return self->_movementInfo;
}

- (void)setMovementInfo:(id)a3
{
}

- (_UIFocusMapRect)_searchArea
{
  return self->_searchArea;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchArea, 0);
  objc_storeStrong((id *)&self->_movementInfo, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_destroyWeak((id *)&self->_regionsContainer);
  objc_storeStrong((id *)&self->_focusedRegion, 0);
  objc_storeStrong((id *)&self->_mapArea, 0);
  objc_destroyWeak((id *)&self->_rootContainer);
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_storeStrong((id *)&self->_visitedRegionContainers, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_uncachableEnvironments, 0);
  objc_storeStrong((id *)&self->_ineligibleEnvironments, 0);
  objc_storeStrong((id *)&self->_eligibleEnvironments, 0);
  objc_storeStrong((id *)&self->_stateStack, 0);
  objc_storeStrong((id *)&self->_filteredOriginalRegions, 0);
  objc_storeStrong((id *)&self->_mutableUnoccludedRegions, 0);
}

@end