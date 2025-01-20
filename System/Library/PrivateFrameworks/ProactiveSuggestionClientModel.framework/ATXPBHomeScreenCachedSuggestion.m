@interface ATXPBHomeScreenCachedSuggestion
+ (uint64_t)cachedSuggestedWidgetLayoutListsType;
+ (uint64_t)cachedSuggestionWidgetIdsType;
+ (uint64_t)cachedSuggestionWidgetLayoutsType;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)cachedAppPredictionPanelIdsAtIndex:(id *)a1;
- (id)cachedAppPredictionPanelLayoutsAtIndex:(id *)a1;
- (id)cachedSuggestedWidgetLayoutListKeysAtIndex:(id *)a1;
- (id)cachedSuggestedWidgetLayoutListsAtIndex:(id *)a1;
- (id)cachedSuggestionWidgetIdsAtIndex:(id *)a1;
- (id)cachedSuggestionWidgetLayoutsAtIndex:(id *)a1;
- (id)cachedTopOfStackLayoutKeysAtIndex:(id *)a1;
- (id)cachedTopOfStackLayoutsAtIndex:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fallbackSuggestionsAtIndex:(id *)a1;
- (uint64_t)addCachedAppPredictionPanelIds:(uint64_t)a1;
- (uint64_t)addCachedAppPredictionPanelLayouts:(uint64_t)a1;
- (uint64_t)addCachedSuggestedWidgetLayoutListKeys:(uint64_t)a1;
- (uint64_t)addCachedSuggestedWidgetLayoutLists:(uint64_t)a1;
- (uint64_t)addCachedSuggestionWidgetIds:(uint64_t)a1;
- (uint64_t)addCachedSuggestionWidgetLayouts:(uint64_t)a1;
- (uint64_t)addCachedTopOfStackLayoutKeys:(uint64_t)a1;
- (uint64_t)addCachedTopOfStackLayouts:(uint64_t)a1;
- (uint64_t)addFallbackSuggestions:(uint64_t)a1;
- (uint64_t)cachedAppPredictionPanelIds;
- (uint64_t)cachedAppPredictionPanelIdsCount;
- (uint64_t)cachedAppPredictionPanelLayouts;
- (uint64_t)cachedAppPredictionPanelLayoutsCount;
- (uint64_t)cachedSuggestedWidgetLayoutListKeys;
- (uint64_t)cachedSuggestedWidgetLayoutListKeysCount;
- (uint64_t)cachedSuggestedWidgetLayoutLists;
- (uint64_t)cachedSuggestedWidgetLayoutListsCount;
- (uint64_t)cachedSuggestionWidgetIds;
- (uint64_t)cachedSuggestionWidgetIdsCount;
- (uint64_t)cachedSuggestionWidgetLayouts;
- (uint64_t)cachedSuggestionWidgetLayoutsCount;
- (uint64_t)cachedTopOfStackLayoutKeys;
- (uint64_t)cachedTopOfStackLayoutKeysCount;
- (uint64_t)cachedTopOfStackLayouts;
- (uint64_t)cachedTopOfStackLayoutsCount;
- (uint64_t)clearCachedAppPredictionPanelIds;
- (uint64_t)clearCachedAppPredictionPanelLayouts;
- (uint64_t)clearCachedSuggestedWidgetLayoutListKeys;
- (uint64_t)clearCachedSuggestedWidgetLayoutLists;
- (uint64_t)clearCachedSuggestionWidgetIds;
- (uint64_t)clearCachedSuggestionWidgetLayouts;
- (uint64_t)clearCachedTopOfStackLayoutKeys;
- (uint64_t)clearCachedTopOfStackLayouts;
- (uint64_t)clearFallbackSuggestions;
- (uint64_t)fallbackSuggestions;
- (uint64_t)fallbackSuggestionsCount;
- (uint64_t)uuidString;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setCachedAppPredictionPanelIds:(uint64_t)a1;
- (void)setCachedAppPredictionPanelLayouts:(uint64_t)a1;
- (void)setCachedSuggestedWidgetLayoutListKeys:(uint64_t)a1;
- (void)setCachedSuggestedWidgetLayoutLists:(uint64_t)a1;
- (void)setCachedSuggestionWidgetIds:(uint64_t)a1;
- (void)setCachedSuggestionWidgetLayouts:(uint64_t)a1;
- (void)setCachedTopOfStackLayoutKeys:(uint64_t)a1;
- (void)setCachedTopOfStackLayouts:(uint64_t)a1;
- (void)setFallbackSuggestions:(uint64_t)a1;
- (void)setUuidString:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBHomeScreenCachedSuggestion

