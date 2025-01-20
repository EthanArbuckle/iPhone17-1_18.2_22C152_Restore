@interface ATXHomeScreenCachedSuggestions
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenCachedSuggestions)initWithCoder:(id)a3;
- (ATXHomeScreenCachedSuggestions)initWithProto:(id)a3;
- (ATXHomeScreenCachedSuggestions)initWithProtoData:(id)a3;
- (ATXHomeScreenCachedSuggestions)initWithUUID:(id)a3 suggestionWidgetLayouts:(id)a4 appPredictionPanelLayouts:(id)a5 topOfStackLayouts:(id)a6 suggestedWidgetLayouts:(id)a7 fallbackSuggestions:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSArray)fallbackSuggestions;
- (NSDictionary)cachedAppPredictionPanelLayouts;
- (NSDictionary)cachedSuggestedWidgetsLayouts;
- (NSDictionary)cachedSuggestionWidgetLayouts;
- (NSDictionary)cachedTopOfStackLayouts;
- (NSString)description;
- (NSUUID)uuid;
- (id)_jsonRawDataForLayoutListMapping:(id)a3;
- (id)_jsonRawDataForWidgetLayoutMapping:(id)a3;
- (id)_layoutDictionaryWithKeys:(id)a3 protoLayouts:(id)a4;
- (id)_layoutListDictionaryWithKeys:(id)a3 protoLayoutLists:(id)a4;
- (id)_protoLayoutListsFromLayoutListDictionary:(id)a3 orderedByKeys:(id)a4;
- (id)_protoLayoutsFromLayoutDictionary:(id)a3 orderedByKeys:(id)a4;
- (id)allSuggestionsInCachedSuggestions;
- (id)compactDescription;
- (id)descriptionWithoutPreviews;
- (id)encodeAsProto;
- (id)jsonRawData;
- (id)minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks;
- (id)proto;
- (id)protoForBiome;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation ATXHomeScreenCachedSuggestions

- (ATXHomeScreenCachedSuggestions)initWithUUID:(id)a3 suggestionWidgetLayouts:(id)a4 appPredictionPanelLayouts:(id)a5 topOfStackLayouts:(id)a6 suggestedWidgetLayouts:(id)a7 fallbackSuggestions:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)ATXHomeScreenCachedSuggestions;
  v20 = [(ATXHomeScreenCachedSuggestions *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v21;

    uint64_t v23 = [v15 copy];
    cachedSuggestionWidgetLayouts = v20->_cachedSuggestionWidgetLayouts;
    v20->_cachedSuggestionWidgetLayouts = (NSDictionary *)v23;

    uint64_t v25 = [v16 copy];
    cachedAppPredictionPanelLayouts = v20->_cachedAppPredictionPanelLayouts;
    v20->_cachedAppPredictionPanelLayouts = (NSDictionary *)v25;

    uint64_t v27 = [v17 copy];
    cachedTopOfStackLayouts = v20->_cachedTopOfStackLayouts;
    v20->_cachedTopOfStackLayouts = (NSDictionary *)v27;

    uint64_t v29 = [v18 copy];
    cachedSuggestedWidgetsLayouts = v20->_cachedSuggestedWidgetsLayouts;
    v20->_cachedSuggestedWidgetsLayouts = (NSDictionary *)v29;

    uint64_t v31 = [v19 copy];
    fallbackSuggestions = v20->_fallbackSuggestions;
    v20->_fallbackSuggestions = (NSArray *)v31;
  }
  return v20;
}

