@interface _SFFaviconProvider
+ (UIImage)bookmarksFavicon;
+ (UIImage)fallbackFavicon;
+ (UIImage)favoritesFavicon;
+ (UIImage)historyFavicon;
+ (UIImage)readingListFavicon;
+ (UIImage)sharedWithYouFavicon;
+ (id)_faviconWithSystemImageNamed:(id)a3;
- (_SFFaviconProvider)initWithPersistenceBaseURL:(id)a3 persistenceName:(id)a4 preferredIconSize:(CGSize)a5 atScale:(double)a6 allScales:(id)a7 isReadOnly:(BOOL)a8 shouldCheckIntegrityWhenOpeningDatabaseBlock:(id)a9;
- (id)fallbackIconForRequest:(id)a3;
@end

@implementation _SFFaviconProvider

- (_SFFaviconProvider)initWithPersistenceBaseURL:(id)a3 persistenceName:(id)a4 preferredIconSize:(CGSize)a5 atScale:(double)a6 allScales:(id)a7 isReadOnly:(BOOL)a8 shouldCheckIntegrityWhenOpeningDatabaseBlock:(id)a9
{
  v14.receiver = self;
  v14.super_class = (Class)_SFFaviconProvider;
  v9 = -[WBSFaviconProvider initWithPersistenceBaseURL:persistenceName:preferredIconSize:atScale:allScales:isReadOnly:shouldCheckIntegrityWhenOpeningDatabaseBlock:](&v14, sel_initWithPersistenceBaseURL_persistenceName_preferredIconSize_atScale_allScales_isReadOnly_shouldCheckIntegrityWhenOpeningDatabaseBlock_, a3, a4, a7, a8, a9, a5.width, a5.height, a6);
  if (v9)
  {
    v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    monogramTitleToImageCache = v9->_monogramTitleToImageCache;
    v9->_monogramTitleToImageCache = v10;

    v12 = v9;
  }

  return v9;
}

+ (UIImage)favoritesFavicon
{
  return (UIImage *)[a1 _faviconWithSystemImageNamed:@"star.fill"];
}

+ (UIImage)fallbackFavicon
{
  return (UIImage *)[a1 _faviconWithSystemImageNamed:@"globe"];
}

+ (id)_faviconWithSystemImageNamed:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  id v5 = a3;
  v6 = [v3 configurationWithTextStyle:v4 scale:1];
  v7 = [MEMORY[0x1E4FB1818] _systemImageNamed:v5 withConfiguration:v6];

  return v7;
}

+ (UIImage)bookmarksFavicon
{
  return (UIImage *)[a1 _faviconWithSystemImageNamed:@"book.fill"];
}

+ (UIImage)historyFavicon
{
  return (UIImage *)[a1 _faviconWithSystemImageNamed:@"clock.fill"];
}

+ (UIImage)readingListFavicon
{
  return (UIImage *)[a1 _faviconWithSystemImageNamed:@"eyeglasses"];
}

+ (UIImage)sharedWithYouFavicon
{
  return (UIImage *)[a1 _faviconWithSystemImageNamed:@"shared.with.you"];
}

- (id)fallbackIconForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fallbackType];
  if (v5 == 2)
  {
    v7 = (void *)MEMORY[0x1E4F98F18];
    v8 = [v4 url];
    v9 = [v7 monogramStringForURL:v8];

    v6 = [(NSCache *)self->_monogramTitleToImageCache objectForKey:v9];
    if (!v6)
    {
      v10 = (void *)MEMORY[0x1E4F98F18];
      v11 = [v4 url];
      v12 = +[_SFSiteIcon defaultIconKeyColor];
      v6 = [v10 monogramWithTitle:0 url:v11 backgroundColor:v12];

      if (v6)
      {
        objc_msgSend(v6, "sf_setIsMonogram:", 1);
        [(NSCache *)self->_monogramTitleToImageCache setObject:v6 forKey:v9];
      }
      else
      {
        v6 = +[_SFFaviconProvider fallbackFavicon];
      }
    }
  }
  else if (v5 == 1)
  {
    v6 = +[_SFFaviconProvider fallbackFavicon];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end