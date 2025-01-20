@interface SXDOMConditionResolverModifier
- (BOOL)hasCheckedInstructions;
- (BOOL)resolveAutoplacement;
- (BOOL)resolveComponentLayouts;
- (BOOL)resolveComponentLayouts:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5;
- (BOOL)resolveComponentStyles;
- (BOOL)resolveComponentStyles:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5;
- (BOOL)resolveComponentTextStyle:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5;
- (BOOL)resolveComponentTextStyles;
- (BOOL)resolveComponents;
- (BOOL)resolveComponents:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5;
- (BOOL)resolveDocumentStyle;
- (BOOL)resolveTextStyles;
- (BOOL)resolveTextStyles:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5;
- (SXConditionValidationContextFactory)validationContextFactory;
- (SXConditionalObjectResolver)advertisementAutoPlacementResolver;
- (SXConditionalObjectResolver)componentLayoutResolver;
- (SXConditionalObjectResolver)componentResolver;
- (SXConditionalObjectResolver)componentStyleResolver;
- (SXConditionalObjectResolver)componentTextStyleResolver;
- (SXConditionalObjectResolver)documentStyleResolver;
- (SXConditionalObjectResolver)suggestedArticlesAutoPlacementResolver;
- (SXConditionalObjectResolver)textStyleResolver;
- (SXConditionalResolverModifierInstructions)instructions;
- (SXDOMConditionResolverModifier)initWithValidationContextFactory:(id)a3 componentResolver:(id)a4 textStyleResolver:(id)a5 componentStyleResolver:(id)a6 componentLayoutResolver:(id)a7 componentTextStyleResolver:(id)a8 advertisementAutoPlacementResolver:(id)a9 suggestedArticlesAutoPlacementResolver:(id)a10 documentStyleResolver:(id)a11 instructions:(id)a12;
- (id)resolveAutoPlacement:(id)a3 validationContext:(id)a4;
- (id)resolveDocumentStyle:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5;
- (void)modifyDOM:(id)a3 context:(id)a4;
@end

@implementation SXDOMConditionResolverModifier

