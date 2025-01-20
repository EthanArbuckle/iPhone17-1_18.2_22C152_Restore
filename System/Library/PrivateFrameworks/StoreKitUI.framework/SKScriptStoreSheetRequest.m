@interface SKScriptStoreSheetRequest
+ (id)webScriptNameForKey:(const char *)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)productURL;
- (WebScriptObject)productParameters;
- (id)_className;
- (id)_safeValueForValue:(id)a3;
- (id)newNativeStorePageRequest;
- (id)scriptAttributeKeys;
- (int64_t)productPageStyle;
- (int64_t)productPageStyleAutomatic;
- (int64_t)productPageStyleBanner;
- (int64_t)productPageStylePad;
- (int64_t)productPageStylePhone;
- (void)newNativeStorePageRequest;
- (void)productPageStyle;
- (void)productPageStyleAutomatic;
- (void)productPageStyleBanner;
- (void)productPageStylePad;
- (void)productPageStylePhone;
- (void)productParameters;
- (void)productURL;
- (void)setProductPageStyle:(int64_t)a3;
- (void)setProductParameters:(id)a3;
- (void)setProductURL:(id)a3;
@end

@implementation SKScriptStoreSheetRequest

- (id)newNativeStorePageRequest
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKScriptStoreSheetRequest *)v3 newNativeStorePageRequest];
      }
    }
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F3C300]);
  v12 = [(SUScriptObject *)self webFrame];
  uint64_t v13 = [v12 globalContext];

  [(SUScriptObject *)self lock];
  [v11 setProductPageStyle:self->_pageStyle];
  productParameters = self->_productParameters;
  if (productParameters) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    v16 = (void *)[(WebScriptObject *)productParameters copyArrayOrDictionaryWithContext:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v11 setProductParameters:v16];
    }
  }
  if (self->_productURL)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:self->_productURL];
    [v11 setProductURL:v17];
  }
  [(SUScriptObject *)self unlock];
  return v11;
}

- (id)_className
{
  return @"iTunesStoreSheetRequest";
}

- (int64_t)productPageStyle
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKScriptStoreSheetRequest *)v3 productPageStyle];
      }
    }
  }
  [(SUScriptObject *)self lock];
  int64_t pageStyle = self->_pageStyle;
  [(SUScriptObject *)self unlock];
  return pageStyle;
}

- (WebScriptObject)productParameters
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKScriptStoreSheetRequest *)v3 productParameters];
      }
    }
  }
  [(SUScriptObject *)self lock];
  id v11 = self->_productParameters;
  [(SUScriptObject *)self unlock];

  return v11;
}

- (NSString)productURL
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKScriptStoreSheetRequest *)v3 productURL];
      }
    }
  }
  [(SUScriptObject *)self lock];
  id v11 = self->_productURL;
  [(SUScriptObject *)self unlock];

  return v11;
}

- (void)setProductPageStyle:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKScriptStoreSheetRequest setProductPageStyle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SUScriptObject *)self lock];
  self->_int64_t pageStyle = a3;
  [(SUScriptObject *)self unlock];
}

- (void)setProductParameters:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKScriptStoreSheetRequest setProductParameters:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = SKUIWebCoreFramework();
  id v14 = SKUIWeakLinkedClassForString(&cfstr_Webscriptobjec.isa, v13);
  BOOL v15 = [(SKScriptStoreSheetRequest *)self _safeValueForValue:v4];

  if (v15 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    [v14 throwException:@"Invalid argument"];
  }
  else
  {
    [(SUScriptObject *)self lock];
    if (self->_productParameters != v15) {
      objc_storeStrong((id *)&self->_productParameters, v15);
    }
    [(SUScriptObject *)self unlock];
  }
}

- (void)setProductURL:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKScriptStoreSheetRequest setProductURL:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(SKScriptStoreSheetRequest *)self _safeValueForValue:v4];

  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v14 = SKUIWebCoreFramework();
    objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Webscriptobjec.isa, v14), "throwException:", @"Invalid argument");
  }
  else
  {
    [(SUScriptObject *)self lock];
    if (self->_productURL != v13) {
      objc_storeStrong((id *)&self->_productURL, v13);
    }
    [(SUScriptObject *)self unlock];
  }
}

- (int64_t)productPageStyleAutomatic
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKScriptStoreSheetRequest *)v2 productPageStyleAutomatic];
      }
    }
  }
  return 0;
}

- (int64_t)productPageStyleBanner
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKScriptStoreSheetRequest *)v2 productPageStyleBanner];
      }
    }
  }
  return 1;
}

- (int64_t)productPageStylePad
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKScriptStoreSheetRequest *)v2 productPageStylePad];
      }
    }
  }
  return 3;
}

- (int64_t)productPageStylePhone
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKScriptStoreSheetRequest *)v2 productPageStylePhone];
      }
    }
  }
  return 2;
}

- (id)_safeValueForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (uint64_t v4 = SKUIWebCoreFramework(),
        SKUIWeakLinkedClassForString(&cfstr_Webundefined.isa, v4),
        uint64_t v5 = v3,
        (objc_opt_isKindOfClass() & 1) != 0))
  {

    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)webScriptNameForKey:(const char *)a3
{
  uint64_t v5 = (void *)[[NSString alloc] initWithUTF8String:a3];
  uint64_t v6 = [(id)__KeyMapping objectForKey:v5];
  if (!v6)
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SKScriptStoreSheetRequest;
    uint64_t v6 = objc_msgSendSuper2(&v8, sel_webScriptNameForKey_, a3);
  }

  return v6;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  uint64_t v5 = SUWebScriptNameForSelector2();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SKScriptStoreSheetRequest;
    uint64_t v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SKScriptStoreSheetRequest;
  BOOL v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  id v3 = [(id)__KeyMapping allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __KeyMapping = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"sheetStyle", @"productPageStyle", @"productParameters", @"productParameters", @"productURL", @"productURL", @"SHEET_STYLE_AUTOMATIC", @"productPageStyleAutomatic", @"SHEET_STYLE_BANNER", @"productPageStyleBanner", @"SHEET_STYLE_PAD", @"productPageStylePad", @"SHEET_STYLE_PHONE", @"productPageStylePhone", 0);
    MEMORY[0x1F41817F8]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productURL, 0);

  objc_storeStrong((id *)&self->_productParameters, 0);
}

- (void)newNativeStorePageRequest
{
}

- (void)productPageStyle
{
}

- (void)productParameters
{
}

- (void)productURL
{
}

- (void)setProductPageStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setProductParameters:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setProductURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)productPageStyleAutomatic
{
}

- (void)productPageStyleBanner
{
}

- (void)productPageStylePad
{
}

- (void)productPageStylePhone
{
}

@end