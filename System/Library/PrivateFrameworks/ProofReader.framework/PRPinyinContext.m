@interface PRPinyinContext
- (BOOL)_addEnglishWordForRange:(_NSRange)a3 quickly:(BOOL)a4;
- (BOOL)_addEnglishWordsEndingAtIndex:(unint64_t)a3 quickly:(BOOL)a4;
- (PRPinyinContext)init;
- (double)validSequenceCorrectionThreshold;
- (id)addedModifications;
- (id)completions;
- (id)correction;
- (id)currentModifications;
- (id)description;
- (id)guesses;
- (id)prefixes;
- (id)removedModifications;
- (int)romanization;
- (void)_addDeletions;
- (void)_addEnglishWordsQuickly:(BOOL)a3;
- (void)_addInsertions;
- (void)_addPrefixes;
- (void)_addReplacements;
- (void)_addSpecialEnglishWords;
- (void)_addTranspositions;
- (void)_addValidSequenceReplacements;
- (void)_advanceIndexes;
- (void)_filterModifications;
- (void)_removeModificationsAndMoveStartingPoint;
- (void)_removePrefixes;
- (void)addInputCharacter:(unsigned __int16)a3 geometryModel:(void *)a4 geometryData:(id)a5;
- (void)dealloc;
- (void)removeNumberOfInputCharacters:(unint64_t)a3;
- (void)reset;
- (void)setValidSequenceCorrectionThreshold:(double)a3;
@end

@implementation PRPinyinContext

- (PRPinyinContext)init
{
  if (!_sharedChecker) {
    _sharedChecker = objc_alloc_init(AppleSpell);
  }
  v5.receiver = self;
  v5.super_class = (Class)PRPinyinContext;
  v3 = [(PRPinyinContext *)&v5 init];
  v3->_modifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v3->_addedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v3->_removedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v3->_addedRemovedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v3->_prefixes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v3->_buffer = (char *)malloc_type_calloc(0x100uLL, 1uLL, 0xEEEC5DC3uLL);
  v3->_altBuffer = (char *)malloc_type_calloc(0x100uLL, 1uLL, 0x59673B63uLL);
  v3->_altBufferScores = (char *)malloc_type_calloc(0x100uLL, 1uLL, 0xFEEA568FuLL);
  v3->_geometryDataArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v3->_syllableLengthArray = (unint64_t *)malloc_type_calloc(0x100uLL, 8uLL, 0x100004000313F17uLL);
  v3->_connection = objc_msgSend((id)_sharedChecker, "databaseConnectionForLanguageObject:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", @"en_CN"));
  v3->_romanization = 0;
  v3->_validSequenceCorrectionThreshold = 0.0;
  [(PRPinyinContext *)v3 reset];
  return v3;
}

- (void)dealloc
{
  free(self->_buffer);
  free(self->_altBuffer);
  free(self->_altBufferScores);

  free(self->_syllableLengthArray);
  v3.receiver = self;
  v3.super_class = (Class)PRPinyinContext;
  [(PRPinyinContext *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@\nmodifications:  %@\nprefixes:  %@", objc_msgSend(NSString, "stringWithUTF8String:", self->_buffer), self->_modifications, self->_prefixes];
}

- (int)romanization
{
  return self->_romanization;
}

- (void)setValidSequenceCorrectionThreshold:(double)a3
{
  self->_validSequenceCorrectionThreshold = a3;
}

- (double)validSequenceCorrectionThreshold
{
  return self->_validSequenceCorrectionThreshold;
}

- (void)_removeModificationsAndMoveStartingPoint
{
  uint64_t v3 = [(NSMutableArray *)self->_modifications count];
  unint64_t startingPoint = self->_startingPoint;
  uint64_t v43 = 0;
  unint64_t length = self->_length;
  unint64_t v37 = startingPoint;
  if (length <= startingPoint)
  {
    BOOL v38 = 0;
  }
  else
  {
    BOOL v38 = 0;
    if (findPinyin((unsigned __int8 *)&self->_buffer[startingPoint], length - startingPoint, self->_romanization, 0, 0, 0, 0, 0, &v43, 0, 0, 0, 0, 0, 0, 0, 0, 0))BOOL v38 = v43 + self->_startingPoint == self->_length; {
  }
    }
  if (v3)
  {
    unint64_t v6 = 0;
    uint64_t v7 = v3 - 1;
    while (1)
    {
      unint64_t v39 = v6;
      v8 = (void *)[(NSMutableArray *)self->_modifications objectAtIndex:v7];
      uint64_t v9 = [v8 modificationType];
      uint64_t v10 = [v8 syllableRange];
      unint64_t v12 = v10 + v11;
      if (self->_startingPoint < v10 + v11)
      {
        unint64_t v13 = self->_length;
        if (v13 > v12) {
          break;
        }
      }
      unint64_t v6 = v39;
LABEL_42:
      if (--v7 == -1) {
        goto LABEL_68;
      }
    }
    unint64_t v14 = v10;
    v42 = 0;
    v15 = next_pinyin((unsigned __int8 *)&self->_buffer[v12], v13 - v12, self->_romanization, 0, &v42, 0);
    unint64_t v40 = 0;
    unint64_t v41 = 0;
    if (v15) {
      v16 = (unsigned __int8 *)(v42 - v15);
    }
    else {
      v16 = 0;
    }
    if ([v8 producesPartialSyllable]) {
      goto LABEL_40;
    }
    if ([v8 isTemporary]) {
      goto LABEL_40;
    }
    if (v38 && self->_startingPoint <= v14 && v9 != 5)
    {
      [v8 modificationScore];
      if (v17 > self->_validSequenceCorrectionThreshold) {
        goto LABEL_40;
      }
    }
    if (v16)
    {
      if (v16 == (unsigned __int8 *)1 && self->_length - v12 > 1) {
        goto LABEL_40;
      }
    }
    else
    {
      v18 = (unsigned __int8 *)&self->_buffer[v12];
      unsigned int v19 = *v18;
      BOOL v22 = v19 <= 0xF7 && v19 - 216 >= 0x1F && v19 - 192 >= 0x17 && (v19 & 0xFFFFFFDF) - 65 >= 0x1A;
      if (!v22
        || ((unsigned int v23 = v19 - 138, v24 = v23 > 0x15, v25 = (1 << v23) & 0x350015, !v24) ? (v26 = v25 == 0) : (v26 = 1), !v26))
      {
        if (!is_partial_pinyin(v18, self->_length - v12, self->_romanization, 0)) {
          goto LABEL_40;
        }
      }
    }
    if (![v8 _shouldAppendLetter:self->_buffer[v12] romanization:self->_romanization])
    {
      if ((unint64_t)v16 < 2
        || !findPinyin((unsigned __int8 *)&self->_buffer[v12], self->_length - v12, self->_romanization, 0, 0, 0, 0, 0, &v41, 0, &v40, 0, 0, 0, 0, 0, 0, self->_syllableLengthArray))
      {
        goto LABEL_41;
      }
      unint64_t v28 = v41;
      unint64_t v29 = self->_length;
      if (v41 + v12 >= v29)
      {
        if (v40 >= 3)
        {
          unint64_t v35 = v29 - 1;
          if (self->_altBuffer[v35])
          {
            LOBYTE(v27) = self->_altBufferScores[v35];
            if ((double)v27 / 100.0 <= self->_validSequenceCorrectionThreshold)
            {
LABEL_58:
              unint64_t v6 = v39;
              if (v28 > v39 || v39 && v28 == v39 && v12 < v37)
              {
                unint64_t v6 = v28;
                unint64_t v37 = v12;
              }
              goto LABEL_42;
            }
          }
        }
        goto LABEL_41;
      }
      if (v40 > 1 || v29 - v12 >= 8 && v40 == 1) {
        goto LABEL_58;
      }
      unint64_t v30 = *self->_syllableLengthArray;
      if (v30 == 3)
      {
        v36 = &self->_buffer[v12];
        if (!strncmp(v36, "dei", 3uLL)) {
          goto LABEL_58;
        }
        v32 = v36;
        v33 = "gei";
        size_t v34 = 3;
      }
      else
      {
        if (v30 != 2) {
          goto LABEL_41;
        }
        v31 = &self->_buffer[v12];
        if (!strncmp(v31, "de", 2uLL) || !strncmp(v31, "ge", 2uLL)) {
          goto LABEL_58;
        }
        v32 = v31;
        v33 = "he";
        size_t v34 = 2;
      }
      if (!strncmp(v32, v33, v34)) {
        goto LABEL_58;
      }
      goto LABEL_41;
    }
LABEL_40:
    [(NSMutableArray *)self->_removedModifications addObject:v8];
    [(NSMutableArray *)self->_modifications removeObjectAtIndex:v7];
LABEL_41:
    unint64_t v6 = v39;
    goto LABEL_42;
  }
LABEL_68:
  self->_unint64_t startingPoint = v37;
}

- (void)_advanceIndexes
{
  unsigned int v23 = 0;
  uint64_t v24 = 0;
  BOOL v22 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v19 = 0;
  nextIndexes = self->_nextIndexes;
  unint64_t v4 = self->_nextIndexes[0];
  lastIndexes = self->_lastIndexes;
  unint64_t v6 = self->_lastIndexes[0];
  BOOL v18 = 0;
  findPinyin((unsigned __int8 *)&self->_buffer[self->_startingPoint], self->_length - self->_startingPoint, self->_romanization, 1, &v24, &v23, &v22, &v21, &v20, &v19, 0, &v18, 0, 0, 0, 0, 0, 0);
  unint64_t *lastIndexes = v21 + self->_startingPoint;
  lastIndexes[1] = (unint64_t)&v22[self->_startingPoint];
  lastIndexes[2] = (unint64_t)&v23[self->_startingPoint];
  lastIndexes[3] = v24 + self->_startingPoint;
  unint64_t *nextIndexes = v20 + self->_startingPoint;
  nextIndexes[1] = v19 + self->_startingPoint;
  unint64_t v7 = lastIndexes[2];
  unint64_t v8 = lastIndexes[3];
  if (v7 == v8 && v4 < v8)
  {
    if (lastIndexes[1] == v7 && v6 < v4)
    {
      lastIndexes[2] = v4;
      unint64_t v4 = v6;
    }
    lastIndexes[3] = v4;
  }
  unint64_t v9 = *nextIndexes;
  self->_startIndex = *nextIndexes;
  unint64_t v10 = nextIndexes[1];
  if (v10 < v9 && v10 > self->_startingPoint) {
    unint64_t v9 = nextIndexes[1];
  }
  self->_startIndex = v9;
  if (v9 > *lastIndexes) {
    self->_startIndex = v9 - 1;
  }
  unint64_t v12 = *nextIndexes;
  unint64_t v13 = *nextIndexes + 7;
  self->_endIndex = v13;
  unint64_t length = self->_length;
  if (v13 < length)
  {
    buffer = self->_buffer;
    if (buffer[v13] == 39)
    {
      unint64_t v16 = v12 + 8;
      do
      {
        unint64_t v13 = v16;
        self->_endIndex = v16;
        unint64_t length = self->_length;
        if (v16 >= length) {
          break;
        }
        int v17 = buffer[v16++];
      }
      while (v17 == 39);
    }
  }
  if (v13 > length)
  {
    self->_endIndex = length;
    unint64_t length = self->_length;
  }
  if ((isFullOrAbbreviatedPinyin((uint64_t)&self->_buffer[*lastIndexes], length - *lastIndexes, self->_romanization, &self->_abbreviatedSyllableCount) & 1) == 0)self->_abbreviatedSyllableCount = 0; {
  self->_lastSyllableIsPartial = v18;
  }
}

- (BOOL)_addEnglishWordForRange:(_NSRange)a3 quickly:(BOOL)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a3.length - 2 > 0xC)
  {
LABEL_32:
    LOBYTE(v9) = 0;
    return (char)v9;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  a3.location += (NSUInteger)self->_buffer;
  if (a4) {
    connection = 0;
  }
  else {
    connection = self->_connection;
  }
  unint64_t v9 = (void *)[(id)_sharedChecker englishStringsFromWordBuffer:a3.location length:a3.length connection:connection];
  if (v9)
  {
    unint64_t v10 = v9;
    unint64_t v9 = (void *)[v9 count];
    if (v9)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      modifications = self->_modifications;
      uint64_t v12 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v34;
LABEL_9:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(modifications);
          }
          unint64_t v16 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
          if ([v16 modificationType] == 5 && location == objc_msgSend(v16, "range") && length == v17) {
            goto LABEL_32;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v33 objects:v38 count:16];
            if (v13) {
              goto LABEL_9;
            }
            break;
          }
        }
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      unint64_t v9 = (void *)[v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v9)
      {
        uint64_t v19 = (uint64_t)v9;
        id obj = v10;
        BOOL v20 = a4;
        uint64_t v21 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(obj);
            }
            unint64_t v23 = self->_length;
            NSUInteger v24 = length;
            if (length + location < v23)
            {
              NSUInteger v24 = length;
              while (self->_buffer[location + v24] == 39)
              {
                ++v24;
                if (location + v24 >= v23)
                {
                  NSUInteger v24 = v23 - location;
                  break;
                }
              }
            }
            LOBYTE(v27) = v20;
            int v25 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:isTemporary:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:isTemporary:", location, length, *(void *)(*((void *)&v29 + 1) + 8 * i), 5, location, v24, 1.0, v27);
            [(NSMutableArray *)self->_modifications addObject:v25];
            [(NSMutableArray *)self->_addedModifications addObject:v25];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v19);
        LOBYTE(v9) = 1;
      }
    }
  }
  return (char)v9;
}

