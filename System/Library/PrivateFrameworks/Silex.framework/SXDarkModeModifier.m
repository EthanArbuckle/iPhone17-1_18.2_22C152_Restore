@interface SXDarkModeModifier
- (SXDarkModeConfiguration)configuration;
- (SXDarkModeModifier)initWithPolicyHandler:(id)a3 configuration:(id)a4 namespacedObjectFactory:(id)a5;
- (SXDarkModePolicyHandler)policyHandler;
- (SXNamespacedObjectFactory)namespacedObjectFactory;
- (id)invertColor:(id)a3 defaultColor:(id)a4;
- (id)invertedBorder:(id)a3;
- (id)invertedComponent:(id)a3 context:(id)a4;
- (id)invertedComponentShadow:(id)a3;
- (id)invertedComponentStyle:(id)a3 context:(id)a4;
- (id)invertedComponentTextStyleBackgroundColors:(id)a3 context:(id)a4;
- (id)invertedComponentTextStyleForegroundColors:(id)a3 context:(id)a4;
- (id)invertedDataTableBorder:(id)a3;
- (id)invertedDataTableBorderSides:(id)a3;
- (id)invertedDataTableCellStyle:(id)a3;
- (id)invertedDataTableColumnStyle:(id)a3;
- (id)invertedDataTableRowStyle:(id)a3;
- (id)invertedDataTableStyle:(id)a3;
- (id)invertedDocumentStyle:(id)a3 context:(id)a4;
- (id)invertedDropCapStyle:(id)a3;
- (id)invertedGradientFill:(id)a3;
- (id)invertedLinearGradient:(id)a3;
- (id)invertedStrokeStyle:(id)a3;
- (id)invertedTextDecoration:(id)a3;
- (id)invertedTextShadow:(id)a3;
- (id)invertedTextStroke:(id)a3;
- (id)invertedTextStyleBackgroundColors:(id)a3 context:(id)a4;
- (id)invertedTextStyleForegroundColors:(id)a3 context:(id)a4;
- (void)invertBackgroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6;
- (void)invertBackgroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6;
- (void)invertComponentStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6;
- (void)invertForegroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6;
- (void)invertForegroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6;
- (void)modifyDOM:(id)a3 context:(id)a4;
@end

@implementation SXDarkModeModifier

- (SXDarkModeModifier)initWithPolicyHandler:(id)a3 configuration:(id)a4 namespacedObjectFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXDarkModeModifier;
  v12 = [(SXDarkModeModifier *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_policyHandler, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    objc_storeStrong((id *)&v13->_namespacedObjectFactory, a5);
  }

  return v13;
}

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  policyHandler = self->_policyHandler;
  id v9 = [v7 layoutOptions];
  LODWORD(policyHandler) = [(SXDarkModePolicyHandler *)policyHandler shouldApplyDarkModeToDOM:v6 layoutOptions:v9];

  if (policyHandler)
  {
    id v10 = self->_policyHandler;
    id v11 = [v6 documentStyle];
    v12 = [v7 layoutOptions];
    LODWORD(v10) = [(SXDarkModePolicyHandler *)v10 shouldApplyDarkModeToDocumentStyle:v11 DOM:v6 layoutOptions:v12];

    if (v10)
    {
      v13 = [v6 documentStyle];
      v14 = [(SXDarkModeModifier *)self invertedDocumentStyle:v13 context:v7];
      [v6 setDocumentStyle:v14];
    }
    objc_super v15 = [v6 components];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __40__SXDarkModeModifier_modifyDOM_context___block_invoke;
    v16[3] = &unk_2646527B8;
    id v17 = v6;
    v18 = self;
    id v19 = v7;
    [v15 enumerateComponentsWithBlock:v16];
  }
}