- (SXDOMConditionResolverModifier)initWithValidationContextFactory:(id)a3 componentResolver:(id)a4 textStyleResolver:(id)a5 componentStyleResolver:(id)a6 componentLayoutResolver:(id)a7 componentTextStyleResolver:(id)a8 advertisementAutoPlacementResolver:(id)a9 suggestedArticlesAutoPlacementResolver:(id)a10 documentStyleResolver:(id)a11 instructions:(id)a12
{
  id v34 = a3;
  id obj = a4;
  id v33 = a4;
  id v32 = a5;
  id v26 = a6;
  id v31 = a6;
  id v27 = a7;
  id v30 = a7;
  id v29 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)SXDOMConditionResolverModifier;
  v22 = [(SXDOMConditionResolverModifier *)&v35 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_validationContextFactory, a3);
    objc_storeStrong((id *)&v23->_componentResolver, obj);
    objc_storeStrong((id *)&v23->_textStyleResolver, a5);
    objc_storeStrong((id *)&v23->_componentStyleResolver, v26);
    objc_storeStrong((id *)&v23->_componentLayoutResolver, v27);
    objc_storeStrong((id *)&v23->_componentTextStyleResolver, a8);
    objc_storeStrong((id *)&v23->_advertisementAutoPlacementResolver, a9);
    objc_storeStrong((id *)&v23->_suggestedArticlesAutoPlacementResolver, a10);
    objc_storeStrong((id *)&v23->_documentStyleResolver, a11);
    objc_storeStrong((id *)&v23->_instructions, a12);
  }

  return v23;
}

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  if (!self->_hasCheckedInstructions)
  {
    self->_resolveAutoplacement = [(SXConditionalResolverModifierInstructions *)self->_instructions shouldResolveAutoplacement];
    self->_resolveComponents = [(SXConditionalResolverModifierInstructions *)self->_instructions shouldResolveComponents];
    self->_resolveComponentLayouts = [(SXConditionalResolverModifierInstructions *)self->_instructions shouldResolveComponentLayouts];
    self->_resolveComponentStyles = [(SXConditionalResolverModifierInstructions *)self->_instructions shouldResolveComponentStyles];
    self->_resolveComponentTextStyles = [(SXConditionalResolverModifierInstructions *)self->_instructions shouldResolveComponentTextStyles];
    self->_resolveDocumentStyle = [(SXConditionalResolverModifierInstructions *)self->_instructions shouldResolveDocumentStyle];
    self->_resolveTextStyles = [(SXConditionalResolverModifierInstructions *)self->_instructions shouldResolveTextStyles];
    self->_hasCheckedInstructions = 1;
  }
  if (self->_resolveComponents
    || self->_resolveComponentStyles
    || self->_resolveComponentLayouts
    || self->_resolveComponentTextStyles
    || self->_resolveTextStyles
    || self->_resolveAutoplacement
    || self->_resolveDocumentStyle)
  {
    validationContextFactory = self->_validationContextFactory;
    v8 = [v6 layoutOptions];
    v9 = [(SXConditionValidationContextFactory *)validationContextFactory createContextWithLayoutOptions:v8];

    if (self->_resolveComponents)
    {
      v10 = [v31 components];
      v11 = [v31 analysis];
      v12 = [v11 conditionalObjectAnalysis];
      self->_resolveComponents = [(SXDOMConditionResolverModifier *)self resolveComponents:v10 conditionalObjectAnalysis:v12 validationContext:v9];
    }
    if (self->_resolveTextStyles)
    {
      v13 = [v31 textStyles];
      v14 = [v31 analysis];
      v15 = [v14 conditionalObjectAnalysis];
      self->_resolveTextStyles = [(SXDOMConditionResolverModifier *)self resolveTextStyles:v13 conditionalObjectAnalysis:v15 validationContext:v9];
    }
    if (self->_resolveComponentLayouts)
    {
      v16 = [v31 componentLayouts];
      v17 = [v31 analysis];
      id v18 = [v17 conditionalObjectAnalysis];
      self->_resolveComponentLayouts = [(SXDOMConditionResolverModifier *)self resolveComponentLayouts:v16 conditionalObjectAnalysis:v18 validationContext:v9];
    }
    if (self->_resolveComponentStyles)
    {
      id v19 = [v31 componentStyles];
      id v20 = [v31 analysis];
      id v21 = [v20 conditionalObjectAnalysis];
      self->_resolveComponentStyles = [(SXDOMConditionResolverModifier *)self resolveComponentStyles:v19 conditionalObjectAnalysis:v21 validationContext:v9];
    }
    if (self->_resolveComponentTextStyles)
    {
      v22 = [v31 componentTextStyles];
      v23 = [v31 analysis];
      v24 = [v23 conditionalObjectAnalysis];
      self->_resolveComponentTextStyles = [(SXDOMConditionResolverModifier *)self resolveComponentTextStyle:v22 conditionalObjectAnalysis:v24 validationContext:v9];
    }
    if (self->_resolveAutoplacement)
    {
      v25 = [v31 autoPlacement];
      id v26 = [(SXDOMConditionResolverModifier *)self resolveAutoPlacement:v25 validationContext:v9];
      [v31 setAutoPlacement:v26];
    }
    if (self->_resolveDocumentStyle)
    {
      id v27 = [v31 documentStyle];
      v28 = [v31 analysis];
      id v29 = [v28 conditionalObjectAnalysis];
      id v30 = [(SXDOMConditionResolverModifier *)self resolveDocumentStyle:v27 conditionalObjectAnalysis:v29 validationContext:v9];
      [v31 setDocumentStyle:v30];
    }
  }
}

- (BOOL)resolveComponents:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v11 = [v8 allComponents];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__SXDOMConditionResolverModifier_resolveComponents_conditionalObjectAnalysis_validationContext___block_invoke;
  v16[3] = &unk_264653D68;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  id v20 = &v21;
  id v14 = v9;
  id v19 = v14;
  [v11 enumerateObjectsUsingBlock:v16];

  LOBYTE(v11) = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

void __96__SXDOMConditionResolverModifier_resolveComponents_conditionalObjectAnalysis_validationContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 conditional];

  if (v6)
  {
    v7 = *(void **)(*(void *)(a1 + 32) + 24);
    v20[0] = v5;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    id v9 = [v7 resolveObjects:v8 context:*(void *)(a1 + 40)];

    id v10 = [v9 object];
    if (v10 != v5) {
      [*(id *)(a1 + 48) replaceComponentAtIndex:a3 withComponent:v10];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    v11 = *(void **)(a1 + 56);
    id v12 = [v5 identifier];
    id v13 = [v9 conditionTypes];
    [v11 addComponentIdentifier:v12 conditionTypes:v13];
  }
  id v14 = *(void **)(a1 + 48);
  v15 = [v5 identifier];
  v16 = [v14 componentsForContainerComponentWithIdentifier:v15];

  if (v16)
  {
    char v17 = [*(id *)(a1 + 32) resolveComponents:v16 conditionalObjectAnalysis:*(void *)(a1 + 56) validationContext:*(void *)(a1 + 40)];
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    BOOL v19 = (v17 & 1) != 0 || *(unsigned char *)(v18 + 24) != 0;
    *(unsigned char *)(v18 + 24) = v19;
  }
}

