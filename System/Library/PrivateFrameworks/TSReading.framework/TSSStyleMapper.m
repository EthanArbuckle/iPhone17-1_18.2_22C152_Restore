@interface TSSStyleMapper
- (BOOL)forceMatchStyle;
- (TSSStyleMapper)initWithTargetStylesheet:(id)a3 newStyleDOLCContext:(id)a4;
- (TSSStylesheet)targetStylesheet;
- (id)_mappedStyleForStyle:(id)a3 depth:(unint64_t)a4;
- (id)createStyleForStyle:(id)a3 withPropertyMap:(id)a4;
- (id)mappedStyleForStyle:(id)a3;
- (id)mappedStyleForStyle:(id)a3 inThemeStylesheet:(BOOL)a4;
- (id)pCascadedFindExistingRootlessStyle:(id)a3 propertyMap:(id)a4;
- (id)pTargetParentForStyle:(id)a3 withParentIdentifier:(id)a4;
- (void)dealloc;
- (void)popMappingContext:(id)a3;
- (void)pushMappingContext:(id)a3;
- (void)setForceMatchStyle:(BOOL)a3;
- (void)varyInThemeStylesheetForDurationOfBlock:(id)a3;
- (void)varyInThemeStylesheetIf:(BOOL)a3 forDurationOfBlock:(id)a4;
@end

@implementation TSSStyleMapper

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSSStyleMapper;
  [(TSSStyleMapper *)&v3 dealloc];
}

- (TSSStyleMapper)initWithTargetStylesheet:(id)a3 newStyleDOLCContext:(id)a4
{
  v6 = [(TSSStyleMapper *)self init];
  if (v6)
  {
    v6->_targetStylesheet = (TSSStylesheet *)a3;
    v6->_targetThemeStylesheet = (TSSStylesheet *)(id)[a3 parent];
    v6->_dolcContext = (TSKAddedToDocumentContext *)a4;
    v6->_forceMatchStyle = 0;
  }
  return v6;
}

- (TSSStylesheet)targetStylesheet
{
  uint64_t v2 = 16;
  if (!self->_varyInThemeStylesheet) {
    uint64_t v2 = 8;
  }
  return *(TSSStylesheet **)((char *)&self->super.isa + v2);
}

- (void)pushMappingContext:(id)a3
{
  mappingContext = self->_mappingContext;
  if (!mappingContext)
  {
    mappingContext = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_mappingContext = mappingContext;
  }

  [(NSMutableArray *)mappingContext addObject:a3];
}

- (void)popMappingContext:(id)a3
{
  mappingContext = self->_mappingContext;
  if (mappingContext && [(NSMutableArray *)mappingContext count])
  {
    v5 = self->_mappingContext;
    [(NSMutableArray *)v5 removeLastObject];
  }
}

- (id)pCascadedFindExistingRootlessStyle:(id)a3 propertyMap:(id)a4
{
  id result = [(TSSStylesheet *)self->_targetStylesheet firstRootlessStyleOfClass:objc_opt_class() withOverridePropertyMap:a4];
  if (!result)
  {
    targetThemeStylesheet = self->_targetThemeStylesheet;
    if (targetThemeStylesheet)
    {
      uint64_t v8 = objc_opt_class();
      return [(TSSStylesheet *)targetThemeStylesheet firstRootlessStyleOfClass:v8 withOverridePropertyMap:a4];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)createStyleForStyle:(id)a3 withPropertyMap:(id)a4
{
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", -[TSPObject context](self->_targetStylesheet, "context"), 0, a4, 0);
  [(TSSStylesheet *)self->_targetStylesheet addStyle:v5];

  return v5;
}

- (id)pTargetParentForStyle:(id)a3 withParentIdentifier:(id)a4
{
  id result = [(TSSStylesheet *)self->_targetStylesheet cascadedStyleWithIdentifier:a4];
  if (!result)
  {
    if ([(id)String(a4) isEqualToString:@"imported"])
    {
      return 0;
    }
    else
    {
      id result = (id)String(a4);
      if (result)
      {
        id v7 = result;
        id result = (id)String(a4);
        if (result)
        {
          targetStylesheet = self->_targetStylesheet;
          uint64_t v9 = String((uint64_t)v7, 0, (uint64_t)result);
          return [(TSSStylesheet *)targetStylesheet cascadedStyleWithIdentifier:v9 componentMask:7];
        }
      }
    }
  }
  return result;
}

- (id)_mappedStyleForStyle:(id)a3 depth:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  styleMap = self->_styleMap;
  if (!styleMap) {
    styleMap = (TSURetainedPointerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C8C8]);
  }
  self->_styleMap = styleMap;
  uint64_t v8 = (TSSStylesheet *)[a3 stylesheet];
  if (v8 == self->_targetStylesheet && !self->_varyInThemeStylesheet || v8 == self->_targetThemeStylesheet) {
    return a3;
  }
  id v9 = (id)[(TSURetainedPointerKeyDictionary *)self->_styleMap objectForKeyedSubscript:a3];
  if (!v9)
  {
    id v10 = +[TSSStylePromise promiseForStyle:a3];
    [(TSURetainedPointerKeyDictionary *)self->_styleMap setObject:v10 forKeyedSubscript:a3];
    v11 = objc_opt_new();
    v12 = (void *)[a3 propertyMap];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __45__TSSStyleMapper__mappedStyleForStyle_depth___block_invoke;
    v27[3] = &unk_2646B11C8;
    v27[4] = self;
    v27[5] = v11;
    v27[6] = v12;
    v27[7] = a4;
    [v12 enumeratePropertiesAndObjectsUsingBlock:v27];
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "rootIdentifiedAncestor"), "styleIdentifier");
    if (v13
      && (id v14 = [(TSSStyleMapper *)self pTargetParentForStyle:a3 withParentIdentifier:v13]) != 0)
    {
      id v9 = v14;
      if (self->_forceMatchStyle) {
        goto LABEL_19;
      }
      uint64_t v15 = 16;
      if (!self->_varyInThemeStylesheet) {
        uint64_t v15 = 8;
      }
      v16 = *(Class *)((char *)&self->super.isa + v15);
      objc_msgSend(v12, "filterWithProperties:", objc_msgSend((id)objc_opt_class(), "properties"));
      id v17 = (id)[v16 variationOfStyle:v9 propertyMap:v12];
    }
    else
    {
      id v9 = [(TSSStyleMapper *)self pCascadedFindExistingRootlessStyle:a3 propertyMap:v12];
      if (v9) {
        goto LABEL_19;
      }
      id v17 = [(TSSStyleMapper *)self createStyleForStyle:a3 withPropertyMap:v12];
    }
    id v9 = v17;
    if (!v17)
    {
LABEL_27:

      return v9;
    }
