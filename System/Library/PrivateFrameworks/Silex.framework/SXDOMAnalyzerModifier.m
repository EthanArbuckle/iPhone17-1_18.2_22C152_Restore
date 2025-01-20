@interface SXDOMAnalyzerModifier
- (void)analyzeButtonComponent:(id)a3 analysis:(id)a4;
- (void)analyzeComponents:(id)a3 parent:(id)a4 DOM:(id)a5;
- (void)analyzeDataTableCellStyle:(id)a3 component:(id)a4 analysis:(id)a5;
- (void)analyzeDataTableComponent:(id)a3 DOM:(id)a4;
- (void)analyzeDataTableStyle:(id)a3 component:(id)a4 analysis:(id)a5;
- (void)analyzeFormattedText:(id)a3 component:(id)a4 analysis:(id)a5;
- (void)analyzeGalleryComponent:(id)a3 analysis:(id)a4;
- (void)analyzeInlineTextStyle:(id)a3 component:(id)a4 analysis:(id)a5;
- (void)analyzeScalableImageComponent:(id)a3 analysis:(id)a4;
- (void)analyzeTextComponent:(id)a3 analysis:(id)a4;
- (void)modifyDOM:(id)a3 context:(id)a4;
@end

@implementation SXDOMAnalyzerModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = [v5 components];
  [(SXDOMAnalyzerModifier *)self analyzeComponents:v6 parent:0 DOM:v5];
}

- (void)analyzeComponents:(id)a3 parent:(id)a4 DOM:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v25 = a5;
  v9 = [v25 analysis];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v7;
  uint64_t v27 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v10);
        }
        v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v13 = [v12 identifier];
        v14 = [v12 type];
        objc_msgSend(v9, "addComponent:type:role:", v13, v14, objc_msgSend(v12, "role"));

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v15 = [v12 classification];
        v16 = [v15 defaultComponentStyleIdentifiers];

        uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v30 != v19) {
                objc_enumerationMutation(v16);
              }
              [v9 addComponentStyle:*(void *)(*((void *)&v29 + 1) + 8 * j) component:v13];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v18);
        }

        v21 = [v12 style];

        if (v21)
        {
          v22 = [v12 style];
          [v9 addComponentStyle:v22 component:v13];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(SXDOMAnalyzerModifier *)self analyzeTextComponent:v12 analysis:v9];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(SXDOMAnalyzerModifier *)self analyzeScalableImageComponent:v12 analysis:v9];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(SXDOMAnalyzerModifier *)self analyzeButtonComponent:v12 analysis:v9];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(SXDOMAnalyzerModifier *)self analyzeGalleryComponent:v12 analysis:v9];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [(SXDOMAnalyzerModifier *)self analyzeDataTableComponent:v12 DOM:v25];
                }
              }
            }
          }
        }
        v23 = [v10 componentsForContainerComponentWithIdentifier:v13];
        if (v23) {
          [(SXDOMAnalyzerModifier *)self analyzeComponents:v23 parent:v12 DOM:v25];
        }
        if (v8)
        {
          v24 = [v8 identifier];
          [v9 addComponent:v13 parent:v24];
        }
      }
      uint64_t v27 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v27);
  }
}

- (void)analyzeTextComponent:(id)a3 analysis:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v9 = [v6 classification];
  id v10 = [v9 defaultTextStyleIdentifiers];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        [v7 addComponentTextStyle:*(void *)(*((void *)&v26 + 1) + 8 * v14++) component:v8];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  v15 = [v6 textStyle];

  if (v15)
  {
    v16 = [v6 textStyle];
    [v7 addComponentTextStyle:v16 component:v8];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = objc_msgSend(v6, "inlineTextStyles", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [(SXDOMAnalyzerModifier *)self analyzeInlineTextStyle:*(void *)(*((void *)&v22 + 1) + 8 * v21++) component:v6 analysis:v7];
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

- (void)analyzeButtonComponent:(id)a3 analysis:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 identifier];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = objc_msgSend(v5, "classification", 0);
  v9 = [v8 defaultTextStyleIdentifiers];

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
        [v6 addComponentTextStyle:*(void *)(*((void *)&v15 + 1) + 8 * v13++) component:v7];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  uint64_t v14 = [v5 textStyle];
  [v6 addComponentTextStyle:v14 component:v7];
}

- (void)analyzeScalableImageComponent:(id)a3 analysis:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 captionComponent];

  if (v7)
  {
    id v8 = [v9 captionComponent];
    [(SXDOMAnalyzerModifier *)self analyzeFormattedText:v8 component:v9 analysis:v6];
  }
}

- (void)analyzeGalleryComponent:(id)a3 analysis:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = objc_msgSend(v6, "items", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) captionComponent];
        [(SXDOMAnalyzerModifier *)self analyzeFormattedText:v13 component:v6 analysis:v7];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)analyzeDataTableComponent:(id)a3 DOM:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [v7 style];
  id v8 = [v6 componentStyles];
  uint64_t v9 = [v8 objectForKey:v12];

  uint64_t v10 = [v9 tableStyle];
  uint64_t v11 = [v6 analysis];

  [(SXDOMAnalyzerModifier *)self analyzeDataTableStyle:v10 component:v7 analysis:v11];
}

- (void)analyzeFormattedText:(id)a3 component:(id)a4 analysis:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 identifier];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = [v9 classification];
  uint64_t v13 = [v12 defaultTextStyleIdentifiers];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        [v10 addComponentTextStyle:*(void *)(*((void *)&v29 + 1) + 8 * v17++) component:v11];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v15);
  }

  long long v18 = [v8 textStyle];

  if (v18)
  {
    uint64_t v19 = [v8 textStyle];
    [v10 addComponentTextStyle:v19 component:v11];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v20 = objc_msgSend(v8, "inlineTextStyles", 0);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        [(SXDOMAnalyzerModifier *)self analyzeInlineTextStyle:*(void *)(*((void *)&v25 + 1) + 8 * v24++) component:v9 analysis:v10];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v22);
  }
}

- (void)analyzeInlineTextStyle:(id)a3 component:(id)a4 analysis:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v10 = [a3 textStyle];
  id v9 = [v8 identifier];

  [v7 addTextStyle:v10 component:v9];
}

- (void)analyzeDataTableStyle:(id)a3 component:(id)a4 analysis:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = objc_msgSend(v9, "classification", 0);
  id v12 = [v11 defaultTextStyleIdentifiers];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * v16);
        long long v18 = [v9 identifier];
        [v10 addComponentTextStyle:v17 component:v18];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  uint64_t v19 = [v8 cells];
  [(SXDOMAnalyzerModifier *)self analyzeDataTableCellStyle:v19 component:v9 analysis:v10];

  uint64_t v20 = [v8 headerCells];
  [(SXDOMAnalyzerModifier *)self analyzeDataTableCellStyle:v20 component:v9 analysis:v10];
}

- (void)analyzeDataTableCellStyle:(id)a3 component:(id)a4 analysis:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = objc_msgSend(a3, "textStyles", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 addComponentTextStyle:*(void *)(*((void *)&v14 + 1) + 8 * v13++) component:v7];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

@end