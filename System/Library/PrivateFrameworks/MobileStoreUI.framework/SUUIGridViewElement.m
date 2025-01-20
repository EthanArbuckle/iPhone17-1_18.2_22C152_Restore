@interface SUUIGridViewElement
+ (id)supportedFeatures;
- (BOOL)allowsMultipleSelectionDuringEditing;
- (BOOL)showsEditMode;
- (SUUICollectionDOMFeature)collectionFeature;
- (SUUIGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (id)persistenceKey;
- (int64_t)_countOfInputCheckboxesWithBaseElement:(id)a3 limit:(int64_t)a4;
- (int64_t)pageComponentType;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SUUIGridViewElement

- (SUUIGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    v13 = [v8 getAttribute:@"entityProviderID"];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      v12 = [[SUUIDynamicGridViewElement alloc] initWithDOMElement:v8 parent:v9 elementFactory:v10];
LABEL_7:

      goto LABEL_8;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SUUIGridViewElement;
  v12 = [(SUUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v12)
  {
    self = [v8 getAttribute:@"editMode"];
    if ([(SUUIGridViewElement *)self length]) {
      v12->super._showsEditMode = [(SUUIGridViewElement *)self BOOLValue];
    }
    goto LABEL_7;
  }
LABEL_8:

  return &v12->super;
}

+ (id)supportedFeatures
{
  v9[1] = *MEMORY[0x263EF8340];
  v9[0] = 0x2704FB990;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SUUIGridViewElement;
  v4 = objc_msgSendSuper2(&v8, sel_supportedFeatures);
  if (v4)
  {
    v5 = v4;
    id v6 = [v4 arrayByAddingObjectsFromArray:v3];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIGridViewElement *)a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIGridViewElement;
  v5 = [(SUUIViewElement *)&v13 applyUpdatesWithElement:v4];
  p_isa = (id *)&v5->super.super.super.isa;
  if (v4 == self || v5 != self)
  {
    BOOL showsEditMode = self->_showsEditMode;
    if (showsEditMode != [(SUUIGridViewElement *)v5 showsEditMode])
    {
      signed int v9 = atomic_fetch_add_explicit(applyUpdatesWithElement__sGridPersistenceID, 1u, memory_order_relaxed) + 1;
      id v10 = (void *)[objc_alloc(NSNumber) initWithInteger:v9];
      id persistenceKey = self->_persistenceKey;
      self->_id persistenceKey = v10;

      objc_storeStrong(p_isa + 35, self->_persistenceKey);
    }
  }
  else
  {
    id v7 = self->_persistenceKey;
    self->_id persistenceKey = 0;

    self->_BOOL showsEditMode = [(SUUIGridViewElement *)v4 showsEditMode];
  }

  return p_isa;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SUUIGridViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_265400DA0;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SUUIGridViewElement;
  id v5 = v4;
  [(SUUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __51__SUUIGridViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 elementType];
  BOOL v4 = (unint64_t)(v3 - 4) > 0x3E || ((1 << (v3 - 4)) & 0x4000700000000501) == 0;
  if (!v4 || v3 == 152 || v3 == 141) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)pageComponentType
{
  return 8;
}

- (id)persistenceKey
{
  id persistenceKey = self->_persistenceKey;
  if (persistenceKey)
  {
    id v3 = persistenceKey;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIGridViewElement;
    id v3 = [(SUUIViewElement *)&v5 persistenceKey];
  }
  return v3;
}

- (BOOL)allowsMultipleSelectionDuringEditing
{
  v9[0] = 0;
  v9[1] = v9;
  void v9[2] = 0x2020000000;
  char v10 = 0;
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__SUUIGridViewElement_allowsMultipleSelectionDuringEditing__block_invoke;
  v4[3] = &unk_265402D88;
  v4[4] = self;
  v4[5] = &v5;
  v4[6] = v9;
  [(SUUIGridViewElement *)self enumerateChildrenUsingBlock:v4];
  BOOL v2 = v6[3] != 0;
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(v9, 8);
  return v2;
}

uint64_t __59__SUUIGridViewElement_allowsMultipleSelectionDuringEditing__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) _countOfInputCheckboxesWithBaseElement:a2 limit:2 - *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (SUUICollectionDOMFeature)collectionFeature
{
  return (SUUICollectionDOMFeature *)[(SUUIViewElement *)self featureWithName:0x2704FB990];
}

- (int64_t)_countOfInputCheckboxesWithBaseElement:(id)a3 limit:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    if ([v6 elementType] == 18)
    {
      int64_t v8 = v12[3] + 1;
      v12[3] = v8;
    }
    else
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __68__SUUIGridViewElement__countOfInputCheckboxesWithBaseElement_limit___block_invoke;
      v10[3] = &unk_265402460;
      v10[4] = self;
      v10[5] = &v11;
      v10[6] = a4;
      [(SUUIGridViewElement *)self enumerateChildrenUsingBlock:v10];
      int64_t v8 = v12[3];
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

uint64_t __68__SUUIGridViewElement__countOfInputCheckboxesWithBaseElement_limit___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) _countOfInputCheckboxesWithBaseElement:a2 limit:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  if (v8 > v6)
  {
    *(void *)(v7 + 24) = v6;
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  if (v8 == v6) {
    *a3 = 1;
  }
  return result;
}

- (BOOL)showsEditMode
{
  return self->_showsEditMode;
}

- (void).cxx_destruct
{
}

@end