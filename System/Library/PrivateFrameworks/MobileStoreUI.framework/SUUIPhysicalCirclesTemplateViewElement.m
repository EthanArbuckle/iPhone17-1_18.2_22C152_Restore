@interface SUUIPhysicalCirclesTemplateViewElement
+ (id)supportedFeatures;
- (NSArray)circleItemElements;
- (SUUILabelViewElement)subtitleElement;
- (SUUILabelViewElement)titleElement;
- (SUUIPaletteViewElement)footerPaletteElement;
- (SUUIPhysicalCirclesTemplateDOMFeature)scriptInterface;
- (SUUIPhysicalCirclesTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (void)dispatchRemovedEventWithChildViewElement:(id)a3;
@end

@implementation SUUIPhysicalCirclesTemplateViewElement

- (SUUIPhysicalCirclesTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIPhysicalCirclesTemplateViewElement;
  v5 = [(SUUIViewElement *)&v10 initWithDOMElement:a3 parent:a4 elementFactory:a5];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(SUUIViewElement *)v5 featureWithName:0x270507BB0];
    scriptInterface = v6->_scriptInterface;
    v6->_scriptInterface = (SUUIPhysicalCirclesTemplateDOMFeature *)v7;
  }
  return v6;
}

- (NSArray)circleItemElements
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__SUUIPhysicalCirclesTemplateViewElement_circleItemElements__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __60__SUUIPhysicalCirclesTemplateViewElement_circleItemElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 59) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)dispatchRemovedEventWithChildViewElement:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIPhysicalCirclesTemplateDOMFeature *)self->_scriptInterface appContext];
  v6 = [(SUUIPhysicalCirclesTemplateViewElement *)self appDocument];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__SUUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke;
  v10[3] = &unk_265408250;
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

void __83__SUUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) retrieveJSElementForViewElement:*(void *)(a1 + 40) jsContext:v3];
  if (v4)
  {
    v5 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __83__SUUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke_2;
    v6[3] = &unk_265408228;
    objc_copyWeak(&v8, (id *)(a1 + 56));
    id v7 = v4;
    [v5 evaluateDelegateBlockSync:v6];

    objc_destroyWeak(&v8);
  }
}

void __83__SUUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  v5 = @"removed";
  v6[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [WeakRetained dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v4 completionBlock:0];
}

- (SUUIPaletteViewElement)footerPaletteElement
{
  return (SUUIPaletteViewElement *)[(SUUIViewElement *)self firstChildForElementType:75];
}

- (SUUILabelViewElement)subtitleElement
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__90;
  id v9 = __Block_byref_object_dispose__90;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__SUUIPhysicalCirclesTemplateViewElement_subtitleElement__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __57__SUUIPhysicalCirclesTemplateViewElement_subtitleElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") == 4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SUUILabelViewElement)titleElement
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__90;
  id v9 = __Block_byref_object_dispose__90;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SUUIPhysicalCirclesTemplateViewElement_titleElement__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __54__SUUIPhysicalCirclesTemplateViewElement_titleElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0x270507BB0;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (SUUIPhysicalCirclesTemplateDOMFeature)scriptInterface
{
  return self->_scriptInterface;
}

- (void).cxx_destruct
{
}

@end