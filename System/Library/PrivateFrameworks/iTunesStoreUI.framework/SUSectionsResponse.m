@interface SUSectionsResponse
+ (id)lastCachedVersionIdentifier;
+ (id)sectionsCacheDirectory;
+ (void)setLastCachedVersionIdentifier:(id)a3;
- (BOOL)_loadArtworkFromCacheDirectory:(id)a3;
- (BOOL)isCacheable;
- (BOOL)shouldResetUserOrdering;
- (BOOL)writeToCacheDirectory:(id)a3 error:(id *)a4;
- (NSArray)allSections;
- (NSArray)sections;
- (NSDictionary)rawResponseDictionary;
- (NSDictionary)sectionsDictionary;
- (NSString)moreListTitle;
- (NSString)storeFrontIdentifier;
- (NSString)versionString;
- (SSItemImageCollection)moreListImageCollection;
- (SUSectionsResponse)init;
- (SUSectionsResponse)initWithClientInterface:(id)a3 cacheDirectory:(id)a4;
- (SUSectionsResponse)initWithClientInterface:(id)a3 sectionsDictionary:(id)a4 responseType:(int64_t)a5;
- (UIImage)moreListImage;
- (UIImage)moreListSelectedImage;
- (id)_newImageForIdentifier:(id)a3 variant:(id)a4 cacheDirectory:(id)a5;
- (id)_newSectionsFromDictionary:(id)a3;
- (id)_newVariantStringForButton:(id)a3;
- (int64_t)responseType;
- (void)_applyDefaultSearchFieldConfigurationsToSections:(id)a3;
- (void)_dropImageKeysFromArray:(id)a3;
- (void)_dropImageKeysFromDictionary:(id)a3;
- (void)_loadButtonArtworkForSection:(id)a3 buttons:(id)a4 cachePath:(id)a5;
- (void)_writeButtonImagesForSection:(id)a3 buttons:(id)a4 cachePath:(id)a5;
- (void)_writeImage:(id)a3 toCachePath:(id)a4 forIdentifier:(id)a5 variant:(id)a6;
- (void)dealloc;
- (void)dropEmbeddedImages;
- (void)setCacheable:(BOOL)a3;
- (void)setMoreListImage:(id)a3;
- (void)setMoreListSelectedImage:(id)a3;
- (void)setShouldResetUserOrdering:(BOOL)a3;
- (void)setStoreFrontIdentifier:(id)a3;
@end

@implementation SUSectionsResponse

- (SUSectionsResponse)init
{
  id v3 = +[SUClientDispatch clientInterface];

  return [(SUSectionsResponse *)self initWithClientInterface:v3 sectionsDictionary:0 responseType:0];
}

- (SUSectionsResponse)initWithClientInterface:(id)a3 cacheDirectory:(id)a4
{
  uint64_t v7 = [a4 stringByAppendingPathComponent:@"Sections.plist"];
  v8 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v9 = [(SUSectionsResponse *)self initWithClientInterface:a3 sectionsDictionary:v8 responseType:0], (self = v9) != 0)&& (![(NSArray *)[(SUSectionsResponse *)v9 allSections] count]|| ![(SUSectionsResponse *)self _loadArtworkFromCacheDirectory:a4]))
  {

    self = 0;
  }

  return self;
}

- (SUSectionsResponse)initWithClientInterface:(id)a3 sectionsDictionary:(id)a4 responseType:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SUSectionsResponse;
  v8 = [(SUSectionsResponse *)&v10 init];
  if (v8)
  {
    v8->_clientInterface = (SUClientInterface *)a3;
    v8->_rawResponseDictionary = (NSMutableDictionary *)[a4 mutableCopy];
    v8->_responseType = a5;
    v8->_sectionsCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUSectionsResponse;
  [(SUSectionsResponse *)&v3 dealloc];
}

+ (id)lastCachedVersionIdentifier
{
  v2 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  return (id)[v2 stringForKey:@"SULastSectionsVersion:7.1"];
}

