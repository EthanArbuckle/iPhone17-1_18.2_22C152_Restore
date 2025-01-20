@interface PRLanguage
+ (BOOL)supportsSecureCoding;
+ (id)arabicLanguages;
+ (id)cyrillicLanguages;
+ (id)dataBundle;
+ (id)devanagariLanguages;
+ (id)englishLocalizationAdditionForLanguage:(id)a3;
+ (id)fallbackLocalizationForLanguage:(id)a3;
+ (id)languageModelFallbackLocalizationForLanguage:(id)a3;
+ (id)languageModelLocalizationForLanguage:(id)a3;
+ (id)languageObjectWithIdentifier:(id)a3;
+ (id)languagesUsingOrdinalPeriod;
+ (id)languagesUsingSentencePieceModel;
+ (id)languagesUsingUnigramProbabilities;
+ (id)localizationForLanguage:(id)a3;
+ (id)localizationsForLanguage:(id)a3;
+ (id)spellingFallbackLocalizationForLanguage:(id)a3;
+ (id)supportedArabicLanguages;
+ (id)supportedAssetLanguages;
+ (id)supportedAssetLexiconLanguages;
+ (id)supportedCompletionLanguages;
+ (id)supportedCyrillicLanguages;
+ (id)supportedDevanagariLanguages;
+ (id)supportedEnglishLocalizationAdditions;
+ (id)supportedKeyboardLanguages;
+ (id)supportedLanguages;
+ (id)supportedLatinLanguages;
+ (id)supportedLocalizations;
+ (id)supportedNonLatinLanguages;
+ (id)supportedSingleCompletionLanguages;
+ (id)supportedSpellingFallbackLanguages;
+ (id)supportedTransliterationLanguages;
+ (id)textInputModeForLanguage:(id)a3;
+ (id)transliterationLocalizationForLanguage:(id)a3;
+ (unint64_t)orthographyIndexForLanguageCode:(unsigned __int8)a3;
+ (unint64_t)orthographyIndexForOtherLanguage:(id)a3;
+ (unsigned)encodingForOrthographyIndex:(unint64_t)a3;
+ (void)getCodesForLanguage:(id)a3 languageCode:(char *)a4 languageDialect:(char *)a5 languageMode:(char *)a6 orthographyIndex:(unint64_t *)a7 encoding:(unsigned int *)a8;
- (BOOL)isArabic;
- (BOOL)isBengali;
- (BOOL)isBicameral;
- (BOOL)isBulgarian;
- (BOOL)isCatalan;
- (BOOL)isCroatian;
- (BOOL)isCzech;
- (BOOL)isDanish;
- (BOOL)isDutch;
- (BOOL)isEnglish;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinnish;
- (BOOL)isFrench;
- (BOOL)isGerman;
- (BOOL)isGreek;
- (BOOL)isGujarati;
- (BOOL)isHebrew;
- (BOOL)isHindi;
- (BOOL)isHungarian;
- (BOOL)isIcelandic;
- (BOOL)isIndonesian;
- (BOOL)isIrishGaelic;
- (BOOL)isItalian;
- (BOOL)isKannada;
- (BOOL)isKazakh;
- (BOOL)isKorean;
- (BOOL)isLithuanian;
- (BOOL)isMalayalam;
- (BOOL)isMarathi;
- (BOOL)isNorwegian;
- (BOOL)isNynorsk;
- (BOOL)isPersian;
- (BOOL)isPolish;
- (BOOL)isPortuguese;
- (BOOL)isPunjabi;
- (BOOL)isRomanian;
- (BOOL)isRussian;
- (BOOL)isSlovak;
- (BOOL)isSlovenian;
- (BOOL)isSpanish;
- (BOOL)isSupportedAssetLexiconLanguage;
- (BOOL)isSupportedCompletionLanguage;
- (BOOL)isSupportedLatinLanguage;
- (BOOL)isSupportedSingleCompletionLanguage;
- (BOOL)isSwedish;
- (BOOL)isTamil;
- (BOOL)isTelugu;
- (BOOL)isThai;
- (BOOL)isTurkish;
- (BOOL)isUkrainian;
- (BOOL)isUrdu;
- (BOOL)isVietnamese;
- (BOOL)usesArabicScript;
- (BOOL)usesCyrillicScript;
- (BOOL)usesDevanagariScript;
- (BOOL)usesOrdinalPeriod;
- (BOOL)usesSentencePieceModel;
- (BOOL)usesUnigramProbabilities;
- (PRLanguage)initWithCoder:(id)a3;
- (PRLanguage)initWithIdentifier:(id)a3;
- (const)accents;
- (const)oneLetterWords;
- (const)twoLetterWords;
- (id)description;
- (id)fallbackLocalization;
- (id)identifier;
- (id)languageModelFallbackLocalization;
- (id)languageModelLocalization;
- (id)localization;
- (id)spellingFallbackLocalization;
- (id)transliterationLocalization;
- (unint64_t)hash;
- (unint64_t)orthographyIndex;
- (unsigned)encoding;
- (unsigned)languageCode;
- (unsigned)languageDialect;
- (unsigned)languageMode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRLanguage

+ (id)supportedKeyboardLanguages
{
  return &unk_26C1D3300;
}

+ (id)dataBundle
{
  id v2 = (id)_dataBundle;
  if (!_dataBundle)
  {
    id v2 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    _dataBundle = (uint64_t)v2;
  }
  return v2;
}

