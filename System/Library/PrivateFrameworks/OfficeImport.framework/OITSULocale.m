@interface OITSULocale
+ (BOOL)localeIsAutoUpdating:(id)a3;
+ (id)allSupportedTemplatePickerLanguages;
+ (id)allSupportedTier1Languages;
+ (id)allSupportedTier3Languages;
+ (id)applicationLocale;
+ (id)cacheKeyForLocale:(id)a3;
+ (id)canonicalizeLocaleIdentifier:(id)a3;
+ (id)canonicalizeLocaleIdentifierWithLanguageAndRegionOnly:(id)a3;
+ (id)canonicalizeLocaleIdentifierWithLanguageAndScriptOnly:(id)a3;
+ (id)canonicalizeLocaleIdentifierWithLanguageOnly:(id)a3;
+ (id)canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:(id)a3;
+ (id)currentLocale;
+ (id)deducedScriptForLocale:(id)a3;
+ (id)displayNameForCode:(id)a3 ofType:(id)a4 displayStandalone:(BOOL)a5;
+ (id)localeForLocaleIdentifier:(id)a3 documentLanguageIdentifier:(id)a4;
+ (id)localeIDWithDefaultRegionCode:(id)a3;
+ (id)localeIDWithoutDefaultRegionCode:(id)a3 avoidAmbiguousCases:(BOOL)a4;
+ (id)preferredLanguages;
+ (id)preferredLocale;
+ (id)simplifiedDisplayNameForLocaleID:(id)a3 displayStandalone:(BOOL)a4;
+ (unint64_t)autoupdatingCurrentLocaleChangeCount;
+ (void)initialize;
+ (void)saveLocaleForReuse:(id)a3;
+ (void)setLocalizedStringBundle:(__CFBundle *)a3;
- (BOOL)isAutoUpdating;
- (BOOL)isEqual:(id)a3;
- (BOOL)localizedCaseInsensitiveIsEqual:(id)a3 toString:(id)a4;
- (NSArray)monthSymbols;
- (NSArray)shortMonthSymbols;
- (NSArray)shortStandaloneMonthSymbols;
- (NSArray)shortStandaloneWeekdaySymbols;
- (NSArray)shortWeekdaySymbols;
- (NSArray)standaloneMonthSymbols;
- (NSArray)standaloneWeekdaySymbols;
- (NSArray)weekdaySymbols;
- (NSLocale)gregorianCalendarLocale;
- (NSLocale)locale;
- (NSString)amString;
- (NSString)arrayRowSeparator;
- (NSString)currencyCode;
- (NSString)currencyDecimalSeparator;
- (NSString)currencyGroupingSeparator;
- (NSString)decimalSeparator;
- (NSString)documentLanguageIdentifier;
- (NSString)falseString;
- (NSString)groupingSeparator;
- (NSString)languageCode;
- (NSString)listSeparator;
- (NSString)localeIdentifier;
- (NSString)percentSymbol;
- (NSString)pmString;
- (NSString)trueString;
- (NSTimeZone)timeZone;
- (OITSUDateParserLibrary)dateParserLibrary;
- (OITSULocale)initWithLocale:(id)a3 documentLanguageIdentifier:(id)a4;
- (OITSULocale)initWithLocale:(id)a3 documentLanguageIdentifier:(id)a4 useAutoupdating:(BOOL)a5;
- (__CFLocale)cfGregorianCalendarLocale;
- (__CFLocale)cfLocale;
- (__CFNumberFormatter)checkoutNumberFormatter;
- (__CFNumberFormatter)checkoutScientificNumberFormatter;
- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5;
- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5 inBundle:(__CFBundle *)a6;
- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5 inBundleWithURL:(id)a6;
- (id)copyWithDocumentLanguageIdentifier:(id)a3;
- (id)description;
- (id)displayLanguageNameWithStandalone:(BOOL)a3;
- (id)localeIdentifierWithLanguageAndRegionOnly;
- (id)localeIdentifierWithLanguageScriptAndRegionOnly;
- (id)localeSpecificStorageForKey:(id)a3;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5;
- (id)localizedStringWithFormat:(id)a3;
- (id)numberFormatterStringFromDouble:(double)a3 withFormat:(id)a4 useDecimalPlaces:(BOOL)a5 minDecimalPlaces:(unsigned __int16)a6 decimalPlaces:(unsigned __int16)a7 showThousandsSeparator:(BOOL)a8 currencyCode:(id)a9 suppressMinusSign:(BOOL)a10;
- (id)simplifiedDisplayNameWithStandalone:(BOOL)a3;
- (int64_t)dateComponentOrdering;
- (int64_t)localizedCaseInsensitiveCompare:(id)a3 toString:(id)a4;
- (int64_t)localizedCompare:(id)a3 toString:(id)a4;
- (unint64_t)groupingSize;
- (unint64_t)hash;
- (void)_initializeNumberFormatterStringFromDoubleCache;
- (void)dealloc;
- (void)returnNumberFormatter:(__CFNumberFormatter *)a3;
- (void)returnScientificNumberFormatter:(__CFNumberFormatter *)a3;
- (void)setLocaleSpecificStorage:(id)a3 forKey:(id)a4;
@end

@implementation OITSULocale

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sStaticLocaleLock = objc_opt_new();
    sOtherLocales = objc_opt_new();
    sCurrentLocale = 0;
    TSURegisterLocaleChangeObserver((uint64_t)&__block_literal_global_4);
  }
}

uint64_t __25__OITSULocale_initialize__block_invoke()
{
  [(id)sStaticLocaleLock lock];
  ++sAutoupdatingCurrentLocaleChangeCount;

  sCurrentLocale = 0;
  v0 = (void *)sStaticLocaleLock;
  return [v0 unlock];
}

+ (void)setLocalizedStringBundle:(__CFBundle *)a3
{
  if (sLocalizedStringBundle) {
    CFRelease((CFTypeRef)sLocalizedStringBundle);
  }
  sLocalizedStringBundle = (uint64_t)a3;
  CFRetain(a3);
}

