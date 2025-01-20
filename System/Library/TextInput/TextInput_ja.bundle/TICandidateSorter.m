@interface TICandidateSorter
- (BOOL)getInfoForCharacter:(id)a3 strokeCount:(unint64_t *)a4 radicals:(id *)a5 yomis:(id *)a6;
- (BOOL)hasCandidatesFromCandidates:(id)a3 inputString:(id)a4 sortedBy:(unint64_t)a5 omittingEmoji:(BOOL)a6;
- (BOOL)hasCandidatesSortedByEmojiCategoryFromCandidates:(id)a3;
- (BOOL)hasCandidatesSortedByFacemarkCategoryFromCandidates:(id)a3;
- (BOOL)hasCandidatesSortedByRadicalFromCandidates:(id)a3;
- (BOOL)hasCandidatesSortedByYomiFromCandidates:(id)a3 inputString:(id)a4;
- (BOOL)liveConversionEnabled;
- (TICandidateSorter)init;
- (__CFDictionary)radicalToSortPosition;
- (__IDXIndex)index;
- (id)candidatesFromCandidates:(id)a3 inputString:(id)a4 sortedBy:(unint64_t)a5 omittingEmoji:(BOOL)a6;
- (id)candidatesSortedByDefaultFromCandidates:(id)a3 omittingEmoji:(BOOL)a4;
- (id)candidatesSortedByEmojiFromCandidates:(id)a3;
- (id)candidatesSortedByRadicalFromCandidates:(id)a3;
- (id)candidatesSortedByYomiFromCandidates:(id)a3 inputString:(id)a4;
- (void)dealloc;
- (void)setIndex:(__IDXIndex *)a3;
- (void)setLiveConversionEnabled:(BOOL)a3;
- (void)setRadicalToSortPosition:(__CFDictionary *)a3;
@end

@implementation TICandidateSorter

- (TICandidateSorter)init
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)TICandidateSorter;
  v2 = [(TICandidateSorter *)&v27 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [v3 pathForResource:@"CharacterInfo.dictionary" ofType:0 inDirectory:0];

    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    [NSURL fileURLWithPath:v4 isDirectory:1];
    uint64_t v6 = IDXCreateIndexObject();
    IDXSetRequestFields();
    [(TICandidateSorter *)v2 setIndex:v6];

    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 pathForResource:@"RadicalInfo-jp.plist" ofType:0 inDirectory:0];

    v22 = (void *)v8;
    v9 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v8];
    CFIndex v10 = [v9 count];
    Mutable = CFDictionaryCreateMutable(v5, v10, MEMORY[0x263EFFF88], 0);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(const void **)(*((void *)&v23 + 1) + 8 * i);
          v18 = [v12 objectForKey:v17];
          v19 = [v18 objectAtIndex:0];
          v20 = (const void *)[v19 unsignedIntegerValue];

          CFDictionarySetValue(Mutable, v17, v20);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v14);
    }

    [(TICandidateSorter *)v2 setRadicalToSortPosition:Mutable];
  }
  return v2;
}

- (void)dealloc
{
  index = self->_index;
  if (index) {
    CFRelease(index);
  }
  radicalToSortPosition = self->_radicalToSortPosition;
  if (radicalToSortPosition) {
    CFRelease(radicalToSortPosition);
  }
  v5.receiver = self;
  v5.super_class = (Class)TICandidateSorter;
  [(TICandidateSorter *)&v5 dealloc];
}

- (BOOL)getInfoForCharacter:(id)a3 strokeCount:(unint64_t *)a4 radicals:(id *)a5 yomis:(id *)a6
{
  id v10 = a3;
  [(TICandidateSorter *)self index];
  IDXSetSearchString();

  uint64_t matched = IDXGetMatchDataPtr();
  if (matched >= 1)
  {
    IDXGetFieldDataPtrs();
    if (a4) {
      *a4 = MEMORY[0];
    }
    if (a5)
    {
      *a5 = [NSString stringWithCharacters:0 length:v15 >> 1];
    }
    if (a6)
    {
      id v12 = [NSString stringWithCharacters:0 length:v16 >> 1];
      uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@"/" withString:@","];
      *a6 = [v13 componentsSeparatedByString:@","];
    }
  }
  return matched > 0;
}

