@interface MecabraWordProperties
+ (__IDXIndex)characterInformationDictionary;
+ (__IDXIndex)codeLookupInformationDictionary;
+ (__IDXIndex)informationDictionaryAtPath:(__CFURL *)a3;
+ (id)searchResultsForString:(id)a3 dictionary:(__IDXIndex *)a4;
+ (id)sortedRadicalList;
- (BOOL)isEmoji;
- (MecabraWordProperties)initWithString:(id)a3 language:(int)a4;
- (NSArray)characterInformation;
- (NSArray)codeLookupInformation;
- (NSString)analysisString;
- (id)bihuaCodes;
- (id)cangjieCodes;
- (id)initialsForStrings:(id)a3;
- (id)isIncludedInCurrentLanguage;
- (id)pinyinInformationForString:(id)a3;
- (id)radicalInformationForString:(id)a3;
- (id)separatedInputCodesForString:(id)a3;
- (id)strokeInformationForString:(id)a3;
- (id)tonesForString:(id)a3;
- (id)valueForKey:(int)a3;
- (id)wubixingCodes;
- (id)wubixingCodesForStandard:(int)a3;
- (id)zhuyinInformationForString:(id)a3;
- (int)language;
- (void)dealloc;
- (void)setAnalysisString:(id)a3;
- (void)setCharacterInformation:(id)a3;
- (void)setCodeLookupInformation:(id)a3;
- (void)setEmoji:(BOOL)a3;
- (void)setLanguage:(int)a3;
@end

@implementation MecabraWordProperties

+ (__IDXIndex)informationDictionaryAtPath:(__CFURL *)a3
{
  if (!a3) {
    return 0;
  }
  v3 = (__IDXIndex *)sub_2161AEC30(0, a3, 0);
  v4 = v3;
  if (v3) {
    sub_2161AEF0C((uint64_t)v3, (const __CFArray *)&unk_26C700040);
  }
  return v4;
}

+ (__IDXIndex)characterInformationDictionary
{
  if (qword_26797DE20 != -1) {
    dispatch_once(&qword_26797DE20, &unk_26C6C9FA0);
  }
  return (__IDXIndex *)qword_26797DE18;
}

+ (__IDXIndex)codeLookupInformationDictionary
{
  if (qword_26797DE30 != -1) {
    dispatch_once(&qword_26797DE30, &unk_26C6CA1E0);
  }
  return (__IDXIndex *)qword_26797DE28;
}

