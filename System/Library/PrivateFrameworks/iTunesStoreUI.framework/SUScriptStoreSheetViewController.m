@interface SUScriptStoreSheetViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (id)_className;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (int64_t)productPageStyle;
- (int64_t)productPageStyleAutomatic;
- (int64_t)productPageStylePad;
- (int64_t)productPageStylePhone;
- (void)loadWithProductParameters:(id)a3;
- (void)loadWithProductURL:(id)a3;
- (void)setProductPageStyle:(int64_t)a3;
@end

@implementation SUScriptStoreSheetViewController

- (id)newNativeViewController
{
  [(SUScriptObject *)self lock];
  id v3 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  [v3 setAutomaticallyDismisses:1];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)loadWithProductParameters:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0)
  {
LABEL_7:
    v7 = [(WebFrame *)[(SUScriptObject *)self webFrame] globalContext];
    if (v5)
    {
      if (v7) {
        WebThreadRunOnMainThread();
      }
    }
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = 1;
    goto LABEL_7;
  }
  v8 = (void *)MEMORY[0x263F1FA90];

  [v8 throwException:@"Invalid argument"];
}

void __62__SUScriptStoreSheetViewController_loadWithProductParameters___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) copyArrayOrDictionaryWithContext:*(void *)(a1 + 48)];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "nativeViewController"), "loadProductWithParameters:completionBlock:", v2, 0);
  }
}

- (void)loadWithProductURL:(id)a3
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
    int v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __55__SUScriptStoreSheetViewController_loadWithProductURL___block_invoke(uint64_t a1)
{
  uint64_t result = [NSURL URLWithString:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t v3 = result;
    v4 = (void *)[*(id *)(a1 + 40) nativeViewController];
    return [v4 loadProductWithURL:v3 completionBlock:0];
  }
  return result;
}

- (id)_className
{
  return @"iTunesStoreSheetViewController";
}

- (int64_t)productPageStyle
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __52__SUScriptStoreSheetViewController_productPageStyle__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "productPageStyle");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setProductPageStyle:(int64_t)a3
{
}

uint64_t __56__SUScriptStoreSheetViewController_setProductPageStyle___block_invoke(uint64_t a1)
{
  int64_t v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setProductPageStyle:v3];
}

- (int64_t)productPageStyleAutomatic
{
  return 0;
}

- (int64_t)productPageStylePad
{
  return 3;
}

- (int64_t)productPageStylePhone
{
  return 2;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_83, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptStoreSheetViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_63, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptStoreSheetViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptStoreSheetViewController;
  id v2 = [(SUScriptViewController *)&v4 scriptAttributeKeys];
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_83, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_63 = (uint64_t)sel_loadWithProductParameters_;
    unk_2681B59D0 = @"loadWithProductParameters";
    qword_2681B59D8 = (uint64_t)sel_loadWithProductURL_;
    unk_2681B59E0 = @"loadWithProductURL";
    __KeyMapping_83 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"sheetStyle", @"productPageStyle", @"SHEET_STYLE_AUTOMATIC", @"productPageStyleAutomatic", @"SHEET_STYLE_PAD", @"productPageStylePad", @"SHEET_STYLE_PHONE", @"productPageStylePhone", 0);
  }
}

@end