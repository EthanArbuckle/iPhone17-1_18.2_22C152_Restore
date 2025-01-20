@interface NSString(IndicUtils)
- (BOOL)_isSingleGlyphInLanguage:()IndicUtils;
- (__CFString)_lastConjunctInLanguage:()IndicUtils;
- (__CFString)_stringByRemovingOffensiveOrVulgarWords;
@end

@implementation NSString(IndicUtils)

- (__CFString)_stringByRemovingOffensiveOrVulgarWords
{
  if ([a1 isEqualToString:@"মাং"]) {
    v2 = @" ং";
  }
  else {
    v2 = a1;
  }

  return v2;
}

- (__CFString)_lastConjunctInLanguage:()IndicUtils
{
  uint64_t ScriptCodeForLanguage = GetScriptCodeForLanguage(a3);
  v5 = [a1 _lastGrapheme];
  if (![v5 _contentsExclusivelyInScript:ScriptCodeForLanguage])
  {
    v6 = &stru_1F3F7A998;
    goto LABEL_21;
  }
  v6 = v5;
  uint64_t v7 = [(__CFString *)v6 length] - 1;
  if (v7 < 0) {
    goto LABEL_17;
  }
  uint64_t v8 = 0;
  unsigned __int16 v9 = TI::IndicUtils::initialVowelLetterForScript(ScriptCodeForLanguage) + 72;
  while (1)
  {
    if ([(__CFString *)v6 characterAtIndex:v7] == v9)
    {
      if (v7 && v7 < (unint64_t)([(__CFString *)v6 length] - 1))
      {
        v10 = -[__CFString substringWithRange:](v6, "substringWithRange:", v7 - 1, 3);
        if (GetAkhandConjuncts(void)::onceToken != -1) {
          dispatch_once(&GetAkhandConjuncts(void)::onceToken, &__block_literal_global_235);
        }
        char v11 = [(id)GetAkhandConjuncts(void)::__akhandConjuncts containsObject:v10];

        if (v11) {
          goto LABEL_12;
        }
      }
      ++v8;
    }
    if (v8 == 2) {
      break;
    }
LABEL_12:
    if (v7-- <= 0) {
      goto LABEL_17;
    }
  }
  uint64_t v13 = [(__CFString *)v6 substringFromIndex:v7 + 1];

  v6 = (__CFString *)v13;
LABEL_17:
  if (GetTallConjuncts(void)::onceToken != -1) {
    dispatch_once(&GetTallConjuncts(void)::onceToken, &__block_literal_global_267);
  }
  if ([(id)GetTallConjuncts(void)::__tallConjuncts containsObject:v6])
  {
    uint64_t v14 = objc_msgSend(NSString, "_stringWithUnichar:", -[__CFString _lastLongCharacter](v6, "_lastLongCharacter"));

    v6 = (__CFString *)v14;
  }
LABEL_21:

  return v6;
}