- (id)allSuggestionsInCachedSuggestions
{
  v3 = objc_opt_new();
  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke;
  v23[3] = &unk_1E5F01288;
  id v5 = v3;
  id v24 = v5;
  [(NSDictionary *)cachedSuggestionWidgetLayouts enumerateKeysAndObjectsUsingBlock:v23];
  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_2;
  v21[3] = &unk_1E5F01288;
  id v7 = v5;
  id v22 = v7;
  [(NSDictionary *)cachedAppPredictionPanelLayouts enumerateKeysAndObjectsUsingBlock:v21];
  cachedTopOfStackLayouts = self->_cachedTopOfStackLayouts;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_3;
  v19[3] = &unk_1E5F01288;
  id v9 = v7;
  id v20 = v9;
  [(NSDictionary *)cachedTopOfStackLayouts enumerateKeysAndObjectsUsingBlock:v19];
  cachedSuggestedWidgetsLayouts = self->_cachedSuggestedWidgetsLayouts;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_4;
  id v17 = &unk_1E5F012B0;
  id v18 = v9;
  id v11 = v9;
  [(NSDictionary *)cachedSuggestedWidgetsLayouts enumerateKeysAndObjectsUsingBlock:&v14];
  objc_msgSend(v11, "addObjectsFromArray:", self->_fallbackSuggestions, v14, v15, v16, v17);
  v12 = (void *)[v11 copy];

  return v12;
}

void __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a3 allSuggestionsInLayout];
  [v3 addObjectsFromArray:v4];
}

void __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a3 allSuggestionsInLayout];
  [v3 addObjectsFromArray:v4];
}

void __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a3 allSuggestionsInLayout];
  [v3 addObjectsFromArray:v4];
}

void __67__ATXHomeScreenCachedSuggestions_allSuggestionsInCachedSuggestions__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(a1 + 32);
        v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) allSuggestionsInLayout];
        [v9 addObjectsFromArray:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks
{
  v3 = objc_opt_new();
  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke;
  v23[3] = &unk_1E5F01288;
  id v5 = v3;
  id v24 = v5;
  [(NSDictionary *)cachedSuggestionWidgetLayouts enumerateKeysAndObjectsUsingBlock:v23];
  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_2;
  v21[3] = &unk_1E5F01288;
  id v7 = v5;
  id v22 = v7;
  [(NSDictionary *)cachedAppPredictionPanelLayouts enumerateKeysAndObjectsUsingBlock:v21];
  cachedTopOfStackLayouts = self->_cachedTopOfStackLayouts;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_3;
  v19[3] = &unk_1E5F01288;
  id v9 = v7;
  id v20 = v9;
  [(NSDictionary *)cachedTopOfStackLayouts enumerateKeysAndObjectsUsingBlock:v19];
  cachedSuggestedWidgetsLayouts = self->_cachedSuggestedWidgetsLayouts;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_4;
  id v17 = &unk_1E5F012B0;
  id v18 = v9;
  id v11 = v9;
  [(NSDictionary *)cachedSuggestedWidgetsLayouts enumerateKeysAndObjectsUsingBlock:&v14];
  long long v12 = objc_msgSend(v11, "copy", v14, v15, v16, v17);

  return v12;
}

void __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([v8 isEqualToString:*MEMORY[0x1E4F4B600]] & 1) == 0
    && ([v8 isEqualToString:*MEMORY[0x1E4F4B608]] & 1) == 0
    && ([v8 isEqualToString:*MEMORY[0x1E4F4B610]] & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [v5 minSuggestionListInLayout];
    [v6 addObjectsFromArray:v7];
  }
}

void __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (([a2 isEqualToString:*MEMORY[0x1E4F4B598]] & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v7 minSuggestionListInLayout];
    [v5 addObjectsFromArray:v6];
  }
}

void __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a3 minSuggestionListInLayout];
  [v3 addObjectsFromArray:v4];
}

