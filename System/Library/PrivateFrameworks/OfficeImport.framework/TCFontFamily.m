@interface TCFontFamily
- (BOOL)allFamilyIsBold;
- (BOOL)allFamilyIsItalic;
- (BOOL)doesAnyNonBoldVariantExistForFont:(id)a3;
- (BOOL)traitsAreAdditive;
- (NSArray)members;
- (NSDictionary)namesByLanguage;
- (TCFontFamily)initWithDictionary:(id)a3;
- (TCFontFamily)initWithNamesByLanguage:(id)a3 members:(id)a4;
- (id)bestMatchForStyling:(TCFontStyling)a3;
- (id)description;
- (id)englishName;
- (id)equivalentDictionary;
- (id)memberForFullName:(id)a3;
- (id)memberForPSName:(id)a3;
- (id)regularVariant:(BOOL)a3;
- (id)variantByAddingBoldToFont:(id)a3;
- (id)variantByRemovingBoldFromFont:(id)a3;
- (id)variantByTogglingItalicOfFont:(id)a3;
- (id)weightVariantsOfFont:(id)a3;
- (unint64_t)boldFontIndexInWeightVariants:(id)a3;
- (unint64_t)regularFontIndexInWeightVariants:(id)a3;
@end

@implementation TCFontFamily

- (TCFontFamily)initWithNamesByLanguage:(id)a3 members:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v35 = a4;
  v47.receiver = self;
  v47.super_class = (Class)TCFontFamily;
  v6 = [(TCFontFamily *)&v47 init];
  v33 = v6;
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = [v32 copy];
    namesByLanguage = v7->_namesByLanguage;
    v7->_namesByLanguage = (NSDictionary *)v8;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v35;
    uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v44;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(obj);
        }
        v38 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
        if ([v38 styling]) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v35 = obj;
      uint64_t v15 = [v35 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (!v15)
      {

        id v13 = 0;
LABEL_28:
        v14 = obj;
        goto LABEL_29;
      }
      unsigned __int8 v16 = 0;
      uint64_t v36 = *(void *)v40;
      v37 = 0;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v40 != v36) {
            objc_enumerationMutation(v35);
          }
          v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v18 styling])
          {
            int v19 = [v18 styling];
            v16 |= v19 != [v38 styling];
          }
          else
          {
            if (!v37) {
              v37 = (void *)[v35 mutableCopy];
            }
            uint64_t v20 = [v18 styling];
            uint64_t v22 = v21;
            unsigned int v23 = [v38 styling];
            v24 = [TCFont alloc];
            v25 = [v18 namesByLanguage];
            v26 = [v18 psName];
            v27 = -[TCFont initWithNamesByLanguage:psName:styling:](v24, "initWithNamesByLanguage:psName:styling:", v25, v26, v20 & 0xFFFFFFFF00000000 | v23, v22);

            objc_msgSend(v37, "replaceObjectAtIndex:withObject:", objc_msgSend(v37, "indexOfObjectIdenticalTo:", v18), v27);
          }
        }
        uint64_t v15 = [v35 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v15);

      if ((v16 & (v37 != 0)) == 1)
      {
        [v32 objectForKeyedSubscript:&unk_26EC80CF0];

        v28 = v37;
LABEL_27:
        id v13 = v28;
        id v35 = v13;
        goto LABEL_28;
      }

      v28 = v37;
      if (v37) {
        goto LABEL_27;
      }
      id v13 = 0;
    }
    else
    {
LABEL_10:
      id v13 = 0;
      v14 = obj;
      id v35 = obj;
LABEL_29:
    }
    uint64_t v29 = [v35 copy];
    members = v33->_members;
    v33->_members = (NSArray *)v29;

    [(NSArray *)v33->_members makeObjectsPerformSelector:sel_setFamily_ withObject:v33];
  }

  return v33;
}

