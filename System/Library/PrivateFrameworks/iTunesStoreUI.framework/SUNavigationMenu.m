@interface SUNavigationMenu
- (NSArray)menuItems;
- (NSArray)navigationButtons;
- (NSString)cancelTitle;
- (NSString)closedTitle;
- (NSString)openTitle;
- (SUNavigationMenu)init;
- (SUNavigationMenu)initWithDictionary:(id)a3;
- (id)_newMenuItemsFromArray:(id)a3;
- (id)_newNavigationButtonsFromArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)navigationButtonForLocation:(id)a3;
- (int64_t)_locationForString:(id)a3;
- (int64_t)initialSelectedIndex;
- (int64_t)location;
- (void)_loadFromDictionary:(id)a3;
- (void)dealloc;
- (void)setLocation:(int64_t)a3;
@end

@implementation SUNavigationMenu

- (SUNavigationMenu)init
{
  return [(SUNavigationMenu *)self initWithDictionary:0];
}

- (SUNavigationMenu)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationMenu;
  v4 = [(SUNavigationMenu *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_initialSelectedIndex = -1;
    [(SUNavigationMenu *)v4 _loadFromDictionary:a3];
    if (![(NSArray *)v5->_menuItems count]
      || ![(NSString *)v5->_closedTitle length] && ![(NSString *)v5->_openTitle length])
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUNavigationMenu;
  [(SUNavigationMenu *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [(NSString *)self->_cancelTitle copyWithZone:a3];
  v5[2] = [(NSString *)self->_closedTitle copyWithZone:a3];
  v5[3] = self->_initialSelectedIndex;
  v5[4] = self->_location;
  v5[5] = [(NSArray *)self->_menuItems copyWithZone:a3];
  v5[6] = [(NSArray *)self->_navigationButtons copyWithZone:a3];
  v5[7] = [(NSString *)self->_openTitle copyWithZone:a3];
  return v5;
}

- (id)navigationButtonForLocation:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  navigationButtons = self->_navigationButtons;
  uint64_t v5 = [(NSArray *)navigationButtons countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(navigationButtons);
      }
      v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if (objc_msgSend((id)objc_msgSend(v9, "buttonLocation"), "isEqualToString:", a3)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSArray *)navigationButtons countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  return v9;
}

- (void)_loadFromDictionary:(id)a3
{
  uint64_t v5 = (void *)[a3 objectForKey:@"cancel-text"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_cancelTitle = (NSString *)v5;
  }
  uint64_t v6 = (void *)[a3 objectForKey:@"button-title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_closedTitle = (NSString *)v6;
  }
  uint64_t v7 = (void *)[a3 objectForKey:@"selected-index"];
  if (objc_opt_respondsToSelector()) {
    int64_t v8 = (int)[v7 intValue];
  }
  else {
    int64_t v8 = -1;
  }
  self->_initialSelectedIndex = v8;
  uint64_t v9 = [a3 objectForKey:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self->_location = [(SUNavigationMenu *)self _locationForString:v9];
  }
  uint64_t v10 = [a3 objectForKey:@"items"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_menuItems = (NSArray *)[(SUNavigationMenu *)self _newMenuItemsFromArray:v10];
  }
  uint64_t v11 = [a3 objectForKey:@"navigation-buttons"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_navigationButtons = (NSArray *)[(SUNavigationMenu *)self _newNavigationButtonsFromArray:v11];
  }
  long long v12 = (void *)[a3 objectForKey:@"nav-controller-title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_openTitle = (NSString *)v12;
  }
}

- (int64_t)_locationForString:(id)a3
{
  return [a3 isEqualToString:@"right"];
}

- (id)_newMenuItemsFromArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = [[SUNavigationMenuItem alloc] initWithDictionary:*(void *)(*((void *)&v13 + 1) + 8 * v8)];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = [(SUNavigationMenuItem *)v9 contentRating];
          if (![(SUItemContentRating *)v11 isRestricted]
            || ![(SUItemContentRating *)v11 shouldHideWhenRestricted])
          {
            [v4 addObject:v10];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  if (![v4 count])
  {

    return 0;
  }
  return v4;
}

- (id)_newNavigationButtonsFromArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [[SUProtocolButton alloc] initWithButtonDictionary:v9];
          if (v10)
          {
            uint64_t v11 = v10;
            [v4 addObject:v10];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  return v4;
}

- (NSString)cancelTitle
{
  return self->_cancelTitle;
}

- (NSString)closedTitle
{
  return self->_closedTitle;
}

- (int64_t)initialSelectedIndex
{
  return self->_initialSelectedIndex;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (NSArray)navigationButtons
{
  return self->_navigationButtons;
}

- (NSString)openTitle
{
  return self->_openTitle;
}

@end