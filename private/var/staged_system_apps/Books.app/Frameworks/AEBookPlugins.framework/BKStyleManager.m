@interface BKStyleManager
+ (BOOL)languageIsSimplifiedChinese:(id)a3;
+ (id)styleManagerWithLanguage:(id)a3;
+ (id)suffixForLanguage:(id)a3;
+ (int64_t)defaultFontSizeIndex;
+ (void)initialize;
- (BKStyleManager)initWithLanguage:(id)a3;
- (BOOL)addedPresetFonts;
- (BOOL)autoHyphenation;
- (BOOL)canDecreaseFontSize;
- (BOOL)canIncreaseFontSize;
- (BOOL)isFontAvailable:(id)a3;
- (BOOL)isFontPreregistered:(id)a3;
- (BOOL)languageIsSimplifiedChinese;
- (BOOL)optimizeLegibility;
- (ContentStyle)style;
- (NSString)font;
- (NSString)language;
- (NSString)languageSuffix;
- (float)fontSize;
- (float)fontSizeForFont:(id)a3 category:(id)a4;
- (float)fontSizeForFont:(id)a3 presetIndex:(int64_t)a4;
- (float)lineHeight;
- (id)_defaultFontName;
- (id)_detailsForFont:(id)a3;
- (id)_presetsForFontName:(id)a3;
- (id)defaultStyleWithOriginalFonts:(BOOL)a3;
- (id)fallbackFontFamiliesForFontFamily:(id)a3;
- (id)fontFaceMappings;
- (id)fontForFontFamily:(id)a3;
- (id)fonts;
- (id)presets;
- (id)styleForFont:(id)a3 presetIndex:(int64_t)a4;
- (int64_t)_maxFontStepsForFont:(id)a3;
- (int64_t)fontSizeIndex;
- (void)coordinator:(id)a3 observerDidDecreaseFontSize:(id)a4;
- (void)coordinator:(id)a3 observerDidIncreaseFontSize:(id)a4;
- (void)dealloc;
- (void)decreaseFontSize;
- (void)decreaseFontSizeNotifyingCoordinator:(BOOL)a3;
- (void)fontStateChanged:(id)a3;
- (void)increaseFontSize;
- (void)increaseFontSizeNotifyingCoordinator:(BOOL)a3;
- (void)notifyStyleChanged;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadCurrentStyle;
- (void)setAddedPresetFonts:(BOOL)a3;
- (void)setAutoHyphenation:(BOOL)a3;
- (void)setDefaultFontSize;
- (void)setFont:(id)a3;
- (void)setFontSize:(float)a3;
- (void)setLanguageSuffix:(id)a3;
- (void)setLineHeight:(float)a3;
- (void)setOptimizeLegibility:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)storeDefaultStyle:(id)a3;
- (void)verifySelectedFont;
@end

@implementation BKStyleManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    v5[0] = BKAutoHyphenation[0];
    v5[1] = BKOptimizeLegibility[0];
    v6[0] = &__kCFBooleanTrue;
    v6[1] = &__kCFBooleanFalse;
    v6[2] = &__kCFBooleanFalse;
    v5[2] = @"BKUseOldFontStepsAndSpacing";
    v5[3] = BKStyleManagerLastStyleIndexKey;
    isPad();
    v3 = +[NSNumber numberWithInteger:3];
    v6[3] = v3;
    v4 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
    [v2 registerDefaults:v4];
  }
}

+ (int64_t)defaultFontSizeIndex
{
  return 3;
}

+ (id)styleManagerWithLanguage:(id)a3
{
  id v3 = a3;
  v4 = [[BKStyleManager alloc] initWithLanguage:v3];

  return v4;
}

