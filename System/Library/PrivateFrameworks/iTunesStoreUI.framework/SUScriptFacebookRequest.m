@interface SUScriptFacebookRequest
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)_isRequestAllowed:(id *)a3;
- (NSURL)URL;
- (SUScriptAppleAccount)account;
- (SUScriptFacebookRequest)initWithURL:(id)a3 requestMethod:(id)a4;
- (id)_className;
- (id)scriptAttributeKeys;
- (int64_t)requestMethod;
- (int64_t)requestMethodDelete;
- (int64_t)requestMethodGet;
- (int64_t)requestMethodPost;
- (void)_performRequest:(id)a3 withScriptFunction:(id)a4;
- (void)addMultiPartData:(id)a3 withName:(id)a4 type:(id)a5;
- (void)addParameterWithKey:(id)a3 value:(id)a4;
- (void)dealloc;
- (void)performRequestWithFunction:(id)a3;
- (void)setAccount:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation SUScriptFacebookRequest

- (SUScriptFacebookRequest)initWithURL:(id)a3 requestMethod:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SUScriptFacebookRequest;
  v6 = [(SUScriptObject *)&v12 init];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(SUScriptFacebookRequest *)v6 requestMethodGet];
    if ([a4 caseInsensitiveCompare:@"POST"])
    {
      if ([a4 caseInsensitiveCompare:@"DELETE"])
      {
LABEL_7:
        id v10 = objc_alloc((Class)ISWeakLinkedClassForString());
        v7->_request = (SLRequest *)[v10 initWithServiceType:ISWeakLinkedStringConstantForString() URL:a3 parameters:0 requestMethod:v8];
        v7->_requestMethod = v8;
        v7->_url = (NSURL *)[a3 copy];
        return v7;
      }
      uint64_t v9 = [(SUScriptFacebookRequest *)v7 requestMethodDelete];
    }
    else
    {
      uint64_t v9 = [(SUScriptFacebookRequest *)v7 requestMethodPost];
    }
    uint64_t v8 = v9;
    goto LABEL_7;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptFacebookRequest;
  [(SUScriptObject *)&v3 dealloc];
}

- (SUScriptAppleAccount)account
{
  [(SUScriptObject *)self lock];
  objc_super v3 = self->_scriptAccount;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (id)_className
{
  return @"iTunesFacebookRequest";
}

- (int64_t)requestMethod
{
  [(SUScriptObject *)self lock];
  int64_t requestMethod = self->_requestMethod;
  [(SUScriptObject *)self unlock];
  return requestMethod;
}

- (void)setAccount:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = 0;
LABEL_6:
    [(SUScriptObject *)self lock];
    scriptAccount = self->_scriptAccount;
    if (scriptAccount != v5)
    {

      self->_scriptAccount = v5;
    }
    [(SLRequest *)self->_request setAccount:[(SUScriptAppleAccount *)v5 nativeAccount]];
    [(SUScriptObject *)self unlock];
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
  v5 = (SUScriptAppleAccount *)a3;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  uint64_t v8 = (void *)MEMORY[0x263F1FA90];

  [v8 throwException:@"Invalid argument"];
}

- (NSURL)URL
{
  [(SUScriptObject *)self lock];
  objc_super v3 = self->_url;
  [(SUScriptObject *)self unlock];

  return v3;
}

- (void)addMultiPartData:(id)a3 withName:(id)a4 type:(id)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([a5 hasPrefix:@"text/"])
        {
          uint64_t v9 = [a3 dataUsingEncoding:4];
          [(SUScriptObject *)self lock];
          [(SLRequest *)self->_request addMultipartData:v9 withName:a4 type:a5 filename:0];
          [(SUScriptObject *)self unlock];
          return;
        }
        v11 = (void *)[objc_alloc(NSURL) initWithString:a3];
        if (!v11) {
          return;
        }
        id v14 = v11;
        if (objc_msgSend((id)objc_msgSend(v11, "scheme"), "caseInsensitiveCompare:", @"data"))
        {
          if (![v14 host])
          {
LABEL_19:

            return;
          }
          objc_super v12 = [(WebResource *)[(WebDataSource *)[(WebFrame *)[(SUScriptObject *)self webFrame] dataSource] subresourceForURL:v14] data];
        }
        else
        {
          objc_super v12 = (NSData *)SUGetDataForDataURL((uint64_t)v14, 0);
        }
        v13 = v12;
        if (v12)
        {
          [(SUScriptObject *)self lock];
          [(SLRequest *)self->_request addMultipartData:v13 withName:a4 type:a5 filename:0];
          [(SUScriptObject *)self unlock];
        }
        goto LABEL_19;
      }
    }
  }
  id v10 = (void *)MEMORY[0x263F1FA90];

  [v10 throwException:@"Invalid argument"];
}

