@interface CIMCandidateData
+ (BOOL)shouldShowZhuyinSortingMethod;
+ (id)sortTitleFromSortingMethod:(int)a3;
- (CIMCandidateData)init;
- (CIMCandidateData)initWithInputMode:(id)a3;
- (NSArray)storedCandidates;
- (NSMutableDictionary)candidateInfoCache;
- (TIInputMode)inputMode;
- (id)candidateGroupsFromDictionary:(id)a3 sortedKeys:(id)a4;
- (id)candidatesSortedByEmoji:(id)a3;
- (id)candidatesSortedByFrequency:(id)a3 omittingEmoji:(BOOL)a4;
- (id)candidatesSortedByMethod:(int)a3 omittingEmoji:(BOOL)a4;
- (id)candidatesSortedByPinyinOrZhuyin:(id)a3 simplified:(BOOL)a4 zhuyin:(BOOL)a5;
- (id)candidatesSortedByRadical:(id)a3 simplified:(BOOL)a4 collationLocale:(id)a5;
- (id)candidatesSortedByStrokes:(id)a3 simplified:(BOOL)a4;
- (id)candidatesSortedByWubi:(id)a3 omittingEmoji:(BOOL)a4;
- (id)wordPropertyDictionaryForCandidates:(id)a3 isSimplified:(BOOL)a4;
- (int)sortingMethod;
- (void)addCharacter:(id)a3 groupLabel:(id)a4 dictionary:(id)a5 isSecondary:(BOOL)a6;
- (void)clearCache;
- (void)setCandidateInfoCache:(id)a3;
- (void)setSortingMethod:(int)a3;
- (void)setStoredCandidates:(id)a3;
- (void)sortCharactersByStrokeCount:(id)a3 wordPropertiesDictionary:(id)a4;
@end

@implementation CIMCandidateData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateInfoCache, 0);
  objc_storeStrong((id *)&self->_storedCandidates, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (void)setCandidateInfoCache:(id)a3
{
}

- (NSMutableDictionary)candidateInfoCache
{
  return self->_candidateInfoCache;
}

- (void)setStoredCandidates:(id)a3
{
}

- (NSArray)storedCandidates
{
  return self->_storedCandidates;
}

- (void)setSortingMethod:(int)a3
{
  self->_sortingMethod = a3;
}

- (int)sortingMethod
{
  return self->_sortingMethod;
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (id)candidatesSortedByMethod:(int)a3 omittingEmoji:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(CIMCandidateData *)self inputMode];
  SetLocaleFromInputMode(v7);

  v8 = GetCurrentLocale();
  v9 = [v8 localeIdentifier];

  if (([v9 isEqualToString:@"zh-Hans"] & 1) == 0)
  {
    if (([v9 isEqualToString:@"zh-Hant"] & 1) != 0
      || ([v9 isEqualToString:@"yue-Hant"] & 1) != 0)
    {
      uint64_t v10 = 0;
      v11 = @"zh@collation=unihan";
      goto LABEL_7;
    }
    NSLog(&cfstr_UnknownLocaleI.isa, v9);
  }
  uint64_t v10 = 1;
  v11 = @"zh@collation=stroke";
LABEL_7:
  v12 = (void *)MEMORY[0x2611ED640]();
  switch(a3)
  {
    case 2:
      v13 = [(CIMCandidateData *)self storedCandidates];
      uint64_t v14 = [(CIMCandidateData *)self candidatesSortedByRadical:v13 simplified:v10 collationLocale:v11];
      break;
    case 3:
      v13 = [(CIMCandidateData *)self storedCandidates];
      uint64_t v14 = [(CIMCandidateData *)self candidatesSortedByStrokes:v13 simplified:v10];
      break;
    case 4:
      v13 = [(CIMCandidateData *)self storedCandidates];
      v15 = self;
      v16 = v13;
      uint64_t v17 = v10;
      uint64_t v18 = 0;
      goto LABEL_13;
    case 5:
      v13 = [(CIMCandidateData *)self storedCandidates];
      v15 = self;
      v16 = v13;
      uint64_t v17 = 0;
      uint64_t v18 = 1;
LABEL_13:
      uint64_t v14 = [(CIMCandidateData *)v15 candidatesSortedByPinyinOrZhuyin:v16 simplified:v17 zhuyin:v18];
      break;
    case 6:
      v13 = [(CIMCandidateData *)self storedCandidates];
      uint64_t v14 = [(CIMCandidateData *)self candidatesSortedByEmoji:v13];
      break;
    case 7:
      v19 = (void *)MEMORY[0x263F7E548];
      v13 = [(CIMCandidateData *)self storedCandidates];
      uint64_t v14 = [v19 candidatesSortedByFacemarkCategoryFromCandidates:v13];
      break;
    case 8:
      v13 = [(CIMCandidateData *)self storedCandidates];
      uint64_t v14 = [(CIMCandidateData *)self candidatesSortedByWubi:v13 omittingEmoji:v4];
      break;
    default:
      v13 = [(CIMCandidateData *)self storedCandidates];
      uint64_t v14 = [(CIMCandidateData *)self candidatesSortedByFrequency:v13 omittingEmoji:v4];
      break;
  }
  v20 = (void *)v14;

  return v20;
}

