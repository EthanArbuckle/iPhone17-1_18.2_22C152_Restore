@interface SUScriptProtocol
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (BOOL)excludeFromNavigationHistory;
- (BOOL)shouldShowInOverlay;
- (NSArray)allowedOrientations;
- (NSString)clientIdentifier;
- (NSString)copyright;
- (NSString)protocolVersion;
- (SUScriptURLRequest)overlayBackgroundURLRequest;
- (id)_className;
- (id)_copyProtocol;
- (id)_webThreadValueForProtocolKey:(id)a3;
- (id)scriptAttributeKeys;
- (void)_setProtocol:(id)a3;
- (void)_setValue:(id)a3 forProtocolKey:(id)a4;
- (void)setAllowedOrientations:(id)a3;
- (void)setCopyright:(id)a3;
- (void)setExcludeFromNavigationHistory:(BOOL)a3;
- (void)setOverlayBackgroundURLRequest:(id)a3;
- (void)setShouldShowInOverlay:(BOOL)a3;
- (void)setValuesFromDictionary:(id)a3;
@end

@implementation SUScriptProtocol

- (void)setValuesFromDictionary:(id)a3
{
}

void __44__SUScriptProtocol_setValuesFromDictionary___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _copyProtocol];
  [v2 setValuesFromStorePageDictionary:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setProtocol:v2];
}

- (NSArray)allowedOrientations
{
  return (NSArray *)[(SUScriptProtocol *)self _webThreadValueForProtocolKey:@"allowedOrientations"];
}

- (id)_className
{
  return @"iTunesProtocol";
}

- (NSString)clientIdentifier
{
  id v2 = [(SUScriptObject *)self clientInterface];

  return [(SUClientInterface *)v2 clientIdentifier];
}

- (NSString)copyright
{
  return (NSString *)[(SUScriptProtocol *)self _webThreadValueForProtocolKey:@"copyright"];
}

- (BOOL)excludeFromNavigationHistory
{
  id v2 = [(SUScriptProtocol *)self _webThreadValueForProtocolKey:@"shouldExcludeFromNavigationHistory"];

  return [v2 BOOLValue];
}

- (SUScriptURLRequest)overlayBackgroundURLRequest
{
  id v2 = [(SUScriptProtocol *)self _webThreadValueForProtocolKey:@"overlayBackgroundURLRequestProperties"];
  if (v2
    && (v3 = [[SUScriptURLRequest alloc] initWithNativeRequestProperties:v2]) != 0)
  {
    return v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFF9D0];
    return (SUScriptURLRequest *)[v5 null];
  }
}

- (NSString)protocolVersion
{
  return (NSString *)*MEMORY[0x263F89440];
}

- (void)setAllowedOrientations:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v4 = [a3 copyArrayValueWithValidator:__SUOrientationValidator context:0]) != 0)
  {
    v5 = (void *)v4;
    WebThreadRunOnMainThread();
  }
  else
  {
    v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
}

uint64_t __43__SUScriptProtocol_setAllowedOrientations___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setValue:*(void *)(a1 + 40) forProtocolKey:@"allowedOrientations"];
}

- (void)setCopyright:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __33__SUScriptProtocol_setCopyright___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setValue:*(void *)(a1 + 40) forProtocolKey:@"copyright"];
}

- (void)setExcludeFromNavigationHistory:(BOOL)a3
{
}

uint64_t __52__SUScriptProtocol_setExcludeFromNavigationHistory___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];

  return [v1 _setValue:v2 forProtocolKey:@"shouldExcludeFromNavigationHistory"];
}

- (void)setOverlayBackgroundURLRequest:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = 0;
LABEL_6:
    v7 = (void *)[v4 copyNativeRequestProperties];
    WebThreadRunOnMainThread();

    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();
  id v4 = a3;
  if (v6) {
    goto LABEL_6;
  }
  v8 = (void *)MEMORY[0x263F1FA90];

  [v8 throwException:@"Invalid argument"];
}

uint64_t __51__SUScriptProtocol_setOverlayBackgroundURLRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setValue:*(void *)(a1 + 40) forProtocolKey:@"overlayBackgroundURLRequestProperties"];
}

- (void)setShouldShowInOverlay:(BOOL)a3
{
}

uint64_t __43__SUScriptProtocol_setShouldShowInOverlay___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];

  return [v1 _setValue:v2 forProtocolKey:@"shouldDisplayInOverlay"];
}

- (BOOL)shouldShowInOverlay
{
  id v2 = [(SUScriptProtocol *)self _webThreadValueForProtocolKey:@"shouldDisplayInOverlay"];

  return [v2 BOOLValue];
}

- (id)_copyProtocol
{
  id result = (id)objc_msgSend((id)objc_msgSend(-[SUScriptObject parentViewController](self, "parentViewController"), "storePageProtocol"), "copy");
  if (!result)
  {
    return objc_alloc_init(SUStorePageProtocol);
  }
  return result;
}

- (void)_setProtocol:(id)a3
{
  id v4 = [(SUScriptObject *)self parentViewController];

  [v4 setStorePageProtocol:a3];
}

- (void)_setValue:(id)a3 forProtocolKey:(id)a4
{
  id v7 = [(SUScriptProtocol *)self _copyProtocol];
  [v7 setValue:a3 forKey:a4];
  [(SUScriptProtocol *)self _setProtocol:v7];
}

- (id)_webThreadValueForProtocolKey:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__10;
  v14 = __Block_byref_object_dispose__10;
  uint64_t v15 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  id v4 = (id)objc_msgSend((id)v11[5], "valueForKey:", a3, v8, 3221225472, __50__SUScriptProtocol__webThreadValueForProtocolKey___block_invoke, &unk_264812E70, self, &v10);

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)[MEMORY[0x263EFF9D0] null];
  }
  char v6 = v5;
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __50__SUScriptProtocol__webThreadValueForProtocolKey___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copyProtocol];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_17, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptProtocol;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptProtocol;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_17 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_17 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"allowedOrientations", @"clientIdentifier", @"clientIdentifier", @"copyright", @"copyright", @"excludeFromNavigationHistory", @"excludeFromNavigationHistory", @"overlayBackgroundURLRequest", @"overlayBackgroundURLRequest", @"protocolVersion", @"protocolVersion", @"shouldShowInOverlay", @"shouldShowInOverlay", 0);
  }
}

@end