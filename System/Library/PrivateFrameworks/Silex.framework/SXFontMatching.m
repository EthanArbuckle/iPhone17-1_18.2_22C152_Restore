@interface SXFontMatching
+ (id)fontFaceWithAttributes:(id)a3 fromFamily:(id)a4;
+ (id)matchFontFaceForAttributes:(id)a3 fromFamily:(id)a4;
+ (int64_t)bestStyleForIntendedStyle:(int64_t)a3 forFonts:(id)a4;
+ (int64_t)bestWeightForIntendedWeight:(int64_t)a3 forFonts:(id)a4;
+ (int64_t)bestWidthForIntendedWidth:(int64_t)a3 forFonts:(id)a4;
+ (int64_t)bolderWeightForWeight:(int64_t)a3;
+ (int64_t)lighterWeightForWeight:(int64_t)a3;
@end

@implementation SXFontMatching

+ (id)matchFontFaceForAttributes:(id)a3 fromFamily:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_class();
  uint64_t v8 = [v5 width];
  v9 = [v6 fontFaces];
  uint64_t v10 = [v7 bestWidthForIntendedWidth:v8 forFonts:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    v12 = [v6 fontFaces];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __56__SXFontMatching_matchFontFaceForAttributes_fromFamily___block_invoke;
    v26[3] = &__block_descriptor_40_e39_B24__0___SXFontFace__8__NSDictionary_16l;
    v26[4] = v10;
    v13 = [MEMORY[0x263F08A98] predicateWithBlock:v26];
    v14 = [v12 filteredSetUsingPredicate:v13];

    uint64_t v15 = objc_msgSend((id)objc_opt_class(), "bestStyleForIntendedStyle:forFonts:", objc_msgSend(v5, "style"), v14);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
    }
    else
    {
      uint64_t v16 = v15;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __56__SXFontMatching_matchFontFaceForAttributes_fromFamily___block_invoke_2;
      v25[3] = &__block_descriptor_40_e39_B24__0___SXFontFace__8__NSDictionary_16l;
      v25[4] = v15;
      v17 = [MEMORY[0x263F08A98] predicateWithBlock:v25];
      uint64_t v18 = [v14 filteredSetUsingPredicate:v17];

      uint64_t v19 = objc_msgSend((id)objc_opt_class(), "bestWeightForIntendedWeight:forFonts:", objc_msgSend(v5, "weight"), v18);
      v20 = [SXFontAttributes alloc];
      v21 = [v6 familyName];
      v22 = [v5 grade];
      v23 = [(SXFontAttributes *)v20 initWithFamilyName:v21 weight:v19 width:v10 style:v16 grade:v22];

      v11 = [(id)objc_opt_class() fontFaceWithAttributes:v23 fromFamily:v6];

      v14 = (void *)v18;
    }
  }
  return v11;
}

BOOL __56__SXFontMatching_matchFontFaceForAttributes_fromFamily___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 fontAttributes];
  BOOL v4 = [v3 width] == *(void *)(a1 + 32);

  return v4;
}

BOOL __56__SXFontMatching_matchFontFaceForAttributes_fromFamily___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 fontAttributes];
  BOOL v4 = [v3 style] == *(void *)(a1 + 32);

  return v4;
}

+ (int64_t)bestWidthForIntendedWidth:(int64_t)a3 forFonts:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [MEMORY[0x263F089C8] indexSet];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "fontAttributes", (void)v19);
        uint64_t v14 = [v13 width];

        if (v14 == a3)
        {

          uint64_t v16 = a3;
          goto LABEL_14;
        }
        uint64_t v15 = [v12 fontAttributes];
        objc_msgSend(v6, "addIndex:", objc_msgSend(v15, "width"));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 > 7)
    {
      uint64_t v16 = [v6 indexGreaterThanIndex:a3];
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = [v6 indexLessThanIndex:a3];
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v16 = [v6 indexLessThanIndex:a3];
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = [v6 indexGreaterThanIndex:a3];
LABEL_17:
        uint64_t v16 = v17;
      }
    }
  }
LABEL_14:

  return v16;
}

+ (int64_t)bestStyleForIntendedStyle:(int64_t)a3 forFonts:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    LOBYTE(v8) = 0;
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    uint64_t v11 = *(void *)v26;
    id obj = v5;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
      uint64_t v14 = [v13 fontAttributes];
      uint64_t v15 = [v14 style];

      if (v15 == a3)
      {
        id v5 = obj;

        goto LABEL_40;
      }
      if (v8)
      {
        BOOL v8 = 1;
        if (!v9) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v18 = [v13 fontAttributes];
        BOOL v8 = [v18 style] == 1;

        if (!v9)
        {
LABEL_9:
          uint64_t v16 = [v13 fontAttributes];
          BOOL v9 = [v16 style] == 2;

          if (v10) {
            goto LABEL_13;
          }
          goto LABEL_10;
        }
      }
      BOOL v9 = 1;
      if (v10)
      {
LABEL_13:
        BOOL v10 = 1;
        goto LABEL_14;
      }
