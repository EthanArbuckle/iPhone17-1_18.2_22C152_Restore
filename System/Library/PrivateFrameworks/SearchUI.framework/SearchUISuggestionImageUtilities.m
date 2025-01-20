@interface SearchUISuggestionImageUtilities
+ (CGSize)maximumSize;
+ (id)appIconImageForBundleIdentifier:(id)a3;
+ (id)imageForSuggestionCardSection:(id)a3;
+ (id)suggestionSymbolImageWithSymbolName:(id)a3;
+ (id)symbolImageForSuggestionType:(int)a3;
+ (unint64_t)currentWebSuggestionIconPref;
+ (void)initialize;
+ (void)resetSizes;
@end

@implementation SearchUISuggestionImageUtilities

+ (void)initialize
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:a1 selector:sel_resetSizes name:*MEMORY[0x1E4FB27A8] object:0];
}

+ (void)resetSizes
{
  sMaxGlyphSize = *MEMORY[0x1E4F1DB30];
}

+ (CGSize)maximumSize
{
  double v3 = *((double *)&sMaxGlyphSize + 1);
  double v2 = *(double *)&sMaxGlyphSize;
  if (*(double *)&sMaxGlyphSize == *MEMORY[0x1E4F1DB30]
    && *((double *)&sMaxGlyphSize + 1) == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v5 = objc_msgSend(a1, "symbolImageForSuggestionType:", 0, sMaxGlyphSize);
    v6 = [v5 loadImageWithScale:0 isDarkStyle:0.0];

    [v6 size];
    if (v7 < v8) {
      double v7 = v8;
    }
    [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:0 forView:v7];
    *(void *)&sMaxGlyphSize = v9;
    *((void *)&sMaxGlyphSize + 1) = v9;

    double v3 = *((double *)&sMaxGlyphSize + 1);
    double v2 = *(double *)&sMaxGlyphSize;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)imageForSuggestionCardSection:(id)a3
{
  id v4 = a3;
  [a1 maximumSize];
  unint64_t v5 = +[SearchUIAppIconImage bestVariantForSize:](SearchUIAppIconImage, "bestVariantForSize:");
  v6 = [v4 thumbnail];
  double v7 = +[SearchUIImage imageWithSFImage:v6 variantForAppIcon:v5];

  if (!v7)
  {
    uint64_t v8 = [v4 suggestionType];
    uint64_t v9 = [a1 currentWebSuggestionIconPref];
    v10 = [v4 punchoutOptions];
    v11 = [v10 firstObject];
    v12 = [v11 bundleIdentifier];

    v13 = +[SearchUIUtilities bundleIdentifierForApp:14];
    v14 = v13;
    if (v8 == 4 && (v9 == 3 || !v9))
    {
      id v15 = v13;

      v12 = v15;
    }
    if (v12)
    {
      v16 = +[SearchUIUtilities bundleIdentifierForApp:14];
      int v17 = [v12 isEqualToString:v16];

      if (v17)
      {
        v18 = [[SearchUIDefaultBrowserAppIconImage alloc] initWithVariant:v5];
        double v7 = v18;
        if (v8 == 4 && v9 == 3) {
          [(SearchUIDefaultBrowserAppIconImage *)v18 setCornerRoundingStyle:4];
        }
        goto LABEL_14;
      }
      uint64_t v19 = [a1 appIconImageForBundleIdentifier:v12];
    }
    else
    {
      uint64_t v19 = [a1 symbolImageForSuggestionType:v8];
    }
    double v7 = (void *)v19;
LABEL_14:
  }
  return v7;
}

+ (id)symbolImageForSuggestionType:(int)a3
{
  uint64_t v5 = [a1 currentWebSuggestionIconPref];
  if (a3 == 1)
  {
    double v7 = @"person.crop.circle";
  }
  else if (a3 == 4)
  {
    v6 = @"safari";
    if (v5 == 2) {
      v6 = @"safari.fill";
    }
    double v7 = v6;
  }
  else
  {
    double v7 = @"magnifyingglass";
  }
  uint64_t v8 = [a1 suggestionSymbolImageWithSymbolName:v7];

  return v8;
}

+ (unint64_t)currentWebSuggestionIconPref
{
  if (currentWebSuggestionIconPref_onceToken != -1) {
    dispatch_once(&currentWebSuggestionIconPref_onceToken, &__block_literal_global_37);
  }
  return currentWebSuggestionIconPref_currentWebSuggestionIconPref;
}

void __64__SearchUISuggestionImageUtilities_currentWebSuggestionIconPref__block_invoke()
{
  id v1 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.spotlightui"];
  v0 = [v1 objectForKey:@"SPUIWebSuggestionIconKey"];
  currentWebSuggestionIconPref_currentWebSuggestionIconPref = [v0 integerValue];
}

+ (id)appIconImageForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [a1 maximumSize];
    uint64_t v5 = +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", v4, +[SearchUIAppIconImage bestVariantForSize:](SearchUIAppIconImage, "bestVariantForSize:"));
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)suggestionSymbolImageWithSymbolName:(id)a3
{
  id v3 = a3;
  id v4 = +[SearchUIThumbnailViewController compactSymbolFont];
  uint64_t v5 = [[SearchUISymbolImage alloc] initWithSymbolName:v3 font:v4 scale:+[SearchUIThumbnailViewController compactSymbolScale]];

  return v5;
}

@end