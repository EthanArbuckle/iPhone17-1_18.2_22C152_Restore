@interface SXFontAttributesConstructor
- (SXFontAttributesConstructor)initWithFontIndex:(id)a3;
- (SXFontIndex)fontIndex;
- (id)fontAttributesForFontDescriptions:(id)a3;
- (id)fontFaceForAttributes:(id)a3 size:(int64_t)a4;
- (id)fontNameForAttributes:(id)a3 size:(int64_t)a4;
- (int64_t)weightByApplyingWeightLabels:(id)a3 toWeight:(int64_t)a4;
@end

@implementation SXFontAttributesConstructor

- (SXFontAttributesConstructor)initWithFontIndex:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXFontAttributesConstructor;
  v6 = [(SXFontAttributesConstructor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fontIndex, a3);
  }

  return v7;
}

- (id)fontAttributesForFontDescriptions:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v31 = [MEMORY[0x263EFF980] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v29 = 0;
    v6 = 0;
    uint64_t v33 = *(void *)v35;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v12 = [v11 fontName];

        if (v12) {
          BOOL v13 = v6 == 0;
        }
        else {
          BOOL v13 = 0;
        }
        if (v13)
        {
          fontIndex = self->_fontIndex;
          v21 = [v11 fontName];
          v19 = [(SXFontIndex *)fontIndex fontAttributesForFontName:v21];

          if (v19)
          {
            v6 = [v19 familyName];
            if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v9 = [v19 width];
            }
            if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v7 = [v19 style];
            }
            if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
              int64_t v8 = -[SXFontAttributesConstructor weightByApplyingWeightLabels:toWeight:](self, "weightByApplyingWeightLabels:toWeight:", v31, [v19 weight]);
            }
          }
          else
          {
            v6 = 0;
          }
          goto LABEL_29;
        }
        v14 = [v11 fontAttributes];

        if (v14)
        {
          if (!v6)
          {
            v15 = [v11 fontAttributes];
            v6 = [v15 familyName];
          }
          if (v9 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v16 = [v11 fontAttributes];
            uint64_t v9 = [v16 width];
          }
          if (v7 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v17 = [v11 fontAttributes];
            uint64_t v7 = [v17 style];
          }
          if (v8 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v18 = [v11 fontAttributes];
            int64_t v8 = -[SXFontAttributesConstructor weightByApplyingWeightLabels:toWeight:](self, "weightByApplyingWeightLabels:toWeight:", v31, [v18 weight]);
          }
          if (!v29)
          {
            v19 = [v11 fontAttributes];
            v29 = [v19 grade];
LABEL_29:
          }
        }
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = [v11 fontAttributes];
          uint64_t v23 = [v22 weightLabel];

          if (v23)
          {
            v24 = NSNumber;
            v25 = [v11 fontAttributes];
            v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "weightLabel"));
            [v31 addObject:v26];
          }
        }
        if (v8 != 0x7FFFFFFFFFFFFFFFLL && v6 && v9 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_41;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (!v5) {
        goto LABEL_41;
      }
    }
  }
  v29 = 0;
  v6 = 0;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_41:

  v27 = 0;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v6 && v9 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL) {
    v27 = [[SXFontAttributes alloc] initWithFamilyName:v6 weight:v8 width:v9 style:v7 grade:v29];
  }

  return v27;
}

- (id)fontFaceForAttributes:(id)a3 size:(int64_t)a4
{
  return [(SXFontIndex *)self->_fontIndex fontFaceForFontAttributes:a3 size:a4];
}

- (id)fontNameForAttributes:(id)a3 size:(int64_t)a4
{
  return [(SXFontIndex *)self->_fontIndex fontNameForFontAttributes:a3 size:a4];
}

- (int64_t)weightByApplyingWeightLabels:(id)a3 toWeight:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(a3, "reverseObjectEnumerator", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) integerValue];
        if (v10 == 1)
        {
          int64_t v11 = +[SXFontMatching bolderWeightForWeight:a4];
        }
        else
        {
          if (v10 != 2) {
            goto LABEL_11;
          }
          int64_t v11 = +[SXFontMatching lighterWeightForWeight:a4];
        }
        a4 = v11;
LABEL_11:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return a4;
}

- (SXFontIndex)fontIndex
{
  return self->_fontIndex;
}

- (void).cxx_destruct
{
}

@end