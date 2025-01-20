@interface SUScriptMediaPlayerItem
+ (id)webScriptNameForKey:(const char *)a3;
- (NSNumber)itemIdentifier;
- (NSNumber)playableDuration;
- (NSString)URL;
- (NSString)backgroundImageURL;
- (NSString)bookmarkIdentifier;
- (NSString)initialOrientation;
- (NSString)itemType;
- (NSString)subtitle;
- (NSString)title;
- (SUScriptMediaPlayerItem)initWithDictionary:(id)a3;
- (id)_className;
- (id)copyNativeMediaPlayerItem;
- (id)scriptAttributeKeys;
- (void)dealloc;
- (void)setBackgroundImageURL:(id)a3;
- (void)setBookmarkIdentifier:(id)a3;
- (void)setInitialOrientation:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemType:(id)a3;
- (void)setPlayableDuration:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation SUScriptMediaPlayerItem

- (SUScriptMediaPlayerItem)initWithDictionary:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SUScriptMediaPlayerItem;
  v4 = [(SUScriptObject *)&v15 init];
  if (v4)
  {
    v4->_mediaItem = objc_alloc_init(SUMediaPlayerItem);
    uint64_t v5 = [a3 objectForKey:@"backgroundImageURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUMediaPlayerItem setBackgroundImageURL:](v4->_mediaItem, "setBackgroundImageURL:", [NSURL URLWithString:v5]);
    }
    uint64_t v6 = [a3 objectForKey:@"bookmarkIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUMediaPlayerItem *)v4->_mediaItem setBookmarkIdentifier:v6];
    }
    uint64_t v7 = [a3 objectForKey:@"itemType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUMediaPlayerItem setItemType:](v4->_mediaItem, "setItemType:", objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "itemTypeForTypeString:", v7));
    }
    v8 = (void *)[a3 objectForKey:@"playableDuration"];
    if (objc_opt_respondsToSelector())
    {
      mediaItem = v4->_mediaItem;
      [v8 doubleValue];
      [(SUMediaPlayerItem *)mediaItem setPlayableDuration:v10 / 1000.0];
    }
    uint64_t v11 = [a3 objectForKey:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUMediaPlayerItem *)v4->_mediaItem setSubtitle:v11];
    }
    uint64_t v12 = [a3 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUMediaPlayerItem *)v4->_mediaItem setTitle:v12];
    }
    uint64_t v13 = [a3 objectForKey:@"URL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUMediaPlayerItem setURL:](v4->_mediaItem, "setURL:", [NSURL URLWithString:v13]);
    }
    [a3 objectForKey:@"itemIdentifier"];
    [(SUMediaPlayerItem *)v4->_mediaItem setItemIdentifier:SSGetUnsignedLongLongFromValue()];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaPlayerItem;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)copyNativeMediaPlayerItem
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (void *)[(SUMediaPlayerItem *)self->_mediaItem copy];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)backgroundImageURL
{
  [(SUScriptObject *)self lock];
  objc_super v3 = [(NSURL *)[(SUMediaPlayerItem *)self->_mediaItem backgroundImageURL] absoluteString];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)bookmarkIdentifier
{
  [(SUScriptObject *)self lock];
  objc_super v3 = [(SUMediaPlayerItem *)self->_mediaItem bookmarkIdentifier];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)_className
{
  return @"iTunesMediaPlayerItem";
}

- (NSString)initialOrientation
{
  [(SUScriptObject *)self lock];
  objc_super v3 = SUOrientationStringForDeviceOrientation([(SUMediaPlayerItem *)self->_mediaItem initialOrientation]);
  [(SUScriptObject *)self unlock];
  return &v3->isa;
}