+ (unint64_t)autoupdatingCurrentLocaleChangeCount
{
  [(id)sStaticLocaleLock lock];
  unint64_t v2 = sAutoupdatingCurrentLocaleChangeCount;
  [(id)sStaticLocaleLock unlock];
  return v2;
}

+ (id)cacheKeyForLocale:(id)a3
{
  if (+[OITSULocale localeIsAutoUpdating:](OITSULocale, "localeIsAutoUpdating:")) {
    return @"NSAutoLocale";
  }
  else {
    return (id)[NSString stringWithFormat:@"CFLocale:%@", objc_msgSend(a3, "localeIdentifier")];
  }
}

+ (id)preferredLanguages
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = objc_msgSend((id)objc_msgSend(a1, "currentLocale"), "documentLanguageIdentifier");
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

+ (id)currentLocale
{
  unint64_t v2 = (void *)sCurrentLocale;
  if (!sCurrentLocale)
  {
    objc_sync_enter(a1);
    if (!sCurrentLocale)
    {
      v4 = [OITSULocale alloc];
      uint64_t v5 = [MEMORY[0x263EFF960] currentLocale];
      sCurrentLocale = -[OITSULocale initWithLocale:documentLanguageIdentifier:useAutoupdating:](v4, "initWithLocale:documentLanguageIdentifier:useAutoupdating:", v5, objc_msgSend(MEMORY[0x263EFF960], "tsu_firstPreferredLocalization"), 1);
    }
    objc_sync_exit(a1);
    unint64_t v2 = (void *)sCurrentLocale;
  }
  id v6 = v2;
  return v6;
}

+ (id)preferredLocale
{
  unint64_t v2 = (void *)sPreferredLocale;
  if (!sPreferredLocale)
  {
    objc_sync_enter(a1);
    if (!sPreferredLocale)
    {
      v4 = [OITSULocale alloc];
      sPreferredLocale = -[OITSULocale initWithLocale:documentLanguageIdentifier:useAutoupdating:](v4, "initWithLocale:documentLanguageIdentifier:useAutoupdating:", TSUPreferredLocale(), objc_msgSend(MEMORY[0x263EFF960], "tsu_firstPreferredLocalization"), 1);
    }
    objc_sync_exit(a1);
    unint64_t v2 = (void *)sPreferredLocale;
  }
  id v5 = v2;
  return v5;
}

+ (id)applicationLocale
{
  id v2 = +[OITSULocale currentLocale];
  return (id)[v2 locale];
}

+ (id)canonicalizeLocaleIdentifier:(id)a3
{
  id v3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "componentsFromLocaleIdentifier:", a3), "mutableCopy");
  uint64_t v4 = *MEMORY[0x263EFF568];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x263EFF568]), "uppercaseString"), "isEqualToString:", @"POSIX"))objc_msgSend(v3, "removeObjectForKey:", v4); {
  id v5 = (void *)MEMORY[0x263EFF960];
  }
  uint64_t v6 = [MEMORY[0x263EFF960] localeIdentifierFromComponents:v3];
  return (id)[v5 canonicalLocaleIdentifierFromString:v6];
}

+ (id)canonicalizeLocaleIdentifierWithLanguageOnly:(id)a3
{
  id v3 = (void *)[MEMORY[0x263EFF960] componentsFromLocaleIdentifier:a3];
  uint64_t v4 = *MEMORY[0x263EFF508];
  return (id)[v3 objectForKeyedSubscript:v4];
}

+ (id)canonicalizeLocaleIdentifierWithLanguageAndRegionOnly:(id)a3
{
  id v3 = (void *)[MEMORY[0x263EFF960] componentsFromLocaleIdentifier:a3];
  uint64_t v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = *MEMORY[0x263EFF508];
  if ([v3 objectForKeyedSubscript:*MEMORY[0x263EFF508]]) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v5), v5);
  }
  uint64_t v6 = *MEMORY[0x263EFF4D0];
  if ([v3 objectForKeyedSubscript:*MEMORY[0x263EFF4D0]]) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v6), v6);
  }
  v7 = (void *)MEMORY[0x263EFF960];
  uint64_t v8 = [MEMORY[0x263EFF960] localeIdentifierFromComponents:v4];
  return (id)[v7 canonicalLocaleIdentifierFromString:v8];
}

+ (id)canonicalizeLocaleIdentifierWithLanguageAndScriptOnly:(id)a3
{
  id v3 = (void *)[MEMORY[0x263EFF960] componentsFromLocaleIdentifier:a3];
  uint64_t v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = *MEMORY[0x263EFF508];
  if ([v3 objectForKeyedSubscript:*MEMORY[0x263EFF508]]) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v5), v5);
  }
  uint64_t v6 = *MEMORY[0x263EFF540];
  if ([v3 objectForKeyedSubscript:*MEMORY[0x263EFF540]]) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v6), v6);
  }
  v7 = (void *)MEMORY[0x263EFF960];
  uint64_t v8 = [MEMORY[0x263EFF960] localeIdentifierFromComponents:v4];
  return (id)[v7 canonicalLocaleIdentifierFromString:v8];
}

+ (id)canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:(id)a3
{
  id v3 = (void *)[MEMORY[0x263EFF960] componentsFromLocaleIdentifier:a3];
  uint64_t v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = *MEMORY[0x263EFF508];
  if ([v3 objectForKeyedSubscript:*MEMORY[0x263EFF508]]) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v5), v5);
  }
  uint64_t v6 = *MEMORY[0x263EFF4D0];
  if ([v3 objectForKeyedSubscript:*MEMORY[0x263EFF4D0]]) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v6), v6);
  }
  uint64_t v7 = *MEMORY[0x263EFF540];
  if ([v3 objectForKeyedSubscript:*MEMORY[0x263EFF540]]) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v7), v7);
  }
  uint64_t v8 = (void *)MEMORY[0x263EFF960];
  uint64_t v9 = [MEMORY[0x263EFF960] localeIdentifierFromComponents:v4];
  return (id)[v8 canonicalLocaleIdentifierFromString:v9];
}

