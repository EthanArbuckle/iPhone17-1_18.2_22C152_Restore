@interface SUSection
- (BOOL)isDefaultSection;
- (BOOL)isTransient;
- (BOOL)isUsingLocalArtwork;
- (BOOL)loadFromDictionary:(id)a3 searchField:(id)a4;
- (NSArray)itemImages;
- (NSArray)leftSectionButtons;
- (NSArray)rightSectionButtons;
- (NSString)identifier;
- (NSString)partnerHeader;
- (NSString)title;
- (NSString)urlBagKey;
- (NSURL)url;
- (SUGradient)backgroundGradient;
- (SUPageSectionGroup)pageSectionGroup;
- (SUSearchFieldConfiguration)searchFieldConfiguration;
- (SUSection)initWithClientInterface:(id)a3;
- (SUSection)initWithClientInterface:(id)a3 sectionType:(int64_t)a4 defaultPNGStyle:(int64_t)a5;
- (UIColor)loadingIndicatorColor;
- (UIColor)loadingTextColor;
- (UIColor)loadingTextShadowColor;
- (UIImage)image;
- (UIImage)moreListImage;
- (UIImage)selectedImage;
- (UIImage)selectedMoreListImage;
- (id)_colorForKey:(id)a3;
- (id)_imageBaseName;
- (id)_sectionButtonsForKey:(id)a3;
- (id)description;
- (id)imageForSectionButtonWithTag:(int64_t)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)_minimumNetworkTypeFromDictionary:(id)a3;
- (int64_t)_typeForString:(id)a3;
- (int64_t)defaultPNGStyle;
- (int64_t)minimumNetworkType;
- (int64_t)type;
- (void)dealloc;
- (void)setImage:(id)a3;
- (void)setMoreListImage:(id)a3;
- (void)setSearchFieldConfiguration:(id)a3;
- (void)setSectionButtonImage:(id)a3 forTag:(int64_t)a4;
- (void)setSelectedImage:(id)a3;
- (void)setSelectedMoreListImage:(id)a3;
@end

@implementation SUSection

- (void)setSelectedImage:(id)a3
{
}

- (void)setImage:(id)a3
{
}

- (SUSection)initWithClientInterface:(id)a3 sectionType:(int64_t)a4 defaultPNGStyle:(int64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)SUSection;
  v8 = [(SUSection *)&v13 init];
  if (!v8) {
    return v8;
  }
  v8->_clientInterface = (SUClientInterface *)a3;
  dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8->_dictionary = dictionary;
  if (a5)
  {
    if (a5 != 1) {
      goto LABEL_7;
    }
    [(NSMutableDictionary *)dictionary setObject:&unk_26DBD7BC0 forKey:@"background-gradient"];
    [(NSMutableDictionary *)v8->_dictionary setObject:@"dark" forKey:@"default-png-style"];
    [(NSMutableDictionary *)v8->_dictionary setObject:@"white" forKey:@"loading-indicator-color"];
    dictionary = v8->_dictionary;
    v10 = @"loading-text-color";
    v11 = @"white";
  }
  else
  {
    v11 = (__CFString *)&unk_26DBD7BE8;
    v10 = @"background-gradient";
  }
  [(NSMutableDictionary *)dictionary setObject:v11 forKey:v10];
LABEL_7:
  if ((unint64_t)(a4 - 1) <= 5) {
    [(NSMutableDictionary *)v8->_dictionary setObject:off_2648126D0[a4 - 1] forKey:@"canonical-name"];
  }
  return v8;
}

- (int64_t)defaultPNGStyle
{
  v2 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"default-png-style"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return [v2 isEqualToString:@"dark"];
  }
  else {
    return 0;
  }
}

- (void)setSearchFieldConfiguration:(id)a3
{
}