+ (id)sectionsCacheDirectory
{
  id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier");
  if (result)
  {
    objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", -[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"), result, @"Sections", 0);
    v4 = (void *)[NSString pathWithComponents:v3];

    return v4;
  }
  return result;
}

+ (void)setLastCachedVersionIdentifier:(id)a3
{
  v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  [v4 setObject:a3 forKey:@"SULastSectionsVersion:7.1"];
}

- (NSArray)allSections
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F7B2D0]) initWithDictionary:self->_rawResponseDictionary];
  uint64_t v4 = [v3 dictionaryByRemovingConditions];

  id v5 = [(SUSectionsResponse *)self _newSectionsFromDictionary:v4];

  return (NSArray *)v5;
}

- (void)dropEmbeddedImages
{
}

- (SSItemImageCollection)moreListImageCollection
{
  id v2 = [(NSDictionary *)[(SUSectionsResponse *)self sectionsDictionary] objectForKey:@"more-list-artwork"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F7B1C0]) initWithImageCollection:v2];
  }
  else {
    objc_super v3 = 0;
  }

  return (SSItemImageCollection *)v3;
}

- (NSString)moreListTitle
{
  id v2 = [(NSDictionary *)[(SUSectionsResponse *)self sectionsDictionary] objectForKey:@"more-list-title"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;

  return (NSString *)v3;
}

- (NSArray)sections
{
  id v2 = [(SUSectionsResponse *)self _newSectionsFromDictionary:[(SUSectionsResponse *)self sectionsDictionary]];

  return (NSArray *)v2;
}

- (NSDictionary)sectionsDictionary
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F7B2D0]) initWithDictionary:self->_rawResponseDictionary];
  id v3 = (NSDictionary *)[v2 dictionaryByEvaluatingConditions];

  return v3;
}

- (void)setShouldResetUserOrdering:(BOOL)a3
{
  BOOL v3 = a3;

  self->_shouldResetUserOrdering = (NSNumber *)[objc_alloc(NSNumber) initWithBool:v3];
}

- (void)setStoreFrontIdentifier:(id)a3
{
  if (a3)
  {
    id v5 = (id)[a3 copy];
    [(NSMutableDictionary *)self->_rawResponseDictionary setObject:v5 forKey:@"store-front-id"];
  }
  else
  {
    rawResponseDictionary = self->_rawResponseDictionary;
    [(NSMutableDictionary *)rawResponseDictionary removeObjectForKey:@"store-front-id"];
  }
}

- (BOOL)shouldResetUserOrdering
{
  if (self->_shouldResetUserOrdering)
  {
    shouldResetUserOrdering = self->_shouldResetUserOrdering;
  }
  else
  {
    BOOL v3 = [(NSDictionary *)[(SUSectionsResponse *)self sectionsDictionary] objectForKey:@"reset-user-ordering"];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return 0;
    }
    shouldResetUserOrdering = v3;
  }

  return [(NSNumber *)shouldResetUserOrdering BOOLValue];
}

- (NSString)storeFrontIdentifier
{
  id v2 = (id)[(NSMutableDictionary *)self->_rawResponseDictionary objectForKey:@"store-front-id"];

  return (NSString *)v2;
}