+ (id)deducedScriptForLocale:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "componentsFromLocaleIdentifier:"), "mutableCopy");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [&unk_26EC806D8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
  uint64_t v8 = *MEMORY[0x263EFF540];
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(&unk_26EC806D8);
    }
    v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    [v4 setObject:v10 forKeyedSubscript:v8];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "canonicalLocaleIdentifierFromString:", objc_msgSend(MEMORY[0x263EFF960], "localeIdentifierFromComponents:", v4)), "isEqualToString:", a3))return v10; {
    if (v6 == ++v9)
    }
    {
      uint64_t v6 = [&unk_26EC806D8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

+ (id)localeIDWithDefaultRegionCode:(id)a3
{
  v26[3] = *MEMORY[0x263EF8340];
  id v3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "componentsFromLocaleIdentifier:", a3), "mutableCopy");
  uint64_t v4 = *MEMORY[0x263EFF508];
  int v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x263EFF508]), "isEqualToString:", @"zh");
  uint64_t v6 = (uint64_t *)MEMORY[0x263EFF540];
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x263EFF540];
    uint64_t v8 = [v3 objectForKeyedSubscript:*MEMORY[0x263EFF540]];
    uint64_t v9 = *MEMORY[0x263EFF4D0];
    if (!v8)
    {
      if (objc_msgSend(&unk_26EC806F0, "containsObject:", objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x263EFF4D0])))v10 = @"Hant"; {
      else
      }
        v10 = @"Hans";
      [v3 setObject:v10 forKeyedSubscript:v7];
    }
    if (![v3 objectForKeyedSubscript:v9])
    {
      if (objc_msgSend(@"Hant", "isEqualToString:", objc_msgSend(v3, "objectForKeyedSubscript:", v7)))v11 = @"TW"; {
      else
      }
        v11 = @"CN";
      goto LABEL_17;
    }
  }
  else
  {
    if (objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v4), "isEqualToString:", @"ko"))
    {
      uint64_t v12 = *v6;
      if (objc_msgSend(&unk_26EC80708, "containsObject:", objc_msgSend(v3, "objectForKeyedSubscript:", *v6)))objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v12); {
    }
      }
    uint64_t v9 = *MEMORY[0x263EFF4D0];
    if (![v3 objectForKeyedSubscript:*MEMORY[0x263EFF4D0]])
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(objc_alloc(NSDictionary), "initWithContentsOfFile:", objc_msgSend((id)SFUBundle(), "pathForResource:ofType:", @"LocaleIDData", @"plist")), "objectForKeyedSubscript:", @"DefaultRegionCodes"), "objectForKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v4)), v9);
      if (![v3 objectForKeyedSubscript:v9])
      {
        v11 = (__CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "currentLocale"), "objectForKey:", v9);
LABEL_17:
        [v3 setObject:v11 forKeyedSubscript:v9];
      }
    }
  }
  long long v13 = (void *)[v3 allKeys];
  v26[0] = v4;
  v26[1] = v9;
  v26[2] = *v6;
  long long v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v26, 3));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (([v14 containsObject:v19] & 1) == 0) {
          [v3 removeObjectForKey:v19];
        }
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }
  return (id)[MEMORY[0x263EFF960] localeIdentifierFromComponents:v3];
}

+ (id)localeIDWithoutDefaultRegionCode:(id)a3 avoidAmbiguousCases:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "componentsFromLocaleIdentifier:"), "mutableCopy");
  uint64_t v7 = v6;
  uint64_t v8 = *MEMORY[0x263EFF508];
  if (v4
    && (objc_msgSend(&unk_26EC80720, "containsObject:", objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x263EFF508])) & 1) != 0)
  {
    return a3;
  }
  if (objc_msgSend(@"zh", "isEqualToString:", objc_msgSend(v7, "objectForKeyedSubscript:", v8)))
  {
    int v10 = objc_msgSend(@"Hant", "isEqualToString:", objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x263EFF540]));
    uint64_t v11 = *MEMORY[0x263EFF4D0];
    if (v10
      && (objc_msgSend(@"TW", "isEqualToString:", objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x263EFF4D0])) & 1) != 0)
    {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v11 = *MEMORY[0x263EFF4D0];
  }
  if (objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v11), "isEqualToString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(objc_alloc(NSDictionary), "initWithContentsOfFile:", objc_msgSend((id)SFUBundle(), "pathForResource:ofType:", @"LocaleIDData", @"plist")), "objectForKeyedSubscript:", @"DefaultRegionCodes"), "objectForKeyedSubscript:", objc_msgSend(v7, "objectForKeyedSubscript:", v8))))LABEL_10:objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v11); {
  uint64_t v12 = (void *)MEMORY[0x263EFF960];
  }
  return (id)[v12 localeIdentifierFromComponents:v7];
}

+ (id)simplifiedDisplayNameForLocaleID:(id)a3 displayStandalone:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[OITSULocale localeIDWithoutDefaultRegionCode:avoidAmbiguousCases:](OITSULocale, "localeIDWithoutDefaultRegionCode:avoidAmbiguousCases:", +[OITSULocale localeIDWithDefaultRegionCode:a3], 1);
  id result = +[OITSULocale displayNameForCode:v5 ofType:*MEMORY[0x263EFF500] displayStandalone:v4];
  if (!result)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"+[OITSULocale simplifiedDisplayNameForLocaleID:displayStandalone:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSULocale.m"], 407, 0, "Nil display name returned for locale ID %@", objc_msgSend(+[OITSULocale applicationLocale](OITSULocale, "applicationLocale"), "localeIdentifier"));
    +[OITSUAssertionHandler logBacktraceThrottled];
    return &stru_26EBF24D8;
  }
  return result;
}

