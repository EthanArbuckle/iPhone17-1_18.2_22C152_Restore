@interface SUStorePageProtocol
- (BOOL)shouldDisplayInOverlay;
- (BOOL)shouldExcludeFromNavigationHistory;
- (BOOL)shouldReplaceRootViewController;
- (NSArray)allowedOrientations;
- (NSArray)expectedClientIdentifiers;
- (NSArray)navigationButtons;
- (NSArray)navigationHistoryItems;
- (NSArray)navigationMenus;
- (NSNumber)focusedItemIdentifier;
- (NSString)copyright;
- (NSString)rootSectionIdentifier;
- (SSURLRequestProperties)overlayBackgroundURLRequestProperties;
- (SUStorePageProtocol)init;
- (id)_initCommon;
- (id)_newNavigationButtonsFromArray:(id)a3;
- (id)_newNavigationHistoryItemsFromArray:(id)a3;
- (id)_newNavigationMenusFromArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)navigationButtonForLocation:(id)a3;
- (id)navigationMenuForLocation:(int64_t)a3;
- (id)overlayBackgroundURLRequest;
- (void)setAllowedOrientations:(id)a3;
- (void)setCopyright:(id)a3;
- (void)setExpectedClientIdentifiers:(id)a3;
- (void)setFocusedItemIdentifier:(id)a3;
- (void)setNavigationButtons:(id)a3;
- (void)setNavigationHistoryItems:(id)a3;
- (void)setNavigationMenus:(id)a3;
- (void)setOverlayBackgroundURLRequest:(id)a3;
- (void)setOverlayBackgroundURLRequestProperties:(id)a3;
- (void)setRootSectionIdentifier:(id)a3;
- (void)setShouldDisplayInOverlay:(BOOL)a3;
- (void)setShouldExcludeFromNavigationHistory:(BOOL)a3;
- (void)setShouldReplaceRootViewController:(BOOL)a3;
- (void)setValuesFromStorePageDictionary:(id)a3;
@end

@implementation SUStorePageProtocol

- (id)_initCommon
{
  v3.receiver = self;
  v3.super_class = (Class)SUStorePageProtocol;
  return [(SUStorePageProtocol *)&v3 init];
}

- (SUStorePageProtocol)init
{
  v2 = [(SUStorePageProtocol *)self _initCommon];
  if (v2)
  {
    objc_super v3 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    id v5 = objc_alloc(MEMORY[0x263EFF8C0]);
    if (v4 == 1) {
      uint64_t v6 = objc_msgSend(v5, "initWithObjects:", @"portrait", @"portrait-upside-down", @"landscape-left", @"landscape-right", 0);
    }
    else {
      uint64_t v6 = objc_msgSend(v5, "initWithObjects:", @"portrait", 0, v9, v10, v11);
    }
    allowedOrientations = v2->_allowedOrientations;
    v2->_allowedOrientations = (NSArray *)v6;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initCommon");
  uint64_t v6 = [(NSArray *)self->_allowedOrientations copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_copyright copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSArray *)self->_expectedClientIdentifiers copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSNumber *)self->_focusedItemIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSArray *)self->_navigationButtons copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  uint64_t v16 = [(NSArray *)self->_navigationMenus copyWithZone:a3];
  v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  uint64_t v18 = [(SSURLRequestProperties *)self->_overlayBackgroundURLRequestProperties copyWithZone:a3];
  v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  uint64_t v20 = [(NSArray *)self->_navigationHistoryItems copyWithZone:a3];
  v21 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v20;

  uint64_t v22 = [(NSString *)self->_rootSectionIdentifier copyWithZone:a3];
  v23 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v22;

  *(unsigned char *)(v5 + 80) = self->_shouldDisplayInOverlay;
  *(unsigned char *)(v5 + 81) = self->_shouldExcludeFromNavigationHistory;
  *(unsigned char *)(v5 + 82) = self->_shouldReplaceRootViewController;
  return (id)v5;
}

- (id)navigationButtonForLocation:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_navigationButtons;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "buttonLocation", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)navigationMenuForLocation:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_navigationMenus;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "location", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)overlayBackgroundURLRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F89560]) initWithRequestProperties:self->_overlayBackgroundURLRequestProperties];

  return v2;
}

- (void)setOverlayBackgroundURLRequest:(id)a3
{
  self->_overlayBackgroundURLRequestProperties = [a3 requestProperties];

  MEMORY[0x270F9A758]();
}