- (BKStyleManager)initWithLanguage:(id)a3
{
  v4 = (__CFString *)a3;
  v24.receiver = self;
  v24.super_class = (Class)BKStyleManager;
  v5 = [(BKStyleManager *)&v24 init];
  if (v5)
  {
    if (![(__CFString *)v4 length])
    {
      v6 = +[NSLocale preferredLanguages];
      v7 = [v6 objectAtIndexedSubscript:0];

      if (v7
        && (+[NSLocale localeWithLocaleIdentifier:v7],
            (v8 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v9 = v8;
        CFStringRef v10 = [(__CFString *)v8 languageCode];

        v4 = v9;
      }
      else
      {
        CFStringRef v10 = @"en";
      }

      v4 = (__CFString *)v10;
    }
    objc_storeStrong((id *)&v5->_language, v4);
    v11 = +[BKStyleManager suffixForLanguage:v4];
    if ([v11 length])
    {
      uint64_t v12 = +[NSString stringWithFormat:@"-%@", v11];
      languageSuffix = v5->_languageSuffix;
      v5->_languageSuffix = (NSString *)v12;
    }
    else
    {
      languageSuffix = v5->_languageSuffix;
      v5->_languageSuffix = (NSString *)&stru_1DF0D8;
    }

    v14 = +[BKFontCache sharedInstance];
    [v14 prewarmFontsForLanguage:v4 completion:0];

    v15 = +[NSUserDefaults standardUserDefaults];
    v5->_autoHyphenation = [v15 BOOLForKey:BKAutoHyphenation[0]];

    v16 = +[NSUserDefaults standardUserDefaults];
    v5->_legibility = [v16 BOOLForKey:BKOptimizeLegibility[0]];

    v17 = +[NSUserDefaults standardUserDefaults];
    v18 = [v17 objectForKey:BKStyleManagerLastStyleIndexKey];

    if (!v18 || (int64_t v19 = (int64_t)[v18 integerValue], v5->_index = v19, v19 < 0)) {
      v5->_index = (int64_t)[(id)objc_opt_class() defaultFontSizeIndex];
    }
    v20 = +[BCThemeCoordinator shared];
    [v20 addObserver:v5];

    v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v5 selector:"fontStateChanged:" name:BEFontStateChangedNotification object:0];
    v22 = +[NSUserDefaults standardUserDefaults];
    [v22 addObserver:v5 forKeyPath:BKAutoHyphenation[0] options:1 context:off_22A038];
  }
  return v5;
}

- (void)dealloc
{
  if (+[NSThread isMainThread])
  {
    id v3 = +[BCThemeCoordinator shared];
    [v3 removeObserver:self];
  }
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObserver:self forKeyPath:BKAutoHyphenation[0] context:off_22A038];

  v6.receiver = self;
  v6.super_class = (Class)BKStyleManager;
  [(BKStyleManager *)&v6 dealloc];
}

+ (BOOL)languageIsSimplifiedChinese:(id)a3
{
  return +[IMLanguageUtilities languageIsSimplifiedChinese:a3];
}

+ (id)suffixForLanguage:(id)a3
{
  return +[IMLanguageUtilities suffixForLanguage:a3];
}

- (BOOL)languageIsSimplifiedChinese
{
  v2 = [(BKStyleManager *)self language];
  BOOL v3 = +[BKStyleManager languageIsSimplifiedChinese:v2];

  return v3;
}

- (id)fallbackFontFamiliesForFontFamily:(id)a3
{
  id v4 = a3;
  v5 = [(BKStyleManager *)self language];
  objc_super v6 = +[BKFontFallbackProvider fallbacksForFontFamily:v4 language:v5];

  return v6;
}

- (void)setAutoHyphenation:(BOOL)a3
{
  if (self->_autoHyphenation != a3)
  {
    BOOL v3 = a3;
    self->_autoHyphenation = a3;
    v5 = [(BKStyleManager *)self style];
    id v6 = [v5 copy];

    [v6 setAutoHyphenate:v3];
    [(BKStyleManager *)self setStyle:v6];
  }
}

- (void)setOptimizeLegibility:(BOOL)a3
{
  if (self->_legibility != a3)
  {
    BOOL v3 = a3;
    self->_legibility = a3;
    v5 = [(BKStyleManager *)self style];
    id v6 = [v5 copy];

    [v6 setOptimizeLegibility:v3];
    [(BKStyleManager *)self setStyle:v6];
  }
}

- (id)presets
{
  BOOL v3 = +[BKFontCache sharedInstance];
  id v4 = [(BKStyleManager *)self language];
  v5 = [v3 presetsForLanguage:v4];

  return v5;
}

- (void)setStyle:(id)a3
{
  id v6 = a3;
  if (!-[ContentStyle isEqual:](self->_style, "isEqual:"))
  {
    style = self->_style;
    objc_storeStrong((id *)&self->_style, a3);
    [(BKStyleManager *)self storeDefaultStyle:v6];
    if (style) {
      [(BKStyleManager *)self notifyStyleChanged];
    }
  }
}

- (id)_defaultFontName
{
  BOOL v3 = +[BKFontCache sharedInstance];
  id v4 = [(BKStyleManager *)self language];
  v5 = [v3 defaultFontNameForLanguage:v4];

  return v5;
}

