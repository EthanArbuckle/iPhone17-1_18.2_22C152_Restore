@interface SUUIGiftTheme
- (NSString)themeName;
- (NSURL)headerImageURL;
- (SUUIGiftTheme)initWithThemeDictionary:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)bodyTextColor;
- (UIColor)primaryTextColor;
- (UIImage)headerImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)themeIdentifier;
- (void)setBackgroundColor:(id)a3;
- (void)setBodyTextColor:(id)a3;
- (void)setHeaderImage:(id)a3;
- (void)setHeaderImageURL:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setThemeIdentifier:(int64_t)a3;
- (void)setThemeName:(id)a3;
@end

@implementation SUUIGiftTheme

- (SUUIGiftTheme)initWithThemeDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SUUIGiftTheme;
  v5 = [(SUUIGiftTheme *)&v23 init];
  if (v5)
  {
    v6 = [[SUUIUber alloc] initWithUberDictionary:v4];
    v7 = [(SUUIUber *)v6 colorScheme];
    v8 = [v7 backgroundColor];
    [(SUUIGiftTheme *)v5 setBackgroundColor:v8];

    v9 = [v7 primaryTextColor];
    [(SUUIGiftTheme *)v5 setBodyTextColor:v9];

    v10 = [v7 secondaryTextColor];
    [(SUUIGiftTheme *)v5 setPrimaryTextColor:v10];

    v11 = [v4 objectForKey:@"fcId"];
    if (objc_opt_respondsToSelector()) {
      v5->_themeIdentifier = [v11 longLongValue];
    }
    v12 = [v4 objectForKey:@"localized_name"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      themeName = v5->_themeName;
      v5->_themeName = (NSString *)v13;
    }
    v15 = [(SUUIUber *)v6 artworkProvider];
    if ([v15 hasArtwork])
    {
      v16 = [MEMORY[0x263F82B60] mainScreen];
      [v16 scale];
      double v18 = v17;

      if (v18 == 2.0) {
        [v15 largestArtwork];
      }
      else {
      v19 = [v15 smallestArtwork];
      }
      uint64_t v20 = [v19 URL];
      headerImageURL = v5->_headerImageURL;
      v5->_headerImageURL = (NSURL *)v20;
    }
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SUUIGiftTheme;
  id v4 = [(SUUIGiftTheme *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: [%lld, \"%@\", %@]", v4, self->_themeIdentifier, self->_themeName, self->_headerImageURL];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(UIColor *)self->_backgroundColor copyWithZone:a3];
  objc_super v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(UIColor *)self->_bodyTextColor copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  objc_storeStrong((id *)(v5 + 24), self->_headerImage);
  objc_storeStrong((id *)(v5 + 32), self->_headerImageURL);
  uint64_t v10 = [(UIColor *)self->_primaryTextColor copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  *(void *)(v5 + 48) = self->_themeIdentifier;
  uint64_t v12 = [(NSString *)self->_themeName copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  return (id)v5;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)bodyTextColor
{
  return self->_bodyTextColor;
}

- (void)setBodyTextColor:(id)a3
{
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (void)setHeaderImage:(id)a3
{
}

- (NSURL)headerImageURL
{
  return self->_headerImageURL;
}

- (void)setHeaderImageURL:(id)a3
{
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
}

- (int64_t)themeIdentifier
{
  return self->_themeIdentifier;
}

- (void)setThemeIdentifier:(int64_t)a3
{
  self->_themeIdentifier = a3;
}

- (NSString)themeName
{
  return self->_themeName;
}

- (void)setThemeName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeName, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_headerImageURL, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_bodyTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end