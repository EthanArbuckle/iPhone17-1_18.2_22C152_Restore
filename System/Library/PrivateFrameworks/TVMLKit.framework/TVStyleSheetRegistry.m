@interface TVStyleSheetRegistry
+ (id)_urlForStyleSheetName:(id)a3;
- (NSMutableArray)rootNodes;
- (NSMutableDictionary)nodesByTemplateName;
- (TVStyleSheetRegistry)init;
- (void)_commitTemplateTreeNode:(id)a3 withParentStyleSheetURLs:(id)a4;
- (void)_createDefaultRootNodes;
- (void)commitStyleSheets;
- (void)registerStyleSheetURLs:(id)a3 forTemplateName:(id)a4 basedOnTemplateName:(id)a5;
- (void)setNodesByTemplateName:(id)a3;
- (void)setRootNodes:(id)a3;
@end

@implementation TVStyleSheetRegistry

- (TVStyleSheetRegistry)init
{
  v14.receiver = self;
  v14.super_class = (Class)TVStyleSheetRegistry;
  v2 = [(TVStyleSheetRegistry *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    v5 = [MEMORY[0x263F08AB0] processInfo];
    v6 = [v5 processName];
    int v7 = [v6 isEqualToString:@"AppleTV"];

    if (v4 == 2 || v7 == 0)
    {
      [(TVStyleSheetRegistry *)v2 _createDefaultRootNodes];
    }
    else
    {
      v9 = [_TVTemplateTreeNode alloc];
      v10 = [(_TVTemplateTreeNode *)v9 initWithTemplateName:@"<baseTemplate>" styleSheetURLs:MEMORY[0x263EFFA68] abstract:1];
      uint64_t v11 = [MEMORY[0x263EFF980] array];
      rootNodes = v2->_rootNodes;
      v2->_rootNodes = (NSMutableArray *)v11;

      [(NSMutableArray *)v2->_rootNodes addObject:v10];
    }
    [(TVStyleSheetRegistry *)v2 commitStyleSheets];
  }
  return v2;
}

- (void)commitStyleSheets
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(TVStyleSheetRegistry *)self rootNodes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(TVStyleSheetRegistry *)self _commitTemplateTreeNode:*(void *)(*((void *)&v8 + 1) + 8 * v7++) withParentStyleSheetURLs:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSMutableArray)rootNodes
{
  return self->_rootNodes;
}

- (void)_commitTemplateTreeNode:(id)a3 withParentStyleSheetURLs:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  nodesByTemplateName = self->_nodesByTemplateName;
  if (!nodesByTemplateName)
  {
    long long v9 = [MEMORY[0x263EFF9A0] dictionary];
    long long v10 = self->_nodesByTemplateName;
    self->_nodesByTemplateName = v9;

    nodesByTemplateName = self->_nodesByTemplateName;
  }
  long long v11 = [v6 templateName];
  [(NSMutableDictionary *)nodesByTemplateName setObject:v6 forKeyedSubscript:v11];

  v12 = +[TVInterfaceFactory sharedInterfaceFactory];
  uint64_t v13 = [v6 templateName];
  objc_super v14 = [v12 _styleSheetURLForTemplate:v13];

  if (v7)
  {
    uint64_t v15 = [v7 mutableCopy];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  }
  v16 = (void *)v15;
  v31 = v7;
  v17 = [v6 styleSheetURLs];
  [v16 addObjectsFromArray:v17];

  if (v14) {
    [v16 addObject:v14];
  }
  v18 = (void *)[v16 copy];
  [v6 setFinalURLs:v18];

  if (([v6 isAbstract] & 1) == 0)
  {
    uint64_t v19 = [v16 count];
    uint64_t v20 = v19 - 1;
    if (v19 < 1)
    {
      v21 = 0;
    }
    else
    {
      v21 = [v16 objectAtIndexedSubscript:v20];
      [v16 removeObjectAtIndex:v20];
    }
    v22 = (void *)MEMORY[0x263F4B498];
    v23 = [v6 templateName];
    [v22 registerStyleSheetURL:v21 parentStyleSheets:v16 forTemplateName:v23];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v24 = [v6 derivedTemplateNodes];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v32 + 1) + 8 * v28);
        v30 = [v6 finalURLs];
        [(TVStyleSheetRegistry *)self _commitTemplateTreeNode:v29 withParentStyleSheetURLs:v30];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v26);
  }
}

- (void)registerStyleSheetURLs:(id)a3 forTemplateName:(id)a4 basedOnTemplateName:(id)a5
{
  id v13 = a5;
  id v8 = a4;
  id v9 = a3;
  long long v10 = [[_TVTemplateTreeNode alloc] initWithTemplateName:v8 styleSheetURLs:v9];

  if (v13)
  {
    long long v11 = [(NSMutableDictionary *)self->_nodesByTemplateName objectForKeyedSubscript:v13];
    [v11 addDerivedTemplateNode:v10];
    v12 = [v11 finalURLs];
    [(TVStyleSheetRegistry *)self _commitTemplateTreeNode:v10 withParentStyleSheetURLs:v12];
  }
  else
  {
    [(NSMutableArray *)self->_rootNodes addObject:v10];
    [(TVStyleSheetRegistry *)self _commitTemplateTreeNode:v10 withParentStyleSheetURLs:0];
  }
}

