@interface SXConditionalObjectAnalysis
- (NSSet)documentStyleConditionTypes;
- (SXConditionalObjectAnalysis)init;
- (id)componentLayoutsUsingConditionType:(id)a3;
- (id)componentLayoutsUsingConditionTypes:(id)a3;
- (id)componentStylesUsingConditionType:(id)a3;
- (id)componentStylesUsingConditionTypes:(id)a3;
- (id)componentTextStylesUsingConditionType:(id)a3;
- (id)componentTextStylesUsingConditionTypes:(id)a3;
- (id)componentsUsingConditionType:(id)a3;
- (id)componentsUsingConditionTypes:(id)a3;
- (id)conditionTypesUsedByComponent:(id)a3;
- (id)conditionTypesUsedByComponentLayout:(id)a3;
- (id)conditionTypesUsedByComponentLayouts:(id)a3;
- (id)conditionTypesUsedByComponentStyle:(id)a3;
- (id)conditionTypesUsedByComponentStyles:(id)a3;
- (id)conditionTypesUsedByComponentTextStyle:(id)a3;
- (id)conditionTypesUsedByComponentTextStyles:(id)a3;
- (id)conditionTypesUsedByComponents:(id)a3;
- (id)conditionTypesUsedByTextStyle:(id)a3;
- (id)conditionTypesUsedByTextStyles:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectsForKey:(id)a3 map:(id)a4;
- (id)objectsForKeys:(id)a3 map:(id)a4;
- (id)textStylesUsingConditionType:(id)a3;
- (id)textStylesUsingConditionTypes:(id)a3;
- (void)populateWithSource:(id)a3;
@end

@implementation SXConditionalObjectAnalysis

- (SXConditionalObjectAnalysis)init
{
  v26.receiver = self;
  v26.super_class = (Class)SXConditionalObjectAnalysis;
  v2 = [(SXConditionalObjectAnalysis *)&v26 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    conditionsToComponentsMap = v2->_conditionsToComponentsMap;
    v2->_conditionsToComponentsMap = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    componentsToConditionsMap = v2->_componentsToConditionsMap;
    v2->_componentsToConditionsMap = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    conditionsToComponentStylesMap = v2->_conditionsToComponentStylesMap;
    v2->_conditionsToComponentStylesMap = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    componentStylesToConditionsMap = v2->_componentStylesToConditionsMap;
    v2->_componentStylesToConditionsMap = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    conditionsToComponentLayoutsMap = v2->_conditionsToComponentLayoutsMap;
    v2->_conditionsToComponentLayoutsMap = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    componentLayoutsToConditionsMap = v2->_componentLayoutsToConditionsMap;
    v2->_componentLayoutsToConditionsMap = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    conditionsToComponentTextStylesMap = v2->_conditionsToComponentTextStylesMap;
    v2->_conditionsToComponentTextStylesMap = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    componentTextStylesToConditionsMap = v2->_componentTextStylesToConditionsMap;
    v2->_componentTextStylesToConditionsMap = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    conditionsToTextStylesMap = v2->_conditionsToTextStylesMap;
    v2->_conditionsToTextStylesMap = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
    textStylesToConditionsMap = v2->_textStylesToConditionsMap;
    v2->_textStylesToConditionsMap = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x263EFF9C0] set];
    documentStyleConditionTypes = v2->_documentStyleConditionTypes;
    v2->_documentStyleConditionTypes = (NSMutableSet *)v23;
  }
  return v2;
}

- (id)componentsUsingConditionType:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v5 = [(SXConditionalObjectAnalysis *)self componentsUsingConditionTypes:v4];

  return v5;
}

- (id)componentsUsingConditionTypes:(id)a3
{
  return [(SXConditionalObjectAnalysis *)self objectsForKeys:a3 map:self->_conditionsToComponentsMap];
}

- (id)conditionTypesUsedByComponent:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v5 = [(SXConditionalObjectAnalysis *)self conditionTypesUsedByComponents:v4];

  return v5;
}

- (id)conditionTypesUsedByComponents:(id)a3
{
  return [(SXConditionalObjectAnalysis *)self objectsForKeys:a3 map:self->_componentsToConditionsMap];
}

- (id)componentStylesUsingConditionType:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v5 = [(SXConditionalObjectAnalysis *)self componentStylesUsingConditionTypes:v4];

  return v5;
}

- (id)componentStylesUsingConditionTypes:(id)a3
{
  return [(SXConditionalObjectAnalysis *)self objectsForKeys:a3 map:self->_conditionsToComponentStylesMap];
}

- (id)conditionTypesUsedByComponentStyle:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v5 = [(SXConditionalObjectAnalysis *)self conditionTypesUsedByComponentStyles:v4];

  return v5;
}

- (id)conditionTypesUsedByComponentStyles:(id)a3
{
  return [(SXConditionalObjectAnalysis *)self objectsForKeys:a3 map:self->_componentStylesToConditionsMap];
}

- (id)componentTextStylesUsingConditionType:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v5 = [(SXConditionalObjectAnalysis *)self componentTextStylesUsingConditionTypes:v4];

  return v5;
}

- (id)componentTextStylesUsingConditionTypes:(id)a3
{
  return [(SXConditionalObjectAnalysis *)self objectsForKeys:a3 map:self->_conditionsToComponentTextStylesMap];
}