- (id)bestMatchForStyling:(TCFontStyling)a3
{
  unint64_t v3 = *(void *)&a3.weight;
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(TCFontFamily *)self members];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    int v5 = 0;
    v6 = 0;
    unint64_t v7 = HIDWORD(v3);
    uint64_t v8 = *(void *)v23;
    unsigned int v9 = (v3 >> 8) & 1;
    int v10 = (char)v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v12 styling];
        int v15 = v9 + (v13 << 23 >> 31);
        if (v15 < 0) {
          int v15 = -v15;
        }
        int v16 = v10 - (char)v13;
        if (v16 < 0) {
          int v16 = (char)v13 - v10;
        }
        int v17 = v7 - v14;
        if ((int)v7 - v14 < 0) {
          int v17 = v14 - v7;
        }
        int v18 = v16 + v17 + 200 * v15;
        if (!v6 || v18 < v5)
        {
          id v19 = v12;

          int v5 = v18;
          v6 = v19;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)memberForPSName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TCFontFamily *)self members];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        unsigned int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v10 = objc_msgSend(v9, "psName", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)memberForFullName:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TCFontFamily *)self members];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v19 = v5;
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v8 = [v7 namesByLanguage];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * j);
              long long v13 = [v7 namesByLanguage];
              long long v14 = [v13 objectForKeyedSubscript:v12];

              long long v15 = [v14 fullName];
              char v16 = [v15 isEqualToString:v4];

              if (v16)
              {
                id v17 = v7;

                goto LABEL_19;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      id v17 = 0;
    }
    while (v5);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)regularVariant:(BOOL)a3
{
  BOOL v51 = a3;
  uint64_t v64 = *MEMORY[0x263EF8340];
  v52 = [(TCFontFamily *)self members];
  if ([v52 count] == 1)
  {
    unint64_t v3 = [v52 firstObject];
    goto LABEL_58;
  }
  {
    -[TCFontFamily regularVariant:]::sRegularSuffixArray = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"regular", @"roman", @"plain", @"normal", @"book", 0);
  }
  {
    -[TCFontFamily regularVariant:]::sRegularSuffixExtendedArray = [(id)-[TCFontFamily regularVariant:]::sRegularSuffixArray arrayByAddingObjectsFromArray:&unk_26EC80798];
  }
  id v4 = &-[TCFontFamily regularVariant:]::sRegularSuffixExtendedArray;
  if (!v51) {
    id v4 = &-[TCFontFamily regularVariant:]::sRegularSuffixArray;
  }
  id v5 = (id)*v4;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v52;
  uint64_t v6 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v6)
  {
    unint64_t v3 = 0;
    uint64_t v7 = *(void *)v59;
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        char v11 = [v10 englishName];
        uint64_t v12 = [v11 styleName];
        long long v13 = [v12 lowercaseString];

        unint64_t v14 = [v5 indexOfObject:v13];
        if (v14 < v8)
        {
          id v15 = v10;

          unint64_t v3 = v15;
          unint64_t v8 = v14;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v6);

    if (v3)
    {
      if (v51) {
        goto LABEL_57;
      }
LABEL_27:
      long long v25 = [v3 englishName];
      long long v26 = [v25 fullName];
      long long v27 = [v25 styleName];
      int v28 = [v26 hasSuffix:v27];

      if (!v28) {
        goto LABEL_32;
      }
      {
        -[TCFontFamily regularVariant:]::sInvalidFullNameSuffixSet = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"regular", @"normal", 0);
      }
      long long v29 = (void *)-[TCFontFamily regularVariant:]::sInvalidFullNameSuffixSet;
      v30 = [v25 styleName];
      v31 = [v30 lowercaseString];
      int v32 = [v29 containsObject:v31];

      if (!v32) {
        goto LABEL_32;
      }
      {
        -[TCFontFamily regularVariant:]::sFontsWithRegular = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"Athelas", @"Avenir Next", @"Avenir Next Condensed", @"Kefa", @"Lucida Fax", @"Lucida Sans", @"Lucida Sans Typewriter", @"Menlo", @"Optima", @"STIXGeneral", @"Superclarendon", 0);
      }
      uint64_t v33 = -[TCFontFamily regularVariant:]::sFontsWithRegular;
      v34 = [(TCFontFamily *)self englishName];
      LOBYTE(v33) = [(id)v33 containsObject:v34];

      if ((v33 & 1) == 0)
      {
        id v35 = v3;
LABEL_54:
        unint64_t v3 = 0;
      }
      else
      {
LABEL_32:
        if (!v3)
        {
LABEL_56:

          goto LABEL_57;
        }
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v35 = obj;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v54 objects:v62 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v55;
          while (2)
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v55 != v37) {
                objc_enumerationMutation(v35);
              }
              long long v39 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              if (v39 != v3)
              {
                uint64_t v40 = [v39 styling];
                uint64_t v42 = v41;
                uint64_t v43 = [v3 styling];
                BOOL v47 = v40 == v43 && HIDWORD(v40) == HIDWORD(v43);
                if (v47 && v42 == v44 && BYTE1(v42) == v45 && HIDWORD(v42) == v46)
                {

                  goto LABEL_54;
                }
              }
            }
            uint64_t v36 = [v35 countByEnumeratingWithState:&v54 objects:v62 count:16];
            if (v36) {
              continue;
            }
            break;
          }
        }
      }

      goto LABEL_56;
    }
  }
  else
  {
  }
  if ([obj count] == 2)
  {
    uint64_t v16 = 0;
    char v17 = 1;
    do
    {
      char v18 = v17;
      uint64_t v19 = [obj objectAtIndexedSubscript:v16];
      uint64_t v20 = [obj objectAtIndexedSubscript:v16 ^ 1];
      [v19 styling];
      [v20 styling];

      char v17 = 0;
      uint64_t v16 = 1;
    }
    while ((v18 & 1) != 0);
  }
  if (!v51)
  {
    unint64_t v3 = 0;
    goto LABEL_27;
  }
  uint64_t v21 = [obj firstObject];
  uint64_t v22 = [v21 styling];
  int v24 = v23;

  unint64_t v3 = -[TCFontFamily bestMatchForStyling:](self, "bestMatchForStyling:", v22, v24 & 0xFFFF0000);