- (BOOL)_addEnglishWordsEndingAtIndex:(unint64_t)a3 quickly:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v20 = 0;
  lastIndexes = self->_lastIndexes;
  unint64_t v8 = self->_lastIndexes[2];
  unint64_t v9 = self->_lastIndexes[3];
  if (v9 >= v8)
  {
    int v10 = 0;
  }
  else
  {
    int v10 = -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", self->_lastIndexes[3], a3 - v9, a4);
    unint64_t v8 = lastIndexes[2];
    unint64_t v9 = lastIndexes[3];
  }
  if (v9 + 2 < v8)
  {
    uint64_t v11 = next_pinyin((unsigned __int8 *)&self->_buffer[v9], v8 + ~v9, self->_romanization, 0, &v20, 0);
    unint64_t v8 = lastIndexes[2];
    if (v11)
    {
      if ((unsigned __int8 *)&self->_buffer[v8 - 1] == v20)
      {
        v10 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v8 - 1, a3 - v8 + 1, v4);
        unint64_t v8 = lastIndexes[2];
      }
    }
  }
  unint64_t v12 = lastIndexes[1];
  if (v8 < v12)
  {
    v10 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v8, a3 - v8, v4);
    unint64_t v12 = lastIndexes[1];
    unint64_t v8 = lastIndexes[2];
  }
  if (v8 + 2 < v12)
  {
    uint64_t v13 = next_pinyin((unsigned __int8 *)&self->_buffer[v8], v12 + ~v8, self->_romanization, 0, &v20, 0);
    unint64_t v12 = lastIndexes[1];
    if (v13)
    {
      if ((unsigned __int8 *)&self->_buffer[v12 - 1] == v20)
      {
        v10 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v12 - 1, a3 - v12 + 1, v4);
        unint64_t v12 = lastIndexes[1];
      }
    }
  }
  unint64_t v14 = *lastIndexes;
  if (v12 < *lastIndexes)
  {
    v10 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v12, a3 - v12, v4);
    unint64_t v14 = *lastIndexes;
    unint64_t v12 = lastIndexes[1];
  }
  if (v12 + 2 < v14)
  {
    uint64_t v15 = next_pinyin((unsigned __int8 *)&self->_buffer[v12], v14 + ~v12, self->_romanization, 0, &v20, 0);
    unint64_t v14 = *lastIndexes;
    if (v15)
    {
      if ((unsigned __int8 *)&self->_buffer[v14 - 1] == v20)
      {
        v10 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v14 - 1, a3 - v14 + 1, v4);
        unint64_t v14 = *lastIndexes;
      }
    }
  }
  int v16 = -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v14, a3 - v14, v4) | v10;
  unint64_t v17 = self->_nextIndexes[0];
  if (v17 != *lastIndexes)
  {
    v16 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v17, a3 - v17, v4);
    unint64_t v17 = self->_nextIndexes[0];
  }
  unint64_t v18 = self->_nextIndexes[1];
  if (v18 != v17 && v18 != *lastIndexes) {
    return -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", self->_nextIndexes[1], a3 - v18, v4) | v16;
  }
  return v16;
}

- (void)_addEnglishWordsQuickly:(BOOL)a3
{
  [(PRPinyinContext *)self _addEnglishWordsEndingAtIndex:self->_lengthBeforeApostrophes quickly:a3];
  if (!a3)
  {
    unint64_t lengthBeforeApostrophes = self->_lengthBeforeApostrophes;
    if (lengthBeforeApostrophes)
    {
      if (self->_previouslyAnalyzedLength < lengthBeforeApostrophes - 1
        && is_partial_pinyin((unsigned __int8 *)&self->_buffer[lengthBeforeApostrophes - 1], 1uLL, self->_romanization, 0))
      {
        unint64_t v6 = self->_lengthBeforeApostrophes - 1;
        [(PRPinyinContext *)self _addEnglishWordsEndingAtIndex:v6 quickly:0];
      }
    }
  }
}