- (NSString)versionString
{
  id v2 = [(NSDictionary *)[(SUSectionsResponse *)self sectionsDictionary] objectForKey:@"version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return (NSString *)[v2 stringValue];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v2;
      return (NSString *)v4;
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)writeToCacheDirectory:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v35 = 0;
  uint64_t v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:self->_rawResponseDictionary format:200 options:0 error:&v35];
  if (v6
    && (uint64_t v7 = (void *)v6,
        uint64_t v8 = [a3 stringByAppendingPathComponent:@"Sections.plist"],
        [v7 writeToFile:v8 options:0 error:&v35]))
  {
    v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v11 &= 2u;
    }
    if (v11)
    {
      uint64_t v12 = objc_opt_class();
      int v37 = 138412546;
      uint64_t v38 = v12;
      __int16 v39 = 2112;
      uint64_t v40 = v8;
      LODWORD(v28) = 22;
      v27 = &v37;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v37, v28);
        free(v14);
        v27 = (int *)v15;
        SSFileLog();
      }
    }
    BOOL v29 = 1;
  }
  else
  {
    BOOL v29 = 0;
  }
  v16 = [(SUSectionsResponse *)self allSections];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v22 = [v21 identifier];
        if (v22)
        {
          uint64_t v23 = v22;
          -[SUSectionsResponse _writeImage:toCachePath:forIdentifier:variant:](self, "_writeImage:toCachePath:forIdentifier:variant:", [v21 image], a3, v22, 0);
          -[SUSectionsResponse _writeImage:toCachePath:forIdentifier:variant:](self, "_writeImage:toCachePath:forIdentifier:variant:", [v21 moreListImage], a3, v23, @"-More");
          -[SUSectionsResponse _writeImage:toCachePath:forIdentifier:variant:](self, "_writeImage:toCachePath:forIdentifier:variant:", [v21 selectedImage], a3, v23, @"-Selected");
          -[SUSectionsResponse _writeImage:toCachePath:forIdentifier:variant:](self, "_writeImage:toCachePath:forIdentifier:variant:", [v21 selectedMoreListImage], a3, v23, @"-MoreSelected");
          -[SUSectionsResponse _writeButtonImagesForSection:buttons:cachePath:](self, "_writeButtonImagesForSection:buttons:cachePath:", v21, [v21 leftSectionButtons], a3);
          -[SUSectionsResponse _writeButtonImagesForSection:buttons:cachePath:](self, "_writeButtonImagesForSection:buttons:cachePath:", v21, [v21 rightSectionButtons], a3);
        }
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v18);
  }
  moreListImage = self->_moreListImage;
  if (moreListImage) {
    [(SUSectionsResponse *)self _writeImage:moreListImage toCachePath:a3 forIdentifier:@"more" variant:0];
  }
  moreListSelectedImage = self->_moreListSelectedImage;
  if (moreListSelectedImage) {
    [(SUSectionsResponse *)self _writeImage:moreListSelectedImage toCachePath:a3 forIdentifier:@"more" variant:@"-Selected"];
  }
  if (a4) {
    *a4 = v35;
  }
  return v29;
}

- (void)_applyDefaultSearchFieldConfigurationsToSections:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = +[SUSearchFieldConfiguration defaultConfigurationWithClientInterface:self->_clientInterface];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        int v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v5 != 1)
        {
          if ([v10 type] != 1) {
            continue;
          }
LABEL_11:
          [v10 setSearchFieldConfiguration:v4];
          continue;
        }
        if ([v10 url] || objc_msgSend(v10, "urlBagKey")) {
          goto LABEL_11;
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_dropImageKeysFromArray:(id)a3
{
  uint64_t v5 = [a3 count];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = (void *)[a3 objectAtIndex:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[v8 mutableCopy];
        [(SUSectionsResponse *)self _dropImageKeysFromArray:v9];
        goto LABEL_7;
      }
LABEL_8:
      if (v6 == ++v7) {
        return;
      }
    }
    v9 = (void *)[v8 mutableCopy];
    [(SUSectionsResponse *)self _dropImageKeysFromDictionary:v9];
LABEL_7:
    [a3 replaceObjectAtIndex:v7 withObject:v9];

    goto LABEL_8;
  }
}