+ (id)localizationsForLanguage:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "dataBundle"), "localizations");
  if (([a3 isEqualToString:@"American English"] & 1) != 0
    || ([a3 isEqualToString:@"AmericanEnglish"] & 1) != 0)
  {
    a3 = @"en_US";
  }
  else if (([a3 isEqualToString:@"Australian English"] & 1) != 0 {
         || ([a3 isEqualToString:@"AustralianEnglish"] & 1) != 0)
  }
  {
    a3 = @"en_AU";
  }
  else if (([a3 isEqualToString:@"Canadian English"] & 1) != 0 {
         || ([a3 isEqualToString:@"CanadianEnglish"] & 1) != 0)
  }
  {
    a3 = @"en_CA";
  }
  else if (([a3 isEqualToString:@"British English"] & 1) != 0 {
         || ([a3 isEqualToString:@"BritishEnglish"] & 1) != 0)
  }
  {
    a3 = @"en_GB";
  }
  else if (([a3 isEqualToString:@"Indian English"] & 1) != 0 {
         || ([a3 isEqualToString:@"IndianEnglish"] & 1) != 0)
  }
  {
    a3 = @"en_IN";
  }
  else if (([a3 isEqualToString:@"Singapore English"] & 1) != 0 {
         || ([a3 isEqualToString:@"SingaporeEnglish"] & 1) != 0)
  }
  {
    a3 = @"en_SG";
  }
  else if (([a3 isEqualToString:@"Japanese English"] & 1) != 0 {
         || ([a3 isEqualToString:@"JapaneseEnglish"] & 1) != 0)
  }
  {
    a3 = @"en_JP";
  }
  else if (([a3 isEqualToString:@"Chinese English"] & 1) != 0 {
         || ([a3 isEqualToString:@"ChineseEnglish"] & 1) != 0)
  }
  {
    a3 = @"en_CN";
  }
  else if (([a3 isEqualToString:@"New Zealand English"] & 1) != 0 {
         || ([a3 isEqualToString:@"NewZealandEnglish"] & 1) != 0)
  }
  {
    a3 = @"en_NZ";
  }
  else if (([a3 isEqualToString:@"South African English"] & 1) != 0 {
         || ([a3 isEqualToString:@"SouthAfricanEnglish"] & 1) != 0)
  }
  {
    a3 = @"en_ZA";
  }
  else if (([a3 isEqualToString:@"Swiss German"] & 1) != 0 {
         || ([a3 isEqualToString:@"SwissGerman"] & 1) != 0)
  }
  {
    a3 = @"de_CH";
  }
  else if (([a3 isEqualToString:@"Brazilian Portuguese"] & 1) != 0 {
         || ([a3 isEqualToString:@"BrazilianPortuguese"] & 1) != 0)
  }
  {
    a3 = @"pt_BR";
  }
  else if (([a3 isEqualToString:@"European Portuguese"] & 1) != 0 {
         || ([a3 isEqualToString:@"EuropeanPortuguese"] & 1) != 0)
  }
  {
    a3 = @"pt_PT";
  }
  else if (([a3 isEqualToString:@"Norwegian Bokmål"] & 1) != 0 {
         || ([a3 isEqualToString:@"NorwegianBokmål"] & 1) != 0
  }
         || ([a3 isEqualToString:@"Bokmål"] & 1) != 0)
  {
    a3 = @"nb";
  }
  else if (([a3 isEqualToString:@"Norwegian Nynorsk"] & 1) != 0 {
         || ([a3 isEqualToString:@"NorwegianNynorsk"] & 1) != 0
  }
         || ([a3 isEqualToString:@"Nynorsk"] & 1) != 0)
  {
    a3 = @"nn";
  }
  else if (([a3 isEqualToString:@"Irish Gaelic"] & 1) != 0 {
         || [a3 isEqualToString:@"IrishGaelic"])
  }
  {
    a3 = @"ga";
  }
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObject:a3];
    v6 = (void *)[MEMORY[0x263F086E0] preferredLocalizationsFromArray:v4 forPreferences:v5];
    if (v6)
    {
      v7 = v6;
      if (![v6 count]
        || (objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 0), "isEqualToString:", @"English") & 1) == 0
        && !objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 0), "isEqualToString:", @"en"))
      {
        return v7;
      }
      if (([a3 isEqualToString:@"English"] & 1) != 0
        || ([a3 isEqualToString:@"en"] & 1) != 0
        || ([a3 hasPrefix:@"en_"] & 1) != 0
        || ([a3 hasPrefix:@"en-"] & 1) != 0)
      {
        return v7;
      }
    }
  }
  v9 = (void *)MEMORY[0x263EFF8C0];
  return (id)[v9 arrayWithObject:a3];
}

+ (id)localizationForLanguage:(id)a3
{
  if (localizationForLanguage__onceToken != -1) {
    dispatch_once(&localizationForLanguage__onceToken, &__block_literal_global_3);
  }
  id result = (id)[(id)localizationForLanguage__localizationDict objectForKey:a3];
  if (!result)
  {
    id result = (id)[a1 localizationsForLanguage:a3];
    if (result)
    {
      id v6 = result;
      id result = (id)[result count];
      if (result) {
        id result = (id)[v6 objectAtIndex:0];
      }
    }
  }
  if (!result) {
    return a3;
  }
  return result;
}

uint64_t __38__PRLanguage_localizationForLanguage___block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"English", @"en", @"en", @"en", @"en_US", @"en_GB", @"en_GB", @"en_CA", @"en_CA", @"en_AU", @"en_AU", @"en_IN", @"en_IN", @"en_SG", @"en_SG", @"en_JP", @"en_JP",
             @"en_CN",
             @"en_CN",
             @"en_NZ",
             @"en_NZ",
             @"en_ZA",
             @"en_ZA",
             @"fr",
             @"French",
             @"fr",
             @"fr",
             @"fr",
             @"fr_FR",
             @"fr",
             @"fr_CA",
             @"fr",
             @"fr_CH",
             @"de",
             @"German",
             @"de",
             @"de",
             @"de",
             @"de_DE",
             @"de",
             @"de_AT",
             @"de",
             @"de_CH",
             @"it",
             @"Italian",
             @"it",
             @"it",
             @"it",
             @"it_IT",
             @"es",
             @"Spanish",
             @"es",
             @"es",
             @"es",
             @"es_ES",
             @"es_MX",
             @"es_MX",
             @"pt_BR",
             @"Portuguese",
             @"pt_BR",
             @"pt");
  localizationForLanguage__localizationDict = result;
  return result;
}

+ (id)fallbackLocalizationForLanguage:(id)a3
{
  if (fallbackLocalizationForLanguage__onceToken != -1) {
    dispatch_once(&fallbackLocalizationForLanguage__onceToken, &__block_literal_global_593);
  }
  id result = (id)[(id)fallbackLocalizationForLanguage__localizationDict objectForKey:a3];
  if (!result)
  {
    id result = (id)[a1 localizationsForLanguage:a3];
    if (result)
    {
      id v6 = result;
      if ((unint64_t)[result count] < 2) {
        id result = 0;
      }
      else {
        id result = (id)[v6 objectAtIndex:1];
      }
    }
  }
  if (!result) {
    return a3;
  }
  return result;
}