- (BOOL)hasCandidatesSortedByRadicalFromCandidates:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) label];
        id v10 = [v9 _firstGrapheme];
        if ([v10 length])
        {
          id v16 = 0;
          uint64_t v17 = 0;
          BOOL v11 = [(TICandidateSorter *)self getInfoForCharacter:v10 strokeCount:&v17 radicals:&v16 yomis:0];
          id v12 = v16;
          uint64_t v13 = v12;
          if (v11 && [v12 length])
          {

            BOOL v14 = 1;
            goto LABEL_14;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (id)candidatesSortedByDefaultFromCandidates:(id)a3 omittingEmoji:(BOOL)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(TICandidateSorter *)self liveConversionEnabled]) {
    [v6 _sortedArrayByFrequency:2 extensionCandidateIndex:6 maxEmojisPerCandidate:1 ignoreTransliterateCandidate:1];
  }
  else {
  uint64_t v7 = [v6 _sortedArrayByFrequency];
  }

  if (a4)
  {
    id v8 = [v7 _arrayByFilteringEmojiCandidates:0];
  }
  else
  {
    id v8 = v7;
  }
  v9 = v8;
  id v10 = objc_alloc(MEMORY[0x263F7E630]);
  BOOL v11 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v9];
  id v12 = (void *)[v10 initWithTitle:0 candidates:v11];
  v15[0] = v12;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];

  return v13;
}

- (id)candidatesSortedByRadicalFromCandidates:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v41 = [MEMORY[0x263EFF980] array];
  context = (void *)MEMORY[0x24563C460]();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], 0);
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  cf = [MEMORY[0x263EFF9A0] dictionary];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v61;
    v36 = v55;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v61 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isTransliterationCandidate", context, v36) & 1) == 0)
        {
          BOOL v11 = [v10 label];
          id v12 = [v11 _firstGrapheme];
          if ([v12 length])
          {
            [v5 setObject:v12 forKey:v11];
            id v58 = 0;
            value = 0;
            BOOL v13 = [(TICandidateSorter *)self getInfoForCharacter:v12 strokeCount:&value radicals:&v58 yomis:0];
            id v14 = v58;
            if (v13)
            {
              CFDictionarySetValue(Mutable, v12, value);
              uint64_t v15 = [v14 length];
              v54[0] = MEMORY[0x263EF8330];
              v54[1] = 3221225472;
              v55[0] = __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke;
              v55[1] = &unk_2650FAAC0;
              id v56 = cf;
              v57 = v10;
              objc_msgSend(v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 2, v54);
            }
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v7);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v16 = cf;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v65 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(v16, "objectForKey:", *(void *)(*((void *)&v50 + 1) + 8 * j), context);
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke_2;
        v47[3] = &unk_2650FAAE8;
        id v48 = v5;
        v49 = Mutable;
        [v21 sortUsingComparator:v47];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v65 count:16];
    }
    while (v18);
  }
  cfa = Mutable;

  v22 = [(TICandidateSorter *)self radicalToSortPosition];
  uint64_t v23 = [v16 allKeys];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke_3;
  v46[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v46[4] = v22;
  long long v24 = [v23 sortedArrayUsingComparator:v46];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v25 = v24;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v64 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v42 + 1) + 8 * k);
        id v31 = objc_alloc(MEMORY[0x263F7E630]);
        v32 = [v16 objectForKey:v30];
        v33 = (void *)[v31 initWithTitle:v30 candidates:v32];

        [v41 addObject:v33];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v64 count:16];
    }
    while (v27);
  }

  CFRelease(cfa);

  return v41;
}

uint64_t __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 length])
  {
    id v3 = [*(id *)(a1 + 32) objectForKey:v5];
    if (!v3)
    {
      id v3 = [MEMORY[0x263EFF9B0] orderedSet];
      [*(id *)(a1 + 32) setObject:v3 forKey:v5];
    }
    [v3 addObject:*(void *)(a1 + 40)];
  }
  return MEMORY[0x270F9A790]();
}

uint64_t __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 label];
  uint64_t v7 = [v5 label];

  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v6];
  v9 = [*(id *)(a1 + 32) objectForKey:v7];
  if ([v8 isEqualToString:v9])
  {
    unint64_t v10 = [v6 length];
    unint64_t v11 = [v7 length];
    BOOL v12 = v10 >= v11;
    BOOL v13 = v10 > v11;
  }
  else
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v8);
    uint64_t v15 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v9);
    BOOL v12 = Value >= v15;
    BOOL v13 = Value > v15;
  }
  int v16 = !v12;
  unsigned int v17 = v13;
  if (v16) {
    uint64_t v18 = -1;
  }
  else {
    uint64_t v18 = v17;
  }

  return v18;
}