uint64_t __40__SXDarkModeModifier_modifyDOM_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) analysis];
  v8 = [v6 identifier];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 8) shouldApplyDarkModeToComponent:v6 DOM:*(void *)(a1 + 32)];
  if (v9)
  {
    id v10 = [*(id *)(a1 + 40) invertedComponent:v6 context:*(void *)(a1 + 48)];
    if (v10 != v6) {
      [v5 replaceComponent:v6 withComponent:v10];
    }
    unsigned int v55 = v9;
    v56 = v7;
    v54 = v10;
    if ([*(id *)(*(void *)(a1 + 40) + 8) shouldApplyDarkModeToComponentStylesForComponent:v6 DOM:*(void *)(a1 + 32)])
    {
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v11 = [v7 componentStylesForComponent:v8];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v73 objects:v81 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v74;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v74 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v73 + 1) + 8 * v15);
            id v17 = [*(id *)(a1 + 32) componentStyles];
            v18 = [v17 objectForKey:v16];

            if (v18
              && [*(id *)(*(void *)(a1 + 40) + 8) shouldApplyDarkModeToComponentStyle:v18 component:v6 DOM:*(void *)(a1 + 32)])
            {
              [*(id *)(a1 + 40) invertComponentStyle:v18 component:v6 DOM:*(void *)(a1 + 32) context:*(void *)(a1 + 48)];
            }

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v73 objects:v81 count:16];
        }
        while (v13);
      }

      uint64_t v9 = v55;
      id v7 = v56;
      id v10 = v54;
    }
    id v52 = v5;
    if ([*(id *)(*(void *)(a1 + 40) + 8) shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:v6 DOM:*(void *)(a1 + 32)])
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v19 = [v7 componentTextStylesForComponent:v8];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v69 objects:v80 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v70;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v70 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v69 + 1) + 8 * v23);
            v25 = objc_msgSend(*(id *)(a1 + 32), "componentTextStyles", v52);
            v26 = [v25 objectForKey:v24];

            if (v26
              && [*(id *)(*(void *)(a1 + 40) + 8) shouldApplyDarkModeToBackgroundColorsOfComponentTextStyle:v26 component:v6 DOM:*(void *)(a1 + 32)])
            {
              [*(id *)(a1 + 40) invertBackgroundColorsOfComponentTextStyle:v26 component:v6 DOM:*(void *)(a1 + 32) context:*(void *)(a1 + 48)];
            }

            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v69 objects:v80 count:16];
        }
        while (v21);
      }

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v27 = [v56 textStylesForComponent:v8];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v65 objects:v79 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v66;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v66 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v65 + 1) + 8 * v31);
            v33 = objc_msgSend(*(id *)(a1 + 32), "textStyles", v52);
            v34 = [v33 objectForKey:v32];

            if (v34
              && [*(id *)(*(void *)(a1 + 40) + 8) shouldApplyDarkModeToBackgroundColorsOfTextStyle:v34 component:v6 DOM:*(void *)(a1 + 32)])
            {
              [*(id *)(a1 + 40) invertBackgroundColorsOfTextStyle:v34 component:v6 DOM:*(void *)(a1 + 32) context:*(void *)(a1 + 48)];
            }

            ++v31;
          }
          while (v29 != v31);
          uint64_t v29 = [v27 countByEnumeratingWithState:&v65 objects:v79 count:16];
        }
        while (v29);
      }

      id v5 = v52;
      id v10 = v54;
      uint64_t v9 = v55;
      id v7 = v56;
    }
    if (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "shouldApplyDarkModeToTextStyleForegroundColorsForComponent:DOM:", v6, *(void *)(a1 + 32), v52))
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v35 = [v7 componentTextStylesForComponent:v8];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v61 objects:v78 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v62;
        do
        {
          uint64_t v39 = 0;
          do
          {
            if (*(void *)v62 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v61 + 1) + 8 * v39);
            v41 = [*(id *)(a1 + 32) componentTextStyles];
            v42 = [v41 objectForKey:v40];

            if (v42
              && [*(id *)(*(void *)(a1 + 40) + 8) shouldApplyDarkModeToForegroundColorsOfComponentTextStyle:v42 component:v6 DOM:*(void *)(a1 + 32)])
            {
              [*(id *)(a1 + 40) invertForegroundColorsOfComponentTextStyle:v42 component:v6 DOM:*(void *)(a1 + 32) context:*(void *)(a1 + 48)];
            }

            ++v39;
          }
          while (v37 != v39);
          uint64_t v37 = [v35 countByEnumeratingWithState:&v61 objects:v78 count:16];
        }
        while (v37);
      }

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v43 = [v56 textStylesForComponent:v8];
      uint64_t v44 = [v43 countByEnumeratingWithState:&v57 objects:v77 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v58;
        do
        {
          uint64_t v47 = 0;
          do
          {
            if (*(void *)v58 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v48 = *(void *)(*((void *)&v57 + 1) + 8 * v47);
            v49 = [*(id *)(a1 + 32) textStyles];
            v50 = [v49 objectForKey:v48];

            if (v50
              && [*(id *)(*(void *)(a1 + 40) + 8) shouldApplyDarkModeToForegroundColorsOfTextStyle:v50 component:v6 DOM:*(void *)(a1 + 32)])
            {
              [*(id *)(a1 + 40) invertForegroundColorsOfTextStyle:v50 component:v6 DOM:*(void *)(a1 + 32) context:*(void *)(a1 + 48)];
            }

            ++v47;
          }
          while (v45 != v47);
          uint64_t v45 = [v43 countByEnumeratingWithState:&v57 objects:v77 count:16];
        }
        while (v45);
      }

      id v5 = v53;
      id v10 = v54;
      uint64_t v9 = v55;
      id v7 = v56;
    }
  }
  return v9;
}