+ (id)displayNameForCode:(id)a3 ofType:(id)a4 displayStandalone:(BOOL)a5
{
  id v7 = +[OITSULocale applicationLocale];
  id v8 = (id)*MEMORY[0x263EFF500];
  id v9 = (id)*MEMORY[0x263EFF508];
  if ((id)*MEMORY[0x263EFF4D0] == a4 || v9 == a4 || v8 == a4) {
    id v12 = a4;
  }
  else {
    id v12 = (id)*MEMORY[0x263EFF500];
  }
  if (v12 == v9)
  {
    if ([a3 containsString:@"-"]) {
      id v12 = v8;
    }
    else {
      id v12 = v9;
    }
  }
  return (id)[v7 displayNameForKey:v12 value:a3];
}

+ (id)allSupportedTier1Languages
{
  if (allSupportedTier1Languages_once != -1) {
    dispatch_once(&allSupportedTier1Languages_once, &__block_literal_global_108);
  }
  return (id)allSupportedTier1Languages_supportedTiers0and1;
}

id __41__OITSULocale_allSupportedTier1Languages__block_invoke()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend((id)objc_msgSend(objc_alloc(NSDictionary), "initWithContentsOfFile:", objc_msgSend((id)SFUBundle(), "pathForResource:ofType:", @"LocaleIDData", @"plist")), "objectForKeyedSubscript:", @"Tiers0and1");
  v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizations");
  id v2 = (void *)[v0 mutableCopy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v0);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v1 containsObject:v7] & 1) == 0
          && (objc_msgSend(v1, "containsObject:", objc_msgSend(v7, "substringToIndex:", 2)) & 1) == 0)
        {
          [v2 removeObject:v7];
        }
      }
      uint64_t v4 = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  allSupportedTier1Languages_supportedTiers0and1 = [MEMORY[0x263EFF8C0] arrayWithArray:v2];

  return (id)allSupportedTier1Languages_supportedTiers0and1;
}

+ (id)allSupportedTier3Languages
{
  if (allSupportedTier3Languages_once != -1) {
    dispatch_once(&allSupportedTier3Languages_once, &__block_literal_global_113);
  }
  return (id)allSupportedTier3Languages_supportedLanguages;
}

id __41__OITSULocale_allSupportedTier3Languages__block_invoke()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend((id)objc_msgSend(objc_alloc(NSDictionary), "initWithContentsOfFile:", objc_msgSend((id)SFUBundle(), "pathForResource:ofType:", @"LocaleIDData", @"plist")), "objectForKeyedSubscript:", @"Tiers0thru3");
  uint64_t v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizations");
  id v2 = (void *)[v0 mutableCopy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v0 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v0);
        }
        uint64_t v14 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        id v7 = v14;
        id v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "preferredLocalizationsFromArray:forPreferences:", v1, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v14, 1)), "objectAtIndexedSubscript:", 0);
        if ((objc_msgSend(v7, "hasPrefix:", objc_msgSend(v8, "substringToIndex:", 2)) & 1) == 0
          && (![v7 isEqualToString:@"nb"]
           || ([v8 isEqualToString:@"no"] & 1) == 0))
        {
          [v2 removeObject:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v0 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v4);
  }
  allSupportedTier3Languages_supportedLanguages = [MEMORY[0x263EFF8C0] arrayWithArray:v2];

  return (id)allSupportedTier3Languages_supportedLanguages;
}

+ (id)allSupportedTemplatePickerLanguages
{
  if (allSupportedTemplatePickerLanguages_once != -1) {
    dispatch_once(&allSupportedTemplatePickerLanguages_once, &__block_literal_global_124);
  }
  return (id)allSupportedTemplatePickerLanguages_supportedLanguages;
}

id __50__OITSULocale_allSupportedTemplatePickerLanguages__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  objc_msgSend(v0, "addObjectsFromArray:", +[OITSULocale allSupportedTier3Languages](OITSULocale, "allSupportedTier3Languages"));
  objc_msgSend(v0, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(objc_alloc(NSDictionary), "initWithContentsOfFile:", objc_msgSend((id)SFUBundle(), "pathForResource:ofType:", @"LocaleIDData", @"plist")), "objectForKeyedSubscript:", @"AdditionalTemplatePickerLanguages"));
  allSupportedTemplatePickerLanguages_supportedLanguages = [v0 allObjects];

  uint64_t v1 = (void *)allSupportedTemplatePickerLanguages_supportedLanguages;
  return v1;
}

