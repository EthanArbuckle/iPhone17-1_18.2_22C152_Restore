@interface _UIButtonBarGroupOrderer
+ (id)groupOrdererForCustomizationIdentifier:(uint64_t)a1;
- (BOOL)_hasCustomization;
- (id)_initWithCustomizationIdentifier:(id)a3 data:(id)a4;
- (id)groups;
- (void)_orderGroups;
- (void)enumerateSourceGroups:(id *)a1;
- (void)orderedGroups;
- (void)reset;
- (void)save;
- (void)setIncludedIdentifiers:(void *)a3 excludedIdentifiers:;
@end

@implementation _UIButtonBarGroupOrderer

+ (id)groupOrdererForCustomizationIdentifier:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  if (!v2)
  {
    uint64_t v10 = v3;
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel_groupOrdererForCustomizationIdentifier_ object:v10 file:@"_UIButtonBarGroupOrderer.m" lineNumber:40 description:@"Cannot instantiate a _UIButtonBarGroupOrderer with a nil customizationIdentifier"];
  }
  v4 = [_UIButtonBarGroupOrderer alloc];
  v5 = [@"com.apple.UIKit.UINavigationBarCustomizations." stringByAppendingString:v2];
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v7 = [v6 objectForKey:v5];

  id v8 = [(_UIButtonBarGroupOrderer *)v4 _initWithCustomizationIdentifier:v2 data:v7];
  return v8;
}

- (id)_initWithCustomizationIdentifier:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)_UIButtonBarGroupOrderer;
  id v8 = [(_UIButtonBarGroupOrderer *)&v31 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    customizationIdentifier = v8->_customizationIdentifier;
    v8->_customizationIdentifier = (NSString *)v9;

    id v11 = [v7 objectForKeyedSubscript:@"version"];
    v12 = v11;
    if (v11 == &unk_1ED3F7530 || v11 && (int v13 = [v11 isEqual:&unk_1ED3F7530], v12, v13))
    {
      uint64_t v14 = [v7 objectForKey:@"includedItems"];
      v15 = (void *)v14;
      v16 = (void *)MEMORY[0x1E4F1CBF0];
      if (v14) {
        v17 = (void *)v14;
      }
      else {
        v17 = (void *)MEMORY[0x1E4F1CBF0];
      }
      v18 = v17;

      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v18];
      includedItems = v8->_includedItems;
      v8->_includedItems = (NSMutableOrderedSet *)v19;

      uint64_t v21 = [v7 objectForKey:@"excludedItems"];
      v22 = (void *)v21;
      if (v21) {
        v23 = (void *)v21;
      }
      else {
        v23 = v16;
      }
      id v24 = v23;

      uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v24];
      excludedItems = v8->_excludedItems;
      v8->_excludedItems = (NSMutableSet *)v25;
    }
    else
    {
      uint64_t v27 = [MEMORY[0x1E4F1CA70] orderedSet];
      v28 = v8->_includedItems;
      v8->_includedItems = (NSMutableOrderedSet *)v27;

      uint64_t v29 = [MEMORY[0x1E4F1CA80] set];
      v18 = v8->_excludedItems;
      v8->_excludedItems = (NSMutableSet *)v29;
    }
  }
  return v8;
}

- (void)save
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([(id)a1 _hasCustomization])
    {
      v7[0] = &unk_1ED3F7530;
      v6[0] = @"version";
      v6[1] = @"includedItems";
      id v2 = [*(id *)(a1 + 8) array];
      uint64_t v3 = (void *)[v2 copy];
      v7[1] = v3;
      v6[2] = @"excludedItems";
      v4 = [*(id *)(a1 + 16) allObjects];
      v7[2] = v4;
      v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
    }
    else
    {
      v5 = 0;
    }
    __setCustomizationDataForIdentifier(v5, *(void *)(a1 + 32));
  }
}

- (void)reset
{
  if (a1)
  {
    __setCustomizationDataForIdentifier(0, *(void *)(a1 + 32));
    [*(id *)(a1 + 8) removeAllObjects];
    [*(id *)(a1 + 16) removeAllObjects];
    id v2 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _groupOrdererDidUpdate:a1];
  }
}

- (id)groups
{
  v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v4 = [WeakRetained _groupOrdererGroups:v1];
      v5 = (void *)v4;
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
      if (v4) {
        id v6 = (void *)v4;
      }
      v1 = v6;
    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (void)enumerateSourceGroups:(id *)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t v4 = -[_UIButtonBarGroupOrderer orderedGroups](a1);
    v5 = [MEMORY[0x1E4F1CA80] set];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v3[2](v3, v11, 1);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }

    v12 = -[_UIButtonBarGroupOrderer groups](a1);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * j);
          if (([v5 containsObject:v17] & 1) == 0) {
            v3[2](v3, v17, 0);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
  }
}

- (void)orderedGroups
{
  if (a1)
  {
    id v2 = a1;
    uint64_t v3 = (void *)a1[3];
    if (!v3)
    {
      [a1 _orderGroups];
      uint64_t v3 = (void *)v2[3];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setIncludedIdentifiers:(void *)a3 excludedIdentifiers:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v8 = -[_UIButtonBarGroupOrderer groups]((id *)a1);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(id **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v14 = -[UIBarButtonItemGroup _customizationIdentifier](v13);
          if (v14) {
            [v7 setObject:v13 forKeyedSubscript:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v10);
    }

    [*(id *)(a1 + 8) removeAllObjects];
    [*(id *)(a1 + 16) removeAllObjects];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8 * j);
          long long v21 = [v7 objectForKeyedSubscript:v20];

          if (v21) {
            [*(id *)(a1 + 16) addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v17);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = v5;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v31 + 1) + 8 * k);
          uint64_t v28 = objc_msgSend(v7, "objectForKeyedSubscript:", v27, (void)v31);

          if (v28)
          {
            [*(id *)(a1 + 8) addObject:v27];
            [*(id *)(a1 + 16) removeObject:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v24);
    }

    uint64_t v29 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _groupOrdererDidUpdate:a1];
  }
}

- (BOOL)_hasCustomization
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->_includedItems count];
  return v3 + [(NSMutableSet *)self->_excludedItems count] != 0;
}

- (void)_orderGroups
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = -[_UIButtonBarGroupOrderer groups]((id *)&self->super.isa);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v22 = v3;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v13 = -[UIBarButtonItemGroup _customizationIdentifier]((id *)v12);
          if (v13)
          {
            if ([(NSMutableOrderedSet *)self->_includedItems containsObject:v13])
            {
              [v4 setObject:v12 forKeyedSubscript:v13];
            }
            else if (v12 {
                   && (~*(unsigned __int8 *)(v12 + 24) & 0x30) != 0
            }
                   && ([(NSMutableSet *)self->_excludedItems containsObject:v13] & 1) == 0)
            {
              [v5 addObject:v12];
            }
          }
          else
          {
            [v5 insertObject:v12 atIndex:v9++];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v14 = self->_includedItems;
    uint64_t v15 = [(NSMutableOrderedSet *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * j)];
          if (v19) {
            [v5 insertObject:v19 atIndex:v9++];
          }
        }
        uint64_t v16 = [(NSMutableOrderedSet *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }

    uint64_t v20 = (NSArray *)[v5 copy];
    orderedGroups = self->_orderedGroups;
    self->_orderedGroups = v20;

    uint64_t v3 = v22;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
  objc_storeStrong((id *)&self->_orderedGroups, 0);
  objc_storeStrong((id *)&self->_excludedItems, 0);
  objc_storeStrong((id *)&self->_includedItems, 0);
}

@end