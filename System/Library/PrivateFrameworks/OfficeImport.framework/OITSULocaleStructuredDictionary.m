@interface OITSULocaleStructuredDictionary
+ (OITSULocaleStructuredDictionary)dictionaryWithContentsOfFileForLocale:(id)a3 inDirectory:(id)a4 inBundle:(id)a5;
+ (id)dateFormatterSymbolsFallbackDictionary;
+ (id)numberFormatterSymbolsFallbackDictionary;
- (BOOL)p_extractLanguage:(id *)a3 script:(id *)a4 region:(id *)a5 fromString:(id)a6;
- (OITSULocaleStructuredDictionary)initWithDictionary:(id)a3 locale:(id)a4;
- (id)objectForKey:(id)a3 locale:(id)a4;
- (id)p_makeLocaleIdentifierWithLanguage:(id)a3 script:(id)a4 region:(id)a5;
- (void)p_remakeWorkingDictionaryWithLocale:(id)a3;
@end

@implementation OITSULocaleStructuredDictionary

+ (OITSULocaleStructuredDictionary)dictionaryWithContentsOfFileForLocale:(id)a3 inDirectory:(id)a4 inBundle:(id)a5
{
  id v8 = a3;
  uint64_t v9 = *MEMORY[0x263EFF508];
  id v10 = a5;
  id v11 = a4;
  v12 = [v8 objectForKey:v9];
  v13 = [v12 lowercaseString];
  v14 = [v10 pathForResource:v13 ofType:@"plist" inDirectory:v11];

  if (v14)
  {
    id v15 = objc_alloc((Class)a1);
    v16 = [NSDictionary dictionaryWithContentsOfFile:v14];
    v17 = (void *)[v15 initWithDictionary:v16 locale:v8];
  }
  else
  {
    v17 = 0;
  }

  return (OITSULocaleStructuredDictionary *)v17;
}

- (OITSULocaleStructuredDictionary)initWithDictionary:(id)a3 locale:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)OITSULocaleStructuredDictionary;
  uint64_t v9 = [(OITSULocaleStructuredDictionary *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dictionary, a3);
    uint64_t v11 = objc_opt_new();
    cldrLanguageScriptRegionForKey = v10->_cldrLanguageScriptRegionForKey;
    v10->_cldrLanguageScriptRegionForKey = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    cldrLanguageScriptForKey = v10->_cldrLanguageScriptForKey;
    v10->_cldrLanguageScriptForKey = (NSMutableDictionary *)v13;

    [(OITSULocaleStructuredDictionary *)v10 p_remakeWorkingDictionaryWithLocale:v8];
  }

  return v10;
}

- (id)objectForKey:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = (NSLocale *)a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (v8->_workingLocale != v7
    || v8->_workingLocaleIsAutoUpdating
    && (unint64_t autoUpdatingCount = v8->_autoUpdatingCount,
        autoUpdatingCount != +[OITSULocale autoupdatingCurrentLocaleChangeCount]))
  {
    [(OITSULocaleStructuredDictionary *)v8 p_remakeWorkingDictionaryWithLocale:v7];
  }
  uint64_t v9 = [(NSMutableDictionary *)v8->_workingDictionary objectForKeyedSubscript:v6];
  objc_sync_exit(v8);

  return v9;
}

