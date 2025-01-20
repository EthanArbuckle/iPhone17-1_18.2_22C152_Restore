@interface _SFTouchIconCache
+ (id)_generateDefaultFavoritesIcon;
+ (id)_monogramConfiguration;
+ (id)defaultBackgroundColor;
- (BOOL)canHandleRequest:(id)a3;
- (id)_operationWithRequest:(id)a3 completionHandler:(id)a4;
- (void)_didLoadTouchIcon:(id)a3 withCacheSettingsEntry:(id)a4;
@end

@implementation _SFTouchIconCache

+ (id)defaultBackgroundColor
{
  return +[_SFSiteIcon defaultIconKeyColor];
}

- (void)_didLoadTouchIcon:(id)a3 withCacheSettingsEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)_SFTouchIconCache;
    [(WBSTouchIconCache *)&v10 _didLoadTouchIcon:v6 withCacheSettingsEntry:v7];
    uint64_t v8 = objc_msgSend(v6, "safari_transparencyAnalysisResult");
    if (v8 != [v7 transparencyAnalysisResult])
    {
      v9 = [v7 entryWithTransparencyAnalysisResult:v8];
      [(WBSTouchIconCache *)self saveTouchIconSettings:v9 touchIcon:v6];
    }
  }
}

- (BOOL)canHandleRequest:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_SFTouchIconCache;
  if ([(WBSTouchIconCache *)&v7 canHandleRequest:v4])
  {
    objc_opt_class();
    char v5 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

- (id)_operationWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = [(WBSTouchIconFetchOperation *)[_SFTouchIconFetchOperation alloc] initWithRequest:v6 completionHandler:v5];

  return v7;
}

+ (id)_generateDefaultFavoritesIcon
{
  +[_SFSiteIcon defaultSize];
  double v3 = v2;
  double v5 = v4;
  id v6 = +[_SFSiteIcon defaultGlyph];
  [v6 size];
  double v8 = v3 - v7;
  [v6 size];
  double v10 = v5 - v9;
  double v11 = _SFRoundFloatToPixels(v10 * 0.5);
  double v12 = _SFRoundFloatToPixels(v8 * 0.5);
  v13 = objc_msgSend(v6, "_imagePaddedByInsets:", v11, v12, v10 - v11, v8 - v12);

  return v13;
}

+ (id)_monogramConfiguration
{
  double v3 = (void *)MEMORY[0x1E4F98F10];
  +[_SFSiteIcon defaultSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = [a1 defaultBackgroundColor];
  double v9 = objc_msgSend(v3, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", 0, 0, v8, v5, v7, 44.0, 20.0, 0.0);

  return v9;
}

@end