void __93__ATXHomeScreenCachedSuggestions_minSuggestionsInCachedSuggestionsWithoutPreviewsOrFallbacks__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(a1 + 32);
        v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) minSuggestionListInLayout];
        [v9 addObjectsFromArray:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXHomeScreenCachedSuggestions *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(ATXHomeScreenCachedSuggestions *)self uuid];
      uint64_t v7 = [(ATXHomeScreenCachedSuggestions *)v5 uuid];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)compactDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  [v3 appendFormat:@"\n\n=== HomeScreenCachedSuggestions (ID: %@) ===\n", v4];

  [v3 appendString:@"\n1. Layouts For Suggestion Widgets\n"]);
  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __45__ATXHomeScreenCachedSuggestions_description__block_invoke;
  v40[3] = &unk_1E5F01288;
  id v6 = v3;
  id v41 = v6;
  [(NSDictionary *)cachedSuggestionWidgetLayouts enumerateKeysAndObjectsUsingBlock:v40];
  [v6 appendString:@"\n2. Layouts for App Prediction Panels\n"]);
  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __45__ATXHomeScreenCachedSuggestions_description__block_invoke_2;
  v38[3] = &unk_1E5F01288;
  id v8 = v6;
  id v39 = v8;
  [(NSDictionary *)cachedAppPredictionPanelLayouts enumerateKeysAndObjectsUsingBlock:v38];
  [v8 appendString:@"\n3. Stack Suggestions\n"]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = [(NSDictionary *)self->_cachedTopOfStackLayouts allKeys];
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        [v8 appendFormat:@"\nStack ID: %@\n", v13];
        [v8 appendString:@"\n Top of Stack \n"];
        long long v14 = [(NSDictionary *)self->_cachedTopOfStackLayouts objectForKeyedSubscript:v13];
        uint64_t v15 = [v14 description];
        [v8 appendString:v15];

        [v8 appendString:@"\n Suggested Widgets \n"];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v16 = [(NSDictionary *)self->_cachedSuggestedWidgetsLayouts objectForKeyedSubscript:v13];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = [*(id *)(*((void *)&v30 + 1) + 8 * j) description];
              [v8 appendString:v21];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v18);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v10);
  }

  [v8 appendString:@"\n4. Fallback Suggestions\n"]);
  fallbackSuggestions = self->_fallbackSuggestions;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __45__ATXHomeScreenCachedSuggestions_description__block_invoke_3;
  v28[3] = &unk_1E5F012D8;
  id v23 = v8;
  id v29 = v23;
  [(NSArray *)fallbackSuggestions enumerateObjectsUsingBlock:v28];
  id v24 = v29;
  id v25 = v23;

  return (NSString *)v25;
}

void __45__ATXHomeScreenCachedSuggestions_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 appendFormat:@"\nWidget ID: %@\n", a2];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v6 description];

  [v7 appendString:v8];
}

void __45__ATXHomeScreenCachedSuggestions_description__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 appendFormat:@"\nApp Prediction Panel ID: %@\n", a2];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v6 description];

  [v7 appendString:v8];
}

void __45__ATXHomeScreenCachedSuggestions_description__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 description];
  [v2 appendString:v3];
}

- (id)descriptionWithoutPreviews
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  [v3 appendFormat:@"\n\n=== HomeScreenCachedSuggestions (ID: %@) ===\n", v4];

  [v3 appendString:@"\n1. Layouts For Suggestion Widgets\n"]);
  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke;
  v40[3] = &unk_1E5F01288;
  id v6 = v3;
  id v41 = v6;
  [(NSDictionary *)cachedSuggestionWidgetLayouts enumerateKeysAndObjectsUsingBlock:v40];
  [v6 appendString:@"\n2. Layouts For App Prediction Panels\n"]);
  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke_2;
  v38[3] = &unk_1E5F01288;
  id v8 = v6;
  id v39 = v8;
  [(NSDictionary *)cachedAppPredictionPanelLayouts enumerateKeysAndObjectsUsingBlock:v38];
  [v8 appendString:@"\n3. Stack Suggestions\n"]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = [(NSDictionary *)self->_cachedTopOfStackLayouts allKeys];
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        [v8 appendFormat:@"\nStack ID: %@\n", v13];
        [v8 appendString:@"\n Top of Stack \n"];
        long long v14 = [(NSDictionary *)self->_cachedTopOfStackLayouts objectForKeyedSubscript:v13];
        uint64_t v15 = [v14 description];
        [v8 appendString:v15];

        [v8 appendString:@"\n Suggested Widgets \n"];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v16 = [(NSDictionary *)self->_cachedSuggestedWidgetsLayouts objectForKeyedSubscript:v13];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = [*(id *)(*((void *)&v30 + 1) + 8 * j) description];
              [v8 appendString:v21];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v18);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v10);
  }

  [v8 appendString:@"\n4. Fallback Suggestions\n"]);
  fallbackSuggestions = self->_fallbackSuggestions;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke_3;
  v28[3] = &unk_1E5F012D8;
  id v23 = v8;
  id v29 = v23;
  [(NSArray *)fallbackSuggestions enumerateObjectsUsingBlock:v28];
  id v24 = v29;
  id v25 = v23;

  return v25;
}

