@interface SUStructuredPage
+ (int64_t)pageTypeForStorePageDictionary:(id)a3;
+ (int64_t)pageTypeForStorePageString:(id)a3;
- (BOOL)artworkShouldFitWidth;
- (BOOL)didShowDialog;
- (BOOL)hasDisplayableContent;
- (BOOL)loadFromDictionary:(id)a3;
- (BOOL)shouldHideSignInButton;
- (BOOL)wantsIndexBar;
- (NSString)title;
- (SUItem)item;
- (SUItemList)itemList;
- (SUPageSectionGroup)sectionsGroup;
- (SUStorePageProtocol)protocol;
- (double)artworkWidth;
- (id)_copyItemFromDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_displayStyleForString:(id)a3;
- (int64_t)displayStyle;
- (int64_t)type;
- (void)_parseItemsFromDictionary:(id)a3;
- (void)_parseProtocolFromDictionary:(id)a3;
- (void)_parseTemplateParametersFromDictionary:(id)a3;
- (void)dealloc;
- (void)setItem:(id)a3;
- (void)setItemList:(id)a3;
- (void)setProtocol:(id)a3;
- (void)setSectionsGroup:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SUStructuredPage

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUStructuredPage;
  [(SUStructuredPage *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 8) = self->_artworkShouldFitWidth;
  *(double *)(v5 + 16) = self->_artworkWidth;
  *(unsigned char *)(v5 + 24) = self->_didShowDialog;
  *(void *)(v5 + 32) = self->_displayStyle;
  *(void *)(v5 + 40) = self->_item;
  *(void *)(v5 + 48) = [(SUItemList *)self->_itemList copyWithZone:a3];
  *(void *)(v5 + 56) = [(SUStorePageProtocol *)self->_protocol copyWithZone:a3];
  *(void *)(v5 + 64) = [(SUPageSectionGroup *)self->_sectionsGroup copyWithZone:a3];
  *(void *)(v5 + 80) = [(NSString *)self->_title copyWithZone:a3];
  *(void *)(v5 + 88) = self->_type;
  *(unsigned char *)(v5 + 96) = self->_wantsIndexBar;
  return (id)v5;
}