- (void)invertComponentStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6
{
  id v20 = a5;
  id v10 = a6;
  namespacedObjectFactory = self->_namespacedObjectFactory;
  id v12 = a4;
  uint64_t v13 = [a3 identifier];
  uint64_t v14 = [v12 identifier];

  uint64_t v15 = [(SXNamespacedObjectFactory *)namespacedObjectFactory createNamespacedReferenceForComponentStyle:v13 component:v14 DOM:v20];

  if (v15)
  {
    uint64_t v16 = [v20 componentStyles];
    id v17 = [v16 objectForKeyedSubscript:v15];
    v18 = [(SXDarkModeModifier *)self invertedComponentStyle:v17 context:v10];

    if (v18)
    {
      id v19 = [v20 componentStyles];
      [v19 setObject:v18 forKeyedSubscript:v15];
    }
  }
}

- (void)invertBackgroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6
{
  id v23 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v23 analysis];
  uint64_t v14 = [v13 namespacedObjectReferences];

  namespacedObjectFactory = self->_namespacedObjectFactory;
  uint64_t v16 = [v12 identifier];

  id v17 = [v11 identifier];

  v18 = [(SXNamespacedObjectFactory *)namespacedObjectFactory createNamespacedReferenceForComponentTextStyle:v16 component:v17 DOM:v23];

  if (v18)
  {
    id v19 = [v23 componentTextStyles];
    id v20 = [v19 objectForKeyedSubscript:v18];
    uint64_t v21 = [(SXDarkModeModifier *)self invertedComponentTextStyleBackgroundColors:v20 context:v10];

    if (v21)
    {
      uint64_t v22 = [v23 componentTextStyles];
      [v22 setObject:v21 forKeyedSubscript:v18];
    }
  }
}

- (void)invertForegroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6
{
  id v26 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = [v10 analysis];
  uint64_t v14 = [v13 namespacedObjectReferences];

  uint64_t v15 = [v12 identifier];
  uint64_t v16 = [v26 identifier];
  id v17 = [v14 componentTextStyleIdentifierForNamespacedComponentTextStyleIdentifier:v15 component:v16];

  v18 = [v12 identifier];
  LODWORD(v16) = [v17 isEqualToString:v18];

  if (v16)
  {
    namespacedObjectFactory = self->_namespacedObjectFactory;
    uint64_t v20 = [v12 identifier];

    id v12 = [v26 identifier];
    uint64_t v21 = [(SXNamespacedObjectFactory *)namespacedObjectFactory createNamespacedReferenceForComponentTextStyle:v20 component:v12 DOM:v10];

    id v17 = (void *)v20;
  }
  else
  {
    uint64_t v21 = [v12 identifier];
  }

  if (v21)
  {
    uint64_t v22 = [v10 componentTextStyles];
    id v23 = [v22 objectForKeyedSubscript:v21];
    uint64_t v24 = [(SXDarkModeModifier *)self invertedComponentTextStyleForegroundColors:v23 context:v11];

    if (v24)
    {
      v25 = [v10 componentTextStyles];
      [v25 setObject:v24 forKeyedSubscript:v21];
    }
  }
}

- (void)invertBackgroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6
{
  id v23 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v23 analysis];
  uint64_t v14 = [v13 namespacedObjectReferences];

  namespacedObjectFactory = self->_namespacedObjectFactory;
  uint64_t v16 = [v12 identifier];

  id v17 = [v11 identifier];

  v18 = [(SXNamespacedObjectFactory *)namespacedObjectFactory createNamespacedReferenceForTextStyle:v16 component:v17 DOM:v23];

  if (v18)
  {
    id v19 = [v23 textStyles];
    uint64_t v20 = [v19 objectForKeyedSubscript:v18];
    uint64_t v21 = [(SXDarkModeModifier *)self invertedTextStyleBackgroundColors:v20 context:v10];

    if (v21)
    {
      uint64_t v22 = [v23 textStyles];
      [v22 setObject:v21 forKeyedSubscript:v18];
    }
  }
}

- (void)invertForegroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6
{
  id v27 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v27 analysis];
  uint64_t v14 = [v13 namespacedObjectReferences];

  uint64_t v15 = [v11 identifier];

  uint64_t v16 = [v12 identifier];
  id v17 = [v14 textStyleIdentifierForNamespacedTextStyleIdentifier:v16 component:v15];

  v18 = [v12 identifier];
  int v19 = [v17 isEqualToString:v18];

  if (v19)
  {
    namespacedObjectFactory = self->_namespacedObjectFactory;
    uint64_t v21 = [v12 identifier];

    uint64_t v22 = [(SXNamespacedObjectFactory *)namespacedObjectFactory createNamespacedReferenceForTextStyle:v21 component:v15 DOM:v27];
    id v12 = v17;
    id v17 = (void *)v21;
  }
  else
  {
    uint64_t v22 = [v12 identifier];
  }

  if (v22)
  {
    id v23 = [v27 textStyles];
    uint64_t v24 = [v23 objectForKeyedSubscript:v22];
    v25 = [(SXDarkModeModifier *)self invertedTextStyleForegroundColors:v24 context:v10];

    if (v25)
    {
      id v26 = [v27 textStyles];
      [v26 setObject:v25 forKeyedSubscript:v22];
    }
  }
}

