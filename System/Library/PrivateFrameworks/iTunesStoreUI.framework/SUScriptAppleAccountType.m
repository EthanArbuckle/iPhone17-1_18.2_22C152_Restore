@interface SUScriptAppleAccountType
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (ACAccountType)nativeAccountType;
- (NSString)accountTypeDescription;
- (NSString)identifier;
- (SUScriptAppleAccountType)initWithACAccountType:(id)a3;
- (id)_className;
- (id)accessGranted;
- (id)scriptAttributeKeys;
- (void)dealloc;
@end

@implementation SUScriptAppleAccountType

- (SUScriptAppleAccountType)initWithACAccountType:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptAppleAccountType;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_accountType = (ACAccountType *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptAppleAccountType;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)accessGranted
{
  BOOL v2 = [(ACAccountType *)self->_accountType accessGranted];
  objc_super v3 = (id *)MEMORY[0x263EFFB40];
  if (!v2) {
    objc_super v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (NSString)accountTypeDescription
{
  return [(ACAccountType *)self->_accountType accountTypeDescription];
}

- (id)_className
{
  return @"iTunesAppleAccountType";
}

- (NSString)identifier
{
  return [(ACAccountType *)self->_accountType identifier];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_67, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccountType;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAppleAccountType;
  BOOL v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_67 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_67 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"accessGranted", @"accountTypeDescription", @"accountTypeDescription", @"identifier", @"identifier", 0);
  }
}

- (ACAccountType)nativeAccountType
{
  return self->_accountType;
}

@end