- (void)_dropImageKeysFromDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [a3 removeObjectForKey:@"artwork-urls"];
  [a3 removeObjectForKey:@"more-list-artwork"];
  [a3 removeObjectForKey:@"image-url"];
  [a3 removeObjectForKey:@"image-url@2x"];
  uint64_t v5 = (void *)[a3 allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = (void *)[a3 objectForKey:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v12 = (void *)[v11 mutableCopy];
          [(SUSectionsResponse *)self _dropImageKeysFromDictionary:v12];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          long long v12 = (void *)[v11 mutableCopy];
          [(SUSectionsResponse *)self _dropImageKeysFromArray:v12];
        }
        [a3 setObject:v12 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (BOOL)_loadArtworkFromCacheDirectory:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = [(SUSectionsResponse *)self allSections];
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    char v24 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v10 = (id)objc_msgSend(v9, "identifier", v22, v23);
        if (v10)
        {
          id v11 = [(SUSectionsResponse *)self _newImageForIdentifier:v10 variant:&stru_26DB8C5F8 cacheDirectory:a3];
          id v12 = [(SUSectionsResponse *)self _newImageForIdentifier:v10 variant:@"-More" cacheDirectory:a3];
          id v13 = [(SUSectionsResponse *)self _newImageForIdentifier:v10 variant:@"-Selected" cacheDirectory:a3];
          id v10 = [(SUSectionsResponse *)self _newImageForIdentifier:v10 variant:@"-MoreSelected" cacheDirectory:a3];
          -[SUSectionsResponse _loadButtonArtworkForSection:buttons:cachePath:](self, "_loadButtonArtworkForSection:buttons:cachePath:", v9, [v9 leftSectionButtons], a3);
          -[SUSectionsResponse _loadButtonArtworkForSection:buttons:cachePath:](self, "_loadButtonArtworkForSection:buttons:cachePath:", v9, [v9 rightSectionButtons], a3);
        }
        else
        {
          id v12 = 0;
          id v13 = 0;
          id v11 = 0;
        }
        [v9 setMoreListImage:v12];
        [v9 setSelectedImage:v13];
        [v9 setSelectedMoreListImage:v10];

        if (v11)
        {
          [v9 setImage:v11];
        }
        else
        {
          long long v14 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
          int v15 = [v14 shouldLog];
          if ([v14 shouldLogToDisk]) {
            int v16 = v15 | 2;
          }
          else {
            int v16 = v15;
          }
          if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
            v16 &= 2u;
          }
          if (v16)
          {
            uint64_t v17 = objc_opt_class();
            int v30 = 138412546;
            uint64_t v31 = v17;
            __int16 v32 = 2112;
            long long v33 = v9;
            LODWORD(v23) = 22;
            uint64_t v22 = &v30;
            uint64_t v18 = _os_log_send_and_compose_impl();
            if (v18)
            {
              uint64_t v19 = (void *)v18;
              uint64_t v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v30, v23);
              free(v19);
              uint64_t v22 = (int *)v20;
              SSFileLog();
            }
          }
          char v24 = 0;
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v6);
  }
  else
  {
    char v24 = 1;
  }
  self->_moreListImage = (UIImage *)[(SUSectionsResponse *)self _newImageForIdentifier:@"more", &stru_26DB8C5F8, a3, v22 variant cacheDirectory];
  self->_moreListSelectedImage = (UIImage *)[(SUSectionsResponse *)self _newImageForIdentifier:@"more" variant:@"-Selected" cacheDirectory:a3];
  return v24 & 1;
}

- (void)_loadButtonArtworkForSection:(id)a3 buttons:(id)a4 cachePath:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v9 = [a3 identifier];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a4;
  uint64_t v10 = [a4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v15 = [(SUSectionsResponse *)self _newVariantStringForButton:v14];
        id v16 = [(SUSectionsResponse *)self _newImageForIdentifier:v9 variant:v15 cacheDirectory:a5];
        objc_msgSend(a3, "setSectionButtonImage:forTag:", v16, objc_msgSend(v14, "tag"));
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (id)_newImageForIdentifier:(id)a3 variant:(id)a4 cacheDirectory:(id)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
  if (v8 != 2.0
    || (v9 = [(id)objc_msgSend(a3 stringByAppendingFormat:@"%@@2x", a4), "stringByAppendingPathExtension:", @"png"], (id result = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C6B0]), "initWithContentsOfFile:", objc_msgSend(a5, "stringByAppendingPathComponent:", v9))) == 0))
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "stringByAppendingString:", a4), "stringByAppendingPathExtension:", @"png");
    id v12 = objc_alloc(MEMORY[0x263F1C6B0]);
    uint64_t v13 = [a5 stringByAppendingPathComponent:v11];
    return (id)[v12 initWithContentsOfFile:v13];
  }
  return result;
}

