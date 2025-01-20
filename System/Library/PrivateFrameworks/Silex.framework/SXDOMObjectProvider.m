@interface SXDOMObjectProvider
- (SXAutoPlacement)autoPlacement;
- (SXComponents)components;
- (SXDOM)DOM;
- (SXDOMObjectProvider)initWithDocumentControllerProvider:(id)a3 componentStyleMerger:(id)a4 componentTextStyleMerger:(id)a5;
- (SXDocumentStyle)documentStyle;
- (id)componentLayoutForIdentifier:(id)a3;
- (id)componentStyleForComponent:(id)a3;
- (id)componentStyleForIdentifiers:(id)a3;
- (id)componentTextStyleForIdentifier:(id)a3 classification:(id)a4 component:(id)a5;
- (id)componentTextStyleForIdentifier:(id)a3 component:(id)a4;
- (id)componentTextStyleForIdentifier:(id)a3 inheritingFromComponentTextStyle:(id)a4 component:(id)a5;
- (id)componentTextStyleForIdentifiers:(id)a3 component:(id)a4;
- (id)imageResourceForIdentifier:(id)a3;
- (id)resourceForIdentifier:(id)a3;
- (id)textStyleForIdentifier:(id)a3 component:(id)a4;
- (void)setDOM:(id)a3;
@end

@implementation SXDOMObjectProvider

- (SXDOMObjectProvider)initWithDocumentControllerProvider:(id)a3 componentStyleMerger:(id)a4 componentTextStyleMerger:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXDOMObjectProvider;
  v12 = [(SXDOMObjectProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_documentControllerProvider, a3);
    objc_storeStrong((id *)&v13->_componentStyleMerger, a4);
    objc_storeStrong((id *)&v13->_componentTextStyleMerger, a5);
  }

  return v13;
}

- (SXDocumentStyle)documentStyle
{
  return [(SXDOM *)self->_DOM documentStyle];
}

- (SXComponents)components
{
  return [(SXDOM *)self->_DOM components];
}

- (SXAutoPlacement)autoPlacement
{
  return [(SXDOM *)self->_DOM autoPlacement];
}

- (id)componentLayoutForIdentifier:(id)a3
{
  if (a3)
  {
    DOM = self->_DOM;
    id v4 = a3;
    v5 = [(SXDOM *)DOM componentLayouts];
    v6 = [v5 objectForKey:v4];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)componentStyleForComponent:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF980];
  v6 = [v4 classification];
  v7 = [v6 defaultComponentStyleIdentifiers];
  v8 = [v5 arrayWithArray:v7];

  id v9 = [v4 style];

  if (v9)
  {
    id v10 = [v4 style];
    [v8 addObject:v10];
  }
  id v11 = [(SXDOM *)self->_DOM analysis];
  v12 = [v11 namespacedObjectReferences];
  v13 = [v4 identifier];
  v14 = [v12 namespacedComponentStyleIdentifiersForIdentifiers:v8 component:v13];

  objc_super v15 = [(SXDOMObjectProvider *)self componentStyleForIdentifiers:v14];

  return v15;
}

- (id)componentStyleForIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [(SXDOM *)self->_DOM componentStyles];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(v6, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if ([v5 count])
  {
    v13 = [(SXJSONObjectMerger *)self->_componentStyleMerger mergeObjects:v5];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)textStyleForIdentifier:(id)a3 component:(id)a4
{
  if (a3)
  {
    DOM = self->_DOM;
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [(SXDOM *)DOM analysis];
    uint64_t v10 = [v9 namespacedObjectReferences];
    id v11 = [v7 identifier];

    v12 = [v10 namespacedTextStyleIdentifierForIdentifier:v8 component:v11];

    v13 = [(SXDOM *)self->_DOM textStyles];
    v14 = [v13 objectForKey:v12];
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)componentTextStyleForIdentifier:(id)a3 component:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v12 = a3;
    v6 = (void *)MEMORY[0x263EFF8C0];
    id v7 = a4;
    id v8 = a3;
    uint64_t v9 = [v6 arrayWithObjects:&v12 count:1];

    uint64_t v10 = -[SXDOMObjectProvider componentTextStyleForIdentifiers:component:](self, "componentTextStyleForIdentifiers:component:", v9, v7, v12, v13);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)componentTextStyleForIdentifiers:(id)a3 component:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v22 = [MEMORY[0x263EFF980] array];
  id v8 = [(SXDOM *)self->_DOM componentTextStyles];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v14 = [(SXDOM *)self->_DOM analysis];
        long long v15 = [v14 namespacedObjectReferences];
        long long v16 = [v7 identifier];
        long long v17 = [v15 namespacedComponentTextStyleIdentifierForIdentifier:v13 component:v16];

        long long v18 = [v8 objectForKey:v17];
        if (v18) {
          [v22 addObject:v18];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  if ([v22 count])
  {
    v19 = [(SXJSONObjectMerger *)self->_componentTextStyleMerger mergeObjects:v22];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)componentTextStyleForIdentifier:(id)a3 classification:(id)a4 component:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x263EFF980];
  uint64_t v11 = [a4 defaultTextStyleIdentifiers];
  id v12 = [v10 arrayWithArray:v11];

  if (v8) {
    [v12 addObject:v8];
  }
  uint64_t v13 = [(SXDOMObjectProvider *)self componentTextStyleForIdentifiers:v12 component:v9];

  return v13;
}

- (id)componentTextStyleForIdentifier:(id)a3 inheritingFromComponentTextStyle:(id)a4 component:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x263EFF980] array];
  if (v8)
  {
    id v12 = [(SXDOMObjectProvider *)self componentTextStyleForIdentifier:v8 component:v10];
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v12 = 0;
  if (v9) {
LABEL_3:
  }
    [v11 addObject:v9];
LABEL_4:
  if (v12) {
    [v11 addObject:v12];
  }
  if ([v11 count])
  {
    uint64_t v13 = [(SXJSONObjectMerger *)self->_componentTextStyleMerger mergeObjects:v11];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)resourceForIdentifier:(id)a3
{
  if (a3)
  {
    DOM = self->_DOM;
    id v4 = a3;
    v5 = [(SXDOM *)DOM resources];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)imageResourceForIdentifier:(id)a3
{
  documentControllerProvider = self->_documentControllerProvider;
  id v4 = a3;
  v5 = [(SXDocumentControllerProvider *)documentControllerProvider documentController];
  id v6 = [v5 imageResourceForIdentifier:v4];

  return v6;
}

- (SXDOM)DOM
{
  return self->_DOM;
}

- (void)setDOM:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentTextStyleMerger, 0);
  objc_storeStrong((id *)&self->_componentStyleMerger, 0);
  objc_storeStrong((id *)&self->_documentControllerProvider, 0);
  objc_storeStrong((id *)&self->_DOM, 0);
}

@end