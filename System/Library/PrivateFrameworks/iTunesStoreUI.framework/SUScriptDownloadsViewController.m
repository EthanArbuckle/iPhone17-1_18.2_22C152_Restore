@interface SUScriptDownloadsViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (id)_className;
- (id)buttons;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (void)setButtons:(id)a3;
@end

@implementation SUScriptDownloadsViewController

- (id)newNativeViewController
{
  v3 = objc_msgSend(-[SUScriptObject viewControllerFactory](self, "viewControllerFactory"), "newDownloadsViewController");
  objc_msgSend(v3, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
  return v3;
}

- (id)buttons
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__30;
  v12 = __Block_byref_object_dispose__30;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __42__SUScriptDownloadsViewController_buttons__block_invoke, &unk_264812E70, self, &v8);
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __42__SUScriptDownloadsViewController_buttons__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeViewController"), "scriptButtons");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return @"iTunesDownloadsViewController";
}

- (void)setButtons:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v4 = 0;
    if (a3 && (isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
        v4 = 0;
        goto LABEL_4;
      }
      v4 = (void *)[a3 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
      if (!v4)
      {
        [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
        goto LABEL_4;
      }
    }
  }
  WebThreadRunOnMainThread();
LABEL_4:
}

uint64_t __46__SUScriptDownloadsViewController_setButtons___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _nativeViewController];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setScriptButtons:v3];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_42, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDownloadsViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptDownloadsViewController;
  id v2 = [(SUScriptViewController *)&v4 scriptAttributeKeys];
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_42, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_42 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"buttons", 0);
  }
}

@end