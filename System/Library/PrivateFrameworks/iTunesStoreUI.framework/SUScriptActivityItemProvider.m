@interface SUScriptActivityItemProvider
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)MIMEType;
- (NSString)activityType;
- (NSString)status;
- (SUActivityItemProvider)nativeActivityItemProvider;
- (SUScriptActivityItemProvider)initWithMIMEType:(id)a3;
- (WebScriptObject)itemFunction;
- (double)progress;
- (id)_className;
- (id)_newPlaceholderWithMIMEType:(id)a3;
- (id)activitySupportsMIMEType:(id)a3;
- (id)scriptAttributeKeys;
- (void)_finishItemWithItem:(id)a3;
- (void)_finishPreviewWithImage:(id)a3;
- (void)activityItemProvider:(id)a3 provideItemUsingBlock:(id)a4;
- (void)dealloc;
- (void)setItem:(id)a3;
- (void)setItemFunction:(id)a3;
- (void)setPreviewImageWithURLString:(id)a3;
@end

@implementation SUScriptActivityItemProvider

- (SUScriptActivityItemProvider)initWithMIMEType:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptActivityItemProvider;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_mimeType = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  [(SUScriptFunction *)self->_itemFunction setThisObject:0];

  [(SUActivityItemProvider *)self->_nativeProvider setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptActivityItemProvider;
  [(SUScriptObject *)&v3 dealloc];
}

- (SUActivityItemProvider)nativeActivityItemProvider
{
  [(SUScriptObject *)self lock];
  nativeProvider = self->_nativeProvider;
  if (!nativeProvider)
  {
    id v4 = [(SUScriptActivityItemProvider *)self _newPlaceholderWithMIMEType:self->_mimeType];
    v5 = [[SUActivityItemProvider alloc] initWithPlaceholderItem:v4];
    self->_nativeProvider = v5;
    [(SUActivityItemProvider *)v5 setDelegate:self];

    nativeProvider = self->_nativeProvider;
  }
  objc_super v6 = nativeProvider;
  [(SUScriptObject *)self unlock];
  return v6;
}

- (id)activitySupportsMIMEType:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_7;
  }
  id v5 = [(SUScriptActivityItemProvider *)self _newPlaceholderWithMIMEType:a3];
  if (!v5)
  {
LABEL_7:
    v8 = (id *)MEMORY[0x263EFFB38];
    return *v8;
  }
  objc_super v6 = v5;
  v7 = [(SUActivityItemProvider *)[(SUScriptActivityItemProvider *)self nativeActivityItemProvider] suActivity];
  LODWORD(v7) = -[UIActivity canPerformWithActivityItems:](v7, "canPerformWithActivityItems:", [MEMORY[0x263EFF8C0] arrayWithObject:v6]);

  v8 = (id *)MEMORY[0x263EFFB40];
  if (!v7) {
    v8 = (id *)MEMORY[0x263EFFB38];
  }
  return *v8;
}

- (void)setItem:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0)
  {
    id v5 = self;
    id v6 = 0;
LABEL_3:
    [(SUScriptActivityItemProvider *)v5 _finishItemWithItem:v6];
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(NSString *)self->_mimeType isEqualToString:@"text/url"])
    {
      id v13 = (id)[objc_alloc(NSURL) initWithString:a3];
      [(SUScriptActivityItemProvider *)self _finishItemWithItem:v13];

      return;
    }
    if ([(NSString *)self->_mimeType hasPrefix:@"text/"])
    {
      id v5 = self;
      id v6 = a3;
      goto LABEL_3;
    }
    if ([(NSString *)self->_mimeType hasPrefix:@"image/"])
    {
      v9 = (void *)[objc_alloc(NSURL) initWithString:a3];
      id v10 = [(SUScriptObject *)self newImageWithURL:v9];
      if (v10)
      {
        v11 = v10;
        [(SUScriptActivityItemProvider *)self _finishItemWithItem:v10];
      }
      else
      {
        [(SUScriptObject *)self lock];
        self->_loadState = 1;
        [(SUScriptObject *)self unlock];
        uint64_t v12 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __40__SUScriptActivityItemProvider_setItem___block_invoke;
        v14[3] = &unk_264814ED0;
        v14[4] = v12;
        [(SUScriptObject *)self loadImageWithURL:v9 completionBlock:v14];
      }
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x263F1FA90];
    [v8 throwException:@"Invalid argument"];
  }
}

uint64_t __40__SUScriptActivityItemProvider_setItem___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = (void *)[*(id *)(a1 + 32) object];

  return [v3 _finishItemWithItem:a2];
}

- (void)setPreviewImageWithURLString:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0)
  {
    [(SUScriptActivityItemProvider *)self _finishPreviewWithImage:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [objc_alloc(NSURL) initWithString:a3];
      if (v6)
      {
        v7 = (void *)v6;
        id v8 = [(SUScriptObject *)self newImageWithURL:v6];
        if (v8)
        {
          v9 = v8;
          [(SUScriptActivityItemProvider *)self _finishPreviewWithImage:v8];
        }
        else
        {
          [(SUScriptObject *)self lock];
          self->_previewLoadState = 1;
          [(SUScriptObject *)self unlock];
          uint64_t v11 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __61__SUScriptActivityItemProvider_setPreviewImageWithURLString___block_invoke;
          v12[3] = &unk_264814ED0;
          v12[4] = v11;
          [(SUScriptObject *)self loadImageWithURL:v7 completionBlock:v12];
        }
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F1FA90];
      [v10 throwException:@"Invalid argument"];
    }
  }
}