void __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([v8 isEqualToString:*MEMORY[0x1E4F4B600]] & 1) == 0
    && ([v8 isEqualToString:*MEMORY[0x1E4F4B608]] & 1) == 0
    && ([v8 isEqualToString:*MEMORY[0x1E4F4B610]] & 1) == 0)
  {
    [*(id *)(a1 + 32) appendFormat:@"\nWidget ID: %@\n", v8];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v5 description];
    [v6 appendString:v7];
  }
}

void __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([v8 isEqualToString:*MEMORY[0x1E4F4B598]] & 1) == 0)
  {
    [*(id *)(a1 + 32) appendFormat:@"\nApp Prediction Panel ID: %@\n", v8];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v5 description];
    [v6 appendString:v7];
  }
}

void __60__ATXHomeScreenCachedSuggestions_descriptionWithoutPreviews__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 description];
  [v2 appendString:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXHomeScreenCachedSuggestions *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXHomeScreenCachedSuggestions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  id v6 = [(ATXHomeScreenCachedSuggestions *)self initWithProtoData:v5];
  return v6;
}

- (ATXHomeScreenCachedSuggestions)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBHomeScreenCachedSuggestion alloc] initWithData:v4];

    self = [(ATXHomeScreenCachedSuggestions *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXHomeScreenCachedSuggestions *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXHomeScreenCachedSuggestions)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_9:
    uint64_t v19 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v20 = __atxlog_handle_default();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[ATXHomeScreenCachedSuggestions initWithProto:]((uint64_t)self, v20);
    }

    goto LABEL_9;
  }
  id v5 = v4;
  id v6 = -[ATXPBHomeScreenCachedSuggestion fallbackSuggestions]((uint64_t)v5);
  uint64_t v7 = +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:v6];
  id v8 = (void *)v7;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  id v26 = v9;

  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  id v29 = -[ATXPBHomeScreenCachedSuggestion uuidString]((uint64_t)v5);
  id v23 = (void *)[v10 initWithUUIDString:v29];
  v28 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIds]((uint64_t)v5);
  uint64_t v27 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetLayouts]((uint64_t)v5);
  uint64_t v11 = [(ATXHomeScreenCachedSuggestions *)self _layoutDictionaryWithKeys:v28 protoLayouts:v27];
  id v25 = -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIds]((uint64_t)v5);
  id v24 = -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelLayouts]((uint64_t)v5);
  long long v12 = [(ATXHomeScreenCachedSuggestions *)self _layoutDictionaryWithKeys:v25 protoLayouts:v24];
  id v22 = -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayoutKeys]((uint64_t)v5);
  uint64_t v13 = -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayouts]((uint64_t)v5);
  long long v14 = [(ATXHomeScreenCachedSuggestions *)self _layoutDictionaryWithKeys:v22 protoLayouts:v13];
  uint64_t v15 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutListKeys]((uint64_t)v5);
  uint64_t v16 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutLists]((uint64_t)v5);

  uint64_t v17 = [(ATXHomeScreenCachedSuggestions *)self _layoutListDictionaryWithKeys:v15 protoLayoutLists:v16];
  uint64_t v18 = [(ATXHomeScreenCachedSuggestions *)self initWithUUID:v23 suggestionWidgetLayouts:v11 appPredictionPanelLayouts:v12 topOfStackLayouts:v14 suggestedWidgetLayouts:v17 fallbackSuggestions:v26];

  self = v18;
  uint64_t v19 = self;
LABEL_10:

  return v19;
}

