@interface SUScriptURLRequest
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (NSNumber)timeoutInterval;
- (NSString)URLBagKey;
- (SUScriptURLRequest)init;
- (SUScriptURLRequest)initWithNativeRequestProperties:(id)a3;
- (id)URLs;
- (id)_className;
- (id)copyNativeRequestProperties;
- (id)scriptAttributeKeys;
- (void)dealloc;
- (void)setTimeoutInterval:(id)a3;
- (void)setURLBagKey:(id)a3;
- (void)setURLs:(id)a3;
@end

@implementation SUScriptURLRequest

- (SUScriptURLRequest)init
{
  return [(SUScriptURLRequest *)self initWithNativeRequestProperties:0];
}

- (SUScriptURLRequest)initWithNativeRequestProperties:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUScriptURLRequest;
  v4 = [(SUScriptObject *)&v7 init];
  if (v4)
  {
    if (a3) {
      v5 = (SSMutableURLRequestProperties *)[a3 mutableCopy];
    }
    else {
      v5 = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x263F7B290]);
    }
    v4->_requestProperties = v5;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptURLRequest;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)copyNativeRequestProperties
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (void *)[(SSMutableURLRequestProperties *)self->_requestProperties copy];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)_className
{
  return @"iTunesURLRequest";
}

- (void)setTimeoutInterval:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(SUScriptObject *)self lock];
    requestProperties = self->_requestProperties;
    [a3 doubleValue];
    [(SSMutableURLRequestProperties *)requestProperties setTimeoutInterval:"setTimeoutInterval:"];
    [(SUScriptObject *)self unlock];
  }
  else
  {
    v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
}

- (void)setURLBagKey:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    [(SSMutableURLRequestProperties *)self->_requestProperties setURLBagKey:v5];
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_super v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setURLs:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v5 = 0;
    if (a3 && (isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", a3, 0);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
          id v5 = 0;
          goto LABEL_19;
        }
        id v5 = (void *)[a3 copyArrayValueWithValidator:SUURLValidator context:0];
        if (!v5)
        {
          [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
          goto LABEL_19;
        }
      }
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = [objc_alloc(NSURL) initWithString:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        if (v12)
        {
          v13 = (void *)v12;
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  [(SUScriptObject *)self lock];
  [(SSMutableURLRequestProperties *)self->_requestProperties setURLs:v7];
  [(SUScriptObject *)self unlock];

LABEL_19:
}

- (NSNumber)timeoutInterval
{
  [(SUScriptObject *)self lock];
  objc_super v3 = NSNumber;
  [(SSMutableURLRequestProperties *)self->_requestProperties timeoutInterval];
  v4 = (NSNumber *)objc_msgSend(v3, "numberWithDouble:");
  [(SUScriptObject *)self unlock];
  return v4;
}

- (NSString)URLBagKey
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (NSString *)[(SSMutableURLRequestProperties *)self->_requestProperties URLBagKey];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)URLs
{
  [(SUScriptObject *)self lock];
  id v3 = (id)[(SSMutableURLRequestProperties *)self->_requestProperties URLs];
  [(SUScriptObject *)self unlock];
  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_48, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptURLRequest;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptURLRequest;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_48 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_48 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"timeoutInterval", @"URLBagKey", @"URLBagKey", @"urls", @"URLs", 0);
  }
}

@end