- (id)candidatesSortedByWubi:(id)a3 omittingEmoji:(BOOL)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  if (a4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v6 = [a3 _arrayByFilteringEmojiCandidates:v5];
  id v7 = objc_alloc(MEMORY[0x263F7E630]);
  v8 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v6];
  v9 = (void *)[v7 initWithTitle:0 candidates:v8];
  v12[0] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

  return v10;
}

- (id)candidatesSortedByPinyinOrZhuyin:(id)a3 simplified:(BOOL)a4 zhuyin:(BOOL)a5
{
  BOOL v35 = a5;
  BOOL v5 = a4;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v38 = [(CIMCandidateData *)self wordPropertyDictionaryForCandidates:v7 isSimplified:v5];
  v8 = [MEMORY[0x263EFF9A0] dictionary];
  v9 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v7;
  uint64_t v39 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v56 != v37) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v41 = [v11 label];
        objc_msgSend(v38, "objectForKeyedSubscript:");

        v12 = MecabraWordPropertiesGetProperty();
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v61 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v52 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v51 + 1) + 8 * j);
              if ([v17 length])
              {
                [(CIMCandidateData *)self addCharacter:v11 groupLabel:v17 dictionary:v8 isSecondary:0];
                [v9 addObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v51 objects:v61 count:16];
          }
          while (v14);
        }
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v39);
  }

  uint64_t v18 = [(CIMCandidateData *)self inputMode];
  SetLocaleFromInputMode(v18);

  if (v35) {
    v19 = &__block_literal_global_71;
  }
  else {
    v19 = &__block_literal_global_73;
  }
  v20 = (void *)MEMORY[0x2611ED830](v19);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v21 = v8;
  uint64_t v42 = [v21 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v42)
  {
    uint64_t v40 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v48 != v40) {
          objc_enumerationMutation(v21);
        }
        v23 = [v21 objectForKey:*(void *)(*((void *)&v47 + 1) + 8 * k)];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v59 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v44;
          do
          {
            for (uint64_t m = 0; m != v25; ++m)
            {
              if (*(void *)v44 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = [v23 objectForKey:*(void *)(*((void *)&v43 + 1) + 8 * m)];
              [v28 sortUsingComparator:v20];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v59 count:16];
          }
          while (v25);
        }
      }
      uint64_t v42 = [v21 countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v42);
  }

  v29 = &selRef_traditionalChineseZhuyinCompare_;
  if (!v35) {
    v29 = &selRef_chinesePinyinCompare_;
  }
  v30 = *v29;
  v31 = [v9 array];
  v32 = [v31 sortedArrayUsingSelector:v30];

  v33 = [(CIMCandidateData *)self candidateGroupsFromDictionary:v21 sortedKeys:v32];

  return v33;
}

uint64_t __71__CIMCandidateData_candidatesSortedByPinyinOrZhuyin_simplified_zhuyin___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 candidate];
  v6 = [v4 candidate];

  uint64_t v7 = [v5 chinesePinyinCompare:v6];
  return v7;
}

