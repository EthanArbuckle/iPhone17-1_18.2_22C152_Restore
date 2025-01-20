@interface SUScriptACClientAccessInfo
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSDictionary)accessInfoDictionary;
- (NSString)accessKeyFacebookAppID;
- (NSString)accessKeyFacebookPermissions;
- (NSString)accessKeyPurposeStatement;
- (SUScriptACClientAccessInfo)init;
- (SUScriptAppleAccountType)accountType;
- (id)_className;
- (id)scriptAttributeKeys;
- (id)valueForAccessKey:(id)a3;
- (void)dealloc;
- (void)setAccountType:(id)a3;
- (void)setValue:(id)a3 forAccessKey:(id)a4;
@end

@implementation SUScriptACClientAccessInfo

- (SUScriptACClientAccessInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptACClientAccessInfo;
  v2 = [(SUScriptObject *)&v4 init];
  if (v2) {
    v2->_dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptACClientAccessInfo;
  [(SUScriptObject *)&v3 dealloc];
}

- (NSDictionary)accessInfoDictionary
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (NSDictionary *)(id)[(NSMutableDictionary *)self->_dictionary copy];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (SUScriptAppleAccountType)accountType
{
  [(SUScriptObject *)self lock];
  objc_super v3 = self->_accountType;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)setAccountType:(id)a3
{
  [(SUScriptObject *)self lock];
  accountType = self->_accountType;
  if (accountType != a3)
  {

    self->_accountType = (SUScriptAppleAccountType *)a3;
  }

  [(SUScriptObject *)self unlock];
}

- (void)setValue:(id)a3 forAccessKey:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = a3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(WebFrame *)[(SUScriptObject *)self webFrame] globalContext];

      id v9 = (id)[a3 copyArrayOrDictionaryWithContext:v7];
    }
    [(SUScriptObject *)self lock];
    [(NSMutableDictionary *)self->_dictionary setObject:v9 forKey:a4];
    [(SUScriptObject *)self unlock];
  }
  else
  {
    v8 = (void *)MEMORY[0x263F1FA90];
    [v8 throwException:@"Invalid argument"];
  }
}

- (id)valueForAccessKey:(id)a3
{
  [(SUScriptObject *)self lock];
  id v5 = (id)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];
  [(SUScriptObject *)self unlock];
  return v5;
}

- (id)_className
{
  return @"iTunesAppleAccountClientAccessInfo";
}

- (NSString)accessKeyFacebookAppID
{
  return (NSString *)ISWeakLinkedStringConstantForString();
}

- (NSString)accessKeyFacebookPermissions
{
  return (NSString *)ISWeakLinkedStringConstantForString();
}

- (NSString)accessKeyPurposeStatement
{
  return (NSString *)@"ACPurposeStatementKey";
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_70, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptACClientAccessInfo;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_52, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptACClientAccessInfo;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptACClientAccessInfo;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_70 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_52 = (uint64_t)sel_valueForAccessKey_;
    *(void *)algn_2681B5728 = @"getAccessValue";
    qword_2681B5730 = (uint64_t)sel_setValue_forAccessKey_;
    unk_2681B5738 = @"setAccessValue";
    __KeyMapping_70 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"ACCESS_KEY_FACEBOOK_APP_ID", @"accessKeyFacebookAppID", @"ACCESS_KEY_FACEBOOK_PERMISSIONS", @"accessKeyFacebookPermissions", @"ACCESS_KEY_PURPOSE_STATEMENT", @"accessKeyPurposeStatement", 0);
  }
}

@end