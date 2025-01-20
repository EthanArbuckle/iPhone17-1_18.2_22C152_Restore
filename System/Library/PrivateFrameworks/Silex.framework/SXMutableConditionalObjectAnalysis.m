@interface SXMutableConditionalObjectAnalysis
- (void)addComponentIdentifier:(id)a3 conditionTypes:(id)a4;
- (void)addComponentLayoutIdentifier:(id)a3 conditionTypes:(id)a4;
- (void)addComponentStyleIdentifier:(id)a3 conditionTypes:(id)a4;
- (void)addComponentTextStyleIdentifier:(id)a3 conditionTypes:(id)a4;
- (void)addObject:(id)a3 keys:(id)a4 map:(id)a5;
- (void)addObjects:(id)a3 key:(id)a4 map:(id)a5;
- (void)addTextStyleIdentifier:(id)a3 conditionTypes:(id)a4;
- (void)removeComponentIdentifier:(id)a3 conditionTypes:(id)a4;
- (void)removeComponentLayoutIdentifier:(id)a3 conditionTypes:(id)a4;
- (void)removeComponentStyleIdentifier:(id)a3 conditionTypes:(id)a4;
- (void)removeComponentTextStyleIdentifier:(id)a3 conditionTypes:(id)a4;
- (void)removeObject:(id)a3 keys:(id)a4 map:(id)a5;
- (void)removeObjects:(id)a3 key:(id)a4 map:(id)a5;
- (void)removeTextStyleIdentifier:(id)a3 conditionTypes:(id)a4;
- (void)setDocumentStyleConditionTypes:(id)a3;
@end

@implementation SXMutableConditionalObjectAnalysis

- (void)addComponentIdentifier:(id)a3 conditionTypes:(id)a4
{
  conditionsToComponentsMap = self->super._conditionsToComponentsMap;
  id v7 = a4;
  id v8 = a3;
  [(SXMutableConditionalObjectAnalysis *)self addObject:v8 keys:v7 map:conditionsToComponentsMap];
  [(SXMutableConditionalObjectAnalysis *)self addObjects:v7 key:v8 map:self->super._componentsToConditionsMap];
}

- (void)removeComponentIdentifier:(id)a3 conditionTypes:(id)a4
{
  conditionsToComponentsMap = self->super._conditionsToComponentsMap;
  id v7 = a4;
  id v8 = a3;
  [(SXMutableConditionalObjectAnalysis *)self removeObject:v8 keys:v7 map:conditionsToComponentsMap];
  [(SXMutableConditionalObjectAnalysis *)self removeObjects:v7 key:v8 map:self->super._componentsToConditionsMap];
}

- (void)addComponentStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  conditionsToComponentStylesMap = self->super._conditionsToComponentStylesMap;
  id v7 = a4;
  id v8 = a3;
  [(SXMutableConditionalObjectAnalysis *)self addObject:v8 keys:v7 map:conditionsToComponentStylesMap];
  [(SXMutableConditionalObjectAnalysis *)self addObjects:v7 key:v8 map:self->super._componentStylesToConditionsMap];
}

- (void)removeComponentStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  conditionsToComponentStylesMap = self->super._conditionsToComponentStylesMap;
  id v7 = a4;
  id v8 = a3;
  [(SXMutableConditionalObjectAnalysis *)self removeObject:v8 keys:v7 map:conditionsToComponentStylesMap];
  [(SXMutableConditionalObjectAnalysis *)self removeObjects:v7 key:v8 map:self->super._componentStylesToConditionsMap];
}

- (void)addComponentTextStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  conditionsToComponentTextStylesMap = self->super._conditionsToComponentTextStylesMap;
  id v7 = a4;
  id v8 = a3;
  [(SXMutableConditionalObjectAnalysis *)self addObject:v8 keys:v7 map:conditionsToComponentTextStylesMap];
  [(SXMutableConditionalObjectAnalysis *)self addObjects:v7 key:v8 map:self->super._componentTextStylesToConditionsMap];
}