- (id)_presetsForFontName:(id)a3
{
  id v4 = a3;
  v5 = +[BKFontCache sharedInstance];
  id v6 = [(BKStyleManager *)self language];
  v7 = [v5 presetSettingsForFontFamily:v4 language:v6];

  return v7;
}

- (id)styleForFont:(id)a3 presetIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = [(BKStyleManager *)self _presetsForFontName:v6];
  v8 = v7;
  if (v7)
  {
    id v9 = [v7 count];
    CFStringRef v10 = (char *)a4;
    if ((unint64_t)v9 <= a4) {
      CFStringRef v10 = (char *)[v8 count] - 1;
    }
    v11 = [v8 objectAtIndex:v10];
    uint64_t v12 = [[ContentStyle alloc] initWithFontFamily:v6 andDetails:v11];
    [(ContentStyle *)v12 setAutoHyphenate:[(BKStyleManager *)self autoHyphenation]];
    [(ContentStyle *)v12 setOptimizeLegibility:[(BKStyleManager *)self optimizeLegibility]];
    v13 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v14 = [v13 BOOLForKey:@"BKUseOldFontStepsAndSpacing"];

    if ((v14 & 1) == 0)
    {
      if ((unint64_t)a4 >= 0xE) {
        int64_t v15 = 14;
      }
      else {
        int64_t v15 = a4;
      }
      v16 = +[UIScreen mainScreen];
      [v16 bounds];
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;

      v34.origin.x = v18;
      v34.origin.y = v20;
      v34.size.width = v22;
      v34.size.height = v24;
      double Width = CGRectGetWidth(v34);
      v35.origin.x = v18;
      v35.origin.y = v20;
      v35.size.width = v22;
      v35.size.height = v24;
      double Height = CGRectGetHeight(v35);
      if (Width < Height) {
        double Height = Width;
      }
      if (Height >= 320.0)
      {
        uint64_t v28 = 1;
        uint64_t v27 = 3;
        while (v28 != 4)
        {
          double v29 = dbl_18EBE8[v28++];
          if (v29 > Height)
          {
            uint64_t v27 = v28 - 2;
            break;
          }
        }
      }
      else
      {
        uint64_t v27 = 1;
      }
      double v30 = dbl_18EC08[v27] * dbl_18EB70[v15];
      *(float *)&double v30 = v30;
      [(ContentStyle *)v12 setFontSize:v30];
      LODWORD(v31) = 1.0;
      [(ContentStyle *)v12 setLineHeight:v31];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (float)fontSizeForFont:(id)a3 category:(id)a4
{
  uint64_t v6 = qword_22B5E8;
  id v7 = a4;
  id v8 = a3;
  if (v6 != -1) {
    dispatch_once(&qword_22B5E8, &stru_1DD0A8);
  }
  id v9 = [(id)qword_22B5E0 indexOfObject:v7];

  [(BKStyleManager *)self fontSizeForFont:v8 presetIndex:v9];
  float v11 = v10;

  return v11;
}

- (float)fontSizeForFont:(id)a3 presetIndex:(int64_t)a4
{
  id v4 = [(BKStyleManager *)self styleForFont:a3 presetIndex:a4];
  v5 = v4;
  if (v4)
  {
    [v4 fontSize];
    float v7 = v6;
  }
  else
  {
    float v7 = 1.0;
  }

  return v7;
}

- (id)fonts
{
  BOOL v3 = +[BKFontCache sharedInstance];
  id v4 = [(BKStyleManager *)self language];
  v5 = [v3 fontsForLanguage:v4];

  return v5;
}

- (id)fontForFontFamily:(id)a3
{
  id v4 = a3;
  v5 = +[BKFontCache sharedInstance];
  float v6 = [(BKStyleManager *)self language];
  float v7 = [v5 fontFromFamilyName:v4 language:v6];

  return v7;
}

- (id)fontFaceMappings
{
  BOOL v3 = +[BKFontCache sharedInstance];
  id v4 = [(BKStyleManager *)self language];
  v5 = [v3 presetPostscriptsLookupForLanguage:v4];

  return v5;
}

- (NSString)font
{
  v2 = [(BKStyleManager *)self style];
  uint64_t v3 = [v2 fontFamily];

  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = &stru_1DF0D8;
  }

  return (NSString *)v4;
}

- (id)_detailsForFont:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(BKStyleManager *)self fonts];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        float v10 = [v9 familyName];
        unsigned int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isFontPreregistered:(id)a3
{
  uint64_t v3 = [(BKStyleManager *)self _detailsForFont:a3];
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 kind] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isFontAvailable:(id)a3
{
  uint64_t v3 = [(BKStyleManager *)self _detailsForFont:a3];
  unsigned __int8 v4 = [v3 isAvailable];

  return v4;
}