LABEL_57:

LABEL_58:
  return v3;
}

- (BOOL)traitsAreAdditive
{
  v2 = [(TCFontFamily *)self regularVariant:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)allFamilyIsItalic
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(TCFontFamily *)self members];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) styling];
        if ((v6 & 0x100) == 0)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)variantByTogglingItalicOfFont:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v24 = a3;
  uint64_t v4 = [v24 styling];
  unint64_t v6 = v5;
  [(TCFontFamily *)self members];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = 0;
    uint64_t v9 = *(void *)v27;
    int v10 = v6;
    int v11 = BYTE1(v6) ^ 1;
    unint64_t v12 = HIDWORD(v6);
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v15 = [v14 styling];
        if (v15 == v4 && HIDWORD(v15) == HIDWORD(v4) && v16 == v10 && v11 == v17 && v18 == v12)
        {
          if (v8)
          {

            goto LABEL_26;
          }
          id v8 = v14;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_26:
    id v8 = 0;
  }

  return v8;
}

- (BOOL)allFamilyIsBold
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(TCFontFamily *)self members];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) styling];
        if (v6 << 24 < 503316480)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)weightVariantsOfFont:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 styling];
  unint64_t v6 = v5;
  long long v25 = [MEMORY[0x263EFF980] array];
  [(TCFontFamily *)self members];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    int v10 = BYTE1(v6);
    unint64_t v11 = HIDWORD(v6);
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v13 styling];
        char v15 = v14;
        uint64_t v16 = [v13 styling];
        if (v16 == v4 && HIDWORD(v16) == HIDWORD(v4))
        {
          BOOL v21 = v17 == v15 && v18 == v10;
          if (v21 && v19 == v11) {
            [v25 addObject:v13];
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  int v23 = [v25 sortedArrayUsingComparator:&__block_literal_global_42];

  return v23;
}

uint64_t __37__TCFontFamily_weightVariantsOfFont___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 styling];
  int v6 = v5;
  [v4 styling];
  int v8 = (v6 - v7) << 24;
  BOOL v9 = v8 == 0;
  if (v8) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 0;
  }
  if (((v6 - v7) & 0x80) != 0 || v9) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 1;
  }

  return v11;
}

- (unint64_t)boldFontIndexInWeightVariants:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  unint64_t v5 = v4;
  if (v4)
  {
    unint64_t v6 = v4;
    while (1)
    {
      int v7 = [v3 objectAtIndexedSubscript:v6 - 1];
      [v7 styling];
      if (v8 << 24 <= 687865855) {
        break;
      }

      if (!--v6)
      {
        unint64_t v5 = 0;
        goto LABEL_13;
      }
    }
    if (v6 < v5 && v8 << 24 < 503316480) {
      unint64_t v5 = v6;
    }
    else {
      unint64_t v5 = v6 - 1;
    }
  }
LABEL_13:

  return v5;
}

- (unint64_t)regularFontIndexInWeightVariants:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    unint64_t v5 = 0;
    while (1)
    {
      unint64_t v6 = [v3 objectAtIndexedSubscript:v5];
      [v6 styling];
      if (!(v7 << 24)) {
        break;
      }
      if (v7 << 24 >= 1)
      {
        if (v5) {
          --v5;
        }
        else {
          unint64_t v5 = 0;
        }
        break;
      }
      ++v5;

      if (v4 == v5) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    unint64_t v5 = v4 - 1;
  }

  return v5;
}