- (BOOL)hasUuidString
{
  if (result) {
    return *(void *)(result + 80) != 0;
  }
  return result;
}

- (uint64_t)clearCachedSuggestionWidgetIds
{
  if (result) {
    return [*(id *)(result + 40) removeAllObjects];
  }
  return result;
}

- (uint64_t)addCachedSuggestionWidgetIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 40);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v6;

      v5 = *(void **)(a1 + 40);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)cachedSuggestionWidgetIdsCount
{
  if (result) {
    return [*(id *)(result + 40) count];
  }
  return result;
}

- (id)cachedSuggestionWidgetIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[5] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)cachedSuggestionWidgetIdsType
{
  self;
  return objc_opt_class();
}

- (uint64_t)clearCachedSuggestionWidgetLayouts
{
  if (result) {
    return [*(id *)(result + 48) removeAllObjects];
  }
  return result;
}

- (uint64_t)addCachedSuggestionWidgetLayouts:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 48);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v6;

      v5 = *(void **)(a1 + 48);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)cachedSuggestionWidgetLayoutsCount
{
  if (result) {
    return [*(id *)(result + 48) count];
  }
  return result;
}

- (id)cachedSuggestionWidgetLayoutsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[6] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)cachedSuggestionWidgetLayoutsType
{
  self;
  return objc_opt_class();
}

- (uint64_t)clearCachedTopOfStackLayoutKeys
{
  if (result) {
    return [*(id *)(result + 56) removeAllObjects];
  }
  return result;
}

- (uint64_t)addCachedTopOfStackLayoutKeys:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 56);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v6;

      v5 = *(void **)(a1 + 56);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)cachedTopOfStackLayoutKeysCount
{
  if (result) {
    return [*(id *)(result + 56) count];
  }
  return result;
}

- (id)cachedTopOfStackLayoutKeysAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[7] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearCachedTopOfStackLayouts
{
  if (result) {
    return [*(id *)(result + 64) removeAllObjects];
  }
  return result;
}

- (uint64_t)addCachedTopOfStackLayouts:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 64);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v6;

      v5 = *(void **)(a1 + 64);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)cachedTopOfStackLayoutsCount
{
  if (result) {
    return [*(id *)(result + 64) count];
  }
  return result;
}

- (id)cachedTopOfStackLayoutsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[8] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearFallbackSuggestions
{
  if (result) {
    return [*(id *)(result + 72) removeAllObjects];
  }
  return result;
}

- (uint64_t)addFallbackSuggestions:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 72);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v6;

      v5 = *(void **)(a1 + 72);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)fallbackSuggestionsCount
{
  if (result) {
    return [*(id *)(result + 72) count];
  }
  return result;
}

- (id)fallbackSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[9] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearCachedAppPredictionPanelIds
{
  if (result) {
    return [*(id *)(result + 8) removeAllObjects];
  }
  return result;
}

- (uint64_t)addCachedAppPredictionPanelIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 8);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v6;

      v5 = *(void **)(a1 + 8);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)cachedAppPredictionPanelIdsCount
{
  if (result) {
    return [*(id *)(result + 8) count];
  }
  return result;
}

- (id)cachedAppPredictionPanelIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[1] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearCachedAppPredictionPanelLayouts
{
  if (result) {
    return [*(id *)(result + 16) removeAllObjects];
  }
  return result;
}

