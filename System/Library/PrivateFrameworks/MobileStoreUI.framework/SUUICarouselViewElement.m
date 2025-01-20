@interface SUUICarouselViewElement
- (SUUICarouselViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIProgressIndicatorViewElement)progressIndicatorElement;
- (double)displayInterval;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)pageComponentType;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SUUICarouselViewElement

- (SUUICarouselViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUICarouselViewElement;
  v9 = [(SUUIViewElement *)&v13 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"displayInterval"];
    if ([v10 length]) {
      [v10 doubleValue];
    }
    else {
      double v11 = -1.0;
    }
    v9->_displayInterval = v11;
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUICarouselViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUICarouselViewElement;
  v5 = [(SUUIViewElement *)&v9 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    [(SUUICarouselViewElement *)v4 displayInterval];
    self->_displayInterval = v7;
  }

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SUUICarouselViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_265400DA0;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SUUICarouselViewElement;
  id v5 = v4;
  [(SUUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __55__SUUICarouselViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 elementType];
  BOOL v4 = (unint64_t)(v3 - 14) > 0x34 || ((1 << (v3 - 14)) & 0x10000800004001) == 0;
  if (!v4 || v3 == 152) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)pageComponentType
{
  return 18;
}

- (SUUIProgressIndicatorViewElement)progressIndicatorElement
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = __Block_byref_object_copy__96;
  v10 = __Block_byref_object_dispose__96;
  id v11 = 0;
  v2 = [(SUUICarouselViewElement *)self children];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SUUICarouselViewElement_progressIndicatorElement__block_invoke;
  v5[3] = &unk_265408B10;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUUIProgressIndicatorViewElement *)v3;
}

void __51__SUUICarouselViewElement_progressIndicatorElement__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 elementType] == 95)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (double)displayInterval
{
  return self->_displayInterval;
}

@end