- (void)removeComponentTextStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  conditionsToComponentTextStylesMap = self->super._conditionsToComponentTextStylesMap;
  id v7 = a4;
  id v8 = a3;
  [(SXMutableConditionalObjectAnalysis *)self removeObject:v8 keys:v7 map:conditionsToComponentTextStylesMap];
  [(SXMutableConditionalObjectAnalysis *)self removeObjects:v7 key:v8 map:self->super._componentTextStylesToConditionsMap];
}

- (void)addTextStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  conditionsToTextStylesMap = self->super._conditionsToTextStylesMap;
  id v7 = a4;
  id v8 = a3;
  [(SXMutableConditionalObjectAnalysis *)self addObject:v8 keys:v7 map:conditionsToTextStylesMap];
  [(SXMutableConditionalObjectAnalysis *)self addObjects:v7 key:v8 map:self->super._textStylesToConditionsMap];
}

- (void)removeTextStyleIdentifier:(id)a3 conditionTypes:(id)a4
{
  conditionsToTextStylesMap = self->super._conditionsToTextStylesMap;
  id v7 = a4;
  id v8 = a3;
  [(SXMutableConditionalObjectAnalysis *)self removeObject:v8 keys:v7 map:conditionsToTextStylesMap];
  [(SXMutableConditionalObjectAnalysis *)self removeObjects:v7 key:v8 map:self->super._textStylesToConditionsMap];
}

- (void)addComponentLayoutIdentifier:(id)a3 conditionTypes:(id)a4
{
  conditionsToComponentLayoutsMap = self->super._conditionsToComponentLayoutsMap;
  id v7 = a4;
  id v8 = a3;
  [(SXMutableConditionalObjectAnalysis *)self addObject:v8 keys:v7 map:conditionsToComponentLayoutsMap];
  [(SXMutableConditionalObjectAnalysis *)self addObjects:v7 key:v8 map:self->super._componentLayoutsToConditionsMap];
}

- (void)removeComponentLayoutIdentifier:(id)a3 conditionTypes:(id)a4
{
  conditionsToComponentLayoutsMap = self->super._conditionsToComponentLayoutsMap;
  id v7 = a4;
  id v8 = a3;
  [(SXMutableConditionalObjectAnalysis *)self removeObject:v8 keys:v7 map:conditionsToComponentLayoutsMap];
  [(SXMutableConditionalObjectAnalysis *)self removeObjects:v7 key:v8 map:self->super._componentLayoutsToConditionsMap];
}

- (void)setDocumentStyleConditionTypes:(id)a3
{
  v4 = (NSMutableSet *)[a3 mutableCopy];
  documentStyleConditionTypes = self->super._documentStyleConditionTypes;
  self->super._documentStyleConditionTypes = v4;
  MEMORY[0x270F9A758](v4, documentStyleConditionTypes);
}

- (void)addObject:(id)a3 keys:(id)a4 map:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = [(SXConditionalObjectAnalysis *)self objectsForKey:*(void *)(*((void *)&v16 + 1) + 8 * v14) map:v10];
        [v15 addObject:v8];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)addObjects:(id)a3 key:(id)a4 map:(id)a5
{
  id v8 = a3;
  id v9 = [(SXConditionalObjectAnalysis *)self objectsForKey:a4 map:a5];
  [v9 unionSet:v8];
}

- (void)removeObject:(id)a3 keys:(id)a4 map:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = [(SXConditionalObjectAnalysis *)self objectsForKey:*(void *)(*((void *)&v16 + 1) + 8 * v14) map:v10];
        [v15 removeObject:v8];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)removeObjects:(id)a3 key:(id)a4 map:(id)a5
{
  id v8 = a3;
  id v9 = [(SXConditionalObjectAnalysis *)self objectsForKey:a4 map:a5];
  [v9 minusSet:v8];
}

@end