- (uint64_t)addCachedAppPredictionPanelLayouts:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 16);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v6;

      v5 = *(void **)(a1 + 16);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)cachedAppPredictionPanelLayoutsCount
{
  if (result) {
    return [*(id *)(result + 16) count];
  }
  return result;
}

- (id)cachedAppPredictionPanelLayoutsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[2] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearCachedSuggestedWidgetLayoutListKeys
{
  if (result) {
    return [*(id *)(result + 24) removeAllObjects];
  }
  return result;
}

- (uint64_t)addCachedSuggestedWidgetLayoutListKeys:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 24);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      v5 = *(void **)(a1 + 24);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)cachedSuggestedWidgetLayoutListKeysCount
{
  if (result) {
    return [*(id *)(result + 24) count];
  }
  return result;
}

- (id)cachedSuggestedWidgetLayoutListKeysAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[3] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearCachedSuggestedWidgetLayoutLists
{
  if (result) {
    return [*(id *)(result + 32) removeAllObjects];
  }
  return result;
}

- (uint64_t)addCachedSuggestedWidgetLayoutLists:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      v5 = *(void **)(a1 + 32);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)cachedSuggestedWidgetLayoutListsCount
{
  if (result) {
    return [*(id *)(result + 32) count];
  }
  return result;
}

- (id)cachedSuggestedWidgetLayoutListsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[4] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)cachedSuggestedWidgetLayoutListsType
{
  self;
  return objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBHomeScreenCachedSuggestion;
  id v4 = [(ATXPBHomeScreenCachedSuggestion *)&v8 description];
  v5 = [(ATXPBHomeScreenCachedSuggestion *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString) {
    [v3 setObject:uuidString forKey:@"uuidString"];
  }
  cachedSuggestionWidgetIds = self->_cachedSuggestionWidgetIds;
  if (cachedSuggestionWidgetIds) {
    [v4 setObject:cachedSuggestionWidgetIds forKey:@"cachedSuggestionWidgetIds"];
  }
  if ([(NSMutableArray *)self->_cachedSuggestionWidgetLayouts count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_cachedSuggestionWidgetLayouts, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    objc_super v8 = self->_cachedSuggestionWidgetLayouts;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v63 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v62 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"cachedSuggestionWidgetLayouts"];
  }
  cachedTopOfStackLayoutKeys = self->_cachedTopOfStackLayoutKeys;
  if (cachedTopOfStackLayoutKeys) {
    [v4 setObject:cachedTopOfStackLayoutKeys forKey:@"cachedTopOfStackLayoutKeys"];
  }
  if ([(NSMutableArray *)self->_cachedTopOfStackLayouts count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_cachedTopOfStackLayouts, "count"));
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v16 = self->_cachedTopOfStackLayouts;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v59 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v58 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v69 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"cachedTopOfStackLayouts"];
  }
  if ([(NSMutableArray *)self->_fallbackSuggestions count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_fallbackSuggestions, "count"));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v23 = self->_fallbackSuggestions;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v55 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v54 + 1) + 8 * k) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v54 objects:v68 count:16];
      }
      while (v25);
    }

    [v4 setObject:v22 forKey:@"fallbackSuggestions"];
  }
  cachedAppPredictionPanelIds = self->_cachedAppPredictionPanelIds;
  if (cachedAppPredictionPanelIds) {
    [v4 setObject:cachedAppPredictionPanelIds forKey:@"cachedAppPredictionPanelIds"];
  }
  if ([(NSMutableArray *)self->_cachedAppPredictionPanelLayouts count])
  {
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_cachedAppPredictionPanelLayouts, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v31 = self->_cachedAppPredictionPanelLayouts;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v50 objects:v67 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v51;
      do
      {
        for (uint64_t m = 0; m != v33; ++m)
        {
          if (*(void *)v51 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = [*(id *)(*((void *)&v50 + 1) + 8 * m) dictionaryRepresentation];
          [v30 addObject:v36];
        }
        uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v50 objects:v67 count:16];
      }
      while (v33);
    }

    [v4 setObject:v30 forKey:@"cachedAppPredictionPanelLayouts"];
  }
  cachedSuggestedWidgetLayoutListKeys = self->_cachedSuggestedWidgetLayoutListKeys;
  if (cachedSuggestedWidgetLayoutListKeys) {
    [v4 setObject:cachedSuggestedWidgetLayoutListKeys forKey:@"cachedSuggestedWidgetLayoutListKeys"];
  }
  if ([(NSMutableArray *)self->_cachedSuggestedWidgetLayoutLists count])
  {
    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_cachedSuggestedWidgetLayoutLists, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v39 = self->_cachedSuggestedWidgetLayoutLists;
    uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v46 objects:v66 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v47;
      do
      {
        for (uint64_t n = 0; n != v41; ++n)
        {
          if (*(void *)v47 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * n), "dictionaryRepresentation", (void)v46);
          [v38 addObject:v44];
        }
        uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v46 objects:v66 count:16];
      }
      while (v41);
    }

    [v4 setObject:v38 forKey:@"cachedSuggestedWidgetLayoutLists"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBHomeScreenCachedSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuidString) {
    PBDataWriterWriteStringField();
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v5 = self->_cachedSuggestionWidgetIds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v82 objects:v94 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v83;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v83 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v82 objects:v94 count:16];
    }
    while (v7);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v10 = self->_cachedSuggestionWidgetLayouts;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v78 objects:v93 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v79;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v79 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v78 objects:v93 count:16];
    }
    while (v12);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v15 = self->_cachedTopOfStackLayoutKeys;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v74 objects:v92 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v75;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v75 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v74 objects:v92 count:16];
    }
    while (v17);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v20 = self->_cachedTopOfStackLayouts;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v70 objects:v91 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v71;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v71 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v70 objects:v91 count:16];
    }
    while (v22);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v25 = self->_fallbackSuggestions;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v66 objects:v90 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v67;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v67 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v66 objects:v90 count:16];
    }
    while (v27);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v30 = self->_cachedAppPredictionPanelIds;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v62 objects:v89 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v63;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v63 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteStringField();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v62 objects:v89 count:16];
    }
    while (v32);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v35 = self->_cachedAppPredictionPanelLayouts;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v58 objects:v88 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v59;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v58 objects:v88 count:16];
    }
    while (v37);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v40 = self->_cachedSuggestedWidgetLayoutListKeys;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v54 objects:v87 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v55;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v55 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteStringField();
        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v54 objects:v87 count:16];
    }
    while (v42);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v45 = self->_cachedSuggestedWidgetLayoutLists;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v50 objects:v86 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v51;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v51 != v48) {
          objc_enumerationMutation(v45);
        }
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v50 objects:v86 count:16];
    }
    while (v47);
  }
}