- (id)proto
{
  id v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  -[ATXPBHomeScreenCachedSuggestion setUuidString:]((uint64_t)v3, v4);

  id v5 = [(NSDictionary *)self->_cachedSuggestionWidgetLayouts allKeys];
  id v6 = (void *)[v5 mutableCopy];
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestionWidgetIds:]((uint64_t)v3, v6);

  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  id v8 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIds]((uint64_t)v3);
  uint64_t v9 = [(ATXHomeScreenCachedSuggestions *)self _protoLayoutsFromLayoutDictionary:cachedSuggestionWidgetLayouts orderedByKeys:v8];
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestionWidgetLayouts:]((uint64_t)v3, v9);

  id v10 = [(NSDictionary *)self->_cachedTopOfStackLayouts allKeys];
  uint64_t v11 = (void *)[v10 mutableCopy];
  -[ATXPBHomeScreenCachedSuggestion setCachedTopOfStackLayoutKeys:]((uint64_t)v3, v11);

  cachedTopOfStackLayouts = self->_cachedTopOfStackLayouts;
  uint64_t v13 = -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayoutKeys]((uint64_t)v3);
  long long v14 = [(ATXHomeScreenCachedSuggestions *)self _protoLayoutsFromLayoutDictionary:cachedTopOfStackLayouts orderedByKeys:v13];
  -[ATXPBHomeScreenCachedSuggestion setCachedTopOfStackLayouts:]((uint64_t)v3, v14);

  uint64_t v15 = +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:self->_fallbackSuggestions];
  -[ATXPBHomeScreenCachedSuggestion setFallbackSuggestions:]((uint64_t)v3, v15);

  uint64_t v16 = [(NSDictionary *)self->_cachedAppPredictionPanelLayouts allKeys];
  uint64_t v17 = (void *)[v16 mutableCopy];
  -[ATXPBHomeScreenCachedSuggestion setCachedAppPredictionPanelIds:]((uint64_t)v3, v17);

  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  uint64_t v19 = -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIds]((uint64_t)v3);
  id v20 = [(ATXHomeScreenCachedSuggestions *)self _protoLayoutsFromLayoutDictionary:cachedAppPredictionPanelLayouts orderedByKeys:v19];
  -[ATXPBHomeScreenCachedSuggestion setCachedAppPredictionPanelLayouts:]((uint64_t)v3, v20);

  uint64_t v21 = [(NSDictionary *)self->_cachedSuggestedWidgetsLayouts allKeys];
  id v22 = (void *)[v21 mutableCopy];
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestedWidgetLayoutListKeys:]((uint64_t)v3, v22);

  cachedSuggestedWidgetsLayouts = self->_cachedSuggestedWidgetsLayouts;
  id v24 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutListKeys]((uint64_t)v3);
  id v25 = [(ATXHomeScreenCachedSuggestions *)self _protoLayoutListsFromLayoutListDictionary:cachedSuggestedWidgetsLayouts orderedByKeys:v24];
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestedWidgetLayoutLists:]((uint64_t)v3, v25);

  return v3;
}