- (void)_addSpecialEnglishWords
{
  unint64_t lengthBeforeApostrophes = self->_lengthBeforeApostrophes;
  if (lengthBeforeApostrophes >= 8) {
    unint64_t v3 = lengthBeforeApostrophes - 8;
  }
  else {
    unint64_t v3 = 0;
  }
  if (v3 + 3 >= lengthBeforeApostrophes) {
    return;
  }
  unint64_t v5 = 8;
  if (lengthBeforeApostrophes < 8) {
    unint64_t v5 = self->_lengthBeforeApostrophes;
  }
  uint64_t v6 = -(uint64_t)v5;
  unint64_t v7 = &self->_buffer[-v5];
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    int v9 = v7[lengthBeforeApostrophes];
    ++v3;
    int v10 = v7[lengthBeforeApostrophes + 1];
    if (v9 == 105)
    {
      uint64_t v11 = 0;
      if (v7[lengthBeforeApostrophes + 1] > 0x6Cu)
      {
        if (v10 == 109)
        {
LABEL_31:
          if (v7[lengthBeforeApostrophes + 2] == 97 && v7[lengthBeforeApostrophes + 3] == 99) {
            goto LABEL_33;
          }
        }
        else
        {
          if (v10 != 112) {
            goto LABEL_47;
          }
LABEL_22:
          int v12 = v7[lengthBeforeApostrophes + 2];
          if ((v12 == 111 || v12 == 97) && v7[lengthBeforeApostrophes + 3] == 100)
          {
LABEL_33:
            uint64_t v11 = 4;
            goto LABEL_34;
          }
          uint64_t v11 = 0;
          if (lengthBeforeApostrophes + v6 + 5 >= lengthBeforeApostrophes || v12 != 104) {
            goto LABEL_47;
          }
          if (v7[lengthBeforeApostrophes + 3] == 111
            && v7[lengthBeforeApostrophes + 4] == 110
            && v7[lengthBeforeApostrophes + 5] == 101)
          {
            uint64_t v11 = 6;
LABEL_34:
            if (lengthBeforeApostrophes + v11 + v6 < lengthBeforeApostrophes) {
              v11 |= v7[lengthBeforeApostrophes + v11] == 115;
            }
LABEL_36:
            unint64_t v8 = lengthBeforeApostrophes + v6;
            goto LABEL_47;
          }
        }
LABEL_46:
        uint64_t v11 = 0;
        goto LABEL_47;
      }
      if (v10 == 77) {
        goto LABEL_31;
      }
      if (v10 == 80) {
        goto LABEL_22;
      }
    }
    else if ((v10 | 0x20) == 0x6D)
    {
      if (v7[lengthBeforeApostrophes + 2] != 97 || v7[lengthBeforeApostrophes + 3] != 99) {
        goto LABEL_46;
      }
      if (lengthBeforeApostrophes + v6 + 4 >= lengthBeforeApostrophes)
      {
        uint64_t v11 = 3;
      }
      else
      {
        uint64_t v11 = 3;
        if (v7[lengthBeforeApostrophes + 4] == 115) {
          uint64_t v11 = 4;
        }
      }
      unint64_t v8 = v3;
    }
    else
    {
      if (lengthBeforeApostrophes + v6 + 7 >= lengthBeforeApostrophes || (v9 | 0x20) != 0x66) {
        goto LABEL_41;
      }
      if (strncmp(&v7[lengthBeforeApostrophes + 1], "acebook", 7uLL))
      {
        if (!strncmp(&v7[lengthBeforeApostrophes + 1], "acetime", 7uLL))
        {
          uint64_t v11 = 8;
          goto LABEL_36;
        }
LABEL_41:
        if (lengthBeforeApostrophes + v6 + 5 < lengthBeforeApostrophes && (v9 | 0x20) == 0x72)
        {
          int v13 = strncmp(&v7[lengthBeforeApostrophes + 1], "etina", 5uLL);
          uint64_t v11 = 6;
          if (v13) {
            uint64_t v11 = 0;
          }
          else {
            unint64_t v8 = lengthBeforeApostrophes + v6;
          }
          goto LABEL_47;
        }
        goto LABEL_46;
      }
      uint64_t v11 = 8;
      unint64_t v8 = lengthBeforeApostrophes + v6;
    }
LABEL_47:
    if (v8 + v11 >= lengthBeforeApostrophes) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = 0;
    }
    if (v8 + v11 < lengthBeforeApostrophes) {
      unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (lengthBeforeApostrophes + v6 + 4 >= lengthBeforeApostrophes) {
      break;
    }
    ++v6;
    ++v7;
  }
  while (!v14);
  if (v14)
  {
    unint64_t v15 = 0;
    uint64_t v21 = 0;
    lastIndexes = self->_lastIndexes;
    while (1)
    {
      unint64_t v17 = lastIndexes[v15];
      if (v8 == v17 || v15 <= 1 && v8 == self->_nextIndexes[v15]) {
        break;
      }
      if (v8 > v17 + 1
        && next_pinyin((unsigned __int8 *)&self->_buffer[v17], v8 - v17, self->_romanization, 0, &v21, 0)
        && (unsigned __int8 *)&self->_buffer[v8] == v21)
      {
        break;
      }
      unint64_t v18 = lastIndexes[v15];
      if (v18 > v8 + 1
        && next_pinyin((unsigned __int8 *)&self->_buffer[v8], v18 - v8, self->_romanization, 0, &v21, 0))
      {
        BOOL v19 = &self->_buffer[lastIndexes[v15]] == (char *)v21;
        if ((unsigned __int8 *)&self->_buffer[lastIndexes[v15]] == v21) {
          goto LABEL_74;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
      if (v15++ >= 3)
      {
LABEL_74:
        if (!v19) {
          return;
        }
        break;
      }
    }
    -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v8, v14, 0, 80);
  }
}

- (void)_addTranspositions
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  lastIndexes = self->_lastIndexes;
  if (self->_lastIndexes[1] >= self->_startIndex) {
    unint64_t startIndex = self->_startIndex;
  }
  else {
    unint64_t startIndex = self->_lastIndexes[1];
  }
  unint64_t v4 = startIndex + 1;
  unint64_t endIndex = self->_endIndex;
  if (startIndex + 1 < endIndex)
  {
    unint64_t v7 = 0x2676F2000uLL;
    v44 = self->_lastIndexes;
    while (1)
    {
      unint64_t v8 = startIndex;
      unint64_t startIndex = v4;
      buffer = self->_buffer;
      int v10 = buffer[v8];
      unsigned int v11 = buffer[startIndex];
      if ((v10 - 65) < 0x1A || v11 - 65 < 0x1A) {
        return;
      }
      uint64_t v13 = *(int *)(v7 + 3208);
      BOOL v14 = v10 == 97 && *(_DWORD *)((char *)&self->super.super.isa + v13) == 1;
      if ((!v14 || v11 != 105) && (v10 - 97) <= 0x19 && v11 >= 0x61 && v11 <= 0x7A) {
        break;
      }
LABEL_80:
      unint64_t v4 = startIndex + 1;
      if (startIndex + 1 >= endIndex) {
        return;
      }
    }
    uint64_t v59 = 0;
    unint64_t v57 = 0;
    uint64_t v58 = 0;
    char v56 = 0;
    v55[0] = v11;
    v55[1] = v10;
    buffer[v8] = v11;
    self->_buffer[startIndex] = v10;
    if (v8 >= *lastIndexes)
    {
      if (findPinyin((unsigned __int8 *)&self->_buffer[*lastIndexes], self->_endIndex - *lastIndexes, *(_DWORD *)((char *)&self->super.super.isa + v13), 0, 0, 0, 0, &v59, &v58, 0, &v57, &v56, 0, 0, 0, 0, 0, self->_syllableLengthArray))
      {
        unint64_t v15 = *lastIndexes;
        if (v58 + *lastIndexes == self->_endIndex && (!v56 || v8 < v59 + v15))
        {
          unint64_t v16 = v57;
          if (v57)
          {
            unint64_t v17 = 0;
            char v18 = 0;
            unint64_t v19 = 0;
            unint64_t v20 = 0;
            syllableLengthArray = self->_syllableLengthArray;
            uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
            while (1)
            {
              unint64_t v23 = syllableLengthArray[v17];
              unint64_t v24 = v23 + v15;
              if (v8 >= v15)
              {
                if (startIndex < v24)
                {
                  if (v56 && v57 - 1 == v17) {
                    char v18 = 1;
                  }
                  unint64_t v20 = syllableLengthArray[v17];
                  uint64_t v25 = v15;
                  goto LABEL_39;
                }
                if (v8 < v24)
                {
                  unint64_t v20 = syllableLengthArray[v17 + 1];
                  if (v56 && v57 - 2 == v17) {
                    char v18 = 1;
                  }
                  uint64_t v22 = v15;
                  unint64_t v19 = syllableLengthArray[v17];
                  uint64_t v25 = v23 + v15;
                  goto LABEL_39;
                }
              }
              uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_39:
              if (v25 == 0x7FFFFFFFFFFFFFFFLL)
              {
                ++v17;
                unint64_t v15 = v24;
                if (v17 < v57) {
                  continue;
                }
              }
              goto LABEL_83;
            }
          }
          goto LABEL_82;
        }
      }
    }
    unint64_t v26 = lastIndexes[1];
    if (v8 < v26
      || !findPinyin((unsigned __int8 *)&self->_buffer[v26], self->_endIndex - v26, *(_DWORD *)((char *)&self->super.super.isa + v13), 0, 0, 0, 0, &v59, &v58, 0, &v57, &v56, 0, 0, 0, 0, 0, self->_syllableLengthArray)|| (unint64_t v27 = lastIndexes[1], v58 + v27 != self->_length)
      || v56 && v8 >= v59 + v27)
    {
      unint64_t v50 = 0;
      unint64_t v48 = 0;
      uint64_t v49 = 0;
      char v45 = 0;
      uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_65:
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      modifications = self->_modifications;
      uint64_t v33 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v52;
LABEL_67:
        uint64_t v36 = 0;
        while (1)
        {
          if (*(void *)v52 != v35) {
            objc_enumerationMutation(modifications);
          }
          unint64_t v37 = *(void **)(*((void *)&v51 + 1) + 8 * v36);
          if ([v37 modificationType] == 2 && v8 == objc_msgSend(v37, "range") && v38 == 2) {
            break;
          }
          if (v34 == ++v36)
          {
            uint64_t v34 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v51 objects:v60 count:16];
            if (v34) {
              goto LABEL_67;
            }
            goto LABEL_77;
          }
        }
      }
      else
      {
LABEL_77:
        if (v50)
        {
          unint64_t v40 = (void *)[[NSString alloc] initWithCharacters:v55 length:2];
          unint64_t v41 = [PRPinyinModification alloc];
          BYTE1(v43) = self->_length == 3;
          LOBYTE(v43) = v45;
          v42 = [(PRPinyinModification *)v41 initWithRange:v8 replacementString:2 modificationType:v40 syllableRange:2 additionalSyllableRange:1.0 modificationScore:v47 syllableCountScore:v48 syllableLetters:v49 producesPartialSyllable:&self->_buffer[v46] isTemporary:v43];
          [(NSMutableArray *)self->_modifications addObject:v42];
          [(NSMutableArray *)self->_addedModifications addObject:v42];
        }
      }
      self->_buffer[v8] = v10;
      self->_buffer[startIndex] = v11;
      lastIndexes = v44;
      unint64_t endIndex = self->_endIndex;
      unint64_t v7 = 0x2676F2000;
      goto LABEL_80;
    }
    unint64_t v16 = v57 - 1;
    if (!v57)
    {
LABEL_82:
      char v18 = 0;
      unint64_t v20 = 0;
      unint64_t v19 = 0;
      uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_83:
      uint64_t v46 = v25;
      uint64_t v47 = v22;
      unint64_t v48 = v19;
      uint64_t v49 = v16;
      unint64_t v50 = v20;
      char v45 = v18 & 1;
      goto LABEL_65;
    }
    unint64_t v28 = 0;
    char v18 = 0;
    unint64_t v19 = 0;
    unint64_t v20 = 0;
    long long v29 = self->_syllableLengthArray;
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      unint64_t v30 = v29[v28];
      unint64_t v31 = v30 + v27;
      if (v8 >= v27)
      {
        if (startIndex < v31)
        {
          if (v56 && v16 == v28) {
            char v18 = 1;
          }
          unint64_t v20 = v29[v28];
          uint64_t v25 = v27;
          goto LABEL_61;
        }
        if (v8 < v31)
        {
          unint64_t v20 = v29[v28 + 1];
          if (v56 && v57 - 2 == v28) {
            char v18 = 1;
          }
          uint64_t v22 = v27;
          unint64_t v19 = v29[v28];
          uint64_t v25 = v30 + v27;
          goto LABEL_61;
        }
      }
      uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_61:
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        ++v28;
        unint64_t v27 = v31;
        if (v28 < v57) {
          continue;
        }
      }
      goto LABEL_83;
    }
  }
}