- (void)setValuesFromStorePageDictionary:(id)a3
{
  id v30 = a3;
  id v4 = [v30 objectForKey:@"protocol"];
  if (!v4) {
    id v4 = v30;
  }
  uint64_t v5 = [v4 objectForKey:@"allowed-orientations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUStorePageProtocol *)self setAllowedOrientations:v5];
  }
  uint64_t v6 = [v4 objectForKey:@"copyright"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUStorePageProtocol *)self setCopyright:v6];
  }
  uint64_t v7 = [v4 objectForKey:@"store-client-applications"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUStorePageProtocol *)self setExpectedClientIdentifiers:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v7, 0);
      [(SUStorePageProtocol *)self setExpectedClientIdentifiers:v8];
    }
  }
  uint64_t v9 = [v4 objectForKey:@"selected-track-item-id"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUStorePageProtocol *)self setFocusedItemIdentifier:v9];
  }
  id v10 = [v4 objectForKey:@"navigation-buttons"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v11 = [(SUStorePageProtocol *)self _newNavigationButtonsFromArray:v10];
    navigationButtons = self->_navigationButtons;
    self->_navigationButtons = v11;
  }
  long long v13 = [v4 objectForKey:@"navigation-stack"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v14 = [(SUStorePageProtocol *)self _newNavigationHistoryItemsFromArray:v13];
    navigationHistoryItems = self->_navigationHistoryItems;
    self->_navigationHistoryItems = v14;
  }
  long long v16 = [v4 objectForKey:@"popovers"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = [(SUStorePageProtocol *)self _newNavigationMenusFromArray:v16];
    navigationMenus = self->_navigationMenus;
    self->_navigationMenus = v17;
  }
  v19 = [v4 objectForKey:@"selected-footer-section"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUStorePageProtocol *)self setRootSectionIdentifier:v19];
  }
  uint64_t v20 = [v4 objectForKey:@"replace-footer-section"];

  if (objc_opt_respondsToSelector()) {
    uint64_t v21 = [v20 BOOLValue];
  }
  else {
    uint64_t v21 = 0;
  }
  [(SUStorePageProtocol *)self setShouldReplaceRootViewController:v21];
  uint64_t v22 = [v4 objectForKey:@"overlay-parent-url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = (void *)[objc_alloc(NSURL) initWithString:v22];
    if (v23)
    {
      v24 = (void *)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:v23];
      [(SUStorePageProtocol *)self setOverlayBackgroundURLRequestProperties:v24];
    }
  }
  v25 = [v4 objectForKey:@"show-in-overlay"];

  if (v25)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v26 = [v25 BOOLValue];
    }
    else {
      uint64_t v26 = 0;
    }
    [(SUStorePageProtocol *)self setShouldDisplayInOverlay:v26];
  }
  v27 = [v4 objectForKey:@"exclude-from-navigation-history"];

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v28 = [v30 objectForKey:@"exclude-from-navigation-history"];

    v27 = (void *)v28;
  }
  if (v27)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v29 = [v27 BOOLValue];
    }
    else {
      uint64_t v29 = 0;
    }
    [(SUStorePageProtocol *)self setShouldExcludeFromNavigationHistory:v29];
  }
}

- (id)_newNavigationButtonsFromArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v11 = [SUProtocolButton alloc];
          long long v12 = -[SUProtocolButton initWithButtonDictionary:](v11, "initWithButtonDictionary:", v10, (void)v14);
          if (v12) {
            [v4 addObject:v12];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_newNavigationHistoryItemsFromArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v11 = [SUNavigationHistoryItem alloc];
          long long v12 = -[SUNavigationHistoryItem initWithDictionary:](v11, "initWithDictionary:", v10, (void)v14);
          if (v12) {
            [v4 addObject:v12];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_newNavigationMenusFromArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        int v11 = [SUNavigationMenu alloc];
        long long v12 = -[SUNavigationMenu initWithDictionary:](v11, "initWithDictionary:", v10, (void)v14);
        if (v12) {
          [v4 addObject:v12];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if (![v4 count])
  {

    id v4 = 0;
  }

  return v4;
}

- (NSArray)allowedOrientations
{
  return self->_allowedOrientations;
}

- (void)setAllowedOrientations:(id)a3
{
}

- (NSString)copyright
{
  return self->_copyright;
}

- (void)setCopyright:(id)a3
{
}

- (NSArray)expectedClientIdentifiers
{
  return self->_expectedClientIdentifiers;
}

- (void)setExpectedClientIdentifiers:(id)a3
{
}

- (NSNumber)focusedItemIdentifier
{
  return self->_focusedItemIdentifier;
}

- (void)setFocusedItemIdentifier:(id)a3
{
}

- (NSArray)navigationButtons
{
  return self->_navigationButtons;
}

- (void)setNavigationButtons:(id)a3
{
}

- (NSArray)navigationHistoryItems
{
  return self->_navigationHistoryItems;
}

- (void)setNavigationHistoryItems:(id)a3
{
}

- (NSArray)navigationMenus
{
  return self->_navigationMenus;
}

- (void)setNavigationMenus:(id)a3
{
}

- (SSURLRequestProperties)overlayBackgroundURLRequestProperties
{
  return self->_overlayBackgroundURLRequestProperties;
}

- (void)setOverlayBackgroundURLRequestProperties:(id)a3
{
}

- (NSString)rootSectionIdentifier
{
  return self->_rootSectionIdentifier;
}

- (void)setRootSectionIdentifier:(id)a3
{
}

- (BOOL)shouldDisplayInOverlay
{
  return self->_shouldDisplayInOverlay;
}

- (void)setShouldDisplayInOverlay:(BOOL)a3
{
  self->_shouldDisplayInOverlay = a3;
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  return self->_shouldExcludeFromNavigationHistory;
}

- (void)setShouldExcludeFromNavigationHistory:(BOOL)a3
{
  self->_shouldExcludeFromNavigationHistory = a3;
}

- (BOOL)shouldReplaceRootViewController
{
  return self->_shouldReplaceRootViewController;
}

- (void)setShouldReplaceRootViewController:(BOOL)a3
{
  self->_shouldReplaceRootViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_overlayBackgroundURLRequestProperties, 0);
  objc_storeStrong((id *)&self->_navigationMenus, 0);
  objc_storeStrong((id *)&self->_navigationHistoryItems, 0);
  objc_storeStrong((id *)&self->_navigationButtons, 0);
  objc_storeStrong((id *)&self->_focusedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_expectedClientIdentifiers, 0);
  objc_storeStrong((id *)&self->_copyright, 0);

  objc_storeStrong((id *)&self->_allowedOrientations, 0);
}

@end