- (void)copyTo:(uint64_t)a1
{
  uint64_t v40 = a2;
  if (a1)
  {
    id v3 = *(void **)(a1 + 80);
    if (v3) {
      -[ATXPBHomeScreenCachedSuggestion setUuidString:]((uint64_t)v40, v3);
    }
    if ([*(id *)(a1 + 40) count])
    {
      if (v40) {
        [v40[5] removeAllObjects];
      }
      uint64_t v4 = [*(id *)(a1 + 40) count];
      if (v4)
      {
        uint64_t v5 = v4;
        for (uint64_t i = 0; i != v5; ++i)
        {
          uint64_t v7 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIdsAtIndex:]((id *)a1, i);
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetIds:]((uint64_t)v40, v7);
        }
      }
    }
    if ([*(id *)(a1 + 48) count])
    {
      if (v40) {
        [v40[6] removeAllObjects];
      }
      uint64_t v8 = [*(id *)(a1 + 48) count];
      if (v8)
      {
        uint64_t v9 = v8;
        for (uint64_t j = 0; j != v9; ++j)
        {
          uint64_t v11 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetLayoutsAtIndex:]((id *)a1, j);
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetLayouts:]((uint64_t)v40, v11);
        }
      }
    }
    if ([*(id *)(a1 + 56) count])
    {
      if (v40) {
        [v40[7] removeAllObjects];
      }
      uint64_t v12 = [*(id *)(a1 + 56) count];
      if (v12)
      {
        uint64_t v13 = v12;
        for (uint64_t k = 0; k != v13; ++k)
        {
          v15 = -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayoutKeysAtIndex:]((id *)a1, k);
          -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayoutKeys:]((uint64_t)v40, v15);
        }
      }
    }
    if ([*(id *)(a1 + 64) count])
    {
      if (v40) {
        [v40[8] removeAllObjects];
      }
      uint64_t v16 = [*(id *)(a1 + 64) count];
      if (v16)
      {
        uint64_t v17 = v16;
        for (uint64_t m = 0; m != v17; ++m)
        {
          uint64_t v19 = -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayoutsAtIndex:]((id *)a1, m);
          -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayouts:]((uint64_t)v40, v19);
        }
      }
    }
    if ([*(id *)(a1 + 72) count])
    {
      if (v40) {
        [v40[9] removeAllObjects];
      }
      uint64_t v20 = [*(id *)(a1 + 72) count];
      if (v20)
      {
        uint64_t v21 = v20;
        for (uint64_t n = 0; n != v21; ++n)
        {
          uint64_t v23 = -[ATXPBHomeScreenCachedSuggestion fallbackSuggestionsAtIndex:]((id *)a1, n);
          -[ATXPBHomeScreenCachedSuggestion addFallbackSuggestions:]((uint64_t)v40, v23);
        }
      }
    }
    if ([*(id *)(a1 + 8) count])
    {
      if (v40) {
        [v40[1] removeAllObjects];
      }
      uint64_t v24 = [*(id *)(a1 + 8) count];
      if (v24)
      {
        uint64_t v25 = v24;
        for (iuint64_t i = 0; ii != v25; ++ii)
        {
          uint64_t v27 = -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIdsAtIndex:]((id *)a1, ii);
          -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelIds:]((uint64_t)v40, v27);
        }
      }
    }
    if ([*(id *)(a1 + 16) count])
    {
      if (v40) {
        [v40[2] removeAllObjects];
      }
      uint64_t v28 = [*(id *)(a1 + 16) count];
      if (v28)
      {
        uint64_t v29 = v28;
        for (juint64_t j = 0; jj != v29; ++jj)
        {
          uint64_t v31 = -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelLayoutsAtIndex:]((id *)a1, jj);
          -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelLayouts:]((uint64_t)v40, v31);
        }
      }
    }
    if ([*(id *)(a1 + 24) count])
    {
      if (v40) {
        [v40[3] removeAllObjects];
      }
      uint64_t v32 = [*(id *)(a1 + 24) count];
      if (v32)
      {
        uint64_t v33 = v32;
        for (kuint64_t k = 0; kk != v33; ++kk)
        {
          v35 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutListKeysAtIndex:]((id *)a1, kk);
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutListKeys:]((uint64_t)v40, v35);
        }
      }
    }
    if ([*(id *)(a1 + 32) count])
    {
      if (v40) {
        [v40[4] removeAllObjects];
      }
      uint64_t v36 = [*(id *)(a1 + 32) count];
      if (v36)
      {
        uint64_t v37 = v36;
        for (muint64_t m = 0; mm != v37; ++mm)
        {
          uint64_t v39 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutListsAtIndex:]((id *)a1, mm);
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutLists:]((uint64_t)v40, v39);
        }
      }
    }
  }
}

