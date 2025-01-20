@interface SUScriptButton
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)enabled;
- (BOOL)loading;
- (BOOL)shouldPerformDefaultAction;
- (NSString)style;
- (NSString)subtitle;
- (NSString)title;
- (SUScriptButton)initWithSystemItemString:(id)a3;
- (SUScriptCanvasContext)canvas;
- (UIEdgeInsets)imageEdgeInsets;
- (UIImage)image;
- (WebScriptObject)target;
- (id)_action;
- (id)_boxedNativeButton;
- (id)_className;
- (id)_initSUScriptButton;
- (id)_nativeButton;
- (id)_systemItemString;
- (id)action;
- (id)buttonItem;
- (id)nativeButtonOfType:(int)a3;
- (id)scriptAttributeKeys;
- (id)showingConfirmation;
- (int64_t)tag;
- (void)dealloc;
- (void)hideConfirmationAnimated:(BOOL)a3;
- (void)performActionWithArguments:(id)a3;
- (void)setAction:(id)a3;
- (void)setCanvas:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageInsetsTop:(float)a3 left:(float)a4 bottom:(float)a5 right:(float)a6;
- (void)setImageWithURLString:(id)a3 scale:(id)a4;
- (void)setLoading:(BOOL)a3;
- (void)setNativeButton:(id)a3;
- (void)setShouldPerformDefaultAction:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTag:(int64_t)a3;
- (void)setTarget:(id)a3;
- (void)setTitle:(id)a3;
- (void)showConfirmationWithTitle:(id)a3 animated:(BOOL)a4;
@end

@implementation SUScriptButton

- (id)_initSUScriptButton
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptButton;
  id result = [(SUScriptObject *)&v3 init];
  if (result) {
    *((unsigned char *)result + 88) = 1;
  }
  return result;
}

- (SUScriptButton)initWithSystemItemString:(id)a3
{
  v4 = [(SUScriptButton *)self _initSUScriptButton];
  if (v4)
  {
    v5 = [[SUScriptButtonNativeObject alloc] initWithSystemItemString:a3];
    [(SUScriptObject *)v4 setNativeObject:v5];
    [(SUScriptObject *)v4 setNativeObject:+[SUScriptNativeUIBarButtonItem objectWithDefaultButtonForScriptButton:v4]];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptButton;
  [(SUScriptObject *)&v3 dealloc];
}

- (UIImage)image
{
  id v2 = [(SUScriptButton *)self _boxedNativeButton];

  return (UIImage *)[v2 image];
}

- (UIEdgeInsets)imageEdgeInsets
{
  id v2 = [(SUScriptButton *)self _boxedNativeButton];

  [v2 imageInsets];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)nativeButtonOfType:(int)a3
{
  double v5 = [(SUScriptObject *)self nativeObject];
  double v6 = v5;
  if (v5 && [(SUScriptNativeObject *)v5 buttonType] == a3)
  {
    v7 = v6;
  }
  else
  {
    v8 = off_2648115E8;
    if (a3 != 1) {
      v8 = off_2648115F0;
    }
    v9 = (SUScriptNativeObject *)[(__objc2_class *)*v8 objectWithDefaultButtonForScriptButton:self];
    v7 = v9;
    if (v6) {
      [(SUScriptNativeObject *)v9 configureFromScriptButtonNativeObject:v6];
    }
    [(SUScriptObject *)self setNativeObject:v7];
  }

  return [(SUScriptNativeObject *)v7 object];
}

- (void)performActionWithArguments:(id)a3
{
  id action = self->_action;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [action performAction];
  }
  else if (action)
  {
    [(SUScriptButton *)self target];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
LABEL_2:
    }
      WebThreadRun();
  }
}

uint64_t __45__SUScriptButton_performActionWithArguments___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) callWebScriptMethod:@"call" withArguments:*(void *)(a1 + 40)];
}

uint64_t __45__SUScriptButton_performActionWithArguments___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callWebScriptMethod:*(void *)(a1 + 40) withArguments:*(void *)(a1 + 48)];
}

- (void)setImage:(id)a3
{
  id v4 = [(SUScriptButton *)self _boxedNativeButton];

  [v4 setImage:a3];
}

