@interface TIInputMode
+ (TIInputMode)inputModeWithIdentifier:(id)a3;
+ (TIInputMode)inputModeWithIdentifier:(id)a3 isSiriMode:(BOOL)a4;
+ (TIInputMode)inputModeWithIdentifier:(id)a3 isSiriMode:(BOOL)a4 originalIdentifier:(id)a5;
- (BOOL)deletesByComposedCharacterSequence;
- (BOOL)doesComposeText;
- (BOOL)doesSupportInlineCompletion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSiriMode;
- (BOOL)preferredModelLocaleIsMultilingual;
- (BOOL)spaceAutocorrectionEnabled;
- (BOOL)supportsMultilingualKeyboard;
- (BOOL)supportsPrediction;
- (BOOL)typedStringLMRankingEnabled;
- (BOOL)wantsMultilingualUnionOVS;
- (Class)inputManagerClass;
- (Class)keyboardFeatureSpecializationClass;
- (Class)keyboardFeatureSpecializationClassFromInputModeProperties;
- (Class)multilingualInputManagerClass;
- (NSArray)additionalConfiguredLatinLanguages;
- (NSArray)allAccentKeyStrings;
- (NSDictionary)compositionMap;
- (NSDictionary)layoutTags;
- (NSDictionary)reverseCompositionMap;
- (NSLocale)locale;
- (NSString)autocorrectionLocaleIdentifier;
- (NSString)languageWithRegion;
- (NSString)nonstopPunctuationCharacters;
- (NSString)normalizedIdentifier;
- (NSString)originalIdentifier;
- (NSString)preferredModelLocaleIdentifier;
- (NSString)replacementForDoubleSpace;
- (NSString)sentenceDelimitingCharacters;
- (NSString)sentencePrefixingCharacters;
- (NSString)sentenceTrailingCharacters;
- (NSString)spaceDeletingCharacters;
- (NSString)variant;
- (NSString)wordMedialPunctuationCharacters;
- (TIInputMode)initWithNormalizedIdentifier:(id)a3;
- (TIInputMode)initWithNormalizedIdentifier:(id)a3 isSiriMode:(BOOL)a4;
- (id)description;
- (id)preferredMultilingualLanguageModelLocale;
- (unint64_t)hash;
- (void)setOriginalIdentifier:(id)a3;
- (void)setQuickTypeKeyboardFeatureSpecializationClass;
@end

@implementation TIInputMode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalIdentifier, 0);
  objc_storeStrong((id *)&self->_normalizedIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_variant, 0);

  objc_storeStrong((id *)&self->_languageWithRegion, 0);
}

- (void)setOriginalIdentifier:(id)a3
{
}

- (NSString)originalIdentifier
{
  return self->_originalIdentifier;
}

- (BOOL)isSiriMode
{
  return self->_isSiriMode;
}

- (NSString)normalizedIdentifier
{
  return self->_normalizedIdentifier;
}

- (BOOL)doesSupportInlineCompletion
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE6C0]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (NSString)autocorrectionLocaleIdentifier
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE650]];

  return (NSString *)v4;
}

- (NSString)spaceDeletingCharacters
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE728]];

  return (NSString *)v4;
}

- (NSString)wordMedialPunctuationCharacters
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE758]];

  return (NSString *)v4;
}

- (NSString)sentenceTrailingCharacters
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE710]];

  return (NSString *)v4;
}

- (NSString)sentenceDelimitingCharacters
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE700]];

  return (NSString *)v4;
}

- (NSString)sentencePrefixingCharacters
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE708]];

  return (NSString *)v4;
}

- (NSString)nonstopPunctuationCharacters
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE6E8]];

  return (NSString *)v4;
}

- (NSDictionary)reverseCompositionMap
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE6F8]];

  return (NSDictionary *)v4;
}

- (NSDictionary)compositionMap
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE668]];

  return (NSDictionary *)v4;
}

- (NSDictionary)layoutTags
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE6D8]];

  return (NSDictionary *)v4;
}

- (NSArray)allAccentKeyStrings
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE638]];

  return (NSArray *)v4;
}

- (BOOL)deletesByComposedCharacterSequence
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE688]];

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)doesComposeText
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE660]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (NSString)replacementForDoubleSpace
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();
  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE690]];

  return (NSString *)v4;
}