- (void)addParameterWithKey:(id)a3 value:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    [(SUScriptObject *)self lock];
    [(SLRequest *)self->_request setParameterValue:a4 forKey:a3];
    [(SUScriptObject *)self unlock];
  }
  else
  {
    v7 = (void *)MEMORY[0x263F1FA90];
    [v7 throwException:@"Invalid argument"];
  }
}

- (void)performRequestWithFunction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [[SUScriptFunction alloc] initWithScriptObject:a3];
    [(SUScriptFunction *)v5 setThisObject:self];
    uint64_t v9 = 0;
    if ([(SUScriptFacebookRequest *)self _isRequestAllowed:&v9])
    {
      [(SUScriptObject *)self lock];
      v6 = self->_request;
      [(SUScriptObject *)self unlock];
      [(SUScriptFacebookRequest *)self _performRequest:v6 withScriptFunction:v5];
    }
    else
    {
      uint64_t v8 = [SUScriptFacebookResponse alloc];
      v6 = [(SUScriptFacebookResponse *)v8 initWithData:0 response:0 error:v9];
      -[SUScriptFunction callWithArguments:](v5, "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v6, 0));
      [(SUScriptFunction *)v5 setThisObject:0];
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x263F1FA90];
    [v7 throwException:@"Invalid argument"];
  }
}

- (void)setParameters:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(SUScriptObject *)self copyJavaScriptContext];
    if (v5)
    {
      v6 = v5;
      v7 = (void *)[a3 copyArrayOrDictionaryWithContext:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(SUScriptObject *)self lock];
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __41__SUScriptFacebookRequest_setParameters___block_invoke;
        v9[3] = &unk_264814DE8;
        v9[4] = self;
        [v7 enumerateKeysAndObjectsUsingBlock:v9];
        [(SUScriptObject *)self unlock];
      }

      JSGlobalContextRelease(v6);
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x263F1FA90];
    [v8 throwException:@"Invalid argument"];
  }
}

uint64_t __41__SUScriptFacebookRequest_setParameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) setParameterValue:a3 forKey:a2];
}

- (int64_t)requestMethodDelete
{
  return 2;
}

- (int64_t)requestMethodGet
{
  return 0;
}

- (int64_t)requestMethodPost
{
  return 1;
}

- (BOOL)_isRequestAllowed:(id *)a3
{
  uint64_t v9 = 0;
  v5 = objc_alloc_init(SUScriptAccessSecurity);
  BOOL v6 = [(SUScriptAccessSecurity *)v5 canAccessFacebookWithURL:self->_url inFrame:[(SUScriptObject *)self webFrame] error:&v9];
  BOOL v7 = v6;
  if (a3 && !v6) {
    *a3 = v9;
  }

  return v7;
}

- (void)_performRequest:(id)a3 withScriptFunction:(id)a4
{
  id v7 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__SUScriptFacebookRequest__performRequest_withScriptFunction___block_invoke;
  v8[3] = &unk_264814E10;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a3;
  [a3 performRequestWithHandler:v8];
}

void __62__SUScriptFacebookRequest__performRequest_withScriptFunction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5 = [[SUScriptFacebookResponse alloc] initWithData:a2 response:a3 error:a4];
  id v6 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v5, 0));
  [*(id *)(a1 + 40) setThisObject:0];

  id v7 = *(void **)(a1 + 48);
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_62, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookRequest;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_48, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookRequest;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptFacebookRequest;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_62 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_48 = (uint64_t)sel_addMultiPartData_withName_type_;
    *(void *)algn_2681B5618 = @"addMultiPartData";
    qword_2681B5620 = (uint64_t)sel_addParameterWithKey_value_;
    unk_2681B5628 = @"addParameter";
    qword_2681B5630 = (uint64_t)sel_performRequestWithFunction_;
    unk_2681B5638 = @"perform";
    qword_2681B5640 = (uint64_t)sel_setParameters_;
    unk_2681B5648 = @"setParameters";
    __KeyMapping_62 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"account", @"requestMethod", @"requestMethod", @"URL", @"URL", @"REQUEST_METHOD_DELETE", @"requestMethodDelete", @"REQUEST_METHOD_GET", @"requestMethodGet", @"REQUEST_METHOD_POST", @"requestMethodPost", 0);
  }
}

@end