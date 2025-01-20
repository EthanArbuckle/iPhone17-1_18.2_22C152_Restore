@interface SXDarkModePolicyHandler
- (BOOL)shouldApplyDarkModeToBackgroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5;
- (BOOL)shouldApplyDarkModeToBackgroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5;
- (BOOL)shouldApplyDarkModeToComponent:(id)a3 DOM:(id)a4;
- (BOOL)shouldApplyDarkModeToComponentStyle:(id)a3 component:(id)a4 DOM:(id)a5;
- (BOOL)shouldApplyDarkModeToComponentStylesForComponent:(id)a3 DOM:(id)a4;
- (BOOL)shouldApplyDarkModeToDOM:(id)a3 layoutOptions:(id)a4;
- (BOOL)shouldApplyDarkModeToDocumentStyle:(id)a3 DOM:(id)a4 layoutOptions:(id)a5;
- (BOOL)shouldApplyDarkModeToForegroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5;
- (BOOL)shouldApplyDarkModeToForegroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5;
- (BOOL)shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:(id)a3 DOM:(id)a4;
- (BOOL)shouldApplyDarkModeToTextStyleForegroundColorsForComponent:(id)a3 DOM:(id)a4;
- (NSMutableArray)exceptions;
- (SXDarkModeConfiguration)darkModeConfiguration;
- (SXDarkModePolicyHandler)initWithDocumentProvider:(id)a3 darkModeConfiguration:(id)a4;
- (SXDocumentProviding)documentProvider;
- (void)addPolicyException:(id)a3;
@end

@implementation SXDarkModePolicyHandler

- (SXDarkModePolicyHandler)initWithDocumentProvider:(id)a3 darkModeConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXDarkModePolicyHandler;
  v9 = [(SXDarkModePolicyHandler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_darkModeConfiguration, a4);
    objc_storeStrong((id *)&v10->_documentProvider, a3);
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    exceptions = v10->_exceptions;
    v10->_exceptions = (NSMutableArray *)v11;
  }
  return v10;
}

- (void)addPolicyException:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_exceptions, "addObject:");
  }
}

- (BOOL)shouldApplyDarkModeToDOM:(id)a3 layoutOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 documentStyle];
  uint64_t v9 = [v8 backgroundColor];
  if (v9)
  {
    v10 = (void *)v9;
    uint64_t v11 = [v6 documentStyle];
    v12 = [v11 backgroundColor];
    [v12 _luminance];
    double v14 = v13;

    if (v14 <= 0.5)
    {
LABEL_12:
      char v15 = 0;
      goto LABEL_13;
    }
  }
  else
  {
  }
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    char v15 = 1;
  }
  else
  {
    v16 = [v7 traitCollection];
    uint64_t v17 = [v16 userInterfaceStyle];

    if (v17 != 2
      || ![(SXDarkModeConfiguration *)self->_darkModeConfiguration isAutoDarkModeEnabled])
    {
      goto LABEL_12;
    }
    v18 = [(SXDocumentProviding *)self->_documentProvider document];
    v19 = [v18 colorScheme];

    if (v19 && ![v19 automaticDarkModeEnabled])
    {
      char v15 = 0;
    }
    else
    {
      v20 = [v6 analysis];
      v21 = [v20 conditionalObjectAnalysis];
      v22 = [v21 documentStyleConditionTypes];
      char v23 = [v22 containsObject:SXConditionPreferredColorScheme];

      char v15 = v23 ^ 1;
    }
  }
LABEL_13:

  return v15;
}

- (BOOL)shouldApplyDarkModeToDocumentStyle:(id)a3 DOM:(id)a4 layoutOptions:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (UIAccessibilityIsInvertColorsEnabled()
    || ([v10 traitCollection],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 userInterfaceStyle],
        v11,
        v12 == 2))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v13 = self->_exceptions;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && !objc_msgSend(v18, "shouldApplyDarkModeToDocumentStyle:DOM:", v8, v9, (void)v23))
          {
            LOBYTE(v21) = 0;
            goto LABEL_14;
          }
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    double v13 = [v9 analysis];
    v19 = [(NSMutableArray *)v13 conditionalObjectAnalysis];
    v20 = [v19 documentStyleConditionTypes];
    int v21 = [v20 containsObject:SXConditionPreferredColorScheme] ^ 1;