- (id)invertedDocumentStyle:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 JSONRepresentation];
  uint64_t v9 = v8;
  if (!v8) {
    v8 = (void *)MEMORY[0x263EFFA78];
  }
  id v10 = (void *)[v8 mutableCopy];

  id v11 = [v6 backgroundColor];
  id v12 = [MEMORY[0x263F1C550] blackColor];
  uint64_t v13 = [(SXDarkModeModifier *)self invertColor:v11 defaultColor:v12];
  [v10 setObject:v13 forKeyedSubscript:@"backgroundColor"];

  uint64_t v14 = [v6 topBackgroundColor];
  uint64_t v15 = [MEMORY[0x263F1C550] blackColor];
  uint64_t v16 = [(SXDarkModeModifier *)self invertColor:v14 defaultColor:v15];
  [v10 setObject:v16 forKeyedSubscript:@"topBackgroundColor"];

  id v17 = [v6 topBackgroundGradient];

  if (v17)
  {
    v18 = [v6 topBackgroundGradient];
    int v19 = [(SXDarkModeModifier *)self invertedLinearGradient:v18];
    [v10 setObject:v19 forKeyedSubscript:@"topBackgroundGradient"];
  }
  uint64_t v20 = [SXDocumentStyle alloc];
  uint64_t v21 = [v7 specVersion];

  uint64_t v22 = [(SXJSONObject *)v20 initWithJSONObject:v10 andVersion:v21];
  return v22;
}

- (id)invertedComponentStyle:(id)a3 context:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    v8 = [v6 JSONRepresentation];
    uint64_t v9 = (void *)[v8 mutableCopy];

    id v10 = [v6 backgroundColor];

    if (v10)
    {
      id v11 = [v6 backgroundColor];
      id v12 = [(SXDarkModeModifier *)self invertColor:v11 defaultColor:0];
      [v9 setObject:v12 forKeyedSubscript:@"backgroundColor"];
    }
    uint64_t v13 = [v6 fill];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v15 = [v6 fill];
      uint64_t v16 = [(SXDarkModeModifier *)self invertedGradientFill:v15];
      [v9 setObject:v16 forKeyedSubscript:@"fill"];
    }
    id v17 = [v6 shadow];

    if (v17)
    {
      v18 = [v6 shadow];
      int v19 = [(SXDarkModeModifier *)self invertedComponentShadow:v18];
      [v9 setObject:v19 forKeyedSubscript:@"shadow"];
    }
    uint64_t v20 = [v6 border];

    if (v20)
    {
      uint64_t v21 = [v6 border];
      uint64_t v22 = [(SXDarkModeModifier *)self invertedBorder:v21];
      [v9 setObject:v22 forKeyedSubscript:@"border"];
    }
    id v23 = [v6 tableStyle];

    if (v23)
    {
      uint64_t v24 = [v6 tableStyle];
      v25 = [(SXDarkModeModifier *)self invertedDataTableStyle:v24];
      [v9 setObject:v25 forKeyedSubscript:@"tableStyle"];
    }
    id v26 = [SXComponentStyle alloc];
    id v27 = [v7 specVersion];

    uint64_t v28 = [(SXJSONObject *)v26 initWithJSONObject:v9 andVersion:v27];
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

- (id)invertedComponentTextStyleBackgroundColors:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [v6 JSONRepresentation];
    uint64_t v9 = (void *)[v8 mutableCopy];

    id v10 = [v6 backgroundColor];

    if (v10)
    {
      id v11 = [v6 backgroundColor];
      id v12 = [(SXDarkModeModifier *)self invertColor:v11 defaultColor:0];
      [v9 setObject:v12 forKeyedSubscript:@"backgroundColor"];
    }
    uint64_t v13 = [v6 linkStyle];

    if (v13)
    {
      uint64_t v14 = [v6 linkStyle];
      uint64_t v15 = [(SXDarkModeModifier *)self invertedTextStyleBackgroundColors:v14 context:v7];
      uint64_t v16 = [v15 JSONRepresentation];
      [v9 setObject:v16 forKeyedSubscript:@"linkStyle"];
    }
    id v17 = [SXComponentTextStyle alloc];
    v18 = [v7 specVersion];
    int v19 = [(SXJSONObject *)v17 initWithJSONObject:v9 andVersion:v18];
  }
  else
  {
    int v19 = 0;
  }

  return v19;
}

