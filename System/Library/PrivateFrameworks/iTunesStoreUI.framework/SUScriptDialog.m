@interface SUScriptDialog
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSNumber)cancelButtonIndex;
- (NSNumber)destructiveButtonIndex;
- (NSString)body;
- (NSString)title;
- (id)_className;
- (id)_nativeDialog;
- (id)buttons;
- (id)scriptAttributeKeys;
- (id)textFields;
- (void)_logSheetWarnings;
- (void)dealloc;
- (void)dismiss;
- (void)setBody:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCancelButtonIndex:(id)a3;
- (void)setDestructiveButtonIndex:(id)a3;
- (void)setTextFields:(id)a3;
- (void)setTitle:(id)a3;
- (void)show;
- (void)showFromDOMElement:(id)a3;
- (void)showSheet;
- (void)showSheetInPopOver:(id)a3;
@end

@implementation SUScriptDialog

- (void)dealloc
{
  self->_body = 0;
  self->_buttons = 0;

  self->_cancelButtonIndex = 0;
  self->_destructiveButtonIndex = 0;

  self->_textFields = 0;
  self->_title = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptDialog;
  [(SUScriptObject *)&v3 dealloc];
}

- (void)dismiss
{
}

uint64_t __25__SUScriptDialog_dismiss__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) _nativeDialog];

  return [v1 dismiss];
}

- (void)show
{
}

uint64_t __22__SUScriptDialog_show__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) _nativeDialog];

  return [v1 show];
}

- (void)showSheet
{
}

uint64_t __27__SUScriptDialog_showSheet__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) _nativeDialog];

  return [v1 showSheet];
}

- (void)showSheetInPopOver:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUScriptDialog *)self _logSheetWarnings];
    WebThreadRunOnMainThread();
  }
  else
  {
    v4 = (void *)MEMORY[0x263F1FA90];
    [v4 throwException:@"Invalid argument"];
  }
}

uint64_t __37__SUScriptDialog_showSheetInPopOver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) activeViewController];
  if (result)
  {
    uint64_t v3 = result;
    v4 = (void *)[*(id *)(a1 + 40) _nativeDialog];
    return [v4 showSheetInViewController:v3];
  }
  return result;
}

- (void)showFromDOMElement:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUScriptDialog *)self _logSheetWarnings];
    WebThreadRunOnMainThread();
  }
  else
  {
    v4 = (void *)MEMORY[0x263F1FA90];
    [v4 throwException:@"Invalid argument"];
  }
}

uint64_t __37__SUScriptDialog_showFromDOMElement___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) DOMElementWithElement:*(void *)(a1 + 40)];
  uint64_t v3 = (void *)[v2 webView];
  [v2 frame];
  objc_msgSend(v3, "convertRect:fromView:", 0);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (void *)[*(id *)(a1 + 32) _nativeDialog];
  uint64_t v13 = [v2 webView];

  return objc_msgSend(v12, "showFromRect:inView:", v13, v5, v7, v9, v11);
}