- (NSNumber)itemIdentifier
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (NSNumber *)objc_msgSend(NSNumber, "numberWithItemIdentifier:", -[SUMediaPlayerItem itemIdentifier](self->_mediaItem, "itemIdentifier"));
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)itemType
{
  [(SUScriptObject *)self lock];
  objc_super v3 = (NSString *)objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "typeStringForItemType:", -[SUMediaPlayerItem itemType](self->_mediaItem, "itemType"));
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSNumber)playableDuration
{
  [(SUScriptObject *)self lock];
  objc_super v3 = NSNumber;
  [(SUMediaPlayerItem *)self->_mediaItem playableDuration];
  uint64_t v5 = (NSNumber *)[v3 numberWithDouble:v4 * 1000.0];
  [(SUScriptObject *)self unlock];
  return v5;
}

- (void)setBackgroundImageURL:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    -[SUMediaPlayerItem setBackgroundImageURL:](self->_mediaItem, "setBackgroundImageURL:", [NSURL URLWithString:v5]);
    [(SUScriptObject *)self unlock];
    return;
  }
  uint64_t v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setBookmarkIdentifier:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    [(SUMediaPlayerItem *)self->_mediaItem setBookmarkIdentifier:v5];
    [(SUScriptObject *)self unlock];
    return;
  }
  uint64_t v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setInitialOrientation:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    if (SUOrientationStringIsValid(v5))
    {
      [(SUScriptObject *)self lock];
      [(SUMediaPlayerItem *)self->_mediaItem setInitialOrientation:SUInterfaceOrientationForString(v5)];
      [(SUScriptObject *)self unlock];
    }
    return;
  }
  uint64_t v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setItemIdentifier:(id)a3
{
  uint64_t v5 = SSGetUnsignedLongLongFromValue();
  if (a3)
  {
    uint64_t v6 = v5;
    [(SUScriptObject *)self lock];
    [(SUMediaPlayerItem *)self->_mediaItem setItemIdentifier:v6];
    [(SUScriptObject *)self unlock];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F1FA90];
    [v7 throwException:@"Invalid argument"];
  }
}

- (void)setItemType:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    -[SUMediaPlayerItem setItemType:](self->_mediaItem, "setItemType:", objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "itemTypeForTypeString:", v5));
    [(SUScriptObject *)self unlock];
    return;
  }
  uint64_t v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setPlayableDuration:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(SUScriptObject *)self lock];
    mediaItem = self->_mediaItem;
    [a3 doubleValue];
    [(SUMediaPlayerItem *)mediaItem setPlayableDuration:v6 / 1000.0];
    [(SUScriptObject *)self unlock];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F1FA90];
    [v7 throwException:@"Invalid argument"];
  }
}

- (void)setSubtitle:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    [(SUMediaPlayerItem *)self->_mediaItem setSubtitle:v5];
    [(SUScriptObject *)self unlock];
    return;
  }
  uint64_t v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setTitle:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    [(SUMediaPlayerItem *)self->_mediaItem setTitle:v5];
    [(SUScriptObject *)self unlock];
    return;
  }
  uint64_t v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setURL:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    -[SUMediaPlayerItem setURL:](self->_mediaItem, "setURL:", [NSURL URLWithString:v5]);
    [(SUScriptObject *)self unlock];
    return;
  }
  uint64_t v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (NSString)subtitle
{
  [(SUScriptObject *)self lock];
  objc_super v3 = [(SUMediaPlayerItem *)self->_mediaItem subtitle];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)title
{
  [(SUScriptObject *)self lock];
  objc_super v3 = [(SUMediaPlayerItem *)self->_mediaItem title];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)URL
{
  [(SUScriptObject *)self lock];
  objc_super v3 = [(NSURL *)[(SUMediaPlayerItem *)self->_mediaItem URL] absoluteString];
  [(SUScriptObject *)self unlock];
  return v3;
}

+ (id)webScriptNameForKey:(const char *)a3
{
  id result = (id)SUWebScriptNameForKey((char *)a3, (uint64_t)&__KeyMapping_0, 9);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaPlayerItem;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKey_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaPlayerItem;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  SUWebScriptAddPropertyKeysToArray((uint64_t)v2, (uint64_t)&__KeyMapping_0, 9);
  return v2;
}

@end