- (void)setFont:(id)a3
{
  id v10 = a3;
  unsigned __int8 v4 = [(BKStyleManager *)self font];
  unsigned __int8 v5 = [v10 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [(BKStyleManager *)self styleForFont:v10 presetIndex:self->_index];
    [(BKStyleManager *)self setStyle:v6];

    uint64_t v7 = +[BCThemeCoordinator shared];
    id v8 = [(BKStyleManager *)self style];
    id v9 = [v8 fontFamily];
    [v7 observer:self didChangeFont:v9];
  }
}

- (float)fontSize
{
  v2 = [(BKStyleManager *)self style];
  [v2 fontSize];
  float v4 = v3;

  return v4;
}

- (void)setFontSize:(float)a3
{
  [(BKStyleManager *)self fontSize];
  if (v5 != a3)
  {
    id v6 = [(BKStyleManager *)self style];
    id v8 = [v6 copy];

    *(float *)&double v7 = a3;
    [v8 setFontSize:v7];
    [(BKStyleManager *)self setStyle:v8];
  }
}

- (void)reloadCurrentStyle
{
  id v4 = [(BKStyleManager *)self font];
  float v3 = [(BKStyleManager *)self styleForFont:v4 presetIndex:self->_index];
  [(BKStyleManager *)self setStyle:v3];
}

- (float)lineHeight
{
  v2 = [(BKStyleManager *)self style];
  [v2 lineHeight];
  float v4 = v3;

  return v4;
}

- (void)setLineHeight:(float)a3
{
  [(BKStyleManager *)self lineHeight];
  if (v5 != a3)
  {
    id v6 = [(BKStyleManager *)self style];
    id v8 = [v6 copy];

    *(float *)&double v7 = a3;
    [v8 setLineHeight:v7];
    [(BKStyleManager *)self setStyle:v8];
  }
}

- (int64_t)fontSizeIndex
{
  return self->_index;
}

- (int64_t)_maxFontStepsForFont:(id)a3
{
  id v4 = a3;
  float v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"BKUseOldFontStepsAndSpacing"];

  double v7 = [(BKStyleManager *)self _presetsForFontName:v4];

  id v8 = [v7 count];
  uint64_t v9 = 15;
  if ((unint64_t)v8 < 0xF) {
    uint64_t v9 = (uint64_t)v8;
  }
  if (v6) {
    int64_t v10 = (int64_t)v8;
  }
  else {
    int64_t v10 = v9;
  }

  return v10;
}

- (BOOL)canIncreaseFontSize
{
  float v3 = [(BKStyleManager *)self font];

  if (!v3) {
    return 0;
  }
  id v4 = [(BKStyleManager *)self font];
  int64_t v5 = [(BKStyleManager *)self _maxFontStepsForFont:v4];

  return self->_index < v5 - 1;
}

- (BOOL)canDecreaseFontSize
{
  float v3 = [(BKStyleManager *)self font];

  if (!v3) {
    return 0;
  }
  if (isPad())
  {
    int64_t v4 = 0;
  }
  else
  {
    unsigned int v6 = +[UIScreen mainScreen];
    [v6 scale];
    double v8 = v7;

    int64_t v4 = 2;
    if (v8 >= 2.0) {
      int64_t v4 = 0;
    }
  }
  return self->_index > v4;
}

- (void)setDefaultFontSize
{
  float v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 integerForKey:BKStyleManagerLastStyleIndexKey];

  id v5 = [(id)objc_opt_class() defaultFontSizeIndex];
  if (v4 != v5)
  {
    id v6 = v5;
    self->_index = (int64_t)v5;
    double v7 = [(BKStyleManager *)self font];
    double v8 = [(BKStyleManager *)self styleForFont:v7 presetIndex:self->_index];
    [(BKStyleManager *)self setStyle:v8];

    uint64_t v9 = +[NSUserDefaults standardUserDefaults];
    [v9 setInteger:self->_index forKey:BKStyleManagerLastStyleIndexKey];

    int64_t v10 = +[BCThemeCoordinator shared];
    id v11 = v10;
    if ((uint64_t)v4 >= (uint64_t)v6) {
      [v10 observerDidDecreaseFontSize:self];
    }
    else {
      [v10 observerDidIncreaseFontSize:self];
    }
  }
}

