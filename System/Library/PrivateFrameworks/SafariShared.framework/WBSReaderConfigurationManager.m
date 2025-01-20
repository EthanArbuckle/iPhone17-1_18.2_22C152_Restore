@interface WBSReaderConfigurationManager
- (BOOL)canMakeTextBigger;
- (BOOL)canMakeTextSmaller;
- (BOOL)darkModeEnabled;
- (BOOL)isOLEDDisplay;
- (BOOL)javaScriptEnabled;
- (BOOL)resettingTextSizeWouldHaveEffect;
- (NSDictionary)configurationToSave;
- (NSDictionary)configurationToSendToWebPage;
- (WBSReaderConfigurationManager)initWithPersistedSettingsAsDictionaryRepresentation:(id)a3 fontManager:(id)a4;
- (WBSReaderConfigurationManager)initWithPersistedSettingsAsDictionaryRepresentation:(id)a3 fontManager:(id)a4 prefersLargerDefaultFontSize:(BOOL)a5;
- (WBSReaderFontManager)fontManager;
- (id)fontForLanguageTag:(id)a3;
- (int64_t)_defaultTextZoomIndex;
- (int64_t)_defaultThemeForAppearance:(int64_t)a3;
- (int64_t)effectiveTextZoomIndex;
- (int64_t)textZoomIndex;
- (int64_t)themeForAppearance:(int64_t)a3;
- (void)_migrateToVersion5IfNecessary;
- (void)makeTextBigger;
- (void)makeTextSmaller;
- (void)resetTextSize;
- (void)setDarkModeEnabled:(BOOL)a3;
- (void)setFont:(id)a3 forLanguageTag:(id)a4;
- (void)setIsOLEDDisplay:(BOOL)a3;
- (void)setJavaScriptEnabled:(BOOL)a3;
- (void)setTextZoomIndex:(int64_t)a3;
- (void)setTheme:(int64_t)a3 forAppearance:(int64_t)a4;
@end

@implementation WBSReaderConfigurationManager

- (void)setJavaScriptEnabled:(BOOL)a3
{
  self->_javaScriptEnabled = a3;
}

- (void)setIsOLEDDisplay:(BOOL)a3
{
  self->_isOLEDDisplay = a3;
}

- (void)setDarkModeEnabled:(BOOL)a3
{
  self->_darkModeEnabled = a3;
}

- (void)_migrateToVersion5IfNecessary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t textZoomIndex = self->_textZoomIndex;
  if (textZoomIndex == [(WBSReaderConfigurationManager *)self _defaultTextZoomIndex]) {
    self->_int64_t textZoomIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = (void *)[(NSMutableDictionary *)self->_fontFamilyNameForLanguageTag copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v9 = [(NSMutableDictionary *)self->_fontFamilyNameForLanguageTag objectForKeyedSubscript:v8];
        v10 = +[WBSReaderLocalizedFonts defaultFontFamilyNameForLanguage:v8];
        if ([v9 isEqualToString:v10])
        {
        }
        else
        {
          char v11 = [v9 isEqualToString:@"Georgia"];

          if ((v11 & 1) == 0) {
            goto LABEL_12;
          }
        }
        [(NSMutableDictionary *)self->_fontFamilyNameForLanguageTag removeObjectForKey:v8];
LABEL_12:
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  if (!self->_theme) {
    self->_theme = -1;
  }
  if (self->_darkModeTheme == 2) {
    self->_darkModeTheme = -1;
  }
}

- (WBSReaderConfigurationManager)initWithPersistedSettingsAsDictionaryRepresentation:(id)a3 fontManager:(id)a4 prefersLargerDefaultFontSize:(BOOL)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v37 = a4;
  v42.receiver = self;
  v42.super_class = (Class)WBSReaderConfigurationManager;
  v9 = [(WBSReaderConfigurationManager *)&v42 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_38;
  }
  objc_storeStrong((id *)&v9->_fontManager, a4);
  v10->_prefersLargerDefaultFontSize = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v8 = (id)MEMORY[0x1E4F1CC08];
  }
  char v11 = objc_msgSend(v8, "safari_dictionaryForKey:", @"fontSizeIndexForSizeClass");
  long long v12 = v11;
  if (v11)
  {
    long long v13 = objc_msgSend(v11, "safari_numberForKey:", @"all");
    long long v14 = v13;
    if (v13)
    {
      v10->_int64_t textZoomIndex = [v13 integerValue];

      goto LABEL_10;
    }
  }
  long long v15 = objc_msgSend(v8, "safari_numberForKey:", @"fontSizeIndex");
  long long v12 = v15;
  if (v15)
  {
    v10->_int64_t textZoomIndex = [v15 integerValue];
LABEL_10:

    if (v10->_textZoomIndex < 0xCuLL) {
      goto LABEL_12;
    }
  }
  v10->_int64_t textZoomIndex = [(WBSReaderConfigurationManager *)v10 _defaultTextZoomIndex];
