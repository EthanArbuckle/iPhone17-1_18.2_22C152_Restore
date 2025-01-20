@interface NSBundle(SUICLocalization)
- (id)suic_localizedStringForKey:()SUICLocalization value:table:;
- (uint64_t)suic_localizedStringForKey:()SUICLocalization;
- (uint64_t)suic_localizedStringForKey:()SUICLocalization table:;
@end

@implementation NSBundle(SUICLocalization)

- (id)suic_localizedStringForKey:()SUICLocalization value:table:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  if (![(__CFString *)v10 length])
  {

    v10 = @"Localizable";
  }
  if (__currentLanguageCode)
  {
    v11 = (void *)__stringTables;
    if (!__stringTables)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
      v13 = (void *)__stringTables;
      __stringTables = v12;

      v11 = (void *)__stringTables;
    }
    v14 = [a1 bundleIdentifier];
    v15 = [v11 objectForKey:v14];

    if (v15
      || ([MEMORY[0x1E4F1CA60] dictionary],
          v15 = objc_claimAutoreleasedReturnValue(),
          v16 = (void *)__stringTables,
          [a1 bundleIdentifier],
          v17 = objc_claimAutoreleasedReturnValue(),
          [v16 setObject:v15 forKey:v17],
          v17,
          v15))
    {
      v18 = [v15 objectForKey:v10];
      if (v18)
      {
LABEL_19:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v28 = [v18 objectForKey:v8];

          if (v28) {
            goto LABEL_28;
          }
          goto LABEL_23;
        }
      }
      else
      {
        v31 = v15;
        id v32 = v9;
        id v33 = v8;
        CFArrayRef v19 = (const __CFArray *)[a1 localizations];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        CFArrayRef v20 = CFBundleCopyLocalizationsForPreferences(v19, (CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObject:__currentLanguageCode]);
        uint64_t v21 = [(__CFArray *)v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v35;
          while (2)
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v35 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = [a1 URLForResource:v10 withExtension:@"strings" subdirectory:0 localization:*(void *)(*((void *)&v34 + 1) + 8 * i)];
              uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v25];
              if (v26)
              {
                v18 = (void *)v26;
                v15 = v31;
                [v31 setObject:v26 forKey:v10];

                id v9 = v32;
                id v8 = v33;
                goto LABEL_19;
              }
            }
            uint64_t v22 = [(__CFArray *)v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        v27 = [MEMORY[0x1E4F1CA98] null];
        v15 = v31;
        [v31 setObject:v27 forKey:v10];

        v18 = 0;
        id v9 = v32;
        id v8 = v33;
      }
    }
  }
LABEL_23:
  v29 = v8;
  if (v9)
  {
    if ([v9 length]) {
      v29 = v9;
    }
    else {
      v29 = v8;
    }
  }
  id v28 = v29;
LABEL_28:

  return v28;
}

- (uint64_t)suic_localizedStringForKey:()SUICLocalization table:
{
  return objc_msgSend(a1, "suic_localizedStringForKey:value:table:", a3, 0, a4);
}

- (uint64_t)suic_localizedStringForKey:()SUICLocalization
{
  return objc_msgSend(a1, "suic_localizedStringForKey:table:", a3, 0);
}

@end