uint64_t __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke_3(uint64_t a1, const void *a2, void *a3)
{
  CFDictionaryRef v5 = *(const __CFDictionary **)(a1 + 32);
  id v6 = a3;
  Value = CFDictionaryGetValue(v5, a2);
  uint64_t v8 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), v6);

  if (Value < v8) {
    return -1;
  }
  else {
    return Value > v8;
  }
}

- (BOOL)hasCandidatesSortedByYomiFromCandidates:(id)a3 inputString:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = [*(id *)(*((void *)&v44 + 1) + 8 * i) label];
        if ([v13 _containsJapaneseOnly])
        {
          id v14 = [v13 _firstGrapheme];
          if ([v14 length])
          {
            id v42 = 0;
            uint64_t v43 = 0;
            BOOL v15 = [(TICandidateSorter *)self getInfoForCharacter:v14 strokeCount:&v43 radicals:0 yomis:&v42];
            id v16 = v42;
            if (v15)
            {
              long long v40 = 0u;
              long long v41 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              id v34 = v16;
              id v17 = v16;
              uint64_t v36 = [v17 countByEnumeratingWithState:&v38 objects:v48 count:16];
              if (v36)
              {
                uint64_t v37 = *(void *)v39;
                uint64_t v32 = v11;
                id v33 = v8;
                uint64_t v30 = self;
                uint64_t v31 = v10;
                v35 = v17;
                while (2)
                {
                  for (uint64_t j = 0; j != v36; ++j)
                  {
                    if (*(void *)v39 != v37) {
                      objc_enumerationMutation(v17);
                    }
                    uint64_t v19 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                    if (objc_msgSend(v19, "length", v30))
                    {
                      uint64_t v20 = [v19 rangeOfComposedCharacterSequenceAtIndex:0];
                      v22 = objc_msgSend(v19, "substringWithRange:", v20, v21);
                      uint64_t v23 = [v22 stringByConvertingKatakanaToHiragana];

                      uint64_t v24 = [v7 length];
                      uint64_t v25 = 0;
                      while (v24 != v25)
                      {
                        uint64_t v26 = [v7 substringToIndex:++v25];
                        int v27 = [v23 isEqualToString:v26];

                        if (v27)
                        {

                          uint64_t v10 = v31;
                          uint64_t v11 = v32;
                          id v17 = v35;
                          goto LABEL_19;
                        }
                      }

                      BOOL v28 = 1;
                      id v8 = v33;
                      goto LABEL_29;
                    }
LABEL_19:
                    ;
                  }
                  id v8 = v33;
                  self = v30;
                  uint64_t v36 = [v17 countByEnumeratingWithState:&v38 objects:v48 count:16];
                  if (v36) {
                    continue;
                  }
                  break;
                }
              }

              id v16 = v34;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
      BOOL v28 = 0;
    }
    while (v10);
  }
  else
  {
    BOOL v28 = 0;
  }
LABEL_29:

  return v28;
}