LABEL_19:
    [(TSURetainedPointerKeyDictionary *)self->_styleMap setObject:v9 forKeyedSubscript:a3];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v18 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) addPromisee:v9];
        }
        uint64_t v19 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v19);
    }
    [v10 fulfillWithStyle:v9];
    goto LABEL_27;
  }
  return v9;
}

uint64_t __45__TSSStyleMapper__mappedStyleForStyle_depth___block_invoke(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  if (!a3)
  {
    uint64_t v6 = result;
    objc_opt_class();
    id result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t v7 = [*(id *)(v6 + 32) _mappedStyleForStyle:a4 depth:*(void *)(v6 + 56) + 1];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [*(id *)(v6 + 40) addObject:v7];
      }
      uint64_t v8 = *(void **)(v6 + 48);
      return [v8 setObject:v7 forProperty:a2];
    }
  }
  return result;
}

- (id)mappedStyleForStyle:(id)a3
{
  return [(TSSStyleMapper *)self _mappedStyleForStyle:a3 depth:0];
}

- (id)mappedStyleForStyle:(id)a3 inThemeStylesheet:(BOOL)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  id v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  uint64_t v12 = 0;
  if (a4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __56__TSSStyleMapper_mappedStyleForStyle_inThemeStylesheet___block_invoke;
    v6[3] = &unk_2646B11F0;
    v6[5] = a3;
    v6[6] = &v7;
    v6[4] = self;
    [(TSSStyleMapper *)self varyInThemeStylesheetForDurationOfBlock:v6];
    id v4 = (id)v8[5];
  }
  else
  {
    id v4 = [(TSSStyleMapper *)self mappedStyleForStyle:a3];
    v8[5] = (uint64_t)v4;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __56__TSSStyleMapper_mappedStyleForStyle_inThemeStylesheet___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) mappedStyleForStyle:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (void)varyInThemeStylesheetForDurationOfBlock:(id)a3
{
  if (self->_varyInThemeStylesheet)
  {
    id v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
  else
  {
    self->_varyInThemeStylesheet = 1;
    [(TSSStylesheet *)self->_targetThemeStylesheet setIsLocked:0];
    (*((void (**)(id))a3 + 2))(a3);
    [(TSSStylesheet *)self->_targetThemeStylesheet setIsLocked:1];
    self->_varyInThemeStylesheet = 0;
  }
}

- (void)varyInThemeStylesheetIf:(BOOL)a3 forDurationOfBlock:(id)a4
{
  if (a3) {
    [(TSSStyleMapper *)self varyInThemeStylesheetForDurationOfBlock:a4];
  }
  else {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (BOOL)forceMatchStyle
{
  return self->_forceMatchStyle;
}

- (void)setForceMatchStyle:(BOOL)a3
{
  self->_forceMatchStyle = a3;
}

@end