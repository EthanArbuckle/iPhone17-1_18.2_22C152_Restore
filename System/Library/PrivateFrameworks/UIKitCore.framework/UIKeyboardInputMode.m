@interface UIKeyboardInputMode
+ (BOOL)supportsSecureCoding;
+ (UIKeyboardInputMode)keyboardInputModeWithIdentifier:(id)a3;
+ (id)_displayNameForMultilingualSet:(id)a3 forDisplayInLists:(BOOL)a4 usingDeviceLanguage:(BOOL)a5 context:(int64_t)a6;
+ (id)autofillSignupInputMode;
+ (id)canonicalLanguageIdentifierFromIdentifier:(id)a3;
+ (id)dictationInputMode;
+ (id)hardwareLayoutFromIdentifier:(id)a3;
+ (id)intlInputMode;
+ (id)multilingualSetsFromInputModeIdentifiers:(id)a3;
+ (id)softwareLayoutFromIdentifier:(id)a3;
- (BOOL)defaultLayoutIsASCIICapable;
- (BOOL)extensionInputModeHasDictation;
- (BOOL)includeBarHeight;
- (BOOL)isAllowedForTraits:(id)a3;
- (BOOL)isDefaultRightToLeft;
- (BOOL)isDesiredForTraits:(id)a3;
- (BOOL)isDesiredForTraits:(id)a3 withExtended:(BOOL)a4;
- (BOOL)isDisplayed;
- (BOOL)isEmojiInputMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtensionInputMode;
- (BOOL)isHandwritingInputMode;
- (BOOL)isMultilingual;
- (BOOL)isMultilingualOnly;
- (BOOL)isMultiscript;
- (BOOL)isSpecializedInputMode;
- (BOOL)isStalledExtensionInputMode;
- (BOOL)showSWLayoutWithHWKeyboard;
- (BOOL)showsTransliterationCandidates;
- (BOOL)supportsEmojiSearch;
- (NSArray)multilingualLanguages;
- (NSArray)multilingualSet;
- (NSArray)multiscriptSet;
- (NSArray)normalizedIdentifierLevels;
- (NSBundle)containingBundle;
- (NSExtension)extension;
- (NSLocale)locale;
- (NSString)automaticHardwareLayout;
- (NSString)cachedSizeCategory;
- (NSString)containingBundleDisplayName;
- (NSString)defaultDictationLanguage;
- (NSString)dictationDisplayName;
- (NSString)dictationLanguage;
- (NSString)displayName;
- (NSString)hardwareLayout;
- (NSString)identifier;
- (NSString)identifierWithLayouts;
- (NSString)languageWithRegion;
- (NSString)monolingualDisplayName;
- (NSString)normalizedIdentifier;
- (NSString)primaryLanguage;
- (NSString)softwareLayout;
- (NSString)variant;
- (UIImage)cachedIcon;
- (UIKeyboardInputMode)initWithCoder:(id)a3;
- (UIKeyboardInputMode)initWithIdentifier:(id)a3;
- (double)languageIndicatorScale;
- (id)_fallbackIconLabel;
- (id)_iconLabelComponentsForMultilingualSet;
- (id)_iconLabelForMultilingualSet;
- (id)_iconLabelWithinMultiscriptSet;
- (id)_indicatorIconWithConfiguration:(id)a3;
- (id)cursorAccessoryIcon;
- (id)imageForInputModeLabel:(id)a3 secondaryIconLabel:(id)a4 artwork:(id)a5 withConfiguration:(id)a6;
- (id)indicatorIcon;
- (id)indicatorTextIcon;
- (id)largeCursorAccessoryIcon;
- (id)multilingualInputModeIdentifiers;
- (id)multilingualSetFromInputModeIdentifiers:(id)a3;
- (id)multiscriptInputModeIdentifiers;
- (unint64_t)cachedIconKey;
- (unint64_t)multilingualIndex;
- (unint64_t)multiscriptIndex;
- (void)_getIconLabel:(id *)a3 secondaryIconLabel:(id *)a4;
- (void)_getIconLabel:(id *)a3 secondaryIconLabel:(id *)a4 artwork:(id *)a5;
- (void)_getIconLabel:(id *)a3 secondaryIconLabel:(id *)a4 artwork:(id *)a5 inputModes:(id)a6;
- (void)dealloc;
- (void)drawStringInRect:(id)a3 inRect:(CGRect)a4 useSmallFont:(BOOL)a5 useCondensedFont:(BOOL)a6 scale:(double)a7;
- (void)encodeWithCoder:(id)a3;
- (void)preferencesControllerChanged:(id)a3;
- (void)setCachedIcon:(id)a3;
- (void)setCachedIconKey:(unint64_t)a3;
- (void)setCachedSizeCategory:(id)a3;
- (void)setDefaultDictationLanguage:(id)a3;
- (void)setDictationLanguage:(id)a3;
- (void)setExtensionInputModeHasDictation:(BOOL)a3;
- (void)setHardwareLayout:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsDisplayed:(BOOL)a3;
- (void)setLanguageWithRegion:(id)a3;
- (void)setLastUsedDictationLanguage;
- (void)setMultilingualLanguages:(id)a3;
- (void)setNormalizedIdentifier:(id)a3;
- (void)setPrimaryLanguage:(id)a3;
- (void)setSoftwareLayout:(id)a3;
- (void)setVariant:(id)a3;
@end

@implementation UIKeyboardInputMode

- (NSString)identifierWithLayouts
{
  v3 = [(UIKeyboardInputMode *)self identifier];
  v4 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v3);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIKeyboardInputMode *)self identifier];
  }
  v7 = v6;

  return (NSString *)v7;
}

- (id)multilingualInputModeIdentifiers
{
  v2 = [(UIKeyboardInputMode *)self identifier];
  v3 = +[UIKeyboardInputModeController multilingualSetForInputModeIdentifier:v2];

  return v3;
}

+ (UIKeyboardInputMode)keyboardInputModeWithIdentifier:(id)a3
{
  id v4 = a3;
  if (qword_1EB25A788 != -1) {
    dispatch_once(&qword_1EB25A788, &__block_literal_global_1156);
  }
  v5 = [(id)qword_1EB25A720 objectForKey:v4];
  if (!v5)
  {
    if ([v4 isEqualToString:@"dictation"])
    {
      id v6 = [a1 dictationInputMode];
    }
    else if ([v4 isEqualToString:@"autofillsignup"])
    {
      id v6 = [a1 autofillSignupInputMode];
    }
    else
    {
      v7 = +[UIKeyboardInputModeController sharedInputModeController];
      int v8 = [v7 identifierIsValidSystemInputMode:v4];

      if (v8) {
        v9 = UIKeyboardInputMode;
      }
      else {
        v9 = UIKeyboardExtensionInputMode;
      }
      id v6 = (void *)[[v9 alloc] initWithIdentifier:v4];
    }
    v5 = v6;
    if (v6)
    {
      v10 = (void *)qword_1EB25A720;
      v11 = [v6 identifier];
      [v10 setObject:v5 forKey:v11];
    }
    else
    {
      if (v4) {
        [(id)qword_1EB25A720 removeObjectForKey:v4];
      }
      v5 = 0;
    }
  }

  return (UIKeyboardInputMode *)v5;
}

- (UIKeyboardInputMode)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIKeyboardInputMode;
  v5 = [(UIKeyboardInputMode *)&v18 init];
  id v6 = v5;
  if (!v4)
  {
    v16 = v5;
    id v6 = 0;
    goto LABEL_7;
  }
  if (!v5)
  {
    v16 = 0;
    goto LABEL_7;
  }
  [(UIKeyboardInputMode *)v5 setIdentifier:v4];
  v7 = TIInputModeGetNormalizedIdentifier();
  [(UIKeyboardInputMode *)v6 setNormalizedIdentifier:v7];

  int v8 = TIInputModeGetLanguageWithRegion();
  [(UIKeyboardInputMode *)v6 setLanguageWithRegion:v8];

  v9 = TIInputModeGetVariant();
  [(UIKeyboardInputMode *)v6 setVariant:v9];

  v10 = +[UIKeyboardInputMode canonicalLanguageIdentifierFromIdentifier:v4];
  [(UIKeyboardInputMode *)v6 setPrimaryLanguage:v10];

  v11 = +[UIKeyboardInputMode softwareLayoutFromIdentifier:v4];
  [(UIKeyboardInputMode *)v6 setSoftwareLayout:v11];

  v12 = +[UIKeyboardInputModeController sharedInputModeController];
  v13 = [v12 inputModesWithoutHardwareSupport];
  v14 = [(UIKeyboardInputMode *)v6 normalizedIdentifier];
  char v15 = [v13 containsObject:v14];

  if ((v15 & 1) == 0)
  {
    v16 = +[UIKeyboardInputMode hardwareLayoutFromIdentifier:v4];
    [(UIKeyboardInputMode *)v6 setHardwareLayout:v16];
LABEL_7:
  }
  return v6;
}