- (BOOL)typedStringLMRankingEnabled
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  v3 = TIGetInputModeProperties();

  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE740]];
  char v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)spaceAutocorrectionEnabled
{
  if (TIGetKeyboardDisableSpaceCorrectionsValue_onceToken != -1) {
    dispatch_once(&TIGetKeyboardDisableSpaceCorrectionsValue_onceToken, &__block_literal_global_145);
  }
  uint64_t v3 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v4 = [(id)v3 valueForPreferenceKey:@"KeyboardDisableSpaceCorrections"];

  LOBYTE(v3) = [v4 BOOLValue];
  if (v3) {
    return 0;
  }
  if (TIGetKeyboardForceSpaceCorrectionsValue_onceToken != -1) {
    dispatch_once(&TIGetKeyboardForceSpaceCorrectionsValue_onceToken, &__block_literal_global_156);
  }
  uint64_t v6 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v7 = [(id)v6 valueForPreferenceKey:@"KeyboardForceSpaceCorrections"];

  LOBYTE(v6) = [v7 BOOLValue];
  if (v6) {
    return 1;
  }
  v8 = [(TIInputMode *)self normalizedIdentifier];
  v9 = TIGetInputModeProperties();

  v10 = [v9 objectForKey:*MEMORY[0x1E4FAE720]];
  v11 = v10;
  if (v10) {
    char v5 = [v10 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)preferredMultilingualLanguageModelLocale
{
  v2 = [(TIInputMode *)self originalIdentifier];
  uint64_t v3 = TIInputModeGetPreferredMultilingualLanguageModelLocale();

  return v3;
}

- (BOOL)wantsMultilingualUnionOVS
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  uint64_t v3 = TIGetInputModeProperties();

  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE750]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)supportsMultilingualKeyboard
{
  v2 = [(TIInputMode *)self originalIdentifier];
  char v3 = TIInputModeSupportsMultilingual();

  return v3;
}

- (BOOL)supportsPrediction
{
  v2 = [(TIInputMode *)self normalizedIdentifier];
  char v3 = TIGetInputModeProperties();

  v4 = [v3 objectForKey:*MEMORY[0x1E4FAE6B0]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (Class)multilingualInputManagerClass
{
  Class multilingualInputManagerClass = self->_multilingualInputManagerClass;
  if (!multilingualInputManagerClass)
  {
    v4 = [(TIInputMode *)self normalizedIdentifier];
    char v5 = TIGetInputModeProperties();

    uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4FAE738]];
    int v7 = [v6 BOOLValue];

    if (v7
      && ([(objc_class *)[(TIInputMode *)self inputManagerClass] isSubclassOfClass:objc_opt_class()] & 1) == 0)
    {
      v8 = (objc_class *)objc_opt_class();
    }
    else
    {
      v8 = [(TIInputMode *)self inputManagerClass];
    }
    self->_Class multilingualInputManagerClass = v8;

    Class multilingualInputManagerClass = self->_multilingualInputManagerClass;
  }

  return multilingualInputManagerClass;
}

- (Class)keyboardFeatureSpecializationClass
{
  keyboardFeatureSpecializationClass = self->_keyboardFeatureSpecializationClass;
  if (!keyboardFeatureSpecializationClass)
  {
    keyboardFeatureSpecializationClass = [(TIInputMode *)self keyboardFeatureSpecializationClassFromInputModeProperties];
    self->_keyboardFeatureSpecializationClass = keyboardFeatureSpecializationClass;
    if (!keyboardFeatureSpecializationClass)
    {
      [(TIInputMode *)self supportsPrediction];
      keyboardFeatureSpecializationClass = (objc_class *)objc_opt_class();
      self->_keyboardFeatureSpecializationClass = keyboardFeatureSpecializationClass;
    }
  }

  return keyboardFeatureSpecializationClass;
}

- (Class)keyboardFeatureSpecializationClassFromInputModeProperties
{
  char v3 = [(TIInputMode *)self normalizedIdentifier];
  v4 = TIGetInputModeProperties();

  char v5 = [v4 objectForKey:*MEMORY[0x1E4FAE6D0]];
  Class v6 = NSClassFromString(v5);
  Class v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    v9 = [(TIInputMode *)self normalizedIdentifier];
    v10 = TIBundleForInputMode();

    Class v7 = (Class)[v10 classNamed:v5];
  }
  v11 = v7;

  return v11;
}

