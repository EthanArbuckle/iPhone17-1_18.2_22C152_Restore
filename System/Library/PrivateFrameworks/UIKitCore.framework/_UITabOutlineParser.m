@interface _UITabOutlineParser
- (BOOL)includeAllowsHidingItems;
- (NSArray)groupItems;
- (NSArray)rootItems;
- (NSMutableDictionary)contentByIdentifier;
- (_UITabOutlineParser)initWithTabs:(id)a3;
- (_UITabOutlineParser)initWithTabs:(id)a3 includeAllowsHidingItems:(BOOL)a4 transaction:(id)a5;
- (_UITabSidebarTransaction)transaction;
- (void)_parseNode:(id)a3 tabs:(id)a4 rootNode:(id)a5;
- (void)_parseTabs:(id)a3;
- (void)setContentByIdentifier:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation _UITabOutlineParser

- (_UITabOutlineParser)initWithTabs:(id)a3
{
  return [(_UITabOutlineParser *)self initWithTabs:a3 includeAllowsHidingItems:0 transaction:0];
}

- (_UITabOutlineParser)initWithTabs:(id)a3 includeAllowsHidingItems:(BOOL)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UITabOutlineParser;
  v10 = [(_UITabOutlineParser *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_includeAllowsHidingItems = a4;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    contentByIdentifier = v11->_contentByIdentifier;
    v11->_contentByIdentifier = v12;

    objc_storeWeak((id *)&v11->_transaction, v9);
    [(_UITabOutlineParser *)v11 _parseTabs:v8];
  }

  return v11;
}

- (void)_parseTabs:(id)a3
{
  id v4 = a3;
  v12 = [[_UITabOutlineNode alloc] initWithIdentifier:@"Root"];
  [(_UITabOutlineParser *)self _parseNode:v12 tabs:v4 rootNode:v12];

  v5 = [(_UITabOutlineNode *)v12 children];

  if (v5)
  {
    v6 = [(_UITabOutlineNode *)v12 children];
    v7 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_450];

    id v8 = [(_UITabOutlineNode *)v12 children];
    id v9 = [(NSArray *)v8 objectsAtIndexes:v7];
    rootItems = self->_rootItems;
    self->_rootItems = v9;

    [(NSArray *)v8 removeObjectsAtIndexes:v7];
    groupItems = self->_groupItems;
    self->_groupItems = v8;
  }
}

- (void)_parseNode:(id)a3 tabs:(id)a4 rootNode:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v56 = a5;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v71;
    location = (id *)&self->_transaction;
    uint64_t v51 = *(void *)v71;
    p_vtable = &OBJC_METACLASS____UISceneHostingEventDeferringClientComponent.vtable;
    v52 = v7;
    do
    {
      uint64_t v13 = 0;
      uint64_t v53 = v10;
      do
      {
        if (*(void *)v71 != v11) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v70 + 1) + 8 * v13);
        objc_super v15 = +[_UITabSidebarContent contentForTab:](_UITabSidebarContent, "contentForTab:", v14, location);
        contentByIdentifier = self->_contentByIdentifier;
        v17 = [v14 identifier];
        [(NSMutableDictionary *)contentByIdentifier setObject:v15 forKeyedSubscript:v17];

        uint64_t v18 = [v14 _isGroup];
        id v19 = v14;
        id v20 = objc_alloc((Class)(p_vtable + 102));
        v21 = [v19 identifier];
        v22 = (void *)[v20 initWithIdentifier:v21];

        [v22 setIsGroup:v18];
        if (![v19 isHidden]
          || [v19 allowsHiding]
          && [(_UITabOutlineParser *)self includeAllowsHidingItems])
        {
          if (v18)
          {
            uint64_t v55 = v13;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            v23 = [v19 sidebarActions];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v66 objects:v76 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v67;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v67 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  v28 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                  v29 = +[_UITabSidebarContent contentForAction:v28 group:v19];
                  v30 = self->_contentByIdentifier;
                  v31 = [v28 identifier];
                  [(NSMutableDictionary *)v30 setObject:v29 forKeyedSubscript:v31];

                  v32 = [v28 identifier];
                  [v22 addActionIdentifier:v32];
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v66 objects:v76 count:16];
              }
              while (v25);
            }

            uint64_t v33 = [v19 sidebarAppearance];
            v34 = v56;
            id v7 = v52;
            if (v33 == 2 || (uint64_t v35 = [v19 sidebarAppearance], v34 = v52, !v35)) {
              [v34 addChild:v22];
            }
            id WeakRetained = objc_loadWeakRetained(location);
            v37 = [v19 identifier];
            v38 = [WeakRetained currentDisplayOrderForGroupWithIdentifier:v37];

            v39 = [v19 _orderedChildrenForDisplayOrder:v38];
            [(_UITabOutlineParser *)self _parseNode:v22 tabs:v39 rootNode:v56];
            p_vtable = (void **)(&OBJC_METACLASS____UISceneHostingEventDeferringClientComponent + 24);
            if ([v19 sidebarAppearance] == 1)
            {
              long long v64 = 0u;
              long long v65 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              v40 = [v22 children];
              uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v75 count:16];
              if (v41)
              {
                uint64_t v42 = v41;
                uint64_t v43 = *(void *)v63;
                do
                {
                  for (uint64_t j = 0; j != v42; ++j)
                  {
                    if (*(void *)v63 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    [v52 addChild:*(void *)(*((void *)&v62 + 1) + 8 * j)];
                  }
                  uint64_t v42 = [v40 countByEnumeratingWithState:&v62 objects:v75 count:16];
                }
                while (v42);
              }

              long long v60 = 0u;
              long long v61 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              v45 = [v22 actions];
              uint64_t v46 = [v45 countByEnumeratingWithState:&v58 objects:v74 count:16];
              if (v46)
              {
                uint64_t v47 = v46;
                uint64_t v48 = *(void *)v59;
                do
                {
                  for (uint64_t k = 0; k != v47; ++k)
                  {
                    if (*(void *)v59 != v48) {
                      objc_enumerationMutation(v45);
                    }
                    [v52 addActionIdentifier:*(void *)(*((void *)&v58 + 1) + 8 * k)];
                  }
                  uint64_t v47 = [v45 countByEnumeratingWithState:&v58 objects:v74 count:16];
                }
                while (v47);
              }
            }
            uint64_t v11 = v51;
            uint64_t v10 = v53;
            uint64_t v13 = v55;
          }
          else
          {
            [v7 addChild:v22];
          }
        }

        ++v13;
      }
      while (v13 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    }
    while (v10);
  }
}

- (NSArray)rootItems
{
  return self->_rootItems;
}

- (NSArray)groupItems
{
  return self->_groupItems;
}

- (NSMutableDictionary)contentByIdentifier
{
  return self->_contentByIdentifier;
}

- (void)setContentByIdentifier:(id)a3
{
}

- (BOOL)includeAllowsHidingItems
{
  return self->_includeAllowsHidingItems;
}

- (_UITabSidebarTransaction)transaction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transaction);
  return (_UITabSidebarTransaction *)WeakRetained;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transaction);
  objc_storeStrong((id *)&self->_contentByIdentifier, 0);
  objc_storeStrong((id *)&self->_groupItems, 0);
  objc_storeStrong((id *)&self->_rootItems, 0);
}

@end