- (void)setVariant:(id)a3
{
}

- (void)setSoftwareLayout:(id)a3
{
}

- (void)setPrimaryLanguage:(id)a3
{
}

- (void)setNormalizedIdentifier:(id)a3
{
}

- (void)setLanguageWithRegion:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

+ (id)softwareLayoutFromIdentifier:(id)a3
{
  v3 = TIInputModeGetComponentsFromIdentifier();
  id v4 = [v3 objectForKey:@"sw"];

  return v4;
}

+ (id)canonicalLanguageIdentifierFromIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = TIInputModeGetComponentsFromIdentifier();
    uint64_t v5 = *MEMORY[0x1E4F1C438];
    id v6 = [v4 objectForKey:*MEMORY[0x1E4F1C438]];
    uint64_t v7 = *MEMORY[0x1E4F1C470];
    int v8 = [v4 objectForKey:*MEMORY[0x1E4F1C470]];
    uint64_t v9 = *MEMORY[0x1E4F1C400];
    v10 = [v4 objectForKey:*MEMORY[0x1E4F1C400]];
    v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v6, v5, 0);
    v12 = v11;
    if (v8) {
      [v11 setObject:v8 forKey:v7];
    }
    if (v10) {
      [v12 setObject:v10 forKey:v9];
    }
    v13 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v12];
    v14 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)normalizedIdentifier
{
  return self->normalizedIdentifier;
}

- (BOOL)isExtensionInputMode
{
  return 0;
}

- (BOOL)isSpecializedInputMode
{
  return 0;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setHardwareLayout:(id)a3
{
}

+ (id)hardwareLayoutFromIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = TIInputModeGetComponentsFromIdentifier();
  uint64_t v5 = [v4 objectForKey:@"hw"];
  if (v5)
  {
    id v6 = (__CFString *)v5;
  }
  else
  {
    uint64_t v7 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v3);

    int v8 = TIInputModeGetComponentsFromIdentifier();

    uint64_t v9 = [v8 objectForKey:@"hw"];
    if (v9) {
      id v6 = (__CFString *)v9;
    }
    else {
      id v6 = @"US";
    }
    id v3 = (id)v7;
    id v4 = v8;
  }

  return v6;
}

- (NSString)languageWithRegion
{
  return self->_languageWithRegion;
}

- (BOOL)isMultilingual
{
  v2 = [(UIKeyboardInputMode *)self multilingualInputModeIdentifiers];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (NSArray)multilingualLanguages
{
  return self->_multilingualLanguages;
}

void __55__UIKeyboardInputMode_keyboardInputModeWithIdentifier___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)qword_1EB25A720;
  qword_1EB25A720 = (uint64_t)v0;
}

+ (id)dictationInputMode
{
  if (qword_1EB25A7B8 != -1) {
    dispatch_once(&qword_1EB25A7B8, &__block_literal_global_1167);
  }
  v2 = (void *)qword_1EB25A7B0;
  return v2;
}

void __41__UIKeyboardInputMode_dictationInputMode__block_invoke()
{
  id v0 = [(UIKeyboardInputMode *)[UIDictationInputMode alloc] initWithIdentifier:@"dictation"];
  v1 = (void *)qword_1EB25A7B0;
  qword_1EB25A7B0 = (uint64_t)v0;
}

- (void)dealloc
{
  [(UIKeyboardInputMode *)self setIdentifier:0];
  [(UIKeyboardInputMode *)self setNormalizedIdentifier:0];
  primaryLanguage = self->_primaryLanguage;
  self->_primaryLanguage = 0;

  languageWithRegion = self->_languageWithRegion;
  self->_languageWithRegion = 0;

  multilingualLanguages = self->_multilingualLanguages;
  self->_multilingualLanguages = 0;

  [(UIKeyboardInputMode *)self setSoftwareLayout:0];
  [(UIKeyboardInputMode *)self setHardwareLayout:0];
  cachedIcon = self->_cachedIcon;
  if (cachedIcon)
  {
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:*MEMORY[0x1E4FAEA28] object:0];

    cachedIcon = self->_cachedIcon;
  }
  self->_cachedIcon = 0;

  cachedSizeCategory = self->_cachedSizeCategory;
  self->_cachedSizeCategory = 0;

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardInputMode;
  [(UIKeyboardInputMode *)&v9 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIKeyboardInputMode *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      id v6 = [(UIKeyboardInputMode *)self identifier];
      uint64_t v7 = [(UIKeyboardInputMode *)v5 identifier];
      if ([v6 isEqualToString:v7])
      {
        int v8 = [(UIKeyboardInputMode *)self primaryLanguage];
        objc_super v9 = [(UIKeyboardInputMode *)v5 primaryLanguage];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (void)preferencesControllerChanged:(id)a3
{
}

- (void)setCachedIcon:(id)a3
{
  id v9 = a3;
  BOOL v5 = self->_cachedIcon == 0;
  objc_storeStrong((id *)&self->_cachedIcon, a3);
  cachedIcon = self->_cachedIcon;
  if (((v5 ^ (cachedIcon != 0)) & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v8 = v7;
    if (cachedIcon) {
      [v7 addObserver:self selector:sel_preferencesControllerChanged_ name:*MEMORY[0x1E4FAEA28] object:0];
    }
    else {
      [v7 removeObserver:self name:*MEMORY[0x1E4FAEA28] object:0];
    }
  }
}

+ (id)intlInputMode
{
  if (qword_1EB25A798 != -1) {
    dispatch_once(&qword_1EB25A798, &__block_literal_global_1159);
  }
  v2 = (void *)qword_1EB25A790;
  return v2;
}

void __36__UIKeyboardInputMode_intlInputMode__block_invoke()
{
  id v0 = [UIKeyboardInputMode alloc];
  UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(@"intl");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(UIKeyboardInputMode *)v0 initWithIdentifier:v3];
  v2 = (void *)qword_1EB25A790;
  qword_1EB25A790 = v1;
}

+ (id)autofillSignupInputMode
{
  if (qword_1EB25A7A8 != -1) {
    dispatch_once(&qword_1EB25A7A8, &__block_literal_global_1161);
  }
  v2 = (void *)qword_1EB25A7A0;
  return v2;
}

uint64_t __46__UIKeyboardInputMode_autofillSignupInputMode__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v0 = [(UIKeyboardInputMode *)[UISpecializedInputMode alloc] initWithIdentifier:@"autofillsignup"];
  uint64_t v1 = (void *)qword_1EB25A7A0;
  qword_1EB25A7A0 = (uint64_t)v0;

  v6[0] = 0;
  if (!qword_1EB25A7F0)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __SafariServicesLibraryCore_block_invoke_0;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E52F35E0;
    uint64_t v8 = 0;
    qword_1EB25A7F0 = _sl_dlopen();
  }
  if (!qword_1EB25A7F0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v5 = [NSString stringWithUTF8String:"void *SafariServicesLibrary(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"UIKeyboardInputModeController.m", 116, @"%s", v6[0]);

    __break(1u);
    goto LABEL_7;
  }
  v2 = v6[0];
  if (v6[0]) {
LABEL_7:
  }
    free(v2);
  return [(id)qword_1EB25A7A0 setViewControllerClass:NSClassFromString(&cfstr_Sfautomaticpas.isa)];
}

- (NSArray)normalizedIdentifierLevels
{
  v2 = [(UIKeyboardInputMode *)self identifier];
  id v3 = TIInputModeGetComponentsFromIdentifier();

  id v4 = TIInputModeGetNormalizedLevelsFromComponents();

  return (NSArray *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKeyboardInputMode *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(UIKeyboardInputMode *)self primaryLanguage];
  [v4 encodeObject:v6 forKey:@"primaryLanguage"];
}

- (UIKeyboardInputMode)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [(UIKeyboardInputMode *)self initWithIdentifier:v5];

  long long v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryLanguage"];

  if (v7)
  {
    uint64_t v8 = [(UIKeyboardInputMode *)v6 primaryLanguage];
    char v9 = [v8 isEqualToString:v7];

    if ((v9 & 1) == 0) {
      [(UIKeyboardInputMode *)v6 setPrimaryLanguage:v7];
    }
  }

  return v6;
}