uint64_t __71__CIMCandidateData_candidatesSortedByPinyinOrZhuyin_simplified_zhuyin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 candidate];
  v6 = [v4 candidate];

  uint64_t v7 = [v5 traditionalChineseZhuyinCompare:v6];
  return v7;
}

- (id)candidatesSortedByStrokes:(id)a3 simplified:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v22 = self;
  uint64_t v7 = [(CIMCandidateData *)self wordPropertyDictionaryForCandidates:v6 isSimplified:v4];
  id v21 = [MEMORY[0x263EFF9A0] dictionary];
  v8 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v15 = [v14 label];
        [v7 objectForKeyedSubscript:v15];

        v16 = MecabraWordPropertiesGetProperty();
        if ([v16 integerValue] >= 1)
        {
          uint64_t v17 = [v16 stringValue];
          [(CIMCandidateData *)v22 addCharacter:v14 groupLabel:v17 dictionary:v21 isSecondary:0];
          [v8 addObject:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  [v8 sortUsingComparator:&__block_literal_global_69];
  uint64_t v18 = [v8 array];
  v19 = [(CIMCandidateData *)v22 candidateGroupsFromDictionary:v21 sortedKeys:v18];

  return v19;
}

uint64_t __57__CIMCandidateData_candidatesSortedByStrokes_simplified___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 integerValue];
  unint64_t v6 = [v4 integerValue];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (id)candidatesSortedByRadical:(id)a3 simplified:(BOOL)a4 collationLocale:(id)a5
{
  BOOL v5 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = [(CIMCandidateData *)self wordPropertyDictionaryForCandidates:v7 isSimplified:v5];
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [v14 label];
        [v8 objectForKeyedSubscript:v15];

        v16 = MecabraWordPropertiesGetProperty();
        -[CIMCandidateData addCharacter:groupLabel:dictionary:isSecondary:](self, "addCharacter:groupLabel:dictionary:isSecondary:", v14, v16, v9, [(id)MecabraWordPropertiesGetProperty() BOOLValue] ^ 1);
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  [(CIMCandidateData *)self sortCharactersByStrokeCount:v9 wordPropertiesDictionary:v8];
  uint64_t v17 = [(CIMCandidateData *)self candidateGroupsFromDictionary:v9 sortedKeys:MecabraWordPropertiesGetSortedRadicalList()];

  return v17;
}

- (id)candidatesSortedByEmoji:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_197];
  BOOL v5 = [v3 objectsAtIndexes:v4];

  id v6 = objc_alloc(MEMORY[0x263F7E630]);
  id v7 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v5];
  v8 = (void *)[v6 initWithTitle:0 candidates:v7];
  v11[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  return v9;
}

uint64_t __44__CIMCandidateData_candidatesSortedByEmoji___block_invoke(uint64_t a1, void *a2)
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

- (id)candidatesSortedByFrequency:(id)a3 omittingEmoji:(BOOL)a4
{
  BOOL v4 = a4;
  v14[1] = *MEMORY[0x263EF8340];
  BOOL v5 = [a3 _sortedArrayByFrequency];
  id v6 = v5;
  if (v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 4;
  }
  v8 = [v5 _arrayByFilteringEmojiCandidates:v7];
  id v9 = objc_alloc(MEMORY[0x263F7E630]);
  uint64_t v10 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v8];
  uint64_t v11 = (void *)[v9 initWithTitle:0 candidates:v10];
  v14[0] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

  return v12;
}

- (id)candidateGroupsFromDictionary:(id)a3 sortedKeys:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v5 = a4;
  id v22 = [MEMORY[0x263EFF980] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v10 = [v24 objectForKey:v9];
        uint64_t v11 = [MEMORY[0x263EFF980] array];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v12 = [&unk_270B8AF28 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(&unk_270B8AF28);
              }
              v16 = [v10 objectForKey:*(void *)(*((void *)&v25 + 1) + 8 * j)];
              if ([v16 count]) {
                [v11 addObjectsFromArray:v16];
              }
            }
            uint64_t v13 = [&unk_270B8AF28 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v13);
        }
        if ([v11 count])
        {
          id v17 = objc_alloc(MEMORY[0x263F7E630]);
          uint64_t v18 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v11];
          v19 = (void *)[v17 initWithTitle:v9 candidates:v18];

          [v22 addObject:v19];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  return v22;
}

