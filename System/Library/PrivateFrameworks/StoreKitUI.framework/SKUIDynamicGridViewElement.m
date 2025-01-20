@interface SKUIDynamicGridViewElement
- (BOOL)allowsMultipleSelectionDuringEditing;
- (BOOL)hasSectionHeaders;
- (BOOL)isDynamicContainer;
- (BOOL)isMalformed;
- (SKUIDynamicGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)_templateDefinitionTypeToModeValueMap;
- (id)applyUpdatesWithElement:(id)a3;
- (id)bestTemplateDefinitionViewElementFromTemplateDefinitionViewElements:(id)a3 entityValueProvider:(id)a4;
- (id)templateDefinitionViewElementsForType:(id)a3 mode:(id)a4;
- (int64_t)minimumEntityCountForSections;
- (int64_t)pageComponentType;
- (void)_unfilteredEnumerateChildrenUsingBlock:(id)a3;
@end

@implementation SKUIDynamicGridViewElement

- (SKUIDynamicGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDynamicGridViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIDynamicGridViewElement;
  v11 = [(SKUIGridViewElement *)&v15 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"minimumEntityCountForSections"];
    v13 = v12;
    if (v12) {
      v11->_minimumEntityCountForSections = [v12 integerValue];
    }
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIDynamicGridViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIDynamicGridViewElement;
  v5 = [(SKUIGridViewElement *)&v9 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_hasValidTemplateDefinitionMap = 0;
    templateDefinitionTypeToModeValueMap = self->_templateDefinitionTypeToModeValueMap;
    self->_templateDefinitionTypeToModeValueMap = 0;

    self->_minimumEntityCountForSections = [(SKUIDynamicGridViewElement *)v4 minimumEntityCountForSections];
  }

  return v6;
}

- (BOOL)isDynamicContainer
{
  return 1;
}

- (int64_t)pageComponentType
{
  return 8;
}

- (BOOL)allowsMultipleSelectionDuringEditing
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(SKUIDynamicGridViewElement *)self templateDefinitionViewElementsForType:0x1F1C8A6A8 mode:0x1F1C8A688];
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = [v3 count] != 0;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "contentViewElement", (void)v13);
        int64_t v11 = [(SKUIGridViewElement *)self _countOfInputCheckboxesWithBaseElement:v10 limit:1];

        if (!v11)
        {
          BOOL v4 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)hasSectionHeaders
{
  v2 = [(SKUIDynamicGridViewElement *)self templateDefinitionViewElementsForType:0x1F1C8A6C8 mode:0];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isMalformed
{
  v2 = [(SKUIDynamicGridViewElement *)self templateDefinitionViewElementsForType:0x1F1C8A6A8 mode:0];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)bestTemplateDefinitionViewElementFromTemplateDefinitionViewElements:(id)a3 entityValueProvider:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "predicateListViewElement", (void)v19);
        long long v14 = [v13 compoundEntityValuePredicate];
        long long v15 = v14;
        if (v13) {
          BOOL v16 = v14 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16 || [v14 evaluateWithObject:v6])
        {
          id v17 = v12;

          goto LABEL_16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v17 = 0;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v17 = 0;
  }
LABEL_16:

  return v17;
}

- (id)templateDefinitionViewElementsForType:(id)a3 mode:(id)a4
{
  id v6 = [(SKUIDynamicGridViewElement *)self _templateDefinitionTypeToModeValueMap];
  if ([a3 length])
  {
    id v7 = [v6 objectForKey:a3];
  }
  else
  {
    id v7 = 0;
  }
  if (![a3 length] && !v7)
  {
    uint64_t v8 = [v6 allValues];
    id v7 = (id)[v8 firstObject];
  }

  return (id)[v7 templateDefinitionViewElementsForMode:a4];
}

- (id)_templateDefinitionTypeToModeValueMap
{
  if (!self->_hasValidTemplateDefinitionMap)
  {
    self->_hasValidTemplateDefinitionMap = 1;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__SKUIDynamicGridViewElement__templateDefinitionTypeToModeValueMap__block_invoke;
    v5[3] = &unk_1E6423570;
    v5[4] = self;
    [(SKUIDynamicGridViewElement *)self _unfilteredEnumerateChildrenUsingBlock:v5];
  }
  templateDefinitionTypeToModeValueMap = self->_templateDefinitionTypeToModeValueMap;

  return templateDefinitionTypeToModeValueMap;
}

void __67__SKUIDynamicGridViewElement__templateDefinitionTypeToModeValueMap__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  BOOL v3 = [v13 elementType] == 136;
  BOOL v4 = v13;
  if (v3)
  {
    id v5 = v13;
    id v6 = [v5 definitionType];
    if ([v6 length])
    {
      id v7 = *(void **)(*(void *)(a1 + 32) + 304);
      if (!v7)
      {
        uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void **)(v9 + 304);
        *(void *)(v9 + 304) = v8;

        id v7 = *(void **)(*(void *)(a1 + 32) + 304);
      }
      int64_t v11 = [v7 objectForKey:v6];
      if (!v11)
      {
        int64_t v11 = objc_alloc_init(_SKUIDynamicGridTemplateDefinitionModeValueMap);
        [*(id *)(*(void *)(a1 + 32) + 304) setObject:v11 forKey:v6];
      }
      v12 = [v5 definitionMode];
      [(_SKUIDynamicGridTemplateDefinitionModeValueMap *)v11 addTemplateDefinitionViewElement:v5 forMode:v12];
    }
    BOOL v4 = v13;
  }
}

- (void)_unfilteredEnumerateChildrenUsingBlock:(id)a3
{
  id v7 = a3;
  BOOL v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, sel_enumerateChildrenUsingBlock_);
  IMP Implementation = method_getImplementation(InstanceMethod);
  if (Implementation) {
    ((void (*)(SKUIDynamicGridViewElement *, char *, id))Implementation)(self, sel_enumerateChildrenUsingBlock_, v7);
  }
}

- (int64_t)minimumEntityCountForSections
{
  return self->_minimumEntityCountForSections;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDynamicGridViewElement initWithDOMElement:parent:elementFactory:]";
}

@end