LABEL_12:
  v16 = objc_msgSend(v8, "safari_dictionaryForKey:", @"fontFamilyNameForLanguageTag");
  uint64_t v17 = v16;
  if (v16)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v23 = [v18 objectForKeyedSubscript:v22];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass) {
              continue;
            }
          }

          goto LABEL_24;
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    v25 = (NSMutableDictionary *)[v18 mutableCopy];
  }
  else
  {
LABEL_24:
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  fontFamilyNameForLanguageTag = v10->_fontFamilyNameForLanguageTag;
  v10->_fontFamilyNameForLanguageTag = v25;

  objc_msgSend(v8, "safari_stringForKey:", @"themeName");
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    uint64_t v29 = WBSThemeForNSString(v27);
    if (v29 != -1)
    {
      v10->_theme = v29;

      goto LABEL_30;
    }
  }
  v10->_theme = -1;
LABEL_30:
  objc_msgSend(v8, "safari_stringForKey:", @"darkModeThemeName");
  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
  {
LABEL_34:
    v10->_darkModeTheme = -1;
    goto LABEL_35;
  }
  uint64_t v32 = WBSThemeForNSString(v30);
  if (v32 == -1)
  {

    goto LABEL_34;
  }
  v10->_darkModeTheme = v32;

LABEL_35:
  v33 = objc_msgSend(v8, "safari_numberForKey:", @"version");
  unint64_t v34 = [v33 unsignedIntegerValue];

  if (v34 <= 4) {
    [(WBSReaderConfigurationManager *)v10 _migrateToVersion5IfNecessary];
  }
  v35 = v10;

LABEL_38:
  return v10;
}

- (int64_t)_defaultTextZoomIndex
{
  if (self->_prefersLargerDefaultFontSize) {
    return 4;
  }
  else {
    return 3;
  }
}

- (WBSReaderConfigurationManager)initWithPersistedSettingsAsDictionaryRepresentation:(id)a3 fontManager:(id)a4
{
  return [(WBSReaderConfigurationManager *)self initWithPersistedSettingsAsDictionaryRepresentation:a3 fontManager:a4 prefersLargerDefaultFontSize:0];
}

- (NSDictionary)configurationToSave
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_textZoomIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v4 forKeyedSubscript:@"fontSizeIndex"];
  }
  uint64_t v5 = @"White";
  switch(self->_theme)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      goto LABEL_8;
    case 1:
      uint64_t v5 = @"Sepia";
      goto LABEL_7;
    case 2:
      uint64_t v5 = @"Gray";
      goto LABEL_7;
    case 3:
      uint64_t v5 = @"Night";
      goto LABEL_7;
    default:
LABEL_7:
      [v3 setObject:v5 forKeyedSubscript:@"themeName"];
LABEL_8:
      uint64_t v6 = @"White";
      switch(self->_darkModeTheme)
      {
        case 0xFFFFFFFFFFFFFFFFLL:
          goto LABEL_13;
        case 1:
          uint64_t v6 = @"Sepia";
          goto LABEL_12;
        case 2:
          uint64_t v6 = @"Gray";
          goto LABEL_12;
        case 3:
          uint64_t v6 = @"Night";
          goto LABEL_12;
        default:
LABEL_12:
          [v3 setObject:v6 forKeyedSubscript:@"darkModeThemeName"];
LABEL_13:
          if ([(NSMutableDictionary *)self->_fontFamilyNameForLanguageTag count]) {
            [v3 setObject:self->_fontFamilyNameForLanguageTag forKeyedSubscript:@"fontFamilyNameForLanguageTag"];
          }
          [v3 setObject:&unk_1EFC228D0 forKeyedSubscript:@"version"];
          return (NSDictionary *)v3;
      }
  }
}

- (NSDictionary)configurationToSendToWebPage
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[WBSReaderConfigurationManager effectiveTextZoomIndex](self, "effectiveTextZoomIndex"));
  [v3 setObject:v4 forKeyedSubscript:@"fontSizeIndex"];

  uint64_t v5 = 16;
  if (!self->_darkModeEnabled) {
    uint64_t v5 = 8;
  }
  int64_t v6 = *(int64_t *)((char *)&self->super.isa + v5);
  if (v6 == -1) {
    int64_t v6 = -[WBSReaderConfigurationManager _defaultThemeForAppearance:](self, "_defaultThemeForAppearance:");
  }
  if ((unint64_t)(v6 - 1) > 2) {
    v7 = @"White";
  }
  else {
    v7 = off_1E5C9F150[v6 - 1];
  }
  [v3 setObject:v7 forKeyedSubscript:@"themeName"];
  id v8 = +[WBSReaderFont systemSerifFont];
  fontFamilyNameForLanguageTag = self->_fontFamilyNameForLanguageTag;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__WBSReaderConfigurationManager_configurationToSendToWebPage__block_invoke;
  v16[3] = &unk_1E5C9F130;
  id v10 = v8;
  id v17 = v10;
  char v11 = [(NSMutableDictionary *)fontFamilyNameForLanguageTag safari_mapAndFilterKeysAndObjectsUsingBlock:v16];
  [v3 setObject:v11 forKeyedSubscript:@"fontFamilyNameForLanguageTag"];
  long long v12 = +[WBSReaderLocalizedFonts defaultFontFamilyNameForLanguageMap];
  [v3 setObject:v12 forKeyedSubscript:@"defaultFontFamilyNameForLanguage"];

  long long v13 = [NSNumber numberWithBool:self->_javaScriptEnabled];
  [v3 setObject:v13 forKeyedSubscript:@"javaScriptEnabled"];

  long long v14 = [NSNumber numberWithBool:self->_isOLEDDisplay];
  [v3 setObject:v14 forKeyedSubscript:@"isOLEDDisplay"];

  return (NSDictionary *)v3;
}