+ (BOOL)localeIsAutoUpdating:(id)a3
{
  if (localeIsAutoUpdating__onceToken != -1) {
    dispatch_once(&localeIsAutoUpdating__onceToken, &__block_literal_global_130);
  }
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __36__OITSULocale_localeIsAutoUpdating___block_invoke()
{
  [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  uint64_t result = objc_opt_class();
  localeIsAutoUpdating__s_autoupdatingCurrentLocaleClass = result;
  return result;
}

+ (id)localeForLocaleIdentifier:(id)a3 documentLanguageIdentifier:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  [(id)sStaticLocaleLock lock];
  id v6 = (id)[(id)sOtherLocales objectForKey:objc_msgSend(a3, "stringByAppendingFormat:", @",%@", a4)];
  [(id)sStaticLocaleLock unlock];
  return v6;
}

+ (void)saveLocaleForReuse:(id)a3
{
  [(id)sStaticLocaleLock lock];
  if (!objc_msgSend((id)sOtherLocales, "objectForKey:", objc_msgSend(a3, "localeIdentifier"))) {
    [(id)sOtherLocales setObject:a3, objc_msgSend((id)objc_msgSend(a3, "localeIdentifier"), "stringByAppendingFormat:", @",%@", objc_msgSend(a3, "documentLanguageIdentifier")) forKey];
  }
  uint64_t v4 = (void *)sStaticLocaleLock;
  [v4 unlock];
}

- (OITSULocale)initWithLocale:(id)a3 documentLanguageIdentifier:(id)a4
{
  return [(OITSULocale *)self initWithLocale:a3 documentLanguageIdentifier:a4 useAutoupdating:0];
}

- (OITSULocale)initWithLocale:(id)a3 documentLanguageIdentifier:(id)a4 useAutoupdating:(BOOL)a5
{
  BOOL v5 = a5;
  v19.receiver = self;
  v19.super_class = (Class)OITSULocale;
  id v8 = [(OITSULocale *)&v19 init];
  if (!v8) {
    return v8;
  }
  if (a4)
  {
    if (!a3) {
      goto LABEL_10;
    }
  }
  else
  {
    a4 = (id)objc_msgSend(MEMORY[0x263EFF960], "tsu_firstPreferredLocalization");
    if (!a3)
    {
LABEL_10:

      return 0;
    }
  }
  if (!a4) {
    goto LABEL_10;
  }
  long long v9 = (void *)[MEMORY[0x263EFF960] canonicalLanguageIdentifierFromString:a4];
  id v10 = +[OITSULocale canonicalizeLocaleIdentifier:](OITSULocale, "canonicalizeLocaleIdentifier:", [a3 localeIdentifier]);
  if (v5
    || (id v11 = +[OITSULocale localeForLocaleIdentifier:v10 documentLanguageIdentifier:v9]) == 0)
  {
    pthread_mutex_init(&v8->_formattersMutex, 0);
    v8->_localeIdentifier = (NSString *)v10;
    if (v5) {
      long long v13 = (NSLocale *)(id)[MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    }
    else {
      long long v13 = (NSLocale *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v8->_localeIdentifier];
    }
    v8->_locale = v13;
    v8->_isAutoUpdating = v5;
    v8->_languageCode = (NSString *)[(NSLocale *)v13 objectForKey:*MEMORY[0x263EFF508]];
    v8->_documentLanguageIdentifier = (NSString *)v9;
    v8->_numberFormatters = (NSMutableArray *)objc_opt_new();
    v8->_scientificNumberFormatters = (NSMutableArray *)objc_opt_new();
    v8->_dateParserLibrary = [[OITSUDateParserLibrary alloc] initWithLocale:v8];
    v8->_currencyCode = (NSString *)objc_msgSend(+[OITSUNumberFormatter defaultCurrencyCodeForLocale:](OITSUNumberFormatter, "defaultCurrencyCodeForLocale:", v8->_locale), "copy");
    v8->_numberFormatterStringFromDoubleWithFormatLock = (NSLock *)objc_opt_new();
    v8->_decimalSeparator = (NSString *)objc_msgSend(+[OITSUNumberFormatter decimalSeparatorForLocale:](OITSUNumberFormatter, "decimalSeparatorForLocale:", v8->_locale), "copy");
    v8->_groupingSeparator = (NSString *)objc_msgSend(+[OITSUNumberFormatter groupingSeparatorForLocale:](OITSUNumberFormatter, "groupingSeparatorForLocale:", v8->_locale), "copy");
    v8->_currencyDecimalSeparator = (NSString *)objc_msgSend(+[OITSUNumberFormatter currencyDecimalSeparatorForLocale:](OITSUNumberFormatter, "currencyDecimalSeparatorForLocale:", v8->_locale), "copy");
    v8->_currencyGroupingSeparator = (NSString *)objc_msgSend(+[OITSUNumberFormatter currencyGroupingSeparatorForLocale:](OITSUNumberFormatter, "currencyGroupingSeparatorForLocale:", v8->_locale), "copy");
    v8->_percentSymbol = (NSString *)objc_msgSend(+[OITSUNumberFormatter percentSymbolForLocale:](OITSUNumberFormatter, "percentSymbolForLocale:", v8->_locale), "copy");
    BOOL v14 = [(NSString *)v8->_decimalSeparator isEqualToString:@"."];
    uint64_t v15 = @";";
    if (v14) {
      uint64_t v15 = @",";
    }
    v8->_listSeparator = (NSString *)v15;
    v8->_groupingSize = +[OITSUNumberFormatter groupingSizeForLocale:v8->_locale];
    v8->_localeSpecificStorageLock = (NSLock *)objc_opt_new();
    v8->_localeSpecificStorage = (NSMutableDictionary *)objc_opt_new();
    v8->_dateComponentOrdering = TSUDateComponentOrderingForLocale((void *)[a3 localeIdentifier]);
    v8->_gregorianCalendarLocale = (NSLocale *)TSUCopyLocaleWithGregorianCalendarFromLocale(v8->_locale);
    UsingHarmonizedSymbols = TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols(0, v8->_locale, kCFDateFormatterMediumStyle, kCFDateFormatterMediumStyle);
    v8->_monthSymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x263EFFBB0]);
    v8->_standaloneMonthSymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x263EFFBF8]);
    v8->_weekdaySymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x263EFFC38]);
    v8->_standaloneWeekdaySymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x263EFFC08]);
    v8->_shortMonthSymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x263EFFBC8]);
    v8->_shortStandaloneMonthSymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x263EFFBD8]);
    v8->_shortWeekdaySymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x263EFFBF0]);
    v8->_shortStandaloneWeekdaySymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x263EFFBE8]);
    v8->_amString = (NSString *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x263EFFB88]);
    v8->_pmString = (NSString *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x263EFFBB8]);
    CFRelease(UsingHarmonizedSymbols);
    v8->_trueString = (NSString *)[(OITSULocale *)v8 localizedStringForKey:@"TRUE" value:&stru_26EBF24D8 table:@"TSUtility"];
    v8->_falseString = (NSString *)[(OITSULocale *)v8 localizedStringForKey:@"FALSE" value:&stru_26EBF24D8 table:@"TSUtility"];
    uint64_t v17 = (NSCache *)objc_opt_new();
    v8->_cachedLocalizedStrings = v17;
    [(NSCache *)v17 setName:@"Docuemnt-language localized strings cache"];
    if (!v5) {
      +[OITSULocale saveLocaleForReuse:v8];
    }
  }
  else
  {
    long long v12 = v11;

    return (OITSULocale *)v12;
  }
  return v8;
}

- (id)localeIdentifierWithLanguageAndRegionOnly
{
  id v2 = [(OITSULocale *)self localeIdentifier];
  return +[OITSULocale canonicalizeLocaleIdentifierWithLanguageAndRegionOnly:v2];
}