- (void)p_remakeWorkingDictionaryWithLocale:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v42 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v49 = v5;
  objc_storeStrong((id *)&v5->_workingLocale, a3);
  BOOL v6 = +[OITSULocale localeIsAutoUpdating:v42];
  v5->_workingLocaleIsAutoUpdating = v6;
  if (v6) {
    unint64_t v7 = +[OITSULocale autoupdatingCurrentLocaleChangeCount];
  }
  else {
    unint64_t v7 = 0;
  }
  v5->_unint64_t autoUpdatingCount = v7;
  v41 = [v42 localeIdentifier];
  v45 = [v42 objectForKey:*MEMORY[0x263EFF508]];
  v44 = [v42 objectForKey:*MEMORY[0x263EFF4D0]];
  v48 = [(NSMutableDictionary *)v5->_cldrLanguageScriptRegionForKey objectForKeyedSubscript:v41];
  v46 = [(NSMutableDictionary *)v5->_cldrLanguageScriptForKey objectForKeyedSubscript:v41];
  if (!v48 || !v46)
  {
    id v8 = +[OITSULocale canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:v41];
    if (!v48)
    {
      id v39 = v8;
      id v9 = v8;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v10 = v5->_dictionary;
      uint64_t v11 = [(NSDictionary *)v10 countByEnumeratingWithState:&v57 objects:v62 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v58;
        v48 = v9;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v58 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            if ([v14 rangeOfString:@"POSIX" options:1] == 0x7FFFFFFFFFFFFFFFLL)
            {
              id v15 = +[OITSULocale canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:v14];
              if ([v15 isEqualToString:v9])
              {
                id v16 = v14;

                v48 = v16;
              }
            }
          }
          uint64_t v11 = [(NSDictionary *)v10 countByEnumeratingWithState:&v57 objects:v62 count:16];
        }
        while (v11);
      }
      else
      {
        v48 = v9;
      }

      [(NSMutableDictionary *)v49->_cldrLanguageScriptRegionForKey setObject:v48 forKeyedSubscript:v41];
      id v8 = v39;
    }
    if (!v46)
    {
      id v40 = v8;
      id v43 = v8;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      obuint64_t j = v49->_dictionary;
      uint64_t v17 = [(NSDictionary *)obj countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v54;
        v46 = v43;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v54 != v18) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            if ([v20 rangeOfString:@"POSIX" options:1] == 0x7FFFFFFFFFFFFFFFLL)
            {
              id v51 = 0;
              id v52 = 0;
              id v50 = 0;
              BOOL v21 = [(OITSULocaleStructuredDictionary *)v49 p_extractLanguage:&v52 script:&v51 region:&v50 fromString:v20];
              id v22 = v52;
              id v23 = v51;
              id v24 = v50;
              v25 = v24;
              if (v21 && v22 && v23 && !v24)
              {
                v26 = [(OITSULocaleStructuredDictionary *)v49 p_makeLocaleIdentifierWithLanguage:v45 script:v23 region:v44];
                if ([v26 isEqualToString:v43])
                {
                  id v27 = v20;

                  v46 = v27;
                }
              }
            }
          }
          uint64_t v17 = [(NSDictionary *)obj countByEnumeratingWithState:&v53 objects:v61 count:16];
        }
        while (v17);
      }
      else
      {
        v46 = v43;
      }

      [(NSMutableDictionary *)v49->_cldrLanguageScriptForKey setObject:v46 forKeyedSubscript:v41];
      id v8 = v40;
    }
  }
  uint64_t v28 = objc_opt_new();
  workingDictionary = v49->_workingDictionary;
  v49->_workingDictionary = (NSMutableDictionary *)v28;

  v30 = [(NSDictionary *)v49->_dictionary objectForKeyedSubscript:v45];

  if (v30)
  {
    v31 = v49->_workingDictionary;
    v32 = [(NSDictionary *)v49->_dictionary objectForKeyedSubscript:v45];
    [(NSMutableDictionary *)v31 addEntriesFromDictionary:v32];
  }
  v33 = [(NSDictionary *)v49->_dictionary objectForKeyedSubscript:v46];

  if (v33)
  {
    v34 = v49->_workingDictionary;
    v35 = [(NSDictionary *)v49->_dictionary objectForKeyedSubscript:v46];
    [(NSMutableDictionary *)v34 addEntriesFromDictionary:v35];
  }
  v36 = [(NSDictionary *)v49->_dictionary objectForKeyedSubscript:v48];

  if (v36)
  {
    v37 = v49->_workingDictionary;
    v38 = [(NSDictionary *)v49->_dictionary objectForKeyedSubscript:v48];
    [(NSMutableDictionary *)v37 addEntriesFromDictionary:v38];
  }
  objc_sync_exit(v49);
}