+ (int64_t)pageTypeForStorePageDictionary:(id)a3
{
  v4 = (void *)[a3 objectForKey:@"page-type"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    v4 = (void *)[v4 objectForKey:@"template-name"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }

  return [a1 pageTypeForStorePageString:v4];
}

+ (int64_t)pageTypeForStorePageString:(id)a3
{
  if (([a3 isEqualToString:@"album"] & 1) != 0
    || ([a3 isEqualToString:@"tracks"] & 1) != 0
    || ([a3 isEqualToString:@"mix"] & 1) != 0
    || ([a3 isEqualToString:@"podcast"] & 1) != 0
    || ([a3 isEqualToString:@"course"] & 1) != 0)
  {
    return 1;
  }
  if ([a3 isEqualToString:@"software"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"split-view"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"search"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"software-update"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"reviews"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"eula"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"software-updates"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"downloads"]) {
    return 9;
  }
  return 0;
}

- (BOOL)loadFromDictionary:(id)a3
{
  -[SUStructuredPage _parseItemsFromDictionary:](self, "_parseItemsFromDictionary:");
  -[SUStructuredPage setType:](self, "setType:", [(id)objc_opt_class() pageTypeForStorePageDictionary:a3]);
  [(SUStructuredPage *)self _parseTemplateParametersFromDictionary:a3];
  [(SUStructuredPage *)self _parseProtocolFromDictionary:a3];
  uint64_t v5 = [a3 objectForKey:@"tabs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = objc_alloc_init(SUPageSectionGroup);
    if ([(SUPageSectionGroup *)v6 loadFromDictionary:v5]) {
      [(SUStructuredPage *)self setSectionsGroup:v6];
    }
  }
  else
  {
    [(SUStructuredPage *)self setSectionsGroup:0];
  }
  uint64_t v7 = [a3 objectForKey:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  [(SUStructuredPage *)self setTitle:v8];
  return 1;
}

- (BOOL)hasDisplayableContent
{
  return [(SUItemList *)self->_itemList numberOfItems] > 0
      || self->_item
      || [(SUStructuredPage *)self didShowDialog]
      || [(SUStorePageProtocol *)self->_protocol copyright] != 0;
}

- (void)setItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  item = self->_item;
  if (item != a3)
  {

    self->_item = (SUItem *)a3;
    id v6 = [(SUItemList *)[(SUStructuredPage *)self itemList] copyItems];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setContainerItem:self->_item];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (id)_copyItemFromDictionary:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"item-metadata"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v4 = [a3 objectForKey:@"album-metadata"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v4 = [a3 objectForKey:@"software-metadata"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v4 = [a3 objectForKey:@"wemix-metadata"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = +[SUItemDataSource sharedDataSource];

  return (id)[v5 newItemWithItemDictionary:v4];
}

- (int64_t)_displayStyleForString:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ([a3 isEqualToString:@"grouped"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"plain"]) {
    return 2;
  }
  return 0;
}

- (void)_parseItemsFromDictionary:(id)a3
{
  uint64_t v5 = [a3 objectForKey:@"items"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_alloc_init(SUItemList);
    [(SUItemList *)v6 setItemsFromPropertyList:v5];
    -[SUItemList setHintText:](v6, "setHintText:", [a3 objectForKey:@"hint-text"]);
    [(SUStructuredPage *)self setItemList:v6];
  }
  else
  {
    [(SUStructuredPage *)self setItemList:0];
  }
  id v7 = [(SUStructuredPage *)self _copyItemFromDictionary:a3];
  [(SUStructuredPage *)self setItem:v7];
}

- (void)_parseProtocolFromDictionary:(id)a3
{
  uint64_t v5 = objc_alloc_init(SUStorePageProtocol);
  [(SUStorePageProtocol *)v5 setValuesFromStorePageDictionary:a3];
  [(SUStructuredPage *)self setProtocol:v5];

  id v6 = (id)[objc_alloc(MEMORY[0x263F7B150]) initWithResponseDictionary:a3];
  self->_didShowDialog = objc_msgSend((id)objc_msgSend(v6, "actionsWithActionType:", *MEMORY[0x263F7BC48]), "count") != 0;
}

- (void)_parseTemplateParametersFromDictionary:(id)a3
{
  uint64_t v4 = (void *)[a3 objectForKey:@"page-type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 objectForKey:@"template-parameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = (void *)v5;
    }
    else {
      id v6 = 0;
    }
    self->_displayStyle = -[SUStructuredPage _displayStyleForString:](self, "_displayStyleForString:", [v6 objectForKey:@"list-display-style"]);
    id v7 = (void *)[v6 objectForKey:@"hide-sign-in-button"];
    if (objc_opt_respondsToSelector()) {
      char v8 = [v7 BOOLValue];
    }
    else {
      char v8 = 0;
    }
    self->_shouldHideSignInButton = v8;
    uint64_t v9 = (void *)[v6 objectForKey:@"wants-index-bar"];
    if (objc_opt_respondsToSelector()) {
      char v10 = [v9 BOOLValue];
    }
    else {
      char v10 = 0;
    }
    self->_wantsIndexBar = v10;
    long long v11 = (void *)[v6 objectForKey:@"artwork-display-style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v12 = (void *)[v11 objectForKey:@"width"];
      char v13 = objc_opt_respondsToSelector();
      double v14 = -1.0;
      if (v13)
      {
        objc_msgSend(v12, "floatValue", -1.0);
        double v14 = v15;
      }
      self->_artworkWidth = v14;
      uint64_t v16 = (void *)[v11 objectForKey:@"fit-width"];
      if (objc_opt_respondsToSelector()) {
        char v17 = [v16 BOOLValue];
      }
      else {
        char v17 = 0;
      }
      self->_artworkShouldFitWidth = v17;
    }
    else
    {
      self->_artworkShouldFitWidth = 0;
      self->_artworkWidth = -1.0;
    }
  }
  else
  {
    self->_artworkShouldFitWidth = 0;
    self->_artworkWidth = -1.0;
    self->_displayStyle = 0;
    self->_wantsIndexBar = 0;
  }
}

- (BOOL)artworkShouldFitWidth
{
  return self->_artworkShouldFitWidth;
}

- (double)artworkWidth
{
  return self->_artworkWidth;
}

- (BOOL)didShowDialog
{
  return self->_didShowDialog;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (SUItem)item
{
  return self->_item;
}

- (SUItemList)itemList
{
  return self->_itemList;
}

- (void)setItemList:(id)a3
{
}

- (SUStorePageProtocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (SUPageSectionGroup)sectionsGroup
{
  return self->_sectionsGroup;
}

- (void)setSectionsGroup:(id)a3
{
}

- (BOOL)shouldHideSignInButton
{
  return self->_shouldHideSignInButton;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)wantsIndexBar
{
  return self->_wantsIndexBar;
}

@end