- (void)_addReplacements
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  unint64_t startIndex = self->_startIndex;
  unint64_t endIndex = self->_endIndex;
  if (startIndex >= endIndex) {
    return;
  }
  do
  {
    int v6 = self->_buffer[startIndex];
    if ((v6 - 65) < 0x1A) {
      return;
    }
    if ((v6 - 97) > 0x19) {
      goto LABEL_48;
    }
    uint64_t v7 = 0;
    unsigned int v33 = v6 - 97;
    char v34 = self->_buffer[startIndex];
    do
    {
      if (v7 != 6)
      {
        int v10 = adjacentMatchesChinese[6 * v33 + v7];
        char v8 = v10;
        double v9 = 1.0;
        if (!(_BYTE)v10) {
          goto LABEL_46;
        }
LABEL_9:
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        unint64_t v41 = 0;
        char v40 = 0;
        buffer = self->_buffer;
        unsigned __int16 v39 = v10;
        buffer[startIndex] = v8;
        if (findPinyin((unsigned __int8 *)&self->_buffer[self->_lastIndexes[0]], self->_endIndex - self->_lastIndexes[0], self->_romanization, 0, 0, 0, 0, &v43, &v42, 0, &v41, &v40, 0, 0, 0, 0, 0, self->_syllableLengthArray))
        {
          unint64_t v12 = self->_lastIndexes[0];
          if (v42 + v12 == self->_endIndex && (!v40 || startIndex < v43 + v12))
          {
            if (v41)
            {
              char v13 = 0;
              unint64_t v14 = 0;
              unint64_t v15 = 0;
              syllableLengthArray = self->_syllableLengthArray;
              while (startIndex < v12)
              {
                uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
                if (v40) {
                  goto LABEL_24;
                }
LABEL_25:
                if (v17 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v12 += syllableLengthArray[v15++];
                  if (v15 < v41) {
                    continue;
                  }
                }
                goto LABEL_29;
              }
              unint64_t v18 = syllableLengthArray[v15];
              if (startIndex >= v18 + v12) {
                uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v17 = v12;
              }
              if (startIndex < v18 + v12) {
                unint64_t v14 = syllableLengthArray[v15];
              }
              if (!v40) {
                goto LABEL_25;
              }
LABEL_24:
              v13 |= v41 - 1 == v15;
              goto LABEL_25;
            }
            unint64_t v14 = 0;
            char v13 = 0;
            uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_29:
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            unint64_t v32 = v14;
            modifications = self->_modifications;
            uint64_t v20 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v35 objects:v44 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v36;
LABEL_31:
              uint64_t v23 = 0;
              while (1)
              {
                if (*(void *)v36 != v22) {
                  objc_enumerationMutation(modifications);
                }
                unint64_t v24 = *(void **)(*((void *)&v35 + 1) + 8 * v23);
                if ([v24 modificationType] == 1 && startIndex == objc_msgSend(v24, "range") && v25 == 1)
                {
                  int v27 = objc_msgSend((id)objc_msgSend(v24, "replacementString"), "characterAtIndex:", 0);
                  if (v27 == v39) {
                    break;
                  }
                }
                if (v21 == ++v23)
                {
                  uint64_t v21 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v35 objects:v44 count:16];
                  if (v21) {
                    goto LABEL_31;
                  }
                  goto LABEL_43;
                }
              }
            }
            else
            {
LABEL_43:
              if (v32)
              {
                unint64_t v28 = (void *)[[NSString alloc] initWithCharacters:&v39 length:1];
                long long v29 = [PRPinyinModification alloc];
                BYTE1(v31) = self->_length == 3;
                LOBYTE(v31) = v13 & 1;
                unint64_t v30 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](v29, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", startIndex, 1, v28, 1, v17, v32, v9, v41, &self->_buffer[v17], v31);
                [(NSMutableArray *)self->_modifications addObject:v30];
                [(NSMutableArray *)self->_addedModifications addObject:v30];
              }
            }
          }
        }
        self->_buffer[startIndex] = v34;
        goto LABEL_46;
      }
      char v8 = self->_altBuffer[startIndex];
      LOBYTE(v2) = self->_altBufferScores[startIndex];
      double v2 = (double)*(unint64_t *)&v2;
      double v9 = v2 / 100.0;
      LOBYTE(v10) = v8;
      if (v8) {
        goto LABEL_9;
      }
LABEL_46:
      ++v7;
    }
    while (v7 != 7);
    unint64_t endIndex = self->_endIndex;
LABEL_48:
    ++startIndex;
  }
  while (startIndex < endIndex);
}

