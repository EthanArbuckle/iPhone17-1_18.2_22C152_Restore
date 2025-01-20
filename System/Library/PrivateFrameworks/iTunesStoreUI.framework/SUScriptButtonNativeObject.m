@interface SUScriptButtonNativeObject
+ (id)objectWithDefaultButtonForScriptButton:(id)a3;
- (BOOL)isBackButton;
- (BOOL)isEnabled;
- (BOOL)isLoading;
- (BOOL)isShowingConfirmation;
- (NSString)styleString;
- (NSString)subtitle;
- (NSString)systemItemString;
- (SUScriptButtonNativeObject)initWithSystemItemString:(id)a3;
- (UIEdgeInsets)imageInsets;
- (int)buttonType;
- (void)buttonAction:(id)a3;
- (void)configureFromScriptButtonNativeObject:(id)a3;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setLoading:(BOOL)a3;
- (void)setStyleFromString:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation SUScriptButtonNativeObject

- (SUScriptButtonNativeObject)initWithSystemItemString:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptButtonNativeObject;
  v4 = [(SUScriptNativeObject *)&v6 init];
  if (v4) {
    v4->_systemItemString = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptButtonNativeObject;
  [(SUScriptButtonNativeObject *)&v3 dealloc];
}

+ (id)objectWithDefaultButtonForScriptButton:(id)a3
{
  return (id)[a1 objectWithNativeObject:0];
}

- (void)buttonAction:(id)a3
{
  objc_super v3 = [(SUScriptNativeObject *)self scriptObject];
  if ([(SUScriptObject *)v3 shouldPerformDefaultAction])
  {
    id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v3, 0);
    [(SUScriptObject *)v3 performActionWithArguments:v4];
  }
}

- (int)buttonType
{
  return 0;
}

- (void)configureFromScriptButtonNativeObject:(id)a3
{
  -[SUScriptButtonNativeObject setEnabled:](self, "setEnabled:", [a3 isEnabled]);
  -[SUScriptButtonNativeObject setImage:](self, "setImage:", [a3 image]);
  [a3 imageInsets];
  -[SUScriptButtonNativeObject setImageInsets:](self, "setImageInsets:");
  -[SUScriptButtonNativeObject setLoading:](self, "setLoading:", [a3 isLoading]);
  -[SUScriptButtonNativeObject setStyleFromString:](self, "setStyleFromString:", [a3 styleString]);
  -[SUScriptButtonNativeObject setSubtitle:](self, "setSubtitle:", [a3 subtitle]);
  -[SUScriptButtonNativeObject setTag:](self, "setTag:", [a3 tag]);
  uint64_t v5 = [a3 title];

  [(SUScriptButtonNativeObject *)self setTitle:v5];
}

- (UIEdgeInsets)imageInsets
{
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isBackButton
{
  return 0;
}

- (BOOL)isEnabled
{
  id v2 = [(SUScriptNativeObject *)self object];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [v2 isEnabled];
}

- (BOOL)isShowingConfirmation
{
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SUScriptNativeObject *)self object];
  if (objc_opt_respondsToSelector())
  {
    [v4 setEnabled:v3];
  }
}

- (void)setStyleFromString:(id)a3
{
  styleString = self->_styleString;
  if (styleString != a3)
  {

    self->_styleString = (NSString *)a3;
  }
}

- (void)setSubtitle:(id)a3
{
  id v5 = [(SUScriptNativeObject *)self object];
  if (objc_opt_respondsToSelector()) {
    [v5 setSubtitle:a3];
  }
  subtitle = self->_subtitle;
  if (subtitle != a3)
  {

    self->_subtitle = (NSString *)a3;
  }
}

- (NSString)styleString
{
  if (self->_styleString) {
    return self->_styleString;
  }
  else {
    return (NSString *)@"plain";
  }
}

- (NSString)subtitle
{
  subtitle = self->_subtitle;
  id v3 = [(SUScriptNativeObject *)self object];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return subtitle;
  }

  return (NSString *)[v3 subtitle];
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (NSString)systemItemString
{
  return self->_systemItemString;
}

@end