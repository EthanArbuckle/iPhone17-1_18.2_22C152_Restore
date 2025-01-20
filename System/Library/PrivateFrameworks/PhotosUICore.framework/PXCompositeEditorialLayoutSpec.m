@interface PXCompositeEditorialLayoutSpec
+ (PXCompositeEditorialLayoutSpec)defaultSpec;
- (NSArray)templates;
- (NSMapTable)preferredNextTemplatesByCurrentTemplate;
- (PXCompositeEditorialLayoutSpec)init;
- (id)_init;
- (id)preferredNextTemplatesForTemplate:(id)a3;
- (int64_t)maxNumberOfRects;
- (int64_t)minNumberOfColumns;
- (int64_t)minNumberOfRects;
- (void)prepareBuiltinSpec;
@end

@implementation PXCompositeEditorialLayoutSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredNextTemplatesByCurrentTemplate, 0);
  objc_storeStrong((id *)&self->_templates, 0);
}

- (NSMapTable)preferredNextTemplatesByCurrentTemplate
{
  return self->_preferredNextTemplatesByCurrentTemplate;
}

- (int64_t)minNumberOfColumns
{
  return self->_minNumberOfColumns;
}

- (int64_t)maxNumberOfRects
{
  return self->_maxNumberOfRects;
}

- (int64_t)minNumberOfRects
{
  return self->_minNumberOfRects;
}

- (NSArray)templates
{
  return self->_templates;
}

- (id)preferredNextTemplatesForTemplate:(id)a3
{
  return [(NSMapTable *)self->_preferredNextTemplatesByCurrentTemplate objectForKey:a3];
}

- (void)prepareBuiltinSpec
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v24 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0x7FFFFFFFLL;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0x7FFFFFFFLL;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  v2 = objc_msgSend(MEMORY[0x1E4F28B50], "px_bundle");
  v23 = [v2 URLForResource:@"PXCompositeEditorialLayoutTemplate" withExtension:@"json"];

  [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v23];
  v19 = uint64_t v37 = 0;
  v21 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:");
  id v20 = 0;
  if (v20)
  {
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [v21 objectForKeyedSubscript:@"templates"];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __52__PXCompositeEditorialLayoutSpec_prepareBuiltinSpec__block_invoke;
    v32[3] = &unk_1E5DCBF20;
    id v6 = v4;
    id v33 = v6;
    v34 = &v46;
    v35 = &v42;
    v36 = &v38;
    [v5 enumerateObjectsUsingBlock:v32];
    [v21 objectForKeyedSubscript:@"preferredTemplates"];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v50 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v12 = [MEMORY[0x1E4F1CA48] array];
          v13 = [v7 objectForKeyedSubscript:v11];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __52__PXCompositeEditorialLayoutSpec_prepareBuiltinSpec__block_invoke_2;
          v25[3] = &unk_1E5DCBF48;
          id v14 = v6;
          id v26 = v14;
          id v15 = v12;
          id v27 = v15;
          [v13 enumerateObjectsUsingBlock:v25];

          v16 = [v14 objectForKeyedSubscript:v11];
          [v24 setObject:v15 forKey:v16];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v50 count:16];
      }
      while (v8);
    }

    v3 = [v6 allValues];
  }
  templates = self->_templates;
  self->_templates = v3;
  v18 = v3;

  self->_minNumberOfColumns = v47[3];
  self->_minNumberOfRects = v43[3];
  self->_maxNumberOfRects = v39[3];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

void __52__PXCompositeEditorialLayoutSpec_prepareBuiltinSpec__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v14 = [[PXCompositeEditorialLayoutTemplate alloc] initWithDescriptorDictionary:v3];

  v4 = (void *)a1[4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXCompositeEditorialLayoutTemplate identifier](v14, "identifier"));
  [v4 setObject:v14 forKeyedSubscript:v5];

  uint64_t v6 = *(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v7 = [(PXCompositeEditorialLayoutTemplate *)v14 numberOfColumns];
  if (v6 >= v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v6;
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) = v8;
  uint64_t v9 = [(PXCompositeEditorialLayoutTemplate *)v14 numberOfRects];
  uint64_t v10 = *(void *)(a1[6] + 8);
  uint64_t v11 = *(void *)(v10 + 24);
  if (v11 >= v9) {
    uint64_t v11 = v9;
  }
  *(void *)(v10 + 24) = v11;
  uint64_t v12 = *(void *)(a1[7] + 8);
  uint64_t v13 = *(void *)(v12 + 24);
  if (v13 <= v9) {
    uint64_t v13 = v9;
  }
  *(void *)(v12 + 24) = v13;
}

void __52__PXCompositeEditorialLayoutSpec_prepareBuiltinSpec__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)PXCompositeEditorialLayoutSpec;
  v2 = [(PXCompositeEditorialLayoutSpec *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(PXCompositeEditorialLayoutSpec *)v2 prepareBuiltinSpec];
  }
  return v3;
}

- (PXCompositeEditorialLayoutSpec)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXCompositeEditorialLayoutSpec;
  result = [(PXCompositeEditorialLayoutSpec *)&v6 init];
  if (result)
  {
    v4 = result;
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, @"PXCompositeEditorialLayoutSpec.m", 36, @"%s is not available as initializer", "-[PXCompositeEditorialLayoutSpec init]");

    abort();
  }
  return result;
}

+ (PXCompositeEditorialLayoutSpec)defaultSpec
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PXCompositeEditorialLayoutSpec_defaultSpec__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSpec_onceToken != -1) {
    dispatch_once(&defaultSpec_onceToken, block);
  }
  v2 = (void *)defaultSpec_defaultSpec;
  return (PXCompositeEditorialLayoutSpec *)v2;
}

void __45__PXCompositeEditorialLayoutSpec_defaultSpec__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)defaultSpec_defaultSpec;
  defaultSpec_defaultSpec = v1;
}

@end