- (BOOL)_isSingleGlyphInLanguage:()IndicUtils
{
  v74[16] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isEqualToString:@"kn"] & 1) != 0
    || ([v4 isEqualToString:@"or"] & 1) != 0
    || ([v4 isEqualToString:@"te"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else if ([a1 length] && objc_msgSend(v4, "length"))
  {
    uint64_t v7 = a1;
    id v8 = v4;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    uint64_t v69 = [(__CFString *)v7 length];
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x2020000000;
    v65 = 0;
    v65 = malloc_type_calloc(v67[3], 2uLL, 0x1000040BDFB0063uLL);
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    v61 = 0;
    v61 = malloc_type_calloc(v67[3], 0x10uLL, 0x1000040451B5BE8uLL);
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2020000000;
    v57 = 0;
    v57 = malloc_type_calloc(v67[3], 0x10uLL, 0x1000040451B5BE8uLL);
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    v53 = 0;
    v53 = malloc_type_calloc(v67[3], 8uLL, 0x100004000313F17uLL);
    CFIndex v9 = v67[3];
    if (v9 >= 1)
    {
      for (CFIndex i = 0; i < v9; ++i)
      {
        *(void *)(v51[3] + 8 * i) = i;
        CFIndex v9 = v67[3];
      }
    }
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    CFIndex v49 = v9;
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v9, 0x100u);
    v12 = (UniChar *)malloc_type_calloc(MaximumSizeForEncoding + 1, 1uLL, 0x303EF7FDuLL);
    v75.length = v47[3];
    v75.location = 0;
    CFStringGetCharacters(v7, v75, v12);
    id v13 = v8;
    if ([v13 length])
    {
      uint64_t v14 = [(id)GetSystemFontForLanguage(NSString *)::__languageToFont objectForKeyedSubscript:v13];

      if (!v14)
      {
        if (!GetSystemFontForLanguage(NSString *)::__languageToFont)
        {
          uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
          v16 = (void *)GetSystemFontForLanguage(NSString *)::__languageToFont;
          GetSystemFontForLanguage(NSString *)::__languageToFont = v15;
        }
        v17 = [MEMORY[0x1E4F1CA20] scriptCodeFromLanguage:v13];
        UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, 0.0, 0);
        if (UIFontForLanguage)
        {
          v19 = UIFontForLanguage;
          CFArrayRef v20 = CTFontCopyDefaultCascadeListForLanguages(UIFontForLanguage, 0);
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          obuint64_t j = v20;
          uint64_t v21 = [(__CFArray *)obj countByEnumeratingWithState:&v70 objects:v74 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            v40 = v19;
            v41 = v12;
            id v42 = v13;
            v43 = v7;
            uint64_t v23 = *(void *)v71;
            CFStringRef v24 = (const __CFString *)*MEMORY[0x1E4F24500];
            CFStringRef attribute = (const __CFString *)*MEMORY[0x1E4F245A8];
            while (2)
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v71 != v23) {
                  objc_enumerationMutation(obj);
                }
                v26 = *(const __CTFontDescriptor **)(*((void *)&v70 + 1) + 8 * j);
                v27 = (void *)CTFontDescriptorCopyAttribute(v26, v24);
                v28 = (void *)MEMORY[0x1E4F1CA20];
                v29 = [v27 firstObject];
                v30 = [v28 scriptCodeFromLanguage:v29];

                if ([v30 isEqualToString:v17])
                {
                  v31 = (__CFString *)CTFontDescriptorCopyAttribute(v26, attribute);
                  if ([(__CFString *)v31 length])
                  {
                    uint64_t v14 = CTFontCreateWithName(v31, 12.0, 0);
                    id v13 = v42;
                    [(id)GetSystemFontForLanguage(NSString *)::__languageToFont setObject:v14 forKeyedSubscript:v42];

                    uint64_t v7 = v43;
                    goto LABEL_31;
                  }
                }
              }
              uint64_t v22 = [(__CFArray *)obj countByEnumeratingWithState:&v70 objects:v74 count:16];
              if (v22) {
                continue;
              }
              break;
            }
            uint64_t v14 = 0;
            id v13 = v42;
            uint64_t v7 = v43;
LABEL_31:
            v19 = v40;
            v12 = v41;
          }
          else
          {
            uint64_t v14 = 0;
          }

          CFRelease(v19);
        }
        else
        {
          uint64_t v14 = 0;
        }
      }
    }
    else
    {
      uint64_t v14 = 0;
    }

    CTFontGetGlyphsForCharacters((CTFontRef)v14, v12, (CGGlyph *)v63[3], v47[3]);
    CTFontInitializeShapingGlyphs();
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = ___ZL32GetGlyphCountForStringInLanguageP8NSStringS0__block_invoke;
    v74[3] = &unk_1E6E2CBC0;
    v74[4] = &v66;
    v74[5] = &v46;
    v74[6] = &v62;
    v74[7] = &v58;
    v74[8] = &v54;
    v74[9] = &v50;
    CTFontShapeGlyphs();
    uint64_t v32 = v67[3];
    if (v32 < 1)
    {
      uint64_t v33 = 0;
    }
    else
    {
      uint64_t v33 = 0;
      v34 = (__int16 *)v63[3];
      do
      {
        int v35 = *v34++;
        if (v35 != -1) {
          ++v33;
        }
        --v32;
      }
      while (v32);
    }
    free((void *)v63[3]);
    free((void *)v59[3]);
    free((void *)v55[3]);
    free((void *)v51[3]);
    free(v12);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);

    if (v33 != 2
      || (unint64_t)[(__CFString *)v7 length] < 2
      || ((int ScriptCodeForLanguage = GetScriptCodeForLanguage((NSString *)v13),
           __int16 v37 = TI::IndicUtils::initialVowelLetterForScript(ScriptCodeForLanguage),
           unsigned __int16 v38 = v37 + 43,
           unsigned __int16 v39 = v37 + 72,
           [(__CFString *)v7 characterAtIndex:0] != (unsigned __int16)(v37 + 72))
       || (BOOL v5 = 1, [(__CFString *)v7 characterAtIndex:1] != v38))
      && ([(__CFString *)v7 characterAtIndex:0] != v38
       || (BOOL v5 = 1, [(__CFString *)v7 characterAtIndex:1] != v39)))
    {
      BOOL v5 = v33 == 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end