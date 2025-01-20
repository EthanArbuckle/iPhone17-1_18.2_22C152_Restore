@interface SXTangierTextRenderCollector
- (BOOL)tangierTextRepAllowsSelection:(id)a3;
- (NSDictionary)previousFlows;
- (NSMutableDictionary)flows;
- (NSMutableDictionary)layoutsByComponentIdentifier;
- (SXTangierTextRenderCollector)init;
- (id)componentIdentifierForFlowLayout:(id)a3;
- (id)flowLayoutForComponentIdentifier:(id)a3;
- (id)infoForStorage:(id)a3 selection:(id)a4;
- (id)itemWithIdentifier:(id)a3 storage:(id)a4 directLayerHost:(id)a5 inItems:(id)a6;
- (void)addTextStorage:(id)a3 withLayout:(id)a4 forNamedFlow:(id)a5 directLayerHostView:(id)a6 selectable:(BOOL)a7 componentIdentifier:(id)a8;
- (void)buildFlowsAndUpdateInfosWithICC:(id)a3;
- (void)buildFlowsAndUpdateInfosWithICC:(id)a3 updateBlock:(id)a4;
- (void)setFlows:(id)a3;
- (void)setLayoutsByComponentIdentifier:(id)a3;
- (void)setPreviousFlows:(id)a3;
- (void)storeItem:(id)a3 forFlowName:(id)a4;
@end

@implementation SXTangierTextRenderCollector

- (SXTangierTextRenderCollector)init
{
  v8.receiver = self;
  v8.super_class = (Class)SXTangierTextRenderCollector;
  v2 = [(SXTangierTextRenderCollector *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    flows = v2->_flows;
    v2->_flows = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    layoutsByComponentIdentifier = v2->_layoutsByComponentIdentifier;
    v2->_layoutsByComponentIdentifier = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)addTextStorage:(id)a3 withLayout:(id)a4 forNamedFlow:(id)a5 directLayerHostView:(id)a6 selectable:(BOOL)a7 componentIdentifier:(id)a8
{
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v18 = [(SXTangierTextRenderCollector *)self previousFlows];
  v19 = [v18 objectForKey:v15];
  v20 = [(SXTangierTextRenderCollector *)self itemWithIdentifier:v17 storage:v21 directLayerHost:v16 inItems:v19];

  if (v20) {
    -[SXTangierTextRenderCollectorItem updateWithLayout:]((uint64_t)v20, v14);
  }
  else {
    v20 = -[SXTangierTextRenderCollectorItem initWithStorage:layout:directLayerHost:selectable:componentIdentifier:]((id *)[SXTangierTextRenderCollectorItem alloc], v21, v14, v16, a7, v17);
  }
  [(SXTangierTextRenderCollector *)self storeItem:v20 forFlowName:v15];
}

- (id)itemWithIdentifier:(id)a3 storage:(id)a4 directLayerHost:(id)a5 inItems:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v31 = v10;
  uint64_t v13 = [v10 length];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v15) {
    goto LABEL_16;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v34;
  id v29 = v14;
  id v30 = v9;
  uint64_t v28 = v13;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v34 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      -[SXTangierTextRenderCollectorItem directLayerHost]((uint64_t)v19);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20 != v11) {
        goto LABEL_13;
      }
      id v21 = -[SXTangierTextRenderCollectorItem storage]((uint64_t)v19);
      if ([v21 length] != v13) {
        goto LABEL_12;
      }
      v22 = -[SXTangierTextRenderCollectorItem componentIdentifier]((uint64_t)v19);
      if (([v22 isEqualToString:v9] & 1) == 0)
      {

LABEL_12:
        id v20 = v11;
LABEL_13:

        continue;
      }
      v23 = -[SXTangierTextRenderCollectorItem storage]((uint64_t)v19);
      v24 = [v23 string];
      v25 = [v31 string];
      int v32 = [v24 isEqualToString:v25];

      id v9 = v30;
      id v14 = v29;

      uint64_t v13 = v28;
      if (v32)
      {
        id v26 = v19;
        goto LABEL_17;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v16);
LABEL_16:
  id v26 = 0;
LABEL_17:

  return v26;
}

- (void)buildFlowsAndUpdateInfosWithICC:(id)a3 updateBlock:(id)a4
{
  id v11 = a3;
  v6 = (void (**)(void))a4;
  v7 = [(SXTangierTextRenderCollector *)self flows];
  objc_super v8 = (void *)[v7 copy];
  [(SXTangierTextRenderCollector *)self setPreviousFlows:v8];

  id v9 = [(SXTangierTextRenderCollector *)self flows];
  [v9 removeAllObjects];

  id v10 = [(SXTangierTextRenderCollector *)self layoutsByComponentIdentifier];
  [v10 removeAllObjects];

  if (v6) {
    v6[2](v6);
  }
  [(SXTangierTextRenderCollector *)self buildFlowsAndUpdateInfosWithICC:v11];
  [(SXTangierTextRenderCollector *)self setPreviousFlows:0];
}

