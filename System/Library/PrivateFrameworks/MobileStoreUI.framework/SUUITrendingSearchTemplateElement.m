@interface SUUITrendingSearchTemplateElement
- (NSArray)buttons;
- (SUUILabelViewElement)titleLabel;
@end

@implementation SUUITrendingSearchTemplateElement

- (NSArray)buttons
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SUUITrendingSearchTemplateElement_buttons__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __44__SUUITrendingSearchTemplateElement_buttons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (SUUIIKViewElementTypeIsButton([v3 elementType])) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (SUUILabelViewElement)titleLabel
{
  id v3 = [(SUUIViewElement *)self firstChildForElementType:138];
  if (!v3)
  {
    id v4 = [(SUUIViewElement *)self firstChildForElementType:48];
    v5 = [v4 titleLabels];
    id v3 = [v5 firstObject];
  }
  return (SUUILabelViewElement *)v3;
}

@end