- (BOOL)showSWLayoutWithHWKeyboard
{
  v2 = [(UIKeyboardInputMode *)self hardwareLayout];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSString)monolingualDisplayName
{
  v2 = [(UIKeyboardInputMode *)self identifier];
  BOOL v3 = UIKeyboardLocalizedInputModeName(v2);

  return (NSString *)v3;
}

+ (id)_displayNameForMultilingualSet:(id)a3 forDisplayInLists:(BOOL)a4 usingDeviceLanguage:(BOOL)a5 context:(int64_t)a6
{
  BOOL v60 = a5;
  BOOL v6 = a4;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 count] != 1
    || ([v7 firstObject],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v8], char v9 = objc_claimAutoreleasedReturnValue(), IsKoreanEnglishBilingual = UIKeyboardInputModeIsKoreanEnglishBilingual(v9), v9, v8, !IsKoreanEnglishBilingual))
  {
    BOOL v57 = v6;
    v58 = v7;
    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v14 = +[UIKeyboardInputModeController sharedInputModeController];
    char v15 = [v14 enabledInputModeIdentifiers];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v66 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = TIInputModeGetLanguage();
          v21 = TIInputModeGetNormalizedIdentifier();
          v22 = [v13 objectForKeyedSubscript:v20];
          if (!v22)
          {
            v22 = [MEMORY[0x1E4F1CA80] set];
            [v13 setObject:v22 forKeyedSubscript:v20];
          }
          [v22 addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v17);
    }

    v23 = [v58 firstObject];
    v24 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    v25 = TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();

    v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v25, "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v27 = v25;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v62 != v30) {
            objc_enumerationMutation(v27);
          }
          if ((TIInputModeIsMultilingualOnly() & 1) == 0)
          {
            v32 = TIInputModeGetLanguage();
            v33 = [v13 objectForKeyedSubscript:v32];
            unint64_t v34 = [v33 count];

            if (v34 >= 2)
            {
              uint64_t v35 = TIInputModeGetLanguageWithRegion();

              v32 = (void *)v35;
            }
            v36 = (void *)MEMORY[0x1E4F1CA20];
            if (v60)
            {
              v37 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
              v38 = [v36 localeWithLocaleIdentifier:v37];
            }
            else
            {
              v38 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v32];
            }
            v39 = [v38 localizedStringForLanguage:v32 context:a6];
            [v26 addObject:v39];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v29);
    }

    if (v60)
    {
      v40 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
    }
    else
    {
      v41 = [v27 firstObject];
      v40 = TIInputModeGetLanguageWithRegion();
    }
    id v7 = v58;
    if (v57)
    {
      if ([v26 count] == 2)
      {
        v42 = NSString;
        v43 = _UILocalizedStringWithDefaultValueInLanguage(@"%@ & %@", v40, @"%@ & %@");
        v44 = [v26 objectAtIndexedSubscript:0];
        v45 = [v26 objectAtIndexedSubscript:1];
        v46 = objc_msgSend(v42, "localizedStringWithFormat:", v43, v44, v45);

LABEL_37:
        goto LABEL_45;
      }
      v43 = _UILocalizedStringWithDefaultValueInLanguage(@", ", v40, @", ");
      uint64_t v48 = [v26 componentsJoinedByString:v43];
    }
    else
    {
      v43 = objc_opt_new();
      v47 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v40];
      [v43 setLocale:v47];

      uint64_t v48 = [v43 stringFromItems:v26];
    }
    v46 = (void *)v48;
    goto LABEL_37;
  }
  v11 = (void *)MEMORY[0x1E4F1CA20];
  if (v60)
  {
    v12 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  }
  else
  {
    v12 = @"ko";
  }
  v49 = [v11 localeWithLocaleIdentifier:v12];
  v13 = [v49 localizedStringForLanguage:@"ko" context:a6];

  if (v60)
  {

    v50 = (void *)MEMORY[0x1E4F1CA20];
    v51 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  }
  else
  {
    v50 = (void *)MEMORY[0x1E4F1CA20];
    v51 = @"en";
  }
  v52 = [v50 localeWithLocaleIdentifier:v51];
  v53 = [v52 localizedStringForLanguage:@"en" context:a6];

  if (v60) {
  v54 = NSString;
  }
  v55 = _UINSLocalizedStringWithDefaultValue(@"%@ & %@", @"%@ & %@");
  v46 = objc_msgSend(v54, "localizedStringWithFormat:", v55, v13, v53);

LABEL_45:
  return v46;
}

- (NSString)displayName
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    BOOL v3 = [(UIKeyboardInputMode *)self multilingualInputModeIdentifiers];
    if ((unint64_t)[v3 count] >= 2)
    {
      uint64_t v4 = [(id)objc_opt_class() _displayNameForMultilingualSet:v3 forDisplayInLists:1 usingDeviceLanguage:0 context:3];
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  if (UIKeyboardInputModeIsKoreanEnglishBilingual(self))
  {
    BOOL v5 = objc_opt_class();
    BOOL v6 = [(UIKeyboardInputMode *)self identifier];
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v8 = [v5 _displayNameForMultilingualSet:v7 forDisplayInLists:1 usingDeviceLanguage:0 context:3];

    goto LABEL_9;
  }
  uint64_t v4 = [(UIKeyboardInputMode *)self monolingualDisplayName];
LABEL_8:
  uint64_t v8 = (void *)v4;
LABEL_9:

  return (NSString *)v8;
}

- (NSLocale)locale
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!_os_feature_enabled_impl()) {
    goto LABEL_13;
  }
  BOOL v3 = [(UIKeyboardInputMode *)self multilingualInputModeIdentifiers];
  if ((unint64_t)[v3 count] <= 1)
  {

LABEL_13:
    v12 = [(UIKeyboardInputMode *)self normalizedIdentifier];
    goto LABEL_14;
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = TIInputModeGetNormalizedIdentifier();
        objc_msgSend(v4, "addObject:", v10, v15);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v11 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:v4];
  v12 = [v11 firstObject];

  if (!v12) {
    goto LABEL_13;
  }
LABEL_14:
  v13 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", v12, v15);

  return (NSLocale *)v13;
}