- (id)protoForBiome
{
  id v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  -[ATXPBHomeScreenCachedSuggestion setUuidString:]((uint64_t)v3, v4);

  id v5 = [(NSDictionary *)self->_cachedSuggestionWidgetLayouts allKeys];
  id v6 = (void *)[v5 mutableCopy];
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestionWidgetIds:]((uint64_t)v3, v6);

  cachedSuggestionWidgetLayouts = self->_cachedSuggestionWidgetLayouts;
  id v8 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIds]((uint64_t)v3);
  uint64_t v9 = [(ATXHomeScreenCachedSuggestions *)self _protoLayoutsFromLayoutDictionary:cachedSuggestionWidgetLayouts orderedByKeys:v8];
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestionWidgetLayouts:]((uint64_t)v3, v9);

  id v10 = objc_opt_new();
  uint64_t v11 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIds]((uint64_t)v3);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __47__ATXHomeScreenCachedSuggestions_protoForBiome__block_invoke;
  v42[3] = &unk_1E5F01300;
  id v43 = v10;
  id v12 = v10;
  [v11 enumerateObjectsUsingBlock:v42];

  uint64_t v13 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetIds]((uint64_t)v3);
  [v13 removeObjectsAtIndexes:v12];

  long long v14 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestionWidgetLayouts]((uint64_t)v3);
  [v14 removeObjectsAtIndexes:v12];

  uint64_t v15 = [(NSDictionary *)self->_cachedTopOfStackLayouts allKeys];
  uint64_t v16 = (void *)[v15 mutableCopy];
  -[ATXPBHomeScreenCachedSuggestion setCachedTopOfStackLayoutKeys:]((uint64_t)v3, v16);

  cachedTopOfStackLayouts = self->_cachedTopOfStackLayouts;
  uint64_t v18 = -[ATXPBHomeScreenCachedSuggestion cachedTopOfStackLayoutKeys]((uint64_t)v3);
  uint64_t v19 = [(ATXHomeScreenCachedSuggestions *)self _protoLayoutsFromLayoutDictionary:cachedTopOfStackLayouts orderedByKeys:v18];
  -[ATXPBHomeScreenCachedSuggestion setCachedTopOfStackLayouts:]((uint64_t)v3, v19);

  id v20 = [(NSDictionary *)self->_cachedSuggestedWidgetsLayouts allKeys];
  uint64_t v21 = (void *)[v20 mutableCopy];
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestedWidgetLayoutListKeys:]((uint64_t)v3, v21);

  cachedSuggestedWidgetsLayouts = self->_cachedSuggestedWidgetsLayouts;
  id v23 = -[ATXPBHomeScreenCachedSuggestion cachedSuggestedWidgetLayoutListKeys]((uint64_t)v3);
  id v24 = [(ATXHomeScreenCachedSuggestions *)self _protoLayoutListsFromLayoutListDictionary:cachedSuggestedWidgetsLayouts orderedByKeys:v23];
  -[ATXPBHomeScreenCachedSuggestion setCachedSuggestedWidgetLayoutLists:]((uint64_t)v3, v24);

  id v25 = +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:self->_fallbackSuggestions];
  -[ATXPBHomeScreenCachedSuggestion setFallbackSuggestions:]((uint64_t)v3, v25);

  id v26 = objc_opt_new();
  uint64_t v27 = [(NSDictionary *)self->_cachedAppPredictionPanelLayouts allKeys];
  v28 = (void *)[v27 mutableCopy];
  -[ATXPBHomeScreenCachedSuggestion setCachedAppPredictionPanelIds:]((uint64_t)v3, v28);

  cachedAppPredictionPanelLayouts = self->_cachedAppPredictionPanelLayouts;
  long long v30 = -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIds]((uint64_t)v3);
  long long v31 = [(ATXHomeScreenCachedSuggestions *)self _protoLayoutsFromLayoutDictionary:cachedAppPredictionPanelLayouts orderedByKeys:v30];
  -[ATXPBHomeScreenCachedSuggestion setCachedAppPredictionPanelLayouts:]((uint64_t)v3, v31);

  long long v32 = -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIds]((uint64_t)v3);
  uint64_t v37 = MEMORY[0x1E4F143A8];
  uint64_t v38 = 3221225472;
  id v39 = __47__ATXHomeScreenCachedSuggestions_protoForBiome__block_invoke_2;
  v40 = &unk_1E5F01300;
  id v41 = v26;
  id v33 = v26;
  [v32 enumerateObjectsUsingBlock:&v37];

  long long v34 = -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelIds]((uint64_t)v3);
  objc_msgSend(v34, "removeObjectsAtIndexes:", v33, v37, v38, v39, v40);

  long long v35 = -[ATXPBHomeScreenCachedSuggestion cachedAppPredictionPanelLayouts]((uint64_t)v3);
  [v35 removeObjectsAtIndexes:v33];

  return v3;
}

void __47__ATXHomeScreenCachedSuggestions_protoForBiome__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (([v5 isEqualToString:*MEMORY[0x1E4F4B600]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F4B608]] & 1) != 0
    || [v5 isEqualToString:*MEMORY[0x1E4F4B610]])
  {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

uint64_t __47__ATXHomeScreenCachedSuggestions_protoForBiome__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 isEqualToString:*MEMORY[0x1E4F4B598]];
  if (result)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 addIndex:a3];
  }
  return result;
}

- (id)_layoutDictionaryWithKeys:(id)a3 protoLayouts:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__ATXHomeScreenCachedSuggestions__layoutDictionaryWithKeys_protoLayouts___block_invoke;
  v14[3] = &unk_1E5F01328;
  id v15 = v5;
  id v9 = v8;
  id v16 = v9;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v14];

  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __73__ATXHomeScreenCachedSuggestions__layoutDictionaryWithKeys_protoLayouts___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [ATXSuggestionLayout alloc];
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  id v8 = [(ATXSuggestionLayout *)v6 initWithProto:v7];

  if (v8)
  {
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v5];
  }
  else
  {
    id v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __73__ATXHomeScreenCachedSuggestions__layoutDictionaryWithKeys_protoLayouts___block_invoke_cold_1(v9, v10, v11);
    }
  }
}