+ (id)searchResultsForString:(id)a3 dictionary:(__IDXIndex *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  if (!a4) {
    return 0;
  }
  if (sub_2161AEE74((uint64_t)a4, (const __CFString *)a3, @"IDXExactMatch")
    && (v14[0] = 0,
        v11[0] = 0,
        v11[1] = 0,
        uint64_t v12 = 0,
        (*(uint64_t (**)(void, void, uint64_t, uint64_t *, uint64_t *))(**((void **)a4 + 2) + 72))(*((void *)a4 + 2), *((void *)a4 + 5), 1, v14, &v13) >= 1))
  {
    sub_2161AF1F8((uint64_t)a4, v14[0], v13, v11, v10);
    id v6 = [NSString alloc];
    id v8 = (id)[v6 initWithBytes:v7 length:v12 encoding:v10[2]];
  }
  else
  {
    id v8 = 0;
  }
  return [(id)objc_msgSend_componentsSeparatedByString_(v8, v5, @";");
}

+ (id)sortedRadicalList
{
  if (qword_26797DE40 != -1) {
    dispatch_once(&qword_26797DE40, &unk_26C6CA240);
  }
  return (id)qword_26797DE38;
}

- (NSArray)characterInformation
{
  result = self->_characterInformation;
  if (!result)
  {
    v5 = [self analysisString:a2];
    uint64_t Character = [v5 firstCharacter:v6, v7];
    uint64_t v11 = [MecabraWordProperties characterInformationDictionary:v9 characterIndex:v10];
    result = (NSArray *)(id)[MecabraWordProperties searchResultsForString:v12 dictionary:Character];
    self->_characterInformation = result;
  }
  return result;
}

- (NSArray)codeLookupInformation
{
  result = self->_codeLookupInformation;
  if (!result)
  {
    uint64_t v5 = [self analysisString:a2];
    uint64_t v8 = [MecabraWordProperties codeLookupInformationDictionary:v6 withDictionary:v7];
    result = (NSArray *)[MecabraWordProperties searchResultsForString:v9 dictionary:v5];
    self->_codeLookupInformation = result;
  }
  return result;
}

- (id)radicalInformationForString:(id)a3
{
  uint64_t v4 = [self a2:a3];
  id v6 = [a3 componentsByLanguage:v5 inLanguage:v4];

  return (id)[v6 v7 v8];
}

- (id)strokeInformationForString:(id)a3
{
  uint64_t v4 = NSNumber;
  uint64_t v5 = [self a2:(uint64_t)a3];
  uint64_t v7 = [a3 componentsByLanguage:v6 language:v5];
  Object = [v7 v8 v9];
  uint64_t v14 = [Object integerValue];

  return [v4 numberWithInteger:v13];
}

- (id)pinyinInformationForString:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = [self a2:(uint64_t)a3];
  id v6 = [a3 componentsByLanguage:v5 withLanguage:v4];
  uint64_t v9 = [MEMORY[0x263EFF980] v7, v8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [v6 countByEnumeratingWithState:v10 objects:v24 count:16];
  if (v11)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v6);
        }
        uint64_t v17 = [*(void **)(*((void *)&v20 + 1) + 8 * v16) pinyinStringFromPinyinWithToneNumber:v12 toneNumber:v13];
        [v9 addObject:v18];
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v6 countByEnumeratingWithState:v12 objects:v24 count:16];
    }
    while (v14);
  }
  return v9;
}

- (id)zhuyinInformationForString:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = [self a2:(uint64_t)a3];
  id v6 = [a3 componentsByLanguage:v5, v4];
  uint64_t v9 = [MEMORY[0x263EFF980] v7, v8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [v6 countByEnumeratingWithState:v10 objects:v23 count:16];
  if (v11)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v6);
        }
        uint64_t v17 = [*(void **)(*((void *)&v19 + 1) + 8 * v16) zhuyinSyllableFromPinyinSyllable:v12, v13];
        if (v17) {
          [v9 addObject:v12];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v6 countByEnumeratingWithState:v12 objects:v23 count:16];
    }
    while (v14);
  }
  return v9;
}

- (id)initialsForStrings:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v5 = [a3 count];
  uint64_t v7 = [v4 setWithCapacity:v6];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:v8 objects:(id *)&v26 count:v30];
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(a3);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend_length(v15, v10, v11))
        {
          uint64_t v16 = [v15 rangeOfComposedCharacterSequenceAtIndex:v10];
          v18 = [v15 substringWithRange:v17];
          long long v21 = [v18 stringByStrippingDiacritics:v19, v20];
          uint64_t v24 = [v21 uppercaseString:v22 withLocale:v23];
          if (v24) {
            [v7 addObject:v10];
          }
        }
      }
      uint64_t v12 = [a3 countByEnumeratingWithState:v10 objects:v30 count:16];
    }
    while (v12);
  }
  return (id)[v7 v10:v11];
}

- (id)tonesForString:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [a3 componentsSeparatedByString:a2];
  uint64_t v5 = [MEMORY[0x263EFF9C0] setWithCapacity:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v3 countByEnumeratingWithState:v6 objects:(void *)&v15 count:16];
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v3);
        }
        uint64_t v13 = [*(void **)(*((void *)&v15 + 1) + 8 * v12) toneFromPinyinSyllableWithNumber:v8, v9];
        if (v13) {
          [v5 addObject:v8];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v3 countByEnumeratingWithState:v8 objects:v15 count:16];
    }
    while (v10);
  }
  return (id)[v5 allObjects];
}

- (id)separatedInputCodesForString:(id)a3
{
  uint64_t v5 = [self a2:a3];

  return (id)[a3 componentsByLanguage:v4, v5];
}

