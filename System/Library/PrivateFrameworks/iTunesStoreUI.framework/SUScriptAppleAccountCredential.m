@interface SUScriptAppleAccountCredential
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (NSString)oauthToken;
- (SUScriptAppleAccountCredential)initWithACAccountCredential:(id)a3;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)dealloc;
@end

@implementation SUScriptAppleAccountCredential

- (SUScriptAppleAccountCredential)initWithACAccountCredential:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptAppleAccountCredential;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_credential = (ACAccountCredential *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptAppleAccountCredential;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)_className
{
  return @"iTunesAppleAccountCredential";
}

- (NSString)oauthToken
{
  return [(ACAccountCredential *)self->_credential oauthToken];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_69, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccountCredential;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAppleAccountCredential;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_69 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_69 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"oauthToken", 0);
  }
}

@end