- (id)_protoLayoutsFromLayoutDictionary:(id)a3 orderedByKeys:(id)a4
{
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__ATXHomeScreenCachedSuggestions__protoLayoutsFromLayoutDictionary_orderedByKeys___block_invoke;
  v14[3] = &unk_1E5F01328;
  id v15 = v5;
  id v9 = v8;
  id v16 = v9;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v14];

  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __82__ATXHomeScreenCachedSuggestions__protoLayoutsFromLayoutDictionary_orderedByKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v4 = [v3 proto];

  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __82__ATXHomeScreenCachedSuggestions__protoLayoutsFromLayoutDictionary_orderedByKeys___block_invoke_cold_1(v5, v6, v7);
    }
  }
}

- (id)_layoutListDictionaryWithKeys:(id)a3 protoLayoutLists:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__ATXHomeScreenCachedSuggestions__layoutListDictionaryWithKeys_protoLayoutLists___block_invoke;
  v14[3] = &unk_1E5F01328;
  id v15 = v5;
  id v9 = v8;
  id v16 = v9;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v14];

  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __81__ATXHomeScreenCachedSuggestions__layoutListDictionaryWithKeys_protoLayoutLists___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:-[ATXPBSuggestionLayoutList layoutsCount]((uint64_t)v4)];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = -[ATXPBSuggestionLayoutList layouts]((uint64_t)v4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [[ATXSuggestionLayout alloc] initWithProto:*(void *)(*((void *)&v17 + 1) + 8 * v10)];
        if (v11)
        {
          [v5 addObject:v11];
        }
        else
        {
          id v12 = __atxlog_handle_default();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            __81__ATXHomeScreenCachedSuggestions__layoutListDictionaryWithKeys_protoLayoutLists___block_invoke_cold_1(&v15, v16, v12);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v14];
}

- (id)_protoLayoutListsFromLayoutListDictionary:(id)a3 orderedByKeys:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  uint64_t v8 = objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__ATXHomeScreenCachedSuggestions__protoLayoutListsFromLayoutListDictionary_orderedByKeys___block_invoke;
  v14[3] = &unk_1E5F01328;
  id v15 = v5;
  id v9 = v8;
  id v16 = v9;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v14];

  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __90__ATXHomeScreenCachedSuggestions__protoLayoutListsFromLayoutListDictionary_orderedByKeys___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) proto];
        if (v10)
        {
          -[ATXPBSuggestionLayoutList addLayout:]((uint64_t)v4, v10);
        }
        else
        {
          uint64_t v11 = __atxlog_handle_default();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
            __90__ATXHomeScreenCachedSuggestions__protoLayoutListsFromLayoutListDictionary_orderedByKeys___block_invoke_cold_1(&v12, v13, v11);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 40) addObject:v4];
}

- (id)_jsonRawDataForWidgetLayoutMapping:(id)a3
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = *MEMORY[0x1E4F4B608];
  v19[0] = *MEMORY[0x1E4F4B600];
  v19[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F4B598];
  v19[2] = *MEMORY[0x1E4F4B610];
  v19[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  uint64_t v9 = (void *)[v5 initWithArray:v8];

  id v10 = objc_opt_new();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__ATXHomeScreenCachedSuggestions__jsonRawDataForWidgetLayoutMapping___block_invoke;
  v16[3] = &unk_1E5F01350;
  id v17 = v9;
  id v11 = v10;
  id v18 = v11;
  id v12 = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v16];

  uint64_t v13 = v18;
  id v14 = v11;

  return v14;
}

void __69__ATXHomeScreenCachedSuggestions__jsonRawDataForWidgetLayoutMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v7] & 1) == 0)
  {
    uint64_t v6 = [v5 jsonRawData];
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }
}

