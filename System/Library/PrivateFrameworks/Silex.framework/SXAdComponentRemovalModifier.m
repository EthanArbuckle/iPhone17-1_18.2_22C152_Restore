@interface SXAdComponentRemovalModifier
- (void)modifyDOM:(id)a3 context:(id)a4;
- (void)removeAdComponentsEmbeddedWithinContainer:(id)a3 childComponents:(id)a4;
@end

@implementation SXAdComponentRemovalModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v5 = [a3 components];
  [(SXAdComponentRemovalModifier *)self removeAdComponentsEmbeddedWithinContainer:0 childComponents:v5];
}

- (void)removeAdComponentsEmbeddedWithinContainer:(id)a3 childComponents:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [a3 contentDisplay];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = [v5 allComponents];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          v14 = [v13 identifier];
          v15 = [v5 componentsForContainerComponentWithIdentifier:v14];

          if (v15) {
            [(SXAdComponentRemovalModifier *)self removeAdComponentsEmbeddedWithinContainer:v13 childComponents:v15];
          }

          goto LABEL_13;
        }
        if (v6 && [v12 conformsToProtocol:&unk_26D5E0B48])
        {
          id v13 = [v12 identifier];
          [v5 removeComponentWithIdentifier:v13];
LABEL_13:
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

@end