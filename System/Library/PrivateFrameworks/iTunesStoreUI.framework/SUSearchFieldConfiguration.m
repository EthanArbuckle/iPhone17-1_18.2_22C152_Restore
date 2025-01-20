@interface SUSearchFieldConfiguration
+ (id)defaultConfiguration;
+ (id)defaultConfigurationWithClientInterface:(id)a3;
- (BOOL)isRootViewOnly;
- (NSString)cancelString;
- (NSString)placeholderString;
- (NSString)userDefaultsKey;
- (SUSearchFieldConfiguration)init;
- (SUSearchFieldConfiguration)initWithDictionary:(id)a3;
- (SUSearchFieldConfiguration)initWithDictionary:(id)a3 clientInterface:(id)a4;
- (__CFDictionary)_newURLsDictionaryWithDictionary:(id)a3;
- (double)width;
- (double)widthForOrientation:(int64_t)a3;
- (id)URLRequestPropertiesWithBaseURL:(id)a3 forNetworkType:(int64_t)a4;
- (id)_initWithClientInterface:(id)a3;
- (id)_newQueryStringDictionaryForNetworkType:(int64_t)a3;
- (id)_urlRequestPropertiesForURLBagKey:(id)a3 networkType:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hintsURLRequestPropertiesForNetworkType:(int64_t)a3;
- (id)searchURLRequestPropertiesForNetworkType:(int64_t)a3;
- (int64_t)_locationForString:(id)a3;
- (int64_t)location;
- (void)_setHintURLsFromDictionary:(id)a3;
- (void)_setSearchURLsFromDictionary:(id)a3;
- (void)dealloc;
- (void)loadFromDictionary:(id)a3;
@end

@implementation SUSearchFieldConfiguration

+ (id)defaultConfigurationWithClientInterface:(id)a3
{
  uint64_t v3 = [objc_alloc((Class)objc_opt_class()) _initWithClientInterface:a3];
  *(void *)(v3 + 8) = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"CANCEL", &stru_26DB8C5F8, 0);
  *(void *)(v3 + 40) = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SEARCH", &stru_26DB8C5F8, 0);
  *(void *)(v3 + 64) = @"SULastSearch";
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1)
  {
    *(_OWORD *)(v3 + 80) = xmmword_227924370;
    uint64_t v4 = 0x406F800000000000;
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 0;
    *(unsigned char *)(v3 + 48) = 1;
    uint64_t v4 = 0x4074000000000000;
  }
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 72) = v4;

  return (id)v3;
}

- (id)_initWithClientInterface:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUSearchFieldConfiguration;
  uint64_t v4 = [(SUSearchFieldConfiguration *)&v6 init];
  if (v4) {
    v4->_clientInterface = (SUClientInterface *)a3;
  }
  return v4;
}

- (SUSearchFieldConfiguration)init
{
  return [(SUSearchFieldConfiguration *)self initWithDictionary:0];
}

- (SUSearchFieldConfiguration)initWithDictionary:(id)a3
{
  id v5 = +[SUClientDispatch clientInterface];

  return [(SUSearchFieldConfiguration *)self initWithDictionary:a3 clientInterface:v5];
}

- (SUSearchFieldConfiguration)initWithDictionary:(id)a3 clientInterface:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SUSearchFieldConfiguration;
  objc_super v6 = [(SUSearchFieldConfiguration *)&v8 init];
  if (v6)
  {
    v6->_clientInterface = (SUClientInterface *)a4;
    v6->_location = 2;
    v6->_userDefaultsKey = (NSString *)@"SULastSearch";
    [(SUSearchFieldConfiguration *)v6 loadFromDictionary:a3];
  }
  return v6;
}