- (id)invertedComponentTextStyleForegroundColors:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [v6 JSONRepresentation];
    uint64_t v9 = (void *)[v8 mutableCopy];

    id v10 = [v6 textColor];

    if (v10)
    {
      id v11 = [v6 textColor];
      id v12 = [(SXDarkModeModifier *)self invertColor:v11 defaultColor:0];
      [v9 setObject:v12 forKeyedSubscript:@"textColor"];
    }
    uint64_t v13 = [v6 stroke];

    if (v13)
    {
      uint64_t v14 = [v6 stroke];
      uint64_t v15 = [(SXDarkModeModifier *)self invertedTextStroke:v14];
      [v9 setObject:v15 forKeyedSubscript:@"stroke"];
    }
    uint64_t v16 = [v6 textShadow];

    if (v16)
    {
      id v17 = [v6 textShadow];
      v18 = [(SXDarkModeModifier *)self invertedTextStroke:v17];
      [v9 setObject:v18 forKeyedSubscript:@"textShadow"];
    }
    int v19 = [v6 dropCapStyle];

    if (v19)
    {
      uint64_t v20 = [v6 dropCapStyle];
      uint64_t v21 = [(SXDarkModeModifier *)self invertedDropCapStyle:v20];
      [v9 setObject:v21 forKeyedSubscript:@"dropCapStyle"];
    }
    uint64_t v22 = [v6 underline];

    if (v22)
    {
      id v23 = [v6 underline];
      uint64_t v24 = [(SXDarkModeModifier *)self invertedTextDecoration:v23];
      [v9 setObject:v24 forKeyedSubscript:@"underline"];
    }
    v25 = [v6 strikethrough];

    if (v25)
    {
      id v26 = [v6 strikethrough];
      id v27 = [(SXDarkModeModifier *)self invertedTextDecoration:v26];
      [v9 setObject:v27 forKeyedSubscript:@"strikethrough"];
    }
    uint64_t v28 = [v6 linkStyle];

    if (v28)
    {
      uint64_t v29 = [v6 linkStyle];
      uint64_t v30 = [(SXDarkModeModifier *)self invertedTextStyleForegroundColors:v29 context:v7];
      uint64_t v31 = [v30 JSONRepresentation];
      [v9 setObject:v31 forKeyedSubscript:@"linkStyle"];
    }
    uint64_t v32 = [SXComponentTextStyle alloc];
    v33 = [v7 specVersion];
    v34 = [(SXJSONObject *)v32 initWithJSONObject:v9 andVersion:v33];
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (id)invertedTextStyleBackgroundColors:(id)a3 context:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    v8 = [v6 JSONRepresentation];
    uint64_t v9 = (void *)[v8 mutableCopy];

    id v10 = [v6 backgroundColor];

    if (v10)
    {
      id v11 = [v6 backgroundColor];
      id v12 = [(SXDarkModeModifier *)self invertColor:v11 defaultColor:0];
      [v9 setObject:v12 forKeyedSubscript:@"backgroundColor"];
    }
    uint64_t v13 = [SXTextStyle alloc];
    uint64_t v14 = [v7 specVersion];

    uint64_t v15 = [(SXJSONObject *)v13 initWithJSONObject:v9 andVersion:v14];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)invertedTextStyleForegroundColors:(id)a3 context:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    v8 = [v6 JSONRepresentation];
    uint64_t v9 = (void *)[v8 mutableCopy];

    id v10 = [v6 textColor];

    if (v10)
    {
      id v11 = [v6 textColor];
      id v12 = [(SXDarkModeModifier *)self invertColor:v11 defaultColor:0];
      [v9 setObject:v12 forKeyedSubscript:@"textColor"];
    }
    uint64_t v13 = [v6 stroke];

    if (v13)
    {
      uint64_t v14 = [v6 stroke];
      uint64_t v15 = [(SXDarkModeModifier *)self invertedTextStroke:v14];
      [v9 setObject:v15 forKeyedSubscript:@"stroke"];
    }
    uint64_t v16 = [v6 textShadow];

    if (v16)
    {
      id v17 = [v6 textShadow];
      v18 = [(SXDarkModeModifier *)self invertedTextStroke:v17];
      [v9 setObject:v18 forKeyedSubscript:@"textShadow"];
    }
    int v19 = [v6 underline];

    if (v19)
    {
      uint64_t v20 = [v6 underline];
      uint64_t v21 = [(SXDarkModeModifier *)self invertedTextDecoration:v20];
      [v9 setObject:v21 forKeyedSubscript:@"underline"];
    }
    uint64_t v22 = [v6 strikethrough];

    if (v22)
    {
      id v23 = [v6 strikethrough];
      uint64_t v24 = [(SXDarkModeModifier *)self invertedTextDecoration:v23];
      [v9 setObject:v24 forKeyedSubscript:@"strikethrough"];
    }
    v25 = [SXTextStyle alloc];
    id v26 = [v7 specVersion];

    id v27 = [(SXJSONObject *)v25 initWithJSONObject:v9 andVersion:v26];
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (id)invertedTextStroke:(id)a3
{
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 color];

  if (v7)
  {
    v8 = [v4 color];
    uint64_t v9 = [(SXDarkModeModifier *)self invertColor:v8 defaultColor:0];
    [v6 setObject:v9 forKeyedSubscript:@"color"];
  }
  return v6;
}

