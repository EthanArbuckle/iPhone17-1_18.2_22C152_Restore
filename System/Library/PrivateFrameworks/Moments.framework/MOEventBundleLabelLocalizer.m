@interface MOEventBundleLabelLocalizer
+ (BOOL)internalInstall;
+ (BOOL)isPreferredLanguageMidSentenceCaseCapable;
+ (BOOL)isPreferredLanguageNounCap;
+ (BOOL)isPreferredLanguageTitlecaseCapable;
+ (id)_MomentsBundle;
+ (id)_MomentsDefaultLanguageBundle;
+ (id)_Moments_AllCapitalizedStringForKey:(id)a3;
+ (id)_Moments_CapitalizedStringForKey:(id)a3;
+ (id)_Moments_LocalizedNounForKey:(id)a3;
+ (id)_Moments_LocalizedStringForKey:(id)a3;
+ (id)_Moments_LocalizedStringForKey:(id)a3 withTable:(id)a4;
+ (id)_Moments_LocalizedStringWithFormat:(id)a3 arguments:(id)a4;
+ (id)_Moments_LowercaseNounForKey:(id)a3;
+ (id)_Moments_TitleCapitalizedStringForKey:(id)a3;
+ (id)__Moments_TitleCapitalizedStringForKey:(id)a3;
+ (id)preferredLocalization;
@end

@implementation MOEventBundleLabelLocalizer

+ (id)_MomentsBundle
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

+ (id)_MomentsDefaultLanguageBundle
{
  v2 = +[MOEventBundleLabelLocalizer _MomentsBundle];
  uint64_t v3 = [v2 pathForResource:@"en" ofType:@"lproj"];
  v4 = [MEMORY[0x1E4F28B50] bundleWithPath:v3];

  return v4;
}

+ (id)preferredLocalization
{
  v2 = +[MOEventBundleLabelLocalizer _MomentsBundle];
  uint64_t v3 = [v2 preferredLocalizations];
  v4 = [v3 firstObject];

  if (!v4)
  {
    v5 = +[MOEventBundleLabelLocalizer _MomentsDefaultLanguageBundle];

    v6 = [v5 preferredLocalizations];
    v4 = [v6 firstObject];

    v2 = v5;
  }

  return v4;
}

+ (BOOL)isPreferredLanguageNounCap
{
  v2 = +[MOEventBundleLabelLocalizer _MomentsBundle];
  uint64_t v3 = [v2 preferredLocalizations];
  v4 = [v3 firstObject];

  LOBYTE(v3) = [v4 isEqualToString:@"de"];
  return (char)v3;
}

+ (BOOL)isPreferredLanguageTitlecaseCapable
{
  v2 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F29323E0];
  uint64_t v3 = +[MOEventBundleLabelLocalizer _MomentsBundle];
  v4 = [v3 preferredLocalizations];
  v5 = [v4 firstObject];

  LOBYTE(v4) = [v2 containsObject:v5];
  return (char)v4;
}

+ (BOOL)isPreferredLanguageMidSentenceCaseCapable
{
  v2 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F29323F8];
  uint64_t v3 = +[MOEventBundleLabelLocalizer _MomentsBundle];
  v4 = [v3 preferredLocalizations];
  v5 = [v4 firstObject];

  LOBYTE(v4) = [v2 containsObject:v5] ^ 1;
  return (char)v4;
}

+ (id)_Moments_LocalizedNounForKey:(id)a3
{
  uint64_t v3 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:a3];
  if (+[MOEventBundleLabelLocalizer isPreferredLanguageNounCap])
  {
    uint64_t v4 = +[MOEventBundleLabelLocalizer __Moments_TitleCapitalizedStringForKey:v3];

    uint64_t v3 = (void *)v4;
  }
  return v3;
}

