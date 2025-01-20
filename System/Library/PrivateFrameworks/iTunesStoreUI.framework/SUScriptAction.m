@interface SUScriptAction
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)actionType;
- (SUScriptAction)initWithActionType:(id)a3;
- (id)_className;
- (id)copyWithZone:(_NSZone *)a3;
- (id)scriptAttributeKeys;
- (void)dealloc;
- (void)performAction;
- (void)setActionType:(id)a3;
@end

@implementation SUScriptAction

- (SUScriptAction)initWithActionType:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptAction;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_actionType = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptAction;
  [(SUScriptObject *)&v3 dealloc];
}

- (void)performAction
{
  objc_super v3 = [(SUScriptAction *)self actionType];
  int IsCurrent = WebThreadIsCurrent();
  if (IsCurrent) {
    v5 = &__block_literal_global_14;
  }
  else {
    v5 = &__block_literal_global_4;
  }
  if ([(NSString *)v3 isEqualToString:@"SUScriptActionTypeReturnToLibrary"])
  {
    if (IsCurrent) {
      objc_super v6 = (void (**)(void *, void *))&__block_literal_global_14;
    }
    else {
      objc_super v6 = (void (**)(void *, void *))&__block_literal_global_4;
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __31__SUScriptAction_performAction__block_invoke_3;
    v11[3] = &unk_264812130;
    v11[4] = self;
    v6[2](v5, v11);
  }
  else if ([(NSString *)v3 isEqualToString:@"SUScriptActionTypeDismissWindows"])
  {
    if (IsCurrent) {
      v7 = &__block_literal_global_14;
    }
    else {
      v7 = &__block_literal_global_4;
    }
    v8 = (void (*)(void *, void *))v7[2];
    v8(v5, &__block_literal_global_7);
  }
  else if ([(NSString *)v3 isEqualToString:@"SUScriptActionTypeDismissSheet"])
  {
    if (IsCurrent) {
      v9 = (void (**)(void *, void *))&__block_literal_global_14;
    }
    else {
      v9 = (void (**)(void *, void *))&__block_literal_global_4;
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __31__SUScriptAction_performAction__block_invoke_5;
    v10[3] = &unk_264812130;
    v10[4] = self;
    v9[2](v5, v10);
  }
}

uint64_t __31__SUScriptAction_performAction__block_invoke()
{
  return WebThreadRunOnMainThread();
}

void __31__SUScriptAction_performAction__block_invoke_2(uint64_t a1, void *a2)
{
}

uint64_t __31__SUScriptAction_performAction__block_invoke_3(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) clientInterface];

  return [v1 _returnToLibrary];
}

uint64_t __31__SUScriptAction_performAction__block_invoke_4()
{
  v0 = objc_msgSend(+[SUClientDispatch tabBarController](SUClientDispatch, "tabBarController"), "overlayBackgroundViewController");

  return [v0 dismissAnimated:1];
}

uint64_t __31__SUScriptAction_performAction__block_invoke_5(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) parentViewController];

  return [v1 dismissViewControllerAnimated:1 completion:0];
}

- (NSString)actionType
{
  [(SUScriptObject *)self lock];
  objc_super v3 = self->_actionType;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)_className
{
  return @"iTunesAction";
}

- (void)setActionType:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  [(SUScriptObject *)self lock];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    actionType = self->_actionType;
    if (actionType != a3)
    {

      self->_actionType = (NSString *)[a3 copy];
    }
  }

  [(SUScriptObject *)self unlock];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(SUScriptObject *)self lock];
  v5[9] = [(NSString *)self->_actionType copyWithZone:a3];
  [(SUScriptObject *)self unlock];
  return v5;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_57, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAction;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_42, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAction;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAction;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_57 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_42 = (uint64_t)sel_performAction;
    unk_2681B54B0 = @"performAction";
    __KeyMapping_57 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"actionType", 0);
  }
}

@end