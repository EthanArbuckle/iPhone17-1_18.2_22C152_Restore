@interface SUUISegmentedControlViewElement
- (NSArray)segmentItemTitles;
- (NSString)moreListTitle;
- (SUUIDividerViewElement)bottomDivider;
- (SUUISegmentedControlViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)initialSelectedItemIndex;
- (int64_t)maximumNumberOfVisibleItems;
- (int64_t)pageComponentType;
- (void)_enumerateItemElementsUsingBlock:(id)a3;
- (void)dispatchEventOfType:(unint64_t)a3 forItemAtIndex:(int64_t)a4;
@end

@implementation SUUISegmentedControlViewElement

- (SUUISegmentedControlViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUISegmentedControlViewElement;
  v9 = [(SUUIViewElement *)&v15 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"maxItems"];
    uint64_t v11 = [v10 integerValue];

    if (v11 < 1) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = v11;
    }
    v9->_maximumNumberOfVisibleItems = v12;
    v13 = [v8 getAttribute:@"moreLabel"];
    if ([v13 length]) {
      objc_storeStrong((id *)&v9->_moreListTitle, v13);
    }
  }
  return v9;
}

- (SUUIDividerViewElement)bottomDivider
{
  return (SUUIDividerViewElement *)[(SUUIViewElement *)self firstChildForElementType:32];
}

- (void)dispatchEventOfType:(unint64_t)a3 forItemAtIndex:(int64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__SUUISegmentedControlViewElement_dispatchEventOfType_forItemAtIndex___block_invoke;
  v4[3] = &__block_descriptor_48_e36_v32__0__SUUIItemViewElement_8Q16_B24l;
  v4[4] = a4;
  v4[5] = a3;
  [(SUUISegmentedControlViewElement *)self _enumerateItemElementsUsingBlock:v4];
}

uint64_t __70__SUUISegmentedControlViewElement_dispatchEventOfType_forItemAtIndex___block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a3)
  {
    result = [a2 dispatchEventOfType:*(void *)(result + 40) canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
    *a4 = 1;
  }
  return result;
}

- (int64_t)initialSelectedItemIndex
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = -1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__SUUISegmentedControlViewElement_initialSelectedItemIndex__block_invoke;
  v4[3] = &unk_265405968;
  v4[4] = &v5;
  [(SUUISegmentedControlViewElement *)self _enumerateItemElementsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __59__SUUISegmentedControlViewElement_initialSelectedItemIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isSelected];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (NSArray)segmentItemTitles
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SUUISegmentedControlViewElement_segmentItemTitles__block_invoke;
  v6[3] = &unk_265405990;
  id v4 = v3;
  id v7 = v4;
  [(SUUISegmentedControlViewElement *)self _enumerateItemElementsUsingBlock:v6];

  return (NSArray *)v4;
}

void __52__SUUISegmentedControlViewElement_segmentItemTitles__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 itemText];
  id v4 = [v3 string];

  [*(id *)(a1 + 32) addObject:v4];
}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4 = (SUUISegmentedControlViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUISegmentedControlViewElement;
  uint64_t v5 = [(SUUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_maximumNumberOfVisibleItems = [(SUUISegmentedControlViewElement *)v4 maximumNumberOfVisibleItems];
    id v7 = [(SUUISegmentedControlViewElement *)v4 moreListTitle];
    moreListTitle = self->_moreListTitle;
    self->_moreListTitle = v7;
  }
  return v6;
}

- (int64_t)pageComponentType
{
  return 24;
}

- (void)_enumerateItemElementsUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__SUUISegmentedControlViewElement__enumerateItemElementsUsingBlock___block_invoke;
  v6[3] = &unk_265403F40;
  id v5 = v4;
  id v7 = v5;
  uint64_t v8 = v9;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __68__SUUISegmentedControlViewElement__enumerateItemElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 elementType] == 59)
  {
    v3 = [v5 itemText];
    id v4 = [v3 string];

    if (v4)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
}

- (int64_t)maximumNumberOfVisibleItems
{
  return self->_maximumNumberOfVisibleItems;
}

- (NSString)moreListTitle
{
  return self->_moreListTitle;
}

- (void).cxx_destruct
{
}

@end