- (BOOL)isDefaultRightToLeft
{
  if ([(UIKeyboardInputMode *)self isEmojiInputMode]
    && (+[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController"), v3 = objc_claimAutoreleasedReturnValue(), [v3 inputModeThatInvokeEmoji], uint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, v3, v4))
  {
    id v5 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v6 = [v5 inputModeThatInvokeEmoji];
    uint64_t v7 = [v6 identifier];
    char IsDefaultRightToLeft = UIKeyboardInputModeIsDefaultRightToLeft(v7);
  }
  else
  {
    id v5 = [(UIKeyboardInputMode *)self identifier];
    char IsDefaultRightToLeft = UIKeyboardInputModeIsDefaultRightToLeft(v5);
  }

  return IsDefaultRightToLeft;
}

- (BOOL)defaultLayoutIsASCIICapable
{
  v2 = [(UIKeyboardInputMode *)self identifier];
  char IsASCIICapable = UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v2);

  return IsASCIICapable;
}

- (NSString)automaticHardwareLayout
{
  BOOL v3 = [(UIKeyboardInputMode *)self hardwareLayout];
  if ([v3 isEqualToString:@"Automatic"])
  {
    uint64_t v4 = +[UIKeyboardInputModeController sharedInputModeController];
    id v5 = [v4 hardwareLayoutToUseForInputMode:self];

    if (v5)
    {
      id v6 = v5;

      BOOL v3 = v6;
    }
  }
  return (NSString *)v3;
}

- (BOOL)isStalledExtensionInputMode
{
  return 0;
}

- (NSExtension)extension
{
  return 0;
}

- (NSBundle)containingBundle
{
  return 0;
}

- (NSString)containingBundleDisplayName
{
  return 0;
}

- (BOOL)includeBarHeight
{
  return 0;
}

- (BOOL)isEmojiInputMode
{
  BOOL v3 = [(UIKeyboardInputMode *)self primaryLanguage];
  if ([v3 isEqualToString:@"emoji"]) {
    BOOL v4 = ![(UIKeyboardInputMode *)self isExtensionInputMode];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)supportsEmojiSearch
{
  if ([(UIKeyboardInputMode *)self isExtensionInputMode]) {
    return 0;
  }
  BOOL v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = [(UIKeyboardInputMode *)self primaryLanguage];
  id v6 = [v4 localeWithLocaleIdentifier:v5];

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v7 = (void *)qword_1EB25A7F8;
  uint64_t v14 = qword_1EB25A7F8;
  if (!qword_1EB25A7F8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __getEMFEmojiSearchEngineClass_block_invoke;
    v10[3] = &unk_1E52D9900;
    v10[4] = &v11;
    __getEMFEmojiSearchEngineClass_block_invoke((uint64_t)v10);
    uint64_t v7 = (void *)v12[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);
  char v3 = [v8 isLocaleSupported:v6];

  return v3;
}

- (BOOL)isHandwritingInputMode
{
  v2 = [(UIKeyboardInputMode *)self normalizedIdentifier];
  char v3 = [v2 hasSuffix:@"HWR"];

  return v3;
}

- (BOOL)isAllowedForTraits:(id)a3
{
  id v5 = a3;
  id v6 = [(UIKeyboardInputMode *)self normalizedIdentifier];
  if (![(UIKeyboardInputMode *)self isEmojiInputMode])
  {
    if (![(UIKeyboardInputMode *)self isHandwritingInputMode]) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if ([v5 keyboardType] == 2 || objc_msgSend(v5, "keyboardType") == 123) {
    goto LABEL_4;
  }
  unsigned int v11 = [v5 keyboardType];
  BOOL v7 = 0;
  if ((v11 > 0xB || ((1 << v11) & 0x930) == 0) && v11 != 127)
  {
    if ([v5 keyboardType] == 13)
    {
LABEL_4:
      BOOL v7 = 0;
      goto LABEL_5;
    }
    if (+[UIKeyboard isMajelEnabled]
      && [v5 forceFloatingKeyboard])
    {
      char v3 = +[UIKeyboardImpl activeInstance];
      if (![v3 _shouldSuppressAssistantBar])
      {
        BOOL v7 = 0;
LABEL_45:

        goto LABEL_5;
      }
      int v12 = 1;
    }
    else
    {
      int v12 = 0;
    }
    if (_UIApplicationIsStickerPickerService()) {
      BOOL v7 = [v5 keyboardType] == 124;
    }
    else {
      BOOL v7 = 1;
    }
    if (v12) {
      goto LABEL_45;
    }
  }
LABEL_5:
  if ([(UIKeyboardInputMode *)self isHandwritingInputMode])
  {
LABEL_9:
    if ([v5 disableHandwritingKeyboard]) {
      goto LABEL_35;
    }
    id v8 = +[UIKeyboardImpl activeInstance];
    char v9 = [v8 _shouldSuppressSoftwareKeyboardByOneness];

    if ((v9 & 1) != 0
      || !+[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate])
    {
      goto LABEL_35;
    }
    goto LABEL_12;
  }
  if (!v7)
  {
LABEL_35:
    BOOL v14 = 0;
    goto LABEL_36;
  }
LABEL_12:
  if ([v5 isSecureTextEntry] && !UIKeyboardLayoutDefaultTypeForInputModeIsSecure(v6)
    || [v5 isCarPlayIdiom]
    && !_UIKeyboardInputModeDefaultLayoutIsCarPlayEnabled(self)
    || ([v5 keyboardType] == 1
     || [v5 keyboardType] == 11
     || [v5 keyboardType] == 127)
    && !UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapableExtended(v6))
  {
    goto LABEL_35;
  }
  if ([v5 keyboardType] == 4)
  {
    char v10 = +[UIDevice currentDevice];
    if ([v10 userInterfaceIdiom])
    {
    }
    else
    {
      char v13 = dyld_program_sdk_at_least();

      if ((v13 & 1) == 0 && !UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapableExtended(v6)) {
        goto LABEL_35;
      }
    }
  }
  BOOL v14 = [v5 keyboardType] != 122
     || [(UIKeyboardInputMode *)self supportsEmojiSearch];
LABEL_36:

  return v14;
}

- (BOOL)isDesiredForTraits:(id)a3
{
  return [(UIKeyboardInputMode *)self isDesiredForTraits:a3 withExtended:1];
}

- (BOOL)isDesiredForTraits:(id)a3 withExtended:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(UIKeyboardInputMode *)self normalizedIdentifier];
  if ([v6 isSecureTextEntry])
  {
    char IsSecure = UIKeyboardLayoutDefaultTypeForInputModeIsSecure(v7);
LABEL_10:
    BOOL v9 = IsSecure;
    goto LABEL_11;
  }
  if ([v6 isCarPlayIdiom])
  {
    char IsSecure = _UIKeyboardInputModeDefaultLayoutIsCarPlayEnabled(self);
    goto LABEL_10;
  }
  if (+[UITextInputTraits keyboardTypeRequiresASCIICapable:](UITextInputTraits, "keyboardTypeRequiresASCIICapable:", [v6 keyboardType]))
  {
    if (v4) {
      char IsSecure = UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapableExtended(v7);
    }
    else {
      char IsSecure = UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v7);
    }
    goto LABEL_10;
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (NSString)dictationDisplayName
{
  char v3 = [(UIKeyboardInputMode *)self dictationLanguage];
  BOOL v4 = UIKeyboardLocalizedDictationDisplayName(v3);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIKeyboardInputMode *)self extendedDisplayName];
  }
  BOOL v7 = v6;

  return (NSString *)v7;
}

- (NSString)dictationLanguage
{
  v2 = self;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  char v3 = [(UIKeyboardInputMode *)self languageWithRegion];
  BOOL v4 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = [(UIKeyboardInputMode *)v2 languageWithRegion];
  id v6 = [v4 defaultDictationLanguages:v5];

  BOOL v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v8 = [v7 preferencesActions];
  BOOL v9 = [v8 valueForPreferenceKey:@"DictationLanguagesLastUsed"];

  char v10 = [v9 objectForKey:@"LastUsedDictationLangauge"];
  if ([v6 count])
  {
    v47 = v10;
    unsigned int v11 = [(UIKeyboardInputMode *)v2 languageWithRegion];
    int v12 = [v9 objectForKey:v11];

    if (v12)
    {
      char v13 = +[UIKeyboardInputModeController sharedInputModeController];
      char v14 = [v13 isDictationLanguageEnabled:v12];

      if (v14)
      {
        char v10 = v47;
        goto LABEL_30;
      }
    }
    v46 = v9;
    long long v15 = +[UIKeyboardInputModeController sharedInputModeController];
    long long v16 = [v15 suggestedDictationLanguagesForDeviceLanguage];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v53 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if (v22)
          {
            if ([v6 containsObject:*(void *)(*((void *)&v52 + 1) + 8 * i)])
            {
              v23 = +[UIKeyboardInputModeController sharedInputModeController];
              char v24 = [v23 isDictationLanguageEnabled:v22];

              if (v24)
              {
                id v25 = v17;
LABEL_28:
                id v32 = v22;

                int v12 = v32;
                goto LABEL_29;
              }
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v57 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v25 = v6;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      v45 = v2;
      uint64_t v28 = *(void *)v49;
      while (2)
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v49 != v28) {
            objc_enumerationMutation(v25);
          }
          v22 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          uint64_t v30 = +[UIKeyboardInputModeController sharedInputModeController];
          char v31 = [v30 isDictationLanguageEnabled:v22];

          if (v31)
          {
            v2 = v45;
            goto LABEL_28;
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v27) {
          continue;
        }
        break;
      }
      v2 = v45;
    }
LABEL_29:

    BOOL v9 = v46;
    char v10 = v47;
    if (v12)
    {
LABEL_30:
      v33 = +[UIKeyboardInputModeController sharedInputModeController];
      char v34 = [v33 isDictationLanguageEnabled:v12];

      if (v34) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else
  {
    int v12 = v3;
    if (v3) {
      goto LABEL_30;
    }
  }
  int v12 = 0;
LABEL_31:
  id v35 = v10;

  int v12 = v35;
  if (!v35)
  {
LABEL_34:
    v40 = v10;
    v41 = +[UIKeyboardInputModeController sharedInputModeController];
    v42 = [v41 enabledDictationLanguages];
    v43 = [v42 firstObject];

    if (v43)
    {
      id v38 = v43;
      v39 = v38;
    }
    else
    {
      id v38 = [(UIKeyboardInputMode *)v2 languageWithRegion];
      v39 = 0;
    }
    char v10 = v40;
    goto LABEL_38;
  }
LABEL_32:
  v36 = +[UIKeyboardInputModeController sharedInputModeController];
  char v37 = [v36 isDictationLanguageEnabled:v12];

  if ((v37 & 1) == 0) {
    goto LABEL_34;
  }
  id v38 = v12;
  v39 = v38;
LABEL_38:

  return (NSString *)v38;
}

- (NSString)defaultDictationLanguage
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v3 = [(UIKeyboardInputMode *)self languageWithRegion];
  BOOL v4 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = [(UIKeyboardInputMode *)self languageWithRegion];
  id v6 = [v4 defaultDictationLanguages:v5];

  if ([v6 count])
  {
    BOOL v7 = +[UIKeyboardInputModeController sharedInputModeController];
    id v8 = [v7 suggestedDictationLanguagesForDeviceLanguage];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (v14
            && (objc_msgSend(v6, "containsObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17) & 1) != 0)
          {
            id v15 = v14;

            char v3 = v9;
            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v15 = [v6 firstObject];
LABEL_13:

    char v3 = v15;
  }

  return (NSString *)v3;
}

- (void)setDictationLanguage:(id)a3
{
  id v14 = a3;
  BOOL v4 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = [(UIKeyboardInputMode *)self languageWithRegion];
  id v6 = [v4 defaultDictationLanguages:v5];

  if ([v6 containsObject:v14])
  {
    BOOL v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v8 = [v7 preferencesActions];
    id v9 = [v8 valueForPreferenceKey:@"DictationLanguagesLastUsed"];
    id v10 = (id)[v9 mutableCopy];

    if (!v10) {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v11 = [(UIKeyboardInputMode *)self languageWithRegion];
    [v10 setObject:v14 forKey:v11];

    uint64_t v12 = +[UIKeyboardPreferencesController sharedPreferencesController];
    char v13 = [v12 preferencesActions];
    [v13 setLastUsedDictationLanguages:v10];
  }
}

- (void)setLastUsedDictationLanguage
{
  v2 = [(UIKeyboardInputMode *)self dictationLanguage];
  if (v2)
  {
    id v9 = v2;
    char v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    BOOL v4 = [v3 preferencesActions];
    id v5 = [v4 valueForPreferenceKey:@"DictationLanguagesLastUsed"];
    id v6 = (id)[v5 mutableCopy];

    if (!v6) {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    [v6 setObject:v9 forKey:@"LastUsedDictationLangauge"];
    BOOL v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v8 = [v7 preferencesActions];
    [v8 setLastUsedDictationLanguages:v6];

    v2 = v9;
  }
}

- (id)indicatorIcon
{
  char v3 = +[_UIKeyboardInputModeIconConfiguration defaultConfiguration];
  if (+[UIKeyboard isLanguageIndicatorEnabled]) {
    objc_msgSend(v3, "setSize:", 27.0, 20.0);
  }
  [(UIKeyboardInputMode *)self languageIndicatorScale];
  double v5 = v4;
  [v3 scaleFactor];
  [v3 setScaleFactor:v5 * v6];
  BOOL v7 = [(UIKeyboardInputMode *)self _indicatorIconWithConfiguration:v3];

  return v7;
}

- (id)indicatorTextIcon
{
  char v3 = +[_UIKeyboardInputModeIconConfiguration defaultConfiguration];
  [v3 setBackground:0];
  [(UIKeyboardInputMode *)self languageIndicatorScale];
  double v5 = v4;
  [v3 scaleFactor];
  [v3 setScaleFactor:v5 * v6];
  BOOL v7 = [(UIKeyboardInputMode *)self _indicatorIconWithConfiguration:v3];

  return v7;
}

- (id)cursorAccessoryIcon
{
  char v3 = +[_UIKeyboardInputModeIconConfiguration defaultConfiguration];
  [v3 setBackground:0];
  +[_UICursorAccessoryView defaultItemSize];
  [v3 setSize:v4 + -6.0];
  [v3 setWeight:6];
  double v5 = [(UIKeyboardInputMode *)self _indicatorIconWithConfiguration:v3];

  return v5;
}

- (id)largeCursorAccessoryIcon
{
  char v3 = +[_UIKeyboardInputModeIconConfiguration defaultConfiguration];
  [v3 setBackground:0];
  +[_UICursorAccessoryView largeItemSize];
  [v3 setSize:v4 + -6.0];
  [v3 setWeight:6];
  double v5 = [(UIKeyboardInputMode *)self _indicatorIconWithConfiguration:v3];

  return v5;
}

- (id)_iconLabelWithinMultiscriptSet
{
  id v6 = 0;
  char v3 = [(UIKeyboardInputMode *)self multiscriptInputModeIdentifiers];
  [(UIKeyboardInputMode *)self _getIconLabel:&v6 secondaryIconLabel:0 artwork:0 inputModes:v3];
  id v4 = v6;

  return v4;
}

- (id)_iconLabelComponentsForMultilingualSet
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v3 = [(UIKeyboardInputMode *)self normalizedIdentifier];
  char IsTransliteration = TIInputModeIsTransliteration();

  if (IsTransliteration)
  {
    double v5 = 0;
  }
  else if (UIKeyboardCurrentInputModeIsKoreanEnglishBilingual())
  {
    double v5 = &unk_1ED3EFE30;
  }
  else
  {
    id v6 = [(UIKeyboardInputMode *)self multilingualSet];
    if ((unint64_t)[v6 count] < 2)
    {
      double v5 = 0;
    }
    else
    {
      BOOL v7 = [(UIKeyboardInputMode *)self multilingualInputModeIdentifiers];
      double v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      long long v18 = [MEMORY[0x1E4F1CA48] array];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v8);
            }
            char v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            id v14 = objc_msgSend(v13, "normalizedIdentifier", v18);
            char v15 = TIInputModeIsTransliteration();

            if ((v15 & 1) == 0)
            {
              id v19 = 0;
              [v13 _getIconLabel:&v19 secondaryIconLabel:0 artwork:0 inputModes:v7];
              id v16 = v19;
              if ([v16 length]) {
                [v5 addObject:v16];
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v10);
      }
    }
  }
  return v5;
}

- (id)_iconLabelForMultilingualSet
{
  v2 = [(UIKeyboardInputMode *)self _iconLabelComponentsForMultilingualSet];
  char v3 = [v2 componentsJoinedByString:@" "];

  return v3;
}

- (id)_fallbackIconLabel
{
  char v3 = [(UIKeyboardInputMode *)self identifier];
  id v4 = UIKeyboardLocalizedString(@"UI-ABC", v3, 0, 0);
  double v5 = [v4 _firstGrapheme];

  if ([v5 isEqual:@"A"])
  {

    double v5 = 0;
  }
  id v6 = [(UIKeyboardInputMode *)self primaryLanguage];
  [v6 cStringUsingEncoding:4];
  uscript_getCode();
  if (v14 != 25 && v14 != 8) {
    goto LABEL_4;
  }
  id v8 = [(UIKeyboardInputMode *)self primaryLanguage];
  if ((unint64_t)[v8 length] >= 3)
  {
    uint64_t v9 = [v8 substringToIndex:2];

    id v8 = (void *)v9;
  }
  id v7 = [v8 uppercaseString];

  if (!v7)
  {
LABEL_4:
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v10 = [(UIKeyboardInputMode *)self identifier];
      uint64_t v11 = UIKeyboardLocalizedInputModeName(v10);
      id v7 = [v11 _firstGrapheme];
    }
  }
  id v12 = v7;

  return v12;
}

- (void)_getIconLabel:(id *)a3 secondaryIconLabel:(id *)a4
{
}

- (void)_getIconLabel:(id *)a3 secondaryIconLabel:(id *)a4 artwork:(id *)a5
{
  UIKeyboardGetActiveUniqueInputModesForHardwareKeyboard();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(UIKeyboardInputMode *)self _getIconLabel:a3 secondaryIconLabel:a4 artwork:a5 inputModes:v9];
}

- (void)_getIconLabel:(id *)a3 secondaryIconLabel:(id *)a4 artwork:(id *)a5 inputModes:(id)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  v43 = self;
  uint64_t v10 = [(UIKeyboardInputMode *)self identifier];
  UIKeyboardLocalizedObject(@"UI-IconLabel", v10, 0, 0, 0);
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = UIKeyboardLocalizedObject(@"UI-IconLabelScript", v10, 0, 0, 0);
  uint64_t v12 = UIKeyboardLocalizedObject(@"UI-IconLabelLanguage", v10, 0, 0, 0);
  uint64_t v13 = UIKeyboardLocalizedObject(@"UI-IconLabelLanguageVariant", v10, 0, 0, 0);
  long long v48 = UIKeyboardLocalizedObject(@"UI-IconArtworkShort", v10, 0, 0, 0);
  long long v49 = UIKeyboardLocalizedObject(@"UI-IconArtworkFull", v10, 0, 0, 0);
  long long v53 = (void *)v12;
  long long v54 = (void *)v11;
  if (v11) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v12 == 0;
  }
  long long v51 = (void *)v13;
  BOOL v15 = v14 && v13 == 0;
  v47 = a4;
  if (v15)
  {
    id v28 = 0;
    id v29 = 0;
    goto LABEL_29;
  }
  v44 = a5;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v42 = v9;
  id v16 = v9;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    int v52 = 0;
    char v19 = 0;
    uint64_t v20 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v60 != v20) {
          objc_enumerationMutation(v16);
        }
        long long v22 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", v22, v42) & 1) == 0)
        {
          long long v23 = v10;
          char v24 = UIKeyboardLocalizedObject(@"UI-IconLabelScript", v22, 0, 0, 0);
          uint64_t v25 = UIKeyboardLocalizedObject(@"UI-IconLabelLanguage", v22, 0, 0, 0);
          char v26 = [v54 isEqualToString:v24];
          if ([v53 isEqualToString:v25])
          {
            uint64_t v27 = UIKeyboardLocalizedObject(@"UI-IconLabelLanguageVariant", v22, 0, 0, 0);
            v52 |= [v51 isEqualToString:v27] ^ 1;
          }
          v19 |= v26;

          uint64_t v10 = v23;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v18);
  }
  else
  {
    LOBYTE(v52) = 0;
    char v19 = 0;
  }

  if ((v19 & 1) == 0 && v54)
  {
    id v30 = v54;

    id v28 = 0;
    id v29 = 0;
    id v50 = v30;
    id v9 = v42;
LABEL_27:
    a5 = v44;
LABEL_28:
    a4 = v47;
    goto LABEL_29;
  }
  id v9 = v42;
  if (v49)
  {
    id v28 = v49;
    id v29 = 0;
    goto LABEL_27;
  }
  a5 = v44;
  if ((v52 & 1) == 0)
  {
    if (v53)
    {
      id v41 = v53;

      id v28 = 0;
      id v29 = 0;
      id v50 = v41;
    }
    else
    {
      id v28 = 0;
      id v29 = 0;
    }
    goto LABEL_28;
  }
  if (v53)
  {
    id v40 = v53;

    id v50 = v40;
  }
  a4 = v47;
  id v29 = v51;
  id v28 = 0;
