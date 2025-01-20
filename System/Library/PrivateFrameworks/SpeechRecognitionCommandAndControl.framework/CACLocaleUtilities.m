@interface CACLocaleUtilities
+ (BOOL)isLocaleIdentifier:(id)a3 containedInLocaleIdentifiers:(id)a4;
+ (BOOL)isSameLangaugeFromLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4;
+ (BOOL)isSameLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4;
+ (id)_localizedUIStringForKey:(id)a3 forResource:(id)a4;
+ (id)_localizedUIStringForKey:(id)a3 forResource:(id)a4 locale:(id)a5;
+ (id)componentsFromLocaleIdentifier:(id)a3;
+ (id)displayStringForByteSize:(unint64_t)a3;
+ (id)displayStringForTimeRemaining:(double)a3;
+ (id)localizedDisplayStringForLocaleIdentifier:(id)a3;
+ (id)localizedUIStringForBuiltinCommandsMiniDescriptionsKey:(id)a3;
+ (id)localizedUIStringForKey:(id)a3;
+ (id)normalizedLocaleIdentifier:(id)a3;
+ (id)siriLocaleUIStringForKey:(id)a3;
+ (id)systemLocaleIdentifier;
+ (id)systemUILocale;
@end

@implementation CACLocaleUtilities

+ (id)systemUILocale
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x263EFF960] preferredLanguages];
  v4 = (void *)MEMORY[0x263F086E0];
  v5 = [v2 localizations];
  v6 = [v4 preferredLocalizationsFromArray:v5 forPreferences:v3];

  v7 = [v6 firstObject];

  return v7;
}

+ (id)localizedUIStringForKey:(id)a3
{
  return (id)[a1 _localizedUIStringForKey:a3 forResource:@"Localizable"];
}

+ (id)localizedUIStringForBuiltinCommandsMiniDescriptionsKey:(id)a3
{
  return (id)[a1 _localizedUIStringForKey:a3 forResource:@"BuiltinCommandsMiniDescriptions"];
}

+ (id)siriLocaleUIStringForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v5 spokenLanguageCode];

  v7 = [a1 _localizedUIStringForKey:v4 forResource:@"Localizable" locale:v6];

  return v7;
}

+ (id)_localizedUIStringForKey:(id)a3 forResource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 systemUILocale];
  v9 = [a1 _localizedUIStringForKey:v7 forResource:v6 locale:v8];

  return v9;
}

+ (id)_localizedUIStringForKey:(id)a3 forResource:(id)a4 locale:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = v10;
  if (!v9)
  {
    v13 = 0;
    goto LABEL_6;
  }
  v12 = [v10 localizedStringForKey:v7 value:0 table:v8 localization:v9];
  v13 = v12;
  if (!v12 || (v14 = v12, [v12 isEqual:v7]))
  {
LABEL_6:
    v15 = +[CACLocaleUtilities normalizedLocaleIdentifier:v9];
    v14 = [v11 localizedStringForKey:v7 value:0 table:v8 localization:v15];

    if (!v14) {
      goto LABEL_8;
    }
  }
  if (![v14 isEqual:v7]) {
    goto LABEL_14;
  }
LABEL_8:
  v16 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:v9];
  v17 = [v16 objectForKey:*MEMORY[0x263EFF508]];

  if (v17)
  {
    v18 = [v11 localizedStringForKey:v7 value:0 table:v8 localization:v17];
    v19 = v18;
    if (v18 && ([v18 isEqual:v7] & 1) == 0)
    {

      v14 = v19;
      goto LABEL_14;
    }
  }
  else
  {
    v19 = 0;
  }

  if (v14)
  {
LABEL_14:
    if (![v14 isEqual:v7]) {
      goto LABEL_16;
    }
  }
  uint64_t v20 = [v11 localizedStringForKey:v7 value:&stru_26EB332F0 table:v8];

  v14 = (void *)v20;
LABEL_16:

  return v14;
}

