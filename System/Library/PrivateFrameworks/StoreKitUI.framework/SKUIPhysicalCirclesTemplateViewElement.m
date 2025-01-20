@interface SKUIPhysicalCirclesTemplateViewElement
+ (id)supportedFeatures;
- (NSArray)circleItemElements;
- (SKUILabelViewElement)subtitleElement;
- (SKUILabelViewElement)titleElement;
- (SKUIPaletteViewElement)footerPaletteElement;
- (SKUIPhysicalCirclesTemplateDOMFeature)scriptInterface;
- (SKUIPhysicalCirclesTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (void)dispatchRemovedEventWithChildViewElement:(id)a3;
@end

@implementation SKUIPhysicalCirclesTemplateViewElement

- (SKUIPhysicalCirclesTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPhysicalCirclesTemplateViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIPhysicalCirclesTemplateViewElement;
  v11 = [(SKUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(SKUIViewElement *)v11 featureWithName:0x1F1C91448];
    scriptInterface = v12->_scriptInterface;
    v12->_scriptInterface = (SKUIPhysicalCirclesTemplateDOMFeature *)v13;
  }
  return v12;
}

- (NSArray)circleItemElements
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SKUIPhysicalCirclesTemplateViewElement_circleItemElements__block_invoke;
  v6[3] = &unk_1E6423570;
  id v4 = v3;
  id v7 = v4;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __60__SKUIPhysicalCirclesTemplateViewElement_circleItemElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 59) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)dispatchRemovedEventWithChildViewElement:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIPhysicalCirclesTemplateDOMFeature *)self->_scriptInterface appContext];
  v6 = [(SKUIPhysicalCirclesTemplateViewElement *)self appDocument];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__SKUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke;
  v10[3] = &unk_1E64268E0;
  id v7 = v6;
  id v11 = v7;
  id v8 = v4;
  id v12 = v8;
  id v9 = v5;
  id v13 = v9;
  objc_copyWeak(&v14, &location);
  [v9 evaluate:v10 completionBlock:0];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __83__SKUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) retrieveJSElementForViewElement:*(void *)(a1 + 40) jsContext:v3];
  if (v4)
  {
    v5 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__SKUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke_2;
    v6[3] = &unk_1E64268B8;
    objc_copyWeak(&v8, (id *)(a1 + 56));
    id v7 = v4;
    [v5 evaluateDelegateBlockSync:v6];

    objc_destroyWeak(&v8);
  }
}

void __83__SKUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  v5 = @"removed";
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [WeakRetained dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v4 completionBlock:0];
}

- (SKUIPaletteViewElement)footerPaletteElement
{
  return (SKUIPaletteViewElement *)[(SKUIViewElement *)self firstChildForElementType:75];
}

- (SKUILabelViewElement)subtitleElement
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__36;
  id v9 = __Block_byref_object_dispose__36;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SKUIPhysicalCirclesTemplateViewElement_subtitleElement__block_invoke;
  v4[3] = &unk_1E6422498;
  v4[4] = &v5;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __57__SKUIPhysicalCirclesTemplateViewElement_subtitleElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") == 4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SKUILabelViewElement)titleElement
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__36;
  id v9 = __Block_byref_object_dispose__36;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SKUIPhysicalCirclesTemplateViewElement_titleElement__block_invoke;
  v4[3] = &unk_1E6422498;
  v4[4] = &v5;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __54__SKUIPhysicalCirclesTemplateViewElement_titleElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

+ (id)supportedFeatures
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1C91448;
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (SKUIPhysicalCirclesTemplateDOMFeature)scriptInterface
{
  return self->_scriptInterface;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPhysicalCirclesTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end