LABEL_29:
  if (v48)
  {
    id v31 = v48;

    if (v49)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v32 = v9;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        v45 = a5;
        uint64_t v35 = *(void *)v56;
        while (2)
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v56 != v35) {
              objc_enumerationMutation(v32);
            }
            char v37 = *(void **)(*((void *)&v55 + 1) + 8 * j);
            if ((objc_msgSend(v10, "isEqualToString:", v37, v42) & 1) == 0)
            {
              id v38 = UIKeyboardLocalizedObject(@"UI-IconArtworkShort", v37, 0, 0, 0);
              char v39 = [v31 isEqualToString:v38];

              if (v39)
              {

                id v32 = v31;
                id v31 = v49;
                goto LABEL_42;
              }
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v55 objects:v63 count:16];
          if (v34) {
            continue;
          }
          break;
        }
LABEL_42:
        a5 = v45;
      }
    }
    id v28 = v31;
    a4 = v47;
  }
  if (!v50)
  {
    id v50 = [(UIKeyboardInputMode *)v43 _fallbackIconLabel];
  }
  if (a3) {
    *a3 = v50;
  }
  if (a4) {
    *a4 = v29;
  }
  if (a5) {
    *a5 = v28;
  }
}

- (double)languageIndicatorScale
{
  if (qword_1EB25A7C8 != -1) {
    dispatch_once(&qword_1EB25A7C8, &__block_literal_global_1200);
  }
  v2 = [(id)UIApp preferredContentSizeCategory];
  char v3 = [(id)qword_1EB25A7C0 objectForKeyedSubscript:v2];
  id v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

void __45__UIKeyboardInputMode_languageIndicatorScale__block_invoke()
{
  v3[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UICTContentSizeCategoryL";
  v2[1] = @"UICTContentSizeCategoryXL";
  v3[0] = &unk_1ED3F1EB8;
  v3[1] = &unk_1ED3F1EC8;
  v2[2] = @"UICTContentSizeCategoryXXL";
  v2[3] = @"UICTContentSizeCategoryXXXL";
  v3[2] = &unk_1ED3F1ED8;
  v3[3] = &unk_1ED3F1EE8;
  v2[4] = @"UICTContentSizeCategoryAccessibilityM";
  v2[5] = @"UICTContentSizeCategoryAccessibilityL";
  v3[4] = &unk_1ED3F1EF8;
  v3[5] = &unk_1ED3F1F08;
  v2[6] = @"UICTContentSizeCategoryAccessibilityXL";
  v2[7] = @"UICTContentSizeCategoryAccessibilityXXL";
  v3[6] = &unk_1ED3F1F18;
  v3[7] = &unk_1ED3F1F28;
  v2[8] = @"UICTContentSizeCategoryAccessibilityXXXL";
  v3[8] = &unk_1ED3F1F38;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:9];
  uint64_t v1 = (void *)qword_1EB25A7C0;
  qword_1EB25A7C0 = v0;
}

- (id)_indicatorIconWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 hash];
  if ([v4 background])
  {
    double v6 = [(UIKeyboardInputMode *)self cachedIcon];
    if (v6 && [(UIKeyboardInputMode *)self cachedIconKey] == v5)
    {
      id v7 = [(UIKeyboardInputMode *)self cachedSizeCategory];
      id v8 = [(id)UIApp preferredContentSizeCategory];
      int v9 = [v7 isEqual:v8];

      if (v9)
      {
        uint64_t v10 = [(UIKeyboardInputMode *)self cachedIcon];
        goto LABEL_21;
      }
    }
    else
    {
    }
  }
  uint64_t v11 = [(UIKeyboardInputMode *)self identifier];
  int v12 = [v11 hasPrefix:@"emoji"];

  if (v12)
  {
    uint64_t v13 = +[UIKeyboard activeKeyboard];
    if ([v13 _lightStyleRenderConfig]) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }

    BOOL v15 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:v14];
    id v16 = v15;
    if (v15) {
      BOOL v15 = (void *)[v15 imageConfiguration];
    }
    id v17 = v15;

    uint64_t v18 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleFootnote" scale:-1];
    char v19 = [v17 configurationByApplyingConfiguration:v18];

    [v4 size];
    long long v21 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", [v4 weight], v20);
    long long v22 = [v19 configurationByApplyingConfiguration:v21];

    uint64_t v10 = +[UIImage _systemImageNamed:@"face.grinning" withConfiguration:v22];
    goto LABEL_19;
  }
  if ([(UIKeyboardInputMode *)self isMultilingual]
    && ([(UIKeyboardInputMode *)self identifier],
        long long v23 = objc_claimAutoreleasedReturnValue(),
        char v24 = UIKeyboardShowsTransliterationCandidatesForInputMode(),
        v23,
        (v24 & 1) == 0))
  {
    id v30 = [(UIKeyboardInputMode *)self _iconLabelComponentsForMultilingualSet];
    if ([v30 count] != 2)
    {

      uint64_t v25 = 0;
      id v27 = 0;
      long long v22 = @"A";
      goto LABEL_18;
    }
    long long v22 = [v30 objectAtIndexedSubscript:0];
    uint64_t v25 = [v30 objectAtIndexedSubscript:1];

    if (v22)
    {
      id v27 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }
  id v32 = 0;
  id v33 = 0;
  id v31 = 0;
  [(UIKeyboardInputMode *)self _getIconLabel:&v33 secondaryIconLabel:&v32 artwork:&v31];
  long long v22 = (__CFString *)v33;
  id v26 = v32;

  id v27 = v31;
  uint64_t v25 = v26;
LABEL_18:
  uint64_t v10 = [(UIKeyboardInputMode *)self imageForInputModeLabel:v22 secondaryIconLabel:v25 artwork:v27 withConfiguration:v4];

LABEL_19:
  if ([v4 background])
  {
    [(UIKeyboardInputMode *)self setCachedIcon:v10];
    [(UIKeyboardInputMode *)self setCachedIconKey:v5];
    id v28 = [(id)UIApp preferredContentSizeCategory];
    [(UIKeyboardInputMode *)self setCachedSizeCategory:v28];
  }
LABEL_21:

  return v10;
}

