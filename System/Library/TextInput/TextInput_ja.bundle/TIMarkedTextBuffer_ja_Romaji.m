@interface TIMarkedTextBuffer_ja_Romaji
- (BOOL)hardwareKeyboard;
- (NSMutableArray)externalIndexToInternalIndexMappingArray;
- (NSString)externalString;
- (NSString)internalString;
- (TIMarkedTextBuffer_ja_Romaji)initWithInternalString:(id)a3;
- (int64_t)externalIndex;
- (int64_t)internalIndex;
- (void)clear;
- (void)deleteFromInput:(int64_t *)a3 newInput:(id *)a4 inputIndex:(int64_t *)a5;
- (void)setExternalIndex:(int64_t)a3;
- (void)setExternalInputIndex:(int64_t)a3;
- (void)setHardwareKeyboard:(BOOL)a3;
- (void)setInternalString:(id)a3 withInputIndex:(int64_t)a4;
- (void)updateStateWithInputIndex:(int64_t)a3;
@end

@implementation TIMarkedTextBuffer_ja_Romaji

- (TIMarkedTextBuffer_ja_Romaji)initWithInternalString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIMarkedTextBuffer_ja_Romaji;
  v5 = [(TIMarkedTextBuffer_ja_Romaji *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    externalIndexToInternalIndexMappingArray = v5->_externalIndexToInternalIndexMappingArray;
    v5->_externalIndexToInternalIndexMappingArray = (NSMutableArray *)v6;

    -[TIMarkedTextBuffer_ja_Romaji setInternalString:withInputIndex:](v5, "setInternalString:withInputIndex:", v4, [v4 length]);
  }

  return v5;
}

- (void)setInternalString:(id)a3 withInputIndex:(int64_t)a4
{
  objc_storeStrong((id *)&self->_internalString, a3);
  [(TIMarkedTextBuffer_ja_Romaji *)self updateStateWithInputIndex:a4];
}

- (void)updateStateWithInputIndex:(int64_t)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v5 = [(TIMarkedTextBuffer_ja_Romaji *)self internalString];
  externalString = self->_externalString;
  self->_externalString = 0;

  v7 = [(TIMarkedTextBuffer_ja_Romaji *)self externalIndexToInternalIndexMappingArray];
  [v7 removeAllObjects];

  [(TIMarkedTextBuffer_ja_Romaji *)self setExternalInputIndex:0];
  if (v5 && [v5 length])
  {
    v8 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
    if (a3 < 1)
    {
      v11 = &stru_26F5DD710;
    }
    else
    {
      objc_super v9 = [v5 substringToIndex:a3];
      v10 = [v9 lowercaseString];
      v11 = +[Romakana hiraganaString:v10 mappingArray:v8];
    }
    v30 = v5;
    if ([v5 length] <= (unint64_t)a3)
    {
      v14 = &stru_26F5DD710;
    }
    else
    {
      v12 = [v5 substringFromIndex:a3];
      v13 = [v12 lowercaseString];
      v14 = +[Romakana hiraganaString:v13 mappingArray:v8];
    }
    v28 = v14;
    v29 = v11;
    v15 = [(__CFString *)v11 stringByAppendingString:v14];
    v16 = self->_externalString;
    self->_externalString = v15;

    self->_externalIndex = 0x7FFFFFFFFFFFFFFFLL;
    externalIndexToInternalIndexMappingArray = self->_externalIndexToInternalIndexMappingArray;
    v18 = [NSNumber numberWithUnsignedInt:0];
    [(NSMutableArray *)externalIndexToInternalIndexMappingArray addObject:v18];

    if (!a3) {
      self->_externalIndex = 0;
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v8;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v19);
          }
          v22 += (int)[*(id *)(*((void *)&v31 + 1) + 8 * v25) intValue];
          v26 = self->_externalIndexToInternalIndexMappingArray;
          v27 = [NSNumber numberWithUnsignedInteger:v22];
          [(NSMutableArray *)v26 addObject:v27];

          if (v22 == a3) {
            self->_externalIndex = v23 + v25 + 1;
          }
          ++v25;
        }
        while (v21 != v25);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
        v23 += v25;
      }
      while (v21);
    }

    v5 = v30;
  }
}