- (void)_addValidSequenceReplacements
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  unint64_t v3 = self->_lastIndexes[1];
  if (v3 >= self->_startIndex) {
    unint64_t startIndex = self->_startIndex;
  }
  else {
    unint64_t startIndex = self->_lastIndexes[1];
  }
  if (v3 >= self->_lastIndexes[0]) {
    unint64_t v5 = self->_lastIndexes[0];
  }
  else {
    unint64_t v5 = self->_lastIndexes[1];
  }
  unint64_t v36 = v5;
  unint64_t endIndex = self->_endIndex;
  if (startIndex < endIndex)
  {
    unint64_t v8 = 0x2676F2000uLL;
    do
    {
      buffer = self->_buffer;
      int v10 = buffer[startIndex];
      if ((v10 - 65) < 0x1A) {
        return;
      }
      if ((v10 - 97) <= 0x19)
      {
        unsigned int v11 = self->_altBuffer[startIndex];
        if (v11 >= 0x61 && v11 <= 0x7A)
        {
          LOBYTE(v2) = self->_altBufferScores[startIndex];
          double v12 = (double)*(unint64_t *)&v2 / 100.0;
          double v2 = *(double *)((char *)&self->super.super.isa + *(int *)(v8 + 3212));
          if (v12 <= v2)
          {
            uint64_t v44 = 0;
            uint64_t v45 = 0;
            unint64_t v43 = 0;
            char v42 = 0;
            unsigned __int16 v41 = v11;
            buffer[startIndex] = v11;
            if (findPinyin((unsigned __int8 *)&self->_buffer[v36], self->_endIndex - v36, self->_romanization, 0, 0, 0, 0, &v45, &v44, 0, &v43, &v42, 0, 0, 0, 0, 0, self->_syllableLengthArray)&& v44 + v36 == self->_endIndex
              && (!v42 || startIndex < v45 + v36))
            {
              if (v43)
              {
                char v13 = 0;
                unint64_t v14 = 0;
                unint64_t v15 = 0;
                syllableLengthArray = self->_syllableLengthArray;
                unint64_t v17 = v36;
                while (startIndex < v17)
                {
                  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
                  if (v42) {
                    goto LABEL_29;
                  }
LABEL_30:
                  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v17 += syllableLengthArray[v15++];
                    if (v15 < v43) {
                      continue;
                    }
                  }
                  goto LABEL_34;
                }
                unint64_t v19 = syllableLengthArray[v15];
                if (startIndex >= v19 + v17) {
                  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v18 = v17;
                }
                if (startIndex < v19 + v17) {
                  unint64_t v14 = syllableLengthArray[v15];
                }
                if (!v42) {
                  goto LABEL_30;
                }
LABEL_29:
                v13 |= v43 - 1 == v15;
                goto LABEL_30;
              }
              unint64_t v14 = 0;
              char v13 = 0;
              uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_34:
              char v35 = v13;
              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              modifications = self->_modifications;
              uint64_t v21 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v37 objects:v46 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v38;
LABEL_36:
                uint64_t v24 = 0;
                while (1)
                {
                  if (*(void *)v38 != v23) {
                    objc_enumerationMutation(modifications);
                  }
                  uint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * v24);
                  if ([v25 modificationType] == 1
                    && startIndex == [v25 range]
                    && v26 == 1)
                  {
                    int v28 = objc_msgSend((id)objc_msgSend(v25, "replacementString"), "characterAtIndex:", 0);
                    if (v28 == v41 && v18 == [v25 syllableRange] && v14 == v29) {
                      break;
                    }
                  }
                  if (v22 == ++v24)
                  {
                    uint64_t v22 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v37 objects:v46 count:16];
                    if (v22) {
                      goto LABEL_36;
                    }
                    goto LABEL_52;
                  }
                }
              }
              else
              {
LABEL_52:
                if (v14)
                {
                  uint64_t v31 = (void *)[[NSString alloc] initWithCharacters:&v41 length:1];
                  unint64_t v32 = [PRPinyinModification alloc];
                  LOWORD(v34) = v35 & 1;
                  unsigned int v33 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](v32, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", startIndex, 1, v31, 1, v18, v14, v12, v43, &self->_buffer[v18], v34);
                  [(NSMutableArray *)self->_modifications addObject:v33];
                  [(NSMutableArray *)self->_addedModifications addObject:v33];
                }
              }
            }
            self->_buffer[startIndex] = v10;
            unint64_t endIndex = self->_endIndex;
            unint64_t v8 = 0x2676F2000;
          }
        }
      }
      ++startIndex;
    }
    while (startIndex < endIndex);
  }
}

- (void)_addInsertions
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  unint64_t startIndex = self->_startIndex;
  if (startIndex >= self->_endIndex) {
    return;
  }
  do
  {
    int v4 = self->_buffer[startIndex];
    if ((v4 - 65) < 0x1A) {
      return;
    }
    if ((v4 - 97) >= 0x1A)
    {
      unint64_t v8 = startIndex + 1;
      goto LABEL_49;
    }
    unint64_t length = self->_length;
    if (length + 1 > startIndex)
    {
      do
        self->_buffer[length + 1] = self->_buffer[length];
      while (length-- > startIndex);
    }
    uint64_t v7 = 0;
    unsigned int v36 = v4 - 97;
    unint64_t v34 = startIndex;
    unint64_t v8 = startIndex + 1;
    do
    {
      int v9 = insertionFollowers[6 * v36 + v7];
      if ((_BYTE)v9)
      {
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        unint64_t v43 = 0;
        char v42 = 0;
        unsigned __int16 v41 = v9;
        self->_buffer[v8] = v9;
        if (findPinyin((unsigned __int8 *)&self->_buffer[self->_lastIndexes[0]], self->_endIndex - self->_lastIndexes[0] + 1, self->_romanization, 0, 0, 0, 0, &v45, &v44, 0, &v43, &v42, 0, 0, 0, 0, 0, self->_syllableLengthArray))
        {
          unint64_t v10 = self->_lastIndexes[0];
          if (v44 + v10 == self->_endIndex + 1 && (!v42 || v8 < v45 + v10))
          {
            if (v43)
            {
              char v11 = 0;
              unint64_t v12 = 0;
              unint64_t v13 = 0;
              syllableLengthArray = self->_syllableLengthArray;
              while (v8 < v10)
              {
                uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
                if (v42) {
                  goto LABEL_23;
                }
LABEL_24:
                if (v15 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v10 += syllableLengthArray[v13++];
                  if (v13 < v43) {
                    continue;
                  }
                }
                goto LABEL_28;
              }
              unint64_t v16 = syllableLengthArray[v13];
              unint64_t v17 = v16 + v10;
              unint64_t v18 = v16 - 1;
              if (v8 >= v17) {
                uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v15 = v10;
              }
              if (v8 < v17) {
                unint64_t v12 = v18;
              }
              if (!v42) {
                goto LABEL_24;
              }
LABEL_23:
              v11 |= v43 - 1 == v13;
              goto LABEL_24;
            }
            unint64_t v12 = 0;
            char v11 = 0;
            uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_28:
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            uint64_t v35 = v12;
            modifications = self->_modifications;
            uint64_t v20 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v38;
LABEL_30:
              uint64_t v23 = 0;
              while (1)
              {
                if (*(void *)v38 != v22) {
                  objc_enumerationMutation(modifications);
                }
                uint64_t v24 = *(void **)(*((void *)&v37 + 1) + 8 * v23);
                if ([v24 modificationType] == 3 && v8 == objc_msgSend(v24, "range") && v25 == 0)
                {
                  int v27 = objc_msgSend((id)objc_msgSend(v24, "replacementString"), "characterAtIndex:", 0);
                  if (v27 == v41) {
                    break;
                  }
                }
                if (v21 == ++v23)
                {
                  uint64_t v21 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v37 objects:v46 count:16];
                  if (v21) {
                    goto LABEL_30;
                  }
                  goto LABEL_42;
                }
              }
            }
            else
            {
LABEL_42:
              if (v35)
              {
                int v28 = (void *)[[NSString alloc] initWithCharacters:&v41 length:1];
                uint64_t v29 = [PRPinyinModification alloc];
                LOBYTE(v33) = v11 & 1;
                unint64_t v30 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](v29, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", v8, 0, v28, 3, v15, v35, 1.0, v43, &self->_buffer[v15], v33);
                [(NSMutableArray *)self->_modifications addObject:v30];
                [(NSMutableArray *)self->_addedModifications addObject:v30];
              }
            }
          }
        }
      }
      ++v7;
    }
    while (v7 != 6);
    unint64_t v31 = v34;
    if (v34 < self->_length)
    {
      do
      {
        self->_buffer[v31 + 1] = self->_buffer[v31 + 2];
        unint64_t v32 = v31 + 2;
        ++v31;
      }
      while (v32 <= self->_length);
    }
LABEL_49:
    unint64_t startIndex = v8;
  }
  while (v8 < self->_endIndex);
}