uint64_t __61__SUScriptActivityItemProvider_setPreviewImageWithURLString___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = (void *)[*(id *)(a1 + 32) object];

  return [v3 _finishPreviewWithImage:a2];
}

- (NSString)activityType
{
  return [(UIActivityItemProvider *)self->_nativeProvider activityType];
}

- (id)_className
{
  return @"iTunesActivityItemProvider";
}

- (WebScriptObject)itemFunction
{
  [(SUScriptObject *)self lock];
  objc_super v3 = [(SUScriptFunction *)self->_itemFunction scriptObject];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)MIMEType
{
  return self->_mimeType;
}

- (double)progress
{
  return 0.0;
}

- (void)setItemFunction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    int v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  int v6 = 1;
  if (!a3 || (isKindOfClass & 1) != 0)
  {
LABEL_7:
    [(SUScriptFunction *)self->_itemFunction setThisObject:0];

    if (v6)
    {
      self->_itemFunction = 0;
    }
    else
    {
      id v8 = [[SUScriptFunction alloc] initWithScriptObject:v5];
      self->_itemFunction = v8;
      [(SUScriptFunction *)v8 setThisObject:self];
    }
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = 0;
    id v5 = a3;
    goto LABEL_7;
  }
  v9 = (void *)MEMORY[0x263F1FA90];

  [v9 throwException:@"Invalid argument"];
}

- (NSString)status
{
  return 0;
}

- (void)activityItemProvider:(id)a3 provideItemUsingBlock:(id)a4
{
  [(SUScriptObject *)self lock];
  int v6 = self->_itemFunction;

  self->_itemBlock = (id)[a4 copy];
  [(SUScriptObject *)self unlock];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75__SUScriptActivityItemProvider_activityItemProvider_provideItemUsingBlock___block_invoke;
    v9[3] = &unk_2648137A8;
    v9[4] = v7;
    [(SUScriptFunction *)v6 callWithArguments:0 completionBlock:v9];
  }
  else
  {
    id v8 = (void (*)(id, void))*((void *)a4 + 2);
    v8(a4, 0);
  }
}

uint64_t __75__SUScriptActivityItemProvider_activityItemProvider_provideItemUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[*(id *)(a1 + 32) object];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    id v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v13 = 138412546;
      uint64_t v14 = objc_opt_class();
      __int16 v15 = 2112;
      uint64_t v16 = a2;
      LODWORD(v12) = 22;
      uint64_t v11 = &v13;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v13, v12);
        free(v9);
        uint64_t v11 = (int *)v10;
        SSFileLog();
      }
    }
    return objc_msgSend(v3, "_finishItemWithItem:", 0, v11);
  }
  return result;
}

- (void)_finishItemWithItem:(id)a3
{
  [(SUScriptObject *)self lock];

  self->_item = a3;
  self->_loadState = 2;
  if (self->_previewLoadState == 1)
  {
    [(SUScriptObject *)self unlock];
  }
  else
  {
    id v5 = (void (**)(id, id))self->_itemBlock;
    [(SUScriptObject *)self unlock];
    if (v5)
    {
      v5[2](v5, a3);
    }
  }
}

- (void)_finishPreviewWithImage:(id)a3
{
  [(SUActivityItemProvider *)[(SUScriptActivityItemProvider *)self nativeActivityItemProvider] setSUPreviewImage:a3];
  [(SUScriptObject *)self lock];
  self->_previewLoadState = 2;
  if (self->_loadState == 2)
  {
    id v6 = self->_item;
    id v4 = (void (**)(id, id))self->_itemBlock;
    [(SUScriptObject *)self unlock];
    if (v4) {
      v4[2](v4, v6);
    }
    id v5 = v6;
  }
  else
  {
    [(SUScriptObject *)self unlock];
    id v5 = 0;
  }
}

- (id)_newPlaceholderWithMIMEType:(id)a3
{
  if ([a3 isEqualToString:@"text/url"])
  {
    id v4 = objc_alloc(NSURL);
    return (id)[v4 initWithString:@"http://example.com/"];
  }
  else
  {
    if ([a3 hasPrefix:@"text/"])
    {
      id v6 = (objc_class *)NSString;
    }
    else
    {
      if (![a3 hasPrefix:@"image/"]) {
        return 0;
      }
      id v6 = (objc_class *)MEMORY[0x263F1C6B0];
    }
    return objc_alloc_init(v6);
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_71, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivityItemProvider;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_53, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivityItemProvider;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptActivityItemProvider;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_71 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_53 = (uint64_t)sel_activitySupportsMIMEType_;
    unk_2681B5790 = @"activitySupportsMIMEType";
    qword_2681B5798 = (uint64_t)sel_setItem_;
    unk_2681B57A0 = @"setItem";
    qword_2681B57A8 = (uint64_t)sel_setPreviewImageWithURLString_;
    unk_2681B57B0 = @"setPreviewImage";
    __KeyMapping_71 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"activityType", @"itemFunction", @"itemFunction", @"MIMEType", @"MIMEType", @"progress", @"progress", @"status", @"status", 0);
  }
}

@end