- (SUSection)initWithClientInterface:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUSection;
  v4 = [(SUSection *)&v6 init];
  if (v4) {
    v4->_clientInterface = (SUClientInterface *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUSection;
  [(SUSection *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = [(SUSection *)self urlBagKey];
  v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SUSection;
  id v5 = [(SUSection *)&v8 description];
  objc_super v6 = [(SUSection *)self identifier];
  if (!v3) {
    objc_super v3 = [(SUSection *)self url];
  }
  return (id)[v4 stringWithFormat:@"%@: %@: %@", v5, v6, v3];
}

- (SUGradient)backgroundGradient
{
  uint64_t v2 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"background-gradient"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v3 = [[SUGradient alloc] initWithPropertyList:v2];
  }
  else {
    objc_super v3 = 0;
  }

  return v3;
}

- (NSString)identifier
{
  return (NSString *)[(SUSection *)self valueForProperty:@"canonical-name"];
}

- (UIImage)image
{
  image = self->_image;
  id v3 = [(SUSection *)self _imageBaseName];
  if (image) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (v4) {
    return image;
  }
  objc_super v6 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v7 = [NSString stringWithFormat:@"%@.png", v3];

  return (UIImage *)[v6 imageNamed:v7];
}

- (id)imageForSectionButtonWithTag:(int64_t)a3
{
  BOOL v4 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  id v5 = (id)[(NSMutableDictionary *)self->_sectionButtonImages objectForKey:v4];

  return v5;
}

- (BOOL)isDefaultSection
{
  uint64_t v2 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"active-tab"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v2 BOOLValue];
}

- (BOOL)isTransient
{
  return [(SUSection *)self partnerHeader] != 0;
}

- (BOOL)isUsingLocalArtwork
{
  return [(SUSection *)self _imageBaseName] != 0;
}

- (NSArray)itemImages
{
  uint64_t v2 = objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "newItemWithItemDictionary:", self->_dictionary);
  id v3 = (NSArray *)(id)objc_msgSend((id)objc_msgSend(v2, "itemImageCollection"), "itemImages");

  return v3;
}

- (NSArray)leftSectionButtons
{
  return (NSArray *)[(SUSection *)self _sectionButtonsForKey:@"left-navigation-items"];
}

- (BOOL)loadFromDictionary:(id)a3 searchField:(id)a4
{
  uint64_t v7 = self->_dictionary;

  self->_dictionary = (NSMutableDictionary *)[a3 mutableCopy];
  if ([(SUSection *)self identifier]
    && ([(SUSection *)self title] || [(SUSection *)self urlBagKey] || [(SUSection *)self url]))
  {
    uint64_t v8 = [a3 objectForKey:@"search-field"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (SUSearchFieldConfiguration *)[a4 copy];
      if (v9)
      {
        v10 = v9;
        [(SUSearchFieldConfiguration *)v9 loadFromDictionary:v8];
      }
      else
      {
        v10 = [[SUSearchFieldConfiguration alloc] initWithDictionary:v8 clientInterface:self->_clientInterface];
      }
      [(SUSection *)self setSearchFieldConfiguration:v10];
    }
    else
    {
      [(SUSection *)self setSearchFieldConfiguration:a4];
    }
    BOOL v11 = 1;
  }
  else
  {

    BOOL v11 = 0;
    self->_dictionary = v7;
  }

  return v11;
}

- (UIColor)loadingIndicatorColor
{
  return (UIColor *)[(SUSection *)self _colorForKey:@"loading-indicator-color"];
}

- (UIColor)loadingTextColor
{
  return (UIColor *)[(SUSection *)self _colorForKey:@"loading-text-color"];
}

- (UIColor)loadingTextShadowColor
{
  return (UIColor *)[(SUSection *)self _colorForKey:@"loading-text-shadow-color"];
}

- (int64_t)minimumNetworkType
{
  uint64_t v3 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"allowed-connection-types"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(SUSection *)self _minimumNetworkTypeFromDictionary:v3];
}

- (UIImage)moreListImage
{
  moreListImage = self->_moreListImage;
  id v3 = [(SUSection *)self _imageBaseName];
  if (moreListImage) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (v4) {
    return moreListImage;
  }
  objc_super v6 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v7 = [NSString stringWithFormat:@"MoreList%@.png", v3];

  return (UIImage *)[v6 imageNamed:v7];
}