- (void)dealloc
{
  hintURLs = self->_hintURLs;
  if (hintURLs) {
    CFRelease(hintURLs);
  }
  searchURLs = self->_searchURLs;
  if (searchURLs) {
    CFRelease(searchURLs);
  }

  v5.receiver = self;
  v5.super_class = (Class)SUSearchFieldConfiguration;
  [(SUSearchFieldConfiguration *)&v5 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithClientInterface:", self->_clientInterface);
  *(void *)(v5 + 8) = [(NSString *)self->_cancelString copyWithZone:a3];
  *(void *)(v5 + 32) = self->_location;
  *(void *)(v5 + 40) = [(NSString *)self->_placeholder copyWithZone:a3];
  *(unsigned char *)(v5 + 48) = self->_rootViewOnly;
  *(void *)(v5 + 64) = [(NSString *)self->_userDefaultsKey copyWithZone:a3];
  *(double *)(v5 + 72) = self->_width;
  *(double *)(v5 + 80) = self->_widthLandscape;
  *(double *)(v5 + 88) = self->_widthPortrait;
  hintURLs = self->_hintURLs;
  if (hintURLs) {
    *(void *)(v5 + 24) = CFDictionaryCreateMutableCopy(0, 0, hintURLs);
  }
  searchURLs = self->_searchURLs;
  if (searchURLs) {
    *(void *)(v5 + 56) = CFDictionaryCreateMutableCopy(0, 0, searchURLs);
  }
  return (id)v5;
}

+ (id)defaultConfiguration
{
  id v3 = +[SUClientDispatch clientInterface];

  return (id)[a1 defaultConfigurationWithClientInterface:v3];
}

- (id)hintsURLRequestPropertiesForNetworkType:(int64_t)a3
{
  if (self->_hintURLs)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263F7B290]), "initWithURL:", CFDictionaryGetValue(self->_hintURLs, (const void *)a3));
    return v5;
  }
  else
  {
    id v7 = [(SUClientInterface *)self->_clientInterface URLBagKeyForIdentifier:@"SUURLBagKeySearchHints"];
    return [(SUSearchFieldConfiguration *)self _urlRequestPropertiesForURLBagKey:v7 networkType:a3];
  }
}

- (void)loadFromDictionary:(id)a3
{
  uint64_t v5 = (void *)[a3 objectForKey:@"cancel-text"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_cancelString = (NSString *)v5;
  }
  uint64_t v6 = [a3 objectForKey:@"hints-urls"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUSearchFieldConfiguration *)self _setHintURLsFromDictionary:v6];
  }
  uint64_t v7 = [a3 objectForKey:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self->_location = [(SUSearchFieldConfiguration *)self _locationForString:v7];
  }
  objc_super v8 = (void *)[a3 objectForKey:@"persistent-id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_userDefaultsKey = (NSString *)v8;
  }
  v9 = (void *)[a3 objectForKey:@"placeholder"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    v10 = (NSString *)[v9 length];
    if (v10) {
      v10 = v9;
    }
    self->_placeholder = v10;
  }
  v11 = (void *)[a3 objectForKey:@"root-page-only"];
  if (objc_opt_respondsToSelector()) {
    self->_rootViewOnly = [v11 BOOLValue];
  }
  uint64_t v12 = [a3 objectForKey:@"search-urls"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUSearchFieldConfiguration *)self _setSearchURLsFromDictionary:v12];
  }
  v13 = (void *)[a3 objectForKey:@"width"];
  if (objc_opt_respondsToSelector())
  {
    [v13 floatValue];
    self->_width = v14;
  }
  v15 = (void *)[a3 objectForKey:@"width-landscape"];
  if (objc_opt_respondsToSelector())
  {
    [v15 floatValue];
    self->_widthLandscape = v16;
  }
  v17 = (void *)[a3 objectForKey:@"width-portrait"];
  if (objc_opt_respondsToSelector())
  {
    [v17 floatValue];
    self->_widthPortrait = v18;
  }
}

- (id)searchURLRequestPropertiesForNetworkType:(int64_t)a3
{
  if (self->_searchURLs)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263F7B290]), "initWithURL:", CFDictionaryGetValue(self->_searchURLs, (const void *)a3));
    return v5;
  }
  else
  {
    id v7 = [(SUClientInterface *)self->_clientInterface URLBagKeyForIdentifier:@"SUURLBagKeySearch"];
    return [(SUSearchFieldConfiguration *)self _urlRequestPropertiesForURLBagKey:v7 networkType:a3];
  }
}

