@interface SUUIPredicateListViewElement
- (NSArray)predicateViewElements;
- (NSPredicate)compoundEntityValuePredicate;
- (id)applyUpdatesWithElement:(id)a3;
- (void)_enumeratePredicateViewElementsUsingBlock:(id)a3;
@end

@implementation SUUIPredicateListViewElement

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIPredicateListViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIPredicateListViewElement;
  v5 = [(SUUIViewElement *)&v9 applyUpdatesWithElement:v4];
  if (v5 == self && v4 != self && v4 != 0) {
    objc_storeStrong((id *)&self->_compoundEntityValuePredicate, v4->_compoundEntityValuePredicate);
  }

  return v5;
}

- (NSArray)predicateViewElements
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  objc_super v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__SUUIPredicateListViewElement_predicateViewElements__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __53__SUUIPredicateListViewElement_predicateViewElements__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 elementType] == 88)
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v3)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v3 addObject:v7];
  }
}

- (NSPredicate)compoundEntityValuePredicate
{
  compoundEntityValuePredicate = self->_compoundEntityValuePredicate;
  if (!compoundEntityValuePredicate)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__SUUIPredicateListViewElement_compoundEntityValuePredicate__block_invoke;
    v9[3] = &unk_265400D78;
    id v10 = v4;
    id v5 = v4;
    [(SUUIPredicateListViewElement *)self _enumeratePredicateViewElementsUsingBlock:v9];
    v6 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v5];
    id v7 = self->_compoundEntityValuePredicate;
    self->_compoundEntityValuePredicate = v6;

    compoundEntityValuePredicate = self->_compoundEntityValuePredicate;
  }
  return compoundEntityValuePredicate;
}

void __60__SUUIPredicateListViewElement_compoundEntityValuePredicate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 entityValuePredicate];
  [v2 addObject:v3];
}

- (void)_enumeratePredicateViewElementsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __74__SUUIPredicateListViewElement__enumeratePredicateViewElementsUsingBlock___block_invoke;
    v6[3] = &unk_265400DA0;
    id v7 = v4;
    [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];
  }
}

void __74__SUUIPredicateListViewElement__enumeratePredicateViewElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 88) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void).cxx_destruct
{
}

@end