+ (id)_urlForStyleSheetName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[TVMLUtilities TVMLKitBundle];
  uint64_t v5 = [v4 URLForResource:v3 withExtension:@"xml"];

  return v5;
}

- (void)_createDefaultRootNodes
{
  v59[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  rootNodes = self->_rootNodes;
  self->_rootNodes = v3;

  uint64_t v5 = [_TVTemplateTreeNode alloc];
  id v6 = [(id)objc_opt_class() _urlForStyleSheetName:@"BaseStyleSheet"];
  v59[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
  id v8 = [(_TVTemplateTreeNode *)v5 initWithTemplateName:@"<baseTemplate>" styleSheetURLs:v7 abstract:1];

  [(NSMutableArray *)self->_rootNodes addObject:v8];
  id v9 = [_TVTemplateTreeNode alloc];
  long long v10 = [(id)objc_opt_class() _urlForStyleSheetName:@"ListStyleSheet"];
  v58 = v10;
  long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
  v48 = [(_TVTemplateTreeNode *)v9 initWithTemplateName:@"listTemplate" styleSheetURLs:v11];

  [(_TVTemplateTreeNode *)v8 addDerivedTemplateNode:v48];
  v12 = [_TVTemplateTreeNode alloc];
  id v13 = [(id)objc_opt_class() _urlForStyleSheetName:@"StackStyleSheet"];
  v57 = v13;
  objc_super v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
  v47 = [(_TVTemplateTreeNode *)v12 initWithTemplateName:@"stackTemplate" styleSheetURLs:v14];

  [(_TVTemplateTreeNode *)v8 addDerivedTemplateNode:v47];
  uint64_t v15 = [_TVTemplateTreeNode alloc];
  v16 = [(id)objc_opt_class() _urlForStyleSheetName:@"MenuBarStyleSheet"];
  v56 = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
  v46 = [(_TVTemplateTreeNode *)v15 initWithTemplateName:@"menuBarTemplate" styleSheetURLs:v17];

  [(_TVTemplateTreeNode *)v8 addDerivedTemplateNode:v46];
  v18 = [_TVTemplateTreeNode alloc];
  uint64_t v19 = [(id)objc_opt_class() _urlForStyleSheetName:@"SearchStyleSheet"];
  v55 = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
  v45 = [(_TVTemplateTreeNode *)v18 initWithTemplateName:@"searchTemplate" styleSheetURLs:v20];

  [(_TVTemplateTreeNode *)v8 addDerivedTemplateNode:v45];
  v21 = [_TVTemplateTreeNode alloc];
  v22 = [(id)objc_opt_class() _urlForStyleSheetName:@"ProductStyleSheet"];
  v54 = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
  v44 = [(_TVTemplateTreeNode *)v21 initWithTemplateName:@"productTemplate" styleSheetURLs:v23];

  [(_TVTemplateTreeNode *)v8 addDerivedTemplateNode:v44];
  v24 = [_TVTemplateTreeNode alloc];
  uint64_t v25 = [(id)objc_opt_class() _urlForStyleSheetName:@"DescriptiveAlertStyleSheet"];
  v53 = v25;
  uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
  v43 = [(_TVTemplateTreeNode *)v24 initWithTemplateName:@"descriptiveAlertTemplate" styleSheetURLs:v26];

  [(_TVTemplateTreeNode *)v8 addDerivedTemplateNode:v43];
  uint64_t v27 = [_TVTemplateTreeNode alloc];
  uint64_t v28 = [(id)objc_opt_class() _urlForStyleSheetName:@"AlertStyleSheet"];
  v52 = v28;
  uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
  v30 = [(_TVTemplateTreeNode *)v27 initWithTemplateName:@"alertTemplate" styleSheetURLs:v29];

  [(_TVTemplateTreeNode *)v8 addDerivedTemplateNode:v30];
  v31 = [_TVTemplateTreeNode alloc];
  long long v32 = [(id)objc_opt_class() _urlForStyleSheetName:@"DialogStyleSheet"];
  v51 = v32;
  long long v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
  long long v34 = [(_TVTemplateTreeNode *)v31 initWithTemplateName:@"dialogTemplate" styleSheetURLs:v33];

  [(_TVTemplateTreeNode *)v8 addDerivedTemplateNode:v34];
  long long v35 = [_TVTemplateTreeNode alloc];
  v36 = [(id)objc_opt_class() _urlForStyleSheetName:@"LoadingStyleSheet"];
  v50 = v36;
  uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
  v38 = [(_TVTemplateTreeNode *)v35 initWithTemplateName:@"loadingTemplate" styleSheetURLs:v37];

  [(NSMutableArray *)self->_rootNodes addObject:v38];
  v39 = [_TVTemplateTreeNode alloc];
  v40 = [(id)objc_opt_class() _urlForStyleSheetName:@"ModalPageStyleSheet"];
  v49 = v40;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
  v42 = [(_TVTemplateTreeNode *)v39 initWithTemplateName:@"modalPageTemplate" styleSheetURLs:v41];

  [(_TVTemplateTreeNode *)v8 addDerivedTemplateNode:v42];
}

- (void)setRootNodes:(id)a3
{
}

- (NSMutableDictionary)nodesByTemplateName
{
  return self->_nodesByTemplateName;
}

- (void)setNodesByTemplateName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesByTemplateName, 0);
  objc_storeStrong((id *)&self->_rootNodes, 0);
}

@end