LABEL_14:
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (BOOL)shouldApplyDarkModeToComponent:(id)a3 DOM:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = self->_exceptions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v13, "shouldApplyDarkModeToComponent:DOM:", v6, v7, (void)v19))
        {
          LOBYTE(v17) = 0;
          goto LABEL_12;
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = [v7 analysis];
  uint64_t v15 = [v14 conditionalObjectAnalysis];
  uint64_t v16 = [v6 identifier];
  id v8 = [v15 conditionTypesUsedByComponent:v16];

  int v17 = [(NSMutableArray *)v8 containsObject:SXConditionPreferredColorScheme] ^ 1;
LABEL_12:

  return v17;
}

- (BOOL)shouldApplyDarkModeToComponentStylesForComponent:(id)a3 DOM:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_exceptions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v13, "shouldApplyDarkModeToComponentStylesForComponent:DOM:", v6, v7, (void)v16))
        {
          BOOL v14 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)shouldApplyDarkModeToComponentStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = self->_exceptions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "shouldApplyDarkModeToComponentStyle:component:DOM:", v8, v9, v10, (void)v22))
        {
          LOBYTE(v20) = 0;
          goto LABEL_12;
        }
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v17 = [v10 analysis];
  long long v18 = [v17 conditionalObjectAnalysis];
  long long v19 = [v8 identifier];
  uint64_t v11 = [v18 conditionTypesUsedByComponentStyle:v19];

  int v20 = [(NSMutableArray *)v11 containsObject:SXConditionPreferredColorScheme] ^ 1;
LABEL_12:

  return v20;
}

- (BOOL)shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:(id)a3 DOM:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_exceptions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v13, "shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:DOM:", v6, v7, (void)v16))
        {
          BOOL v14 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)shouldApplyDarkModeToBackgroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = self->_exceptions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "shouldApplyDarkModeToBackgroundColorsOfComponentTextStyle:component:DOM:", v8, v9, v10, (void)v22))
        {
          LOBYTE(v20) = 0;
          goto LABEL_12;
        }
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v17 = [v10 analysis];
  long long v18 = [v17 conditionalObjectAnalysis];
  long long v19 = [v8 identifier];
  uint64_t v11 = [v18 conditionTypesUsedByComponentTextStyle:v19];

  int v20 = [(NSMutableArray *)v11 containsObject:SXConditionPreferredColorScheme] ^ 1;
LABEL_12:

  return v20;
}

- (BOOL)shouldApplyDarkModeToBackgroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = self->_exceptions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "shouldApplyDarkModeToBackgroundColorsOfTextStyle:component:DOM:", v8, v9, v10, (void)v22))
        {
          LOBYTE(v20) = 0;
          goto LABEL_12;
        }
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v17 = [v10 analysis];
  long long v18 = [v17 conditionalObjectAnalysis];
  long long v19 = [v8 identifier];
  uint64_t v11 = [v18 conditionTypesUsedByTextStyle:v19];

  int v20 = [(NSMutableArray *)v11 containsObject:SXConditionPreferredColorScheme] ^ 1;
LABEL_12:

  return v20;
}

- (BOOL)shouldApplyDarkModeToTextStyleForegroundColorsForComponent:(id)a3 DOM:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_exceptions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v13, "shouldApplyDarkModeToTextStyleForegroundColorsForComponent:DOM:", v6, v7, (void)v16))
        {
          BOOL v14 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)shouldApplyDarkModeToForegroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = self->_exceptions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "shouldApplyDarkModeToForegroundColorsOfComponentTextStyle:component:DOM:", v8, v9, v10, (void)v22))
        {
          LOBYTE(v20) = 0;
          goto LABEL_12;
        }
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v17 = [v10 analysis];
  long long v18 = [v17 conditionalObjectAnalysis];
  long long v19 = [v8 identifier];
  uint64_t v11 = [v18 conditionTypesUsedByComponentTextStyle:v19];

  int v20 = [(NSMutableArray *)v11 containsObject:SXConditionPreferredColorScheme] ^ 1;
LABEL_12:

  return v20;
}

- (BOOL)shouldApplyDarkModeToForegroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = self->_exceptions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "shouldApplyDarkModeToForegroundColorsOfTextStyle:component:DOM:", v8, v9, v10, (void)v22))
        {
          LOBYTE(v20) = 0;
          goto LABEL_12;
        }
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v17 = [v10 analysis];
  long long v18 = [v17 conditionalObjectAnalysis];
  long long v19 = [v8 identifier];
  uint64_t v11 = [v18 conditionTypesUsedByTextStyle:v19];

  int v20 = [(NSMutableArray *)v11 containsObject:SXConditionPreferredColorScheme] ^ 1;
LABEL_12:

  return v20;
}

- (SXDarkModeConfiguration)darkModeConfiguration
{
  return self->_darkModeConfiguration;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (NSMutableArray)exceptions
{
  return self->_exceptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptions, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_darkModeConfiguration, 0);
}

@end