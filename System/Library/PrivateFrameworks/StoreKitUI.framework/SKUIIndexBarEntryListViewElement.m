@interface SKUIIndexBarEntryListViewElement
- (BOOL)isIndexBarHiddenWhenEmpty;
- (NSArray)childIndexBarEntryElements;
- (NSString)targetIndexBarEntryID;
- (SKUIIndexBarEntryListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)entryListElementType;
- (int64_t)minimumEntityCount;
@end

@implementation SKUIIndexBarEntryListViewElement

- (SKUIIndexBarEntryListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIndexBarEntryListViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIIndexBarEntryListViewElement;
  v11 = [(SKUIViewElement *)&v19 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"targetIndexBarEntryID"];
    if ([v12 length]) {
      objc_storeStrong((id *)&v11->_targetIndexBarEntryID, v12);
    }
    v13 = [v8 getAttribute:@"type"];
    if ([v13 isEqualToString:@"dynamicElement"])
    {
      uint64_t v14 = 1;
    }
    else
    {
      int v15 = [v13 isEqualToString:@"localeStandard"];
      uint64_t v14 = 2;
      if (!v15) {
        uint64_t v14 = 0;
      }
    }
    v11->_entryListElementType = v14;

    v16 = [v8 getAttribute:@"indexBarHiddenWhenEmpty"];
    v11->_indexBarHiddenWhenEmpty = [v16 BOOLValue];

    v17 = [v8 getAttribute:@"minimumEntityCount"];
    v11->_minimumEntityCount = [v17 integerValue];
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIIndexBarEntryListViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIIndexBarEntryListViewElement;
  v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_entryListElementType = [(SKUIIndexBarEntryListViewElement *)v4 entryListElementType];
    self->_indexBarHiddenWhenEmpty = [(SKUIIndexBarEntryListViewElement *)v4 isIndexBarHiddenWhenEmpty];
    self->_minimumEntityCount = [(SKUIIndexBarEntryListViewElement *)v4 minimumEntityCount];
    v7 = [(SKUIIndexBarEntryListViewElement *)v4 targetIndexBarEntryID];
    targetIndexBarEntryID = self->_targetIndexBarEntryID;
    self->_targetIndexBarEntryID = v7;
  }

  return v6;
}

- (NSArray)childIndexBarEntryElements
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__22;
  id v9 = __Block_byref_object_dispose__22;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__SKUIIndexBarEntryListViewElement_childIndexBarEntryElements__block_invoke;
  v4[3] = &unk_1E6422498;
  v4[4] = &v5;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __62__SKUIIndexBarEntryListViewElement_childIndexBarEntryElements__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 elementType] == 54)
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v3)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v3 addObject:v7];
  }
}

- (int64_t)entryListElementType
{
  return self->_entryListElementType;
}

- (BOOL)isIndexBarHiddenWhenEmpty
{
  return self->_indexBarHiddenWhenEmpty;
}

- (int64_t)minimumEntityCount
{
  return self->_minimumEntityCount;
}

- (NSString)targetIndexBarEntryID
{
  return self->_targetIndexBarEntryID;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIndexBarEntryListViewElement initWithDOMElement:parent:elementFactory:]";
}

@end