+ (id)_Moments_LocalizedStringForKey:(id)a3 withTable:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    if ([v7 length])
    {
      v9 = +[MOEventBundleLabelLocalizer _MomentsBundle];
      v10 = [v9 localizedStringForKey:v7 value:@"_Key_Not_Found_" table:v8];
      if ([@"_Key_Not_Found_" isEqualToString:v10])
      {
        v11 = +[MOEventBundleLabelLocalizer _MomentsDefaultLanguageBundle];
        id v12 = [v11 localizedStringForKey:v7 value:@"_Key_Not_Found_" table:v8];
        v13 = _mo_log_facility_get_os_log(MOLogFacilityFramework);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v20 = 138412802;
          id v21 = v7;
          __int16 v22 = 2112;
          v23 = v11;
          __int16 v24 = 2112;
          id v25 = v12;
          _os_log_error_impl(&dword_1D24AE000, v13, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer key is not found, key, %@, default language bundle, %@, default localized string, %@", (uint8_t *)&v20, 0x20u);
        }

        v14 = _mo_log_facility_get_os_log(MOLogFacilityFramework);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:]((uint64_t)v7, v9, v14);
        }

        if ([@"_Key_Not_Found_" isEqualToString:v10])
        {
          id v15 = v7;

          id v12 = v15;
        }
        else if (!v12)
        {
          id v12 = v7;
        }
      }
      else
      {
        v18 = _mo_log_facility_get_os_log(MOLogFacilityFramework);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:]((uint64_t)v7, v10);
        }

        id v12 = v10;
      }
    }
    else
    {
      id v12 = v7;
    }
  }
  else
  {
    v16 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:](v16);
    }

    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"MOEventBundleLabelLocalizer.m" lineNumber:93 description:@"Invalid parameter not satisfying: key"];

    id v12 = 0;
  }

  return v12;
}

+ (id)_Moments_LocalizedStringForKey:(id)a3
{
  return +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:a3 withTable:0];
}

+ (id)_Moments_LocalizedStringWithFormat:(id)a3 arguments:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v25 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelFormat initWithFormat:capitalizationType:](v25);
    }

    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"MOEventBundleLabelLocalizer.m" lineNumber:138 description:@"Invalid parameter not satisfying: format"];
    goto LABEL_26;
  }
  id v9 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v7];
  v10 = _mo_log_facility_get_os_log(MOLogFacilityFramework);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.7((uint64_t)v9, v8);
  }

  v11 = _mo_log_facility_get_os_log(MOLogFacilityFramework);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.6((uint64_t)v9, v8);
  }

  if (!v9)
  {
    uint64_t v26 = _mo_log_facility_get_os_log(MOLogFacilityFramework);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:]((uint64_t)v7, v26);
    }

LABEL_26:
    v23 = 0;
    goto LABEL_31;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v29 = v8;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
        v18 = _mo_log_facility_get_os_log(MOLogFacilityFramework);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:&v35 arguments:v18];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v14);
  }

  if ([v12 count])
  {
    uint64_t v19 = [v12 count];
    objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", 8 * objc_msgSend(v12, "count"));
    id v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getObjects:range:", objc_msgSend(v20, "mutableBytes"), 0, v19);
    id v21 = [NSString alloc];
    id v22 = v20;
    v23 = objc_msgSend(v21, "initWithFormat:arguments:", v9, objc_msgSend(v22, "mutableBytes"));
    __int16 v24 = _mo_log_facility_get_os_log(MOLogFacilityFramework);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.4(v23, v24);
    }
  }
  else
  {
    v27 = _mo_log_facility_get_os_log(MOLogFacilityFramework);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:]((uint64_t)v9, v27);
    }

    id v9 = v9;
    v23 = v9;
  }
  id v8 = v29;
LABEL_31:

  return v23;
}