- (BOOL)p_extractLanguage:(id *)a3 script:(id *)a4 region:(id *)a5 fromString:(id)a6
{
  id v9 = a6;
  id v10 = [v9 componentsSeparatedByString:@"-"];
  uint64_t v11 = [v10 objectAtIndexedSubscript:0];
  if ([v11 length] == 2)
  {

    goto LABEL_4;
  }
  uint64_t v12 = [v10 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 length];

  if (v13 == 3)
  {
LABEL_4:
    v14 = [v10 objectAtIndexedSubscript:0];
    id v15 = 0;
    id v16 = 0;
    if ((unint64_t)[v10 count] <= 1) {
      goto LABEL_12;
    }
    uint64_t v17 = [v10 objectAtIndexedSubscript:1];
    uint64_t v18 = [v17 length];

    v19 = [v10 objectAtIndexedSubscript:1];
    id v15 = v19;
    if (v18 == 4) {
      goto LABEL_6;
    }
    if ([v19 length] == 2)
    {
    }
    else
    {
      id v23 = [v10 objectAtIndexedSubscript:1];
      uint64_t v24 = [v23 length];

      if (v24 != 3)
      {
        id v15 = 0;
LABEL_6:
        id v16 = 0;
        goto LABEL_12;
      }
    }
    id v16 = [v10 objectAtIndexedSubscript:1];
    id v15 = 0;
LABEL_12:
    if ((unint64_t)[v10 count] >= 3)
    {
      v25 = [v10 objectAtIndexedSubscript:2];
      if ([v25 length] == 2)
      {

LABEL_16:
        uint64_t v32 = [v10 objectAtIndexedSubscript:2];

        id v16 = (void *)v32;
        goto LABEL_17;
      }
      [v10 objectAtIndexedSubscript:2];
      id v37 = v9;
      v26 = v14;
      id v27 = a3;
      uint64_t v28 = a4;
      v30 = v29 = a5;
      uint64_t v31 = [v30 length];

      a5 = v29;
      a4 = v28;
      a3 = v27;
      v14 = v26;
      id v9 = v37;

      if (v31 == 3) {
        goto LABEL_16;
      }
    }
LABEL_17:
    id v33 = v14;
    *a3 = v33;
    id v34 = v15;
    *a4 = v34;
    id v35 = v16;
    *a5 = v35;

    BOOL v22 = 1;
    goto LABEL_18;
  }
  v20 = [NSString stringWithUTF8String:"-[OITSULocaleStructuredDictionary p_extractLanguage:script:region:fromString:]"];
  BOOL v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSULocaleStructuredDictionary.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v20, v21, 244, 0, "Got an identifier (%@) whose first component isn't 2 or 3 char long, which violates BCP47. How did that go into our CLDR?", v9 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)p_makeLocaleIdentifierWithLanguage:(id)a3 script:(id)a4 region:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v11 = v10;
  if (v7) {
    [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x263EFF508]];
  }
  if (v8) {
    [v11 setObject:v8 forKeyedSubscript:*MEMORY[0x263EFF540]];
  }
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x263EFF4D0]];
  }
  uint64_t v12 = (void *)MEMORY[0x263EFF960];
  uint64_t v13 = [MEMORY[0x263EFF960] localeIdentifierFromComponents:v11];
  v14 = [v12 canonicalLocaleIdentifierFromString:v13];

  return v14;
}

+ (id)dateFormatterSymbolsFallbackDictionary
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = (void *)[v2 initWithDictionary:&unk_26EC812C0 locale:v3];

  return v4;
}

+ (id)numberFormatterSymbolsFallbackDictionary
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = (void *)[v2 initWithDictionary:&unk_26EC81310 locale:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workingLocale, 0);
  objc_storeStrong((id *)&self->_workingDictionary, 0);
  objc_storeStrong((id *)&self->_cldrLanguageScriptForKey, 0);
  objc_storeStrong((id *)&self->_cldrLanguageScriptRegionForKey, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end