- (MecabraWordProperties)initWithString:(id)a3 language:(int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MecabraWordProperties;
  uint64_t v8 = [(MecabraWordProperties *)&v10 init];
  if (v8)
  {
    v8->_analysisString = (NSString *)[a3 copyWithZone:v6];
    v8->_language = a4;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MecabraWordProperties;
  [(MecabraWordProperties *)&v3 dealloc];
}

- (id)wubixingCodes
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = [self a2:0];
  uint64_t v5 = [MEMORY[0x263EFF980] objc_msgSend_array:v3, v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v2 countByEnumeratingWithState:v6 objects:&v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v2);
        }
        InputKeyFromASCIIString = MecabraInputKeyPropertiesCreateInputKeyFromASCIIString(0xAu, *(void **)(*((void *)&v15 + 1) + 8 * v10));
        [v5 addObject:InputKeyFromASCIIString];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v2 countByEnumeratingWithState:v13 objects:v19 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)bihuaCodes
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = [self codeLookupInformation:a2 with:v2];
  uint64_t v6 = [v4 objectAtIndex:v5];
  uint64_t v8 = [self separatedInputCodesForString:v7];
  uint64_t v11 = [MEMORY[0x263EFF980] v9, v10];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v13 = [v8 countByEnumeratingWithState:v12 objects:(id *)&v22 count:16];
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v8);
        }
        uint64_t v19 = [*(void **)(*((void *)&v22 + 1) + 8 * v18) strokeStringFromNumberString:v14, v15];
        [v11 addObject:v20];
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v8 countByEnumeratingWithState:v14 objects:(void *)&v22 count:16];
    }
    while (v16);
  }
  return v11;
}

- (id)cangjieCodes
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = [self objc_msgSend_codeLookupInformation:a2 v2];
  uint64_t v6 = [v4 objectAtIndex:2];
  uint64_t v8 = [self separatedInputCodesForString:v7];
  uint64_t v11 = [MEMORY[0x263EFF980] v9, v10];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = [v8 countByEnumeratingWithState:v12 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v8);
        }
        InputKeyFromASCIIString = MecabraInputKeyPropertiesCreateInputKeyFromASCIIString(9u, *(void **)(*((void *)&v21 + 1) + 8 * v16));
        [v11 addObject:InputKeyFromASCIIString];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v8 countByEnumeratingWithState:v19 objects:v25 count:16];
    }
    while (v14);
  }
  return v11;
}

- (id)isIncludedInCurrentLanguage
{
  int v4 = [self a2:v2];
  uint64_t v7 = (void *)MEMORY[0x263EFFA88];
  if (v4 == 2)
  {
    long long v22 = [self characterInformation:v5 character:v6];
    long long v24 = [v22 objectAtIndex:3];
    int v21 = [v24 v25:v26];
    long long v29 = [self v27:v28];
    uint64_t v31 = [v29 objectAtIndex:v30];
    int v13 = [v31 v32:v33];
  }
  else
  {
    if (v4 != 1) {
      return v7;
    }
    uint64_t v8 = [self characterInformation:v5 character:v6];
    uint64_t v10 = [v8 objectAtIndex:v9];
    int v13 = [v10 v11:v12];
    uint64_t v16 = [self characterInformation:v14 atIndex:v15];
    uint64_t v18 = [v16 objectAtIndex:v17];
    int v21 = [v18 v19:v20];
  }
  v34 = (void *)MEMORY[0x263EFFA80];
  if (v13) {
    v34 = v7;
  }
  if (v21) {
    return v34;
  }
  return v7;
}