- (void)sortCharactersByStrokeCount:(id)a3 wordPropertiesDictionary:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v5;
  uint64_t v15 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(obj);
        }
        v8 = objc_msgSend(obj, "objectForKey:", *(void *)(*((void *)&v23 + 1) + 8 * v7), v14);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [v8 objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * v12)];
              v17[0] = MEMORY[0x263EF8330];
              v17[1] = 3221225472;
              v17[2] = __73__CIMCandidateData_sortCharactersByStrokeCount_wordPropertiesDictionary___block_invoke;
              v17[3] = &unk_265535250;
              id v18 = v6;
              [v13 sortUsingComparator:v17];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v15);
      uint64_t v15 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v15);
  }
}

uint64_t __73__CIMCandidateData_sortCharactersByStrokeCount_wordPropertiesDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 candidate];
  [v5 objectForKeyedSubscript:v7];

  v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v6 candidate];

  [v8 objectForKeyedSubscript:v9];
  unint64_t v10 = [(id)MecabraWordPropertiesGetProperty() integerValue];
  unint64_t v11 = [(id)MecabraWordPropertiesGetProperty() integerValue];
  if (v10 < v11) {
    return -1;
  }
  else {
    return v10 > v11;
  }
}

- (id)wordPropertyDictionaryForCandidates:(id)a3 isSimplified:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "label", (void)v14);
        uint64_t v12 = (void *)MecabraWordPropertiesCreate();
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)addCharacter:(id)a3 groupLabel:(id)a4 dictionary:(id)a5 isSecondary:(BOOL)a6
{
  BOOL v6 = a6;
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v10 objectForKey:v9];
    if (!v12)
    {
      uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
      [v11 setObject:v12 forKey:v9];
    }
    uint64_t v13 = [NSNumber numberWithBool:v6];
    long long v14 = [v12 objectForKey:v13];
    if (!v14)
    {
      long long v14 = [MEMORY[0x263EFF980] array];
      [v12 setObject:v14 forKey:v13];
    }
    [v14 addObject:v15];
  }
}

- (void)clearCache
{
  id v2 = [(CIMCandidateData *)self candidateInfoCache];
  [v2 removeAllObjects];
}

- (CIMCandidateData)initWithInputMode:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CIMCandidateData;
  BOOL v6 = [(CIMCandidateData *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputMode, a3);
    [(CIMCandidateData *)v7 setSortingMethod:1];
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    [(CIMCandidateData *)v7 setCandidateInfoCache:v8];
  }
  return v7;
}

- (CIMCandidateData)init
{
  v3.receiver = self;
  v3.super_class = (Class)CIMCandidateData;
  return [(CIMCandidateData *)&v3 init];
}

+ (BOOL)shouldShowZhuyinSortingMethod
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF960] currentLocale];
  objc_super v3 = [v2 objectForKey:*MEMORY[0x263EFF4D0]];
  char v4 = [v3 isEqualToString:@"TW"];

  if (v4) {
    return 1;
  }
  BOOL v6 = [MEMORY[0x263F7E570] sharedInputModeController];
  uint64_t v7 = [v6 enabledInputModeIdentifiers];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = TIInputModeGetBaseLanguage();
        if (objc_msgSend(v13, "isEqualToString:", @"zh", v17))
        {
          long long v14 = TIInputModeGetVariant();
          char v15 = [v14 isEqualToString:@"Zhuyin"];

          if (v15)
          {

            BOOL v5 = 1;
            goto LABEL_14;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_14:

  return v5;
}

+ (id)sortTitleFromSortingMethod:(int)a3
{
  if ((a3 - 1) > 7) {
    return 0;
  }
  else {
    return off_2655352B0[a3 - 1];
  }
}

@end