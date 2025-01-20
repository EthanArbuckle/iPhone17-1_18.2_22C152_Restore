@interface SUScriptCalloutView
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)subtitle;
- (NSString)title;
- (SUScriptCalloutView)init;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)_menuDidHideNotification:(id)a3;
- (void)_reloadUntructedString;
- (void)_resetCalloutBar;
- (void)_setupCalloutBar;
- (void)dealloc;
- (void)setSubtitle:(id)a3;
- (void)setTargetX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6;
- (void)setTitle:(id)a3;
- (void)setTitle:(id)a3 subtitle:(id)a4;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SUScriptCalloutView

- (SUScriptCalloutView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptCalloutView;
  v2 = [(SUScriptObject *)&v5 init];
  if (v2)
  {
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__menuDidHideNotification_ name:*MEMORY[0x263F1D4A8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D4A8] object:0];
  v4.receiver = self;
  v4.super_class = (Class)SUScriptCalloutView;
  [(SUScriptObject *)&v4 dealloc];
}

- (void)setTargetX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
}

uint64_t __49__SUScriptCalloutView_setTargetX_y_width_height___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "parentViewController"), "webView"), "_browserView");
  v3 = (void *)[MEMORY[0x263F1C7B0] sharedMenuController];
  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);

  return objc_msgSend(v3, "setTargetRect:inView:", v2, v4, v5, v6, v7);
}

- (void)setTitle:(id)a3 subtitle:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || a4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
  else
  {
    WebThreadRunOnMainThread();
  }
}

uint64_t __41__SUScriptCalloutView_setTitle_subtitle___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(*(void *)(a1 + 32) + 80) isEqualToString:*(void *)(a1 + 40)];
  if ((v2 & 1) == 0)
  {

    *(void *)(*(void *)(a1 + 32) + 80) = [*(id *)(a1 + 40) copy];
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) isEqualToString:*(void *)(a1 + 48)];
  if (result)
  {
    if (v2) {
      return result;
    }
  }
  else
  {

    *(void *)(*(void *)(a1 + 32) + 88) = [*(id *)(a1 + 48) copy];
  }
  double v4 = *(void **)(a1 + 32);

  return [v4 _reloadUntructedString];
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
}

uint64_t __43__SUScriptCalloutView_setVisible_animated___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 72) != v2)
  {
    uint64_t v3 = result;
    *(unsigned char *)(v1 + 72) = v2;
    double v4 = *(unsigned char **)(result + 32);
    if (v4[72]) {
      [v4 _setupCalloutBar];
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C7B0], "sharedMenuController"), "setMenuVisible:animated:", *(unsigned __int8 *)(v3 + 40), *(unsigned __int8 *)(v3 + 41));
    uint64_t result = *(void *)(v3 + 32);
    if (!*(unsigned char *)(result + 72))
    {
      return [(id)result _resetCalloutBar];
    }
  }
  return result;
}

- (id)_className
{
  return @"iTunesCalloutView";
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

uint64_t __35__SUScriptCalloutView_setSubtitle___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(result + 32) + 80);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    *(void *)(*(void *)(v2 + 32) + 80) = [*(id *)(v2 + 40) copy];
    uint64_t v3 = *(void **)(v2 + 32);
    return [v3 _reloadUntructedString];
  }
  return result;
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

uint64_t __32__SUScriptCalloutView_setTitle___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(*(void *)(result + 32) + 88);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    *(void *)(*(void *)(v2 + 32) + 88) = [*(id *)(v2 + 40) copy];
    uint64_t v3 = *(void **)(v2 + 32);
    return [v3 _reloadUntructedString];
  }
  return result;
}

- (NSString)subtitle
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x3052000000;
  double v7 = __Block_byref_object_copy__52;
  v8 = __Block_byref_object_dispose__52;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  uint64_t v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __31__SUScriptCalloutView_subtitle__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)title
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x3052000000;
  double v7 = __Block_byref_object_copy__52;
  v8 = __Block_byref_object_dispose__52;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  uint64_t v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __28__SUScriptCalloutView_title__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_menuDidHideNotification:(id)a3
{
  if (self->_isVisible)
  {
    self->_isVisible = 0;
    [(SUScriptCalloutView *)self _resetCalloutBar];
  }
}

- (void)_reloadUntructedString
{
  if (!self->_isVisible) {
    return;
  }
  title = self->_title;
  subtitle = self->_subtitle;
  if (!title)
  {
    if (!subtitle)
    {
      title = 0;
      goto LABEL_9;
    }
    uint64_t v4 = [NSString stringWithFormat:@"\n%@", subtitle];
    goto LABEL_8;
  }
  if (subtitle)
  {
    uint64_t v4 = [(NSString *)title stringByAppendingFormat:@"\n%@", self->_subtitle];
LABEL_8:
    title = (NSString *)v4;
  }
LABEL_9:
  double v5 = (void *)[MEMORY[0x263F1C498] sharedCalloutBar];

  [v5 setUntruncatedString:title];
}

- (void)_resetCalloutBar
{
  uint64_t v2 = (void *)[MEMORY[0x263F1C498] sharedCalloutBar];
  [v2 clearSupressesHorizontalMovementFrame];
  [v2 setSupressesHorizontalMovement:0];

  [v2 setUntruncatedString:0];
}

- (void)_setupCalloutBar
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C498], "sharedCalloutBar"), "setSupressesHorizontalMovement:", 1);

  [(SUScriptCalloutView *)self _reloadUntructedString];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_79, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCalloutView;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_58, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCalloutView;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptCalloutView;
  uint64_t v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_79 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_58 = (uint64_t)sel_setTargetX_y_width_height_;
    unk_2681B5910 = @"setTargetRect";
    qword_2681B5918 = (uint64_t)sel_setTitle_subtitle_;
    unk_2681B5920 = @"setTitles";
    qword_2681B5928 = (uint64_t)sel_setVisible_animated_;
    unk_2681B5930 = @"setVisible";
    __KeyMapping_79 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"subtitle", @"title", @"title", 0);
  }
}

@end