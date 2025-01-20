@interface SUScriptNativeUIBarButtonItem
+ (id)objectWithDefaultButtonForScriptButton:(id)a3;
- (BOOL)isBackButton;
- (BOOL)isLoading;
- (BOOL)isShowingConfirmation;
- (UIEdgeInsets)imageInsets;
- (id)image;
- (id)styleString;
- (id)systemItemString;
- (id)title;
- (int)buttonType;
- (int64_t)tag;
- (void)connectButtonAction;
- (void)destroyNativeObject;
- (void)disconnectButtonAction;
- (void)hideConfirmationAnimated:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageInsets:(UIEdgeInsets)a3;
- (void)setLoading:(BOOL)a3;
- (void)setStyleFromString:(id)a3;
- (void)setTag:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setupNativeObject;
- (void)showConfirmationWithTitle:(id)a3 animated:(BOOL)a4;
@end

@implementation SUScriptNativeUIBarButtonItem

- (id)image
{
  id v2 = [(SUScriptNativeObject *)self object];

  return (id)[v2 image];
}

- (UIEdgeInsets)imageInsets
{
  id v2 = [(SUScriptNativeObject *)self object];

  [v2 imageInsets];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setImage:(id)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setImage:a3];
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(SUScriptNativeObject *)self object];

  objc_msgSend(v7, "setImageInsets:", top, left, bottom, right);
}

- (void)setTag:(int64_t)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setTag:a3];
}

- (void)setTitle:(id)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setTitle:a3];
}

- (int64_t)tag
{
  id v2 = [(SUScriptNativeObject *)self object];

  return [v2 tag];
}

- (id)title
{
  id v2 = [(SUScriptNativeObject *)self object];

  return (id)[v2 title];
}

+ (id)objectWithDefaultButtonForScriptButton:(id)a3
{
  uint64_t v5 = [a3 _systemItemString];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (![(id)__BarButtonSystemItems[v7 + 1] isEqualToString:v6])
    {
      v7 += 2;
      if (v7 == 48)
      {
        uint64_t v8 = 0;
        goto LABEL_8;
      }
    }
    uint64_t v8 = __BarButtonSystemItems[v7];
LABEL_8:
    v9 = [[SUBarButtonItem alloc] initWithBarButtonSystemItem:v8 target:0 action:0];
  }
  else
  {
    v9 = objc_alloc_init(SUBarButtonItem);
  }
  v10 = v9;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setScriptObject:a3];
  [v11 setObject:v10];

  return v11;
}

- (int)buttonType
{
  return 1;
}

- (void)connectButtonAction
{
  if ([(SUScriptObject *)[(SUScriptNativeObject *)self scriptObject] _action])
  {
    id v3 = [(SUScriptNativeObject *)self object];
    id v4 = SUButtonActionPopFromBarButtonItem(v3);
    [v3 setAction:sel_buttonAction_];
    [v3 setTarget:self];
    if ([v4 isActivated])
    {
      [(SUScriptButtonNativeObject *)self buttonAction:v3];
    }
  }
}

- (void)destroyNativeObject
{
  [(SUScriptNativeUIBarButtonItem *)self disconnectButtonAction];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNativeUIBarButtonItem;
  [(SUScriptNativeObject *)&v3 destroyNativeObject];
}

- (void)disconnectButtonAction
{
  id v3 = [(SUScriptNativeObject *)self object];
  if ((SUScriptNativeUIBarButtonItem *)[v3 target] == self)
  {
    [v3 setTarget:0];
  }
}

- (void)hideConfirmationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUScriptNativeObject *)self object];
  uint64_t v6 = [(SUClientInterface *)[(SUScriptObject *)[(SUScriptNativeObject *)self scriptObject] clientInterface] appearance];

  [v5 hideConfirmationWithAppearance:v6 animated:v3];
}

- (BOOL)isBackButton
{
  return self->_isBackButton;
}

- (BOOL)isLoading
{
  id v2 = [(SUScriptNativeObject *)self object];

  return [v2 isLoading];
}

- (BOOL)isShowingConfirmation
{
  id v2 = [(SUScriptNativeObject *)self object];

  return [v2 isShowingConfirmation];
}

- (void)setLoading:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setLoading:v3];
}

- (void)setStyleFromString:(id)a3
{
  id v5 = [(SUScriptNativeObject *)self object];
  uint64_t v6 = 0;
  while (![(id)__BarButtonStyles[v6 + 1] isEqualToString:a3])
  {
    v6 += 2;
    if (v6 == 8)
    {
      uint64_t v7 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v7 = __BarButtonStyles[v6];
LABEL_6:
  [v5 setStyle:v7];
  self->_isBackButton = [a3 isEqualToString:@"back"];
}

- (void)setupNativeObject
{
  [(SUScriptNativeUIBarButtonItem *)self connectButtonAction];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNativeUIBarButtonItem;
  [(SUScriptNativeObject *)&v3 setupNativeObject];
}

- (void)showConfirmationWithTitle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(SUScriptNativeObject *)self object];
  uint64_t v8 = [(SUClientInterface *)[(SUScriptObject *)[(SUScriptNativeObject *)self scriptObject] clientInterface] appearance];

  [v7 showConfirmationWithTitle:a3 appearance:v8 animated:v4];
}

- (id)styleString
{
  if (self->_isBackButton) {
    return @"back";
  }
  uint64_t v3 = objc_msgSend(-[SUScriptNativeObject object](self, "object"), "style");
  uint64_t v4 = 0;
  while (__BarButtonStyles[v4] != v3)
  {
    v4 += 2;
    if (v4 == 8) {
      return 0;
    }
  }
  return (id)__BarButtonStyles[v4 + 1];
}

- (id)systemItemString
{
  uint64_t v2 = objc_msgSend(-[SUScriptNativeObject object](self, "object"), "systemItem");
  uint64_t v3 = 0;
  while (__BarButtonSystemItems[v3] != v2)
  {
    v3 += 2;
    if (v3 == 48) {
      return 0;
    }
  }
  return (id)__BarButtonSystemItems[v3 + 1];
}

@end