- (id)invertedTextShadow:(id)a3
{
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 color];

  v8 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v9 = [(SXDarkModeModifier *)self invertColor:v7 defaultColor:v8];
  [v6 setObject:v9 forKeyedSubscript:@"color"];

  return v6;
}

- (id)invertedDropCapStyle:(id)a3
{
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 textColor];

  if (v7)
  {
    v8 = [v4 textColor];
    uint64_t v9 = [(SXDarkModeModifier *)self invertColor:v8 defaultColor:0];
    [v6 setObject:v9 forKeyedSubscript:@"textColor"];
  }
  id v10 = [v4 backgroundColor];

  if (v10)
  {
    id v11 = [v4 backgroundColor];
    id v12 = [(SXDarkModeModifier *)self invertColor:v11 defaultColor:0];
    [v6 setObject:v12 forKeyedSubscript:@"backgroundColor"];
  }
  return v6;
}

- (id)invertedTextDecoration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 color];

  if (v7)
  {
    v8 = [v4 color];
    uint64_t v9 = [(SXDarkModeModifier *)self invertColor:v8 defaultColor:0];
    [v6 setObject:v9 forKeyedSubscript:@"color"];
  }
  return v6;
}

- (id)invertedGradientFill:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 colorStops];

  if (v7)
  {
    uint64_t v21 = v6;
    v8 = [MEMORY[0x263EFF980] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v4;
    uint64_t v9 = [v4 colorStops];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v15 = [v14 JSONRepresentation];
          uint64_t v16 = (void *)[v15 mutableCopy];

          id v17 = [v14 color];

          if (v17)
          {
            v18 = [v14 color];
            int v19 = [(SXDarkModeModifier *)self invertColor:v18 defaultColor:0];
            [v16 setObject:v19 forKeyedSubscript:@"color"];
          }
          [v8 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    id v6 = v21;
    [v21 setObject:v8 forKeyedSubscript:@"colorStops"];

    id v4 = v22;
  }

  return v6;
}

- (id)invertedLinearGradient:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 colorStops];

  if (v7)
  {
    uint64_t v21 = v6;
    v8 = [MEMORY[0x263EFF980] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v4;
    uint64_t v9 = [v4 colorStops];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v15 = [v14 JSONRepresentation];
          uint64_t v16 = (void *)[v15 mutableCopy];

          id v17 = [v14 color];

          if (v17)
          {
            v18 = [v14 color];
            int v19 = [(SXDarkModeModifier *)self invertColor:v18 defaultColor:0];
            [v16 setObject:v19 forKeyedSubscript:@"color"];
          }
          [v8 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    id v6 = v21;
    [v21 setObject:v8 forKeyedSubscript:@"colorStops"];

    id v4 = v22;
  }

  return v6;
}

- (id)invertedComponentShadow:(id)a3
{
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 color];

  v8 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v9 = [(SXDarkModeModifier *)self invertColor:v7 defaultColor:v8];
  [v6 setObject:v9 forKeyedSubscript:@"color"];

  return v6;
}

- (id)invertedBorder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 all];

  if (v7)
  {
    v8 = [v4 all];
    uint64_t v9 = [(SXDarkModeModifier *)self invertedStrokeStyle:v8];
    [v6 setObject:v9 forKeyedSubscript:@"all"];
  }
  uint64_t v10 = [v4 top];

  if (v10)
  {
    uint64_t v11 = [v4 top];
    uint64_t v12 = [(SXDarkModeModifier *)self invertedStrokeStyle:v11];
    [v6 setObject:v12 forKeyedSubscript:@"top"];
  }
  uint64_t v13 = [v4 right];

  if (v13)
  {
    uint64_t v14 = [v4 right];
    uint64_t v15 = [(SXDarkModeModifier *)self invertedStrokeStyle:v14];
    [v6 setObject:v15 forKeyedSubscript:@"right"];
  }
  uint64_t v16 = [v4 bottom];

  if (v16)
  {
    id v17 = [v4 bottom];
    v18 = [(SXDarkModeModifier *)self invertedStrokeStyle:v17];
    [v6 setObject:v18 forKeyedSubscript:@"bottom"];
  }
  int v19 = [v4 left];

  if (v19)
  {
    uint64_t v20 = [v4 left];
    uint64_t v21 = [(SXDarkModeModifier *)self invertedStrokeStyle:v20];
    [v6 setObject:v21 forKeyedSubscript:@"left"];
  }
  return v6;
}