- (id)localeIdentifierWithLanguageScriptAndRegionOnly
{
  id v2 = [(OITSULocale *)self localeIdentifier];
  return +[OITSULocale canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:v2];
}

- (id)copyWithDocumentLanguageIdentifier:(id)a3
{
  BOOL v5 = [OITSULocale alloc];
  id v6 = [(OITSULocale *)self locale];
  BOOL v7 = [(OITSULocale *)self isAutoUpdating];
  return [(OITSULocale *)v5 initWithLocale:v6 documentLanguageIdentifier:a3 useAutoupdating:v7];
}

- (void)dealloc
{
  self->_gregorianCalendarLocale = 0;
  plainFormatter = self->_plainFormatter;
  if (plainFormatter)
  {
    CFRelease(plainFormatter);
    self->_plainFormatter = 0;
  }
  noMinusSignPlainFormatter = self->_noMinusSignPlainFormatter;
  if (noMinusSignPlainFormatter)
  {
    CFRelease(noMinusSignPlainFormatter);
    self->_noMinusSignPlainFormatter = 0;
  }
  currencyFormatter = self->_currencyFormatter;
  if (currencyFormatter)
  {
    CFRelease(currencyFormatter);
    self->_currencyFormatter = 0;
  }
  noMinusSignCurrencyFormatter = self->_noMinusSignCurrencyFormatter;
  if (noMinusSignCurrencyFormatter)
  {
    CFRelease(noMinusSignCurrencyFormatter);
    self->_noMinusSignCurrencyFormatter = 0;
  }

  pthread_mutex_destroy(&self->_formattersMutex);
  v7.receiver = self;
  v7.super_class = (Class)OITSULocale;
  [(OITSULocale *)&v7 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v6 = (void *)TSUDynamicCast(v5, (uint64_t)a3);
    if (v6)
    {
      objc_super v7 = v6;
      LODWORD(v6) = -[NSString isEqualToString:](-[OITSULocale localeIdentifier](self, "localeIdentifier"), "isEqualToString:", [v6 localeIdentifier]);
      if (v6)
      {
        BOOL v8 = [(OITSULocale *)self isAutoUpdating];
        LOBYTE(v6) = v8 ^ [v7 isAutoUpdating] ^ 1;
      }
    }
  }
  return (char)v6;
}

- (unint64_t)hash
{
  id v2 = [(OITSULocale *)self localeIdentifier];
  return [(NSString *)v2 hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_isAutoUpdating) {
    uint64_t v5 = @"Yes";
  }
  else {
    uint64_t v5 = @"No";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p>: for %@ language %@ autoupdating: %@", v4, self, self->_localeIdentifier, self->_documentLanguageIdentifier, v5];
}

- (id)simplifiedDisplayNameWithStandalone:(BOOL)a3
{
  return +[OITSULocale simplifiedDisplayNameForLocaleID:self->_localeIdentifier displayStandalone:a3];
}

- (id)displayLanguageNameWithStandalone:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = *MEMORY[0x263EFF508];
  id v6 = [(NSLocale *)self->_locale objectForKey:*MEMORY[0x263EFF508]];
  if ([v6 isEqualToString:@"zh"]
    && ((id v7 = [(NSLocale *)self->_locale objectForKey:*MEMORY[0x263EFF540]]) != 0
     || (id v7 = +[OITSULocale deducedScriptForLocale:self->_localeIdentifier]) != 0))
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@-%@", v6, v7];
    uint64_t v9 = *MEMORY[0x263EFF500];
  }
  else
  {
    uint64_t v8 = (uint64_t)v6;
    uint64_t v9 = v5;
  }
  return +[OITSULocale displayNameForCode:v8 ofType:v9 displayStandalone:v3];
}

- (__CFLocale)cfLocale
{
  return (__CFLocale *)self->_locale;
}

- (__CFLocale)cfGregorianCalendarLocale
{
  return (__CFLocale *)self->_gregorianCalendarLocale;
}

- (NSString)arrayRowSeparator
{
  return (NSString *)@";";
}

- (__CFNumberFormatter)checkoutNumberFormatter
{
  p_formattersMutex = &self->_formattersMutex;
  pthread_mutex_lock(&self->_formattersMutex);
  if ([(NSMutableArray *)self->_numberFormatters count])
  {
    uint64_t v4 = (__CFNumberFormatter *)(id)[(NSMutableArray *)self->_numberFormatters lastObject];
    [(NSMutableArray *)self->_numberFormatters removeLastObject];
    pthread_mutex_unlock(p_formattersMutex);
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
    pthread_mutex_unlock(p_formattersMutex);
  }
  uint64_t v4 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)[(OITSULocale *)self locale], 0);
  CFNumberFormatterSetFormat(v4, @"0");
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x263EFFDA0], (CFTypeRef)[NSNumber numberWithInt:0]);
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x263EFFD88], (CFTypeRef)[NSNumber numberWithInt:0x7FFFFFFFLL]);
  if (!v4) {
    return 0;
  }
LABEL_6:
  return v4;
}

- (void)returnNumberFormatter:(__CFNumberFormatter *)a3
{
  if (a3)
  {
    p_formattersMutex = &self->_formattersMutex;
    pthread_mutex_lock(&self->_formattersMutex);
    [(NSMutableArray *)self->_numberFormatters addObject:a3];
    pthread_mutex_unlock(p_formattersMutex);
  }
}

- (__CFNumberFormatter)checkoutScientificNumberFormatter
{
  p_formattersMutex = &self->_formattersMutex;
  pthread_mutex_lock(&self->_formattersMutex);
  if ([(NSMutableArray *)self->_scientificNumberFormatters count])
  {
    uint64_t v4 = (__CFNumberFormatter *)(id)[(NSMutableArray *)self->_scientificNumberFormatters lastObject];
    [(NSMutableArray *)self->_scientificNumberFormatters removeLastObject];
    pthread_mutex_unlock(p_formattersMutex);
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
    pthread_mutex_unlock(p_formattersMutex);
  }
  uint64_t v4 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)[(OITSULocale *)self locale], 4);
  CFNumberFormatterSetFormat(v4, @"0E+0");
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x263EFFDA0], (CFTypeRef)[NSNumber numberWithInt:0]);
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x263EFFD88], (CFTypeRef)[NSNumber numberWithInt:0x7FFFFFFFLL]);
  if (!v4) {
    return 0;
  }
