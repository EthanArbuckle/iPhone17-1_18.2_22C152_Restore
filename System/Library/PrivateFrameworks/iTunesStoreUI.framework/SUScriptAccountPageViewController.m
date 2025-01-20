@interface SUScriptAccountPageViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (NSString)style;
- (NSString)styleNameDefault;
- (NSString)styleNameSignUp;
- (NSString)styleNameViewAccount;
- (id)_className;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (void)setStyle:(id)a3;
@end

@implementation SUScriptAccountPageViewController

- (id)newNativeViewController
{
  v3 = objc_alloc_init(SUAccountViewController);
  [(SUViewController *)v3 setClientInterface:[(SUScriptObject *)self clientInterface]];
  v4 = [(SUScriptStorePageViewController *)self URLStrings];
  if (v4) {
    [(SUScriptStorePageViewController *)self applyURLStrings:v4 toViewController:v3];
  }
  return v3;
}

- (id)_className
{
  return @"iTunesAccountPageViewController";
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
    v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __46__SUScriptAccountPageViewController_setStyle___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "styleNameSignUp")))
  {
    uint64_t v3 = 1;
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "styleNameViewAccount")))
  {
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return [v2 setStyle:v3];
}

- (NSString)style
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__39;
  v13 = __Block_byref_object_dispose__39;
  uint64_t v14 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v3 = (void *)v10[5];
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = [(SUScriptAccountPageViewController *)self styleNameDefault];
  }
  v5 = v4;
  _Block_object_dispose(&v9, 8);
  return v5;
}

id __42__SUScriptAccountPageViewController_style__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "style");
  if (v2 == 2) {
    goto LABEL_4;
  }
  if (v2 == 1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)[*(id *)(a1 + 32) styleNameSignUp];
LABEL_4:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)[*(id *)(a1 + 32) styleNameViewAccount];
  }
  id result = (id)[*(id *)(a1 + 32) styleNameDefault];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)styleNameDefault
{
  return (NSString *)@"default";
}

- (NSString)styleNameSignUp
{
  return (NSString *)@"signup";
}

- (NSString)styleNameViewAccount
{
  return (NSString *)@"viewaccount";
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_51, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAccountPageViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAccountPageViewController;
  id v2 = [(SUScriptStorePageViewController *)&v4 scriptAttributeKeys];
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_51, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_51 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"style", @"STYLE_DEFAULT", @"styleNameDefault", @"STYLE_SIGN_UP", @"styleNameSignUp", @"STYLE_VIEW_ACCOUNT", @"styleNameViewAccount", 0);
  }
}

@end