@interface SUUISplitViewTemplateElement
+ (id)supportedFeatures;
- (BOOL)usesInlineSplitContent;
- (SUUIJSDOMFeatureNavigationDocument)leftNavigationDocument;
- (SUUIJSDOMFeatureNavigationDocument)rightNavigationDocument;
- (SUUISplitViewTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIViewElement)leftSplitElement;
- (SUUIViewElement)rightSplitElement;
- (id)_splitElementForIndex:(int64_t)a3;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)preferredDisplayMode;
@end

@implementation SUUISplitViewTemplateElement

- (SUUISplitViewTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUISplitViewTemplateElement;
  v9 = [(SUUIViewElement *)&v18 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(SUUIViewElement *)v9 featureWithName:0x270501170];
    leftNavigationDocument = v10->_leftNavigationDocument;
    v10->_leftNavigationDocument = (SUUIJSDOMFeatureNavigationDocument *)v11;

    uint64_t v13 = [(SUUIViewElement *)v10 featureWithName:0x270501190];
    rightNavigationDocument = v10->_rightNavigationDocument;
    v10->_rightNavigationDocument = (SUUIJSDOMFeatureNavigationDocument *)v13;

    v15 = [v8 getAttribute:@"displayMode"];
    if ([v15 isEqualToString:@"all"])
    {
      uint64_t v16 = 2;
    }
    else if ([v15 isEqualToString:@"hidden"])
    {
      uint64_t v16 = 1;
    }
    else
    {
      if (![v15 isEqualToString:@"overlay"])
      {
        v10->_preferredDisplayMode = 0;
        goto LABEL_9;
      }
      uint64_t v16 = 3;
    }
    v10->_preferredDisplayMode = v16;
LABEL_9:
  }
  return v10;
}

- (SUUIJSDOMFeatureNavigationDocument)leftNavigationDocument
{
  return self->_leftNavigationDocument;
}

- (SUUIViewElement)leftSplitElement
{
  return (SUUIViewElement *)[(SUUISplitViewTemplateElement *)self _splitElementForIndex:0];
}

- (SUUIJSDOMFeatureNavigationDocument)rightNavigationDocument
{
  return self->_rightNavigationDocument;
}

- (SUUIViewElement)rightSplitElement
{
  return (SUUIViewElement *)[(SUUISplitViewTemplateElement *)self _splitElementForIndex:1];
}

- (BOOL)usesInlineSplitContent
{
  v3 = [(SUUISplitViewTemplateElement *)self leftSplitElement];
  v4 = [v3 children];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(SUUISplitViewTemplateElement *)self rightSplitElement];
    v7 = [v6 children];
    BOOL v5 = [v7 count] != 0;
  }
  return v5;
}

+ (id)supportedFeatures
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = 0x270501170;
  v4[1] = 0x270501190;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUISplitViewTemplateElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUISplitViewTemplateElement;
  BOOL v5 = [(SUUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self) {
    self->_preferredDisplayMode = [(SUUISplitViewTemplateElement *)v4 preferredDisplayMode];
  }

  return v6;
}

- (id)_splitElementForIndex:(int64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__85;
  uint64_t v13 = __Block_byref_object_dispose__85;
  id v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v4 = [(SUUISplitViewTemplateElement *)self children];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SUUISplitViewTemplateElement__splitElementForIndex___block_invoke;
  v7[3] = &unk_265407CC8;
  v7[5] = &v9;
  v7[6] = a3;
  v7[4] = v8;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __54__SUUISplitViewTemplateElement__splitElementForIndex___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 elementType] == 128)
  {
    uint64_t v7 = *(void *)(a1[4] + 8);
    uint64_t v8 = *(void *)(v7 + 24);
    if (v8 == a1[6])
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
      *a4 = 1;
      uint64_t v7 = *(void *)(a1[4] + 8);
      uint64_t v8 = *(void *)(v7 + 24);
    }
    *(void *)(v7 + 24) = v8 + 1;
  }
}

- (int64_t)preferredDisplayMode
{
  return self->_preferredDisplayMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNavigationDocument, 0);
  objc_storeStrong((id *)&self->_leftNavigationDocument, 0);
}

@end