LABEL_6:
  return v4;
}

- (void)returnScientificNumberFormatter:(__CFNumberFormatter *)a3
{
  if (a3)
  {
    p_formattersMutex = &self->_formattersMutex;
    pthread_mutex_lock(&self->_formattersMutex);
    [(NSMutableArray *)self->_scientificNumberFormatters addObject:a3];
    pthread_mutex_unlock(p_formattersMutex);
  }
}

- (void)_initializeNumberFormatterStringFromDoubleCache
{
  [(NSLock *)self->_numberFormatterStringFromDoubleWithFormatLock lock];
  if (!self->_noMinusSignCurrencyFormatter)
  {
    BOOL v3 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)[(OITSULocale *)self locale], 0);
    self->_noMinusSignCurrencyFormatter = v3;
    CFNumberFormatterSetProperty(v3, (CFNumberFormatterKey)*MEMORY[0x263EFFE20], (CFTypeRef)[NSNumber numberWithInt:6]);
    CFNumberFormatterSetProperty(self->_noMinusSignCurrencyFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFDA8], &unk_26EC80BA0);
  }
  if (!self->_currencyFormatter)
  {
    uint64_t v4 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)[(OITSULocale *)self locale], 0);
    self->_currencyFormatter = v4;
    CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x263EFFE20], (CFTypeRef)[NSNumber numberWithInt:6]);
    CFNumberFormatterSetProperty(self->_currencyFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFDA8], &unk_26EC80BA0);
  }
  if (!self->_noMinusSignPlainFormatter)
  {
    uint64_t v5 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)[(OITSULocale *)self locale], 0);
    self->_noMinusSignPlainFormatter = v5;
    CFNumberFormatterSetProperty(v5, (CFNumberFormatterKey)*MEMORY[0x263EFFE20], (CFTypeRef)[NSNumber numberWithInt:6]);
    CFNumberFormatterSetProperty(self->_noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFDA8], &unk_26EC80BA0);
  }
  if (!self->_plainFormatter)
  {
    id v6 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)[(OITSULocale *)self locale], 0);
    self->_plainFormatter = v6;
    CFNumberFormatterSetProperty(v6, (CFNumberFormatterKey)*MEMORY[0x263EFFE20], (CFTypeRef)[NSNumber numberWithInt:6]);
    CFNumberFormatterSetProperty(self->_plainFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFDA8], &unk_26EC80BA0);
  }
  numberFormatterStringFromDoubleWithFormatLock = self->_numberFormatterStringFromDoubleWithFormatLock;
  [(NSLock *)numberFormatterStringFromDoubleWithFormatLock unlock];
}

- (id)numberFormatterStringFromDouble:(double)a3 withFormat:(id)a4 useDecimalPlaces:(BOOL)a5 minDecimalPlaces:(unsigned __int16)a6 decimalPlaces:(unsigned __int16)a7 showThousandsSeparator:(BOOL)a8 currencyCode:(id)a9 suppressMinusSign:(BOOL)a10
{
  BOOL v11 = a8;
  uint64_t v12 = a7;
  uint64_t v13 = a6;
  BOOL v14 = a5;
  double v31 = a3;
  if (!self->_plainFormatter) {
    [(OITSULocale *)self _initializeNumberFormatterStringFromDoubleCache];
  }
  [(NSLock *)self->_numberFormatterStringFromDoubleWithFormatLock lock];
  if (a9 && [a9 length])
  {
    uint64_t v17 = 296;
    if (a10)
    {
      uint64_t v17 = 304;
      uint64_t v18 = 320;
    }
    else
    {
      uint64_t v18 = 312;
    }
    noMinusSignPlainFormatter = *(Class *)((char *)&self->super.isa + v17);
    if (([a9 isEqualToString:*(Class *)((char *)&self->super.isa + v18)] & 1) == 0)
    {
      TSUHarmonizedCFNumberFormatterSetCurrency(noMinusSignPlainFormatter, a9);

      *(Class *)((char *)&self->super.isa + v18) = (Class)[a9 copy];
    }
  }
  else if (a10)
  {
    noMinusSignPlainFormatter = self->_noMinusSignPlainFormatter;
  }
  else
  {
    noMinusSignPlainFormatter = self->_plainFormatter;
  }
  CFNumberFormatterSetFormat(noMinusSignPlainFormatter, (CFStringRef)a4);
  if (v14)
  {
    if ((unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary == v12)
    {
      v20 = (void *)[objc_alloc(NSNumber) initWithInt:0];
      long long v21 = (void *)[objc_alloc(NSNumber) initWithInt:0x7FFFFFFFLL];
      CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFDA0], v20);
      CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFD88], v21);
    }
    else
    {
      long long v22 = (void *)[objc_alloc(NSNumber) initWithInt:v13];
      CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFDA0], v22);

      long long v23 = (void *)[objc_alloc(NSNumber) initWithInt:v12];
      CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFD88], v23);
    }
  }
  if (a10) {
    CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFDB8], &stru_26EBF24D8);
  }
  long long v24 = (CFTypeRef *)MEMORY[0x263EFFB38];
  if (v11) {
    long long v24 = (CFTypeRef *)MEMORY[0x263EFFB40];
  }
  CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFE30], *v24);
  if (v11)
  {
    CFStringRef v25 = (const __CFString *)*MEMORY[0x263EFFD68];
    CFNumberRef v26 = (const __CFNumber *)CFNumberFormatterCopyProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFD68]);
    int valuePtr = 0;
    CFNumberType Type = CFNumberGetType(v26);
    CFNumberGetValue(v26, Type, &valuePtr);
    if (!valuePtr) {
      CFNumberFormatterSetProperty(noMinusSignPlainFormatter, v25, (CFTypeRef)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[OITSULocale groupingSize](self, "groupingSize")));
    }
  }
  v28 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x263EFFB08], noMinusSignPlainFormatter, kCFNumberDoubleType, &v31);
  [(NSLock *)self->_numberFormatterStringFromDoubleWithFormatLock unlock];
  return v28;
}