- (id)candidatesSortedByYomiFromCandidates:(id)a3 inputString:(id)a4
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v58 = a4;
  id v72 = [MEMORY[0x263EFF980] array];
  context = (void *)MEMORY[0x24563C460]();
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], 0);
  id v7 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v96 objects:v104 count:16];
  long long v62 = v9;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v97;
    long long v60 = v7;
    long long v61 = self;
    uint64_t v59 = *(void *)v97;
    do
    {
      id v13 = 0;
      uint64_t v64 = v11;
      do
      {
        if (*(void *)v97 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v96 + 1) + 8 * (void)v13);
        if (([v14 isTransliterationCandidate] & 1) == 0)
        {
          BOOL v15 = [v14 label];
          if ([v15 _containsJapaneseOnly])
          {
            id v16 = [v15 _firstGrapheme];
            if ([v16 length])
            {
              v70 = v15;
              [v7 setObject:v16 forKey:v15];
              id v94 = 0;
              value = 0;
              key = v16;
              BOOL v17 = [(TICandidateSorter *)self getInfoForCharacter:v16 strokeCount:&value radicals:0 yomis:&v94];
              id v18 = v94;
              if (v17)
              {
                obuint64_t j = v13;
                CFDictionarySetValue(theDict, key, value);
                long long v92 = 0u;
                long long v93 = 0u;
                long long v90 = 0u;
                long long v91 = 0u;
                id v66 = v18;
                id v19 = v18;
                uint64_t v20 = [v19 countByEnumeratingWithState:&v90 objects:v103 count:16];
                if (v20)
                {
                  uint64_t v21 = v20;
                  uint64_t v22 = *(void *)v91;
                  do
                  {
                    for (uint64_t i = 0; i != v21; ++i)
                    {
                      if (*(void *)v91 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      uint64_t v24 = *(void **)(*((void *)&v90 + 1) + 8 * i);
                      if ([v24 length])
                      {
                        uint64_t v25 = [v24 rangeOfComposedCharacterSequenceAtIndex:0];
                        int v27 = objc_msgSend(v24, "substringWithRange:", v25, v26);
                        BOOL v28 = [v27 stringByConvertingKatakanaToHiragana];

                        uint64_t v29 = [v8 objectForKey:v28];
                        if (!v29)
                        {
                          uint64_t v29 = [MEMORY[0x263EFF9B0] orderedSet];
                          [v8 setObject:v29 forKey:v28];
                        }
                        uint64_t v30 = (void *)[v14 copy];
                        [v30 setAlternativeText:v24];
                        [v29 addObject:v30];
                      }
                    }
                    uint64_t v21 = [v19 countByEnumeratingWithState:&v90 objects:v103 count:16];
                  }
                  while (v21);
                }

                self = v61;
                id v9 = v62;
                uint64_t v12 = v59;
                id v7 = v60;
                uint64_t v11 = v64;
                id v18 = v66;
                id v13 = obj;
              }

              BOOL v15 = v70;
              id v16 = key;
            }
          }
        }
        id v13 = (char *)v13 + 1;
      }
      while (v13 != (id)v11);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v96 objects:v104 count:16];
    }
    while (v11);
  }

  v87[0] = MEMORY[0x263EF8330];
  v87[1] = 3221225472;
  v87[2] = __70__TICandidateSorter_candidatesSortedByYomiFromCandidates_inputString___block_invoke;
  v87[3] = &unk_2650FAAE8;
  id v67 = v7;
  id v88 = v67;
  v89 = theDict;
  uint64_t v31 = MEMORY[0x24563C640](v87);
  uint64_t v32 = [v58 length];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = 0;
    do
    {
      v35 = [v58 substringToIndex:++v34];
      [v8 removeObjectForKey:v35];
    }
    while (v33 != v34);
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v36 = v8;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v83 objects:v102 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v84 != v39) {
          objc_enumerationMutation(v36);
        }
        long long v41 = [v36 objectForKey:*(void *)(*((void *)&v83 + 1) + 8 * j)];
        [v41 sortUsingComparator:v31];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v83 objects:v102 count:16];
    }
    while (v38);
  }

  id v42 = [v36 allKeys];
  v65 = (void *)v31;
  uint64_t v43 = [v42 sortedArrayUsingComparator:v31];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obja = v43;
  keya = (void *)[obja countByEnumeratingWithState:&v79 objects:v101 count:16];
  if (keya)
  {
    uint64_t v71 = *(void *)v80;
    do
    {
      for (uint64_t k = 0; k != keya; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v80 != v71) {
          objc_enumerationMutation(obja);
        }
        uint64_t v45 = *(void *)(*((void *)&v79 + 1) + 8 * (void)k);
        long long v46 = [v36 objectForKey:v45];
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v75 objects:v100 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          v49 = 0;
          uint64_t v50 = *(void *)v76;
          do
          {
            for (uint64_t m = 0; m != v48; ++m)
            {
              if (*(void *)v76 != v50) {
                objc_enumerationMutation(v46);
              }
              long long v52 = *(void **)(*((void *)&v75 + 1) + 8 * m);
              long long v53 = [v52 label];
              if ([v53 _graphemeCount] == 1)
              {
                id v54 = v53;

                v49 = v54;
              }
              else if (v49 && [v53 hasPrefix:v49])
              {
                [v52 setAlternativeText:0];
              }
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v75 objects:v100 count:16];
          }
          while (v48);
        }
        else
        {
          v49 = 0;
        }
        v55 = (void *)[objc_alloc(MEMORY[0x263F7E630]) initWithTitle:v45 candidates:v46];
        [v72 addObject:v55];
      }
      keya = (void *)[obja countByEnumeratingWithState:&v79 objects:v101 count:16];
    }
    while (keya);
  }

  CFRelease(theDict);

  return v72;
}

