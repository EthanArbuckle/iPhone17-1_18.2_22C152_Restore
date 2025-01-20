@interface SUScriptMenuItem
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (BOOL)enabled;
- (NSString)title;
- (SUScriptMenuItem)init;
- (id)_className;
- (id)scriptAttributeKeys;
- (id)userInfo;
- (void)_sendDidChange;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation SUScriptMenuItem

- (SUScriptMenuItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMenuItem;
  result = [(SUScriptObject *)&v3 init];
  if (result) {
    result->_enabled = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMenuItem;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)_className
{
  return @"iTunesMenuItem";
}

- (BOOL)enabled
{
  [(SUScriptObject *)self lock];
  BOOL enabled = self->_enabled;
  [(SUScriptObject *)self unlock];
  return enabled;
}

- (void)setEnabled:(BOOL)a3
{
  [(SUScriptObject *)self lock];
  self->_BOOL enabled = a3;
  [(SUScriptObject *)self unlock];

  [(SUScriptMenuItem *)self _sendDidChange];
}

- (void)setTitle:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = 0;
LABEL_6:
    [(SUScriptObject *)self lock];
    title = self->_title;
    if (title != v5)
    {

      self->_title = v5;
    }
    [(SUScriptObject *)self unlock];
    [(SUScriptMenuItem *)self _sendDidChange];
    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  v5 = (NSString *)a3;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  v8 = (void *)MEMORY[0x263F1FA90];

  [v8 throwException:@"Invalid title"];
}

- (void)setUserInfo:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  [(SUScriptObject *)self lock];
  id userInfo = self->_userInfo;
  if (userInfo != a3)
  {

    self->_id userInfo = a3;
  }

  [(SUScriptObject *)self unlock];
}

- (NSString)title
{
  [(SUScriptObject *)self lock];
  objc_super v3 = self->_title;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)userInfo
{
  [(SUScriptObject *)self lock];
  id v3 = self->_userInfo;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)_sendDidChange
{
  id v2 = [(SUScriptObject *)self parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 reload];
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_9, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMenuItem;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptMenuItem;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_9 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_9 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"enabled", @"title", @"title", @"userInfo", @"userInfo", 0);
  }
}

@end