+ (id)_Moments_CapitalizedStringForKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = v4;
    if ((unint64_t)[v5 length] > 1)
    {
      id v7 = [v5 substringToIndex:1];
      id v8 = [v7 uppercaseString];
      id v9 = [v5 substringFromIndex:1];
      v6 = [v8 stringByAppendingString:v9];

      id v5 = v7;
    }
    else
    {
      v6 = [v5 localizedCapitalizedString];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_Moments_TitleCapitalizedStringForKey:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    if ([a1 isPreferredLanguageTitlecaseCapable])
    {
      id v6 = +[MOEventBundleLabelLocalizer __Moments_TitleCapitalizedStringForKey:v5];
    }
    else
    {
      id v6 = v5;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)__Moments_TitleCapitalizedStringForKey:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v6 = (void *)[v4 mutableCopy];
    uint64_t v7 = [v6 length];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __70__MOEventBundleLabelLocalizer___Moments_TitleCapitalizedStringForKey___block_invoke;
    uint64_t v15 = &unk_1E691FD80;
    id v16 = v6;
    id v17 = v5;
    id v8 = v5;
    id v9 = v6;
    objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 1027, &v12);
    v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __70__MOEventBundleLabelLocalizer___Moments_TitleCapitalizedStringForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v14 = v7;
    if ([v7 length])
    {
      id v8 = [MEMORY[0x1E4F28B88] lowercaseLetterCharacterSet];
      int v9 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", 0));

      v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      if (a3)
      {
        if ((objc_msgSend(v10, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a3 - 1)) & v9 & 1) == 0)
        {
LABEL_6:

          goto LABEL_7;
        }
      }
      else if (!v9)
      {
        goto LABEL_6;
      }
      v11 = *(void **)(a1 + 32);
      uint64_t v12 = [v14 capitalizedStringWithLocale:*(void *)(a1 + 40)];
      objc_msgSend(v11, "replaceCharactersInRange:withString:", a3, a4, v12);

      goto LABEL_6;
    }
  }
LABEL_7:
  return MEMORY[0x1F41817F8]();
}

+ (id)_Moments_AllCapitalizedStringForKey:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = [v4 localizedUppercaseString];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)_Moments_LowercaseNounForKey:(id)a3
{
  id v3 = a3;
  if (+[MOEventBundleLabelLocalizer isPreferredLanguageNounCap])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 lowercaseString];
  }
  id v5 = v4;

  return v5;
}

+ (BOOL)internalInstall
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) == 1;
  CFRelease(v3);
  return v5;
}

+ (void)_Moments_LocalizedStringForKey:(os_log_t)log withTable:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", v1, 2u);
}

+ (void)_Moments_LocalizedStringForKey:(NSObject *)a3 withTable:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v7 = [v6 firstObject];
  id v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v9 = [v8 localeIdentifier];
  v10 = [a2 preferredLocalizations];
  v11 = [v10 firstObject];
  int v12 = 138413058;
  uint64_t v13 = a1;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  __int16 v16 = 2112;
  id v17 = v9;
  __int16 v18 = 2112;
  uint64_t v19 = v11;
  _os_log_error_impl(&dword_1D24AE000, a3, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer key is not found, key, %@, locale preferredLanguage, %@, locale, %@, framework preferredLocalization, %@", (uint8_t *)&v12, 0x2Au);
}

+ (void)_Moments_LocalizedStringForKey:(uint64_t)a1 withTable:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  id v8 = [a2 mask];
  OUTLINED_FUNCTION_1_3(&dword_1D24AE000, v2, v3, "MOEventBundleLabelLocalizer localizedString, key, %@, value, %@", v4, v5, v6, v7, 2u);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer return nil for format, %@, localizedFormat, %@", (uint8_t *)&v2, 0x16u);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer output string, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_Moments_LocalizedStringWithFormat:(void *)a1 arguments:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 mask];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer output string, %@", (uint8_t *)&v4, 0xCu);
}

+ (void)_Moments_LocalizedStringWithFormat:(void *)a3 arguments:(NSObject *)a4 .cold.5(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 mask];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1D24AE000, a4, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer arg, %@", a1, 0xCu);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(void *)a2 .cold.6(uint64_t a1, void *a2)
{
  [a2 count];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3(&dword_1D24AE000, v2, v3, "MOEventBundleLabelLocalizer format, %@, args.count, %lu", v4, v5, v6, v7, v8);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(void *)a2 .cold.7(uint64_t a1, void *a2)
{
  [a2 count];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3(&dword_1D24AE000, v2, v3, "format, %@, args.count, %lu", v4, v5, v6, v7, v8);
}

@end