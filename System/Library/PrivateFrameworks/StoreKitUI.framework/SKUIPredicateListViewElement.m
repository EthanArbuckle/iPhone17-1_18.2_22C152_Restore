@interface SKUIPredicateListViewElement
- (NSArray)predicateViewElements;
- (NSPredicate)compoundEntityValuePredicate;
- (id)applyUpdatesWithElement:(id)a3;
- (void)_enumeratePredicateViewElementsUsingBlock:(id)a3;
- (void)compoundEntityValuePredicate;
- (void)predicateViewElements;
@end

@implementation SKUIPredicateListViewElement

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIPredicateListViewElement *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPredicateListViewElement applyUpdatesWithElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIPredicateListViewElement;
  v13 = [(SKUIViewElement *)&v17 applyUpdatesWithElement:v4];
  if (v13 == self && v4 != self && v4 != 0) {
    objc_storeStrong((id *)&self->_compoundEntityValuePredicate, v4->_compoundEntityValuePredicate);
  }

  return v13;
}

- (NSArray)predicateViewElements
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIPredicateListViewElement *)v3 predicateViewElements];
      }
    }
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  objc_super v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__SKUIPredicateListViewElement_predicateViewElements__block_invoke;
  v13[3] = &unk_1E6422498;
  v13[4] = &v14;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v13];
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSArray *)v11;
}

void __53__SKUIPredicateListViewElement_predicateViewElements__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 elementType] == 88)
  {
    BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v3)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v3 addObject:v7];
  }
}

- (NSPredicate)compoundEntityValuePredicate
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIPredicateListViewElement *)v3 compoundEntityValuePredicate];
      }
    }
  }
  compoundEntityValuePredicate = self->_compoundEntityValuePredicate;
  if (!compoundEntityValuePredicate)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__SKUIPredicateListViewElement_compoundEntityValuePredicate__block_invoke;
    v17[3] = &unk_1E6424D98;
    id v18 = v12;
    id v13 = v12;
    [(SKUIPredicateListViewElement *)self _enumeratePredicateViewElementsUsingBlock:v17];
    uint64_t v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];
    v15 = self->_compoundEntityValuePredicate;
    self->_compoundEntityValuePredicate = v14;

    compoundEntityValuePredicate = self->_compoundEntityValuePredicate;
  }

  return compoundEntityValuePredicate;
}

void __60__SKUIPredicateListViewElement_compoundEntityValuePredicate__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 entityValuePredicate];
  [v2 addObject:v3];
}

- (void)_enumeratePredicateViewElementsUsingBlock:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5)
      {
        -[SKUIPredicateListViewElement _enumeratePredicateViewElementsUsingBlock:](v5, v6, v7, v8, v9, v10, v11, v12);
        if (!v4) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
  }
  if (v4)
  {
LABEL_5:
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__SKUIPredicateListViewElement__enumeratePredicateViewElementsUsingBlock___block_invoke;
    v13[3] = &unk_1E64241C8;
    id v14 = v4;
    [(SKUIViewElement *)self enumerateChildrenUsingBlock:v13];
  }
LABEL_6:
}

void __74__SKUIPredicateListViewElement__enumeratePredicateViewElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 88) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void).cxx_destruct
{
}

- (void)applyUpdatesWithElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)predicateViewElements
{
}

- (void)compoundEntityValuePredicate
{
}

- (void)_enumeratePredicateViewElementsUsingBlock:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end