- (id)_newSectionsFromDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [a3 objectForKey:@"search-field"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v21 = [[SUSearchFieldConfiguration alloc] initWithDictionary:v6 clientInterface:self->_clientInterface];
  }
  else {
    long long v21 = 0;
  }
  uint64_t v7 = (void *)[a3 objectForKey:@"tabs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = (void *)[v7 objectForKey:@"tabs"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v8) {
      goto LABEL_22;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    char v11 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v14 = [[SUSection alloc] initWithClientInterface:self->_clientInterface];
          if ([(SUSection *)v14 loadFromDictionary:v13 searchField:v21])
          {
            id v15 = v5;
            id v16 = (SUSection *)[(NSMutableDictionary *)self->_sectionsCache objectForKey:[(SUSection *)v14 identifier]];
            if (v16)
            {
              uint64_t v17 = v16;
              [(SUSection *)v16 loadFromDictionary:v13 searchField:v21];
              long long v18 = v15;
              long long v19 = v17;
              id v5 = v15;
            }
            else
            {
              [(NSMutableDictionary *)self->_sectionsCache setObject:v14 forKey:[(SUSection *)v14 identifier]];
              long long v18 = v5;
              long long v19 = v14;
            }
            [v18 addObject:v19];
            v11 &= objc_msgSend((id)objc_msgSend(v5, "lastObject"), "searchFieldConfiguration") == 0;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
    if (v11) {
LABEL_22:
    }
      [(SUSectionsResponse *)self _applyDefaultSearchFieldConfigurationsToSections:v5];
  }

  return v5;
}

- (id)_newVariantStringForButton:(id)a3
{
  return (id)objc_msgSend([NSString alloc], "initWithFormat:", @"-button-%ld", objc_msgSend(a3, "tag"));
}

- (void)_writeButtonImagesForSection:(id)a3 buttons:(id)a4 cachePath:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v9 = [a3 identifier];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [a4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(a4);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(a3, "imageForSectionButtonWithTag:", objc_msgSend(v14, "tag"));
        if (v15)
        {
          uint64_t v16 = v15;
          id v17 = [(SUSectionsResponse *)self _newVariantStringForButton:v14];
          [(SUSectionsResponse *)self _writeImage:v16 toCachePath:a5 forIdentifier:v9 variant:v17];
        }
      }
      uint64_t v11 = [a4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)_writeImage:(id)a3 toCachePath:(id)a4 forIdentifier:(id)a5 variant:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v6 = a5;
    if (a6) {
      id v6 = (id)[a5 stringByAppendingString:a6];
    }
    [a3 scale];
    if (v9 == 2.0) {
      id v6 = (id)[v6 stringByAppendingString:@"@2x"];
    }
    uint64_t v10 = objc_msgSend(a4, "stringByAppendingPathComponent:", objc_msgSend(v6, "stringByAppendingPathExtension:", @"png"));
    if ([(NSData *)UIImagePNGRepresentation((UIImage *)a3) writeToFile:v10 options:0 error:0])
    {
      uint64_t v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v13 &= 2u;
      }
      if (v13)
      {
        int v17 = 138412546;
        uint64_t v18 = objc_opt_class();
        __int16 v19 = 2112;
        uint64_t v20 = v10;
        LODWORD(v16) = 22;
        uint64_t v14 = _os_log_send_and_compose_impl();
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v17, v16);
          free(v15);
          SSFileLog();
        }
      }
    }
  }
}

- (BOOL)isCacheable
{
  return self->_cacheable;
}

- (void)setCacheable:(BOOL)a3
{
  self->_cacheable = a3;
}

- (UIImage)moreListImage
{
  return self->_moreListImage;
}

- (void)setMoreListImage:(id)a3
{
}

- (UIImage)moreListSelectedImage
{
  return self->_moreListSelectedImage;
}

- (void)setMoreListSelectedImage:(id)a3
{
}

- (NSDictionary)rawResponseDictionary
{
  return &self->_rawResponseDictionary->super;
}

- (int64_t)responseType
{
  return self->_responseType;
}

@end