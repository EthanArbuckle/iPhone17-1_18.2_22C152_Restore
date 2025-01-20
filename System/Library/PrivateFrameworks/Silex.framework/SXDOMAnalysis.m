@interface SXDOMAnalysis
- (SXConditionalObjectAnalysis)conditionalObjectAnalysis;
- (SXDOMAnalysis)init;
- (SXNamespacedObjectReferences)namespacedObjectReferences;
- (id)childComponentsOfComponent:(id)a3 includeDescendants:(BOOL)a4;
- (id)componentStylesForComponent:(id)a3;
- (id)componentStylesForComponents:(id)a3;
- (id)componentTextStylesForComponent:(id)a3;
- (id)componentTextStylesForComponents:(id)a3;
- (id)componentsForComponentStyle:(id)a3;
- (id)componentsForComponentStyles:(id)a3;
- (id)componentsForComponentTextStyle:(id)a3;
- (id)componentsForComponentTextStyles:(id)a3;
- (id)componentsForTextStyle:(id)a3;
- (id)componentsForTextStyles:(id)a3;
- (id)componentsWithRole:(int)a3;
- (id)componentsWithType:(id)a3;
- (id)containerPathForComponentWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifiersForKey:(id)a3 map:(id)a4;
- (id)identifiersForKeys:(id)a3 map:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)parentComponentOfComponent:(id)a3;
- (id)textStylesForComponent:(id)a3;
- (id)textStylesForComponents:(id)a3;
- (id)typeForComponent:(id)a3;
- (int)roleForComponent:(id)a3;
- (void)populateWithSource:(id)a3;
@end

@implementation SXDOMAnalysis

- (SXDOMAnalysis)init
{
  v32.receiver = self;
  v32.super_class = (Class)SXDOMAnalysis;
  v2 = [(SXDOMAnalysis *)&v32 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    roleToComponentsMap = v2->_roleToComponentsMap;
    v2->_roleToComponentsMap = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    componentToRoleMap = v2->_componentToRoleMap;
    v2->_componentToRoleMap = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    typeToComponentsMap = v2->_typeToComponentsMap;
    v2->_typeToComponentsMap = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    componentToTypeMap = v2->_componentToTypeMap;
    v2->_componentToTypeMap = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    componentStyleToComponentsMap = v2->_componentStyleToComponentsMap;
    v2->_componentStyleToComponentsMap = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    componentToComponentStylesMap = v2->_componentToComponentStylesMap;
    v2->_componentToComponentStylesMap = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    componentTextStyleToComponentsMap = v2->_componentTextStyleToComponentsMap;
    v2->_componentTextStyleToComponentsMap = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    componentToComponentTextStylesMap = v2->_componentToComponentTextStylesMap;
    v2->_componentToComponentTextStylesMap = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    textStyleToComponentsMap = v2->_textStyleToComponentsMap;
    v2->_textStyleToComponentsMap = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
    componentToTextStylesMap = v2->_componentToTextStylesMap;
    v2->_componentToTextStylesMap = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
    componentToChildComponentsMap = v2->_componentToChildComponentsMap;
    v2->_componentToChildComponentsMap = (NSMutableDictionary *)v23;

    uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
    componentToParentComponentMap = v2->_componentToParentComponentMap;
    v2->_componentToParentComponentMap = (NSMutableDictionary *)v25;

    v27 = objc_alloc_init(SXMutableConditionalObjectAnalysis);
    conditionalObjectAnalysis = v2->_conditionalObjectAnalysis;
    v2->_conditionalObjectAnalysis = v27;

    v29 = objc_alloc_init(SXMutableNamespacedObjectReferences);
    namespacedObjectReferences = v2->_namespacedObjectReferences;
    v2->_namespacedObjectReferences = v29;
  }
  return v2;
}

- (id)componentsWithRole:(int)a3
{
  roleToComponentsMap = self->_roleToComponentsMap;
  v4 = [NSNumber numberWithInt:*(void *)&a3];
  uint64_t v5 = [(NSMutableDictionary *)roleToComponentsMap objectForKey:v4];
  v6 = (void *)[v5 copy];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFFA08] set];
  }
  uint64_t v9 = v8;

  return v9;
}

- (int)roleForComponent:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_componentToRoleMap objectForKey:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (id)componentsWithType:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_typeToComponentsMap objectForKey:a3];
  int v4 = (void *)[v3 copy];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFFA08] set];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)typeForComponent:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_componentToTypeMap objectForKey:a3];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)componentStylesForComponent:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKey:a3 map:self->_componentToComponentStylesMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)componentStylesForComponents:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKeys:a3 map:self->_componentToComponentStylesMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)componentsForComponentStyle:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKey:a3 map:self->_componentStyleToComponentsMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)componentsForComponentStyles:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKeys:a3 map:self->_componentStyleToComponentsMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)componentTextStylesForComponent:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKey:a3 map:self->_componentToComponentTextStylesMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)componentTextStylesForComponents:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKeys:a3 map:self->_componentToComponentTextStylesMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)componentsForComponentTextStyle:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKey:a3 map:self->_componentTextStyleToComponentsMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)componentsForComponentTextStyles:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKeys:a3 map:self->_componentTextStyleToComponentsMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)textStylesForComponent:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKey:a3 map:self->_componentToTextStylesMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)textStylesForComponents:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKeys:a3 map:self->_componentToTextStylesMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)componentsForTextStyle:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKey:a3 map:self->_textStyleToComponentsMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)componentsForTextStyles:(id)a3
{
  uint64_t v3 = [(SXDOMAnalysis *)self identifiersForKeys:a3 map:self->_textStyleToComponentsMap];
  int v4 = (void *)[v3 copy];

  return v4;
}

