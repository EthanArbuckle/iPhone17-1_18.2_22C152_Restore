@interface SXNamespacedObjectFactory
- (id)createNamespacedReferenceForComponentStyle:(id)a3 component:(id)a4 DOM:(id)a5;
- (id)createNamespacedReferenceForComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5;
- (id)createNamespacedReferenceForTextStyle:(id)a3 component:(id)a4 DOM:(id)a5;
- (void)createNamespacedComponentStylesReferencesForComponent:(id)a3 DOM:(id)a4;
- (void)createNamespacedComponentTextStylesReferencesForComponent:(id)a3 DOM:(id)a4;
- (void)createNamespacedTextStylesReferencesForComponent:(id)a3 DOM:(id)a4;
@end

@implementation SXNamespacedObjectFactory

- (void)createNamespacedComponentStylesReferencesForComponent:(id)a3 DOM:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = objc_msgSend(v7, "analysis", 0);
  v9 = [v8 componentStylesForComponent:v6];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [(SXNamespacedObjectFactory *)self createNamespacedReferenceForComponentStyle:*(void *)(*((void *)&v15 + 1) + 8 * v13++) component:v6 DOM:v7];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (id)createNamespacedReferenceForComponentStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v7
    && ([v9 componentStyles],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        [v11 objectForKey:v7],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    id v14 = [v13 UUIDString];

    long long v15 = [v12 JSONRepresentation];
    long long v16 = (void *)[v15 mutableCopy];

    [v16 setObject:v14 forKeyedSubscript:@"identifier"];
    long long v17 = [SXComponentStyle alloc];
    long long v18 = [v12 specificationVersion];
    v19 = [(SXJSONObject *)v17 initWithJSONObject:v16 andVersion:v18];

    uint64_t v20 = [v10 componentStyles];
    [v20 setObject:v19 forKey:v14];

    v21 = [v10 analysis];
    [v21 removeComponentStyle:v7 component:v8];
    [v21 addComponentStyle:v14 component:v8];
    v22 = [v21 namespacedObjectReferences];
    [v22 setNamespacedComponentStyleIdentifier:v14 forIdentifier:v7 component:v8];

    v23 = [v21 conditionalObjectAnalysis];
    v24 = [v23 conditionTypesUsedByComponentStyle:v7];
    [v23 addComponentStyleIdentifier:v14 conditionTypes:v24];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)createNamespacedComponentTextStylesReferencesForComponent:(id)a3 DOM:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = objc_msgSend(v7, "analysis", 0);
  id v9 = [v8 componentTextStylesForComponent:v6];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [(SXNamespacedObjectFactory *)self createNamespacedReferenceForComponentTextStyle:*(void *)(*((void *)&v15 + 1) + 8 * v13++) component:v6 DOM:v7];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (id)createNamespacedReferenceForComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v7
    && ([v9 componentTextStyles],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        [v11 objectForKey:v7],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    id v14 = [v13 UUIDString];

    long long v15 = [v12 JSONRepresentation];
    long long v16 = (void *)[v15 mutableCopy];

    [v16 setObject:v14 forKeyedSubscript:@"identifier"];
    long long v17 = [SXComponentTextStyle alloc];
    long long v18 = [v12 specificationVersion];
    v19 = [(SXJSONObject *)v17 initWithJSONObject:v16 andVersion:v18];

    uint64_t v20 = [v10 componentTextStyles];
    [v20 setObject:v19 forKey:v14];

    v21 = [v10 analysis];
    [v21 removeComponentTextStyle:v7 component:v8];
    [v21 addComponentTextStyle:v14 component:v8];
    v22 = [v21 namespacedObjectReferences];
    [v22 setNamespacedComponentTextStyleIdentifier:v14 forIdentifier:v7 component:v8];

    v23 = [v21 conditionalObjectAnalysis];
    v24 = [v23 conditionTypesUsedByComponentTextStyle:v7];
    [v23 addComponentTextStyleIdentifier:v14 conditionTypes:v24];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)createNamespacedTextStylesReferencesForComponent:(id)a3 DOM:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = objc_msgSend(v7, "analysis", 0);
  id v9 = [v8 textStylesForComponent:v6];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [(SXNamespacedObjectFactory *)self createNamespacedReferenceForTextStyle:*(void *)(*((void *)&v15 + 1) + 8 * v13++) component:v6 DOM:v7];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (id)createNamespacedReferenceForTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v7
    && ([v9 textStyles],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        [v11 objectForKey:v7],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    id v14 = [v13 UUIDString];

    long long v15 = [v12 JSONRepresentation];
    long long v16 = (void *)[v15 mutableCopy];

    [v16 setObject:v14 forKeyedSubscript:@"identifier"];
    long long v17 = [SXTextStyle alloc];
    long long v18 = [v12 specificationVersion];
    v19 = [(SXJSONObject *)v17 initWithJSONObject:v16 andVersion:v18];

    uint64_t v20 = [v10 textStyles];
    [v20 setObject:v19 forKey:v14];

    v21 = [v10 analysis];
    [v21 removeTextStyle:v7 component:v8];
    [v21 addTextStyle:v14 component:v8];
    v22 = [v21 namespacedObjectReferences];
    [v22 setNamespacedTextStyleIdentifier:v14 forIdentifier:v7 component:v8];

    v23 = [v21 conditionalObjectAnalysis];
    v24 = [v23 conditionTypesUsedByTextStyle:v7];
    [v23 addTextStyleIdentifier:v14 conditionTypes:v24];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

@end