+ (id)componentsFromLocaleIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (componentsFromLocaleIdentifier__staticLocaleComponentsCacheSetup != -1) {
      dispatch_once(&componentsFromLocaleIdentifier__staticLocaleComponentsCacheSetup, &__block_literal_global_21);
    }
    id v4 = (id)sLocaleComponentsCache;
    objc_sync_enter(v4);
    v5 = [(id)sLocaleComponentsCache objectForKey:v3];
    if (!v5)
    {
      v5 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:v3];
      if (v5) {
        [(id)sLocaleComponentsCache setObject:v5 forKey:v3];
      }
    }
    objc_sync_exit(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __53__CACLocaleUtilities_componentsFromLocaleIdentifier___block_invoke()
{
  sLocaleComponentsCache = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)systemLocaleIdentifier
{
  System = CFLocaleGetSystem();
  if (System)
  {
    System = [NSString stringWithString:MEMORY[0x23EC8E300]()];
  }
  return System;
}

+ (BOOL)isSameLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = +[CACLocaleUtilities componentsFromLocaleIdentifier:a3];
  id v7 = +[CACLocaleUtilities componentsFromLocaleIdentifier:v5];

  uint64_t v8 = *MEMORY[0x263EFF508];
  uint64_t v9 = [v6 objectForKey:*MEMORY[0x263EFF508]];
  if (!v9) {
    goto LABEL_4;
  }
  v10 = (void *)v9;
  uint64_t v11 = [v7 objectForKey:v8];
  if (!v11)
  {
    BOOL v16 = 0;
    goto LABEL_17;
  }
  v12 = (void *)v11;
  v13 = [v6 objectForKey:v8];
  v14 = [v7 objectForKey:v8];
  uint64_t v15 = [v13 caseInsensitiveCompare:v14];

  if (!v15)
  {
    uint64_t v17 = *MEMORY[0x263EFF4D0];
    v10 = [v6 objectForKey:*MEMORY[0x263EFF4D0]];
    if (!v10)
    {
      v12 = [v7 objectForKey:v17];
      if (!v12)
      {
        BOOL v16 = 1;
LABEL_16:

        goto LABEL_17;
      }
    }
    uint64_t v18 = [v6 objectForKey:v17];
    if (v18)
    {
      v19 = (void *)v18;
      uint64_t v20 = [v7 objectForKey:v17];
      if (v20)
      {
        v21 = (void *)v20;
        v22 = [v6 objectForKey:v17];
        v23 = [v7 objectForKey:v17];
        BOOL v16 = [v22 caseInsensitiveCompare:v23] == 0;

        if (!v10) {
          goto LABEL_16;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    BOOL v16 = 0;
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_4:
  BOOL v16 = 0;
LABEL_18:

  return v16;
}

+ (BOOL)isSameLangaugeFromLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = +[CACLocaleUtilities componentsFromLocaleIdentifier:a3];
  id v7 = +[CACLocaleUtilities componentsFromLocaleIdentifier:v5];

  uint64_t v8 = *MEMORY[0x263EFF508];
  uint64_t v9 = [v6 objectForKey:*MEMORY[0x263EFF508]];
  if (v9)
  {
    v10 = [v7 objectForKey:v8];
    if (v10)
    {
      uint64_t v11 = [v6 objectForKey:v8];
      v12 = [v7 objectForKey:v8];
      BOOL v13 = [v11 caseInsensitiveCompare:v12] == 0;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)isLocaleIdentifier:(id)a3 containedInLocaleIdentifiers:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (+[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v5, *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)normalizedLocaleIdentifier:(id)a3
{
  id v3 = [MEMORY[0x263EFF960] canonicalLocaleIdentifierFromString:a3];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  return v4;
}

+ (id)displayStringForByteSize:(unint64_t)a3
{
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = objc_opt_new();
  [v5 setFormatterBehavior:1040];
  [v5 setNumberStyle:1];
  [v5 setMinimumFractionDigits:0];
  if (a3 <= 0x3E7)
  {
    id v6 = NSString;
    uint64_t v7 = [v4 localizedStringForKey:@"ByteSize" value:&stru_26EB332F0 table:0];
    uint64_t v8 = NSNumber;
    unint64_t v9 = a3;
LABEL_7:
    uint64_t v10 = [v8 numberWithUnsignedLongLong:v9];
    goto LABEL_8;
  }
  if (a3 <= 0xF423F)
  {
    id v6 = NSString;
    uint64_t v7 = [v4 localizedStringForKey:@"KBSize" value:&stru_26EB332F0 table:0];
    uint64_t v8 = NSNumber;
    unint64_t v9 = (a3 + 500) / 0x3E8uLL;
    goto LABEL_7;
  }
  if (a3 <= 0x3B9AC9FF)
  {
    id v6 = NSString;
    uint64_t v7 = [v4 localizedStringForKey:@"MBSize" value:&stru_26EB332F0 table:0];
    uint64_t v8 = NSNumber;
    unint64_t v9 = (a3 + 500000) / 0xF4240uLL;
    goto LABEL_7;
  }
  [v5 setMaximumFractionDigits:1];
  id v6 = NSString;
  uint64_t v7 = [v4 localizedStringForKey:@"GBSize" value:&stru_26EB332F0 table:0];
  uint64_t v10 = [NSNumber numberWithDouble:(double)a3 / 1000000000.0];
LABEL_8:
  long long v11 = (void *)v10;
  long long v12 = [v5 stringForObjectValue:v10];
  long long v13 = objc_msgSend(v6, "stringWithFormat:", v7, v12);

  return v13;
}

+ (id)displayStringForTimeRemaining:(double)a3
{
  if (a3 < 120.0)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"DownloadingProgressTimeRemainingLessThanAMinute" value:&stru_26EB332F0 table:0];
LABEL_3:
    id v6 = (void *)v5;
    goto LABEL_10;
  }
  if (a3 >= 3300.0)
  {
    if (a3 < 7200.0)
    {
      id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = [v4 localizedStringForKey:@"DownloadingProgressTimeRemainingAboutAnHour" value:&stru_26EB332F0 table:0];
      goto LABEL_3;
    }
    long long v13 = NSString;
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v4 localizedStringForKey:@"DownloadingProgressTimeRemainingNHours" value:&stru_26EB332F0 table:0];
    long long v14 = (void *)MEMORY[0x263F08A30];
    uint64_t v10 = [NSNumber numberWithInt:(int)(a3 / 3600.0)];
    long long v11 = [v14 localizedStringFromNumber:v10 numberStyle:1];
    uint64_t v12 = objc_msgSend(v13, "stringWithFormat:", v8, v11);
  }
  else
  {
    uint64_t v7 = NSString;
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v4 localizedStringForKey:@"DownloadingProgressTimeRemainingNMinutes" value:&stru_26EB332F0 table:0];
    unint64_t v9 = (void *)MEMORY[0x263F08A30];
    uint64_t v10 = [NSNumber numberWithInt:(int)(a3 / 60.0)];
    long long v11 = [v9 localizedStringFromNumber:v10 numberStyle:1];
    uint64_t v12 = objc_msgSend(v7, "stringWithFormat:", v8, v11);
  }
  id v6 = (void *)v12;

LABEL_10:
  return v6;
}

+ (id)localizedDisplayStringForLocaleIdentifier:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF960];
  id v4 = a3;
  uint64_t v5 = [v3 currentLocale];
  id v6 = [v5 localizedStringForLocaleIdentifier:v4];

  return v6;
}

@end