@interface WFAppShortcutColorFetcher
+ (NSCache)colorCache;
- (id)colorsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)extractColorsForIconDictionary:(id)a3 alternateIconDictionary:(id)a4 bundle:(id)a5 colorDefaults:(id)a6;
- (id)extractTintColorForIconDictionary:(id)a3 alternateIconDictionary:(id)a4 bundle:(id)a5;
- (id)finishWithComplementingColors:(id)a3 tintColor:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
@end

@implementation WFAppShortcutColorFetcher

- (id)finishWithComplementingColors:(id)a3 tintColor:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  v27[6] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 count])
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = colorDefaults();
    uint64_t v17 = [v16 objectForKeyedSubscript:v11];

    id v9 = (id)v17;
    if (v10) {
      goto LABEL_3;
    }
  }
  v26[0] = @"com.apple.camera";
  v18 = +[WFColor colorWithRGBAValue:757935871];
  v27[0] = v18;
  v26[1] = @"com.apple.mobilephone";
  v19 = +[WFColor colorWithSystemColor:3];
  v27[1] = v19;
  v26[2] = @"com.apple.facetime";
  v20 = +[WFColor colorWithSystemColor:3];
  v27[2] = v20;
  v26[3] = @"com.apple.VoiceMemos";
  v21 = +[WFColor colorWithRGBAValue:3947773439];
  v27[3] = v21;
  v26[4] = @"com.apple.mobiletimer";
  v22 = +[WFColor colorWithRGBAValue:4288613119];
  v27[4] = v22;
  v26[5] = @"com.apple.DocumentsApp";
  v23 = +[WFColor colorWithSystemColor:4];
  v27[5] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:6];

  id v10 = [v24 objectForKeyedSubscript:v11];

LABEL_3:
  [v10 alpha];
  if (v12 == 0.0)
  {

    id v10 = 0;
  }
  uint64_t v13 = [v9 count];
  if (v10 || v13)
  {
    v14 = [[WFAppShortcutColors alloc] initWithComplementingColors:v9 tintColor:v10];
    v15 = +[WFAppShortcutColorFetcher colorCache];
    [v15 setObject:v14 forKey:v11];
  }
  else if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"WFAppShortcutColorFetcherErrorDomain" code:3 userInfo:0];
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)colorsForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[WFAppShortcutColorFetcher colorCache];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:a4];
    id v11 = v10;
    if (v10)
    {
      double v12 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v13 = [v10 URL];
      v14 = [v12 bundleWithURL:v13];

      if (v14)
      {
        v15 = [v11 infoDictionary];
        v16 = [v15 objectForKey:@"CFBundleIcons" ofClass:objc_opt_class()];
        if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v17 = [v16 objectForKeyedSubscript:@"CFBundlePrimaryIcon"];
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v18 = [v16 objectForKeyedSubscript:@"CFBundleAlternateIcons"];
            if (v18)
            {
              v32 = (void *)v18;
              objc_opt_class();
              v19 = v32;
              if (objc_opt_isKindOfClass()) {
                v20 = v32;
              }
              else {
                v20 = 0;
              }
            }
            else
            {
              v20 = 0;
              v19 = 0;
            }
            id v30 = v20;

            v23 = [v11 alternateIconName];

            v31 = v17;
            v33 = 0;
            if (v23 && v30)
            {
              v24 = [v11 alternateIconName];
              v33 = [v30 objectForKeyedSubscript:v24];
            }
            v25 = colorDefaults();
            v29 = [v25 objectForKeyedSubscript:v6];

            v26 = [(WFAppShortcutColorFetcher *)self extractColorsForIconDictionary:v17 alternateIconDictionary:v33 bundle:v14 colorDefaults:v29];
            v27 = [(WFAppShortcutColorFetcher *)self extractTintColorForIconDictionary:v31 alternateIconDictionary:v33 bundle:v14];
            id v9 = [(WFAppShortcutColorFetcher *)self finishWithComplementingColors:v26 tintColor:v27 bundleIdentifier:v6 error:a4];
          }
          else
          {

            id v9 = [(WFAppShortcutColorFetcher *)self finishWithComplementingColors:0 tintColor:0 bundleIdentifier:v6 error:a4];
          }
        }
        else
        {

          id v9 = [(WFAppShortcutColorFetcher *)self finishWithComplementingColors:0 tintColor:0 bundleIdentifier:v6 error:a4];
        }
      }
      else
      {
        v22 = getWFGeneralLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v35 = "-[WFAppShortcutColorFetcher colorsForBundleIdentifier:error:]";
          __int16 v36 = 2112;
          id v37 = v6;
          _os_log_impl(&dword_1B3C5C000, v22, OS_LOG_TYPE_DEFAULT, "%s Unable to grab bundle for %@, returning defaults if available", buf, 0x16u);
        }

        id v9 = [(WFAppShortcutColorFetcher *)self finishWithComplementingColors:0 tintColor:0 bundleIdentifier:v6 error:a4];
      }
    }
    else
    {
      v21 = getWFGeneralLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[WFAppShortcutColorFetcher colorsForBundleIdentifier:error:]";
        __int16 v36 = 2112;
        id v37 = v6;
        _os_log_impl(&dword_1B3C5C000, v21, OS_LOG_TYPE_DEFAULT, "%s Unable to grab record for %@, returning defaults if available", buf, 0x16u);
      }

      id v9 = [(WFAppShortcutColorFetcher *)self finishWithComplementingColors:0 tintColor:0 bundleIdentifier:v6 error:a4];
    }
  }
  return v9;
}

