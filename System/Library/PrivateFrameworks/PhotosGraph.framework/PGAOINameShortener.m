@interface PGAOINameShortener
+ (BOOL)isCountryWithAOISubstitutions:(id)a3;
+ (id)_shortenedAOIForName:(id)a3;
+ (id)s_aoiReplacementsDictionary;
+ (id)shortenedAOIForLocationOrAreaNode:(id)a3 locationHelper:(id)a4;
+ (void)_enumerateWordCombinationsForName:(id)a3 usingBlock:(id)a4;
@end

@implementation PGAOINameShortener

+ (id)s_aoiReplacementsDictionary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PGAOINameShortener_s_aoiReplacementsDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (s_aoiReplacementsDictionary_onceToken != -1) {
    dispatch_once(&s_aoiReplacementsDictionary_onceToken, block);
  }
  v2 = (void *)s_aoiReplacementsDictionary_s_aoiReplacementsDictionary;
  return v2;
}

void __49__PGAOINameShortener_s_aoiReplacementsDictionary__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v0 URLForResource:@"aoiReplacements" withExtension:@"plist"];

  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];
  v2 = (void *)s_aoiReplacementsDictionary_s_aoiReplacementsDictionary;
  s_aoiReplacementsDictionary_s_aoiReplacementsDictionary = v1;
}

+ (BOOL)isCountryWithAOISubstitutions:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (isCountryWithAOISubstitutions__onceToken != -1) {
      dispatch_once(&isCountryWithAOISubstitutions__onceToken, &__block_literal_global_57036);
    }
    char v4 = [(id)isCountryWithAOISubstitutions__countriesWithSubstitutions containsObject:v3];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

void __52__PGAOINameShortener_isCountryWithAOISubstitutions___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"US", @"CA", 0);
  uint64_t v1 = (void *)isCountryWithAOISubstitutions__countriesWithSubstitutions;
  isCountryWithAOISubstitutions__countriesWithSubstitutions = v0;
}

+ (void)_enumerateWordCombinationsForName:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 componentsSeparatedByString:@" "];
  if ([v7 count])
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    char v14 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PGAOINameShortener__enumerateWordCombinationsForName_usingBlock___block_invoke;
    aBlock[3] = &unk_1E68ECAB8;
    id v10 = v7;
    v12 = v13;
    id v11 = v6;
    v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v8[2](v8, 1);

    _Block_object_dispose(v13, 8);
  }
}

void __67__PGAOINameShortener__enumerateWordCombinationsForName_usingBlock___block_invoke(void *a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v4 = (void *)a1[4];
  if (a2) {
    [v4 reverseObjectEnumerator];
  }
  else {
    [v4 objectEnumerator];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1D25FED50]();
        v13 = v12;
        if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
        {
          goto LABEL_20;
        }
        if (v8)
        {
          if (a2) {
            [NSString stringWithFormat:@"%@ %@", v11, v8, (void)v15];
          }
          else {
          uint64_t v14 = [NSString stringWithFormat:@"%@ %@", v8, v11, (void)v15];
          }

          id v8 = (id)v14;
        }
        else
        {
          id v8 = v11;
        }
        (*(void (**)(void))(a1[5] + 16))();
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
LABEL_20:
  }
}

+ (id)_shortenedAOIForName:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "s_aoiReplacementsDictionary");
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__57053;
  v33 = __Block_byref_object_dispose__57054;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__57053;
  v27 = __Block_byref_object_dispose__57054;
  id v28 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  long long v17 = __43__PGAOINameShortener__shortenedAOIForName___block_invoke;
  long long v18 = &unk_1E68ECA90;
  id v6 = v5;
  id v19 = v6;
  v21 = &v29;
  id v7 = v4;
  id v20 = v7;
  v22 = &v23;
  [a1 _enumerateWordCombinationsForName:v7 usingBlock:&v15];
  uint64_t v8 = v30[5];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", v8, v24[5], v15, v16, v17, v18, v19);
    if ([v9 hasSuffix:@" and "])
    {
      id v10 = v7;
      id v11 = v9;
    }
    else
    {
      v13 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      id v11 = objc_msgSend(v9, "pg_stringByTrailingCharactersInSet:options:", v13, 3);

      if ([v11 length]) {
        id v10 = v11;
      }
      else {
        id v10 = v7;
      }
    }
    id v12 = v10;
  }
  else
  {
    id v12 = v7;
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v12;
}

void __43__PGAOINameShortener__shortenedAOIForName___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  id v10 = v4;
  id v6 = [v4 lowercaseString];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    unint64_t v8 = [v10 length];
    if (v8 > [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
    {
      unint64_t v9 = [v7 length];
      if (v9 < [*(id *)(a1 + 40) length])
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
      }
    }
  }
}

+ (id)shortenedAOIForLocationOrAreaNode:(id)a3 locationHelper:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 label];
  int v9 = [v8 isEqualToString:@"Area"];

  if (v9)
  {
    id v10 = v6;
    id v11 = [v10 name];
    id v12 = [v10 collection];

    uint64_t v13 = [v7 addressNodesFromAreaNodes:v12];
LABEL_5:
    long long v17 = (void *)v13;

    goto LABEL_7;
  }
  uint64_t v14 = [v6 label];
  int v15 = [v14 isEqualToString:@"City"];

  if (v15)
  {
    id v16 = v6;
    id v11 = [v16 name];
    id v12 = [v16 collection];

    uint64_t v13 = [v7 addressNodesFromLocationNodes:v12];
    goto LABEL_5;
  }
  long long v17 = 0;
  id v11 = 0;
LABEL_7:
  if ([v11 length])
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__PGAOINameShortener_shortenedAOIForLocationOrAreaNode_locationHelper___block_invoke;
    v21[3] = &unk_1E68ECA68;
    id v22 = v7;
    uint64_t v23 = &v25;
    id v24 = a1;
    [v17 enumerateIdentifiersAsCollectionsWithBlock:v21];
    if (*((unsigned char *)v26 + 24))
    {
      id v18 = [a1 _shortenedAOIForName:v11];
    }
    else
    {
      id v18 = v11;
    }
    id v19 = v18;

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v19 = v11;
  }

  return v19;
}

void __71__PGAOINameShortener_shortenedAOIForLocationOrAreaNode_locationHelper___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  objc_msgSend(*(id *)(a1 + 32), "countryNodeFromAddressNodeAsCollection:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v8 names];
  id v7 = [v6 firstObject];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 48) isCountryWithAOISubstitutions:v7];
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

@end