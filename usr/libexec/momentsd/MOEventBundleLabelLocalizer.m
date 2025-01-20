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
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

+ (id)_MomentsDefaultLanguageBundle
{
  uint64_t v2 = +[MOEventBundleLabelLocalizer _MomentsBundle];
  v3 = [v2 pathForResource:@"en" ofType:@"lproj"];
  v4 = +[NSBundle bundleWithPath:v3];

  return v4;
}

+ (id)preferredLocalization
{
  uint64_t v2 = +[MOEventBundleLabelLocalizer _MomentsBundle];
  v3 = [v2 preferredLocalizations];
  v4 = [v3 firstObject];

  if (!v4)
  {
    v5 = +[MOEventBundleLabelLocalizer _MomentsDefaultLanguageBundle];

    v6 = [v5 preferredLocalizations];
    v4 = [v6 firstObject];

    uint64_t v2 = v5;
  }

  return v4;
}

+ (BOOL)isPreferredLanguageNounCap
{
  uint64_t v2 = +[MOEventBundleLabelLocalizer _MomentsBundle];
  v3 = [v2 preferredLocalizations];
  v4 = [v3 firstObject];

  LOBYTE(v3) = [v4 isEqualToString:@"de"];
  return (char)v3;
}

+ (BOOL)isPreferredLanguageTitlecaseCapable
{
  uint64_t v2 = +[NSSet setWithArray:&off_1002F8EE8];
  v3 = +[MOEventBundleLabelLocalizer _MomentsBundle];
  v4 = [v3 preferredLocalizations];
  v5 = [v4 firstObject];

  LOBYTE(v4) = [v2 containsObject:v5];
  return (char)v4;
}

+ (BOOL)isPreferredLanguageMidSentenceCaseCapable
{
  uint64_t v2 = +[NSSet setWithArray:&off_1002F8F00];
  v3 = +[MOEventBundleLabelLocalizer _MomentsBundle];
  v4 = [v3 preferredLocalizations];
  v5 = [v4 firstObject];

  LOBYTE(v4) = [v2 containsObject:v5] ^ 1;
  return (char)v4;
}

+ (id)_Moments_LocalizedNounForKey:(id)a3
{
  v3 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:a3];
  if (+[MOEventBundleLabelLocalizer isPreferredLanguageNounCap])
  {
    uint64_t v4 = +[MOEventBundleLabelLocalizer __Moments_TitleCapitalizedStringForKey:v3];

    v3 = (void *)v4;
  }

  return v3;
}

+ (id)_Moments_LocalizedStringForKey:(id)a3 withTable:(id)a4
{
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
        v13 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v20 = 138412802;
          id v21 = v7;
          __int16 v22 = 2112;
          v23 = v11;
          __int16 v24 = 2112;
          id v25 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer key is not found, key, %@, default language bundle, %@, default localized string, %@", (uint8_t *)&v20, 0x20u);
        }

        v14 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
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
        v18 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
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
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:withTable:](v16);
    }

    v17 = +[NSAssertionHandler currentHandler];
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
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v25 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelFormat initWithFormat:capitalizationType:](v25);
    }

    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"MOEventBundleLabelLocalizer.m" lineNumber:138 description:@"Invalid parameter not satisfying: format"];
    goto LABEL_26;
  }
  id v9 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:v7];
  v10 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.7((uint64_t)v9, v8);
  }

  v11 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.6((uint64_t)v9, v8);
  }

  if (!v9)
  {
    v26 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:]((uint64_t)v7, v26);
    }