+ (NSCache)colorCache
{
  if (colorCache_onceToken != -1) {
    dispatch_once(&colorCache_onceToken, &__block_literal_global_17787);
  }
  v2 = (void *)colorCache_colorCache;
  return (NSCache *)v2;
}

- (id)extractColorsForIconDictionary:(id)a3 alternateIconDictionary:(id)a4 bundle:(id)a5 colorDefaults:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    id v16 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_31;
  }
  uint64_t v13 = [v10 objectForKeyedSubscript:@"NSAppIconComplementingColorNames"];
  if (!v13)
  {
    id v14 = 0;
LABEL_11:
    id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_29:

    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = (id)MEMORY[0x1E4F1CBF0];
    id v14 = v13;
    uint64_t v13 = 0;
    goto LABEL_29;
  }
  if ([v13 count])
  {
    if ([v13 count] == 1)
    {
      id v14 = [v13 objectAtIndexedSubscript:0];
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = +[WFColor colorNamed:v14 inBundle:v11];
          objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v15, 0);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

          goto LABEL_29;
        }
      }
      goto LABEL_11;
    }
    if ([v13 count] == 2)
    {
      uint64_t v17 = [v13 objectAtIndexedSubscript:0];
      if (v17)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = 0;
        }
      }
      else
      {
        uint64_t v18 = 0;
      }
      id v14 = v18;

      v19 = [v13 objectAtIndexedSubscript:1];
      if (v19)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v20 = v19;
        }
        else {
          v20 = 0;
        }
      }
      else
      {
        v20 = 0;
      }
      id v15 = v20;

      id v16 = (id)MEMORY[0x1E4F1CBF0];
      if (v14 && v15)
      {
        uint64_t v21 = +[WFColor colorNamed:v14 inBundle:v11];
        v22 = +[WFColor colorNamed:v15 inBundle:v11];
        v23 = (void *)v21;
        objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v21, v22, 0);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_28;
    }
  }
  id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_30:

LABEL_31:
  if ([v16 count]) {
    goto LABEL_44;
  }
  v24 = [v9 objectForKeyedSubscript:@"NSAppIconComplementingColorNames"];
  if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v24 count])
    {
      if ([v24 count] == 1)
      {
        id v25 = [v24 objectAtIndexedSubscript:0];
        if (v25)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v26 = +[WFColor colorNamed:v25 inBundle:v11];
            uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v26, 0);

            id v16 = (id)v27;
          }
        }
      }
      else
      {
        if ((unint64_t)[v24 count] < 2) {
          goto LABEL_43;
        }
        __int16 v36 = [v24 objectAtIndexedSubscript:0];
        if (v36)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v37 = v36;
          }
          else {
            id v37 = 0;
          }
        }
        else
        {
          id v37 = 0;
        }
        id v25 = v37;

        uint64_t v38 = [v24 objectAtIndexedSubscript:1];
        if (v38)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v39 = v38;
          }
          else {
            v39 = 0;
          }
        }
        else
        {
          v39 = 0;
        }
        id v40 = v39;

        if (v25 && v40)
        {
          v43 = +[WFColor colorNamed:v25 inBundle:v11];
          v41 = +[WFColor colorNamed:v40 inBundle:v11];
          uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v43, v41, 0);

          id v16 = (id)v42;
        }
      }
      goto LABEL_42;
    }
  }
  else
  {

    v24 = 0;
  }
  if (v12)
  {
    id v25 = v16;
    id v16 = v12;
LABEL_42:
  }
LABEL_43:

LABEL_44:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v28 = v16;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v28);
        }
        [*(id *)(*((void *)&v44 + 1) + 8 * i) alpha];
        if (v33 == 0.0)
        {

          id v34 = (id)MEMORY[0x1E4F1CBF0];
          goto LABEL_54;
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }

  id v34 = v28;
LABEL_54:

  return v34;
}

- (id)extractTintColorForIconDictionary:(id)a3 alternateIconDictionary:(id)a4 bundle:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = [v8 objectForKeyedSubscript:@"NSAppIconActionTintColorName"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v11 = +[WFColor colorNamed:v10 inBundle:v9];

      if (v11) {
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  id v12 = [v7 objectForKeyedSubscript:@"NSAppIconActionTintColorName"];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = +[WFColor colorNamed:v12 inBundle:v9];
  }
  else
  {
    id v11 = 0;
  }

LABEL_12:
  return v11;
}

uint64_t __39__WFAppShortcutColorFetcher_colorCache__block_invoke()
{
  colorCache_colorCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);
  return MEMORY[0x1F41817F8]();
}

@end