- (BOOL)resolveTextStyles:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v11 = (void *)[v8 copy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__SXDOMConditionResolverModifier_resolveTextStyles_conditionalObjectAnalysis_validationContext___block_invoke;
  v16[3] = &unk_264653D90;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  id v20 = &v21;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  [v11 enumerateKeysAndObjectsUsingBlock:v16];

  LOBYTE(v11) = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

void __96__SXDOMConditionResolverModifier_resolveTextStyles_conditionalObjectAnalysis_validationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 conditional];

  id v8 = v6;
  if (v7)
  {
    id v9 = *(void **)(*(void *)(a1 + 32) + 32);
    v14[0] = v6;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    v11 = [v9 resolveObjects:v10 context:*(void *)(a1 + 40)];

    id v8 = [v11 object];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    if (v8 != v6) {
      [*(id *)(a1 + 48) setObject:v8 forKey:v5];
    }
    id v12 = *(void **)(a1 + 56);
    id v13 = [v11 conditionTypes];
    [v12 addTextStyleIdentifier:v5 conditionTypes:v13];
  }
}

- (BOOL)resolveComponentLayouts:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v11 = (void *)[v8 copy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __102__SXDOMConditionResolverModifier_resolveComponentLayouts_conditionalObjectAnalysis_validationContext___block_invoke;
  v16[3] = &unk_264653DB8;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  id v20 = &v21;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  [v11 enumerateKeysAndObjectsUsingBlock:v16];

  LOBYTE(v11) = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

void __102__SXDOMConditionResolverModifier_resolveComponentLayouts_conditionalObjectAnalysis_validationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 conditional];

  id v8 = v6;
  if (v7)
  {
    id v9 = *(void **)(*(void *)(a1 + 32) + 48);
    v14[0] = v6;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    v11 = [v9 resolveObjects:v10 context:*(void *)(a1 + 40)];

    id v8 = [v11 object];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    if (v8 != v6) {
      [*(id *)(a1 + 48) setObject:v8 forKey:v5];
    }
    id v12 = *(void **)(a1 + 56);
    id v13 = [v11 conditionTypes];
    [v12 addComponentLayoutIdentifier:v5 conditionTypes:v13];
  }
}

- (BOOL)resolveComponentStyles:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v11 = (void *)[v8 copy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __101__SXDOMConditionResolverModifier_resolveComponentStyles_conditionalObjectAnalysis_validationContext___block_invoke;
  v16[3] = &unk_264653DE0;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  id v20 = &v21;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  [v11 enumerateKeysAndObjectsUsingBlock:v16];

  LOBYTE(v11) = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

void __101__SXDOMConditionResolverModifier_resolveComponentStyles_conditionalObjectAnalysis_validationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 conditional];

  id v8 = v6;
  if (v7)
  {
    id v9 = *(void **)(*(void *)(a1 + 32) + 40);
    v14[0] = v6;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    v11 = [v9 resolveObjects:v10 context:*(void *)(a1 + 40)];

    id v8 = [v11 object];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    if (v8 != v6) {
      [*(id *)(a1 + 48) setObject:v8 forKey:v5];
    }
    id v12 = *(void **)(a1 + 56);
    id v13 = [v11 conditionTypes];
    [v12 addComponentStyleIdentifier:v5 conditionTypes:v13];
  }
}

- (BOOL)resolveComponentTextStyle:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v11 = (void *)[v8 copy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __104__SXDOMConditionResolverModifier_resolveComponentTextStyle_conditionalObjectAnalysis_validationContext___block_invoke;
  v16[3] = &unk_264653E08;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  id v20 = &v21;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  [v11 enumerateKeysAndObjectsUsingBlock:v16];

  LOBYTE(v11) = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

void __104__SXDOMConditionResolverModifier_resolveComponentTextStyle_conditionalObjectAnalysis_validationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 conditional];

  id v8 = v6;
  if (v7)
  {
    id v9 = *(void **)(*(void *)(a1 + 32) + 56);
    v14[0] = v6;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    v11 = [v9 resolveObjects:v10 context:*(void *)(a1 + 40)];

    id v8 = [v11 object];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    if (v8 != v6) {
      [*(id *)(a1 + 48) setObject:v8 forKey:v5];
    }
    id v12 = *(void **)(a1 + 56);
    id v13 = [v11 conditionTypes];
    [v12 addComponentTextStyleIdentifier:v5 conditionTypes:v13];
  }
}