- (void)setNativeButton:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    && (double v5 = objc_opt_class()) != 0)
  {
    uint64_t v6 = [v5 objectWithNativeObject:a3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  [(SUScriptObject *)self setNativeObject:v6];
}

- (id)buttonItem
{
  id v3 = [(SUScriptButton *)self nativeButtonOfType:1];
  SUScriptNavigationItemSetFlagged(v3, 1);
  if (!objc_msgSend((id)objc_msgSend(-[SUScriptObject parentViewController](self, "parentViewController"), "navigationController"), "_popoverController"))goto LABEL_7; {
  id v4 = [(SUScriptButton *)self style];
  }
  uint64_t v5 = 0;
  while (([(id)__BarButtonStyles[v5 + 1] isEqualToString:v4] & 1) == 0)
  {
    v5 += 2;
    if (v5 == 8) {
      return v3;
    }
  }
  if (__BarButtonStyles[v5] == 2)
  {
LABEL_7:
    int v6 = objc_msgSend(-[SUScriptButton _boxedNativeButton](self, "_boxedNativeButton"), "isBackButton");
    v7 = [(SUClientInterface *)[(SUScriptObject *)self clientInterface] appearance];
    if (v6) {
      [(SUUIAppearance *)v7 _styleBackBarButtonItem:v3];
    }
    else {
      [(SUUIAppearance *)v7 styleBarButtonItem:v3];
    }
  }
  return v3;
}

- (id)action
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__7;
  v8 = __Block_byref_object_dispose__7;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __24__SUScriptButton_action__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 72);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SUScriptCanvasContext)canvas
{
  [(SUScriptObject *)self lock];
  id v3 = self->_canvas;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)_className
{
  return @"iTunesButton";
}

- (BOOL)enabled
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __25__SUScriptButton_enabled__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeButton"), "isEnabled");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)hideConfirmationAnimated:(BOOL)a3
{
}

uint64_t __43__SUScriptButton_hideConfirmationAnimated___block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) _boxedNativeButton];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return [v2 hideConfirmationAnimated:v3];
}

- (BOOL)loading
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __25__SUScriptButton_loading__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "isLoading");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAction:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __28__SUScriptButton_setAction___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[9];
  if (v3 != *(void **)(a1 + 40))
  {

    *(void *)(*(void *)(a1 + 32) + 72) = *(id *)(a1 + 40);
    char v2 = *(void **)(a1 + 32);
  }
  uint64_t v4 = (void *)[v2 _boxedNativeButton];
  uint64_t result = [v4 disconnectButtonAction];
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    return [v4 connectButtonAction];
  }
  return result;
}

- (void)setCanvas:(id)a3
{
  [(SUScriptObject *)self lock];
  canvas = self->_canvas;
  if (canvas == a3)
  {
    [(SUScriptObject *)self unlock];
    uint64_t v6 = 0;
  }
  else
  {

    self->_canvas = (SUScriptCanvasContext *)a3;
    uint64_t v6 = (void *)[a3 copyCanvasImage];
    [(SUScriptObject *)self unlock];
    WebThreadRunOnMainThread();
  }
}

uint64_t __28__SUScriptButton_setCanvas___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
}

- (void)setEnabled:(BOOL)a3
{
}

uint64_t __29__SUScriptButton_setEnabled___block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) _nativeButton];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return [v2 setEnabled:v3];
}

- (void)setImageInsetsTop:(float)a3 left:(float)a4 bottom:(float)a5 right:(float)a6
{
}

uint64_t __54__SUScriptButton_setImageInsetsTop_left_bottom_right___block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) _boxedNativeButton];
  double v3 = *(float *)(a1 + 40);
  double v4 = *(float *)(a1 + 44);
  double v5 = *(float *)(a1 + 48);
  double v6 = *(float *)(a1 + 52);

  return objc_msgSend(v2, "setImageInsets:", v3, v4, v5, v6);
}

- (void)setImageWithURLString:(id)a3 scale:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
     || (isKindOfClass & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (!a4 || (objc_opt_respondsToSelector() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    char v7 = (void *)MEMORY[0x263F1FA90];
    [v7 throwException:@"Invalid argument"];
  }
}

void __46__SUScriptButton_setImageWithURLString_scale___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)
    && (uint64_t v2 = [objc_alloc(NSURL) initWithString:*(void *)(a1 + 32)]) != 0)
  {
    id v8 = (id)v2;
    double v3 = *(void **)(a1 + 48);
    if (v3)
    {
      [v3 floatValue];
      double v5 = v4;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
    }
    char v7 = (void *)[*(id *)(a1 + 40) newImageWithURL:v8 scale:v5];
    [*(id *)(a1 + 40) setImage:v7];

    double v6 = v8;
  }
  else
  {
    [*(id *)(a1 + 40) setImage:0];
    double v6 = 0;
  }
}

