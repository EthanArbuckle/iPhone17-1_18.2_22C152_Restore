void __IsLargeIPad_block_invoke()
{
  CFDictionaryRef v0;
  CFDictionaryRef v1;
  int v2;
  BOOL v4;
  id v5;
  uint64_t vars8;

  v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFDictionaryGetValue(v0, @"ArtworkDeviceSubType");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v2 = [v5 intValue];
      v4 = v2 == 2732 || v2 == 2752;
      IsLargeIPad_isLarge = v4;
    }
    CFRelease(v1);
  }
}

void __TIGetHardwareLayoutGroups_block_invoke()
{
  uint64_t v0 = +[8 objectForKey:@"HWLayoutGroups.plist"];
  v1 = (void *)TIGetHardwareLayoutGroups___layoutGroups;
  TIGetHardwareLayoutGroups___layoutGroups = v0;

  if (!TIGetHardwareLayoutGroups___layoutGroups)
  {
    TIGetTextInputFrameworkPath();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = TILoadBundlePlist(@"HWLayoutGroups.plist", v4);
    v3 = (void *)TIGetHardwareLayoutGroups___layoutGroups;
    TIGetHardwareLayoutGroups___layoutGroups = v2;
  }
}

id TIGetDefaultDictationLanguagesForKeyboardLanguage(void *a1)
{
  id v1 = a1;
  if (TIGetDefaultDictationLanguagesForKeyboardLanguage_once != -1) {
    dispatch_once(&TIGetDefaultDictationLanguagesForKeyboardLanguage_once, &__block_literal_global_347_2016);
  }
  uint64_t v2 = [(id)TIGetDefaultDictationLanguagesForKeyboardLanguage___defaultDictationLanguageProperties objectForKey:v1];
  if (!v2)
  {
    v3 = TIInputModeGetBaseLanguage(v1);
    id v4 = _UIKeyboardBundleInfoWithKey(v3, @"UIDefaultDictationLanguages");
    uint64_t v5 = [v4 objectForKey:v1];
    if (v5) {
      uint64_t v2 = (void *)v5;
    }
    else {
      uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [(id)TIGetDefaultDictationLanguagesForKeyboardLanguage___defaultDictationLanguageProperties setObject:v2 forKey:v1];
  }
  if (![v2 count])
  {

    uint64_t v2 = 0;
  }

  return v2;
}

id TIInputModeGetVariant(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 rangeOfString:@"-" options:2];
  unint64_t v3 = [v1 rangeOfString:@"@" options:2];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v3 = [v1 length];
  }
  id v4 = 0;
  if (v2 != 0x7FFFFFFFFFFFFFFFLL && v2 < v3)
  {
    id v4 = objc_msgSend(v1, "substringWithRange:", v2 + 1, v3 - (v2 + 1));
  }

  return v4;
}

void ___tiShouldSkipMCObservation_block_invoke()
{
  SecurityLibrary();
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getSecTaskCreateFromSelfSymbolLoc_ptr;
  v10 = getSecTaskCreateFromSelfSymbolLoc_ptr;
  if (!getSecTaskCreateFromSelfSymbolLoc_ptr)
  {
    id v1 = (void *)SecurityLibrary();
    v8[3] = (uint64_t)dlsym(v1, "SecTaskCreateFromSelf");
    getSecTaskCreateFromSelfSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    uint64_t v0 = (uint64_t (*)(void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v0) {
    goto LABEL_12;
  }
  uint64_t v2 = v0(0);
  if (!v2) {
    return;
  }
  unint64_t v3 = (const void *)v2;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v4 = (uint64_t (*)(const void *, void))getSecTaskCopySigningIdentifierSymbolLoc_ptr;
  v10 = getSecTaskCopySigningIdentifierSymbolLoc_ptr;
  if (!getSecTaskCopySigningIdentifierSymbolLoc_ptr)
  {
    uint64_t v5 = (void *)SecurityLibrary();
    v8[3] = (uint64_t)dlsym(v5, "SecTaskCopySigningIdentifier");
    getSecTaskCopySigningIdentifierSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    id v4 = (uint64_t (*)(const void *, void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
LABEL_12:
    dlerror();
    abort_report_np();
    SecurityLibrary();
    return;
  }
  v6 = (void *)v4(v3, 0);
  if (v6) {
    _tiShouldSkipMCObservation__result = [@"com.apple.checkpointd" isEqualToString:v6];
  }
  CFRelease(v3);
}

uint64_t SecurityLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SecurityLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __SecurityLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E555A058;
    uint64_t v5 = 0;
    SecurityLibraryCore_frameworkLibrary = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = SecurityLibraryCore_frameworkLibrary;
    if (SecurityLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return SecurityLibraryCore_frameworkLibrary;
}

id kac_get_log()
{
  if (kac_get_log_onceToken != -1) {
    dispatch_once(&kac_get_log_onceToken, &__block_literal_global_8311);
  }
  uint64_t v0 = (void *)kac_get_log_log;

  return v0;
}

id TIGetHardwareLayoutsForInputMode(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = TIGetInputModeProperties(a1);
  uint64_t v2 = [v1 objectForKey:@"HWLayouts"];

  unint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasPrefix:", @"Group-", (void)v14))
        {
          v10 = TIGetHardwareLayoutGroups();
          v11 = [v10 objectForKey:v9];

          [v3 addObjectsFromArray:v11];
        }
        else
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = [v3 array];

  return v12;
}

id TIGetHardwareLayoutGroups()
{
  if (TIGetHardwareLayoutGroups_onceToken != -1) {
    dispatch_once(&TIGetHardwareLayoutGroups_onceToken, &__block_literal_global_349);
  }
  uint64_t v0 = (void *)TIGetHardwareLayoutGroups___layoutGroups;

  return v0;
}

id TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages(void *a1, void *a2, void *a3)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v65 = a3;
  uint64_t v6 = TIInputModeGetMultilingualID(a1);
  if (![v6 length])
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_69;
  }
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v64 = v5;
  if (v5)
  {
    id v8 = v5;
  }
  else
  {
    uint64_t v9 = +[TIInputModeController sharedInputModeController];
    id v8 = [v9 enabledInputModeIdentifiers];
  }
  id v10 = v8;
  v11 = +[TIInputModeController sharedInputModeController];
  v12 = [v11 supportedInputModeIdentifiers];

  v13 = [MEMORY[0x1E4F1CA48] array];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v75 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        v20 = TIInputModeGetNormalizedIdentifier(v19);
        if ([v12 containsObject:v20]) {
          [v13 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v74 objects:v80 count:16];
    }
    while (v16);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v21 = v13;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v71 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v70 + 1) + 8 * j);
        v27 = TIInputModeGetMultilingualID(v26);
        if ([v6 isEqualToString:v27]
          && (TIInputModeSupportsMultilingual(v26) || TIInputModeIsTransliteration(v26)))
        {
          [v7 addObject:v26];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v70 objects:v79 count:16];
    }
    while (v23);
  }

  if ([v65 count])
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v28 = v7;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v66 objects:v78 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v67;
      while (2)
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v67 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = TIInputModeGetLanguage(*(void **)(*((void *)&v66 + 1) + 8 * k));
          char v34 = [v33 isEqualToString:@"vi"];

          if (v34)
          {
            id v7 = v28;
            goto LABEL_54;
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v66 objects:v78 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    id v35 = v28;
    id v62 = v65;
    v36 = (void *)[v35 mutableCopy];
    v37 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v35, "count"));
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v38 = v35;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v74 objects:v80 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v75;
      do
      {
        for (uint64_t m = 0; m != v40; ++m)
        {
          if (*(void *)v75 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = TIInputModeGetLanguageWithRegion(*(void **)(*((void *)&v74 + 1) + 8 * m));
          [v37 addObject:v43];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v74 objects:v80 count:16];
      }
      while (v40);
    }

    if ([v62 count])
    {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v38, "count"));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      while ([v37 count])
      {
        v44 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:v37 forPreferences:v62];
        v45 = [v44 firstObject];

        uint64_t v46 = [v37 indexOfObject:v45];
        if (v45) {
          BOOL v47 = v46 == 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v47 = 1;
        }
        if (v47)
        {

          break;
        }
        uint64_t v48 = v46;
        v49 = [v36 objectAtIndexedSubscript:v46];
        [v7 addObject:v49];

        [v37 removeObjectAtIndex:v48];
        [v36 removeObjectAtIndex:v48];
      }
    }
    else
    {
      id v7 = v36;
    }

LABEL_54:
  }
  id v5 = v64;
  if (![v7 count]) {
    goto LABEL_68;
  }
  v63 = [v7 firstObject];
  if (TIInputModeSupportsMultilingual(v63) && !TIInputModeIsMultilingualOnly(v63))
  {
    v50 = TIInputModeGetRequiredMultilingualInputModes(v63);
    uint64_t v51 = [v50 count];

    if (!v51) {
      goto LABEL_67;
    }
  }
  uint64_t v52 = [v7 count];
  if (!v52) {
    goto LABEL_67;
  }
  uint64_t v53 = v52;
  uint64_t v54 = 0;
  while (1)
  {
    v55 = [v7 objectAtIndexedSubscript:v54];
    if (TIInputModeSupportsMultilingual(v55)) {
      break;
    }
LABEL_64:

LABEL_66:
    if (v53 == ++v54) {
      goto LABEL_67;
    }
  }
  v56 = [v7 objectAtIndexedSubscript:v54];
  if (TIInputModeIsMultilingualOnly(v56))
  {

    goto LABEL_64;
  }
  v57 = [v7 objectAtIndexedSubscript:v54];
  v58 = TIInputModeGetRequiredMultilingualInputModes(v57);
  uint64_t v59 = [v58 count];

  if (v59) {
    goto LABEL_66;
  }
  if (v54 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v61 = [v7 objectAtIndexedSubscript:v54];
    [v7 removeObjectAtIndex:v54];
    [v7 insertObject:v61 atIndex:0];
  }
LABEL_67:

  id v5 = v64;
LABEL_68:

LABEL_69:

  return v7;
}

id TIInputModeGetMultilingualID(void *a1)
{
  id v1 = TIInputModeGetComponentsFromIdentifier(a1);
  uint64_t v2 = [v1 objectForKey:@"ml"];

  return v2;
}

id TIInputModeGetNormalizedIdentifier(void *a1)
{
  if (a1)
  {
    id v1 = TIInputModeGetComponentsFromIdentifier(a1);
    uint64_t v2 = TIInputModeGetNormalizedIdentifierFromComponents(v1);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id TIInputModeGetNormalizedIdentifierFromComponents(void *a1)
{
  uint64_t v1 = *MEMORY[0x1E4F1C438];
  id v2 = a1;
  unint64_t v3 = [v2 valueForKey:v1];
  id v4 = [v2 valueForKey:*MEMORY[0x1E4F1C400]];
  id v5 = [v2 valueForKey:*MEMORY[0x1E4F1C470]];
  uint64_t v6 = [v2 valueForKey:*MEMORY[0x1E4F1C498]];

  id v7 = TIInputModeGetNormalizedVariant(v6);

  if (!v7)
  {
    if (v5)
    {
      uint64_t v9 = NSString;
      id v14 = v5;
    }
    else
    {
      uint64_t v9 = NSString;
      if (!v4)
      {
        [NSString stringWithFormat:@"%@", v3, v12, v15];
        goto LABEL_14;
      }
      id v14 = v4;
    }
    [v9 stringWithFormat:@"%@_%@", v3, v14, v15];
    goto LABEL_14;
  }
  if (v5)
  {
    id v8 = NSString;
    v13 = v5;
    uint64_t v16 = v7;
LABEL_8:
    [v8 stringWithFormat:@"%@_%@-%@", v3, v13, v16];
    goto LABEL_14;
  }
  id v8 = NSString;
  if (v4)
  {
    v13 = v4;
    uint64_t v16 = v7;
    goto LABEL_8;
  }
  [NSString stringWithFormat:@"%@-%@", v3, v7, v15];
  id v10 = LABEL_14:;

  return v10;
}

id TIInputModeGetLanguage(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    id v2 = TIInputModeGetComponentsFromIdentifier(v1);
    uint64_t v3 = *MEMORY[0x1E4F1C438];
    id v4 = [v2 objectForKey:*MEMORY[0x1E4F1C438]];
    uint64_t v5 = *MEMORY[0x1E4F1C470];
    uint64_t v6 = [v2 objectForKey:*MEMORY[0x1E4F1C470]];
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v4, v3, 0);
    id v8 = v7;
    if (v6) {
      [v7 setObject:v6 forKey:v5];
    }
    uint64_t v9 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id TIInputModeGetComponentsFromIdentifier(void *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    id v7 = 0;
    goto LABEL_39;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_get_components_lock);
  id v2 = (void *)TIInputModeGetComponentsFromIdentifier___componentsCache;
  if (!TIInputModeGetComponentsFromIdentifier___componentsCache)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)TIInputModeGetComponentsFromIdentifier___componentsCache;
    TIInputModeGetComponentsFromIdentifier___componentsCache = (uint64_t)v3;

    id v2 = (void *)TIInputModeGetComponentsFromIdentifier___componentsCache;
  }
  uint64_t v5 = [v2 objectForKey:v1];
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v1];
    unint64_t v9 = [v1 rangeOfString:@"@"];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v10 = v9, v9 >= [v1 length]))
    {
LABEL_28:
      if (([v1 hasPrefix:@"zh_Han"] & 1) != 0
        || [v1 hasPrefix:@"yue_Han"])
      {
        uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v24 = [v8 objectForKey:@"sw"];
        v25 = [v8 objectForKey:@"hw"];
        if (v24) {
          [v23 setObject:v24 forKey:@"sw"];
        }
        if (v25) {
          [v23 setObject:v25 forKey:@"hw"];
        }
        v26 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"_-@@"];
        v27 = [v1 componentsSeparatedByCharactersInSet:v26];

        id v28 = [v27 objectAtIndex:0];
        [v23 setObject:v28 forKey:*MEMORY[0x1E4F1C438]];

        uint64_t v29 = [v27 objectAtIndex:1];
        [v23 setObject:v29 forKey:*MEMORY[0x1E4F1C400]];

        if ((unint64_t)[v27 count] >= 3)
        {
          uint64_t v30 = [v27 objectAtIndex:2];
          [v23 setObject:v30 forKey:*MEMORY[0x1E4F1C498]];
        }
      }
      else
      {
        uint64_t v23 = (void *)[v8 mutableCopy];
        uint64_t v32 = *MEMORY[0x1E4F1C498];
        v33 = [v23 objectForKey:*MEMORY[0x1E4F1C498]];
        uint64_t v24 = TIInputModeGetNormalizedVariant(v33);

        if ([v24 length]) {
          [v23 setValue:v24 forKey:v32];
        }
      }

      [(id)TIInputModeGetComponentsFromIdentifier___componentsCache setObject:v23 forKey:v1];
      os_unfair_lock_unlock((os_unfair_lock_t)&_get_components_lock);
      id v7 = v23;

      goto LABEL_38;
    }
    char v34 = v8;
    id v8 = (void *)[v8 mutableCopy];
    id v35 = v1;
    v11 = [v1 substringFromIndex:v10 + 1];
    uint64_t v12 = [v11 componentsSeparatedByString:@";"];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (!v14) {
      goto LABEL_27;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
LABEL_11:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v37 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v36 + 1) + 8 * v17);
      if ([v18 hasPrefix:@"sw="]
        && (unint64_t)[v18 length] >= 4)
      {
        uint64_t v19 = [v18 substringFromIndex:3];
        v20 = v8;
        id v21 = v19;
        uint64_t v22 = @"sw";
      }
      else if ([v18 hasPrefix:@"hw="] {
             && (unint64_t)[v18 length] >= 4)
      }
      {
        uint64_t v19 = [v18 substringFromIndex:3];
        v20 = v8;
        id v21 = v19;
        uint64_t v22 = @"hw";
      }
      else
      {
        if (!_os_feature_enabled_impl()
          || ![v18 hasPrefix:@"ml="]
          || (unint64_t)[v18 length] < 4)
        {
          goto LABEL_25;
        }
        uint64_t v19 = [v18 substringFromIndex:3];
        v20 = v8;
        id v21 = v19;
        uint64_t v22 = @"ml";
      }
      [v20 setObject:v21 forKey:v22];

LABEL_25:
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (!v15)
        {
LABEL_27:

          id v1 = v35;
          goto LABEL_28;
        }
        goto LABEL_11;
      }
    }
  }
  uint64_t v6 = (void *)v5;
  os_unfair_lock_unlock((os_unfair_lock_t)&_get_components_lock);
  id v7 = v6;
LABEL_38:

LABEL_39:

  return v7;
}

id TIInputModeGetNormalizedVariant(void *a1)
{
  id v1 = a1;
  if (TIInputModeGetNormalizedVariant___onceToken != -1) {
    dispatch_once(&TIInputModeGetNormalizedVariant___onceToken, &__block_literal_global_1956);
  }
  id v2 = v1;
  if ([v1 length])
  {
    id v2 = v1;
    if (([(id)TIInputModeGetNormalizedVariant___variantsToKeepCapitalized containsObject:v1] & 1) == 0)
    {
      id v2 = [v1 capitalizedString];
    }
  }

  return v2;
}

id TIInputModeGetMultilingualSet(void *a1)
{
  return TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages(a1, 0, 0);
}

BOOL TIInputModeIsMultilingualOnly(void *a1)
{
  id v1 = TIInputModeGetNormalizedIdentifier(a1);
  id v2 = TIGetInputModeProperties(v1);
  id v3 = [v2 objectForKeyedSubscript:@"UIKeyboardMultilingualOnly"];
  BOOL v4 = v3 != 0;

  return v4;
}

BOOL isManagedPreferenceKey(void *a1)
{
  id v1 = managedConfigurationFeatureForPreferenceKey(a1);
  BOOL v2 = v1 != 0;

  return v2;
}

__CFString *preferenceKeyForEnumKey(int a1)
{
  id v1 = 0;
  switch(a1)
  {
    case 0:
      id v1 = @"AppleKeyboards";
      goto LABEL_84;
    case 1:
      id v1 = @"AppleKeyboardsExpanded";
      goto LABEL_84;
    case 2:
      id v1 = @"AppleKeyboardsIncludeIntl";
      goto LABEL_84;
    case 3:
      id v1 = @"AppleLocale";
      goto LABEL_84;
    case 4:
      id v1 = @"AppleLanguages";
      goto LABEL_84;
    case 7:
      id v1 = @"KeyboardAssistant";
      goto LABEL_84;
    case 8:
      id v1 = @"KeyboardAutocorrection";
      goto LABEL_84;
    case 9:
      id v1 = @"KeyboardAutocapitalization";
      goto LABEL_84;
    case 10:
      id v1 = @"KeyboardCheckSpelling";
      goto LABEL_84;
    case 11:
      id v1 = @"KeyboardPeriodShortcut";
      goto LABEL_84;
    case 12:
      id v1 = @"KeyboardCapsLock";
      goto LABEL_84;
    case 13:
      id v1 = @"KeyboardLastUsed";
      goto LABEL_84;
    case 14:
      id v1 = @"KeyboardsCurrentAndNext";
      goto LABEL_84;
    case 15:
      id v1 = @"KeyboardLastUsedForLanguage";
      goto LABEL_84;
    case 16:
      id v1 = @"KeyboardLayoutLastUsedForKeyboard";
      goto LABEL_84;
    case 17:
      id v1 = @"KeyboardLastChosen";
      goto LABEL_84;
    case 19:
      id v1 = @"KeyboardHardwareKeyboardsSeen";
      goto LABEL_84;
    case 20:
      id v1 = @"HardwareKeyboardLastSeen";
      goto LABEL_84;
    case 21:
      id v1 = @"SoftwareKeyboardShownByTouch";
      goto LABEL_84;
    case 22:
      id v1 = @"AutomaticMinimizationEnabled";
      goto LABEL_84;
    case 23:
      id v1 = @"UIKeyboardPersistentVerticalOffset";
      goto LABEL_84;
    case 24:
      id v1 = @"UIKeyboardPersistentHorizontalOffset";
      goto LABEL_84;
    case 25:
      id v1 = @"UIKeyboardPersistentSplitProgress";
      goto LABEL_84;
    case 26:
      id v1 = @"UIKeyboardPersistentSplitLock";
      goto LABEL_84;
    case 27:
      id v1 = @"UIKeyboardDidShowInternationalInfoIntroduction";
      goto LABEL_84;
    case 28:
      id v1 = @"EmojiDefaultsKey";
      break;
    case 33:
      id v1 = @"RivenKeyboard";
      goto LABEL_84;
    case 34:
      id v1 = @"KeyboardPredictionHelpMessageCount";
      goto LABEL_84;
    case 35:
      id v1 = @"KeyboardShowPredictionBar";
      goto LABEL_84;
    case 36:
      id v1 = @"KeyboardPrediction";
      goto LABEL_84;
    case 37:
      id v1 = @"KeyboardBias";
      goto LABEL_84;
    case 38:
      id v1 = @"KeyboardAllowPaddle";
      goto LABEL_84;
    case 39:
      id v1 = @"KeyboardIsFloating";
      goto LABEL_84;
    case 40:
      id v1 = @"KeyboardReachableFirstInteraction";
      goto LABEL_84;
    case 41:
      id v1 = @"HWKeyboardAutocorrection";
      goto LABEL_84;
    case 42:
      id v1 = @"HWKeyboardAutocapitalization";
      goto LABEL_84;
    case 43:
      id v1 = @"HWKeyboardPeriodShortcut";
      goto LABEL_84;
    case 44:
      id v1 = @"HWKeyboardGlobeAsEmojiKey";
      goto LABEL_84;
    case 45:
      id v1 = @"HWKeyboardCapsLockRomanSwitch";
      goto LABEL_84;
    case 46:
      id v1 = @"HWKeyboardDictationShortcut";
      goto LABEL_84;
    case 47:
      id v1 = @"KeyboardUseProLayout";
      goto LABEL_84;
    case 48:
      id v1 = @"ShowMemoji";
      goto LABEL_84;
    case 49:
      id v1 = @"ShowStickers";
      goto LABEL_84;
    case 50:
      id v1 = @"DictationKeyAlwaysEnabled";
      break;
    case 51:
      id v1 = @"KeyboardPerformanceLogging";
      goto LABEL_84;
    case 52:
      id v1 = @"DictationLogging";
      break;
    case 53:
      id v1 = @"TypologyEnabled";
      goto LABEL_84;
    case 54:
      id v1 = @"CustomerTypologyEnabledByDiagnosticExtension";
      goto LABEL_84;
    case 67:
      id v1 = @"KeyboardAssetDownloadInFive";
      goto LABEL_84;
    case 69:
      id v1 = @"KeyboardSwipeToTab";
      break;
    case 70:
      id v1 = @"RivenLayoutSize";
      goto LABEL_84;
    case 73:
      id v1 = @"ShowExtraLayouts";
      break;
    case 75:
      id v1 = @"KeyboardCachingDisabled";
      break;
    case 77:
      id v1 = @"HandwritingCaptureEnabled";
      break;
    case 80:
      id v1 = @"KeyboardGlobeKeyExperiments";
      goto LABEL_84;
    case 83:
      id v1 = @"KeyboardFloatingEnabled";
      goto LABEL_84;
    case 84:
      id v1 = @"KeyboardMultilingualEnabled";
      goto LABEL_84;
    case 85:
      id v1 = @"KeyboardContinuousPathEnabled";
      goto LABEL_84;
    case 86:
      id v1 = @"KeyboardContinuousPathProgressiveCandidatesEnabled";
      goto LABEL_84;
    case 87:
      id v1 = @"KeyboardContinuousPathCompletesWords";
      goto LABEL_84;
    case 88:
      id v1 = @"KeyboardContinuousPathLanguageWeight";
      goto LABEL_84;
    case 89:
      id v1 = @"KeyboardContinuousPathDeleteWholeWord";
      goto LABEL_84;
    case 90:
      id v1 = @"KeyboardInsertsSpaceAfterPredictiveInput";
      goto LABEL_84;
    case 91:
      id v1 = @"KeyboardContinuousPathEnabledAlgorithmTypes";
      goto LABEL_84;
    case 92:
      id v1 = @"KeyboardCPCandidateCount";
      goto LABEL_84;
    case 93:
      id v1 = @"KeyboardIgnoreCPConfigRequirements";
      goto LABEL_84;
    case 94:
      id v1 = @"KeyboardDODMLLoggingEnabled";
      goto LABEL_84;
    case 95:
      id v1 = @"KeyboardCJContinuousPathEnabled";
      goto LABEL_84;
    case 96:
      id v1 = @"TypoTrackerButton";
      break;
    case 100:
      id v1 = @"FuzzyPinyin";
      goto LABEL_84;
    case 101:
      id v1 = @"SuchengCangjie";
      goto LABEL_84;
    case 102:
      id v1 = @"FuzzyPinyinPairs";
      goto LABEL_84;
    case 103:
      id v1 = @"SpaceConfirmation";
      goto LABEL_84;
    case 105:
      id v1 = @"DictationTipLastShownDate";
      goto LABEL_84;
    case 106:
      id v1 = @"DictationTipsDisplayCountLimit";
      goto LABEL_84;
    case 107:
      id v1 = @"DictationReplacementCommandTipShownCount";
      goto LABEL_84;
    case 108:
      id v1 = @"DictationDeletionCommandTipShownCount";
      goto LABEL_84;
    case 109:
      id v1 = @"DictationInsertionCommandTipShownCount";
      goto LABEL_84;
    case 110:
      id v1 = @"DictationEmojiCommandTipShownCount";
      goto LABEL_84;
    case 111:
      id v1 = @"DictationSelectionCommandTipShownCount";
      goto LABEL_84;
    case 112:
      id v1 = @"DictationStopCommandTipShownCount";
      goto LABEL_84;
    case 113:
      id v1 = @"DictationModelessInputTipShownCount";
LABEL_84:
      BOOL v2 = v1;
      break;
    default:
      break;
  }

  return v1;
}

