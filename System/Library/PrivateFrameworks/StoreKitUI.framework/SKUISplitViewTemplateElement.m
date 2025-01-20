@interface SKUISplitViewTemplateElement
+ (id)supportedFeatures;
- (BOOL)usesInlineSplitContent;
- (SKUIJSDOMFeatureNavigationDocument)leftNavigationDocument;
- (SKUIJSDOMFeatureNavigationDocument)rightNavigationDocument;
- (SKUISplitViewTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIViewElement)leftSplitElement;
- (SKUIViewElement)rightSplitElement;
- (id)_splitElementForIndex:(int64_t)a3;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)preferredDisplayMode;
@end

@implementation SKUISplitViewTemplateElement

- (SKUISplitViewTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISplitViewTemplateElement initWithDOMElement:parent:elementFactory:]();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUISplitViewTemplateElement;
  v11 = [(SKUIViewElement *)&v20 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(SKUIViewElement *)v11 featureWithName:0x1F1C997C8];
    leftNavigationDocument = v12->_leftNavigationDocument;
    v12->_leftNavigationDocument = (SKUIJSDOMFeatureNavigationDocument *)v13;

    uint64_t v15 = [(SKUIViewElement *)v12 featureWithName:0x1F1C997E8];
    rightNavigationDocument = v12->_rightNavigationDocument;
    v12->_rightNavigationDocument = (SKUIJSDOMFeatureNavigationDocument *)v15;

    v17 = [v8 getAttribute:@"displayMode"];
    if ([v17 isEqualToString:@"all"])
    {
      uint64_t v18 = 2;
    }
    else if ([v17 isEqualToString:@"hidden"])
    {
      uint64_t v18 = 1;
    }
    else
    {
      if (![v17 isEqualToString:@"overlay"])
      {
        v12->_preferredDisplayMode = 0;
        goto LABEL_13;
      }
      uint64_t v18 = 3;
    }
    v12->_preferredDisplayMode = v18;
LABEL_13:
  }
  return v12;
}

- (SKUIJSDOMFeatureNavigationDocument)leftNavigationDocument
{
  return self->_leftNavigationDocument;
}

- (SKUIViewElement)leftSplitElement
{
  return (SKUIViewElement *)[(SKUISplitViewTemplateElement *)self _splitElementForIndex:0];
}

- (SKUIJSDOMFeatureNavigationDocument)rightNavigationDocument
{
  return self->_rightNavigationDocument;
}

- (SKUIViewElement)rightSplitElement
{
  return (SKUIViewElement *)[(SKUISplitViewTemplateElement *)self _splitElementForIndex:1];
}

- (BOOL)usesInlineSplitContent
{
  v3 = [(SKUISplitViewTemplateElement *)self leftSplitElement];
  v4 = [v3 children];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(SKUISplitViewTemplateElement *)self rightSplitElement];
    v7 = [v6 children];
    BOOL v5 = [v7 count] != 0;
  }
  return v5;
}

+ (id)supportedFeatures
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1C997C8;
  v4[1] = 0x1F1C997E8;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUISplitViewTemplateElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUISplitViewTemplateElement;
  BOOL v5 = [(SKUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self) {
    self->_preferredDisplayMode = [(SKUISplitViewTemplateElement *)v4 preferredDisplayMode];
  }

  return v6;
}

- (id)_splitElementForIndex:(int64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__29;
  uint64_t v13 = __Block_byref_object_dispose__29;
  id v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v4 = [(SKUISplitViewTemplateElement *)self children];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SKUISplitViewTemplateElement__splitElementForIndex___block_invoke;
  v7[3] = &unk_1E6425F60;
  v7[5] = &v9;
  v7[6] = a3;
  v7[4] = v8;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __54__SKUISplitViewTemplateElement__splitElementForIndex___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISplitViewTemplateElement initWithDOMElement:parent:elementFactory:]";
}

@end