- (NSString)body
{
  [(SUScriptObject *)self lock];
  uint64_t v3 = self->_body;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (id)buttons
{
  [(SUScriptObject *)self lock];
  id v3 = self->_buttons;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (NSNumber)cancelButtonIndex
{
  [(SUScriptObject *)self lock];
  id v3 = self->_cancelButtonIndex;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (NSNumber)destructiveButtonIndex
{
  [(SUScriptObject *)self lock];
  id v3 = self->_destructiveButtonIndex;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (id)_className
{
  return @"iTunesDialog";
}

- (void)setBody:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = 0;
LABEL_6:
    [(SUScriptObject *)self lock];
    body = self->_body;
    if (body != v5)
    {

      self->_body = v5;
    }
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  double v5 = (NSString *)a3;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  double v8 = (void *)MEMORY[0x263F1FA90];

  [v8 throwException:@"Invalid argument"];
}

- (void)setButtons:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v10 = 0;
    if (!a3 || (isKindOfClass & 1) != 0) {
      goto LABEL_3;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (id)[a3 copyArrayValueWithValidator:__SUButtonValidator context:0];
      if (v10) {
        goto LABEL_3;
      }
      double v8 = (void *)MEMORY[0x263F1FA90];
      double v9 = @"Buttons array contains invalid iTunesButton objects";
    }
    else
    {
      double v8 = (void *)MEMORY[0x263F1FA90];
      double v9 = @"Invalid argument";
    }
    [v8 throwException:v9];
    double v6 = 0;
    goto LABEL_6;
  }
  id v10 = 0;
LABEL_3:
  [(SUScriptObject *)self lock];
  id buttons = self->_buttons;
  if (buttons != v10)
  {

    self->_id buttons = v10;
  }
  [(SUScriptObject *)self unlock];
  double v6 = v10;
LABEL_6:
}

- (void)setCancelButtonIndex:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0)
  {
LABEL_8:
    [(SUScriptObject *)self lock];

    self->_cancelButtonIndex = (NSNumber *)objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = a3;
    goto LABEL_8;
  }
  id v5 = a3;
  if (objc_opt_respondsToSelector()) {
    goto LABEL_8;
  }
  double v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setDestructiveButtonIndex:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0)
  {
LABEL_8:
    [(SUScriptObject *)self lock];

    self->_destructiveButtonIndex = (NSNumber *)objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = a3;
    goto LABEL_8;
  }
  id v5 = a3;
  if (objc_opt_respondsToSelector()) {
    goto LABEL_8;
  }
  double v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setTextFields:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v10 = 0;
    if (!a3 || (isKindOfClass & 1) != 0) {
      goto LABEL_3;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (id)[a3 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
      if (v10) {
        goto LABEL_3;
      }
      double v8 = (void *)MEMORY[0x263F1FA90];
      double v9 = @"Text fields array contains non-iTunesTextField objects";
    }
    else
    {
      double v8 = (void *)MEMORY[0x263F1FA90];
      double v9 = @"Invalid argument";
    }
    [v8 throwException:v9];
    double v6 = 0;
    goto LABEL_6;
  }
  id v10 = 0;
LABEL_3:
  [(SUScriptObject *)self lock];
  id textFields = self->_textFields;
  if (textFields != v10)
  {

    self->_id textFields = v10;
  }
  [(SUScriptObject *)self unlock];
  double v6 = v10;
LABEL_6:
}

- (void)setTitle:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
LABEL_6:
    [(SUScriptObject *)self lock];
    title = self->_title;
    if (title != v5)
    {

      self->_title = v5;
    }
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  id v5 = (NSString *)a3;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  double v8 = (void *)MEMORY[0x263F1FA90];

  [v8 throwException:@"Invalid argument"];
}

- (id)textFields
{
  [(SUScriptObject *)self lock];
  id v3 = self->_textFields;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (NSString)title
{
  [(SUScriptObject *)self lock];
  id v3 = self->_title;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (void)_logSheetWarnings
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(SUScriptObject *)self lock];
  if ([self->_textFields count])
  {
    id v3 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v5 &= 2u;
    }
    if (v5)
    {
      int v19 = 138412290;
      uint64_t v20 = objc_opt_class();
      LODWORD(v18) = 12;
      v16 = &v19;
      uint64_t v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        double v7 = (void *)v6;
        uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v19, v18);
        free(v7);
        v16 = (int *)v8;
        SSFileLog();
      }
    }
  }
  if ([(NSString *)self->_body length])
  {
    double v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      uint64_t v12 = objc_opt_class();
      int v19 = 138412290;
      uint64_t v20 = v12;
      LODWORD(v18) = 12;
      v17 = &v19;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v19, v18);
        free(v14);
        v17 = (int *)v15;
        SSFileLog();
      }
    }
  }
  [(SUScriptObject *)self unlock];
}

- (id)_nativeDialog
{
  id v3 = [(SUScriptObject *)self nativeObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = objc_alloc_init(SUScriptDialogNativeObject);
    [(SUScriptObject *)self setNativeObject:v3];
  }
  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_13, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDialog;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_10, 5);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDialog;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptDialog;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_13 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_10 = (uint64_t)sel_dismiss;
    *(void *)algn_2681B4958 = @"dismiss";
    qword_2681B4960 = (uint64_t)sel_show;
    unk_2681B4968 = @"show";
    qword_2681B4970 = (uint64_t)sel_showFromDOMElement_;
    unk_2681B4978 = @"showFromElement";
    qword_2681B4980 = (uint64_t)sel_showSheet;
    unk_2681B4988 = @"showSheet";
    qword_2681B4990 = (uint64_t)sel_showSheetInPopOver_;
    unk_2681B4998 = @"showSheetInPopOver";
    __KeyMapping_13 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"body", @"buttons", @"buttons", @"cancelButtonIndex", @"cancelButtonIndex", @"destructiveButtonIndex", @"destructiveButtonIndex", @"textFields", @"textFields", @"title", @"title", 0);
  }
}

@end