- (void)setUuidString:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  uint64_t v7 = (void *)v5[10];
  v5[10] = v6;

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v8 = self->_cachedSuggestionWidgetIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v95 objects:v107 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v96;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v96 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v95 + 1) + 8 * v12) copyWithZone:a3];
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetIds:]((uint64_t)v5, v13);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v95 objects:v107 count:16];
    }
    while (v10);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v14 = self->_cachedSuggestionWidgetLayouts;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v91 objects:v106 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v92;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v92 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v91 + 1) + 8 * v18) copyWithZone:a3];
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetLayouts:]((uint64_t)v5, v19);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v91 objects:v106 count:16];
    }
    while (v16);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v20 = self->_cachedTopOfStackLayoutKeys;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v87 objects:v105 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v88;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v88 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v87 + 1) + 8 * v24) copyWithZone:a3];
        -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayoutKeys:]((uint64_t)v5, v25);

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v87 objects:v105 count:16];
    }
    while (v22);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v26 = self->_cachedTopOfStackLayouts;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v83 objects:v104 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v84;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v84 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = (void *)[*(id *)(*((void *)&v83 + 1) + 8 * v30) copyWithZone:a3];
        -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayouts:]((uint64_t)v5, v31);

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v83 objects:v104 count:16];
    }
    while (v28);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v32 = self->_fallbackSuggestions;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v79 objects:v103 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v80;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v80 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = (void *)[*(id *)(*((void *)&v79 + 1) + 8 * v36) copyWithZone:a3];
        -[ATXPBHomeScreenCachedSuggestion addFallbackSuggestions:]((uint64_t)v5, v37);

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v79 objects:v103 count:16];
    }
    while (v34);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v38 = self->_cachedAppPredictionPanelIds;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v75 objects:v102 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v76;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v76 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = (void *)[*(id *)(*((void *)&v75 + 1) + 8 * v42) copyWithZone:a3];
        -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelIds:]((uint64_t)v5, v43);

        ++v42;
      }
      while (v40 != v42);
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v75 objects:v102 count:16];
    }
    while (v40);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v44 = self->_cachedAppPredictionPanelLayouts;
  uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v71 objects:v101 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v72;
    do
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v72 != v47) {
          objc_enumerationMutation(v44);
        }
        uint64_t v49 = (void *)[*(id *)(*((void *)&v71 + 1) + 8 * v48) copyWithZone:a3];
        -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelLayouts:]((uint64_t)v5, v49);

        ++v48;
      }
      while (v46 != v48);
      uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v71 objects:v101 count:16];
    }
    while (v46);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v50 = self->_cachedSuggestedWidgetLayoutListKeys;
  uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v67 objects:v100 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v68;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v68 != v53) {
          objc_enumerationMutation(v50);
        }
        long long v55 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * v54) copyWithZone:a3];
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutListKeys:]((uint64_t)v5, v55);

        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v67 objects:v100 count:16];
    }
    while (v52);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v56 = self->_cachedSuggestedWidgetLayoutLists;
  uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v63 objects:v99 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v64;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v64 != v59) {
          objc_enumerationMutation(v56);
        }
        long long v61 = objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * v60), "copyWithZone:", a3, (void)v63);
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutLists:]((uint64_t)v5, v61);

        ++v60;
      }
      while (v58 != v60);
      uint64_t v58 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v63 objects:v99 count:16];
    }
    while (v58);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | v4[10])
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:")) {
      goto LABEL_22;
    }
  }
  cachedSuggestionWidgetIds = self->_cachedSuggestionWidgetIds;
  if ((unint64_t)cachedSuggestionWidgetIds | v4[5]
    && !-[NSMutableArray isEqual:](cachedSuggestionWidgetIds, "isEqual:"))
  {
    goto LABEL_22;
  }
  if (((cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts,
         !((unint64_t)cachedSuggestionWidgetLayouts | v4[6]))
     || -[NSMutableArray isEqual:](cachedSuggestionWidgetLayouts, "isEqual:"))
    && ((cachedTopOfStackLayoutKeys = self->_cachedTopOfStackLayoutKeys,
         !((unint64_t)cachedTopOfStackLayoutKeys | v4[7]))
     || -[NSMutableArray isEqual:](cachedTopOfStackLayoutKeys, "isEqual:"))
    && ((cachedTopOfStackLayouts = self->_cachedTopOfStackLayouts, !((unint64_t)cachedTopOfStackLayouts | v4[8]))
     || -[NSMutableArray isEqual:](cachedTopOfStackLayouts, "isEqual:"))
    && ((fallbackSuggestions = self->_fallbackSuggestions, !((unint64_t)fallbackSuggestions | v4[9]))
     || -[NSMutableArray isEqual:](fallbackSuggestions, "isEqual:"))
    && ((cachedAppPredictionPanelIds = self->_cachedAppPredictionPanelIds,
         !((unint64_t)cachedAppPredictionPanelIds | v4[1]))
     || -[NSMutableArray isEqual:](cachedAppPredictionPanelIds, "isEqual:"))
    && ((cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts,
         !((unint64_t)cachedAppPredictionPanelLayouts | v4[2]))
     || -[NSMutableArray isEqual:](cachedAppPredictionPanelLayouts, "isEqual:"))
    && ((cachedSuggestedWidgetLayoutListKeys = self->_cachedSuggestedWidgetLayoutListKeys,
         !((unint64_t)cachedSuggestedWidgetLayoutListKeys | v4[3]))
     || -[NSMutableArray isEqual:](cachedSuggestedWidgetLayoutListKeys, "isEqual:")))
  {
    cachedSuggestedWidgetLayoutLists = self->_cachedSuggestedWidgetLayoutLists;
    if ((unint64_t)cachedSuggestedWidgetLayoutLists | v4[4]) {
      char v15 = -[NSMutableArray isEqual:](cachedSuggestedWidgetLayoutLists, "isEqual:");
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
LABEL_22:
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  uint64_t v4 = [(NSMutableArray *)self->_cachedSuggestionWidgetIds hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_cachedSuggestionWidgetLayouts hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_cachedTopOfStackLayoutKeys hash];
  uint64_t v7 = [(NSMutableArray *)self->_cachedTopOfStackLayouts hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_fallbackSuggestions hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_cachedAppPredictionPanelIds hash];
  uint64_t v10 = [(NSMutableArray *)self->_cachedAppPredictionPanelLayouts hash];
  uint64_t v11 = v10 ^ [(NSMutableArray *)self->_cachedSuggestedWidgetLayoutListKeys hash];
  return v9 ^ v11 ^ [(NSMutableArray *)self->_cachedSuggestedWidgetLayoutLists hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = v3[10];
    if (v5) {
      objc_storeStrong((id *)(a1 + 80), v5);
    }
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v6 = v4[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v83 objects:v95 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v84;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v84 != v9) {
            objc_enumerationMutation(v6);
          }
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetIds:](a1, *(void **)(*((void *)&v83 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v83 objects:v95 count:16];
      }
      while (v8);
    }

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v11 = v4[6];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v79 objects:v94 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v80;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v80 != v14) {
            objc_enumerationMutation(v11);
          }
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetLayouts:](a1, *(void **)(*((void *)&v79 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v79 objects:v94 count:16];
      }
      while (v13);
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v16 = v4[7];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v75 objects:v93 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v76;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v76 != v19) {
            objc_enumerationMutation(v16);
          }
          -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayoutKeys:](a1, *(void **)(*((void *)&v75 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v75 objects:v93 count:16];
      }
      while (v18);
    }

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v21 = v4[8];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v71 objects:v92 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v72;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v72 != v24) {
            objc_enumerationMutation(v21);
          }
          -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayouts:](a1, *(void **)(*((void *)&v71 + 1) + 8 * v25++));
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v71 objects:v92 count:16];
      }
      while (v23);
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v26 = v4[9];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v67 objects:v91 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v68;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v68 != v29) {
            objc_enumerationMutation(v26);
          }
          -[ATXPBHomeScreenCachedSuggestion addFallbackSuggestions:](a1, *(void **)(*((void *)&v67 + 1) + 8 * v30++));
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v67 objects:v91 count:16];
      }
      while (v28);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v31 = v4[1];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v63 objects:v90 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v64;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v64 != v34) {
            objc_enumerationMutation(v31);
          }
          -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelIds:](a1, *(void **)(*((void *)&v63 + 1) + 8 * v35++));
        }
        while (v33 != v35);
        uint64_t v33 = [v31 countByEnumeratingWithState:&v63 objects:v90 count:16];
      }
      while (v33);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v36 = v4[2];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v59 objects:v89 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v60;
      do
      {
        uint64_t v40 = 0;
        do
        {
          if (*(void *)v60 != v39) {
            objc_enumerationMutation(v36);
          }
          -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelLayouts:](a1, *(void **)(*((void *)&v59 + 1) + 8 * v40++));
        }
        while (v38 != v40);
        uint64_t v38 = [v36 countByEnumeratingWithState:&v59 objects:v89 count:16];
      }
      while (v38);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v41 = v4[3];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v88 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v56;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v56 != v44) {
            objc_enumerationMutation(v41);
          }
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutListKeys:](a1, *(void **)(*((void *)&v55 + 1) + 8 * v45++));
        }
        while (v43 != v45);
        uint64_t v43 = [v41 countByEnumeratingWithState:&v55 objects:v88 count:16];
      }
      while (v43);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v46 = v4[4];
    uint64_t v47 = [v46 countByEnumeratingWithState:&v51 objects:v87 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v52;
      do
      {
        uint64_t v50 = 0;
        do
        {
          if (*(void *)v52 != v49) {
            objc_enumerationMutation(v46);
          }
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutLists:](a1, *(void **)(*((void *)&v51 + 1) + 8 * v50++));
        }
        while (v48 != v50);
        uint64_t v48 = [v46 countByEnumeratingWithState:&v51 objects:v87 count:16];
      }
      while (v48);
    }
  }
}