id __61__WBSReaderConfigurationManager_configurationToSendToWebPage__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) familyName];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) familyNameForWebContent];

    id v4 = (id)v7;
  }
  return v4;
}

- (BOOL)canMakeTextBigger
{
  return [(WBSReaderConfigurationManager *)self effectiveTextZoomIndex] < 11;
}

- (BOOL)canMakeTextSmaller
{
  return [(WBSReaderConfigurationManager *)self effectiveTextZoomIndex] > 0;
}

- (BOOL)resettingTextSizeWouldHaveEffect
{
  int64_t v3 = [(WBSReaderConfigurationManager *)self effectiveTextZoomIndex];
  return v3 != [(WBSReaderConfigurationManager *)self _defaultTextZoomIndex];
}

- (void)makeTextBigger
{
  if ([(WBSReaderConfigurationManager *)self canMakeTextBigger])
  {
    self->_int64_t textZoomIndex = [(WBSReaderConfigurationManager *)self effectiveTextZoomIndex] + 1;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"WBSWebsiteZoomDidChangeNotification" object:0];
  }
}

- (void)makeTextSmaller
{
  if ([(WBSReaderConfigurationManager *)self canMakeTextSmaller])
  {
    self->_int64_t textZoomIndex = [(WBSReaderConfigurationManager *)self effectiveTextZoomIndex] - 1;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"WBSWebsiteZoomDidChangeNotification" object:0];
  }
}

- (void)resetTextSize
{
  self->_int64_t textZoomIndex = [(WBSReaderConfigurationManager *)self _defaultTextZoomIndex];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"WBSWebsiteZoomDidChangeNotification" object:0];
}

- (void)setFont:(id)a3 forLanguageTag:(id)a4
{
  id v7 = a4;
  int v6 = [a3 familyName];
  [(NSMutableDictionary *)self->_fontFamilyNameForLanguageTag setObject:v6 forKeyedSubscript:v7];
}

- (id)fontForLanguageTag:(id)a3
{
  id v4 = a3;
  fontManager = self->_fontManager;
  int v6 = [(NSMutableDictionary *)self->_fontFamilyNameForLanguageTag objectForKeyedSubscript:v4];
  id v7 = [(WBSReaderFontManager *)fontManager fontWithFontFamilyName:v6];

  if (!v7 || ([v7 isInstalled] & 1) == 0)
  {
    uint64_t v8 = [(WBSReaderFontManager *)self->_fontManager defaultFontForLanguageTag:v4];

    id v7 = (void *)v8;
  }

  return v7;
}

- (void)setTheme:(int64_t)a3 forAppearance:(int64_t)a4
{
  if (a4)
  {
    if (a4 != 1) {
      return;
    }
    uint64_t v4 = 16;
  }
  else
  {
    uint64_t v4 = 8;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
}

- (int64_t)themeForAppearance:(int64_t)a3
{
  if (a3 == 1)
  {
    int64_t darkModeTheme = self->_darkModeTheme;
  }
  else
  {
    if (a3) {
      return darkModeTheme;
    }
    int64_t darkModeTheme = self->_theme;
  }
  if (darkModeTheme != -1) {
    return darkModeTheme;
  }
  return -[WBSReaderConfigurationManager _defaultThemeForAppearance:](self, "_defaultThemeForAppearance:");
}

- (int64_t)_defaultThemeForAppearance:(int64_t)a3
{
  if (a3 == 1) {
    return 3;
  }
  else {
    return 0;
  }
}

- (int64_t)effectiveTextZoomIndex
{
  if (self->_textZoomIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return [(WBSReaderConfigurationManager *)self _defaultTextZoomIndex];
  }
  else {
    return self->_textZoomIndex;
  }
}

- (BOOL)javaScriptEnabled
{
  return self->_javaScriptEnabled;
}

- (BOOL)darkModeEnabled
{
  return self->_darkModeEnabled;
}

- (BOOL)isOLEDDisplay
{
  return self->_isOLEDDisplay;
}

- (WBSReaderFontManager)fontManager
{
  return self->_fontManager;
}

- (int64_t)textZoomIndex
{
  return self->_textZoomIndex;
}

- (void)setTextZoomIndex:(int64_t)a3
{
  self->_int64_t textZoomIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontManager, 0);
  objc_storeStrong((id *)&self->_fontFamilyNameForLanguageTag, 0);
}

@end