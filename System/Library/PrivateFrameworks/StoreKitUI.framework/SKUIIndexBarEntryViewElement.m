@interface SKUIIndexBarEntryViewElement
- (NSString)targetIndexBarEntryID;
- (SKUIIndexBarEntryViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIViewElement)childElement;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)visibilityPriority;
@end

@implementation SKUIIndexBarEntryViewElement

- (SKUIIndexBarEntryViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIndexBarEntryViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIIndexBarEntryViewElement;
  v11 = [(SKUIViewElement *)&v17 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"targetIndexBarEntryID"];
    if ([v12 length]) {
      objc_storeStrong((id *)&v11->_targetIndexBarEntryID, v12);
    }
    v13 = [v8 getAttribute:@"visibility"];
    if (os_variant_has_internal_content()
      && _os_feature_enabled_impl()
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      -[SKUIIndexBarEntryViewElement initWithDOMElement:parent:elementFactory:]();
    }
    int v14 = [v13 isEqualToString:@"required"];
    uint64_t v15 = 1000;
    if (!v14) {
      uint64_t v15 = 0;
    }
    v11->_visibilityPriority = v15;
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIIndexBarEntryViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIIndexBarEntryViewElement;
  v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SKUIIndexBarEntryViewElement *)v4 targetIndexBarEntryID];
    targetIndexBarEntryID = self->_targetIndexBarEntryID;
    self->_targetIndexBarEntryID = v7;

    self->_visibilityPriority = [(SKUIIndexBarEntryViewElement *)v4 visibilityPriority];
  }

  return v6;
}

- (SKUIViewElement)childElement
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__52;
  id v9 = __Block_byref_object_dispose__52;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SKUIIndexBarEntryViewElement_childElement__block_invoke;
  v4[3] = &unk_1E6422498;
  v4[4] = &v5;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUIViewElement *)v2;
}

void __44__SKUIIndexBarEntryViewElement_childElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (NSString)targetIndexBarEntryID
{
  return self->_targetIndexBarEntryID;
}

- (int64_t)visibilityPriority
{
  return self->_visibilityPriority;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "_SKUIIndexBarEntryVisibilityPriorityFromString";
}

- (void)initWithDOMElement:parent:elementFactory:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIndexBarEntryViewElement initWithDOMElement:parent:elementFactory:]";
}

@end