- (id)variantByAddingBoldToFont:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TCFontFamily *)self members];
  if ([v5 count] == 1
    || ([v4 styling], v6 << 24 > 654311424)
    || [(TCFontFamily *)self allFamilyIsBold])
  {
    int v7 = 0;
  }
  else
  {
    BOOL v9 = [(TCFontFamily *)self weightVariantsOfFont:v4];
    uint64_t v10 = [v9 indexOfObjectIdenticalTo:v4];
    if ((unint64_t)[v9 count] >= 2
      && (unint64_t v11 = [(TCFontFamily *)self boldFontIndexInWeightVariants:v9],
          v10 == [(TCFontFamily *)self regularFontIndexInWeightVariants:v9]))
    {
      int v7 = [v9 objectAtIndexedSubscript:v11];
    }
    else
    {
      int v7 = 0;
    }
  }
  return v7;
}

- (id)variantByRemovingBoldFromFont:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TCFontFamily *)self members];
  if ([v5 count] == 1
    || ([v4 styling], v6 << 24 < 0x1000000)
    || [(TCFontFamily *)self allFamilyIsBold]
    || ![(TCFontFamily *)self traitsAreAdditive])
  {
    unint64_t v11 = 0;
  }
  else
  {
    int v7 = [(TCFontFamily *)self weightVariantsOfFont:v4];
    uint64_t v8 = [v7 indexOfObjectIdenticalTo:v4];
    if ((unint64_t)[v7 count] >= 2
      && (unint64_t v9 = [(TCFontFamily *)self boldFontIndexInWeightVariants:v7],
          unint64_t v10 = [(TCFontFamily *)self regularFontIndexInWeightVariants:v7],
          v8 == v9))
    {
      unint64_t v11 = [v7 objectAtIndexedSubscript:v10];
    }
    else
    {
      unint64_t v11 = 0;
    }
  }
  return v11;
}

- (BOOL)doesAnyNonBoldVariantExistForFont:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 styling];
  unint64_t v6 = v5;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v7 = [(TCFontFamily *)self members];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    int v10 = BYTE1(v6);
    unint64_t v11 = HIDWORD(v6);
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v13 styling];
        char v15 = v14;
        uint64_t v16 = [v13 styling];
        if (v16 == v4 && HIDWORD(v16) == HIDWORD(v4))
        {
          BOOL v21 = v17 == v15 && v18 == v10;
          if (v21 && v19 == v11)
          {
            [v13 styling];
            if (v23 << 24 < 503316480)
            {
              BOOL v24 = 1;
              goto LABEL_24;
            }
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v24 = 0;
LABEL_24:

  return v24;
}

- (id)englishName
{
  v2 = [(TCFontFamily *)self namesByLanguage];
  id v3 = [v2 objectForKeyedSubscript:&unk_26EC80CF0];

  return v3;
}

- (id)equivalentDictionary
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [(TCFontFamily *)self namesByLanguage];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v9 = TCFontMacLanguageIDToNSString([v8 unsignedShortValue]);
        int v10 = [(TCFontFamily *)self namesByLanguage];
        unint64_t v11 = [v10 objectForKeyedSubscript:v8];
        [v3 setObject:v11 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  long long v12 = [MEMORY[0x263EFF980] array];
  long long v13 = [(TCFontFamily *)self members];
  char v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_260];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        int v19 = [*(id *)(*((void *)&v22 + 1) + 8 * j) equivalentDictionary];
        [v12 addObject:v19];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  uint64_t v20 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v3, @"names-by-language", v12, @"members", 0, (void)v22);

  return v20;
}

uint64_t __36__TCFontFamily_equivalentDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 psName];
  uint64_t v6 = [v4 psName];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

- (TCFontFamily)initWithDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v24 = a3;
  long long v22 = self;
  long long v23 = [v24 objectForKeyedSubscript:@"names-by-language"];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v23;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(NSString **)(*((void *)&v29 + 1) + 8 * i);
        unsigned __int16 v10 = TCFontMacLanguageIDFromNSString(v9);
        unint64_t v11 = [v5 objectForKeyedSubscript:v9];
        long long v12 = [NSNumber numberWithUnsignedShort:v10];
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }

  long long v13 = [v24 objectForKeyedSubscript:@"members"];
  char v14 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        int v19 = [[TCFont alloc] initWithDictionary:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        [v14 addObject:v19];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(TCFontFamily *)v22 initWithNamesByLanguage:v4 members:v14];
  return v20;
}

- (id)description
{
  v2 = [(TCFontFamily *)self equivalentDictionary];
  id v3 = [v2 description];

  return v3;
}

- (NSDictionary)namesByLanguage
{
  return self->_namesByLanguage;
}

- (NSArray)members
{
  return self->_members;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_namesByLanguage, 0);
}

@end