LABEL_26:
    id v23 = 0;
    goto LABEL_31;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v29 = v8;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v16);
        v18 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:&v35 arguments:v18];
        }

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v14);
  }

  if ([v12 count])
  {
    id v19 = [v12 count];
    +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 8 * (void)[v12 count]);
    id v20 = objc_claimAutoreleasedReturnValue();
    [v12 getObjects:objc_msgSend(v20, "mutableBytes") range:v19];
    id v21 = objc_alloc((Class)NSString);
    id v22 = v20;
    id v23 = [v21 initWithFormat:v9 arguments:objc_msgSend(v22, "mutableBytes")];
    __int16 v24 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:].cold.4(v23, v24);
    }
  }
  else
  {
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      +[MOEventBundleLabelLocalizer _Moments_LocalizedStringWithFormat:arguments:]((uint64_t)v9, v27);
    }

    id v9 = v9;
    id v23 = v9;
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
    id v5 = +[NSLocale currentLocale];
    id v6 = [v4 mutableCopy];
    id v7 = [v6 length];
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = __70__MOEventBundleLabelLocalizer___Moments_TitleCapitalizedStringForKey___block_invoke;
    uint64_t v15 = &unk_1002CE890;
    id v16 = v6;
    id v17 = v5;
    id v8 = v5;
    id v9 = v6;
    [v9 enumerateSubstringsInRange:0 options:v7 usingBlock:&v12];
    id v10 = [v9 copy:v12 v13 v14 v15];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __70__MOEventBundleLabelLocalizer___Moments_TitleCapitalizedStringForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = v7;
  if (v7)
  {
    uint64_t v15 = v7;
    id v7 = [v7 length];
    id v8 = v15;
    if (v7)
    {
      id v9 = +[NSCharacterSet lowercaseLetterCharacterSet];
      unsigned int v10 = [v9 characterIsMember:[v15 characterAtIndex:0]];

      v11 = +[NSCharacterSet whitespaceCharacterSet];
      if (a3)
      {
        if ((objc_msgSend(v11, "characterIsMember:", objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", a3 - 1)) & v10 & 1) == 0)
        {
LABEL_6:

          id v8 = v15;
          goto LABEL_7;
        }
      }
      else if (!v10)
      {
        goto LABEL_6;
      }
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = [v15 capitalizedStringWithLocale:*(void *)(a1 + 40)];
      [v12 replaceCharactersInRange:a3 withString:a4];

      goto LABEL_6;
    }
  }
LABEL_7:

  return _objc_release_x1(v7, v8);
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
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", v1, 2u);
}

+ (void)_Moments_LocalizedStringForKey:(NSObject *)a3 withTable:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  id v6 = +[NSLocale preferredLanguages];
  id v7 = [v6 firstObject];
  id v8 = +[NSLocale currentLocale];
  id v9 = [v8 localeIdentifier];
  unsigned int v10 = [a2 preferredLocalizations];
  v11 = [v10 firstObject];
  int v12 = 138413058;
  uint64_t v13 = a1;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  __int16 v16 = 2112;
  id v17 = v9;
  __int16 v18 = 2112;
  id v19 = v11;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer key is not found, key, %@, locale preferredLanguage, %@, locale, %@, framework preferredLocalization, %@", (uint8_t *)&v12, 0x2Au);
}

+ (void)_Moments_LocalizedStringForKey:(uint64_t)a1 withTable:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  id v8 = [a2 mask];
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v2, v3, "MOEventBundleLabelLocalizer localizedString, key, %@, value, %@", v4, v5, v6, v7, 2u);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "MOEventBundleLabelLocalizer return nil for format, %@, localizedFormat, %@", (uint8_t *)&v2, 0x16u);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer output string, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_Moments_LocalizedStringWithFormat:(void *)a1 arguments:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 mask];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer output string, %@", (uint8_t *)&v4, 0xCu);
}

+ (void)_Moments_LocalizedStringWithFormat:(void *)a3 arguments:(NSObject *)a4 .cold.5(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 mask];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "MOEventBundleLabelLocalizer arg, %@", a1, 0xCu);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(void *)a2 .cold.6(uint64_t a1, void *a2)
{
  [a2 count];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v2, v3, "MOEventBundleLabelLocalizer format, %@, args.count, %lu", v4, v5, v6, v7, v8);
}

+ (void)_Moments_LocalizedStringWithFormat:(uint64_t)a1 arguments:(void *)a2 .cold.7(uint64_t a1, void *a2)
{
  [a2 count];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v2, v3, "format, %@, args.count, %lu", v4, v5, v6, v7, v8);
}

@end