@interface SUScriptSection
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)transient;
- (NSString)badgeValue;
- (NSString)identifier;
- (SUScriptSection)initWithNativeSection:(id)a3;
- (SUScriptViewController)viewController;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)dealloc;
- (void)setBadgeValue:(id)a3;
- (void)setBadgeValue:(id)a3 animated:(BOOL)a4 blink:(BOOL)a5;
@end

@implementation SUScriptSection

- (SUScriptSection)initWithNativeSection:(id)a3
{
  v4 = [(SUScriptObject *)self init];
  if (v4)
  {
    v4->_identifier = (NSString *)(id)[a3 identifier];
    v4->_transient = [a3 isTransient];
  }
  return v4;
}

- (void)dealloc
{
  self->_badgeValue = 0;
  self->_identifier = 0;

  self->_viewController = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSection;
  [(SUScriptObject *)&v3 dealloc];
}

- (void)setBadgeValue:(id)a3 animated:(BOOL)a4 blink:(BOOL)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v9 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v9 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    uint64_t v11 = [v9 length];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__SUScriptSection_setBadgeValue_animated_blink___block_invoke;
    block[3] = &unk_264813728;
    if (v11) {
      id v12 = v9;
    }
    else {
      id v12 = 0;
    }
    block[4] = self;
    block[5] = v12;
    BOOL v15 = a4;
    BOOL v16 = a5;
    dispatch_async(MEMORY[0x263EF83A0], block);
    return;
  }
  v13 = (void *)MEMORY[0x263F1FA90];

  [v13 throwException:@"Invalid argument"];
}

uint64_t __48__SUScriptSection_setBadgeValue_animated_blink___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "tabBarController"), "viewControllerForSectionIdentifier:", objc_msgSend(*(id *)(a1 + 32), "identifier"));
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = (void *)[v2 firstViewController];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 49);

  return [v2 setBadgeValue:v3 animated:v4 blink:v5];
}

- (NSString)badgeValue
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  id v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  uint64_t v14 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v2 = objc_msgSend((id)v10[5], "length", v7, 3221225472, __29__SUScriptSection_badgeValue__block_invoke, &unk_264812E48, self, &v9);
  uint64_t v3 = (void *)v10[5];
  if (!v2)
  {

    v10[5] = 0;
    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    uint64_t v4 = (NSString *)[MEMORY[0x263EFF9D0] null];
    goto LABEL_6;
  }
  uint64_t v4 = v3;
LABEL_6:
  uint64_t v5 = v4;
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __29__SUScriptSection_badgeValue__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "tabBarController"), "viewControllerForSectionIdentifier:", objc_msgSend(*(id *)(a1 + 32), "identifier")), "tabBarItem"), "badgeValue"), "copy");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return @"iTunesSection";
}

- (NSString)identifier
{
  [(SUScriptObject *)self lock];
  uint64_t v3 = self->_identifier;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)setBadgeValue:(id)a3
{
}

- (BOOL)transient
{
  [(SUScriptObject *)self lock];
  BOOL transient = self->_transient;
  [(SUScriptObject *)self unlock];
  return transient;
}

- (SUScriptViewController)viewController
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  BOOL v16 = __Block_byref_object_copy__16;
  v17 = __Block_byref_object_dispose__16;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __33__SUScriptSection_viewController__block_invoke;
  v10 = &unk_264812E48;
  uint64_t v11 = self;
  id v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __33__SUScriptSection_viewController__block_invoke, &unk_264812E48, v11, &v13), (uint64_t v3 = (void *)v14[5]) != 0))
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __33__SUScriptSection_viewController__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "tabBarController"), "viewControllerForSectionIdentifier:", objc_msgSend(*(id *)(a1 + 32), "identifier")), "copyScriptViewController");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_25, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSection;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_20, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSection;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptSection;
  uint64_t v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_25 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_20 = (uint64_t)sel_setBadgeValue_animated_blink_;
    *(void *)algn_2681B4C08 = @"setBadgeValue";
    __KeyMapping_25 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"badgeValue", @"identifier", @"identifier", @"isTransient", @"transient", @"viewController", @"viewController", 0);
  }
}

@end