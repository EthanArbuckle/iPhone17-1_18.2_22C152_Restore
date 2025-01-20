@interface SUScriptTextField
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)_styleIsValid:(id)a3;
- (BOOL)blur;
- (BOOL)canBecomeFirstResponder;
- (BOOL)focus;
- (NSNumber)width;
- (NSString)autocapitalizationType;
- (NSString)autocorrectionType;
- (NSString)keyboardType;
- (NSString)placeholder;
- (NSString)style;
- (NSString)value;
- (SUScriptTextField)init;
- (SUScriptTextField)initWithTextFieldStyle:(id)a3;
- (WebScriptObject)shouldFocusFunction;
- (double)_defaultWidth;
- (id)_autocapitalizationType;
- (id)_autocorrectionType;
- (id)_boxedNativeTextField;
- (id)_className;
- (id)_copyPlaceholder;
- (id)_copyValue;
- (id)_keyboardType;
- (id)_newTextField;
- (id)buttonItem;
- (id)scriptAttributeKeys;
- (void)dealloc;
- (void)setAutocapitalizationType:(id)a3;
- (void)setAutocorrectionType:(id)a3;
- (void)setKeyboardType:(id)a3;
- (void)setNativeObjectWithBarButtonItem:(id)a3;
- (void)setNativeObjectWithSearchBar:(id)a3;
- (void)setNativeObjectWithTextField:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setShouldFocusFunction:(id)a3;
- (void)setValue:(id)a3;
- (void)setWidth:(id)a3;
@end

@implementation SUScriptTextField

- (SUScriptTextField)init
{
  return [(SUScriptTextField *)self initWithTextFieldStyle:0];
}

- (SUScriptTextField)initWithTextFieldStyle:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)SUScriptTextField;
  v5 = [(SUScriptObject *)&v9 init];
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      if (![(SUScriptTextField *)v5 _styleIsValid:a3])
      {

        return 0;
      }
      v7 = (__CFString *)a3;
    }
    else
    {
      v7 = @"default";
    }
    v6->_style = &v7->isa;
  }
  return v6;
}

- (void)dealloc
{
  [(SUScriptFunction *)self->_shouldFocusFunction setScriptObject:0];
  [(SUScriptFunction *)self->_shouldFocusFunction setThisObject:0];

  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextField;
  [(SUScriptObject *)&v3 dealloc];
}

- (BOOL)canBecomeFirstResponder
{
  shouldFocusFunction = self->_shouldFocusFunction;
  if (!shouldFocusFunction) {
    return 1;
  }
  uint64_t v3 = [(SUScriptFunction *)shouldFocusFunction callSynchronouslyWithArguments:0];
  if (!v3) {
    return 1;
  }
  v4 = (void *)v3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [v4 BOOLValue];
}

- (void)setNativeObjectWithBarButtonItem:(id)a3
{
  if (a3) {
    a3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptTextFieldNativeObjectUIBarButtonItem, "objectWithNativeObject:");
  }

  [(SUScriptObject *)self setNativeObject:a3];
}

- (void)setNativeObjectWithSearchBar:(id)a3
{
  if (a3) {
    a3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptTextFieldNativeObjectUISearchBar, "objectWithNativeObject:");
  }

  [(SUScriptObject *)self setNativeObject:a3];
}

- (void)setNativeObjectWithTextField:(id)a3
{
  if (a3) {
    a3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptTextFieldNativeObjectUITextField, "objectWithNativeObject:");
  }

  [(SUScriptObject *)self setNativeObject:a3];
}

- (id)buttonItem
{
  uint64_t v3 = objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [(SUScriptObject *)self copyObjectForScriptFromPoolWithClass:objc_opt_class()];
    [v4 setCustomView:v3];
    SUScriptNavigationItemSetFlagged(v4, 1);
    id v5 = v4;
    return v4;
  }
  return v3;
}

- (BOOL)blur
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __25__SUScriptTextField_blur__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField"), "resignFirstResponder");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)focus
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __26__SUScriptTextField_focus__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField"), "becomeFirstResponder");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)autocapitalizationType
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  char v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __43__SUScriptTextField_autocapitalizationType__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __43__SUScriptTextField_autocapitalizationType__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _autocapitalizationType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)autocorrectionType
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  char v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __39__SUScriptTextField_autocorrectionType__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __39__SUScriptTextField_autocorrectionType__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _autocorrectionType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return @"iTunesTextField";
}

- (NSString)keyboardType
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  char v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __33__SUScriptTextField_keyboardType__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __33__SUScriptTextField_keyboardType__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) _keyboardType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)placeholder
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  char v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __32__SUScriptTextField_placeholder__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __32__SUScriptTextField_placeholder__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copyPlaceholder];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setAutocapitalizationType:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && __SUAutocapitalizationTypeForString(a3) != -1)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __47__SUScriptTextField_setAutocapitalizationType___block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) _boxedNativeTextField];
  uint64_t v3 = __SUAutocapitalizationTypeForString(*(void **)(a1 + 40));

  return [v2 setAutocapitalizationType:v3];
}

- (void)setAutocorrectionType:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (([a3 isEqualToString:@"default"] & 1) != 0
     || ([a3 isEqualToString:@"no"] & 1) != 0
     || ([a3 isEqualToString:@"yes"] & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __43__SUScriptTextField_setAutocorrectionType___block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) _boxedNativeTextField];
  uint64_t v3 = __SUAutocorrectionTypeForString(*(void *)(a1 + 40));

  return [v2 setAutocorrectionType:v3];
}

- (void)setKeyboardType:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && __SUKeyboardTypeForString((uint64_t)a3) != -1)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __37__SUScriptTextField_setKeyboardType___block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) _boxedNativeTextField];
  uint64_t v3 = __SUKeyboardTypeForString(*(void *)(a1 + 40));

  return [v2 setKeyboardType:v3];
}