- (id)childComponentsOfComponent:(id)a3 includeDescendants:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = [(NSMutableDictionary *)self->_componentToChildComponentsMap objectForKey:a3];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF9C0] set];
  }
  uint64_t v9 = v8;

  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v10 = objc_msgSend(v9, "copy", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [(SXDOMAnalysis *)self childComponentsOfComponent:*(void *)(*((void *)&v18 + 1) + 8 * i) includeDescendants:1];
          if (v15) {
            [v9 unionSet:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  v16 = (void *)[v9 copy];

  return v16;
}

- (id)parentComponentOfComponent:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_componentToParentComponentMap objectForKey:a3];
  BOOL v4 = (void *)[v3 copy];

  return v4;
}

- (id)containerPathForComponentWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [(SXDOMAnalysis *)self parentComponentOfComponent:v4];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    do
    {
      [v5 insertObject:v7 atIndex:0];
      uint64_t v8 = [(SXDOMAnalysis *)self parentComponentOfComponent:v7];

      uint64_t v7 = (void *)v8;
    }
    while (v8);
  }
  uint64_t v9 = (void *)[v5 copy];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SXDOMAnalysis);
  [(SXDOMAnalysis *)v4 populateWithSource:self];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SXMutableDOMAnalysis);
  [(SXDOMAnalysis *)v4 populateWithSource:self];
  return v4;
}

- (void)populateWithSource:(id)a3
{
  id v4 = (void *)*((void *)a3 + 1);
  roleToComponentsMap = self->_roleToComponentsMap;
  uint64_t v6 = (void **)a3;
  __36__SXDOMAnalysis_populateWithSource___block_invoke((uint64_t)v6, v4, roleToComponentsMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v7, v6[3], self->_typeToComponentsMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v8, v6[5], self->_componentStyleToComponentsMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v9, v6[6], self->_componentToComponentStylesMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v10, v6[7], self->_componentTextStyleToComponentsMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v11, v6[8], self->_componentToComponentTextStylesMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v12, v6[9], self->_textStyleToComponentsMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v13, v6[10], self->_componentToTextStylesMap);
  __36__SXDOMAnalysis_populateWithSource___block_invoke(v14, v6[11], self->_componentToChildComponentsMap);
  uint64_t v15 = (NSMutableDictionary *)[v6[12] mutableCopy];
  componentToParentComponentMap = self->_componentToParentComponentMap;
  self->_componentToParentComponentMap = v15;

  uint64_t v17 = (SXMutableConditionalObjectAnalysis *)[v6[13] mutableCopy];
  conditionalObjectAnalysis = self->_conditionalObjectAnalysis;
  self->_conditionalObjectAnalysis = v17;

  long long v19 = v6[14];
  long long v20 = (SXMutableNamespacedObjectReferences *)[v19 mutableCopy];
  namespacedObjectReferences = self->_namespacedObjectReferences;
  self->_namespacedObjectReferences = v20;
  MEMORY[0x270F9A758](v20, namespacedObjectReferences);
}

void __36__SXDOMAnalysis_populateWithSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__SXDOMAnalysis_populateWithSource___block_invoke_2;
  v6[3] = &unk_2646542D0;
  id v7 = v4;
  id v5 = v4;
  [a2 enumerateKeysAndObjectsUsingBlock:v6];
}

void __36__SXDOMAnalysis_populateWithSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [v4 setObject:v6 forKey:v5];
}

- (id)identifiersForKeys:(id)a3 map:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = -[SXDOMAnalysis identifiersForKey:map:](self, "identifiersForKey:map:", *(void *)(*((void *)&v17 + 1) + 8 * i), v7, (void)v17);
        [v8 unionSet:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  uint64_t v15 = (void *)[v8 copy];
  return v15;
}

- (id)identifiersForKey:(id)a3 map:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKey:v5];
  if (!v7)
  {
    id v7 = [MEMORY[0x263EFF9C0] set];
    [v6 setObject:v7 forKey:v5];
  }

  return v7;
}

- (SXConditionalObjectAnalysis)conditionalObjectAnalysis
{
  return &self->_conditionalObjectAnalysis->super;
}

- (SXNamespacedObjectReferences)namespacedObjectReferences
{
  return &self->_namespacedObjectReferences->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespacedObjectReferences, 0);
  objc_storeStrong((id *)&self->_conditionalObjectAnalysis, 0);
  objc_storeStrong((id *)&self->_componentToParentComponentMap, 0);
  objc_storeStrong((id *)&self->_componentToChildComponentsMap, 0);
  objc_storeStrong((id *)&self->_componentToTextStylesMap, 0);
  objc_storeStrong((id *)&self->_textStyleToComponentsMap, 0);
  objc_storeStrong((id *)&self->_componentToComponentTextStylesMap, 0);
  objc_storeStrong((id *)&self->_componentTextStyleToComponentsMap, 0);
  objc_storeStrong((id *)&self->_componentToComponentStylesMap, 0);
  objc_storeStrong((id *)&self->_componentStyleToComponentsMap, 0);
  objc_storeStrong((id *)&self->_componentToTypeMap, 0);
  objc_storeStrong((id *)&self->_typeToComponentsMap, 0);
  objc_storeStrong((id *)&self->_componentToRoleMap, 0);
  objc_storeStrong((id *)&self->_roleToComponentsMap, 0);
}

@end