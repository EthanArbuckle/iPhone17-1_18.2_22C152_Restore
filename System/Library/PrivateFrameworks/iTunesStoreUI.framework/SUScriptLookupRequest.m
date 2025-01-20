@interface SUScriptLookupRequest
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)keyProfile;
- (SUScriptLookupRequest)init;
- (id)_className;
- (id)authenticatesIfNeeded;
- (id)scriptAttributeKeys;
- (id)valueForRequestParameter:(id)a3;
- (int64_t)localizationStyle;
- (int64_t)localizationStyleDevice;
- (int64_t)localizationStyleServer;
- (void)dealloc;
- (void)setAuthenticatesIfNeeded:(id)a3;
- (void)setKeyProfile:(id)a3;
- (void)setLocalizationStyle:(int64_t)a3;
- (void)setValue:(id)a3 forRequestParameter:(id)a4;
- (void)startWithLookupFunction:(id)a3;
@end

@implementation SUScriptLookupRequest

- (SUScriptLookupRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptLookupRequest;
  v2 = [(SUScriptObject *)&v4 init];
  if (v2) {
    v2->_request = (SSLookupRequest *)objc_alloc_init(MEMORY[0x263F7B210]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptLookupRequest;
  [(SUScriptObject *)&v3 dealloc];
}

- (void)setValue:(id)a3 forRequestParameter:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x263F1FA90];
LABEL_11:
    [v9 throwException:@"Invalid argument"];
    return;
  }
  if (!a3)
  {
    [(SUScriptObject *)self lock];
    request = self->_request;
    id v8 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)MEMORY[0x263F1FA90];
      goto LABEL_11;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUScriptObject *)self lock];
    request = self->_request;
    id v8 = a3;
LABEL_15:
    [(SSLookupRequest *)request setValue:v8 forRequestParameter:a4];
    [(SUScriptObject *)self unlock];
    return;
  }
  v10 = [(WebFrame *)[(SUScriptObject *)self webFrame] globalContext];
  if (v10)
  {
    id v11 = (id)[a3 copyArrayOrDictionaryWithContext:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SUScriptObject *)self lock];
      [(SSLookupRequest *)self->_request setValue:v11 forRequestParameter:a4];
      [(SUScriptObject *)self unlock];
    }
    else
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    }
  }
}

- (void)startWithLookupFunction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
LABEL_6:
    v7 = [[SUScriptFunction alloc] initWithScriptObject:v5];
    [(SUScriptFunction *)v7 setThisObject:self];
    request = self->_request;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__SUScriptLookupRequest_startWithLookupFunction___block_invoke;
    v10[3] = &unk_264814F20;
    v10[4] = v7;
    [(SSLookupRequest *)request startWithLookupBlock:v10];

    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  id v5 = a3;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x263F1FA90];

  [v9 throwException:@"Invalid argument"];
}

void __49__SUScriptLookupRequest_startWithLookupFunction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    id v8 = [[SUScriptError alloc] initWithError:a3];
  }
  else {
    id v8 = 0;
  }
  uint64_t v5 = [a2 responseDictionary];
  if (!v5
    || (uint64_t v6 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:0 error:0]) == 0
    || (id v7 = (id)[[NSString alloc] initWithData:v6 encoding:4]) == 0)
  {
    id v7 = (id)[MEMORY[0x263F1FA98] undefined];
  }
  objc_msgSend(*(id *)(a1 + 32), "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v7, v8, 0));
  [*(id *)(a1 + 32) setThisObject:0];
}

- (id)valueForRequestParameter:(id)a3
{
  [(SUScriptObject *)self lock];
  uint64_t v5 = (void *)[(SSLookupRequest *)self->_request valueForRequestParameter:a3];
  [(SUScriptObject *)self unlock];
  return v5;
}

- (id)authenticatesIfNeeded
{
  [(SUScriptObject *)self lock];
  uint64_t v3 = [(SSLookupRequest *)self->_request personalizationStyle];
  [(SUScriptObject *)self unlock];
  objc_super v4 = (id *)MEMORY[0x263EFFB40];
  if (v3 != 1) {
    objc_super v4 = (id *)MEMORY[0x263EFFB38];
  }
  return *v4;
}

- (id)_className
{
  return @"iTunesLookupRequest";
}

- (NSString)keyProfile
{
  [(SUScriptObject *)self lock];
  uint64_t v3 = (NSString *)[(SSLookupRequest *)self->_request keyProfile];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (int64_t)localizationStyle
{
  [(SUScriptObject *)self lock];
  int64_t v3 = [(SSLookupRequest *)self->_request localizationStyle];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)setAuthenticatesIfNeeded:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(SUScriptObject *)self lock];
    -[SSLookupRequest setPersonalizationStyle:](self->_request, "setPersonalizationStyle:", [a3 BOOLValue]);
    [(SUScriptObject *)self unlock];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

- (void)setKeyProfile:(id)a3
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
    [(SSLookupRequest *)self->_request setKeyProfile:v5];
    [(SUScriptObject *)self unlock];
    return;
  }
  id v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setLocalizationStyle:(int64_t)a3
{
  [(SUScriptObject *)self lock];
  [(SSLookupRequest *)self->_request setLocalizationStyle:a3];

  [(SUScriptObject *)self unlock];
}

- (int64_t)localizationStyleDevice
{
  return 1;
}

- (int64_t)localizationStyleServer
{
  return 0;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_72, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptLookupRequest;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_54, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptLookupRequest;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptLookupRequest;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_72 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_54 = (uint64_t)sel_valueForRequestParameter_;
    *(void *)algn_2681B57C8 = @"getRequestParameter";
    qword_2681B57D0 = (uint64_t)sel_setValue_forRequestParameter_;
    unk_2681B57D8 = @"setRequestParameter";
    qword_2681B57E0 = (uint64_t)sel_startWithLookupFunction_;
    unk_2681B57E8 = @"start";
    __KeyMapping_72 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"authenticatesIfNeeded", @"keyProfile", @"keyProfile", @"localizationStyle", @"localizationStyle", @"LOCALIZATION_STYLE_DEVICE", @"localizationStyleDevice", @"LOCALIZATION_STYLE_SERVER", @"localizationStyleServer", 0);
  }
}

@end