- (void)_addDeletions
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  unint64_t startIndex = self->_startIndex;
  unint64_t v3 = startIndex + 2;
  unint64_t endIndex = self->_endIndex;
  if (startIndex + 2 < endIndex)
  {
    unint64_t v6 = startIndex + 1;
    while (1)
    {
      unint64_t v7 = v6;
      unint64_t v6 = v3;
      buffer = self->_buffer;
      int v9 = buffer[v7];
      if ((v9 - 65) < 0x1A) {
        return;
      }
      int v10 = buffer[v7 - 1];
      if ((v10 - 65) < 0x1A) {
        return;
      }
      int v11 = buffer[v6];
      if ((v11 - 65) < 0x1A) {
        return;
      }
      if ((v9 - 97) <= 0x19)
      {
        if (v9 == v10 || self->_abbreviatedSyllableCount == 0) {
          break;
        }
        int v13 = v9 - 97;
        int v14 = adjacentMatchesChinese[6 * (v9 - 97)];
        if (v14 == v10) {
          break;
        }
        int v15 = adjacentMatchesChinese[6 * v13 + 1];
        if (v15 == v10) {
          break;
        }
        int v16 = adjacentMatchesChinese[6 * v13 + 2];
        if (v16 == v10) {
          break;
        }
        int v17 = adjacentMatchesChinese[6 * v13 + 3];
        if (v17 == v10) {
          break;
        }
        int v18 = adjacentMatchesChinese[6 * v13 + 4];
        if (v18 == v10) {
          break;
        }
        int v19 = adjacentMatchesChinese[6 * v13 + 5];
        BOOL v20 = v19 == v10 || v9 == v11;
        BOOL v21 = v20 || v14 == v11;
        BOOL v22 = v21 || v15 == v11;
        BOOL v23 = v22 || v16 == v11;
        BOOL v24 = v23 || v17 == v11;
        BOOL v25 = v24 || v18 == v11;
        if (v25 || v19 == v11) {
          break;
        }
      }
LABEL_86:
      unint64_t v3 = v6 + 1;
      ++startIndex;
      if (v6 + 1 >= endIndex) {
        return;
      }
    }
    int v54 = buffer[v7 - 1];
    unint64_t v53 = v6;
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    unint64_t v60 = 0;
    char v59 = 0;
    if (v7 < self->_length)
    {
      unint64_t v27 = startIndex;
      do
      {
        self->_buffer[v27 + 1] = self->_buffer[v27 + 2];
        unint64_t v28 = v27 + 2;
        ++v27;
      }
      while (v28 < self->_length);
      buffer = self->_buffer;
      unint64_t endIndex = self->_endIndex;
    }
    unint64_t v52 = startIndex;
    if (findPinyin((unsigned __int8 *)&buffer[self->_lastIndexes[0]], endIndex + ~self->_lastIndexes[0], self->_romanization, 0, 0, 0, 0, &v62, &v61, 0, &v60, &v59, 0, 0, 0, 0, 0, self->_syllableLengthArray))
    {
      unint64_t v29 = self->_lastIndexes[0];
      if (v61 + v29 == self->_endIndex - 1 && (!v59 || v53 <= v62 + v29))
      {
        if (v60)
        {
          char v30 = 0;
          unint64_t v31 = 0;
          unint64_t v32 = 0;
          syllableLengthArray = self->_syllableLengthArray;
          while (v7 < v29)
          {
            uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
            if (v59) {
              goto LABEL_58;
            }
LABEL_59:
            if (v34 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v29 += syllableLengthArray[v32++];
              if (v32 < v60) {
                continue;
              }
            }
            goto LABEL_63;
          }
          unint64_t v35 = syllableLengthArray[v32];
          if (v7 >= v35 + v29) {
            uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v34 = v29;
          }
          if (v7 < v35 + v29) {
            unint64_t v31 = v35 + 1;
          }
          if (!v59) {
            goto LABEL_59;
          }
LABEL_58:
          v30 |= v60 - 1 == v32;
          goto LABEL_59;
        }
        unint64_t v31 = 0;
        char v30 = 0;
        uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_63:
        char v49 = v30;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        unint64_t v50 = v31;
        id obj = self->_modifications;
        uint64_t v36 = [(NSMutableArray *)obj countByEnumeratingWithState:&v55 objects:v63 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v56;
LABEL_65:
          uint64_t v39 = 0;
          while (1)
          {
            if (*(void *)v56 != v38) {
              objc_enumerationMutation(obj);
            }
            long long v40 = *(void **)(*((void *)&v55 + 1) + 8 * v39);
            if ([v40 modificationType] == 4)
            {
              uint64_t v41 = [v40 range];
              if (v7 == v41 && v42 == 1) {
                break;
              }
              if (v9 == v54 && v42 == 1 && v41 + 1 == v7) {
                break;
              }
            }
            if (v37 == ++v39)
            {
              uint64_t v37 = [(NSMutableArray *)obj countByEnumeratingWithState:&v55 objects:v63 count:16];
              if (v37) {
                goto LABEL_65;
              }
              goto LABEL_80;
            }
          }
        }
        else
        {
LABEL_80:
          if (v50 >= 3)
          {
            uint64_t v45 = [PRPinyinModification alloc];
            LOBYTE(v48) = v49 & 1;
            uint64_t v46 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](v45, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", v7, 1, &stru_26C1C71A8, 4, v34, v50, 1.0, v60, &self->_buffer[v34], v48);
            [(NSMutableArray *)self->_modifications addObject:v46];
            [(NSMutableArray *)self->_addedModifications addObject:v46];
          }
        }
      }
    }
    for (unint64_t i = self->_length; --i > v7; self->_buffer[i] = self->_buffer[i - 1])
      ;
    self->_buffer[v7] = v9;
    unint64_t v6 = v53;
    unint64_t endIndex = self->_endIndex;
    unint64_t startIndex = v52;
    goto LABEL_86;
  }
}

- (void)_filterModifications
{
  double v2 = self;
  uint64_t v88 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableArray *)self->_addedModifications count];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  addedModifications = v2->_addedModifications;
  uint64_t v5 = [(NSMutableArray *)addedModifications countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v81 != v8) {
          objc_enumerationMutation(addedModifications);
        }
        int v10 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        unint64_t v11 = [v10 syllableCountScore];
        uint64_t v12 = [v10 modificationType];
        if (v7 - 1 >= v11 && v12 != 5) {
          unint64_t v7 = v11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)addedModifications countByEnumeratingWithState:&v80 objects:v87 count:16];
    }
    while (v6);
    if (v7) {
      BOOL v14 = v3 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14)
    {
      uint64_t v15 = v3 - 1;
      do
      {
        int v16 = (void *)[(NSMutableArray *)v2->_addedModifications objectAtIndex:v15];
        unint64_t v17 = [v16 syllableCountScore];
        if ([v16 modificationType] != 5 && v17 > v7)
        {
          [(NSMutableArray *)v2->_modifications removeObjectIdenticalTo:v16];
          [(NSMutableArray *)v2->_addedModifications removeObjectAtIndex:v15];
        }
        --v15;
      }
      while (v15 != -1);
    }
  }
  uint64_t v19 = [(NSMutableArray *)v2->_modifications count];
  if (v19)
  {
    uint64_t v20 = v19;
    unint64_t v60 = v2;
    do
    {
      while (1)
      {
        uint64_t v61 = v20 - 1;
        BOOL v21 = (void *)[(NSMutableArray *)v2->_modifications objectAtIndex:v20 - 1];
        uint64_t v22 = [v21 modificationType];
        unint64_t v66 = [v21 range];
        unint64_t v62 = v23;
        unint64_t v65 = [v21 combinedSyllableRange];
        uint64_t v25 = v24;
        unint64_t v67 = [v21 syllableCountScore];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        modifications = v2->_modifications;
        uint64_t v27 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v76 objects:v86 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v77;
          unint64_t v63 = v66 + v62;
          unint64_t v64 = v65 + v25;
          while (2)
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v77 != v29) {
                objc_enumerationMutation(modifications);
              }
              unint64_t v31 = *(void **)(*((void *)&v76 + 1) + 8 * j);
              if (v31 != v21)
              {
                uint64_t v32 = [*(id *)(*((void *)&v76 + 1) + 8 * j) modificationType];
                unint64_t v33 = [v31 combinedSyllableRange];
                unint64_t v35 = v34;
                unint64_t v36 = [v31 syllableCountScore];
                if (v22 == 5 || (v32 != 5 ? (BOOL v37 = v36 >= v67) : (BOOL v37 = 1), v37))
                {
                  if (v22 != 5 && (v32 == 5 ? (BOOL v39 = v66 >= v33) : (BOOL v39 = 0), v39))
                  {
                    if (v35 >= 3 && v63 <= v33 + v35)
                    {
LABEL_92:
                      double v2 = v60;
                      uint64_t v56 = [(NSMutableArray *)v60->_addedModifications indexOfObjectIdenticalTo:v21];
                      if (v56 == 0x7FFFFFFFFFFFFFFFLL) {
                        [(NSMutableArray *)v60->_removedModifications addObject:v21];
                      }
                      else {
                        [(NSMutableArray *)v60->_addedModifications removeObjectAtIndex:v56];
                      }
                      uint64_t v20 = v61;
                      goto LABEL_102;
                    }
                  }
                  else if (v22 == 5 && v32 == 5 && v66 >= v33)
                  {
                    unint64_t v42 = v33 + v35;
                    BOOL v43 = v62 >= 3 || v63 >= v42;
                    BOOL v44 = !v43;
                    if (v66 + v62 + 1 < v42 || v44) {
                      goto LABEL_92;
                    }
                  }
                }
                else if (v65 < v33 + v35 && v64 > v33)
                {
                  goto LABEL_92;
                }
              }
            }
            uint64_t v28 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v76 objects:v86 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        double v2 = v60;
        removedModifications = v60->_removedModifications;
        uint64_t v47 = [(NSMutableArray *)removedModifications countByEnumeratingWithState:&v72 objects:v85 count:16];
        uint64_t v20 = v61;
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v73;
          while (2)
          {
            for (uint64_t k = 0; k != v48; ++k)
            {
              if (*(void *)v73 != v49) {
                objc_enumerationMutation(removedModifications);
              }
              if ([*(id *)(*((void *)&v72 + 1) + 8 * k) isEqual:v21])
              {
                uint64_t v57 = [(NSMutableArray *)v60->_addedModifications indexOfObjectIdenticalTo:v21];
                if (v57 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  [(NSMutableArray *)v60->_addedModifications removeObjectAtIndex:v57];
                  addedRemovedModifications = v60->_addedRemovedModifications;
LABEL_100:
                  [(NSMutableArray *)addedRemovedModifications addObject:v21];
                }
                goto LABEL_102;
              }
            }
            uint64_t v48 = [(NSMutableArray *)removedModifications countByEnumeratingWithState:&v72 objects:v85 count:16];
            if (v48) {
              continue;
            }
            break;
          }
        }
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v51 = v60->_addedRemovedModifications;
        uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v68 objects:v84 count:16];
        if (v52) {
          break;
        }