LABEL_10:
      uint64_t v17 = [v13 fontAttributes];
      BOOL v10 = [v17 style] == 0;

LABEL_14:
      if (v7 == ++v12)
      {
        id v5 = obj;
        uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_19;
      }
    }
  }
  BOOL v8 = 0;
  BOOL v9 = 0;
  BOOL v10 = 0;
LABEL_19:

  int64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10) {
    int64_t v20 = 0;
  }
  else {
    int64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v8) {
    int64_t v20 = 1;
  }
  if (v10) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v9) {
    uint64_t v21 = 2;
  }
  uint64_t v22 = 2;
  if (!v9) {
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v8) {
    uint64_t v22 = 1;
  }
  if (!a3) {
    int64_t v19 = v22;
  }
  if (a3 == 1) {
    int64_t v19 = v21;
  }
  if (a3 == 2) {
    a3 = v20;
  }
  else {
    a3 = v19;
  }
LABEL_40:

  return a3;
}

+ (int64_t)bestWeightForIntendedWeight:(int64_t)a3 forFonts:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x263F089C8] indexSet];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8)
  {
LABEL_9:

    if (a3 == 400)
    {
      uint64_t v16 = 500;
      if ([v6 containsIndex:500]) {
        goto LABEL_23;
      }
    }
    else
    {
      if (a3 == 500)
      {
        uint64_t v16 = 400;
        if ([v6 containsIndex:400]) {
          goto LABEL_23;
        }
        goto LABEL_14;
      }
      if (a3 > 400)
      {
LABEL_14:
        uint64_t v16 = objc_msgSend(v6, "indexGreaterThanIndex:", a3, (void)v19);
        if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_23;
        }
        uint64_t v17 = [v6 indexLessThanIndex:a3];
LABEL_22:
        uint64_t v16 = v17;
        goto LABEL_23;
      }
    }
    uint64_t v16 = objc_msgSend(v6, "indexLessThanIndex:", a3, (void)v19);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_23;
    }
    uint64_t v17 = [v6 indexGreaterThanIndex:a3];
    goto LABEL_22;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v20;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v20 != v10) {
      objc_enumerationMutation(v7);
    }
    uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
    v13 = objc_msgSend(v12, "fontAttributes", (void)v19);
    uint64_t v14 = [v13 weight];

    if (v14 == a3) {
      break;
    }
    uint64_t v15 = [v12 fontAttributes];
    objc_msgSend(v6, "addIndex:", objc_msgSend(v15, "weight"));

    if (v9 == ++v11)
    {
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        goto LABEL_3;
      }
      goto LABEL_9;
    }
  }

  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  uint64_t v16 = a3;
LABEL_23:

  return v16;
}

+ (int64_t)bolderWeightForWeight:(int64_t)a3
{
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 > 499)
  {
    if (a3 > 699)
    {
      if (a3 != 700 && a3 != 800 && a3 != 900) {
        return result;
      }
      return 900;
    }
    if (a3 != 500)
    {
      if (a3 != 600) {
        return result;
      }
      return 900;
    }
    return 700;
  }
  if (a3 > 299)
  {
    if (a3 != 300)
    {
      if (a3 != 400) {
        return result;
      }
      return 700;
    }
    return 400;
  }
  if (a3 == 100 || a3 == 200) {
    return 400;
  }
  return result;
}

+ (int64_t)lighterWeightForWeight:(int64_t)a3
{
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 <= 499)
  {
    if (a3 > 299)
    {
      if (a3 != 300 && a3 != 400) {
        return result;
      }
    }
    else if (a3 != 100 && a3 != 200)
    {
      return result;
    }
    return 100;
  }
  if (a3 <= 699)
  {
    if (a3 != 500)
    {
      if (a3 != 600) {
        return result;
      }
      return 400;
    }
    return 100;
  }
  if (a3 == 700) {
    return 400;
  }
  if (a3 == 800 || a3 == 900) {
    return 700;
  }
  return result;
}

+ (id)fontFaceWithAttributes:(id)a3 fromFamily:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [a4 fontFaces];
  id v7 = (id)[v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    long long v22 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v11 = [v10 fontAttributes];
        uint64_t v12 = [v11 weight];
        if (v12 != [v5 weight]) {
          goto LABEL_12;
        }
        v13 = [v10 fontAttributes];
        uint64_t v14 = [v13 style];
        if (v14 != [v5 style])
        {

LABEL_12:
          continue;
        }
        uint64_t v15 = [v10 fontAttributes];
        uint64_t v16 = [v15 width];
        id v17 = v7;
        uint64_t v18 = v8;
        uint64_t v19 = [v5 width];

        BOOL v20 = v16 == v19;
        uint64_t v8 = v18;
        id v7 = v17;
        uint64_t v6 = v22;
        if (v20)
        {
          id v7 = v10;
          goto LABEL_15;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
LABEL_15:

  return v7;
}

@end