uint64_t __46__PRLanguage_fallbackLocalizationForLanguage___block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"English", @"en", @"en", @"en", @"en_US", @"en", @"en_GB", @"en", @"en_CA", @"en", @"en_AU", @"en", @"en_IN", @"en", @"en_SG", @"en", @"en_JP",
             @"en",
             @"en_CN",
             @"en",
             @"en_NZ",
             @"en",
             @"en_ZA",
             @"fr",
             @"French",
             @"fr",
             @"fr",
             @"fr",
             @"fr_FR",
             @"fr",
             @"fr_CA",
             @"fr",
             @"fr_CH",
             @"de",
             @"German",
             @"de",
             @"de",
             @"de",
             @"de_DE",
             @"de",
             @"de_AT",
             @"de",
             @"de_CH",
             @"it",
             @"Italian",
             @"it",
             @"it",
             @"it",
             @"it_IT",
             @"es",
             @"Spanish",
             @"es",
             @"es",
             @"es",
             @"es_ES",
             @"es",
             @"es_MX",
             @"pt",
             @"Portuguese",
             @"pt",
             @"pt");
  fallbackLocalizationForLanguage__localizationDict = result;
  return result;
}

+ (id)languageModelLocalizationForLanguage:(id)a3
{
  if (languageModelLocalizationForLanguage__onceToken != -1) {
    dispatch_once(&languageModelLocalizationForLanguage__onceToken, &__block_literal_global_595);
  }
  id result = (id)[(id)languageModelLocalizationForLanguage__localizationDict objectForKey:a3];
  if (!result) {
    return a3;
  }
  return result;
}

uint64_t __51__PRLanguage_languageModelLocalizationForLanguage___block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"English", @"en_US", @"en", @"en_US", @"en_US", @"en_GB", @"en_GB", @"en_CA", @"en_CA", @"en_AU", @"en_AU", @"en_IN", @"en_IN", @"en_SG", @"en_SG", @"en_JP", @"en_JP",
             @"en_US",
             @"en_CN",
             @"en_NZ",
             @"en_NZ",
             @"en_ZA",
             @"en_ZA",
             @"fr_FR",
             @"French",
             @"fr_FR",
             @"fr",
             @"fr_FR",
             @"fr_FR",
             @"fr_CA",
             @"fr_CA",
             @"fr_CH",
             @"fr_CH",
             @"fr_BE",
             @"fr_BE",
             @"de",
             @"German",
             @"de",
             @"de",
             @"de",
             @"de_DE",
             @"de",
             @"de_AT",
             @"de",
             @"de_CH",
             @"it",
             @"Italian",
             @"it",
             @"it",
             @"it",
             @"it_IT",
             @"es_ES",
             @"Spanish",
             @"es_ES",
             @"es",
             @"es_ES",
             @"es_ES",
             @"es_MX",
             @"es_MX",
             @"pt_BR",
             @"Portuguese");
  languageModelLocalizationForLanguage__localizationDict = result;
  return result;
}

+ (id)languageModelFallbackLocalizationForLanguage:(id)a3
{
  if (languageModelFallbackLocalizationForLanguage__onceToken != -1) {
    dispatch_once(&languageModelFallbackLocalizationForLanguage__onceToken, &__block_literal_global_600);
  }
  id result = (id)[(id)languageModelFallbackLocalizationForLanguage__localizationDict objectForKey:a3];
  if (!result) {
    return a3;
  }
  return result;
}

uint64_t __59__PRLanguage_languageModelFallbackLocalizationForLanguage___block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"English", @"en", @"en", @"en", @"en_US", @"en", @"en_GB", @"en", @"en_CA", @"en", @"en_AU", @"en", @"en_IN", @"en", @"en_SG", @"en", @"en_JP",
             @"en",
             @"en_CN",
             @"en",
             @"en_NZ",
             @"en",
             @"en_ZA",
             @"fi",
             @"Finnish",
             @"fi",
             @"fi",
             @"fi",
             @"fi_FI",
             @"fr_FR",
             @"French",
             @"fr_FR",
             @"fr",
             @"fr_FR",
             @"fr_FR",
             @"fr_FR",
             @"fr_CA",
             @"fr_FR",
             @"fr_CH",
             @"de",
             @"German",
             @"de",
             @"de",
             @"de",
             @"de_DE",
             @"de",
             @"de_AT",
             @"de",
             @"de_CH",
             @"it",
             @"Italian",
             @"it",
             @"it",
             @"it",
             @"it_IT",
             @"es",
             @"Spanish",
             @"es",
             @"es",
             @"es",
             @"es_ES");
  languageModelFallbackLocalizationForLanguage__localizationDict = result;
  return result;
}

+ (id)textInputModeForLanguage:(id)a3
{
  if (textInputModeForLanguage__onceToken != -1) {
    dispatch_once(&textInputModeForLanguage__onceToken, &__block_literal_global_602);
  }
  id result = (id)[(id)textInputModeForLanguage__textInputModeDict objectForKey:a3];
  if (!result) {
    return a3;
  }
  return result;
}

uint64_t __39__PRLanguage_textInputModeForLanguage___block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"English", @"en_US", @"en", @"en_US", @"en_US", @"en_GB", @"en_GB", @"en_CA", @"en_CA", @"en_AU", @"en_AU", @"en_IN", @"en_IN", @"en_SG", @"en_SG", @"en_JP", @"en_JP",
             @"en_US",
             @"en_CN",
             @"en_NZ",
             @"en_NZ",
             @"en_ZA",
             @"en_ZA",
             @"fr_FR",
             @"French",
             @"fr_FR",
             @"fr",
             @"fr_FR",
             @"fr_FR",
             @"fr_CA",
             @"fr_CA",
             @"fr_CH",
             @"fr_CH",
             @"de_DE",
             @"German",
             @"de_DE",
             @"de",
             @"de_DE",
             @"de_DE",
             @"de_AT",
             @"de_AT",
             @"de_CH",
             @"de_CH",
             @"it_IT",
             @"Italian",
             @"it_IT",
             @"it",
             @"it_IT",
             @"it_IT",
             @"es_ES",
             @"Spanish",
             @"es_ES",
             @"es",
             @"es_ES",
             @"es_ES",
             @"es_MX",
             @"es_MX",
             @"pt_BR",
             @"Portuguese",
             @"pt_BR",
             @"pt");
  textInputModeForLanguage__textInputModeDict = result;
  return result;
}

+ (unint64_t)orthographyIndexForLanguageCode:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x24) {
    return 0;
  }
  else {
    return qword_20CC64A50[(char)(a3 - 1)];
  }
}

