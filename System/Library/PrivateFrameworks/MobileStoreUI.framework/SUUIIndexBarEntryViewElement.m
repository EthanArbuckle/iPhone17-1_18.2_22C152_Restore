@interface SUUIIndexBarEntryViewElement
- (NSString)targetIndexBarEntryID;
- (SUUIIndexBarEntryViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIViewElement)childElement;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)visibilityPriority;
@end

@implementation SUUIIndexBarEntryViewElement

- (SUUIIndexBarEntryViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIIndexBarEntryViewElement;
  v9 = [(SUUIViewElement *)&v15 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"targetIndexBarEntryID"];
    if ([v10 length]) {
      objc_storeStrong((id *)&v9->_targetIndexBarEntryID, v10);
    }
    v11 = [v8 getAttribute:@"visibility"];
    int v12 = [v11 isEqualToString:@"required"];
    uint64_t v13 = 1000;
    if (!v12) {
      uint64_t v13 = 0;
    }
    v9->_visibilityPriority = v13;
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIIndexBarEntryViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIIndexBarEntryViewElement;
  v5 = [(SUUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SUUIIndexBarEntryViewElement *)v4 targetIndexBarEntryID];
    targetIndexBarEntryID = self->_targetIndexBarEntryID;
    self->_targetIndexBarEntryID = v7;

    self->_visibilityPriority = [(SUUIIndexBarEntryViewElement *)v4 visibilityPriority];
  }

  return v6;
}

- (SUUIViewElement)childElement
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__57;
  v9 = __Block_byref_object_dispose__57;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SUUIIndexBarEntryViewElement_childElement__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUIViewElement *)v2;
}

void __44__SUUIIndexBarEntryViewElement_childElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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

@end