- (void)increaseFontSize
{
}

- (void)increaseFontSizeNotifyingCoordinator:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKStyleManager *)self font];
  id v12 = [(BKStyleManager *)self _presetsForFontName:v5];

  int64_t index = self->_index;
  double v7 = (char *)[v12 count] - 1;
  if (index + 1 < (unint64_t)v7) {
    double v7 = (char *)(index + 1);
  }
  self->_int64_t index = (int64_t)v7;
  double v8 = [(BKStyleManager *)self font];
  uint64_t v9 = [(BKStyleManager *)self styleForFont:v8 presetIndex:self->_index];
  [(BKStyleManager *)self setStyle:v9];

  int64_t v10 = +[NSUserDefaults standardUserDefaults];
  [v10 setInteger:self->_index forKey:BKStyleManagerLastStyleIndexKey];

  if (v3)
  {
    id v11 = +[BCThemeCoordinator shared];
    [v11 observerDidIncreaseFontSize:self];
  }
}

- (void)decreaseFontSize
{
}

- (void)decreaseFontSizeNotifyingCoordinator:(BOOL)a3
{
  BOOL v3 = a3;
  if (isPad())
  {
    int64_t v5 = 0;
  }
  else
  {
    id v6 = +[UIScreen mainScreen];
    [v6 scale];
    double v8 = v7;

    int64_t v5 = 2;
    if (v8 >= 2.0) {
      int64_t v5 = 0;
    }
  }
  if (self->_index - 1 > v5) {
    int64_t v5 = self->_index - 1;
  }
  self->_int64_t index = v5;
  uint64_t v9 = [(BKStyleManager *)self font];
  int64_t v10 = [(BKStyleManager *)self styleForFont:v9 presetIndex:self->_index];
  [(BKStyleManager *)self setStyle:v10];

  id v11 = +[NSUserDefaults standardUserDefaults];
  [v11 setInteger:self->_index forKey:BKStyleManagerLastStyleIndexKey];

  if (v3)
  {
    id v12 = +[BCThemeCoordinator shared];
    [v12 observerDidDecreaseFontSize:self];
  }
}

- (void)notifyStyleChanged
{
  id v7 = (id)objc_opt_new();
  BOOL v3 = [(BKStyleManager *)self style];
  [v7 setObject:v3 forKeyedSubscript:BKStyleManagerNewStyleUserInfoKey[0]];

  id v4 = +[NSNotificationCenter defaultCenter];
  int64_t v5 = BKStyleManagerDidChangeStyleNotification[0];
  id v6 = [v7 copy];
  [v4 postNotificationName:v5 object:self userInfo:v6];
}

- (void)verifySelectedFont
{
  id v2 = [(BKStyleManager *)self fonts];
}

- (id)defaultStyleWithOriginalFonts:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(BKStyleManager *)self languageSuffix];
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v6 integerForKey:BKStyleManagerLastStyleIndexKey];

  if (v3)
  {
    double v8 = [(BKStyleManager *)self styleForFont:&stru_1DF0D8 presetIndex:v7];
    if (v8) {
      goto LABEL_25;
    }
  }
  uint64_t v9 = +[NSString stringWithFormat:@"%@%@", BKStyleManagerLastFontKey, v5];
  int64_t v10 = +[NSUserDefaults standardUserDefaults];
  id v11 = [v10 stringForKey:v9];

  if ([(__CFString *)v11 hasPrefix:@".SFUIText"])
  {

    id v12 = +[NSUserDefaults standardUserDefaults];
    id v11 = @"-apple-system";
    [v12 setObject:@"-apple-system" forKey:v9];
  }
  if (!-[__CFString length](v11, "length") && ![v5 length])
  {
    long long v13 = +[NSUserDefaults standardUserDefaults];
    long long v14 = [v13 objectForKey:BKStyleManagerLastStyleKey];

    if (!v14)
    {
LABEL_19:

      goto LABEL_20;
    }
    long long v15 = +[ContentStyle fontNameFromSummaryString:v14];
    CGFloat v22 = [(BKStyleManager *)self styleForFont:v15 presetIndex:v7];
    if (v22)
    {
      CFStringRef v16 = v15;
    }
    else if ([(__CFString *)v11 isEqualToString:@"Verdana"])
    {
      CFStringRef v16 = @"Seravek";
    }
    else if (([(__CFString *)v11 isEqualToString:@"Baskerville"] & 1) != 0 {
           || ([(__CFString *)v11 isEqualToString:@"Georgia"] & 1) != 0)
    }
    {
      CFStringRef v16 = @"Iowan Old Style";
    }
    else
    {
      if (([(__CFString *)v11 isEqualToString:@"Cochin"] & 1) == 0) {
        goto LABEL_16;
      }
      CFStringRef v16 = @"Athelas";
    }

    id v11 = (__CFString *)v16;
LABEL_16:
    double v17 = +[NSUserDefaults standardUserDefaults];
    [v17 removeObjectForKey:BKStyleManagerLastStyleKey];

    if ([(__CFString *)v11 length])
    {
      CGFloat v18 = +[NSUserDefaults standardUserDefaults];
      [v18 setObject:v11 forKey:v9];
    }
    goto LABEL_19;
  }