- (Class)inputManagerClass
{
  Class inputManagerClass = self->_inputManagerClass;
  if (!inputManagerClass)
  {
    v4 = [(TIInputMode *)self normalizedIdentifier];
    char v5 = TIGetInputModeProperties();

    if (!self->_inputManagerClass)
    {
      Class v6 = [v5 objectForKey:*MEMORY[0x1E4FAE6C8]];
      if (v6)
      {
        Class v7 = [(TIInputMode *)self normalizedIdentifier];
        BOOL v8 = TIBundleForInputMode();

        v9 = (objc_class *)[v8 classNamed:v6];
        self->_Class inputManagerClass = v9;
        if (!v9
          && (([v6 isEqualToString:@"TIKeyboardInputManagerTransliteration"] & 1) != 0
           || [v6 isEqualToString:@"TIKeyboardInputManagerIndic"]))
        {
          self->_Class inputManagerClass = (Class)objc_opt_class();
        }
      }
      if (!self->_inputManagerClass) {
        self->_Class inputManagerClass = (Class)objc_opt_class();
      }
    }

    Class inputManagerClass = self->_inputManagerClass;
  }

  return inputManagerClass;
}

- (NSArray)additionalConfiguredLatinLanguages
{
  char v3 = TIInputModeGetMultilingualID();

  if (v3)
  {
    v4 = TIInputModeGetMultilingualSet();
    char v5 = (void *)[v4 mutableCopy];

    [v5 removeObject:self->_originalIdentifier];
    Class v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1275];
    [v5 filterUsingPredicate:v6];
LABEL_8:

    goto LABEL_9;
  }
  Class v6 = TIInputModeGetNormalizedIdentifier();
  if (![v6 isEqualToString:@"ko_KR"])
  {
    char v5 = 0;
    goto LABEL_8;
  }
  Class v7 = TIInputModeGetSWLayout();
  int v8 = [v7 isEqualToString:@"Korean-With-QWERTY"];

  if (v8) {
    char v5 = &unk_1F3FA76D0;
  }
  else {
    char v5 = 0;
  }
LABEL_9:

  return (NSArray *)v5;
}

uint64_t __49__TIInputMode_additionalConfiguredLatinLanguages__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsString:@"Translit"] ^ 1;
}

- (BOOL)preferredModelLocaleIsMultilingual
{
  v2 = self;
  char v3 = [(TIInputMode *)self preferredModelLocaleIdentifier];
  v4 = [(TIInputMode *)v2 preferredMultilingualLanguageModelLocale];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (NSString)preferredModelLocaleIdentifier
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    char v5 = [(TIInputMode *)self locale];
    id v4 = [v5 localeIdentifier];
    goto LABEL_5;
  }
  char v3 = [(TIInputMode *)self preferredMultilingualLanguageModelLocale];
  if (v3)
  {
    id v4 = v3;
    char v5 = v4;
LABEL_5:
    Class v6 = v4;
    goto LABEL_7;
  }
  Class v7 = [(TIInputMode *)self locale];
  Class v6 = [v7 localeIdentifier];

  char v5 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (NSLocale)locale
{
  locale = self->_locale;
  if (!locale)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA20]);
    char v5 = [(TIInputMode *)self normalizedIdentifier];
    Class v6 = (NSLocale *)[v4 initWithLocaleIdentifier:v5];
    Class v7 = self->_locale;
    self->_locale = v6;

    locale = self->_locale;
  }

  return locale;
}

- (NSString)variant
{
  variant = self->_variant;
  if (!variant)
  {
    id v4 = [(TIInputMode *)self normalizedIdentifier];
    char v5 = TIInputModeGetVariant();
    Class v6 = (NSString *)[v5 copy];
    Class v7 = self->_variant;
    self->_variant = v6;

    variant = self->_variant;
  }

  return variant;
}

- (NSString)languageWithRegion
{
  languageWithRegion = self->_languageWithRegion;
  if (!languageWithRegion)
  {
    id v4 = [(TIInputMode *)self normalizedIdentifier];
    char v5 = TIInputModeGetLanguageWithRegion();
    Class v6 = (NSString *)[v5 copy];
    Class v7 = self->_languageWithRegion;
    self->_languageWithRegion = v6;

    languageWithRegion = self->_languageWithRegion;
  }

  return languageWithRegion;
}

- (id)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  char v5 = [(TIInputMode *)self normalizedIdentifier];
  Class v6 = [v3 stringWithFormat:@"<%@: %p identifier = %@>", v4, self, v5];;

  return v6;
}

