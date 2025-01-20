@interface SUUIStackItemViewElement
- (NSArray)imageElements;
- (SUUILabelViewElement)textElement;
- (int64_t)pageComponentType;
@end

@implementation SUUIStackItemViewElement

- (NSArray)imageElements
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__SUUIStackItemViewElement_imageElements__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __41__SUUIStackItemViewElement_imageElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 49) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (SUUILabelViewElement)textElement
{
  return (SUUILabelViewElement *)[(SUUIViewElement *)self firstChildForElementType:138];
}

- (int64_t)pageComponentType
{
  return 24;
}

@end