id TIGetInputModeProperties(void *a1)
{
  id v1 = a1;
  if (TIGetInputModeProperties_once != -1) {
    dispatch_once(&TIGetInputModeProperties_once, &__block_literal_global_327);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_get_input_mode_properties_lock);
  BOOL v2 = [(id)__inputModeProperties objectForKey:v1];
  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"_-@@"];
    BOOL v4 = [v1 componentsSeparatedByCharactersInSet:v3];
    uint64_t v5 = [v4 firstObject];

    uint64_t v6 = _UIKeyboardBundleInfoWithKey(v5, @"UIKeyboardSupportedInputModes");
    BOOL v2 = [v6 objectForKey:v1];
    if (_os_feature_enabled_impl() && [v1 containsString:@"th_TH"])
    {
      id v7 = (void *)[v2 mutableCopy];
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"KeyboardCPEnabled"];

      BOOL v2 = v7;
    }
    if (v2) {
      [(id)__inputModeProperties setObject:v2 forKey:v1];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_get_input_mode_properties_lock);

  return v2;
}

id TIInputModeGetLanguageWithRegion(void *a1)
{
  id v1 = a1;
  BOOL v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-@"];
  uint64_t v3 = [v1 rangeOfCharacterFromSet:v2 options:2];

  BOOL v4 = v1;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = [v1 substringToIndex:v3];
  }

  return v4;
}

NSString *managedConfigurationFeatureForPreferenceKey(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"KeyboardAutocorrection"] & 1) != 0
    || [v1 isEqualToString:@"HWKeyboardAutocorrection"])
  {
    uint64_t v8 = 0;
    unint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    BOOL v2 = (id *)getMCFeatureAutoCorrectionAllowedSymbolLoc_ptr;
    uint64_t v11 = getMCFeatureAutoCorrectionAllowedSymbolLoc_ptr;
    if (getMCFeatureAutoCorrectionAllowedSymbolLoc_ptr)
    {
LABEL_6:
      _Block_object_dispose(&v8, 8);
      if (!v2)
      {
        dlerror();
        abort_report_np();
        return getMCFeaturePredictiveKeyboardAllowed();
      }
      id v4 = *v2;
      goto LABEL_8;
    }
    uint64_t v3 = (void *)ManagedConfigurationLibrary();
    v9[3] = (uint64_t)dlsym(v3, "MCFeatureAutoCorrectionAllowed");
    getMCFeatureAutoCorrectionAllowedSymbolLoc_ptr = v9[3];
LABEL_5:
    BOOL v2 = (id *)v9[3];
    goto LABEL_6;
  }
  if ([v1 isEqualToString:@"KeyboardPrediction"]
    || [v1 isEqualToString:@"KeyboardInlineCompletion"])
  {
    getMCFeaturePredictiveKeyboardAllowed();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ([v1 isEqualToString:@"KeyboardMathExpressionCompletion"])
    {
      uint64_t v8 = 0;
      unint64_t v9 = &v8;
      uint64_t v10 = 0x2020000000;
      BOOL v2 = (id *)getMCFeatureKeyboardMathSolvingAllowedSymbolLoc_ptr;
      uint64_t v11 = getMCFeatureKeyboardMathSolvingAllowedSymbolLoc_ptr;
      if (getMCFeatureKeyboardMathSolvingAllowedSymbolLoc_ptr) {
        goto LABEL_6;
      }
      id v7 = (void *)ManagedConfigurationLibrary();
      v9[3] = (uint64_t)dlsym(v7, "MCFeatureKeyboardMathSolvingAllowed");
      getMCFeatureKeyboardMathSolvingAllowedSymbolLoc_ptr = v9[3];
      goto LABEL_5;
    }
    if ([v1 isEqualToString:@"KeyboardCheckSpelling"])
    {
      getMCFeatureSpellCheckAllowed();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if ([v1 isEqualToString:@"SmartQuotesEnabled"])
    {
      getMCFeatureSmartPunctuationAllowed();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (![v1 isEqualToString:@"KeyboardContinuousPathEnabled"])
      {
        uint64_t v5 = 0;
        goto LABEL_9;
      }
      getMCFeatureContinuousPathKeyboardAllowed();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_8:
  uint64_t v5 = v4;
LABEL_9:

  return (NSString *)v5;
}

NSString *getMCFeaturePredictiveKeyboardAllowed()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getMCFeaturePredictiveKeyboardAllowedSymbolLoc_ptr;
  uint64_t v9 = getMCFeaturePredictiveKeyboardAllowedSymbolLoc_ptr;
  if (!getMCFeaturePredictiveKeyboardAllowedSymbolLoc_ptr)
  {
    id v1 = (void *)ManagedConfigurationLibrary();
    v7[3] = (uint64_t)dlsym(v1, "MCFeaturePredictiveKeyboardAllowed");
    getMCFeaturePredictiveKeyboardAllowedSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    BOOL v2 = *v0;
    return (NSString *)v2;
  }
  else
  {
    dlerror();
    id v4 = (_TIPreferenceDomain *)abort_report_np();
    return [(_TIPreferenceDomain *)v4 domain];
  }
}

id getMCFeatureSmartPunctuationAllowed()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getMCFeatureSmartPunctuationAllowedSymbolLoc_ptr;
  uint64_t v8 = getMCFeatureSmartPunctuationAllowedSymbolLoc_ptr;
  if (!getMCFeatureSmartPunctuationAllowedSymbolLoc_ptr)
  {
    id v1 = (void *)ManagedConfigurationLibrary();
    v6[3] = (uint64_t)dlsym(v1, "MCFeatureSmartPunctuationAllowed");
    getMCFeatureSmartPunctuationAllowedSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    BOOL v2 = *v0;
    return v2;
  }
  else
  {
    dlerror();
    uint64_t v4 = abort_report_np();
    return (id)getMCFeatureSpellCheckAllowed(v4);
  }
}

id getMCFeatureSpellCheckAllowed()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getMCFeatureSpellCheckAllowedSymbolLoc_ptr;
  uint64_t v9 = getMCFeatureSpellCheckAllowedSymbolLoc_ptr;
  if (!getMCFeatureSpellCheckAllowedSymbolLoc_ptr)
  {
    id v1 = (void *)ManagedConfigurationLibrary();
    v7[3] = (uint64_t)dlsym(v1, "MCFeatureSpellCheckAllowed");
    getMCFeatureSpellCheckAllowedSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    BOOL v2 = *v0;
    return v2;
  }
  else
  {
    dlerror();
    uint64_t v4 = (void *)abort_report_np();
    return _UIKeyboardBundleInfoWithKey(v4, v5);
  }
}

id _UIKeyboardBundleInfoWithKey(void *a1, void *a2)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    uint64_t v5 = [@"InputMode_" stringByAppendingString:v3];
    uint64_t v6 = [v5 stringByAppendingPathExtension:@"plist"];

    uint64_t v7 = +[8 objectForKey:v6];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 objectForKey:v4];
    }
    else
    {
      uint64_t v10 = TIBundlePathForInputMode(v3);
      if (v10)
      {
        uint64_t v11 = NSString;
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v10, v6, 0);
        id v13 = [v11 pathWithComponents:v12];

        uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v13 options:1 error:0];
        if (v14)
        {
          uint64_t v15 = (void *)v14;
        }
        else
        {
          uint64_t v16 = NSString;
          v20[0] = v10;
          v20[1] = @"Resources";
          v20[2] = v6;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
          uint64_t v18 = [v16 pathWithComponents:v17];

          uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v18 options:1 error:0];
          id v13 = (void *)v18;
        }
        [MEMORY[0x1E4F1CAD0] setWithObject:v4];
        _CFPropertyListCreateFiltered();
        uint64_t v9 = [0 objectForKey:v4];
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t ManagedConfigurationLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __ManagedConfigurationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E555A070;
    uint64_t v5 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
    if (ManagedConfigurationLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return ManagedConfigurationLibraryCore_frameworkLibrary;
}

uint64_t __TIGetDefaultInputModesForLanguage_block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = TIInputModeGetNormalizedIdentifier(a2);
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

id TIGetDefaultInputModesForLanguage(void *a1)
{
  id v1 = a1;
  if (TIGetDefaultInputModesForLanguage_once != -1) {
    dispatch_once(&TIGetDefaultInputModesForLanguage_once, &__block_literal_global_264);
  }
  BOOL v2 = TIInputModeGetBaseLanguage(v1);
  id v3 = [(id)__defaultLanguageInputModes objectForKey:v2];
  if (!v3)
  {
    id v3 = _UIKeyboardBundleInfoWithKey(v2, @"UIKeyboardDefaultLanguageInputModes");
    if (v3) {
      [(id)__defaultLanguageInputModes addEntriesFromDictionary:v3];
    }
  }
  id v4 = (id)__defaultLanguageInputModes;
  uint64_t v5 = [v1 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  uint64_t v6 = [v4 objectForKey:v5];

  if (![v6 count])
  {
    uint64_t v7 = TIInputModeGetLanguage(v1);
    uint64_t v8 = [v4 objectForKey:v7];

    uint64_t v6 = (void *)v8;
  }
  if (![v6 count])
  {
    uint64_t v9 = TIInputModeGetBaseLanguage(v1);
    uint64_t v10 = [v4 objectForKey:v9];

    uint64_t v6 = (void *)v10;
  }
  if (![v6 count])
  {
    uint64_t v11 = TIInputModeGetRegion(v1);
    uint64_t v12 = [v4 objectForKey:v11];

    uint64_t v6 = (void *)v12;
  }
  id v13 = +[TIInputModeController sharedInputModeController];
  uint64_t v14 = [v13 supportedInputModeIdentifiers];

  if ([v6 count])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __TIGetDefaultInputModesForLanguage_block_invoke_2;
    v20[3] = &unk_1E5558C20;
    id v21 = v14;
    uint64_t v15 = [v6 indexesOfObjectsPassingTest:v20];
    uint64_t v16 = [v6 objectsAtIndexes:v15];

    uint64_t v6 = (void *)v16;
  }
  else if ([v14 containsObject:v1])
  {
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObject:v1];
    goto LABEL_17;
  }
  id v17 = v6;
  uint64_t v6 = v17;
LABEL_17:
  uint64_t v18 = v17;

  return v18;
}

id TIInputModeGetBaseLanguage(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    BOOL v2 = TIInputModeGetComponentsFromIdentifier(v1);
    uint64_t v3 = *MEMORY[0x1E4F1C438];
    id v4 = [v2 objectForKey:*MEMORY[0x1E4F1C438]];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v4, v3, 0);
    uint64_t v6 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __TIGetDefaultInputModesForLanguage_block_invoke()
{
  id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"en_US", 0);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"en_US", 0);
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"ru_RU", @"en_US", 0);
  id v1 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"en_IN", @"hi", 0);
  BOOL v2 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"intl", 0);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"en_US", 0);
  id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"en_US", 0);
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"ru_RU", @"en_US", 0);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"lu_LU", 0);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"en_US", 0);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"en_US", 0);
  uint64_t v9 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, @"AM", v11, @"AZ", v0, @"BY", v1, @"IN", v2, @"intl", v3, @"KE", v4, @"KZ", v5, @"KY", v6,
         @"lu",
         v7,
         @"TJ",
         v8,
         @"UZ",
         0);
  uint64_t v10 = (void *)__defaultLanguageInputModes;
  __defaultLanguageInputModes = v9;
}

id TIBundlePathForInputMode(void *a1)
{
  id v1 = a1;
  BOOL v2 = _TextInputBundlesRootForDevelopment();

  if (!v2
    || (_TextInputBundlesRootForDevelopment(),
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        _GetBundlePathForInputModeWithRootDirectory(v1, v3),
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    uint64_t v5 = [NSString stringWithUTF8String:"/System/Library/TextInput"];
    id v4 = _GetBundlePathForInputModeWithRootDirectory(v1, v5);
  }

  return v4;
}

id _TextInputBundlesRootForDevelopment()
{
  if (_TextInputBundlesRootForDevelopment_onceToken != -1) {
    dispatch_once(&_TextInputBundlesRootForDevelopment_onceToken, &__block_literal_global_513);
  }
  uint64_t v0 = (void *)_TextInputBundlesRootForDevelopment_bundlesRoot;

  return v0;
}

id _GetBundlePathForInputModeWithRootDirectory(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = TIInputModeGetBaseLanguage(a1);
  uint64_t v5 = [NSString stringWithFormat:@"%@/TextInput_%@.bundle", v3, v4];
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5];

  if (v7) {
    goto LABEL_4;
  }
  uint64_t v8 = [NSString stringWithFormat:@"%@/TextInput_mul.bundle", v3];

  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = [v9 fileExistsAtPath:v8];

  if (v10)
  {
    uint64_t v5 = v8;
LABEL_4:
    id v11 = v5;
    uint64_t v8 = v11;
    goto LABEL_6;
  }
  id v11 = 0;
LABEL_6:

  return v11;
}

id TIGetTextInputFrameworkPath()
{
  if (TIGetTextInputFrameworkPath_onceToken != -1) {
    dispatch_once(&TIGetTextInputFrameworkPath_onceToken, &__block_literal_global_509);
  }
  uint64_t v0 = (void *)TIGetTextInputFrameworkPath_textInputFrameworkPath;

  return v0;
}

id getMCProfileConnectionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v7 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMCProfileConnectionClass_block_invoke;
    v3[3] = &unk_1E555A528;
    v3[4] = &v4;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  ManagedConfigurationLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MCProfileConnection");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMCProfileConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    BOOL v2 = (TITextInputTraits *)abort_report_np();
    [(TITextInputTraits *)v2 setKeyboardType:v4];
  }
}

uint64_t __kac_get_log_block_invoke()
{
  kac_get_log_log = (uint64_t)os_log_create("com.apple.TextInput", "KeyboardSignposts");

  return MEMORY[0x1F41817F8]();
}

uint64_t __TIInputModeGetNormalizedVariant_block_invoke()
{
  TIInputModeGetNormalizedVariant___variantsToKeepCapitalized = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDC286A8];

  return MEMORY[0x1F41817F8]();
}

uint64_t __TIGetInputModeProperties_block_invoke()
{
  __inputModeProperties = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

void __TIGetTextInputFrameworkPath_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v0 = [v2 bundlePath];
  id v1 = (void *)TIGetTextInputFrameworkPath_textInputFrameworkPath;
  TIGetTextInputFrameworkPath_textInputFrameworkPath = v0;
}

uint64_t __TIGetDefaultDictationLanguagesForKeyboardLanguage_block_invoke()
{
  TIGetDefaultDictationLanguagesForKeyboardLanguage___defaultDictationLanguageProperties = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __EmojiFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EmojiFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

id __TIKeyEquivalentMirroringCandidatesMap()
{
  if (__TIKeyEquivalentMirroringCandidatesMap___onceToken != -1) {
    dispatch_once(&__TIKeyEquivalentMirroringCandidatesMap___onceToken, &__block_literal_global_301);
  }
  uint64_t v0 = (void *)__TIKeyEquivalentMirroringCandidatesMap___keyEquivalentMirroringCandidatesMap;

  return v0;
}

BOOL TICharIsJapaneseScript()
{
  return uscript_hasScript() || uscript_hasScript() != 0;
}

BOOL TICharIsCJScript()
{
  return uscript_hasScript()
      || uscript_hasScript()
      || uscript_hasScript()
      || uscript_hasScript() != 0;
}

BOOL TICharIsAlphaNumeric(UTF32Char a1)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

BOOL TICharIsDevanagariPUA(UTF32Char theChar)
{
  if (TICharIsDevanagariPUA___onceToken != -1) {
    dispatch_once(&TICharIsDevanagariPUA___onceToken, &__block_literal_global);
  }
  return CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)TICharIsDevanagariPUA___devanagariPUACharacterSet, theChar) != 0;
}

CFCharacterSetRef __TICharIsDevanagariPUA_block_invoke()
{
  v1.location = 63197;
  v1.length = 33;
  CFCharacterSetRef result = CFCharacterSetCreateWithCharactersInRange(0, v1);
  TICharIsDevanagariPUA___devanagariPUACharacterSet = (uint64_t)result;
  return result;
}

BOOL TICharIsDelete(int a1)
{
  return a1 == 127 || a1 == 8;
}

BOOL TICharIsEAWidth(UChar32 a1)
{
  return u_getIntPropertyValue(a1, UCHAR_EAST_ASIAN_WIDTH) == 3;
}

BOOL TICharIsEAFullwidthOrWide(UChar32 a1)
{
  int32_t IntPropertyValue = u_getIntPropertyValue(a1, UCHAR_EAST_ASIAN_WIDTH);
  return IntPropertyValue == 3 || IntPropertyValue == 5;
}

BOOL TICharIsIdeographic(UChar32 a1)
{
  return u_hasBinaryProperty(a1, UCHAR_IDEOGRAPHIC) != 0;
}

BOOL TICharIsSpace(UTF32Char a1)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

BOOL TICharIsSpaceOrReturn(UTF32Char a1)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

BOOL TICharIsNewlineOrReturn(int a1)
{
  return a1 == 13 || a1 == 10;
}

BOOL TICharIsNumber(UTF32Char a1)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

uint64_t TICharIsNumberDelimiter(unsigned int a1)
{
  return (a1 < 0x3F) & (0x7400FE0000000000uLL >> a1);
}

BOOL TICharIsNumberModifier(int a1)
{
  return a1 == 35 || (a1 & 0xFFFFFFFE) == 36;
}

BOOL TICharIsDelimitingNumber(unsigned int a1, UTF32Char a2)
{
  BOOL result = 0;
  if (a1 <= 0x3E && ((1 << a1) & 0x7400FE0000000000) != 0)
  {
    CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
    return CFCharacterSetIsLongCharacterMember(Predefined, a2) != 0;
  }
  return result;
}

uint64_t TICharIsLeftAssociative(unsigned int a1)
{
  return (a1 < 0x40) & (0x8000400200000000 >> a1);
}

BOOL TICharIsPunctuation(UTF32Char a1)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

BOOL TICharEstablishesContextForDoubleSpacePeriod(UTF32Char a1)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  if (CFCharacterSetIsLongCharacterMember(Predefined, a1)) {
    return 0;
  }
  if (a1 > 0x3F) {
    return a1 - 12289 >= 2 && a1 != 2404;
  }
  BOOL result = 0;
  if (((1 << a1) & 0x8C00700200000001) == 0) {
    return a1 - 12289 >= 2 && a1 != 2404;
  }
  return result;
}