- (id)URLRequestPropertiesWithBaseURL:(id)a3 forNetworkType:(int64_t)a4
{
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:a3];
  id v7 = [(SUSearchFieldConfiguration *)self _newQueryStringDictionaryForNetworkType:a4];
  [v6 setRequestParameters:v7];

  return v6;
}

- (double)widthForOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 1) {
    double result = self->_widthPortrait;
  }
  else {
    double result = self->_widthLandscape;
  }
  if (result <= 0.00000011920929) {
    return self->_width;
  }
  return result;
}

- (int64_t)_locationForString:(id)a3
{
  uint64_t v4 = 0;
  int64_t v5 = 2;
  while (![*(__CFString **)((char *)&__LocationNameMapping + v4) isEqualToString:a3])
  {
    v4 += 16;
    if (v4 == 64) {
      return v5;
    }
  }
  return *(int64_t *)((char *)&__LocationNameMapping + v4 + 8);
}

- (id)_newQueryStringDictionaryForNetworkType:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = [(SUClientInterface *)self->_clientInterface clientIdentifier];
  if (v6)
  {
    id v7 = v6;
    objc_super v8 = (void *)[MEMORY[0x263F89540] sharedCache];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "URLBagForContext:", objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", 0)), "searchQueryParametersForClientIdentifier:networkType:", v7, a3);
    if (v9)
    {
      v10 = (void *)[NSURL copyDictionaryForQueryString:v9 unescapedValues:1];
      if (v10) {
        [v5 addEntriesFromDictionary:v10];
      }
    }
  }
  return v5;
}

- (__CFDictionary)_newURLsDictionaryWithDictionary:(id)a3
{
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  objc_super v8 = __Block_byref_object_copy__40;
  uint64_t v9 = __Block_byref_object_dispose__40;
  uint64_t v10 = 0;
  SSNetworkTypeApplyBlock();

  _Block_object_dispose(&v5, 8);
  return Mutable;
}

void __63__SUSearchFieldConfiguration__newURLsDictionaryWithDictionary___block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v4 = SSGetStringForNetworkType();
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) objectForKey:v4];
    if (!v5
      && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
      && SSNetworkTypeIsCellularType())
    {
      uint64_t v7 = *(__CFDictionary **)(a1 + 48);
      objc_super v8 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      CFDictionarySetValue(v7, a2, v8);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [objc_alloc(NSURL) initWithString:v5];
        if (v6)
        {
          id value = (id)v6;
          if (SSNetworkTypeIsCellularType())
          {

            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = value;
          }
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), a2, value);
        }
      }
    }
  }
}

- (void)_setHintURLsFromDictionary:(id)a3
{
  hintURLs = self->_hintURLs;
  if (hintURLs) {
    CFRelease(hintURLs);
  }
  self->_hintURLs = [(SUSearchFieldConfiguration *)self _newURLsDictionaryWithDictionary:a3];
}

- (void)_setSearchURLsFromDictionary:(id)a3
{
  searchURLs = self->_searchURLs;
  if (searchURLs) {
    CFRelease(searchURLs);
  }
  self->_searchURLs = [(SUSearchFieldConfiguration *)self _newURLsDictionaryWithDictionary:a3];
}

- (id)_urlRequestPropertiesForURLBagKey:(id)a3 networkType:(int64_t)a4
{
  uint64_t v7 = [MEMORY[0x263F7B358] contextWithBagType:0];
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache"), "URLBagForContext:", v7), "urlForKey:", a3);
  if (result)
  {
    return [(SUSearchFieldConfiguration *)self URLRequestPropertiesWithBaseURL:result forNetworkType:a4];
  }
  return result;
}

- (NSString)cancelString
{
  return self->_cancelString;
}

- (int64_t)location
{
  return self->_location;
}

- (NSString)placeholderString
{
  return self->_placeholder;
}

- (BOOL)isRootViewOnly
{
  return self->_rootViewOnly;
}

- (NSString)userDefaultsKey
{
  return self->_userDefaultsKey;
}

- (double)width
{
  return self->_width;
}

@end