LABEL_90:
        if (!v61) {
          return;
        }
      }
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v69;
LABEL_84:
      uint64_t v55 = 0;
      while (1)
      {
        if (*(void *)v69 != v54) {
          objc_enumerationMutation(v51);
        }
        if ([*(id *)(*((void *)&v68 + 1) + 8 * v55) isEqual:v21]) {
          break;
        }
        if (v53 == ++v55)
        {
          uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v68 objects:v84 count:16];
          if (v53) {
            goto LABEL_84;
          }
          goto LABEL_90;
        }
      }
      uint64_t v59 = [(NSMutableArray *)v60->_addedModifications indexOfObjectIdenticalTo:v21];
      if (v59 == 0x7FFFFFFFFFFFFFFFLL)
      {
        addedRemovedModifications = v60->_removedModifications;
        goto LABEL_100;
      }
      [(NSMutableArray *)v60->_addedModifications removeObjectAtIndex:v59];
LABEL_102:
      [(NSMutableArray *)v2->_modifications removeObjectAtIndex:v20];
    }
    while (v20);
  }
}

- (void)_addPrefixes
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t length = self->_length;
  if (length - 3 <= 0xB)
  {
    int v4 = objc_msgSend((id)_sharedChecker, "englishStringsFromWordBuffer:length:connection:", self->_buffer);
    if (v4)
    {
      uint64_t v5 = v4;
      if ([v4 count])
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v26 != v8) {
                objc_enumerationMutation(v5);
              }
              int v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              [v10 length];
              unint64_t v11 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, self->_length, v10, 5, 0, self->_length, 1.0);
              [(NSMutableArray *)self->_prefixes addObject:v11];
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v7);
        }
      }
    }
    unint64_t length = self->_length;
  }
  if (length == 2)
  {
    unint64_t v12 = 0;
    do
    {
      buffer = self->_buffer;
      if (additionalTwoLetterWords[v12] == *buffer && additionalTwoLetterWords[v12 + 1] == buffer[1])
      {
        BOOL v14 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, 2, (id)[[NSString alloc] initWithBytes:self->_buffer length:2 encoding:12], 5, 0, 2, 1.0);
        [(NSMutableArray *)self->_prefixes addObject:v14];
      }
      BOOL v15 = v12 >= 0x2E;
      v12 += 2;
    }
    while (!v15);
    unint64_t v16 = 0;
    do
    {
      unint64_t v17 = self->_buffer;
      if (additionalTwoLetterAcronyms[v16] == *v17 && additionalTwoLetterAcronyms[v16 + 1] == v17[1])
      {
        int v18 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, 2, objc_msgSend((id)objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", self->_buffer, 2, 12), "uppercaseString"), 5, 0, 2, 1.0);
        [(NSMutableArray *)self->_prefixes addObject:v18];
      }
      BOOL v15 = v16 >= 8;
      v16 += 2;
    }
    while (!v15);
    unint64_t length = self->_length;
  }
  if (length == 3)
  {
    unint64_t v19 = 0;
    do
    {
      uint64_t v20 = self->_buffer;
      if (additionalThreeLetterWords[v19] == *v20
        && additionalThreeLetterWords[v19 + 1] == v20[1]
        && additionalThreeLetterWords[v19 + 2] == v20[2])
      {
        BOOL v21 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, 3, (id)[[NSString alloc] initWithBytes:self->_buffer length:3 encoding:12], 5, 0, 3, 1.0);
        [(NSMutableArray *)self->_prefixes addObject:v21];
      }
      BOOL v15 = v19 >= 0x12F;
      v19 += 3;
    }
    while (!v15);
    unint64_t v22 = 0;
    do
    {
      unint64_t v23 = self->_buffer;
      if (additionalThreeLetterAcronyms[v22] == *v23
        && additionalThreeLetterAcronyms[v22 + 1] == v23[1]
        && additionalThreeLetterAcronyms[v22 + 2] == v23[2])
      {
        uint64_t v24 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, 3, objc_msgSend((id)objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", self->_buffer, 3, 12), "uppercaseString"), 5, 0, 3, 1.0);
        [(NSMutableArray *)self->_prefixes addObject:v24];
      }
      BOOL v15 = v22 >= 0xC;
      v22 += 3;
    }
    while (!v15);
  }
}

- (void)_removePrefixes
{
  uint64_t v3 = [(NSMutableArray *)self->_prefixes count];
  if (v3)
  {
    uint64_t v4 = v3 - 1;
    do
    {
      uint64_t v5 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_prefixes, "objectAtIndex:", v4), "range");
      uint64_t v7 = v5 + v6;
      unint64_t length = self->_length;
      BOOL v9 = length >= v5 + v6;
      unint64_t v10 = length - (v5 + v6);
      if (v10 != 0
        && v9
        && !next_pinyin((unsigned __int8 *)&self->_buffer[v7], v10, self->_romanization, 0, 0, 0)
        && !is_partial_pinyin((unsigned __int8 *)&self->_buffer[v7], self->_length - v7, self->_romanization, 0))
      {
        [(NSMutableArray *)self->_prefixes removeObjectAtIndex:v4];
      }
      --v4;
    }
    while (v4 != -1);
  }
}

- (void)addInputCharacter:(unsigned __int16)a3 geometryModel:(void *)a4 geometryData:(id)a5
{
  unsigned int v6 = a3;
  [(NSMutableArray *)self->_addedModifications removeAllObjects];
  [(NSMutableArray *)self->_removedModifications removeAllObjects];
  unint64_t length = self->_length;
  if (length <= 0xFE)
  {
    if (v6 >= 0x100) {
      char v9 = 127;
    }
    else {
      char v9 = v6;
    }
    self->_buffer[length] = v9;
    if (a5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v10 = [a5 bytes];
      unint64_t v11 = [a5 length];
      [(NSMutableArray *)self->_geometryDataArray addObject:a5];
      if (v11 >= 8)
      {
        unint64_t v12 = v11 >> 3;
        int v13 = (float *)(v10 + 4);
        float v14 = -100.0;
        unint64_t v15 = 1;
        do
        {
          if (*((unsigned __int16 *)v13 - 2) == v6)
          {
            uint64_t v16 = v15 - 1;
            float v14 = *v13;
          }
          else
          {
            uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v15 >= v12) {
            break;
          }
          v13 += 2;
          ++v15;
        }
        while (v16 == 0x7FFFFFFFFFFFFFFFLL);
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v17 = 0;
          uint64_t v18 = v12 <= 1 ? 1 : v11 >> 3;
          unint64_t v19 = (float *)(v10 + 4);
          uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
          float v21 = -100.0;
          do
          {
            int v22 = *((unsigned __int16 *)v19 - 2);
            if (v22 != v6 && (v22 - 1) <= 0xFE && *v19 > v21)
            {
              uint64_t v20 = v17;
              float v21 = *v19;
            }
            v19 += 2;
            ++v17;
          }
          while (v18 != v17);
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          {
            self->_altBuffer[self->_length] = *(unsigned char *)(v10 + 8 * v20);
            float v23 = v14 - v21;
            if (v23 <= 0.0)
            {
              LOBYTE(v24) = 0;
              goto LABEL_31;
            }
            if (v23 <= 2.5)
            {
              int v24 = (int)(v23 * 100.0);
LABEL_31:
              self->_altBufferScores[self->_length] = v24;
              unint64_t v25 = self->_length + 1;
              self->_unint64_t length = v25;
              if (v6 != 39) {
                self->_unint64_t lengthBeforeApostrophes = v25;
              }
              [(PRPinyinContext *)self _removeModificationsAndMoveStartingPoint];
              [(PRPinyinContext *)self _advanceIndexes];
              [(PRPinyinContext *)self _addSpecialEnglishWords];
              if (self->_nextIndexes[0] >= self->_length)
              {
                if (self->_lastSyllableIsPartial) {
                  [(PRPinyinContext *)self _addEnglishWordsQuickly:1];
                }
                [(PRPinyinContext *)self _addValidSequenceReplacements];
                goto LABEL_50;
              }
              [(PRPinyinContext *)self _addEnglishWordsQuickly:0];
              unint64_t v26 = self->_length;
              unint64_t startingPoint = self->_startingPoint;
              if (v26 - startingPoint >= 3)
              {
                [(PRPinyinContext *)self _addTranspositions];
                unint64_t v26 = self->_length;
                unint64_t startingPoint = self->_startingPoint;
                if (v26 - startingPoint > 3) {
                  goto LABEL_42;
                }
              }
              if (v26 != 3) {
                goto LABEL_43;
              }
              if (self->_abbreviatedSyllableCount)
              {
                unint64_t v26 = 3;
              }
              else
              {
LABEL_42:
                [(PRPinyinContext *)self _addReplacements];
                unint64_t v26 = self->_length;
                unint64_t startingPoint = self->_startingPoint;
              }
LABEL_43:
              if (self->_romanization != 1 && v26 + 1 <= 0xFE && v26 - startingPoint >= 4)
              {
                [(PRPinyinContext *)self _addInsertions];
                unint64_t v26 = self->_length;
                unint64_t startingPoint = self->_startingPoint;
              }
              if (v26 - startingPoint >= 5) {
                [(PRPinyinContext *)self _addDeletions];
              }
              [(PRPinyinContext *)self _filterModifications];
              self->_previouslyAnalyzedLength = self->_lengthBeforeApostrophes;
LABEL_50:
              [(PRPinyinContext *)self _removePrefixes];
              [(PRPinyinContext *)self _addPrefixes];

              self->_guesses = 0;
              self->_completions = 0;

              self->_corrections = 0;
              return;
            }
LABEL_30:
            LOBYTE(v24) = -1;
            goto LABEL_31;
          }
        }
      }
    }
    else
    {
      -[NSMutableArray addObject:](self->_geometryDataArray, "addObject:", [MEMORY[0x263EFF9D0] null]);
    }
    self->_altBuffer[self->_length] = 0;
    goto LABEL_30;
  }
}