- (id)invertedStrokeStyle:(id)a3
{
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 color];

  v8 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v9 = [(SXDarkModeModifier *)self invertColor:v7 defaultColor:v8];
  [v6 setObject:v9 forKeyedSubscript:@"color"];

  return v6;
}

- (id)invertedComponent:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v9 = (SXLineComponent *)v6;
  uint64_t v10 = v9;
  uint64_t v11 = v9;
  if (isKindOfClass)
  {
    uint64_t v12 = [(SXJSONObject *)v9 JSONRepresentation];
    uint64_t v13 = (void *)[v12 mutableCopy];

    uint64_t v14 = [(SXLineComponent *)v10 stroke];

    uint64_t v15 = [(SXDarkModeModifier *)self invertedStrokeStyle:v14];
    [v13 setObject:v15 forKeyedSubscript:@"stroke"];

    uint64_t v16 = [SXLineComponent alloc];
    id v17 = [v7 specVersion];
    uint64_t v11 = [(SXJSONObject *)v16 initWithJSONObject:v13 andVersion:v17];
  }
  return v11;
}

- (id)invertedDataTableStyle:(id)a3
{
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 headerRows];

  if (v7)
  {
    v8 = [v4 headerRows];
    uint64_t v9 = [(SXDarkModeModifier *)self invertedDataTableRowStyle:v8];
    [v6 setObject:v9 forKeyedSubscript:@"headerRows"];
  }
  uint64_t v10 = [v4 headerColumns];

  if (v10)
  {
    uint64_t v11 = [v4 headerColumns];
    uint64_t v12 = [(SXDarkModeModifier *)self invertedDataTableColumnStyle:v11];
    [v6 setObject:v12 forKeyedSubscript:@"headerColumns"];
  }
  uint64_t v13 = [v4 headerCells];

  if (v13)
  {
    uint64_t v14 = [v4 headerCells];
    uint64_t v15 = [(SXDarkModeModifier *)self invertedDataTableCellStyle:v14];
    [v6 setObject:v15 forKeyedSubscript:@"headerCells"];
  }
  uint64_t v16 = [v4 rows];

  if (v16)
  {
    id v17 = [v4 rows];
    v18 = [(SXDarkModeModifier *)self invertedDataTableRowStyle:v17];
    [v6 setObject:v18 forKeyedSubscript:@"rows"];
  }
  int v19 = [v4 columns];

  if (v19)
  {
    uint64_t v20 = [v4 columns];
    uint64_t v21 = [(SXDarkModeModifier *)self invertedDataTableColumnStyle:v20];
    [v6 setObject:v21 forKeyedSubscript:@"columns"];
  }
  id v22 = [v4 cells];

  if (v22)
  {
    long long v23 = [v4 cells];
    long long v24 = [(SXDarkModeModifier *)self invertedDataTableCellStyle:v23];
    [v6 setObject:v24 forKeyedSubscript:@"cells"];
  }
  return v6;
}

- (id)invertedDataTableRowStyle:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 backgroundColor];

  if (v7)
  {
    v8 = [v4 backgroundColor];
    uint64_t v9 = [(SXDarkModeModifier *)self invertColor:v8 defaultColor:0];
    [v6 setObject:v9 forKeyedSubscript:@"backgroundColor"];
  }
  uint64_t v10 = [v4 divider];

  if (v10)
  {
    uint64_t v11 = [v4 divider];
    uint64_t v12 = [(SXDarkModeModifier *)self invertedDataTableBorder:v11];
    [v6 setObject:v12 forKeyedSubscript:@"divider"];
  }
  uint64_t v13 = [v4 conditional];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v15 = objc_msgSend(v4, "conditional", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [(SXDarkModeModifier *)self invertedDataTableRowStyle:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v6 setObject:v14 forKeyedSubscript:@"conditional"];
  }

  return v6;
}

- (id)invertedDataTableColumnStyle:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 backgroundColor];

  if (v7)
  {
    v8 = [v4 backgroundColor];
    uint64_t v9 = [(SXDarkModeModifier *)self invertColor:v8 defaultColor:0];
    [v6 setObject:v9 forKeyedSubscript:@"backgroundColor"];
  }
  uint64_t v10 = [v4 divider];

  if (v10)
  {
    uint64_t v11 = [v4 divider];
    uint64_t v12 = [(SXDarkModeModifier *)self invertedDataTableBorder:v11];
    [v6 setObject:v12 forKeyedSubscript:@"divider"];
  }
  uint64_t v13 = [v4 conditional];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v15 = objc_msgSend(v4, "conditional", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [(SXDarkModeModifier *)self invertedDataTableColumnStyle:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v6 setObject:v14 forKeyedSubscript:@"conditional"];
  }

  return v6;
}

