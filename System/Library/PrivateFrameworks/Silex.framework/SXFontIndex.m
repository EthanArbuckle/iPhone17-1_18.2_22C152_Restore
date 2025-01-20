@interface SXFontIndex
- (BOOL)fontFamilyName:(id)a3 matchesFontAttributes:(id)a4;
- (NSCache)attributeToFontIndex;
- (NSCache)fontToAttributeIndex;
- (NSDictionary)fonts;
- (NSMutableArray)fontFamilyProviders;
- (SXFontIndex)initWithFontFamilyProviders:(id)a3;
- (id)fontAttributesForFontName:(id)a3;
- (id)fontFaceForFontAttributes:(id)a3 size:(int64_t)a4;
- (id)fontNameForFontAttributes:(id)a3 size:(int64_t)a4;
- (id)fontsForFamilyProviders:(id)a3;
- (void)addFontFamilyProvider:(id)a3;
@end

@implementation SXFontIndex

- (SXFontIndex)initWithFontFamilyProviders:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SXFontIndex;
  v5 = [(SXFontIndex *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] arrayWithArray:v4];
    fontFamilyProviders = v5->_fontFamilyProviders;
    v5->_fontFamilyProviders = (NSMutableArray *)v6;

    v8 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    attributeToFontIndex = v5->_attributeToFontIndex;
    v5->_attributeToFontIndex = v8;

    v10 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    fontToAttributeIndex = v5->_fontToAttributeIndex;
    v5->_fontToAttributeIndex = v10;

    uint64_t v12 = [(SXFontIndex *)v5 fontsForFamilyProviders:v4];
    fonts = v5->_fonts;
    v5->_fonts = (NSDictionary *)v12;
  }
  return v5;
}

- (void)addFontFamilyProvider:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(SXFontIndex *)self fontFamilyProviders];
    [v5 addObject:v4];

    uint64_t v6 = [(SXFontIndex *)self fontsForFamilyProviders:self->_fontFamilyProviders];
    fonts = self->_fonts;
    self->_fonts = v6;

    [(NSCache *)self->_attributeToFontIndex removeAllObjects];
    fontToAttributeIndex = self->_fontToAttributeIndex;
    [(NSCache *)fontToAttributeIndex removeAllObjects];
  }
}

- (id)fontNameForFontAttributes:(id)a3 size:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    v7 = [[SXFontIndexCacheKey alloc] initWithFontAttributes:v6 fontSize:a4];
    v8 = [(NSCache *)self->_attributeToFontIndex objectForKey:v7];
    if (!v8)
    {
      v9 = [v6 familyName];
      if (!v9
        || [v6 width] == 0x7FFFFFFFFFFFFFFFLL
        || [v6 weight] == 0x7FFFFFFFFFFFFFFFLL)
      {
      }
      else
      {
        uint64_t v11 = [v6 style];

        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v12 = self->_fonts;
          uint64_t v13 = [(NSDictionary *)v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            v26 = v7;
            v8 = 0;
            uint64_t v15 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
                if ([(SXFontIndex *)self fontFamilyName:v17 matchesFontAttributes:v6])
                {
                  v18 = [(NSDictionary *)self->_fonts objectForKey:v17];
                  [v18 fontFaceWithAttributes:v6 size:a4];
                  v19 = self;
                  id v20 = v6;
                  v21 = v12;
                  v23 = int64_t v22 = a4;
                  uint64_t v24 = [v23 fontName];
                  v25 = v8;
                  v8 = (void *)v24;

                  a4 = v22;
                  uint64_t v12 = v21;
                  id v6 = v20;
                  self = v19;
                }
              }
              uint64_t v14 = [(NSDictionary *)v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
            }
            while (v14);

            v7 = v26;
            if (v8) {
              [(NSCache *)self->_attributeToFontIndex setObject:v8 forKey:v26];
            }
            goto LABEL_8;
          }
        }
      }
      v8 = 0;
    }
LABEL_8:

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)fontFaceForFontAttributes:(id)a3 size:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 familyName];
  if (v7 && [v6 width] != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v6, "weight") != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [v6 style];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_5;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = self->_fonts;
    uint64_t v11 = [(NSDictionary *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (-[SXFontIndex fontFamilyName:matchesFontAttributes:](self, "fontFamilyName:matchesFontAttributes:", v15, v6, (void)v17))
          {
            v16 = [(NSDictionary *)self->_fonts objectForKey:v15];
            v8 = [v16 fontFaceWithAttributes:v6 size:a4];

            goto LABEL_6;
          }
        }
        uint64_t v12 = [(NSDictionary *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }

LABEL_5:
  v8 = 0;
LABEL_6:

  return v8;
}

- (id)fontAttributesForFontName:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    goto LABEL_24;
  }
  v5 = [(NSCache *)self->_fontToAttributeIndex objectForKey:v4];
  if (v5) {
    goto LABEL_25;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = self->_fonts;
  uint64_t v22 = [(NSDictionary *)v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (!v22)
  {

LABEL_24:
    v5 = 0;
    goto LABEL_25;
  }
  v23 = 0;
  long long v20 = self;
  uint64_t v21 = *(void *)v29;
  obuint64_t j = v6;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v29 != v21) {
        objc_enumerationMutation(obj);
      }
      v8 = [(NSDictionary *)self->_fonts objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v9 = [v8 fontFaces];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        while (2)
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * j);
            uint64_t v15 = [v14 fontName];
            int v16 = [v15 isEqualToString:v4];

            if (v16)
            {
              uint64_t v17 = [v14 fontAttributes];

              v23 = (void *)v17;
              goto LABEL_18;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v11) {
            continue;
          }
          break;
        }
LABEL_18:
        self = v20;
      }
    }
    uint64_t v22 = [(NSDictionary *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  }
  while (v22);

  v5 = v23;
  if (v23) {
    [(NSCache *)self->_fontToAttributeIndex setObject:v23 forKey:v4];
  }
LABEL_25:

  return v5;
}

- (id)fontsForFamilyProviders:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v10 = [v9 fontFamilies];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              int v16 = [v15 familyName];
              [v4 setObject:v15 forKey:v16];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)fontFamilyName:(id)a3 matchesFontAttributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 familyName];
  if ([v7 isEqualToString:v5])
  {
    char v8 = 1;
  }
  else
  {
    v9 = [v6 familyName];
    uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@" " withString:&stru_26D5311C0];
    char v8 = [v10 isEqualToString:v5];
  }
  return v8;
}

- (NSDictionary)fonts
{
  return self->_fonts;
}

- (NSCache)attributeToFontIndex
{
  return self->_attributeToFontIndex;
}

- (NSCache)fontToAttributeIndex
{
  return self->_fontToAttributeIndex;
}

- (NSMutableArray)fontFamilyProviders
{
  return self->_fontFamilyProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontFamilyProviders, 0);
  objc_storeStrong((id *)&self->_fontToAttributeIndex, 0);
  objc_storeStrong((id *)&self->_attributeToFontIndex, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
}

@end