- (uint64_t)uuidString
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (uint64_t)cachedSuggestionWidgetIds
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (void)setCachedSuggestionWidgetIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (uint64_t)cachedSuggestionWidgetLayouts
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (void)setCachedSuggestionWidgetLayouts:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (uint64_t)cachedTopOfStackLayoutKeys
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (void)setCachedTopOfStackLayoutKeys:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (uint64_t)cachedTopOfStackLayouts
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (void)setCachedTopOfStackLayouts:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (uint64_t)fallbackSuggestions
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (void)setFallbackSuggestions:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (uint64_t)cachedAppPredictionPanelIds
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void)setCachedAppPredictionPanelIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (uint64_t)cachedAppPredictionPanelLayouts
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)setCachedAppPredictionPanelLayouts:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (uint64_t)cachedSuggestedWidgetLayoutListKeys
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setCachedSuggestedWidgetLayoutListKeys:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (uint64_t)cachedSuggestedWidgetLayoutLists
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void)setCachedSuggestedWidgetLayoutLists:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_fallbackSuggestions, 0);
  objc_storeStrong((id *)&self->_cachedTopOfStackLayouts, 0);
  objc_storeStrong((id *)&self->_cachedTopOfStackLayoutKeys, 0);
  objc_storeStrong((id *)&self->_cachedSuggestionWidgetLayouts, 0);
  objc_storeStrong((id *)&self->_cachedSuggestionWidgetIds, 0);
  objc_storeStrong((id *)&self->_cachedSuggestedWidgetLayoutLists, 0);
  objc_storeStrong((id *)&self->_cachedSuggestedWidgetLayoutListKeys, 0);
  objc_storeStrong((id *)&self->_cachedAppPredictionPanelLayouts, 0);
  objc_storeStrong((id *)&self->_cachedAppPredictionPanelIds, 0);
}

@end