- (id)conditionTypesUsedByComponentTextStyle:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v5 = [(SXConditionalObjectAnalysis *)self conditionTypesUsedByComponentTextStyles:v4];

  return v5;
}

- (id)conditionTypesUsedByComponentTextStyles:(id)a3
{
  return [(SXConditionalObjectAnalysis *)self objectsForKeys:a3 map:self->_componentTextStylesToConditionsMap];
}

- (id)textStylesUsingConditionType:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v5 = [(SXConditionalObjectAnalysis *)self textStylesUsingConditionTypes:v4];

  return v5;
}

- (id)textStylesUsingConditionTypes:(id)a3
{
  return [(SXConditionalObjectAnalysis *)self objectsForKeys:a3 map:self->_conditionsToTextStylesMap];
}

- (id)conditionTypesUsedByTextStyle:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v5 = [(SXConditionalObjectAnalysis *)self conditionTypesUsedByTextStyles:v4];

  return v5;
}

- (id)conditionTypesUsedByTextStyles:(id)a3
{
  return [(SXConditionalObjectAnalysis *)self objectsForKeys:a3 map:self->_textStylesToConditionsMap];
}

- (id)componentLayoutsUsingConditionType:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v5 = [(SXConditionalObjectAnalysis *)self componentLayoutsUsingConditionTypes:v4];

  return v5;
}

- (id)componentLayoutsUsingConditionTypes:(id)a3
{
  return [(SXConditionalObjectAnalysis *)self objectsForKeys:a3 map:self->_conditionsToComponentLayoutsMap];
}

- (id)conditionTypesUsedByComponentLayout:(id)a3
{
  v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v5 = [(SXConditionalObjectAnalysis *)self conditionTypesUsedByComponentLayouts:v4];

  return v5;
}

- (id)conditionTypesUsedByComponentLayouts:(id)a3
{
  return [(SXConditionalObjectAnalysis *)self objectsForKeys:a3 map:self->_componentLayoutsToConditionsMap];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SXConditionalObjectAnalysis);
  [(SXConditionalObjectAnalysis *)v4 populateWithSource:self];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SXMutableConditionalObjectAnalysis);
  [(SXConditionalObjectAnalysis *)v4 populateWithSource:self];
  return v4;
}

- (void)populateWithSource:(id)a3
{
  v4 = (void *)*((void *)a3 + 1);
  conditionsToComponentsMap = self->_conditionsToComponentsMap;
  v6 = (void **)a3;
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke((uint64_t)v6, v4, conditionsToComponentsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v7, v6[2], self->_componentsToConditionsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v8, v6[3], self->_conditionsToComponentStylesMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v9, v6[4], self->_componentStylesToConditionsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v10, v6[5], self->_conditionsToComponentLayoutsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v11, v6[6], self->_componentLayoutsToConditionsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v12, v6[7], self->_conditionsToComponentTextStylesMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v13, v6[8], self->_componentTextStylesToConditionsMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v14, v6[9], self->_conditionsToTextStylesMap);
  __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(v15, v6[10], self->_textStylesToConditionsMap);
  v16 = v6[11];

  uint64_t v17 = (NSMutableSet *)[v16 mutableCopy];
  documentStyleConditionTypes = self->_documentStyleConditionTypes;
  self->_documentStyleConditionTypes = v17;
  MEMORY[0x270F9A758](v17, documentStyleConditionTypes);
}

void __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke_2;
  v6[3] = &unk_264653200;
  id v7 = v4;
  id v5 = v4;
  [a2 enumerateKeysAndObjectsUsingBlock:v6];
}

void __50__SXConditionalObjectAnalysis_populateWithSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [v4 setObject:v6 forKey:v5];
}

- (id)objectsForKeys:(id)a3 map:(id)a4
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
        uint64_t v14 = -[SXConditionalObjectAnalysis objectsForKey:map:](self, "objectsForKey:map:", *(void *)(*((void *)&v17 + 1) + 8 * i), v7, (void)v17);
        [v8 unionSet:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  uint64_t v15 = (void *)[v8 copy];
  return v15;
}

- (id)objectsForKey:(id)a3 map:(id)a4
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

- (NSSet)documentStyleConditionTypes
{
  return &self->_documentStyleConditionTypes->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentStyleConditionTypes, 0);
  objc_storeStrong((id *)&self->_textStylesToConditionsMap, 0);
  objc_storeStrong((id *)&self->_conditionsToTextStylesMap, 0);
  objc_storeStrong((id *)&self->_componentTextStylesToConditionsMap, 0);
  objc_storeStrong((id *)&self->_conditionsToComponentTextStylesMap, 0);
  objc_storeStrong((id *)&self->_componentLayoutsToConditionsMap, 0);
  objc_storeStrong((id *)&self->_conditionsToComponentLayoutsMap, 0);
  objc_storeStrong((id *)&self->_componentStylesToConditionsMap, 0);
  objc_storeStrong((id *)&self->_conditionsToComponentStylesMap, 0);
  objc_storeStrong((id *)&self->_componentsToConditionsMap, 0);
  objc_storeStrong((id *)&self->_conditionsToComponentsMap, 0);
}

@end