- (void)removeNumberOfInputCharacters:(unint64_t)a3
{
  unint64_t length = self->_length;
  if (length >= a3) {
    unint64_t v4 = length - a3;
  }
  else {
    unint64_t v4 = 0;
  }
  if (a3 && length)
  {
    uint64_t v7 = (unsigned __int8 *)malloc_type_calloc(0x100uLL, 1uLL, 0xD94633CCuLL);
    uint64_t v8 = v7;
    if (length > a3)
    {
      unint64_t v9 = 0;
      do
      {
        v7[v9] = self->_buffer[v9];
        ++v9;
      }
      while (v9 < v4);
    }
    id v14 = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_geometryDataArray];
    unint64_t v10 = [v14 count];
    [(PRPinyinContext *)self reset];
    if (length > a3)
    {
      unint64_t v11 = 0;
      do
      {
        if (v11 >= v10) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = [v14 objectAtIndex:v11];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        [(PRPinyinContext *)self addInputCharacter:v8[v11++] geometryModel:0 geometryData:v13];
      }
      while (v11 < v4);
    }
    free(v8);
  }
}

- (void)reset
{
  buffer = self->_buffer;
  *(_OWORD *)buffer = 0u;
  *((_OWORD *)buffer + 1) = 0u;
  *((_OWORD *)buffer + 2) = 0u;
  *((_OWORD *)buffer + 3) = 0u;
  *((_OWORD *)buffer + 4) = 0u;
  *((_OWORD *)buffer + 5) = 0u;
  *((_OWORD *)buffer + 6) = 0u;
  *((_OWORD *)buffer + 7) = 0u;
  *((_OWORD *)buffer + 8) = 0u;
  *((_OWORD *)buffer + 9) = 0u;
  *((_OWORD *)buffer + 10) = 0u;
  *((_OWORD *)buffer + 11) = 0u;
  *((_OWORD *)buffer + 12) = 0u;
  *((_OWORD *)buffer + 13) = 0u;
  *((_OWORD *)buffer + 14) = 0u;
  *((_OWORD *)buffer + 15) = 0u;
  altBuffer = self->_altBuffer;
  *(_OWORD *)altBuffer = 0u;
  *((_OWORD *)altBuffer + 1) = 0u;
  *((_OWORD *)altBuffer + 2) = 0u;
  *((_OWORD *)altBuffer + 3) = 0u;
  *((_OWORD *)altBuffer + 4) = 0u;
  *((_OWORD *)altBuffer + 5) = 0u;
  *((_OWORD *)altBuffer + 6) = 0u;
  *((_OWORD *)altBuffer + 7) = 0u;
  *((_OWORD *)altBuffer + 8) = 0u;
  *((_OWORD *)altBuffer + 9) = 0u;
  *((_OWORD *)altBuffer + 10) = 0u;
  *((_OWORD *)altBuffer + 11) = 0u;
  *((_OWORD *)altBuffer + 12) = 0u;
  *((_OWORD *)altBuffer + 13) = 0u;
  *((_OWORD *)altBuffer + 14) = 0u;
  *((_OWORD *)altBuffer + 15) = 0u;
  altBufferScores = self->_altBufferScores;
  *(_OWORD *)altBufferScores = 0u;
  *((_OWORD *)altBufferScores + 1) = 0u;
  *((_OWORD *)altBufferScores + 2) = 0u;
  *((_OWORD *)altBufferScores + 3) = 0u;
  *((_OWORD *)altBufferScores + 4) = 0u;
  *((_OWORD *)altBufferScores + 5) = 0u;
  *((_OWORD *)altBufferScores + 6) = 0u;
  *((_OWORD *)altBufferScores + 7) = 0u;
  *((_OWORD *)altBufferScores + 8) = 0u;
  *((_OWORD *)altBufferScores + 9) = 0u;
  *((_OWORD *)altBufferScores + 10) = 0u;
  *((_OWORD *)altBufferScores + 11) = 0u;
  *((_OWORD *)altBufferScores + 12) = 0u;
  *((_OWORD *)altBufferScores + 13) = 0u;
  *((_OWORD *)altBufferScores + 14) = 0u;
  *((_OWORD *)altBufferScores + 15) = 0u;
  [(NSMutableArray *)self->_addedModifications removeAllObjects];
  [(NSMutableArray *)self->_removedModifications removeAllObjects];
  [(NSMutableArray *)self->_removedModifications addObjectsFromArray:self->_modifications];
  [(NSMutableArray *)self->_modifications removeAllObjects];
  [(NSMutableArray *)self->_prefixes removeAllObjects];

  self->_guesses = 0;
  self->_completions = 0;

  self->_corrections = 0;
  [(NSMutableArray *)self->_geometryDataArray removeAllObjects];
  self->_previouslyAnalyzedLength = 0;
  self->_abbreviatedSyllableCount = 0;
  self->_unint64_t endIndex = 0;
  self->_unint64_t startIndex = 0;
  self->_nextIndexes[0] = 0;
  self->_nextIndexes[1] = 0;
  *(_OWORD *)self->_lastIndexes = 0u;
  *(_OWORD *)&self->_lastIndexes[2] = 0u;
  self->_unint64_t startingPoint = 0;
  self->_unint64_t lengthBeforeApostrophes = 0;
  self->_unint64_t length = 0;
  self->_lastSyllableIsPartial = 0;
}

- (id)currentModifications
{
  return modificationArrayFilteredByMaskAndLength(self->_modifications, self->super._modificationMask, 0);
}

- (id)addedModifications
{
  return modificationArrayFilteredByMaskAndLength(self->_addedModifications, self->super._modificationMask, self->_length);
}

- (id)removedModifications
{
  return modificationArrayFilteredByMaskAndLength(self->_removedModifications, self->super._modificationMask, self->_length);
}

- (id)prefixes
{
  return self->_prefixes;
}

- (id)guesses
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!self->_guesses)
  {
    id v3 = (id)[[NSString alloc] initWithBytes:self->_buffer length:self->_length encoding:12];
    unint64_t v4 = objc_msgSend((id)_sharedChecker, "spellServer:suggestGuessesForWordRange:inString:language:options:", 0, 0, objc_msgSend(v3, "length"), v3, @"en_CN", 0);
    unint64_t length = self->_length;
    self->_guesses = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          unint64_t v10 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, length, *(void *)(*((void *)&v12 + 1) + 8 * i), 5, 0, length, 1.0);
          [(NSMutableArray *)self->_guesses addObject:v10];
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return self->_guesses;
}

- (id)completions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!self->_completions)
  {
    id v3 = (id)[[NSString alloc] initWithBytes:self->_buffer length:self->_length encoding:12];
    unint64_t v4 = objc_msgSend((id)_sharedChecker, "languageModelCompletionsForPartialWord:languageObject:sender:appIdentifier:", v3, +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", @"en_CN"), 0, 0);
    unint64_t length = self->_length;
    self->_completions = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          unint64_t v10 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, length, *(void *)(*((void *)&v12 + 1) + 8 * i), 5, 0, length, 1.0);
          [(NSMutableArray *)self->_completions addObject:v10];
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return self->_completions;
}

- (id)correction
{
  corrections = self->_corrections;
  if (!corrections)
  {
    id v4 = (id)[[NSString alloc] initWithBytes:self->_buffer length:self->_length encoding:12];
    uint64_t v12 = 0;
    uint64_t v5 = [(id)_sharedChecker spellServer:0 findMisspelledWordInString:v4 language:@"en_CN" wordCount:0 countOnly:0 correction:&v12];
    uint64_t v7 = v6;
    unint64_t length = self->_length;
    self->_corrections = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    if (v12 && !v5 && v7 == [v4 length])
    {
      unint64_t v9 = [PRPinyinModification alloc];
      unint64_t v10 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:](v9, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, length, v12, 5, 0, length, 1.0);
      [(NSMutableArray *)self->_corrections addObject:v10];
    }
    corrections = self->_corrections;
  }
  return (id)[(NSMutableArray *)corrections firstObject];
}

@end