- (id)resolveAutoPlacement:(id)a3 validationContext:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 advertisement];
  id v9 = [v6 suggestedArticles];
  if (v8
    && ([v8 conditional], id v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    advertisementAutoPlacementResolver = self->_advertisementAutoPlacementResolver;
    id v12 = [v6 advertisement];
    v26[0] = v12;
    BOOL v13 = 1;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    v15 = [(SXConditionalObjectResolver *)advertisementAutoPlacementResolver resolveObjects:v14 context:v7];

    uint64_t v16 = [v15 object];

    id v8 = (void *)v16;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v13 = 0;
    if (!v9) {
      goto LABEL_8;
    }
  }
  id v17 = [v9 conditional];

  if (v17)
  {
    suggestedArticlesAutoPlacementResolver = self->_suggestedArticlesAutoPlacementResolver;
    id v19 = [v6 suggestedArticles];
    v25 = v19;
    BOOL v13 = 1;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    uint64_t v21 = [(SXConditionalObjectResolver *)suggestedArticlesAutoPlacementResolver resolveObjects:v20 context:v7];

    uint64_t v22 = [v21 object];

    id v9 = (void *)v22;
  }
LABEL_8:
  self->_resolveAutoplacement = v13;
  uint64_t v23 = [[SXResolvedAutoPlacement alloc] initWithAdvertisement:v8 suggestedArticles:v9];

  return v23;
}

- (id)resolveDocumentStyle:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  id v12 = v11;
  if (v11)
  {
    BOOL v13 = [v11 conditional];

    if (v13)
    {
      documentStyleResolver = self->_documentStyleResolver;
      v21[0] = v12;
      BOOL v15 = 1;
      uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
      id v17 = [(SXConditionalObjectResolver *)documentStyleResolver resolveObjects:v16 context:v10];

      id v18 = [v17 object];

      id v19 = [v17 conditionTypes];
      [v9 setDocumentStyleConditionTypes:v19];
    }
    else
    {
      BOOL v15 = 0;
      id v18 = v12;
    }
  }
  else
  {
    BOOL v15 = 0;
    id v18 = 0;
  }
  self->_resolveDocumentStyle = v15;

  return v18;
}

- (SXConditionValidationContextFactory)validationContextFactory
{
  return self->_validationContextFactory;
}

- (SXConditionalObjectResolver)componentResolver
{
  return self->_componentResolver;
}

- (SXConditionalObjectResolver)textStyleResolver
{
  return self->_textStyleResolver;
}

- (SXConditionalObjectResolver)componentStyleResolver
{
  return self->_componentStyleResolver;
}

- (SXConditionalObjectResolver)componentLayoutResolver
{
  return self->_componentLayoutResolver;
}

- (SXConditionalObjectResolver)componentTextStyleResolver
{
  return self->_componentTextStyleResolver;
}

- (SXConditionalObjectResolver)advertisementAutoPlacementResolver
{
  return self->_advertisementAutoPlacementResolver;
}

- (SXConditionalObjectResolver)suggestedArticlesAutoPlacementResolver
{
  return self->_suggestedArticlesAutoPlacementResolver;
}

- (SXConditionalObjectResolver)documentStyleResolver
{
  return self->_documentStyleResolver;
}

- (SXConditionalResolverModifierInstructions)instructions
{
  return self->_instructions;
}

- (BOOL)hasCheckedInstructions
{
  return self->_hasCheckedInstructions;
}

- (BOOL)resolveComponents
{
  return self->_resolveComponents;
}

- (BOOL)resolveComponentStyles
{
  return self->_resolveComponentStyles;
}

- (BOOL)resolveComponentLayouts
{
  return self->_resolveComponentLayouts;
}

- (BOOL)resolveComponentTextStyles
{
  return self->_resolveComponentTextStyles;
}

- (BOOL)resolveTextStyles
{
  return self->_resolveTextStyles;
}

- (BOOL)resolveAutoplacement
{
  return self->_resolveAutoplacement;
}

- (BOOL)resolveDocumentStyle
{
  return self->_resolveDocumentStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_documentStyleResolver, 0);
  objc_storeStrong((id *)&self->_suggestedArticlesAutoPlacementResolver, 0);
  objc_storeStrong((id *)&self->_advertisementAutoPlacementResolver, 0);
  objc_storeStrong((id *)&self->_componentTextStyleResolver, 0);
  objc_storeStrong((id *)&self->_componentLayoutResolver, 0);
  objc_storeStrong((id *)&self->_componentStyleResolver, 0);
  objc_storeStrong((id *)&self->_textStyleResolver, 0);
  objc_storeStrong((id *)&self->_componentResolver, 0);
  objc_storeStrong((id *)&self->_validationContextFactory, 0);
}

@end