- (void)deleteFromInput:(int64_t *)a3 newInput:(id *)a4 inputIndex:(int64_t *)a5
{
  uint64_t v9 = [(TIMarkedTextBuffer_ja_Romaji *)self externalIndex];
  v10 = [(TIMarkedTextBuffer_ja_Romaji *)self externalString];
  id v51 = (id)[v10 copy];

  int64_t v11 = [(TIMarkedTextBuffer_ja_Romaji *)self internalIndex];
  if (!v9) {
    goto LABEL_41;
  }
  int64_t v12 = v11;
  v49 = a4;
  v50 = a3;
  uint64_t v13 = v9 - 2;
  if (v9 < 2)
  {
    v14 = 0;
  }
  else
  {
    v14 = objc_msgSend(v51, "substringWithRange:");
  }
  uint64_t v48 = v9 - 1;
  v15 = -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:");
  int v16 = [v15 unsignedIntValue];

  int64_t v17 = v12;
  BOOL v18 = v12 == v16;
  BOOL v19 = v12 != v16;
  if (v18)
  {
    uint64_t v22 = v14;
    uint64_t v24 = +[Romakana romajiString:v14];
    uint64_t v23 = [(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray objectAtIndex:v13];
    unsigned int v26 = [v23 unsignedIntValue];
  }
  else
  {
    if ([(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray count] <= (unint64_t)(v9 + 1)
      || (-[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:"),
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          int v21 = [v20 unsignedIntValue],
          v20,
          v17 != v21))
    {
      long long v31 = 0;
      BOOL v28 = 0;
      goto LABEL_14;
    }
    uint64_t v22 = v14;
    uint64_t v23 = objc_msgSend(v51, "substringWithRange:", v9, 1);
    uint64_t v24 = +[Romakana romajiString:v23];
    uint64_t v25 = [(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray objectAtIndex:v48];
    unsigned int v26 = [v25 unsignedIntValue];
  }
  int64_t v27 = v17 - v26;
  if (v17 != v26)
  {
    v14 = v22;
    BOOL v28 = v19;
    int64_t v29 = v17;
    v30 = v49;
    goto LABEL_16;
  }
  long long v31 = v24;
  v14 = v22;
  BOOL v28 = v19;
LABEL_14:
  int64_t v29 = v17;
  v30 = v49;
  if ([v14 isEqualToString:@"ん"])
  {
    uint64_t v24 = +[Romakana romajiString:v14];

    long long v32 = [(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray objectAtIndex:v13];
    unsigned int v33 = [v32 unsignedIntValue];

    int64_t v27 = v29 - v33;
    if (v29 != v33)
    {
LABEL_16:
      long long v34 = v50;
      if (!v24) {
        goto LABEL_28;
      }
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v24 = v31;
  }
  long long v34 = v50;
  if ([v14 isEqualToString:@"っ"])
  {
    BOOL v46 = v28;
    v47 = v14;
    v35 = [(TIMarkedTextBuffer_ja_Romaji *)self externalString];
    uint64_t v36 = [v35 substringToIndex:v48];

    uint64_t v37 = [v36 length];
    v38 = [MEMORY[0x263F089D8] stringWithCapacity:3 * v37];
    if (v37 >= 1)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        v40 = objc_msgSend(v36, "substringWithRange:", i, 1);
        id v41 = +[Romakana romajiString:v40];
        if (!v41) {
          id v41 = v40;
        }
        [v38 appendString:v41];
      }
    }
    uint64_t v42 = [NSString stringWithString:v38];

    uint64_t v24 = (void *)v42;
    int64_t v27 = v29;
    v14 = v47;
    v30 = v49;
    long long v34 = v50;
    BOOL v28 = v46;
    if (v42) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  int64_t v27 = 0;
  if (!v24)
  {
LABEL_28:
    v43 = [(NSMutableArray *)self->_externalIndexToInternalIndexMappingArray objectAtIndex:v48];
    unsigned int v44 = [v43 unsignedIntValue];

    int64_t v27 = v29 - v44;
  }
LABEL_29:
  if (v34) {
    *long long v34 = v27;
  }
  if (a5) {
    *a5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v24)
  {
    if (v30) {
      id *v30 = v24;
    }
    char v45 = !v28;
    if (!a5) {
      char v45 = 1;
    }
    if ((v45 & 1) == 0) {
      *a5 = v29 - [v24 length];
    }
  }

LABEL_41:
}

- (int64_t)internalIndex
{
  unint64_t v3 = [(TIMarkedTextBuffer_ja_Romaji *)self externalIndex];
  id v4 = [(TIMarkedTextBuffer_ja_Romaji *)self externalIndexToInternalIndexMappingArray];
  unint64_t v5 = [v4 count];

  if (v3 >= v5)
  {
    uint64_t v6 = [(TIMarkedTextBuffer_ja_Romaji *)self internalString];
    int64_t v8 = [v6 length];
  }
  else
  {
    uint64_t v6 = [(TIMarkedTextBuffer_ja_Romaji *)self externalIndexToInternalIndexMappingArray];
    v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", -[TIMarkedTextBuffer_ja_Romaji externalIndex](self, "externalIndex"));
    int64_t v8 = [v7 unsignedIntValue];
  }
  return v8;
}

- (void)setExternalInputIndex:(int64_t)a3
{
  unint64_t v4 = a3 & ~(a3 >> 63);
  unint64_t v5 = [(TIMarkedTextBuffer_ja_Romaji *)self externalString];
  unint64_t v6 = [v5 length];

  if (v4 >= v6) {
    int64_t v7 = v6;
  }
  else {
    int64_t v7 = v4;
  }
  self->_externalIndex = v7;
}

- (void)clear
{
  unint64_t v3 = [(TIMarkedTextBuffer_ja_Romaji *)self externalIndexToInternalIndexMappingArray];
  [v3 removeAllObjects];

  internalString = self->_internalString;
  self->_internalString = (NSString *)&stru_26F5DD710;

  externalString = self->_externalString;
  self->_externalString = (NSString *)&stru_26F5DD710;

  [(TIMarkedTextBuffer_ja_Romaji *)self setExternalIndex:0];
}

- (NSString)internalString
{
  return self->_internalString;
}

- (NSString)externalString
{
  return self->_externalString;
}

- (int64_t)externalIndex
{
  return self->_externalIndex;
}

- (void)setExternalIndex:(int64_t)a3
{
  self->_externalIndex = a3;
}

- (BOOL)hardwareKeyboard
{
  return self->hardwareKeyboard;
}

- (void)setHardwareKeyboard:(BOOL)a3
{
  self->hardwareKeyboard = a3;
}

- (NSMutableArray)externalIndexToInternalIndexMappingArray
{
  return self->_externalIndexToInternalIndexMappingArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIndexToInternalIndexMappingArray, 0);
  objc_storeStrong((id *)&self->_externalString, 0);
  objc_storeStrong((id *)&self->_internalString, 0);
}

@end