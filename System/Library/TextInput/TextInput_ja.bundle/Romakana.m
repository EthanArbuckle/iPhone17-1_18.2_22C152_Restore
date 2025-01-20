@interface Romakana
+ ($9E7D8278DAE3F325C9F19E83C3CADDC5)splitRomaji:(id)a3 at:(unint64_t)a4;
+ (id)hiraganaString:(id)a3 mappingArray:(id)a4;
+ (id)kanaSymbol:(id)a3;
+ (id)romajiString:(id)a3;
- (id)adjustIncompleteRomaji:(id)a3;
- (id)hiraganaFromRomaji:(id)a3 stripIncompleteRomajiAtEnd:(BOOL)a4 strippedLength:(unint64_t *)a5;
@end

@implementation Romakana

+ (id)romajiString:(id)a3
{
  v3 = (void *)MecabraReverseConvertedRomajiCreateFromKanaString();
  return v3;
}

+ (id)hiraganaString:(id)a3 mappingArray:(id)a4
{
  id v4 = a4;
  MecabraConvertedKanaCreateFromRomajiString();
  v5 = MecabraConvertedKanaGetKana();
  v6 = MecabraConvertedKanaGetAlignment();
  v7 = [v6 allKeys];
  v21 = [v7 sortedArrayUsingSelector:sel_compare_];

  id v22 = v5;
  if ([v5 length])
  {
    unint64_t v8 = 0;
    uint64_t v20 = MEMORY[0x263EF8330];
    do
    {
      v23[0] = v20;
      v23[1] = 3221225472;
      v23[2] = __40__Romakana_hiraganaString_mappingArray___block_invoke;
      v23[3] = &__block_descriptor_40_e35_B24__0__NSNumber_8__NSDictionary_16l;
      v23[4] = v8;
      v9 = [MEMORY[0x263F08A98] predicateWithBlock:v23];
      v10 = [v21 filteredArrayUsingPredicate:v9];
      v11 = [v10 firstObject];

      v12 = [NSNumber numberWithInteger:v8];
      v13 = [v6 objectForKeyedSubscript:v12];
      uint64_t v14 = [v13 integerValue];

      v15 = [v6 objectForKeyedSubscript:v11];
      uint64_t v16 = [v15 integerValue];

      v17 = [NSNumber numberWithInteger:v16 - v14];
      [v4 addObject:v17];

      for (uint64_t i = v8 + 1; i < [v11 integerValue]; ++i)
        [v4 addObject:&unk_26F5E10B8];
      unint64_t v8 = [v11 integerValue];
    }
    while (v8 < [v22 length]);
  }
  MecabraConvertedKanaRelease();

  return v22;
}

BOOL __40__Romakana_hiraganaString_mappingArray___block_invoke(uint64_t a1, void *a2)
{
  return [a2 integerValue] > *(void *)(a1 + 32);
}

+ (id)kanaSymbol:(id)a3
{
  id v3 = a3;
  id v4 = (const char *)[v3 UTF8String];
  uint64_t v5 = [v3 lengthOfBytesUsingEncoding:4];
  if (v5)
  {
    size_t v6 = v5;
    v7 = "-";
    unint64_t v8 = off_2650FA310;
    while (strncmp(v4, v7, v6))
    {
      v9 = *v8;
      v8 += 2;
      v7 = v9;
      if (!v9) {
        goto LABEL_5;
      }
    }
    id v10 = [NSString stringWithUTF8String:*(v8 - 1)];
  }
  else
  {
LABEL_5:
    id v10 = v3;
  }
  v11 = v10;

  return v11;
}