void *__getCNContactGivenNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ContactsLibrary();
  BOOL result = dlsym(v2, "CNContactGivenNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactGivenNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ContactsLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __ContactsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5558868;
    uint64_t v5 = 0;
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
    CFRange v1 = (void *)v3[0];
    uint64_t v0 = ContactsLibraryCore_frameworkLibrary;
    if (ContactsLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      CFRange v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return ContactsLibraryCore_frameworkLibrary;
}

void *__getCNContactPhoneticGivenNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ContactsLibrary();
  BOOL result = dlsym(v2, "CNContactPhoneticGivenNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactPhoneticGivenNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactMiddleNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ContactsLibrary();
  BOOL result = dlsym(v2, "CNContactMiddleNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactMiddleNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactPhoneticMiddleNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ContactsLibrary();
  BOOL result = dlsym(v2, "CNContactPhoneticMiddleNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactPhoneticMiddleNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactFamilyNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ContactsLibrary();
  BOOL result = dlsym(v2, "CNContactFamilyNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactFamilyNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactPhoneticFamilyNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ContactsLibrary();
  BOOL result = dlsym(v2, "CNContactPhoneticFamilyNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactPhoneticFamilyNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactPreviousFamilyNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ContactsLibrary();
  BOOL result = dlsym(v2, "CNContactPreviousFamilyNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactPreviousFamilyNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactOrganizationNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ContactsLibrary();
  BOOL result = dlsym(v2, "CNContactOrganizationNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactOrganizationNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactPhoneticOrganizationNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ContactsLibrary();
  BOOL result = dlsym(v2, "CNContactPhoneticOrganizationNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactPhoneticOrganizationNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactNicknameKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ContactsLibrary();
  BOOL result = dlsym(v2, "CNContactNicknameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactNicknameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ContactsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsLibraryCore_frameworkLibrary = result;
  return result;
}

id getSTKStickerUsageManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSTKStickerUsageManagerClass_softClass;
  uint64_t v7 = getSTKStickerUsageManagerClass_softClass;
  if (!getSTKStickerUsageManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSTKStickerUsageManagerClass_block_invoke;
    v3[3] = &unk_1E555A528;
    v3[4] = &v4;
    __getSTKStickerUsageManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

Class __getSTKStickerUsageManagerClass_block_invoke(uint64_t a1)
{
  if (!StickersLibraryCore_frameworkLibrary) {
    StickersLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("STKStickerUsageManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTKStickerUsageManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __StickersLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  StickersLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __Block_byref_object_copy__261(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__262(uint64_t a1)
{
}

uint64_t IXA_IS_INTERNAL_INSTALL()
{
  if (IXA_IS_INTERNAL_INSTALL_once_token != -1) {
    dispatch_once(&IXA_IS_INTERNAL_INSTALL_once_token, &__block_literal_global_283);
  }
  return IXA_IS_INTERNAL_INSTALL_is_internal_install;
}

BOOL IXACanLogMessageAtLevel(unsigned int a1)
{
  if (IXACanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&IXACanLogMessageAtLevel_onceToken, &__block_literal_global_9);
  }
  return IXACanLogMessageAtLevel_logLevel >= a1;
}

void __IXACanLogMessageAtLevel_block_invoke()
{
  if (IXA_IS_INTERNAL_INSTALL_once_token != -1) {
    dispatch_once(&IXA_IS_INTERNAL_INSTALL_once_token, &__block_literal_global_283);
  }
  if (IXA_IS_INTERNAL_INSTALL_is_internal_install) {
    IXACanLogMessageAtLevel_logLevel = CFPreferencesGetAppIntegerValue(@"kbdLogLevel", @"com.apple.keyboard", 0);
  }
}

id IXADefaultLogFacility()
{
  if (IXADefaultLogFacility_onceToken != -1) {
    dispatch_once(&IXADefaultLogFacility_onceToken, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)IXADefaultLogFacility_logFacility;

  return v0;
}

uint64_t __IXADefaultLogFacility_block_invoke()
{
  IXADefaultLogFacility_logFacility = (uint64_t)os_log_create("com.apple.TextInput", "IXADefault");

  return MEMORY[0x1F41817F8]();
}

id IXASessionEventsLogFacility()
{
  if (IXASessionEventsLogFacility_onceToken != -1) {
    dispatch_once(&IXASessionEventsLogFacility_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)IXASessionEventsLogFacility_logFacility;

  return v0;
}

uint64_t __IXASessionEventsLogFacility_block_invoke()
{
  IXASessionEventsLogFacility_logFacility = (uint64_t)os_log_create("com.apple.TextInput", "IXASessionEvents");

  return MEMORY[0x1F41817F8]();
}

id IXASessionDetailsLogFacility()
{
  if (IXASessionDetailsLogFacility_onceToken != -1) {
    dispatch_once(&IXASessionDetailsLogFacility_onceToken, &__block_literal_global_18);
  }
  uint64_t v0 = (void *)IXASessionDetailsLogFacility_logFacility;

  return v0;
}

uint64_t __IXASessionDetailsLogFacility_block_invoke()
{
  IXASessionDetailsLogFacility_logFacility = (uint64_t)os_log_create("com.apple.TextInput", "IXASessionDetails");

  return MEMORY[0x1F41817F8]();
}

id IXASessionAlignmentLogFacility()
{
  if (IXASessionAlignmentLogFacility_onceToken != -1) {
    dispatch_once(&IXASessionAlignmentLogFacility_onceToken, &__block_literal_global_21);
  }
  uint64_t v0 = (void *)IXASessionAlignmentLogFacility_logFacility;

  return v0;
}

uint64_t __IXASessionAlignmentLogFacility_block_invoke()
{
  IXASessionAlignmentLogFacility_logFacility = (uint64_t)os_log_create("com.apple.TextInput", "IXASessionAlignment");

  return MEMORY[0x1F41817F8]();
}

id IXARevisionRateLogFacility()
{
  if (IXARevisionRateLogFacility_onceToken != -1) {
    dispatch_once(&IXARevisionRateLogFacility_onceToken, &__block_literal_global_24);
  }
  uint64_t v0 = (void *)IXARevisionRateLogFacility_logFacility;

  return v0;
}

uint64_t __IXARevisionRateLogFacility_block_invoke()
{
  IXARevisionRateLogFacility_logFacility = (uint64_t)os_log_create("com.apple.TextInput", "IXARevisionRate");

  return MEMORY[0x1F41817F8]();
}

id IXATypingEffortLogFacility()
{
  if (IXATypingEffortLogFacility_onceToken != -1) {
    dispatch_once(&IXATypingEffortLogFacility_onceToken, &__block_literal_global_27);
  }
  uint64_t v0 = (void *)IXATypingEffortLogFacility_logFacility;

  return v0;
}

uint64_t __IXATypingEffortLogFacility_block_invoke()
{
  IXATypingEffortLogFacility_logFacility = (uint64_t)os_log_create("com.apple.TextInput", "IXATypingEffort");

  return MEMORY[0x1F41817F8]();
}

id IXAFeedbackLogFacility()
{
  if (IXAFeedbackLogFacility_onceToken != -1) {
    dispatch_once(&IXAFeedbackLogFacility_onceToken, &__block_literal_global_30);
  }
  uint64_t v0 = (void *)IXAFeedbackLogFacility_logFacility;

  return v0;
}

uint64_t __IXAFeedbackLogFacility_block_invoke()
{
  IXAFeedbackLogFacility_logFacility = (uint64_t)os_log_create("com.apple.TextInput", "IXAFeedback");

  return MEMORY[0x1F41817F8]();
}

id IXAAdhocTestingLogFacility()
{
  if (IXAAdhocTestingLogFacility_onceToken != -1) {
    dispatch_once(&IXAAdhocTestingLogFacility_onceToken, &__block_literal_global_33);
  }
  uint64_t v0 = (void *)IXAAdhocTestingLogFacility_logFacility;

  return v0;
}

uint64_t __IXAAdhocTestingLogFacility_block_invoke()
{
  IXAAdhocTestingLogFacility_logFacility = (uint64_t)os_log_create("com.apple.TextInput", "IXAAdhocTesting");

  return MEMORY[0x1F41817F8]();
}

uint64_t acute_accent_form(int a1)
{
  if (a1 > 912)
  {
    if (a1 <= 944)
    {
      if (a1 > 926)
      {
        switch(a1)
        {
          case 927:
            return 908;
          case 933:
            return 910;
          case 937:
            return 911;
          default:
            return 0;
        }
      }
      else
      {
        switch(a1)
        {
          case 913:
            uint64_t result = 902;
            break;
          case 917:
            uint64_t result = 904;
            break;
          case 919:
            uint64_t result = 905;
            break;
          case 921:
            uint64_t result = 906;
            break;
          default:
            return 0;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 965:
          uint64_t result = 973;
          break;
        case 966:
        case 967:
        case 968:
          return 0;
        case 969:
          uint64_t result = 974;
          break;
        case 970:
          uint64_t result = 912;
          break;
        case 971:
          uint64_t result = 944;
          break;
        default:
          if (a1 != 959) {
            return 0;
          }
          uint64_t result = 972;
          break;
      }
    }
  }
  else
  {
    int v1 = a1 - 65;
    uint64_t result = 193;
    switch(v1)
    {
      case 0:
        return result;
      case 2:
        uint64_t result = 262;
        break;
      case 4:
        uint64_t result = 201;
        break;
      case 8:
        uint64_t result = 205;
        break;
      case 11:
        uint64_t result = 313;
        break;
      case 13:
        uint64_t result = 323;
        break;
      case 14:
        uint64_t result = 211;
        break;
      case 17:
        uint64_t result = 340;
        break;
      case 18:
        uint64_t result = 346;
        break;
      case 20:
        uint64_t result = 218;
        break;
      case 24:
        uint64_t result = 221;
        break;
      case 25:
        uint64_t result = 377;
        break;
      case 32:
        uint64_t result = 225;
        break;
      case 34:
        uint64_t result = 263;
        break;
      case 36:
        uint64_t result = 233;
        break;
      case 40:
        uint64_t result = 237;
        break;
      case 43:
        uint64_t result = 314;
        break;
      case 45:
        uint64_t result = 324;
        break;
      case 46:
        uint64_t result = 243;
        break;
      case 49:
        uint64_t result = 341;
        break;
      case 50:
        uint64_t result = 347;
        break;
      case 52:
        uint64_t result = 250;
        break;
      case 56:
        uint64_t result = 253;
        break;
      case 57:
        uint64_t result = 378;
        break;
      default:
        return 0;
    }
  }
  return result;
}

uint64_t grave_accent_form(int a1)
{
  if (a1 > 96)
  {
    if (a1 <= 104)
    {
      if (a1 == 97) {
        return 224;
      }
      if (a1 == 101) {
        return 232;
      }
    }
    else
    {
      switch(a1)
      {
        case 'i':
          return 236;
        case 'o':
          return 242;
        case 'u':
          return 249;
      }
    }
  }
  else if (a1 <= 72)
  {
    if (a1 == 65) {
      return 192;
    }
    if (a1 == 69) {
      return 200;
    }
  }
  else
  {
    switch(a1)
    {
      case 'I':
        return 204;
      case 'O':
        return 210;
      case 'U':
        return 217;
    }
  }
  return 0;
}

uint64_t circumflex_form(int a1)
{
  if (a1 > 96)
  {
    if (a1 <= 104)
    {
      if (a1 == 97) {
        return 226;
      }
      if (a1 == 101) {
        return 234;
      }
    }
    else
    {
      switch(a1)
      {
        case 'i':
          return 238;
        case 'o':
          return 244;
        case 'u':
          return 251;
      }
    }
  }
  else if (a1 <= 72)
  {
    if (a1 == 65) {
      return 194;
    }
    if (a1 == 69) {
      return 202;
    }
  }
  else
  {
    switch(a1)
    {
      case 'I':
        return 206;
      case 'O':
        return 212;
      case 'U':
        return 219;
    }
  }
  return 0;
}

uint64_t diaeresis_form(int a1)
{
  if (a1 > 104)
  {
    if (a1 > 920)
    {
      if (a1 > 952)
      {
        if (a1 == 953) {
          return 970;
        }
        if (a1 == 965) {
          return 971;
        }
      }
      else
      {
        if (a1 == 921) {
          return 938;
        }
        if (a1 == 933) {
          return 939;
        }
      }
    }
    else if (a1 > 116)
    {
      if (a1 == 117) {
        return 252;
      }
      if (a1 == 121) {
        return 255;
      }
    }
    else
    {
      if (a1 == 105) {
        return 239;
      }
      if (a1 == 111) {
        return 246;
      }
    }
  }
  else if (a1 > 84)
  {
    if (a1 > 96)
    {
      if (a1 == 97) {
        return 228;
      }
      if (a1 == 101) {
        return 235;
      }
    }
    else
    {
      if (a1 == 85) {
        return 220;
      }
      if (a1 == 89) {
        return 376;
      }
    }
  }
  else if (a1 > 72)
  {
    if (a1 == 73) {
      return 207;
    }
    if (a1 == 79) {
      return 214;
    }
  }
  else
  {
    if (a1 == 65) {
      return 196;
    }
    if (a1 == 69) {
      return 203;
    }
  }
  return 0;
}

uint64_t dialytika_tonos_form(int a1)
{
  if (a1 == 965) {
    unsigned int v1 = 944;
  }
  else {
    unsigned int v1 = 0;
  }
  if (a1 == 953) {
    return 912;
  }
  else {
    return v1;
  }
}

uint64_t caron_form(int a1)
{
  if ((a1 - 65) > 0x39) {
    return 0;
  }
  else {
    return dword_18D2C3D10[a1 - 65];
  }
}

uint64_t ring_above_form(uint64_t result)
{
  if ((int)result > 116)
  {
    switch(result)
    {
      case 'u':
        return 367;
      case 'w':
        return 7832;
      case 'y':
        return 7833;
    }
  }
  else
  {
    switch(result)
    {
      case 'A':
        return 197;
      case 'U':
        return 366;
      case 'a':
        return 229;
    }
  }
  return result;
}

uint64_t small_tilde_form(uint64_t result)
{
  if ((int)result > 96)
  {
    if ((int)result <= 109)
    {
      if (result == 97)
      {
        return 227;
      }
      else if (result == 105)
      {
        return 297;
      }
    }
    else
    {
      switch(result)
      {
        case 'u':
          return 361;
        case 'o':
          return 245;
        case 'n':
          return 241;
      }
    }
  }
  else if ((int)result <= 77)
  {
    if (result == 65)
    {
      return 195;
    }
    else if (result == 73)
    {
      return 296;
    }
  }
  else
  {
    switch(result)
    {
      case 'N':
        return 209;
      case 'O':
        return 213;
      case 'U':
        return 360;
    }
  }
  return result;
}

uint64_t combines_with_selective_modifier(uint64_t a1, int a2)
{
  uint64_t result = 0;
  if (a2 <= 709)
  {
    switch(a2)
    {
      case 168:
LABEL_20:
        int v7 = circumflex_form(a1);
        break;
      case 175:
        int v7 = macron_form(a1);
        break;
      case 180:
LABEL_9:
        int v7 = acute_accent_form(a1);
        break;
      default:
        return result;
    }
    return v7 != 0;
  }
  else
  {
    switch(a2)
    {
      case 710:
        goto LABEL_20;
      case 711:
        unsigned int v4 = a1 - 65;
        BOOL v5 = v4 > 0x39;
        unint64_t v6 = (0x21E691D021E691DuLL >> v4) & 1;
        if (v5) {
          return 0;
        }
        else {
          return v6;
        }
      case 712:
      case 713:
        return result;
      case 714:
        goto LABEL_9;
      case 715:
        int v7 = grave_accent_form(a1);
        return v7 != 0;
      default:
        if (a2 == 732)
        {
          int v7 = small_tilde_form(a1);
          return v7 != 0;
        }
        BOOL v9 = a1 == 953 || a1 == 965;
        uint64_t result = a2 == 901 && v9;
        break;
    }
  }
  return result;
}

uint64_t macron_form(int a1)
{
  if (a1 > 96)
  {
    if (a1 <= 104)
    {
      if (a1 == 97) {
        return 257;
      }
      if (a1 == 101) {
        return 275;
      }
    }
    else
    {
      switch(a1)
      {
        case 'i':
          return 299;
        case 'o':
          return 333;
        case 'u':
          return 363;
      }
    }
  }
  else if (a1 <= 72)
  {
    if (a1 == 65) {
      return 256;
    }
    if (a1 == 69) {
      return 274;
    }
  }
  else
  {
    switch(a1)
    {
      case 'I':
        return 298;
      case 'O':
        return 332;
      case 'U':
        return 362;
    }
  }
  return 0;
}

uint64_t strip_acute_accent(uint64_t result)
{
  if ((int)result <= 339)
  {
    if ((int)result > 242)
    {
      if ((int)result <= 262)
      {
        if ((int)result > 252)
        {
          if (result == 253)
          {
            return 121;
          }
          else if (result == 262)
          {
            return 67;
          }
        }
        else if (result == 243)
        {
          return 111;
        }
        else if (result == 250)
        {
          return 117;
        }
      }
      else if ((int)result <= 313)
      {
        if (result == 263)
        {
          return 99;
        }
        else if (result == 313)
        {
          return 76;
        }
      }
      else
      {
        switch(result)
        {
          case 0x13A:
            return 108;
          case 0x143:
            return 78;
          case 0x144:
            return 110;
        }
      }
    }
    else if ((int)result <= 217)
    {
      if ((int)result > 204)
      {
        if (result == 205)
        {
          return 73;
        }
        else if (result == 211)
        {
          return 79;
        }
      }
      else if (result == 193)
      {
        return 65;
      }
      else if (result == 201)
      {
        return 69;
      }
    }
    else if ((int)result <= 224)
    {
      if (result == 218)
      {
        return 85;
      }
      else if (result == 221)
      {
        return 89;
      }
    }
    else
    {
      switch(result)
      {
        case 0xE1:
          return 97;
        case 0xE9:
          return 101;
        case 0xED:
          return 105;
      }
    }
  }
  else if ((int)result > 939)
  {
    if ((int)result > 971)
    {
      switch(result)
      {
        case 0x3CC:
          return 959;
        case 0x3CD:
          return 965;
        case 0x3CE:
          return 969;
      }
    }
    else
    {
      switch((int)result)
      {
        case 940:
          uint64_t result = 945;
          break;
        case 941:
          uint64_t result = 949;
          break;
        case 942:
          uint64_t result = 951;
          break;
        case 943:
          uint64_t result = 953;
          break;
        default:
          return result;
      }
    }
  }
  else if ((int)result <= 901)
  {
    switch((int)result)
    {
      case 340:
        uint64_t result = 82;
        break;
      case 341:
        uint64_t result = 114;
        break;
      case 342:
      case 343:
      case 344:
      case 345:
        return result;
      case 346:
        uint64_t result = 83;
        break;
      case 347:
        uint64_t result = 115;
        break;
      default:
        if (result == 377)
        {
          uint64_t result = 90;
        }
        else if (result == 378)
        {
          uint64_t result = 122;
        }
        break;
    }
  }
  else
  {
    switch((int)result)
    {
      case 902:
        uint64_t result = 913;
        break;
      case 904:
        uint64_t result = 917;
        break;
      case 905:
        uint64_t result = 919;
        break;
      case 906:
        uint64_t result = 921;
        break;
      case 908:
        uint64_t result = 927;
        break;
      case 910:
        uint64_t result = 933;
        break;
      case 911:
        uint64_t result = 937;
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t strip_greek_accent(uint64_t a1, int *a2)
{
  int v5 = a1 - 902;
  if (!(!v3 & v2))
  {
    uint64_t result = 913;
    int v7 = 180;
    switch(v5)
    {
      case 0:
        goto LABEL_29;
      case 1:
      case 5:
      case 7:
        goto LABEL_9;
      case 2:
        uint64_t result = 917;
        goto LABEL_29;
      case 3:
        uint64_t result = 919;
        goto LABEL_29;
      case 4:
        uint64_t result = 921;
        goto LABEL_29;
      case 6:
        uint64_t result = 927;
        goto LABEL_29;
      case 8:
        uint64_t result = 933;
        goto LABEL_29;
      case 9:
        uint64_t result = 937;
        goto LABEL_29;
      case 10:
        uint64_t result = 953;
        goto LABEL_22;
      default:
        JUMPOUT(0);
    }
  }
  switch((int)a1)
  {
    case 938:
      uint64_t result = 921;
      goto LABEL_24;
    case 939:
      uint64_t result = 933;
LABEL_24:
      int v7 = 168;
      break;
    case 940:
      uint64_t result = 945;
      goto LABEL_28;
    case 941:
      uint64_t result = 949;
      goto LABEL_28;
    case 942:
      uint64_t result = 951;
      goto LABEL_28;
    case 943:
      uint64_t result = 953;
LABEL_28:
      int v7 = 180;
      break;
    case 944:
      uint64_t result = 965;
LABEL_22:
      int v7 = 901;
      break;
    default:
      switch((int)a1)
      {
        case 970:
          uint64_t result = 953;
          goto LABEL_24;
        case 971:
          uint64_t result = 965;
          goto LABEL_24;
        case 972:
          uint64_t result = 959;
          goto LABEL_28;
        case 973:
          uint64_t result = 965;
          goto LABEL_28;
        case 974:
          uint64_t result = 969;
          goto LABEL_28;
        default:
LABEL_9:
          int v7 = 0;
          uint64_t result = a1;
          break;
      }
      break;
  }
LABEL_29:
  *a2 = v7;
  return result;
}

uint64_t strip_caron(uint64_t result)
{
  if ((int)result <= 343)
  {
    if ((int)result > 282)
    {
      if ((int)result <= 317)
      {
        if (result == 283)
        {
          return 101;
        }
        else if (result == 317)
        {
          return 76;
        }
      }
      else
      {
        switch(result)
        {
          case 0x13E:
            return 108;
          case 0x147:
            return 78;
          case 0x148:
            return 110;
        }
      }
    }
    else
    {
      int v1 = result - 268;
      uint64_t result = 67;
      switch(v1)
      {
        case 1:
          uint64_t result = 99;
          break;
        case 2:
          uint64_t result = 68;
          break;
        case 3:
          uint64_t result = 100;
          break;
        default:
          return result;
      }
    }
  }
  else if ((int)result > 460)
  {
    switch((int)result)
    {
      case 461:
        uint64_t result = 65;
        break;
      case 462:
        uint64_t result = 97;
        break;
      case 463:
        uint64_t result = 73;
        break;
      case 464:
        uint64_t result = 105;
        break;
      case 465:
        uint64_t result = 79;
        break;
      case 466:
        uint64_t result = 111;
        break;
      case 467:
        uint64_t result = 85;
        break;
      case 468:
        uint64_t result = 117;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch((int)result)
    {
      case 344:
        uint64_t result = 82;
        break;
      case 345:
        uint64_t result = 114;
        break;
      case 346:
      case 347:
      case 348:
      case 349:
      case 350:
      case 351:
      case 354:
      case 355:
        return result;
      case 352:
        uint64_t result = 83;
        break;
      case 353:
        uint64_t result = 115;
        break;
      case 356:
        uint64_t result = 84;
        break;
      case 357:
        uint64_t result = 116;
        break;
      default:
        if (result == 381)
        {
          uint64_t result = 90;
        }
        else if (result == 382)
        {
          uint64_t result = 122;
        }
        break;
    }
  }
  return result;
}

uint64_t strip_circumflex(uint64_t result)
{
  if ((int)result > 225)
  {
    if ((int)result <= 237)
    {
      if (result == 226)
      {
        return 97;
      }
      else if (result == 234)
      {
        return 101;
      }
    }
    else
    {
      switch(result)
      {
        case 0xEE:
          return 105;
        case 0xF4:
          return 111;
        case 0xFB:
          return 117;
      }
    }
  }
  else if ((int)result <= 205)
  {
    if (result == 194)
    {
      return 65;
    }
    else if (result == 202)
    {
      return 69;
    }
  }
  else
  {
    switch(result)
    {
      case 0xCE:
        return 73;
      case 0xD4:
        return 79;
      case 0xDB:
        return 85;
    }
  }
  return result;
}

uint64_t strip_diaeresis(int a1)
{
  if (a1 > 245)
  {
    if (a1 > 937)
    {
      if (a1 > 969)
      {
        if (a1 == 970) {
          return 953;
        }
        if (a1 == 971) {
          return 965;
        }
      }
      else
      {
        if (a1 == 938) {
          return 921;
        }
        if (a1 == 939) {
          return 933;
        }
      }
    }
    else if (a1 > 254)
    {
      if (a1 == 255) {
        return 121;
      }
      if (a1 == 376) {
        return 89;
      }
    }
    else
    {
      if (a1 == 246) {
        return 111;
      }
      if (a1 == 252) {
        return 117;
      }
    }
  }
  else if (a1 > 219)
  {
    if (a1 > 234)
    {
      if (a1 == 235) {
        return 101;
      }
      if (a1 == 239) {
        return 105;
      }
    }
    else
    {
      if (a1 == 220) {
        return 85;
      }
      if (a1 == 228) {
        return 97;
      }
    }
  }
  else if (a1 > 206)
  {
    if (a1 == 207) {
      return 73;
    }
    if (a1 == 214) {
      return 79;
    }
  }
  else
  {
    if (a1 == 196) {
      return 65;
    }
    if (a1 == 203) {
      return 69;
    }
  }
  return 0;
}

uint64_t strip_dialytika_tonos(int a1)
{
  if (a1 == 944) {
    unsigned int v1 = 965;
  }
  else {
    unsigned int v1 = 0;
  }
  if (a1 == 912) {
    return 953;
  }
  else {
    return v1;
  }
}

uint64_t strip_grave_accent(uint64_t result)
{
  if ((int)result > 223)
  {
    if ((int)result <= 235)
    {
      if (result == 224)
      {
        return 97;
      }
      else if (result == 232)
      {
        return 101;
      }
    }
    else
    {
      switch(result)
      {
        case 0xEC:
          return 105;
        case 0xF2:
          return 111;
        case 0xF9:
          return 117;
      }
    }
  }
  else if ((int)result <= 203)
  {
    if (result == 192)
    {
      return 65;
    }
    else if (result == 200)
    {
      return 69;
    }
  }
  else
  {
    switch(result)
    {
      case 0xCC:
        return 73;
      case 0xD2:
        return 79;
      case 0xD9:
        return 85;
    }
  }
  return result;
}

uint64_t strip_macron(uint64_t result)
{
  if ((int)result > 298)
  {
    if ((int)result <= 332)
    {
      if (result == 299)
      {
        return 105;
      }
      else if (result == 332)
      {
        return 79;
      }
    }
    else
    {
      switch(result)
      {
        case 0x14D:
          return 111;
        case 0x16A:
          return 85;
        case 0x16B:
          return 117;
      }
    }
  }
  else if ((int)result <= 273)
  {
    if (result == 256)
    {
      return 65;
    }
    else if (result == 257)
    {
      return 97;
    }
  }
  else
  {
    switch(result)
    {
      case 0x112:
        return 69;
      case 0x113:
        return 101;
      case 0x12A:
        return 73;
    }
  }
  return result;
}

uint64_t strip_ring_above(uint64_t result)
{
  if ((int)result > 366)
  {
    switch(result)
    {
      case 0x16F:
        return 117;
      case 0x1E98:
        return 119;
      case 0x1E99:
        return 121;
    }
  }
  else
  {
    switch(result)
    {
      case 0xC5:
        return 65;
      case 0xE5:
        return 97;
      case 0x16E:
        return 85;
    }
  }
  return result;
}

uint64_t strip_small_tilde(uint64_t result)
{
  if ((int)result > 244)
  {
    if ((int)result <= 296)
    {
      if (result == 245)
      {
        return 111;
      }
      else if (result == 296)
      {
        return 73;
      }
    }
    else
    {
      switch(result)
      {
        case 0x129:
          return 105;
        case 0x168:
          return 85;
        case 0x169:
          return 117;
      }
    }
  }
  else if ((int)result <= 212)
  {
    if (result == 195)
    {
      return 65;
    }
    else if (result == 209)
    {
      return 78;
    }
  }
  else
  {
    switch(result)
    {
      case 0xD5:
        return 79;
      case 0xE3:
        return 97;
      case 0xF1:
        return 110;
    }
  }
  return result;
}

uint64_t combine_with_accent(uint64_t result, int a2)
{
  uint64_t v2 = result;
  LODWORD(result) = 0;
  if (a2 > 729)
  {
    if (a2 <= 899)
    {
      if (a2 == 730)
      {
        LODWORD(result) = ring_above_form(v2);
      }
      else if (a2 == 732)
      {
        LODWORD(result) = small_tilde_form(v2);
      }
      goto LABEL_29;
    }
    if (a2 == 901)
    {
      if (v2 == 965) {
        int v3 = 944;
      }
      else {
        int v3 = 0;
      }
      if (v2 == 953) {
        LODWORD(result) = 912;
      }
      else {
        LODWORD(result) = v3;
      }
      goto LABEL_29;
    }
    if (a2 != 900) {
      goto LABEL_29;
    }
LABEL_15:
    LODWORD(result) = acute_accent_form(v2);
    goto LABEL_29;
  }
  if (a2 > 709)
  {
    switch(a2)
    {
      case 710:
        LODWORD(result) = circumflex_form(v2);
        break;
      case 711:
        if ((v2 - 65) > 0x39) {
          LODWORD(result) = 0;
        }
        else {
          LODWORD(result) = dword_18D2C3D10[(v2 - 65)];
        }
        break;
      case 714:
        goto LABEL_15;
      case 715:
        LODWORD(result) = grave_accent_form(v2);
        break;
      default:
        goto LABEL_29;
    }
    goto LABEL_29;
  }
  switch(a2)
  {
    case 168:
      LODWORD(result) = diaeresis_form(v2);
      break;
    case 175:
      LODWORD(result) = macron_form(v2);
      break;
    case 180:
      goto LABEL_15;
  }
LABEL_29:
  if (result == v2 || result == 0) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t strip_accent(uint64_t result, int a2)
{
  uint64_t v2 = result;
  LODWORD(result) = 0;
  if (a2 > 729)
  {
    if (a2 <= 899)
    {
      if (a2 == 730)
      {
        LODWORD(result) = strip_ring_above(v2);
      }
      else if (a2 == 732)
      {
        LODWORD(result) = strip_small_tilde(v2);
      }
      goto LABEL_27;
    }
    if (a2 == 901)
    {
      if (v2 == 944) {
        int v3 = 965;
      }
      else {
        int v3 = 0;
      }
      if (v2 == 912) {
        LODWORD(result) = 953;
      }
      else {
        LODWORD(result) = v3;
      }
      goto LABEL_27;
    }
    if (a2 != 900) {
      goto LABEL_27;
    }
LABEL_15:
    LODWORD(result) = strip_acute_accent(v2);
    goto LABEL_27;
  }
  if (a2 > 709)
  {
    switch(a2)
    {
      case 710:
        LODWORD(result) = strip_circumflex(v2);
        break;
      case 711:
        LODWORD(result) = strip_caron(v2);
        break;
      case 714:
        goto LABEL_15;
      case 715:
        LODWORD(result) = strip_grave_accent(v2);
        break;
      default:
        goto LABEL_27;
    }
    goto LABEL_27;
  }
  switch(a2)
  {
    case 168:
      LODWORD(result) = strip_diaeresis(v2);
      break;
    case 175:
      LODWORD(result) = strip_macron(v2);
      break;
    case 180:
      goto LABEL_15;
  }
LABEL_27:
  if (result == v2 || result == 0) {
    return 0;
  }
  else {
    return result;
  }
}

BOOL character_is_composable_accent(int a1)
{
  BOOL result = 1;
  if (((a1 - 710) > 0x16 || ((1 << (a1 + 58)) & 0x500033) == 0)
    && ((a1 - 168) > 0xC || ((1 << (a1 + 88)) & 0x1081) == 0))
  {
    return (a1 - 900) < 2;
  }
  return result;
}

BOOL character_is_tamil_script(int a1)
{
  return (a1 & 0xFFFFFF80) == 2944;
}

void ___recentLexiconDispatchQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TextInput.recents-request", v2);
  unsigned int v1 = (void *)_recentLexiconDispatchQueue___xpc_queue;
  _recentLexiconDispatchQueue___xpc_queue = (uint64_t)v0;
}

uint64_t __Block_byref_object_copy__911(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__912(uint64_t a1)
{
}

void std::vector<std::vector<TIHandwritingPoint>>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      unint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      int v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<TIHandwritingPoint>>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(24 * a1);
}

void *std::vector<std::vector<TIHandwritingPoint>>::__swap_out_circular_buffer(void *result, void *a2)
{
  uint64_t v3 = (void *)*result;
  uint64_t v2 = (void *)result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    *(void *)(v4 - 24) = 0;
    *(void *)(v4 - 16) = 0;
    v4 -= 24;
    *(void *)(v4 + 16) = 0;
    long long v5 = *(_OWORD *)(v2 - 3);
    v2 -= 3;
    *(_OWORD *)uint64_t v4 = v5;
    *(void *)(v4 + 16) = v2[2];
    *uint64_t v2 = 0;
    v2[1] = 0;
    v2[2] = 0;
  }
  a2[1] = v4;
  unint64_t v6 = (void *)*result;
  *BOOL result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<std::vector<TIHandwritingPoint>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    uint64_t v4 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v4)
    {
      *(void *)(v2 - 16) = v4;
      operator delete(v4);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<TIHandwritingPoint>>(unint64_t a1)
{
  if (a1 >> 60) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(16 * a1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void *std::vector<TIHandwritingPoint>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    std::vector<TIHandwritingPoint>::__vallocate[abi:nn180100](a1, v5 >> 4);
    unint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<TIHandwritingPoint>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    abort();
  }
  BOOL result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<TIHandwritingPoint>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

char **std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *>(char **a1, char **a2, uint64_t a3)
{
  uint64_t v3 = a3;
  if (a1 != a2)
  {
    uint64_t v4 = a2;
    int64_t v5 = a1;
    unint64_t v6 = (char **)(a3 + 8);
    while (v5 == v6 - 1)
    {
LABEL_26:
      v5 += 3;
      v3 += 24;
      v6 += 3;
      if (v5 == v4) {
        return v6 - 1;
      }
    }
    uint64_t v7 = *v5;
    uint64_t v8 = v5[1];
    int64_t v9 = v8 - *v5;
    unint64_t v10 = v9 >> 4;
    uint64_t v11 = (uint64_t)v6[1];
    id v12 = *(v6 - 1);
    if (v9 >> 4 > (unint64_t)((v11 - (uint64_t)v12) >> 4))
    {
      if (v12)
      {
        char *v6 = v12;
        operator delete(v12);
        uint64_t v11 = 0;
        *(v6 - 1) = 0;
        char *v6 = 0;
        v6[1] = 0;
      }
      if (v9 < 0) {
        abort();
      }
      uint64_t v13 = v11 >> 3;
      if (v11 >> 3 <= v10) {
        uint64_t v13 = v9 >> 4;
      }
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      std::vector<TIHandwritingPoint>::__vallocate[abi:nn180100](v6 - 1, v14);
      id v12 = *v6;
      if (v8 != v7) {
        memmove(*v6, v7, v9);
      }
      uint64_t v15 = v6;
      goto LABEL_25;
    }
    uint64_t v15 = (char **)(v3 + 8);
    int64_t v16 = *v6 - v12;
    uint64_t v17 = v16 >> 4;
    if (v16 >> 4 >= v10)
    {
      if (v8 == v7)
      {
LABEL_24:
        uint64_t v4 = a2;
LABEL_25:
        *uint64_t v15 = &v12[v9];
        goto LABEL_26;
      }
      uint64_t v19 = *(v6 - 1);
      uint64_t v18 = *v5;
    }
    else
    {
      if (*v6 != v12)
      {
        memmove(*(v6 - 1), *v5, v16);
        id v12 = *v6;
      }
      uint64_t v18 = &v7[16 * v17];
      int64_t v9 = v8 - v18;
      if (v8 == v18) {
        goto LABEL_24;
      }
      uint64_t v19 = v12;
    }
    memmove(v19, v18, v9);
    goto LABEL_24;
  }
  return (char **)v3;
}

id TIInputModeGetFullInputModeIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v8 = 0;
  int64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__1934;
  id v12 = __Block_byref_object_dispose__1935;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __TIInputModeGetFullInputModeIdentifier_block_invoke;
  v7[3] = &unk_1E555A528;
  v7[4] = &v8;
  uint64_t v2 = (void (**)(void))MEMORY[0x192F9B5E0](v7);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v2[2](v2);
  }
  else {
    TIDispatchSync(MEMORY[0x1E4F14428], v2);
  }
  uint64_t v3 = TIInputModeGetMultilingualID(v1);
  if (v3)
  {
    uint64_t v4 = TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages(v1, (void *)v9[5], 0);
    int64_t v5 = [v4 componentsJoinedByString:@"|"];
  }
  else
  {
    int64_t v5 = (void *)[v1 copy];
  }

  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __Block_byref_object_copy__1934(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1935(uint64_t a1)
{
}

void __TIInputModeGetFullInputModeIdentifier_block_invoke(uint64_t a1)
{
  id v5 = +[TIInputModeController sharedInputModeController];
  uint64_t v2 = [v5 enabledInputModeIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

BOOL TIInputModeSupportsMultilingual(void *a1)
{
  id v1 = a1;
  uint64_t v2 = TIInputModeGetNormalizedIdentifier(v1);
  uint64_t v3 = TIGetInputModeProperties(v2);
  uint64_t v4 = [v3 objectForKeyedSubscript:@"UIKeyboardSupportsMultilingual"];

  if (v4)
  {
    id v5 = TIInputModeGetPreferredMultilingualLanguageModelLocale(v1);
    int v6 = [v5 isEqualToString:@"mul_IN"];

    if (v6)
    {
      if (isH13ANEPresentOnIOS_onceToken != -1) {
        dispatch_once(&isH13ANEPresentOnIOS_onceToken, &__block_literal_global_792);
      }
      BOOL v7 = isH13ANEPresentOnIOS_hasH13ANE != 0;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t TIInputModeIsTransliteration(void *a1)
{
  id v1 = TIInputModeGetNormalizedIdentifier(a1);
  uint64_t v2 = [v1 hasSuffix:@"-Translit"];

  return v2;
}

id TIInputModeGetRequiredMultilingualInputModes(void *a1)
{
  id v1 = TIInputModeGetNormalizedIdentifier(a1);
  uint64_t v2 = TIGetInputModeProperties(v1);
  uint64_t v3 = [v2 objectForKeyedSubscript:@"UIKeyboardRequiredMultilingualInputModes"];

  return v3;
}

id TIInputModeGetPreferredMultilingualLanguageModelLocale(void *a1)
{
  id v1 = TIInputModeGetNormalizedIdentifier(a1);
  uint64_t v2 = TIInputModeGetLanguageWithRegion(v1);
  if ([v2 isEqual:@"hi_Latn"])
  {
    if (isH13ANEPresentOnIOS_onceToken != -1) {
      dispatch_once(&isH13ANEPresentOnIOS_onceToken, &__block_literal_global_792);
    }
    int v3 = isH13ANEPresentOnIOS_hasH13ANE;

    if (!v3)
    {
      uint64_t v4 = 0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v5 = TIGetInputModeProperties(v1);
  uint64_t v4 = [v5 objectForKey:@"UIKeyboardPreferredMultilingualLanguageModelLocale"];

LABEL_8:

  return v4;
}

id TIInputModeGetRegion(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    uint64_t v2 = TIInputModeGetComponentsFromIdentifier(v1);
    int v3 = [v2 objectForKey:*MEMORY[0x1E4F1C400]];
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

id TIInputModeGetSWLayout(void *a1)
{
  id v1 = TIInputModeGetComponentsFromIdentifier(a1);
  uint64_t v2 = [v1 objectForKey:@"sw"];

  return v2;
}

BOOL TIISTypetoSiriMode(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = TIInputModeGetBaseLanguage(a2);
  BOOL v5 = [v4 hasPrefix:@"en"]
    && (([v3 isEqualToString:@"com.apple.siri"] & 1) != 0
     || [v3 isEqualToString:@"com.apple.SiriNCService"]);

  return v5;
}

id TIInputModeGetNormalizedLevelsFromComponents(void *a1)
{
  uint64_t v1 = *MEMORY[0x1E4F1C438];
  id v2 = a1;
  id v3 = [v2 valueForKey:v1];
  uint64_t v4 = *MEMORY[0x1E4F1C400];
  BOOL v5 = [v2 valueForKey:*MEMORY[0x1E4F1C400]];
  int v6 = [v2 valueForKey:*MEMORY[0x1E4F1C470]];
  BOOL v7 = [v2 valueForKey:*MEMORY[0x1E4F1C498]];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];
  int64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v10 = [v9 objectForKey:v4];
  uint64_t v11 = [v10 uppercaseString];

  if (([v11 isEqualToString:v5] & 1) == 0)
  {
    id v12 = [NSString stringWithFormat:@"%@_%@", v3, v11];
    [v8 addObject:v12];
  }
  if (v6)
  {
    id v13 = [NSString stringWithFormat:@"%@_%@", v3, v6];
    [v8 addObject:v13];
  }
  if (v5)
  {
    unint64_t v14 = [NSString stringWithFormat:@"%@_%@", v3, v5];
    [v8 addObject:v14];
  }
  if (v7)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%@-%@", v3, v7];
    [v8 addObject:v15];

    if (v5)
    {
      int64_t v16 = [NSString stringWithFormat:@"%@_%@-%@", v3, v5, v7];
      [v8 addObject:v16];
    }
  }

  return v8;
}

id TIInputModeGetMultilingualSetFromInputModes(void *a1, void *a2)
{
  return TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages(a1, a2, 0);
}

__CFString *TICanonicalInputModeName(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1)
  {
    int v6 = @"intl";
    goto LABEL_8;
  }
  id v3 = TIInputModeGetComponentsFromIdentifier(v1);
  uint64_t v4 = TIInputModeGetNormalizedIdentifierFromComponents(v3);
  BOOL v5 = [v3 objectForKey:*MEMORY[0x1E4F1C470]];
  if (!v5)
  {
    BOOL v7 = [v3 objectForKey:*MEMORY[0x1E4F1C498]];

    if (v7) {
      goto LABEL_6;
    }
    int64_t v9 = TIGetDefaultInputModesForLanguage(v4);
    if ([v9 count])
    {
      int v6 = [v9 objectAtIndex:0];
      uint64_t v10 = TIInputModeGetBaseLanguage(v6);
      uint64_t v11 = TIInputModeGetBaseLanguage(v2);
      char v12 = [v10 isEqualToString:v11];

      if (v12)
      {
LABEL_15:

        goto LABEL_7;
      }
    }
    int v6 = v2;
    goto LABEL_15;
  }

LABEL_6:
  int v6 = v4;
LABEL_7:

LABEL_8:

  return v6;
}

id TIGetSuggestedInputModesByLocaleForLanguage(void *a1)
{
  id v1 = a1;
  if (TIGetSuggestedInputModesByLocaleForLanguage_once != -1) {
    dispatch_once(&TIGetSuggestedInputModesByLocaleForLanguage_once, &__block_literal_global_319);
  }
  id v2 = TIInputModeGetBaseLanguage(v1);
  id v3 = [(id)TIGetSuggestedInputModesByLocaleForLanguage___suggestedLanguageInputModes objectForKey:v2];
  if (!v3)
  {
    id v3 = _UIKeyboardBundleInfoWithKey(v2, @"UIKeyboardSuggestedLanguageInputModes");
    if (v3) {
      [(id)TIGetSuggestedInputModesByLocaleForLanguage___suggestedLanguageInputModes setObject:v3 forKey:v2];
    }
  }

  return v3;
}

uint64_t __TIGetSuggestedInputModesByLocaleForLanguage_block_invoke()
{
  TIGetSuggestedInputModesByLocaleForLanguage___suggestedLanguageInputModes = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];

  return MEMORY[0x1F41817F8]();
}

id TIGetSuggestedDefaultInputModesByLocaleForLanguage(void *a1)
{
  id v1 = a1;
  if (TIGetSuggestedDefaultInputModesByLocaleForLanguage_once != -1) {
    dispatch_once(&TIGetSuggestedDefaultInputModesByLocaleForLanguage_once, &__block_literal_global_321);
  }
  id v2 = TIInputModeGetBaseLanguage(v1);
  id v3 = [(id)TIGetSuggestedDefaultInputModesByLocaleForLanguage___suggestedDefaultLanguageInputModes objectForKey:v2];
  if (!v3)
  {
    id v3 = _UIKeyboardBundleInfoWithKey(v2, @"UIKeyboardSuggestedDefaultLanguageInputModes");
    if (v3) {
      [(id)TIGetSuggestedDefaultInputModesByLocaleForLanguage___suggestedDefaultLanguageInputModes setObject:v3 forKey:v2];
    }
  }

  return v3;
}

uint64_t __TIGetSuggestedDefaultInputModesByLocaleForLanguage_block_invoke()
{
  TIGetSuggestedDefaultInputModesByLocaleForLanguage___suggestedDefaultLanguageInputModes = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];

  return MEMORY[0x1F41817F8]();
}

id TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage(void *a1)
{
  id v1 = a1;
  if (TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage_once != -1) {
    dispatch_once(&TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage_once, &__block_literal_global_323);
  }
  id v2 = TIInputModeGetBaseLanguage(v1);
  id v3 = [(id)TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage___suggestedDefaultLanguageInputModesForPad objectForKey:v2];
  if (!v3)
  {
    id v3 = _UIKeyboardBundleInfoWithKey(v2, @"UIKeyboardSuggestedDefaultLanguageInputModes-iPad");
    if (v3) {
      [(id)TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage___suggestedDefaultLanguageInputModesForPad setObject:v3 forKey:v2];
    }
  }

  return v3;
}

uint64_t __TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage_block_invoke()
{
  TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage___suggestedDefaultLanguageInputModesForPad = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];

  return MEMORY[0x1F41817F8]();
}

id TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage(void *a1)
{
  id v1 = a1;
  if (TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage_once != -1) {
    dispatch_once(&TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage_once, &__block_literal_global_325);
  }
  id v2 = TIInputModeGetBaseLanguage(v1);
  id v3 = [(id)TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage___suggestedDefaultLanguageInputModesForFudge objectForKey:v2];
  if (!v3)
  {
    id v3 = _UIKeyboardBundleInfoWithKey(v2, @"UIKeyboardSuggestedDefaultLanguageInputModes-Fudge");
    if (v3) {
      [(id)TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage___suggestedDefaultLanguageInputModesForFudge setObject:v3 forKey:v2];
    }
  }

  return v3;
}

uint64_t __TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage_block_invoke()
{
  TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage___suggestedDefaultLanguageInputModesForFudge = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];

  return MEMORY[0x1F41817F8]();
}

uint64_t TIGetAddKeyboardUsesPickerForInputMode(void *a1)
{
  id v1 = TIInputModeGetBaseLanguage(a1);
  id v2 = _UIKeyboardBundleInfoWithKey(v1, @"UIAddKeyboardUsesPicker");

  if (v2) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

float TIGetAddressBookThresholdForInputMode(void *a1)
{
  id v1 = TIInputModeGetBaseLanguage(a1);
  id v2 = _UIKeyboardBundleInfoWithKey(v1, @"KeyboardAddressBookThreshold");

  [v2 floatValue];
  float v4 = v3;

  return v4;
}

id TIGetAllInputModeProperties()
{
  if (TIGetAllInputModeProperties_once != -1) {
    dispatch_once(&TIGetAllInputModeProperties_once, &__block_literal_global_333);
  }
  dispatch_queue_t v0 = (void *)__inputModeProperties;

  return v0;
}

void __TIGetAllInputModeProperties_block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  dispatch_queue_t v0 = +[TIInputModeController sharedInputModeController];
  id v1 = [v0 supportedInputModeIdentifiers];

  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = TIGetInputModeProperties(*(void **)(*((void *)&v7 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

id TIGetSuggestedDictationLanguagesForDeviceLanguage()
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (TIGetSuggestedDictationLanguagesForDeviceLanguage_once != -1) {
    dispatch_once(&TIGetSuggestedDictationLanguagesForDeviceLanguage_once, &__block_literal_global_335);
  }
  dispatch_queue_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.TextInput"];
  id v1 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v2 = [v0 localizations];
  uint64_t v3 = [v1 preferredLocalizationsFromArray:v2 forPreferences:0];
  uint64_t v4 = [v3 firstObject];

  if (!v4)
  {
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = [(id)TIGetSuggestedDictationLanguagesForDeviceLanguage___suggestedDictationLanguageProperties objectForKey:v4];
  if ([v5 count]) {
    goto LABEL_14;
  }
  id v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v4];
  long long v7 = [v6 languageCode];

  long long v8 = _UIKeyboardBundleInfoWithKey(v7, @"UISuggestedDictationLanguages");
  long long v9 = v8;
  if (v8)
  {
    long long v10 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v11 = [v8 allKeys];
    uint64_t v12 = [&unk_1EDC286C0 arrayByAddingObjectsFromArray:v11];
    id v13 = [v10 preferredLocalizationsFromArray:v12 forPreferences:0];
    unint64_t v14 = [v13 firstObject];

    if ([v14 isEqualToString:@"zxx"])
    {
LABEL_9:

      goto LABEL_10;
    }
    if (v14)
    {
      uint64_t v15 = [v9 objectForKey:v14];

      uint64_t v5 = (void *)v15;
      goto LABEL_9;
    }
  }
LABEL_10:
  if (![v5 count])
  {
    v18[0] = v7;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

    uint64_t v5 = (void *)v16;
  }
  [(id)TIGetSuggestedDictationLanguagesForDeviceLanguage___suggestedDictationLanguageProperties setObject:v5 forKey:v4];

LABEL_14:

  return v5;
}

uint64_t __TIGetSuggestedDictationLanguagesForDeviceLanguage_block_invoke()
{
  TIGetSuggestedDictationLanguagesForDeviceLanguage___suggestedDictationLanguageProperties = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

id TILoadBundlePlist(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v4 stringByAppendingPathComponent:v3];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    long long v8 = v5;
LABEL_4:
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v8 options:1 error:0];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:0];
    }
    else
    {
      uint64_t v12 = 0;
    }

    goto LABEL_9;
  }
  long long v9 = [v4 stringByAppendingPathComponent:@"Resources"];
  long long v8 = [v9 stringByAppendingPathComponent:v3];

  long long v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  LODWORD(v9) = [v10 fileExistsAtPath:v8];

  if (v9) {
    goto LABEL_4;
  }
  uint64_t v12 = 0;
LABEL_9:

  return v12;
}

id TIGetHardwareKeyboardSupport()
{
  if (TIGetHardwareKeyboardSupport_onceToken != -1) {
    dispatch_once(&TIGetHardwareKeyboardSupport_onceToken, &__block_literal_global_354);
  }
  dispatch_queue_t v0 = (void *)TIGetHardwareKeyboardSupport___hardwareSupport;

  return v0;
}

void __TIGetHardwareKeyboardSupport_block_invoke()
{
  uint64_t v0 = +[8 objectForKey:@"HardwareKeyboardSupport.plist"];
  id v1 = (void *)TIGetHardwareKeyboardSupport___hardwareSupport;
  TIGetHardwareKeyboardSupport___hardwareSupport = v0;

  if (!TIGetHardwareKeyboardSupport___hardwareSupport)
  {
    TIGetTextInputFrameworkPath();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = TILoadBundlePlist(@"HardwareKeyboardSupport.plist", v4);
    id v3 = (void *)TIGetHardwareKeyboardSupport___hardwareSupport;
    TIGetHardwareKeyboardSupport___hardwareSupport = v2;
  }
}

id TIGetStickerTaxonomyIdentifiers()
{
  if (TIGetStickerTaxonomyIdentifiers_onceToken != -1) {
    dispatch_once(&TIGetStickerTaxonomyIdentifiers_onceToken, &__block_literal_global_359);
  }
  uint64_t v0 = (void *)TIGetStickerTaxonomyIdentifiers___stickerTaxonomyIdentifiers;

  return v0;
}

void __TIGetStickerTaxonomyIdentifiers_block_invoke()
{
  TIGetTextInputFrameworkPath();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = TILoadBundlePlist(@"StickerTaxonomyIdentifiers.plist", v2);
  id v1 = (void *)TIGetStickerTaxonomyIdentifiers___stickerTaxonomyIdentifiers;
  TIGetStickerTaxonomyIdentifiers___stickerTaxonomyIdentifiers = v0;
}

id TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions()
{
  if (TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions_onceToken != -1) {
    dispatch_once(&TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions_onceToken, &__block_literal_global_364);
  }
  uint64_t v0 = (void *)TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions___stickerTaxonomyIdentifiers;

  return v0;
}

void __TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions_block_invoke()
{
  TIGetTextInputFrameworkPath();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = TILoadBundlePlist(@"StickerTaxonomyIdentifiersAllowListSynonymExclusions.plist", v2);
  id v1 = (void *)TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions___stickerTaxonomyIdentifiers;
  TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions___stickerTaxonomyIdentifiers = v0;
}

id TIGetLanguageSupportForHardwareKeyboard(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = TIGetHardwareKeyboardSupport();
  id v6 = [v5 objectForKey:@"KeyboardNames"];

  if (!v3)
  {
    if ([v4 integerValue] < 1)
    {
      id v3 = 0;
    }
    else
    {
      char v7 = TIGetHardwareKeyboardSupport();
      long long v8 = [v7 objectForKey:@"USBCountryCodeMap"];
      long long v9 = [v4 stringValue];
      id v3 = [v8 objectForKey:v9];
    }
  }
  long long v10 = [v6 objectForKey:v3];
  if (_os_feature_enabled_impl())
  {
    if (([v3 isEqualToString:@"US"] & 1) != 0
      || ([v3 isEqualToString:@"U.S."] & 1) != 0)
    {
      uint64_t v11 = &unk_1EDC286D8;
    }
    else
    {
      uint64_t v11 = [v3 isEqual:@"Arabic"] ? &unk_1EDC286F0 : (void *)MEMORY[0x1E4F1CBF0];
    }
    if ([v11 count])
    {
      uint64_t v12 = (void *)[v10 mutableCopy];
      id v13 = [v10 objectForKeyedSubscript:@"MatchedModes"];
      unint64_t v14 = [v13 arrayByAddingObjectsFromArray:v11];
      [v12 setObject:v14 forKeyedSubscript:@"MatchedModes"];

      long long v10 = v12;
    }
  }

  return v10;
}

id TIGetDefaultHWLayoutForKeyboardAndInputMode(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = TIGetLanguageSupportForHardwareKeyboard(a1, &unk_1EDC383C0);
  uint64_t v5 = [v4 objectForKey:@"DefaultHWLayouts"];

  if (v5)
  {
    id v6 = [v5 objectForKey:v3];
  }
  else
  {
    char v7 = TIGetHardwareLayoutsForInputMode(v3);

    id v6 = [v7 firstObject];
    id v3 = v7;
  }

  return v6;
}

uint64_t TIEnabledInputModesAllowOneToManyShortcuts()
{
  return 1;
}

id UIKeyboardAllBundles()
{
  memset(&v35, 0, sizeof(v35));
  int v0 = stat("/System/Library/TextInput", &v35);
  if (v0) {
    __darwin_time_t tv_sec = 0;
  }
  else {
    __darwin_time_t tv_sec = v35.st_mtimespec.tv_sec;
  }
  if (v0) {
    uint64_t tv_nsec = 0;
  }
  else {
    uint64_t tv_nsec = v35.st_mtimespec.tv_nsec;
  }
  int v3 = stat("/Library/TextInput", &v35);
  __darwin_time_t v4 = v35.st_mtimespec.tv_sec;
  uint64_t v5 = v35.st_mtimespec.tv_nsec;
  if (v3)
  {
    __darwin_time_t v4 = 0;
    uint64_t v5 = 0;
  }
  if (UIKeyboardBundleRootsChanged_init == 1
    && UIKeyboardBundleRootsChanged_SystemRootModTime_0 == tv_sec
    && UIKeyboardBundleRootsChanged_SystemRootModTime_1 == tv_nsec
    && UIKeyboardBundleRootsChanged_ThirdPartyRootModTime_0 == v4
    && UIKeyboardBundleRootsChanged_ThirdPartyRootModTime_1 == v5)
  {
    char v6 = 0;
  }
  else
  {
    char v6 = 1;
    UIKeyboardBundleRootsChanged_init = 1;
    UIKeyboardBundleRootsChanged_SystemRootModTime_0 = tv_sec;
    UIKeyboardBundleRootsChanged_SystemRootModTime_1 = tv_nsec;
    UIKeyboardBundleRootsChanged_ThirdPartyRootModTime_0 = v4;
    UIKeyboardBundleRootsChanged_ThirdPartyRootModTime_1 = v5;
  }
  uint64_t v7 = [(id)UIKeyboardAllBundles___allBundles count];
  if ((v6 & 1) != 0 || !v7)
  {
    if (UIKeyboardAllBundles___allBundles)
    {
      [(id)UIKeyboardAllBundles___allBundles removeAllObjects];
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v10 = (void *)UIKeyboardAllBundles___allBundles;
      UIKeyboardAllBundles___allBundles = (uint64_t)v9;
    }
    p_prots = &OBJC_PROTOCOL___TIImageCaching.prots;
    if (!UIKeyboardAllBundles_bundleSearchPath)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1C978]);
      id v13 = (void *)[[NSString alloc] initWithUTF8String:"/System/Library/TextInput"];
      unint64_t v14 = (void *)[[NSString alloc] initWithUTF8String:"/Library/TextInput"];
      uint64_t v15 = objc_msgSend(v12, "initWithObjects:", v13, v14, 0);
      uint64_t v16 = (void *)UIKeyboardAllBundles_bundleSearchPath;
      UIKeyboardAllBundles_bundleSearchPath = v15;
    }
    char v34 = [MEMORY[0x1E4F28CB8] defaultManager];
    unint64_t v33 = [(id)UIKeyboardAllBundles_bundleSearchPath count];
    if (v33)
    {
      uint64_t v17 = 0;
      unsigned int v18 = 0;
      do
      {
        uint64_t v19 = p_prots;
        v20 = [(__objc2_prot_list *)p_prots[210] objectAtIndex:v17];
        id v21 = [v34 contentsOfDirectoryAtPath:v20 error:0];
        uint64_t v22 = [v21 count];
        if (v22)
        {
          unint64_t v23 = v22;
          uint64_t v24 = 0;
          unsigned int v25 = 1;
          do
          {
            v26 = [v21 objectAtIndex:v24];
            id v27 = [v20 stringByAppendingPathComponent:v26];
            id v28 = (const char *)[v27 fileSystemRepresentation];
            memset(&v35, 0, sizeof(v35));
            if (!stat(v28, &v35) && (v35.st_mode & 0x4000) != 0)
            {
              uint64_t v29 = (void *)UIKeyboardAllBundles___allBundles;
              uint64_t v30 = [MEMORY[0x1E4F28B50] bundleWithPath:v27];
              [v29 addObject:v30];
            }
            uint64_t v24 = v25;
          }
          while (v23 > v25++);
        }

        uint64_t v17 = ++v18;
        p_prots = v19;
      }
      while (v33 > v18);
    }
    id v8 = (id)UIKeyboardAllBundles___allBundles;
  }
  else
  {
    id v8 = (id)UIKeyboardAllBundles___allBundles;
  }

  return v8;
}

uint64_t TILinguisticDataRoot()
{
  return [NSString stringWithUTF8String:"/System/Library/LinguisticData"];
}

id TILinguisticDataBundlePathForInputMode(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v3 = TIInputModeGetBaseLanguage(v1);
  if (TIInputModeIsTransliteration(v1))
  {
    id v4 = v1;

    int v3 = v4;
  }
  if ([v1 hasPrefix:@"mul"])
  {
    id v5 = v1;

    int v3 = v5;
  }
  char v6 = [NSString stringWithFormat:@"%s/RequiredAssets_%@.bundle", "/System/Library/LinguisticData", v3];
  if ([v2 fileExistsAtPath:v6]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

id TILinguisticDataAssetDataPathForInputMode(void *a1)
{
  uint64_t v1 = TILinguisticDataBundlePathForInputMode(a1);
  if (v1)
  {
    id v2 = (void *)v1;
    int v3 = [NSString stringWithFormat:@"%@/AssetData", v1];
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

id TIBundleForInputMode(void *a1)
{
  id v1 = a1;
  id v2 = (void *)TIBundleForInputMode___cache;
  if (!TIBundleForInputMode___cache)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)TIBundleForInputMode___cache;
    TIBundleForInputMode___cache = (uint64_t)v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
    char v6 = (void *)TIBundleForInputMode___sentinel;
    TIBundleForInputMode___sentinel = (uint64_t)v5;

    id v2 = (void *)TIBundleForInputMode___cache;
  }
  uint64_t v7 = [v2 objectForKey:v1];
  id v8 = (void *)v7;
  if (v7)
  {
    if (v7 == TIBundleForInputMode___sentinel) {
      id v9 = 0;
    }
    else {
      id v9 = (void *)v7;
    }
    id v10 = v9;
  }
  else
  {
    uint64_t v11 = TIBundlePathForInputMode(v1);
    if (v11
      && ([MEMORY[0x1E4F28B50] bundleWithPath:v11], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = (id)v12;
      [(id)TIBundleForInputMode___cache setObject:v12 forKey:v1];
    }
    else
    {
      [(id)TIBundleForInputMode___cache setObject:TIBundleForInputMode___sentinel forKey:v1];
      id v10 = 0;
    }
  }

  return v10;
}

id TILinguisticDataBundleForInputMode(void *a1)
{
  id v1 = a1;
  id v2 = (void *)TILinguisticDataBundleForInputMode___cache;
  if (!TILinguisticDataBundleForInputMode___cache)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)TILinguisticDataBundleForInputMode___cache;
    TILinguisticDataBundleForInputMode___cache = (uint64_t)v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
    char v6 = (void *)TILinguisticDataBundleForInputMode___sentinel;
    TILinguisticDataBundleForInputMode___sentinel = (uint64_t)v5;

    id v2 = (void *)TILinguisticDataBundleForInputMode___cache;
  }
  uint64_t v7 = [v2 objectForKey:v1];
  id v8 = (void *)v7;
  if (v7)
  {
    if (v7 == TILinguisticDataBundleForInputMode___sentinel) {
      id v9 = 0;
    }
    else {
      id v9 = (void *)v7;
    }
    id v10 = v9;
  }
  else
  {
    uint64_t v11 = TILinguisticDataBundlePathForInputMode(v1);
    if (v11
      && ([MEMORY[0x1E4F28B50] bundleWithPath:v11], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = (id)v12;
      [(id)TILinguisticDataBundleForInputMode___cache setObject:v12 forKey:v1];
    }
    else
    {
      [(id)TILinguisticDataBundleForInputMode___cache setObject:TILinguisticDataBundleForInputMode___sentinel forKey:v1];
      id v10 = 0;
    }
  }

  return v10;
}

objc_class *TIInputManagerClassForInputMode(void *a1, int a2)
{
  id v3 = a1;
  id v4 = v3;
  if (!TIInputManagerClassForInputMode___default) {
    TIInputManagerClassForInputMode___default = @"TIKeyboardInputManager";
  }
  TICanonicalInputModeName(v3);
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    char v6 = TIInputModeGetLanguageWithRegion(v4);
    int v7 = [v6 isEqualToString:@"ja_JP"];

    if (v7)
    {
      id v8 = TIInputModeGetComponentsFromIdentifier(v4);
      id v9 = [v8 objectForKey:@"hw"];
      int v10 = [v9 isEqualToString:@"KANA"];

      if (v10) {
        id v5 = @"ja_JP-Kana";
      }
      else {
        id v5 = @"ja_JP-Romaji";
      }
    }
  }
  uint64_t v11 = TIInputModeGetNormalizedIdentifier(v4);
  uint64_t v12 = TIGetInputModeProperties(v11);
  id v13 = [v12 objectForKey:@"UIKeyboardInputManagerClass"];
  if (v13)
  {
    unint64_t v14 = TIBundleForInputMode(v5);
    uint64_t v15 = v14;
    if (v14) {
      Class v16 = (Class)[v14 classNamed:v13];
    }
    else {
      Class v16 = 0;
    }
  }
  else
  {
    Class v16 = NSClassFromString((NSString *)TIInputManagerClassForInputMode___default);
  }
  uint64_t v17 = v16;

  return v17;
}

id TIResourcePathForInputMode(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if ([v7 length])
  {
    uint64_t v11 = [NSString stringWithFormat:@"%@/%@", v7, v8];
    uint64_t v12 = TICanonicalInputModeName(v9);
    id v13 = [NSString stringWithFormat:@"%@%@.%@", v11, v12, v10];
    unint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v15 = [v14 fileExistsAtPath:v13];

    if (v15)
    {
      id v16 = v13;
      id v17 = v16;
    }
    else
    {
      unsigned int v18 = TIInputModeGetLanguageWithRegion(v9);
      uint64_t v19 = [NSString stringWithFormat:@"%@%@.%@", v11, v18, v10];

      v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v21 = [v20 fileExistsAtPath:v19];

      if (v21)
      {
        id v16 = v19;
        id v17 = v16;
      }
      else
      {
        unsigned int v25 = TIInputModeGetBaseLanguage(v9);
        id v16 = [NSString stringWithFormat:@"%@%@.%@", v11, v25, v10];

        uint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v23 = [v22 fileExistsAtPath:v16];

        if (v23) {
          id v17 = v16;
        }
        else {
          id v17 = 0;
        }
      }
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

id TICachedResourcePathForInputMode(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if ([v6 length])
  {
    if (!TICachedResourcePathForInputMode___cache)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = (void *)TICachedResourcePathForInputMode___cache;
      TICachedResourcePathForInputMode___cache = (uint64_t)v8;

      id v10 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
      uint64_t v11 = (void *)TICachedResourcePathForInputMode___sentinel;
      TICachedResourcePathForInputMode___sentinel = (uint64_t)v10;

      id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      id v13 = (void *)TICachedResourcePathForInputMode___key;
      TICachedResourcePathForInputMode___key = (uint64_t)v12;
    }
    unint64_t v14 = +[TIInputModeLocaleIdentifierOverrideMapping sharedInstance];
    int v15 = [v14 overrideLocaleForIdentifier:v6];

    if (v15)
    {
      id v16 = v15;

      id v6 = v16;
    }
    [(id)TICachedResourcePathForInputMode___key setString:v5];
    [(id)TICachedResourcePathForInputMode___key appendString:v6];
    [(id)TICachedResourcePathForInputMode___key appendString:@"."];
    [(id)TICachedResourcePathForInputMode___key appendString:v7];
    uint64_t v17 = [(id)TICachedResourcePathForInputMode___cache objectForKey:TICachedResourcePathForInputMode___key];
    unsigned int v18 = (void *)v17;
    if (v17)
    {
      if (v17 == TICachedResourcePathForInputMode___sentinel) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = (void *)v17;
      }
      id v20 = v19;
    }
    else
    {
      int v21 = TILinguisticDataAssetDataPathForInputMode(v6);
      TIResourcePathForInputMode(v21, v5, v6, v7);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20) {
        uint64_t v22 = (uint64_t)v20;
      }
      else {
        uint64_t v22 = TICachedResourcePathForInputMode___sentinel;
      }
      [(id)TICachedResourcePathForInputMode___cache setObject:v22 forKey:TICachedResourcePathForInputMode___key];
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

id TIStaticUnigramsFilePathForInputModeAndFileExtension(void *a1, void *a2)
{
  return TICachedResourcePathForInputMode(@"Unigrams-", a1, a2);
}

id TIDeltaUnigramsFilePathForInputModeAndFileExtension(void *a1, void *a2)
{
  return TICachedResourcePathForInputMode(@"Delta-", a1, a2);
}

id TIPhrasesFilePathForInputModeAndFileExtension(void *a1, void *a2)
{
  return TICachedResourcePathForInputMode(@"Phrases-", a1, a2);
}

id TINgramModelPathForInputMode(void *a1)
{
  id v1 = TICachedResourcePathForInputMode(&stru_1EDBDCE38, a1, @"lm");
  if (v1)
  {
    id v2 = v1;
    id v3 = [v1 stringByDeletingLastPathComponent];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id TIGetApplicableKeyboardShortcutOverrides(void *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = [v3 objectForKeyedSubscript:@"global"];
  id v7 = [v5 dictionaryWithDictionary:v6];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    id v27 = v8;
    id v28 = v4;
    uint64_t v26 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (([v13 isEqualToString:@"global"] & 1) == 0
          && [v4 hasPrefix:v13])
        {
          id v14 = [v8 objectForKeyedSubscript:v13];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_23:

            int v23 = 0;
            id v24 = (id)MEMORY[0x1E4F1CC08];
            goto LABEL_26;
          }
          id v15 = v14;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v14 = v15;
          uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v30;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * j);
                int v21 = [v14 objectForKeyedSubscript:v20];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  id v8 = v27;
                  id v4 = v28;
                  goto LABEL_23;
                }
                [v7 setObject:v21 forKeyedSubscript:v20];
              }
              uint64_t v17 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          id v8 = v27;
          id v4 = v28;
          uint64_t v11 = v26;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if ([v7 count]) {
    uint64_t v22 = (void *)[v7 copy];
  }
  else {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v24 = v22;
  int v23 = v24;
LABEL_26:

  return v23;
}

BOOL TIKeyboardShouldDisableAutocorrection(void *a1)
{
  id v1 = TIInputModeGetNormalizedIdentifier(a1);
  id v2 = TIGetInputModeProperties(v1);
  id v3 = [v2 objectForKeyedSubscript:@"UIKeyboardDisableAutocorrection"];
  BOOL v4 = v3 != 0;

  return v4;
}

id TIGetKeyboardShortcutOverridesForKeyboardLayout(void *a1, int a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [v3 length];
  id v5 = (void *)MEMORY[0x1E4F1CC08];
  if (!v4)
  {
    id v14 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_27;
  }
  id v6 = [v3 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EDBDCE38];
  id v7 = [v6 stringByReplacingOccurrencesOfString:@"." withString:&stru_1EDBDCE38];
  if (TIGetNormalizedKeyboardLayoutForShortcutTranslation_onceToken != -1) {
    dispatch_once(&TIGetNormalizedKeyboardLayoutForShortcutTranslation_onceToken, &__block_literal_global_527);
  }
  uint64_t v8 = [(id)TIGetNormalizedKeyboardLayoutForShortcutTranslation_keyboardlayout_map objectForKeyedSubscript:v7];
  uint64_t v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  else {
    uint64_t v10 = v7;
  }
  id v11 = v10;

  if (TIGetKeyboardShortcutOverridesForKeyboardLayout_once != -1) {
    dispatch_once(&TIGetKeyboardShortcutOverridesForKeyboardLayout_once, &__block_literal_global_458);
  }
  if (a2) {
    id v12 = @"_JIS";
  }
  else {
    id v12 = &stru_1EDBDCE38;
  }
  id v13 = [v11 stringByAppendingString:v12];
  id v14 = [(id)TIGetKeyboardShortcutOverridesForKeyboardLayout___keyboardShortcutOverridesCache objectForKey:v13];
  if (!v14)
  {
    id v15 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v16 = [v15 bundleIdentifier];

    uint64_t v17 = [NSString stringWithFormat:@"KeyboardShortcutEquivalents_%@.plist", v13];
    uint64_t v18 = +[8 objectForKey:v17];
    if (!v18 && a2)
    {
      uint64_t v19 = [NSString stringWithFormat:@"KeyboardShortcutEquivalents_%@.plist", v11];

      uint64_t v18 = +[8 objectForKey:v19];
      uint64_t v17 = (void *)v19;
    }
    uint64_t v20 = TIGetApplicableKeyboardShortcutOverrides(v18, v16);
    if ([v20 count])
    {
      id v14 = (void *)[v20 copy];
      if (!v20)
      {
LABEL_21:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315650;
          int v23 = "TIGetKeyboardShortcutOverridesForKeyboardLayout";
          __int16 v24 = 2112;
          id v25 = v11;
          __int16 v26 = 2112;
          id v27 = v16;
          _os_log_fault_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s: malformatted plist for keyboard layout(%@) bundleID(%@)", buf, 0x20u);
        }
      }
    }
    else
    {
      id v14 = 0;
      if (!v20) {
        goto LABEL_21;
      }
    }
    if (!v14) {
      id v14 = v5;
    }
    [(id)TIGetKeyboardShortcutOverridesForKeyboardLayout___keyboardShortcutOverridesCache setObject:v14 forKey:v13];
  }
LABEL_27:

  return v14;
}

uint64_t __TIGetKeyboardShortcutOverridesForKeyboardLayout_block_invoke()
{
  TIGetKeyboardShortcutOverridesForKeyboardLayout___keyboardShortcutOverridesCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

void __TIGetNormalizedKeyboardLayoutForShortcutTranslation_block_invoke()
{
  int v0 = (void *)TIGetNormalizedKeyboardLayoutForShortcutTranslation_keyboardlayout_map;
  TIGetNormalizedKeyboardLayoutForShortcutTranslation_keyboardlayout_map = (uint64_t)&unk_1EDC2C210;
}

id TILoadMergedKeyboardPlistForLocale(void *a1, void *a2, void *a3, uint64_t a4, void *a5, int a6)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = @"iPhone";
  if (a4 == 1) {
    id v14 = @"iPad";
  }
  if (a4 == 2) {
    id v15 = @"AppleTV";
  }
  else {
    id v15 = v14;
  }
  if (TIDefaultKeyboardPlist_onceToken != -1) {
    dispatch_once(&TIDefaultKeyboardPlist_onceToken, &__block_literal_global_558);
  }
  id v43 = (id)TIDefaultKeyboardPlist_defaultPlist;
  uint64_t v16 = TIInputModeGetBaseLanguage(v13);
  uint64_t v17 = TIInputModeGetLanguage(v13);
  uint64_t v41 = v13;
  uint64_t v18 = [v13 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  v49 = TIInputModeGetLanguageWithRegion(v18);

  if (v10)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%@-%@", v10, v15];
    if (v11)
    {
      uint64_t v20 = [NSString stringWithFormat:@"%@_%@", v10, v11];
    }
    else
    {
      uint64_t v20 = 0;
    }
    BOOL v47 = (void *)v20;
    uint64_t v48 = (void *)v19;
    if (v12)
    {
      uint64_t v24 = [NSString stringWithFormat:@"%@-%@", v10, v12];
      if (v24)
      {
        v45 = (void *)v24;
        uint64_t v46 = [NSString stringWithFormat:@"%@-%@", v24, v15];
        char v22 = 0;
      }
      else
      {
        v45 = 0;
        uint64_t v46 = 0;
        char v22 = 1;
      }
      int v21 = 0;
      char v23 = 1;
      if (v11)
      {
        uint64_t v25 = [NSString stringWithFormat:@"%@_%@-%@", v10, v11, v12];
        if (v25)
        {
          v44 = (void *)v25;
          int v21 = [NSString stringWithFormat:@"%@-%@", v25, v15];
          char v23 = 0;
        }
        else
        {
          int v21 = 0;
          v44 = 0;
        }
      }
      else
      {
        v44 = 0;
      }
    }
    else
    {
      v45 = 0;
      uint64_t v46 = 0;
      int v21 = 0;
      v44 = 0;
      char v22 = 1;
      char v23 = 1;
    }
  }
  else
  {
    v45 = 0;
    uint64_t v46 = 0;
    BOOL v47 = 0;
    uint64_t v48 = 0;
    int v21 = 0;
    v44 = 0;
    char v22 = 1;
    char v23 = 1;
  }
  __int16 v26 = [MEMORY[0x1E4F1CA48] array];
  id v27 = v26;
  if (a6 && v16) {
    [v26 addObject:v16];
  }
  if (a6 && v17 && ([v27 containsObject:v17] & 1) == 0) {
    [v27 addObject:v17];
  }
  if (a6 && v49 && ([v27 containsObject:v49] & 1) == 0) {
    [v27 addObject:v49];
  }
  if (v10 && ([v27 containsObject:v10] & 1) == 0) {
    [v27 addObject:v10];
  }
  if (v47 && ([v27 containsObject:v47] & 1) == 0) {
    [v27 addObject:v47];
  }
  if ((v22 & 1) == 0 && ([v27 containsObject:v45] & 1) == 0) {
    [v27 addObject:v45];
  }
  if ((v23 & 1) == 0 && ([v27 containsObject:v44] & 1) == 0) {
    [v27 addObject:v44];
  }
  if (v48 && ([v27 containsObject:v48] & 1) == 0) {
    [v27 addObject:v48];
  }
  if (v46 && ([v27 containsObject:v46] & 1) == 0) {
    [v27 addObject:v46];
  }
  uint64_t v40 = (void *)v16;
  if (v21 && ([v27 containsObject:v21] & 1) == 0) {
    [v27 addObject:v21];
  }
  uint64_t v39 = v12;
  v42 = v11;
  if ([v27 containsObject:@"default"] & 1) != 0 || (a6)
  {
    uint64_t v28 = (void *)v17;
    id v29 = (id)[v43 mutableCopy];
    [v27 removeObject:@"default"];
  }
  else
  {
    uint64_t v28 = (void *)v17;
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v30 = v27;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v52 != v33) {
          objc_enumerationMutation(v30);
        }
        long long v35 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        long long v36 = TIBundlePathForInputMode(v35);
        long long v37 = TILoadKeyboardPlist(v35, v36);
        [v29 addEntriesFromDictionary:v37];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v32);
  }

  return v29;
}

id TILoadKeyboardPlist(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length] && objc_msgSend(v4, "length"))
  {
    id v5 = [NSString stringWithFormat:@"Keyboard-%@.plist", v3];
    id v6 = TILoadBundlePlist(v5, v4);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __TIDefaultKeyboardPlist_block_invoke()
{
  TIGetTextInputFrameworkPath();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = TILoadKeyboardPlist(@"default", v4);
  id v1 = (void *)TIDefaultKeyboardPlist_defaultPlist;
  TIDefaultKeyboardPlist_defaultPlist = v0;

  if (!TIDefaultKeyboardPlist_defaultPlist)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    id v3 = (void *)TIDefaultKeyboardPlist_defaultPlist;
    TIDefaultKeyboardPlist_defaultPlist = (uint64_t)v2;
  }
}

id TILoadMergedKeyboardPlistForInputMode(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = TIInputModeGetLanguage(v3);
  id v5 = TIInputModeGetRegion(v3);
  id v6 = TIInputModeGetVariant(v3);

  id v7 = TILoadMergedKeyboardPlistForLocale(v4, v5, v6, a2, 0, 0);

  return v7;
}

id TIKeyboardPopupVariantsForInputMode(void *a1, uint64_t a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a1;
  id v5 = [v3 dictionary];
  id v6 = TILoadMergedKeyboardPlistForInputMode(v4, a2);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __TIKeyboardPopupVariantsForInputMode_block_invoke;
    v8[3] = &unk_1E5558C48;
    id v9 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v8];
  }

  return v5;
}

void __TIKeyboardPopupVariantsForInputMode_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 hasPrefix:@"Roman-Accent-"])
  {
    [v14 rangeOfString:@"Roman-Accent-" options:8];
    id v7 = [v14 substringFromIndex:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = [v8 objectForKey:@"Strings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      id v11 = [v9 stringByTrimmingCharactersInSet:v10];

      id v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      id v13 = [v11 componentsSeparatedByCharactersInSet:v12];

      if ([v13 count]) {
        [*(id *)(a1 + 32) setObject:v13 forKey:v7];
      }
    }
  }
}

BOOL TIInputModeWantsMultilingualUnionOVS(void *a1)
{
  id v1 = TIInputModeGetNormalizedIdentifier(a1);
  id v2 = TIGetInputModeProperties(v1);
  id v3 = [v2 objectForKeyedSubscript:@"UIKeyboardWantsMultilingualUnionOVS"];
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t TIInputModeUseMorphemeLevelLexicon(void *a1)
{
  id v1 = a1;
  if (_os_feature_enabled_impl())
  {
    id v2 = TIGetInputModeProperties(v1);
    id v3 = [v2 objectForKey:@"UIKeyboardUseMorphemeLevelLexicon"];
    BOOL v4 = v3;
    if (v3) {
      uint64_t v5 = [v3 BOOLValue];
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id TI_filteredSetWithClass(void *a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __TI_filteredSetWithClass_block_invoke;
  v4[3] = &__block_descriptor_40_e22_B24__0__NSString_8_B16lu32l8;
  v4[4] = a2;
  id v2 = [a1 objectsPassingTest:v4];

  return v2;
}

id _TIValueForCGRect(double a1, double a2, double a3, double a4)
{
  *(double *)uint64_t v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  BOOL v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  return v4;
}

uint64_t __Block_byref_object_copy__2893(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2894(uint64_t a1)
{
}

__CFString *TIKeyboardCandidateTypingEngineTypeToString(unsigned int a1)
{
  if (a1 > 6) {
    return @"Other";
  }
  else {
    return off_1E5558EC0[a1];
  }
}

uint64_t TI_USER_DIRECTORY()
{
  uint64_t result = s_user_directory;
  if (!s_user_directory)
  {
    if (TI_USER_DIRECTORY_onceToken != -1) {
      dispatch_once(&TI_USER_DIRECTORY_onceToken, &__block_literal_global_4074);
    }
    return TI_USER_DIRECTORY_default_user_directory;
  }
  return result;
}

void *__getCPSharedResourcesDirectorySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!AppSupportLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __AppSupportLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5558F48;
    uint64_t v7 = 0;
    AppSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)AppSupportLibraryCore_frameworkLibrary;
    if (AppSupportLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)AppSupportLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "CPSharedResourcesDirectory");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCPSharedResourcesDirectorySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppSupportLibraryCore_frameworkLibrary = result;
  return result;
}

void TI_SET_USER_DIRECTORY(CFTypeRef cf)
{
  if ((CFTypeRef)s_user_directory != cf)
  {
    if (s_user_directory)
    {
      CFRelease((CFTypeRef)s_user_directory);
      s_user_directory = 0;
    }
    if (cf) {
      s_user_directory = (uint64_t)CFRetain(cf);
    }
  }
}

void *TI_DEVICE_UNLOCKED()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getMKBGetDeviceLockStateSymbolLoc_ptr;
  id v9 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    id v1 = (void *)MobileKeyBagLibrary();
    v7[3] = (uint64_t)dlsym(v1, "MKBGetDeviceLockState");
    getMKBGetDeviceLockStateSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    uint64_t v0 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    int v2 = v0(0);
    return (void *)(!v2 || v2 == 3);
  }
  else
  {
    dlerror();
    uint64_t v5 = abort_report_np();
    return __getMKBGetDeviceLockStateSymbolLoc_block_invoke(v5);
  }
}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileKeyBagLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MobileKeyBagLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5558F60;
    uint64_t v5 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = MobileKeyBagLibraryCore_frameworkLibrary;
    if (MobileKeyBagLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return MobileKeyBagLibraryCore_frameworkLibrary;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrary = result;
  return result;
}

void *TI_DEVICE_UNLOCKED_SINCE_BOOT()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (unsigned int (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  uint64_t v7 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    id v1 = (void *)MobileKeyBagLibrary();
    v5[3] = (uint64_t)dlsym(v1, "MKBDeviceUnlockedSinceBoot");
    getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    uint64_t v0 = (unsigned int (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0) {
    return (void *)(v0() == 1);
  }
  dlerror();
  uint64_t v3 = abort_report_np();
  return __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(v3);
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL TI_SET_PROTECTION_CLASS_C(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:a1 isDirectory:0 relativeToURL:0];
  uint64_t v2 = *MEMORY[0x1E4F1C580];
  uint64_t v3 = *MEMORY[0x1E4F1C590];
  id v7 = 0;
  [v1 setResourceValue:v2 forKey:v3 error:&v7];
  id v4 = v7;
  if (v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = [v4 description];
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_error_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "couldn't set protection class, error: %@", buf, 0xCu);
  }
  return v4 == 0;
}

uint64_t TI_IS_FILE_CLASS_C(uint64_t a1)
{
  id v1 = [NSString stringWithUTF8String:a1];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = 0;
  uint64_t v3 = [v2 attributesOfItemAtPath:v1 error:&v7];

  id v4 = [v3 objectForKey:*MEMORY[0x1E4F28370]];
  uint64_t v5 = [v4 isEqualToString:*MEMORY[0x1E4F28358]];

  return v5;
}

id _TIQueueBackground()
{
  if (_TIQueueBackground::onceToken != -1) {
    dispatch_once(&_TIQueueBackground::onceToken, &__block_literal_global_4712);
  }
  uint64_t v0 = (void *)_TIQueueBackground::sQueue;

  return v0;
}

id _TIQueueLow()
{
  if (_TIQueueLow::onceToken != -1) {
    dispatch_once(&_TIQueueLow::onceToken, &__block_literal_global_2);
  }
  uint64_t v0 = (void *)_TIQueueLow::sQueue;

  return v0;
}

id _TIQueueUserInitiated()
{
  if (_TIQueueUserInitiated::onceToken != -1) {
    dispatch_once(&_TIQueueUserInitiated::onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)_TIQueueUserInitiated::sQueue;

  return v0;
}

void TIDispatchSync(void *a1, void *a2)
{
  queue = a1;
  id v3 = a2;
  if (_block_count(void)::once_token != -1) {
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global_7);
  }
  atomic_fetch_add((atomic_ullong *volatile)&_block_count(void)::count, 1uLL);
  dispatch_sync(queue, v3);
  if (_block_count(void)::once_token != -1) {
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global_7);
  }
  atomic_fetch_add((atomic_ullong *volatile)&_block_count(void)::count, 0xFFFFFFFFFFFFFFFFLL);
}

void ___ZL12_block_countv_block_invoke()
{
}

void TIDispatchAsync(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __TIDispatchAsync_block_invoke;
  v7[3] = &unk_1E5559010;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = a1;
  uint64_t v6 = (void *)MEMORY[0x192F9B5E0](v7);
  if (_block_count(void)::once_token != -1) {
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global_7);
  }
  atomic_fetch_add((atomic_ullong *volatile)&_block_count(void)::count, 1uLL);
  dispatch_async(v5, v6);
}

void __TIDispatchAsync_block_invoke(uint64_t a1)
{
  if (_block_count(void)::once_token != -1) {
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global_7);
  }
  atomic_fetch_add((atomic_ullong *volatile)&_block_count(void)::count, 0xFFFFFFFFFFFFFFFFLL);
}

unint64_t TIDispatchCount()
{
  if (_block_count(void)::once_token != -1) {
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global_7);
  }
  return atomic_load(&_block_count(void)::count);
}

void TIDispatchWaitForAllBlocks()
{
  uint64_t v0 = (void *)MEMORY[0x192F9B3D0]();
  uint64_t v1 = *MEMORY[0x1E4F1C3A0];
  while (1)
  {
    if (_block_count(void)::once_token != -1) {
      dispatch_once(&_block_count(void)::once_token, &__block_literal_global_7);
    }
    uint64_t v2 = atomic_load(&_block_count(void)::count);
    if (v2 < 1) {
      break;
    }
    id v3 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.01];
    [v3 acceptInputForMode:v1 beforeDate:v4];
  }
}

id _assistantInternalQueue()
{
  if (_assistantInternalQueue_onceToken != -1) {
    dispatch_once(&_assistantInternalQueue_onceToken, &__block_literal_global_4804);
  }
  uint64_t v0 = (void *)_assistantInternalQueue___xpc_queue;

  return v0;
}

void ___assistantInternalQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TextInput.rdt", v2);
  uint64_t v1 = (void *)_assistantInternalQueue___xpc_queue;
  _assistantInternalQueue___xpc_queue = (uint64_t)v0;
}

uint64_t _recordTypeForEventRecordHeader(uint64_t a1)
{
  id v2 = *(id *)(a1 + 16);
  if ([v2 isEqualToString:@"Completions"])
  {
    uint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"Autocorrection"])
  {
    uint64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"Predictions"])
  {
    uint64_t v3 = 3;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id _parseRawCandidateGroupsFromString(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v1];
  id v12 = 0;
  int v4 = [v3 scanUpToString:@"\n[" intoString:&v12];
  id v5 = v12;
  uint64_t v6 = v5;
  if (v4)
  {
    do
    {
      uint64_t v7 = +[TITraceLogCandidateGroup groupFromGroupString:v6];
      if (v7) {
        [v2 addObject:v7];
      }

      id v12 = v6;
      char v8 = [v3 scanUpToString:@"\n[" intoString:&v12];
      id v9 = v12;

      uint64_t v6 = v9;
    }
    while ((v8 & 1) != 0);
  }
  else
  {
    id v9 = v5;
  }
  uint64_t v10 = (void *)[v2 copy];

  return v10;
}

id _parseRemovedCandidatesGroupFromString(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v1];
  id v12 = 0;
  int v4 = [v3 scanUpToString:@"\n" intoString:&v12];
  id v5 = v12;
  uint64_t v6 = v5;
  if (v4)
  {
    do
    {
      uint64_t v7 = +[TITraceLogCandidate candidateFromRemovedCandidateString:v6];
      if (v7) {
        [v2 addObject:v7];
      }

      id v12 = v6;
      char v8 = [v3 scanUpToString:@"\n" intoString:&v12];
      id v9 = v12;

      uint64_t v6 = v9;
    }
    while ((v8 & 1) != 0);
  }
  else
  {
    id v9 = v5;
  }
  uint64_t v10 = (void *)[v2 copy];

  return v10;
}

id _parseFinalCandidatesGroupFromString(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v1];
  id v12 = 0;
  int v4 = [v3 scanUpToString:@"\n" intoString:&v12];
  id v5 = v12;
  uint64_t v6 = v5;
  if (v4)
  {
    do
    {
      uint64_t v7 = +[TITraceLogCandidate candidateFromFinalCandidateString:v6];
      if (v7) {
        [v2 addObject:v7];
      }

      id v12 = v6;
      char v8 = [v3 scanUpToString:@"\n" intoString:&v12];
      id v9 = v12;

      uint64_t v6 = v9;
    }
    while ((v8 & 1) != 0);
  }
  else
  {
    id v9 = v5;
  }
  uint64_t v10 = (void *)[v2 copy];

  return v10;
}

__CFString *autoCorrectionTypeAsString(int a1)
{
  if (a1)
  {
    id v2 = [&stru_1EDBDCE38 stringByAppendingString:@"All|"];
    if ((a1 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v2 = &stru_1EDBDCE38;
  if ((a1 & 2) != 0)
  {
LABEL_5:
    uint64_t v3 = [(__CFString *)v2 stringByAppendingString:@"Caps|"];

    id v2 = (__CFString *)v3;
  }
LABEL_6:
  if ((a1 & 4) != 0)
  {
    uint64_t v6 = [(__CFString *)v2 stringByAppendingString:@"Dia|"];

    id v2 = (__CFString *)v6;
    if ((a1 & 8) == 0)
    {
LABEL_8:
      if ((a1 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_31;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_8;
  }
  uint64_t v7 = [(__CFString *)v2 stringByAppendingString:@"Pred|"];

  id v2 = (__CFString *)v7;
  if ((a1 & 0x10) == 0)
  {
LABEL_9:
    if ((a1 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v8 = [(__CFString *)v2 stringByAppendingString:@"Spc|"];

  id v2 = (__CFString *)v8;
  if ((a1 & 0x20) == 0)
  {
LABEL_10:
    if ((a1 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v9 = [(__CFString *)v2 stringByAppendingString:@"Retro|"];

  id v2 = (__CFString *)v9;
  if ((a1 & 0x40) == 0)
  {
LABEL_11:
    if ((a1 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v10 = [(__CFString *)v2 stringByAppendingString:@"Adapt|"];

  id v2 = (__CFString *)v10;
  if ((a1 & 0x80) == 0)
  {
LABEL_12:
    if ((a1 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v11 = [(__CFString *)v2 stringByAppendingString:@"MultiPred|"];

  id v2 = (__CFString *)v11;
  if ((a1 & 0x100) == 0)
  {
LABEL_13:
    if ((a1 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v12 = [(__CFString *)v2 stringByAppendingString:@"Recent|"];

  id v2 = (__CFString *)v12;
  if ((a1 & 0x200) == 0)
  {
LABEL_14:
    if ((a1 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v13 = [(__CFString *)v2 stringByAppendingString:@"Learned|"];

  id v2 = (__CFString *)v13;
  if ((a1 & 0x400) == 0)
  {
LABEL_15:
    if ((a1 & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v14 = [(__CFString *)v2 stringByAppendingString:@"Transposition|"];

  id v2 = (__CFString *)v14;
  if ((a1 & 0x800) == 0)
  {
LABEL_16:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v15 = [(__CFString *)v2 stringByAppendingString:@"Insert|"];

  id v2 = (__CFString *)v15;
  if ((a1 & 0x1000) == 0)
  {
LABEL_17:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v16 = [(__CFString *)v2 stringByAppendingString:@"Skip|"];

  id v2 = (__CFString *)v16;
  if ((a1 & 0x2000) == 0)
  {
LABEL_18:
    if ((a1 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v17 = [(__CFString *)v2 stringByAppendingString:@"NamedEntity|"];

  id v2 = (__CFString *)v17;
  if ((a1 & 0x4000) == 0)
  {
LABEL_19:
    if ((a1 & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v18 = [(__CFString *)v2 stringByAppendingString:@"Near|"];

  id v2 = (__CFString *)v18;
  if ((a1 & 0x8000) == 0)
  {
LABEL_20:
    if ((a1 & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v19 = [(__CFString *)v2 stringByAppendingString:@"Subst|"];

  id v2 = (__CFString *)v19;
  if ((a1 & 0x10000) == 0)
  {
LABEL_21:
    if ((a1 & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v20 = [(__CFString *)v2 stringByAppendingString:@"HitTest|"];

  id v2 = (__CFString *)v20;
  if ((a1 & 0x20000) == 0)
  {
LABEL_22:
    if ((a1 & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v21 = [(__CFString *)v2 stringByAppendingString:@"CPCompletion|"];

  id v2 = (__CFString *)v21;
  if ((a1 & 0x40000) == 0)
  {
LABEL_23:
    if ((a1 & 0x80000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v22 = [(__CFString *)v2 stringByAppendingString:@"MultiLingual|"];

  id v2 = (__CFString *)v22;
  if ((a1 & 0x80000) == 0)
  {
LABEL_24:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v23 = [(__CFString *)v2 stringByAppendingString:@"CP|"];

  id v2 = (__CFString *)v23;
  if ((a1 & 0x100000) == 0)
  {
LABEL_25:
    if ((a1 & 0x200000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_47:
  uint64_t v24 = [(__CFString *)v2 stringByAppendingString:@"SupplLex|"];

  id v2 = (__CFString *)v24;
  if ((a1 & 0x200000) != 0)
  {
LABEL_26:
    uint64_t v4 = [(__CFString *)v2 stringByAppendingString:@"Join|"];

    id v2 = (__CFString *)v4;
  }
LABEL_27:
  if ([(__CFString *)v2 length])
  {
    id v5 = [(__CFString *)v2 substringToIndex:[(__CFString *)v2 length] - 1];
  }
  else
  {
    id v5 = @"NONE";
  }

  return v5;
}

__CFString *TIStatisticCandidateSourceAsString(int a1)
{
  if (!a1)
  {
    uint64_t v4 = @"Unknown";
    goto LABEL_24;
  }
  id v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = v2;
  if ((a1 & 0x8000) != 0)
  {
    [v2 addObject:@"PrimaryStatic"];
    if ((a1 & 0x20000) == 0)
    {
LABEL_4:
      if ((a1 & 0x10000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_29;
    }
  }
  else if ((a1 & 0x20000) == 0)
  {
    goto LABEL_4;
  }
  [v3 addObject:@"SecondaryStatic"];
  if ((a1 & 0x10000) == 0)
  {
LABEL_5:
    if ((a1 & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 addObject:@"PrimaryDynamic"];
  if ((a1 & 0x40000) == 0)
  {
LABEL_6:
    if ((a1 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 addObject:@"SecondaryDynamic"];
  if ((a1 & 0x40) == 0)
  {
LABEL_7:
    if ((a1 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 addObject:@"PQT"];
  if ((a1 & 0x400) == 0)
  {
LABEL_8:
    if ((a1 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 addObject:@"Supplemental"];
  if ((a1 & 0x10) == 0)
  {
LABEL_9:
    if ((a1 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 addObject:@"NamedEntity"];
  if ((a1 & 8) == 0)
  {
LABEL_10:
    if ((a1 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 addObject:@"AddressBook"];
  if ((a1 & 4) == 0)
  {
LABEL_11:
    if ((a1 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 addObject:@"TextReplacement"];
  if ((a1 & 0x800) == 0)
  {
LABEL_12:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 addObject:@"AppNames"];
  if ((a1 & 0x2000) == 0)
  {
LABEL_13:
    if ((a1 & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 addObject:@"SmartResponse"];
  if ((a1 & 0x20) == 0)
  {
LABEL_14:
    if ((a1 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 addObject:@"OOV"];
  if ((a1 & 0x80) == 0)
  {
LABEL_15:
    if ((a1 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 addObject:@"Offensive"];
  if ((a1 & 0x100) == 0)
  {
LABEL_16:
    if ((a1 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 addObject:@"Vulgar"];
  if ((a1 & 0x200) == 0)
  {
LABEL_17:
    if ((a1 & 0x4000) == 0) {
      goto LABEL_18;
    }
LABEL_42:
    [v3 addObject:@"Emoji"];
    if ((a1 & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_41:
  [v3 addObject:@"Sensitive"];
  if ((a1 & 0x4000) != 0) {
    goto LABEL_42;
  }
LABEL_18:
  if ((a1 & 0x80000) != 0) {
LABEL_19:
  }
    [v3 addObject:@"InlineCompletion"];
LABEL_20:
  if ((a1 & 0xFFF00003) != 0) {
    [v3 addObject:@"Unexpected"];
  }
  uint64_t v4 = [v3 componentsJoinedByString:@","];

LABEL_24:

  return v4;
}

__CFString *candidateSourceAsString(int a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:11];
  uint64_t v3 = v2;
  if ((a1 & 0x400) != 0) {
    [v2 addObject:@"Supplemental"];
  }
  if ((a1 & 0x28000) != 0) {
    [v3 addObject:@"Static"];
  }
  if ((a1 & 0x40000) != 0)
  {
    [v3 addObject:@"Dynamic"];
    if ((a1 & 4) == 0)
    {
LABEL_7:
      if ((a1 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_7;
  }
  [v3 addObject:@"TextReplc"];
  if ((a1 & 8) == 0)
  {
LABEL_8:
    if ((a1 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 addObject:@"Contact"];
  if ((a1 & 0x10) == 0)
  {
LABEL_9:
    if ((a1 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 addObject:@"NamedEntitity"];
  if ((a1 & 0x20) == 0)
  {
LABEL_10:
    if ((a1 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 addObject:@"OOV"];
  if ((a1 & 0x40) == 0)
  {
LABEL_11:
    if ((a1 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 addObject:@"PQT"];
  if ((a1 & 0x80) == 0)
  {
LABEL_12:
    if ((a1 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 addObject:@"Offensive"];
  if ((a1 & 0x100) == 0)
  {
LABEL_13:
    if ((a1 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_24:
  [v3 addObject:@"Vulgar"];
  if ((a1 & 0x200) != 0) {
LABEL_14:
  }
    [v3 addObject:@"Sensitive"];
LABEL_15:
  if ([v3 count])
  {
    uint64_t v4 = [v3 componentsJoinedByString:@"|"];
  }
  else
  {
    uint64_t v4 = @"None";
  }

  return v4;
}

uint64_t __Block_byref_object_copy__6794(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6795(uint64_t a1)
{
}

id TIFeatureUsageAllowedValues()
{
  v2[12] = *MEMORY[0x1E4F143B8];
  v2[0] = kFeatureUsageStateInsufficientData;
  v2[1] = kFeatureUsageStateUnknown;
  v2[2] = kFeatureUsageStateUnsupported;
  v2[3] = kFeatureUsageStateUnaware;
  v2[4] = kFeatureUsageStateInactive;
  v2[5] = kFeatureUsageStateActiveVeryLow;
  v2[6] = kFeatureUsageStateActiveLow;
  v2[7] = kFeatureUsageStateActiveMedium;
  v2[8] = kFeatureUsageStateActiveHigh;
  v2[9] = kFeatureUsageStateActiveVeryHigh;
  v2[10] = kFeatureUsageStateActiveUnusuallyHigh;
  v2[11] = kFeatureUsageStateRejected;
  dispatch_queue_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:12];

  return v0;
}

uint64_t TIIsRegisterLearningModeRejection(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"rejected"];
}

uint64_t TIIsRegisterLearningModeAcceptance(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"accepted"];
}

uint64_t InputAnalyticsLibraryCore()
{
  if (!InputAnalyticsLibraryCore_frameworkLibrary) {
    InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return InputAnalyticsLibraryCore_frameworkLibrary;
}

uint64_t __InputAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  InputAnalyticsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getIAEventDispatcherClass_block_invoke(uint64_t a1)
{
  InputAnalyticsLibraryCore();
  Class result = objc_getClass("IAEventDispatcher");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAEventDispatcherClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id kace_get_log()
{
  if (kace_get_log_onceToken != -1) {
    dispatch_once(&kace_get_log_onceToken, &__block_literal_global_4_8315);
  }
  dispatch_queue_t v0 = (void *)kace_get_log_log;

  return v0;
}

uint64_t __kace_get_log_block_invoke()
{
  kace_get_log_log = (uint64_t)os_log_create("com.apple.TextInput", "KeyboardSignpostsEphemeral");

  return MEMORY[0x1F41817F8]();
}

id keyboardui_system_get_log()
{
  if (keyboardui_system_get_log_onceToken != -1) {
    dispatch_once(&keyboardui_system_get_log_onceToken, &__block_literal_global_7_8318);
  }
  dispatch_queue_t v0 = (void *)keyboardui_system_get_log_log;

  return v0;
}

uint64_t __keyboardui_system_get_log_block_invoke()
{
  keyboardui_system_get_log_log = (uint64_t)os_log_create("com.apple.TextInput", "KeyboardUISignpostsSystem");

  return MEMORY[0x1F41817F8]();
}

void std::__tree<NSHolder<TIInputContextEntry>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<NSHolder<TIInputContextEntry>>::destroy(*a1);
    std::__tree<NSHolder<TIInputContextEntry>>::destroy(a1[1]);

    operator delete(a1);
  }
}

uint64_t std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>(uint64_t result, void **a2, void **a3)
{
  if (a2 != a3)
  {
    v21[9] = v3;
    v21[10] = v4;
    uint64_t v6 = a2;
    uint64_t v7 = result;
    uint64_t v8 = (void *)(result + 8);
    do
    {
      uint64_t v9 = v6 + 4;
      uint64_t v10 = *(void **)(v7 + 8);
      if (*(void **)v7 == v8)
      {
        uint64_t v12 = v8;
        if (v10) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v11 = v8;
        if (v10)
        {
          do
          {
            uint64_t v12 = v10;
            uint64_t v10 = (void *)v10[1];
          }
          while (v10);
        }
        else
        {
          do
          {
            uint64_t v12 = (void *)v11[2];
            BOOL v15 = *v12 == (void)v11;
            uint64_t v11 = v12;
          }
          while (v15);
        }
        uint64_t v13 = (void *)v12[4];
        id v14 = *v9;
        if (v13) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15)
        {
          if (v14) {
            uint64_t v16 = -1;
          }
          else {
            uint64_t v16 = 0;
          }
          if (v13) {
            Class result = 1;
          }
          else {
            Class result = v16;
          }
          if ((result & 0x80000000) == 0)
          {
LABEL_25:
            Class result = (uint64_t)std::__tree<NSHolder<TIInputContextEntry>>::__find_equal<NSHolder<TIInputContextEntry>>(v7, v21, v6 + 4);
            uint64_t v17 = (uint64_t **)result;
            goto LABEL_26;
          }
        }
        else
        {
          Class result = objc_msgSend(v13, "compare:");
          if ((result & 0x80000000) == 0) {
            goto LABEL_25;
          }
        }
        if (*v8)
        {
LABEL_23:
          v21[0] = (uint64_t)v12;
          uint64_t v17 = (uint64_t **)(v12 + 1);
          goto LABEL_26;
        }
      }
      v21[0] = (uint64_t)v8;
      uint64_t v17 = (uint64_t **)v8;
LABEL_26:
      if (!*v17)
      {
        uint64_t v18 = (uint64_t *)operator new(0x28uLL);
        v18[4] = (uint64_t)*v9;
        Class result = (uint64_t)std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at((uint64_t **)v7, v21[0], v17, v18);
      }
      uint64_t v19 = (void **)v6[1];
      if (v19)
      {
        do
        {
          uint64_t v20 = v19;
          uint64_t v19 = (void **)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          uint64_t v20 = (void **)v6[2];
          BOOL v15 = *v20 == v6;
          uint64_t v6 = v20;
        }
        while (!v15);
      }
      uint64_t v6 = v20;
    }
    while (v20 != a3);
  }
  return result;
}

uint64_t **std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at(uint64_t **result, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v4 = (uint64_t *)**result;
  if (v4)
  {
    *Class result = v4;
    a4 = *a3;
  }
  id v5 = result[1];
  *((unsigned char *)a4 + 24) = a4 == v5;
  if (a4 != v5)
  {
    do
    {
      uint64_t v6 = (uint64_t *)a4[2];
      if (*((unsigned char *)v6 + 24)) {
        break;
      }
      uint64_t v7 = (uint64_t *)v6[2];
      uint64_t v8 = (uint64_t *)*v7;
      if ((uint64_t *)*v7 == v6)
      {
        uint64_t v11 = v7[1];
        if (!v11 || (v12 = *(unsigned __int8 *)(v11 + 24), uint64_t v9 = (unsigned char *)(v11 + 24), v12))
        {
          if ((uint64_t *)*v6 == a4)
          {
            uint64_t v13 = (uint64_t **)a4[2];
          }
          else
          {
            uint64_t v13 = (uint64_t **)v6[1];
            id v14 = *v13;
            v6[1] = (uint64_t)*v13;
            if (v14)
            {
              v14[2] = (uint64_t)v6;
              uint64_t v7 = (uint64_t *)v6[2];
            }
            v13[2] = v7;
            *(void *)(v6[2] + 8 * (*(void *)v6[2] != (void)v6)) = v13;
            void *v13 = v6;
            v6[2] = (uint64_t)v13;
            uint64_t v7 = v13[2];
            uint64_t v6 = (uint64_t *)*v7;
          }
          *((unsigned char *)v13 + 24) = 1;
          *((unsigned char *)v7 + 24) = 0;
          uint64_t v17 = v6[1];
          *uint64_t v7 = v17;
          if (v17) {
            *(void *)(v17 + 16) = v7;
          }
          v6[2] = v7[2];
          *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v6;
          v6[1] = (uint64_t)v7;
          goto LABEL_29;
        }
      }
      else if (!v8 || (v10 = *((unsigned __int8 *)v8 + 24), uint64_t v9 = v8 + 3, v10))
      {
        if ((uint64_t *)*v6 == a4)
        {
          uint64_t v15 = a4[1];
          uint64_t *v6 = v15;
          if (v15)
          {
            *(void *)(v15 + 16) = v6;
            uint64_t v7 = (uint64_t *)v6[2];
          }
          a4[2] = (uint64_t)v7;
          *(void *)(v6[2] + 8 * (*(void *)v6[2] != (void)v6)) = a4;
          a4[1] = (uint64_t)v6;
          v6[2] = (uint64_t)a4;
          uint64_t v7 = (uint64_t *)a4[2];
        }
        else
        {
          a4 = (uint64_t *)a4[2];
        }
        *((unsigned char *)a4 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v6 = (uint64_t *)v7[1];
        uint64_t v16 = *v6;
        v7[1] = *v6;
        if (v16) {
          *(void *)(v16 + 16) = v7;
        }
        v6[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v6;
        uint64_t *v6 = (uint64_t)v7;
LABEL_29:
        v7[2] = (uint64_t)v6;
        break;
      }
      *((unsigned char *)v6 + 24) = 1;
      a4 = v7;
      *((unsigned char *)v7 + 24) = v7 == v5;
      *uint64_t v9 = 1;
    }
    while (v7 != v5);
  }
  result[2] = (uint64_t *)((char *)result[2] + 1);
  return result;
}

void *std::__tree<NSHolder<TIInputContextEntry>>::__find_equal<NSHolder<TIInputContextEntry>>(uint64_t a1, void *a2, void **a3)
{
  id v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    while (1)
    {
      uint64_t v7 = v4;
      uint64_t v8 = *a3;
      uint64_t v9 = v4[4];
      if (*a3) {
        BOOL v10 = v9 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        if (v9) {
          int v11 = -1;
        }
        else {
          int v11 = 0;
        }
        if (v8) {
          int v12 = 1;
        }
        else {
          int v12 = v11;
        }
        if (v12 < 0) {
          goto LABEL_14;
        }
LABEL_17:
        uint64_t v13 = (void *)v7[4];
        id v14 = *a3;
        if (v13) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15)
        {
          if (v14) {
            int v16 = -1;
          }
          else {
            int v16 = 0;
          }
          if (v13) {
            int v17 = 1;
          }
          else {
            int v17 = v16;
          }
          if ((v17 & 0x80000000) == 0) {
            goto LABEL_34;
          }
        }
        else if ((objc_msgSend(v13, "compare:") & 0x80000000) == 0)
        {
          goto LABEL_34;
        }
        id v5 = v7 + 1;
        uint64_t v4 = (void *)v7[1];
        if (!v4) {
          goto LABEL_34;
        }
      }
      else
      {
        if ((objc_msgSend(v8, "compare:") & 0x80000000) == 0) {
          goto LABEL_17;
        }
LABEL_14:
        uint64_t v4 = (void *)*v7;
        id v5 = v7;
        if (!*v7) {
          goto LABEL_34;
        }
      }
    }
  }
  uint64_t v7 = (void *)(a1 + 8);
LABEL_34:
  *a2 = v7;
  return v5;
}

uint64_t std::__tree<NSHolder<TIInputContextEntry>>::__count_unique<NSHolder<TIInputContextEntry>>(void *a1, void **a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    uint64_t v4 = 1;
    do
    {
      id v5 = *a2;
      uint64_t v6 = v3[4];
      if (*a2) {
        BOOL v7 = v6 == 0;
      }
      else {
        BOOL v7 = 1;
      }
      if (v7)
      {
        if (v6) {
          int v8 = -1;
        }
        else {
          int v8 = 0;
        }
        if (v5) {
          int v9 = 1;
        }
        else {
          int v9 = v8;
        }
        if (v9 < 0) {
          goto LABEL_32;
        }
      }
      else if ((objc_msgSend(v5, "compare:") & 0x80000000) != 0)
      {
        goto LABEL_32;
      }
      BOOL v10 = (void *)v3[4];
      int v11 = *a2;
      if (v10) {
        BOOL v12 = v11 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        if (v11) {
          int v13 = -1;
        }
        else {
          int v13 = 0;
        }
        if (v10) {
          int v14 = 1;
        }
        else {
          int v14 = v13;
        }
        if ((v14 & 0x80000000) == 0) {
          return v4;
        }
      }
      else if ((objc_msgSend(v10, "compare:") & 0x80000000) == 0)
      {
        return v4;
      }
      ++v3;
LABEL_32:
      uint64_t v3 = (void *)*v3;
    }
    while (v3);
  }
  return 0;
}

uint64_t **std::__tree<NSHolder<TIInputContextEntry>>::__emplace_unique_key_args<NSHolder<TIInputContextEntry>,NSHolder<TIInputContextEntry>>(uint64_t **a1, void **a2, uint64_t *a3)
{
  Class result = (uint64_t **)std::__tree<NSHolder<TIInputContextEntry>>::__find_equal<NSHolder<TIInputContextEntry>>((uint64_t)a1, &v10, a2);
  if (!*result)
  {
    uint64_t v6 = result;
    BOOL v7 = (uint64_t *)operator new(0x28uLL);
    uint64_t v8 = *a3;
    *a3 = 0;
    void v7[4] = v8;
    uint64_t v9 = v10;
    return std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at(a1, v9, v6, v7);
  }
  return result;
}

void std::__tree<NSHolder<TIInputContextEntry>>::__assign_multi<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v6 = *(uint64_t **)a1;
    uint64_t v7 = *(void *)(a1 + 8);
    *(void *)a1 = a1 + 8;
    *(void *)(v7 + 16) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 8) = 0;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    if (!v8)
    {
      int v16 = 0;
LABEL_23:
      std::__tree<NSHolder<TIInputContextEntry>>::destroy(v16);
      goto LABEL_24;
    }
    uint64_t v9 = std::__tree<NSHolder<TIInputContextEntry>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
    if (a2 != a3)
    {
      uint64_t v10 = a2;
      do
      {
        int v11 = (id *)v8;
        uint64_t v8 = v9;
        objc_storeStrong(v11 + 4, (id)v10[4]);
        leaf_high = (uint64_t **)std::__tree<NSHolder<TIInputContextEntry>>::__find_leaf_high(a1, &v21, v11 + 4);
        std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at((uint64_t **)a1, v21, leaf_high, (uint64_t *)v11);
        if (v9) {
          uint64_t v9 = std::__tree<NSHolder<TIInputContextEntry>>::_DetachedTreeCache::__detach_next((uint64_t)v9);
        }
        else {
          uint64_t v9 = 0;
        }
        int v13 = (void *)v10[1];
        if (v13)
        {
          do
          {
            a2 = v13;
            int v13 = (void *)*v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            a2 = (void *)v10[2];
            BOOL v14 = *a2 == (void)v10;
            uint64_t v10 = a2;
          }
          while (!v14);
        }
        if (!v8) {
          break;
        }
        uint64_t v10 = a2;
      }
      while (a2 != a3);
    }
    std::__tree<NSHolder<TIInputContextEntry>>::destroy(v8);
    if (v9)
    {
      for (uint64_t i = (uint64_t *)v9[2]; i; uint64_t i = (uint64_t *)i[2])
        uint64_t v9 = i;
      int v16 = v9;
      goto LABEL_23;
    }
  }
LABEL_24:
  if (a2 != a3)
  {
    do
    {
      int v17 = operator new(0x28uLL);
      *((void *)v17 + 4) = (id)a2[4];
      uint64_t v18 = (uint64_t **)std::__tree<NSHolder<TIInputContextEntry>>::__find_leaf_high(a1, &v21, (void **)v17 + 4);
      std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at((uint64_t **)a1, v21, v18, (uint64_t *)v17);
      uint64_t v19 = (void *)a2[1];
      if (v19)
      {
        do
        {
          uint64_t v20 = v19;
          uint64_t v19 = (void *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          uint64_t v20 = (void *)a2[2];
          BOOL v14 = *v20 == (void)a2;
          a2 = v20;
        }
        while (!v14);
      }
      a2 = v20;
    }
    while (v20 != a3);
  }
}

void *std::__tree<NSHolder<TIInputContextEntry>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  Class result = *(void **)(a1 + 16);
  if (result)
  {
    uint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      *Class result = 0;
      while (1)
      {
        uint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          Class result = v4;
          uint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; uint64_t v3 = (void *)result[1])
      {
        do
        {
          Class result = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

void *std::__tree<NSHolder<TIInputContextEntry>>::__find_leaf_high(uint64_t a1, void *a2, void **a3)
{
  id v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 8);
  if (!v4)
  {
    Class result = (void *)(a1 + 8);
    goto LABEL_20;
  }
  do
  {
    while (1)
    {
      id v5 = v4;
      uint64_t v7 = *a3;
      uint64_t v8 = v4[4];
      if (!*a3 || v8 == 0) {
        break;
      }
      if ((objc_msgSend(v7, "compare:") & 0x80000000) == 0) {
        goto LABEL_17;
      }
LABEL_14:
      uint64_t v4 = (void *)*v5;
      Class result = v5;
      if (!*v5) {
        goto LABEL_20;
      }
    }
    if (v8) {
      int v10 = -1;
    }
    else {
      int v10 = 0;
    }
    if (v7) {
      int v11 = 1;
    }
    else {
      int v11 = v10;
    }
    if (v11 < 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v4 = (void *)v5[1];
  }
  while (v4);
  Class result = v5 + 1;
LABEL_20:
  *a2 = v5;
  return result;
}

void setFromArray<TIInputContextEntry>(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)a1 = a1 + 8;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(id *)(*((void *)&v10 + 1) + 8 * v7);
        id v8 = v9;
        std::__tree<NSHolder<TIInputContextEntry>>::__emplace_unique_key_args<NSHolder<TIInputContextEntry>,NSHolder<TIInputContextEntry>>((uint64_t **)a1, &v9, (uint64_t *)&v9);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

id arrayFromSet<TIInputContextEntry>(void *a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = (void *)*a1;
  id v3 = a1 + 1;
  uint64_t v4 = v5;
  if (v5 != v3)
  {
    do
    {
      [v2 addObject:v4[4]];
      uint64_t v6 = (void *)v4[1];
      if (v6)
      {
        do
        {
          uint64_t v7 = v6;
          uint64_t v6 = (void *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          uint64_t v7 = (void *)v4[2];
          BOOL v8 = *v7 == (void)v4;
          uint64_t v4 = v7;
        }
        while (!v8);
      }
      uint64_t v4 = v7;
    }
    while (v7 != v3);
  }
  id v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v2];

  return v9;
}

uint64_t __ManagedConfigurationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMCFeatureAutoCorrectionAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCFeatureAutoCorrectionAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureAutoCorrectionAllowedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMCFeatureKeyboardMathSolvingAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCFeatureKeyboardMathSolvingAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureKeyboardMathSolvingAllowedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMCFeatureContinuousPathKeyboardAllowed()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  dispatch_queue_t v0 = (void **)getMCFeatureContinuousPathKeyboardAllowedSymbolLoc_ptr;
  uint64_t v8 = getMCFeatureContinuousPathKeyboardAllowedSymbolLoc_ptr;
  if (!getMCFeatureContinuousPathKeyboardAllowedSymbolLoc_ptr)
  {
    id v1 = (void *)ManagedConfigurationLibrary();
    v6[3] = (uint64_t)dlsym(v1, "MCFeatureContinuousPathKeyboardAllowed");
    getMCFeatureContinuousPathKeyboardAllowedSymbolLoc_ptr = v6[3];
    dispatch_queue_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    id v2 = *v0;
    return v2;
  }
  else
  {
    dlerror();
    uint64_t v4 = abort_report_np();
    return __getMCFeatureContinuousPathKeyboardAllowedSymbolLoc_block_invoke(v4);
  }
}

void *__getMCFeatureContinuousPathKeyboardAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCFeatureContinuousPathKeyboardAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureContinuousPathKeyboardAllowedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMCFeatureSmartPunctuationAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCFeatureSmartPunctuationAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureSmartPunctuationAllowedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMCFeatureSpellCheckAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCFeatureSpellCheckAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureSpellCheckAllowedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMCFeaturePredictiveKeyboardAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCFeaturePredictiveKeyboardAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeaturePredictiveKeyboardAllowedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCloudSettingsManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CloudSettingsLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CloudSettingsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E555A0D8;
    uint64_t v6 = 0;
    CloudSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!CloudSettingsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CloudSettingsManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getCloudSettingsManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNPSManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __NanoPreferencesSyncLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E555A0F0;
    uint64_t v6 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("NPSManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getNPSManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __CloudSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

void NotificationCallback(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __NotificationCallback_block_invoke;
  v6[3] = &unk_1E555A0B8;
  id v7 = v4;
  uint64_t v8 = a3;
  id v5 = v4;
  TIDispatchAsync(MEMORY[0x1E4F14428], v6);
}

void __NotificationCallback_block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  long long v3 = *(_OWORD *)(a1 + 32);
  id v1 = *(void **)(v3 + 8);
  v4[1] = 3221225472;
  v4[2] = __NotificationCallback_block_invoke_2;
  v4[3] = &unk_1E555A090;
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 enumerateKeysAndObjectsUsingBlock:v4];
}

void __NotificationCallback_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  id v9 = v6;
  uint64_t v8 = [v6 notification];
  LODWORD(v7) = [v7 isEqualToString:v8];

  if (v7)
  {
    [*(id *)(a1 + 32) preferencesChangedCallback:v9];
    *a4 = 1;
  }
}

void *__getMCKeyboardSettingsChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCKeyboardSettingsChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMCProfileListChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCProfileListChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCProfileListChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSecTaskCreateFromSelfSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)SecurityLibrary();
  uint64_t result = dlsym(v2, "SecTaskCreateFromSelf");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSecTaskCreateFromSelfSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSecTaskCopySigningIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)SecurityLibrary();
  uint64_t result = dlsym(v2, "SecTaskCopySigningIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSecTaskCopySigningIdentifierSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SecurityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SecurityLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __IntlPreferencesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntlPreferencesLibraryCore_frameworkLibrary = result;
  return result;
}

void ___preferencesClientDispatchQueue_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TextInput.preferences-client", v2);
  id v1 = (void *)_preferencesClientDispatchQueue___xpc_queue;
  _preferencesClientDispatchQueue___xpc_queue = (uint64_t)v0;
}

uint64_t isH13ANEPresentOnIOS()
{
  if (isH13ANEPresentOnIOS_onceToken != -1) {
    dispatch_once(&isH13ANEPresentOnIOS_onceToken, &__block_literal_global_792);
  }
  return isH13ANEPresentOnIOS_hasH13ANE;
}

uint64_t __isH13ANEPresentOnIOS_block_invoke()
{
  uint64_t result = MGIsQuestionValid();
  if (result)
  {
    uint64_t result = MGGetSInt64Answer();
    isH13ANEPresentOnIOS_hasH13ANE = result > 31;
  }
  return result;
}

void __TIGetUseTestFilesForAssetDownloadingTestingValue_block_invoke()
{
  id v0 = +[TIPreferencesController sharedPreferencesController];
  [v0 _configureKey:@"UseTestFilesForAssetDownloadingTesting" domain:@"com.apple.keyboard" defaultValue:MEMORY[0x1E4F1CC28]];
}

BOOL TIStatisticShouldSample(uint32_t a1)
{
  return arc4random_uniform(0x64u) < a1;
}

void routeCounterChangeThroughCoreAnalytics(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [v3 counterName];

  if (v4)
  {
    long long v5 = [v3 inputMode];

    id v6 = IXADefaultLogFacility();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
      {
        long long v11 = NSString;
        id v12 = [v3 counterName];
        long long v13 = objc_msgSend(v11, "stringWithFormat:", @"%s TIStatistic Counter: %s=%lld", "routeCounterChangeThroughCoreAnalytics", objc_msgSend(v12, "UTF8String"), a2);
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v13;
        _os_log_debug_impl(&dword_18D240000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      uint64_t v8 = +[TIStatisticChangeCache sharedInstance];
      id v9 = [v3 counterName];
      long long v10 = [v3 inputMode];
      [v8 addValue:a2 toStatisticWithName:v9 andInputMode:v10];
    }
    else
    {
      if (v7)
      {
        BOOL v14 = NSString;
        id v15 = [v3 counterName];
        int v16 = objc_msgSend(v14, "stringWithFormat:", @"%s TIStatistic Adhoc: %s=%lld", "routeCounterChangeThroughCoreAnalytics", objc_msgSend(v15, "UTF8String"), a2);
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v16;
        _os_log_debug_impl(&dword_18D240000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      uint64_t v8 = +[TIAdhocEventDispatcher sharedInstance];
      id v9 = [v3 counterName];
      [v8 dispatchEventForStatisticWithName:v9 andValue:a2];
    }
  }
}

void TIStatisticScalarSetValue(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    long long v5 = [v3 aggdName];

    if (v5)
    {
      id v6 = IXADefaultLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v9 = NSString;
        id v10 = [v4 aggdName];
        long long v11 = objc_msgSend(v9, "stringWithFormat:", @"%s TIStatistic Aggd: %s=%lld", "TIStatisticScalarSetValue", objc_msgSend(v10, "UTF8String"), a2);
        *(_DWORD *)buf = 138412290;
        long long v13 = v11;
        _os_log_debug_impl(&dword_18D240000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      BOOL v7 = +[TIAggdReporter sharedAggdReporter];
      uint64_t v8 = [v4 aggdName];
      [v7 setValue:a2 forScalarKey:v8];
    }
  }
}

void TIStatisticScalarAddValue(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    long long v5 = [v3 aggdName];

    if (v5)
    {
      id v6 = IXADefaultLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v9 = NSString;
        id v10 = [v4 aggdName];
        long long v11 = objc_msgSend(v9, "stringWithFormat:", @"%s TIStatistic Aggd: %s=%lld", "TIStatisticScalarAddValue", objc_msgSend(v10, "UTF8String"), a2);
        *(_DWORD *)buf = 138412290;
        long long v13 = v11;
        _os_log_debug_impl(&dword_18D240000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      BOOL v7 = +[TIAggdReporter sharedAggdReporter];
      uint64_t v8 = [v4 aggdName];
      [v7 addValue:a2 forKey:v8];
    }
    routeCounterChangeThroughCoreAnalytics(v4, a2);
  }
}

void TIStatisticScalarSubtractValue(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    long long v5 = [v3 aggdName];

    if (v5)
    {
      id v6 = IXADefaultLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v9 = NSString;
        id v10 = [v4 aggdName];
        long long v11 = objc_msgSend(v9, "stringWithFormat:", @"%s TIStatistic Aggd: %s=%lld", "TIStatisticScalarSubtractValue", objc_msgSend(v10, "UTF8String"), a2);
        *(_DWORD *)buf = 138412290;
        long long v13 = v11;
        _os_log_debug_impl(&dword_18D240000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      BOOL v7 = +[TIAggdReporter sharedAggdReporter];
      uint64_t v8 = [v4 aggdName];
      [v7 subtractValue:a2 forKey:v8];
    }
    routeCounterChangeThroughCoreAnalytics(v4, -a2);
  }
}

void TIStatisticScalarIncrement(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = [v1 aggdName];

    if (v3)
    {
      id v4 = IXADefaultLogFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        BOOL v7 = NSString;
        id v8 = [v2 aggdName];
        id v9 = objc_msgSend(v7, "stringWithFormat:", @"%s TIStatistic Aggd: %s", "TIStatisticScalarIncrement", objc_msgSend(v8, "UTF8String"));
        *(_DWORD *)buf = 138412290;
        long long v11 = v9;
        _os_log_debug_impl(&dword_18D240000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      long long v5 = +[TIAggdReporter sharedAggdReporter];
      id v6 = [v2 aggdName];
      [v5 incrementKey:v6];
    }
    routeCounterChangeThroughCoreAnalytics(v2, 1);
  }
}

void TIStatisticScalarDecrement(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = [v1 aggdName];

    if (v3)
    {
      id v4 = IXADefaultLogFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        BOOL v7 = NSString;
        id v8 = [v2 aggdName];
        id v9 = objc_msgSend(v7, "stringWithFormat:", @"%s TIStatistic Aggd: %s", "TIStatisticScalarDecrement", objc_msgSend(v8, "UTF8String"));
        *(_DWORD *)buf = 138412290;
        long long v11 = v9;
        _os_log_debug_impl(&dword_18D240000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      long long v5 = +[TIAggdReporter sharedAggdReporter];
      id v6 = [v2 aggdName];
      [v5 decrementKey:v6];
    }
    routeCounterChangeThroughCoreAnalytics(v2, -1);
  }
}

void TIStatisticScalarSetBoolean(void *a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    long long v5 = [v3 aggdName];

    if (v5)
    {
      id v6 = IXADefaultLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        BOOL v7 = NSString;
        id v8 = [v4 aggdName];
        uint64_t v9 = [v8 UTF8String];
        id v10 = "no";
        if (a2) {
          id v10 = "yes";
        }
        long long v11 = objc_msgSend(v7, "stringWithFormat:", @"%s TIStatistic Aggd: %s=%s", "TIStatisticScalarSetBoolean", v9, v10);
        *(_DWORD *)buf = 138412290;
        long long v13 = v11;
        _os_log_debug_impl(&dword_18D240000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      TIStatisticScalarSetValue(v4, a2);
    }
  }
}

void TIStatisticDistributionPushValue(void *a1, double a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    long long v5 = [v3 aggdName];

    if (v5)
    {
      id v6 = IXADefaultLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = NSString;
        id v10 = [v4 aggdName];
        long long v11 = objc_msgSend(v9, "stringWithFormat:", @"%s TIStatistic Aggd: %s=%f", "TIStatisticDistributionPushValue", objc_msgSend(v10, "UTF8String"), *(void *)&a2);
        *(_DWORD *)buf = 138412290;
        long long v13 = v11;
        _os_log_debug_impl(&dword_18D240000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      BOOL v7 = +[TIAggdReporter sharedAggdReporter];
      id v8 = [v4 aggdName];
      [v7 pushValue:v8 forKey:a2];
    }
  }
}

id TIStatisticGetKey(void *a1)
{
  id v1 = a1;
  id v2 = _GetPrefixForDomain();
  id v3 = [v2 stringByAppendingFormat:@".%@", v1];

  id v4 = +[TIStatisticKey statisticKeyWithAggdName:v3 andCounterName:v1 andInputMode:0];

  return v4;
}

__CFString *_GetPrefixForDomain()
{
  if (_GetPlatformAddition_onceToken != -1) {
    dispatch_once(&_GetPlatformAddition_onceToken, &__block_literal_global_61);
  }
  return @"com.apple.keyboard";
}

id TIStatisticGetKeyForInputMode(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  long long v5 = TISGetSafeInputModeIdentifier(v4);
  if ([v5 length])
  {
    id v6 = _GetPrefixForDomain();
    BOOL v7 = [v6 stringByAppendingFormat:@".%@.%@", v3, v5];

    id v8 = +[TIStatisticKey statisticKeyWithAggdName:v7 andCounterName:v3 andInputMode:v4];
  }
  else
  {
    id v8 = TIStatisticGetKey(v3);
  }

  return v8;
}

__CFString *TISGetSafeInputModeIdentifier(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = (void *)TISGetSafeInputModeIdentifier___identifierToSafeIdentifier;
    if (!TISGetSafeInputModeIdentifier___identifierToSafeIdentifier)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v4 = (void *)TISGetSafeInputModeIdentifier___identifierToSafeIdentifier;
      TISGetSafeInputModeIdentifier___identifierToSafeIdentifier = (uint64_t)v3;

      id v2 = (void *)TISGetSafeInputModeIdentifier___identifierToSafeIdentifier;
    }
    long long v5 = [v2 objectForKey:v1];
    if (v5) {
      goto LABEL_13;
    }
    id v6 = TIInputModeGetLanguageWithRegion(v1);
    BOOL v7 = _GetStringByReplacingInvalidCharactersWithUnderscores(v6);

    id v8 = TIInputModeGetComponentsFromIdentifier(v1);
    uint64_t v9 = [v8 objectForKey:@"sw"];
    id v10 = _GetStringByReplacingInvalidCharactersWithUnderscores(v9);

    long long v11 = [v8 objectForKey:@"hw"];
    uint64_t v12 = _GetStringByReplacingInvalidCharactersWithUnderscores(v11);

    if (![v7 length]) {
      goto LABEL_11;
    }
    if ([v10 length])
    {
      if (![v12 length])
      {
        id v13 = v10;

        uint64_t v12 = v13;
      }
      long long v5 = [v7 stringByAppendingFormat:@".%@.%@", v10, v12];
      [(id)TISGetSafeInputModeIdentifier___identifierToSafeIdentifier setObject:v5 forKey:v1];
      int v14 = 1;
    }
    else
    {
LABEL_11:
      long long v5 = 0;
      int v14 = 0;
    }

    if (v14)
    {
LABEL_13:
      long long v5 = v5;
      id v15 = v5;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = &stru_1EDBDCE38;
  }

  return v15;
}

id _GetStringByReplacingInvalidCharactersWithUnderscores(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    id v2 = (void *)_GetInvalidInputModeIdentifierCharacterSet___invalidCharacterSet;
    if (!_GetInvalidInputModeIdentifierCharacterSet___invalidCharacterSet)
    {
      id v3 = [MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@"_"];
      objc_msgSend(v3, "addCharactersInRange:", 97, 26);
      objc_msgSend(v3, "addCharactersInRange:", 65, 26);
      objc_msgSend(v3, "addCharactersInRange:", 48, 10);
      [v3 invert];
      id v4 = (void *)_GetInvalidInputModeIdentifierCharacterSet___invalidCharacterSet;
      _GetInvalidInputModeIdentifierCharacterSet___invalidCharacterSet = (uint64_t)v3;

      id v2 = (void *)_GetInvalidInputModeIdentifierCharacterSet___invalidCharacterSet;
    }
    id v5 = v2;
    if ([v1 rangeOfCharacterFromSet:v5] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = v1;
    }
    else
    {
      id v6 = [v1 _stringByReplacingCharactersInSet:v5 withCharacter:95];
    }
    id v7 = v6;
  }
  else
  {
    id v7 = v1;
  }

  return v7;
}

id TIStatisticGetAutocorrectionKeyForInputMode(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = [v5 stringWithFormat:@"%@.%@", a2, a1];
  id v8 = TIStatisticGetKeyForInputMode(v7, v6);

  return v8;
}

id TIStatisticGetKeyForInputStringCount(uint64_t a1, void *a2)
{
  id v3 = NSString;
  id v4 = a2;
  id v5 = [v3 stringWithFormat:@"%@.%@.%@", @"com.apple.inputStringCount", v4, a1];
  id v6 = +[TIStatisticKey statisticKeyWithAggdName:v5 andCounterName:0 andInputMode:v4];

  return v6;
}

BOOL _activeInputStringCountKey()
{
  if (_activeInputStringCountKey_onceToken != -1) {
    dispatch_once(&_activeInputStringCountKey_onceToken, &__block_literal_global_9600);
  }
  unsigned int v0 = _activeInputStringCountKey__logIterationLimit;
  return arc4random() % _activeInputStringCountKey__logIterationLimit == v0 >> 1;
}

void ___activeInputStringCountKey_block_invoke()
{
  id v0 = (id)CFPreferencesCopyValue(@"kbInputStringCount", @"com.apple.da", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if ([v0 unsignedIntValue]) {
    _activeInputStringCountKey__logIterationLimit = [v0 unsignedIntValue];
  }
}

void TIStatisticScalarIncrementInputStringCount(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  if (_activeInputStringCountKey())
  {
    id v4 = TIStatisticGetKeyForInputStringCount((uint64_t)v5, v3);
    TIStatisticScalarIncrement(v4);
  }
}

void TIStatisticScalarIncrementAutocorrectionKey(void *a1, int a2, void *a3)
{
  id v22 = a1;
  id v5 = a3;
  if (a2)
  {
    id v7 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection", v5);
    TIStatisticScalarIncrement(v7);

    if ((a2 & 2) == 0)
    {
LABEL_3:
      if ((a2 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((a2 & 2) == 0)
  {
    goto LABEL_3;
  }
  id v8 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.capitalization", v5);
  TIStatisticScalarIncrement(v8);

  if ((a2 & 4) == 0)
  {
LABEL_4:
    if ((a2 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v9 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.diacritic", v5);
  TIStatisticScalarIncrement(v9);

  if ((a2 & 8) == 0)
  {
LABEL_5:
    if ((a2 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  id v10 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.prediction", v5);
  TIStatisticScalarIncrement(v10);

  if ((a2 & 0x10) == 0)
  {
LABEL_6:
    if ((a2 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  long long v11 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.spacebar", v5);
  TIStatisticScalarIncrement(v11);

  if ((a2 & 0x20) == 0)
  {
LABEL_7:
    if ((a2 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v12 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.retro", v5);
  TIStatisticScalarIncrement(v12);

  if ((a2 & 0x40) == 0)
  {
LABEL_8:
    if ((a2 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  id v13 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.useradapted", v5);
  TIStatisticScalarIncrement(v13);

  if ((a2 & 0x100) == 0)
  {
LABEL_9:
    if ((a2 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  int v14 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.userrecency", v5);
  TIStatisticScalarIncrement(v14);

  if ((a2 & 0x200) == 0)
  {
LABEL_10:
    if ((a2 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  id v15 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.userlearned", v5);
  TIStatisticScalarIncrement(v15);

  if ((a2 & 0x80) == 0)
  {
LABEL_11:
    if ((a2 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  int v16 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.multiwordprediction", v5);
  TIStatisticScalarIncrement(v16);

  if ((a2 & 0x400) == 0)
  {
LABEL_12:
    if ((a2 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  int v17 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.transposition", v5);
  TIStatisticScalarIncrement(v17);

  if ((a2 & 0x800) == 0)
  {
LABEL_13:
    if ((a2 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v18 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.insertKey", v5);
  TIStatisticScalarIncrement(v18);

  if ((a2 & 0x1000) == 0)
  {
LABEL_14:
    if ((a2 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v19 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.skipTouch", v5);
  TIStatisticScalarIncrement(v19);

  if ((a2 & 0x4000) == 0)
  {
LABEL_15:
    if ((a2 & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v20 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.nearTouch", v5);
  TIStatisticScalarIncrement(v20);

  if ((a2 & 0x8000) == 0)
  {
LABEL_16:
    if ((a2 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  uint64_t v21 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.substitution", v5);
  TIStatisticScalarIncrement(v21);

  if ((a2 & 0x10000) != 0)
  {
LABEL_17:
    id v6 = TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, @"autocorrection.hitTest", v5);
    TIStatisticScalarIncrement(v6);
  }
LABEL_18:
}

id TIStatisticGetKeyForCandidateAccepted(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = TISGetSafeInputModeIdentifier(v7);
  if ([v8 length])
  {
    uint64_t v9 = [v6 length];
    id v10 = _GetPrefixForDomain();
    long long v11 = v10;
    if (v9) {
      [v10 stringByAppendingFormat:@".%@.%@.%@", v5, v8, v6];
    }
    else {
    id v13 = [v10 stringByAppendingFormat:@".%@.%@", v5, v8, v15];
    }

    uint64_t v12 = +[TIStatisticKey statisticKeyWithAggdName:v13 andCounterName:v5 andInputMode:v7];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id TIStatisticGetKeyForCandidateAcceptedSelectedSortingMethod(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = TISGetSafeInputModeIdentifier(v6);
  if ([v7 length])
  {
    id v8 = _GetPrefixForDomain();
    uint64_t v9 = [v8 stringByAppendingFormat:@".%@.%lu.%@.%@", @"candidateAccepted.sortingMethod", a1, v7, v5];

    id v10 = +[TIStatisticKey statisticKeyWithAggdName:v9 andCounterName:0 andInputMode:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id TIStatisticGetKeyForTenKeyKeyTappedInKeyplane(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = TISGetSafeInputModeIdentifier(v4);
  if ([v5 length] && objc_msgSend(v3, "length"))
  {
    id v6 = _GetPrefixForDomain();
    id v7 = [v6 stringByAppendingFormat:@".%@.%@.%@", @"tenKey.keyTappedInKeyplane", v3, v5];

    id v8 = +[TIStatisticKey statisticKeyWithAggdName:v7 andCounterName:0 andInputMode:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id TIStatisticGetKeyForTenKeyFlick(void *a1)
{
  id v1 = a1;
  id v2 = TISGetSafeInputModeIdentifier(v1);
  if ([v2 length])
  {
    id v3 = _GetPrefixForDomain();
    id v4 = [v3 stringByAppendingFormat:@".%@.%@", @"tenKey.keyFlick", v2];

    id v5 = +[TIStatisticKey statisticKeyWithAggdName:v4 andCounterName:@"tenKey.keyFlick" andInputMode:v1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id TIStatisticGetKeyForTenKeyFlickPunctuation(void *a1)
{
  id v1 = a1;
  id v2 = TISGetSafeInputModeIdentifier(v1);
  if ([v2 length])
  {
    id v3 = _GetPrefixForDomain();
    id v4 = [v3 stringByAppendingFormat:@".%@.%@", @"tenKey.keyFlickPunctuation", v2];

    id v5 = +[TIStatisticKey statisticKeyWithAggdName:v4 andCounterName:@"tenKey.keyFlickPunctuation" andInputMode:v1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id TIStatisticGetKeyForMultilingual(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a1;
  id v3 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v9)
        {
          id v10 = v9;
          long long v11 = (void *)_GetSafeString___identifierToSafeIdentifier;
          if (!_GetSafeString___identifierToSafeIdentifier)
          {
            id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v13 = (void *)_GetSafeString___identifierToSafeIdentifier;
            _GetSafeString___identifierToSafeIdentifier = (uint64_t)v12;

            long long v11 = (void *)_GetSafeString___identifierToSafeIdentifier;
          }
          int v14 = [v11 objectForKey:v10];
          if (!v14)
          {
            int v14 = _GetStringByReplacingInvalidCharactersWithUnderscores(v10);
            [(id)_GetSafeString___identifierToSafeIdentifier setObject:v14 forKey:v10];
          }

          if (v6)
          {
            uint64_t v15 = [v6 stringByAppendingFormat:@"+%@", v14];

            id v6 = (void *)v15;
          }
          else
          {
            id v6 = [NSString stringWithString:v14];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  int v16 = _GetPrefixForDomain();
  int v17 = [v16 stringByAppendingFormat:@".%@.%@", v20, v6];

  uint64_t v18 = +[TIStatisticKey statisticKeyWithAggdName:v17 andCounterName:0 andInputMode:0];

  return v18;
}

void TIStatisticScalarIncrementSystemKeyboardSummoned(void *a1)
{
  TIStatisticGetKeyForInputMode(@"summonedSystemKeyboard", a1);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v1);
}

void TIStatisticScalarIncrement3PKSummoned(void *a1)
{
  id v3 = a1;
  if ([v3 length])
  {
    id v1 = [NSString stringWithFormat:@"%@.%@", @"3PK.summonedKeyboard", v3];
    id v2 = TIStatisticGetKey(v1);
    TIStatisticScalarIncrement(v2);
  }
}

id TIStatisticGetKeyForOTA(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = v5;
  uint64_t v9 = v8;
  if ([v6 length])
  {
    id v10 = _GetStringByReplacingInvalidCharactersWithUnderscores(v6);
    uint64_t v9 = [v8 stringByAppendingFormat:@".%@", v10];
  }
  if ([v7 length])
  {
    long long v11 = _GetStringByReplacingInvalidCharactersWithUnderscores(v7);
    uint64_t v12 = [v9 stringByAppendingFormat:@".%@", v11];

    uint64_t v9 = (void *)v12;
  }
  id v13 = _GetPrefixForDomain();
  int v14 = [v13 stringByAppendingFormat:@".%@", v9];

  uint64_t v15 = +[TIStatisticKey statisticKeyWithAggdName:v14 andCounterName:0 andInputMode:0];

  return v15;
}

id TIStatisticsGetKeyForGesture(uint64_t a1, uint64_t a2)
{
  id v2 = [NSString stringWithFormat:@"%@.%@", a1, a2];
  id v3 = TIStatisticGetKey(v2);

  return v3;
}

uint64_t TIStatisticsGetIsCPDiscovered()
{
  id v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  uint64_t v1 = [v0 BOOLForKey:@"CPDidDiscover"];

  return v1;
}

uint64_t __Block_byref_object_copy__11126(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11127(uint64_t a1)
{
}

id _getPreSmartSet()
{
  if (_getPreSmartSet_onceToken != -1) {
    dispatch_once(&_getPreSmartSet_onceToken, &__block_literal_global_32);
  }
  id v0 = (void *)_getPreSmartSet__preSmartSet;

  return v0;
}

id _getPostSmartSet()
{
  if (_getPostSmartSet_onceToken != -1) {
    dispatch_once(&_getPostSmartSet_onceToken, &__block_literal_global_38);
  }
  id v0 = (void *)_getPostSmartSet__postSmartSet;

  return v0;
}

void __TIGetFlexibleSmartWhitespaceEnabledValue_block_invoke()
{
  id v0 = +[TIPreferencesController sharedPreferencesController];
  [v0 _configureKey:@"FlexibleSmartWhitespaceEnabled" domain:@"com.apple.keyboard" defaultValue:MEMORY[0x1E4F1CC38]];
}

void ___getPostSmartSet_block_invoke()
{
  id v0 = [MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@"].,:?'!\"%*-/}>"]);;
  uint64_t v1 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  [v0 formUnionWithCharacterSet:v1];

  objc_msgSend(v0, "addCharactersInRange:", 162, 1);
  objc_msgSend(v0, "addCharactersInRange:", 170, 2);
  objc_msgSend(v0, "addCharactersInRange:", 173, 2);
  objc_msgSend(v0, "addCharactersInRange:", 176, 1);
  objc_msgSend(v0, "addCharactersInRange:", 178, 3);
  objc_msgSend(v0, "addCharactersInRange:", 185, 3);
  objc_msgSend(v0, "addCharactersInRange:", 8208, 6);
  objc_msgSend(v0, "addCharactersInRange:", 8216, 2);
  objc_msgSend(v0, "addCharactersInRange:", 8220, 2);
  objc_msgSend(v0, "addCharactersInRange:", 8224, 2);
  objc_msgSend(v0, "addCharactersInRange:", 8228, 4);
  objc_msgSend(v0, "addCharactersInRange:", 8240, 5);
  objc_msgSend(v0, "addCharactersInRange:", 8250, 4);
  objc_msgSend(v0, "addCharactersInRange:", 8262, 4);
  objc_msgSend(v0, "addCharactersInRange:", 8240, 5);
  objc_msgSend(v0, "addCharactersInRange:", 8304, 37);
  objc_msgSend(v0, "addCharactersInRange:", 4352, 256);
  objc_msgSend(v0, "addCharactersInRange:", 11904, 352);
  objc_msgSend(v0, "addCharactersInRange:", 12272, 464);
  objc_msgSend(v0, "addCharactersInRange:", 12800, 29392);
  objc_msgSend(v0, "addCharactersInRange:", 44032, 11183);
  objc_msgSend(v0, "addCharactersInRange:", 63744, 352);
  objc_msgSend(v0, "addCharactersInRange:", 65072, 32);
  objc_msgSend(v0, "addCharactersInRange:", 65280, 240);
  objc_msgSend(v0, "addCharactersInRange:", 0x20000, 42711);
  objc_msgSend(v0, "addCharactersInRange:", 194560, 542);
  id v2 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v0 formUnionWithCharacterSet:v2];

  id v3 = (void *)_getPostSmartSet__postSmartSet;
  _getPostSmartSet__postSmartSet = (uint64_t)v0;
}

void ___getPreSmartSet_block_invoke()
{
  id v0 = ;
  uint64_t v1 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  [v0 formUnionWithCharacterSet:v1];

  objc_msgSend(v0, "addCharactersInRange:", 161, 1);
  objc_msgSend(v0, "addCharactersInRange:", 163, 3);
  objc_msgSend(v0, "addCharactersInRange:", 167, 1);
  objc_msgSend(v0, "addCharactersInRange:", 169, 1);
  objc_msgSend(v0, "addCharactersInRange:", 171, 4);
  objc_msgSend(v0, "addCharactersInRange:", 177, 1);
  objc_msgSend(v0, "addCharactersInRange:", 182, 1);
  objc_msgSend(v0, "addCharactersInRange:", 187, 1);
  objc_msgSend(v0, "addCharactersInRange:", 191, 1);
  objc_msgSend(v0, "addCharactersInRange:", 8208, 6);
  objc_msgSend(v0, "addCharactersInRange:", 8216, 8);
  objc_msgSend(v0, "addCharactersInRange:", 8226, 6);
  objc_msgSend(v0, "addCharactersInRange:", 8249, 1);
  objc_msgSend(v0, "addCharactersInRange:", 8259, 3);
  objc_msgSend(v0, "addCharactersInRange:", 8352, 22);
  objc_msgSend(v0, "addCharactersInRange:", 4352, 256);
  objc_msgSend(v0, "addCharactersInRange:", 11904, 352);
  objc_msgSend(v0, "addCharactersInRange:", 12272, 464);
  objc_msgSend(v0, "addCharactersInRange:", 12800, 29392);
  objc_msgSend(v0, "addCharactersInRange:", 44032, 11183);
  objc_msgSend(v0, "addCharactersInRange:", 63744, 352);
  objc_msgSend(v0, "addCharactersInRange:", 65072, 32);
  objc_msgSend(v0, "addCharactersInRange:", 65280, 240);
  objc_msgSend(v0, "addCharactersInRange:", 0x20000, 42711);
  objc_msgSend(v0, "addCharactersInRange:", 194560, 542);
  id v2 = (void *)_getPreSmartSet__preSmartSet;
  _getPreSmartSet__preSmartSet = (uint64_t)v0;
}

uint64_t ___getRegularWhiteSet_block_invoke()
{
  _getRegularWhiteSet__regularWhiteSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" "];

  return MEMORY[0x1F41817F8]();
}

uint64_t InputAnalyticsLibraryCore_12127()
{
  if (!InputAnalyticsLibraryCore_frameworkLibrary_12131) {
    InputAnalyticsLibraryCore_frameworkLibrary_12131 = _sl_dlopen();
  }
  return InputAnalyticsLibraryCore_frameworkLibrary_12131;
}

Class __getIAUtilityClass_block_invoke(uint64_t a1)
{
  InputAnalyticsLibraryCore_12127();
  Class result = objc_getClass("IAUtility");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAUtilityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __InputAnalyticsLibraryCore_block_invoke_12132()
{
  uint64_t result = _sl_dlopen();
  InputAnalyticsLibraryCore_frameworkLibrary_12131 = result;
  return result;
}

id TIImageCacheOSLogFacility()
{
  if (TIImageCacheOSLogFacility_onceToken != -1) {
    dispatch_once(&TIImageCacheOSLogFacility_onceToken, &__block_literal_global_12378);
  }
  id v0 = (void *)TIImageCacheOSLogFacility_logFacility;

  return v0;
}

char *TIImageNameForItem(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (char *)malloc_type_malloc(0x32uLL, 0x3CA87F9uLL);
  if (v5) {
    id v5 = (char *)objc_msgSend([NSString alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, snprintf(v5, 0x32uLL, "%lu%lu", objc_msgSend(v4, "hash"), objc_msgSend(v3, "hash")), 1, 1);
  }

  return v5;
}

uint64_t __TIImageCacheOSLogFacility_block_invoke()
{
  TIImageCacheOSLogFacility_logFacility = (uint64_t)os_log_create("com.apple.TextInput", "KBDTIImageCache");

  return MEMORY[0x1F41817F8]();
}

void release_munmap(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  id v5 = (void *)(a2 - v4);
  size_t v6 = v4 + a3;
  munlock((const void *)(a2 - v4), v4 + a3);
  munmap(v5, v6);

  free(a1);
}

id TIImageCachePath()
{
  id v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", CPSharedResourcesDirectory(), @"Library", @"Caches", @"com.apple.keyboards", 0);
  uint64_t v1 = [NSString pathWithComponents:v0];

  return v1;
}

id TIImageCacheImagesPath()
{
  id v0 = TIImageCachePath();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"images"];

  return v1;
}

BOOL CheckSandboxAccess(void *a1)
{
  id v1 = a1;
  if (is_kbd_onceToken != -1) {
    dispatch_once(&is_kbd_onceToken, &__block_literal_global_226);
  }
  if (is_kbd__result)
  {
    BOOL v2 = 1;
  }
  else
  {
    getpid();
    [v1 fileSystemRepresentation];
    BOOL v2 = sandbox_check() == 0;
  }

  return v2;
}

void __TIImageCacheVersion_block_invoke()
{
  id v0 = (void *)MGCopyAnswerWithError();
  TIImageCacheVersion_buildVersion = [v0 hash];
}

void __is_kbd_block_invoke()
{
  SecurityLibrary_12421();
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v0 = (uint64_t (*)(void))getSecTaskCreateFromSelfSymbolLoc_ptr_12422;
  id v10 = getSecTaskCreateFromSelfSymbolLoc_ptr_12422;
  if (!getSecTaskCreateFromSelfSymbolLoc_ptr_12422)
  {
    id v1 = (void *)SecurityLibrary_12421();
    v8[3] = (uint64_t)dlsym(v1, "SecTaskCreateFromSelf");
    getSecTaskCreateFromSelfSymbolLoc_ptr_12422 = (_UNKNOWN *)v8[3];
    id v0 = (uint64_t (*)(void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v0) {
    goto LABEL_12;
  }
  uint64_t v2 = v0(0);
  if (!v2) {
    return;
  }
  id v3 = (const void *)v2;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(const void *, void))getSecTaskCopySigningIdentifierSymbolLoc_ptr_12426;
  id v10 = getSecTaskCopySigningIdentifierSymbolLoc_ptr_12426;
  if (!getSecTaskCopySigningIdentifierSymbolLoc_ptr_12426)
  {
    id v5 = (void *)SecurityLibrary_12421();
    v8[3] = (uint64_t)dlsym(v5, "SecTaskCopySigningIdentifier");
    getSecTaskCopySigningIdentifierSymbolLoc_ptr_12426 = (_UNKNOWN *)v8[3];
    uint64_t v4 = (uint64_t (*)(const void *, void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
LABEL_12:
    dlerror();
    abort_report_np();
    SecurityLibrary_12421();
    return;
  }
  size_t v6 = (void *)v4(v3, 0);
  if (v6) {
    is_kbd__uint64_t result = [@"com.apple.kbd" isEqualToString:v6];
  }
  CFRelease(v3);
}

uint64_t SecurityLibrary_12421()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SecurityLibraryCore_frameworkLibrary_12432)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __SecurityLibraryCore_block_invoke_12433;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E555A4E8;
    uint64_t v5 = 0;
    SecurityLibraryCore_frameworkLibrary_12432 = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = SecurityLibraryCore_frameworkLibrary_12432;
    if (SecurityLibraryCore_frameworkLibrary_12432)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return SecurityLibraryCore_frameworkLibrary_12432;
}

void *__getSecTaskCreateFromSelfSymbolLoc_block_invoke_12423(uint64_t a1)
{
  uint64_t v2 = (void *)SecurityLibrary_12421();
  uint64_t result = dlsym(v2, "SecTaskCreateFromSelf");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSecTaskCreateFromSelfSymbolLoc_ptr_12422 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSecTaskCopySigningIdentifierSymbolLoc_block_invoke_12427(uint64_t a1)
{
  uint64_t v2 = (void *)SecurityLibrary_12421();
  uint64_t result = dlsym(v2, "SecTaskCopySigningIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSecTaskCopySigningIdentifierSymbolLoc_ptr_12426 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SecurityLibraryCore_block_invoke_12433()
{
  uint64_t result = _sl_dlopen();
  SecurityLibraryCore_frameworkLibrary_12432 = result;
  return result;
}

uint64_t TIImageCacheVersion()
{
  if (TIImageCacheVersion_onceToken != -1) {
    dispatch_once(&TIImageCacheVersion_onceToken, &__block_literal_global_22_12415);
  }
  return TIImageCacheVersion_buildVersion;
}

unint64_t TIImageCacheSizeForItem(double a1, double a2, double a3)
{
  return CGBitmapGetAlignedBytesPerRow() * vcvtpd_u64_f64(a2 * a3);
}

uint64_t __Block_byref_object_copy__12623(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12624(uint64_t a1)
{
}

id adhocEventConfig()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  long long v4 = @"thirdPartyKeyboards";
  v3[0] = @"summonedSystemKeyboard";
  v3[1] = @"3PK.summonedKeyboard";
  v3[2] = @"3PK.switchedToFromSystem";
  v3[3] = @"3PK.switchedBackToSystem";
  v3[4] = @"3PK.crashed";
  void v3[5] = @"3PK.primaryLanguageChanged";
  void v3[6] = @"3PK.installedOnDevice";
  v3[7] = @"3PK.enabledOnDevice";
  v3[8] = @"3PK.asciiCapableOnDevice";
  v3[9] = @"3PK.requestedOpenAccess";
  v3[10] = @"3PK.grantedOpenAccess";
  v3[11] = @"3PK.usesSettings";
  v3[12] = @"3PK.containedInApp";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:13];
  v5[0] = v0;
  id v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v1;
}

uint64_t TIKeyboardTypeIsNumberPad(unsigned int a1)
{
  return (a1 < 0xE) & (0x2930u >> a1);
}

uint64_t __shouldOptOutForSelector_block_invoke()
{
  shouldOptOutForSelector___knownSelectors = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EDC2C1D0];

  return MEMORY[0x1F41817F8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInRange(CFAllocatorRef alloc, CFRange theRange)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7730](alloc, theRange.location, theRange.length);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x1F40D7778](theSet, *(void *)&theChar);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80E0](allocator, activities, repeats, order, block);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x1F40D8690](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1F40D86C0](string, range, transform, reverse);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1F40D9890]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1F40DA9E8](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1F40DAAB0]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1F417CDE8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x1F417CE30]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1F417CE50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1F40D9030]();
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1F4182BC0](crc, buf, *(void *)&len);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1F40CCE00](path, omode);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE38](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE80](a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  double v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1F41821C8](a1, *(void *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x1F417F6F8](*(void *)&c);
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x1F417F718](*(void *)&c);
}

int32_t u_getIntPropertyValue(UChar32 c, UProperty which)
{
  return MEMORY[0x1F417F760](*(void *)&c, *(void *)&which);
}

UBool u_hasBinaryProperty(UChar32 c, UProperty which)
{
  return MEMORY[0x1F417F780](*(void *)&c, *(void *)&which);
}

uint64_t ubidi_getBaseDirection()
{
  return MEMORY[0x1F417F980]();
}

UBlockCode ublock_getCode(UChar32 c)
{
  return MEMORY[0x1F417FA20](*(void *)&c);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

uint64_t uscript_getScript()
{
  return MEMORY[0x1F41805E0]();
}

uint64_t uscript_hasScript()
{
  return MEMORY[0x1F41805F8]();
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x1F41806E8]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1F4180720]();
}