- (void)setPlaceholder:(id)a3
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
    id v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __36__SUScriptTextField_setPlaceholder___block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) _boxedNativeTextField];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setPlaceholder:v3];
}

- (void)setShouldFocusFunction:(id)a3
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
    id v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __44__SUScriptTextField_setShouldFocusFunction___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(*(void *)(a1 + 32) + 72);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 72) = objc_alloc_init(SUScriptFunction);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setThisObject:");
    char v2 = *(void **)(*(void *)(a1 + 32) + 72);
  }
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setScriptObject:v3];
}

- (void)setValue:(id)a3
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
    id v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __30__SUScriptTextField_setValue___block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) _boxedNativeTextField];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setValue:v3];
}

- (void)setWidth:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __30__SUScriptTextField_setWidth___block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) _boxedNativeTextField];
  [*(id *)(a1 + 40) floatValue];
  double v4 = v3;

  return [v2 setWidth:v4];
}

- (WebScriptObject)shouldFocusFunction
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  char v2 = (void *)v9[5];
  if (v2) {
    float v3 = v2;
  }
  else {
    float v3 = (WebScriptObject *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __40__SUScriptTextField_shouldFocusFunction__block_invoke, &unk_264812E70, self, &v8);
  }
  double v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __40__SUScriptTextField_shouldFocusFunction__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 72) scriptObject];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)style
{
  return self->_style;
}

- (NSString)value
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  char v2 = (void *)v9[5];
  if (v2) {
    float v3 = v2;
  }
  else {
    float v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __26__SUScriptTextField_value__block_invoke, &unk_264812E70, self, &v8);
  }
  double v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __26__SUScriptTextField_value__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copyValue];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)width
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v5 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = v8[3];
  *(float *)&double v2 = v2;
  float v3 = (NSNumber *)objc_msgSend(NSNumber, "numberWithFloat:", v2, v5, 3221225472, __26__SUScriptTextField_width__block_invoke, &unk_264812E70, self, &v7);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __26__SUScriptTextField_width__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField"), "width");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (id)_autocapitalizationType
{
  unint64_t v2 = objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "autocapitalizationType");
  if (v2 > 3) {
    return @"sentences";
  }
  else {
    return off_264813148[v2];
  }
}

- (id)_autocorrectionType
{
  uint64_t v2 = objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "autocorrectionType");
  uint64_t v3 = @"default";
  if (v2 == 2) {
    uint64_t v3 = @"yes";
  }
  if (v2 == 1) {
    return @"no";
  }
  else {
    return v3;
  }
}

- (id)_copyPlaceholder
{
  uint64_t v2 = objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "placeholder");

  return v2;
}

- (id)_copyValue
{
  uint64_t v2 = objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "value");

  return v2;
}

- (id)_keyboardType
{
  uint64_t v2 = objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "keyboardType");
  if ((unint64_t)(v2 - 1) > 6) {
    return @"default";
  }
  else {
    return (id)qword_264813168[v2 - 1];
  }
}

- (id)_boxedNativeTextField
{
  uint64_t v3 = [(SUScriptObject *)self nativeObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [(SUScriptTextField *)self _newTextField];
    uint64_t v3 = +[SUScriptNativeObject objectWithNativeObject:v4];
    [(SUScriptObject *)self setNativeObject:v3];
  }
  return v3;
}

- (double)_defaultWidth
{
  return dbl_2279242A0[objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1];
}

- (id)_newTextField
{
  if ([(NSString *)[(SUScriptTextField *)self style] isEqualToString:@"search"])
  {
    id v3 = [(SUScriptObject *)self copyObjectForScriptFromPoolWithClass:objc_opt_class()];
    [MEMORY[0x263F1C960] defaultHeight];
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, 0.0, v4);
    [v3 setClearButtonMode:1];
    objc_msgSend(v3, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:", 14.0));
    LODWORD(v5) = 5.0;
    LODWORD(v6) = 4.0;
    [v3 setPaddingTop:v5 paddingLeft:v6];
    objc_msgSend((id)objc_msgSend(v3, "textInputTraits"), "setReturnKeyType:", 6);
  }
  else
  {
    id v3 = [(SUScriptObject *)self copyObjectForScriptFromPoolWithClass:objc_opt_class()];
    [v3 setBorderStyle:2];
  }
  [v3 setEnablesReturnKeyAutomatically:1];
  objc_msgSend(v3, "setTextColor:", objc_msgSend(MEMORY[0x263F1C550], "blackColor"));
  [v3 setTextLoupeVisibility:3];
  [v3 sizeToFit];
  [v3 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SUScriptTextField *)self _defaultWidth];
  objc_msgSend(v3, "setFrame:", v8, v10, v13, v12);
  return v3;
}

- (BOOL)_styleIsValid:(id)a3
{
  if ([a3 isEqualToString:@"default"]) {
    return 1;
  }

  return [a3 isEqualToString:@"search"];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_11, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptTextField;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_8, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptTextField;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptTextField;
  uint64_t v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_11 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_8 = (uint64_t)sel_blur;
    *(void *)algn_2681B48E8 = @"blur";
    qword_2681B48F0 = (uint64_t)sel_focus;
    unk_2681B48F8 = @"focus";
    __KeyMapping_11 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"autocapitalizationType", @"autocorrectionType", @"autocorrectionType", @"keyboardType", @"keyboardType", @"placeholder", @"placeholder", @"shouldFocusFunction", @"shouldFocusFunction", @"style", @"style", @"value", @"value", @"width", @"width", 0);
  }
}

@end