- (id)valueForKey:(int)a3
{
  switch(a3)
  {
    case 0:
      int v4 = [self a2:*(uint64_t *)&a3];
      uint64_t v6 = [v4 objectAtIndex:v5];
      return (id)MEMORY[0x270F9A6D0](self, sel_radicalInformationForString_, v6);
    case 1:
      uint64_t v7 = [self characterInformation:a2 character:a3];
      uint64_t v9 = [v7 objectAtIndex:v8];
      return (id)MEMORY[0x270F9A6D0](self, sel_strokeInformationForString_, v9);
    case 2:
      uint64_t v10 = [self characterInformation:a2 character:a3];
      uint64_t v12 = [v10 objectAtIndex:2];
      goto LABEL_37;
    case 3:
      uint64_t v14 = [self characterInformation:a2 characterID:a3];
      uint64_t v16 = [v14 objectAtIndex:v15];
      goto LABEL_41;
    case 4:
      uint64_t v18 = [self characterInformation:a2 withOptions:a3];
      uint64_t v20 = [v18 objectAtIndex:v19];
      uint64_t v22 = [self pinyinInformationForString:v21 withPinyinFormat:v20];
      goto LABEL_13;
    case 5:
      long long v23 = [self a2:*(uint64_t *)&a3];
      uint64_t v25 = [v23 objectAtIndex:v24];
      uint64_t v22 = [self zhuyinInformationForString:v26 withOptions:v25];
LABEL_13:
      return (id)MEMORY[0x270F9A6D0](self, sel_initialsForStrings_, v22);
    case 6:
      uint64_t v27 = [self characterInformation:a2 characterIndex:a3];
      uint64_t v29 = [v27 objectAtIndex:v28];
      return (id)MEMORY[0x270F9A6D0](self, sel_tonesForString_, v29);
    case 7:
      return (id)MEMORY[0x270F9A6D0](self, sel_wubixingCodes, *(void *)&a3);
    case 8:
      return [self wubixingCodesForStandard:];
    case 9:
      return (id)MEMORY[0x270F9A6D0](self, sel_bihuaCodes, *(void *)&a3);
    case 10:
      v30 = [self a2:a3];
      uint64_t v32 = [v30 objectAtIndex:v31];
      goto LABEL_33;
    case 11:
      return (id)MEMORY[0x270F9A6D0](self, sel_cangjieCodes, *(void *)&a3);
    case 12:
      v34 = [self a2:a3];
      uint64_t v32 = [v34 objectAtIndex:2];
LABEL_33:
      return (id)[self separatedInputCodesForString:v33];
    case 13:
      v36 = [self a2:a3];
      uint64_t v12 = [v36 objectAtIndex:3];
LABEL_37:
      return (id)[self pinyinInformationForString:v13 withOptions:v12];
    case 14:
      v38 = [self a2:a3];
      uint64_t v16 = [v38 objectAtIndex:3];
LABEL_41:
      return [self zhuyinInformationForString:v17 withTone:v16];
    case 15:
      v40 = [self a2:*(uint64_t *)&a3];
      uint64_t v42 = 3;
      goto LABEL_46;
    case 16:
      v40 = [self a2:*(uint64_t *)&a3];
      uint64_t v42 = 4;
LABEL_46:
      id result = (id)[v40 objectAtIndex:v41];
      break;
    case 17:
      id result = (id)MEMORY[0x270F9A6D0](self, sel_isIncludedInCurrentLanguage, *(void *)&a3);
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (id)wubixingCodesForStandard:(int)a3
{
  int v4 = [self objc_msgSend_codeLookupInformation:a2:a3];
  uint64_t v6 = [v4 objectAtIndex:0];
  if (!v6) {
    return 0;
  }
  uint64_t v8 = [v6 componentsSeparatedByString:v7];
  if (objc_msgSend_count(v8, v9, v10) != 1)
  {
    if (objc_msgSend_count(v8, v11, v12) > (unint64_t)a3)
    {
      int v13 = [v8 objectAtIndexedSubscript:v15];
      goto LABEL_6;
    }
    return 0;
  }
  int v13 = [v8 objectAtIndexedSubscript:v11];
LABEL_6:

  return [v13 componentsSeparatedByString:@" "];
}

- (NSString)analysisString
{
  return self->_analysisString;
}

- (void)setAnalysisString:(id)a3
{
}

- (void)setCharacterInformation:(id)a3
{
}

- (void)setCodeLookupInformation:(id)a3
{
}

- (BOOL)isEmoji
{
  return self->_emoji;
}

- (void)setEmoji:(BOOL)a3
{
  self->_emojuint64_t i = a3;
}

- (int)language
{
  return self->_language;
}

- (void)setLanguage:(int)a3
{
  self->_language = a3;
}

@end