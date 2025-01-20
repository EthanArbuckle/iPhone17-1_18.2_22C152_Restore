@interface SUUIChartsTemplateViewElement
- (NSArray)columns;
- (NSString)type;
- (SUUIActivityIndicatorViewElement)activityIndicator;
- (SUUIChartsTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUINavigationBarViewElement)navigationBarElement;
@end

@implementation SUUIChartsTemplateViewElement

- (SUUIChartsTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIChartsTemplateViewElement;
  v9 = [(SUUIViewElement *)&v13 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    uint64_t v10 = [v8 getAttribute:@"type"];
    type = v9->_type;
    v9->_type = (NSString *)v10;
  }
  return v9;
}

- (SUUIActivityIndicatorViewElement)activityIndicator
{
  return (SUUIActivityIndicatorViewElement *)[(SUUIViewElement *)self firstChildForElementType:4];
}

- (NSArray)columns
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__SUUIChartsTemplateViewElement_columns__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __40__SUUIChartsTemplateViewElement_columns__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 21) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (SUUINavigationBarViewElement)navigationBarElement
{
  return (SUUINavigationBarViewElement *)[(SUUIViewElement *)self firstChildForElementType:74];
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end