- (void)drawStringInRect:(id)a3 inRect:(CGRect)a4 useSmallFont:(BOOL)a5 useCondensedFont:(BOOL)a6 scale:(double)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double x = a4.origin.x;
  double y = a4.origin.y;
  double v10 = 12.0;
  if (a6) {
    double v10 = 9.5;
  }
  if (a5) {
    double v11 = 8.5;
  }
  else {
    double v11 = v10;
  }
  if (a5) {
    int v12 = (double *)off_1E52D6BD8;
  }
  else {
    int v12 = (double *)off_1E52D6C00;
  }
  v65[1] = *MEMORY[0x1E4F143B8];
  if (a6) {
    uint64_t v13 = (id *)off_1E52D6BB8;
  }
  else {
    uint64_t v13 = (id *)off_1E52D6BC8;
  }
  id v55 = a3;
  UICeilToScale(v11 * a7, 2.0);
  double v15 = v14;
  id v16 = *v13;
  uint64_t v64 = *(void *)off_1E52D6B98;
  v62[0] = *(void *)off_1E52D6C08;
  id v17 = [NSNumber numberWithDouble:*v12];
  v62[1] = *(void *)off_1E52D6BD0;
  v63[0] = v17;
  long long v54 = v16;
  v63[1] = v16;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
  v65[0] = v18;
  char v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:&v64 count:1];
  double v20 = [off_1E52D39C0 fontDescriptorWithFontAttributes:v19];

  long long v21 = 0;
  uint64_t v22 = *(void *)off_1E52D2040;
  double v51 = width;
  uint64_t v23 = 5;
  while (1)
  {
    char v24 = v21;
    uint64_t v25 = [off_1E52D39B8 fontWithDescriptor:v20 size:v15];
    id v26 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v60 = v22;
    long long v61 = v25;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    long long v21 = (void *)[v26 initWithString:v55 attributes:v27];

    [v21 size];
    double v29 = v28 / (width * 1.2);
    double v31 = v30 / (height * 1.2);
    if (v29 <= 1.0 && v31 <= 1.0) {
      break;
    }
    if (v29 < v31) {
      double v29 = v31;
    }
    UICeilToScale(v15 / v29, 2.0);
    if (v15 + -0.5 >= v33) {
      double v15 = v33;
    }
    else {
      double v15 = v15 + -0.5;
    }

    if (!--v23) {
      goto LABEL_24;
    }
  }