+ (unint64_t)orthographyIndexForOtherLanguage:(id)a3
{
  if (([a3 isEqualToString:@"Amharic"] & 1) != 0
    || ([a3 hasPrefix:@"am"] & 1) != 0)
  {
    return 244;
  }
  if (([a3 isEqualToString:@"Najdi Arabic"] & 1) != 0
    || ([a3 hasPrefix:@"ars"] & 1) != 0)
  {
    return 160;
  }
  if (([a3 isEqualToString:@"Armenian"] & 1) != 0
    || ([a3 hasPrefix:@"hy"] & 1) != 0)
  {
    return 226;
  }
  if (([a3 isEqualToString:@"Bengali"] & 1) != 0
    || ([a3 hasPrefix:@"bn"] & 1) != 0)
  {
    return 230;
  }
  if (([a3 isEqualToString:@"Burmese"] & 1) != 0
    || ([a3 isEqualToString:@"Myanmar"] & 1) != 0
    || ([a3 hasPrefix:@"my"] & 1) != 0)
  {
    return 242;
  }
  if (([a3 isEqualToString:@"Cherokee"] & 1) != 0
    || ([a3 hasPrefix:@"chr"] & 1) != 0)
  {
    return 245;
  }
  if (([a3 isEqualToString:@"Croatian"] & 1) != 0
    || ([a3 hasPrefix:@"hr"] & 1) != 0)
  {
    return 40;
  }
  if (([a3 isEqualToString:@"Georgian"] & 1) != 0
    || ([a3 hasPrefix:@"ka"] & 1) != 0)
  {
    return 243;
  }
  if (([a3 isEqualToString:@"Gujarati"] & 1) != 0
    || ([a3 hasPrefix:@"gu"] & 1) != 0)
  {
    return 232;
  }
  if (([a3 isEqualToString:@"Hindi"] & 1) != 0
    || ([a3 hasPrefix:@"hi"] & 1) != 0)
  {
    return 192;
  }
  if (([a3 isEqualToString:@"Icelandic"] & 1) != 0
    || ([a3 hasPrefix:@"is"] & 1) != 0)
  {
    return 18;
  }
  if (([a3 isEqualToString:@"Indonesian"] & 1) != 0
    || ([a3 hasPrefix:@"id"] & 1) != 0)
  {
    return 74;
  }
  if (([a3 isEqualToString:@"Inuktitut"] & 1) != 0
    || ([a3 hasPrefix:@"iu"] & 1) != 0)
  {
    return 208;
  }
  if (([a3 isEqualToString:@"Kannada"] & 1) != 0
    || ([a3 hasPrefix:@"kn"] & 1) != 0)
  {
    return 236;
  }
  if (([a3 isEqualToString:@"Kazakh"] & 1) != 0
    || ([a3 hasPrefix:@"kk"] & 1) != 0)
  {
    return 138;
  }
  if (([a3 isEqualToString:@"Khmer"] & 1) != 0
    || ([a3 hasPrefix:@"kh"] & 1) != 0)
  {
    return 247;
  }
  if (([a3 isEqualToString:@"Lao"] & 1) != 0
    || ([a3 hasPrefix:@"lo"] & 1) != 0)
  {
    return 240;
  }
  if (([a3 isEqualToString:@"Malayalam"] & 1) != 0
    || ([a3 hasPrefix:@"ml"] & 1) != 0)
  {
    return 237;
  }
  if (([a3 isEqualToString:@"Marathi"] & 1) != 0
    || ([a3 hasPrefix:@"mr"] & 1) != 0)
  {
    return 193;
  }
  if (([a3 isEqualToString:@"Mongolian"] & 1) != 0
    || ([a3 hasPrefix:@"mn"] & 1) != 0)
  {
    return 248;
  }
  if (([a3 isEqualToString:@"Norwegian Nynorsk"] & 1) != 0
    || ([a3 isEqualToString:@"NorwegianNynorsk"] & 1) != 0
    || ([a3 isEqualToString:@"Nynorsk"] & 1) != 0
    || ([a3 hasPrefix:@"nn"] & 1) != 0)
  {
    return 16;
  }
  if (([a3 isEqualToString:@"Oriya"] & 1) != 0
    || ([a3 hasPrefix:@"or"] & 1) != 0)
  {
    return 233;
  }
  if (([a3 isEqualToString:@"Persian"] & 1) != 0
    || ([a3 isEqualToString:@"Farsi"] & 1) != 0
    || ([a3 hasPrefix:@"fa"] & 1) != 0)
  {
    return 161;
  }
  if (([a3 isEqualToString:@"Punjabi"] & 1) != 0
    || ([a3 hasPrefix:@"pa"] & 1) != 0)
  {
    return 231;
  }
  if (([a3 isEqualToString:@"Sinhalese"] & 1) != 0
    || ([a3 hasPrefix:@"si"] & 1) != 0)
  {
    return 238;
  }
  if (([a3 isEqualToString:@"Slovak"] & 1) != 0
    || ([a3 hasPrefix:@"sk"] & 1) != 0)
  {
    return 46;
  }
  if (([a3 isEqualToString:@"Tamil"] & 1) != 0
    || ([a3 hasPrefix:@"ta"] & 1) != 0)
  {
    return 234;
  }
  if (([a3 isEqualToString:@"Telugu"] & 1) != 0
    || ([a3 hasPrefix:@"te"] & 1) != 0)
  {
    return 235;
  }
  if (([a3 isEqualToString:@"Tibetan"] & 1) != 0
    || ([a3 hasPrefix:@"bo"] & 1) != 0)
  {
    return 241;
  }
  if (([a3 isEqualToString:@"Ukrainian"] & 1) != 0
    || ([a3 hasPrefix:@"uk"] & 1) != 0)
  {
    return 129;
  }
  if (([a3 isEqualToString:@"Urdu"] & 1) != 0
    || [a3 hasPrefix:@"ur"])
  {
    return 162;
  }
  return 0;
}

+ (unsigned)encodingForOrthographyIndex:(unint64_t)a3
{
  unsigned int result = 1280;
  if ((uint64_t)a3 > 47)
  {
    if ((uint64_t)a3 <= 73)
    {
      if (a3 == 48) {
        return result;
      }
      if (a3 == 55) {
        return 1284;
      }
    }
    else
    {
      if (a3 == 74) {
        return result;
      }
      if (a3 == 128 || a3 == 130) {
        return 517;
      }
    }
    return 134217984;
  }
  switch(a3)
  {
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x16uLL:
    case 0x22uLL:
      return result;
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
      unsigned int result = 514;
      break;
    default:
      return 134217984;
  }
  return result;
}