+ ($9E7D8278DAE3F325C9F19E83C3CADDC5)splitRomaji:(id)a3 at:(unint64_t)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  size_t v6 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  v55 = v5;
  v7 = +[Romakana hiraganaString:v5 mappingArray:v6];
  unint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "length"));
  v9 = [NSNumber numberWithUnsignedInt:0];
  [v8 addObject:v9];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v57 != v14) {
          objc_enumerationMutation(v10);
        }
        v13 += (int)[*(id *)(*((void *)&v56 + 1) + 8 * i) intValue];
        uint64_t v16 = [NSNumber numberWithUnsignedInteger:v13];
        [v8 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v12);
  }

  if ([v8 count] > a4)
  {
    v17 = [v8 objectAtIndexedSubscript:a4];
    uint64_t v18 = [v17 unsignedIntegerValue];

    v19 = v55;
    if (!a4) {
      goto LABEL_25;
    }
    if ([v8 count] > a4 + 1)
    {
      uint64_t v20 = [v8 objectAtIndexedSubscript:a4 + 1];
      uint64_t v21 = v18;
      int v22 = [v20 unsignedIntValue];
      v23 = [v8 objectAtIndexedSubscript:a4];
      int v24 = [v23 unsignedIntValue];

      BOOL v25 = v22 == v24;
      uint64_t v18 = v21;
      unint64_t v26 = a4 + 1;
      if (v25)
      {
        v27 = [v8 objectAtIndexedSubscript:a4 - 1];
        v53 = objc_msgSend(v55, "substringToIndex:", objc_msgSend(v27, "unsignedIntValue"));

        v28 = objc_msgSend(v7, "substringWithRange:", a4 - 1, 1);
        v29 = +[Romakana romajiString:v28];

        v30 = objc_msgSend(v7, "substringWithRange:", a4, 1);
        v31 = +[Romakana romajiString:v30];

        v32 = [v8 objectAtIndexedSubscript:v26];
        v33 = objc_msgSend(v55, "substringFromIndex:", objc_msgSend(v32, "unsignedIntValue"));

        v34 = v53;
        id v35 = [v53 stringByAppendingString:v29];
        uint64_t v36 = [v31 stringByAppendingString:v33];

LABEL_17:
        goto LABEL_27;
      }
    }
    unint64_t v37 = a4 - 1;
    v38 = objc_msgSend(v7, "substringWithRange:", a4 - 1, 1);
    int v39 = [v38 isEqualToString:@"ん"];

    if (v39)
    {
      v40 = [v8 objectAtIndexedSubscript:a4 - 1];
      v34 = objc_msgSend(v55, "substringToIndex:", objc_msgSend(v40, "unsignedIntValue"));

      v41 = objc_msgSend(v7, "substringWithRange:", v37, 1);
      v29 = +[Romakana romajiString:v41];

      uint64_t v36 = [v55 substringFromIndex:v18];
      id v35 = [v34 stringByAppendingString:v29];
      goto LABEL_17;
    }
    v42 = objc_msgSend(v7, "substringWithRange:", a4 - 1, 1);
    int v43 = [v42 isEqualToString:@"っ"];

    if (v43)
    {
      uint64_t v54 = v18;
      id v35 = [MEMORY[0x263F089D8] stringWithCapacity:v18];
      uint64_t v44 = 0;
      do
      {
        v45 = objc_msgSend(v7, "substringWithRange:", v44, 1);
        uint64_t v46 = +[Romakana romajiString:v45];
        v47 = (void *)v46;
        if (v46) {
          v48 = (void *)v46;
        }
        else {
          v48 = v45;
        }
        [v35 appendString:v48];

        ++v44;
      }
      while (a4 != v44);
      v49 = v55;
      uint64_t v50 = v54;
    }
    else
    {
LABEL_25:
      id v35 = [v55 substringToIndex:v18];
      v49 = v55;
      uint64_t v50 = v18;
    }
    uint64_t v36 = [v49 substringFromIndex:v50];
    goto LABEL_27;
  }
  v19 = v55;
  id v35 = v55;
  uint64_t v36 = 0;
LABEL_27:

  v51 = v35;
  v52 = (void *)v36;
  result.var1 = v52;
  result.var0 = v51;
  return result;
}

- (id)hiraganaFromRomaji:(id)a3 stripIncompleteRomajiAtEnd:(BOOL)a4 strippedLength:(unint64_t *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  MecabraConvertedKanaCreateFromRomajiString();
  unint64_t v8 = (void *)[(id)MecabraConvertedKanaGetKana() mutableCopy];
  v9 = MecabraConvertedKanaGetAlignment();
  uint64_t v10 = [v8 length];
  uint64_t v11 = v10 - 1;
  if (v10 - 1 < 0)
  {
    unint64_t v12 = 0;
    if (a5) {
LABEL_7:
    }
      *a5 = v12;
  }
  else
  {
    unint64_t v21 = v10;
    BOOL v22 = v6;
    unint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = objc_msgSend(v8, "characterAtIndex:", v11, v21);
      uint64_t v14 = [MEMORY[0x263F08708] alphabetCharacterSet];
      LODWORD(v13) = [v14 characterIsMember:v13];

      if (!v13) {
        break;
      }
      v15 = [NSNumber numberWithInteger:v11];
      uint64_t v16 = [v9 objectForKey:v15];
      v17 = objc_msgSend(v7, "substringWithRange:", objc_msgSend(v16, "integerValue"), 1);

      objc_msgSend(v8, "replaceCharactersInRange:withString:", v11, 1, v17);
      ++v12;

      if (--v11 == -1)
      {
        unint64_t v12 = v21;
        break;
      }
    }
    BOOL v6 = v22;
    if (a5) {
      goto LABEL_7;
    }
  }
  MecabraConvertedKanaRelease();
  if (v6)
  {
    objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - v12);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = v8;
  }
  v19 = v18;

  return v19;
}

- (id)adjustIncompleteRomaji:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v5 = [(Romakana *)self hiraganaFromRomaji:v4 stripIncompleteRomajiAtEnd:0 strippedLength:&v16];
  BOOL v6 = v5;
  if (v16 == 1)
  {
    uint64_t v7 = [v5 length];
    unint64_t v8 = [v6 substringFromIndex:v7 - v16];
    if ([v8 isEqualToString:@"n"])
    {
      uint64_t v9 = [v4 stringByAppendingString:@"n"];
    }
    else
    {
      consonantsCharacterSet = self->_consonantsCharacterSet;
      if (!consonantsCharacterSet)
      {
        uint64_t v11 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"bcdfghjklmpqrstvwxyz"];
        unint64_t v12 = self->_consonantsCharacterSet;
        self->_consonantsCharacterSet = v11;

        consonantsCharacterSet = self->_consonantsCharacterSet;
      }
      [v8 rangeOfCharacterFromSet:consonantsCharacterSet];
      if (!v13) {
        goto LABEL_9;
      }
      uint64_t v9 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, @"xtu");
    }
    uint64_t v14 = (void *)v9;

    id v4 = v14;
LABEL_9:
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end