- (SUPageSectionGroup)pageSectionGroup
{
  uint64_t v2 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"tabs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = [[SUPageSectionGroup alloc] initWithSectionsDictionary:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (NSString)partnerHeader
{
  return (NSString *)[(SUSection *)self valueForProperty:@"partner-header"];
}

- (NSArray)rightSectionButtons
{
  return (NSArray *)[(SUSection *)self _sectionButtonsForKey:@"right-navigation-items"];
}

- (UIImage)selectedImage
{
  selectedImage = self->_selectedImage;
  id v3 = [(SUSection *)self _imageBaseName];
  if (selectedImage) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (v4) {
    return selectedImage;
  }
  objc_super v6 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v7 = [NSString stringWithFormat:@"%@Selected.png", v3];

  return (UIImage *)[v6 imageNamed:v7];
}

- (UIImage)selectedMoreListImage
{
  selectedMoreListImage = self->_selectedMoreListImage;
  id v3 = [(SUSection *)self _imageBaseName];
  if (selectedMoreListImage) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (v4) {
    return selectedMoreListImage;
  }
  objc_super v6 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v7 = [NSString stringWithFormat:@"MoreList%@Selected.png", v3];

  return (UIImage *)[v6 imageNamed:v7];
}

- (void)setSectionButtonImage:(id)a3 forTag:(int64_t)a4
{
  uint64_t v6 = [objc_alloc(NSNumber) initWithInteger:a4];
  sectionButtonImages = self->_sectionButtonImages;
  id v8 = (id)v6;
  if (a3)
  {
    if (!sectionButtonImages)
    {
      sectionButtonImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_sectionButtonImages = sectionButtonImages;
    }
    [(NSMutableDictionary *)sectionButtonImages setObject:a3 forKey:v8];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](sectionButtonImages, "removeObjectForKey:");
  }
}

- (NSString)title
{
  id v3 = [(SUSection *)self valueForProperty:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  id v5 = (void *)[MEMORY[0x263F086E0] mainBundle];
  uint64_t v6 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"_title"];

  return (NSString *)[v5 localizedStringForKey:v6 value:&stru_26DB8C5F8 table:0];
}

- (int64_t)type
{
  uint64_t v3 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"canonical-name"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(SUSection *)self _typeForString:v3];
}

- (NSURL)url
{
  uint64_t v2 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"url"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v3 = NSURL;

  return (NSURL *)[v3 URLWithString:v2];
}

- (NSString)urlBagKey
{
  return (NSString *)[(SUSection *)self valueForProperty:@"url-bag-key"];
}

- (id)valueForProperty:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];

  return v3;
}

- (id)_colorForKey:(id)a3
{
  id v3 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  CGColorRef v4 = SUCreateColorFromStyleString(v3);
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  uint64_t v6 = (void *)[MEMORY[0x263F1C550] colorWithCGColor:v4];
  CGColorRelease(v5);
  return v6;
}

- (id)_imageBaseName
{
  return (id)[(NSMutableDictionary *)self->_dictionary objectForKey:@"_iconBase"];
}

- (int64_t)_minimumNetworkTypeFromDictionary:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 1000;
  SSNetworkTypeApplyBlock();
  int64_t v3 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __47__SUSection__minimumNetworkTypeFromDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = SSGetStringForNetworkType();
  if (result)
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) objectForKey:result];
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t result = [v5 BOOLValue];
      if (result)
      {
        uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v7 = *(void *)(v6 + 24);
        if (v7 >= a2) {
          uint64_t v7 = a2;
        }
        *(void *)(v6 + 24) = v7;
      }
    }
  }
  return result;
}

- (id)_sectionButtonsForKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = [[SUSectionButton alloc] initWithSectionButtonDictionary:v11];
            objc_super v13 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[SUSectionButton tag](v12, "tag"));
            [(SUSectionButton *)v12 setImage:[(NSMutableDictionary *)self->_sectionButtonImages objectForKey:v13]];
            [v5 addObject:v12];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (int64_t)_typeForString:(id)a3
{
  if ([a3 isEqualToString:@"downloads"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"search"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"updates"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"podcasts"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"iTunesU"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"purchases"]) {
    return 6;
  }
  return 0;
}

- (void)setMoreListImage:(id)a3
{
}

- (SUSearchFieldConfiguration)searchFieldConfiguration
{
  return self->_searchFieldConfiguration;
}

- (void)setSelectedMoreListImage:(id)a3
{
}

@end