- (id)_jsonRawDataForLayoutListMapping:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ATXHomeScreenCachedSuggestions__jsonRawDataForLayoutListMapping___block_invoke;
  v7[3] = &unk_1E5F012B0;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __67__ATXHomeScreenCachedSuggestions__jsonRawDataForLayoutListMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_14);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t __67__ATXHomeScreenCachedSuggestions__jsonRawDataForLayoutListMapping___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 jsonRawData];
}

- (id)jsonRawData
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"uuid";
  id v3 = [(NSUUID *)self->_uuid UUIDString];
  v12[0] = v3;
  v11[1] = @"cachedSuggestionWidgetLayouts";
  id v4 = [(ATXHomeScreenCachedSuggestions *)self _jsonRawDataForWidgetLayoutMapping:self->_cachedSuggestionWidgetLayouts];
  v12[1] = v4;
  v11[2] = @"cachedAppPredictionPanelLayouts";
  id v5 = [(ATXHomeScreenCachedSuggestions *)self _jsonRawDataForWidgetLayoutMapping:self->_cachedAppPredictionPanelLayouts];
  v12[2] = v5;
  v11[3] = @"cachedTopOfStackLayouts";
  id v6 = [(ATXHomeScreenCachedSuggestions *)self _jsonRawDataForWidgetLayoutMapping:self->_cachedTopOfStackLayouts];
  v12[3] = v6;
  v11[4] = @"cachedSuggestedWidgetsLayouts";
  id v7 = [(ATXHomeScreenCachedSuggestions *)self _jsonRawDataForLayoutListMapping:self->_cachedSuggestedWidgetsLayouts];
  v12[4] = v7;
  v11[5] = @"fallbackSuggestions";
  id v8 = [(NSArray *)self->_fallbackSuggestions _pas_mappedArrayWithTransform:&__block_literal_global_77_0];
  v12[5] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

uint64_t __45__ATXHomeScreenCachedSuggestions_jsonRawData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonRawData];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSDictionary)cachedSuggestionWidgetLayouts
{
  return self->_cachedSuggestionWidgetLayouts;
}

- (NSDictionary)cachedAppPredictionPanelLayouts
{
  return self->_cachedAppPredictionPanelLayouts;
}

- (NSDictionary)cachedTopOfStackLayouts
{
  return self->_cachedTopOfStackLayouts;
}

- (NSDictionary)cachedSuggestedWidgetsLayouts
{
  return self->_cachedSuggestedWidgetsLayouts;
}

- (NSArray)fallbackSuggestions
{
  return self->_fallbackSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackSuggestions, 0);
  objc_storeStrong((id *)&self->_cachedSuggestedWidgetsLayouts, 0);
  objc_storeStrong((id *)&self->_cachedTopOfStackLayouts, 0);
  objc_storeStrong((id *)&self->_cachedAppPredictionPanelLayouts, 0);
  objc_storeStrong((id *)&self->_cachedSuggestionWidgetLayouts, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "ATXHomeScreenCachedSuggestions: Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);
}

void __73__ATXHomeScreenCachedSuggestions__layoutDictionaryWithKeys_protoLayouts___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)id v3 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1AE67F000, a1, a3, "ATXHomeScreenCachedSuggestions: Unable to construct class ATXSuggestionLayout from ProtoBuf object", v3);
}

void __82__ATXHomeScreenCachedSuggestions__protoLayoutsFromLayoutDictionary_orderedByKeys___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)id v3 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1AE67F000, a1, a3, "ATXHomeScreenCachedSuggestions: Unable to construct ProtoBuf object from ATXSuggestionLayout", v3);
}

void __81__ATXHomeScreenCachedSuggestions__layoutListDictionaryWithKeys_protoLayoutLists___block_invoke_cold_1(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1AE67F000, a3, (uint64_t)a3, "ATXHomeScreenCachedSuggestions: Unable to construct class ATXSuggestionLayout from ProtoBuf object", a1);
}

void __90__ATXHomeScreenCachedSuggestions__protoLayoutListsFromLayoutListDictionary_orderedByKeys___block_invoke_cold_1(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1AE67F000, a3, (uint64_t)a3, "ATXHomeScreenCachedSuggestions: Unable to construct ProtoBuf object from ATXSuggestionLayout", a1);
}

@end