- (id)invertedDataTableCellStyle:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 backgroundColor];

  if (v7)
  {
    v8 = [v4 backgroundColor];
    uint64_t v9 = [(SXDarkModeModifier *)self invertColor:v8 defaultColor:0];
    [v6 setObject:v9 forKeyedSubscript:@"backgroundColor"];
  }
  uint64_t v10 = [v4 border];

  if (v10)
  {
    uint64_t v11 = [v4 border];
    uint64_t v12 = [(SXDarkModeModifier *)self invertedDataTableBorderSides:v11];
    [v6 setObject:v12 forKeyedSubscript:@"border"];
  }
  uint64_t v13 = [v4 conditional];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v15 = objc_msgSend(v4, "conditional", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [(SXDarkModeModifier *)self invertedDataTableCellStyle:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v6 setObject:v14 forKeyedSubscript:@"conditional"];
  }

  return v6;
}

- (id)invertedDataTableBorder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 color];

  v8 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v9 = [(SXDarkModeModifier *)self invertColor:v7 defaultColor:v8];
  [v6 setObject:v9 forKeyedSubscript:@"color"];

  return v6;
}

- (id)invertedDataTableBorderSides:(id)a3
{
  id v4 = a3;
  id v5 = [v4 JSONRepresentation];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 top];

  if (v7)
  {
    v8 = [v4 top];
    uint64_t v9 = [(SXDarkModeModifier *)self invertedDataTableBorder:v8];
    [v6 setObject:v9 forKeyedSubscript:@"top"];
  }
  uint64_t v10 = [v4 right];

  if (v10)
  {
    uint64_t v11 = [v4 right];
    uint64_t v12 = [(SXDarkModeModifier *)self invertedDataTableBorder:v11];
    [v6 setObject:v12 forKeyedSubscript:@"right"];
  }
  uint64_t v13 = [v4 bottom];

  if (v13)
  {
    uint64_t v14 = [v4 bottom];
    uint64_t v15 = [(SXDarkModeModifier *)self invertedDataTableBorder:v14];
    [v6 setObject:v15 forKeyedSubscript:@"bottom"];
  }
  uint64_t v16 = [v4 left];

  if (v16)
  {
    uint64_t v17 = [v4 left];
    uint64_t v18 = [(SXDarkModeModifier *)self invertedDataTableBorder:v17];
    [v6 setObject:v18 forKeyedSubscript:@"left"];
  }
  return v6;
}

- (id)invertColor:(id)a3 defaultColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    uint64_t v12 = [v7 hex];
    goto LABEL_17;
  }
  uint64_t v9 = [(SXDarkModeConfiguration *)self->_configuration colors];

  if (!v9) {
    goto LABEL_4;
  }
  uint64_t v10 = [(SXDarkModeConfiguration *)self->_configuration colors];
  uint64_t v11 = [v6 hex];
  uint64_t v12 = [v10 objectForKey:v11];

  if (!v12)
  {
LABEL_4:
    [(SXDarkModeConfiguration *)self->_configuration saturationThreshold];
    double v14 = v13;
    unint64_t v15 = [(SXDarkModeConfiguration *)self->_configuration inversionBehavior];
    if (v15 == 2)
    {
      double v20 = 0.0;
      [v6 getHue:0 saturation:&v20 lightness:0 alpha:0];
      double v16 = v20;
      if (v20 <= v14)
      {
        uint64_t v17 = objc_msgSend(v6, "invertedLightness", v20);
LABEL_14:
        uint64_t v18 = (void *)v17;

        id v6 = v18;
      }
    }
    else
    {
      if (v15 != 1)
      {
        if (v15) {
          goto LABEL_15;
        }
        double v20 = 0.0;
        [v6 getHue:0 saturation:&v20 brightness:0 alpha:0];
        double v16 = v20;
        if (v20 > v14) {
          goto LABEL_15;
        }
        uint64_t v17 = objc_msgSend(v6, "invertedRGB", v20);
        goto LABEL_14;
      }
      double v20 = 0.0;
      [v6 getHue:0 saturation:&v20 brightness:0 alpha:0];
      double v16 = v20;
      if (v20 <= v14)
      {
        uint64_t v17 = objc_msgSend(v6, "invertedBrightness", v20);
        goto LABEL_14;
      }
    }
LABEL_15:
    uint64_t v12 = objc_msgSend(v6, "hex", v16);
  }

LABEL_17:
  return v12;
}

- (SXDarkModePolicyHandler)policyHandler
{
  return self->_policyHandler;
}

- (SXDarkModeConfiguration)configuration
{
  return self->_configuration;
}

- (SXNamespacedObjectFactory)namespacedObjectFactory
{
  return self->_namespacedObjectFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespacedObjectFactory, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_policyHandler, 0);
}

@end