- (void)setLoading:(BOOL)a3
{
}

uint64_t __29__SUScriptButton_setLoading___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _boxedNativeButton];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return [v2 setLoading:v3];
}

- (void)setStyle:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    double v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __27__SUScriptButton_setStyle___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "setStyleFromString:", *(void *)(a1 + 40));
  [*(id *)(a1 + 32) _boxedNativeButton];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 buttonItem];
  }
  return result;
}

- (void)setSubtitle:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    double v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __30__SUScriptButton_setSubtitle___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _boxedNativeButton];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setSubtitle:v3];
}

- (void)setTag:(int64_t)a3
{
}

uint64_t __25__SUScriptButton_setTag___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _boxedNativeButton];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setTag:v3];
}

- (void)setTitle:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    double v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __27__SUScriptButton_setTitle___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _boxedNativeButton];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setTitle:v3];
}

- (void)showConfirmationWithTitle:(id)a3 animated:(BOOL)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    double v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
}

uint64_t __53__SUScriptButton_showConfirmationWithTitle_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _boxedNativeButton];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);

  return [v2 showConfirmationWithTitle:v3 animated:v4];
}

- (id)showingConfirmation
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    uint64_t v2 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v2 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __37__SUScriptButton_showingConfirmation__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "isShowingConfirmation");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)style
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __23__SUScriptButton_style__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __23__SUScriptButton_style__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "styleString");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)subtitle
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __26__SUScriptButton_subtitle__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __26__SUScriptButton_subtitle__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "subtitle");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int64_t)tag
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __21__SUScriptButton_tag__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "tag");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)title
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  int64_t v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __23__SUScriptButton_title__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __23__SUScriptButton_title__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "title");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setTarget:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = 0;
LABEL_6:
    [(SUScriptObject *)self lock];
    target = self->_target;
    if (target != v5)
    {

      self->_target = v5;
    }
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  uint64_t v5 = (WebScriptObject *)a3;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  uint64_t v8 = (void *)MEMORY[0x263F1FA90];

  [v8 throwException:@"Invalid argument"];
}

- (WebScriptObject)target
{
  [(SUScriptObject *)self lock];
  uint64_t v3 = self->_target;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)_action
{
  return self->_action;
}

- (id)_boxedNativeButton
{
  uint64_t v3 = [(SUScriptObject *)self nativeObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v3 = +[SUScriptNativeUIButton objectWithDefaultButtonForScriptButton:self];
    [(SUScriptObject *)self setNativeObject:v3];
  }
  return v3;
}

- (id)_nativeButton
{
  id v2 = [(SUScriptButton *)self _boxedNativeButton];

  return (id)[v2 object];
}

- (id)_systemItemString
{
  id v2 = [(SUScriptObject *)self nativeObject];

  return (id)[(SUScriptNativeObject *)v2 systemItemString];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_12, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptButton;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_9, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptButton;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptButton;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_12 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __KeyMapping_12 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"action", @"canvas", @"canvas", @"enabled", @"enabled", @"loading", @"loading", @"showingConfirmation", @"showingConfirmation", @"style", @"style", @"subtitle", @"subtitle", @"tag", @"tag", @"title", @"title",
                        @"target",
                        @"target",
                        0);
    __SelectorMapping_9 = (uint64_t)sel_hideConfirmationAnimated_;
    unk_2681B4910 = @"hideConfirmation";
    qword_2681B4918 = (uint64_t)sel_setImageInsetsTop_left_bottom_right_;
    unk_2681B4920 = @"setImageInsets";
    qword_2681B4928 = (uint64_t)sel_setImageWithURLString_scale_;
    unk_2681B4930 = @"setImage";
    qword_2681B4938 = (uint64_t)sel_showConfirmationWithTitle_animated_;
    unk_2681B4940 = @"showConfirmation";
  }
}

- (BOOL)shouldPerformDefaultAction
{
  return self->_shouldPerformDefaultAction;
}

- (void)setShouldPerformDefaultAction:(BOOL)a3
{
  self->_shouldPerformDefaultAction = a3;
}

@end