- (unint64_t)hash
{
  char v3 = [(TIInputMode *)self normalizedIdentifier];
  uint64_t v4 = [v3 hash];

  BOOL v5 = [(TIInputMode *)self isSiriMode];
  uint64_t v6 = 81069269;
  if (v5) {
    uint64_t v6 = 16843009;
  }
  return v6 + v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TIInputMode *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      uint64_t v6 = [(TIInputMode *)self normalizedIdentifier];
      if ([v6 isEqualToString:@"ko_KR"])
      {
        Class v7 = [(TIInputMode *)self originalIdentifier];
        int v8 = TIInputModeGetSWLayout();
        v9 = [(TIInputMode *)v5 originalIdentifier];
        v10 = TIInputModeGetSWLayout();
        int v11 = [v8 isEqualToString:v10];

        if (!v11) {
          goto LABEL_10;
        }
      }
      else
      {
        v13 = [(TIInputMode *)self normalizedIdentifier];
        v14 = [(TIInputMode *)v5 normalizedIdentifier];
        char v15 = [v13 isEqualToString:v14];

        if ((v15 & 1) == 0) {
          goto LABEL_10;
        }
      }
      BOOL v16 = [(TIInputMode *)self isSiriMode];
      if (v16 == [(TIInputMode *)v5 isSiriMode])
      {
        v17 = [(TIInputMode *)self originalIdentifier];
        v18 = TIInputModeGetMultilingualID();
        v19 = [(TIInputMode *)v5 originalIdentifier];
        v20 = TIInputModeGetMultilingualID();
        BOOL v12 = v18 == v20;

        goto LABEL_12;
      }
LABEL_10:
      BOOL v12 = 0;
LABEL_12:

      goto LABEL_13;
    }
    BOOL v12 = 0;
  }
LABEL_13:

  return v12;
}

- (TIInputMode)initWithNormalizedIdentifier:(id)a3
{
  return [(TIInputMode *)self initWithNormalizedIdentifier:a3 isSiriMode:0];
}

- (TIInputMode)initWithNormalizedIdentifier:(id)a3 isSiriMode:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIInputMode;
  Class v7 = [(TIInputMode *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    normalizedIdentifier = v7->_normalizedIdentifier;
    v7->_normalizedIdentifier = (NSString *)v8;

    v7->_isSiriMode = a4;
  }

  return v7;
}

+ (TIInputMode)inputModeWithIdentifier:(id)a3 isSiriMode:(BOOL)a4 originalIdentifier:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (v6) {
    v9 = &inputModeWithIdentifier_isSiriMode_originalIdentifier__cachedSiriInputModes;
  }
  else {
    v9 = &inputModeWithIdentifier_isSiriMode_originalIdentifier__cachedInputModes;
  }
  v10 = (void *)*v9;
  if (!*v9)
  {
    uint64_t v11 = objc_opt_new();
    BOOL v12 = (void *)*v9;
    uint64_t *v9 = v11;

    v10 = (void *)*v9;
  }
  id v13 = v10;
  uint64_t v14 = [v13 objectForKey:v7];
  if (v14)
  {
    char v15 = (void *)v14;
    id v16 = v8;
  }
  else
  {
    v17 = TIInputModeGetNormalizedIdentifier();
    char v15 = [v13 objectForKey:v17];
    if (v8) {
      v18 = v8;
    }
    else {
      v18 = v7;
    }
    id v16 = v18;

    if (!v15
      || ([v15 originalIdentifier],
          id v19 = (id)objc_claimAutoreleasedReturnValue(),
          v19,
          v19 != v16))
    {
      v20 = [[TIInputMode alloc] initWithNormalizedIdentifier:v17 isSiriMode:v6];

      v21 = (void *)[v16 copy];
      [(TIInputMode *)v20 setOriginalIdentifier:v21];

      [v13 setObject:v20 forKey:v17];
      char v15 = v20;
    }
    [v13 setObject:v15 forKey:v7];
    if (v16 != v7) {
      [v13 setObject:v15 forKey:v16];
    }
  }

  return (TIInputMode *)v15;
}

+ (TIInputMode)inputModeWithIdentifier:(id)a3 isSiriMode:(BOOL)a4
{
  return (TIInputMode *)[a1 inputModeWithIdentifier:a3 isSiriMode:a4 originalIdentifier:0];
}

+ (TIInputMode)inputModeWithIdentifier:(id)a3
{
  return (TIInputMode *)[a1 inputModeWithIdentifier:a3 isSiriMode:0];
}

- (void)setQuickTypeKeyboardFeatureSpecializationClass
{
  if (!self->_keyboardFeatureSpecializationClass) {
    self->_keyboardFeatureSpecializationClass = (Class)objc_opt_class();
  }
}

@end