+ (void)getCodesForLanguage:(id)a3 languageCode:(char *)a4 languageDialect:(char *)a5 languageMode:(char *)a6 orthographyIndex:(unint64_t *)a7 encoding:(unsigned int *)a8
{
  if (([a3 isEqualToString:@"English"] & 1) != 0
    || ([a3 isEqualToString:@"en"] & 1) != 0
    || ([a3 isEqualToString:@"American English"] & 1) != 0
    || ([a3 isEqualToString:@"AmericanEnglish"] & 1) != 0
    || ([a3 hasPrefix:@"en_US"] & 1) != 0
    || ([a3 hasPrefix:@"en-US"] & 1) != 0)
  {
    goto LABEL_7;
  }
  if (([a3 isEqualToString:@"Indian English"] & 1) != 0
    || ([a3 isEqualToString:@"IndianEnglish"] & 1) != 0
    || ([a3 hasPrefix:@"en_IN"] & 1) != 0
    || ([a3 isEqualToString:@"Singapore English"] & 1) != 0
    || ([a3 isEqualToString:@"SingaporeEnglish"] & 1) != 0
    || ([a3 hasPrefix:@"en_SG"] & 1) != 0)
  {
LABEL_28:
    char v16 = 0;
    char v15 = 64;
    goto LABEL_8;
  }
  if (([a3 isEqualToString:@"Japanese English"] & 1) != 0
    || ([a3 isEqualToString:@"JapaneseEnglish"] & 1) != 0
    || ([a3 hasPrefix:@"en_JP"] & 1) != 0
    || ([a3 isEqualToString:@"Chinese English"] & 1) != 0
    || ([a3 isEqualToString:@"ChineseEnglish"] & 1) != 0
    || ([a3 hasPrefix:@"en_CN"] & 1) != 0)
  {
    goto LABEL_7;
  }
  if (([a3 isEqualToString:@"Australian English"] & 1) != 0
    || ([a3 isEqualToString:@"AustralianEnglish"] & 1) != 0
    || ([a3 hasPrefix:@"en_AU"] & 1) != 0
    || ([a3 hasPrefix:@"en-AU"] & 1) != 0)
  {
    goto LABEL_28;
  }
  if (([a3 isEqualToString:@"Canadian English"] & 1) != 0
    || ([a3 isEqualToString:@"CanadianEnglish"] & 1) != 0
    || ([a3 hasPrefix:@"en_CA"] & 1) != 0
    || ([a3 hasPrefix:@"en-CA"] & 1) != 0)
  {
    char v16 = 0;
    char v15 = 32;
    goto LABEL_8;
  }
  if (([a3 isEqualToString:@"New Zealand English"] & 1) != 0
    || ([a3 isEqualToString:@"NewZealandEnglish"] & 1) != 0
    || ([a3 hasPrefix:@"en_NZ"] & 1) != 0
    || ([a3 isEqualToString:@"South African English"] & 1) != 0
    || ([a3 isEqualToString:@"SouthAfricanEnglish"] & 1) != 0
    || ([a3 hasPrefix:@"en_ZA"] & 1) != 0
    || ([a3 isEqualToString:@"British English"] & 1) != 0
    || ([a3 isEqualToString:@"BritishEnglish"] & 1) != 0
    || ([a3 hasPrefix:@"en"] & 1) != 0)
  {
    goto LABEL_28;
  }
  if ([a3 hasPrefix:@"en"])
  {
LABEL_7:
    char v15 = 0;
    char v16 = 0;
LABEL_8:
    uint64_t v17 = 16;
    goto LABEL_9;
  }
  if (([a3 isEqualToString:@"Swiss German"] & 1) != 0
    || ([a3 isEqualToString:@"SwissGerman"] & 1) != 0
    || ([a3 hasPrefix:@"de_CH"] & 1) != 0)
  {
    char v16 = 0;
    char v15 = 64;
LABEL_58:
    uint64_t v17 = 6;
    goto LABEL_9;
  }
  if (([a3 isEqualToString:@"German"] & 1) != 0
    || ([a3 hasPrefix:@"de"] & 1) != 0)
  {
    char v16 = 0;
    char v15 = 0x80;
    goto LABEL_58;
  }
  if (([a3 isEqualToString:@"Brazilian Portuguese"] & 1) != 0
    || ([a3 isEqualToString:@"BrazilianPortuguese"] & 1) != 0
    || ([a3 hasPrefix:@"pt_BR"] & 1) != 0
    || ([a3 hasPrefix:@"pt-BR"] & 1) != 0)
  {
    char v16 = 0;
    char v15 = 64;
LABEL_67:
    uint64_t v17 = 12;
    goto LABEL_9;
  }
  if (([a3 isEqualToString:@"European Portuguese"] & 1) != 0
    || ([a3 isEqualToString:@"EuropeanPortuguese"] & 1) != 0
    || ([a3 hasPrefix:@"pt_PT"] & 1) != 0
    || ([a3 hasPrefix:@"pt-PT"] & 1) != 0
    || ([a3 isEqualToString:@"Portuguese"] & 1) != 0
    || ([a3 hasPrefix:@"pt"] & 1) != 0)
  {
    char v16 = 0;
    char v15 = 0x80;
    goto LABEL_67;
  }
  if (([a3 isEqualToString:@"Arabic"] & 1) != 0
    || ([a3 hasPrefix:@"ar"] & 1) != 0)
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 20;
  }
  else if (([a3 isEqualToString:@"Bulgarian"] & 1) != 0 {
         || ([a3 hasPrefix:@"bg"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 25;
  }
  else if (([a3 isEqualToString:@"Catalan"] & 1) != 0 {
         || ([a3 hasPrefix:@"ca"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0x80;
    uint64_t v17 = 3;
  }
  else if (([a3 isEqualToString:@"Czech"] & 1) != 0 {
         || ([a3 hasPrefix:@"cs"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 1;
  }
  else if (([a3 isEqualToString:@"Danish"] & 1) != 0 {
         || ([a3 hasPrefix:@"da"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 10;
  }
  else if (([a3 isEqualToString:@"Dutch"] & 1) != 0 {
         || ([a3 hasPrefix:@"nl"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 11;
  }
  else if (([a3 isEqualToString:@"Finnish"] & 1) != 0 {
         || ([a3 hasPrefix:@"fi"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 14;
  }
  else if (([a3 isEqualToString:@"French"] & 1) != 0 {
         || ([a3 hasPrefix:@"fr"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 96;
    uint64_t v17 = 5;
  }
  else if (([a3 isEqualToString:@"Greek"] & 1) != 0 {
         || ([a3 hasPrefix:@"el"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 15;
  }
  else if (([a3 isEqualToString:@"Hebrew"] & 1) != 0 {
         || ([a3 hasPrefix:@"he"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 22;
  }
  else if (([a3 isEqualToString:@"Hungarian"] & 1) != 0 {
         || ([a3 hasPrefix:@"hu"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 4;
  }
  else if (([a3 isEqualToString:@"Italian"] & 1) != 0 {
         || ([a3 hasPrefix:@"it"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 9;
  }
  else if (([a3 isEqualToString:@"Korean"] & 1) != 0 {
         || ([a3 hasPrefix:@"ko"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 29;
  }
  else if (([a3 isEqualToString:@"Norwegian"] & 1) != 0 {
         || ([a3 isEqualToString:@"Norwegian Nynorsk"] & 1) != 0
  }
         || ([a3 isEqualToString:@"NorwegianNynorsk"] & 1) != 0
         || ([a3 isEqualToString:@"Nynorsk"] & 1) != 0
         || ([a3 hasPrefix:@"nb"] & 1) != 0)
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 13;
  }
  else if (([a3 isEqualToString:@"Polish"] & 1) != 0 {
         || ([a3 hasPrefix:@"pl"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 18;
  }
  else if (([a3 isEqualToString:@"Russian"] & 1) != 0 {
         || ([a3 hasPrefix:@"ru"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0x80;
    uint64_t v17 = 2;
  }
  else if (([a3 isEqualToString:@"Spanish"] & 1) != 0 {
         || ([a3 hasPrefix:@"es"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 64;
    uint64_t v17 = 8;
  }
  else if (([a3 isEqualToString:@"Swedish"] & 1) != 0 {
         || ([a3 hasPrefix:@"sv"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 7;
  }
  else if (([a3 isEqualToString:@"Thai"] & 1) != 0 {
         || ([a3 hasPrefix:@"th"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 35;
  }
  else if (([a3 isEqualToString:@"Turkish"] & 1) != 0 {
         || ([a3 hasPrefix:@"tr"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 28;
  }
  else if (([a3 isEqualToString:@"Vietnamese"] & 1) != 0 {
         || ([a3 hasPrefix:@"vi"] & 1) != 0)
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 36;
  }
  else if (([a3 isEqualToString:@"Irish Gaelic"] & 1) != 0 {
         || ([a3 isEqualToString:@"IrishGaelic"] & 1) != 0
  }
         || ([a3 isEqualToString:@"Gaelic"] & 1) != 0
         || ([a3 hasPrefix:@"ga"] & 1) != 0)
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 21;
  }
  else if (([a3 isEqualToString:@"Romanian"] & 1) != 0 {
         || [a3 hasPrefix:@"ro"])
  }
  {
    char v15 = 0;
    char v16 = 0;
    uint64_t v17 = 34;
  }
  else
  {
    uint64_t v17 = 0;
    char v15 = 0;
    char v16 = 0;
  }
LABEL_9:
  unint64_t v18 = [a1 orthographyIndexForLanguageCode:v17];
  if (!v18) {
    unint64_t v18 = [a1 orthographyIndexForOtherLanguage:a3];
  }
  if (a4) {
    *a4 = v17;
  }
  if (a5) {
    *a5 = v15;
  }
  if (a6) {
    *a6 = v16;
  }
  if (a7) {
    *a7 = v18;
  }
  if (a8) {
    *a8 = [a1 encodingForOrthographyIndex:v18];
  }
}

+ (id)supportedLanguages
{
  return &unk_26C1D32E8;
}

+ (id)supportedAssetLanguages
{
  return &unk_26C1D3318;
}

+ (id)supportedLocalizations
{
  return &unk_26C1D3330;
}

+ (id)supportedAssetLexiconLanguages
{
  return &unk_26C1D3348;
}

+ (id)supportedCompletionLanguages
{
  return &unk_26C1D3360;
}

+ (id)supportedSingleCompletionLanguages
{
  return &unk_26C1D3378;
}

+ (id)supportedLatinLanguages
{
  return &unk_26C1D3390;
}

+ (id)supportedNonLatinLanguages
{
  return &unk_26C1D33A8;
}

+ (id)supportedCyrillicLanguages
{
  return &unk_26C1D33C0;
}

+ (id)supportedArabicLanguages
{
  return &unk_26C1D33D8;
}

+ (id)supportedDevanagariLanguages
{
  return &unk_26C1D33F0;
}

+ (id)supportedTransliterationLanguages
{
  return &unk_26C1D3408;
}

+ (id)supportedSpellingFallbackLanguages
{
  return &unk_26C1D3420;
}

+ (id)cyrillicLanguages
{
  return &unk_26C1D3438;
}

+ (id)arabicLanguages
{
  return &unk_26C1D3450;
}

+ (id)devanagariLanguages
{
  return &unk_26C1D3468;
}

+ (id)transliterationLocalizationForLanguage:(id)a3
{
  uint64_t v4 = (void *)baseLanguageForLanguage((uint64_t)a3);
  if (!objc_msgSend((id)objc_msgSend(a1, "supportedTransliterationLanguages"), "containsObject:", v4)) {
    return 0;
  }
  return (id)[v4 stringByAppendingString:@"_Latn"];
}

+ (id)spellingFallbackLocalizationForLanguage:(id)a3
{
  uint64_t v4 = baseLanguageForLanguage((uint64_t)a3);
  if (!objc_msgSend((id)objc_msgSend(a1, "supportedSpellingFallbackLanguages"), "containsObject:", v4)) {
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a1, "supportedTransliterationLanguages"), "containsObject:", v4)) {
    return @"en_IN";
  }
  return @"en_US";
}

+ (id)supportedEnglishLocalizationAdditions
{
  return &unk_26C1D3540;
}

+ (id)englishLocalizationAdditionForLanguage:(id)a3
{
  uint64_t v4 = baseLanguageForLanguage((uint64_t)a3);
  uint64_t v5 = (void *)[a1 supportedEnglishLocalizationAdditions];
  return (id)[v5 objectForKey:v4];
}

+ (id)languagesUsingOrdinalPeriod
{
  return &unk_26C1D3480;
}

+ (id)languagesUsingSentencePieceModel
{
  return &unk_26C1D3498;
}

+ (id)languagesUsingUnigramProbabilities
{
  return &unk_26C1D34B0;
}

+ (id)languageObjectWithIdentifier:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithIdentifier:a3];
  return v3;
}

- (PRLanguage)initWithIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PRLanguage;
  uint64_t v4 = [(PRLanguage *)&v6 init];
  if (v4)
  {
    v4->_identifier = (NSString *)[a3 copy];
    v4->_localization = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "localizationForLanguage:", a3), "copy");
    v4->_fallbackLocalization = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "fallbackLocalizationForLanguage:", a3), "copy");
    [(id)objc_opt_class() getCodesForLanguage:a3 languageCode:&v4->_languageCode languageDialect:&v4->_languageDialect languageMode:&v4->_languageMode orthographyIndex:&v4->_orthoIndex encoding:&v4->_encoding];
  }
  return v4;
}

- (unint64_t)hash
{
  id v2 = [(PRLanguage *)self identifier];
  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(PRLanguage *)self identifier];
  uint64_t v6 = [a3 identifier];
  return [v5 isEqual:v6];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PRLanguage;
  return (id)[NSString stringWithFormat:@"%@<%@>", -[PRLanguage description](&v3, sel_description), -[PRLanguage identifier](self, "identifier")];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"PRLanguage requires keyed coding" userInfo:0]);
  }
  id v5 = [(PRLanguage *)self identifier];
  [a3 encodeObject:v5 forKey:@"PRIdentifier"];
}

- (PRLanguage)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"PRLanguage requires keyed coding" userInfo:0]);
  }
  unsigned int result = (PRLanguage *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"PRIdentifier"];
  if (result)
  {
    return [(PRLanguage *)self initWithIdentifier:result];
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRLanguage;
  [(PRLanguage *)&v3 dealloc];
}

- (id)identifier
{
  return self->_identifier;
}

- (id)localization
{
  return self->_localization;
}

- (id)fallbackLocalization
{
  return self->_fallbackLocalization;
}

- (id)languageModelLocalization
{
  objc_super v3 = objc_opt_class();
  id v4 = [(PRLanguage *)self identifier];
  return (id)[v3 languageModelLocalizationForLanguage:v4];
}

- (id)languageModelFallbackLocalization
{
  objc_super v3 = objc_opt_class();
  id v4 = [(PRLanguage *)self identifier];
  return (id)[v3 languageModelFallbackLocalizationForLanguage:v4];
}

- (id)transliterationLocalization
{
  objc_super v3 = objc_opt_class();
  id v4 = [(PRLanguage *)self identifier];
  return (id)[v3 transliterationLocalizationForLanguage:v4];
}

- (id)spellingFallbackLocalization
{
  objc_super v3 = objc_opt_class();
  id v4 = [(PRLanguage *)self identifier];
  return (id)[v3 spellingFallbackLocalizationForLanguage:v4];
}

- (unsigned)encoding
{
  return self->_encoding;
}

- (unint64_t)orthographyIndex
{
  return self->_orthoIndex;
}

- (unsigned)languageCode
{
  return self->_languageCode;
}

- (unsigned)languageDialect
{
  return self->_languageDialect;
}

- (unsigned)languageMode
{
  return self->_languageMode;
}

- (const)oneLetterWords
{
  unsigned int result = 0;
  switch(self->_orthoIndex)
  {
    case 6uLL:
      unsigned int result = englishOneLetterWords[0];
      break;
    case 7uLL:
      unsigned int result = frenchOneLetterWords;
      break;
    case 9uLL:
      unsigned int result = (const char *)italianOneLetterWords;
      break;
    case 0xAuLL:
      unsigned int result = (const char *)spanishOneLetterWords;
      break;
    default:
      return result;
  }
  return result;
}

- (const)twoLetterWords
{
  unint64_t orthoIndex = self->_orthoIndex;
  switch(orthoIndex)
  {
    case 6uLL:
      unsigned int result = englishTwoLetterWords[0];
      break;
    case 7uLL:
      unsigned int result = (const char *)frenchTwoLetterWords;
      break;
    case 8uLL:
      unsigned int result = (const char *)germanTwoLetterWords;
      break;
    case 9uLL:
      unsigned int result = (const char *)italianTwoLetterWords;
      break;
    case 0xAuLL:
      unsigned int result = (const char *)spanishTwoLetterWords;
      break;
    case 0xBuLL:
      unsigned int result = (const char *)portugueseTwoLetterWords;
      break;
    case 0xCuLL:
      unsigned int result = (const char *)dutchTwoLetterWords;
      break;
    case 0xDuLL:
      unsigned int result = (const char *)danishTwoLetterWords;
      break;
    case 0xEuLL:
      unsigned int result = (const char *)swedishTwoLetterWords;
      break;
    case 0xFuLL:
      unsigned int result = (const char *)norwegianTwoLetterWords;
      break;
    case 0x10uLL:
      unsigned int result = (const char *)nynorskTwoLetterWords;
      break;
    default:
      if (orthoIndex == 48)
      {
        unsigned int result = (const char *)finnishTwoLetterWords;
      }
      else if (orthoIndex == 55)
      {
        unsigned int result = (const char *)turkishTwoLetterWords;
      }
      else
      {
        unsigned int result = 0;
      }
      break;
  }
  return result;
}

- (const)accents
{
  unsigned int result = 0;
  unint64_t orthoIndex = self->_orthoIndex;
  switch(orthoIndex)
  {
    case 7uLL:
      unsigned int result = (const char *)frenchAccents;
      break;
    case 8uLL:
      unsigned int result = (const char *)germanAccents;
      break;
    case 9uLL:
      unsigned int result = (const char *)italianAccents;
      break;
    case 0xAuLL:
      unsigned int result = (const char *)spanishAccents;
      break;
    case 0xBuLL:
      unsigned int result = (const char *)portugueseAccents;
      break;
    case 0xCuLL:
      return result;
    case 0xDuLL:
      unsigned int result = (const char *)danishAccents;
      break;
    case 0xEuLL:
      unsigned int result = (const char *)swedishAccents;
      break;
    case 0xFuLL:
      unsigned int result = (const char *)norwegianAccents;
      break;
    case 0x10uLL:
      unsigned int result = (const char *)nynorskAccents;
      break;
    default:
      if (orthoIndex == 48)
      {
        unsigned int result = (const char *)finnishAccents;
      }
      else if (orthoIndex == 55)
      {
        unsigned int result = (const char *)turkishAccents;
      }
      break;
  }
  return result;
}

- (BOOL)isBicameral
{
  if ([(PRLanguage *)self isArabic]
    || [(PRLanguage *)self isHebrew]
    || [(PRLanguage *)self isHindi]
    || [(PRLanguage *)self isKorean]
    || [(PRLanguage *)self isPunjabi]
    || [(PRLanguage *)self isTelugu])
  {
    return 0;
  }
  else
  {
    return ![(PRLanguage *)self isThai];
  }
}

- (BOOL)isSupportedAssetLexiconLanguage
{
  objc_super v3 = (void *)[(id)objc_opt_class() supportedAssetLexiconLanguages];
  if (objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization"))) {
    return 1;
  }
  id v5 = [(PRLanguage *)self fallbackLocalization];
  return [v3 containsObject:v5];
}

- (BOOL)isSupportedCompletionLanguage
{
  objc_super v3 = (void *)[(id)objc_opt_class() supportedCompletionLanguages];
  if (objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization"))) {
    return 1;
  }
  id v5 = [(PRLanguage *)self fallbackLocalization];
  return [v3 containsObject:v5];
}

- (BOOL)isSupportedSingleCompletionLanguage
{
  objc_super v3 = (void *)[(id)objc_opt_class() supportedSingleCompletionLanguages];
  if (objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization"))) {
    return 1;
  }
  id v5 = [(PRLanguage *)self fallbackLocalization];
  return [v3 containsObject:v5];
}

- (BOOL)isSupportedLatinLanguage
{
  objc_super v3 = (void *)[(id)objc_opt_class() supportedLatinLanguages];
  if (objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization"))) {
    return 1;
  }
  id v5 = [(PRLanguage *)self fallbackLocalization];
  return [v3 containsObject:v5];
}

- (BOOL)usesOrdinalPeriod
{
  objc_super v3 = (void *)[(id)objc_opt_class() languagesUsingOrdinalPeriod];
  if (objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization"))) {
    return 1;
  }
  id v5 = [(PRLanguage *)self fallbackLocalization];
  return [v3 containsObject:v5];
}

- (BOOL)usesSentencePieceModel
{
  objc_super v3 = (void *)[(id)objc_opt_class() languagesUsingSentencePieceModel];
  if (objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization"))) {
    return 1;
  }
  id v5 = [(PRLanguage *)self fallbackLocalization];
  return [v3 containsObject:v5];
}

- (BOOL)usesUnigramProbabilities
{
  objc_super v3 = (void *)[(id)objc_opt_class() languagesUsingUnigramProbabilities];
  if (objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization"))) {
    return 1;
  }
  id v5 = [(PRLanguage *)self fallbackLocalization];
  return [v3 containsObject:v5];
}

- (BOOL)usesArabicScript
{
  objc_super v3 = (void *)[(id)objc_opt_class() arabicLanguages];
  if (objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization"))) {
    return 1;
  }
  id v5 = [(PRLanguage *)self fallbackLocalization];
  return [v3 containsObject:v5];
}

- (BOOL)usesCyrillicScript
{
  objc_super v3 = (void *)[(id)objc_opt_class() cyrillicLanguages];
  if (objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization"))) {
    return 1;
  }
  id v5 = [(PRLanguage *)self fallbackLocalization];
  return [v3 containsObject:v5];
}

- (BOOL)usesDevanagariScript
{
  objc_super v3 = (void *)[(id)objc_opt_class() devanagariLanguages];
  if (objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization"))) {
    return 1;
  }
  id v5 = [(PRLanguage *)self fallbackLocalization];
  return [v3 containsObject:v5];
}

- (BOOL)isArabic
{
  return self->_orthoIndex == 160;
}

- (BOOL)isBengali
{
  return self->_orthoIndex == 230;
}

- (BOOL)isBulgarian
{
  return self->_orthoIndex == 130;
}

- (BOOL)isCatalan
{
  return self->_orthoIndex == 22;
}

- (BOOL)isCroatian
{
  return self->_orthoIndex == 40;
}

- (BOOL)isCzech
{
  return self->_orthoIndex == 41;
}

- (BOOL)isDanish
{
  return self->_orthoIndex == 13;
}

- (BOOL)isDutch
{
  return self->_orthoIndex == 12;
}

- (BOOL)isEnglish
{
  return self->_orthoIndex == 6;
}

- (BOOL)isFinnish
{
  return self->_orthoIndex == 48;
}

- (BOOL)isFrench
{
  return self->_orthoIndex == 7;
}

- (BOOL)isGerman
{
  return self->_orthoIndex == 8;
}

- (BOOL)isGreek
{
  return self->_orthoIndex == 224;
}

- (BOOL)isGujarati
{
  return self->_orthoIndex == 232;
}

- (BOOL)isHebrew
{
  return self->_orthoIndex == 227;
}

- (BOOL)isHindi
{
  return self->_orthoIndex == 192;
}

- (BOOL)isHungarian
{
  return self->_orthoIndex == 42;
}

- (BOOL)isIcelandic
{
  return self->_orthoIndex == 18;
}

- (BOOL)isIndonesian
{
  return self->_orthoIndex == 74;
}

- (BOOL)isIrishGaelic
{
  return self->_orthoIndex == 34;
}

- (BOOL)isItalian
{
  return self->_orthoIndex == 9;
}

- (BOOL)isKannada
{
  return self->_orthoIndex == 236;
}

- (BOOL)isKorean
{
  return self->_orthoIndex == 3;
}

- (BOOL)isKazakh
{
  return self->_orthoIndex == 138;
}

- (BOOL)isLithuanian
{
  return self->_orthoIndex == 51;
}

- (BOOL)isMalayalam
{
  return self->_orthoIndex == 237;
}

- (BOOL)isMarathi
{
  return self->_orthoIndex == 193;
}

- (BOOL)isNorwegian
{
  return self->_orthoIndex == 15;
}

- (BOOL)isNynorsk
{
  return self->_orthoIndex == 16;
}

- (BOOL)isPersian
{
  return self->_orthoIndex == 161;
}

- (BOOL)isPolish
{
  return self->_orthoIndex == 43;
}

- (BOOL)isPortuguese
{
  return self->_orthoIndex == 11;
}

- (BOOL)isPunjabi
{
  return self->_orthoIndex == 231;
}

- (BOOL)isRomanian
{
  return self->_orthoIndex == 44;
}

- (BOOL)isRussian
{
  return self->_orthoIndex == 128;
}

- (BOOL)isSlovak
{
  return self->_orthoIndex == 46;
}

- (BOOL)isSlovenian
{
  return self->_orthoIndex == 47;
}

- (BOOL)isSpanish
{
  return self->_orthoIndex == 10;
}

- (BOOL)isSwedish
{
  return self->_orthoIndex == 14;
}

- (BOOL)isTamil
{
  return self->_orthoIndex == 234;
}

- (BOOL)isTelugu
{
  return self->_orthoIndex == 235;
}

- (BOOL)isThai
{
  return self->_orthoIndex == 239;
}

- (BOOL)isTurkish
{
  return self->_orthoIndex == 55;
}

- (BOOL)isUkrainian
{
  return self->_orthoIndex == 129;
}

- (BOOL)isUrdu
{
  return self->_orthoIndex == 162;
}

- (BOOL)isVietnamese
{
  return self->_orthoIndex == 85;
}

@end