LABEL_20:
  if (![(__CFString *)v11 length])
  {
    uint64_t v19 = [(BKStyleManager *)self _defaultFontName];

    id v11 = (__CFString *)v19;
  }
  double v8 = [(BKStyleManager *)self styleForFont:v11 presetIndex:v7];
  if (!v8)
  {
    CGFloat v20 = [(BKStyleManager *)self _defaultFontName];
    double v8 = [(BKStyleManager *)self styleForFont:v20 presetIndex:v7];
  }
LABEL_25:
  [v8 setAutoHyphenate:[self autoHyphenation]];
  [v8 setOptimizeLegibility:[self optimizeLegibility]];

  return v8;
}

- (void)storeDefaultStyle:(id)a3
{
  id v11 = a3;
  id v4 = [v11 fontFamily];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = BKStyleManagerLastFontKey;
    id v7 = [(BKStyleManager *)self languageSuffix];
    double v8 = +[NSString stringWithFormat:@"%@%@", v6, v7];

    uint64_t v9 = +[NSUserDefaults standardUserDefaults];
    int64_t v10 = [v11 fontFamily];
    [v9 setObject:v10 forKey:v8];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_22A038 == a6)
  {
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_AE894;
    v18[3] = &unk_1DD0D0;
    id v19 = v12;
    id v20 = v10;
    objc_copyWeak(&v21, &location);
    long long v13 = objc_retainBlock(v18);
    long long v14 = objc_retainBlock(v13);
    if (v14)
    {
      if (+[NSThread isMainThread])
      {
        v14[2](v14);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_AE954;
        block[3] = &unk_1DADC0;
        double v17 = v14;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKStyleManager;
    [(BKStyleManager *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)fontStateChanged:(id)a3
{
  id v4 = [a3 object];
  id v5 = _AEBookPluginsFontCacheLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    long long v13 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "StateChanged for font: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [v4 familyName];
  id v7 = [(BKStyleManager *)self font];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8 && ([v4 state] == 2 || objc_msgSend(v4, "state") == 4))
  {
    uint64_t v9 = [(BKStyleManager *)self _defaultFontName];
    id v10 = [(BKStyleManager *)self styleForFont:v9 presetIndex:0];

    id v11 = _AEBookPluginsFontCacheLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      long long v13 = v4;
      __int16 v14 = 2112;
      objc_super v15 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Setting fallback style for font: %@ to %@", (uint8_t *)&v12, 0x16u);
    }

    [(BKStyleManager *)self setStyle:v10];
  }
}

- (void)coordinator:(id)a3 observerDidIncreaseFontSize:(id)a4
{
  if ([(BKStyleManager *)self canIncreaseFontSize])
  {
    [(BKStyleManager *)self increaseFontSizeNotifyingCoordinator:0];
  }
}

- (void)coordinator:(id)a3 observerDidDecreaseFontSize:(id)a4
{
  if ([(BKStyleManager *)self canDecreaseFontSize])
  {
    [(BKStyleManager *)self decreaseFontSizeNotifyingCoordinator:0];
  }
}

- (NSString)language
{
  return self->_language;
}

- (ContentStyle)style
{
  return self->_style;
}

- (BOOL)autoHyphenation
{
  return self->_autoHyphenation;
}

- (BOOL)optimizeLegibility
{
  return self->_legibility;
}

- (NSString)languageSuffix
{
  return self->_languageSuffix;
}

- (void)setLanguageSuffix:(id)a3
{
}

- (BOOL)addedPresetFonts
{
  return self->_addedPresetFonts;
}

- (void)setAddedPresetFonts:(BOOL)a3
{
  self->_addedPresetFonts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageSuffix, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_style, 0);
}

@end