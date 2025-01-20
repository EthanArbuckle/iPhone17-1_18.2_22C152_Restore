@interface SXNamespacedObjectReferences
- (SXNamespacedObjectReferences)init;
- (id)componentStyleIdentifierForNamespacedComponentStyleIdentifier:(id)a3 component:(id)a4;
- (id)componentTextStyleIdentifierForNamespacedComponentTextStyleIdentifier:(id)a3 component:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)namespacedComponentStyleIdentifierForIdentifier:(id)a3 component:(id)a4;
- (id)namespacedComponentStyleIdentifiersForIdentifiers:(id)a3 component:(id)a4;
- (id)namespacedComponentTextStyleIdentifierForIdentifier:(id)a3 component:(id)a4;
- (id)namespacedComponentTextStyleIdentifiersForIdentifiers:(id)a3 component:(id)a4;
- (id)namespacedTextStyleIdentifierForIdentifier:(id)a3 component:(id)a4;
- (id)namespacedTextStyleIdentifiersForIdentifiers:(id)a3 component:(id)a4;
- (id)referencesForComponent:(id)a3 map:(id)a4;
- (id)textStyleIdentifierForNamespacedTextStyleIdentifier:(id)a3 component:(id)a4;
- (void)populateWithSource:(id)a3;
@end

@implementation SXNamespacedObjectReferences

- (SXNamespacedObjectReferences)init
{
  v10.receiver = self;
  v10.super_class = (Class)SXNamespacedObjectReferences;
  v2 = [(SXNamespacedObjectReferences *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    componentStyleReferences = v2->_componentStyleReferences;
    v2->_componentStyleReferences = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    componentTextStyleReferences = v2->_componentTextStyleReferences;
    v2->_componentTextStyleReferences = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    textStyleReferences = v2->_textStyleReferences;
    v2->_textStyleReferences = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (id)namespacedComponentStyleIdentifierForIdentifier:(id)a3 component:(id)a4
{
  componentStyleReferences = self->_componentStyleReferences;
  id v7 = a3;
  v8 = [(SXNamespacedObjectReferences *)self referencesForComponent:a4 map:componentStyleReferences];
  v9 = [v8 objectForKeyedSubscript:v7];
  objc_super v10 = v9;
  if (!v9) {
    v9 = v7;
  }
  id v11 = v9;

  return v11;
}

- (id)namespacedComponentStyleIdentifiersForIdentifiers:(id)a3 component:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = -[SXNamespacedObjectReferences namespacedComponentStyleIdentifierForIdentifier:component:](self, "namespacedComponentStyleIdentifierForIdentifier:component:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)componentStyleIdentifierForNamespacedComponentStyleIdentifier:(id)a3 component:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v8 = v6;
  id v21 = v8;
  id v9 = [(SXNamespacedObjectReferences *)self referencesForComponent:v7 map:self->_componentStyleReferences];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __104__SXNamespacedObjectReferences_componentStyleIdentifierForNamespacedComponentStyleIdentifier_component___block_invoke;
  v13[3] = &unk_264651240;
  id v10 = v8;
  id v14 = v10;
  v15 = &v16;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __104__SXNamespacedObjectReferences_componentStyleIdentifierForNamespacedComponentStyleIdentifier_component___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)namespacedComponentTextStyleIdentifierForIdentifier:(id)a3 component:(id)a4
{
  componentTextStyleReferences = self->_componentTextStyleReferences;
  id v7 = a3;
  id v8 = [(SXNamespacedObjectReferences *)self referencesForComponent:a4 map:componentTextStyleReferences];
  id v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = v9;
  if (!v9) {
    id v9 = v7;
  }
  id v11 = v9;

  return v11;
}

- (id)namespacedComponentTextStyleIdentifiersForIdentifiers:(id)a3 component:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[SXNamespacedObjectReferences namespacedComponentTextStyleIdentifierForIdentifier:component:](self, "namespacedComponentTextStyleIdentifierForIdentifier:component:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)componentTextStyleIdentifierForNamespacedComponentTextStyleIdentifier:(id)a3 component:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v8 = v6;
  id v21 = v8;
  id v9 = [(SXNamespacedObjectReferences *)self referencesForComponent:v7 map:self->_componentTextStyleReferences];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __112__SXNamespacedObjectReferences_componentTextStyleIdentifierForNamespacedComponentTextStyleIdentifier_component___block_invoke;
  v13[3] = &unk_264651240;
  id v10 = v8;
  id v14 = v10;
  v15 = &v16;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __112__SXNamespacedObjectReferences_componentTextStyleIdentifierForNamespacedComponentTextStyleIdentifier_component___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)namespacedTextStyleIdentifierForIdentifier:(id)a3 component:(id)a4
{
  textStyleReferences = self->_textStyleReferences;
  id v7 = a3;
  id v8 = [(SXNamespacedObjectReferences *)self referencesForComponent:a4 map:textStyleReferences];
  id v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = v9;
  if (!v9) {
    id v9 = v7;
  }
  id v11 = v9;

  return v11;
}

- (id)namespacedTextStyleIdentifiersForIdentifiers:(id)a3 component:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[SXNamespacedObjectReferences namespacedTextStyleIdentifierForIdentifier:component:](self, "namespacedTextStyleIdentifierForIdentifier:component:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)textStyleIdentifierForNamespacedTextStyleIdentifier:(id)a3 component:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v8 = v6;
  id v21 = v8;
  id v9 = [(SXNamespacedObjectReferences *)self referencesForComponent:v7 map:self->_textStyleReferences];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __94__SXNamespacedObjectReferences_textStyleIdentifierForNamespacedTextStyleIdentifier_component___block_invoke;
  v13[3] = &unk_264651240;
  id v10 = v8;
  id v14 = v10;
  v15 = &v16;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __94__SXNamespacedObjectReferences_textStyleIdentifierForNamespacedTextStyleIdentifier_component___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SXNamespacedObjectReferences);
  [(SXNamespacedObjectReferences *)v4 populateWithSource:self];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SXMutableNamespacedObjectReferences);
  [(SXNamespacedObjectReferences *)v4 populateWithSource:self];
  return v4;
}

- (void)populateWithSource:(id)a3
{
  v4 = (void *)*((void *)a3 + 1);
  componentStyleReferences = self->_componentStyleReferences;
  id v6 = (void **)a3;
  __51__SXNamespacedObjectReferences_populateWithSource___block_invoke((uint64_t)v6, v4, componentStyleReferences);
  __51__SXNamespacedObjectReferences_populateWithSource___block_invoke(v7, v6[2], self->_componentTextStyleReferences);
  id v8 = v6[3];

  textStyleReferences = self->_textStyleReferences;
  __51__SXNamespacedObjectReferences_populateWithSource___block_invoke(v9, v8, textStyleReferences);
}

void __51__SXNamespacedObjectReferences_populateWithSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__SXNamespacedObjectReferences_populateWithSource___block_invoke_2;
  v6[3] = &unk_264651268;
  id v7 = v4;
  id v5 = v4;
  [a2 enumerateKeysAndObjectsUsingBlock:v6];
}

void __51__SXNamespacedObjectReferences_populateWithSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [v4 setObject:v6 forKey:v5];
}

- (id)referencesForComponent:(id)a3 map:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKey:v5];
  if (!v7)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    [v6 setObject:v7 forKey:v5];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStyleReferences, 0);
  objc_storeStrong((id *)&self->_componentTextStyleReferences, 0);
  objc_storeStrong((id *)&self->_componentStyleReferences, 0);
}

@end