LABEL_24:
  uint64_t v34 = CTLineCreateWithAttributedString((CFAttributedStringRef)v21);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v34, 0x80uLL);
  double v50 = BoundsWithOptions.size.width;
  CGRect v67 = CTLineGetBoundsWithOptions(v34, 8uLL);
  double v49 = v67.origin.y;
  double v35 = v67.size.height;
  memset(&v59, 0, sizeof(v59));
  CGAffineTransformMakeScale(&v59, 1.0, -1.0);
  CGAffineTransform v57 = v59;
  double v36 = height;
  CGAffineTransformTranslate(&transform, &v57, 0.0, height);
  CGAffineTransform v59 = transform;
  CGAffineTransformInvert(&v56, &transform);
  double a = v56.a;
  double b = v56.b;
  double c = v56.c;
  double d = v56.d;
  double tx = v56.tx;
  double ty = v56.ty;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v44 = 0;
  }
  else {
    v44 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  double v45 = x + (v51 - v50) * 0.5;
  double v46 = y + v49 + (v36 + v35) * 0.5;
  CGFloat v47 = ty + v45 * b + v46 * d;
  CGFloat v48 = tx + v45 * a + v46 * c;
  CGContextSaveGState(v44);
  CGAffineTransform transform = v59;
  CGContextConcatCTM(v44, &transform);
  CGContextSetTextPosition(v44, v48, v47);
  CTLineDraw(v34, v44);
  CGContextRestoreGState(v44);
  CFRelease(v34);
}

