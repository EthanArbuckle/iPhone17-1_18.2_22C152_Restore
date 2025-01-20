@interface SUUINavigationBarViewElement
- (BOOL)hidesBackButton;
- (BOOL)hidesShadow;
- (BOOL)isTransparent;
- (NSArray)mainViewElements;
- (NSArray)navigationPalettes;
- (SUUINavigationBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (UIColor)tintColor;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SUUINavigationBarViewElement

- (SUUINavigationBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUINavigationBarViewElement;
  v9 = [(SUUIViewElement *)&v13 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"hideShadow"];
    v9->_hidesShadow = [v10 BOOLValue];

    v11 = [v8 getAttribute:@"hideBackButton"];
    v9->_hidesBackButton = [v11 BOOLValue];
  }
  return v9;
}

- (BOOL)isTransparent
{
  v2 = [(SUUINavigationBarViewElement *)self style];
  v3 = [v2 ikBackgroundColor];

  if (v3)
  {
    double v7 = 0.0;
    v4 = [v3 color];
    [v4 getWhite:0 alpha:&v7];

    BOOL v5 = v7 < 0.00000011920929;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (UIColor)tintColor
{
  v2 = [(SUUINavigationBarViewElement *)self style];
  v3 = [v2 ikColor];
  v4 = [v3 color];

  return (UIColor *)v4;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUINavigationBarViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUINavigationBarViewElement;
  BOOL v5 = [(SUUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_hidesShadow = [(SUUINavigationBarViewElement *)v4 hidesShadow];
    self->_hidesBackButton = [(SUUINavigationBarViewElement *)v4 hidesBackButton];
  }

  return v6;
}

- (NSArray)mainViewElements
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SUUINavigationBarViewElement_mainViewElements__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __48__SUUINavigationBarViewElement_mainViewElements__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 elementType];
  BOOL v4 = (unint64_t)(v3 - 12) > 0x39 || ((1 << (v3 - 12)) & 0x200004000000003) == 0;
  if (!v4 || (unint64_t)(v3 - 106) <= 0x23 && ((1 << (v3 - 106)) & 0x900000009) != 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (NSArray)navigationPalettes
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__SUUINavigationBarViewElement_navigationPalettes__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __50__SUUINavigationBarViewElement_navigationPalettes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 75) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (BOOL)hidesShadow
{
  return self->_hidesShadow;
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

@end