@interface SUScriptStoreSheetRequest
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
- (void)setProductPageStyle:(int64_t)a3;
- (void)setProductParameters:(id)a3;
- (void)setProductURL:(id)a3;
@end

@implementation SUScriptStoreSheetRequest

- (id)newNativeStorePageRequest
{
  id v3 = objc_alloc_init(MEMORY[0x263F17FC0]);
  v4 = [(SUScriptObject *)self webFrame];
  uint64_t v5 = [v4 globalContext];

  [(SUScriptObject *)self lock];
  [v3 setProductPageStyle:self->_pageStyle];
  productParameters = self->_productParameters;
  if (productParameters) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v8 = (void *)[(WebScriptObject *)productParameters copyArrayOrDictionaryWithContext:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 setProductParameters:v8];
    }
  }
  if (self->_productURL)
  {
    v9 = (void *)[objc_alloc(NSURL) initWithString:self->_productURL];
    [v3 setProductURL:v9];
  }
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)_className
{
  return @"iTunesStoreSheetRequest";
}

- (int64_t)productPageStyle
{
  [(SUScriptObject *)self lock];
  int64_t pageStyle = self->_pageStyle;
  [(SUScriptObject *)self unlock];
  return pageStyle;
}

- (WebScriptObject)productParameters
{
  [(SUScriptObject *)self lock];
  id v3 = self->_productParameters;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)productURL
{
  [(SUScriptObject *)self lock];
  id v3 = self->_productURL;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)setProductPageStyle:(int64_t)a3
{
  [(SUScriptObject *)self lock];
  self->_int64_t pageStyle = a3;
  [(SUScriptObject *)self unlock];
}

- (void)setProductParameters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SUUIWebCoreFramework();
  id v6 = SUUIWeakLinkedClassForString(&cfstr_Webscriptobjec.isa, v5);
  obj = [(SUScriptStoreSheetRequest *)self _safeValueForValue:v4];

  if (obj && (objc_opt_isKindOfClass() & 1) == 0)
  {
    [v6 throwException:@"Invalid argument"];
  }
  else
  {
    [(SUScriptObject *)self lock];
    if (self->_productParameters != obj) {
      objc_storeStrong((id *)&self->_productParameters, obj);
    }
    [(SUScriptObject *)self unlock];
  }
}

- (void)setProductURL:(id)a3
{
  obj = [(SUScriptStoreSheetRequest *)self _safeValueForValue:a3];
  if (obj && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v4 = SUUIWebCoreFramework();
    objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Webscriptobjec.isa, v4), "throwException:", @"Invalid argument");
  }
  else
  {
    [(SUScriptObject *)self lock];
    if (self->_productURL != obj) {
      objc_storeStrong((id *)&self->_productURL, obj);
    }
    [(SUScriptObject *)self unlock];
  }
}

- (int64_t)productPageStyleAutomatic
{
  return 0;
}

- (int64_t)productPageStyleBanner
{
  return 1;
}

- (int64_t)productPageStylePad
{
  return 3;
}

- (int64_t)productPageStylePhone
{
  return 2;
}

- (id)_safeValueForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (uint64_t v4 = SUUIWebCoreFramework(),
        SUUIWeakLinkedClassForString(&cfstr_Webundefined.isa, v4),
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
  id v6 = [(id)__KeyMapping objectForKey:v5];
  if (!v6)
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SUScriptStoreSheetRequest;
    id v6 = objc_msgSendSuper2(&v8, sel_webScriptNameForKey_, a3);
  }

  return v6;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  uint64_t v5 = SUWebScriptNameForSelector2();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptStoreSheetRequest;
    uint64_t v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptStoreSheetRequest;
  v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  id v3 = [(id)__KeyMapping allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"sheetStyle", @"productPageStyle", @"productParameters", @"productParameters", @"productURL", @"productURL", @"SHEET_STYLE_AUTOMATIC", @"productPageStyleAutomatic", @"SHEET_STYLE_BANNER", @"productPageStyleBanner", @"SHEET_STYLE_PAD", @"productPageStylePad", @"SHEET_STYLE_PHONE", @"productPageStylePhone", 0);
    uint64_t v3 = __KeyMapping;
    __KeyMapping = v2;
    MEMORY[0x270F9A758](v2, v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_productParameters, 0);
}

@end