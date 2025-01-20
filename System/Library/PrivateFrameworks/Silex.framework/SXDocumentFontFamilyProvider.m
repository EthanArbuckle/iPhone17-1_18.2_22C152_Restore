@interface SXDocumentFontFamilyProvider
- (NSArray)fonts;
- (SXDocumentFontFamilyProvider)initWithDocument:(id)a3;
- (id)fontsFromDocument:(id)a3;
@end

@implementation SXDocumentFontFamilyProvider

- (SXDocumentFontFamilyProvider)initWithDocument:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXDocumentFontFamilyProvider;
  v5 = [(SXDocumentFontFamilyProvider *)&v10 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(SXDocumentFontFamilyProvider *)v5 fontsFromDocument:v4];
    fonts = v6->_fonts;
    v6->_fonts = (NSArray *)v7;
  }
  return v6;
}

- (id)fontsFromDocument:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v40 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v39 = v3;
  v5 = [v3 resources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        v11 = [v39 resources];
        v12 = [v11 objectForKey:v10];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = [v12 fontAttributes];

          if (v13)
          {
            v14 = [v12 fontAttributes];
            v15 = [v14 familyName];

            v16 = [v4 objectForKey:v15];
            if (!v16)
            {
              v16 = [MEMORY[0x263EFF980] array];
              [v4 setObject:v16 forKey:v15];
            }
            [v16 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v7);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v4;
  uint64_t v41 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v41)
  {
    uint64_t v38 = *(void *)v52;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v52 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v17;
        uint64_t v18 = *(void *)(*((void *)&v51 + 1) + 8 * v17);
        v45 = [MEMORY[0x263EFF9C0] set];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v43 = v18;
        v19 = [obj objectForKey:v18];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v59 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v48;
          do
          {
            uint64_t v23 = 0;
            uint64_t v46 = v21;
            do
            {
              if (*(void *)v48 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v47 + 1) + 8 * v23);
              v25 = [v24 fontAttributes];
              uint64_t v26 = [v25 familyName];
              if (!v26) {
                goto LABEL_28;
              }
              v27 = (void *)v26;
              v28 = [v24 fontAttributes];
              if ([v28 width] == 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_27;
              }
              v29 = [v24 fontAttributes];
              if ([v29 weight] == 0x7FFFFFFFFFFFFFFFLL)
              {

LABEL_27:
LABEL_28:

                goto LABEL_29;
              }
              v30 = [v24 fontAttributes];
              uint64_t v31 = v22;
              v32 = v19;
              uint64_t v33 = [v30 style];

              BOOL v34 = v33 == 0x7FFFFFFFFFFFFFFFLL;
              v19 = v32;
              uint64_t v22 = v31;
              uint64_t v21 = v46;
              if (!v34) {
                [v45 addObject:v24];
              }
LABEL_29:
              ++v23;
            }
            while (v21 != v23);
            uint64_t v35 = [v19 countByEnumeratingWithState:&v47 objects:v59 count:16];
            uint64_t v21 = v35;
          }
          while (v35);
        }

        v36 = [[SXFontFamily alloc] initWithFamilyName:v43 faces:v45];
        [v40 addObject:v36];

        uint64_t v17 = v44 + 1;
      }
      while (v44 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v41);
  }

  return v40;
}

- (NSArray)fonts
{
  return self->_fonts;
}

- (void).cxx_destruct
{
}

@end