- (id)imageForInputModeLabel:(id)a3 secondaryIconLabel:(id)a4 artwork:(id)a5 withConfiguration:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [(UIKeyboardInputMode *)self identifier];
  double v15 = UIKeyboardLocalizedObject(@"UI-IconLabelLanguageUsesCondensedFont", v14, 0, 0, 0);

  [v13 scaleFactor];
  double v17 = v16;
  [v13 size];
  double v19 = ceil(v17 * v18);
  [v13 size];
  double v21 = ceil(v17 * v20);
  if (+[UIKeyboard isLanguageIndicatorEnabled]
    && getTUIKeyboardInputModeIconRendererClass_0())
  {
    uint64_t v48 = 0;
    double v49 = &v48;
    uint64_t v50 = 0x2050000000;
    uint64_t v22 = (void *)getTUIKeyboardInputModeIconRendererConfigurationClass_softClass_0;
    uint64_t v51 = getTUIKeyboardInputModeIconRendererConfigurationClass_softClass_0;
    if (!getTUIKeyboardInputModeIconRendererConfigurationClass_softClass_0)
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __getTUIKeyboardInputModeIconRendererConfigurationClass_block_invoke_0;
      v47[3] = &unk_1E52D9900;
      v47[4] = &v48;
      __getTUIKeyboardInputModeIconRendererConfigurationClass_block_invoke_0((uint64_t)v47);
      uint64_t v22 = (void *)v49[3];
    }
    uint64_t v23 = v22;
    _Block_object_dispose(&v48, 8);
    id v24 = objc_alloc_init(v23);
    objc_msgSend(v24, "setSize:", v19, v21);
    +[_UICursorAccessoryView baseFontSize];
    objc_msgSend(v24, "setBaseFontSize:");
    objc_msgSend(v24, "setStyle:", objc_msgSend(v13, "background"));
    if (objc_opt_respondsToSelector())
    {
      uint64_t v25 = [(UIKeyboardInputMode *)self languageWithRegion];
      [v24 setLanguage:v25];
    }
    if (objc_opt_respondsToSelector()) {
      [v24 setArtwork:v12];
    }
    if ([(UIKeyboardInputMode *)self isMultilingual]) {
      [v24 setDetailLabelAlpha:1.0];
    }
    id v26 = objc_alloc_init((Class)getTUIKeyboardInputModeIconRendererClass_0());
    id v27 = [v26 imageForPrimaryLabel:v10 secondaryLabel:v11 withConfiguration:v24];
    double v28 = [v27 imageWithRenderingMode:2];
  }
  else
  {
    double v29 = ceil(v17 * 0.0);
    double v30 = v29 + v29;
    _UIGraphicsBeginImageContextWithOptions(0, 0, v19, v21, 2.0);
    GetContextStack(0);
    double v31 = v19 - (v29 + v29);
    double v32 = v21 - (v29 + v29);
    CGContextClear();
    if ([v13 background])
    {
      v53.origin.double x = v29;
      v53.origin.double y = v29;
      v53.size.double width = v31;
      v53.size.double height = v21 - v30;
      CGRect v54 = CGRectInset(v53, v17 * 1.5 * 0.5, v17 * 1.5 * 0.5);
      double v33 = +[UIBezierPath _continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:](UIBezierPath, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:", -1, 16, v54.origin.x, v54.origin.y, v54.size.width, v54.size.height, v17 * 5.0, v17 * 5.0);
      uint64_t v34 = +[UIColor blackColor];
      [v34 setStroke];

      [v33 setLineWidth:v17 * 1.5];
      [v33 stroke];
    }
    else
    {
      double v33 = +[UIColor whiteColor];
      [v33 setFill];
    }

    if (v11)
    {
      double v35 = v32 * 0.5 + -1.0;
      double v36 = v31 + -2.0;
      double v37 = v32 - (v35 + 1.0);
      -[UIKeyboardInputMode drawStringInRect:inRect:useSmallFont:useCondensedFont:scale:](self, "drawStringInRect:inRect:useSmallFont:useCondensedFont:scale:", v10, 1, v15 != 0, v29 + 1.0, v29 + 1.0, v36, v37, v17);
      double v38 = v29 + v35;
      char v39 = self;
      id v40 = v11;
      double v41 = v29 + 1.0;
      double v42 = v36;
      double v43 = v37;
      uint64_t v44 = 1;
      BOOL v45 = 0;
    }
    else
    {
      v55.origin.double x = v29;
      v55.origin.double y = v29;
      v55.size.double width = v31;
      v55.size.double height = v21 - v30;
      *(CGRect *)&double v41 = CGRectInset(v55, 2.0, 2.0);
      char v39 = self;
      id v40 = v10;
      uint64_t v44 = 0;
      BOOL v45 = v15 != 0;
    }
    -[UIKeyboardInputMode drawStringInRect:inRect:useSmallFont:useCondensedFont:scale:](v39, "drawStringInRect:inRect:useSmallFont:useCondensedFont:scale:", v40, v44, v45, v41, v38, v42, v43, v17);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    double v28 = [v24 imageWithRenderingMode:2];
  }

  return v28;
}

- (id)multiscriptInputModeIdentifiers
{
  v2 = [(UIKeyboardInputMode *)self identifier];
  id v3 = +[UIKeyboardInputModeController multilingualSetForInputModeIdentifier:v2];
  if ([v3 count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    uint64_t v5 = [v3 objectAtIndexedSubscript:0];
    [v4 addObject:v5];

    if ((unint64_t)[v3 count] >= 2)
    {
      unint64_t v6 = 1;
      do
      {
        id v7 = [v3 objectAtIndexedSubscript:v6];
        id v8 = TIInputModeGetNormalizedIdentifier();

        if ([&unk_1ED3EFE48 containsObject:v8])
        {
          int v9 = [v3 objectAtIndexedSubscript:v6];
          [v4 addObject:v9];
        }
        ++v6;
      }
      while (v6 < [v3 count]);
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (BOOL)isMultiscript
{
  v2 = [(UIKeyboardInputMode *)self multiscriptInputModeIdentifiers];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (BOOL)isMultilingualOnly
{
  v2 = [(UIKeyboardInputMode *)self identifier];
  IsMultilingualOnldouble y = TIInputModeIsMultilingualOnly();

  return IsMultilingualOnly;
}

- (unint64_t)multilingualIndex
{
  BOOL v3 = [(UIKeyboardInputMode *)self multilingualInputModeIdentifiers];
  id v4 = [(UIKeyboardInputMode *)self identifier];
  unint64_t v5 = [v3 indexOfObject:v4];

  return v5;
}

- (unint64_t)multiscriptIndex
{
  BOOL v3 = [(UIKeyboardInputMode *)self multiscriptInputModeIdentifiers];
  id v4 = [(UIKeyboardInputMode *)self identifier];
  unint64_t v5 = [v3 indexOfObject:v4];

  return v5;
}

- (NSArray)multilingualSet
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(UIKeyboardInputMode *)self identifier];
  BOOL v3 = +[UIKeyboardInputModeController multilingualSetForInputModeIdentifier:v2];

  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (id)multilingualSetFromInputModeIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIKeyboardInputMode *)self identifier];
  uint64_t v6 = TIInputModeGetMultilingualSetFromInputModes();

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (NSArray)multiscriptSet
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [(UIKeyboardInputMode *)self multiscriptInputModeIdentifiers];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = MEMORY[0x1E4F14500];
    *(void *)&long long v6 = 136315394;
    long long v14 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v12 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v11, v14, (void)v15);
        if (v12)
        {
          [v3 addObject:v12];
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v14;
          uint64_t v20 = "-[UIKeyboardInputMode multiscriptSet]";
          __int16 v21 = 2112;
          uint64_t v22 = v11;
          _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "%s: nil UIKeyboardInputMode for '%@'", buf, 0x16u);
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

+ (id)multilingualSetsFromInputModeIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = MEMORY[0x1E4F14500];
    *(void *)&long long v7 = 136315394;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v13 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v12, v17);
        if (v13)
        {
          if (([v4 containsObject:v13] & 1) == 0)
          {
            long long v14 = [v13 multilingualSetFromInputModeIdentifiers:v5];
            if ([v14 count])
            {
              long long v15 = [v14 firstObject];
              [v18 addObject:v15];

              [v4 addObjectsFromArray:v14];
            }
            else
            {
              [v18 addObject:v13];
              [v4 addObject:v13];
            }
          }
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v17;
          uint64_t v24 = "+[UIKeyboardInputMode multilingualSetsFromInputModeIdentifiers:]";
          __int16 v25 = 2112;
          uint64_t v26 = v12;
          _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "%s: nil UIKeyboardInputMode for '%@'", buf, 0x16u);
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v8);
  }

  return v18;
}

- (BOOL)showsTransliterationCandidates
{
  if ([(UIKeyboardInputMode *)self isMultiscript]) {
    return 1;
  }
  id v4 = [(UIKeyboardInputMode *)self identifier];
  char v5 = UIKeyboardShowsTransliterationCandidatesForInputMode();

  return v5;
}

- (NSString)softwareLayout
{
  return self->softwareLayout;
}

- (NSString)hardwareLayout
{
  return self->hardwareLayout;
}

- (BOOL)isDisplayed
{
  return self->isDisplayed;
}

- (void)setIsDisplayed:(BOOL)a3
{
  self->isDisplayedouble d = a3;
}

- (void)setMultilingualLanguages:(id)a3
{
}

- (NSString)variant
{
  return self->_variant;
}

- (BOOL)extensionInputModeHasDictation
{
  return self->_extensionInputModeHasDictation;
}

- (void)setExtensionInputModeHasDictation:(BOOL)a3
{
  self->_extensionInputModeHasDictation = a3;
}

- (void)setDefaultDictationLanguage:(id)a3
{
}

- (UIImage)cachedIcon
{
  return self->_cachedIcon;
}

- (unint64_t)cachedIconKey
{
  return self->_cachedIconKey;
}

- (void)setCachedIconKey:(unint64_t)a3
{
  self->_cachedIconKedouble y = a3;
}

- (NSString)cachedSizeCategory
{
  return self->_cachedSizeCategory;
}

- (void)setCachedSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSizeCategory, 0);
  objc_storeStrong((id *)&self->_cachedIcon, 0);
  objc_storeStrong((id *)&self->_defaultDictationLanguage, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_multilingualLanguages, 0);
  objc_storeStrong((id *)&self->hardwareLayout, 0);
  objc_storeStrong((id *)&self->softwareLayout, 0);
  objc_storeStrong((id *)&self->normalizedIdentifier, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->_languageWithRegion, 0);
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
}

@end