- (id)localeSpecificStorageForKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  [(NSLock *)self->_localeSpecificStorageLock lock];
  id v5 = (id)[(NSMutableDictionary *)self->_localeSpecificStorage objectForKey:a3];
  [(NSLock *)self->_localeSpecificStorageLock unlock];
  return v5;
}

- (void)setLocaleSpecificStorage:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    [(NSLock *)self->_localeSpecificStorageLock lock];
    localeSpecificStorage = self->_localeSpecificStorage;
    if (a3) {
      [(NSMutableDictionary *)localeSpecificStorage setObject:a3 forKey:a4];
    }
    else {
      [(NSMutableDictionary *)localeSpecificStorage removeObjectForKey:a4];
    }
    localeSpecificStorageLock = self->_localeSpecificStorageLock;
    [(NSLock *)localeSpecificStorageLock unlock];
  }
}

- (id)localizedStringWithFormat:(id)a3
{
  return (id)objc_msgSend([NSString alloc], "initWithFormat:locale:arguments:", a3, -[OITSULocale locale](self, "locale"), &v4);
}

- (int64_t)localizedCompare:(id)a3 toString:(id)a4
{
  uint64_t v7 = [a3 length];
  uint64_t v8 = [(OITSULocale *)self locale];
  return objc_msgSend(a3, "compare:options:range:locale:", a4, 0, 0, v7, v8);
}

- (int64_t)localizedCaseInsensitiveCompare:(id)a3 toString:(id)a4
{
  uint64_t v7 = [a3 length];
  uint64_t v8 = [(OITSULocale *)self locale];
  return objc_msgSend(a3, "compare:options:range:locale:", a4, 1, 0, v7, v8);
}

- (BOOL)localizedCaseInsensitiveIsEqual:(id)a3 toString:(id)a4
{
  return [(OITSULocale *)self localizedCaseInsensitiveCompare:a3 toString:a4] == 0;
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)[MEMORY[0x263EFFA18] systemTimeZone];
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  objc_sync_enter(self);
  if (!sLocalizedStringBundle)
  {
    uint64_t v7 = objc_opt_class();
    [v7 setLocalizedStringBundle:CFBundleGetMainBundle()];
    CFURLRef v8 = CFBundleCopyBundleURL((CFBundleRef)sLocalizedStringBundle);
    CFRelease(v8);
  }
  objc_sync_exit(self);
  return a3;
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5
{
  return [(OITSULocale *)self URLForResource:a3 withExtension:a4 subdirectory:a5 inBundle:sLocalizedStringBundle];
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5 inBundleWithURL:(id)a6
{
  CFBundleRef v10 = CFBundleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFURLRef)a6);
  id v11 = [(OITSULocale *)self URLForResource:a3 withExtension:a4 subdirectory:a5 inBundle:v10];
  CFRelease(v10);
  return v11;
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5 inBundle:(__CFBundle *)a6
{
  v16[1] = *MEMORY[0x263EF8340];
  CFArrayRef v11 = CFBundleCopyBundleLocalizations(a6);
  v16[0] = [(OITSULocale *)self localeIdentifierWithLanguageAndRegionOnly];
  CFArrayRef v12 = CFBundleCopyLocalizationsForPreferences(v11, (CFArrayRef)[MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1]);
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v12, 0);
  CFURLRef v14 = CFBundleCopyResourceURLForLocalization(a6, (CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, ValueAtIndex);
  CFRelease(v11);
  CFRelease(v12);
  return v14;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSString)documentLanguageIdentifier
{
  return self->_documentLanguageIdentifier;
}

- (BOOL)isAutoUpdating
{
  return self->_isAutoUpdating;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSString)decimalSeparator
{
  return self->_decimalSeparator;
}

- (NSString)currencyDecimalSeparator
{
  return self->_currencyDecimalSeparator;
}

- (NSString)groupingSeparator
{
  return self->_groupingSeparator;
}

- (NSString)currencyGroupingSeparator
{
  return self->_currencyGroupingSeparator;
}

- (NSString)listSeparator
{
  return self->_listSeparator;
}

- (unint64_t)groupingSize
{
  return self->_groupingSize;
}

- (NSString)percentSymbol
{
  return self->_percentSymbol;
}

- (NSLocale)gregorianCalendarLocale
{
  return self->_gregorianCalendarLocale;
}

- (int64_t)dateComponentOrdering
{
  return self->_dateComponentOrdering;
}

- (NSArray)monthSymbols
{
  return self->_monthSymbols;
}

- (NSArray)standaloneMonthSymbols
{
  return self->_standaloneMonthSymbols;
}

- (NSArray)weekdaySymbols
{
  return self->_weekdaySymbols;
}

- (NSArray)standaloneWeekdaySymbols
{
  return self->_standaloneWeekdaySymbols;
}

- (NSArray)shortMonthSymbols
{
  return self->_shortMonthSymbols;
}

- (NSArray)shortStandaloneMonthSymbols
{
  return self->_shortStandaloneMonthSymbols;
}

- (NSArray)shortWeekdaySymbols
{
  return self->_shortWeekdaySymbols;
}

- (NSArray)shortStandaloneWeekdaySymbols
{
  return self->_shortStandaloneWeekdaySymbols;
}

- (NSString)trueString
{
  return self->_trueString;
}

- (NSString)falseString
{
  return self->_falseString;
}

- (OITSUDateParserLibrary)dateParserLibrary
{
  return self->_dateParserLibrary;
}

- (NSString)amString
{
  return self->_amString;
}

- (NSString)pmString
{
  return self->_pmString;
}

@end