- (void)buildFlowsAndUpdateInfosWithICC:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v6 = [(SXTangierTextRenderCollector *)self flows];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__SXTangierTextRenderCollector_buildFlowsAndUpdateInfosWithICC___block_invoke;
  v9[3] = &unk_264653CF8;
  id v10 = v5;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  [v7 setInfosToDisplay:v8];
  [v7 invalidateReps];
}

void __64__SXTangierTextRenderCollector_buildFlowsAndUpdateInfosWithICC___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 firstObject];
  id v8 = -[SXAnimatedImageFrame index](v7);

  if (v8)
  {
    -[SXAnimatedImageFrame index](v7);
    id v9 = (SXTextTangierFlowStorage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = [SXTextTangierFlowStorage alloc];
    id v11 = -[SXTangierTextRenderCollectorItem storage](v7);
    id v12 = [v11 context];
    uint64_t v13 = -[SXTangierTextRenderCollectorItem storage](v7);
    id v14 = [v13 stylesheet];
    uint64_t v15 = -[SXTangierTextRenderCollectorItem storage](v7);
    id v9 = -[SXTextTangierFlowStorage initWithContext:string:stylesheet:kind:flowName:](v10, "initWithContext:string:stylesheet:kind:flowName:", v12, &stru_26D5311C0, v14, [v15 wpKind], v5);
  }
  long long v34 = (void *)v7;
  long long v35 = v5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    char v19 = 0;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if (-[SXTangierTextRenderCollectorItem flowRange](v22) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v19) {
            [(TSWPStorage *)v9 insertString:@"\n" atCharIndex:[(TSWPStorage *)v9 length] undoTransaction:0];
          }
          -[SXTangierTextRenderCollectorItem appendToFlowStorage:](v22, v9);
        }
        char v19 = 1;
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v18);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v23 = v16;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        id v29 = -[SXTangierTextRenderCollectorItem flowInfo](v28);
        [a1[4] addObject:v29];
        id v30 = -[SXTangierTextRenderCollectorItem flowLayoutWithICC:](v28, a1[5]);
        v31 = [a1[5] layoutController];
        [v31 preregisterLayout:v30];

        int v32 = [a1[6] layoutsByComponentIdentifier];
        long long v33 = -[SXTangierTextRenderCollectorItem componentIdentifier]((uint64_t)v28);
        [v32 setObject:v30 forKey:v33];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v25);
  }
}

- (id)infoForStorage:(id)a3 selection:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = TSUDynamicCast();
  id v9 = [(SXTangierTextRenderCollector *)self flows];
  id v10 = [v8 flowName];
  id v11 = [v9 objectForKey:v10];

  unint64_t v12 = [v7 range];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
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
        uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        unint64_t v19 = -[SXTangierTextRenderCollectorItem flowRange]((uint64_t)v18);
        if (v12 >= v19 && v12 - v19 < v20)
        {
          uint64_t v22 = -[SXTangierTextRenderCollectorItem flowInfo](v18);
          goto LABEL_14;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }
  uint64_t v22 = 0;
LABEL_14:

  return v22;
}

- (id)flowLayoutForComponentIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXTangierTextRenderCollector *)self layoutsByComponentIdentifier];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)componentIdentifierForFlowLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(SXTangierTextRenderCollector *)self layoutsByComponentIdentifier];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__SXTangierTextRenderCollector_componentIdentifierForFlowLayout___block_invoke;
  v10[3] = &unk_264653D20;
  id v11 = v4;
  id v6 = v4;
  id v7 = [v5 keysOfEntriesPassingTest:v10];
  id v8 = [v7 anyObject];

  return v8;
}

BOOL __65__SXTangierTextRenderCollector_componentIdentifierForFlowLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)(a1 + 32) == a3;
}

- (BOOL)tangierTextRepAllowsSelection:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SXTangierTextRenderCollector *)self flows];
  id v6 = [v4 storage];
  id v7 = [v6 flowName];
  id v8 = [v5 objectForKey:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = -[SXTangierTextRenderCollectorItem flowInfo](v13);
        uint64_t v15 = objc_msgSend(v4, "info", (void)v17);

        if (v14 == v15)
        {
          LOBYTE(v10) = -[SXTangierTextRenderCollectorItem selectable]((BOOL)v13);
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (void)storeItem:(id)a3 forFlowName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SXTangierTextRenderCollector *)self flows];
  id v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    id v8 = [MEMORY[0x263EFF980] array];
    id v9 = [(SXTangierTextRenderCollector *)self flows];
    [v9 setObject:v8 forKey:v6];
  }
  [v8 addObject:v10];
}

- (NSMutableDictionary)flows
{
  return self->_flows;
}

- (void)setFlows:(id)a3
{
}

- (NSDictionary)previousFlows
{
  return self->_previousFlows;
}

- (void)setPreviousFlows:(id)a3
{
}

- (NSMutableDictionary)layoutsByComponentIdentifier
{
  return self->_layoutsByComponentIdentifier;
}

- (void)setLayoutsByComponentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutsByComponentIdentifier, 0);
  objc_storeStrong((id *)&self->_previousFlows, 0);
  objc_storeStrong((id *)&self->_flows, 0);
}

@end