uint64_t __70__TICandidateSorter_candidatesSortedByYomiFromCandidates_inputString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 label];
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v6 label];
  }
  else
  {
    id v9 = v6;
  }
  uint64_t v10 = v9;
  uint64_t v11 = [v8 substringToIndex:1];
  uint64_t v12 = (__CFString *)[v11 mutableCopy];

  CFStringRef v13 = (const __CFString *)*MEMORY[0x263EFFEF8];
  CFStringTransform(v12, 0, (CFStringRef)*MEMORY[0x263EFFEF8], 1u);
  id v14 = [v10 substringToIndex:1];
  BOOL v15 = (__CFString *)[v14 mutableCopy];

  CFStringTransform(v15, 0, v13, 1u);
  uint64_t v16 = [(__CFString *)v12 compare:v15];
  if (!v16)
  {
    uint64_t v16 = [v8 localizedStandardCompare:v10];
    if (!v16)
    {
      BOOL v17 = [*(id *)(a1 + 32) objectForKey:v8];
      if (!v17)
      {
        BOOL v17 = [v8 _firstGrapheme];
      }
      id v18 = [*(id *)(a1 + 32) objectForKey:v10];
      if (!v18)
      {
        id v18 = [v10 _firstGrapheme];
      }
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v17);
      uint64_t v20 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v18);

      if (Value >= v20)
      {
        if (Value > v20) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = [v8 localizedStandardCompare:v10];
        }
      }
      else
      {
        uint64_t v16 = -1;
      }
    }
  }

  return v16;
}

- (id)candidatesSortedByEmojiFromCandidates:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  id v5 = [v3 predicateWithBlock:&__block_literal_global_6];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  id v7 = objc_alloc(MEMORY[0x263F7E630]);
  id v8 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v6];
  id v9 = (void *)[v7 initWithTitle:0 candidates:v8];
  v12[0] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

  return v10;
}

uint64_t __59__TICandidateSorter_candidatesSortedByEmojiFromCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEmojiCandidate]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isStickerCandidate];
  }

  return v3;
}

- (BOOL)hasCandidatesSortedByFacemarkCategoryFromCandidates:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)hasCandidatesSortedByEmojiCategoryFromCandidates:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "isEmojiCandidate", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)hasCandidatesFromCandidates:(id)a3 inputString:(id)a4 sortedBy:(unint64_t)a5 omittingEmoji:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  switch(a5)
  {
    case 1uLL:
      BOOL v12 = [(TICandidateSorter *)self hasCandidatesSortedByRadicalFromCandidates:v10];
      goto LABEL_6;
    case 2uLL:
      BOOL v12 = [(TICandidateSorter *)self hasCandidatesSortedByYomiFromCandidates:v10 inputString:v11];
      goto LABEL_6;
    case 3uLL:
      BOOL v12 = [(TICandidateSorter *)self hasCandidatesSortedByFacemarkCategoryFromCandidates:v10];
      goto LABEL_6;
    case 4uLL:
      BOOL v12 = [(TICandidateSorter *)self hasCandidatesSortedByEmojiCategoryFromCandidates:v10];
LABEL_6:
      BOOL v13 = v12;
      break;
    default:
      if (v6)
      {
        uint64_t v15 = [v10 _arrayByFilteringEmojiCandidates:0];

        id v10 = (id)v15;
      }
      BOOL v13 = [v10 count] != 0;
      break;
  }

  return v13;
}

- (id)candidatesFromCandidates:(id)a3 inputString:(id)a4 sortedBy:(unint64_t)a5 omittingEmoji:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  switch(a5)
  {
    case 1uLL:
      uint64_t v12 = [(TICandidateSorter *)self candidatesSortedByRadicalFromCandidates:v10];
      break;
    case 2uLL:
      uint64_t v12 = [(TICandidateSorter *)self candidatesSortedByYomiFromCandidates:v10 inputString:v11];
      break;
    case 3uLL:
      uint64_t v12 = [MEMORY[0x263F7E548] candidatesSortedByFacemarkCategoryFromCandidates:v10];
      break;
    case 4uLL:
      uint64_t v12 = [(TICandidateSorter *)self candidatesSortedByEmojiFromCandidates:v10];
      break;
    default:
      uint64_t v12 = [(TICandidateSorter *)self candidatesSortedByDefaultFromCandidates:v10 omittingEmoji:v6];
      break;
  }
  BOOL v13 = (void *)v12;

  return v13;
}

- (__IDXIndex)index
{
  return self->_index;
}

- (void)setIndex:(__IDXIndex *)a3
{
  self->_index = a3;
}

- (__CFDictionary)radicalToSortPosition
{
  return self->_radicalToSortPosition;
}

- (void)setRadicalToSortPosition:(__CFDictionary *)a3
{
  self->_radicalToSortPosition = a3;
}

- (BOOL)liveConversionEnabled
{
  return self->_liveConversionEnabled;
}

- (void)setLiveConversionEnabled:(BOOL)a3
{
  self->_liveConversionEnabled = a3;
}

@end